#!/usr/bin/env python3
"""RUN70: single native A1 object and strict scan/prune gate.
28 November 2026; PREPARED / actual source integration preflight only.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity and current live
spine (C2 squared witness, B3 six-root accepted receipt, native class-star
endpoint peer 8aa381a7660145d5157e5070a11d87dc04c14e98). Reuse all.

Actual gap: RUN57 first elaborates the repaired candidate without -o;
RUN58 elaborates the identical source again solely to obtain an importable
object. RUN61 then accepts exit-zero scan/prune without the RUN68 guards.
This adapter uses one normal-kernel compilation with -R/-o, checks the
existing exact leaf/transport/axiom acceptance unchanged, then copies only
the exact hashed object family into RUN58's graph directory and executes
the same full union audit. It feeds the actual generated eight-root scan
to RUN68's native guard and log audit before acceptance. The original
proof terms, all eight roots, old/new graph, axioms and pending scan counts
are retained. No mathematical premise change, no proof-closure claim.
No prior receipts/files overwritten; existing drivers are pinned and
adapted only in memory. The original graph and candidate are kept.

Actual connector preflight: five original driver blobs matched; both exact
graph-source blocks uniquely matched and reversible; four missing/duplicate
anchor controls rejected; both actual RUN57 and RUN61 dispatch anchors
matched. These are static tests, not native proof verification. Local
lean/lake/gh absent, github.com DNS failed. Authenticated artifact
15236761794 (RUN69) is not mounted in this session. The protected runner
has no explicit artifact-read token at the research step. No duplicate
cold build or workflow/registry edits. No native rh_scan/prune/reduce/
auto/frontier executed here; RUN68 is now on the actual A1 replay path.
One candidate elaboration avoided by design, NOT measured speedup.

RESUME HERE: authorized fresh native host, use the authenticated RUN69
receipt directory (manifest plus original tar), with exact compact and
Mathlib workspace and existing Lean. Run:
  python RUN70_A1_SINGLE_PASS.py --compact-root /path/grh-compact \
      --receipt /path/authenticated-receipt --out /fresh/external/run70
Inspect actual a1_transport.log first; if accepted, check
a1_graph/a1_graph_result.json, full graph and guard_audit.json. A bounded
scan with pending names is never a complete dependency graph; the
independent full graph remains mandatory. Do not rerun the cold build.
HANDOFF TO integration, acceleration, theta, audit. A1/star/RH OPEN.
"""
import hashlib
import json
from pathlib import Path
import shutil
import sys

