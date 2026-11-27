#!/usr/bin/env python3
"""Check consistency of saved B2/C2 compiler and local graph audit receipts.

This is a regression guard for the evidence package. It does not execute
Lean, re-extract the large graphs, or establish any remaining RH premise.
"""
import hashlib
import json
from pathlib import Path
import re
from compare_complete_graph_exports import validate_execution_modes

HERE = Path(__file__).resolve().parent
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
AXIOMS = {"propext", "Classical.choice", "Quot.sound"}


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def read(folder, name):
    return json.loads((HERE / folder / name).read_text())


def checked_interface_receipt(folder, filename, current_source):
    """Validate saved compiler evidence, not a proof or object re-execution."""
    proof = read(folder, filename)
    compiler = proof["compiler"]
    require(proof["compact"] == PIN and proof["mathlib"] == MATHLIB,
            "Wrong interface pins")
    require(proof["all_requested_checks_ok"] is True and compiler["returncode"] == 0
            and compiler["axiom_audit_ok"] is True
            and compiler["direct_supplier_guards_observed"] is True,
            "Unaccepted interface compiler receipt")
    module = proof["compiled_module"]
    raw = (HERE / folder / (module["name"] + ".lean")).read_bytes()
    blob = hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()
    require(blob == proof["source_blob"] and raw == (HERE / current_source).read_bytes(),
            "Changed accepted interface source")
    log = (HERE / folder / "compile.log").read_text()
    require("sorryAx" not in log and "error:" not in log, "Rejected interface log")
    require(set(proof["theorems"]) == set(compiler["axioms"]), "Incomplete interface axiom roster")
    for name, axes in compiler["axioms"].items():
        require(set(axes) <= AXIOMS and ("'" + name + "'") in log,
                "Missing/untrusted interface axiom report")
    require(module["artifacts"] and all(x["bytes"] > 0 and
            re.fullmatch(r"[0-9a-f]{64}", x["sha256"]) for x in module["artifacts"]),
            "Missing checked-object digest metadata")
    return module["name"]


def checked_interface_graph(folder, nodes, edges, guards_expected):
    """Check exact saved inventories and all independent per-root verdicts."""
    union = read(folder, "interface_graph_summary.json")
    guards = read(folder, "supplier_reachability.json")
    inputs = read(folder, "input_manifest.json")
    execution = read(folder, "graph_execution.json")
    require(union["roots"] == inputs["roots"] and len(union["roots"]) == 4
            and union["nodes"] == nodes and union["edges"] == edges and union["missing"] == 0,
            "Changed interface graph inventory")
    require(guards["all_guards_pass"] is True and len(guards["guards"]) == guards_expected
            and all(value is True for value in guards["guards"].values()), "Incomplete interface graph guards")
    require(execution["returncode"] == 0 and execution["axiom_audit_ok"] is True
            and execution["native_graph_execution"] is True and execution["new_Lean_execution"] is False
            and set(execution["axioms"]) == set(union["roots"]), "Wrong interface graph execution provenance")
    for i, name in enumerate(union["roots"]):
        audit = read(folder, "audit-" + str(i) + ".json")
        require(union["per_root"][name]["exit"] == 0
                and audit["nodes"] == union["per_root"][name]["nodes"]
                and audit["status"] == "REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT",
                "Interface root verifier did not pass")
        require(all(audit[k] == 0 for k in ["missing", "bodyMissing", "collectorUnresolved"])
                and not any(audit[k] for k in ["absent", "unexpected", "structuralOnlyAxioms",
                    "nonstandardAxioms", "unsafeOrPartialNodes", "sorryAxInBuiltin", "sorryAxInStructuralClosure"])
                and set(execution["axioms"][name]) <= AXIOMS, "Interface graph trust discrepancy")
    archive = read(folder, "graph_archive_receipt.json")
    require(archive["decompressed_sha256_verified"] is True
            and archive["raw_bytes"] > archive["archive_bytes"] > 0
            and all(re.fullmatch(r"[0-9a-f]{64}", archive[k]) for k in ["raw_sha256", "archive_sha256"]),
            "Incomplete exact graph archive receipt")
    require(union["full_RH_replay"] is False and execution["full_RH_replay"] is False,
            "Interface graph mislabelled as whole RH")
    return {"folder": folder, "roots": 4, "nodes": nodes}


