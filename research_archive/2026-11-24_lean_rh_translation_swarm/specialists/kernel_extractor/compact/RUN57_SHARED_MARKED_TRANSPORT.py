#!/usr/bin/env python3
"""RUN57 — A1/V1 checked proof transport and one shared A1/A2 native build.
27 November 2026. SOURCE-MATCHED / PREPARED; no actual A1 kernel result yet.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9, 01fa22a6b12abad5ccf580d2621f82be3bf70c13.
Read AGENTS, swarm, handoff, expansion, continuity, A2 RUN79/81, prime
RUN81 and latest integration transport/graph evidence. No duplicate
normalization optimization: prime RUN81 owns its altered q and star chain.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679; old pin separate.

New verified peer control, 46022635354, state blob
26a5d659f56be7b28385a40e33d16248a729e1de: native correct retarget exit 0,
no axioms; deliberately wrong retarget exit 1 with actual kernel
"declaration type mismatch" (True offered as False). Both logs inspected.
Core-only, NOT A1/B2/C2 replay. Reuse that normal checked addDecl path.

Only the changed leaf (RUN54 local approximation and original-statement
Columns.hasType_markOperator_run55) needs tactic elaboration. Instead of
re-elaborating RUN55/56's three unchanged downstream caller bodies,
take their exact existing theorem proof expressions and substitute the
one supplier constant at each stage, retaining original universe list,
type, every other expression and premise. Kernel-check each new theorem.
The three original source consumers are MarkedPrimeType (blob
5433d457d06b8f0e209209be1407fe1971ef86f8) and LocalStatement (blob
9d5bd0d698b0db2850cbd306d8d400d7e99a3547). Original leaf blob
ccae44b8b21d1bface80bc3c8b10370a48c8ea48. Original branch, gauges,
integer beta, index, level/collision/ordinary cases and bounds unchanged.
No assumption of independence between the index and gauge branches.
No global dependency removal. Cache key exact pin, environment, source
and supplier name, type, universe order and proof body.

Actual current-run connector-source preflight: leaf extraction (10452
JS string units), all 3 source caller anchors matched; 4/4 damaged
boundary/leaf/import controls rejected. No local lean/lake executable.
No local native scan/prune/reduce/auto/frontier; no speed claim. The
prepared shared job executes the exact marked chain before the separate
A2 runner mutates its disposable checkout, preserving receipts on failure.
A2 RUN79 (blob 12ae5cce16d4070717dcbabec9c279c372552595) requested this
coordination; RUN81 (418b945e43806a7b147169d7534e621acc8bdc53) is the
optional second-stage peer overlay after a successful stage1 audit.
No duplicate A1/A2 registry job existed at inspection. No protected
workflow edit, no Main or claimed RH import.

RESUME HERE: inspect shared job rh-compact-a1-a2-transport-20261127
outputs/a1_transport.json and its native log; repair the first concrete
failure (or, on success, run actual bounded scan/prune and full strict
constructor-inclusive old/new graph audit using the repaired exporter).
A2 receipts are independent. All root obligations and original graphs
retained. HANDOFF TO integration, acceleration, theta, prime, audit.
RH/star OPEN.
"""
# RUN60, 27 Nov: current live wrapper is deliberately retargeted, not a new
# build job. Earlier immutable RUN57 failure remains at run 46023465491.
# Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7 /
# 24b10d71aff1d6d8075e7629a1710c1b0cc7a969 / c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
# No fresh native receipt or original-cache manifest available at inspection.
# The repaired source and unchanged guard suffix were compared against the
# actual failed compiler input (all caller proof text except explicit scalar
# ring is identical). No new premises. Preserve failed source and audit roster.
# RESUME HERE: on the next authorized shared original build/cache reuse, read
# a1_transport.json and actual log, requiring generated_blob == REPAIRED_BLOB.
# If accepted, run RUN58 strict graph and native scan/prune; otherwise repair
# the first concrete diagnostic. Do not register another full-build job.
# HANDOFF TO integration, acceleration, theta, audit. A1/Star/RH OPEN.
import hashlib
import json
import pathlib
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
SWARM = HERE.parents[2]
sys.path.insert(0, str(SWARM / "specialists/on_acceleration/compact"))
import RUN79_A2_CALLER_REPLAY as a2
native = a2.native

