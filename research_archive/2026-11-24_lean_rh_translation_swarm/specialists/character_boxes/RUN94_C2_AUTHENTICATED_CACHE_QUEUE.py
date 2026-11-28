#!/usr/bin/env python3
"""RUN94 — 28 Nov 2026. PREPARED native queue, not a Lean result.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity, latest lane and peer commits.
RUN93's old-cache substitution remains rejected. New evidence: theta RUN97
actually downloaded its own 313526861-byte archive anonymously through
nightly.link, verified its bytes and restored the original objects, then
failed at its own Lean leaf (not at download). State status blob
477906a035eb6a27397e0bdf82ed159dade0db8c; run97.json
2fed5e1ac726db7b6cf6f04278ed7ff61d6813ed; download log
e45d66465d908810d06f53c492e5a541f82c4881. Run 46108201939.
The exact C2 artifact 15234434421 is still unexpired; connector API metadata
confirms its name, size and digest. No claim this larger archive has yet
been downloaded. Use the same public transport, with exact digest guards;
no credentials, protected workflow edits, or fallback to a cold fit build.
RUN92 remains unchanged. Same D, independent y, index, conjugate volume,
fit family and signed heights; r^2*r^-2=1; no mathematical premise changed.
This run only registers the missing executable replay, preserving all
original and reduced graph and axiom obligations. No native scan/prune or
Lean check executed in this session. No root obligation discharged.
RESUME HERE: inspect compute/rh-compact-c2-squared-cache-20261128/status.json
and outputs/run94.json on cathedral-research-state, then the first failed
phase or run92/run92_squared_star_results.json and six_root_comparison.json.
If successful, integrate the exact six-root comparison; otherwise repair
the first actual diagnostic, not another speculative theorem. RH OPEN.
HANDOFF integration/kernel/audit.
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
DRIVER = HERE / "RUN92_C2_SQUARED_STAR_REPLAY.py"
INPUTS = {DRIVER: "d4d34e0e158cff60a2a109f352920e009afd518b",
          HERE/"RUN89_C2_RESTORED_STAR_REPLAY.py":"fc1b4358908e084085f15e5f1a0cd9328232ffa1",
          HERE/"RUN91_COMPACT_C2_SQUARED_STAR_MINIMAL.lean":"1bd5f9339e7a588439173ccb8be396f208cfb120"}
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
    state = {"scope":"C2 squared reciprocal height and actual star",
             "artifact_verified":False, "native_verified":False,
             "full_RH_replay":False, "stages":{}}
    def save():
        (out/"run94.json").write_text(json.dumps(state, indent=2)+"\n")
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
        with tempfile.TemporaryDirectory(prefix="c2-94-") as tmp:
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
            # The immutable adapter validates every retained module and receipt,
            # restores original objects and builds only missing direct imports.
            run("run92",[sys.executable,DRIVER,"--artifact",art,"--compact-root",root,
                "--lean-bin",bin,"--out",out/"run92","--extend-original"],w,17400)
            rr=json.loads((out/"run92/run92_squared_star_results.json").read_text())
            cc=json.loads((out/"run92/six_root_comparison.json").read_text())
            require(rr["all_requested_checks_ok"] and rr["new_Lean_execution"] and not rr["full_RH_replay"],"native replay incomplete")
            require(len(cc["comparisons"])==2 and all(cc["checks"].values()),"six-root guards incomplete")
            state["native_verified"]=True
            save()
    except Exception as exc:
        state["error"]=str(exc)
        save()
        raise

if __name__=="__main__":
    main()
