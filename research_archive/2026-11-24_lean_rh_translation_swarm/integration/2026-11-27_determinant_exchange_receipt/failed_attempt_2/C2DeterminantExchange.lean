import C2StandardExchange
import C2DeterminantLift
import Mathlib.Tactic

/-! Finite-modulus specialization of the checked standard exchange.
Only determinant data and the complementary empty column are required.
The original general partner extension is not used. The final real matching
and class-sum normalization remain to be attached.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open RingHom Fintype Modulus IsLinearMap Matrix MeasureTheory

variable {E n : Type} [Field E] [CMType E] [WeilData E] [Fintype n]

lemma c2_determinant_exchange {e : ℕ} (he : card n = 2 * e) (hn : 2 ≤ card n)
    {μ : NumberField.InfinitePlace E → ℤ} (hμ : ∀ q, (card n : ℤ) ≤ 2 * μ q)
    {v} (hv : IsRapidDatum v) :
    ∃ C x, IsRapidDatum x ∧ ∀ 𝔪 ν χ, IsTameFor 𝔪 ν μ χ →
      let γ := rankTwist ν⁻¹ n
      ∃ c ≠ 0, ‖c‖ ^ 2 = C * lValueProd 𝔪.places ν e ∧ ∀ g,
        thetaIntegral (stdSpace E n) (stdSpace E n) γ 1
          (modDatum (stdSpace E n) (stdSpace E n) 𝔪 (fun A ↦ (χ A.det)⁻¹) x) g =
        c * ∫ h, pairTheta (stdSpace E Empty) (stdSpace E n) γ γ
          (modDatum (stdSpace E Empty) (stdSpace E n) 𝔪
            (1 : Matrix n Empty 𝔪.ResRing → ℂ) v) (h, g) ∂(stdSpace E Empty).quotMeasure := by
  obtain ⟨C, x, hx, H⟩ := c2_standard_exchange_uniform
    (stdSpace E n) (stdSpace E n) (stdSpace E Empty) (Equiv.emptySum Empty n)
    (by simp [negCount]) (by simpa using he) (by simpa [negCount] using hn)
    (by simpa [negCount] using hμ) hv
  refine ⟨C, x, hx, fun 𝔪 ν χ ⟨h, ψ, a₁, a₂, a₃⟩ ↦ ?_⟩
  have o := 𝔪.places.toFinite.coe_toFinset
  have hpos q : 0 < μ q := by have := hμ q; omega
  let 𝔠 := SplitTameChar.mk ν ψ a₁ _ (by simpa using! h)
    (by simpa using! 𝔪.not_le_star) (o ▸ a₂) hpos
  obtain ⟨⟨c, hc, Hc⟩, _, m, _, ρ, _, k, k'⟩ := H 𝔠, o ▸ 𝔠.readsAt
  refine ⟨c, hc, ?_, ?_⟩
  · simpa [lValueProdInt, 𝔠, lValueProd.eq_1 _ _ 0] using Hc.1
  · let π := ((evalPlaces 𝔠.S).restrict _ _ evalPlaces_mem_O).liftOfRightInverse
      (⟨_, by simpa [← k', *] using m <| ρ ·⟩) (Subtype.ext <| k ·)
      ⟨𝔪.reduction, fun y hy ↦
        (𝔪.reduction_congr (y := 0) (congr($hy.1 ⟨·, o.ge ·⟩))).trans (map_zero _)⟩
    have hres i u : modulusResidue _ (o.le i.2) (π u) = residueAt i u :=
      (modulusResidue_reduction ..).trans congr(⟦⟨$(k u) i, _⟩⟧)
    letI : IsLocalHom π := ⟨fun u hu ↦ isUnit_iff_residueAt_ne_zero.2
      (hres · u ▸ (hu.map _).ne_zero)⟩
    have hχ u (hu : IsUnit u) : 𝔠.χ (u : LocProd 𝔠.S) = χ (π u) := by
      simp_intro .. [← finprod_comp_equiv (Set.equivOfEq o),
        a₃, charOfTamePart, ← hres, 𝔠.localChar_apply_of_isUnit,
        finprod_eq_prod_of_fintype]
      rfl
    have d {a b : Type} [Fintype a] [Fintype b] Φ :
        𝔪.liftFn (Φ ∘ @vecToMat a b _) =
          (liftIntegralFn π Φ <| vecToMat <| evalPlaces _ ∘ ·) := by
      ext
      erw [liftFn_apply, mk'_apply]
      congr! <;> simp [vecToMat, m, ← k']
      rfl
    have dΦ := d (fun A : Matrix n n 𝔪.ResRing ↦ (χ A.det)⁻¹)
    rw [c2_lift_inverse_determinant π χ 𝔠.χ hχ] at dΦ
    have dΨ := d (1 : Matrix n Empty 𝔪.ResRing → ℂ)
    rw [c2_lift_one_empty_columns] at dΨ
    have row : stdRowDatum (Equiv.emptySum Empty n) 𝔠.χ
        (0 : Matrix Empty n (LocProd 𝔠.S)) =
        stdColDatum 𝔠.χ (1 : Matrix n n (LocProd 𝔠.S)) := rfl
    have Hz := Hc.2 (0 : Matrix Empty n (LocProd 𝔠.S)) (by simp [IsIntMatrix])
    rw [row, c2_standard_column_empty] at Hz
    simpa [modDatum, 𝔠, dΦ, dΨ] using! Hz

#print axioms c2_determinant_exchange

run_cmd do
  let info ← Lean.getConstInfo ``c2_determinant_exchange
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "Missing finite determinant exchange proof"
  let deps := value.getUsedConstants
  for name in #[``exchange_of_partners, ``exchange_theorem, ``explicit_matching,
                 ``stdClassSum_det_modKernel_eq] do
    if deps.contains name then
      Lean.throwError "Finite determinant exchange calls an original general target"
  for name in #[``c2_standard_exchange_uniform, ``c2_lift_inverse_determinant,
                 ``c2_lift_one_empty_columns, ``c2_standard_column_empty] do
    unless deps.contains name do
      Lean.throwError "Finite determinant exchange misses a checked supplier"
  Lean.logInfo "C2_DETERMINANT_EXCHANGE: checked standard and finite datum suppliers consumed"
