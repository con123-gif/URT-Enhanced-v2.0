#!/usr/bin/env python3
"""Check all seven active B2 declarations using the authenticated native cache.

No source build. Preserve exact inputs, fresh compiler logs, original-type
guards and a separately checked repaired skew/count module.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import subprocess
import tomllib

from build_b2_sequential import flatten_options
from run_active_b2_callers import GUARD as PAIR_GUARD
from run_active_b2_energy import ENERGY_GUARD
import run_compact_b2_native_replay as native

FULL_GUARD = ("B2_ACTIVE_FULL_ENERGY: original declaration types match; all three energy callers "
              "consume replacements; original targets absent from direct proof dependencies")


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path, required=True)
    p.add_argument("--lean-bin", type=Path, required=True)
    p.add_argument("--cache-receipt", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    args = p.parse_args()
    root, out = args.compact_root.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    cache = json.loads(args.cache_receipt.read_text())
    native.require(cache["compact"] == native.PIN and cache["mathlib"] == native.MATHLIB
                   and cache["modules_available"]["New.Filling.CrudeEnergy"], "Wrong native cache receipt")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN,
                   "Wrong compact pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"],
                   root / ".lake/packages/mathlib") == native.MATHLIB, "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"],
                   cwd=root, check=True)
    config = json.loads((Path(__file__).parent / "B2_ACTIVE_FULL_ENERGY_INPUT.json").read_text())
    pieces = []
    for part in config["parts"]:
        raw = (native.SWARM / part["source"]).read_bytes()
        native.require(native.git_blob(raw) == part["source_blob"], "Changed full B2 source")
        pieces.append(re.sub(r"^import[^\n]*\n", "", raw.decode(), flags=re.M))
    source = out / "active_b2_energy.lean"
    source.write_text("import New.Filling.CrudeEnergy\nimport Mathlib.Tactic\n\n" + "\n".join(pieces))
    names = config["theorems"]
    native.require(len(names) == len(set(names)) == 7, "Wrong full B2 theorem roster")
    native.PEERS = {"full_energy": (str(source), native.git_blob(source.read_bytes()), names)}
    native.preflight()
    lake = tomllib.loads((root / "lakefile.toml").read_text())
    options = list(lake.get("moreLeanArgs", [])) + list(flatten_options(lake["leanOptions"]))
    options += ["-Dpp.fullNames=true", "-j", "2"]
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    state = {**config, "compact": native.PIN, "mathlib": native.MATHLIB,
             "assembled_source_blob": native.git_blob(source.read_bytes()),
             "cache_receipt": cache, "native_source_build_performed": False,
             "new_Lean_execution": False, "human_assembly_verified": False,
             "full_RH_replay": False, "steps": {}}
    receipt = out / "energy_replacement_results.json"

    def step(label, command, seconds):
        print(json.dumps({"step": label, "state": "started"}), flush=True)
        ans = native.step(command, root, env, out / (label + ".log"), seconds)
        state["steps"][label] = ans
        native.dump(receipt, state)
        print(json.dumps({"step": label, **ans}), flush=True)
        return ans

    setup = step("environment", ["lake", "env", "python3", "-c",
                 "import os,json; print(json.dumps({k:os.environ[k] for k in "
                 "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"], 300)
    native.require(setup["returncode"] == 0, "Cannot resolve pinned Lake environment")
    env.update(json.loads((out / "environment.log").read_text().strip().splitlines()[-1]))
    env["LEAN_PATH"] = str(out) + os.pathsep + env["LEAN_PATH"]
    lean = str(args.lean_bin.resolve() / "lean")
    primary = step("active_b2_energy", [lean, *options, "-R", out,
                   "-o", out / "active_b2_energy.olean", source], 1800)
    primary.update(native.audit(out / "active_b2_energy.log", names))
    log = (out / "active_b2_energy.log").read_text()
    primary["all_caller_guards_observed"] = all(g in log for g in [PAIR_GUARD, ENERGY_GUARD, FULL_GUARD])
    good = (primary["returncode"] == 0 and primary["axiom_audit_ok"] is True
            and primary["all_caller_guards_observed"])
    state.update(new_Lean_execution=True, energy_caller_checked=good,
                 full_energy_chain_checked=good,
                 original_declaration_types_match=good,
                 original_targets_absent_from_direct_proof_dependencies=good)
    if good:
        objects = []
        for f in sorted(out.glob("active_b2_energy.olean*")):
            with f.open("rb") as stream:
                objects.append({"name": f.name, "bytes": f.stat().st_size,
                                "sha256": hashlib.file_digest(stream, "sha256").hexdigest()})
        state["compiled_module"] = {"name": "active_b2_energy", "artifacts": objects}
    native.dump(receipt, state)
    peer = config["skew_patch"]
    path = native.SWARM / peer["source"]
    native.require(native.git_blob(path.read_bytes()) == peer["source_blob"], "Changed peer skew patch")
    spec = importlib.util.spec_from_file_location("skew_patch_repaired", path)
    patch = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(patch)
    adapter = config["skew_adapter"]
    native.require(patch.NEW.count(adapter["old"]) == 1, "Changed rectangular-negation anchor")
    patch.NEW = patch.NEW.replace(adapter["old"], adapter["new"], 1)
    skew_names = ["RHPositivityRun73.skew_correction_mul",
                  "Filling.tsum_invPowWeight_le_of_codim_le", "Filling.sum_pairWeight_le"]
    skew_source = out / "BlockBoundSkewReplacement.lean"
    skew_source.write_text(patch.transform((root / "src/New/Filling/BlockBound.lean").read_bytes()) +
                           "\n" + "\n".join("#print axioms " + n for n in skew_names) + "\n")
    skew = step("skew_caller", [lean, *options, "-R", out, skew_source], 1800)
    skew.update(native.audit(out / "skew_caller.log", skew_names))
    skew["source_blob"] = native.git_blob(skew_source.read_bytes())
    state["separate_skew_caller_checked"] = skew["returncode"] == 0 and skew["axiom_audit_ok"] is True
    state["all_requested_checks_ok"] = good and state["separate_skew_caller_checked"]
    native.dump(receipt, state)
    native.require(state["all_requested_checks_ok"], "Native B2 checks failed; preserve and inspect logs")
    print(json.dumps({"seven_declarations_checked": True, "four_original_statement_callers_checked": True,
                      "separate_skew_caller_checked": True, "full_RH_replay": False}), flush=True)


if __name__ == "__main__":
    main()
