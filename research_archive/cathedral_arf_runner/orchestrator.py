#!/usr/bin/env python3
"""Cathedral research orchestrator: one entry point for every automated check.

  orchestrator.py stages                                 JSON list of stages (CI matrix)
  orchestrator.py run-stage STAGE --out DIR              run one stage's checks
  orchestrator.py sweep --state F --out DIR [--budget-minutes M]
                                                         resumable archive-wide execution sweep
  orchestrator.py aggregate --results DIR --state-dir DIR [--summary F]
                                                         merge into the durable checkpoint, decide verdict
  orchestrator.py local [--stage S] [--sweep-minutes M]  everything above, on this machine

Everything that runs is declared in registry.toml. Exit codes verify computations
only; the physical status is read from the [[gate]] research queue, which no
check can change (see the claim guard in aggregate()).
"""
from __future__ import annotations

import argparse
import datetime as dt
import fnmatch
import hashlib
import json
import os
import re
import shlex
import shutil
import signal
import subprocess
import sys
import tempfile
import time
import tomllib
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
REGISTRY = HERE / "registry.toml"
SCHEMA = 2
TAIL = 4000
BASE_ENV = {
    "OPENBLAS_NUM_THREADS": "1", "OMP_NUM_THREADS": "1", "MKL_NUM_THREADS": "1",
    "PYTHONHASHSEED": "0", "MPLBACKEND": "Agg", "PYTHONDONTWRITEBYTECODE": "1",
    "PYTHONUNBUFFERED": "1",
}
PACKAGES = ["numpy", "scipy", "sympy", "mpmath", "networkx", "pytest"]


