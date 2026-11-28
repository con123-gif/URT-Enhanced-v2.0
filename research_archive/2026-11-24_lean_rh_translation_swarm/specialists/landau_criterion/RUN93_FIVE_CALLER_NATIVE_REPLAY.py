#!/usr/bin/env python3
"""RUN93 (28 Nov 2026): five downstream B3 callers, native replay preparation.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
RUN92 candidate ff52060ebacc358f73fd5638731328529af84999, original
RUN91 driver a31f64e0c77b2d46e16815a883975457ed8ef9d2. Prior shell
receipt run 46092592569, ced03da74831bbc7ae37622698002e8dcedb03cd.
Reuse accepted sources; do not rerun four/six-root graphs. Keep full
original premises and both head/inverse and direct chart dependencies.
No Main import, no new mathematical premise, no B3 or RH closure.
Latest peer 3dab1bb4465822261661482f01cd2ecd75535252 cross-frontier
audit concerns existing B2/B3 graphs; this job audits only new callers.
Source transformation and guard arithmetic checked in JS, no Python
or Lean execution during preparation. Native runtime must fail closed.
RESUME HERE: run this driver using shared compute queue and inspect
run93_caller_receipt.json plus ten_roots.jsonl and compiler logs.
If any old path remains, trace its independent caller; do not declare
global absence. Repair only actual failed stage. HANDOFF integration/audit.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import sys
import shutil

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
sys.path.insert(0, str(SWARM / "integration"))
import run_compact_b2_native_replay as native
import audit_active_b2_graph as adapted
import RUN26_COMPACT_GRAPH as graph
import RUN89_DIRECT_TERM_REPLAY as repair
import RUN86_DIRECT_CHART_REPLAY as prior

SHELL = HERE / "COMPACT_RUN90_SHELL_CALLER_TRANSPORT.lean"
SHELL_BLOB = "0813311a1a745edc1e4ddc6a788df25df0b13f9c"
CALLERS = HERE / "COMPACT_RUN92_SHELL_FINITE_QUANTITATIVE_CALLERS.lean"
CALLERS_BLOB = "ff52060ebacc358f73fd5638731328529af84999"
REPAIRED = "cba0a141fd47c34b792021c679b5451ebde7d3bf"
SOURCES = {**prior.ORIGINALS,
    "New/RealPlace/ComplexShells.lean": "351cfdf7fa54238f79b1b950c3532feef1f74f53",
    "New/Filling/TopFloor.lean": "9762970967aef90b3a4e025b7f2891d892c70111"}
SHELL_ROOTS = ["IsCutBessel.formConst_mul_lintegral_le",
    "IsCutBessel.formConst_mul_lintegral_le_via_directChart",
    "IntegralPlace.IsStdLevel.lintegral_shells_le",
    "IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart"]
CALLER_ORIGINALS = ["IsCutBessel.lintegral_formMajorant_ne_top",
    "IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top",
    "IsCutBessel.norm_floorForm_le",
    "IntegralPlace.IsStdLevel.enorm_floorForm_le",
    "IntegralPlace.IsStdLevel.floorZeroForm_le_main_term"]
ROOTS = [n for old in CALLER_ORIGINALS for n in (old,old+"_via_directChart")]
FAMILIES = [0,1,0,1,1]
TARGETS = ["+New.RealPlace.ComplexShells:olean", "+New.Filling.TopFloor:olean"]
MAJOR = "Gauge.formMajorant_sq_le"
INVERSE = "Gauge.lintegral_mul_invWeight_le"
OLD = prior.ROOTS[::2]
NEW = prior.ROOTS[1::2]

def preflight():
    native.require(native.git_blob(SHELL.read_bytes()) == SHELL_BLOB, "Changed RUN90")
    native.require(native.git_blob(prior.SOURCE.read_bytes()) == repair.ORIGINAL, "Changed RUN85")
    generated = repair.generate(prior.SOURCE.read_text())
    native.require(native.git_blob(generated.encode()) == REPAIRED, "Not accepted RUN89 source")
    native.require(native.git_blob(CALLERS.read_bytes()) == CALLERS_BLOB, "Changed RUN92")
    native.require(all("#print axioms " + n in SHELL.read_text() for n in SHELL_ROOTS), "Missing shell probe")
    native.require(all("#print axioms " + n in CALLERS.read_text() for n in ROOTS), "Missing caller probe")
    return generated

def checks(masks, direct):
    has = lambda n,b: masks.get(n,0) & b == b
    g = {f"new_chain_{i}": has(n,682) for i,n in enumerate(NEW)}
    g.update({f"old_chain_{i}": has(n,341) for i,n in enumerate(OLD)})
    g.update({n:has(n,1023) for n in (MAJOR,INVERSE,prior.COM,prior.PARSEVAL)})
    for i,(a,b) in enumerate(zip(ROOTS[::2],ROOTS[1::2])):
        old,new = SHELL_ROOTS[2*FAMILIES[i]:2*FAMILIES[i]+2]
        g[b+":direct"] = old in direct.get(a,set()) and new in direct.get(b,set()) and old not in direct.get(b,set())
        g[b+":exact_direct_delta"] = direct.get(b,set()) == ((direct.get(a,set()) - {old}) | {new})
        g[b+":transitive_supplier"] = has(old,1<<(2*i)) and has(new,1<<(2*i+1))
    return g

def shell_stage(root, env, out, state, save, base, generated):
    for rel,blob in SOURCES.items():
        native.require(native.git_blob((root/"src"/rel).read_bytes()) == blob, "Changed pinned source "+rel)
    setup = native.capture(["git","rev-parse","HEAD"], root)
    native.require(setup == native.PIN, "Wrong compact pin")
    native.require(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib") == native.MATHLIB,"Wrong mathlib")
    lean = shutil.which("lean", path=env["PATH"])
    native.require(lean is not None, "Lean absent")
    proof = out/"RHRun85.lean"; proof.write_text(generated)
    shell = out/"RHRun90Shells.lean"; shell.write_bytes(SHELL.read_bytes())
    callers = out/"RHRun92Callers.lean"; callers.write_bytes(CALLERS.read_bytes())
    state["new_Lean_execution"] = True; save()
    def compile_file(path, env, names, label, markers):
        log = out/(label+".log"); obj=path.with_suffix(".olean")
        receipt=base([lean,"--tstack=400000","-Dpp.fullNames=true","-R",out,"-o",obj,path],root,env,log,2700)
        receipt.update(native.audit(log,names))
        receipt["markers"]={m: m in log.read_text() for m in markers}
        state[label]=receipt; save()
        native.require(receipt["returncode"]==0 and receipt["axiom_audit_ok"] and all(receipt["markers"].values()) and obj.is_file(),label+" failed")
        receipt["object_sha256"]=hashlib.sha256(obj.read_bytes()).hexdigest(); save()
    import subprocess
    setup=subprocess.check_output(["lake","env","python3","-c","import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],cwd=root,env=env,text=True,timeout=300)
    env=dict(env); env.update(json.loads(setup.strip().splitlines()[-1]))
    env["LEAN_PATH"]=str(out)+os.pathsep+env["LEAN_PATH"]
    compile_file(proof,env,prior.ROOTS,"accepted_source_replay",["RUN85_SELF:","RUN85_POSITIONS:"])
    compile_file(shell,env,SHELL_ROOTS,"shell_compile",["RUN90_SHELL: "+n for n in SHELL_ROOTS[1::2]])
    compile_file(callers,env,ROOTS,"caller_compile",["RUN92_CALLER: "+n for n in ROOTS[1::2]])
    graph.ROOTS=ROOTS
    driver=graph.driver()
    native.require(driver.count("import Main\n")==1,"Unexpected exporter import")
    driver=adapted.adapt_exporter_435(driver.replace("import Main\n","import RHRun92Callers\n",1))
    gp=out/"RHRun93CallerGraph.lean"; gp.write_text(driver)
    stream=out/"ten_roots.jsonl"; env["CATHEDRAL_RH_GRAPH"]=str(stream)
    state["graph_source_blob"]=native.git_blob(driver.encode())
    log=out/"graph.log"
    receipt=base([lean,"--tstack=400000","-j","2",gp],root,env,log,1800)
    receipt.update(native.audit(log,ROOTS)); state["graph"]=receipt; save()
    native.require(receipt["returncode"]==0 and receipt["axiom_audit_ok"],"Shell graph export failed")
    graph.audit_union(stream,out,out)
    name=lambda parts: ".".join(x[1] for x in parts) if all(x[0]=="s" for x in parts) else None
    watch=set(ROOTS+SHELL_ROOTS+OLD+NEW+[MAJOR,INVERSE,prior.COM,prior.PARSEVAL])
    masks={}; direct={}
    for line in (out/"root_membership.jsonl").open():
        row=json.loads(line); n=name(row["id"])
        if n in watch: masks[n]=row["root_mask"]
    for line in stream.open():
        row=json.loads(line)
        if row["record"]=="node" and (n:=name(row["id"])) in ROOTS:
            direct[n]={name(x) for x in row["value_constants"]}
    g=checks(masks,direct)
    state.update(root_masks=masks,reachability_guards=g,indirect_old_masks={n:masks.get(n,0)&682 for n in OLD+SHELL_ROOTS[::2]},
                 graph_summary=json.loads((out/"union_summary.json").read_text()))
    with stream.open("rb") as f: state["graph_sha256"]=hashlib.file_digest(f,"sha256").hexdigest()
    save(); native.require(all(g.values()),"Shell dependency guards failed; inspect exact graph")
    state["all_requested_checks_ok"]=True; save()

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--out",required=True,type=Path)
    p.add_argument("--preflight",action="store_true")
    p.add_argument("--compact-root",type=Path)
    p.add_argument("--lean-bin",type=Path)
    a=p.parse_args(); out=a.out.resolve(); out.mkdir(parents=True,exist_ok=True)
    generated=preflight()
    state={"source_blob":CALLERS_BLOB,"shell_source_blob":SHELL_BLOB,"accepted_source_blob":REPAIRED,"roots":ROOTS,
           "compact":native.PIN,"mathlib":native.MATHLIB,"all_requested_checks_ok":False,
           "new_Lean_execution":False,"full_RH_replay":False,"human_assembly_verified":False}
    save=lambda: native.dump(out/"run93_caller_receipt.json",state)
    save()
    if a.preflight: return
    base=native.step
    try:
        if a.compact_root:
            native.require(a.lean_bin is not None,"Supply pinned Lean bin")
            env=os.environ.copy(); env["PATH"]=str(a.lean_bin.resolve())+os.pathsep+env["PATH"]
            env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
            state["build"]=base(["lake","build",*TARGETS],a.compact_root,env,out/"shell_build.log",2700); save()
            native.require(state["build"]["returncode"]==0,"Shell build failed")
            shell_stage(a.compact_root.resolve(),env,out,state,save,base,generated)
            return
        native.PEERS={}; native.SOURCES=SOURCES
        native.ORIGINALS=ROOTS[::2]
        def step(argv,cwd,env,log,seconds):
            argv=list(argv); leaf=Path(str(argv[-1]))
            building=argv==["lake","build","+New.Filling.BlockBound:olean"]
            if building: argv=["lake","build",*TARGETS]
            if leaf.name=="original_callers.lean":
                leaf.write_text("import New.RealPlace.ComplexShells\nimport New.Filling.TopFloor\n"+"\n".join("#print axioms "+n for n in ROOTS[::2])+"\n")
                argv=argv[:3]+["--tstack=400000","-Dpp.fullNames=true"]+argv[3:]
            ans=base(argv,cwd,env,log,seconds)
            if building: state["build"]=ans; save()
            if leaf.name=="original_callers.lean":
                state["original_probes"]={**ans,**native.audit(log,ROOTS[::2])}; save()
            if leaf.name=="missing_projector_guard.lean":
                native.require(state.get("build",{}).get("returncode")==0 and
                  state.get("original_probes",{}).get("returncode")==0 and
                  state["original_probes"]["axiom_audit_ok"],"Original shell probes incomplete")
                shell_stage(cwd,env,out,state,save,base,generated)
            return ans
        native.step=step
        original=sys.argv[:]
        try:
            sys.argv=[str(__file__),"--out",str(out)]
            native.main()
        finally:
            sys.argv=original
        native.require(state["all_requested_checks_ok"],"Shell replay not reached")
    except Exception as exc:
        state["failure"]=str(exc); save(); raise
    finally:
        native.step=base

if __name__=="__main__": main()
