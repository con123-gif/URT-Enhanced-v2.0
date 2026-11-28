#!/usr/bin/env python3
"""RUN95 — 28 November 2026: C1 cache-backed native verification queue.
PREPARED, not a Lean result. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact source 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and latest peer queue/commits.
New actual evidence: theta run 46108201939 downloaded and restored its
own authenticated original artifact (run97.json blob
2fed5e1ac726db7b6cf6f04278ed7ff61d6813ed); its Lean leaf FAILED.
This resolves the previously assumed transport restriction in principle,
not yet for the larger C1 archive. API confirms exact artifact 15234434421,
900881325 bytes, unexpired, SHA256 45b0ae825e3f7c58ee5f78e9178e60d906e20294afff1c6fc04650e5af47cd33.
Derive this driver from peer RUN94 cache bootstrap, blob
d5dd37fab09da635ea70b34081416410119d09c8, with exact replay target changed
to immutable Galois RUN93 (1a673a86f0310b7934fd5fc4afad4611b0891438).
Same actual finite-budget supplier, original row/twist witnesses and
source hypotheses as RUN92. No Main, cold FitTwistsExist build, or
duplicate squared-height C2 job: peer C2 queue checks different roots.
The 13 accepted C2 objects are reused; RUN93 authenticates each object
and receipt again and checks five original/new C1 roots, eight axioms,
exact original statement markers and reachable supplier guards.
RUN94 crystalline relation candidate remains separate and unverified.
Actual connector preflight: checked three pinned input blobs, exact
unique source adaptation anchors, artifact metadata, successful A2
transport stage receipt and absent existing C1 queue id. No new Lean,
native engine, graph or axiom pass. All earlier failed proof evidence
and unresolved C1 foundations retained.
RESUME HERE: inspect state branch compute/rh-compact-c1-finite-cache-20261128/status.json
and outputs/run95.json, then run93/run93_receipt.json and
five_root_comparison.json if available. Repair first actual diagnostic;
if accepted hand finite_fused_run92 to integration at the squared C
caller. No full RH closure. HANDOFF integration/kernel/audit.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import stat
import subprocess
import sys
import tempfile
import zipfile

HERE = Path(__file__).resolve().parent
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
RELEASE = "7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d"
ZIP_SIZE = 900881325
ZIP_SHA = "45b0ae825e3f7c58ee5f78e9178e60d906e20294afff1c6fc04650e5af47cd33"
URL = ("https://nightly.link/con123-gif/URT-Enhanced-v2.0/actions/runs/"
       "46055305146/compute-rh-compact-c1-fit-budget-replay-20261127.zip")
DRIVER = HERE / "RUN93_C1_FINITE_NATIVE_REPLAY.py"
INPUTS = {DRIVER: "1a673a86f0310b7934fd5fc4afad4611b0891438",
          HERE.parent/"character_boxes/RUN89_C2_RESTORED_STAR_REPLAY.py":"fc1b4358908e084085f15e5f1a0cd9328232ffa1",
          HERE/"RUN92_COMPACT_C1_FINITE_BUDGET_MINIMAL.lean":"850241aa06d82ee40d67b304db42c052e22ad862"}
WRAPPER = "2146cd28915a80aa467d64de6ecd0f659e71f389"
TAR_SHA = "63bbe26668b47f81149ef5f5e06033168489076b68eb22509fa40bcc518a9603"

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def digest(p):
    with p.open("rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()

def blob(p):
    raw = p.read_bytes()
    return hashlib.sha1(f"blob {len(raw)}\0".encode()+raw).hexdigest()

def extract(z, dest):
    # Extract only the exact replay subtree, rejecting duplicate paths,
    # symlinks and traversal; streamed to disk, not held in memory.
    prefix = "job/outputs/"
    seen = set()
    count = 0
    with zipfile.ZipFile(z) as f:
        for info in f.infolist():
            if not info.filename.startswith(prefix) or info.is_dir():
                continue
            name = info.filename[len(prefix):]
            if name not in ("native_c1_oleans.tar.zst", "retained_cache_wrapper.json") and not name.startswith("c2_value_family/"):
                continue
            parts = PurePosixPath(name)
            require(not parts.is_absolute() and ".." not in parts.parts and "\\" not in name, "unsafe member")
            require(not stat.S_ISLNK(info.external_attr >> 16), "symlink member")
            p = dest.joinpath(*parts.parts)
            require(p not in seen, "duplicate ZIP member")
            seen.add(p)
            p.parent.mkdir(parents=True, exist_ok=True)
            with f.open(info) as src, p.open("xb") as dst:
                shutil.copyfileobj(src, dst, length=1024*1024)
            count += 1
    require(blob(dest/"retained_cache_wrapper.json")==WRAPPER, "wrong retained receipt")
    tar = dest/"native_c1_oleans.tar.zst"
    require(tar.stat().st_size==792898966 and digest(tar)==TAR_SHA, "wrong original cache")
    return count

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--artifact-zip", type=Path)
    args = ap.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    state = {"scope":"C1 finite arithmetic budget and actual fit-family roots",
             "artifact_verified":False, "native_verified":False,
             "full_RH_replay":False, "stages":{}}
    def save():
        (out/"run95.json").write_text(json.dumps(state, indent=2)+"\n")
    save()
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    def run(label, cmd, cwd, timeout):
        log = out/(label+".log")
        with log.open("w") as f:
            try:
                rc = subprocess.run(list(map(str,cmd)), cwd=cwd, env=env,
                    stdout=f, stderr=subprocess.STDOUT, timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                rc = 124
        state["stages"][label] = {"returncode":rc, "log":log.name,
                                  "log_sha256":digest(log)}
        save()
        require(rc==0, "first failed phase: "+label)
    try:
        for p,h in INPUTS.items():
            require(blob(p)==h, "changed pinned source "+str(p))
        with tempfile.TemporaryDirectory(prefix="c1-95-") as tmp:
            w=Path(tmp)
            z=args.artifact_zip.resolve() if args.artifact_zip else w/"retained.zip"
            if not args.artifact_zip:
                run("artifact_download", ["curl","--fail","--location","--retry","2",
                    "--max-time","1500","-o",z,URL],w,1800)
            require(z.stat().st_size==ZIP_SIZE and digest(z)==ZIP_SHA,"wrong outer artifact")
            art=w/"artifact"
            art.mkdir()
            state["extracted_members"]=extract(z,art)
            state["artifact_verified"]=True
            save()
            if not args.artifact_zip:
                z.unlink()
            asset=w/"lean-4.35.0-linux.tar.zst"
            run("lean_download",["curl","--fail","--location","--retry","2","-o",asset,
                "https://github.com/leanprover/lean4/releases/download/v4.35.0/"+asset.name],w,1200)
            require(digest(asset)==RELEASE,"Lean release digest mismatch")
            run("lean_extract",["tar","--zstd","-xf",asset],w,900)
            asset.unlink()
            bin=w/"lean-4.35.0-linux/bin"
            env["PATH"]=str(bin)+os.pathsep+env["PATH"]
            repo=w/"grh"
            run("source_init",["git","init","-q",repo],w,60)
            run("source_fetch",["git","fetch","--depth=1",
                "https://github.com/lsernau/grh-lean.git",PIN],repo,600)
            run("source_checkout",["git","checkout","--detach","FETCH_HEAD"],repo,120)
            require(subprocess.check_output(["git","rev-parse","HEAD"],cwd=repo,text=True).strip()==PIN,"wrong source pin")
            root=repo/"grh-compact"
            require((root/"lean-toolchain").read_text().strip()=="leanprover/lean4:v4.35.0","wrong toolchain")
            manifest=json.loads((root/"lake-manifest.json").read_text())
            require(any(x["name"]=="mathlib" and x["rev"]==MATHLIB for x in manifest["packages"]),"wrong Mathlib pin")
            run("mathlib_cache",["lake","exe","cache","get"],root,4200)
            lib=root/".lake/build/lib/lean"
            require(not lib.exists() or not any(lib.iterdir()),"refuse to overwrite original objects")
            # The immutable C1 adapter validates every retained object and
            # receipt, restores originals, then compiles only its new C1 module.
            run("run93",[sys.executable,DRIVER,"--artifact",art,"--compact-root",root,
                "--lean-bin",bin,"--out",out/"run93"],w,13000)
            rr=json.loads((out/"run93/run93_receipt.json").read_text())
            cc=json.loads((out/"run93/five_root_comparison.json").read_text())
            require(rr["all_requested_checks_ok"] and rr["new_Lean_execution"] and not rr["full_RH_replay"],"native replay incomplete")
            require(len(rr["roots"])==5 and len(cc["comparisons"])==4 and bool(cc["guards"]) and all(cc["guards"].values()),"five-root guards incomplete")
            state["native_verified"]=True
            save()
    except Exception as exc:
        state["error"]=str(exc)
        save()
        raise

if __name__=="__main__":
    main()
