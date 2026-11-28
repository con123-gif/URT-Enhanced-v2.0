#!/usr/bin/env python3
"""Native sign-leaf replay independent of the pending LongForms workspace.

28 November 2026. PREPARED, NOT native acceptance.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.

The sign supplier of the actual signed A/B/C star needs no A/B/C
hypothesis. Extract its existing primeSum bound and dirCost argument,
ending at 0 <= D.dirCost BEFORE the mainHeight multiplication.
This is not another estimate: exact same y<=a and same shifted
nominal weights, Mangoldt and harmonic bounds, factorial and Omega/g
scale. The new module omits ShortAndEnough/LongForms and the star.
Later multiply by nonnegative m*k in the actual star consumer.
The original sign proof, failed polar mean and full graphs remain
untouched. C2 cache-path repair, A2 callers, count-budget repair and
B3 budget/fixed-lines status.json returned 404 at inspection; no
conclusion inferred. Latest peer relative Plucker height and weighted
packet calibration address distinct suppliers; neither proves this leaf.
Local command -v lean/lake gave no binary. Connector preflight found
unique exact extraction delimiters and the authenticated bootstrap
insertion anchor. No native proof or graph executed here.

RESUME HERE: read compute/rh-compact-editor-dircost-leaf-20261128/
outputs/editor_dircost_receipt.json and first failed native log,
or on acceptance import EditorDirCostLeaf in the original signed
star module and replace the sign body by
  unfold Data.mainHeight
  exact mul_nonneg (by positivity) D.editor_dirCost_nonneg
using the SAME D. Reuse accepted B2/C2/A2 objects for later graph.
No root retirement, global dependency removal, or RH closure.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
sys.path[:0] = [str(SWARM/"specialists"/"kernel_extractor"),
                str(SWARM/"integration"), str(SWARM/"specialists"/"prime_window")]
import RUN26_COMPACT_GRAPH as graph
from RUN28_COMPACT_TARGETED import audit, step
from audit_active_b2_graph import adapt_exporter_435

BOOT = SWARM/"specialists"/"prime_window"/"COMPACT_RUN93_QUEUE_REPAIR.py"
SOURCE = HERE/"2026-11-28_MAIN_HEIGHT_POSITIVE_STAR.lean"
BOOT_BLOB = "cd8a2140bd616ef23d2d784a4b1489efc4e63a4c"
SOURCE_BLOB = "df8004136c1140907f6f15372cc3b256544e9a70"
ROOTS = ["Data.editor_primeSum_harmonic_le", "Data.editor_dirCost_nonneg"]
PINNED = {
    "New/Columns/SizeEstimates.lean": "0b666c5f3cead375b65b97c6af8a25675486b473",
    "New/Seesaw/IndexTypes.lean": "10e0416c5d653fedde38fcd6bf895a2127a3e1a0",
    "New/Data/AdmissibleData.lean": "04208a5044bb7cf6464ef142a14d939148bed834",
    "New/Data/Weights.lean": "8749d68da003347685ca36817b32cafda51a3a6a",
    "New/Data/Magnitudes.lean": "306fe7e22378322422d11b1f8415fcdac75ffd6e",
    "New/Endgame/PrimeError.lean": "63eb3d79d95ad815878e623b96f237240058c8e2",
}
MODULES = ["New.Columns.SizeEstimates","New.Seesaw.IndexTypes","New.Endgame.PrimeError"]
ANCHOR = '            state["compiler_archive_rehashed_here"] = True\n            save()'
INJECT = '\n            editor_stage(root, env, out)\n            return\n'
BEGIN = "set_option debug.skipKernelTC false"
END = "\nopen DirichletCharacter Filter Data Parameters ZMod Module"
OLD = "lemma Data.editor_mainHeight_nonneg {P} (D : Data P) : 0 ≤ D.mainHeight := by"
NEW = "lemma Data.editor_dirCost_nonneg {P} (D : Data P) : 0 ≤ D.dirCost := by"
TAIL = "  unfold Data.mainHeight\n  exact mul_nonneg (by positivity) hcost"
GUARDS = r"""
#print axioms Data.editor_primeSum_harmonic_le
#print axioms Data.editor_dirCost_nonneg
open Lean in
run_cmd do
  for (n, req) in #[
    (Data.editor_primeSum_harmonic_le_PLACEHOLDER,
      #[HARMONIC_PLACEHOLDER, NOMINAL_PLACEHOLDER]),
    (Data.editor_dirCost_nonneg_PLACEHOLDER, #[Data.editor_primeSum_harmonic_le_PLACEHOLDER])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => ALLOWED_PLACEHOLDER.contains a) do
      throwError "EDITOR_DIRCOST unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "missing proof {n}"
    unless req.all (fun k => v.getUsedConstants.contains k) do
      throwError "EDITOR_DIRCOST missing direct supplier {n}"
  logInfo "EDITOR_DIRCOST_LEAF_OK"
"""
# Lean quoted names (two backticks), kept separate from source extraction.
def guard_text():
    q = chr(96)*2
    s = GUARDS.replace("Data.editor_primeSum_harmonic_le_PLACEHOLDER",q+"Data.editor_primeSum_harmonic_le")
    s = s.replace("Data.editor_dirCost_nonneg_PLACEHOLDER",q+"Data.editor_dirCost_nonneg")
    s = s.replace("HARMONIC_PLACEHOLDER",q+"harmonic_floor_le_one_add_log")
    s = s.replace("NOMINAL_PLACEHOLDER",q+"Data.nominalWeight_mem_Icc")
    return s.replace("ALLOWED_PLACEHOLDER","#["+q+"propext, "+q+"Classical.choice, "+q+"Quot.sound]")

def extract(s):
    for marker in [BEGIN, END, OLD, TAIL]:
        graph.require(s.count(marker)==1,"Extraction marker not unique: "+marker)
    b = s[s.index(BEGIN):s.index(END)]
    graph.require(b.count(OLD)==1 and b.count(TAIL)==1,"Sign body delimiters")
    leaf = "\n".join("import "+m for m in MODULES+["Lean"])+"\n\n"
    leaf += b.replace(OLD,NEW,1).replace(TAIL,"  exact hcost",1)+guard_text()
    graph.require("D.mainHeight" not in leaf and "LongForms" not in leaf and
                  "star_inequality" not in leaf, "Unexpected endgame dependency")
    clean = re.sub(r'"(?:\\.|[^"\\])*"', '""', leaf)
    graph.require(not re.search(r"\b(sorry|admit|axiom)\b",clean),"Unproved declaration")
    return leaf

def preflight():
    graph.require(graph.git_blob(BOOT.read_bytes())==BOOT_BLOB,"Changed bootstrap")
    graph.require(graph.git_blob(SOURCE.read_bytes())==SOURCE_BLOB,"Changed sign candidate")
    leaf = extract(SOURCE.read_text())
    # Negative controls: each missing extraction marker must fail.
    for marker in [BEGIN, END, OLD, TAIL]:
        try:
            extract(SOURCE.read_text().replace(marker,"REMOVED_MARKER",1))
        except Exception:
            pass
        else:
            raise RuntimeError("Missing marker accepted: "+marker)
    s = BOOT.read_text()
    graph.require(s.count(ANCHOR)==1,"Changed bootstrap anchor")
    return compile(s.replace(ANCHOR,ANCHOR+INJECT,1),str(BOOT),"exec"),leaf

def editor_stage(root, env, out):
    dest = out/"editor_dircost"
    dest.mkdir(exist_ok=True)
    state = dict(compact=graph.PIN,mathlib=graph.MATHLIB,roots=ROOTS,
        source_blob=SOURCE_BLOB,leaf_checked=False,graph_checked=False,
        new_Lean_execution=False,mainHeight_caller_checked=False,
        full_RH_replay=False,all_requested_checks_ok=False)
    save = lambda: graph.dump(out/"editor_dircost_receipt.json",state)
    save()
    def run(label, argv, seconds, e):
        state[label] = step(argv,root,e,dest/(label+".log"),seconds)
        save()
        graph.require(state[label]["returncode"]==0,label+" failed")
    try:
        for rel,sha in PINNED.items():
            graph.require(graph.git_blob((root/"src"/rel).read_bytes())==sha,"Changed native source: "+rel)
        leaf = extract(SOURCE.read_text())
        sp = dest/"EditorDirCostLeaf.lean"; sp.write_text(leaf)
        state["leaf_blob"] = graph.git_blob(sp.read_bytes()); save()
        run("leaf_source_build",["lake","build"]+["+"+m+":olean" for m in MODULES],7200,env)
        env = dict(env)
        env["LEAN_PATH"] = str(dest)+os.pathsep+subprocess.check_output(
            ["lake","env","printenv","LEAN_PATH"],cwd=root,env=env,text=True).strip()
        obj = sp.with_suffix(".olean")
        state["new_Lean_execution"] = True; save()
        run("leaf",["lean","--tstack=400000","-Dpp.fullNames=true",
                    "-Ddebug.skipKernelTC=false","--root="+str(dest),"-o",obj,sp],1800,env)
        state["leaf_axioms"] = audit(dest/"leaf.log",ROOTS); save()
        graph.require(state["leaf_axioms"]["axiom_audit_ok"] and obj.is_file() and
                      "EDITOR_DIRCOST_LEAF_OK" in (dest/"leaf.log").read_text(),"Leaf guards failed")
        state["leaf_checked"] = True
        state["leaf_sha256"] = hashlib.sha256(obj.read_bytes()).hexdigest(); save()
        graph.ROOTS = ROOTS
        driver = graph.driver()
        graph.require(driver.count("import Main\n")==1,"Exporter import changed")
        driver = adapt_exporter_435(driver.replace("import Main\n","import EditorDirCostLeaf\n",1))
        gp = dest/"EditorDirCostGraph.lean"; gp.write_text(driver)
        stream = dest/"two_roots.jsonl"; env["CATHEDRAL_RH_GRAPH"] = str(stream)
        state["graph_source_blob"] = graph.git_blob(gp.read_bytes()); save()
        run("graph",["lean","--tstack=400000","-Dpp.fullNames=true","-j","2",gp],2700,env)
        state["graph_axioms"] = audit(dest/"graph.log",ROOTS); save()
        graph.require(state["graph_axioms"]["axiom_audit_ok"],"Graph axiom audit failure")
        graph.audit_union(stream,dest,dest)
        name = lambda p: ".".join(x[1] for x in p) if all(x[0]=="s" for x in p) else None
        required = ["Data.editor_primeSum_harmonic_le","harmonic_floor_le_one_add_log",
                    "Data.nominalWeight_mem_Icc","Data.dirCost"]
        banned = ["star_inequality","New.grh","Data.abs_mainHeight_add_remainder_le",
                  "Data.integral_forms_long","Data.exists_family_covolumeSq_le","riemannHypothesis"]
        masks = {}
        for line in (dest/"root_membership.jsonl").open():
            row=json.loads(line); n=name(row["id"])
            if n in set(required+banned+ROOTS): masks[n]=row["root_mask"]
        guards = {n+":in_dirCost":bool(masks.get(n,0)&2) for n in required}
        guards.update({n+":absent":masks.get(n,0)==0 for n in banned})
        state.update(root_masks=masks,reachability_guards=guards,
                     graph_summary=json.loads((dest/"union_summary.json").read_text()))
        with stream.open("rb") as f: state["graph_sha256"]=hashlib.file_digest(f,"sha256").hexdigest()
        save()
        graph.require(state["graph_summary"]["missing"]==0 and all(guards.values()),"Graph guards failed")
        state["graph_checked"]=True; state["all_requested_checks_ok"]=True; save()
    except Exception as exc:
        state["failure"]=str(exc); save(); raise

if __name__ == "__main__":
    code,leaf=preflight()
    if "--preflight" in sys.argv:
        print("Source extraction and four missing-marker controls accepted; no native execution")
    else:
        exec(code,{"__file__":str(BOOT),"__name__":"__main__","editor_stage":editor_stage})
