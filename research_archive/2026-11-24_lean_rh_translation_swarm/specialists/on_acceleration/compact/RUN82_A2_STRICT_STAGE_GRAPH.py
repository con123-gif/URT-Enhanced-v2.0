#!/usr/bin/env python3
"""RUN82 acceleration — strict A2 stage-local graph audit (27 Nov 2026).
Prepared, NOT native executed. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine
87e949a9ea899dd09d297aa30f59df4d1b533fc4; ledger
261b9e8bf027af37e6abe6920deb544b23352d48. Read protocol, handoff,
expansion, AGENTS, RUN79/80/81, theta RUN82 5bc36ce5 and B2/C2 audit.
Registry 9f3e8296fe66e9b4ab769e414bb89f510f9f699d NOW has one shared A1/A2
job rh-compact-a1-a2-transport-20261127 (RUN57). Its status.json and
outputs/targeted_results.json returned 404 at retrieval; do NOT infer PASS
or register a second cold build. Local lean/lake/elan absent.

Concrete audit gap: RUN79/81 compare only direct edges. The same names
are redefined IN PLACE in the disposable checkout, so an export performed
after stage2 cannot retrospectively recover original or stage1 bodies.
A direct absent edge does NOT imply transitive absence: a shared transfer
or other caller may still reach the old frame via type, value, constructor,
projection or recursor edges. Export each state before the next mutation.
Reuse the B2/C2 accepted strict 4.35 exporter and independent root verifier,
not the older projection-incompatible collector. This does not change
any theorem or assume independence of the marked/general paths.
No RH root import. Retain every graph, independent verifier log and axiom
row. Report per-root old-frame presence rather than asserting global
deletion; a retained transitive dependency is a mathematical finding,
not something to filter out. Shared transfer, marked specialization and
general fallback are checked as actual reachable suppliers. All A/B/C/D/E
and V root obligations remain open. No claimed URT speedup.
No synthetic graph offered as proof evidence.

RESUME HERE: in the SAME shared RUN57 workspace, after each stage's
native direct probe and before mutating that stage, execute this file
with --phase original/stage1/stage2 --workspace <grh-compact>
--receipts <RUN57 outputs> --out <new separate directory>. If current
job already finished, first inspect its actual receipts; do not rebuild
a cold source tree merely to run this prepared graph audit. Integrator
may attach the exporter to the next reused native workspace. Keep
stage1 marked and stage2 general outcomes independent. If a transitive
old-frame path survives, trace its exact first path before changing math.
HANDOFF TO kernel/integration/theta/audit. RH/star OPEN.
"""
import argparse, hashlib, json, os, pathlib, re, subprocess, sys

HERE = pathlib.Path(__file__).resolve().parent
SWARM = HERE.parents[2]
sys.path.insert(0, str(SWARM / "specialists/kernel_extractor"))
sys.path.insert(0, str(SWARM / "integration"))
import RUN26_COMPACT_GRAPH as graph
import audit_active_b2_graph as peer
import RUN79_A2_CALLER_REPLAY as a2

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def blob(p):
    b = p.read_bytes()
    return hashlib.sha1(b"blob " + str(len(b)).encode() + b"\0" + b).hexdigest()

def load(p):
    return json.loads(p.read_text())

def read_stage(phase, receipts):
    if phase == "original":
        return a2.ORIG, receipts / "a2_original_graph.json", [a2.JET, a2.LOCAL]
    if phase == "stage1":
        return a2.NEW, receipts / "a2_reduced_graph.json", load(
            receipts / "a2_replay.json")["patched_source_blobs"]
    info = load(receipts / "a2_stage2_splice.log")
    require(info["applied"] is True and info["local_unchanged"] is True,
            "stage2 source not applied")
    return a2.NEW + ["Parameters.exists_punit_square_frame_run80"], receipts / "a2_stage2_graph.json", [
        info["stage2_jet_blob"], info["stage1_local_blob"], info["stage2_helper_blob"]]

def source(roots):
    require(blob(SWARM / "specialists/kernel_extractor/RUN26_COMPACT_GRAPH.py") ==
            "775182e659d05a0b179813cc3063725df59e17bb", "changed graph driver")
    require(blob(SWARM / "integration/audit_active_b2_graph.py") ==
            "ccb8c306cdffc72464b0f01e70577b1811b6ffe0", "changed peer adapter")
    graph.ROOTS = roots
    s = graph.driver()
    require(s.count("import Main\n") == 1, "changed import anchor")
    s = peer.adapt_exporter_435(s.replace("import Main\n", "import New.Columns.LocalStatement\n", 1))
    require(not re.search(r"^import (?:Main|New\.Main)\b", s, re.M), "forbidden RH import")
    return s

