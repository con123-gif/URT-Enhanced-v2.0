#!/usr/bin/env python3
"""RUN92 — accept the newly published original A cache, isolate leaf replay
and audit the exact local dependency reduction before any LongForms build.

27 November 2026. SOURCE-MATCHED / PREPARED. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7 /
40aaf0afcc897a74d688bd6e9bae708428ffdabd / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, swarm, handoff and expansion. Peer RUN65 b1cc51f67ef57bdf031abc3fd07b97122bdf7726
addresses the actual A1 import parser failure, not A2. Acceleration RUN87
8025afa5d8b70280627ca6c6a4fe1e1bdabc88ee supplies cache intake. Reuse both.
Peer B2 RUN93 449b1b349ade0f82466a023fd4d91ea69b8e24c5 is separate.

NEW ACTUAL EVIDENCE: shared A1 retry run 46075703055 on 27 Nov, status
9838f1d1c9d36c9906c2736d5d8d4f08fe98042f ERROR. Original LocalStatement
build exit 0, 2614.65 seconds. A1 replacement fails at line 59:0 with
invalid import command, log 98ec276eb450c4d9c835f40673854fb5735e0248.
Neither A1 nor A2 replacement has passed. However original pre-overlay
cache NOW exists: manifest 9d4dcc5b17a2168da4b3a2b25144241c1b80b74d,
archive 314621636 bytes, SHA256 b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03,
artifact ID 15236761794 (listed, not downloaded or byte-authenticated here).
Earlier A1/A2 status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678 stays ERROR.

Actual source verification here: fetched RUN81/82/89/90/91 (blob pins
below). Extracted both actual helper namespaces, applied both unique
RUN90 and RUN91 body replacements together, reversed them exactly,
preserved the complete 11-theorem roster and rejected all four duplicate
or deleted old-body controls, using JS against real connector source.
Validated new cache manifest flags and byte-count metadata. No archive
extraction, native Lean or Python driver execution here: lean/lake absent.
No native PASS, no URT speed claim. Do not infer proof validity from cache.

The prior RUN91 gate generates the LongForms caller certificate before
attempting its local leaf. Separate those scopes: produce the same
patched leaf from RUN89 alone, compile one checked object, then reuse
it for the three-root strict graph and actual bounded scan/prune.
The old exact statement retains its original rank premise; candidate
stronger chosenLevel_free drops only that premise, not rationality,
same D, finiteness, local integral lift, residue inequality or the
same rational point at the chosen place. Original graph old target
-> classAut_eq_bot; candidate adapter -> stronger free -> prime kill
-> same-point local reduction -> matrix geometric sum. Inspect actual
constructor-inclusive reachability; any retained old path is recorded,
not erased. Nothing claimed removed from other callers. All A/B/C/D/E/V
and the original/reduced evidence remain open. No Main import or build.

RESUME HERE: acceleration/integration use RUN87 to authenticate the
actual artifact, restore it ONCE into the original pinned compact
workspace for RUN65 and this driver. Save RUN87's JSON intake as intake.json.
Then execute:
  python3 RUN92_A2_CACHE_LEAF_GRAPH.py --compact-root /path/grh/grh-compact \
    --intake /path/intake.json --out /fresh/external/Theta92
Inspect first actual failure. Only after accepted leaf+graph+prune
use its identical helper bodies for RUN91 caller transport. No new
cold build or protected workflow edit. HANDOFF kernel/integration/audit.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
KERNEL = SWARM / "specialists/kernel_extractor"
sys.path.insert(0, str(KERNEL))
sys.path.insert(0, str(SWARM / "integration"))
import RUN91_A2_GL_COMPOSITION_REPLAY as patcher
import RUN26_COMPACT_GRAPH as graph
import run_compact_b2_native_replay as native
from audit_active_b2_graph import adapt_exporter_435

INPUTS = {
    "RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.lean": "f34c82d30b5d3cfa3582b14f9ba50bf337ae4f40",
    "RUN82_COMPACT_CHOSEN_LEVEL_LOCAL_BRIDGE.lean": "f8f7fbd14a1d8372e71e46dc5438ec886ecd9d25",
    "RUN89_A2_LEAF_ONLY_REPLAY.py": "f99ffbb7a9d002c647fe77a272e2efafee307d91",
    "RUN90_A2_RESIDUE_CARD_REUSE.py": "8e1913b0c9a84380d58ad2677add22e187a2c9b3",
    "RUN91_A2_GL_COMPOSITION_REPLAY.py": "5474d327d89713344efa34c765993d5037884266",
}
ROOTS = ["Data.classAut_eq_bot_of_le_chosenLevel",
         "ThetaRun82.chosenLevel_free_original",
         "ThetaRun82.chosenLevel_free"]
OLD_NEAT = "classAut_eq_bot"
GEOM = "ThetaRun81.matrix_torsion_eq_one"
CACHE_DIGEST = "b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03"
OBJECTS = [".lake/build/lib/lean/New/Curve/ConjugatesOfJets.olean",
           ".lake/build/lib/lean/New/Columns/LocalStatement.olean"]

def require(ok, why):
    if not ok:
        raise RuntimeError(why)

def digest(path):
    with path.open("rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()

def check_intake(root, intake):
    require(intake.get("archive_sha256") == CACHE_DIGEST
            and intake.get("cache_intake_verified") is True
            and intake.get("native_verified") is False
            and intake.get("full_RH_replay") is False, "wrong RUN87 intake")
    hashes = intake.get("required_object_sha256", {})
    require(set(hashes) == set(OBJECTS), "wrong object roster")
    for rel in OBJECTS:
        require(digest(root / rel) == hashes[rel], "restored object mismatch: " + rel)
    for rel in ("New/Data/ChosenPlaceLevels.olean", "Lib/Adelic/Transference/MassBasic.olean"):
        require((root / ".lake/build/lib/lean" / rel).is_file(), "cache lacks leaf import " + rel)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path, required=True)
    p.add_argument("--intake", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--seconds", type=int, default=1800)
    a = p.parse_args()
    root, out = a.compact_root.resolve(), a.out.resolve()
    require(root.name == "grh-compact" and root.parent not in out.parents
            and out != root.parent and not out.exists(), "fresh external output required")
    out.mkdir(parents=True)
    state = {"scope": "A2 chosen-level freeness only", "roots": ROOTS,
             "native_verified": False, "graph_audited": False,
             "local_old_neatness_absent": False, "prune_executed": False,
             "caller_replacements_checked": False, "full_RH_replay": False}
    def save():
        native.dump(out / "theta92_result.json", state)
    save()
    try:
        for f, h in INPUTS.items():
            require(native.git_blob((HERE / f).read_bytes()) == h, "changed input " + f)
        require(native.git_blob((KERNEL / "RUN26_COMPACT_GRAPH.py").read_bytes()) ==
                "775182e659d05a0b179813cc3063725df59e17bb", "changed graph driver")
        require(native.git_blob((SWARM / "integration/audit_active_b2_graph.py").read_bytes()) ==
                "ccb8c306cdffc72464b0f01e70577b1811b6ffe0", "changed 4.35 adapter")
        require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN,
                "wrong compact pin")
        require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib")
                == native.MATHLIB, "wrong Mathlib pin")
        subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"],
                       cwd=root, check=True)
        check_intake(root, json.loads(a.intake.read_text()))
        state["restored_cache_intake_checked"] = True
        save()
        require(shutil.which("lake"), "native lake unavailable")
        env = os.environ.copy()
        env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
        require("4.35.0" in subprocess.check_output(["lake", "env", "lean", "--version"],
                cwd=root, env=env, text=True, timeout=60), "wrong Lean version")
        # Only the actual leaf, not RUN88 or LongForms, is generated here.
        subprocess.run([sys.executable, HERE / "RUN89_A2_LEAF_ONLY_REPLAY.py",
                        root.parent, out / "original-leaf"], check=True)
        raw = (out / "original-leaf/ThetaFreenessLeafRun89.lean").read_text()
        candidate = patcher.patch(raw)
        require(not re.search(r"^import (?:Main|New\.Main|New\.Endgame\.)", candidate, re.M),
                "forbidden root import")
        path = out / "ThetaLeafRun92.lean"
        path.write_text(candidate)
        state["leaf_source_blob"] = native.git_blob(path.read_bytes())
        obj = out / "ThetaLeafRun92.olean"
        state["leaf_compile"] = native.step(["lake", "env", "lean", "--tstack=400000",
                "-R", out, "-o", obj, path], root, env, out / "leaf.log", a.seconds)
        log = (out / "leaf.log").read_text(errors="replace")
        state["native_verified"] = (state["leaf_compile"]["returncode"] == 0
                and log.count("THETA89_LEAF_CHECKED") == 1 and obj.is_file()
                and not re.search(r"\berror(?:\([^)]*\))?:|sorryAx", log))
        state["leaf_axioms"] = native.audit(out / "leaf.log", ROOTS[:2])
        state["native_verified"] = state["native_verified"] and state["leaf_axioms"]["axiom_audit_ok"]
        save()
        require(state["native_verified"], "leaf failed: inspect leaf.log")
        state["object_sha256"] = digest(obj)
        setup = subprocess.check_output(["lake", "env", "python3", "-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root, env=env, text=True, timeout=300)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"] = str(out) + os.pathsep + env["LEAN_PATH"]
        env["CATHEDRAL_RH_GRAPH"] = str(out / "theta92_union.jsonl")
        graph.ROOTS = ROOTS
        source = graph.driver()
        require(source.count("import Main\n") == 1, "changed exporter import")
        source = adapt_exporter_435(source.replace("import Main\n",
                         "import ThetaLeafRun92\nset_option pp.fullNames true\n", 1))
        gfile = out / "Theta92Graph.lean"
        gfile.write_text(source)
        state["graph_compile"] = native.step(["lean", "--tstack=400000", "-j", "2", gfile],
                    root, env, out / "graph.log", a.seconds)
        save()
        require(state["graph_compile"]["returncode"] == 0
                and native.audit(out / "graph.log", ROOTS)["axiom_audit_ok"], "graph compiler/axioms failed")
        graph.audit_union(out / "theta92_union.jsonl", out, out)
        watched = set(ROOTS + [OLD_NEAT, GEOM])
        masks = {}
        with (out / "root_membership.jsonl").open() as f:
            for line in f:
                row = json.loads(line)
                n = ".".join(str(x[1]) for x in row["id"])
                if n in watched:
                    require(n not in masks, "ambiguous watched name")
                    masks[n] = row["root_mask"]
        require(all(masks.get(n, 0) & (1 << i) for i, n in enumerate(ROOTS)), "missing graph root")
        state["graph_audited"] = True
        state["watched_masks"] = masks
        # Bits 1 and 2 are the adapter and stronger theorem, not global callers.
        state["local_old_neatness_absent"] = bool(masks.get(OLD_NEAT, 0) & 1
                          and not masks.get(OLD_NEAT, 0) & 6
                          and not masks[ROOTS[0]] & 6)
        state["local_new_path_present"] = bool(masks[ROOTS[2]] & 2
                          and masks.get(GEOM, 0) & 6 == 6)
        save()
        require(state["local_new_path_present"], "new supplier path missing; keep graph")
        engine = (KERNEL / "RHProofTermPrune.lean").read_bytes()
        require(native.git_blob(engine) == "f6d3e7f6047a7895ecf183be3fb54c203f4fc46a",
                "changed prune engine")
        s = engine.decode()
        require(s.count("import Lean\n") == 1, "changed prune import")
        scan = out / "Theta92ScanPrune.lean"
        scan.write_text(s.replace("import Lean\n", "import Lean\nimport ThetaLeafRun92\n", 1)
            + "\n".join("rh_scan " + n + " limit 2000\nrh_prune " + n + " as Theta92Pruned" + str(i)
                        for i, n in enumerate(ROOTS)) + "\n")
        state["prune_executed"] = True
        state["prune_result"] = native.step(["lean", "--tstack=400000", scan], root, env,
                    out / "scan_prune.log", a.seconds)
        save()
        require(state["prune_result"]["returncode"] == 0, "bounded prune failed; graph retained")
        require(state["local_old_neatness_absent"], "old neatness remains or original edge unconfirmed")
    except Exception as e:
        state["error"] = str(e)
        save()
        raise

if __name__ == "__main__":
    main()