PRIOR = HERE / "RUN55_MARKED_ACTUAL_CONSUMER_REPLAY.mjs"
PRIOR_BLOB = "af53b153fee150d720216617314adb79de17e3fb"
FAILED_BLOB = "bacc8d571342525149fb6eba8f062568988ce0d2"
REPAIRED = HERE / "RUN59_A1_ELAB_REPAIR.lean"
REPAIRED_BLOB = "0b809db534349fdf6b5d179365a6045f28d7dc7c"
A2_FILE = SWARM / "specialists/on_acceleration/compact/RUN79_A2_CALLER_REPLAY.py"
A2_BLOB = "12ae5cce16d4070717dcbabec9c279c372552595"
STAGE2 = A2_FILE.with_name("RUN81_A2_GENERAL_CALLER_SPLICE.mjs")
STAGE2_BLOB = "418b945e43806a7b147169d7534e621acc8bdc53"
MARKER = "/-! Part of: Scaled Hecke operators repair divisibility at inert primes pairing tops (see\nNew.Columns.LocalStatement)."
LEAF = "lemma Columns.hasType_markOperator_run55 "
OLD_IMPORT = "import New.Columns.MarkedPrimeType\n"
NEW_IMPORT = ("import Lean\nimport New.Columns.LocalStatement\n"
              "set_option debug.skipKernelTC false\nset_option Elab.async false\n"
              "set_option maxHeartbeats 0\n")
NAMES = ["Columns.hasType_markOperator_run55",
         "Data.IsMarked.hasType_markOperator_run57",
         "Data.IsMarked.hasType_prod_markOperator_pow_run57",
         "Data.exists_indexDvd_Bmu_divisible_run57"]

GUARDS = r"""
set_option pp.fullNames true

private def a1Run57SameType (a b : Lean.ConstantInfo) :
    Lean.Elab.Command.CommandElabM Unit := do
  unless a.levelParams == b.levelParams do
    Lean.throwError "RUN57 universe parameter mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "RUN57 supplier statement differs"

private def a1Run57Audit (old fresh : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let allowed : Array Lean.Name := #[@@@@propext, @@@@Classical.choice, @@@@Quot.sound]
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  unless oa.all (fun x => allowed.contains x) &&
      na.all (fun x => allowed.contains x && oa.contains x) do
    Lean.throwError "RUN57 new or unexpected axiom"
  let oi ← Lean.getConstInfo old
  let ni ← Lean.getConstInfo fresh
  let some ov := oi.value? (allowOpaque := true) |
    Lean.throwError "RUN57 original proof missing"
  let some nv := ni.value? (allowOpaque := true) |
    Lean.throwError "RUN57 new proof missing"
  Lean.logInfo m!"A1_ROLE|{old}|type|{oi.type.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_ROLE|{fresh}|type|{ni.type.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_ROLE|{old}|value|{ov.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_ROLE|{fresh}|value|{nv.getUsedConstants.map Lean.Name.toString}"
  Lean.logInfo m!"A1_AXIOMS|{old}|{oa.map Lean.Name.toString}"
  Lean.logInfo m!"A1_AXIOMS|{fresh}|{na.map Lean.Name.toString}"

run_cmd do
  let a ← Lean.getConstInfo @@@@Columns.hasType_markOperator
  let b ← Lean.getConstInfo @@@@Columns.hasType_markOperator_run55
  a1Run57SameType a b
  let some v := b.value? (allowOpaque := true) |
    Lean.throwError "RUN57 changed leaf proof missing"
  let deps := v.getUsedConstants
  if deps.contains @@@@Columns.hasType_markOperator then
    Lean.throwError "RUN57 changed leaf calls old leaf"
  unless deps.contains @@@@kernelRun54_local_double_integral do
    Lean.throwError "RUN57 changed leaf does not use new approximation"
  a1Run57Audit @@@@Columns.hasType_markOperator @@@@Columns.hasType_markOperator_run55
  Lean.logInfo "A1_RUN57_LEAF_CHECKED"

private def a1Run57Retarget (original fresh oldSupplier newSupplier : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let .thmInfo info ← Lean.getConstInfo original |
    Lean.throwError "RUN57 original not a theorem"
  a1Run57SameType (← Lean.getConstInfo oldSupplier) (← Lean.getConstInfo newSupplier)
  let oldEdges := info.value.getUsedConstants
  unless oldEdges.contains oldSupplier && !oldEdges.contains newSupplier do
    Lean.throwError "RUN57 expected original supplier absent or new already present"
  let proof := info.value.replace fun e =>
    match e with
    | .const n levels =>
      if n == oldSupplier then some (.const newSupplier levels) else none
    | _ => none
  -- Normal checked insertion, with exactly original statement/universes.
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := fresh
    levelParams := info.levelParams
    type := info.type
    value := proof
  })
  let .thmInfo checked ← Lean.getConstInfo fresh |
    Lean.throwError "RUN57 checked declaration missing"
  unless checked.type == info.type && checked.levelParams == info.levelParams do
    Lean.throwError "RUN57 original type or universes changed"
  let expected := (oldEdges.filter (· != oldSupplier)).push newSupplier
  let got := checked.value.getUsedConstants
  unless expected.all (fun x => got.contains x) && got.all (fun x => expected.contains x) do
    Lean.throwError "RUN57 unexpected direct value edge change"
  if got.contains original || got.contains oldSupplier then
    Lean.throwError "RUN57 original caller/supplier retained in direct value"
  a1Run57Audit original fresh
  Lean.logInfo m!"A1_RUN57_TRANSPORT_CHECKED|{fresh}"

run_cmd do
  a1Run57Retarget @@@@Data.IsMarked.hasType_markOperator
    @@Data.IsMarked.hasType_markOperator_run57
    @@@@Columns.hasType_markOperator @@@@Columns.hasType_markOperator_run55
  a1Run57Retarget @@@@Data.IsMarked.hasType_prod_markOperator_pow
    @@Data.IsMarked.hasType_prod_markOperator_pow_run57
    @@@@Data.IsMarked.hasType_markOperator @@Data.IsMarked.hasType_markOperator_run57
  a1Run57Retarget @@@@Data.exists_indexDvd_Bmu_divisible
    @@Data.exists_indexDvd_Bmu_divisible_run57
    @@@@Data.IsMarked.hasType_prod_markOperator_pow @@Data.IsMarked.hasType_prod_markOperator_pow_run57

#print axioms Columns.hasType_markOperator_run55
#print axioms Data.IsMarked.hasType_markOperator_run57
#print axioms Data.IsMarked.hasType_prod_markOperator_pow_run57
#print axioms Data.exists_indexDvd_Bmu_divisible_run57
""".replace("@@", chr(96))