def membership(out, roots, phase):
    # Names are compared as tagged Lean names, never joined display strings.
    watched = set(roots) | {a2.FRAME, a2.ROOT_FRAME, a2.SQUARE, a2.SPECIAL,
                           "Parameters.exists_punit_square_frame_run80"}
    masks = {n: 0 for n in watched}
    keys = {tuple(("s", c) for c in n.split(".")): n for n in watched}
    with (out / "root_membership.jsonl").open() as f:
        for line in f:
            row = json.loads(line)
            key = tuple(tuple(c) for c in row["id"])
            if key in keys:
                masks[keys[key]] = row["root_mask"]
    def reaches(root, target):
        return bool(masks[target] & (1 << roots.index(root)))
    checks = {n: reaches(n, n) for n in roots}
    if phase == "original":
        checks["general_frame_baseline"] = reaches(a2.GENERAL, a2.FRAME)
        checks["marked_frame_baseline"] = reaches(a2.CALLER, a2.FRAME)
    else:
        checks["marked_special"] = reaches(a2.CALLER, a2.SPECIAL)
        checks["marked_shared_transfer"] = reaches(a2.CALLER, a2.SQUARE)
        checks["marked_root_frame"] = reaches(a2.CALLER, a2.ROOT_FRAME)
        checks["general_transfer"] = reaches(a2.GENERAL, a2.TRANSFER)
        checks["general_shared_transfer"] = reaches(a2.GENERAL, a2.SQUARE)
        if phase == "stage1":
            checks["general_fallback_retained"] = reaches(a2.GENERAL, a2.FRAME)
        else:
            checks["general_new_helper"] = reaches(a2.GENERAL, "Parameters.exists_punit_square_frame_run80")
    old = {n: reaches(n, a2.FRAME) for n in roots}
    result = {"phase":phase,"roots":roots,"supplier_checks":checks,
              "old_frame_transitively_reachable":old,
              "all_supplier_checks":all(checks.values()),
              "global_dependency_deletion":False,"full_RH_replay":False}
    (out / "a2_reachability.json").write_text(json.dumps(result, indent=2)+"\n")
    require(all(checks.values()), "actual supplier reachability differs; inspect saved graph")
    return result

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--phase", choices=["original","stage1","stage2"], required=True)
    p.add_argument("--workspace", type=pathlib.Path)
    p.add_argument("--receipts", type=pathlib.Path)
    p.add_argument("--out", type=pathlib.Path, required=True)
    p.add_argument("--prepare-only", action="store_true")
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=False)
    roots = a2.ORIG if args.phase == "original" else a2.NEW + (
        ["Parameters.exists_punit_square_frame_run80"] if args.phase == "stage2" else [])
    lean = out / "A2StrictGraph.lean"
    lean.write_text(source(roots))
    if args.prepare_only:
        return
    require(args.workspace is not None and args.receipts is not None, "shared workspace and stage receipts required")
    w = args.workspace.resolve()
    rec = args.receipts.resolve()
    r, direct_path, expected = read_stage(args.phase, rec)
    require(r == roots, "stage roster mismatch")
    direct = load(direct_path)
    require(direct["complete"] is True and set(direct["done"]) == set(roots), "incomplete direct receipt")
    files = [w/"src/New/Curve/ConjugatesOfJets.lean", w/"src/New/Columns/LocalStatement.lean"]
    if args.phase == "stage2":
        files.append(w/"src/New/Curve/PUnitSquareFrameRun80.lean")
    require([blob(x) for x in files] == expected, "wrong stage source blobs")
    def head(p):
        return subprocess.check_output(["git","rev-parse","HEAD"],cwd=p,text=True).strip()
    require(head(w) == graph.PIN and head(w/".lake/packages/mathlib") == graph.MATHLIB, "wrong pins")
    # No build here. The caller must have already completed this stage's
    # compilation and direct probe before mutation; capture exact object hashes.
    objects = [w/".lake/build/lib/lean"/x.relative_to(w/"src").with_suffix(".olean") for x in files]
    obj_hash = {str(x.relative_to(w)):hashlib.sha256(x.read_bytes()).hexdigest() for x in objects}
    require("4.35.0" in subprocess.check_output(["lake","env","lean","--version"],cwd=w,text=True), "wrong Lean")
    manifest = {"phase":args.phase,"roots":roots,"source_blobs":expected,
                "direct_receipt_blob":blob(direct_path),"object_sha256":obj_hash,
                "compact":graph.PIN,"mathlib":graph.MATHLIB,"generated_blob":blob(lean),
                "full_RH_replay":False}
    (out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    stream = out/"graph.jsonl"
    env = dict(os.environ,CATHEDRAL_RH_GRAPH=str(stream))
    with (out/"native.log").open("w") as f:
        cp = subprocess.run(["lake","env","lean","--tstack=400000",str(lean)],
                            cwd=w,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800)
    (out/"execution.json").write_text(json.dumps({"returncode":cp.returncode,"full_RH_replay":False})+"\n")
    require(cp.returncode == 0, "native export failed")
    with stream.open() as f:
        h = json.loads(f.readline())
    # Cross-check actual Lean axiom rows against prior direct probes, then
    # independently reconstruct each axiom closure using the peer verifier.
    actual = {".".join(str(c[1]) for c in row["root"]):
              {".".join(str(c[1]) for c in ax) for ax in row["lean_collect_axioms"]}
              for row in h["root_axioms"]}
    require(set(actual)==set(roots) and all(actual[n]==set(direct["axioms"][n]) for n in roots),
            "stage axiom evidence differs")
    graph.audit_union(stream, out, out)
    membership(out, roots, args.phase)

if __name__ == "__main__":
    main()
