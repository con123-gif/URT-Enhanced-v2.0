#!/usr/bin/env python3
"""RUN101 — targeted native shell-budget replay; exact-coefficient FixedLines alternative.
28 Nov 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207 / Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, continuity, SWARM, HANDOFF, EXPANSION, RUN100 and peer d8fe4185,
3aa72709, 56accb74 read. No competing convex-sieve or C1 work.

New alternative to RUN99, retaining EXACT old one-prime coefficient:
set C=10^10 n^4, k>=3C+12, t=floor(2k/3)+1. Then t+C<=k,
9t>=6k+3, and 9(t+1)>=6k+12 (write k=3q+r, r=0,1,2).
The accepted original-statement floorZeroForm_le_main_term_via_directChart
can therefore be invoked at this smaller t without RUN100's new rank budget.
In the previously derived normalized inequality J<=index^-1+v^(t+1),
index=q0^(k+2rho+1)-1, q0>=b^10, v<=b^-9 and b>=1000,
J<=2b^(-10k)+b^(-6k-12)<=b^(-6k), since k>=1 and
2b^(-4k)+b^-12<1. The residual block remains exactly 1.
Thus the full old comparison b^(-6k |Sg|) survives, so no change to
FiniteSystem, Moments, or empty-mask/frequency guards is necessary.
This is a slightly larger t than RUN99's 23k/36+1, but avoids weakening
the downstream moment and its new coefficient. Both routes are retained.
Actual FixedLines proof body is generated from authenticated source by
changing only theorem name and one shell invocation; remaining tactic
obligations, including implicit exponent choice, require native replay.
Not a claim that the source-level substitution compiles.

Actual connector preflight: seven checks on FixedLines blob, unique
theorem/boundaries/old call/prefix and reversible replacement; actual
RUN95 accepted receipt a40e5ea34dec3ddf16ca751db3ef642a5d64703e read,
artifact 15255905608 (16,626,629 bytes) exists, no claim entire workspace
is retained there. Local lean/lake/elan absent. Native graph/axiom
execution NOT performed in this preparation. Preserve prior six-, four-,
ten-root graphs; do not repeat them. Separate new budget and caller
receipts; if second build times out, first receipt remains valid.
RESUME HERE: inspect run101_budget_receipt.json first, then
fixedlines/run101_fixedlines_receipt.json; repair first actual diagnostic.
If exact-coefficient caller accepted, replace its use in the multi-place
product theorem with exact type-preserving transport. No RH closure.
HANDOFF integration / positivity / kernel / audit.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

import RUN93_FIVE_CALLER_NATIVE_REPLAY as r
import RUN95_CALLER_LAYOUT_REPAIR as repair95
native, graph = r.native, r.graph
HERE = Path(__file__).resolve().parent
BUDGET = HERE / "COMPACT_RUN100_EXACT_SHELL_BUDGET.lean"
BUDGET_BLOB = "94435b3fe839120b7ad832417c2c291de116cbbe"
FIXED = "New/Filling/FixedLines.lean"
FIXED_BLOB = "a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9"
PREFIX = "IntegralPlace.IsStdLevel."
OLD = [PREFIX+"lintegral_shells_le", PREFIX+"floorZeroForm_le_main_term"]
NEW = [PREFIX+"lintegral_shells_le_budgeted", PREFIX+"floorZeroForm_le_main_term_budgeted",
       "LandauRun100.bottomBudget_of_rank"]
ROOTS = [OLD[0],NEW[0],OLD[1],NEW[1],NEW[2]]
OLD_FIXED = "Filling.IsFillingLevel.exists_intermediateGroup_one_prime"
NEW_FIXED = OLD_FIXED+"_restricted_depth"
OLD_CALL = "h.floorZeroForm_le_main_term Z (𝔰.k - 10 ^ 10 * 𝔰.n ^ 4) (by omega)"
NEW_CALL = "h.floorZeroForm_le_main_term_via_directChart Z (2 * 𝔰.k / 3 + 1) (by omega)"

def preflight():
    native.require(native.git_blob(BUDGET.read_bytes())==BUDGET_BLOB,"Changed RUN100")
    generated=r.preflight()
    fixed92=repair95.repair_layout(r.CALLERS,r.CALLERS_BLOB,92)
    native.require(native.git_blob(fixed92.encode())=="a319b20e1c2fa02efa81b55461856d720e0e6ba7","Wrong accepted caller source")
    return generated,fixed92

def candidate_fixed(raw):
    native.require(native.git_blob(raw)==FIXED_BLOB,"Wrong FixedLines source")
    s=raw.decode()
    start="lemma IsFillingLevel.exists_intermediateGroup_one_prime (o : Option Sg)"
    stop="/-- Let Sg be a set of chosen places above q₀"
    prefix_stop="omit [S.IsAdmissible] in"
    for a in (start,stop,prefix_stop):
        native.require(s.count(a)==1,"Unexpected source anchor "+a)
    prefix=s.split(prefix_stop)[0]
    native.require(prefix.startswith("import New.Filling.GlobalToLocal\n"),"Unexpected import")
    body=s[s.index(start):s.index(stop)]
    native.require(body.count(OLD_CALL)==1,"Unexpected bottom call")
    name="exists_intermediateGroup_one_prime"
    native.require(body.count(name)==1,"Unexpected theorem name")
    changed=body.replace(name,name+"_restricted_depth",1).replace(OLD_CALL,NEW_CALL,1)
    native.require(changed.replace(name+"_restricted_depth",name,1).replace(NEW_CALL,OLD_CALL,1)==body,"Non-reversible source change")
    prefix=prefix.replace("import New.Filling.GlobalToLocal\n","import New.Filling.FixedLines\nimport RHRun92Callers\nimport Lean\n",1)
    # Full original-statement check by definitional equality of constant types.
    tail=("\nend Filling\n\nopen Lean Elab Command in\nrun_cmd do\n"
          "  let env ← getEnv\n"
          "  let some a := env.find? "+chr(96)*2+OLD_FIXED+" | throwError \"missing original\"\n"
          "  let some b := env.find? "+chr(96)*2+NEW_FIXED+" | throwError \"missing replacement\"\n"
          "  unless a.levelParams == b.levelParams do throwError \"universe list mismatch\"\n"
          "  liftTermElabM do\n"
          "    unless ← Meta.isDefEq a.type b.type do throwError \"statement mismatch\"\n"
          "  logInfo \"RUN101_EXACT_FIXED_STATEMENT\"\n"
          "#print axioms "+OLD_FIXED+"\n#print axioms "+NEW_FIXED+"\n")
    return prefix+"set_option debug.skipKernelTC false\nset_option Elab.async false\nset_option maxHeartbeats 0\n"+changed+tail

def save_hash(path):
    with path.open("rb") as f: return hashlib.file_digest(f,"sha256").hexdigest()

def stage(root,env,out,generated,fixed92,base,accepted=None,follow=True):
    state={"compact":native.PIN,"mathlib":native.MATHLIB,"source_blob":BUDGET_BLOB,
           "new_Lean_execution":False,"all_requested_checks_ok":False,
           "full_RH_replay":False,"human_assembly_verified":False,"roots":ROOTS}
    save=lambda:native.dump(out/"run101_budget_receipt.json",state)
    save()
    try:
        native.require(native.capture(["git","rev-parse","HEAD"],root)==native.PIN,"Wrong source pin")
        native.require(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")==native.MATHLIB,"Wrong Mathlib")
        for rel,blob in r.SOURCES.items():
            native.require(native.git_blob((root/"src"/rel).read_bytes())==blob,"Changed source "+rel)
        src=root/"src"/FIXED
        text=candidate_fixed(src.read_bytes())
        (out/"RHRun101Fixed.lean").write_text(text)
        setup=subprocess.check_output(["lake","env","python3","-c",
          "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
          cwd=root,env=env,text=True,timeout=300)
        env=dict(env);env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"]=str(out)+os.pathsep+env["LEAN_PATH"]
        lean=shutil.which("lean",path=env["PATH"])
        native.require(lean is not None,"Lean absent")
        def compile_file(path,names,receipt,key,save_receipt,marker=None):
            obj=path.with_suffix(".olean");log=path.with_suffix(".log")
            ans=base([lean,"--tstack=400000","-Dpp.fullNames=true","-R",out,"-o",obj,path],root,env,log,2700)
            ans.update(native.audit(log,names))
            ans["marker_ok"]=marker is None or marker in log.read_text(errors="replace")
            receipt[key]=ans;save_receipt()
            native.require(ans["returncode"]==0 and ans["axiom_audit_ok"] and ans["marker_ok"] and obj.is_file(),key+" failed")
            ans["object_sha256"]=save_hash(obj);save_receipt()
        proof=out/"RHRun85.lean";proof.write_text(generated)
        state["new_Lean_execution"]=True;save()
        if accepted:
            obj=accepted/"RHRun85.olean"
            native.require(save_hash(obj)=="902f57571e47bc7c2a78e1de44514f4d7a59122238ca6728472fdf62803f10c3","Wrong accepted RHRun85 object")
            shutil.copyfile(obj,proof.with_suffix(".olean"))
            # Object is used only with authenticated source/mathlib and an
            # exact verified hash from the previous native receipt.
            state["accepted_object_reused"]=save_hash(obj);save()
        else:
            compile_file(proof,r.prior.ROOTS,state,"accepted_source_replay",save)
        budget=out/"RHRun100Budget.lean";budget.write_bytes(BUDGET.read_bytes())
        compile_file(budget,NEW,state,"budget_compile",save)
        def audit_graph(roots,module,dest,receipt,save_receipt,guard):
            dest.mkdir(exist_ok=True)
            graph.ROOTS=roots
            driver=graph.driver()
            native.require(driver.count("import Main\n")==1,"Exporter import changed")
            driver=r.adapted.adapt_exporter_435(driver.replace("import Main\n","import "+module+"\n",1))
            gp=dest/"Run101Graph.lean";gp.write_text(driver)
            stream=dest/"roots.jsonl";e=dict(env);e["CATHEDRAL_RH_GRAPH"]=str(stream)
            log=dest/"graph.log"
            ans=base([lean,"--tstack=400000","-j","2",gp],root,e,log,1800)
            ans.update(native.audit(log,roots));receipt["graph"]=ans;save_receipt()
            native.require(ans["returncode"]==0 and ans["axiom_audit_ok"],"Graph export failed")
            graph.audit_union(stream,dest,dest)
            name=lambda parts:".".join(x[1] for x in parts) if all(x[0]=="s" for x in parts) else None
            watch=set(roots+OLD+NEW+r.OLD+r.NEW+r.SHELL_ROOTS+r.ROOTS+
                      [r.MAJOR,r.INVERSE,r.prior.COM,r.prior.PARSEVAL])
            masks={};direct={}
            for line in (dest/"root_membership.jsonl").open():
                row=json.loads(line);n=name(row["id"])
                if n in watch:masks[n]=row["root_mask"]
            for line in stream.open():
                row=json.loads(line)
                if row["record"]=="node" and (n:=name(row["id"])) in roots:
                    direct[n]={name(x) for x in row["value_constants"]}
            checks=guard(masks,direct)
            receipt.update(root_masks=masks,reachability_guards=checks,
                graph_summary=json.loads((dest/"union_summary.json").read_text()),
                graph_sha256=save_hash(stream),graph_source_blob=native.git_blob(driver.encode()))
            save_receipt()
            native.require(all(checks.values()) and receipt["graph_summary"]["missing"]==0,"New root guards failed")
        def budget_guard(m,d):
            return {"budgeted_bottom_uses_new_shell":NEW[0] in d.get(NEW[1],set()),
                    "old_shell_absent_new_bottom":not (m.get(OLD[0],0)&8),
                    "old_bottom_absent_new_bottom":not (m.get(OLD[1],0)&8),
                    "direct_chart_positions_retained":m.get(r.NEW[2],0)&10==10,
                    "gauge_majorant_retained":m.get(r.MAJOR,0)&10==10,
                    "old_positions_absent_new_shell_bottom":not(m.get(r.OLD[2],0)&10)}
        audit_graph(ROOTS,"RHRun100Budget",out/"budget_graph",state,save,budget_guard)
        state["all_requested_checks_ok"]=True;save()
    except Exception as exc:
        state["failure"]=str(exc);save();raise
    if not follow:return
    out2=out/"fixedlines";out2.mkdir(exist_ok=True)
    fstate={"source_blob":FIXED_BLOB,"generated_blob":native.git_blob((out/"RHRun101Fixed.lean").read_bytes()),
            "new_Lean_execution":False,"all_requested_checks_ok":False,"full_RH_replay":False}
    save2=lambda:native.dump(out2/"run101_fixedlines_receipt.json",fstate)
    save2()
    try:
        fstate["build"]=base(["lake","build","+New.Filling.FixedLines:olean"],root,env,out2/"build.log",2700);save2()
        native.require(fstate["build"]["returncode"]==0,"FixedLines build incomplete")
        shell=out/"RHRun90Shells.lean";shell.write_bytes(r.SHELL.read_bytes())
        callers=out/"RHRun92Callers.lean";callers.write_text(fixed92)
        if accepted:
            for p,h in ((shell,"ff60aeb9ba8de9a11f291e8f0384182c2b56330ed52e901ede6e8c4035bcfa7b"),
                        (callers,"9015f1b4cb15d8d39283e3d954e2da43cea55974b089285d9b6a4bf1743b37af")):
                obj=accepted/p.with_suffix(".olean").name
                native.require(save_hash(obj)==h,"Wrong accepted object "+obj.name)
                shutil.copyfile(obj,p.with_suffix(".olean"))
        else:
            compile_file(shell,r.SHELL_ROOTS,fstate,"accepted_shell_source",save2)
            compile_file(callers,r.ROOTS,fstate,"accepted_caller_source",save2)
        fstate["new_Lean_execution"]=True;save2()
        compile_file(out/"RHRun101Fixed.lean",[OLD_FIXED,NEW_FIXED],fstate,"fixed_compile",save2,"RUN101_EXACT_FIXED_STATEMENT")
        def fixed_guard(m,d):
            new=OLD[1]+"_via_directChart"
            return {"direct_old":OLD[1] in d.get(OLD_FIXED,set()),
                    "direct_new":new in d.get(NEW_FIXED,set()),
                    "no_old_direct":OLD[1] not in d.get(NEW_FIXED,set()),
                    "old_bottom_absent":not(m.get(OLD[1],0)&2),
                    "new_bottom_reachable":bool(m.get(new,0)&2)}
        audit_graph([OLD_FIXED,NEW_FIXED],"RHRun101Fixed",out2,fstate,save2,fixed_guard)
        fstate["all_requested_checks_ok"]=True;save2()
    except Exception as exc:
        fstate["failure"]=str(exc);save2();raise

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--out",required=True,type=Path)
    p.add_argument("--preflight",action="store_true")
    p.add_argument("--compact-root",type=Path)
    p.add_argument("--lean-bin",type=Path)
    p.add_argument("--accepted-dir",type=Path)
    p.add_argument("--budget-only",action="store_true")
    a=p.parse_args();out=a.out.resolve();out.mkdir(parents=True,exist_ok=True)
    generated,fixed92=preflight()
    if a.preflight:
        if a.compact_root:
            (out/"RHRun101Fixed.lean").write_text(candidate_fixed((a.compact_root/"src"/FIXED).read_bytes()))
        return
    base=native.step
    if a.compact_root:
        native.require(a.lean_bin is not None,"Supply authenticated Lean bin")
        env=os.environ.copy();env["PATH"]=str(a.lean_bin.resolve())+os.pathsep+env["PATH"]
        env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
        native.require("4.35.0" in subprocess.check_output(["lean","--version"],env=env,text=True),"Wrong Lean version")
        stage(a.compact_root.resolve(),env,out,generated,fixed92,base,a.accepted_dir,not a.budget_only)
        return
    native.PEERS={};native.SOURCES={**r.SOURCES,FIXED:FIXED_BLOB}
    native.ORIGINALS=OLD
    def step(argv,cwd,env,log,seconds):
        argv=list(argv);leaf=Path(str(argv[-1]))
        if argv==["lake","build","+New.Filling.BlockBound:olean"]:
            argv=["lake","build",*r.TARGETS]
        if leaf.name=="original_callers.lean":
            leaf.write_text("import New.Filling.TopFloor\n"+"\n".join("#print axioms "+n for n in OLD)+"\n")
        if leaf.name=="missing_projector_guard.lean":
            stage(cwd,env,out,generated,fixed92,base,a.accepted_dir,not a.budget_only)
        return base(argv,cwd,env,log,seconds)
    native.step=step
    try:
        sys.argv=[str(__file__),"--out",str(out)]
        native.main()
    finally:native.step=base

if __name__=="__main__":main()