def require(ok, why):
    if not ok:
        raise RuntimeError(why)

def check_blob(path, expected):
    require(native.git_blob(path.read_bytes()) == expected, "changed input " + str(path))

def leaf_only(src):
    require(src.count(MARKER) == 1, "invalid marked-prime boundary")
    leaf = src.split(MARKER, 1)[0]
    require(leaf.count(LEAF) == 1 and
            "theorem IsMarked.hasType_markOperator_run55 " not in leaf,
            "invalid changed leaf")
    require(leaf.count(OLD_IMPORT) == 1, "invalid original import")
    return leaf.replace(OLD_IMPORT, NEW_IMPORT, 1)

def a1_run(step, cwd, env, out):
    state = {"scope":"A1 changed leaf + three exact kernel transports",
             "native_verified":False, "full_RH_replay":False,
             "global_dependency_deletion":False, "steps":{}}
    receipt = out / "a1_transport.json"
    def save():
        native.dump(receipt, state)
    save()
    try:
        check_blob(PRIOR, PRIOR_BLOB)
        gen = out / "a1_prior_run55"
        state["steps"]["generate"] = step(
            ["node", PRIOR, cwd.parent, gen], cwd, env, out/"a1_generate.log",120)
        require(state["steps"]["generate"]["returncode"] == 0, "RUN55 source generation failed")
        src = (gen/"MarkedCallerRun55.lean").read_text()
        leaf = leaf_only(src)
        rejected = 0
        for bad in (src.replace(MARKER,"broken"), src+MARKER,
                    src.replace(OLD_IMPORT,"import Other\n"),
                    src.replace(LEAF,"lemma Broken ")):
            try:
                leaf_only(bad)
            except RuntimeError:
                rejected += 1
        require(rejected == 4, "source boundary controls failed")
        state["negative_controls_rejected"] = rejected
        target = out/"MarkedTransportRun57.lean"
        # Retain the exact failed baseline, but never compile it as the repair.
        baseline = out/"MarkedTransportRun57_failed_baseline.lean"
        baseline.write_text(leaf+"\n"+GUARDS)
        check_blob(baseline, FAILED_BLOB)
        state["failed_baseline_blob"] = FAILED_BLOB
        check_blob(REPAIRED, REPAIRED_BLOB)
        repaired = REPAIRED.read_bytes()
        marker = b"set_option pp.fullNames true"
        prior_bytes = baseline.read_bytes()
        require(prior_bytes.count(marker) == repaired.count(marker) == 1,
                "A1 audit boundary mismatch")
        require(prior_bytes.split(marker,1)[1] == repaired.split(marker,1)[1],
                "A1 original transport and audit guards changed")
        # RUN58 consumes this exact filename and receipt field.
        target.write_bytes(repaired)
        state["generated_blob"] = native.git_blob(target.read_bytes())
        require(state["generated_blob"] == REPAIRED_BLOB,
                "A1 compiled candidate is not RUN59 repair")
        state["repair_source"] = REPAIRED.name
        save()
        log = out/"a1_transport.log"
        state["steps"]["transport"] = step(
            ["lake","env","lean","--tstack=400000",target],cwd,env,log,1800)
        text = log.read_text(errors="replace")
        state["axiom_audit"] = native.audit(log,NAMES)
        state["leaf_marker"] = text.count("A1_RUN57_LEAF_CHECKED")==1
        state["transport_markers"] = [n for n in NAMES[1:]
            if text.count("A1_RUN57_TRANSPORT_CHECKED|"+n)==1]
        state["native_verified"] = (state["steps"]["transport"]["returncode"]==0
            and state["axiom_audit"]["axiom_audit_ok"] and state["leaf_marker"]
            and state["transport_markers"]==NAMES[1:])
        require(state["native_verified"], "A1 replay not accepted; inspect actual log")
    except Exception as e:
        state["error"] = str(e)
    finally:
        save()
    return state["native_verified"]

