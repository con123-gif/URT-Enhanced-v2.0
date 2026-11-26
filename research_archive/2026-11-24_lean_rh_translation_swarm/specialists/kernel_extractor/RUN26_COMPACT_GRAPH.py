#!/usr/bin/env python3
"""Compact proof graph audit, separate from every original-pin certificate.

Native execution not yet observed. Imports Main ONLY to inspect its existing
checked declaration; no new RH theorem is proved by calling the published root.
The 26 Nov mission requires one shared A/B/C/Main graph, not separate builds.
RESUME HERE: inspect compute/rh-compact-union-graph-20261126/status.json and
resources.json; if capacity is insufficient, use a matching capable runner.
"""
import argparse, hashlib, json, os, pathlib, shutil, subprocess, tempfile, time

PIN="72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB="56a005855ea17e0b0958f73ec801ae140b0a1679"
RELEASE="7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d"
ROOTS=["riemannHypothesis","star_inequality","eventually_primeError_le_rpow",
       "Data.short_forms","Data.enough_forms","Data.integral_forms_long",
       "Data.exists_family_covolumeSq_le"]
BLOBS={"src/Main.lean":"a5d8389131c985a0b54ce5b0e778ee5c8126a997",
       "src/New/Main.lean":"198ed5bf26aa294898931e0649bc2b88f1389f65",
       "src/New/Endgame/ShortAndEnough.lean":"b99eea0689be372d84362c58272b705e104b6a3a",
       "src/New/Endgame/LongForms.lean":"9eff36cf003ac398fbd24361e80e95a03d0b0e05",
       "lakefile.toml":"171c6a3a8cf59aaf629a4a2c8b5533ae1e80c611"}
LANE=pathlib.Path(__file__).resolve().parent
def require(ok,msg):
    if not ok: raise RuntimeError(msg)
def git_blob(data):
    return hashlib.sha1(("blob "+str(len(data))+"\0").encode()+data).hexdigest()
def dump(path,x):
    path.write_text(json.dumps(x,indent=2,ensure_ascii=False)+"\n")
def cmd(args,cwd=None,env=None,log=None,check=True):
    args=list(map(str,args))
    if log is None: return subprocess.run(args,cwd=cwd,env=env,check=check)
    with log.open("w") as f:
        return subprocess.run(args,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,check=check)
def capture(args,cwd=None):
    return subprocess.check_output(list(map(str,args)),cwd=cwd,text=True).strip()
def replace_once(s,a,b):
    require(s.count(a)==1,"nonunique exporter anchor: "+a)
    return s.replace(a,b,1)
def driver():
    raw=(LANE/"KernelGraphExport_v3.lean").read_bytes()
    require(git_blob(raw)=="ee4efebb066f6775fa551ae9104cfa973e585071","old exporter source changed")
    s=raw.decode()
    s=replace_once(s,"(root : Name) (builtinAxioms : Array Name)","(roots : Array Name) (axiomRows : Array Json)")
    s=replace_once(s,'("schema", toJson "cathedral-kernel-v2")','("schema", toJson "compact-kernel-union-v1")')
    s=replace_once(s,'("root", jid root)','("roots", jnames roots)')
    s=replace_once(s,'("lean_collect_axioms", jnames builtinAxioms)','("root_axioms", Json.arr axiomRows)')
    s=replace_once(s,"let mut seen : NameHashSet := {}\n    seen := seen.insert root\n    let mut queue := #[root]",
      "let mut seen : NameHashSet := {}\n    for root in roots do\n      seen := seen.insert root\n    let mut queue := roots")
    marker="set_option maxHeartbeats 0 in\nset_option maxRecDepth 1000000 in\nrun_cmd do"
    require(s.count(marker)==1,"driver boundary changed")
    ticks=chr(96)*2
    rootNames=", ".join(ticks+n for n in ROOTS)
    return s.split(marker)[0]+marker+"\n"+f"""  let roots : Array Name := #[{rootNames}]
  let env := (← getEnv).setExporting false
  let mut axiomRows : Array Json := #[]
  for root in roots do
    match env.toKernelEnv.find? root with
    | some (.thmInfo _) => pure ()
    | _ => throwError "Root theorem not present as checked theorem"
    let axs ← Lean.collectAxioms root
    axiomRows := axiomRows.push (Json.mkObj [
      ("root", CathedralKernelGraph.jid root),
      ("lean_collect_axioms", CathedralKernelGraph.jnames axs)])
  let output ← IO.getEnv "CATHEDRAL_RH_GRAPH"
  CathedralKernelGraph.exportGraph env roots axiomRows
    (System.FilePath.mk (output.getD "compact_kernel_union.jsonl"))
"""+ "\n".join("#print axioms "+n for n in ROOTS)+"\n"

