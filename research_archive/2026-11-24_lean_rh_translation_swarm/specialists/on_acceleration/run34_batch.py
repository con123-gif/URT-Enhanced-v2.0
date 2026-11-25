#!/usr/bin/env python3
"""Index and replay the exact native overlays in a prebuilt pinned RH checkout.
python3 run34_batch.py --swarm SWARM_ROOT --out OUTPUT --index-only
python3 run34_batch.py --swarm SWARM_ROOT --out OUTPUT --rh PINNED_RH_CHECKOUT
No default lake build or claimed Main theorem import. Native imports must be provisioned.
"""
import argparse, collections, hashlib, json, os, pathlib, re, subprocess, time
P=pathlib.Path
def need(ok,msg):
    if not ok: raise RuntimeError(msg)
def cmd(args,cwd):
    return subprocess.check_output(args,cwd=cwd,text=True).strip()
def main():
    ap=argparse.ArgumentParser();ap.add_argument("--swarm",type=P,required=True);ap.add_argument("--out",type=P,required=True);ap.add_argument("--rh",type=P);ap.add_argument("--index-only",action="store_true");a=ap.parse_args()
    j=json.loads(P(__file__).with_name("run34_batch_manifest.json").read_text());n=j["nodes"];out=a.out.resolve();out.mkdir(parents=True,exist_ok=True);w=out/"overlays";w.mkdir(exist_ok=True)
    audit={};reverse=collections.defaultdict(list);deg={};start=time.perf_counter()
    for m,v in n.items():
        data=(a.swarm/v["path"]).read_bytes()
        need(hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()==v["blob"],"blob mismatch "+m)
        deps=[];ax=[]
        for l in data.decode().splitlines():
            if re.match(r'^(?:public |private )?import\s',l):
                z=re.fullmatch(r'(?:public |private )?import\s+([A-Za-z0-9_.]+)\s*(?:--.*)?',l)
                need(z is not None,"unhandled import "+l);deps.append(z[1])
            if l.startswith("#print axioms "):ax.append(l[14:].strip())
        need(deps==v["imports"] and ax,"source graph/audit changed "+m)
        audit[m]=ax;deg[m]=0
        for d in deps:
            need(d not in {"Main","Statements","Supplements.Kernels.MainTheorems"},"forbidden direct import")
            need(not d.startswith("RH") or d in n,"unresolved overlay "+d)
            reverse[d].append(m)
            if d in n:deg[m]+=1
        (w/(m+".lean")).write_bytes(data)
    need(dict(reverse)==j["reverse"],"reverse graph mismatch")
    q=collections.deque(m for m in n if deg[m]==0);order=[]
    while q:
        m=q.popleft();order.append(m)
        for c in reverse[m]:
            deg[c]-=1
            if deg[c]==0:q.append(c)
    need(len(order)==len(n),"cycle")
    def closure(roots):
        s=set();q=list(roots);e=0
        while q:
            m=q.pop()
            if m in s:continue
            s.add(m)
            if m in n:
                d=n[m]["imports"];e+=len(d);q.extend(d)
        return s,e
    shared,e=closure(j["roots"]);union=set();ee=iv=0
    for m in j["roots"]:
        s,k=closure([m]);union|=s;ee+=k;iv+=len(s)
    need(shared==union,"missed direct dependency")
    need((len(shared),e,ee,iv)==tuple(j["metrics"][k] for k in ("direct_nodes","shared_edges","independent_edges","independent_visits")),"metric mismatch")
    report={"scope":"local overlay replay only; not actual caller integration or RH","index_wall_s":time.perf_counter()-start,"order":order,"nodes":{}}
    def save(): (out/"result.json").write_text(json.dumps(report,indent=2)+"\n")
    if a.index_only:report["status"]="INDEX_ONLY";save();return
    need(a.rh is not None,"--rh required");rh=a.rh.resolve()
    for path,pin in [(rh,j["pin"]),(rh/".lake/packages/mathlib",j["mathlib"])]:
        need(cmd(["git","rev-parse","HEAD"],path)==pin,"wrong pin "+str(path))
        need(not cmd(["git","status","--porcelain","--untracked-files=no"],path),"modified source "+str(path))
    version=cmd(["lake","env","lean","--version"],rh);need(j["lean"] in version and j["lean_commit"] in version,"wrong Lean")
    env=os.environ.copy();lp=cmd(["lake","env","printenv","LEAN_PATH"],rh)
    env["LEAN_PATH"]=str(w)+os.pathsep+os.pathsep.join(str((rh/P(x)).resolve()) if not P(x).is_absolute() else x for x in lp.split(os.pathsep) if x)
    lean=cmd(["lake","env","which","lean"],rh);report["lean"]=version;save()
    for m in order:
        dest=w/(m+".olean");dest.unlink(missing_ok=True)
        bad=[d for d in n[m]["imports"] if d in n and report["nodes"][d]["state"]!="KERNEL_CHECKED_LOCAL"]
        if bad:report["nodes"][m]={"state":"BLOCKED","by":bad};save();continue
        logpath=out/(m+".log");t=time.perf_counter()
        with logpath.open("w") as log:
            proc=subprocess.run([lean,"--root="+str(w),"--tstack=400000","-o",str(dest),str(w/(m+".lean"))],cwd=rh,env=env,stdout=log,stderr=subprocess.STDOUT)
        item={"state":"FAILED","blob":n[m]["blob"],"returncode":proc.returncode,"wall_s":time.perf_counter()-t}
        try:
            need(proc.returncode==0 and dest.is_file(),"compiler failed")
            log=logpath.read_text();need(not re.search(r'declaration uses .sorry.',log),"sorry warning")
            seen={}
            for l in log.splitlines():
                z=re.fullmatch(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",l.strip())
                if z:
                    ax=[v.strip() for v in (z[2] or "").split(",") if v.strip()]
                    need(z[1] not in seen or seen[z[1]]==ax,"conflicting axiom output");seen[z[1]]=ax
            for name in audit[m]:
                names=[s for s in seen if s==name or s.endswith("."+name)]
                need(len(names)==1,"missing/ambiguous audit "+name)
                need(set(seen[names[0]])<={"propext","Classical.choice","Quot.sound"},"unexpected axioms "+name)
            item["axioms"]=seen;item["scan_lines"]=[l for l in log.splitlines() if "ROOT_SCAN " in l or "PRUNED " in l];item["state"]="KERNEL_CHECKED_LOCAL"
        except Exception as exc:item["error"]=str(exc);dest.unlink(missing_ok=True)
        report["nodes"][m]=item;save()
    ok=all(v["state"]=="KERNEL_CHECKED_LOCAL" for v in report["nodes"].values())
    report["status"]="LOCAL_OVERLAYS_ONLY" if ok else "FAILED_OR_BLOCKED";save();need(ok,"candidate failure; inspect logs")
if __name__=="__main__":main()