def main():
    folder = "2026-11-27_c2_third_native_receipt"
    replay = read(folder, "c2_replacement_results.json")
    require(replay["compact"] == PIN and replay["mathlib"] == MATHLIB, "Wrong C2 source pins")
    require(replay["all_requested_checks_ok"] is True and
            replay["caller_replacement_checked"] is True and
            replay["carrier_propagation_checked"] is True and
            replay["all_five_type_and_dependency_guards_observed"] is True, "Incomplete C2 replay")
    raw = (HERE / folder / "C2Combined.lean").read_bytes()
    blob = hashlib.sha1(("blob " + str(len(raw)) + "\0").encode() + raw).hexdigest()
    require(blob == replay["combined_source_blob"] ==
            "aba46120ca4118decd864f817b51bcca2bc31c19", "Changed checked C2 source")
    compiler_log = (HERE / folder / "compile.log").read_text()
    require("sorryAx" not in compiler_log and "error:" not in compiler_log, "Failed compiler log")
    for stage, count in [("c2_candidate", 2), ("c2_propagated_callers", 4), ("c2_originals", 7)]:
        result = replay["steps"][stage]
        require(result["returncode"] == 0 and result["axiom_audit_ok"] is True and
                len(result["axioms"]) == count, "Incomplete declaration roster: " + stage)
        for name, axes in result["axioms"].items():
            require(set(axes) <= AXIOMS and ("'" + name + "'") in compiler_log,
                    "Missing or untrusted axiom report: " + name)
    inventories = []
    for folder, summary, roots, nodes, edges, guard_count in [
        ("2026-11-27_b2_fused_graph_receipt", "local_b2_graph_summary.json", 8, 94382, 2857836, 15),
        ("2026-11-27_c2_graph_receipt", "c2_graph_summary.json", 10, 119274, 3862637, 13),
        ("2026-11-27_c2_native_equivalence_receipt", "c2_graph_summary.json", 10, 119274, 3862637, 13),
    ]:
        union = read(folder, summary)
        guards = read(folder, "caller_reachability.json")
        require(len(union["roots"]) == roots and union["nodes"] == nodes and
                union["edges"] == edges and union["missing"] == 0, "Changed graph inventory")
        require(guards["roots"] == union["roots"] and guards["all_guards_pass"] is True and
                len(guards["guards"]) == guard_count and
                all(value is True for value in guards["guards"].values()), "Incomplete caller guards")
        for index, name in enumerate(union["roots"]):
            require(union["per_root"][name]["exit"] == 0, "Root verifier failed")
            audit = read(folder, "audit-" + str(index) + ".json")
            require(audit["status"] == "REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT", "Wrong verdict")
            require(all(audit[key] == 0 for key in ["missing", "bodyMissing", "collectorUnresolved"]),
                    "Incomplete references")
            require(not any(audit[key] for key in ["absent", "unexpected", "structuralOnlyAxioms",
                    "nonstandardAxioms", "unsafeOrPartialNodes", "sorryAxInBuiltin",
                    "sorryAxInStructuralClosure"]), "Trust discrepancy")
        require(union["full_RH_replay"] is False, "Local audit misreported as RH replay")
        inventories.append({"folder": folder, "roots": roots, "nodes": nodes})
    folder = "2026-11-27_c2_native_equivalence_receipt"
    # A byte-identical repeated native export is not a cross-engine comparison.
    # Preserve the older record, but accept a genuine replacement only with
    # its actual interpreted/native execution receipts.
    genuine = "2026-11-27_c2_genuine_mode_equivalence"
    if (HERE / genuine / "full_native_interpreted_equivalence.json").is_file():
        folder = genuine
        interpreted_execution = read(folder, "interpreted_execution.json")
        native_execution = read(folder, "native_execution.json")
    else:
        interpreted_execution = read("2026-11-27_c2_graph_receipt", "graph_execution.json")
        native_execution = read(folder, "graph_execution.json")
    validate_execution_modes(interpreted_execution, native_execution)
    equality = read(folder, "full_native_interpreted_equivalence.json")
    if folder == genuine:
        for label in ["interpreted", "native"]:
            raw = (HERE / folder / (label + "_execution.json")).read_bytes()
            require(hashlib.sha256(raw).hexdigest() == equality[label + "_execution_sha256"],
                    "Comparison uses a different execution receipt")
        modes = read(folder, "mode_guard_controls.json")
        require(modes["all_checks_pass"] is True and
                all(modes[key] is True for key in ["two_native_runs_rejected_despite_identical_graph",
                    "genuine_core_modes_accepted", "genuine_full_C2_modes_accepted"]),
                "Engine provenance controls failed")
    require(equality["all_checks_pass"] is True and equality.get("execution_modes_valid") is True and equality["headers_equal"] is True and
            equality["footers_equal"] is True and equality["interpreted_nodes"] == 119274 and
            equality["native_nodes"] == 119274, "Incomplete exporter comparison")
    require(equality["interpreted_sha256"] == equality["native_sha256"] ==
            "531283d9520b938399b9b973d932506ac9cf18379e50592ec74afc051e55a11e",
            "Graph byte streams differ")
    require(all(equality[key] == 0 for key in ["absent_count", "extra_count", "different_record_count"]),
            "Graph records differ")
    controls = read("2026-11-27_c2_native_equivalence_receipt", "graph_comparison_controls.json")
    require(controls["all_checks_pass"] is True and len(controls["checks"]) == 5 and
            all(value is True for value in controls["checks"].values()), "Failed comparison control")
    direct_modules = []
    for folder, receipt, source in [
        ("2026-11-27_fixed_line_receipt", "fixed_line_results.json", "C2_DETERMINANT_FIXED_LINE.lean"),
        ("2026-11-27_definite_weil_receipt", "definite_weil_results.json", "C2_DETERMINANT_WEIL_ACTION.lean"),
        ("2026-11-27_continuous_line_receipt", "continuous_line_results.json", "C2_DETERMINANT_CONTINUOUS_LINE.lean"),
        ("2026-11-27_direct_real_receipt", "direct_real_matching_results.json", "C2_DIRECT_REAL_MATCHING.lean"),
        ("2026-11-27_direct_transport_receipt", "direct_transport_results.json", "C2_DIRECT_DETERMINANT_TRANSPORT.lean"),
    ]:
        direct_modules.append(checked_interface_receipt(folder, receipt, source))
    for args in [
        ("2026-11-27_determinant_carrier_graph_receipt", 119299, 3865789, 35),
        ("2026-11-27_direct_determinant_graph_receipt", 119266, 3862429, 52),
    ]:
        inventories.append(checked_interface_graph(*args))
    old = read("2026-11-27_determinant_carrier_graph_receipt", "supplier_reachability.json")
    new = read("2026-11-27_direct_determinant_graph_receipt", "supplier_reachability.json")
    require(old["membership"]["exchange_of_partners"] == 13
            and new["membership"]["real_matching"] == 13,
            "Lost exact determinant-only absence / retained complement distinction")
    rejected = False
    try:
        checked_interface_receipt("2026-11-27_fixed_line_receipt/failed_attempt_1",
                                  "fixed_line_results.json", "C2_DETERMINANT_FIXED_LINE.lean")
    except RuntimeError as exc:
        rejected = str(exc) == "Unaccepted interface compiler receipt"
    require(rejected, "Actual rejected compiler receipt was accepted or rejected for the wrong reason")
    shared_folder = "2026-11-27_determinant_shared_receipt"
    shared = read(shared_folder, "determinant_shared_results.json")
    bootstrap = read(shared_folder, "bootstrap_results.json")
    summary = read(shared_folder, "independent_replay_summary.json")
    require(summary["status"] == "pass" and summary["returncode"] == 0
            and summary["source_sha"] == "aceceb93b79727aac30ebcb24388c58aebc5adbf"
            and shared["all_requested_checks_ok"] is True and shared["pipeline_checks_ok"] is True
            and shared["source_build_receipt"]["returncode"] == 0
            and bootstrap["all_requested_checks_ok"] is True, "Independent shared replay did not pass")
    require(shared["base_receipt"]["all_requested_checks_ok"] is True
            and shared["base_receipt"]["combined_source_blob"] == "aba46120ca4118decd864f817b51bcca2bc31c19"
            and shared["base_receipt"]["all_five_type_and_dependency_guards_observed"] is True,
            "Independent base did not preserve all five original statements")
    count = 0
    for interface in shared["checked_interfaces"]:
        module, compiler = interface["compiled_module"]["name"], interface["compiler"]
        require(interface["all_requested_checks_ok"] is True and compiler["returncode"] == 0
                and compiler["axiom_audit_ok"] is True and compiler["direct_supplier_guards_observed"] is True,
                "Independent interface compiler rejected")
        log = (HERE / shared_folder / module / "compile.log").read_text()
        require("sorryAx" not in log and "error:" not in log, "Failed independent compiler log")
        for name, axes in compiler["axioms"].items():
            require(set(axes) <= AXIOMS and ("'" + name + "'") in log,
                    "Missing independent interface axiom report")
            count += 1
    require(count == 10 and len(shared["checked_interfaces"]) == 6, "Wrong independent compiler roster")
    probe = bootstrap["steps"]["original_callers"]
    control = bootstrap["steps"]["negative_missing_projector_guard"]
    require(probe["returncode"] == 0 and probe["axiom_audit_ok"] is True and len(probe["axioms"]) == 7
            and all(set(x) <= AXIOMS for x in probe["axioms"].values())
            and control["returncode"] == 1 and control["expected_rejection_observed"] is True,
            "Independent original probes or negative control incomplete")
    inventories.append(checked_interface_graph(shared_folder + "/complete_graph", 119299, 3865789, 35))
    shared_archive = read(shared_folder + "/complete_graph", "graph_archive_receipt.json")
    local_archive = read("2026-11-27_determinant_carrier_graph_receipt", "graph_archive_receipt.json")
    require(shared_archive["raw_sha256"] == local_archive["raw_sha256"] ==
            "0d9ca13046d943ebe21783a4c7919b04670dc63136f90e92662e08a8a9922caa",
            "Fresh-source dependency stream differs from the accepted local stream")
    print(json.dumps({"saved_receipts_consistent": True, "inventories": inventories,
                      "direct_compiler_modules": direct_modules, "actual_failed_receipt_rejected": rejected,
                      "independent_shared_chain_checked": True,
                      "new_Lean_execution": False, "full_RH_replay": False,
                      "scope": "saved evidence consistency; not a fresh proof or graph extraction"}))


if __name__ == "__main__":
    main()

