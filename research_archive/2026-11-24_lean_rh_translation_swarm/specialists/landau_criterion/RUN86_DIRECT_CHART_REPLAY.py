#!/usr/bin/env python3
"""RUN86: one authenticated B3 proof replay in an existing compact workspace.
Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
No Main import, no fresh bootstrap, no workflow edit, no RH closure claim.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

RUN85 uses a full Gauge even after selecting the direct half of com.
The graph must retain Gauge.com and Parseval, not claim their deletion.
An old supplier reached indirectly through another branch is evidence,
not an excuse to suppress that edge. Direct replacement is checked
separately from transitive absence.

RESUME HERE: integration/shared runner invoke this script with its
existing pinned compact workspace and compiler, --build only if these
modules are missing, then inspect the compiler and six graph receipts.
On failure repair only the failing stage. Do not restart the derivation.
HANDOFF TO: B3 / integration / audit.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
SOURCE = HERE / "COMPACT_RUN85_DIRECT_CHART_POSITIONS.lean"
SOURCE_BLOB = "05820cda95cec8af0e7eb905dd22bcac8d75fbc6"
ORIGINALS = {"New/RealPlace/LocalTheorem.lean": "671350f97491467f09b80eafa0df13685dd8ddc6",
             "New/RealPlace/WeightPlancherel.lean": "65619443ca5867bf45af038448a16dc1262103fd",
             "New/RealPlace/LevelGauge.lean": "05b4a710e4192b2f3d289a8e52161a6d12a2866e"}
ROOTS = ["Gauge." + n for n in ["lintegral_floorWeight_le", "lintegral_floorWeight_le_directChart_bridge",
         "lintegral_selfNorm_le", "lintegral_selfNorm_le_via_directChart",
         "lintegral_positions_le", "lintegral_positions_le_via_directChart"]]
CHART, FROM, COM, PARSEVAL = ["Gauge." + n for n in ["lintegral_floorWeight_le_directChart",
         "lintegral_selfNorm_le_from_floor", "com", "parseval_heisenbergMeasure_of_box"]]
CHART_SUPPLIER = "Gauge.directFloorChart_of_com"
HELPERS = [CHART, FROM, CHART_SUPPLIER, "Gauge.lintegral_selfNorm_le_from_floor_bridge",
           "RHRun84.pair_clear", "RHRun84.pair_det"]


def guards(mask, direct):
    # Bit i means reachable from ROOTS[i]. Missing names have mask zero.
    has = lambda name, bits: mask.get(name, 0) & bits == bits
    r = ROOTS
    return {
        "original_floor_reaches_original_self_and_positions": has(r[0], 0b010100),
        "original_self_reaches_original_positions": has(r[2], 0b010000),
        "chart_reaches_all_three_new_roots": has(CHART, 0b101010),
        "chart_supplier_reaches_all_three_new_roots": has(CHART_SUPPLIER, 0b101010),
        "new_floor_reaches_new_self_and_positions": has(r[1], 0b101000),
        "conditional_self_reaches_new_self_and_positions": has(FROM, 0b101000),
        "new_self_reaches_new_positions": has(r[3], 0b100000),
        "full_gauge_com_retained": has(COM, 0b101010),
        "parseval_retained": has(PARSEVAL, 0b101000),
        "new_self_direct_supplier": {r[1], FROM} <= direct.get(r[3], set()),
        "new_positions_direct_supplier": r[3] in direct.get(r[5], set()),
        "old_floor_not_direct_in_new_self": r[0] not in direct.get(r[3], set()),
        "old_self_not_direct_in_new_positions": r[2] not in direct.get(r[5], set()),
    }


def self_test():
    r = ROOTS
    m = {r[0]: 20, r[2]: 16, CHART: 42, CHART_SUPPLIER: 42, r[1]: 40,
         FROM: 40, r[3]: 32, COM: 42, PARSEVAL: 40}
    d = {r[3]: {r[1], FROM}, r[5]: {r[3]}}
    assert all(guards(m, d).values())
    # An indirect old reference is recorded, not misclassified as a direct edge.
    m[r[0]] |= 32
    assert all(guards(m, d).values())
    for key in (CHART, CHART_SUPPLIER, COM, PARSEVAL):
        bad = dict(m); bad[key] = 0
        assert not all(guards(bad, d).values())
    for root, old in ((r[3], r[0]), (r[5], r[2])):
        bad = {k: set(v) for k, v in d.items()}; bad[root].add(old)
        assert not all(guards(m, bad).values())
    print(json.dumps({"synthetic_guard_tests": 8, "native_Lean_execution": False}))


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path)
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--prepare-only", action="store_true")
    p.add_argument("--self-test", action="store_true")
    p.add_argument("--build", action="store_true")
    a = p.parse_args()
    if a.self_test:
        self_test(); return
    if a.out is None:
        p.error("--out required")
    sys.path.insert(0, str(SWARM / "integration"))
    import run_compact_b2_native_replay as native
    import audit_active_b2_graph as adapted
    import RUN26_COMPACT_GRAPH as graph
    out = a.out.resolve(); out.mkdir(parents=True, exist_ok=True)
    state = {"compact": native.PIN, "mathlib": native.MATHLIB, "source_blob": SOURCE_BLOB,
             "original_source_blobs": ORIGINALS, "roots": ROOTS, "human_assembly_verified": False,
             "full_RH_replay": False, "all_requested_checks_ok": False, "new_Lean_execution": False}
    def save(): native.dump(out / "run86_receipt.json", state)
    save()
    try:
        raw = SOURCE.read_bytes(); native.require(native.git_blob(raw) == SOURCE_BLOB, "RUN85 changed")
        code = re.sub(r"/-.*?-/", "", raw.decode(), flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        native.require(not re.search(r"\b(sorry|admit|axiom)\b|^\s*import\s+(?:Main|New\.Main)\b", code, re.M), "Forbidden proof source")
        native.require(all("#print axioms " + n in code for n in ROOTS + HELPERS), "Missing axiom probe")
        proof = out / "RHRun85.lean"; proof.write_bytes(raw)
        graph.ROOTS = ROOTS
        driver = graph.driver()
        native.require(driver.count("import Main\n") == 1, "Changed graph import")
        driver = adapted.adapt_exporter_435(driver.replace("import Main\n", "import RHRun85\n", 1))
        path = out / "RHRun85Graph.lean"; path.write_text(driver)
        state.update(source_authenticated=True, graph_source_blob=native.git_blob(driver.encode()))
        save()
        if a.prepare_only: return
        native.require(a.compact_root and a.lean_bin, "Supply existing pinned compact workspace and compiler")
        root = a.compact_root.resolve(); leanbin = a.lean_bin.resolve()
        native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong compact pin")
        native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB, "Wrong Mathlib pin")
        subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
        for rel, blob in ORIGINALS.items():
            native.require(native.git_blob((root / "src" / rel).read_bytes()) == blob, "Source mismatch: " + rel)
        env = os.environ.copy(); env["PATH"] = str(leanbin) + os.pathsep + env["PATH"]
        env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
        native.require("4.35.0" in subprocess.check_output([str(leanbin / "lean"), "--version"], text=True), "Wrong Lean version")
        if a.build:
            state["build"] = native.step(["lake", "build", "+New.RealPlace.LocalTheorem:olean", "+New.Filling.StandardLevel:olean"], root, env, out / "build.log", 2700)
            save(); native.require(state["build"]["returncode"] == 0, "Source build failed")
        state["new_Lean_execution"] = True; save()
        obj = out / "RHRun85.olean"
        receipt = native.step(["lake", "env", "lean", "--tstack=400000", "-Dpp.fullNames=true", "-R", out, "-o", obj, proof], root, env, out / "compile.log", 2700)
        receipt.update(native.audit(out / "compile.log", ROOTS + HELPERS))
        receipt["transport_guards"] = all(s in (out / "compile.log").read_text() for s in ("RUN85_SELF:", "RUN85_POSITIONS:"))
        state["compile"] = receipt; save()
        native.require(receipt["returncode"] == 0 and receipt["axiom_audit_ok"] and receipt["transport_guards"] and obj.is_file(), "RUN85 compile/type/axiom check failed")
        state["checked_objects"] = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in out.glob("RHRun85.olean*")}; save()
        setup = subprocess.check_output(["lake", "env", "python3", "-c", "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"], cwd=root, env=env, text=True, timeout=300)
        (out / "graph_environment.log").write_text(setup); env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"] = str(out) + os.pathsep + env["LEAN_PATH"]
        stream = out / "six_roots.jsonl"; env["CATHEDRAL_RH_GRAPH"] = str(stream)
        receipt = native.step([str(leanbin / "lean"), "--tstack=400000", "-j", "2", path], root, env, out / "graph.log", 1800)
        receipt.update(native.audit(out / "graph.log", ROOTS)); state["graph"] = receipt; save()
        native.require(receipt["returncode"] == 0 and receipt["axiom_audit_ok"], "Graph export/axiom failure")
        graph.audit_union(stream, out, out)
        name = lambda parts: ".".join(x[1] for x in parts) if all(x[0] == "s" for x in parts) else None
        watched = set(ROOTS + HELPERS + [COM, PARSEVAL, "Gauge.lintegral_mul_invWeight_le"])
        mask = {}
        for line in (out / "root_membership.jsonl").open():
            row = json.loads(line); n = name(row["id"])
            if n in watched: mask[n] = row["root_mask"]
        direct = {}
        for line in stream.open():
            row = json.loads(line)
            if row["record"] == "node" and (n := name(row["id"])) in ROOTS:
                direct[n] = {name(x) for x in row["value_constants"]}
        g = guards(mask, direct)
        state.update(reachability_guards=g, root_masks=mask,
                     indirect_old_supplier_masks={n: mask.get(n, 0) & 42 for n in ROOTS[::2]},
                     graph_summary=json.loads((out / "union_summary.json").read_text()))
        with stream.open("rb") as f: state["graph_sha256"] = hashlib.file_digest(f, "sha256").hexdigest()
        save(); native.require(all(g.values()), "Graph contradicts expected direct replacement or retained supplier")
        state["all_requested_checks_ok"] = True; save()
    except Exception as exc:
        state["failure"] = str(exc); save(); raise


if __name__ == "__main__": main()
