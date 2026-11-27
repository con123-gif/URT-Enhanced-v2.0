#!/usr/bin/env python3
"""Check the actual energy consumer with the active pair-weight supplier.

Authenticate the two source fragments and preserve the complete assembled
Lean input. Reuse the pinned bootstrap and compile only the CrudeEnergy
import closure. A successful workflow alone is never a theorem receipt.
"""
import argparse
import contextlib
import importlib.util
import io
import json
import re
import hashlib
import sys
from pathlib import Path

import run_compact_b2_native_replay as native
from run_active_b2_callers import GUARD as PAIR_GUARD

HERE = Path(__file__).resolve().parent
ENERGY_GUARD = ("B2_ACTIVE_ENERGY: original declaration type matches; replacement pair bound "
                "consumed; original targets absent from direct proof dependencies")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--manifest", default="B2_ACTIVE_ENERGY_INPUT.json")
    args = parser.parse_args()
    out = Path(args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    config = json.loads((HERE / args.manifest).read_text())
    full_energy = config.get("full_energy_chain", False)
    patch_info = config["skew_patch"]
    patch_file = native.SWARM / patch_info["source"]
    native.require(native.git_blob(patch_file.read_bytes()) == patch_info["source_blob"],
                   "Changed peer skew-caller patch")
    spec = importlib.util.spec_from_file_location("authenticated_skew_patch", patch_file)
    patch = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(patch)
    adapter = config.get("skew_adapter")
    if adapter:
        native.require(patch.NEW.count(adapter["old"]) == 1, "Changed peer matrix-negation anchor")
        patch.NEW = patch.NEW.replace(adapter["old"], adapter["new"], 1)
    texts = []
    for part in config["parts"]:
        raw = (native.SWARM / part["source"]).read_bytes()
        native.require(native.git_blob(raw) == part["source_blob"],
                       "Changed energy input: " + part["source"])
        texts.append(re.sub(r"^import[^\n]*\n", "", raw.decode(), flags=re.M))
    assembled = out / "active_b2_energy.lean"
    assembled.write_text("import New.Filling.CrudeEnergy\nimport Mathlib.Tactic\n\n" +
                         "\n".join(texts))
    assembled_blob = native.git_blob(assembled.read_bytes())
    names = config["theorems"]
    expected_count = 7 if full_energy else 5
    native.require(len(names) == expected_count and len(set(names)) == expected_count,
                   "Wrong energy theorem manifest")
    native.PEERS = {"active_b2_energy": (str(assembled), assembled_blob, names)}
    native.SOURCES["New/Filling/CrudeEnergy.lean"] = config["original_source_blob"]
    base_step = native.step

    def pinned_step(argv, cwd, env, log, seconds):
        argv = list(argv)
        building = argv == ["lake", "build", "+New.Filling.BlockBound:olean"]
        if building:
            argv[-1] = "+New.Filling.CrudeEnergy:olean"
        if argv[:3] == ["lake", "env", "lean"]:
            argv = argv[:3] + ["--tstack=400000"] + argv[3:]
        print(json.dumps({"native_step": log.stem, "state": "started"}),
              file=sys.stderr, flush=True)
        result = base_step(argv, cwd, env, log, seconds)
        print(json.dumps({"native_step": log.stem, "state": "finished", **result}),
              file=sys.stderr, flush=True)
        if building:
            # Keep the costly pinned native cache as an Actions artifact. The
            # small manifest is committed; archive bytes stay artifact-only.
            archive = out / "native_b2_oleans.tar.zst"
            packed = base_step(["tar", "--zstd", "-cf", archive, "-C", cwd,
                                ".lake/build/lib/lean"], cwd, env,
                               out / "cache_archive.log", 180)
            cache = {"compact": native.PIN, "mathlib": native.MATHLIB,
                     "lean_release_sha256": native.RELEASE,
                     "build_target": "New.Filling.CrudeEnergy:olean",
                     "source_build_complete": result["returncode"] == 0,
                     "archive": archive.name, "archive_result": packed,
                     "proof_receipt": False}
            if packed["returncode"] == 0:
                with archive.open("rb") as stream:
                    cache["sha256"] = hashlib.file_digest(stream, "sha256").hexdigest()
                cache["bytes"] = archive.stat().st_size
            native.dump(out / "native_cache_manifest.json", cache)
        if building and result["returncode"] == 0:
            # Compile the peer's exact reversible patch in this already-built
            # workspace, as a separate process with the original module's imports.
            raw = (Path(cwd) / "src/New/Filling/BlockBound.lean").read_bytes()
            names = ["RHPositivityRun73.skew_correction_mul",
                     "Filling.tsum_invPowWeight_le_of_codim_le",
                     "Filling.sum_pairWeight_le"]
            source = out / "BlockBoundSkewReplacement.lean"
            source.write_text(patch.transform(raw) + "\n" +
                              "\n".join("#print axioms " + n for n in names) + "\n")
            skew_log = out / "skew_caller.log"
            ans = base_step(["lake", "env", "lean", "--tstack=400000",
                             "-DautoImplicit=false", "-DrelaxedAutoImplicit=false",
                             "-DmaxSynthPendingDepth=3", "-DmaxHeartbeats=4000000",
                             "-Dpp.fullNames=true", source],
                            cwd, env, skew_log, 600)
            ans.update(native.audit(skew_log, names))
            ans["source_blob"] = native.git_blob(source.read_bytes())
            ans["scope"] = "exact reversible original-statement skew/count caller patch"
            ans["full_RH_replay"] = False
            native.dump(out / "skew_caller_results.json", ans)
        return result

    native.step = pinned_step
    native.preflight()
    provenance = {**config, "assembled_source_blob": assembled_blob,
                  "new_Lean_execution": False, "full_RH_replay": False}
    native.dump(out / "energy_input_manifest.json", provenance)
    if args.preflight:
        print(json.dumps({"source_fragments_authenticated": len(texts),
                          "assembled_source_blob": assembled_blob,
                          "new_Lean_execution": False, "energy_caller_checked": False}))
        return
    original_argv = sys.argv
    try:
        sys.argv = [sys.argv[0], "--out", str(out)]
        with contextlib.redirect_stdout(io.StringIO()):
            native.main()
    finally:
        sys.argv = original_argv
    state = json.loads((out / "b2_native_results.json").read_text())
    probe = state["steps"]["active_b2_energy"]
    native.require(state["all_requested_checks_ok"] is True, "Incomplete energy native batch")
    native.require(probe["returncode"] == 0 and probe["axiom_audit_ok"] is True,
                   "Energy compilation/axiom audit failed")
    native.require(set(probe["axioms"]) == set(names), "Missing energy theorem report")
    log = (out / probe["log"]).read_text()
    native.require(PAIR_GUARD in log and ENERGY_GUARD in log,
                   "Actual pair/energy caller guards did not complete")
    if full_energy:
        native.require("B2_ACTIVE_FULL_ENERGY: original declaration types match; all three energy "
                       "callers consume replacements; original targets absent from direct proof "
                       "dependencies" in log, "Full energy caller guards did not complete")
    skew = json.loads((out / "skew_caller_results.json").read_text())
    skew_ok = skew["returncode"] == 0 and skew["axiom_audit_ok"] is True
    result = {
        **provenance, "new_Lean_execution": True, "axioms": probe["axioms"],
        "original_declaration_types_match": True,
        "energy_caller_checked": True,
        "replacement_pair_bound_consumed": True,
        "full_energy_chain_checked": full_energy,
        "original_targets_absent_from_direct_proof_dependencies": True,
        "scope": ("pair-weight replacement and all three complete CrudeEnergy consumers"
                  if full_energy else
                  "pair-weight replacement and its full original-statement level-energy consumer"),
        "separate_skew_caller_receipt": "skew_caller_results.json",
        "human_assembly_verified": False, "full_RH_replay": False,
        "separate_skew_caller_checked": skew_ok,
        "all_requested_checks_ok": skew_ok,
    }
    native.dump(out / "energy_replacement_results.json", result)
    native.require(skew_ok, "Energy caller passed; separate skew caller failed; inspect its log")
    print(json.dumps({"compiled_theorems": len(names), "energy_caller_checked": True,
                      "human_assembly_verified": False, "full_RH_replay": False}))


if __name__ == "__main__":
    main()
