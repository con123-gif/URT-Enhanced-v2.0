#!/usr/bin/env python3
"""Use the original C1 build for the exact determinant-to-fit-family chain.

Authenticate the accepted C2 fragments, replay them against the already built
original workspace, then compile the prepared actual-consumer transport. Audit
all six original/new pairs in one constructor-inclusive union. No source build
is repeated here and no mathematical acceptance follows from preflight.
"""
import argparse
import json
from pathlib import Path
import re
import sys

import run_c2_determinant_shared_replay as earlier
import run_compact_b2_native_replay as native

HERE = Path(__file__).resolve().parent
DIRECT_GUARD_CONFIG = "b2c54dbe2b63a2ab04d0de0ee2e2634b3f64b03f"
DIRECT = [
    ("C2_DETERMINANT_FIXED_LINE.lean", "2bc7219f8db7e72f6cff11b4ac29c2f9a84ce261",
     "C2DeterminantFixedLine", "fixed_line_results.json", "C2_FIXED_LINE:",
     ["c2_det_polynomial_line"], []),
    ("C2_DETERMINANT_WEIL_ACTION.lean", "3f9228248dd81112be16a0f6e1b79170715683f0",
     "C2DeterminantWeilAction", "definite_weil_results.json", "C2_DEFINITE_WEIL:",
     ["c2_definite_weil_polynomial", "c2_weil_polynomial_covariance"], []),
    ("C2_DETERMINANT_CONTINUOUS_LINE.lean", "e70b65e517b843ab4f1ce6e438879e80463db998",
     "C2DeterminantContinuousLine", "continuous_line_results.json", "C2_CONTINUOUS_LINE:",
     ["c2_continuous_determinant_line"], [6, 7]),
    ("C2_DIRECT_REAL_MATCHING.lean", "aaec88856a302d40e1e501395da463f7a0f28d50",
     "C2DirectRealMatching", "direct_real_matching_results.json", "C2_DIRECT_REAL:",
     ["c2_empty_stacked_determinant", "c2_empty_matched_polynomial", "c2_direct_real_matching"], [6, 7, 8, 3]),
    ("C2_DIRECT_DETERMINANT_TRANSPORT.lean", "1c1c1a5370e06e831e900cae35cdc68cb0eebd37",
     "C2DirectDeterminantTransport", "direct_transport_results.json", "C2_DIRECT_TRANSPORT:",
     ["c2_direct_empty_matching", "c2_direct_stdClassSum_det_modKernel_eq",
      "c2_direct_stdClassSum_carrierXi_eq_carrierForm"], list(range(10))),
    ("C2_VALUE_FAMILY_TRANSPORT.lean", "7e912b212aa0a365106cca2e7a0c30a17eb65ff6",
     "C2ValueFamilyTransport", "value_family_results.json", "C2_VALUE_FAMILY:",
     ["Data.Pair.c2_exists_isIntegralMeasure", "c2_exists_isFamily",
      "c2_exists_mFoldTwist_selmerLengthLe", "c2_exists_isFitFamily"], list(range(11))),
]
ORIGINAL_SOURCES = {
    "New/Selmer/ValueFamilies.lean": "22b608a059e66ce3154e8e8e2d42d779cff0acad",
    "New/Selmer/TwistForRows.lean": "802242498ad4530e7f52cc4f14e0a03be2c59f4d",
    "New/Selmer/FitTwistsExist.lean": "da769eba595af2f883eed9b82dbd322a521aea14",
}


