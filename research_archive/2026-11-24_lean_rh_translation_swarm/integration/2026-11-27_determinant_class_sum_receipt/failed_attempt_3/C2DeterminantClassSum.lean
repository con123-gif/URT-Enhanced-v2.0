import C2DeterminantExchange
import Mathlib.Tactic

/-! Restricted real matching and the original determinant class-sum statement.
Prepared consumer attachment, not accepted until its complete kernel replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

seal Finset.univ Finset.sum Finset.prod

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Subgroup Fintype IsLevel MatMul Matrix MeasureTheory Space WeilData Ideal.Quotient

section
variable {E n : Type} [Field E] [CMType E] [WeilData E] [Fintype n]

lemma c2_empty_matching (he : Even (card n)) (hn : 2 ≤ card n)
    (ι : NumberField.InfinitePlace E → Type) [∀ τ, Fintype (ι τ)] :
    ∃ C, ∀ {𝔪 α χ}, IsTameFor 𝔪 α (fun τ ↦ -(card (ι τ) : ℤ)) χ →
      ∃ c, ‖c‖ ^ 2 = C / lValueProd 𝔪.places
        (α⁻¹ * upsilonU1 ^ (card n / 2)) (card n / 2) ∧ ∀ η β g,
        c * stdClassSum (Kf E n)
          (modKernelI (stdSpace E n) α β 𝔪 (fun A ↦ χ A.det)
            (renameRowsCols id ((Equiv.sumEmpty n Empty) ∘ Sum.inl)
              (stackedDetProd (Equiv.emptySum Empty n) η)) g ·) =
        ∫ x, modKernel (stdSpace E Empty) (stdSpace E n) (α / β) α 𝔪
          (1 : Matrix n Empty 𝔪.ResRing → ℂ)
          (matchedPoly (ι := ι) (Equiv.sumEmpty Empty Empty) (Equiv.sumEmpty n Empty) η)
          x g ∂(stdSpace E Empty).quotMeasure := by
  choose Q₀ κ hκ using real_matching (E := E) (Equiv.sumEmpty Empty Empty)
    (Equiv.sumEmpty n Empty) (Equiv.emptySum Empty n) (ι := ι) rfl
  have hd : card n = 2 * (card n / 2) := by rcases he with ⟨k, hk⟩; omega
  have hμ : ∀ q : NumberField.InfinitePlace E,
      (card n : ℤ) ≤ 2 * ((card (ι q) : ℤ) + (card n / 2 : ℕ)) := by
    intro q
    omega
  obtain ⟨C, x, _, H⟩ := c2_determinant_exchange (n := n) hd hn hμ
    (weightedNorm_polyVector_ne_top · Q₀)
  constructor
  intro 𝔪 α χ hα
  letI : α.HasWeight (fun τ ↦ -(card (ι τ) : ℤ)) hα.2.choose := hα.2.choose_spec.1
  have ht : IsTameFor 𝔪 (α⁻¹ * upsilonU1 ^ (card n / 2))
      (fun τ ↦ (card (ι τ) : ℤ) + (card n / 2 : ℕ)) χ⁻¹ := by
    simpa using hα.inv.mul (hasWeight_upsilonU1_pow (card n / 2))
  obtain ⟨c, _, q, hc⟩ := H 𝔪 _ _ ht
  have hP : IsPartner ⊤ (Equiv.emptySum Empty n) χ⁻¹ (fun A ↦ χ A.det)
      (1 : Matrix n Empty 𝔪.ResRing → ℂ) := by
    simpa [det_apply, ← Pi.one_def, funext_iff, prod_empty] using
      partner_block (Equiv.emptySum Empty n) χ⁻¹ (1 : Matrix n Empty 𝔪.ResRing → ℂ)
  refine ⟨κ x / c, ?_, fun η β g ↦ ?_⟩
  · rw [norm_div, div_pow, q, div_div]
  · obtain ⟨⟨L, hL⟩, hv⟩ :=
      (pairThetaKer (stdSpace E n) (stdSpace E n) α 1).swap.exists_clm_lift
        (isAutomorphic_const _ 1).mem_rapidFunctions,
      realPairWeil_stackedDetProd (Equiv.sumEmpty n Empty) (Equiv.emptySum Empty n) rfl η 1
    simp [rankTwist, Space.lift, ↓mul_inv, -Prod.forall] at hc hL hv
    change ∀ f g, thetaIntegral .. = _ at hL
    specialize hκ x
      ((L · ∘L .flip (integrated _) _) ∘ (g * ⟨·, 1⟩))
      (c • ⟨⟨(∫ x, modKernelBilin (stdSpace E Empty) (stdSpace E n) α α 𝔪 x g
        (1 : Matrix n Empty 𝔪.ResRing → ℂ) · ∂(stdSpace E Empty).quotMeasure),
        by simp [integral_add, map_add,
          (isRapid_modKernel (stdSpace E Empty) (stdSpace E n) α α
            hα.1 (hP.2 · · |>.elim (by grind [invFirstRows_mul_firstCols])) _ g).integrable
            (by fun_prop [modKernel])]⟩, by simp⟩)
      (by simp [← hL, ← pairWeil_integrated _ _ α 1, thetaIntegral_pairWeil, mul_assoc])
      (fun x Q h ↦ (hL .. ▸ hc _).trans
        (by simp [modKernel, modDatum, ← h, ← pairWeil_integrated_right α α, ← pairTheta_mul])) η
    erw [← hL, thetaIntegral, integral_quotMeasure_eq_classSum
      (f := modKernelI (stdSpace E n) α 1 𝔪 (fun A ↦ χ A.det) _ g)
      (pairThetaKer ..).swap.theta_rat_mul
      (fun _ ↦ integral_eq_const (.of_forall fun x ↦ ?_)) (Kf ..) ?_] at hκ
    rw [division_def α, ← one_mul β, ← mul_one α]
    simpa [↓modKernel_twist, ← mul_classSum, field] using hκ
    · intro k hk _
      rw [modKernelI, modKernel_mul_Kf_right (k := ⟨k, hk⟩), hα.apply_det]
      congr with
      simpa [χ.inv_apply, Ring.inverse_inverse] using
        hP.left_mul (inv_mem (by simp [mem_intGL]))
    · rw [modKernelI, modKernel, modDatum, ← hv x,
        ← pairWeil_integrated_right α, ← pairTheta_mul]

