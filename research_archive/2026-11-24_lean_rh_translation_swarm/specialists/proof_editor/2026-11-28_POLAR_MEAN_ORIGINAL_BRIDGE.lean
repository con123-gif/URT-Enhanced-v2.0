import EditorPolarMean

/-! 28 November 2026. PREPARED, not compiled. Original statement bridge for
IsPolar.exists_window_sub_mul_le, native OneSidedCriterion.lean
93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3, compact
72fead102f663d5c7a407964a13dc0cf9d977207.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Strict mean implies the original existence: otherwise multiply the
pointwise opposite inequality by W>=0 and integrate, contradicting
the strict mean. No division by integral W, positive-measure lemma
or new integrability hypothesis. Original theorem not a proof input.
-/
set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
open Complex Filter Nat Real Set MeasureTheory Topology

lemma IsPolar.editor_window_from_mean {E r E' r'} (h : IsPolar E r)
    (h' : IsPolar E' r') : ∀ᶠ t in atTop, ∀ X ∈ Icc 0
    t.exp, ∃ u ∈ Icc t (t ^ 2), E u - X * E' u ≤ (-t).exp := by
  filter_upwards [h.editor_eventually_window_mean h', mem_atTop (9 : ℝ)] with t ht ht9
  intro X hX
  obtain ⟨iW, iQ, hmean⟩ := ht X hX
  let k := ⌈t ^ 2 / 9⌉₊
  let W (v : ℝ) := v ^ k * (-3 * v).exp
  change IntegrableOn W (Icc t (t ^ 2)) at iW
  change IntegrableOn (fun v => W v * (E v - E' v * X)) (Icc t (t ^ 2)) at iQ
  change (∫ v in Icc t (t ^ 2), W v * (E v - E' v * X)) <
    (-t).exp * (∫ v in Icc t (t ^ 2), W v) at hmean
  by_contra! N
  have hm : (∫ v in Icc t (t ^ 2), (-t).exp * W v) ≤
      ∫ v in Icc t (t ^ 2), W v * (E v - E' v * X) := by
    apply setIntegral_mono_on (iW.const_mul _) iQ measurableSet_Icc
    intro v hv
    have hv0 : 0 ≤ v := le_trans (by linarith) hv.1
    have hw0 : 0 ≤ W v := by dsimp [W]; positivity
    have hn : (-t).exp ≤ E v - E' v * X := by
      rw [mul_comm (E' v) X]
      exact (N v hv).le
    simpa only [mul_comm ((-t).exp) (W v)] using
      mul_le_mul_of_nonneg_left hn hw0
  rw [integral_const_mul] at hm
  exact (not_le_of_gt hmean) hm

#print axioms IsPolar.editor_window_from_mean
open Lean in
run_cmd do
  let n := ``IsPolar.editor_window_from_mean
  let old := ``IsPolar.exists_window_sub_mul_le
  let a ← getConstInfo n
  let b ← getConstInfo old
  unless a.type == b.type do
    let same ← Elab.Command.liftTermElabM (Meta.isDefEq a.type b.type)
    unless same do throwError "EDITOR_POLAR_BRIDGE original type mismatch"
  let axs ← collectAxioms n
  unless axs.all (fun x => #[``propext, ``Classical.choice, ``Quot.sound].contains x) do
    throwError "EDITOR_POLAR_BRIDGE nonstandard axiom"
  let some v := a.value? (allowOpaque := true) | throwError "EDITOR_POLAR_BRIDGE missing value"
  unless v.getUsedConstants.contains ``IsPolar.editor_eventually_window_mean do
    throwError "EDITOR_POLAR_BRIDGE missing mean supplier"
  if v.getUsedConstants.contains old then
    throwError "EDITOR_POLAR_BRIDGE circular old theorem"
  logInfo "EDITOR_POLAR_BRIDGE_GUARDS_OK"