HERE=Path(__file__).resolve().parent
PINS={"RUN57_SHARED_MARKED_TRANSPORT.py":"9710263e09417d5e4d1e0902f00b554d6fee7ae0","RUN58_A1_GRAPH_AND_PRUNE.py":"e39ff87e5088064c4186fa6bb7a2a88770ff194f","RUN61_A1_REPLAY.py":"96296c5599c80369487071ee10595fb064c3e4c0","RUN65_A1_HEADER_CACHE_REPLAY.py":"a0707b8aa7d62d2966f8b16e20ee43b53dde8c24","RUN68_A1_PRUNE_RECEIPT.mjs":"72cff7d3d353cd67247145b1c4d117987b494736"}
CANDIDATE="29b7e1d057d721dedf6cde6a7242c2f2b2d5f598"
STEM="MarkedTransportRun57"
THIS=Path(__file__).resolve()
OLD_COMPILE="        step=native.step([\"lake\",\"env\",\"lean\",\"--tstack=400000\",\"-R\",out,\n                          \"-o\",out/\"MarkedTransportRun57.olean\",candidate],\n                         root,env,out/\"object.log\",a.seconds)"
NEW_COMPILE="        step=run70_reuse_object(directory,out,src)\n        state[\"object_reused_from_leaf\"]=True"
OLD_SCAN="        state[\"prune_executed\"]=True\n        state[\"prune_result\"]=native.step([\"lean\",\"--tstack=400000\",scan],root,env,out/\"scan_prune.log\",a.seconds)\n        save()\n        require(state[\"prune_result\"][\"returncode\"]==0,\"Native scan/prune compatibility failed; graph preserved\")"
NEW_SCAN="        guarded=out/\"A1ScanPruneGuarded.lean\"\n        state[\"guard_prepare\"]=native.step([\"node\",str(HERE/\"RUN68_A1_PRUNE_RECEIPT.mjs\"),\n            \"--prepare\",str(LANE/\"RHProofTermPrune.lean\"),str(scan),str(guarded)],\n            root,env,out/\"guard_prepare.log\",60)\n        save()\n        require(state[\"guard_prepare\"][\"returncode\"]==0,\"RUN68 source guard failed\")\n        state[\"prune_executed\"]=True\n        state[\"prune_result\"]=native.step([\"lean\",\"--tstack=400000\",guarded],root,env,out/\"scan_prune.log\",a.seconds)\n        save()\n        require(state[\"prune_result\"][\"returncode\"]==0,\"Native scan/prune compatibility failed; graph preserved\")\n        state[\"guard_audit\"]=native.step([\"node\",str(HERE/\"RUN68_A1_PRUNE_RECEIPT.mjs\"),\n            \"--audit-log\",str(out/\"scan_prune.log\")],root,env,out/\"guard_audit.json\",60)\n        save()\n        require(state[\"guard_audit\"][\"returncode\"]==0,\"RUN68 eight-root audit failed\")\n        audit=json.loads((out/\"guard_audit.json\").read_text())\n        require(audit[\"guardMarkersComplete\"] is True and\n            [x[\"root\"] for x in audit[\"actualRoots\"]]==ROOTS,\"RUN68 roster mismatch\")\n        state[\"guarded_prune_accepted\"]=True\n        state[\"bounded_scan_pending\"]={x[\"root\"]:x[\"scan\"][\"pending\"] for x in audit[\"actualRoots\"]}\n        save()"

def require(ok,why):
    if not ok: raise RuntimeError(why)

def blob(b):
    return hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()

def digest(p):
    with p.open("rb") as f: return hashlib.file_digest(f,"sha256").hexdigest()

def replace_once(src,old,new):
    require(src.count(old)==1,"missing/duplicate exact graph source anchor")
    return src.replace(old,new,1)

def preflight():
    for name,h in PINS.items():
        require(blob((HERE/name).read_bytes())==h,"changed pinned input "+name)
    a=(HERE/"RUN57_SHARED_MARKED_TRANSPORT.py").read_text()
    r=(HERE/"RUN61_A1_REPLAY.py").read_text()
    require('["lake","env","lean","--tstack=400000",target],cwd,env,log,1800)' in a,
            "changed leaf dispatch")
    require('step([sys.executable, graph, "--compact-root", cwd,' in r,
            "changed graph dispatch")
    g=(HERE/"RUN58_A1_GRAPH_AND_PRUNE.py").read_text()
    modified=replace_once(replace_once(g,OLD_COMPILE,NEW_COMPILE),OLD_SCAN,NEW_SCAN)
    require(replace_once(replace_once(modified,NEW_SCAN,OLD_SCAN),NEW_COMPILE,OLD_COMPILE)==g,
            "graph adaptation not reversible")
    rejected=0
    for old,new in ((OLD_COMPILE,NEW_COMPILE),(OLD_SCAN,NEW_SCAN)):
        for bad in (g.replace(old,"broken"),g+old):
            try: replace_once(bad,old,new)
            except RuntimeError: rejected+=1
    require(rejected==4,"source guard controls failed")
    return modified

def object_family(directory):
    paths=sorted(directory.glob(STEM+".olean*"))
    require(any(x.name==STEM+".olean" for x in paths),"main native object missing")
    require(all(x.is_file() and not x.is_symlink() and x.stat().st_size>0 for x in paths),
            "invalid native object")
    return {x.name:{"sha256":digest(x),"bytes":x.stat().st_size} for x in paths}