def preflight(out):
    out = Path(out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    previous = earlier.preflight(out / "earlier")
    sources = []
    for i, (filename, expected, module, receipt, guard, names, deps) in enumerate(DIRECT, 6):
        raw = (HERE / filename).read_bytes()
        native.require(native.git_blob(raw) == expected, "Changed C2 direct/value-family input: " + filename)
        code = re.sub(r"/-.*?-/", "", raw.decode(), flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        native.require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved input: " + filename)
        native.require(all(j < i for j in deps), "C2 continuation dependency cycle")
        native.require(guard in code and all("#print axioms " + n in code for n in names),
                       "Missing exact compiler guard or axiom probe: " + filename)
        sources.append({"source": filename, "source_blob": expected, "module": module,
                        "receipt": receipt, "guard": guard, "theorems": names, "dependencies": deps,
                        "prior_local_kernel_pass": i < 11})
    direct_config = (HERE / "C2_DIRECT_DETERMINANT_GRAPH.json").read_bytes()
    native.require(native.git_blob(direct_config) == DIRECT_GUARD_CONFIG,
                   "Changed accepted direct determinant guard roster")
    pairs = json.loads(direct_config)["pairs"]
    extra = [
        ("Data.Pair.exists_isIntegralMeasure", "Data.Pair.c2_exists_isIntegralMeasure",
         ["c2_direct_stdClassSum_det_modKernel_eq"], []),
        ("exists_isFamily", "c2_exists_isFamily",
         ["Data.Pair.c2_exists_isIntegralMeasure", "c2_direct_stdClassSum_det_modKernel_eq"],
         ["Data.Pair.exists_isIntegralMeasure"]),
        ("exists_mFoldTwist_selmerLengthLe", "c2_exists_mFoldTwist_selmerLengthLe",
         ["c2_exists_isFamily", "Data.Pair.c2_exists_isIntegralMeasure",
          "c2_direct_stdClassSum_det_modKernel_eq", "exists_anticyclotomic_twist"],
         ["exists_isFamily", "Data.Pair.exists_isIntegralMeasure"]),
        ("exists_isFitFamily", "c2_exists_isFitFamily",
         ["c2_exists_mFoldTwist_selmerLengthLe", "c2_exists_isFamily",
          "Data.Pair.c2_exists_isIntegralMeasure", "c2_direct_stdClassSum_det_modKernel_eq",
          "denominatorLe_rowBudget"],
         ["exists_mFoldTwist_selmerLengthLe", "exists_isFamily", "Data.Pair.exists_isIntegralMeasure"]),
    ]
    pairs += [{"original": a, "candidate": b, "required": required, "forbidden": forbidden}
              for a, b, required, forbidden in extra]
    config = out / "consumer_graph_config.json"
    native.dump(config, {"pairs": pairs})
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB,
                "earlier_inputs": previous, "direct_inputs": sources,
                "original_sources": ORIGINAL_SOURCES,
                "consumer_graph_config_blob": native.git_blob(config.read_bytes()),
                "graph_roots": 2 * len(pairs),
                "expected_supplier_guards": sum(3 + len(p["required"]) + len(p["forbidden"]) for p in pairs),
                "new_Lean_execution": False, "value_family_native_replay_completed": False,
                "full_RH_replay": False}
    native.dump(out / "value_family_input_manifest.json", manifest)
    return manifest


def run_in_built(root, lean_bin, cache_receipt, out, env):
    root, lean_bin, out = Path(root).resolve(), Path(lean_bin).resolve(), Path(out).resolve()
    manifest = preflight(out)
    for rel, expected in ORIGINAL_SOURCES.items():
        native.require(native.git_blob((root / "src" / rel).read_bytes()) == expected,
                       "Wrong original value-family source: " + rel)
    state = {**manifest, "steps": {}, "checked_interfaces": [],
             "all_requested_checks_ok": False, "human_assembly_verified": False,
             "native_source_build_performed_here": False}

    def save():
        native.dump(out / "value_family_pipeline_results.json", state)

    save()
    try:
        old_out = out / "earlier"
        old_state = {"compact": native.PIN, "mathlib": native.MATHLIB, "steps": {},
                     "checked_interfaces": [], "pipeline_checks_ok": False, "full_RH_replay": False}

        def save_old():
            native.dump(old_out / "interface_pipeline_results.json", old_state)

        state["new_Lean_execution"] = True
        save()
        earlier.replay_pipeline(root, lean_bin, cache_receipt, old_out,
                                env, native.step, old_state, save_old)
        native.require(old_state["pipeline_checks_ok"] is True, "Earlier exact C2 chain rejected")
        state["earlier_pipeline_checked"] = True
        base = old_out / "base"
        receipts = [old_out / stage[2] / stage[3] for stage in earlier.STAGES]
        for filename, expected, module, receipt, guard, names, deps in DIRECT:
            destination = out / module
            argv = [sys.executable, HERE / "replay_c2_standard_exchange.py",
                    "--compact-root", root, "--lean-bin", lean_bin, "--module-dir", base,
                    "--out", destination, "--source", HERE / filename, "--module-name", module,
                    "--receipt-name", receipt, "--guard", guard, "--seconds", "1800",
                    "--scope", "Shared C1-cache replay of exact determinant/family consumers; deep C1 inputs retained"]
            for name in names:
                argv += ["--theorem", name]
            for j in deps:
                argv += ["--dependency-receipt", receipts[j]]
            result = native.step(argv, root, env, out / (module + ".log"), 1860)
            state["steps"][module] = result
            save()
            native.require(result["returncode"] == 0, "Consumer phase rejected: " + module)
            path = destination / receipt
            checked = json.loads(path.read_text())
            native.require(checked["source_blob"] == expected and checked["all_requested_checks_ok"] is True,
                           "Consumer receipt rejected: " + module)
            receipts.append(path)
            state["checked_interfaces"].append(checked)
            save()
        argv = [sys.executable, HERE / "audit_c2_interface_graph.py",
                "--compact-root", root, "--lean-bin", lean_bin, "--base-module-dir", base,
                "--proof-receipt", receipts[-1], "--native-exporter-dir", old_out / "native_exporter",
                "--out", out / "consumer_graph", "--guard-config", out / "consumer_graph_config.json",
                "--seconds", "3600", "--archive-before-audit",
                "--scope", "Six exact old/new determinant, Carrier, measure, family, twist and fit pairs; C1 primitives retained; not RH"]
        for path in receipts[:-1]:
            argv += ["--dependency-receipt", path]
        result = native.step(argv, root, env, out / "consumer_graph.log", 4500)
        state["steps"]["consumer_graph"] = result
        save()
        native.require(result["returncode"] == 0, "Complete consumer graph rejected")
        summary = json.loads((out / "consumer_graph/interface_graph_summary.json").read_text())
        guards = json.loads((out / "consumer_graph/supplier_reachability.json").read_text())
        good = (len(summary["per_root"]) == manifest["graph_roots"] and summary["missing"] == 0
                and all(x["exit"] == 0 for x in summary["per_root"].values())
                and len(guards["guards"]) == manifest["expected_supplier_guards"]
                and guards["all_guards_pass"] is True and summary["all_supplier_guards_pass"] is True)
        native.require(good, "Complete consumer guard roster did not pass")
        state.update(graph_receipt=summary, all_requested_checks_ok=True,
                     value_family_native_replay_completed=True)
        save()
        return state
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--compact-root", type=Path)
    parser.add_argument("--lean-bin", type=Path)
    parser.add_argument("--cache-receipt", type=Path)
    args = parser.parse_args()
    if args.preflight:
        result = preflight(args.out)
        print(json.dumps({"authenticated_direct_inputs": len(DIRECT), "new_Lean_execution": False,
                          "graph_roots": result["graph_roots"],
                          "expected_supplier_guards": result["expected_supplier_guards"], "full_RH_replay": False}))
        return
    native.require(args.compact_root and args.lean_bin and args.cache_receipt,
                   "Provide the original built workspace, compiler and cache receipt")
    import os
    result = run_in_built(args.compact_root, args.lean_bin, args.cache_receipt, args.out, os.environ.copy())
    print(json.dumps({"all_requested_checks_ok": result["all_requested_checks_ok"], "full_RH_replay": False}))


if __name__ == "__main__":
    main()
