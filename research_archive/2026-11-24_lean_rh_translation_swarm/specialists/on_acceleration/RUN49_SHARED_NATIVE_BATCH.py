#!/usr/bin/env python3
"""RUN49 / lane 14 / 26 Nov 2026. PREPARED, NOT NATIVE-EXECUTED.

Mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45 (26 Nov sprint and
mandatory engine), AGENTS, SWARM, HANDOFF, EXPANSION and current registry
read. Shared replay queue item 2, not another catalogue derivation.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.
Kernel lane owns the single job; do not register a competing job.
Run in the existing pinned toolchain + Mathlib cache environment:
  lake env python3 RUN49_SHARED_NATIVE_BATCH.py --source /pinned/rh \
     --mathlib /pinned/mathlib --out /new/output
Requires a checked-out upstream source tree, Node, Lean and its pinned
external dependencies available in LEAN_PATH. No network setup duplicated
inside this worker. A fresh output directory is mandatory. It builds the
union of local import closures once, then checks each candidate independently.
Reuse is limited to this run's original module context; alternative overlays
have separate paths. No reuse across different source or toolchain pins.

Observed: exact eight peer/engine blobs fetched and matched; three standalone
candidate headers contain 10 explicit import occurrences, six distinct.
This is not an elaborated dependency graph. Actual old CI status JSON:
45577239749 (98.87 s), 45576756833 (77.94 s), and current Landau absolute-value
repair job (277.66 s), all returncode 0; each log shows a separate Mathlib
cache download/decompression of 8690 files. These are historical wall times,
not a measured batch speedup. Latest Landau result is conditional only;
do not repeat that proof. Local lean/lake/elan absent and git DNS failed.
Native candidate compilation, memory and runtime improvement unmeasured.
Original candidate sources and prior graph/axiom ledgers preserved.

Original selected source path: CountI -> CorGK -> PropGK -> NumberU3U_s
-> KeepNumU -> CountQAlt / CountKAlt -> CountPAlt and native suppliers.
Alternatives: injective aggregate48; odd parity48 (conditional OddAtAux48);
rank3 slice20; even direct trace48 with original fallback. They are NOT
composed here: distinct premises and host witnesses require integration
and independent audit first. All four retain uniform quantitative CountP,
rank/level, arithmetic and geometric leaves. Source import graph below
is not proof-term closure; bounded native scans retain pending nodes.
No original source files changed. No Main or claimed RH root imported.
No URT ranking or speed claim; zero essential leaves closed this run.

RESUME HERE: kernel lane run this single batch using existing registry
runner, publish per-candidate logs/status and compare measured timings
against independent builds on identical pins. Fix first actual errors,
then integrate only compatible checked caller substitutions. Audit
common conjugation and uniform CountP separately. No duplicate runs.
HANDOFF TO kernel, audit, integration. RH OPEN.
"""
import argparse, hashlib, json, os, pathlib, re, shutil, subprocess, time

PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
MATH = "0df444a360eaa60ab8c11dca51a86af692955474"
PREFIX = "Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases."
FROB, KEEP = PREFIX+"FrobeniusTraceCountBoundOfCmEigensystemCount", PREFIX+"KeepNumU"
NS = "UpperTheory.GalN.V.Win.N."
BASE = pathlib.Path(__file__).resolve().parents[1]
FILES = {
 "aggregate": ("literature_provenance/RUN48_NATIVE_COUNTQ_AGGREGATION.lean","9305e6bafec896dd46e80fe056758d22edb9c0d9"),
 "parity": ("galois_representations/RUN48_ODD_SELF_TWIST_HALF_BOUND.lean","fec141e0ea3d718ab6510be8f165bfa547de6109"),
 "rank3": ("kernel_extractor/RUN20_RANK3_SLICE_JOINT_EXPONENT.lean","c7690d1be83523d4ec31cd8ebfde42971b936cc3"),
 "generator": ("on_acceleration/RUN48_EVEN_TRACE_CALLER_SPLICE.js","d612862abfddef9cfadb52f3fd06d177bee82c41"),
 "helper": ("on_acceleration/RUN47_EVEN_FROBENIUS_DIRECT_TRACE.lean","4f4ca000218a341f133231726c665461ccfe75d1"),
 "RHProofTermPrune": ("kernel_extractor/RHProofTermPrune.lean","f6d3e7f6047a7895ecf183be3fb54c203f4fc46a"),
 "RHRecursiveReductionFixed": ("kernel_extractor/RHRecursiveReductionFixed.lean","976c28572f11ffb00e1ae730555e938eeb564cb7"),
 "RHRecursiveReductionAutoV3": ("kernel_extractor/RHRecursiveReductionAutoV3.lean","a113dc56ea987abac3bf29eb480782140b82ab4a"),
}
ENGINES = [k for k in FILES if k.startswith("RH")]
ALLOWED = {"propext","Classical.choice","Quot.sound"}
NATIVE_BLOBS = {FROB:"1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40",KEEP:"a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7"}
def blob(b): return hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()
def rel(m): return pathlib.Path(*m.split(".")).with_suffix(".lean")
def head(p): return subprocess.check_output(["git","-C",str(p),"rev-parse","HEAD"],text=True).strip()
def require(ok, why):
    if not ok: raise RuntimeError(why)
def header(s):
    depth=0; deps=[]
    for line in s.splitlines():
        clean=[]; i=0
        while i<len(line):
            pair=line[i:i+2]
            if depth:
                if pair==" /-".strip(): depth+=1; i+=2
                elif pair=="-/": depth-=1; i+=2
                else: i+=1
            elif pair=="--": break
            elif pair=="/-": depth+=1; i+=2; clean.append(" ")
            else: clean.append(line[i]); i+=1
        t="".join(clean).strip()
        if not t or t in ("module","prelude"): continue
        m=re.fullmatch(r"(?:(?:public|private|meta)\s+)*import\s+([A-Za-z0-9_.]+)",t)
        if m: deps.append(m[1]); continue
        require(not re.match(r"(?:(?:public|private|meta)\s+)*import\b",t),"unhandled import: "+t)
        break
    require(depth==0,"unterminated header comment")
    return deps

