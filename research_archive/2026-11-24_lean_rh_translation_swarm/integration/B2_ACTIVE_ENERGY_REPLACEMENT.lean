import active_b2_callers
import New.Filling.CrudeEnergy
import Mathlib.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000

/-!
Prepared actual energy consumer of the active pair-weight replacement.
Not replayed until a native result says otherwise. Exact original source
and all quantitative, level, same-data, measure and positivity premises retained.
Only the final pair-weight supplier is replaced. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

open Fin Classical ENNReal Matrix MeasureTheory MulAction Set

variable {E : Type} [Field E] [CMType E] {𝔰 : Shape} {S : Filling E 𝔰}

attribute [-instance] IdemSemiring.toCanonicallyOrderedAdd IdemSemiring.toMulLeftMono
  IdemSemiring.toMulRightMono
attribute [local instance high] Side.cut
attribute [local irreducible] Filling.classGauge Filling.mainEnergy Filling.saturationIndex
  Filling.termPosition Filling.frameValueIndex link

variable [StablyUnram E]
variable [ok : S.IsAdmissible] {C w : ℝ} (hC : 0 ≤ C) {Ω : Set _} {T X} (hT : S.IsStable T)
  (h₁ : (∃ γ ∈ T, ∃ c c', ∃ s ∈ Ω, γ ∈ S.termsOver c s c' ∧ IsNormalForm 0 γ) →
  S.tailScale ^ 20 * S.besselEnergy ≤ C)
  (hx : X ≠ 0) (hq : ∀ s ∈ Ω, S.FixesNormAtLeast s X) (hw : 0 ≤ w) (hz : S.besselEnergy ≤ C)
include hC hT h₁ hx hq hw hz