def stage2_run(step,cwd,env,out,deadline):
    state={"native_verified":False,"full_RH_replay":False,"steps":{}}
    receipt=out/"a2_stage2_receipt.json"
    def save():
        native.dump(receipt,state)
    try:
        check_blob(STAGE2,STAGE2_BLOB)
        # First accept and checkpoint the existing stage1 before any further mutation.
        a=a2.parse(out/"a2_original.log",a2.ORIG)
        b=a2.parse(out/"a2_reduced.log",a2.NEW)
        native.dump(out/"a2_stage1_independent_comparison.json",a2.compare(a,b))
        native.dump(out/"a2_stage1_graph.json",b)
        if deadline-time.monotonic()<3500:
            state["deferred"]="insufficient bounded workspace time for second overlay"
            return
        def run(label,args,limit):
            state["steps"][label]=step(args,cwd,env,out/(label+".log"),limit)
            save()
            require(state["steps"][label]["returncode"]==0,label+" failed")
        run("a2_stage2_splice",["node",STAGE2,cwd.parent,"--apply"],120)
        run("a2_stage2_rebuild",["lake","build","+"+a2.MODULE+":olean"],2700)
        names=a2.NEW+["Parameters.exists_punit_square_frame_run80"]
        probe=out/"a2_stage2.lean"
        a2.probe(probe,names)
        run("a2_stage2_probe",["lake","env","lean","--tstack=400000",probe],600)
        graph=a2.parse(out/"a2_stage2_probe.log",names)
        native.dump(out/"a2_stage2_graph.json",graph)
        run("a2_stage2_compare",["node",STAGE2,"--audit",out/"a2_stage1_graph.json",
            out/"a2_stage2_graph.json"],60)
        state["native_verified"]=True
    except Exception as e:
        state["error"]=str(e)
    finally:
        save()

def preserve_source_cache(base_step, cwd, env, out, build_result, build_argv):
    """Retain the original compiled objects before either overlay changes source.

    This is build-cache provenance only; it cannot make a failed replacement pass.
    """
    archive = out / "native_a1_a2_original_oleans.tar.zst"
    packed = base_step(["tar", "--zstd", "-cf", archive, "-C", cwd,
                        ".lake/build/lib/lean"], cwd, env,
                       out / "native_cache_archive.log", 180)
    manifest = {
        "compact": native.PIN, "mathlib": native.MATHLIB,
        "lean_release_sha256": native.RELEASE,
        "source_build_argv": list(map(str, build_argv)),
        "source_build_complete": build_result["returncode"] == 0,
        "source_build_result": build_result,
        "source_is_original_before_A1_A2_overlay": True,
        "archive": archive.name, "archive_result": packed,
        "proof_receipt": False, "full_RH_replay": False,
    }
    if packed["returncode"] == 0:
        with archive.open("rb") as stream:
            manifest["sha256"] = hashlib.file_digest(stream, "sha256").hexdigest()
        manifest["bytes"] = archive.stat().st_size
    native.dump(out / "native_cache_manifest.json", manifest)


def main():
    check_blob(A2_FILE,A2_BLOB)
    base_step=native.step
    deadline=time.monotonic()+300*60
    a1_ok=False
    def shared_step(argv,cwd,env,log,seconds):
        nonlocal a1_ok
        # The unmodified A2 driver first builds module_0_build.log and
        # intercepts only the later module_0.log. Execute A1 BEFORE that
        # hook mutates the source. Preserve original independent receipts.
        if log.name=="module_0_build.log":
            result=base_step(argv,cwd,env,log,5400)
            if result["returncode"]==0:
                preserve_source_cache(base_step,cwd,env,log.parent,result,argv)
                a1_ok=a1_run(base_step,cwd,env,log.parent)
            else:
                native.dump(log.parent/"a1_transport.json",{
                    "native_verified":False,"full_RH_replay":False,
                    "blocked_by_original_build":result})
            return result
        result=base_step(argv,cwd,env,log,seconds)
        if log.name=="a2_reduced.log" and result["returncode"]==0:
            stage2_run(base_step,cwd,env,log.parent,deadline)
        return result
    native.step=shared_step
    a2.main()
    require(a1_ok,"A1 not accepted; separate A2 receipts retained")

if __name__=="__main__":
    main()
