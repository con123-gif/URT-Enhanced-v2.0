#!/usr/bin/env python3
"""Replay the prepared standard-pair C2 replacement in a pinned workspace.

No cold bootstrap, root import or parallel heavy build. The native workspace
must be available; --build explicitly builds only EqualRankValue on a capable
host. Prepared input checks are never a theorem receipt.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tomllib

from build_b2_sequential import flatten_options
import run_compact_b2_native_replay as native

SOURCE = "specialists/character_boxes/RUN78_COMPACT_EQUAL_RANK_CALLER.lean"
SOURCE_BLOB = "6bb8f53e746aa4d5c876c7eff3433e6daf126795"
ORIGINAL_BLOB = "a620150b7c616d614013822be11dbdf74a694f0d"
NAMES = ["RHCharacterBoxes77.exchange_of_standard_pairs", "run78_equalRankThetaRatio_value"]
ORIGINALS = ["exchange_of_partners", "exists_equalRankThetaRatio_value", "stdExchange_of_periods"]
GUARD = ("C2_EQUAL_RANK_CALLER: exact type; standard helper consumed; original target and "
         "general exchange absent directly")
PROPAGATION_SOURCE = "specialists/character_boxes/RUN79_COMPACT_CARRIER_PROPAGATION.lean"
PROPAGATION_BLOB = "661ed5fdd14651cf5629866ca7e86810f9c5fef2"
PROPAGATION_NAMES = ["run79_exchange_theorem", "run79_explicit_matching",
                     "run79_stdClassSum_det_modKernel_eq", "run79_stdClassSum_carrierXi_eq_carrierForm"]
PROPAGATION_ORIGINALS = ["exchange_theorem", "explicit_matching", "stdClassSum_det_modKernel_eq",
                         "stdClassSum_carrierXi_eq_carrierForm"]
PROPAGATION_ORIGINAL_BLOBS = {
    "New/Exchange/ExchangeTheorem.lean": "608b4f61af27d780e24f799937a836ecd3c1d50a",
    "New/Rows/Carrier.lean": "f0b7f97f299904aa73a928432147a932cac9be40",
    "New/Rows/RowVolume.lean": "925de9c592b40763516e70ddeae48b4ad1a35b88",
    "New/Rows/LiftVolumeHeight.lean": "87938141d4103b485fd5a7125721798f65f973f1",
    "New/Rows/ComparisonForms.lean": "14ef893c54f5db837ea7e4f143b2b1a444b89b5a",
}


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--prepare-only", action="store_true")
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--build", action="store_true")
    p.add_argument("--carrier", action="store_true",
                   help="Propagate the checked equal-rank replacement through all four RUN79 callers")
    p.add_argument("--candidate-seconds", type=int, default=1200)
    p.add_argument("--propagation-seconds", type=int, default=1200)
    p.add_argument("--original-seconds", type=int, default=600)
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    raw = (native.SWARM / SOURCE).read_bytes()
    native.require(native.git_blob(raw) == SOURCE_BLOB, "Changed C2 candidate")
    code = re.sub(r"/-.*?-/", "", raw.decode(), flags=re.S)
    code = re.sub(r"--[^\n]*", "", code)
    native.require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved C2 code")
    native.require(not re.search(r"^import (?:Main|New\.Main)\b", code, re.M), "RH root import")
    for name in NAMES:
        native.require("#print axioms " + name in code, "Missing C2 axiom probe")
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB, "source": SOURCE,
                "source_blob": SOURCE_BLOB, "original_source_blob": ORIGINAL_BLOB,
                "theorems": NAMES, "original_probes": ORIGINALS,
                "new_Lean_execution": False, "full_RH_replay": False}
    adapter = ("info.value? |", "info.value? (allowOpaque := true) |")
    native.require(raw.decode().count(adapter[0]) == 1, "Changed C2 theorem-body accessor")
    adapted_text = raw.decode().replace(*adapter, 1)
    repairs = [
        {"old": "  have P := isPartner_stdRowDatum_stdColDatum σ ha\n",
         "new": "  have P := isPartner_stdRowDatum_stdColDatum σ (χ := 𝔠.χ) ha\n",
         "reason": "The actual first native error leaves the finite character implicit"},
        {"old": "    (flipSpace U) 1 (by simp [flipSpace, ← ext_iff]) _\n",
         "new": "    (flipSpace U) 1 (by simp [flipSpace, ← ext_iff]) (rankTwist 𝔠.ν⁻¹ n)\n",
         "reason": "Select the same rank-twisted character required by the final theta integral"},
        {"old": "  simp only [stdRowDatum] at K this\n",
         "new": """  have row_forward :
      stdRowDatum (emptySum Empty (Fin (2 * k))) 𝔠.χ
        (0 : Matrix Empty (Fin (2 * k)) (LocProd 𝔠.S)) =
      stdColDatum 𝔠.χ (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S)) := rfl
  have row_reverse :
      stdRowDatum (sumEmpty (Fin (2 * k)) Empty) 𝔠.χ
        (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S)) =
      (fun (_ : Matrix Empty (Fin (2 * k)) (LocProd 𝔠.S)) =>
        stdColDatum 𝔠.χ
          (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S))
          (1 : Matrix (Fin (2 * k)) (Fin (2 * k)) (LocProd 𝔠.S))) := rfl
  simp only [row_forward, row_reverse] at K this