def run70_reuse_object(directory,out,src):
    receipt=json.loads((directory/"a1_transport.json").read_text())
    obj=json.loads((directory/"run70_object.json").read_text())
    require(receipt["native_verified"] is True and receipt["generated_blob"]==CANDIDATE
            and blob(src)==obj["candidate_blob"]==CANDIDATE,
            "source or accepted leaf receipt mismatch")
    require(obj["native_compile_returncode"]==0 and
            obj["log_sha256"]==digest(directory/"a1_transport.log") and
            receipt["steps"]["transport"]["returncode"]==0,
            "native compiler/log mismatch")
    require(obj["objects"]==object_family(directory),"native object family mismatch")
    for name,info in obj["objects"].items():
        dst=out/name
        require(not dst.exists(),"refusing to overwrite graph object")
        with (directory/name).open("rb") as srcf,dst.open("xb") as dstf:
            shutil.copyfileobj(srcf,dstf)
        require(digest(dst)==info["sha256"] and dst.stat().st_size==info["bytes"],
                "graph object copy mismatch")
    require(object_family(out)==obj["objects"],"incomplete graph object family")
    require(not (out/"object.log").exists(),"refusing to overwrite graph log")
    shutil.copyfile(directory/"a1_transport.log",out/"object.log")
    require(digest(out/"object.log")==obj["log_sha256"],"graph log mismatch")
    (out/"run70_object_reuse.json").write_text(json.dumps(obj,indent=2)+"\n")
    return receipt["steps"]["transport"]

def graph_stage():
    # Preserve exact original graph implementation and path resolution.
    source=preflight()
    scope={"__name__":"__main__","__file__":str(HERE/"RUN58_A1_GRAPH_AND_PRUNE.py"),
           "run70_reuse_object":run70_reuse_object}
    exec(compile(source,scope["__file__"],"exec"),scope)

def main():
    preflight()
    if sys.argv[1:]==["--preflight"]:
        print(json.dumps({"source_controls_rejected":4,"native_verified":False}))
        return
    if len(sys.argv)>1 and sys.argv[1]=="--graph-stage":
        sys.argv.pop(1)
        graph_stage()
        return
    import RUN61_A1_REPLAY as retry
    import RUN65_A1_HEADER_CACHE_REPLAY as header
    previous=retry.replay
    def replay(shared,step,cwd,env,out):
        require(shared.REPAIRED_BLOB==CANDIDATE,"wrong repaired candidate")
        def once(argv,work,environment,log,seconds):
            args=list(map(str,argv))
            if log.name=="a1_transport.log":
                source=out/(STEM+".lean")
                target=out/(STEM+".olean")
                require(args==["lake","env","lean","--tstack=400000",str(source)]
                        and blob(source.read_bytes())==CANDIDATE,
                        "unexpected actual leaf dispatch")
                require(not list(out.glob(STEM+".olean*")),"stale native object")
                # Same flags, same module name, normal kernel, one elaboration.
                result=step([*args[:-1],"-R",str(out),"-o",str(target),str(source)],
                            work,environment,log,seconds)
                if result["returncode"]==0:
                    evidence={"candidate_blob":CANDIDATE,"native_compile_returncode":0,
                        "log_sha256":digest(log),"objects":object_family(out),
                        "full_RH_replay":False}
                    with (out/"run70_object.json").open("x") as f:
                        json.dump(evidence,f,indent=2)
                return result
            if log.name=="a1_graph_driver.log":
                require(args[:2]==[sys.executable,str(HERE/"RUN58_A1_GRAPH_AND_PRUNE.py")],
                        "unexpected graph dispatch")
                return step([args[0],str(THIS),"--graph-stage",*args[2:]],
                            work,environment,log,seconds)
            return step(argv,work,environment,log,seconds)
        accepted=previous(shared,once,cwd,env,out)
        if accepted:
            state=json.loads((out/"a1_graph/a1_graph_result.json").read_text())
            require(state["object_reused_from_leaf"] is True and
                    state["guarded_prune_accepted"] is True and
                    state["graph_audited"] is True,"RUN70 strict acceptance missing")
        return accepted
    retry.replay=replay
    header.main()

if __name__=="__main__":
    main()
