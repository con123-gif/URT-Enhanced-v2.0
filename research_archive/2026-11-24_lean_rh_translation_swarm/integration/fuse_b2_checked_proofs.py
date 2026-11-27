#!/usr/bin/env python3
"""Connect the repaired count to checked B2 proofs, with normal kernel checking.

No source build and no RH root. Reuse exact checked proof expressions; rename
only an authenticated, fixed roster of theorem suppliers. Every result is
submitted to Lean.addDecl, not inserted into an unchecked environment.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import tomllib

from build_b2_sequential import flatten_options
import run_compact_b2_native_replay as native

HERE = Path(__file__).resolve().parent
OLD_COUNT = "Filling.tsum_invPowWeight_le_of_codim_le"
NEW_COUNT = "Filling.b2_fused_tsum_invPowWeight_le_of_codim_le"
GUARD = "B2_FUSED: five original statement types match; checked proof retargeting and direct supplier guards passed"
LABEL_SOURCE = "specialists/positivity_geometry/compact/RUN80_LabelFused.lean"
LABEL_BLOB = "d4ed493ddfced479b3be029bb554493c0c39accd"
LABEL_NAMES = ["Filling.RHPositivityRun78.canonical_label_frame_unique",
               "Filling.RHPositivityRun78.labelled_frame_unique"]
LABEL_GUARD = "RUN80_LABEL_FUSED: both local supplier guards accepted"
LAYOUT_OLD = """    Lean.addDecl (.thmDecl { name := replacement, levelParams := info.levelParams,
                            type := info.type, value := proof })"""
LAYOUT_NEW = """    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := replacement
      levelParams := info.levelParams
      type := info.type
      value := proof
    })"""


def prepare(root, module_dir, out, labelled=False):
    config = json.loads((HERE / "B2_ACTIVE_FULL_ENERGY_INPUT.json").read_text())
    receipt = json.loads((module_dir / "energy_replacement_results.json").read_text())
    native.require(receipt["compact"] == native.PIN and receipt["mathlib"] == native.MATHLIB,
                   "Wrong checked module pins")
    native.require(receipt["full_energy_chain_checked"] is True and receipt["parts"] == config["parts"],
                   "Missing or changed seven-declaration receipt")
    obj = receipt["compiled_module"]
    native.require(obj["name"] == "active_b2_energy" and obj["artifacts"], "Missing checked object")
    for item in obj["artifacts"]:
        native.require(Path(item["name"]).name == item["name"], "Unexpected object path")
        with (module_dir / item["name"]).open("rb") as stream:
            native.require(hashlib.file_digest(stream, "sha256").hexdigest() == item["sha256"],
                           "Checked object digest differs")
    for part in config["parts"]:
        native.require(native.git_blob((native.SWARM / part["source"]).read_bytes()) == part["source_blob"],
                       "Changed checked input fragment")
    patch_path = native.SWARM / config["skew_patch"]["source"]
    native.require(native.git_blob(patch_path.read_bytes()) == config["skew_patch"]["source_blob"],
                   "Changed peer patch")
    spec = importlib.util.spec_from_file_location("fused_count_patch", patch_path)
    patch = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(patch)
    adapter = config["skew_adapter"]
    native.require(patch.NEW.count(adapter["old"]) == 1, "Changed rectangular adapter")
    patch.NEW = patch.NEW.replace(adapter["old"], adapter["new"], 1)
    raw = (root / "src/New/Filling/BlockBound.lean").read_bytes()
    native.require(native.git_blob(raw) == patch.BLOB, "Wrong original BlockBound source")
    source = raw.decode()
    # Unique, source-pinned boundaries preserve the complete native proof and
    # its exact standing variable/attribute context, without its old name.
    start = "lemma tsum_invPowWeight_le_of_codim_le [StablyUnram E]"
    end = "\nend\n\nopen Pointwise Set\n"
    pre = "variable [S.IsAdmissible] {c} {γ : ↥(S.G E)}"
    pre_end = "/-- Shared vectors of a near γ"
    for anchor in [start, end, pre, pre_end, patch.OLD]:
        native.require(source.count(anchor) == 1, "Nonunique native count anchor")
    context = source[source.index(pre):source.index(pre_end)]
    count = source[source.index(start):source.index(end)]
    native.require(count.count(patch.OLD) == 1, "Skew proof absent from extracted count")
    count = count.replace(patch.OLD, patch.NEW, 1)
    count = count.replace(start, "lemma b2_fused_tsum_invPowWeight_le_of_codim_le [StablyUnram E]", 1)
    count = count.replace("RHPositivityRun73.skew_correction_mul", "RHB2Fusion.skew_correction_mul")
    helper = patch.HELPER.replace("RHPositivityRun73", "RHB2Fusion")
    old_names = config["theorems"]
    new_names = [name.replace("b2_active_", "b2_fused_", 1) for name in old_names]
    mapping = [(OLD_COUNT, NEW_COUNT), *zip(old_names, new_names)]
    # Targets are added dynamically later in this run_cmd. A single backtick
    # denotes their literal names without premature identifier resolution.
    roster = ",\n    ".join(f"(``{old}, `{new})" for old, new in mapping)
    original_pairs = [
        (OLD_COUNT, NEW_COUNT),
        ("Filling.sum_pairWeight_le", new_names[3]),
        ("Filling.energy_le_of_level_pairs", new_names[4]),
        ("Filling.energy_le_of_level_lt", new_names[5]),
        ("Filling.energy_le_of_linkEnergy_le", new_names[6]),
    ]
    comparisons = ",\n    ".join(f"(``{old}, `{new})" for old, new in original_pairs)
    text = """import Lean
