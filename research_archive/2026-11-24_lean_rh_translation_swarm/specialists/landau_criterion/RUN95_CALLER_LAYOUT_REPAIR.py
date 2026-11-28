#!/usr/bin/env python3
"""RUN95 — repair actual RUN93 syntax failure, then conditional RUN94 replay.

28 Nov 2026; compact 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and peer 1a08fa08 (depth-discounted
moment, conditional; not a replacement for the sharp empty-mask supplier),
257af7d7 (divergent twist subfamily, independent endpoint weakening).
No duplicate Landau repair in current recent commits.

ACTUAL FAILURE: run 46102597741, state branch
compute/rh-compact-b3-five-caller-replay-20261128/status.json
blob 3e662b3b25ae0ee6569d4c4f029e3925834a6db8;
outputs/run93_caller_receipt.json blob 294b7e11f8cf11fb09b2d2abf024a89c61bd3d79.
Source build exit 0 (1342.29s), five originals axiom audit exit 0 (4.92s),
accepted RUN85 replay exit 0 (11.14s), RUN90 shells exit 0 (5.28s).
RUN92 exit 1 (4.68s), zero replacement markers; graph never reached.
caller_compile.log lines 124/131/138/145/152: run_cmd run92Transport
elaborated alone, function type not CommandElabM Unit; following
quoted names parsed as commands. All five replacements consequently
unknown. NOT a failed inequality or a missing axiom. RUN94 has the same
layout risk. Repair only command layout: place complete application on
one indented line inside run_cmd do (as accepted RUN90 uses run_cmd do).
Keep every name, proof value transform, universe list, statement,
guard and hypothesis. The helper definitions and axiom probes are unchanged.
No alternate theorem import or assumption. Local lean/lake absent.
JS checks actually executed on pinned blobs: five command matches in
each module, ten whitespace-normalized application roundtrips equal.
No Python/Lean execution on this new file yet; --preflight is executable.
The existing RUN93 and failed logs remain immutable.

RESUME HERE: execute this driver in shared queue; inspect the actual
run93_caller_receipt.json and ten_roots graph before accepting RUN92;
only on acceptance proceed to the separate run94 receipt and graph.
Repair the first actual proof-value or dependency diagnostic if any.
The new receipt preserves indirect old paths; absence is not inferred
from local substitution. No B3/B4/star/RH closure. HANDOFF integration/audit.
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

import RUN93_FIVE_CALLER_NATIVE_REPLAY as r
native = r.native
graph = r.graph

RUN94 = r.HERE / "COMPACT_RUN94_SIEVE_MOMENT_TRANSPORT.lean"
RUN94_BLOB = "36a24847dffcbd3fc5bec568582342171efb2e5e"
RUN93_BLOB = "3434e02193a9944d716730ac3de2828203e3f10a"
SOURCES94 = {
    "New/RealPlace/BandLimits.lean": "20ff4e65c2599fc8b752dbb93673ed65053e2216",
    "New/Filling/FiniteSystem.lean": "1c169e04852f767f1d1a0140448d902c16dd04e7",
    "New/Filling/Moments.lean": "ec2cb964ede0d5eeae41a077dc6dbfface9c0444",
    "New/Filling/FillingData.lean": "0ef8b0dfe13173b16bd0a8820a4924f10124e278",
}
ORIG94 = ["hasBandLimits_of_isCutBessel",
    "Filling.IsFillingLevel.exists_finite_sieveSystem",
    "Filling.re_trace_besselS_le", "Filling.energy_fixingSet_le",
    "Data.exists_besselSystem"]
ROOT94 = [n for a in ORIG94 for n in (a,a+"_via_directChart")]
DELTA94 = [
    [r.CALLER_ORIGINALS[2], r.CALLER_ORIGINALS[0], r.SHELL_ROOTS[0]],
    [r.CALLER_ORIGINALS[3], r.CALLER_ORIGINALS[1], r.CALLER_ORIGINALS[4]],
    [r.CALLER_ORIGINALS[4]], [ORIG94[1]], [ORIG94[0]]]

def repair_layout(path, expected, number):
    raw = path.read_bytes()
    native.require(native.git_blob(raw) == expected, "Source changed: "+path.name)
    src = raw.decode()
    pat = re.compile(r"^run_cmd (run"+str(number)+r"Transport[^\n]*(?:\n  [^\n]+)+)", re.M)
    blocks = pat.findall(src)
    native.require(len(blocks)==5, "Expected exactly five command applications")
    compact = lambda s: re.sub(r"\s+", "", s)
    for block in blocks:
        native.require(compact(" ".join(block.split())) == compact(block), "Application token change")
    fixed = pat.sub(lambda m: "run_cmd do\n  "+" ".join(m[1].split()), src)
    undo = iter(blocks)
    restored, count = re.subn(r"^run_cmd do\n  run"+str(number)+r"Transport[^\n]+",
        lambda m: "run_cmd "+next(undo), fixed, flags=re.M)
    native.require(count==5 and restored==src, "Non-layout source change")
    return fixed

def follow94(root, env, out, source, base):
    out2=out/"run94"; out2.mkdir(exist_ok=True)
    result={"compact":native.PIN,"mathlib":native.MATHLIB,
        "original_blob":RUN94_BLOB,"generated_blob":native.git_blob(source.encode()),
        "roots":ROOT94,"all_requested_checks_ok":False,"full_RH_replay":False,
        "human_assembly_verified":False,"new_Lean_execution":False}
    save=lambda: native.dump(out2/"run94_receipt.json",result)
    save()
    try:
        for rel,blob in SOURCES94.items():
            native.require(native.git_blob((root/"src"/rel).read_bytes())==blob, "Wrong pinned source "+rel)
        result["build"]=base(["lake","build","+New.RealPlace.BandLimits:olean",
            "+New.Filling.FillingData:olean","+New.Filling.Moments:olean"],
            root,env,out2/"build.log",2700); save()
        native.require(result["build"]["returncode"]==0,"RUN94 source build failed")
        setup=subprocess.check_output(["lake","env","python3","-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root,env=env,text=True,timeout=300)
        env=dict(env); env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"]=os.pathsep.join([str(out2),str(out),env["LEAN_PATH"]])
        lean=shutil.which("lean",path=env["PATH"])
        native.require(lean is not None,"Lean absent")
        path=out2/"RHRun94System.lean"; path.write_text(source)
        obj=path.with_suffix(".olean"); log=out2/"compile.log"
        result["new_Lean_execution"]=True; save()
        receipt=base([lean,"--tstack=400000","-Dpp.fullNames=true","-R",out2,"-o",obj,path],root,env,log,2700)
        receipt.update(native.audit(log,ROOT94))
        receipt["markers"]={n:("RUN94_SYSTEM: "+n) in log.read_text() for n in ROOT94[1::2]}
        result["compile"]=receipt; save()
        native.require(receipt["returncode"]==0 and receipt["axiom_audit_ok"] and all(receipt["markers"].values()) and obj.is_file(),"RUN94 compile failed")
        receipt["object_sha256"]=hashlib.sha256(obj.read_bytes()).hexdigest(); save()
        graph.ROOTS=ROOT94
        driver=graph.driver()
        native.require(driver.count("import Main\n")==1,"Unexpected exporter import")
        driver=r.adapted.adapt_exporter_435(driver.replace("import Main\n","import RHRun94System\n",1))
        gp=out2/"RHRun94Graph.lean"; gp.write_text(driver)
        stream=out2/"ten_roots.jsonl"; env["CATHEDRAL_RH_GRAPH"]=str(stream)
        log=out2/"graph.log"
        result["graph_source_blob"]=native.git_blob(driver.encode())
        receipt=base([lean,"--tstack=400000","-j","2",gp],root,env,log,1800)
        receipt.update(native.audit(log,ROOT94)); result["graph"]=receipt; save()
        native.require(receipt["returncode"]==0 and receipt["axiom_audit_ok"],"RUN94 graph failed")
        graph.audit_union(stream,out2,out2)
        name=lambda parts: ".".join(x[1] for x in parts) if all(x[0]=="s" for x in parts) else None
        watch=set(ROOT94+r.ROOTS+r.SHELL_ROOTS+r.OLD+r.NEW+[r.MAJOR,r.INVERSE,r.prior.COM,r.prior.PARSEVAL])
        masks={}; direct={}
        for line in (out2/"root_membership.jsonl").open():
            row=json.loads(line); n=name(row["id"])
            if n in watch: masks[n]=row["root_mask"]
        for line in stream.open():
            row=json.loads(line)
            if row["record"]=="node" and (n:=name(row["id"])) in ROOT94:
                direct[n]={name(x) for x in row["value_constants"]}
        guards={}
        for i,(a,b,old) in enumerate(zip(ROOT94[::2],ROOT94[1::2],DELTA94)):
            old=set(old); new={n+"_via_directChart" for n in old}
            before=direct.get(a,set()); after=direct.get(b,set())
            guards[b+":direct"]=old<=before and new<=after and not (old & after)
            guards[b+":exact_delta"]=after==((before-old)|new)
            guards[b+":reachability"]=all(masks.get(n,0)&(1<<(2*i)) for n in old) and all(masks.get(n,0)&(1<<(2*i+1)) for n in new)
        result.update(root_masks=masks,reachability_guards=guards,
            indirect_old_masks={n:masks.get(n,0)&682 for n in r.OLD+r.SHELL_ROOTS[::2]+r.ROOTS[::2]+ROOT94[::2]},
            graph_summary=json.loads((out2/"union_summary.json").read_text()))
        with stream.open("rb") as f: result["graph_sha256"]=hashlib.file_digest(f,"sha256").hexdigest()
        save(); native.require(all(guards.values()),"RUN94 graph guards failed")
        result["all_requested_checks_ok"]=True; save()
    except Exception as exc:
        result["failure"]=str(exc); save(); raise

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--out",required=True,type=Path)
    p.add_argument("--preflight",action="store_true")
    a=p.parse_args(); out=a.out.resolve(); out.mkdir(parents=True,exist_ok=True)
    native.require(native.git_blob(Path(r.__file__).read_bytes())==RUN93_BLOB,"Changed RUN93 driver")
    r.preflight()
    fixed92=repair_layout(r.CALLERS,r.CALLERS_BLOB,92)
    fixed94=repair_layout(RUN94,RUN94_BLOB,94)
    candidate=out/"RUN95_fixed92.lean"; candidate.write_text(fixed92)
    (out/"RUN95_fixed94.lean").write_text(fixed94)
    native.dump(out/"run95_layout_receipt.json",{"original_run93_failed":True,
        "fixed92_blob":native.git_blob(fixed92.encode()),"fixed94_blob":native.git_blob(fixed94.encode()),
        "layout_roundtrip_checks":10,"new_Lean_execution":False,"full_RH_replay":False})
    if a.preflight: return
    r.CALLERS=candidate; r.CALLERS_BLOB=native.git_blob(fixed92.encode())
    stage=r.shell_stage
    def continuation(root,env,out,state,save,base,generated):
        stage(root,env,out,state,save,base,generated)
        native.require(state["all_requested_checks_ok"],"RUN93 repair not accepted")
        follow94(root,env,out,fixed94,base)
    r.shell_stage=continuation
    sys.argv=[str(Path(r.__file__)),"--out",str(out)]
    r.main()

if __name__=="__main__": main()
