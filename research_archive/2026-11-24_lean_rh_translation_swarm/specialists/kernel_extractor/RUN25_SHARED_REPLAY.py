#!/usr/bin/env python3
"""Lane 11 RUN25, 26 Nov 2026. PREPARED native replay, not a proof.
Derived from lane 14 RUN49_SHARED_NATIVE_BATCH.py blob 53565fe6e9051559d48f20ef79a9999d7df90d31.
One shared pinned build for prime descent (queue 1) then CountQ/CountK
(queue 2). Prime results written before the larger catalogue closure.
No Main imports. Evidence only, no global dependency removal.
"""
import argparse, hashlib, json, os, pathlib, re, shutil, subprocess, time

PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
MATH = "0df444a360eaa60ab8c11dca51a86af692955474"
PREFIX = "Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases."
FROB, KEEP = PREFIX+"FrobeniusTraceCountBoundOfCmEigensystemCount", PREFIX+"KeepNumU"
NS = "UpperTheory.GalN.V.Win.N."
BASE = pathlib.Path(__file__).resolve().parents[1]
FILES = {
 "prime_audit": ("../audit/RUN49_PRIME_DESCENT_ALL_TORSION_LEVELS.lean","f3cf9cdd1beaee34ea9f7d9a322121637675652f"),
 "prime_structure": ("../structure/2026-11-26_RUN42_COFINAL_CANONICAL_SHA.lean","65c60d883c8892e751ed258ab286df3557b31c3d"),
 "prime_caller": ("../integration/2026-11-26_PRIME_DESCENT_COFINAL_SHA.lean","84849c825f18601e78402c9f0e3cdb0381a12aa6"),
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
    p.add_argument("--mathlib",type=pathlib.Path,required=True);p.add_argument("--out",type=pathlib.Path,required=True);p.add_argument("--build",type=pathlib.Path,required=True)
    args=p.parse_args(); src=args.source.resolve()/"src"; out=args.out.resolve()
    require(head(args.source)==PIN and head(args.mathlib)==MATH,"source/toolchain pin mismatch")
    require(not subprocess.check_output(["git","-C",str(args.source),"status","--porcelain","--untracked-files=no"],text=True).strip(),"dirty pinned source")
    require(not subprocess.check_output(["git","-C",str(args.mathlib),"status","--porcelain","--untracked-files=no"],text=True).strip(),"dirty Mathlib")
    ver=subprocess.check_output(["lean","--version"],text=True)
    require("version 4.33.1" in ver and "819816b2e0a3" in ver,"Lean version mismatch")
    out.mkdir(parents=True,exist_ok=True)
    build=args.build.resolve();build.mkdir(parents=True,exist_ok=False)
    require(not (out/"ledger.json").exists(),"refuse to overwrite previous evidence")
    paths={k:BASE/v[0] for k,v in FILES.items()}
    for k,f in paths.items(): require(blob(f.read_bytes())==FILES[k][1],"peer blob changed "+k)
    for m,h in NATIVE_BLOBS.items(): require(blob((src/rel(m)).read_bytes())==h,"native blob changed "+m)
    shared=build/"original"; shared.mkdir(); engine=build/"engines";engine.mkdir()
    manifest={}; order=[]; visiting=set()
    forbidden={"Main","Supplements.Kernels.MainTheorems"}
    def visit(m):
        require(m not in forbidden,"claimed RH root import "+m)
        f=src/rel(m)
        if m in manifest: return
        if not f.is_file():
            require(m.split(".")[0] in {"Mathlib","Lean","Init","Std","Batteries","Aesop","Qq","ProofWidgets","ImportGraph","Plausible","LeanSearchClient","Cli"}, "missing pinned module: "+m)
            return
        require(m not in visiting,"source import cycle "+m)
        visiting.add(m); b=f.read_bytes(); deps=header(b.decode())
        for d in deps: visit(d)
        manifest[m]={"blob":blob(b),"imports":deps}
        order.append(m); visiting.remove(m)
    def persist_graph():
        (out/"original_import_graph.json").write_text(json.dumps({"pin":PIN,"mathlib":MATH,"lean":ver,"modules":manifest,"order":order},indent=2))
    ledger=[]; status={}; started=time.monotonic()
    envbase=os.environ.copy()
    def compile_file(f,root,target,label,extra=(),native=False):
        target.parent.mkdir(parents=True,exist_ok=True)
        log=out/(label+".log"); env=envbase.copy()
        env["LEAN_PATH"]=os.pathsep.join([str(x) for x in (*extra,engine,shared)]+[envbase.get("LEAN_PATH","")])
        t=time.monotonic()
        with log.open("w") as fp:
            opts=["--tstack=400000","-DautoImplicit=false","-DrelaxedAutoImplicit=false","-DmaxSynthPendingDepth=3","-Dpp.unicode.fun=true","-DmaxHeartbeats=4000000"] if native else []
            res=subprocess.run(["lean",*opts,"--root="+str(root),"-o",str(target),str(f)],cwd=root,env=env,stdout=fp,stderr=subprocess.STDOUT)
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
        absent=[]
        for n,lim in requested:
            hits=re.findall(r"ROOT_SCAN root="+re.escape(n)+r" visited=(\d+) values=(\d+) noValue=(\d+) axioms=(\d+) missing=(\d+) pending=(\d+)",s)
            if len(hits)!=1: absent.append(n); continue
            v,val,nv,a,miss,pending=map(int,hits[0])
            if not (0<v<=int(lim) and v==val+nv and miss==0): absent.append(n)
        ok=(res.returncode==0 and not missing and not bad and not absent and not re.search(r"declaration uses .sorry.",s))
        ledger.append({"unit":label,"source_blob":blob(f.read_bytes()),"returncode":res.returncode,"seconds":elapsed,"status":"CHECKED_LOCAL" if ok else "FAILED","axioms":ax,"missing_audits":missing,"nonstandard_axioms":bad,"missing_scans":absent,"scans":scans,"log":log.name})
        (out/"ledger.json").write_text(json.dumps(ledger,indent=2))
        return ok
    def build_original(targets):
        for m in targets: visit(m)
        persist_graph()
        for i,m in enumerate(order):
            if m in status: continue
            if any(status.get(d) is False for d in manifest[m]["imports"]):
                status[m]=False;ledger.append({"unit":m,"status":"BLOCKED_BY_IMPORT"})
                (out/"ledger.json").write_text(json.dumps(ledger,indent=2));continue
            status[m]=compile_file(src/rel(m),src,shared/rel(m).with_suffix(".olean"),"original_%06d"%i,native=True)
    engine_ok=True
    for k in ENGINES:
        f=engine/(k+".lean");shutil.copyfile(paths[k],f)
        engine_ok=compile_file(f,engine,f.with_suffix(".olean"),"engine_"+k) and engine_ok
    results={}
    def save_results():
        (out/"partial_results.json").write_text(json.dumps(results,indent=2))
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
    # Prime descent first, using the exact prepared cofinal caller, not the competing higher-twist route.
    prime=build/"prime";prime.mkdir()
    prime_names={"prime_audit":"RHAuditPrimeDescent49","prime_structure":"RHStructureCofinal42","prime_caller":"RHIntegrationPrime50"}
    local=set(prime_names.values())|set(ENGINES)
    build_original([m for k in prime_names for m in header(paths[k].read_text()) if m not in local])
    prime_status={}
    for k,mod in prime_names.items():
        f=prime/(mod+".lean");shutil.copyfile(paths[k],f)
        if not engine_ok or any(status.get(d) is False or prime_status.get(d) is False for d in header(f.read_text())):
            prime_status[mod]=False;results[k]="BLOCKED_BY_IMPORT";save_results();continue
        ok=compile_file(f,prime,f.with_suffix(".olean"),k,(prime,))
        if ok:
            # Audit every actual generated bridge, not only an illustrative declaration.
            log=(out/(k+".log")).read_text();commands=[]
            for root,dst in re.findall(r"^rh_prune (\S+) as (\S+)\s*$",f.read_text(),re.M):
                hits=re.findall(r"PRUNED "+re.escape(root)+r": (\d+) -> (\d+) binders; original bridge checked",log)
                none=re.findall(r"NO_BINDER_REDUCTION "+re.escape(root)+r"(?:\s|$)",log)
                if len(hits)+len(none)!=1: ok=False;break
                if hits:
                    a,b=map(int,hits[0]);ok=ok and b<a
                    commands.extend(["#print axioms "+dst,"#print axioms "+dst+".original"])
            if ok and commands:
                g=prime/("Bridge_"+mod+".lean");g.write_text("import "+mod+"\n"+"\n".join(commands)+"\n")
                ok=compile_file(g,prime,g.with_suffix(".olean"),k+"_bridges",(prime,))
        prime_status[mod]=ok;results[k]="LOCAL_CHECKED_CONDITIONAL" if ok else "FAILED";save_results()
    # Queue 2 reuses the exact same original module cache; no second toolchain setup.
    build_original([m for k in ("aggregate","parity","rank3") for m in header(paths[k].read_text()) if m not in ENGINES]+[FROB,KEEP])
    for k,names in {
        "aggregate":[NS+"countQ_of_countP_aggregate48",NS+"numberU3U_of_prints48"],
        "parity":[NS+"countQ_alt48"],
        "rank3":[NS+"trace_rank3_slice20",NS+"numberU3U_of_prints20"]}.items():
        root=build/k; root.mkdir(); mod="Candidate49";f=root/(mod+".lean");shutil.copyfile(paths[k],f)
        if not engine_ok or any(status.get(d) is False for d in header(f.read_text())): results[k]="BLOCKED_BY_IMPORT"; continue
        ok=compile_file(f,root,f.with_suffix(".olean"),k,(root,))
        if ok: ok=audit(root,mod,k,names,names[0])
        results[k]="LOCAL_CHECKED_CONDITIONAL" if ok else "FAILED"
    # Original baseline is independent of alternatives, with identical named
    # caller scan limit; comparison is not a full transitive axiom closure.
    save_results()
    base=build/"baseline";base.mkdir()
    if engine_ok and status.get(KEEP):
        results["baseline"]="LOCAL_CHECKED" if audit(base,KEEP,"baseline",[NS+"countQ_alt",NS+"numberU3U_of_adm2A_imp_adm2B"],NS+"countQ_alt") else "FAILED"
    else: results["baseline"]="BLOCKED_BY_IMPORT"
    # Alternative even path is an isolated module overlay, not imported by
    # standalone candidates. Recompile only changed module and actual caller.
    save_results()
    even=build/"even"; generated=build/"even_generated"
    if not engine_ok or not status.get(KEEP) or not status.get(FROB):
        results["even"]="BLOCKED_BY_IMPORT"
    else:
        proc=subprocess.run(["node",str(paths["generator"]),str(args.source.resolve()),str(paths["helper"]),str(generated)],capture_output=True,text=True)
        (out/"even_generator.log").write_text(proc.stdout+proc.stderr)
        if proc.returncode: results["even"]="GENERATOR_FAILED"
        else:
            shutil.copytree(generated/"src",even)
            # Retain exact overlay sources, not gigabytes of build products.
            shutil.copytree(generated/"src",out/"even_overlay_source",ignore=shutil.ignore_patterns("*.olean*","*.ilean"))
            ok=True
            for m in (FROB,KEEP):
                f=even/rel(m)
                ok=compile_file(f,even,f.with_suffix(".olean"),"even_"+m.split(".")[-1],(even,),native=True)
                if not ok: break
            if ok: ok=audit(even,KEEP,"even",[NS+"countQ_even_alt48",NS+"frobenius_trace_count_bound_of_rat_eigensystem_count_mixed48",NS+"numberU3U_of_adm2A_imp_adm2B"],NS+"countQ_even_alt48")
            results["even"]="LOCAL_CHECKED_CONDITIONAL" if ok else "FAILED"
    (out/"ledger.json").write_text(json.dumps(ledger,indent=2))
    save_results()
    (out/"result.json").write_text(json.dumps({"status":"LOCAL_BATCH_ONLY_NOT_RH","results":results,"seconds":time.monotonic()-started,"source_modules":len(order),"original_module_compiles":sum("returncode" in l and l["unit"].startswith("original_") for l in ledger),"candidate_import_graphs":{k:header(paths[k].read_text()) for k in (*prime_names,"aggregate","parity","rank3")},"unresolved":["PrimeDescent49 normalization","CofinalFew50 on same canonical layers","uniform base SelL cardinal and torsion P","uniform CountPAlt","OddAtAux48","CountK3Slice20 independent supplier","all other arithmetic and geometric root leaves"],"cache_scope":"same-run pinned original only; isolated alternative overlays","warning":"bounded scan pending nodes retained; not full root or constructor-inclusive graph"},indent=2))
    expected={"prime_audit","prime_structure","prime_caller","aggregate","parity","rank3","baseline","even"}
    return 0 if set(results)==expected and all(v.startswith("LOCAL_CHECKED") for v in results.values()) else 1
if __name__=="__main__": raise SystemExit(main())
