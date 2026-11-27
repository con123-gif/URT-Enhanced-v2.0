#!/usr/bin/env python3
"""Check consistency of saved B2/C2 compiler and local graph audit receipts.

This is a regression guard for the evidence package. It does not execute
Lean, re-extract the large graphs, or establish any remaining RH premise.
"""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
AXIOMS = {"propext", "Classical.choice", "Quot.sound"}


def require(ok, message):
    if not ok:
        raise RuntimeError(message)


def read(folder, name):
    return json.loads((HERE / folder / name).read_text())


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
    equality = read(folder, "full_native_interpreted_equivalence.json")
    require(equality["all_checks_pass"] is True and equality["headers_equal"] is True and
            equality["footers_equal"] is True and equality["interpreted_nodes"] == 119274 and
            equality["native_nodes"] == 119274, "Incomplete exporter comparison")
    require(equality["interpreted_sha256"] == equality["native_sha256"] ==
            "531283d9520b938399b9b973d932506ac9cf18379e50592ec74afc051e55a11e",
            "Graph byte streams differ")
    require(all(equality[key] == 0 for key in ["absent_count", "extra_count", "different_record_count"]),
            "Graph records differ")
    controls = read(folder, "graph_comparison_controls.json")
    require(controls["all_checks_pass"] is True and len(controls["checks"]) == 5 and
            all(value is True for value in controls["checks"].values()), "Failed comparison control")
    print(json.dumps({"saved_receipts_consistent": True, "inventories": inventories,
                      "new_Lean_execution": False, "full_RH_replay": False,
                      "scope": "saved evidence consistency; not a fresh proof or graph extraction"}))


if __name__ == "__main__":
    main()
