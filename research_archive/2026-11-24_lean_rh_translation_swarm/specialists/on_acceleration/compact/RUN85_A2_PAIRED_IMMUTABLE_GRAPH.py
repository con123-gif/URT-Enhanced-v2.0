#!/usr/bin/env python3
"""RUN85 — A2 paired immutable graph replay, 27 Nov 2026. PREPARED only.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Read live mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
87c621d0d18103ec2eb9be14bf774b8bff2a747d, ledger 600487957c8cff9ab77705c1441d0ef4559138ce,
protocol, handoff, expansion, peer B2/C2 graph receipts and A2 freeness queue.
Actual state receipt 07a2b14930c38095e6771ae9ed1a10a3cf1bf678 still ERROR
(run 46023465491, area cancellation), no subsequent A2 native receipt seen.
RUN84 orchestrator 46047119301 CANCELLED, not a proof execution result.
No duplicate cold build or protected workflow change.

Concrete new reduction of replay work: with RUN84 immutable naming the
original and new theorem values coexist. RUN82's separate original and
overlay exports are no longer necessary. For each independent candidate,
append the accepted 4.35 strict exporter to the generated proof file and
export original + replacement roots in the SAME kernel environment and
same invocation. Retain all type/value/projection/constructor/recursor
edges and root axiom evidence. The original and reduced subgraphs are
recoverable exactly by root-membership masks. For any root r, the old
frame is absent iff the old frame is not in Reach(r). A direct edge
removal is not this assertion: log a concrete shortest remaining path if
the old frame survives; do not filter it out. Original fallback MUST
survive in marked-only candidate's general leaf. The result measures
local dependencies, not complete root integration or a complexity gain
for arbitrary proof search.

Source checks actually executed using six authenticated connector blobs:
RUN84 generated marked and general modules; direct audit command rosters
7 and 12 respectively; 8/8 and 13/13 rejected damaged source anchors.
The graph pairing adapter below is prepared, not locally executed in Lean.
No new native PASS or URT speed claim. All live obligations remain open.

RESUME HERE: kernel/integration run this file on the already compiled
ORIGINAL compact workspace using --phase marked --workspace ROOT/grh-compact
--out OUT. If this succeeds, run separately with --phase general and new
OUT. Preserve error log or complete graph, and inspect the first old-frame
path (if any) before any further mathematical reduction. Do not schedule
a duplicate source build. Separate theta freeness/A1 fusion remains open.
HANDOFF TO kernel/integration/theta/audit.
"""
import argparse, hashlib, json, os, pathlib, re, subprocess, sys, time
from collections import deque

HERE=pathlib.Path(__file__).resolve().parent
SWARM=HERE.parents[2]
sys.path[:0]=[str(SWARM/"specialists/kernel_extractor"),str(SWARM/"integration")]
import RUN26_COMPACT_GRAPH as graph
import audit_active_b2_graph as peer

PIN="72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB="56a005855ea17e0b0958f73ec801ae140b0a1679"
FRAME="Parameters.exists_isTightFrame"
ZETA="Parameters.isTightFrame_zeta_pow"
SQUARE="Parameters.norm_jetSeries_le_from_square_frame_run78"
SPECIAL="Parameters.norm_jetSeries_le_prime_to_level_run78"
HELPER="Parameters.exists_punit_square_frame_run80"
GENERAL="Parameters.norm_jetSeries_le"
MARK="Data.IsGoodDatum.mem_raises"
INDEX="Data.exists_indexDvd_Bmu_divisible"
DVD="Parameters.mem_raises_of_dvd"
ALLOWED={"propext","Classical.choice","Quot.sound"}

def require(b,msg):
    if not b: raise RuntimeError(msg)

def blob(p):
    b=p.read_bytes()
    return hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()

def sha(p):
    with p.open("rb") as f: return hashlib.file_digest(f,"sha256").hexdigest()

def dump(p,x):
    p.write_text(json.dumps(x,indent=2,ensure_ascii=False)+"\n")

def fresh(n):
    return n+"_general_run84" if n==GENERAL else n+"_jet_run84"

def roots_for(phase):
    roots=[INDEX,fresh(INDEX),MARK,fresh(MARK),GENERAL]
    if phase=="general": roots += [fresh(GENERAL),DVD,fresh(DVD)]
    return roots

