#!/usr/bin/env python3
"""RUN92 — 28 November 2026. PREPARED replay adapter; no new Lean execution.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, continuity, swarm, handoff, expansion and latest peer records read.
Peers: 77afc792 (minimal signed common star), 357b760d (finite C1
budget), 557eeda77 (conditional principal endpoint), 174e50d3 (A/B
family). Do not import old combined archimedean declarations concurrently
with C2SquaredStarMinimal; peer integration identified duplicate names.

Exact native C premises unchanged: one D, independent y, same index and
all-conjugate short bound, same fit family. Square first signed height and
multiply second: HeightLe(2a+2c,1), using r²r⁻²=1, gives a+c>=0 by
product formula, with b<=L. Exact original star retained as source
control, not upstream New.Main object. No new premise, no new theorem
proved here. C, C1/C3, A/B and full root closure remain distinct.

New replay adapter preserves RUN89 authentication and stages only
RUN91 C2SquaredStarMinimal. It exports six unique roots in ONE module:
arch pair, original and revised C, original-source and revised star.
Actual connector JS checked original star exact body, single C caller
substitution, six native C anchors, exact manifest and single stage
source hash; artifact API reports 15234434421 unexpired, 900881325 bytes,
outer SHA256 45b0ae825e3f7c58ee5f78e9178e60d906e20294afff1c6fc04650e5af47cd33.
No local lean/lake/gh; git ls-remote DNS failure. Existing protected
compute workflow does not expose an Actions-read credential in its
research step; official artifact download needs authenticated access.
Do not pass secrets in files or change protected workflow; no repeated
cold build. Archive not downloaded in this run. No new native scan,
prune, auto, graph or axiom result; no CI job claimed launched.

RESUME HERE: execute THIS adapter in the authenticated shared workspace:
python3 RUN92_C2_SQUARED_STAR_REPLAY.py --artifact EXTRACTED_ARTIFACT_DIR
  --compact-root PINNED_GRH_COMPACT --lean-bin PINNED_LEAN_BIN
  --out NEW_OUTPUT_DIR --extend-original
Read run92_squared_star_results.json and six_root_comparison.json.
If compile fails repair first actual diagnostic. On success select
C2SquaredStarMinimal at 77afc792 only after exact audit; use separately
accepted C1/finite-shell suppliers when available. HANDOFF TO integration/kernel/audit.
"""
import copy, hashlib, json, os, pathlib, re, subprocess, sys, tomllib, argparse
from pathlib import Path
import RUN89_C2_RESTORED_STAR_REPLAY as prior
from RUN89_C2_RESTORED_STAR_REPLAY import (
    SWARM, native, flatten_options, execute_graph, archive_before_audit,
    graph, DIRS, digest, need, check_module)
need(native.git_blob(Path(prior.__file__).read_bytes()) == "fc1b4358908e084085f15e5f1a0cd9328232ffa1", "RUN89 source changed")
M = copy.deepcopy(prior.M)
M["stages"] = [{
    "path":"specialists/character_boxes/RUN91_COMPACT_C2_SQUARED_STAR_MINIMAL.lean",
    "module":"C2SquaredStarMinimal", "guard":"RUN91_SQUARED_STAR:",
    "sha":"1bd5f9339e7a588439173ccb8be396f208cfb120", "probes":[
        "c2_isAlgebraic_of_arch","c2_heightLe_nonneg_arch",
        "Data.integral_forms_long","Data.run90_squared_witness_integral_forms_long",
        "run91_original_star_control","run91_squared_star_inequality"]}]
M["roots"] = list(M["stages"][0]["probes"])