""",
         "reason": "The actual second replay leaves partially applied standard-row functions; use full function identities before expanding theta data"},
        {"old": """  have : localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
      𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := by
""",
         "new": """  have flipDatum (Ψ : Matrix n b (LocProd 𝔠.S) → ℂ)
      (hΨ : Ψ ∈ schwartzBruhat HasLeftInv)
      (P : IsPartner SemilocalField.O σ 𝔠.χ (stdRowDatum σ 𝔠.χ a) Ψ) :
      localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
        𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := by
""",
         "reason": "Keep the finite datum abstract inside the existing partner-law flip calculation; dsimp otherwise expands its standard-data implementation"},
        {"old": """  convert congr((rankTwist 𝔠.ν⁻¹ n).1 g.det * $(K 𝔠 a ha) g) using 1 <;>
""",
         "new": """  have : localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
      𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := flipDatum _ hΨ P
  have kg := congr((rankTwist 𝔠.ν⁻¹ n).1 g.det * $(K 𝔠 a ha) g)
  clear K
  convert kg using 1 <;> clear kg <;>
""",
         "reason": "After consuming the standard theta identity, prevent simp [*] from rewriting its own source side back through K"},
    ]
    for repair in repairs:
        native.require(adapted_text.count(repair["old"]) == 1, "Changed C2 repair anchor")
        adapted_text = adapted_text.replace(repair["old"], repair["new"], 1)
    adapted = adapted_text.encode()
    manifest.update(adapter={"old": adapter[0], "new": adapter[1]},
                    native_repairs=repairs,
                    replay_source_blob=native.git_blob(adapted))
    propagation = None
    if args.carrier:
        propagation = (native.SWARM / PROPAGATION_SOURCE).read_bytes()
        native.require(native.git_blob(propagation) == PROPAGATION_BLOB, "Changed Carrier candidate")
        for name in PROPAGATION_NAMES:
            native.require("#print axioms " + name in propagation.decode(), "Missing Carrier axiom probe")
        manifest["carrier_propagation"] = {"source": PROPAGATION_SOURCE,
            "source_blob": PROPAGATION_BLOB, "theorems": PROPAGATION_NAMES,
            "original_probes": PROPAGATION_ORIGINALS,
            "original_source_blobs": PROPAGATION_ORIGINAL_BLOBS,
            "new_Lean_execution": False}
    native.dump(out / "c2_input_manifest.json", manifest)
    if args.prepare_only:
        print(json.dumps(manifest))
        return
    native.require(args.compact_root is not None and args.lean_bin is not None,
                   "Provide the already-built pinned C2 workspace and Lean bin")
    root = args.compact_root.resolve()
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN,
                   "Wrong compact pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"],
                   root / ".lake/packages/mathlib") == native.MATHLIB, "Wrong Mathlib pin")
    native.require(native.git_blob((root / "src/New/Exchange/EqualRankValue.lean").read_bytes())
                   == ORIGINAL_BLOB, "Wrong native C2 source")
    if args.carrier:
        for path, expected in PROPAGATION_ORIGINAL_BLOBS.items():
            native.require(native.git_blob((root / "src" / path).read_bytes()) == expected,
                           "Wrong Carrier source: " + path)
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"],
                   cwd=root, check=True)
    lake = tomllib.loads((root / "lakefile.toml").read_text())
    options = list(lake.get("moreLeanArgs", [])) + list(flatten_options(lake["leanOptions"]))
    options.append("-Dpp.fullNames=true")
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    state = {**manifest, "steps": {}, "lean_arguments": options,
             "caller_replacement_checked": False, "human_assembly_verified": False,
             "fresh_native_source_replay": False}
    result_path = out / "c2_replacement_results.json"

    def step(label, command, seconds):
        result = native.step(command, root, env, out / (label + ".log"), seconds)
        state["steps"][label] = result
        native.dump(result_path, state)
        return result

    if args.build:
        memory = int(next(l.split()[1] for l in Path("/proc/meminfo").read_text().splitlines()
                          if l.startswith("MemTotal:"))) * 1024
        limit = Path("/sys/fs/cgroup/memory.max")
        if limit.exists() and limit.read_text().strip() != "max":
            memory = min(memory, int(limit.read_text()))
        native.require(memory >= 8_000_000_000 and shutil.disk_usage(root).free >= 35_000_000_000,
                       "RESOURCE_BLOCKED: targeted build needs 8 GB RAM and 35 GB scratch")
        target = "+New.Rows.Carrier:olean" if args.carrier else "+New.Exchange.EqualRankValue:olean"
        build = step("c2_build", ["lake", "build", target], 2700)
        native.require(build["returncode"] == 0, "C2 source build failed; preserve partial log")
    native.require((root / ".lake/build/lib/lean/New/Exchange/EqualRankValue.olean").is_file(),
                   "EqualRankValue not built; use the shared capable workspace after B2")
    setup = subprocess.check_output(["lake", "env", "python3", "-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in "
            "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root, env=env, text=True, timeout=300)
    (out / "environment.log").write_text(setup)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    env["LEAN_PATH"] = str(out) + os.pathsep + env["LEAN_PATH"]
    lean = str(args.lean_bin.resolve() / "lean")
    candidate = out / "C2Caller.lean"
    candidate.write_bytes(adapted)
    probe = step("c2_candidate", [lean, *options, "-j", "2", "-R", out,
                                 "-o", out / "C2Caller.olean", candidate], args.candidate_seconds)
    probe.update(native.audit(out / "c2_candidate.log", NAMES))
    probe["caller_guard_observed"] = GUARD in (out / "c2_candidate.log").read_text()
    state["new_Lean_execution"] = True
    native.dump(result_path, state)
    base_good = (probe["returncode"] == 0 and probe["axiom_audit_ok"] is True
                 and probe["caller_guard_observed"] is True)
    if base_good:
        native.require((out / "C2Caller.olean").is_file(), "Checked C2 module object missing")
        state["compiled_module"] = {"name": "C2Caller", "artifacts": []}
        for path in sorted(out.glob("C2Caller.olean*")):
            with path.open("rb") as stream:
                state["compiled_module"]["artifacts"].append({"name": path.name,
                    "bytes": path.stat().st_size,
                    "sha256": hashlib.file_digest(stream, "sha256").hexdigest()})
    propagated_good = not args.carrier
    if args.carrier and base_good:
        native.require((root / ".lake/build/lib/lean/New/Rows/Carrier.olean").is_file(),
                       "Carrier is not built; use the same capable workspace with --carrier --build")
        path = out / "C2Propagation.lean"
        path.write_bytes(propagation)
        propagated = step("c2_propagated_callers", [lean, *options, "-j", "2",
                          "-R", out, "-o", out / "C2Propagation.olean", path], args.propagation_seconds)
        propagated.update(native.audit(out / "c2_propagated_callers.log", PROPAGATION_NAMES))
        log = (out / "c2_propagated_callers.log").read_text()
        propagated["all_four_guards_observed"] = all(
            "C2_PROPAGATED_CALLER: " + name + ": exact type and direct edges" in log
            for name in PROPAGATION_NAMES)
        propagated_good = (propagated["returncode"] == 0 and propagated["axiom_audit_ok"] is True
                           and propagated["all_four_guards_observed"] is True)
        state["carrier_propagation_checked"] = propagated_good
        if propagated_good:
            state["propagated_module"] = {"name": "C2Propagation", "artifacts": []}
            for obj in sorted(out.glob("C2Propagation.olean*")):
                with obj.open("rb") as stream:
                    state["propagated_module"]["artifacts"].append({"name": obj.name,
                        "bytes": obj.stat().st_size,
                        "sha256": hashlib.file_digest(stream, "sha256").hexdigest()})
        native.dump(result_path, state)
    original = out / "C2OriginalProbes.lean"
    originals = ORIGINALS + (PROPAGATION_ORIGINALS if args.carrier else [])
    imported = "New.Rows.Carrier" if args.carrier else "New.Exchange.EqualRankValue"
    original.write_text("import " + imported + "\n" +
                        "\n".join("#print axioms " + n for n in originals) + "\n")
    check = step("c2_originals", [lean, *options, "-j", "2", original], args.original_seconds)
    check.update(native.audit(out / "c2_originals.log", originals))
    state.update(caller_replacement_checked=base_good,
                 all_requested_checks_ok=base_good and propagated_good and check["returncode"] == 0
                 and check["axiom_audit_ok"] is True)
    native.dump(result_path, state)
    native.require(state["all_requested_checks_ok"], "C2 checks failed; inspect actual compiler logs")
    print(json.dumps(state))


if __name__ == "__main__":
    main()