import active_b2_energy
import New.Filling.CrudeEnergy
import Mathlib.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000
set_option pp.fullNames true
set_option debug.skipKernelTC false

/-! Generated from pinned source and checked B2 proofs. PREPARED until its
fresh compiler/type/axiom/dependency receipts pass. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. No global dependency deletion or RH claim. -/

seal Finset.univ Finset.sum Finset.prod
open AddSubgroup Module DoubleCoset ENNReal Fintype MatMul Matrix MeasureTheory Submodule

""" + helper + "\nnamespace Filling\n\n" + (
        "variable {E : Type} [Field E] [CMType E] {𝔰 : Shape} {S : Filling E 𝔰}\n\n"
    ) + context + count + "\nend\nend Filling\n\n"
    text += """set_option Elab.async false in
run_cmd do
  let substitutions : Array (Lean.Name × Lean.Name) := #[
    """ + roster + """ ]
  -- Compare the new count before using it in any transported proof.
  let originalCount ← Lean.getConstInfo ``Filling.tsum_invPowWeight_le_of_codim_le
  let replacementCount ← Lean.getConstInfo ``Filling.b2_fused_tsum_invPowWeight_le_of_codim_le
  unless (← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq originalCount.type replacementCount.type) do
    Lean.throwError "Fused count changed its original statement type"
  for (old, replacement) in substitutions.toList.drop 1 do
    let .thmInfo info ← Lean.getConstInfo old |
      Lean.throwError "Transport source is not a checked theorem"
    let proof := info.value.replace fun expression =>
      match expression with
      | .const name levels =>
        match substitutions.find? (fun pair => pair.1 == name) with
        | some (_, target) => some (.const target levels)
        | none => none
      | _ => none
    -- Lean.addDecl invokes the ordinary kernel checker. Do not replace this
    -- with Environment.add/unchecked insertion or enable skipKernelTC.
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := replacement
      levelParams := info.levelParams
      type := info.type
      value := proof
    })
    let some value := (← Lean.getConstInfo replacement).value? (allowOpaque := true) |
      Lean.throwError "Missing newly checked proof value"
    let dependencies := value.getUsedConstants
    for (forbidden, _) in substitutions do
      if dependencies.contains forbidden then
        Lean.throwError "A transported proof retained an old supplier"
  let comparisons : Array (Lean.Name × Lean.Name) := #[
    """ + comparisons + """ ]
  for (old, replacement) in comparisons do
    let original ← Lean.getConstInfo old
    let candidate ← Lean.getConstInfo replacement
    unless (← Lean.Elab.Command.liftTermElabM do
        Lean.Meta.isDefEq original.type candidate.type) do
      Lean.throwError "Fused caller changed its original statement type"
  let required : Array (Lean.Name × Lean.Name) := #[
    (`Filling.b2_fused_outer_count, `Filling.b2_fused_tsum_invPowWeight_le_of_codim_le),
    (`Filling.b2_fused_sum_pairWeight_le, `Filling.b2_fused_tsum_invPowWeight_le_of_codim_le),
    (`Filling.b2_fused_sum_pairWeight_le, `Filling.b2_fused_outer_frameValueIndex_dvd),
    (`Filling.b2_fused_sum_pairWeight_le, `Filling.b2_fused_inner_frameValueIndex_dvd),
    (`Filling.b2_fused_energy_le_of_level_pairs, `Filling.b2_fused_sum_pairWeight_le),
    (`Filling.b2_fused_energy_le_of_level_lt, `Filling.b2_fused_energy_le_of_level_pairs),
    (`Filling.b2_fused_energy_le_of_linkEnergy_le, `Filling.b2_fused_energy_le_of_level_pairs),
    (`Filling.b2_fused_energy_le_of_linkEnergy_le, `Filling.b2_fused_energy_le_of_level_lt)]
  for (caller, supplier) in required do
    let some proof := (← Lean.getConstInfo caller).value? (allowOpaque := true) |
      Lean.throwError "Missing fused caller proof"
    unless proof.getUsedConstants.contains supplier do
      Lean.throwError "Fused caller did not consume its required supplier"
  Lean.logInfo """ + json.dumps(GUARD) + "\n"
    names = ["RHB2Fusion.skew_correction_mul", NEW_COUNT, *new_names]
    text += "\n" + "\n".join("#print axioms " + name for name in names) + "\n"
    if labelled:
        raw_label = (native.SWARM / LABEL_SOURCE).read_bytes()
        native.require(native.git_blob(raw_label) == LABEL_BLOB, "Changed peer labelled fusion")
        label_text = raw_label.decode()
        native.require(label_text.count(LAYOUT_OLD) == 1, "Changed peer theorem-record layout")
        label_text = label_text.replace(LAYOUT_OLD, LAYOUT_NEW, 1)
        suffix = "set_option Elab.async false in\nrun_cmd do\n"
        native.require(text.count(suffix) == label_text.count(suffix) == 1,
                       "Changed checked-transport boundary")
        native.require(text[text.index(suffix):] == label_text[label_text.index(suffix):],
                       "Labelled variant changed the checked-proof transport suffix")
        names = LABEL_NAMES + names
        for name in names:
            native.require("#print axioms " + name in label_text, "Missing fused label axiom probe")
        native.require('Lean.logInfo "' + LABEL_GUARD + '"' in label_text, "Missing label guards")
        text = label_text
    target = out / "active_b2_fused.lean"
    target.write_text(text)
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB,
                "original_count_source_blob": patch.BLOB, "parts": config["parts"],
                "peer_patch": config["skew_patch"], "adapter": adapter,
                "source_blob": native.git_blob(target.read_bytes()),
                "checked_input_module": obj, "substitutions": mapping,
                "theorems": names, "original_statement_comparisons": original_pairs,
                "method": "reuse checked proof expressions; normal Lean.addDecl kernel checks",
                "preferred_labelled_variant": labelled,
                "new_Lean_execution": False, "fused_chain_checked": False,
                "recursive_graph_checked": False, "full_RH_replay": False}
    if labelled:
        manifest["peer_labelled_source"] = {"source": LABEL_SOURCE, "source_blob": LABEL_BLOB}
        manifest["label_source_layout_adapter"] = {"old": LAYOUT_OLD, "new": LAYOUT_NEW,
            "reason": "Native controls require correctly aligned records and explicit CoreM-to-CommandElabM lifting"}
    native.dump(out / "fused_b2_input.json", manifest)
    return target, manifest


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path, required=True)
    p.add_argument("--module-dir", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--prepare-only", action="store_true")
    p.add_argument("--labelled", action="store_true",
                   help="Reuse the authenticated RUN80 joint labelled-uniqueness/skew variant")
    args = p.parse_args()
    root, out = args.compact_root.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    source, state = prepare(root, args.module_dir.resolve(), out, args.labelled)
    if args.prepare_only:
        print(json.dumps({"prepared_source_blob": state["source_blob"],
                          "declarations": len(state["theorems"]), "new_Lean_execution": False}))
        return
    native.require(args.lean_bin is not None, "Provide pinned Lean binary directory")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong source pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB,
                   "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    setup = subprocess.check_output(["lake", "env", "python3", "-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in "
            "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root, env=env, text=True, timeout=300)
    (out / "environment.log").write_text(setup)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    env["LEAN_PATH"] = str(args.module_dir.resolve()) + os.pathsep + env["LEAN_PATH"]
    lake = tomllib.loads((root / "lakefile.toml").read_text())
    options = list(lake.get("moreLeanArgs", [])) + list(flatten_options(lake["leanOptions"]))
    command = [str(args.lean_bin.resolve() / "lean"), *options, "-Dpp.fullNames=true",
               "-Ddebug.skipKernelTC=false", "-j", "2", "-R", out,
               "-o", out / "active_b2_fused.olean", source]
    print(json.dumps({"phase": "fused_count_and_proof_retargeting", "state": "started"}), flush=True)
    result = native.step(command, root, env, out / "compile.log", 2400)
    result.update(native.audit(out / "compile.log", state["theorems"]))
    guarded = GUARD in (out / "compile.log").read_text()
    if args.labelled:
        state["labelled_supplier_guards_observed"] = LABEL_GUARD in (out / "compile.log").read_text()
        guarded = guarded and state["labelled_supplier_guards_observed"]
    good = result["returncode"] == 0 and result["axiom_audit_ok"] is True and guarded
    state.update(new_Lean_execution=True, compiler=result, caller_guards_observed=guarded,
                 fused_chain_checked=good, native_source_build_performed=False)
    if good:
        objects = []
        for path in sorted(out.glob("active_b2_fused.olean*")):
            with path.open("rb") as stream:
                objects.append({"name": path.name, "bytes": path.stat().st_size,
                                "sha256": hashlib.file_digest(stream, "sha256").hexdigest()})
        state["compiled_module"] = {"name": "active_b2_fused", "artifacts": objects}
    native.dump(out / "fused_b2_results.json", state)
    print(json.dumps({"compiler": result, "fused_chain_checked": good, "full_RH_replay": False}), flush=True)
    native.require(good, "Fused B2 candidate failed; retain exact log and repair")


if __name__ == "__main__":
    main()
