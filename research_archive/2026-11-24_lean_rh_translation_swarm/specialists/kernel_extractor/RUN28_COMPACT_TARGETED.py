#!/usr/bin/env python3
"""Bounded compact Lean replay; never build Main or override RUN26's guard.
Checks selected native modules plus independent candidate lemmas, separately.
No claim of whole-RH replay or verified caller substitutions.
"""
import argparse, hashlib, json, os, pathlib, re, shutil, subprocess, tempfile, time
from RUN26_COMPACT_GRAPH import PIN, MATHLIB, RELEASE, git_blob, require, capture, dump

ROOT = pathlib.Path(__file__).resolve().parents[2]
PEERS = {
    "root_gauss_scalar": ("specialists/character_boxes/RUN50_COMPACT_ROOT_OF_UNITY_GAUSS.lean",
        ["CompactCharacterBoxes50.telescoping_gain", "CompactCharacterBoxes50.budget_contradiction"]),
    "ribet_prefix": ("specialists/galois_representations/RUN50_COMPACT_RIBET_PREFIX_CANCELLATION.lean",
        ["CompactRibetRun50.prefix_replace", "CompactRibetRun50.scalar_prefix_replace"]),
}
TARGETS = [
    ("New.Selmer.RootsOfUnityPoints", "7c07be15e6c410124a9bc5ecb470e7750ac67074",
        ["exists_root_of_unity_eval_large", "exists_roots_of_unity_ellVal_le"]),
    ("New.Core.ModuleIndex", "214cc116f97852925f444db42bfa36cf563af508",
        ["IndexDvd.comap", "IndexDvd.trans", "IndexDvd.map", "IndexDvd.sup", "HasType.prod"]),
    ("New.Heights.Heights", "a18a99e1f76a6e963113cae8f906ddc99814f518",
        ["HeightLe.mul", "HeightLe.pow", "HeightLe.nonneg"]),
]
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}

def step(args, cwd, env, log, seconds):
    start=time.monotonic()
    with log.open("w") as f:
        try:
            p=subprocess.run(list(map(str,args)),cwd=cwd,env=env,stdout=f,
                             stderr=subprocess.STDOUT,timeout=seconds)
            rc=p.returncode
        except subprocess.TimeoutExpired:
            rc=124
            f.write("\nTIMEOUT: bounded targeted job\n")
    return {"returncode":rc,"seconds":round(time.monotonic()-start,2),"log":log.name}

