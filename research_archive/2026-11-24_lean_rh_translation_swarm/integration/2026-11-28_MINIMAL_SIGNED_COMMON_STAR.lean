import JointABRun63
import B2BothEnergyPaths
import RHRun90Shells
import C2SquaredStarMinimal
import EditorOneSidedRankStar
import Lean

/-!
# Integration: minimal signed-height and one-sided rank star
28 November 2026. SOURCE-MATCHED / PREPARED, not native replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, handoff, expansion, research state/protocol and latest peer
commits read. The preferred C is now the squared cancellation; editor
1c21daa8 removes the absolute remainder estimate from the final algebra.

Actual integration obstruction: importing the previous IntegrationFiniteShellStar
together with C2SquaredStarMinimal is not a valid independent replay plan.
IntegrationFiniteShellStar -> IntegrationBothEnergyStar -> JointABCStarRun88
-> C2FusedToStar -> C2SingleWitnessToStar -> C2SingleWitnessCombined.
The last module and the new C2SquaredStarMinimal separately DECLARE the
same two global constants c2_isAlgebraic_of_arch and c2_heightLe_nonneg_arch.
The older C chain also imposes an unnecessary root-extraction replay
prerequisite. This is a source-level name collision, not an observed Lean
diagnostic. Do not compile both variants in one import environment.

Resolution: retain exactly the four A/B-only common-map/B2 transports
and twelve finite-shell A/B transports from the prior integration;
drop ONLY their two terminal star declarations and the dependency on
JointABCStarRun88. Use JointABRun63 directly. Fuse into one file to avoid
extra intermediate star modules. The old modules are preserved in archive
and should be audited separately, not imported with this variant.
The terminal star uses editor_one_sided_rank_star with exactly three
supplier replacements (family, positivity, C); use the already prepared
C2SquaredStarMinimal C theorem, not another copy of the archimedean pair.
No assumption of success for any uncompiled import. The later theta
rank-only and Galois finite-budget candidates remain independent pending
replays; no claim they are selected here.

Exact math, SAME native D, n,y,index delta, H,L,S=mR and d:
  d(H-3L) <= n(H-S+L)+2delta
  nS <= -(d-n)H + (3d+n)L + 2delta
  <= d(4*x^99+4L+10*log(1+b^2)*budget).
Retain editor's -H<=b^2*x^99, d>0, n>=d/2, n<=d,
gap<=4d/b^2, index and factor-two HasLogBound scale comparison.
Use the native two signed HeightLe estimates on the SAME ratio r,
multiply r^2*r^-2=1 before the product formula. No extra assumption
on sign of H,S or on absolute remainder, no new data/twist selection.
Conclusion S<=logB^2*budget as before. Other crude/primeSum and
arithmetic suppliers remain wherever reachable. No new math claimed
beyond peer derivations; this is a caller integration and replay cut.

Source anchors (exact blobs):
 previous BOTH 26a1965f8ef58960b7045fcc32ab65f795a9d22b; shell 3debce1835002d8b0f53be6dbed3c53cd6221c6a;
 editor one-sided e09f51973aa3aafef17f8bf7a0011220e846a5ad; minimal C 1bd5f9339e7a588439173ccb8be396f208cfb120;
 combined old C 4be058901f7072efd82b3711281fae7b913f1712; RUN88 3b1778e1a282bc6af1481506c4a6bec497ee7989;
 old fused C 535c2f6a161a3eb569ddc0250707d55059fd706e; old witness caller e81bcf8064bf50effbbccf7f87b565e068bf2304.
 Native New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
 (not imported); New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05;
 New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a;
 New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444.
 Previous graph receipts retained. B3 run 46082365501 receipt
 e8e0f2b74b30ae902042f24852d1c673402ed239 re-read actual
 all_requested_checks_ok=true, full_RH_replay=false. C2 family receipt
 413058eacfda8683f5fb28c68148fd45d1bf1770 remains local scope only.
 No new native engine, Lean or graph run here. Source checks executed
 in connector JS: 12 unique anchors, 24 deleted/duplicated controls,
 exact 4+12 retained transport calls and 1 new final transport,
 seven old direct imports absent from new import list. These are
 text checks, NOT kernel or transitive reachability evidence.

RESUME HERE: in the retained authenticated compact cache, compile the
 existing staged JointABRun63, B2BothEnergyPaths, RHRun90Shells,
 C2SquaredStarMinimal and editor source (as EditorOneSidedRankStar),
 then THIS file as IntegrationMinimalSignedStar, without importing the
 superseded C2SingleWitnessCombined or previous full integration stars.
 Require 17 FINITE_SHELL_STAR markers, MINIMAL_SIGNED_STAR_GUARDS_OK,
 normal-kernel exit 0 and all standard axiom reports. Compare
 run91_original_star_control and integration_minimal_signed_star
 using strict constructor-inclusive exporter; retain original/reduced
 graphs and inspect actual old finite shell, old C, old crude and root
 helper membership (direct guards are not sufficient). On first failed
 prerequisite repair its actual diagnostic; do not rebuild cached source.
 No Main import, no RH proof or closure. HANDOFF TO shared compute,
 editor, character boxes, kernel and audit.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Lean in
