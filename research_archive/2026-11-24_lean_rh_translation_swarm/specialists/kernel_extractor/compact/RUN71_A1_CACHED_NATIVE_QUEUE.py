#!/usr/bin/env python3
"""RUN71 — actual cached native A1 queue, 28 November 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Reuse RUN70 (2babe82e5d67c8f9d0b9b5570e0c8ecfa486c272) unchanged.
Actual peer run 46108201939 / theta RUN97 status blob
477906a035eb6a27397e0bdf82ed159dade0db8c is ERROR, not success:
artifact download, original archive gate, Lean release download,
source checkout, Mathlib cache and original object restoration all
returned zero, confirmed by run97.json blob 2fed5e1ac726db7b6cf6f04278ed7ff61d6813ed.
The separate A2 leaf failed; actual leaf.log blob
81ec97c280383d86ce9f9203f038f3448f887f1a has unsolved matrix sum,
local-ring and residue-field instance failures and unexpected sorryAx.
No A2 replacement accepted. Theta owns that repair.
The public artifact transport is now ACTUALLY exercised by the shared
runner, so the obstacle preventing A1 replay in RUN70 is removed.
Reuse its exact successful setup from RUN97 blob
40b7afeca8fd200abf5dbd662955993f410b0fc4, preserving download and intake
hash guards; delegate archive extraction and original-source check to
RUN65 via RUN70 instead of extracting twice. No cold project build.
Require actual leaf acceptance, eight-root full graph, guarded scan/prune
and original bridge/axiom audit. Partial receipts and errors preserved.
No new mathematical premises; no Main import or complete RH claim.
RUN67 determinant simplification remains separate, pending accepted baseline.
Actual preflight in connector: exact original source and RUN70 blob matches,
unique reversible source adaptation anchors and missing/duplicate controls;
new queue id checked absent. No local Lean execution or native PASS here.
RESUME HERE: inspect state branch compute/rh-compact-a1-cached-single-pass-20261128/status.json
and outputs/a1/a1_transport.log first; if leaf passes inspect
a1_graph/a1_graph_result.json and guard_audit.json. If failed repair
the first actual diagnostic. Preserve all graph/axiom/obligation evidence.
HANDOFF integration/theta/acceleration/audit. A1/star/RH OPEN.
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
SWARM = HERE.parents[2]
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
REPLAY = HERE / "RUN70_A1_SINGLE_PASS.py"
INPUTS = {GATE:"664992a17c8b5cd8e6ac63eaad48490f2c2b0dcc",
          REPLAY:"2babe82e5d67c8f9d0b9b5570e0c8ecfa486c272"}

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
    state={"scope":"A1 cached single-pass replay only",
           "native_verified":False,"graph_and_prune_complete":False,
           "full_RH_replay":False,"stages":{}}
    def save():
        (out/"run71.json").write_text(json.dumps(state,indent=2)+"\n")
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
        with tempfile.TemporaryDirectory(prefix="kernel71-") as tmp:
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
            # RUN65 authenticates and extracts once into this still-empty project lib.
            # RUN70 preserves the leaf result and independently gates the full graph
            # plus all eight original/reduced scan and prune roots.
            leaf_out=out/"a1"
            rc=run("a1_replay",[sys.executable,REPLAY,"--compact-root",root,
                 "--receipt",receipt,"--out",leaf_out],w,13000,ok=False)
            leaf_result=leaf_out/"run65_result.json"
            require(leaf_result.is_file(),"no A1 receipt; inspect replay log")
            leaf=json.loads(leaf_result.read_text())
            state["native_verified"]=leaf.get("native_verified") is True
            state["graph_and_prune_complete"]=leaf.get("graph_and_prune_complete") is True
            state["cache_verified_by_run65"]=leaf.get("cache_verified") is True
            save()
            require(rc==0 and leaf.get("combined_accepted") is True and
                    state["native_verified"] and state["graph_and_prune_complete"]
                    and state["cache_verified_by_run65"],"RUN70 leaf or graph/prune incomplete")
            graph=json.loads((leaf_out/"a1_graph/a1_graph_result.json").read_text())
            require(all(graph.get(k) is True for k in ("graph_audited",
                    "new_paths_present","object_reused_from_leaf",
                    "guarded_prune_accepted")),"RUN70 strict graph guard missing")
            state["strict_graph_accepted"]=True
    except Exception as e:
        state["error"]=str(e)
        raise
    finally:
        save()

if __name__=="__main__":
    main()