def audit(log,names):
    # Every named theorem must have a matching print-axioms output. Fail closed.
    s=log.read_text(errors="replace")
    found={}
    for name in names:
        pat=r"['‘]"+re.escape(name)+r"['’]\s+depends on axioms:\s*\[([^\]]*)\]"
        hit=re.search(pat,s)
        if hit:
            found[name]=[x.strip() for x in hit.group(1).split(",") if x.strip()]
        elif re.search(r"['‘]"+re.escape(name)+r"['’]\s+does not depend on any axioms",s):
            found[name]=[]
    ok=(set(found)==set(names) and all(set(v)<=ALLOWED for v in found.values())
        and not re.search(r"\b(sorryAx|declaration uses 'sorry')\b",s))
    return {"axioms":found,"axiom_audit_ok":ok}

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--out",required=True)
    args=p.parse_args()
    out=pathlib.Path(args.out).resolve()
    out.mkdir(parents=True,exist_ok=True)
    env=os.environ.copy()
    # Two worker threads instead of saturating four cores; abort Lean panics.
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    mem=int(next(l.split()[1] for l in pathlib.Path("/proc/meminfo").read_text().splitlines()
                 if l.startswith("MemTotal:")))*1024
    cg=pathlib.Path("/sys/fs/cgroup/memory.max")
    if cg.exists() and cg.read_text().strip()!="max":
        mem=min(mem,int(cg.read_text()))
    disk=shutil.disk_usage(tempfile.gettempdir()).free
    dump(out/"resources.json",{"memory_bytes":mem,"free_bytes":disk,
         "threads":2,"mode":"targeted, not full compact build"})
    require(mem>=8_000_000_000 and disk>=35_000_000_000,
            "RESOURCE_BLOCKED: targeted job minimum 8 GB RAM / 35 GB scratch")
    state={"scope":"native named module checks and peer scalar certificates only",
           "full_RH_replay":False,"steps":{}}
    def run(label,cmd,cwd,seconds):
        ans=step(cmd,cwd,env,out/(label+".log"),seconds)
        state["steps"][label]=ans
        dump(out/"targeted_results.json",state)
        return ans["returncode"]==0
    with tempfile.TemporaryDirectory(prefix="compact-targeted-") as td:
        w=pathlib.Path(td); repo=w/"grh"; asset=w/"lean-4.35.0-linux.tar.zst"
        require(run("download",["curl","--fail","--location","--retry","3","-o",asset,
            "https://github.com/leanprover/lean4/releases/download/v4.35.0/"+asset.name],w,900),"Lean download failed")
        with asset.open("rb") as f:
            require(hashlib.file_digest(f,"sha256").hexdigest()==RELEASE,"Lean release SHA256 mismatch")
        require(run("extract",["tar","--zstd","-xf",asset],w,900),"Lean extract failed")
        asset.unlink()
        env["PATH"]=str(w/"lean-4.35.0-linux/bin")+os.pathsep+env["PATH"]
        require(run("version",["lean","--version"],w,60),"Lean version failed")
        require("4.35.0" in (out/"version.log").read_text(),"wrong Lean version")
        require(run("init",["git","init","-q",repo],w,60),"git init failed")
        require(run("remote",["git","remote","add","origin","https://github.com/lsernau/grh-lean.git"],repo,60),"git remote failed")
        require(run("fetch",["git","fetch","--depth=1","origin",PIN],repo,600),"source fetch failed")
        require(run("checkout",["git","checkout","--detach","FETCH_HEAD"],repo,120),"checkout failed")
        require(capture(["git","rev-parse","HEAD"],repo)==PIN,"source pin mismatch")
        c=repo/"grh-compact"
        require((c/"lean-toolchain").read_text().strip()=="leanprover/lean4:v4.35.0","wrong toolchain")
        manifest=json.loads((c/"lake-manifest.json").read_text())
        require(any(x["name"]=="mathlib" and x["rev"]==MATHLIB for x in manifest["packages"]),"wrong Mathlib manifest")
        for module,sha,_ in TARGETS:
            require(git_blob((c/"src"/(module.replace(".","/")+".lean")).read_bytes())==sha,
                    "source blob mismatch: "+module)
        dump(out/"pins.json",{"compact":PIN,"mathlib":MATHLIB,"lean_release_sha256":RELEASE,
                              "source_blobs":{m:s for m,s,_ in TARGETS}})
        require(run("mathlib_cache",["lake","exe","cache","get"],c,4200),"Mathlib cache unavailable")
        require(capture(["git","rev-parse","HEAD"],c/".lake/packages/mathlib")==MATHLIB,"wrong actual Mathlib checkout")
        # Existing peer candidates (Mathlib-only). These do NOT certify the complete human argument.
        for label,(rel,names) in PEERS.items():
            peer=ROOT/rel
            raw=peer.read_bytes()
            dest=w/(label+".lean")
            dest.write_bytes(raw)
            ok=run(label,["lake","env","lean",dest],c,600)
            state["steps"][label].update(audit(out/(label+".log"),names),source_blob=git_blob(raw))
            dump(out/"targeted_results.json",state)
        # Each module is compiled separately in the same cached workspace.
        # Dependencies shared within this run are reused by Lake.
        for i,(module,sha,names) in enumerate(TARGETS):
            label="module_"+str(i)
            ok=run(label+"_build",["lake","build","+"+module+":olean"],c,2700)
            if not ok:
                continue
            probe=w/(label+".lean")
            probe.write_text("import "+module+"\n"+"\n".join("#print axioms "+n for n in names)+"\n")
            run(label,["lake","env","lean",probe],c,600)
            state["steps"][label].update(audit(out/(label+".log"),names),module=module)
            dump(out/"targeted_results.json",state)
        checks=list(PEERS)+["module_"+str(i) for i in range(len(TARGETS))]
        state["all_requested_checks_ok"]=all(
            state["steps"].get(k,{}).get("returncode")==0 and
            state["steps"].get(k,{}).get("axiom_audit_ok") is True for k in checks)
        dump(out/"targeted_results.json",state)
        require(state["all_requested_checks_ok"],"Some targeted checks failed or were not reached; inspect partial evidence")
if __name__=="__main__":
    main()
