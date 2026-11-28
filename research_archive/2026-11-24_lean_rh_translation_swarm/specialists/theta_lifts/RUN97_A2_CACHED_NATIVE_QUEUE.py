#!/usr/bin/env python3
"""RUN97 (28 Nov 2026): queue actual A2 leaf replay from retained original
cache; no repeated source build. PREPARED, not a native result.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 /
579ecc1cafdb28eae7d1c97565700c571dfa7484. Read AGENTS, swarm, handoff,
expansion, continuity, latest registry and peer RUN65, RUN87, RUN96.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original A1/A2 attempts remain ERROR; RUN61 actually built the original
LocalStatement closure but failed the A1 header parser. RUN65 owns that
repair. It must not block independent A2. RUN96 confirmed the actual
original archive includes both A2 imports and ChainValuation; no
LongForms/FillingTheorem build in this job. No new mathematical premise.

Actual connector checks: repository public; artifact 15236761794 from
46075703055 exists, not expired, exact name/size/digest pinned below.
Existing compute workflow b7337c56aee2e87e5f2697ee9a69547c04c6327b
does not provide an authenticated artifact token to research code.
Use the public nightly.link download (documented public repo support)
or a supplied local ZIP; never provide credentials or modify workflows.
The anonymous download has NOT been exercised in this session.
Fail closed on size/hash mismatch, do not fall back to cold build.
RUN87 and RUN92 are reused unmodified; preserve actual original/new
graph, axioms and first compiler diagnostic. RUN93 executes only if
RUN92 succeeds. This queue is not a kernel receipt, nor a proof of
the marked frame, theta lift norm, A2, star or RH. No native engines
run locally (lean/lake/elan absent; git remote DNS failure).

RESUME HERE: read the actual state-branch status and outputs for
rh-compact-a2-cached-leaf-20261128; inspect first failed phase/log
(or exact RUN92 receipt/graph and RUN93 short-span guards). Repair
the first actual diagnostic, not another speculative supplier.
HANDOFF kernel/integration/acceleration/audit. All obligations retained.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import zipfile

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
RELEASE = "7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d"
ZIP_SHA = "db4b09f2b0bd50c3a49ff99ca915c694f372adc1b1b6424039f25eb21d179007"
ZIP_SIZE = 313526861
ARCHIVE = "native_a1_a2_original_oleans.tar.zst"
TAR_SHA = "b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03"
URL = ("https://nightly.link/con123-gif/URT-Enhanced-v2.0/actions/runs/"
       "46075703055/compute-rh-compact-a1-repair-graph-20261127.zip")
GATE = SWARM / "specialists/on_acceleration/compact/RUN87_A2_CACHE_GATE.py"
LEAF = HERE / "RUN92_A2_CACHE_LEAF_GRAPH.py"
SHORT = HERE / "RUN93_A2_SHORT_SPAN_SPLIT.lean"
INPUTS = {GATE:"664992a17c8b5cd8e6ac63eaad48490f2c2b0dcc",
          LEAF:"768c917293b75dcedb0bc7b4616fe416ad18e5c8", SHORT:"72aef826d8ed4ba777d272b43c470d726ae77ae8"}

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def digest(p):
    with p.open("rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()

def blob(p):
    data=p.read_bytes()
    return hashlib.sha1(f"blob {len(data)}\0".encode()+data).hexdigest()

def main():
    a=argparse.ArgumentParser()
    a.add_argument("--out",type=Path,required=True)
    a.add_argument("--artifact-zip",type=Path)
    args=a.parse_args()
    out=args.out.resolve()
    out.mkdir(parents=True,exist_ok=True)
    state={"scope":"A2 cached original leaf and independent short span",
           "native_verified":False,"short_native_verified":False,
           "full_RH_replay":False,"stages":{}}
    def save():
        (out/"run97.json").write_text(json.dumps(state,indent=2)+"\n")
    save()
    env=os.environ.copy()
    env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
    def run(label,cmd,cwd,seconds,ok=True):
        log=out/(label+".log")
        with log.open("w") as f:
            try:
                rc=subprocess.run(list(map(str,cmd)),cwd=cwd,env=env,
                    stdout=f,stderr=subprocess.STDOUT,timeout=seconds).returncode
            except subprocess.TimeoutExpired:
                rc=124
        state["stages"][label]={"returncode":rc,"log":log.name,
                                "log_sha256":digest(log)}
        save()
        if ok:
            require(rc==0,"failed "+label+"; inspect "+log.name)
        return rc
    try:
        for p,h in INPUTS.items():
            require(blob(p)==h,"changed pinned input "+str(p))
        with tempfile.TemporaryDirectory(prefix="theta97-") as tmp:
            w=Path(tmp)
            z=args.artifact_zip.resolve() if args.artifact_zip else w/"original.zip"
            if not args.artifact_zip:
                run("artifact_download",["curl","--fail","--location","--retry","2",
                    "--max-time","1200","-o",z,URL],w,1500)
            require(z.stat().st_size==ZIP_SIZE and digest(z)==ZIP_SHA,"artifact bytes differ")
            receipt=w/"receipt"
            receipt.mkdir()
            with zipfile.ZipFile(z) as f:
                for n in ("native_cache_manifest.json",ARCHIVE):
                    entry="job/outputs/"+n
                    require(f.namelist().count(entry)==1,"missing/duplicate member")
                    with f.open(entry) as src,(receipt/n).open("wb") as dst:
                        shutil.copyfileobj(src,dst)
            require(digest(receipt/ARCHIVE)==TAR_SHA,"original archive digest mismatch")
            run("intake",[sys.executable,GATE,"--receipt",receipt],w,600)
            intake=out/"intake.json"
            shutil.copyfile(out/"intake.log",intake)
            require(json.loads(intake.read_text())["cache_intake_verified"] is True,
                    "original cache not authenticated")
            state["artifact_verified"]=True
            save()
            asset=w/"lean-4.35.0-linux.tar.zst"
            run("lean_download",["curl","--fail","--location","--retry","2","-o",asset,
                "https://github.com/leanprover/lean4/releases/download/v4.35.0/"+asset.name],w,1200)
            require(digest(asset)==RELEASE,"Lean release digest mismatch")
            run("lean_extract",["tar","--zstd","-xf",asset],w,900)
            asset.unlink()
            env["PATH"]=str(w/"lean-4.35.0-linux/bin")+os.pathsep+env["PATH"]
            repo=w/"grh"
            run("source_init",["git","init","-q",repo],w,60)
            run("source_fetch",["git","fetch","--depth=1",
                "https://github.com/lsernau/grh-lean.git",PIN],repo,600)
            run("source_checkout",["git","checkout","--detach","FETCH_HEAD"],repo,120)
            require(subprocess.check_output(["git","rev-parse","HEAD"],cwd=repo,text=True).strip()==PIN,
                    "wrong compact source")
            root=repo/"grh-compact"
            require((root/"lean-toolchain").read_text().strip()=="leanprover/lean4:v4.35.0",
                    "wrong toolchain")
            manifest=json.loads((root/"lake-manifest.json").read_text())
            require(any(x["name"]=="mathlib" and x["rev"]==MATHLIB for x in manifest["packages"]),
                    "wrong Mathlib pin")
            run("mathlib_cache",["lake","exe","cache","get"],root,4200)
            lib=root/".lake/build/lib/lean"
            require(not lib.exists() or not any(lib.iterdir()),"refuse to overwrite existing objects")
            run("restore_original",["tar","--zstd","-xf",receipt/ARCHIVE,"-C",root],w,900)
            # No lake build of project modules. RUN92 authenticates exact objects,
            # pins, original statement, axioms, graph and bounded scan/prune.
            leaf_out=out/"theta92"
            rc=run("leaf",[sys.executable,LEAF,"--compact-root",root,
                 "--intake",intake,"--out",leaf_out],w,6000,ok=False)
            leaf_result=leaf_out/"theta92_result.json"
            require(leaf_result.is_file(),"no leaf receipt")
            leaf=json.loads(leaf_result.read_text())
            state["native_verified"]=leaf.get("native_verified") is True
            state["leaf_graph_accepted"]=(rc==0 and leaf.get("graph_audited") is True
                and leaf.get("local_old_neatness_absent") is True
                and leaf.get("local_new_path_present") is True
                and leaf.get("prune_result",{}).get("returncode")==0)
            save()
            require(state["leaf_graph_accepted"],"RUN92 leaf/graph/prune incomplete")
            rc=run("short_span",["lake","env","lean","--tstack=400000",SHORT],root,1800,ok=False)
            log=(out/"short_span.log").read_text(errors="replace")
            state["short_native_verified"]=(rc==0 and log.count("THETA93_SHORT_SPAN_GUARDS_OK")==1
                and "sorryAx" not in log and "error:" not in log)
            save()
            require(state["short_native_verified"],"RUN93 short span not accepted")
    except Exception as e:
        state["error"]=str(e)
        raise
    finally:
        save()

if __name__=="__main__":
    main()
