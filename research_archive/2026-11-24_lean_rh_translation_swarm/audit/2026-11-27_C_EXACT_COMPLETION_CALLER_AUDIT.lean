import New.Endgame.LongForms
import Mathlib.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000

/-!
27 November 2026 — independent audit of the relaxed-rank C consumer
(4f5a2082c7e2ae31835e9bf43f9dcc8ea8d704d8). AGREE / PARTIAL.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7;
spine f62d03bdcd987268e70657298702a238335fb3e6;
ledger b24ae883acc131f657241e944d523013ac5432a9.
Read SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, latest peer commits
968df09c (full B2 extension), dbcfaee8 (coarse restricted moment),
440d4d62 (scalar certificate), fe3a0d59 (inner divisor reconciliation).

The proposed relaxation is valid at the C budget interface, not a
proof of the relaxed B moment. Audit the ACTUAL native supplier rather
than redo the peer scalar certificate. LongForms source blob
9eff36cf003ac398fbd24361e80e95a03d0b0e05. The source heightLe_volume_rows uses near-full rank
only in the final mono inequality. Keep the original entire basis
completion, integral block matrix, norm pairing and fit-twist family.
Replace ONLY that mono budget calculation by exact cast arithmetic.
The actual pre-mono expression is V + k*(x^99+x1^2*b^2) + 2δ
+ k*(2*m*m)*(2*t*x^999), where k = d-n from the same extension
basis, NOT Data.k. All real subtractions are explicitly cast.
Thus K=x1²b²+x^99+4m²t x^999 and C_exact:
d(H-2L) <= V+2δ+(d-n)K. No b^-2 rank restriction at this interface.
The reciprocal ratio still uses the SAME θ selected by exists_isFitFamily;
the nonvanishing witness Z is retained. Cannot cancel ratios at
different θ, or omit γ's cost (if k>0 and m,t,x>0 it is positive).
The original determinant theorem requires all conjugates, not just σ=1.

Source guards executed against pinned GitHub file contents (not Lean):
New/Exchange/CrudeRows.lean e84f4b0e67ed7dbfd727f8ec2dbf05a8d1e5440c\n  lemma Data.crude_rows
New/Exchange/CostOfSquares.lean 3842be43cd82966d3398d9929f72dd7667a62f4d\n  HeightLe (n * (2 * D.t * D.x ^ 999))
New/Rows/MonomialCoefficientVector.lean 18eefab455e1da09f1ad14995afb31a9da4c1959\n  exp (D.x ^ 99 + B)
Lib/Adelic/CuspForms/LevelForms.lean fffc85cdb75f20ad53d25ed6100b330e6b458896\n  exp (V + k * β)
New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6\n  HeightLe (α + 2 * δ + k * g)
Unique original final-mono anchor checked; reverting the replacement
restores the original body byte-for-byte. All five named source guards
succeeded. Earlier scalar certificate remains separate, no repeated
arithmetic test count or new numerical evidence claimed.
Original -> new local dependency graph: both original and candidate
retain crude_rows, exists_extend_basis_of_span_eq_top, one_determinant,
IndexLe, normSqAt_goodProjTranslate_le, covolumeSq_elim_le,
norm_inner_le_one, goodProjTranslate_mem_integralForms,
exists_isFitFamily, volume_iota_eq_prod_liftVolume, and
heightLe_volume_ratio_sq. The final near-full-rank guard and crude
b³ estimate are absent from the candidate budget statement and body;
do not retire them globally. Root-reachable A/B and all C primitive
obligations remain. Existing original and reduced graphs unchanged.
The check below rejects direct dependence on old C targets; recursive
kernel extraction and all axiom reports remain pending.

Actual current CI check: run 45998845682, job 140505122433,
in_progress, no published status.json for rh-compact-b2-energy-repair-20261127
(404 at inspection). Prior helper run 45986308748 remains scoped evidence.
No new native compilation, rh_scan, rh_prune, rh_reduce, rh_auto or
rh_auto_frontier executed: lean/lake not on local PATH.
Prepared candidate below; do not report PASS until actual replay.
Do not duplicate the active B2 cold build or edit workflows.
RESUME HERE: compile this file in the existing compact native workspace,
then inspect the exact final-mono cast adapter and the two axiom reports;
if successful submit the new C interface to the relaxed B4 integration.
-/