def nid(n): return tuple(tuple(x) for x in n)
def deps(row):
    if row["record"]=="missing": return set()
    fields=("type_constants","value_constants","type_projections","value_projections",
            "type_literals","value_literals","constructors","group","parent","mutual_block","quotient_package")
    res={nid(d) for field in fields for d in row[field]}
    for rule in row["rules"]:
        res.add(nid(rule["constructor"]))
        res.update(nid(d) for f in ("constants","projections","literals") for d in rule[f])
    return res
def audit_union(graph,out,work):
    # Retain byte offsets, not duplicate complete proof graphs in the artifact.
    offsets={}; edges={}; missing=set(); header=footer=None
    with graph.open("rb") as f:
        while True:
            pos=f.tell(); line=f.readline()
            if not line: break
            row=json.loads(line); typ=row["record"]
            require(footer is None,"data after footer")
            if typ=="header":
                require(header is None and not offsets,"duplicate header")
                header=row; continue
            require(header is not None,"missing header")
            if typ=="footer": footer=row; continue
            require(typ in ("node","missing"),"unknown record")
            k=nid(row["id"]); require(k not in offsets,"duplicate node")
            offsets[k]=pos; edges[k]=deps(row)
            if typ=="missing": missing.add(k)
    require(header is not None and footer is not None,"incomplete stream")
    require(header["schema"]=="compact-kernel-union-v1","wrong schema")
    roots=[nid(x) for x in header["roots"]]
    require(roots==[tuple(("s",x) for x in n.split(".")) for n in ROOTS],"wrong root roster")
    ax={nid(x["root"]):x["lean_collect_axioms"] for x in header["root_axioms"]}
    require(len(header["root_axioms"])==len(roots) and set(ax)==set(roots),"wrong axiom roster")
    require(footer["nodes"]==len(offsets) and footer["missing"]==len(missing),"counter mismatch")
    for k,ds in edges.items(): require(ds<=offsets.keys(),"omitted endpoint: "+str(k))
    combined=set(); summaries={}; mask={}
    verifier=LANE/"verify_graph_v2.mjs"
    require(git_blob(verifier.read_bytes())=="2e431301970196a6b786d004fb16a4320a25fe8e","verifier changed")
    for i,(name,root) in enumerate(zip(ROOTS,roots)):
        seen={root}; queue=[root]
        for k in queue:
            for d in edges[k]:
                if d not in seen: seen.add(d); queue.append(d)
        combined.update(seen)
        for k in seen: mask[k]=mask.get(k,0)|(1<<i)
        proj=work/("root-"+str(i)+".jsonl")
        with proj.open("wb") as w, graph.open("rb") as f:
            def line(x): w.write((json.dumps(x,ensure_ascii=False)+"\n").encode())
            line({"record":"header","schema":"cathedral-kernel-v2","root":root,"lean_collect_axioms":ax[root]})
            for k in queue:
                f.seek(offsets[k]); w.write(f.readline())
            line({"record":"footer","nodes":len(seen),"missing":len(seen&missing)})
        log=out/("audit-"+str(i)+".json")
        rc=cmd(["node",verifier,proj],log=log,check=False).returncode
        summaries[name]={"exit":rc,"nodes":len(seen),"missing":len(seen&missing),"log":log.name}
        proj.unlink()
        dump(out/"root_audits.json",summaries)
    require(combined==set(offsets),"extra unreachable union records")
    hist={}
    for m in mask.values(): hist[str(m)]=hist.get(str(m),0)+1
    with (out/"root_membership.jsonl").open("w") as f:
        for k,m in mask.items(): f.write(json.dumps({"id":k,"root_mask":m},ensure_ascii=False)+"\n")
    dump(out/"union_summary.json",{"roots":ROOTS,"nodes":len(offsets),"edges":sum(map(len,edges.values())),
       "missing":len(missing),"mask_histogram":hist,"per_root":summaries,
       "naive_repeated_nodes":sum(x["nodes"] for x in summaries.values())})
    require(all(x["exit"]==0 for x in summaries.values()),"root verifier reported incomplete or trust discrepancy")

