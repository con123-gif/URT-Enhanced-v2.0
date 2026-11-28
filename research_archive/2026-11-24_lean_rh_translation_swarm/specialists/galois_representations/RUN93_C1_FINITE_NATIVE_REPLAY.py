#!/usr/bin/env python3
"""RUN93 — focused artifact-backed C1 finite-budget replay, 28 Nov 2026.

PREPARED, not a new Lean receipt. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, protocol, handoff, expansion checked. Reuse the peer RUN89
authentication functions and exact 13-object roster, not its reciprocal
height/star compilation stages. No LongForms, DataExist or Statements
extension, no new mathematical hypothesis. Current shared queue has
prime-star-grid run 46102281476 in progress and 46102597741 pending; do not
launch another cold source build or interfere with those lanes.

Actual evidence this run: retrieved RUN92, original FitTwistsExist and
peer driver; connector JS checked 7 source conditions: identical row/twist
selection, identical post-budget consumer, all eight axiom probes, unique
marker, exact three imports, five distinct roots, original source blob.
All true. The archived C2 pipeline receipt 413058eacfda8683f5fb28c68148fd45d1bf1770
has actual exit 0 and accepted 12-root graph; original/C2 fit counts
193295/193265, zero missing. Artifact 15234434421 still unexpired,
900881325 bytes, SHA256 45b0ae825e3f7c58ee5f78e9178e60d906e20294afff1c6fc04650e5af47cd33.
Not downloaded in this run. Local lean/lake/elan/gh unavailable, git DNS
failed. No new native execution, rh_scan/prune/reduce/auto/frontier,
axiom or graph PASS. No new mathematical closure. The earlier C1 failure
and all original graphs remain evidence.

RESUME HERE: authorized shared native host, with artifact 15234434421
already extracted to the outputs directory and pinned compact checkout
with Mathlib cache:
  python3 RUN93_C1_FINITE_NATIVE_REPLAY.py --artifact /path/to/outputs \
    --compact-root /path/to/grh-compact --lean-bin /path/to/lean/bin \
    --out /fresh/external/run93
Require actual run93_receipt.json and graph logs, not a job label.
If failure, repair the first actual diagnostic only. If accepted, hand
exists_isFitFamily_finite_fused_run92 to the existing squared C caller.
No new compute job registered because the current protected queue does
not expose a cross-run authenticated artifact restore step to research
code; this driver requires an authorized artifact download in the shared
workspace. Do not edit workflows or repeat the cold build.
HANDOFF TO integration/kernel/audit and character boxes. RH OPEN.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import tomllib

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
PEER = SWARM / "specialists/character_boxes/RUN89_C2_RESTORED_STAR_REPLAY.py"
SOURCE = HERE / "RUN92_COMPACT_C1_FINITE_BUDGET_MINIMAL.lean"
SOURCE_BLOB = "850241aa06d82ee40d67b304db42c052e22ad862"
PEER_BLOB = "fc1b4358908e084085f15e5f1a0cd9328232ffa1"
ORIGINAL_BLOB = "da769eba595af2f883eed9b82dbd322a521aea14"
ROOTS = ["exists_isFitFamily", "c2_exists_isFitFamily",
         "fit_budget_finite_run92", "exists_isFitFamily_finite_late_run92",
         "exists_isFitFamily_finite_fused_run92"]
TAIL = "RHGaloisRun92.finite_prime_log_tail"
OLD = "exists_mFoldTwist_selmerLengthLe"
NEW = "c2_exists_mFoldTwist_selmerLengthLe"
DEN = "denominatorLe_rowBudget"
PROBES = ["RHGaloisRun92.finite_weighted_range",
          "RHGaloisRun92.finite_prime_weighted",
          "RHGaloisRun92.log_le_half_of_two_le", TAIL,
          *ROOTS[2:], ROOTS[1]]
MODULE = "C1FiniteBudgetMinimal"

def need(ok, why):
    if not ok:
        raise RuntimeError(why)

def blob(raw):
    return hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()

def preflight():
    need(blob(PEER.read_bytes()) == PEER_BLOB, "peer driver changed")
    raw = SOURCE.read_bytes()
    need(blob(raw) == SOURCE_BLOB, "RUN92 candidate changed")
    text = raw.decode()
    need(all("#print axioms "+n+"\n" in text for n in PROBES), "missing axiom probe")
    need(text.count('logInfo "RUN92_C1_MINIMAL_OK"') == 1, "missing/duplicate marker")
    need([x for x in text.splitlines() if x.startswith("import ")] ==
         ["import C2ValueFamilyTransport", "import New.Selmer.FitTwistsExist", "import Lean"],
         "unexpected import")
    need(len(set(ROOTS)) == 5 and len(set(PROBES)) == 8, "root/probe collision")
    return raw

def name(parts):
    return ".".join(str(x[1]) for x in parts) if all(x[0]=="s" for x in parts) else None

def graph_guards(masks, direct):
    def has(i, n): return bool(masks.get(n, 0) & (1 << i))
    g = {"root_"+str(i): has(i,n) for i,n in enumerate(ROOTS)}
    # Actual direct proof-value suppliers; do not conflate transitive aliases
    # with direct edges, or assert global absence from a local proof.
    for i, supplier in [(0,OLD),(1,NEW),(3,OLD),(4,NEW)]:
        n = ROOTS[i]
        g[n+":direct_twist"] = supplier in direct.get(n,set())
        g[n+":reachable_twist"] = has(i,supplier)
        g[n+":retained_denominator"] = has(i,DEN)
    for i in (3,4):
        n = ROOTS[i]
        g[n+":direct_budget"] = ROOTS[2] in direct.get(n,set())
        g[n+":reachable_tail"] = has(i,TAIL)
    g["budget:direct_tail"] = TAIL in direct.get(ROOTS[2],set())
    g["fused:no_direct_old_twist"] = OLD not in direct.get(ROOTS[4],set())
    g["late:no_direct_new_twist"] = NEW not in direct.get(ROOTS[3],set())
    g["fused:exact_direct_replacement"] = (
        direct.get(ROOTS[4],set()) == (direct.get(ROOTS[3],set())-{OLD})|{NEW})
    return g

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--preflight",action="store_true")
    for n in ("artifact","compact-root","lean-bin","out"):
        ap.add_argument("--"+n,type=Path)
    a=ap.parse_args()
    raw=preflight()
    if a.preflight:
        print(json.dumps({"source_checks":True,"source_blob":SOURCE_BLOB,
                          "new_Lean_execution":False,"full_RH_replay":False}))
        return
    need(all((a.artifact,a.compact_root,a.lean_bin,a.out)),"four paths required")
    art,root,bin,out=(x.resolve() for x in (a.artifact,a.compact_root,a.lean_bin,a.out))
    out.mkdir(parents=True,exist_ok=False)
    state={"candidate":SOURCE_BLOB,"peer":PEER_BLOB,"roots":ROOTS,
           "new_Lean_execution":False,"all_requested_checks_ok":False,
           "human_assembly_verified":False,"full_RH_replay":False,"steps":{}}
    def save(): (out/"run93_receipt.json").write_text(json.dumps(state,indent=2)+"\n")
    save()
    try:
        spec=importlib.util.spec_from_file_location("run93_checked_peer",PEER)
        peer=importlib.util.module_from_spec(spec)
        spec.loader.exec_module(peer)
        M,native=peer.M,peer.native
        env=os.environ.copy()
        env["PATH"]=str(bin)+os.pathsep+env["PATH"]
        env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
        def step(label,argv,seconds):
            r=native.step(argv,root,env,out/(label+".log"),seconds)
            state["steps"][label]=r; save()
            need(r["returncode"]==0,"first failed phase: "+label)
            return r
        need(native.capture(["git","rev-parse","HEAD"],root)==M["pin"],"wrong compact pin")
        need(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")==M["mathlib"],"wrong mathlib")
        subprocess.run(["git","diff","--exit-code",M["pin"],"--","src","lakefile.toml"],cwd=root,check=True)
        need(blob((root/"src/New/Selmer/FitTwistsExist.lean").read_bytes())==ORIGINAL_BLOB,"original source changed")
        version=native.capture([bin/"lean","--version"])
        need("4.35.0" in version and "eb6cafb7290e8bd5f2937522d8d804f58f02bafc" in version,"wrong compiler")
        cache=art/"native_c1_oleans.tar.zst"
        need(blob((art/"retained_cache_wrapper.json").read_bytes())==M["receipt_blobs"][0],"wrong cache receipt")
        need(cache.stat().st_size==M["cache_bytes"] and peer.digest(cache)==M["cache_sha"],"wrong cache bytes")
        value=art/"c2_value_family"
        for path,sha in [(value/"earlier/interface_pipeline_results.json",M["receipt_blobs"][1]),
                         (value/"value_family_pipeline_results.json",M["receipt_blobs"][2]),
                         (value/"earlier/base/c2_replacement_results.json",M["receipt_blobs"][3])]:
            need(blob(path.read_bytes())==sha,"wrong retained receipt "+str(path))
        base=value/"earlier/base"
        peer.check_module(base,M["base_module"],M["base_source"])
        dirs=[base]
        need(len(peer.DIRS)==len(M["chain"])==12,"wrong C2 object roster")
        for d,q in zip(peer.DIRS,M["chain"]):
            path=value/d
            peer.check_module(path,q["compiled_module"],q["source_blob"])
            dirs.append(path)
        state["artifact_module_objects_authenticated"]=len(dirs); save()
        step("restore_original",["tar","--zstd","-xf",cache,"-C",root],900)
        original=root/".lake/build/lib/lean"
        for m in ("New/Selmer/FitTwistsExist","New/Selmer/ValueFamilies","New/Rows/Carrier"):
            need((original/(m+".olean")).is_file(),"missing original object "+m)
        # No extension of original imports: this is only the fit-family frontier.
        setup=subprocess.check_output(["lake","env","python3","-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root,env=env,text=True,timeout=300)
        (out/"fresh_environment.log").write_text(setup)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        native_path=env["LEAN_PATH"]
        need(all(Path(x).exists() for x in native_path.split(os.pathsep) if x),"invalid fresh Lean path")
        lake=tomllib.loads((root/"lakefile.toml").read_text())
        opts=list(lake.get("moreLeanArgs",[]))+list(peer.flatten_options(lake["leanOptions"]))
        dest=out/MODULE; dest.mkdir()
        src=dest/(MODULE+".lean"); src.write_bytes(raw)
        env["LEAN_PATH"]=os.pathsep.join([str(dest),*map(str,dirs),native_path])
        state["new_Lean_execution"]=True; save()
        run=step("compile",[bin/"lean",*opts,"-Dpp.fullNames=true","-Ddebug.skipKernelTC=false",
            "-j","2","-R",dest,"-o",dest/(MODULE+".olean"),src],3600)
        run.update(native.audit(out/"compile.log",PROBES))
        run["marker_observed"]="RUN92_C1_MINIMAL_OK" in (out/"compile.log").read_text()
        save()
        need(run["axiom_audit_ok"] and run["marker_observed"],"missing native proof evidence")
        run["object_sha256"]=peer.digest(dest/(MODULE+".olean")); save()
        stream=out/"five_roots.jsonl"
        r=peer.execute_graph(value/"earlier/native_exporter",root,env,bin,MODULE,ROOTS,
                             stream,out/"graph.log",5400)
        state["steps"]["graph_export"]=r; save()
        need(r["returncode"]==0 and r["axiom_audit_ok"],"graph export/axioms failed")
        direct={}
        with stream.open() as f:
            for line in f:
                row=json.loads(line)
                if row["record"]=="node" and (n:=name(row["id"])) in ROOTS:
                    direct[n]={name(x) for x in row["value_constants"]}
        packed=peer.archive_before_audit(stream)
        graph=peer.graph; graph.ROOTS=ROOTS
        graph.audit_union(packed,out,out)
        summary=json.loads((out/"union_summary.json").read_text())
        need(summary["missing"]==0 and set(summary["per_root"])==set(ROOTS) and
             all(x["exit"]==0 for x in summary["per_root"].values()),"graph incomplete")
        masks={}
        watch=set(ROOTS+[TAIL,OLD,NEW,DEN])
        with (out/"root_membership.jsonl").open() as f:
            for line in f:
                row=json.loads(line)
                if (n:=name(row["id"])) in watch: masks[n]=row["root_mask"]
        guards=graph_guards(masks,direct)
        guards["old_fit_node_count_matches_saved"]=summary["per_root"][ROOTS[0]]["nodes"]==193295
        guards["c2_fit_node_count_matches_saved"]=summary["per_root"][ROOTS[1]]["nodes"]==193265
        hist=summary["mask_histogram"]
        def delta(i,j):
            return {"only_left":sum(v for m,v in hist.items() if int(m)&(1<<i) and not int(m)&(1<<j)),
                    "only_right":sum(v for m,v in hist.items() if int(m)&(1<<j) and not int(m)&(1<<i))}
        native.dump(out/"five_root_comparison.json",{
            "guards":guards,"watched":masks,
            "direct":{k:sorted(x for x in v if x is not None) for k,v in direct.items()},
            "comparisons":{ROOTS[i]+" -> "+ROOTS[j]:delta(i,j) for i,j in [(0,1),(0,3),(1,4),(3,4)]},
            "full_RH_replay":False})
        state["graph_receipt"]=summary; state["guards"]=guards; save()
        need(all(guards.values()),"missing expected reachable supplier or original graph mismatch")
        state["all_requested_checks_ok"]=True; save()
    except Exception as exc:
        state["failure"]=str(exc); save(); raise

if __name__=="__main__": main()