open Finset LinearMap Real Submodule LevelPlaces.LevelForm

variable {P} {D : Data P} {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y) (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i I hV

lemma Data.audit_heightLe_volume_rows_exact {θ} (o : D.IsFitFamily θ) :
    HeightLe (V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999))
      fun ι ↦ D.𝔷 (θ ι) / D.𝔷 (1 : D.MFoldTwist) := by
  obtain ⟨⟨e, he, I⟩, γ, hγ, s⟩ := I, D.crude_rows
  -- the basis: `z a` is the good part of the auxiliary form `ψ a`
  choose k z ψ J c using exists_extend_basis_of_span_eq_top i ((s ▸ span_image
    (D.goodProjTranslate 1)).trans (by simp [range_smul, NeZero.ne, Module.End.one_eq_id]; rfl))
  choose ψ hψ ez using ψ
  -- size and completion; the matrices of the index, extended by the scalar of the auxiliary forms
  refine (one_determinant D.Θ (by simp) J (by simpa) (fun _ ↦ norm_map_det_gram_le fun σ ↦
    Sum.comp_elim .. ▸ covolumeSq_elim_le (ez · ▸ normSqAt_goodProjTranslate_le ((hψ _).2 σ))
    (hV σ)) (by simp) (hγ θ o) he (fun _ j ↦ (integralForms ⟨j⟩).carrier) k (fun ι j _ a _ b ↦ ?_)
    fun ι j ↦ (I _ ⟨j⟩ _ (o.1 ι)).imp' ((algebraMap ..).mapMatrix · |>.fromBlocks 0 0 ((γ (θ ι) /
    γ 1 : ℂ) • 1)) fun _ ↦ .imp (by grw [·]; simp [← RingHom.map_det, -RingHom.mapMatrix_apply])
    (by simpa [Matrix.one_apply] using! And.intro · fun a ↦ ez a ▸
    goodProjTranslate_mem_integralForms ⟨j⟩ ((hψ a).1 _ _ ⟨j⟩ (o.1 ι)) 1)).mono (by
    have hc : (D.rowDim : ℝ) = (n : ℝ) + (k : ℝ) := by exact_mod_cast c
    have hk : (k : ℝ) = (D.rowDim : ℝ) - (n : ℝ) := by linarith only [hc]
    apply le_of_eq
    push_cast
    rw [hk]
    ring) fun _ ↦ le_rfl
  simpa using (norm_inner_le_one _ _ ⟨j⟩
    (fun g ↦ by erw [D.classAut_eq_bot_of_le_chosenLevel (Subgroup.map_mono fun _ h ↦
    funext fun _ ↦ (h (.inl _) ⟨⟩).2) (by bound [D.card_Y_le .refl])]) a b :)

lemma Data.audit_integral_forms_long_exact :
    D.rowDim * (D.mainHeight - 2 * (D.logB * D.budget)) ≤
      V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999) := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  have formula : 0 ≤ 2 * (V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ) ^ 2 * D.t * D.x ^ 999)) +
      2 * D.rowDim * (2 * (D.logB * D.budget) - D.mainHeight) :=
    ((((Data.audit_heightLe_volume_rows_exact i I hV o).pow 2).mul
      (heightLe_volume_ratio_sq o)).mono le_rfl (by simp [field]; simp [(Z _).1])).nonneg
  linarith only [formula]

#print axioms Data.audit_heightLe_volume_rows_exact
#print axioms Data.audit_integral_forms_long_exact

run_cmd do
  for nm in #[``Data.audit_heightLe_volume_rows_exact, ``Data.audit_integral_forms_long_exact] do
    let info ← Lean.getConstInfo nm
    let some value := info.value? | Lean.throwError "missing proof value"
    let deps := value.getUsedConstants
    for forbidden in #[``Data.heightLe_volume_rows, ``Data.integral_forms_long] do
      if deps.contains forbidden then
        Lean.throwError "Old rank-restricted C target used directly"
    if nm == ``Data.audit_heightLe_volume_rows_exact then
      unless deps.contains ``one_determinant do
        Lean.throwError "Expected determinant consumer absent"
    else
      unless deps.contains ``Data.audit_heightLe_volume_rows_exact do
        Lean.throwError "Exact height replacement absent"
  Lean.logInfo "C audit: direct replacement dependencies checked (not recursive root graph)"