def paired_source(candidate,phase):
    for path,h in [
        (SWARM/"specialists/kernel_extractor/RUN26_COMPACT_GRAPH.py","775182e659d05a0b179813cc3063725df59e17bb"),
        (SWARM/"integration/audit_active_b2_graph.py","ccb8c306cdffc72464b0f01e70577b1811b6ffe0")]:
        require(blob(path)==h,"changed exporter input "+str(path))
    commands=re.findall(r"^run_cmd (jet84Leaf|jet84Transport) \x60([\w.]+) \x60([\w.]+)",candidate,re.M)
    leaves=[(a,b) for kind,a,b in commands if kind=="jet84Leaf"]
    transports=[(a,b) for kind,a,b in commands if kind=="jet84Transport"]
    require(len(leaves)==(1 if phase=="marked" else 2),"wrong leaf roster")
    require(len(transports)==(6 if phase=="marked" else 10),"wrong transport roster")
    require(len(set(a for _,a,b in commands))==len(commands) and
            all(b==fresh(a) for _,a,b in commands),"duplicate/wrong fresh name")
    roots=roots_for(phase)
    require(all((a,fresh(a)) in leaves+transports for a in roots
                if fresh(a) in roots),"paired root missing")
    graph.ROOTS=roots
    exporter=peer.adapt_exporter_435(graph.driver())
    require(exporter.count("import Main\n")==exporter.count("import Lean\n")==1,
            "changed exporter import anchors")
    tail=exporter.replace("import Main\n","",1).replace("import Lean\n","",1)
    combined=candidate+"\n"+tail
    require(not re.search(r"^import (?:Main|New\.Main)\b",combined,re.M),"forbidden RH root import")
    return combined,leaves,transports

def nid(n):
    return tuple(("s",p) for p in n.split("."))

def pretty(n):
    # retain tagged names in saved path; display is only a convenience
    return ".".join(str(c[1]) for c in n)

