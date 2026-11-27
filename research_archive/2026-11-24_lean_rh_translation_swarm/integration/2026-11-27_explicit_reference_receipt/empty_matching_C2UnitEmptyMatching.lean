import C2DeterminantExchange
import C2DeterminantClassSum
import C2ExplicitUnitReference
import C2RealMatchingStandard
import Mathlib.Tactic

/-! Same complete empty-matching statement, with the actual exchange target
polynomial fixed to 1. All finite, real, measure and character hypotheses
are retained. Proposed until native replay; no rank-zero Haar volume is
set to one. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

seal Finset.univ Finset.sum Finset.prod
set_option pp.fullNames true
set_option debug.skipKernelTC false
open Subgroup Fintype IsLevel MatMul Matrix MeasureTheory Space WeilData Ideal.Quotient

variable {E n : Type} [Field E] [CMType E] [WeilData E] [Fintype n]

lemma c2_unit_empty_matching (he : Even (card n)) (hn : 2 ≤ card n)
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
  choose κ hκ using c2_real_matching_unit_reference (E := E) (n := n) ι
  have hd : card n = 2 * (card n / 2) := by rcases he with ⟨k, hk⟩; omega
  have hμ : ∀ q : NumberField.InfinitePlace E,
      (card n : ℤ) ≤ 2 * ((card (ι q) : ℤ) + (card n / 2 : ℕ)) := by
    intro q
    omega
  obtain ⟨C, x, _, H⟩ := c2_determinant_exchange (n := n) hd hn hμ
    (weightedNorm_polyVector_ne_top · (1 : MvPolynomial (NumberField.InfinitePlace E × n × Empty) ℂ))
  constructor
  intro 𝔪 α χ hα
  letI : α.HasWeight (fun τ ↦ -(card (ι τ) : ℤ)) hα.2.choose := hα.2.choose_spec.1
  have ht : IsTameFor 𝔪 (α⁻¹ * upsilonU1 ^ (card n / 2))
      (fun τ ↦ (card (ι τ) : ℤ) + (card n / 2 : ℕ)) χ⁻¹ := by
    simpa only [Pi.neg_def, Pi.add_def, neg_neg] using
      hα.inv.mul (hasWeight_upsilonU1_pow (card n / 2))
  obtain ⟨c, hc₀, q, hc⟩ := H 𝔪 _ _ ht
  simp only [MulChar.inv_apply_eq_inv', inv_inv] at hc
  have hP : IsPartner ⊤ (Equiv.emptySum Empty n) χ⁻¹ (fun A ↦ χ A.det)
      (1 : Matrix n Empty 𝔪.ResRing → ℂ) := by
    simpa [det_apply, ← Pi.one_def, funext_iff, prod_empty] using
      partner_block (Equiv.emptySum Empty n) χ⁻¹ (1 : Matrix n Empty 𝔪.ResRing → ℂ)
  refine ⟨κ x / c, ?_, fun η β g ↦ ?_⟩
  · rw [norm_div, div_pow, q, div_div]
  · let P : MvPolynomial (NumberField.InfinitePlace E × n × n) ℂ :=
      renameRowsCols id ((Equiv.sumEmpty n Empty) ∘ Sum.inl)
        (stackedDetProd (Equiv.emptySum Empty n) η)
    obtain ⟨⟨L, hL⟩, hv⟩ :=
      (pairThetaKer (stdSpace E n) (stdSpace E n) α 1).swap.exists_clm_lift
        (isAutomorphic_const _ 1).mem_rapidFunctions,
      c2_real_determinant_invariant (E := E) (n := n) ι η
    simp [rankTwist, Space.lift, ↓mul_inv, -Prod.forall] at hc hL hv
    change ∀ f g, thetaIntegral .. = _ at hL
    have hInt (Q : MvPolynomial (NumberField.InfinitePlace E × n × Empty) ℂ) :
        Integrable (fun z : G E (1 : Empty → ℤˣ) ↦
          ((modKernelBilin (stdSpace E Empty) (stdSpace E n) α α 𝔪 z g)
            (1 : Matrix n Empty 𝔪.ResRing → ℂ)) Q) (stdSpace E Empty).quotMeasure := by
      simpa only [modKernelBilin_apply] using!
        (isRapid_modKernel (stdSpace E Empty) (stdSpace E n) α α hα.1
          (Ψ := (1 : Matrix n Empty 𝔪.ResRing → ℂ))
          (fun y _ ↦ ⟨0, by ext i; cases i⟩) Q g).integrable (by fun_prop [modKernel])
    let ℓ₀ : MvPolynomial (NumberField.InfinitePlace E × n × Empty) ℂ →ₗ[ℂ] ℂ :=
      { toFun := fun Q ↦ ∫ z, ((modKernelBilin (stdSpace E Empty) (stdSpace E n) α α 𝔪 z g)
            (1 : Matrix n Empty 𝔪.ResRing → ℂ)) Q ∂(stdSpace E Empty).quotMeasure
        map_add' := by
          intro Q R
          simp only [map_add]
          exact integral_add (hInt Q) (hInt R)
        map_smul' := by
          intro a Q
          simp only [map_smul, integral_smul, RingHom.id_apply] }
    specialize hκ x
      ((L · ∘L .flip (integrated _) _) ∘ (g * ⟨·, 1⟩))
      (c • ℓ₀)
      (by
        intro g' ⟨a, b⟩ w
        change (L (g * (g', 1)))
            (integrated _ (realPairWeil (fun τ ↦ -(card (ι τ) : ℤ)) 0 (a, b) w) _) =
          (L (g * (g' * a, 1))) (integrated _ w _)
        rw [← hL, ← hL, ← pairWeil_integrated (stdSpace E n) (stdSpace E n) α 1,
          thetaIntegral_pairWeil]
        simp [mul_assoc])
      (fun x Q h ↦ (hL .. ▸ hc _).trans
        (by
          change c * _ = c * _
          congr 1
          apply integral_congr_ae
          filter_upwards [] with h₀
          simp only [modKernelBilin_apply, modKernel, modDatum]
          rw [← h, ← pairWeil_integrated_right α α, ← pairTheta_mul] <;> simp)) η
    change κ x * (L (g * (1, 1)))
        (modDatum (stdSpace E n) (stdSpace E n) 𝔪 (fun A ↦ χ A.det) (polyVector _ P)) =
      c * ℓ₀ (matchedPoly (ι := ι) (Equiv.sumEmpty Empty Empty) (Equiv.sumEmpty n Empty) η) at hκ
    have hg₁ : g * ((1 : GInf E (1 : n → ℤˣ)), (1 : Gf E n)) = g := mul_one g
    rw [hg₁, ← hL] at hκ
    erw [thetaIntegral, integral_quotMeasure_eq_classSum
      (V := stdSpace E n)
      (F := fun h ↦ pairTheta (stdSpace E n) (stdSpace E n) α 1
        (modDatum (stdSpace E n) (stdSpace E n) 𝔪 (fun A ↦ χ A.det) (polyVector _ P)) (g, h))
      (f := modKernelI (stdSpace E n) α 1 𝔪 (fun A ↦ χ A.det) P g)
      ((pairThetaKer (stdSpace E n) (stdSpace E n) α 1).swap.theta_rat_mul
        (φ := modDatum (stdSpace E n) (stdSpace E n) 𝔪 (fun A ↦ χ A.det) (polyVector _ P))
        (h := g))
      (fun k ↦ integral_eq_const (.of_forall fun u ↦ ?_)) (Kf E n) ?_
      (hF := by fun_prop)] at hκ
    rw [division_def α, ← one_mul β, ← mul_one α]
    simpa [ℓ₀, modKernelBilin_apply, ↓modKernel_twist, ← mul_classSum, field] using hκ
    · intro k hk _
      rw [modKernelI, modKernel_mul_Kf_right (k := ⟨k, hk⟩), hα.apply_det]
      congr with
      simpa [χ.inv_apply, Ring.inverse_inverse] using
        hP.left_mul (inv_mem (by simp [mem_intGL]))
    · let D := modDatum (stdSpace E n) (stdSpace E n) 𝔪
        (fun A ↦ χ A.det) (polyVector _ P)
      change pairTheta (stdSpace E n) (stdSpace E n) α 1 D (g, (u, k)) =
        pairTheta (stdSpace E n) (stdSpace E n) α 1 D (g, (1, k))
      have hfix : pairWeil (stdSpace E n) (stdSpace E n) α 1 (1, (u, 1)) D = D := by
        dsimp only [D, modDatum]
        rw [pairWeil_integrated_right α 1, hv u]
      have htranslate := pairTheta_mul (S := stdSpace E n) (T := stdSpace E n)
        (a := α) (b := 1) D (g, (1, k)) (1, (u, 1))
      rw [hfix] at htranslate
      simpa only [Prod.mul_def, mul_one, one_mul] using htranslate


#print axioms c2_unit_empty_matching

run_cmd do
  let old ← Lean.getConstInfo ``c2_empty_matching
  let new ← Lean.getConstInfo ``c2_unit_empty_matching
  let same ← Lean.Elab.Command.liftTermElabM do Lean.Meta.isDefEq old.type new.type
  unless same do Lean.throwError "Unit-reference matching changed the entire original statement"
  let some body := new.value? (allowOpaque := true) |
    Lean.throwError "Missing unit-reference matching proof"
  for name in #[``c2_real_matching_unit_reference, ``c2_determinant_exchange] do
    unless body.getUsedConstants.contains name do
      Lean.throwError "Unit-reference matching lost a required checked supplier"
  for name in #[`real_matching, `c2_real_matching_standard, `c2_direct_real_matching,
                  `c2_empty_matching, `c2_direct_empty_matching, `explicit_matching, `exchange_theorem] do
    if body.getUsedConstants.contains name then
      Lean.throwError "Unit-reference matching retained an earlier general matching alias"
  Lean.logInfo "C2_UNIT_MATCHING: complete original statement; exchange reference fixed to the polynomial unit"