def main():
    p=argparse.ArgumentParser();p.add_argument("--out",required=True);p.add_argument("--prepare-only",action="store_true")
    a=p.parse_args();out=pathlib.Path(a.out).resolve();out.mkdir(parents=True,exist_ok=True)
    (out/"CompactGraph.lean").write_text(driver())
    if a.prepare_only: return
    mem=int(next(l.split()[1] for l in pathlib.Path("/proc/meminfo").read_text().splitlines() if l.startswith("MemTotal:")))*1024
    cgroup=pathlib.Path("/sys/fs/cgroup/memory.max")
    if cgroup.exists() and cgroup.read_text().strip()!="max": mem=min(mem,int(cgroup.read_text()))
    cpu=len(os.sched_getaffinity(0))
    quota=pathlib.Path("/sys/fs/cgroup/cpu.max")
    if quota.exists():
        q,period=quota.read_text().split()
        if q!="max": cpu=min(cpu,int(q)/int(period))
    disk=shutil.disk_usage(tempfile.gettempdir()).free
    dump(out/"resources.json",{"effective_memory_bytes":mem,"effective_cpus":cpu,"temporary_free_bytes":disk,
         "publisher_recommendation":"12 cores, 24 GB; 1–2 h after cache",
         "guard":"12 cores and 24e9 bytes memory, unless explicitly overridden for a capable external runner"})
    if os.getenv("COMPACT_GRAPH_ALLOW_SMALL_RUNNER")!="1":
        require(cpu>=12 and mem>=24_000_000_000,"RESOURCE_BLOCKED: runner below publisher build recommendation")
    with tempfile.TemporaryDirectory(prefix="compact-graph-") as td:
        w=pathlib.Path(td); repo=w/"grh"; asset=w/"lean-4.35.0-linux.tar.zst"
        cmd(["curl","--fail","--location","--retry","3","-o",asset,"https://github.com/leanprover/lean4/releases/download/v4.35.0/"+asset.name],log=out/"download.log")
        with asset.open("rb") as f: require(hashlib.file_digest(f,"sha256").hexdigest()==RELEASE,"release checksum mismatch")
        cmd(["tar","--zstd","-xf",asset],cwd=w); asset.unlink()
        env=os.environ.copy(); env["PATH"]=str(w/"lean-4.35.0-linux/bin")+os.pathsep+env["PATH"]
        cmd(["lean","--version"],env=env,log=out/"lean_version.txt")
        require("4.35.0" in (out/"lean_version.txt").read_text(),"wrong Lean version")
        cmd(["git","init","-q",repo]);cmd(["git","remote","add","origin","https://github.com/lsernau/grh-lean.git"],cwd=repo)
        cmd(["git","fetch","--depth=1","origin",PIN],cwd=repo,log=out/"checkout.log")
        cmd(["git","checkout","--detach","FETCH_HEAD"],cwd=repo)
        require(capture(["git","rev-parse","HEAD"],repo)==PIN,"wrong compact pin")
        c=repo/"grh-compact"
        require((c/"lean-toolchain").read_text().strip()=="leanprover/lean4:v4.35.0","wrong compact toolchain")
        for path,h in BLOBS.items(): require(git_blob((c/path).read_bytes())==h,"source mismatch "+path)
        manifest=json.loads((c/"lake-manifest.json").read_text())
        require(any(x["name"]=="mathlib" and x["rev"]==MATHLIB for x in manifest["packages"]),"wrong Mathlib pin")
        dump(out/"pins.json",{"compact":PIN,"mathlib":MATHLIB,"release_sha256":RELEASE,"source_blobs":BLOBS})
        cmd(["lake","exe","cache","get"],cwd=c,env=env,log=out/"cache.log")
        require(capture(["git","rev-parse","HEAD"],c/".lake/packages/mathlib")==MATHLIB,"wrong actual Mathlib checkout")
        start=time.monotonic()
        cmd(["lake","build","Main"],cwd=c,env=env,log=out/"build.log")
        dump(out/"build_result.json",{"returncode":0,"seconds":time.monotonic()-start,"target":"Main"})
        graph=out/"compact_kernel_union.jsonl";env["CATHEDRAL_RH_GRAPH"]=str(graph)
        cmd(["lake","env","lean","--tstack=400000",out/"CompactGraph.lean"],cwd=c,env=env,log=out/"graph.log")
        audit_union(graph,out,w)
        # Reuse existing binder/prune engine, but test its new toolchain rather than inheriting old CI.
        # Original theorem is only scanned; candidate bridges target star and A/B/C.
        pr=(LANE/"RHProofTermPrune.lean").read_bytes()
        require(git_blob(pr)=="f6d3e7f6047a7895ecf183be3fb54c203f4fc46a","prune source changed")
        s=replace_once(pr.decode(),"import Lean\n","import Lean\nimport New.Main\n")
        for i,n in enumerate(["star_inequality","Data.short_forms","Data.enough_forms","Data.integral_forms_long"]):
            s+="\nrh_scan "+n+" limit 2000\nrh_prune "+n+" as CompactReduced"+str(i)+"\n"
        probe=w/"CompactPrune.lean";probe.write_text(s)
        rc=cmd(["lake","env","lean","--tstack=400000",probe],cwd=c,env=env,log=out/"prune.log",check=False).returncode
        dump(out/"prune_result.json",{"returncode":rc,"scope":"local binder candidates only; no caller replacement or global dependency deletion"})
        require(rc==0,"compact prune compatibility failed; graph evidence retained")
if __name__=="__main__": main()