private def finiteShellTransport (old fresh : Name)
    (pairs : Array (Name × Name)) : Elab.Command.CommandElabM Unit := do
  let .thmInfo orig ← getConstInfo old | throwError "FINITE_SHELL_STAR expected theorem {old}"
  let before := orig.value.getUsedConstants
  let typeEdges := orig.type.getUsedConstants
  for (a,b) in pairs do
    let ai ← getConstInfo a
    let bi ← getConstInfo b
    let same ← Elab.Command.liftTermElabM do Meta.isDefEq ai.type bi.type
    unless ai.levelParams == bi.levelParams && same do
      throwError "FINITE_SHELL_STAR type/universe mismatch: {a} -> {b}"
    unless before.contains a && !before.contains b && !typeEdges.contains a do
      throwError "FINITE_SHELL_STAR expected proof-only edge: {old} -> {a}"
  let value := orig.value.replace fun e =>
    match e with
    | .const n us =>
      match pairs.find? (fun p => p.1 == n) with
      | some p => some (.const p.2 us)
      | none => none
    | _ => none
  Elab.Command.liftCoreM <| addDecl (.thmDecl {
    name := fresh, levelParams := orig.levelParams,
    type := orig.type, value := value })
  let .thmInfo checked ← getConstInfo fresh | throwError "FINITE_SHELL_STAR missing proof"
  unless checked.type == orig.type && checked.levelParams == orig.levelParams do
    throwError "FINITE_SHELL_STAR changed statement"
  let expected := before.map fun n =>
    match pairs.find? (fun p => p.1 == n) with
    | some p => p.2
    | none => n
  let got := checked.value.getUsedConstants
  unless expected.all (fun n => got.contains n) && got.all (fun n => expected.contains n) do
    throwError "FINITE_SHELL_STAR unintended direct graph delta: {fresh}"
  unless !got.contains old && pairs.all (fun p => !got.contains p.1 && got.contains p.2) do
    throwError "FINITE_SHELL_STAR stale supplier: {fresh}"
  let axs ← collectAxioms fresh
  unless axs.all (fun n => #[``propext, ``Classical.choice, ``Quot.sound].contains n) do
    throwError "FINITE_SHELL_STAR nonstandard axiom: {fresh}"
  logInfo m!"FINITE_SHELL_STAR|{fresh}"

open Lean in
run_cmd do
  finiteShellTransport ``Data.ramifiedColumns_fill_rows_run87 `Data.integration_both_spread
    #[(``Filling.Fits.exists_translate_finrank_comap_le,
       ``Filling.Fits.exists_translate_finrank_comap_le_b2_joined)]
  finiteShellTransport ``Data.finrank_rows_ne_zero_run87 `Data.integration_both_rows
    #[(``Data.ramifiedColumns_fill_rows_run87, `Data.integration_both_spread)]
  finiteShellTransport ``Data.enough_forms_run63 `Data.integration_both_enough
    #[(``Data.ramifiedColumns_fill_rows_run87, `Data.integration_both_spread),
      (``Data.finrank_rows_ne_zero_run87, `Data.integration_both_rows)]
  finiteShellTransport ``Data.exists_family_covolumeSq_le_run63 `Data.integration_both_family
    #[(``Data.enough_forms_run63, `Data.integration_both_enough)]
  let shell := (``IntegralPlace.IsStdLevel.lintegral_shells_le,
    ``IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart)
  finiteShellTransport ``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top
    `IntegralPlace.IsStdLevel.integral_finite_via_shell #[shell]
  finiteShellTransport ``IntegralPlace.IsStdLevel.enorm_floorForm_le
    `IntegralPlace.IsStdLevel.floor_bound_via_shell #[shell]
  finiteShellTransport ``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
    `IntegralPlace.IsStdLevel.zero_bound_via_shell #[shell]
  finiteShellTransport ``Filling.IsFillingLevel.exists_finite_sieveSystem
    `Filling.IsFillingLevel.finite_system_via_shell
    #[(``IntegralPlace.IsStdLevel.lintegral_formMajorant_ne_top,
       `IntegralPlace.IsStdLevel.integral_finite_via_shell),
      (``IntegralPlace.IsStdLevel.enorm_floorForm_le,
       `IntegralPlace.IsStdLevel.floor_bound_via_shell),
      (``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term,
       `IntegralPlace.IsStdLevel.zero_bound_via_shell)]
  finiteShellTransport ``Filling.re_trace_besselS_le `Filling.trace_via_shell
    #[(``IntegralPlace.IsStdLevel.floorZeroForm_le_main_term,
       `IntegralPlace.IsStdLevel.zero_bound_via_shell)]
  finiteShellTransport ``Filling.energy_fixingSet_le_b2_joined `Filling.fixing_energy_via_shell
    #[(``Filling.IsFillingLevel.exists_finite_sieveSystem,
       `Filling.IsFillingLevel.finite_system_via_shell)]
  finiteShellTransport ``Filling.sum_le_of_positive_type_b2_joined `Filling.positive_type_via_shell
    #[(``Filling.energy_fixingSet_le_b2_joined, `Filling.fixing_energy_via_shell)]
  finiteShellTransport ``Filling.Fits.exists_translate_finrank_comap_le_b2_joined
    `Filling.Fits.rank_via_shell
    #[(``Filling.re_trace_besselS_le, `Filling.trace_via_shell),
      (``Filling.sum_le_of_positive_type_b2_joined, `Filling.positive_type_via_shell)]
  finiteShellTransport ``Data.integration_both_spread `Data.finite_shell_spread
    #[(``Filling.Fits.exists_translate_finrank_comap_le_b2_joined, `Filling.Fits.rank_via_shell)]
  finiteShellTransport ``Data.integration_both_rows `Data.finite_shell_rows
    #[(``Data.integration_both_spread, `Data.finite_shell_spread)]
  finiteShellTransport ``Data.integration_both_enough `Data.finite_shell_enough
    #[(``Data.integration_both_spread, `Data.finite_shell_spread),
      (``Data.integration_both_rows, `Data.finite_shell_rows)]
  finiteShellTransport ``Data.integration_both_family `Data.finite_shell_family
    #[(``Data.integration_both_enough, `Data.finite_shell_enough)]

  finiteShellTransport ``editor_one_sided_rank_star `integration_minimal_signed_star
    #[(``Data.exists_family_covolumeSq_le, `Data.finite_shell_family),
      (``Data.finrank_rows_ne_zero, `Data.finite_shell_rows),
      (``Data.integral_forms_long, ``Data.run90_squared_witness_integral_forms_long)]
  let control ← getConstInfo ``run91_original_star_control
  let fresh ← getConstInfo `integration_minimal_signed_star
  let same ← Elab.Command.liftTermElabM do Meta.isDefEq control.type fresh.type
  unless same && control.levelParams == fresh.levelParams do
    throwError "MINIMAL_SIGNED_STAR exact original statement changed"
  for (root, required, forbidden) in #[
    (`Filling.fixing_energy_via_shell, #[``Filling.b2_fused_energy_le_of_linkEnergy_le],
      #[``Filling.IsFillingLevel.exists_finite_sieveSystem]),
    (`Filling.Fits.rank_via_shell, #[``Filling.sum_norm_amplitudeSum_le_b2_joined],
      #[``Filling.re_trace_besselS_le]),
    (`Data.finite_shell_spread, #[``Data.ramifyingOp_finrank_comap_and_short_run84,
      ``Data.filling_fits_run87, ``Data.columnCoords_run87],
      #[``Filling.Fits.exists_translate_finrank_comap_le]),
    (`Data.finite_shell_family, #[``Data.short_forms_run62], #[``Data.enough_forms_run63]),
    (``Data.run90_squared_witness_integral_forms_long,
      #[``c2_exists_isFitFamily, ``c2_heightLe_nonneg_arch, ``HeightLe.pow, ``HeightLe.mul],
      #[`c2_heightLe_single_witness_budget, ``HeightLe.nonneg, ``exists_isFitFamily]),
    (`integration_minimal_signed_star,
      #[``Data.editor_abs_mainHeight_le, `Data.finite_shell_family, `Data.finite_shell_rows,
        ``Data.run90_squared_witness_integral_forms_long],
      #[``Data.abs_mainHeight_add_remainder_le, ``Data.integral_forms_long,
        ``Data.exists_family_covolumeSq_le, ``Data.finrank_rows_ne_zero,
        `run87_fused_star_inequality, `integration_finite_shell_star])] do
    let info ← getConstInfo root
    let some v := info.value? (allowOpaque := true) | throwError "MINIMAL_SIGNED_STAR missing value"
    let deps := v.getUsedConstants
    unless required.all (fun x => deps.contains x) &&
        forbidden.all (fun x => !deps.contains x) do
      throwError "MINIMAL_SIGNED_STAR lost supplier or retained stale direct edge: {root}"
  logInfo "MINIMAL_SIGNED_STAR_GUARDS_OK"

open Real Data Parameters in
example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  integration_minimal_signed_star

#print axioms run91_original_star_control
#print axioms editor_one_sided_rank_star
#print axioms Data.run90_squared_witness_integral_forms_long
#print axioms Data.finite_shell_family
#print axioms Data.finite_shell_rows
#print axioms integration_minimal_signed_star