def paths_and_guards(stream,out,roots,phase):
    # Parse full graph once after independent verifier; never infer graph from source.
    adj={}; header=None
    with stream.open() as f:
        for line in f:
            row=json.loads(line)
            if row["record"]=="header": header=row
            elif row["record"] in ("node","missing"):
                require(row["record"]=="node","missing declaration in audited graph")
                adj[graph.nid(row["id"])]=graph.deps(row)
    require(header is not None,"missing header")
    ax={pretty(graph.nid(r["root"])):{pretty(graph.nid(a)) for a in r["lean_collect_axioms"]}
        for r in header["root_axioms"]}
    require(set(ax)==set(roots) and all(a<=ALLOWED for a in ax.values()),"axiom guard")
    # A single BFS per fixed root, not per watched supplier.
    watched=[FRAME,ZETA,SQUARE,SPECIAL,HELPER,GENERAL,MARK,
             fresh(MARK),fresh(GENERAL),"Data.IsGoodDatum.gaugeLe_one",
             fresh("Data.IsGoodDatum.gaugeLe_one")]
    data={}
    for root in roots:
        r=nid(root); parent={r:None}; q=deque([r])
        while q:
            v=q.popleft()
            for w in sorted(adj[v]):
                if w not in parent:
                    parent[w]=v; q.append(w)
        def witness(target):
            t=nid(target)
            if t not in parent: return None
            path=[]
            while t is not None:
                path.append(t); t=parent[t]
            return list(reversed(path))
        data[root]={"reachable_nodes":len(parent),"axioms":sorted(ax[root]),
                    "paths":{n:witness(n) for n in watched}}
    def has(r,n): return data[r]["paths"][n] is not None
    guards={
        "original_marked_frame":has(MARK,FRAME),
        "original_general_frame":has(GENERAL,FRAME),
        "marked_special":has(fresh(MARK),SPECIAL),
        "marked_square":has(fresh(MARK),SQUARE),
        "marked_zeta":has(fresh(MARK),ZETA),
        "index_new_marked":has(fresh(INDEX),fresh(MARK)),
        "index_new_special":has(fresh(INDEX),SPECIAL),
        "index_old_ordinary_retained" if phase=="marked" else "index_new_ordinary":
            has(fresh(INDEX),"Data.IsGoodDatum.gaugeLe_one" if phase=="marked" else fresh("Data.IsGoodDatum.gaugeLe_one")),
    }
    if phase=="general":
        guards.update({
            "general_new_frame":has(fresh(GENERAL),HELPER),
            "general_new_square":has(fresh(GENERAL),SQUARE),
            "index_new_general":has(fresh(INDEX),fresh(GENERAL)),
            "dvd_new_general":has(fresh(DVD),fresh(GENERAL)),
        })
    for old in roots:
        new=fresh(old)
        if new in roots: guards["no_new_axioms:"+old]=ax[new]<=ax[old]
    removal={r:not has(r,FRAME) for r in roots}
    dump(out/"paired_reachability.json",{"phase":phase,"root_data":data,
        "supplier_guards":guards,"old_frame_absent":removal,
        "local_removal_only":True,"full_RH_replay":False})
    require(all(guards.values()),"unexpected actual supplier path or axiom set")
    # Old frame surviving via an independent retained premise is a real
    # finding, not a graph error; never label that branch as deleted.
    return removal

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--phase",choices=["marked","general"],required=True)
    p.add_argument("--workspace",type=pathlib.Path,required=True)
    p.add_argument("--out",type=pathlib.Path,required=True)
    p.add_argument("--seconds",type=int,default=2400)
    p.add_argument("--prepare-only",action="store_true")
    a=p.parse_args()
    w=a.workspace.resolve(); out=a.out.resolve(); out.mkdir(parents=True,exist_ok=False)
    def head(path):
        return subprocess.check_output(["git","rev-parse","HEAD"],cwd=path,text=True).strip()
    require(head(w)==PIN,"wrong compact pin")
    subprocess.run(["git","diff","--exit-code",PIN,"--","src","lakefile.toml"],cwd=w,check=True)
    gen=HERE/"RUN84_A2_JET_IMMUTABLE_TRANSPORT.mjs"
    require(blob(gen)=="997bf10df019a25e218a87a5acf803c47e20a093","changed RUN84 generator")
    generated=out/"generated"
    subprocess.run(["node",str(gen),str(w.parent),str(generated)],check=True)
    manifest=json.loads((generated/"jet84_manifest.json").read_text())
    name="Jet84Marked" if a.phase=="marked" else "Jet84General"
    candidate=generated/(name+".lean")
    require(sha(candidate)==manifest["phases"][name]["sha256"],"candidate changed")
    combined,leaves,transports=paired_source(candidate.read_text(),a.phase)
    lean=out/"Jet85Paired.lean"; lean.write_text(combined)
    # Fail closed against missing or renamed actual caller anchors.
    neg=0
    for bad in [candidate.read_text().replace("run_cmd jet84Leaf ","--run_cmd jet84Leaf ",1),
                candidate.read_text().replace("run_cmd jet84Transport ","--run_cmd jet84Transport ",1),
                candidate.read_text()+"\nimport Main\n"]:
        try: paired_source(bad,a.phase)
        except RuntimeError: neg+=1
    require(neg==3,"negative pairing control accepted")
    record={"phase":a.phase,"compact":PIN,"mathlib":MATHLIB,"roots":roots_for(a.phase),
            "candidate_sha256":sha(candidate),"paired_source_sha256":sha(lean),
            "pairing_negative_controls":neg,"native_verified":False,"full_RH_replay":False}
    dump(out/"manifest.json",record)
    if a.prepare_only: return
    require(head(w/".lake/packages/mathlib")==MATHLIB,"wrong Mathlib pin")
    version=subprocess.check_output(["lake","env","lean","--version"],cwd=w,text=True)
    require("4.35.0" in version,"wrong Lean")
    record["version"]=version
    record["original_objects"]={n:sha(w/".lake/build/lib/lean"/n)
        for n in ["New/Curve/ConjugatesOfJets.olean","New/Columns/LocalStatement.olean"]}
    dump(out/"manifest.json",record)
    stream=out/"paired_graph.jsonl"
    env=dict(os.environ,CATHEDRAL_RH_GRAPH=str(stream))
    start=time.monotonic()
    try:
        with (out/"native.log").open("w") as f:
            cp=subprocess.run(["lake","env","lean","--tstack=400000",str(lean)],
                cwd=w,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=a.seconds)
        rc=cp.returncode
    except subprocess.TimeoutExpired:
        rc=124
    dump(out/"execution.json",{"returncode":rc,"seconds":time.monotonic()-start,
                              "full_RH_replay":False})
    require(rc==0,"native paired proof/export failed; retain logs and graph")
    log=(out/"native.log").read_text()
    for marker,expected in [("JET84_LEAF",leaves),("JET84_CHECKED",transports)]:
        actual=re.findall(marker+r"\|([\w.]+)",log)
        require(sorted(actual)==sorted(b for _,b in expected),"missing/duplicate native markers "+marker)
    graph.ROOTS=roots_for(a.phase)
    graph.audit_union(stream,out,out)
    removal=paths_and_guards(stream,out,graph.ROOTS,a.phase)
    record.update(native_verified=True,paired_graph_sha256=sha(stream),
                  old_frame_absent_by_root=removal,full_RH_replay=False)
    dump(out/"manifest.json",record)

if __name__=="__main__":
    main()
