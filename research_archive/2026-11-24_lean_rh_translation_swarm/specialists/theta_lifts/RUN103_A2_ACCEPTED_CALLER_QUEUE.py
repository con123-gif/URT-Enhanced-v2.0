#!/usr/bin/env python3
"""RUN103, 28 Nov 2026: replay seven actual caller transports, not leaf.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit Alpoge,
Sernau, Anthropic collaborators and Claude. PREPARED, not kernel PASS.
RUN102 accepted receipt blob 492e6c7c2590f849ba59eae6f11517b646d72f44
re-read: leaf+graph+prune exit 0, caller_replacements_checked=false,
full_RH_replay=false. Preserve RUN93 timeout and accepted leaf evidence.
Same D, exact original caller types, finite stabilizer and residue primes;
rank/shortness joint theorem retained. No independent split claimed.
Reuse exact authenticated RUN97 bootstrap without rerunning its leaf or
short-span stages. Native graph and bounded scan/prune on all 14 roots.
Use exact supplied proof terms, not speculative search; rh_reduce/auto
remain for unresolved premises exposed by replay. No Main or protected edits.
RESUME HERE: inspect compute/rh-compact-a2-accepted-callers-20261128/
outputs/run103.json, caller.log, graph.log, scan_prune.log and root audits;
repair first actual failure or use accepted callers at RUN85. Record
indirect old paths; no global deletion. HANDOFF kernel/integration/audit.
A2 and RH remain OPEN.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import zipfile

HERE=Path(__file__).resolve().parent
SWARM=HERE.parents[1]
PARENT=HERE/"RUN97_A2_CACHED_NATIVE_QUEUE.py"
CALLER=HERE/"RUN102_A2_ACCEPTED_LEAF_CALLER_TRANSPORT.lean"
KERNEL=SWARM/"specialists/kernel_extractor"
ZIP_SHA="d263dd5577aa905985527528441160c60c40cb0991b41f57abc580ae9b6dba77"
OBJ_SHA="09cfb2c1db343b5f6d5369927ac018c5745e9141b0e5266ae2144937c7fc15ce"
URL=("https://nightly.link/con123-gif/URT-Enhanced-v2.0/actions/runs/"
     "46125697285/compute-rh-compact-a2-leaf-repair-20261128.zip")
MEMBER="job/outputs/theta92/ThetaLeafRun92.olean"

def require(ok,msg):
    if not ok: raise RuntimeError(msg)

def blob(p):
    data=p.read_bytes()
    return hashlib.sha1(f"blob {len(data)}\0".encode()+data).hexdigest()

def digest(p):
    with p.open("rb") as f: return hashlib.file_digest(f,"sha256").hexdigest()

def call_stage(root,out,env,run,save,state,w,intake):
    for p,h in {
        CALLER:"c25427b67f11a43fcb427294ea3911f6310a4ac6",
        KERNEL/"RUN26_COMPACT_GRAPH.py":"775182e659d05a0b179813cc3063725df59e17bb",
        KERNEL/"RHProofTermPrune.lean":"f6d3e7f6047a7895ecf183be3fb54c203f4fc46a",
        SWARM/"integration/audit_active_b2_graph.py":"ccb8c306cdffc72464b0f01e70577b1811b6ffe0",
        HERE/"RUN92_A2_CACHE_LEAF_GRAPH.py":"768c917293b75dcedb0bc7b4616fe416ad18e5c8",
    }.items(): require(blob(p)==h,"changed input "+str(p))
    sys.path.insert(0,str(KERNEL))
    sys.path.insert(0,str(SWARM/"integration"))
    import RUN92_A2_CACHE_LEAF_GRAPH as leaf
    import RUN26_COMPACT_GRAPH as graph
    from audit_active_b2_graph import adapt_exporter_435
    require(subprocess.check_output(["git","rev-parse","HEAD"],cwd=root/".lake/packages/mathlib",text=True).strip()
            =="56a005855ea17e0b0958f73ec801ae140b0a1679","wrong Mathlib checkout")
    leaf.check_intake(root,json.loads(intake.read_text()))
    z=w/"accepted_leaf.zip"
    run("accepted_leaf_download",["curl","--fail","--location","--retry","2",
        "--max-time","1200","-o",z,URL],w,1500)
    require(z.stat().st_size==23603754 and digest(z)==ZIP_SHA,"accepted artifact mismatch")
    obj=out/"ThetaLeafRun92.olean"
    with zipfile.ZipFile(z) as f:
        require(f.namelist().count(MEMBER)==1,"accepted object missing/duplicate")
        with f.open(MEMBER) as src,obj.open("wb") as dst: shutil.copyfileobj(src,dst)
    require(digest(obj)==OBJ_SHA,"accepted object mismatch")
    state["accepted_leaf_object_sha256"]=digest(obj)
    setup=subprocess.check_output(["lake","env","python3","-c",
        "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
        cwd=root,env=env,text=True,timeout=300)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    env["LEAN_PATH"]=str(out)+os.pathsep+env["LEAN_PATH"]
    pairs=re.findall(r"(?m)^  theta84Transport \x60+([\w.]+) \x60+([\w.]+)",CALLER.read_text())
    require(len(pairs)==7 and len(set(sum((list(p) for p in pairs),[])))==14,"wrong caller roster")
    roots=[n for p in pairs for n in p]
    state["roots"]=roots
    path=out/"ThetaCallerRun102.lean"
    shutil.copyfile(CALLER,path)
    compiled=out/"ThetaCallerRun102.olean"
    rc=run("caller",["lean","--tstack=400000","-R",out,"-o",compiled,path],root,3600,ok=False)
    log=(out/"caller.log").read_text(errors="replace")
    state["caller_replacements_checked"]=(rc==0 and compiled.is_file()
        and log.count("THETA84_LEAF_CHECKED")==1
        and all(log.count("THETA84_CHECKED|"+b)==1 for a,b in pairs)
        and not re.search(r"\berror(?:\([^)]*\))?:|sorryAx",log)
        and leaf.native.audit(out/"caller.log",["Data.classAut_eq_bot_of_le_chosenLevel",
            "ThetaRun82.chosenLevel_free_original"]+roots)["axiom_audit_ok"])
    save()
    require(state["caller_replacements_checked"],"caller kernel or statement/axiom guard failed")
    state["caller_object_sha256"]=digest(compiled)
    graph.ROOTS=roots
    source=graph.driver()
    require(source.count("import Main\n")==1,"changed graph import")
    g=out/"Theta103Graph.lean"
    g.write_text(adapt_exporter_435(source.replace("import Main\n",
        "import ThetaCallerRun102\nset_option pp.fullNames true\n",1)))
    stream=out/"theta103_union.jsonl"
    env["CATHEDRAL_RH_GRAPH"]=str(stream)
    run("graph",["lean","--tstack=400000","-j","2",g],root,3600)
    require(leaf.native.audit(out/"graph.log",roots)["axiom_audit_ok"],"graph axiom guard failed")
    graph.audit_union(stream,out,out)
    watched=set(roots+["classAut_eq_bot","Data.classAut_eq_bot_of_le_chosenLevel",
                       "ThetaRun82.chosenLevel_free_original","ThetaRun81.matrix_torsion_eq_one"])
    masks={}
    with (out/"root_membership.jsonl").open() as f:
        for line in f:
            row=json.loads(line)
            n=".".join(str(x[1]) for x in row["id"])
            if n in watched:
                require(n not in masks,"ambiguous watched name")
                masks[n]=row["root_mask"]
    require(all(masks.get(n,0)&(1<<i) for i,n in enumerate(roots)),"missing graph roots")
    require(json.loads((out/"union_summary.json").read_text())["missing"]==0,"missing graph nodes")
    state["graph_audited"]=True
    state["watched_masks"]=masks
    state["old_leaf_reachable_in_new_callers"]=[
        b for i,(a,b) in enumerate(pairs) if masks.get("Data.classAut_eq_bot_of_le_chosenLevel",0)&(1<<(2*i+1))]
    state["new_leaf_reachable_in_new_callers"]=[
        b for i,(a,b) in enumerate(pairs) if masks.get("ThetaRun82.chosenLevel_free_original",0)&(1<<(2*i+1))]
    save()
    require(len(state["new_leaf_reachable_in_new_callers"])==7,"replacement leaf not reachable at all seven callers")
    engine=(KERNEL/"RHProofTermPrune.lean").read_text()
    require(engine.count("import Lean\n")==1,"changed prune import")
    scan=out/"Theta103ScanPrune.lean"
    scan.write_text(engine.replace("import Lean\n","import Lean\nimport ThetaCallerRun102\n",1)
        +"\n".join("rh_scan "+n+" limit 2000\nrh_prune "+n+" as Theta103Pruned"+str(i)
                   for i,n in enumerate(roots))+"\n")
    rc=run("scan_prune",["lean","--tstack=400000",scan],root,3600,ok=False)
    state["prune_executed"]=rc==0 and not re.search(r"\berror(?:\([^)]*\))?:|sorryAx",
        (out/"scan_prune.log").read_text(errors="replace"))
    save()
    require(state["prune_executed"],"bounded scan/prune failed; graph retained")

def main():
    require(blob(PARENT)=="40b7afeca8fd200abf5dbd662955993f410b0fc4","changed bootstrap")
    source=PARENT.read_text()
    begin="            # No lake build of project modules."
    end="    except Exception as e:\n        state["
    require(source.count(begin)==source.count(end)==1,"ambiguous stage boundary")
    i=source.index(begin); j=source.index(end,i)
    source=source[:i]+"            call_stage(root,out,env,run,save,state,w,intake)\n"+source[j:]
    source=source.replace("A2 cached original leaf and independent short span","A2 seven accepted-leaf caller transports")
    source=source.replace('"run97.json"','"run103.json"')
    scope={"__file__":str(PARENT),"__name__":"theta103_bootstrap","call_stage":call_stage}
    exec(compile(source,str(PARENT),"exec"),scope)
    scope["main"]()

if __name__=="__main__": main()
