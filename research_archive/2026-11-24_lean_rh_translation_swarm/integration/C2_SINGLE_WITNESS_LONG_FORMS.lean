import C2SingleWitnessCombined
import New.Endgame.LongForms
import Lean

/-! Proposed actual lower-bound caller of the single-witness junction.
The original rows, index, covolume, fit family and both signed volume-height
suppliers are retained. This checks integration of the junction, not closure
or replacement of those deep suppliers. No native acceptance is claimed
until this complete original-statement replacement has been replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Finset LinearMap Real Submodule LevelPlaces.LevelForm

variable {P} {D : Data P} {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y) (hn : (1 - 4 / D.b ^ 2) * D.rowDim ≤ n)
  (I : D.IndexLe y δ) (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i hn I hV

lemma Data.c2_integral_forms_long_single_witness :
    D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤ V + 2 * δ := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  let w : PrimePadicIso → ℂ := fun ι ↦ D.𝔷 (θ ι) / D.𝔷 (1 : D.MFoldTwist)
  have hrows : HeightLe (V + 2 * δ + D.rowDim * D.b) w :=
    heightLe_volume_rows i hn I hV o
  have hreciprocal : HeightLe (2 * (D.rowDim *
      (2 * (D.logB * D.budget) - D.mainHeight))) (w⁻¹ ^ 2) :=
    (heightLe_volume_ratio_sq o).mono (le_of_eq (by ring)) (by
      intro ι
      exact (congrArg (fun z : ℂ ↦ ‖ι.2 z‖)
        (show (w⁻¹ ^ 2) ι = D.𝔷 (1 : D.MFoldTwist) ^ 2 / D.𝔷 (θ ι) ^ 2 by
          simp only [Pi.pow_apply, Pi.inv_apply, w, inv_div, div_pow])).le)
  have hnonzero (ι : PrimePadicIso) : w ι ≠ 0 :=
    div_ne_zero (Z (θ ι)).1 (Z (1 : D.MFoldTwist)).1
  have bound := c2_heightLe_single_witness_budget hrows hreciprocal hnonzero
  nlinarith [(by gcongr; exact D.le_of_hasLogBound :
    D.rowDim * D.b ≤ D.rowDim * (D.logB * D.budget))]

#print axioms Data.c2_integral_forms_long_single_witness

run_cmd do
  let old ← Lean.getConstInfo ``Data.integral_forms_long
  let new ← Lean.getConstInfo ``Data.c2_integral_forms_long_single_witness
  let same ← Lean.Elab.Command.liftTermElabM do Lean.Meta.isDefEq old.type new.type
  unless old.levelParams == new.levelParams && same do
    Lean.throwError "Single-witness lower bound changed the original data or row premises"
  let some body := new.value? (allowOpaque := true) |
    Lean.throwError "Missing actual lower-bound proof"
  for name in #[``c2_heightLe_single_witness_budget, ``exists_isFitFamily,
                ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq,
                ``Data.volume_iota_eq_prod_liftVolume] do
    unless body.getUsedConstants.contains name do
      Lean.throwError "Actual lower-bound caller lost a required native supplier"
  if body.getUsedConstants.contains ``Data.integral_forms_long then
    Lean.throwError "Actual lower-bound caller retained its original target alias"
  Lean.logInfo "C2_SINGLE_WITNESS_LONG: complete original lower bound; same rows, fit family and signed height suppliers"