def main():
    p=argparse.ArgumentParser(); p.add_argument("--source",type=pathlib.Path,required=True)
    p.add_argument("--mathlib",type=pathlib.Path,required=True);p.add_argument("--out",type=pathlib.Path,required=True)
    args=p.parse_args(); src=args.source.resolve()/"src"; out=args.out.resolve()
    require(head(args.source)==PIN and head(args.mathlib)==MATH,"source/toolchain pin mismatch")
    require(not subprocess.check_output(["git","-C",str(args.source),"status","--porcelain","--untracked-files=no"],text=True).strip(),"dirty pinned source")
    require(not subprocess.check_output(["git","-C",str(args.mathlib),"status","--porcelain","--untracked-files=no"],text=True).strip(),"dirty Mathlib")
    ver=subprocess.check_output(["lean","--version"],text=True)
    require("version 4.33.1" in ver and "819816b2e0a3" in ver,"Lean version mismatch")
    out.mkdir(parents=True,exist_ok=False)
    paths={k:BASE/v[0] for k,v in FILES.items()}
    for k,f in paths.items(): require(blob(f.read_bytes())==FILES[k][1],"peer blob changed "+k)
    for m,h in NATIVE_BLOBS.items(): require(blob((src/rel(m)).read_bytes())==h,"native blob changed "+m)
    shared=out/"original"; shared.mkdir(); engine=out/"engines";engine.mkdir()
    manifest={}; order=[]; visiting=set()
    forbidden={"Main","Supplements.Kernels.MainTheorems"}
    def visit(m):
        require(m not in forbidden,"claimed RH root import "+m)
        f=src/rel(m)
        if m in manifest or not f.is_file(): return
        require(m not in visiting,"source import cycle "+m)
        visiting.add(m); b=f.read_bytes(); deps=header(b.decode())
        for d in deps: visit(d)
        manifest[m]={"blob":blob(b),"imports":deps}
        order.append(m); visiting.remove(m)
    for k in ("aggregate","parity","rank3"):
        for m in header(paths[k].read_text()): visit(m)
    visit(FROB); visit(KEEP)
    (out/"original_import_graph.json").write_text(json.dumps({"pin":PIN,"mathlib":MATH,"lean":ver,"modules":manifest,"order":order},indent=2))
    ledger=[]; status={}; started=time.monotonic()
    envbase=os.environ.copy()
    def compile_file(f,root,target,label,extra=()):
        target.parent.mkdir(parents=True,exist_ok=True)
        log=out/(label+".log"); env=envbase.copy()
        env["LEAN_PATH"]=os.pathsep.join([str(x) for x in (*extra,engine,shared)]+[envbase.get("LEAN_PATH","")])
        t=time.monotonic()
        with log.open("w") as fp:
            res=subprocess.run(["lean","--root="+str(root),"-o",str(target),str(f)],cwd=root,env=env,stdout=fp,stderr=subprocess.STDOUT)
        elapsed=time.monotonic()-t; s=log.read_text(errors="replace")
        ax={}
        for line in s.splitlines():
            a=re.fullmatch(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)",line.strip())
            if a: ax[a[1]]=[v.strip() for v in (a[2] or "").split(",") if v.strip()]
        expected=re.findall(r"^#print axioms (\S+)\s*$",f.read_text(),re.M)
        # Every expected audit must appear (some in namespace are qualified).
        missing=[n for n in expected if n not in ax and not any(a.endswith("."+n) for a in ax)]
        bad={n:a for n,a in ax.items() if not set(a)<=ALLOWED}
        scans=[l for l in s.splitlines() if "ROOT_SCAN " in l or "PRUNED " in l or "NO_BINDER_REDUCTION " in l]
        requested=re.findall(r"^rh_scan (\S+) limit (\d+)\s*$",f.read_text(),re.M)
        absent=[n for n,lim in requested if not re.search(r"ROOT_SCAN root="+re.escape(n)+r" visited=\d+ values=\d+ noValue=\d+ axioms=\d+ missing=0 pending=\d+",s)]
        ok=(res.returncode==0 and not missing and not bad and not absent and not re.search(r"declaration uses .sorry.",s))
        ledger.append({"unit":label,"source_blob":blob(f.read_bytes()),"returncode":res.returncode,"seconds":elapsed,"status":"CHECKED_LOCAL" if ok else "FAILED","axioms":ax,"missing_audits":missing,"nonstandard_axioms":bad,"missing_scans":absent,"scans":scans,"log":log.name})
        (out/"ledger.json").write_text(json.dumps(ledger,indent=2))
        return ok
    for i,m in enumerate(order):
        if any(status.get(d) is False for d in manifest[m]["imports"]):
            status[m]=False;ledger.append({"unit":m,"status":"BLOCKED_BY_IMPORT"});continue
        status[m]=compile_file(src/rel(m),src,shared/rel(m).with_suffix(".olean"),"original_%06d"%i)
    engine_ok=True
    for k in ENGINES:
        f=engine/(k+".lean");shutil.copyfile(paths[k],f)
        engine_ok=compile_file(f,engine,f.with_suffix(".olean"),"engine_"+k) and engine_ok
    results={}
    def audit(root,mod,label,names,prune=None):
        f=root/"BatchAudit49.lean"
        txt="import "+mod+"\nimport RHProofTermPrune\n"
        for n in names: txt+="#print axioms "+n+"\nrh_scan "+n+" limit 2000\n"
        if prune: txt+="rh_prune "+prune+" as BatchPruned49\n"
        f.write_text(txt)
        ok=compile_file(f,root,f.with_suffix(".olean"),label+"_audit",(root,))
        if ok and prune:
            s=(out/(label+"_audit.log")).read_text()
            if "PRUNED "+prune+":" in s:
                g=root/"BatchBridge49.lean";g.write_text("import BatchAudit49\n#print axioms BatchPruned49\n#print axioms BatchPruned49.original\n")
                ok=compile_file(g,root,g.with_suffix(".olean"),label+"_bridge",(root,))
            elif "NO_BINDER_REDUCTION "+prune not in s: ok=False
        return ok
    for k,names in {
        "aggregate":[NS+"countQ_of_countP_aggregate48",NS+"numberU3U_of_prints48"],
        "parity":[NS+"countQ_alt48"],
        "rank3":[NS+"trace_rank3_slice20",NS+"numberU3U_of_prints20"]}.items():
        root=out/k; root.mkdir(); mod="Candidate49";f=root/(mod+".lean");shutil.copyfile(paths[k],f)
        if not engine_ok or any(status.get(d) is False for d in header(f.read_text())): results[k]="BLOCKED_BY_IMPORT"; continue
        ok=compile_file(f,root,f.with_suffix(".olean"),k,(root,))
        if ok: ok=audit(root,mod,k,names,names[0])
        results[k]="LOCAL_CHECKED_CONDITIONAL" if ok else "FAILED"
    # Original baseline is independent of alternatives, with identical named
    # caller scan limit; comparison is not a full transitive axiom closure.
    base=out/"baseline";base.mkdir()
    if engine_ok and status.get(KEEP):
        results["baseline"]="LOCAL_CHECKED" if audit(base,KEEP,"baseline",[NS+"countQ_alt",NS+"numberU3U_of_adm2A_imp_adm2B"],NS+"countQ_alt") else "FAILED"
    else: results["baseline"]="BLOCKED_BY_IMPORT"
    # Alternative even path is an isolated module overlay, not imported by
    # standalone candidates. Recompile only changed module and actual caller.
    even=out/"even"; generated=out/"even_generated"
    if not engine_ok or not status.get(KEEP) or not status.get(FROB):
        results["even"]="BLOCKED_BY_IMPORT"
    else:
        proc=subprocess.run(["node",str(paths["generator"]),str(args.source.resolve()),str(paths["helper"]),str(generated)],capture_output=True,text=True)
        (out/"even_generator.log").write_text(proc.stdout+proc.stderr)
        if proc.returncode: results["even"]="GENERATOR_FAILED"
        else:
            shutil.copytree(generated/"src",even)
            ok=True
            for m in (FROB,KEEP):
                f=even/rel(m)
                ok=compile_file(f,even,f.with_suffix(".olean"),"even_"+m.split(".")[-1],(even,))
                if not ok: break
            if ok: ok=audit(even,KEEP,"even",[NS+"countQ_even_alt48",NS+"frobenius_trace_count_bound_of_rat_eigensystem_count_mixed48",NS+"numberU3U_of_adm2A_imp_adm2B"],NS+"countQ_even_alt48")
            results["even"]="LOCAL_CHECKED_CONDITIONAL" if ok else "FAILED"
    (out/"ledger.json").write_text(json.dumps(ledger,indent=2))
    (out/"result.json").write_text(json.dumps({"status":"LOCAL_BATCH_ONLY_NOT_RH","results":results,"seconds":time.monotonic()-started,"source_modules":len(order),"original_module_compiles":sum("returncode" in l and l["unit"].startswith("original_") for l in ledger),"candidate_import_graphs":{k:header(paths[k].read_text()) for k in ("aggregate","parity","rank3")},"unresolved":["uniform CountPAlt","OddAtAux48","CountK3Slice20 independent supplier","all other arithmetic and geometric root leaves"],"cache_scope":"same-run pinned original only; isolated alternative overlays","warning":"bounded scan pending nodes retained; not full root or constructor-inclusive graph"},indent=2))
    return 0 if all(v.startswith("LOCAL_CHECKED") for v in results.values()) else 1
if __name__=="__main__": raise SystemExit(main())