def main():
    ap=argparse.ArgumentParser()
    for n in ("artifact","compact-root","lean-bin","out"): ap.add_argument("--"+n,type=Path,required=True)
    ap.add_argument("--extend-original",action="store_true")
    a=ap.parse_args()
    root, art, bin, out = (x.resolve() for x in (a.compact_root,a.artifact,a.lean_bin,a.out))
    out.mkdir(parents=True,exist_ok=False)
    state={"full_RH_replay":False,"human_assembly_verified":False,"all_requested_checks_ok":False,
           "new_Lean_execution":False,"steps":{},"input_manifest":M}
    def save(): native.dump(out/"run92_squared_star_results.json",state)
    save()
    env=os.environ.copy()
    env["PATH"]=str(bin)+os.pathsep+env["PATH"]
    env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
    def step(label, argv, timeout):
        receipt=native.step(argv,root,env,out/(label+".log"),timeout)
        state["steps"][label]=receipt
        save()
        need(receipt["returncode"]==0,"first failed phase: "+label)
        return receipt
    try:
        need(native.capture(["git","rev-parse","HEAD"],root)==M["pin"],"wrong compact pin")
        need(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")==M["mathlib"],"wrong mathlib")
        subprocess.run(["git","diff","--exit-code",M["pin"],"--","src","lakefile.toml"],cwd=root,check=True)
        version=native.capture([bin/"lean","--version"])
        need("4.35.0" in version and "eb6cafb7290e8bd5f2937522d8d804f58f02bafc" in version,"wrong compiler")
        cache=art/"native_c1_oleans.tar.zst"
        wrapper=art/"retained_cache_wrapper.json"
        need(native.git_blob(wrapper.read_bytes())==M["receipt_blobs"][0],"wrong cache receipt")
        need(cache.stat().st_size==M["cache_bytes"] and digest(cache)==M["cache_sha"],"wrong cache bytes")
        value=art/"c2_value_family"
        for path,sha in [(value/"earlier/interface_pipeline_results.json",M["receipt_blobs"][1]),
                         (value/"value_family_pipeline_results.json",M["receipt_blobs"][2]),
                         (value/"earlier/base/c2_replacement_results.json",M["receipt_blobs"][3])]:
            need(native.git_blob(path.read_bytes())==sha,"wrong retained receipt "+str(path))
        base=value/"earlier/base"
        check_module(base,M["base_module"],M["base_source"])
        dirs=[base]
        for d,q in zip(DIRS,M["chain"]):
            path=value/d
            check_module(path,q["compiled_module"],q["source_blob"])
            dirs.append(path)
        need(len(dirs)==13, "unexpected retained module roster")
        state["artifact_module_objects_authenticated"]=len(dirs)
        save()
        step("restore_original",["tar","--zstd","-xf",cache,"-C",root],900)
        original=root/".lake/build/lib/lean"
        for m in ("New/Selmer/FitTwistsExist","New/Selmer/ValueFamilies","New/Rows/Carrier"):
            need((original/(m+".olean")).is_file(),"missing original object "+m)
        missing=[m for m in ("New.Endgame.LongForms","New.Data.DataExist","Statements")
                 if not original.joinpath(*m.split(".")).with_suffix(".olean").is_file()]
        state["missing_original_modules"]=missing
        save()
        if missing:
            need(a.extend_original,"missing original imports; use --extend-original in shared workspace")
            step("extend_original",["lake","build",*["+"+m+":olean" for m in missing]],14400)
        setup=subprocess.check_output(["lake","env","python3","-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root,env=env,text=True,timeout=300)
        (out/"fresh_environment.log").write_text(setup)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        native_path=env["LEAN_PATH"]
        need(all(Path(x).exists() for x in native_path.split(os.pathsep) if x),"invalid fresh Lean path")
        lake=tomllib.loads((root/"lakefile.toml").read_text())
        opts=list(lake.get("moreLeanArgs",[]))+list(flatten_options(lake["leanOptions"]))
        for s in M["stages"]:
            raw=(SWARM/s["path"]).read_bytes()
            need(native.git_blob(raw)==s["sha"],"source changed "+s["module"])
            module=s["module"]
            dest=out/module
            dest.mkdir()
            src=dest/(module+".lean")
            src.write_bytes(raw)
            env["LEAN_PATH"]=os.pathsep.join([str(dest),*map(str,dirs),native_path])
            state["new_Lean_execution"]=True
            save()
            run=step(module,[bin/"lean",*opts,"-Dpp.fullNames=true","-Ddebug.skipKernelTC=false","-j","2","-R",dest,"-o",dest/(module+".olean"),src],3600)
            run.update(native.audit(out/(module+".log"),s["probes"]))
            run["guard_observed"]=s["guard"] in (out/(module+".log")).read_text()
            save()
            need(run["axiom_audit_ok"] and run["guard_observed"],"missing native evidence "+module)
            run["object_sha256"]=digest(dest/(module+".olean"))
            dirs.append(dest)
            save()
        env["LEAN_PATH"]=os.pathsep.join([*map(str,dirs),native_path])
        roots=M["roots"]
        need(len(set(roots))==6,"duplicate or missing graph roots")
        rawgraph=out/"six_root_graph.jsonl"
        result=execute_graph(value/"earlier/native_exporter",root,env,bin,
                             "C2SquaredStarMinimal",roots,rawgraph,out/"graph.log",5400)
        state["steps"]["graph_export"]=result
        save()
        need(result["returncode"]==0 and result["axiom_audit_ok"],"graph export/axioms failed")
        graph.ROOTS=roots
        packed=archive_before_audit(rawgraph)
        graph.audit_union(packed,out,out)
        summary=json.loads((out/"union_summary.json").read_text())
        need(summary["missing"]==0 and all(x["exit"]==0 for x in summary["per_root"].values()),
             "graph incomplete")
        wanted=set(roots)|{"exists_isFitFamily","c2_exists_isFitFamily","HeightLe.nonneg",
          "c2_heightLe_of_sq","c2_norm_map_le_exp_half","c2_heightLe_single_witness_budget",
          "HeightLe.pow","HeightLe.mul","HeightLe.mono","Data.exists_family_covolumeSq_le",
          "Data.finrank_rows_ne_zero","Data.heightLe_volume_rows","Data.heightLe_volume_ratio_sq",
          "Data.volume_iota_eq_prod_liftVolume","denominatorLe_rowBudget","log_product_formula",
          "isAlgebraic_of_padic"}
        watched={n:0 for n in wanted}
        with (out/"root_membership.jsonl").open() as f:
            for line in f:
                row=json.loads(line)
                if all(x[0]=="s" for x in row["id"]):
                    name=".".join(str(x[1]) for x in row["id"])
                    if name in wanted: watched[name]=row["root_mask"]
        def reaches(i,name): return bool(watched.get(name,0)&(1<<i))
        checks={name:reaches(i,name) for i,name in enumerate(roots)}
        checks["arch_algebraic"]=reaches(1,roots[0])
        checks["arch_product"]=reaches(1,"log_product_formula")
        for i in (2,3,4,5):
            for n in ("HeightLe.pow","HeightLe.mul","HeightLe.mono",
                      "Data.heightLe_volume_rows","Data.heightLe_volume_ratio_sq",
                      "Data.volume_iota_eq_prod_liftVolume"):
                checks[str(i)+":"+n]=reaches(i,n)
        for i in (2,4):
            checks[str(i)+":original_fit"]=reaches(i,"exists_isFitFamily")
            checks[str(i)+":original_nonneg"]=reaches(i,"HeightLe.nonneg")
        for i in (3,5):
            checks[str(i)+":new_fit"]=reaches(i,"c2_exists_isFitFamily")
            checks[str(i)+":new_arch"]=reaches(i,roots[1])
        for i in (4,5):
            for n in ("Data.exists_family_covolumeSq_le","Data.finrank_rows_ne_zero"):
                checks[str(i)+":"+n]=reaches(i,n)
        checks["original_C_in_original_star"]=reaches(4,roots[2])
        checks["new_C_in_new_star"]=reaches(5,roots[3])
        hist=summary["mask_histogram"]
        def delta(i,j):
            return {"only_left":sum(v for m,v in hist.items() if int(m)&(1<<i) and not int(m)&(1<<j)),
                    "only_right":sum(v for m,v in hist.items() if int(m)&(1<<j) and not int(m)&(1<<i))}
        comparisons={roots[i]+" -> "+roots[j]:delta(i,j) for i,j in [(2,3),(4,5)]}
        # Report all indirect paths (including old fit/nonneg) rather than assuming removal.
        native.dump(out/"six_root_comparison.json",{"checks":checks,"watched":watched,
           "comparisons":comparisons,"full_RH_replay":False,
           "original_star_source_control_not_upstream_object":True})
        need(all(checks.values()),"missing expected reachable supplier")
        state.update(all_requested_checks_ok=True,graph_receipt=summary)
        save()
    except Exception as exc:
        state["failure"]=str(exc); save(); raise

if __name__=="__main__": main()