lemma Filling.b2_active_energy_le_of_level_pairs j R (hc : ∀ γ ∈ T, S.HasLevel j γ) (h₂ : 𝔰.ϱ < j →
  (∃ Λ, Λ ∉ R) → S.tailScale ^ 12 / X ^
  𝔰.k * S.mainEnergy ≤ C) (h : linkEnergy T Ω R ≤ .ofReal (w * S.unipCovolume ^ 2)) : energy
  (S.amplitudeSum T) Ω ≤ w + C / S.b ^ 30 / 4 ^ j.rev.1 := S.of_size_bounds fun g t u z v y ↦ by
  intros; simp_rw [energy, ← Finset.sum_div]; grw [div_le_iff₀, ← ofReal_le_ofReal_iff, add_mul,
    ofReal_add, ← h, ← (?_ : ∑ c, ∑ c', ∑' (a) (b),
    .ofReal (C / S.tailScale ^ 3 * S.unipCovolume ^ 2) * (S.pairWeight j c
    c' b a + S.pairWeight j c c' a b) ≤ .ofReal _), linkEnergy] <;> try positivity
  simp (disch := intros; positivity) [← Finset.sum_subtype_eq_sum_filter, ofReal_sum_of_nonneg]
  have m {α β : Type} (f : α → ℝ≥0∞) g : tsum f * tsum g = ∑' p : α × β, f p.1 * g p.2 := by simp
  have B Λ := enorm_amplitudeSum_le_classSize (T :=
    T ∩ link ⁻¹' {Λ}) (by grind [IsStable, link_besselU_mul]) (hc · ·.1)
  simp_rw [amplitudeSum, ← ((summable_amplitude T ..).hasSum.tsum_fiberwise (link ∘ (·.1))).tsum_eq]
  grw [enorm_tsum_le_tsum_enorm]; simp_rw [← tsum_image _ injOn_subtype_val, tsum_subtype
    (_ '' _), preimage_comp, Subtype.image_preimage_coe, T.inter_right_comm _ (_ ⁻¹' _),
    ← tsum_subtype, ← amplitudeSum.eq_1, sq, m, ← ENNReal.summable.tsum_add_tsum_compl
    (s := Function.diag '' R) (by simp), Finset.sum_add_distrib]
  gcongr; exact ((Equiv.Set.image _ R fun _ _ ↦ by simp).tsum_eq _).ge
  grw [ENNReal.sum_le_tsum, B, B]; simp_rw [m, ← ENNReal.tsum_mul_left, ← ENNReal.tsum_sigma]
  refine (ENNReal.tsum_le_tsum fun ⟨s, π, ⟨γ, ⟨⟨m, e⟩, a⟩, n⟩, γ', ⟨⟨m', e'⟩, a'⟩, _⟩ ↦ ?_).trans
    (tsum_comp_le_tsum_of_injective (f := fun ⟨_, _, a, b⟩ ↦ ⟨a, b⟩) ?_ _);
  (iterate 2 rintro ⟨⟨⟩, ⟨⟨⟩⟩, ⟨_, ⟨⟨⟨_, ⟨⟩⟩, ⟨⟩, ⟨⟩, ⟨⟩⟩⟩⟩, _, ⟨⟨⟨_, ⟨⟩⟩⟩⟩⟩); rintro ⟨⟩; rfl; dsimp
  have k := hc _ m; apply hc at m'; specialize hq _ s.2; obtain ⟨⟨i, r, l, L⟩, ⟨-, ⟨d⟩⟩, ⟨-, ⟨d'⟩⟩,
    ⟨⟨_, p⟩, -⟩, ⟨⟨-, q⟩⟩⟩ := pairInvariant_mul_le n.1 a k hq a' m',
    one_le_xRowsIndex_and_saturationIndex a k, one_le_xRowsIndex_and_saturationIndex a' m',
    exists_link_split_le_classGauge n.1 a k hq γ', exists_link_split_le_classGauge n.1 a' m' hq γ
  unfold pairWeight termWeight invPowWeight pairInvariant commonLink classSize countWeight at *; set
    D := ite (𝔰.ϱ < j) S.mainEnergy _
  have H : S.tailScale ^ 4 * D * (2 * S.tailScale ^ 2) ^ (j - 𝔰.ϱ) * S.codimFactor ^ i / ite
    (𝔰.ϱ < j ∧ i = 0) X 1 ^ 𝔰.k ≤ C / S.tailScale ^ 3
  · clear * - t u v y h₂ h₁ l k m a e e' hz
    induction' j using lastCases with j <;> simp [Nat.sub_eq_zero_of_le, D, is_le, ← not_le]
    · cases i; · grw [← h₂ (by simp) ⟨π.1.1, by grind⟩, t]; simp [field]; bound
      grw [pow_le_of_le_one _ codimFactor_le_one, ← hz, ← ok.mainEnergy_le,
        t] <;> simp [field] <;> bound
    grw [codimFactor_le_one]; rcases j with ⟨⟨⟩⟩
    · grw [← h₁ ⟨_, m, _, _, _, s.2, a, k.1⟩]; simp [field]
    grw [← hz, ← le_self_pow₀] <;> simp [field] <;> bound
  repeat rw [ite_eq_left (by simp [*]; use s)]
  rw [inf_comm (link γ')] at *; have M := L; grw [z] at L
  nth_grw 1 [← show 1 ≤ ite _ X 1 by lia, ← d, ← d', ← g, ← p, ← q] at M; grw [tsub_le_iff_left.2
    (r.trans_eq (add_assoc ..)), ← H, mul_add, ← (ENNReal.pow_le_pow_left_iff (by simp)).1 (.trans
    ?_ ((mul_le_mul' le_self_add le_add_self).trans (sq _).ge))]; simp (disch := positivity) only
    [D, ← ofReal_mul, ← ofReal_pow, ← div_le_iff₀'] at *; nth_grw 2 [pow_succ _ 𝔰.k, ← M]
  grw +useKAbstract [← L]; simp (disch := positivity) only [mul_pow, div_pow, Real.sq_sqrt,
    (submoduleIndex ..).cast_mul, submoduleIndex_smul_intVectors S.gIdele_mem, Fintype.card_subtype,
    card_filter_val_lt, S.gIdele_val ▸
    genIndex_natCast _]; congr! 1; field; any_goals nlinarith only [t]
  simp [ENNReal.tsum_add, ← Finset.mul_sum]
  grw [ENNReal.tsum_comm.le, b2_active_sum_pairWeight_le]
  simp (disch := positivity) only [← ofReal_mul, ← ofReal_add, ofReal_le_ofReal_iff, field]
  ring_nf; grw +useKAbstract [show 4 ≤ S.b by linarith, ← pow_le_tailScale (e := 𝔰.ϱ + 1 - j + 31)
    (le_mul_of_le_of_one_le (by lia) NeZero.one_le)]; ring_nf; rfl

#print axioms Filling.b2_active_energy_le_of_level_pairs
#check @Filling.b2_active_energy_le_of_level_pairs

run_cmd do
  let info ← Lean.getConstInfo ``Filling.b2_active_energy_le_of_level_pairs
  let original ← Lean.getConstInfo ``Filling.energy_le_of_level_pairs
  let sameType ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq original.type info.type
  unless sameType do
    Lean.throwError "Energy replacement has a different original declaration type"
  let some value := info.value? |
    Lean.throwError "Energy replacement has no inspectable proof value"
  let deps := value.getUsedConstants
  if deps.contains ``Filling.energy_le_of_level_pairs then
    Lean.throwError "Energy replacement calls its original target"
  if deps.contains ``Filling.sum_pairWeight_le then
    Lean.throwError "Energy replacement calls the old pair-weight theorem"
  unless deps.contains ``Filling.b2_active_sum_pairWeight_le do
    Lean.throwError "Energy replacement does not consume the new pair-weight caller"
  Lean.logInfo "B2_ACTIVE_ENERGY: original declaration type matches; replacement pair bound consumed; original targets absent from direct proof dependencies"