# ------------------------------------------------------------------ helpers
def now() -> str:
    return dt.datetime.now(dt.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def load_registry() -> dict:
    reg = tomllib.loads(REGISTRY.read_text())
    ids = [c["id"] for c in reg["check"]]
    dup = {i for i in ids if ids.count(i) > 1}
    if dup:
        raise SystemExit(f"registry: duplicate check ids {sorted(dup)}")
    for c in reg["check"]:
        for key in ("id", "stage", "claim", "run"):
            if key not in c:
                raise SystemExit(f"registry: check {c.get('id')} lacks {key!r}")
        if c["claim"] not in {"regression", "independent", "native", "conditional", "synthetic", "derivation"}:
            raise SystemExit(f"registry: check {c['id']} has unknown claim {c['claim']!r}")
    return reg


def stages(reg: dict) -> list[str]:
    seen: list[str] = []
    for c in reg["check"]:
        if c["stage"] not in seen:
            seen.append(c["stage"])
    return seen


def sha256_file(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def atomic_write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(dir=path.parent, prefix=path.name + ".")
    with os.fdopen(fd, "w", encoding="utf-8") as f:
        f.write(text)
    os.replace(tmp, path)


def versions() -> dict:
    out = {"python": sys.version.split()[0]}
    for name in PACKAGES:
        try:
            out[name] = __import__(name).__version__
        except Exception:
            out[name] = None
    return out


def classify(rc: int | None, text: str, timed_out: bool) -> tuple[str, str]:
    if timed_out:
        return "timeout", ""
    if rc == 0:
        return "pass", ""
    mods = re.findall(r"ModuleNotFoundError: No module named '([^']+)'", text)
    if mods:
        return "missing_dependency", mods[-1].split(".")[0]
    m = re.findall(r"FileNotFoundError: .*?'([^']+)'", text)
    if m:
        path = m[-1].replace(str(REPO) + os.sep, "")
        return "missing_file", ("sandbox path " if path.startswith("/mnt/data") else "") + path[-200:]
    if re.search(r"\bAssertionError\b|^E\s+assert\b|\bFAILED\b", text, re.M):
        failed = re.findall(r"^FAILED (\S+)", text, re.M)
        if failed:
            return "assertion_failed", f"{len(failed)} failed, first: {failed[0]}"[:200]
        msg = [m.strip() for m in re.findall(r"AssertionError:? ?(.*)$", text, re.M) if m.strip()]
        return "assertion_failed", (msg[-1] if msg else "")[:200]
    if "MemoryError" in text:
        return "memory", ""
    last = [ln for ln in text.strip().splitlines() if ln.strip()][-1:] or [""]
    return "error", last[0][-200:]


def execute(argv: list[str], cwd: Path, timeout: float, log: Path | None) -> dict:
    env = {**os.environ, **BASE_ENV}
    env["PYTHONPATH"] = os.pathsep.join(filter(None, [str(REPO), env.get("PYTHONPATH", "")]))
    t0 = time.monotonic()
    timed_out = False
    try:
        p = subprocess.Popen(argv, cwd=cwd, env=env, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT, start_new_session=True)
    except OSError as exc:
        return {"status": "error", "detail": repr(exc), "returncode": None, "wall_s": 0.0, "tail": repr(exc)}
    try:
        raw, _ = p.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        timed_out = True
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        raw, _ = p.communicate()
    wall = time.monotonic() - t0
    text = raw.decode("utf-8", "replace")
    if log:
        log.parent.mkdir(parents=True, exist_ok=True)
        log.write_text(text)
    status, detail = classify(p.returncode, text, timed_out)
    return {"status": status, "detail": detail, "returncode": p.returncode, "wall_s": round(wall, 2),
            "tail": text[-TAIL:]}


def argv_for(command: str, out: Path) -> list[str]:
    argv = [a.replace("{out}", str(out)) for a in shlex.split(command)]
    if argv and argv[0] == "python":
        argv[0] = sys.executable
    return argv


# ------------------------------------------------------------------ run-stage
def run_stage(stage: str, out: Path) -> int:
    reg = load_registry()
    checks = [c for c in reg["check"] if c["stage"] == stage]
    if not checks:
        raise SystemExit(f"no checks in stage {stage!r}; stages are {stages(reg)}")
    out = out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    results = {}
    gh = "GITHUB_ACTIONS" in os.environ
    for c in checks:
        if gh:
            print(f"::group::{c['id']}  [{c['claim']}]", flush=True)
        else:
            print(f"--- {c['id']}  [{c['claim']}]", flush=True)
        r = execute(argv_for(c["run"], out), REPO / c.get("cwd", "."), c.get("timeout", 300),
                    out / "logs" / f"{c['id']}.log")
        missing = []
        for o in c.get("outputs", []):
            p = Path(o.replace("{out}", str(out)))
            p = p if p.is_absolute() else REPO / p
            if not p.is_file():
                missing.append(o)
            elif c.get("collect"):
                dest = out / "outputs" / p.name
                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(p, dest)
        if r["status"] == "pass" and missing:
            r["status"], r["detail"] = "missing_output", ", ".join(missing)
        r.update(claim=c["claim"], gating=bool(c.get("gating", True)), stage=stage, utc=now())
        results[c["id"]] = r
        print(r["tail"][-1500:])
        print(f"==> {c['id']}: {r['status'].upper()} ({r['wall_s']}s){'  ' + r['detail'] if r['detail'] else ''}",
              flush=True)
        if gh:
            print("::endgroup::", flush=True)
    payload = {"kind": "stage", "stage": stage, "utc": now(), "versions": versions(), "results": results}
    atomic_write(out / "stage-result.json", json.dumps(payload, indent=2))
    failed = [k for k, v in results.items() if v["gating"] and v["status"] != "pass"]
    print(f"\nstage {stage}: {len(results) - len(failed)}/{len(results)} gating checks pass"
          + (f"; FAILED {failed}" if failed else ""))
    return 1 if failed else 0


# ------------------------------------------------------------------ sweep
def tracked_files() -> list[str]:
    try:
        out = subprocess.run(["git", "ls-files", "-z"], cwd=REPO, capture_output=True, check=True).stdout
        return sorted(p for p in out.decode().split("\0") if p)
    except (OSError, subprocess.CalledProcessError):
        return sorted(str(p.relative_to(REPO)) for p in REPO.rglob("*") if p.is_file() and ".git" not in p.parts)


def sweep_targets(reg: dict) -> list[str]:
    cfg = reg["sweep"]
    keep = []
    for p in tracked_files():
        if not p.endswith(".py"):
            continue
        if not any(fnmatch.fnmatch(p, pat) for pat in cfg["include"]):
            continue
        if any(fnmatch.fnmatch(p, pat) for pat in cfg.get("exclude", [])):
            continue
        keep.append(p)
    return keep


def sweep(state_file: Path | None, out: Path, budget_minutes: float | None) -> int:
    reg = load_registry()
    cfg = reg["sweep"]
    budget = 60 * (budget_minutes if budget_minutes is not None else cfg["budget_minutes"])
    per = cfg["per_script_timeout"]
    prev = {}
    if state_file and state_file.is_file():
        prev = json.loads(state_file.read_text()).get("sweep", {}).get("scripts", {})
    targets = sweep_targets(reg)
    sha = {p: sha256_file(REPO / p) for p in targets}

    def priority(p):
        rec = prev.get(p)
        if rec is None:
            return (0, "", p)
        if rec.get("sha256") != sha[p]:
            return (1, "", p)
        return (2, rec.get("utc", ""), p)
    queue = sorted(targets, key=priority)
    out = out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    results = {}
    deadline = time.monotonic() + budget
    script_args = cfg.get("args", {})
    for p in queue:
        if results and time.monotonic() + per > deadline:   # each script gets its full timeout
            break
        path = REPO / p
        plain = [sys.executable, path.name] + [a.replace("{out}", str(out)) for a in script_args.get(p, [])]
        if path.name.startswith("test_"):
            r = execute([sys.executable, "-m", "pytest", "-q", "-o", "addopts=", "-p", "no:cacheprovider",
                         path.name], path.parent, per, None)
            if r["returncode"] == 5:          # pytest collected nothing: it is a plain script
                r = execute(plain, path.parent, per, None)
        else:
            r = execute(plain, path.parent, per, None)
        r.update(sha256=sha[p], utc=now())
        if r["status"] == "pass":
            r["tail"] = r["tail"][-300:]
        results[p] = r
        print(f"{r['status']:18s} {r['wall_s']:7.1f}s  {p}{'  ' + r['detail'] if r['detail'] else ''}", flush=True)
    payload = {"kind": "sweep", "utc": now(), "versions": versions(), "targets": targets,
               "ran": len(results), "remaining": len(queue) - len(results), "results": results}
    atomic_write(out / "sweep.json", json.dumps(payload, indent=2))
    counts = {}
    for r in results.values():
        counts[r["status"]] = counts.get(r["status"], 0) + 1
    print(f"\nsweep: executed {len(results)}/{len(targets)} this run; {counts}")
    return 0


# ------------------------------------------------------------------ aggregate
def run_meta() -> dict:
    e = os.environ
    server, repo, run_id = e.get("GITHUB_SERVER_URL", ""), e.get("GITHUB_REPOSITORY", ""), e.get("GITHUB_RUN_ID", "")
    return {
        "utc": now(), "run_id": run_id or "local", "attempt": e.get("GITHUB_RUN_ATTEMPT", ""),
        "event": e.get("GITHUB_EVENT_NAME", "local"),
        "branch": e.get("GITHUB_HEAD_REF") or e.get("GITHUB_REF_NAME", "local"),
        "sha": e.get("ORCH_HEAD_SHA") or e.get("GITHUB_SHA", "local"),
        "url": f"{server}/{repo}/actions/runs/{run_id}" if run_id else "",
    }


def new_state() -> dict:
    return {"schema": SCHEMA, "runs": 0, "created_utc": now(), "checks": {}, "sweep": {"scripts": {}}, "gates": {}}


def aggregate(results_dir: Path, state_dir: Path, summary: Path | None) -> int:
    reg = load_registry()
    meta = run_meta()
    state_file = state_dir / "state.json"
    state = json.loads(state_file.read_text()) if state_file.is_file() else new_state()
    if state.get("schema") != SCHEMA:
        state = {**new_state(), "previous_schema_runs": state.get("runs", 0)}
    found, versions_seen, sweep_payload = {}, {}, None
    for f in sorted(results_dir.rglob("stage-result.json")):
        d = json.loads(f.read_text())
        found.update(d["results"])
        versions_seen = d.get("versions", versions_seen)
    for f in sorted(results_dir.rglob("sweep.json")):
        sweep_payload = json.loads(f.read_text())

    # ---- checks
    transitions, rows = [], []
    for c in reg["check"]:
        cid = c["id"]
        r = found.get(cid) or {"status": "no_result", "detail": "stage job produced no result", "wall_s": None,
                               "claim": c["claim"], "gating": bool(c.get("gating", True)), "stage": c["stage"]}
        prev = state["checks"].get(cid, {})
        ok = r["status"] == "pass"
        rec = {
            "stage": c["stage"], "claim": c["claim"], "gating": bool(c.get("gating", True)),
            "status": r["status"], "detail": r.get("detail", ""), "wall_s": r.get("wall_s"), "utc": meta["utc"],
            "run_id": meta["run_id"], "sha": meta["sha"],
            "consecutive_pass": prev.get("consecutive_pass", 0) + 1 if ok else 0,
            "last_pass_utc": meta["utc"] if ok else prev.get("last_pass_utc"),
            "first_seen_utc": prev.get("first_seen_utc", meta["utc"]),
            "tail": "" if ok else r.get("tail", "")[-1500:],
        }
        if prev and prev.get("status") != rec["status"]:
            transitions.append((cid, prev.get("status"), rec["status"]))
        state["checks"][cid] = rec
        rows.append((c, rec))
    for stale in set(state["checks"]) - {c["id"] for c in reg["check"]}:
        del state["checks"][stale]

    # ---- sweep
    scripts = state["sweep"].setdefault("scripts", {})
    regressions, recovered, ran = [], [], {}
    if sweep_payload:
        ran = sweep_payload["results"]
        for p, r in ran.items():
            old = scripts.get(p)
            if old and old.get("sha256") == r["sha256"]:
                if old["status"] == "pass" and r["status"] != "pass":
                    regressions.append(p)
                if old["status"] != "pass" and r["status"] == "pass":
                    recovered.append(p)
            scripts[p] = {k: r[k] for k in ("status", "detail", "wall_s", "sha256", "utc")}
            if r["status"] != "pass":
                scripts[p]["tail"] = r.get("tail", "")[-800:]
        for gone in set(scripts) - set(sweep_payload["targets"]):
            del scripts[gone]
        state["sweep"]["targets"] = len(sweep_payload["targets"])
        state["sweep"]["last_run_utc"] = meta["utc"]

    # ---- research queue + claim guard
    violations = []
    for g in reg.get("gate", []):
        if g["status"] not in {"open", "closed"}:
            violations.append(f"gate {g['id']}: status must be 'open' or 'closed', got {g['status']!r}")
        if g["status"] == "closed":
            pc = g.get("proof_check")
            chk = next((c for c in reg["check"] if c["id"] == pc), None)
            if not pc or chk is None:
                violations.append(f"gate {g['id']} is marked closed without a proof_check")
            elif chk["claim"] != "derivation":
                violations.append(f"gate {g['id']}: proof_check {pc} has claim {chk['claim']!r}, not 'derivation'")
            elif state["checks"][pc]["status"] != "pass":
                violations.append(f"gate {g['id']}: proof_check {pc} did not pass in this run")
        for ev in g.get("evidence", []):
            if ev not in state["checks"]:
                violations.append(f"gate {g['id']}: evidence {ev} is not a registered check")
        state["gates"][g["id"]] = {"title": g["title"], "status": g["status"]}

    gating_fail = [c["id"] for c, rec in rows if rec["gating"] and rec["status"] != "pass"]
    state["runs"] = state.get("runs", 0) + 1
    state["last_run"] = {**meta, "verdict": "pass" if not gating_fail and not violations else "fail",
                         "gating_failures": gating_fail, "claim_guard_violations": violations,
                         "versions": versions_seen}

    # ---- write checkpoint
    state_dir.mkdir(parents=True, exist_ok=True)
    atomic_write(state_file, json.dumps(state, indent=1, sort_keys=True) + "\n")
    counts = {}
    for r in ran.values():
        counts[r["status"]] = counts.get(r["status"], 0) + 1
    event = {**meta, "verdict": state["last_run"]["verdict"], "gating_failures": gating_fail,
             "violations": violations, "checks": {c["id"]: rec["status"] for c, rec in rows},
             "sweep": {"ran": len(ran), "counts": counts, "regressions": regressions, "recovered": recovered},
             "transitions": transitions}
    with (state_dir / "history.jsonl").open("a", encoding="utf-8") as f:
        f.write(json.dumps(event, sort_keys=True) + "\n")
    md = render_summary(reg, state, rows, meta, transitions, regressions, recovered, ran, gating_fail, violations)
    atomic_write(state_dir / "summary.md", md)
    atomic_write(state_dir / "sweep.md", render_sweep(state))
    atomic_write(state_dir / "README.md", STATE_README)
    if summary:
        with summary.open("a", encoding="utf-8") as f:
            f.write(md)
    print(md)
    return 1 if gating_fail or violations else 0


ICON = {"pass": "✅", "timeout": "⏱️", "no_result": "⚠️"}


def render_summary(reg, state, rows, meta, transitions, regressions, recovered, ran, gating_fail, violations) -> str:
    L = []
    run_ref = f"[run {meta['run_id']}]({meta['url']})" if meta["url"] else f"run {meta['run_id']}"
    verdict = "✅ PASS" if not gating_fail and not violations else "❌ FAIL"
    L += [f"# Cathedral orchestrator — {verdict}", "",
          f"{meta['utc']} · {run_ref} · `{meta['sha'][:7]}` · {meta['event']} on `{meta['branch']}` · "
          f"checkpoint #{state['runs']}", ""]
    if gating_fail:
        L += ["**Gating failures:** " + ", ".join(f"`{x}`" for x in gating_fail), ""]
    if violations:
        L += ["**Claim guard violations:**"] + [f"- {v}" for v in violations] + [""]
    L += ["## Physical status", "",
          "**Four ARFs: " + ("DERIVED" if all(g["status"] == "closed" for g in reg.get("gate", [])) else "NOT DERIVED")
          + ".** A passing check verifies a computation; it never closes a gate.", "",
          "| Gate | | Status | Missing |", "|---|---|---|---|"]
    for g in reg.get("gate", []):
        L.append(f"| {g['id']} | {g['title']} | {g['status']} | {g.get('missing', '')} |")
    L += ["", "## Checks", "", "| Stage | Check | Claim | Status | Passing runs | Wall |", "|---|---|---|---|---|---|"]
    for c, rec in rows:
        st = f"{ICON.get(rec['status'], '❌')} {rec['status']}" + (f" — {rec['detail']}" if rec["detail"] else "")
        wall = f"{rec['wall_s']}s" if rec["wall_s"] is not None else ""
        L.append(f"| {c['stage']} | `{c['id']}` | {c['claim']} | {st} | {rec['consecutive_pass']} | {wall} |")
    if transitions:
        L += ["", "**Changed since last run:** " + "; ".join(f"`{a}` {b} → {c}" for a, b, c in transitions)]
    sc = state["sweep"].get("scripts", {})
    tot = state["sweep"].get("targets", 0)
    allc = {}
    for r in sc.values():
        allc[r["status"]] = allc.get(r["status"], 0) + 1
    runc = {}
    for r in ran.values():
        runc[r["status"]] = runc.get(r["status"], 0) + 1
    L += ["", "## Archive sweep", "",
          f"Executed at least once: **{len(sc)}/{tot}** research scripts. Latest status: "
          + (", ".join(f"{k} {v}" for k, v in sorted(allc.items())) or "none yet") + ".",
          f"This run: {len(ran)} executed" + (" (" + ", ".join(f"{k} {v}" for k, v in sorted(runc.items())) + ")" if runc else "") + ".",
          "Regressions (passed before, failing now, same source): " + (", ".join(f"`{p}`" for p in regressions) or "none") + ".",
          "Recovered: " + (", ".join(f"`{p}`" for p in recovered) or "none") + ".",
          "", "Full per-script table: `sweep.md` on this branch.", ""]
    v = state["last_run"].get("versions") or {}
    if v:
        L += ["Environment: " + ", ".join(f"{k} {val}" for k, val in v.items() if val), ""]
    return "\n".join(L) + "\n"


def render_sweep(state) -> str:
    sc = state["sweep"].get("scripts", {})
    L = ["# Archive sweep — latest status per script", "",
         f"{len(sc)}/{state['sweep'].get('targets', 0)} scripts executed at least once. "
         "Sorted: failing first, then by path.", "", "| Status | Script | Detail | Wall | Last run |", "|---|---|---|---|---|"]
    for p, r in sorted(sc.items(), key=lambda kv: (kv[1]["status"] == "pass", kv[0])):
        L.append(f"| {r['status']} | `{p}` | {r.get('detail', '')} | {r.get('wall_s', '')}s | {r.get('utc', '')} |")
    return "\n".join(L) + "\n"


STATE_README = """# cathedral-research-state

Durable checkpoint written by `.github/workflows/cathedral-orchestrator.yml`
(source: `research_archive/cathedral_arf_runner/` on the main branch).

- `summary.md` — latest verdict, physical status (gates A–F), every check, sweep coverage
- `sweep.md` — latest status of every archived research script
- `state.json` — machine-readable checkpoint the next run resumes from
- `history.jsonl` — one line per run, append-only

Only the orchestrator's aggregate job writes this branch. Do not merge it into the main branch.
"""


# ------------------------------------------------------------------ local
def local(stage: str | None, sweep_minutes: float | None, workdir: Path) -> int:
    reg = load_registry()
    results = workdir / "results"
    if results.exists():
        shutil.rmtree(results)
    rc = 0
    for s in ([stage] if stage else stages(reg)):
        rc |= run_stage(s, results / s)
    if sweep_minutes:
        sweep(workdir / "state" / "state.json", results / "sweep", sweep_minutes)
    rc |= aggregate(results, workdir / "state", None)
    return rc


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("stages")
    p = sub.add_parser("run-stage"); p.add_argument("stage"); p.add_argument("--out", type=Path, required=True)
    p = sub.add_parser("sweep"); p.add_argument("--state", type=Path); p.add_argument("--out", type=Path, required=True)
    p.add_argument("--budget-minutes", type=float)
    p = sub.add_parser("aggregate"); p.add_argument("--results", type=Path, required=True)
    p.add_argument("--state-dir", type=Path, required=True); p.add_argument("--summary", type=Path)
    p = sub.add_parser("local"); p.add_argument("--stage"); p.add_argument("--sweep-minutes", type=float)
    p.add_argument("--workdir", type=Path, default=Path(".orchestrator-local"))
    a = ap.parse_args()
    if a.cmd == "stages":
        print(json.dumps(stages(load_registry())))
        return 0
    if a.cmd == "run-stage":
        return run_stage(a.stage, a.out)
    if a.cmd == "sweep":
        return sweep(a.state, a.out, a.budget_minutes)
    if a.cmd == "aggregate":
        return aggregate(a.results, a.state_dir, a.summary)
    return local(a.stage, a.sweep_minutes, a.workdir)


if __name__ == "__main__":
    sys.exit(main())
