#!/usr/bin/env python3
"""RUN99: replay combined count-escape finite-power conditional endpoint.
28 Nov 2026. PREPARED; no new native execution in originating session.
Credit Alpoge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity and current peer
integration 716292e8, editor a739d8b0, dependency 3e450708 and audit
9ccb174e. Do not repeat their reductions. This replay is the common
prerequisite for their later fiber and density-slack extensions.
RUN98 fixes P, eps, K, C per prime BEFORE x grows, with
(K+1)*eps <= epsilon/2; all five polar/data guards and quartic
scales survive. CountEscapeBudget is UNPROVED.

Actual RUN95 receipt b58fac802d12d1f3313fe5dc65ab06520577b841 reports
conditional kernel+graph success, arithmetic/definition bridge/full
RH flags false. Artifact 15247406689 (25964617 bytes) is not a retained
complete Lean/Mathlib workspace. Reuse the successful pinned RUN93
bootstrap once and compile RUN94, both independent peer modules,
then RUN98 before temp cleanup. No A/B/C build or Main import.
Attempt both peers independently; preserve first actual diagnostic.
Originating checks: four source blob identities, exact axiom rosters
(4,5,4,2), four unique guard markers, previous runner identity.
Local lean/lake absent. No new Lean, engine, graph or axiom PASS.
Atomic GitHub tree attempt failed (transient GraphQL error); use
ordinary contents writes if needed. Preserve all previous graphs.

RESUME HERE: retrieve compute/rh-compact-prime-count-budget-20261128/
outputs/run99_count_budget_receipt.json on cathedral-research-state.
Repair first failed stage from its actual compiler log, or if accepted
hand off common base stack and audited graph to fiber/density lanes.
Do not infer success from job labels or claim arithmetic closure.
HANDOFF integration/dependency/editor/kernel/audit. RH OPEN.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

import COMPACT_RUN95_STAR_GRID_REPLAY as prev
from COMPACT_RUN95_STAR_GRID_REPLAY import graph, audit, step, adapt_exporter_435
HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
SPECS = [
  [
    "Run94StarGrid",
    "specialists/prime_window/COMPACT_RUN94_NATIVE_WINDOW_STAR_GRID.lean",
    "bb5b6bb13884b9d161481e38da357d5fee9a10c8",
    "RUN94_STAR_GRID_GUARDS_OK",
    [
      "RHPrimeWindow94.eventually_primeError_on_set",
      "RHPrimeWindow94.endpoint_from_star_grid",
      "RHPrimeWindow94.principal_grid_from_star",
      "RHPrimeWindow94.zeta_line_from_star"
    ]
  ],
  [
    "IntegrationGuardedFinitePower",
    "integration/2026-11-28_GUARDED_FINITE_POWER_ENDPOINT.lean",
    "ff20a7853578c8e3672914710cadf25d98766140",
    "INTEGRATION97_GUARDED_FINITE_POWER_OK",
    [
      "RHIntegration97.finite_power_scalar",
      "RHIntegration97.eventually_primeError_on_set",
      "RHIntegration97.endpoint_from_budget",
      "RHIntegration97.principal_grid_from_budget",
      "RHIntegration97.zeta_line_from_budget"
    ]
  ],
  [
    "DepCountEscape82",
    "dependencies/compact/RUN82_COUNT_ESCAPE_NATIVE_SELECTOR.lean",
    "edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9",
    "RUN82_COUNT_ESCAPE_DIRECT_GUARDS_OK",
    [
      "RHDepCountEscape82.exists_twist_on_count_escape",
      "RHDepCountEscape82.entireL_ne_zero_on_count_escape",
      "RHDepCountEscape82.principal_right_from_count_escape_grid",
      "RHDepCountEscape82.zeta_line_from_count_escape_grid"
    ]
  ],
  [
    "Run98CountEscapeBudget",
    "specialists/prime_window/COMPACT_RUN98_COUNT_ESCAPE_BUDGET.lean",
    "b1572949fc9032a7b5de11f8ee8c451bc2a70bb6",
    "RUN98_COUNT_ESCAPE_BUDGET_GUARDS_OK",
    [
      "RHPrimeWindow98.count_escape_grid_from_budget",
      "RHPrimeWindow98.zeta_line_from_count_escape_budget"
    ]
  ]
]
ROOTS = [
    "RHPrimeWindow94.zeta_line_from_star",
    "RHIntegration97.endpoint_from_budget",
    "RHDepCountEscape82.zeta_line_from_count_escape_grid",
    "RHPrimeWindow98.zeta_line_from_count_escape_budget",
]

def checked_sources():
    graph.require(graph.git_blob((HERE/"COMPACT_RUN95_STAR_GRID_REPLAY.py").read_bytes())
                  == "9ad57a780b91c4511d76b934dfe589a04081efae", "RUN95 changed")
    for name, rel, sha, marker, roots in SPECS:
        src = SWARM/rel
        graph.require(graph.git_blob(src.read_bytes()) == sha, "changed "+name)
        txt = src.read_text()
        graph.require(re.findall(r"^#print axioms ([^\n]+)", txt, re.M) == roots,
                      "changed axiom roster "+name)
        graph.require(txt.count(marker) == 1, "changed marker "+name)
        graph.require(not re.search(r"^import (?:Main|New\.Main)\s*$", txt, re.M),
                      "forbidden root import "+name)

def stage(root, env, out, modules):
    state = {"compact": graph.PIN, "mathlib": graph.MATHLIB,
             "source_blobs": {m:s for m,_,s,_,_ in SPECS}, "roots": ROOTS,
             "stages": {}, "graph_checked": False, "negative_control_ok": False,
             "all_requested_checks_ok": False, "arithmetic_premise_proved": False,
             "original_definition_native_bridge_checked": False, "full_RH_replay": False}
    receipt = out/"run99_count_budget_receipt.json"
    def save():
        graph.dump(receipt, state)
    save()
    def run(label, argv, seconds):
        result = step(argv, root, env, out/(label+".log"), seconds)
        state["stages"][label] = result
        save()
        return result["returncode"]
    try:
        graph.require(graph.git_blob((root/"src/New/Data/DataExist.lean").read_bytes())
                      == prev.DATA_BLOB, "DataExist changed")
        graph.require(run("data_exist_build",["lake","build","+New.Data.DataExist:olean"],5400)==0,
                      "DataExist build failed")
        env = dict(env)
        env["LEAN_PATH"] = str(modules)+os.pathsep+subprocess.check_output(
            ["lake","env","printenv","LEAN_PATH"],cwd=root,env=env,text=True).strip()
        flags = ["lean","--tstack=400000","-Dpp.fullNames=true",
                 "-Ddebug.skipKernelTC=false","--root="+str(modules)]
        def compile_one(spec):
            name, rel, sha, marker, roots = spec
            src = modules/(name+".lean")
            obj = src.with_suffix(".olean")
            src.write_bytes((SWARM/rel).read_bytes())
            rc = run(name, flags+["-o",obj,src],2700)
            log = out/(name+".log")
            ax = audit(log, roots)
            ok = (rc==0 and obj.is_file() and ax["axiom_audit_ok"] and
                  marker in log.read_text(errors="replace"))
            state["stages"][name].update(axioms=ax, checked=ok)
            if ok:
                state["stages"][name]["olean_sha256"] = hashlib.sha256(obj.read_bytes()).hexdigest()
            save()
            return ok
        graph.require(compile_one(SPECS[0]), "RUN94 prerequisite failed")
        left = compile_one(SPECS[1])
        right = compile_one(SPECS[2])
        graph.require(left and right,"peer compile failed; inspect both logs")
        graph.require(compile_one(SPECS[3]),"RUN98 compile failed")
        neg = modules/"Run99OmittedBudget.lean"
        neg.write_text("import Run98CountEscapeBudget\n"
                       "example : RiemannZetaZerosOnLine := by\n"
                       "  exact RHPrimeWindow98.zeta_line_from_count_escape_budget\n")
        rc = run("run99_omitted_budget", flags+[neg],300)
        msg = (out/"run99_omitted_budget.log").read_text(errors="replace")
        state["negative_control_ok"] = (rc != 0 and "type mismatch" in msg.lower()
                                        and "CountEscapeBudget" in msg)
        save()
        graph.require(state["negative_control_ok"],"missing-premise control not specifically rejected")
        graph.ROOTS = ROOTS
        driver = graph.driver()
        graph.require(driver.count("import Main\n")==1,"changed exporter import")
        driver = adapt_exporter_435(driver.replace("import Main\n","import Run98CountEscapeBudget\n",1))
        gp=out/"Run99CountBudgetGraph.lean"
        gp.write_text(driver)
        stream=out/"prime_count_budget_graph.jsonl"
        env["CATHEDRAL_RH_GRAPH"]=str(stream)
        state["graph_source_blob"]=graph.git_blob(driver.encode())
        save()
        graph.require(run("run99_graph",["lean","--tstack=400000","-Dpp.fullNames=true","-j","2",gp],2700)==0,
                      "graph execution failed")
        state["graph_axioms"]=audit(out/"run99_graph.log",ROOTS)
        save()
        graph.require(state["graph_axioms"]["axiom_audit_ok"],"graph axiom failure")
        graph.audit_union(stream,out,out)
        required=["RHPrimeWindow98.CountEscapeBudget","RHDepCountEscape82.CountEscape",
                  "RHIntegration97.GuardedBudgetOn","RHIntegration97.endpoint_from_budget",
                  "RHDepCountEscape82.zeta_line_from_count_escape_grid",
                  "zero_density_quadTwist","exists_data","Data.run90Remainder_eq",
                  "IsPolar.exists_window_sub_mul_le"]
        banned=["New.grh","star_inequality","riemannHypothesis",
                "RHPrimeWindow94.StarGrid","RHPrimeWindow94.ClassStarGrid",
                "RHPrimeWindow90.TailGrid","RHPrimeWindow90.GoodGrid"]
        masks={}
        for line in (out/"root_membership.jsonl").open():
            row=json.loads(line)
            parts=row["id"]
            name=".".join(x[1] for x in parts) if all(x[0]=="s" for x in parts) else None
            if name in required+banned:
                masks[name]=row["root_mask"]
        guards={n+":new_present":bool(masks.get(n,0)&8) for n in required}
        guards.update({n+":new_absent":not bool(masks.get(n,0)&8) for n in banned})
        guards.update({n+":old_present":bool(masks.get(n,0)&1) for n in banned[3:5]})
        state.update(root_masks=masks,reachability_guards=guards,
                     graph_summary=json.loads((out/"union_summary.json").read_text()))
        with stream.open("rb") as f:
            state["graph_sha256"]=hashlib.file_digest(f,"sha256").hexdigest()
        save()
        graph.require(state["graph_summary"]["missing"]==0 and all(guards.values()),
                      "graph incomplete or reachability guard failed")
        state["graph_checked"]=True
        state["all_requested_checks_ok"]=True
        save()
    except Exception as exc:
        state["failure"]=str(exc)
        save()
        raise

if __name__=="__main__":
    checked_sources()
    code=prev.preflight()
    exec(code,{"__file__":str(prev.OLD),"__name__":"__main__","run95_stage":stage})
