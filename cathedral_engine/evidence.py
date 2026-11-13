"""The persistent evidence ledger and the shared-Queue reader.

Ledger: ``research_archive/cathedral_arf_runner/evidence.jsonl``, one JSON object per line, append-only (a later
line with the same ``id`` and ``kind = "review"`` reviews an earlier one; corrections are new lines, never edits).
Each line pins its certificate by sha256, names its registry check, says where it was executed and what CI said.
``check_ledger`` flags a certificate whose file changed since it was recorded ("stale"), a missing file, an unknown
registry check, or a status class outside docs/CONTINUITY_PROTOCOL.md.

Queue: ``RESEARCH_LOG.md`` is the one shared Queue.  ``queue_items`` parses it so every agent can list the open
items of its lane and see which item the newest log entries point to, instead of re-deriving them.
"""
from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path

from .provenance import REPO, sha256_file

LEDGER = REPO / "research_archive" / "cathedral_arf_runner" / "evidence.jsonl"
LOG = REPO / "research_archive" / "cathedral_arf_runner" / "RESEARCH_LOG.md"
REGISTRY = REPO / "research_archive" / "cathedral_arf_runner" / "registry.toml"
STATUS_CLASSES = {"CLOSED / FROZEN", "CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING", "REOPENED",
                  "RETIRED / SUPERSEDED", "OPEN"}
RESULT_TYPES = {"THEOREM", "OBSTRUCTION", "VERIFIED-ARCHIVE", "REVIEW", "INCONCLUSIVE", "INFRASTRUCTURE"}
REQUIRED = ("id", "kind", "agent", "date", "result", "status", "statement", "certificate", "executed", "ci")


def load_ledger(path: Path = LEDGER) -> list[dict]:
    if not path.exists():
        return []
    out = []
    for n, line in enumerate(path.read_text().splitlines(), 1):
        line = line.strip()
        if not line:
            continue
        try:
            out.append(json.loads(line))
        except json.JSONDecodeError as exc:
            raise ValueError(f"{path.name}:{n}: {exc}") from exc
    return out


def registry_check_ids() -> set:
    try:
        import tomllib
    except ModuleNotFoundError:          # python < 3.11
        return set(re.findall(r'^id\s*=\s*"([^"]+)"', REGISTRY.read_text(), re.M))
    return {c["id"] for c in tomllib.loads(REGISTRY.read_text()).get("check", [])}


def check_ledger(path: Path = LEDGER) -> dict:
    entries = load_ledger(path)
    ids = registry_check_ids()
    problems, stale, ok = [], [], 0
    for e in entries:
        tag = f"{e.get('id')}/{e.get('kind')}"
        miss = [k for k in REQUIRED if k not in e]
        if miss:
            problems.append(f"{tag}: missing keys {miss}"); continue
        if e["status"] not in STATUS_CLASSES:
            problems.append(f"{tag}: status {e['status']!r} not a CONTINUITY_PROTOCOL class")
        if e["result"] not in RESULT_TYPES:
            problems.append(f"{tag}: result {e['result']!r} not a protocol result type")
        cert = e["certificate"]
        if cert:
            p = REPO / cert
            if not p.exists():
                problems.append(f"{tag}: certificate {cert} missing")
            elif e.get("certificate_sha256") and sha256_file(p) != e["certificate_sha256"]:
                stale.append(f"{tag}: {cert} changed since it was recorded")
        chk = e.get("check")
        if chk and chk not in ids:
            problems.append(f"{tag}: registry check {chk} not registered")
        ok += 1
    ci = ci_check_status()
    current = {f"{e.get('id')}/{e.get('kind')}": ci.get(e.get("check"), "not in fetched summary") for e in entries
               if e.get("check")} if ci else {}
    return {"entries": len(entries), "valid": ok, "problems": problems, "stale": stale, "ci_now": current}


def append_entry(entry: dict, path: Path = LEDGER) -> None:
    miss = [k for k in REQUIRED if k not in entry]
    if miss:
        raise ValueError(f"missing keys {miss}")
    if entry.get("certificate") and "certificate_sha256" not in entry:
        entry["certificate_sha256"] = sha256_file(REPO / entry["certificate"])
    with open(path, "a") as fh:
        fh.write(json.dumps(entry, ensure_ascii=False, sort_keys=True) + "\n")


def latest(id_: str, path: Path = LEDGER) -> list[dict]:
    return [e for e in load_ledger(path) if e.get("id") == id_]


# ----------------------------------------------------------------------------------------------- Queue
_ITEM = re.compile(r"^- \[( |x)\] (Q\d+[A-Za-z0-9 ]*?)\s*\[(\w+)\]\s*(?:\((\w+(?:/\w+)?)\))?\s*(.*)$")


def queue_items(path: Path = LOG) -> list[dict]:
    text = path.read_text()
    queue = text.split("## Log", 1)[0]
    out = []
    for line in queue.splitlines():
        m = _ITEM.match(line.strip())
        if m:
            done, qid, lane, gate, rest = m.groups()
            out.append({"id": qid.strip(), "done": done == "x", "lane": lane, "gate": gate, "text": rest[:240]})
    return out


def active_problem(path: Path = LOG) -> str:
    text = path.read_text()
    m = re.search(r"^### ACTIVE PROBLEM.*$", text, re.M)
    return m.group(0) if m else "(none)"


def newest_log_entries(n: int = 3, path: Path = LOG) -> list[dict]:
    text = path.read_text().split("## Log", 1)[-1]
    blocks = re.split(r"^### ", text, flags=re.M)[1:n + 1]
    out = []
    for b in blocks:
        title = b.splitlines()[0]
        nxt = re.search(r"^- Next step:\s*(.*)$", b, re.M)
        out.append({"title": title, "next": nxt.group(1) if nxt else ""})
    return out


def ci_check_status() -> dict:
    """{check id: status word} from summary.md on the fetched state branch ({} if unavailable)."""
    for ref in ("origin/cathedral-research-state", "FETCH_HEAD"):
        try:
            out = subprocess.run(["git", "-C", str(REPO), "show", f"{ref}:summary.md"], capture_output=True,
                                 text=True, timeout=20)
        except (OSError, subprocess.SubprocessError):
            continue
        if out.returncode == 0 and out.stdout.startswith("# Cathedral orchestrator"):
            res = {}
            for m in re.finditer(r"^\| *[\w-]+ *\| *`([^`]+)` *\| *\w+ *\| *([^|]+?) *\|", out.stdout, re.M):
                res[m.group(1)] = m.group(2)
            return res
    return {}


def ci_verdict() -> str:
    """First line of summary.md on cathedral-research-state (needs that ref fetched), else 'unknown'."""
    for ref in ("origin/cathedral-research-state", "FETCH_HEAD"):
        try:
            out = subprocess.run(["git", "-C", str(REPO), "show", f"{ref}:summary.md"], capture_output=True,
                                 text=True, timeout=20)
            if out.returncode == 0 and out.stdout.startswith("# Cathedral orchestrator"):
                lines = out.stdout.splitlines()
                return lines[0] + " — " + (lines[2] if len(lines) > 2 else "")
        except (OSError, subprocess.SubprocessError):
            pass
    return "unknown (fetch cathedral-research-state: git fetch --depth 1 origin cathedral-research-state)"