end

attribute [local simp] carrierForm Modulus.disjoint_places_star Modulus.liftFn_one Space.lift
  name_boxIndicator carrierXi modDatum letterMinor stackedDetProd pairedDetProd matchedPoly
  pairTheta pairWeil

variable {E : Type} [Field E] [CMType E] [WeilData E]
variable (E) {m : ℕ} [NeZero m]

lemma c2_stdClassSum_det_modKernel_eq (he : Even m) (c : _ → ℕ) : ∃ C, ∀ {𝔪 α χ},
    IsTameFor 𝔪 α (-c ·) χ → ∃ γ, ‖γ‖ ^ 2 = C / lValueProd
    𝔪.places (α⁻¹ * upsilonU1 ^ (m / 2)) (m / 2) ∧ ∀ g,
    γ * stdClassSum (Kf E (Fin m))
      (modKernelI (stdSpace ..) α α 𝔪 (χ ·.det)
        (∏ τ, letterMinor τ id id ^ c τ) g) = 1 := by
  choose C H using c2_empty_matching (E := E) (n := Fin m) (by simpa using he)
    (by simp; grind [NeZero]) (Fin <| c ·)
  simp only [Fintype.card_fin] at H
  refine' ⟨_, (H · |>.imp' (· / ∫ _, 1 ∂quotMeasure (stdSpace E Empty)) fun γ ↦ .imp
    (by simpa [div_pow, ·] using div_right_comm ..) fun H g ↦ _)⟩
  field [measureReal_univ_ne_zero]
  convert! H 0 .. <;> simp [modKernel, vacElem_apply_eq_prod_lineTheta,
    @Subsingleton.eq_one (G ..), stackedDet,
    ← det_reindex_self (.emptySum ..), det_apply, ← Pi.one_def, funext_iff, prod_empty]

#print axioms c2_empty_matching
#print axioms c2_stdClassSum_det_modKernel_eq

run_cmd do
  let new ← Lean.getConstInfo ``c2_stdClassSum_det_modKernel_eq
  let old ← Lean.getConstInfo ``stdClassSum_det_modKernel_eq
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq old.type new.type
  unless same do Lean.throwError "C2 determinant class-sum statement changed"
  for candidate in #[``c2_empty_matching, ``c2_stdClassSum_det_modKernel_eq] do
    let info ← Lean.getConstInfo candidate
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "C2 determinant consumer has no proof value"
    for forbidden in #[``exchange_theorem, ``exchange_of_partners, ``explicit_matching,
                         ``stdClassSum_det_modKernel_eq] do
      if value.getUsedConstants.contains forbidden then
        Lean.throwError "C2 determinant consumer calls original general target"
  Lean.logInfo "C2_DETERMINANT_CLASS_SUM: original complete statement preserved; general target absent directly"
