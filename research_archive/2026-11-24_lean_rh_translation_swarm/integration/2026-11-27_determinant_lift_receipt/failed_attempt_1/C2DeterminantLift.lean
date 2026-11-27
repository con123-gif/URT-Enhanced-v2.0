import New.Rows.Carrier
import Mathlib.Tactic

/-! Finite determinant datum to the actual semilocal standard datum.
The local-hom and unit-character compatibility hypotheses are precisely
the interface constructed by the original ExchangeTheorem modulus step.
This lemma does not supply that construction or the determinant period.+-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Matrix IsLinearMap

variable {F R n : Type} [SemilocalField F] [CommRing R] [Fintype n]

lemma c2_lift_inverse_determinant
    (π : (SemilocalField.O (F := F)) →+* R) [IsLocalHom π]
    (χ : MulChar R ℂ) (χ' : MulChar F ℂ)
    (hχ : ∀ u : SemilocalField.O, IsUnit u → χ' (u : F) = χ (π u)) :
    liftIntegralFn π (fun A : Matrix n n R ↦ (χ A.det)⁻¹) =
      stdColDatum χ' (1 : Matrix n n F) := by
  funext M
  by_cases hM : IsIntMatrix SemilocalField.O M
  · let M₀ : Matrix n n (SemilocalField.O (F := F)) := .of fun i j ↦ ⟨M i j, hM i j⟩
    have hcast : M₀.map (Subring.subtype SemilocalField.O) = M := rfl
    have hdet : (M₀.det : F) = M.det := by
      simpa only [← RingHom.map_det] using congrArg Matrix.det hcast
    simp only [liftIntegralFn, mk'_apply, stdColDatum, Matrix.one_mul,
      dif_pos hM, if_pos hM]
    change (χ ((M₀.map π).det))⁻¹ = invOnUnits χ' M.det
    rw [← RingHom.map_det]
    by_cases hu : IsUnit M₀.det
    · have hi : IsIntegralUnit M.det := by
        rw [← hdet]
        exact isIntegralUnit_iff_isUnit.2 hu
      rw [invOnUnits, if_pos hi, ← hdet, hχ _ hu]
    · have hi : ¬ IsIntegralUnit M.det := by
        rw [← hdet]
        exact fun h ↦ hu (isIntegralUnit_iff_isUnit.1 h)
      have hz : χ (π M₀.det) = 0 := χ.map_nonunit (by simpa only [isUnit_map_iff] using hu)
      simp [invOnUnits, hi, hz]
  · simp [liftIntegralFn, mk'_apply, stdColDatum, hM]

#print axioms c2_lift_inverse_determinant

run_cmd do
  let info ← Lean.getConstInfo ``c2_lift_inverse_determinant
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "Missing determinant datum proof"
  for name in #[``exchange_of_partners, ``exchange_theorem, ``explicit_matching,
                 ``stdClassSum_det_modKernel_eq] do
    if value.getUsedConstants.contains name then
      Lean.throwError "Datum identity calls a forbidden general exchange/consumer"
  Lean.logInfo "C2_DETERMINANT_LIFT: original general exchange and determinant consumer absent directly"
