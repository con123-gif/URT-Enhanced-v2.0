import OMAStatements.S_mo_513259



/-!
Generic permanent multilinearity infrastructure for the independently reviewed
hand proof of MathOverflow 513259. This helper file alone is not a solution.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact model variant is not exposed in this interface).
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

lemma permanent_updateCol_expansion (A : Matrix I I R) (j : I) (u : I → R) :
    (Matrix.updateCol A j u).permanent =
      ∑ p : Equiv.Perm I, u (p j) * ∏ i ∈ Finset.univ.erase j, A (p i) i := by
  classical
  simp only [Matrix.permanent, ← Finset.mul_prod_erase _ _ (Finset.mem_univ j),
    Matrix.updateCol_self]
  apply Finset.sum_congr rfl
  intro p _
  congr 1
  apply Finset.prod_congr rfl
  intro i hi
  simp only [ne_eq, Finset.ne_of_mem_erase hi, not_false_eq_true, Matrix.updateCol_ne]

lemma permanent_updateCol_add (A : Matrix I I R) (j : I) (u v : I → R) :
    (Matrix.updateCol A j (u + v)).permanent =
      (Matrix.updateCol A j u).permanent + (Matrix.updateCol A j v).permanent := by
  rw [permanent_updateCol_expansion, permanent_updateCol_expansion,
    permanent_updateCol_expansion]
  simp only [Pi.add_apply, add_mul, Finset.sum_add_distrib]

lemma permanent_updateRow_add (A : Matrix I I R) (i : I) (u v : I → R) :
    (Matrix.updateRow A i (u + v)).permanent =
      (Matrix.updateRow A i u).permanent + (Matrix.updateRow A i v).permanent := by
  rw [← Matrix.permanent_transpose, ← Matrix.updateCol_transpose,
    permanent_updateCol_add, Matrix.updateCol_transpose, Matrix.updateCol_transpose,
    Matrix.permanent_transpose, Matrix.permanent_transpose]

def rowShear (A : Matrix I I R) (i j : I) (t : R) : Matrix I I R :=
  Matrix.updateRow A i (A i + t • A j)

def colShear (A : Matrix I I R) (i j : I) (t : R) : Matrix I I R :=
  (rowShear Aᵀ i j t)ᵀ

def copyRow (A : Matrix I I R) (i j : I) : Matrix I I R :=
  Matrix.updateRow A i (A j)

def copyCol (A : Matrix I I R) (i j : I) : Matrix I I R :=
  Matrix.updateCol A i (A.col j)

lemma permanent_rowShear (A : Matrix I I R) (i j : I) (t : R) :
    (rowShear A i j t).permanent =
      A.permanent + t * (copyRow A i j).permanent := by
  unfold rowShear copyRow
  rw [permanent_updateRow_add, Matrix.permanent_updateRow_smul]
  simp

lemma permanent_colShear (A : Matrix I I R) (i j : I) (t : R) :
    (colShear A i j t).permanent =
      A.permanent + t * (copyCol A i j).permanent := by
  unfold colShear
  rw [Matrix.permanent_transpose, permanent_rowShear, Matrix.permanent_transpose]
  congr 1
  congr 1
  unfold copyRow copyCol
  rw [← Matrix.permanent_transpose, Matrix.updateRow_transpose]
  rfl

lemma copyCol_rowShear (A : Matrix I I R) (i j : I) (t : R) :
    copyCol (rowShear A i j t) i j = rowShear (copyCol A i j) i j t := by
  ext a b
  simp only [copyCol, rowShear, Matrix.updateCol_apply, Matrix.updateRow_apply,
    Matrix.col_apply, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
  split_ifs <;> simp_all

lemma copyCol_copyRow (A : Matrix I I R) (i j : I) :
    copyCol (copyRow A i j) i j = copyRow (copyCol A i j) i j := by
  ext a b
  simp only [copyCol, copyRow, Matrix.updateCol_apply, Matrix.updateRow_apply,
    Matrix.col_apply]
  split_ifs <;> simp_all

lemma permanent_copyCol_of_symmetric (A : Matrix I I R) (hA : A.IsSymm)
    (i j : I) : (copyCol A i j).permanent = (copyRow A i j).permanent := by
  have hcol : A.col j = A j := by
    funext k
    exact congrFun (congrFun hA.eq j) k
  unfold copyCol copyRow
  rw [← Matrix.permanent_transpose, ← Matrix.updateRow_transpose, hA.eq, hcol]

lemma permanent_double_shear (A : Matrix I I R) (hA : A.IsSymm)
    (i j : I) (t : R) :
    (colShear (rowShear A i j t) i j t).permanent =
      A.permanent + 2 * t * (copyRow A i j).permanent +
        t ^ 2 * (copyCol (copyRow A i j) i j).permanent := by
  rw [permanent_colShear, permanent_rowShear, copyCol_rowShear,
    permanent_rowShear, permanent_copyCol_of_symmetric A hA, ← copyCol_copyRow]
  ring

end OMA.MO513259



/-!
Parity and two-dimensional scalar infrastructure for MathOverflow 513259.
These helpers alone do not constitute a solution of the full graph question.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact model variant is not exposed in this interface).
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I : Type*} [Fintype I] [DecidableEq I]

lemma map_permanent {R S : Type*} [CommSemiring R] [CommSemiring S]
    (f : R →+* S) (A : Matrix I I R) :
    f A.permanent = (A.map f).permanent := by
  simp [Matrix.permanent, Matrix.map_apply]

lemma permanent_eq_det_mod_two (A : Matrix I I (ZMod 2)) :
    A.permanent = A.det := by
  symm
  rw [Matrix.det_apply', Matrix.permanent]
  apply Finset.sum_congr rfl
  intro p _
  have hs : (((Equiv.Perm.sign p : ℤ) : ZMod 2)) = 1 := by
    rcases Int.units_eq_one_or (Equiv.Perm.sign p) with h | h
    · rw [h]
      norm_num
    · rw [h]
      change (-1 : ZMod 2) = 1
      decide
  rw [hs, one_mul]

lemma permanent_duplicate_row_mod_two (A : Matrix I I (ZMod 2))
    (i j : I) (hij : i ≠ j) :
    (Matrix.updateRow A i (A j)).permanent = 0 := by
  rw [permanent_eq_det_mod_two]
  exact Matrix.det_updateRow_eq_zero hij.symm

def modTwoEight : ZMod 8 →+* ZMod 2 :=
  ZMod.castHom (by decide : 2 ∣ 8) (ZMod 2)

lemma duplicate_row_even_eight (A : Matrix I I (ZMod 8))
    (i j : I) (hij : i ≠ j) :
    modTwoEight (Matrix.updateRow A i (A j)).permanent = 0 := by
  have hmap : (Matrix.updateRow A i (A j)).map modTwoEight =
      Matrix.updateRow (A.map modTwoEight) i ((A.map modTwoEight) j) := by
    ext a b
    by_cases h : a = i <;> simp [Matrix.map_apply, Matrix.updateRow_apply, h]
  rw [map_permanent, hmap]
  exact permanent_duplicate_row_mod_two _ i j hij

lemma unit_square_eight (u : ZMod 8) (hu : IsUnit u) : u ^ 2 = 1 := by
  have huval : Nat.Coprime u.val 8 :=
    (ZMod.isUnit_iff_coprime u.val 8).mp (by simpa using hu)
  revert huval
  fin_cases u <;> decide

lemma base_two_scalar (a b c : ZMod 8) (hb : IsUnit b) :
    (4 * a * c + b ^ 2) * (4 * a * c - b ^ 2)⁻¹ = -(b ^ 2) := by
  have hb2 := unit_square_eight b hb
  have hd : (4 * a * c - b ^ 2) * (4 * a * c - b ^ 2) = 1 := by
    rw [hb2]
    calc
      (4 * a * c - 1) * (4 * a * c - 1) =
          (16 : ZMod 8) * a ^ 2 * c ^ 2 - (8 : ZMod 8) * a * c + 1 := by ring
      _ = 1 := by
        rw [show (16 : ZMod 8) = 0 by decide, show (8 : ZMod 8) = 0 by decide]
        ring
  rw [ZMod.inv_eq_of_mul_eq_one 8 _ _ hd, hb2]
  calc
    (4 * a * c + 1) * (4 * a * c - 1) =
        (16 : ZMod 8) * a ^ 2 * c ^ 2 - 1 := by ring
    _ = -1 := by
      rw [show (16 : ZMod 8) = 0 by decide]
      ring

end OMA.MO513259



/-!
Alternating-form infrastructure for MathOverflow 513259. These lemmas establish
the zero diagonal of the reduced inverse and are not a full solution.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact model variant is not exposed in this interface).
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I : Type*} [Fintype I] [DecidableEq I]

lemma quadratic_zero_mod_two (A : Matrix I I (ZMod 2)) (hA : A.IsSymm)
    (hd : ∀ i, A i i = 0) (v : I → ZMod 2) : v ⬝ᵥ (A *ᵥ v) = 0 := by
  let f : I × I → ZMod 2 := fun p => v p.1 * A p.1 p.2 * v p.2
  have hs : (∑ p : I × I, f p) = 0 := by
    refine Finset.sum_involution (fun (p : I × I) _ => p.swap) ?_ ?_
      (fun p _ => Finset.mem_univ p.swap) ?_
    · intro p _
      have he : f p.swap = f p := by
        dsimp [f]
        rw [hA.apply p.1 p.2]
        ring
      rw [he]
      exact CharTwo.add_self_eq_zero _
    · intro p _ hn he
      have heq : p.1 = p.2 := (congrArg Prod.fst he).symm
      apply hn
      dsimp [f]
      rw [heq, hd]
      ring
    · intro p _
      exact Prod.swap_swap p
  simpa only [f, Fintype.sum_prod_type, Matrix.mulVec, dotProduct,
    Finset.mul_sum, mul_assoc] using hs

lemma right_inverse_diagonal_zero_mod_two (A B : Matrix I I (ZMod 2))
    (hA : A.IsSymm) (hd : ∀ i, A i i = 0) (hAB : A * B = 1) (i : I) :
    B i i = 0 := by
  have hcol : A *ᵥ (fun k => B k i) = Pi.single i 1 := by
    funext k
    have h := congrFun (congrFun hAB k) i
    simpa [Matrix.mulVec, Matrix.mul_apply, dotProduct, Matrix.one_apply,
      Pi.single_apply] using h
  have h := quadratic_zero_mod_two A hA hd (fun k => B k i)
  rw [hcol, dotProduct_single, mul_one] at h
  exact h

lemma map_inverse_diagonal_zero_mod_two {R : Type*} [CommRing R]
    (f : R →+* ZMod 2) (A : Matrix I I R) (hA : A.IsSymm)
    (hd : ∀ i, f (A i i) = 0) (hdet : IsUnit A.det) (i : I) :
    f ((A⁻¹) i i) = 0 := by
  have hsym : (A.map f).IsSymm := by
    apply Matrix.IsSymm.ext
    intro a b
    exact congrArg f (hA.apply a b)
  have hdiag : ∀ a, (A.map f) a a = 0 := hd
  have hAB : A.map f * (A⁻¹).map f = 1 := by
    have h := congrArg (fun M : Matrix I I R => M.map f) (Matrix.mul_nonsing_inv A hdet)
    simpa only [Matrix.map_mul, Matrix.map_one, map_zero, map_one] using h
  exact right_inverse_diagonal_zero_mod_two _ _ hsym hdiag hAB i

end OMA.MO513259



/-!
Auxiliary determinant infrastructure for MO513259, not a complete solution.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6; exact serving
variant not exposed. The even-perturbation fact is prior mathematics
(Darij Grinberg, Mathematics Stack Exchange2688219,2018).
Complete proof candidates below await pinned verification.
-/

namespace OMA.MO513259.DetHelper

open Matrix

variable {ι R : Type*} [Fintype ι] [DecidableEq ι] [CommRing R]

/-- The rank-two determinant update, with no symmetry assumption. -/
theorem det_add_symm_pair (A : Matrix ι ι R) (hA : IsUnit A.det)
    (i j : ι) (c : R) :
    (A + Matrix.single i j c + Matrix.single j i c).det =
      A.det * ((1 + c * A⁻¹ j i) * (1 + c * A⁻¹ i j) -
        c ^ 2 * A⁻¹ i i * A⁻¹ j j) := by
  classical
  let U : Matrix ι (Fin 2) R := Matrix.single i 0 c + Matrix.single j 1 c
  let V : Matrix (Fin 2) ι R := Matrix.single 0 j 1 + Matrix.single 1 i 1
  have hUV : U * V = Matrix.single i j c + Matrix.single j i c := by
    simp [U, V, Matrix.add_mul, Matrix.mul_add, Matrix.single_mul_single_of_ne]
  have hsmall : V * A⁻¹ * U =
      !![c * A⁻¹ j i, c * A⁻¹ j j; c * A⁻¹ i i, c * A⁻¹ i j] := by
    simp only [U, V, Matrix.add_mul, Matrix.mul_add, Matrix.single_mul_mul_single]
    ext a b
    fin_cases a <;> fin_cases b <;>
      simp [Matrix.single_apply, mul_comm]
  calc
    (A + Matrix.single i j c + Matrix.single j i c).det = (A + U * V).det := by
      rw [hUV, add_assoc]
    _ = A.det * (1 + V * A⁻¹ * U).det := Matrix.det_add_mul U V hA
    _ = A.det * ((1 + c * A⁻¹ j i) * (1 + c * A⁻¹ i j) -
        c ^ 2 * A⁻¹ i i * A⁻¹ j j) := by
      congr 1
      simp [hsmall, Matrix.det_fin_two]
      ring

/-- Explicitly exposes the needed even inverse-diagonal witnesses. -/
theorem det_add_even_symm_pair_of_inv_even
    (A : Matrix ι ι (ZMod 8)) (hA : A.IsSymm) (hunit : IsUnit A.det)
    (i j : ι) (u bi bj : ZMod 8)
    (hi : A⁻¹ i i = 2 * bi) (hj : A⁻¹ j j = 2 * bj) :
    (A + Matrix.single i j (2 * u) + Matrix.single j i (2 * u)).det = A.det := by
  have hfour (x : ZMod 8) : 4 * x + 4 * x ^ 2 = 0 := by
    fin_cases x <;> decide
  have h16 : (16 : ZMod 8) = 0 := by decide
  rw [det_add_symm_pair A hunit i j (2 * u), hA.inv.apply i j, hi, hj]
  calc
    A.det * ((1 + 2 * u * A⁻¹ i j) * (1 + 2 * u * A⁻¹ i j) -
        (2 * u) ^ 2 * (2 * bi) * (2 * bj)) =
      A.det * (1 + (4 * (u * A⁻¹ i j) + 4 * (u * A⁻¹ i j) ^ 2) -
        16 * u ^ 2 * bi * bj) := by congr 1 <;> ring
    _ = A.det := by rw [hfour, h16]; ring

end OMA.MO513259.DetHelper



/-!
This integration fragment is concatenated after the independent parity,
alternating-form and determinant helpers by build_helper_probe.py. It is not
a standalone Lean module and not a full proof of MathOverflow 513259.
-/

namespace OMA.MO513259

lemma modTwoEight_zero_iff_two_mul (x : ZMod 8) :
    modTwoEight x = 0 ↔ ∃ y : ZMod 8, x = 2 * y := by
  constructor
  · intro hx
    change (x.val : ZMod 2) = 0 at hx
    fin_cases x
    · exact ⟨0, rfl⟩
    · exact False.elim ((by decide : (1 : ZMod 2) ≠ 0) hx)
    · exact ⟨1, rfl⟩
    · exact False.elim ((by decide : (1 : ZMod 2) ≠ 0) hx)
    · exact ⟨2, rfl⟩
    · exact False.elim ((by decide : (1 : ZMod 2) ≠ 0) hx)
    · exact ⟨3, rfl⟩
    · exact False.elim ((by decide : (1 : ZMod 2) ≠ 0) hx)
  · rintro ⟨y, rfl⟩
    change ((2 * y).val : ZMod 2) = 0
    fin_cases y <;> decide

variable {I : Type*} [Fintype I] [DecidableEq I]

lemma det_add_even_symm_pair (A : Matrix I I (ZMod 8))
    (hA : A.IsSymm) (hd : ∀ i, modTwoEight (A i i) = 0)
    (hunit : IsUnit A.det) (i j : I) (u : ZMod 8) :
    (A + Matrix.single i j (2 * u) + Matrix.single j i (2 * u)).det = A.det := by
  have hdi := map_inverse_diagonal_zero_mod_two modTwoEight A hA hd hunit i
  have hdj := map_inverse_diagonal_zero_mod_two modTwoEight A hA hd hunit j
  obtain ⟨bi, hi⟩ := (modTwoEight_zero_iff_two_mul ((A⁻¹) i i)).mp hdi
  obtain ⟨bj, hj⟩ := (modTwoEight_zero_iff_two_mul ((A⁻¹) j j)).mp hdj
  exact DetHelper.det_add_even_symm_pair_of_inv_even A hA hunit i j u bi bj hi hj

end OMA.MO513259


/-!
Pivot existence for the congruence-invariance proof of MO513259.
This fragment follows the parity and alternating helpers in combined probes.
It is not a complete solution of the source's graph conjectures.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

lemma isUnit_iff_modTwoEight_ne_zero (x : ZMod 8) :
    IsUnit x ↔ modTwoEight x ≠ 0 := by
  have hu : IsUnit x ↔ Nat.Coprime x.val 8 := by
    simpa using (ZMod.isUnit_iff_coprime x.val 8)
  rw [hu]
  change Nat.Coprime x.val 8 ↔ (x.val : ZMod 2) ≠ 0
  constructor <;> (fin_cases x <;> decide)

variable {I : Type*} [Fintype I] [DecidableEq I]

lemma exists_unit_offdiagonal (A : Matrix I I (ZMod 8))
    (hd : ∀ i, modTwoEight (A i i) = 0) (hunit : IsUnit A.det) (i : I) :
    ∃ j, i ≠ j ∧ IsUnit (A i j) := by
  classical
  have hAB : A.map modTwoEight * (A⁻¹).map modTwoEight = 1 := by
    have h := congrArg (fun M : Matrix I I (ZMod 8) => M.map modTwoEight)
      (Matrix.mul_nonsing_inv A hunit)
    simpa only [Matrix.map_mul, Matrix.map_one, map_zero, map_one] using h
  have hnz : ∃ j, modTwoEight (A i j) ≠ 0 := by
    by_contra h
    push_neg at h
    have he := congrFun (congrFun hAB i) i
    have hz : (0 : ZMod 2) = 1 := by
      simpa [Matrix.mul_apply, Matrix.map_apply, h] using he
    exact zero_ne_one hz
  obtain ⟨j, hj⟩ := hnz
  refine ⟨j, ?_, (isUnit_iff_modTwoEight_ne_zero _).mpr hj⟩
  intro hij
  subst j
  exact hj (hd i)

lemma offdiagonal_pivot_det_unit (A : Matrix I I (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, modTwoEight (A i i) = 0) (i j : I) (hij : IsUnit (A i j)) :
    IsUnit ((!![A i i, A i j; A j i, A j j] :
      Matrix (Fin 2) (Fin 2) (ZMod 8)).det) := by
  apply (isUnit_iff_modTwoEight_ne_zero _).mpr
  have hnz := (isUnit_iff_modTwoEight_ne_zero _).mp hij
  have hone : modTwoEight (A i j) = 1 := by
    have ht : ∀ x : ZMod 2, x ≠ 0 → x = 1 := by decide
    exact ht _ hnz
  rw [Matrix.det_fin_two]
  simp [map_sub, map_mul, hA.apply i j, hd, hone]

end OMA.MO513259


/-!
Chinese-remainder assembly for the two graph congruences in MO513259.
The characteristic-three and modulo-four permanent statements remain explicit
hypotheses here. This is an integration fragment, not a complete certificate.
Prior credit: Knezevic, Cohen and Domanskaya, arXiv1710.01783, for the
characteristic-three identity; the answer to MO513095 for the graph modulo-four
identity. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact serving variant is not exposed).
-/

namespace OMA.MO513259

open scoped Matrix

def modEightTwentyFour : ZMod 24 →+* ZMod 8 :=
  ZMod.castHom (by decide : 8 ∣ 24) (ZMod 8)

def modFourTwentyFour : ZMod 24 →+* ZMod 4 :=
  ZMod.castHom (by decide : 4 ∣ 24) (ZMod 4)

def modThreeTwentyFour : ZMod 24 →+* ZMod 3 :=
  ZMod.castHom (by decide : 3 ∣ 24) (ZMod 3)

lemma zero_of_mod_eight_and_three (x : ZMod 24)
    (h8 : modEightTwentyFour x = 0) (h3 : modThreeTwentyFour x = 0) : x = 0 := by
  change (x.val : ZMod 8) = 0 at h8
  change (x.val : ZMod 3) = 0 at h3
  apply (ZMod.chineseRemainder (by decide : Nat.Coprime 8 3)).injective
  apply Prod.ext
  · change (x.val : ZMod 8) = 0
    exact h8
  · change (x.val : ZMod 3) = 0
    exact h3

lemma twice_mod_eight_of_mod_four (x : ZMod 24)
    (h4 : modFourTwentyFour x = 1) : modEightTwentyFour (2 * x) = 2 := by
  change (x.val : ZMod 4) = 1 at h4
  change ((2 * x).val : ZMod 8) = 2
  revert h4
  fin_cases x <;> decide

lemma scalar_mod_twenty_four (a b : ZMod 24)
    (h8 : modEightTwentyFour b = 1)
    (h4 : modFourTwentyFour a = 1)
    (h3 : modThreeTwentyFour b = modThreeTwentyFour a) :
    2 * a + b - 3 = 0 := by
  apply zero_of_mod_eight_and_three
  · rw [map_sub, map_add, twice_mod_eight_of_mod_four a h4, h8]
    simp only [map_ofNat]
    ring
  · simp only [map_sub, map_add, map_mul, map_ofNat]
    rw [h3]
    calc
      2 * modThreeTwentyFour a + modThreeTwentyFour a - 3 =
          (3 : ZMod 3) * (modThreeTwentyFour a - 1) := by ring
      _ = 0 := by rw [show (3 : ZMod 3) = 0 by decide, zero_mul]

variable {I : Type*} [Fintype I] [DecidableEq I]

lemma map_matrix_inverse {R S : Type*} [CommRing R] [CommRing S]
    (f : R →+* S) (A : Matrix I I R) (hdet : IsUnit A.det) :
    (A⁻¹).map f = (A.map f)⁻¹ := by
  have hprod : A.map f * (A⁻¹).map f = 1 := by
    have h := congrArg (fun M : Matrix I I R => M.map f) (Matrix.mul_nonsing_inv A hdet)
    simpa only [Matrix.map_mul, Matrix.map_one, map_zero, map_one] using h
  exact (Matrix.inv_eq_right_inv hprod).symm

lemma mod_twenty_four_of_three_component_facts (A : Matrix I I (ZMod 24))
    (hdet : IsUnit A.det)
    (h8 : ((A.map modEightTwentyFour)⁻¹).permanent = 1)
    (h4 : (A.map modFourTwentyFour).permanent = 1)
    (h3 : ((A.map modThreeTwentyFour)⁻¹).permanent =
      (A.map modThreeTwentyFour).permanent) :
    2 * A.permanent + (A⁻¹).permanent - 3 = 0 := by
  apply scalar_mod_twenty_four
  · rw [map_permanent, map_matrix_inverse modEightTwentyFour A hdet]
    exact h8
  · rw [map_permanent]
    exact h4
  · rw [map_permanent, map_permanent, map_matrix_inverse modThreeTwentyFour A hdet]
    exact h3

end OMA.MO513259










/-!
Determinant-side shear infrastructure for MO513259, not a complete solution.
Prerequisites: the verified MO513259Permanent, Parity, Alternating, Pivot and
DetIntegration helpers in their parent namespace; concatenate after them.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidates await pinned checking.
-/

namespace OMA.MO513259.DetShear

open Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommRing R]

def Z (A : Matrix I I R) : Matrix I I R :=
  A - Matrix.diagonal (Matrix.diag A)

def inverseShear (A : Matrix I I R) (i j : I) (t : R) : Matrix I I R :=
  colShear (rowShear A j i (-t)) j i (-t)

lemma inverseShear_apply (A : Matrix I I R) (i j a b : I) (t : R) :
    inverseShear A i j t a b =
      A a b - (if a = j then t * A i b else 0) -
        (if b = j then t * A a i else 0) +
        (if a = j ∧ b = j then t ^ 2 * A i i else 0) := by
  by_cases ha : a = j <;> by_cases hb : b = j <;>
    simp_all [inverseShear, colShear, rowShear, Matrix.updateRow_apply] <;> ring

lemma det_rowShear (A : Matrix I I R) (i j : I) (t : R) (hij : i ≠ j) :
    (rowShear A i j t).det = A.det := by
  exact Matrix.det_updateRow_add_smul_self A hij t

lemma det_colShear (A : Matrix I I R) (i j : I) (t : R) (hij : i ≠ j) :
    (colShear A i j t).det = A.det := by
  rw [colShear, Matrix.det_transpose, det_rowShear _ _ _ _ hij, Matrix.det_transpose]

lemma det_inverseShear (A : Matrix I I R) (i j : I) (t : R) (hij : i ≠ j) :
    (inverseShear A i j t).det = A.det := by
  rw [inverseShear, det_colShear _ _ _ _ hij.symm, det_rowShear _ _ _ _ hij.symm]

lemma Z_symm (A : Matrix I I R) (hA : A.IsSymm) : (Z A).IsSymm := by
  exact hA.sub (Matrix.isSymm_diagonal _)

lemma inverseShear_symm (A : Matrix I I R) (hA : A.IsSymm)
    (i j : I) (t : R) : (inverseShear A i j t).IsSymm := by
  apply Matrix.IsSymm.ext
  intro a b
  have hab := hA.apply a b
  have hai := hA.apply i a
  have hbi := hA.apply i b
  simp only [inverseShear_apply]
  by_cases ha : a = j <;> by_cases hb : b = j <;> simp_all <;> ring

/-- Exact identity, before any reduction modulo eight. -/
lemma Z_inverseShear (A : Matrix I I R) (hA : A.IsSymm)
    (i j : I) (hij : i ≠ j) (t : R) :
    Z (inverseShear A i j t) =
      inverseShear (Z A) i j t + Matrix.single i j (-t * A i i) +
        Matrix.single j i (-t * A i i) + Matrix.single j j (2 * t * A i j) := by
  have hji := hA.apply i j
  ext a b
  by_cases hab : a = b <;> by_cases ha : a = j <;> by_cases hb : b = j <;>
    by_cases hai : a = i <;> by_cases hbi : b = i <;>
    simp_all [Z, inverseShear_apply, Matrix.diagonal_apply, Matrix.diag_apply,
      Matrix.single_apply, eq_comm] <;> ring

lemma det_add_single_diag (A : Matrix I I R) (j : I) (s : R) :
    (A + Matrix.single j j s).det = A.det + s * A.adjugate j j := by
  have he : A + Matrix.single j j s =
      Matrix.updateRow A j (A j + s • Pi.single j 1) := by
    ext a b
    by_cases ha : a = j <;> by_cases hb : b = j <;>
      simp_all [Matrix.single_apply, Matrix.updateRow_apply, Pi.single_apply, eq_comm]
  rw [he, Matrix.det_updateRow_add, Matrix.det_updateRow_smul,
    Matrix.updateRow_eq_self, Matrix.adjugate_apply]

/-- A principal cofactor ignores the deleted row and column, with no unit premise. -/
lemma adjugate_diagonal_eq_of_away {n : ℕ}
    (A B : Matrix (Fin (n + 1)) (Fin (n + 1)) R) (j : Fin (n + 1))
    (hAB : ∀ a b, a ≠ j → b ≠ j → A a b = B a b) :
    A.adjugate j j = B.adjugate j j := by
  have hm : A.submatrix j.succAbove j.succAbove =
      B.submatrix j.succAbove j.succAbove := by
    ext a b
    exact hAB _ _ (Fin.succAbove_ne _ _) (Fin.succAbove_ne _ _)
  rw [Matrix.adjugate_fin_succ_eq_det_submatrix,
    Matrix.adjugate_fin_succ_eq_det_submatrix, hm]

lemma map_Z (A : Matrix I I (ZMod 8))
    (hd : ∀ i, modTwoEight (A i i) = 0) :
    (Z A).map modTwoEight = A.map modTwoEight := by
  ext a b
  by_cases hab : a = b <;>
    simp_all [Z, Matrix.diagonal_apply, Matrix.diag_apply, map_sub]

lemma isUnit_det_Z (A : Matrix I I (ZMod 8))
    (hd : ∀ i, modTwoEight (A i i) = 0) (hunit : IsUnit A.det) :
    IsUnit (Z A).det := by
  apply (isUnit_iff_modTwoEight_ne_zero _).mpr
  have he : modTwoEight (Z A).det = modTwoEight A.det := by
    calc
      _ = ((Z A).map modTwoEight).det := modTwoEight.map_det _
      _ = (A.map modTwoEight).det := congrArg Matrix.det (map_Z A hd)
      _ = _ := (modTwoEight.map_det _).symm
  rw [he]
  exact (isUnit_iff_modTwoEight_ne_zero _).mp hunit

lemma inverseShear_even (A : Matrix I I (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, modTwoEight (A i i) = 0) (i j : I) (t : ZMod 8) :
    ∀ k, modTwoEight (inverseShear A i j t k k) = 0 := by
  intro k
  by_cases hk : k = j
  · subst k
    have he : inverseShear A i j t j j =
        A j j - 2 * t * A i j + t ^ 2 * A i i := by
      simp [inverseShear_apply, hA.apply i j]
      ring
    have htwo : modTwoEight (2 : ZMod 8) = 0 := by
      change ((2 : ZMod 8).val : ZMod 2) = 0
      decide
    rw [he]
    simp [map_sub, map_add, map_mul, map_pow, hd, htwo]
  · simp [inverseShear_apply, hk, hd]

/-- The exact determinant increment; the odd-minor quadratic identity is separate. -/
lemma det_Z_inverseShear {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, modTwoEight (A i i) = 0) (hunit : IsUnit A.det)
    (i j : Fin (n + 1)) (hij : i ≠ j) (t : ZMod 8) :
    (Z (inverseShear A i j t)).det - (Z A).det =
      2 * t * A i j * (Z A).adjugate j j := by
  let K := inverseShear (Z A) i j t
  let c := -t * A i i
  let N := K + Matrix.single i j c + Matrix.single j i c
  have hKsymm : K.IsSymm := inverseShear_symm (Z A) (Z_symm A hA) i j t
  have hKdiag : ∀ k, modTwoEight (K k k) = 0 := by
    apply inverseShear_even (Z A) (Z_symm A hA)
    intro k
    simp [Z]
  have hKdet : K.det = (Z A).det := det_inverseShear (Z A) i j t hij
  have hKunit : IsUnit K.det := by
    rw [hKdet]
    exact isUnit_det_Z A hd hunit
  obtain ⟨u, hu⟩ := (modTwoEight_zero_iff_two_mul (A i i)).mp (hd i)
  have hc : c = 2 * (-t * u) := by dsimp [c]; rw [hu]; ring
  have hNdet : N.det = K.det := by
    dsimp [N]
    rw [hc]
    exact det_add_even_symm_pair K hKsymm hKdiag hKunit i j (-t * u)
  have hNadj : N.adjugate j j = (Z A).adjugate j j := by
    apply adjugate_diagonal_eq_of_away N (Z A) j
    intro a b ha hb
    simp [N, K, c, inverseShear_apply, Matrix.single_apply, ha, hb,
      Ne.symm ha, Ne.symm hb]
  have he : Z (inverseShear A i j t) = N + Matrix.single j j (2 * t * A i j) := by
    exact Z_inverseShear A hA i j hij t
  rw [he, det_add_single_diag, hNdet, hKdet, hNadj]
  ring

end OMA.MO513259.DetShear


/-!
Two-dimensional permanent and exact optional-extension counterexamples for
MathOverflow 513259. These results do not prove its graph conjectures.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact model variant is not exposed). The runtime lane found the first
optional-extension counterexample; the algebra lane found the second.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

lemma permanent_fin_two {R : Type*} [CommSemiring R]
    (A : Matrix (Fin 2) (Fin 2) R) :
    A.permanent = A 0 0 * A 1 1 + A 1 0 * A 0 1 := by
  have hp : (Finset.univ : Finset (Equiv.Perm (Fin 2))) =
      {1, Equiv.swap 0 1} := by decide
  rw [Matrix.permanent, hp]
  rw [Finset.sum_pair (by decide : (1 : Equiv.Perm (Fin 2)) ≠ Equiv.swap 0 1)]
  simp [Fin.prod_univ_two]

def evenTwo (a b c : ZMod 8) : Matrix (Fin 2) (Fin 2) (ZMod 8) :=
  !![2 * a, b; b, 2 * c]

def evenTwoCandidateInverse (a b c : ZMod 8) : Matrix (Fin 2) (Fin 2) (ZMod 8) :=
  (4 * a * c - b ^ 2) • !![2 * c, -b; -b, 2 * a]

/- A finite scalar-ring calculation covers every possible two-dimensional pivot.
It is only the base case of the proposed general congruence induction. -/
set_option maxRecDepth 10000 in
lemma evenTwo_mul_candidate (a b c : ZMod 8) (hb : Nat.Coprime b.val 8) :
    evenTwo a b c * evenTwoCandidateInverse a b c = 1 := by
  have hfinite : ∀ a b c : ZMod 8, Nat.Coprime b.val 8 →
      evenTwo a b c * evenTwoCandidateInverse a b c = 1 := by decide
  exact hfinite a b c hb

set_option maxRecDepth 10000 in
lemma base_two_corrected_congruence (a b c : ZMod 8) (hb : IsUnit b) :
    (evenTwo a b c).det * ((evenTwo a b c)⁻¹).permanent =
      (!![0, b; b, 0] : Matrix (Fin 2) (Fin 2) (ZMod 8)).det := by
  have hbval : Nat.Coprime b.val 8 :=
    (ZMod.isUnit_iff_coprime b.val 8).mp (by simpa using hb)
  rw [Matrix.inv_eq_right_inv (evenTwo_mul_candidate a b c hbval)]
  have hfinite : ∀ a b c : ZMod 8, Nat.Coprime b.val 8 →
      (evenTwo a b c).det * (evenTwoCandidateInverse a b c).permanent =
        (!![0, b; b, 0] : Matrix (Fin 2) (Fin 2) (ZMod 8)).det := by decide
  exact hfinite a b c hbval

def extensionEight : Matrix (Fin 2) (Fin 2) (ZMod 8) := !![2, 1; 1, 2]

def extensionEightInverse : Matrix (Fin 2) (Fin 2) (ZMod 8) := !![6, 5; 5, 6]

lemma extensionEight_mul_inverse : extensionEight * extensionEightInverse = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [extensionEight, extensionEightInverse, Matrix.mul_apply, Fin.sum_univ_two] <;>
    decide

lemma extensionEight_inv : extensionEight⁻¹ = extensionEightInverse :=
  Matrix.inv_eq_right_inv extensionEight_mul_inverse

lemma even_diagonal_extension_eight_false :
    extensionEight.IsSymm ∧ (∀ i, ∃ x, extensionEight i i = 2 * x) ∧
      IsUnit extensionEight.det ∧ (extensionEight⁻¹).permanent ≠ 1 := by
  refine ⟨?_, ?_, Matrix.isUnit_det_of_right_inverse extensionEight_mul_inverse, ?_⟩
  · apply Matrix.IsSymm.ext
    intro i j
    fin_cases i <;> fin_cases j <;> rfl
  · intro i
    refine ⟨1, ?_⟩
    fin_cases i <;> decide
  · rw [extensionEight_inv, permanent_fin_two]
    decide

def extensionTwentyFour : Matrix (Fin 2) (Fin 2) (ZMod 24) := !![2, 1; 1, 6]

def extensionTwentyFourInverse : Matrix (Fin 2) (Fin 2) (ZMod 24) :=
  !![18, 13; 13, 22]

lemma extensionTwentyFour_mul_inverse :
    extensionTwentyFour * extensionTwentyFourInverse = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [extensionTwentyFour, extensionTwentyFourInverse,
      Matrix.mul_apply, Fin.sum_univ_two] <;> decide

lemma extensionTwentyFour_inv : extensionTwentyFour⁻¹ = extensionTwentyFourInverse :=
  Matrix.inv_eq_right_inv extensionTwentyFour_mul_inverse

lemma even_diagonal_extension_twenty_four_false :
    extensionTwentyFour.IsSymm ∧ (∀ i, ∃ x, extensionTwentyFour i i = 2 * x) ∧
      IsUnit extensionTwentyFour.det ∧
      2 * extensionTwentyFour.permanent + (extensionTwentyFour⁻¹).permanent - 3 ≠ 0 := by
  refine ⟨?_, ?_, Matrix.isUnit_det_of_right_inverse extensionTwentyFour_mul_inverse, ?_⟩
  · apply Matrix.IsSymm.ext
    intro i j
    fin_cases i <;> fin_cases j <;> rfl
  · intro i
    fin_cases i
    · exact ⟨1, by decide⟩
    · exact ⟨3, by decide⟩
  · rw [extensionTwentyFour_inv, permanent_fin_two, permanent_fin_two]
    decide

end OMA.MO513259



/-!
Exact signed-half infrastructure for the copied-row term in MO513259.
This uses Thomas Browning's existing positive/negative determinant API in
Mathlib.LinearAlgebra.Matrix.SemiringInverse (2024). It does not establish
the complementary-minor congruence needed for the full graph proof.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact serving variant is not exposed).
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

lemma permanent_eq_detp_one_add_neg (A : Matrix I I R) :
    A.permanent = A.detp 1 + A.detp (-1) := by
  classical
  calc
    A.permanent = ∑ p : Equiv.Perm I, ∏ k, A k (p k) := by
      rw [← Matrix.permanent_transpose]
      rfl
    _ = A.detp 1 + A.detp (-1) := by
      rw [← Equiv.Perm.ofSign_disjUnion, Finset.sum_disjUnion]
      rfl

lemma permanent_of_equal_rows (A : Matrix I I R) (i j : I) (hij : i ≠ j)
    (hrow : A.row i = A.row j) : A.permanent = 2 * A.detp 1 := by
  have hh : A.detp 1 = A.detp (-1) := Matrix.detp_eq_of_row_eq hij hrow
  rw [permanent_eq_detp_one_add_neg, ← hh, two_mul]

lemma permanent_copyRow_eq_two_detp (A : Matrix I I R) (i j : I) (hij : i ≠ j) :
    (Matrix.updateRow A i (A j)).permanent =
      2 * (Matrix.updateRow A i (A j)).detp 1 := by
  apply permanent_of_equal_rows _ i j hij
  ext k
  change (Matrix.updateRow A i (A j)) i k = (Matrix.updateRow A i (A j)) j k
  simp [Matrix.updateRow_apply, hij, hij.symm]

lemma odd_skew_integer_det_zero (A : Matrix I I ℤ)
    (hskew : Aᵀ = -A) (hodd : Odd (Fintype.card I)) : A.det = 0 := by
  have he : A.det = -A.det := by
    calc
      A.det = Aᵀ.det := (Matrix.det_transpose A).symm
      _ = (-A).det := congrArg Matrix.det hskew
      _ = -A.det := by rw [Matrix.det_neg, hodd.neg_one_pow, neg_one_mul]
  omega

end OMA.MO513259



/-!
Coordinate-row replacement and complementary inverse minors for MO513259.
This standard determinant identity is derived from Mathlib's rank-update
determinant lemma; no small minor is assumed invertible. It is infrastructure
for the general proof, not a solution by itself.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact serving variant is not exposed).
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I J R : Type*} [Fintype I] [Fintype J]
  [DecidableEq I] [DecidableEq J] [CommRing R]

lemma rows_submatrix_mul (M N : Matrix I I R) (r : J → I) :
    M.submatrix r id * N = (M * N).submatrix r id := by
  simpa using Matrix.submatrix_mul_equiv M N r (Equiv.refl I) id

lemma rows_submatrix_mul_selector (M : Matrix I I R) (r c : J → I) :
    M.submatrix r id * (1 : Matrix I I R).submatrix id c = M.submatrix r c := by
  simpa using Matrix.submatrix_mul_equiv M (1 : Matrix I I R) r (Equiv.refl I) c

def coordinateRowReplacement (A : Matrix I I R) (selected keys : J → I) :
    Matrix I I R :=
  A + (1 : Matrix I I R).submatrix id selected *
    ((1 : Matrix I I R).submatrix keys id - A.submatrix selected id)

lemma det_coordinateRowReplacement (A : Matrix I I R) (hA : IsUnit A.det)
    (selected keys : J → I) (hs : Function.Injective selected) :
    (coordinateRowReplacement A selected keys).det =
      A.det * ((A⁻¹).submatrix keys selected).det := by
  let U : Matrix I J R := (1 : Matrix I I R).submatrix id selected
  let V : Matrix J I R :=
    (1 : Matrix I I R).submatrix keys id - A.submatrix selected id
  have hleft : V * A⁻¹ =
      (A⁻¹).submatrix keys id - (1 : Matrix I I R).submatrix selected id := by
    dsimp [V]
    rw [Matrix.sub_mul, rows_submatrix_mul, rows_submatrix_mul,
      Matrix.one_mul, Matrix.mul_nonsing_inv A hA]
  have hsmall : 1 + V * A⁻¹ * U = (A⁻¹).submatrix keys selected := by
    rw [hleft, Matrix.sub_mul]
    dsimp [U]
    rw [rows_submatrix_mul_selector, rows_submatrix_mul_selector,
      Matrix.submatrix_one selected hs]
    abel
  change (A + U * V).det = _
  rw [Matrix.det_add_mul U V hA, hsmall]

lemma coordinateRowReplacement_selected (A : Matrix I I R)
    (selected keys : J → I) (hs : Function.Injective selected) (a : J) (j : I) :
    coordinateRowReplacement A selected keys (selected a) j =
      (1 : Matrix I I R) (keys a) j := by
  classical
  simp [coordinateRowReplacement, Matrix.mul_apply, Matrix.one_apply, hs.eq_iff] <;> ring

lemma coordinateRowReplacement_unselected (A : Matrix I I R)
    (selected keys : J → I) (i j : I) (hi : ∀ a, i ≠ selected a) :
    coordinateRowReplacement A selected keys i j = A i j := by
  classical
  simp [coordinateRowReplacement, Matrix.mul_apply, Matrix.one_apply, hi]

end OMA.MO513259



/-!
Ordinary row multilinearity and coordinate expansion for MO513259.
This fragment follows MO513259Permanent.lean in a combined probe. No congruence
or full graph solution is asserted by these expansion identities alone.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact serving variant is not exposed).
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

lemma permanent_updateRow_zero (A : Matrix I I R) (i : I) :
    (Matrix.updateRow A i 0).permanent = 0 := by
  rw [← Matrix.permanent_transpose, ← Matrix.updateCol_transpose,
    permanent_updateCol_expansion]
  simp

lemma permanent_updateRow_finset_sum {K : Type*} (A : Matrix I I R) (i : I)
    (s : Finset K) (v : K → I → R) :
    (Matrix.updateRow A i (∑ k ∈ s, v k)).permanent =
      ∑ k ∈ s, (Matrix.updateRow A i (v k)).permanent := by
  classical
  induction s using Finset.induction_on with
  | empty => simp [permanent_updateRow_zero]
  | @insert k s hk ih =>
    rw [Finset.sum_insert hk, permanent_updateRow_add, ih, Finset.sum_insert hk]

lemma permanent_updateRow_basis_expansion (A : Matrix I I R) (i : I) (v : I → R) :
    (Matrix.updateRow A i v).permanent =
      ∑ k, v k * (Matrix.updateRow A i (Pi.single k 1)).permanent := by
  classical
  have hv : (∑ k, v k • Pi.single k 1) = v := by
    funext l
    simp [Pi.single_apply, eq_comm]
  calc
    (Matrix.updateRow A i v).permanent =
        (Matrix.updateRow A i (∑ k, v k • Pi.single k 1)).permanent := by rw [hv]
    _ = ∑ k, (Matrix.updateRow A i (v k • Pi.single k 1)).permanent :=
      permanent_updateRow_finset_sum A i Finset.univ _
    _ = ∑ k, v k * (Matrix.updateRow A i (Pi.single k 1)).permanent := by
      simp only [Matrix.permanent_updateRow_smul]

def forceTwoRows (A : Matrix I I R) (i j k l : I) : Matrix I I R :=
  (A.updateRow i (Pi.single k 1)).updateRow j (Pi.single l 1)

lemma permanent_update_two_rows (A : Matrix I I R) (i j : I) (hij : i ≠ j)
    (v w : I → R) :
    ((A.updateRow i v).updateRow j w).permanent =
      ∑ k, ∑ l, v k * w l * (forceTwoRows A i j k l).permanent := by
  classical
  calc
    ((A.updateRow i v).updateRow j w).permanent =
        ((A.updateRow j w).updateRow i v).permanent := by
      rw [Matrix.updateRow_comm A hij v w]
    _ = ∑ k, v k * ((A.updateRow j w).updateRow i (Pi.single k 1)).permanent :=
      permanent_updateRow_basis_expansion _ i v
    _ = ∑ k, v k * ((A.updateRow i (Pi.single k 1)).updateRow j w).permanent := by
      apply Finset.sum_congr rfl
      intro k _
      rw [Matrix.updateRow_comm A hij (Pi.single k 1) w]
    _ = ∑ k, ∑ l, v k * w l * (forceTwoRows A i j k l).permanent := by
      apply Finset.sum_congr rfl
      intro k _
      rw [permanent_updateRow_basis_expansion]
      simp only [Finset.mul_sum, mul_assoc, forceTwoRows]

end OMA.MO513259



/-!
Ordered-pair finite-sum identities for the permanent orbit calculations.
These generic identities alone do not prove the source graph conjectures.
-/

namespace OMA.MO513259

open scoped BigOperators

variable {I R : Type*} [Fintype I] [LinearOrder I] [CommSemiring R]

def upperPairSum (f : I → I → R) : R :=
  ∑ i, ∑ j, if i < j then f i j else 0

lemma sum_all_pairs (f : I → I → R) :
    (∑ i, ∑ j, f i j) = (∑ i, f i i) +
      upperPairSum (fun i j => f i j + f j i) := by
  classical
  have hpoint (i j : I) : f i j =
      (if i = j then f i j else 0) +
      (if i < j then f i j else 0) + (if j < i then f i j else 0) := by
    rcases lt_trichotomy i j with h | h | h
    · simp [h, h.ne, not_lt_of_ge h.le]
    · subst j
      simp
    · simp [h, h.ne.symm, not_lt_of_ge h.le]
  have hswap : (∑ i, ∑ j, if j < i then f i j else 0) =
      ∑ i, ∑ j, if i < j then f j i else 0 := by
    rw [Finset.sum_comm]
  calc
    (∑ i, ∑ j, f i j) = ∑ i, ∑ j,
        ((if i = j then f i j else 0) +
          (if i < j then f i j else 0) + (if j < i then f i j else 0)) := by
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      exact hpoint i j
    _ = (∑ i, f i i) + (∑ i, ∑ j, if i < j then f i j else 0) +
        (∑ i, ∑ j, if j < i then f i j else 0) := by
      simp only [Finset.sum_add_distrib]
      simp
    _ = (∑ i, f i i) + upperPairSum (fun i j => f i j + f j i) := by
      rw [hswap, add_assoc]
      congr 1
      unfold upperPairSum
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro i _
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro j _
      by_cases h : i < j <;> simp [h]

lemma sum_symmetric_pairs (f : I → I → R) (hdiag : ∀ i, f i i = 0)
    (hsym : ∀ i j, f i j = f j i) :
    (∑ i, ∑ j, f i j) = 2 * upperPairSum f := by
  rw [sum_all_pairs]
  simp only [hdiag, Finset.sum_const_zero, zero_add]
  unfold upperPairSum
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  by_cases h : i < j <;> simp [h, hsym j i, two_mul]

end OMA.MO513259



/-!
Exact copied-row orbit factor for MO513259. This fragment follows the generic
permanent, row-expansion and ordered-pair helpers. The inverse-minor reduction
and remaining graph proof are separate obligations.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

lemma forceTwoRows_permanent_same (A : Matrix I I R) (i j : I)
    (hij : i ≠ j) (k : I) : (forceTwoRows A i j k k).permanent = 0 := by
  classical
  rw [← Matrix.permanent_transpose, Matrix.permanent]
  apply Finset.sum_eq_zero
  intro p _
  by_cases hi : p i = k
  · have hj : p j ≠ k := by
      intro h
      exact hij (p.injective (hi.trans h.symm))
    apply Finset.prod_eq_zero (Finset.mem_univ j)
    simp [forceTwoRows, Matrix.transpose_apply, Matrix.updateRow_apply,
      Pi.single_apply, hj, hj.symm]
  · apply Finset.prod_eq_zero (Finset.mem_univ i)
    simp [forceTwoRows, Matrix.transpose_apply, Matrix.updateRow_apply,
      Pi.single_apply, hij, hij.symm, hi, Ne.symm hi]

lemma forceTwoRows_permanent_swap (A : Matrix I I R) (i j : I)
    (hij : i ≠ j) (k l : I) :
    (forceTwoRows A i j k l).permanent = (forceTwoRows A i j l k).permanent := by
  classical
  have hm : (forceTwoRows A i j k l).submatrix (Equiv.swap i j) id =
      forceTwoRows A i j l k := by
    ext a b
    by_cases hi : a = i
    · subst a
      simp [forceTwoRows, Matrix.submatrix_apply, hij, hij.symm]
    · by_cases hj : a = j
      · subst a
        simp [forceTwoRows, Matrix.submatrix_apply, hij, hij.symm]
      · simp [forceTwoRows, Matrix.submatrix_apply,
          Equiv.swap_apply_of_ne_of_ne hi hj, Matrix.updateRow_apply, hi, hj]
  calc
    (forceTwoRows A i j k l).permanent =
        ((forceTwoRows A i j k l).submatrix (Equiv.swap i j) id).permanent :=
      (Matrix.permanent_permute_cols _ _).symm
    _ = (forceTwoRows A i j l k).permanent := by rw [hm]

section Ordered

variable [LinearOrder I]

def copyRowHalf (A : Matrix I I R) (i j : I) : R :=
  upperPairSum (fun k l => A j k * A j l * (forceTwoRows A i j k l).permanent)

lemma permanent_copyRow_eq_two_ordered_half (A : Matrix I I R)
    (i j : I) (hij : i ≠ j) :
    (A.updateRow i (A j)).permanent = 2 * copyRowHalf A i j := by
  classical
  have hm : (A.updateRow i (A j)).updateRow j (A j) = A.updateRow i (A j) := by
    ext a b
    by_cases ha : a = j
    · subst a
      simp [Matrix.updateRow_apply, hij, hij.symm]
    · simp [Matrix.updateRow_apply, ha]
  calc
    (A.updateRow i (A j)).permanent =
        ((A.updateRow i (A j)).updateRow j (A j)).permanent := by rw [hm]
    _ = ∑ k, ∑ l, A j k * A j l * (forceTwoRows A i j k l).permanent :=
      permanent_update_two_rows A i j hij (A j) (A j)
    _ = 2 * copyRowHalf A i j := by
      unfold copyRowHalf
      apply sum_symmetric_pairs
      · intro k
        rw [forceTwoRows_permanent_same A i j hij k, mul_zero]
      · intro k l
        rw [forceTwoRows_permanent_swap A i j hij k l]
        ring

end Ordered
end OMA.MO513259



/-!
Two forced rows as a rank-two determinant update. This integration fragment
uses the already checked row-replacement, row-expansion, parity and ordered
orbit helpers. The general graph theorem remains a separate obligation.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommRing R]

lemma det_forceTwoRows (A : Matrix I I R) (hA : IsUnit A.det)
    (i j : I) (hij : i ≠ j) (k l : I) :
    (forceTwoRows A i j k l).det =
      A.det * ((A⁻¹) k i * (A⁻¹) l j - (A⁻¹) k j * (A⁻¹) l i) := by
  classical
  let selected : Fin 2 → I := ![i, j]
  let keys : Fin 2 → I := ![k, l]
  have hs : Function.Injective selected := by
    intro a b h
    fin_cases a <;> fin_cases b
    · rfl
    · exact False.elim (hij h)
    · exact False.elim (hij h.symm)
    · rfl
  have hm : coordinateRowReplacement A selected keys = forceTwoRows A i j k l := by
    ext a b
    by_cases hi : a = i
    · subst a
      change coordinateRowReplacement A selected keys (selected (0 : Fin 2)) b = _
      rw [coordinateRowReplacement_selected A selected keys hs (0 : Fin 2) b]
      by_cases hb : k = b
      · subst b
        simp [keys, forceTwoRows, Matrix.updateRow_apply, Matrix.one_apply, hij, hij.symm]
      · simp [keys, forceTwoRows, Matrix.updateRow_apply, hij, hij.symm,
          Pi.single_apply, Matrix.one_apply, hb, Ne.symm hb]
    · by_cases hj : a = j
      · subst a
        change coordinateRowReplacement A selected keys (selected (1 : Fin 2)) b = _
        rw [coordinateRowReplacement_selected A selected keys hs (1 : Fin 2) b]
        by_cases hb : l = b
        · subst b
          simp [keys, forceTwoRows, Matrix.updateRow_apply, Matrix.one_apply, hij, hij.symm]
        · simp [keys, forceTwoRows, Matrix.updateRow_apply, hij, hij.symm,
            Pi.single_apply, Matrix.one_apply, hb, Ne.symm hb]
      · have hn : ∀ q : Fin 2, a ≠ selected q := by
          intro q
          fin_cases q
          · exact hi
          · exact hj
        have he := coordinateRowReplacement_unselected A selected keys a b hn
        simpa [forceTwoRows, Matrix.updateRow_apply, hi, hj] using he
  rw [← hm, det_coordinateRowReplacement A hA selected keys hs, Matrix.det_fin_two]
  simp [selected, keys]

lemma map_forceTwoRows {S : Type*} [CommRing S] (f : R →+* S)
    (A : Matrix I I R) (i j k l : I) :
    (forceTwoRows A i j k l).map f = forceTwoRows (A.map f) i j k l := by
  classical
  have hb (a : I) : f ∘ (Pi.single a 1 : I → R) = (Pi.single a 1 : I → S) := by
    funext b
    by_cases h : b = a
    · subst b
      simp
    · simp [Pi.single_apply, h, Ne.symm h]
  simp only [forceTwoRows, Matrix.map_updateRow, hb]

section Ordered

variable [LinearOrder I]

lemma map_copyRowHalf {S : Type*} [CommRing S] (f : R →+* S)
    (A : Matrix I I R) (i j : I) :
    f (copyRowHalf A i j) = copyRowHalf (A.map f) i j := by
  classical
  simp only [copyRowHalf, upperPairSum, map_sum, apply_ite, map_mul,
    map_zero, map_permanent, map_forceTwoRows, Matrix.map_apply]

lemma copyRowHalf_mod_two_inverse (A : Matrix I I (ZMod 2)) (hA : IsUnit A.det)
    (i j : I) (hij : i ≠ j) :
    copyRowHalf A i j = upperPairSum (fun k l => A j k * A j l *
      ((A⁻¹) k i * (A⁻¹) l j + (A⁻¹) k j * (A⁻¹) l i)) := by
  classical
  have hdet : A.det = 1 := by
    have ht : ∀ x : ZMod 2, x ≠ 0 → x = 1 := by decide
    exact ht _ hA.ne_zero
  have hneg : ∀ x : ZMod 2, -x = x := by decide
  unfold copyRowHalf upperPairSum
  apply Finset.sum_congr rfl
  intro k _
  apply Finset.sum_congr rfl
  intro l _
  by_cases h : k < l
  · simp only [if_pos h]
    rw [permanent_eq_det_mod_two, det_forceTwoRows A hA i j hij k l, hdet, one_mul]
    simp only [sub_eq_add_neg, hneg]
  · simp only [if_neg h]

end Ordered
end OMA.MO513259



/-!
Polarization over F2 and the closed copied-row-half formula for MO513259.
This fragment follows the orbit/minor helpers. It supplies the two-row part
of the congruence variation; the four-row/column part is still separate.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I : Type*} [Fintype I] [LinearOrder I]

lemma upperPairSum_polar (v x y : I → ZMod 2) :
    upperPairSum (fun k l => v k * v l * (x k * y l + y k * x l)) =
      (∑ k, v k * x k) * (∑ k, v k * y k) + ∑ k, v k * x k * y k := by
  classical
  have hprod : (∑ k, v k * x k) * (∑ k, v k * y k) =
      ∑ k, ∑ l, v k * v l * x k * y l := by
    rw [Finset.sum_mul_sum]
    apply Finset.sum_congr rfl
    intro k _
    apply Finset.sum_congr rfl
    intro l _
    ring
  have hidem : ∀ z : ZMod 2, z * z = z := by decide
  have hdiag : (∑ k, v k * v k * x k * y k) = ∑ k, v k * x k * y k := by
    apply Finset.sum_congr rfl
    intro k _
    rw [hidem]
  have hoff : upperPairSum (fun k l =>
      v k * v l * x k * y l + v l * v k * x l * y k) =
      upperPairSum (fun k l => v k * v l * (x k * y l + y k * x l)) := by
    unfold upperPairSum
    apply Finset.sum_congr rfl
    intro k _
    apply Finset.sum_congr rfl
    intro l _
    by_cases h : k < l <;> simp only [h, if_true, if_false] <;> ring
  have hrel := sum_all_pairs (fun k l => v k * v l * x k * y l)
  rw [← hprod, hdiag, hoff] at hrel
  calc
    upperPairSum (fun k l => v k * v l * (x k * y l + y k * x l)) =
        ((∑ k, v k * x k * y k) + (∑ k, v k * x k * y k)) +
          upperPairSum (fun k l => v k * v l * (x k * y l + y k * x l)) := by
      rw [CharTwo.add_self_eq_zero, zero_add]
    _ = ((∑ k, v k * x k * y k) +
          upperPairSum (fun k l => v k * v l * (x k * y l + y k * x l))) +
          (∑ k, v k * x k * y k) := by ac_rfl
    _ = (∑ k, v k * x k) * (∑ k, v k * y k) + ∑ k, v k * x k * y k := by
      rw [← hrel]

lemma copyRowHalf_mod_two_closed (A : Matrix I I (ZMod 2)) (hA : IsUnit A.det)
    (i j : I) (hij : i ≠ j) :
    copyRowHalf A i j = ∑ k, A j k * (A⁻¹) k i * (A⁻¹) k j := by
  rw [copyRowHalf_mod_two_inverse A hA i j hij, upperPairSum_polar]
  have hzero : (∑ k, A j k * (A⁻¹) k i) = 0 := by
    have he := congrFun (congrFun (Matrix.mul_nonsing_inv A hA) j) i
    simpa [Matrix.mul_apply, Matrix.one_apply, hij, hij.symm] using he
  rw [hzero, zero_mul, zero_add]

lemma copyRowHalf_eight_reduction (A : Matrix I I (ZMod 8)) (hA : IsUnit A.det)
    (i j : I) (hij : i ≠ j) :
    modTwoEight (copyRowHalf A i j) =
      ∑ k, modTwoEight (A j k) * modTwoEight ((A⁻¹) k i) *
        modTwoEight ((A⁻¹) k j) := by
  have hunit : IsUnit (A.map modTwoEight).det := by
    have he : modTwoEight A.det = (A.map modTwoEight).det := modTwoEight.map_det A
    rw [← he]
    exact hA.map modTwoEight
  rw [map_copyRowHalf]
  have he := copyRowHalf_mod_two_closed (A.map modTwoEight) hunit i j hij
  have hinv : (A.map modTwoEight)⁻¹ = (A⁻¹).map modTwoEight :=
    (map_matrix_inverse modTwoEight A hA).symm
  simpa only [hinv, Matrix.map_apply] using he

end OMA.MO513259



/-!
Exact forced-edge cleanup for permanent expansions. This fragment follows
MO513259Permanent.lean and is only infrastructure for MO513259.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

lemma permanent_forced_col_cleanup (A : Matrix I I R) (r c : I) :
    (A.updateCol c (Pi.single r 1)).permanent =
      ((A.updateCol c (Pi.single r 1)).updateRow r (Pi.single c 1)).permanent := by
  classical
  have hm : (A.updateCol c (Pi.single r 1)).updateRow r (Pi.single c 1) =
      (A.updateRow r (Pi.single c 1)).updateCol c (Pi.single r 1) := by
    ext a b
    by_cases ha : a = r <;> by_cases hb : b = c <;>
      simp [Matrix.updateRow_apply, Matrix.updateCol_apply,
        Pi.single_apply, ha, hb, eq_comm]
  rw [hm, permanent_updateCol_expansion, permanent_updateCol_expansion]
  apply Finset.sum_congr rfl
  intro p _
  by_cases hp : p c = r
  · have hone : (Pi.single r (1 : R) : I → R) (p c) = 1 := by simp [hp]
    simp only [hone, one_mul]
    apply Finset.prod_congr rfl
    intro k hk
    have hpk : p k ≠ r := by
      intro he
      exact (Finset.ne_of_mem_erase hk) (p.injective (he.trans hp.symm))
    simp [Matrix.updateRow_apply, hpk]
  · have hzero : (Pi.single r (1 : R) : I → R) (p c) = 0 := by
      simp [Pi.single_apply, hp, Ne.symm hp]
    simp only [hzero, zero_mul]

lemma permanent_forced_row_cleanup (A : Matrix I I R) (r c : I) :
    (A.updateRow r (Pi.single c 1)).permanent =
      ((A.updateRow r (Pi.single c 1)).updateCol c (Pi.single r 1)).permanent := by
  have h := permanent_forced_col_cleanup Aᵀ c r
  simpa only [Matrix.updateRow_transpose, Matrix.updateCol_transpose,
    Matrix.permanent_transpose] using h

end OMA.MO513259



/-!
Equivalent row and column representations of two forced matching edges.
This fragment follows the permanent, row-expansion and forced-edge helpers.
-/

namespace OMA.MO513259

open scoped Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

def forceTwoCols (A : Matrix I I R) (i j r s : I) : Matrix I I R :=
  (A.updateCol i (Pi.single r 1)).updateCol j (Pi.single s 1)

lemma permanent_cleanup_of_row (A : Matrix I I R) (r c : I)
    (hr : A r = Pi.single c 1) :
    A.permanent = (A.updateCol c (Pi.single r 1)).permanent := by
  have hself : A.updateRow r (Pi.single c 1) = A := by
    rw [← hr, Matrix.updateRow_eq_self]
  have h := permanent_forced_row_cleanup A r c
  simpa only [hself] using h

lemma permanent_cleanup_of_col (A : Matrix I I R) (r c : I)
    (hc : A.col c = Pi.single r 1) :
    A.permanent = (A.updateRow r (Pi.single c 1)).permanent := by
  have hself : A.updateCol c (Pi.single r 1) = A := by
    rw [← hc]
    exact Matrix.updateCol_eq_self A c
  have h := permanent_forced_col_cleanup A r c
  simpa only [hself] using h

lemma permanent_forceTwoCols_eq_rows (A : Matrix I I R) (i j r s : I)
    (hij : i ≠ j) (hrs : r ≠ s) :
    (forceTwoCols A i j r s).permanent = (forceTwoRows A r s i j).permanent := by
  classical
  let C := forceTwoCols A i j r s
  let P := forceTwoRows A r s i j
  have hm : forceTwoRows C r s i j = forceTwoCols P i j r s := by
    ext a b
    by_cases ha : a = r <;> by_cases hb : a = s <;>
      by_cases hc : b = i <;> by_cases hd : b = j <;>
        simp_all [C, P, forceTwoCols, forceTwoRows, Matrix.updateRow_apply,
          Matrix.updateCol_apply, Pi.single_apply, eq_comm]
  have hPr : P r = Pi.single i 1 := by
    funext a
    simp [P, forceTwoRows, Matrix.updateRow_apply, hrs, Ne.symm hrs]
  have hPs : P s = Pi.single j 1 := by
    funext a
    simp [P, forceTwoRows, Matrix.updateRow_apply]
  have hP1s : (P.updateCol i (Pi.single r 1)) s = Pi.single j 1 := by
    funext a
    by_cases ha : a = i
    · subst a
      simp [Matrix.updateCol_apply, Pi.single_apply, hrs, Ne.symm hrs, hij, Ne.symm hij]
    · simp [Matrix.updateCol_apply, ha, hPs]
  have hPper : P.permanent = (forceTwoCols P i j r s).permanent := by
    calc
      P.permanent = (P.updateCol i (Pi.single r 1)).permanent :=
        permanent_cleanup_of_row P r i hPr
      _ = ((P.updateCol i (Pi.single r 1)).updateCol j (Pi.single s 1)).permanent :=
        permanent_cleanup_of_row _ s j hP1s
      _ = _ := rfl
  have hCi : C.col i = Pi.single r 1 := by
    funext a
    simp [C, forceTwoCols, Matrix.col_apply, Matrix.updateCol_apply, hij, Ne.symm hij]
  have hCj : C.col j = Pi.single s 1 := by
    funext a
    simp [C, forceTwoCols, Matrix.col_apply, Matrix.updateCol_apply]
  have hC1j : (C.updateRow r (Pi.single i 1)).col j = Pi.single s 1 := by
    funext a
    by_cases ha : a = r
    · subst a
      simp [Matrix.col_apply, Matrix.updateRow_apply, Pi.single_apply,
        hrs, Ne.symm hrs, hij, Ne.symm hij]
    · have he := congrFun hCj a
      simpa [Matrix.col_apply, Matrix.updateRow_apply, ha] using he
  calc
    C.permanent = (C.updateRow r (Pi.single i 1)).permanent :=
      permanent_cleanup_of_col C r i hCi
    _ = (forceTwoRows C r s i j).permanent :=
      permanent_cleanup_of_col _ s j hC1j
    _ = (forceTwoCols P i j r s).permanent := congrArg Matrix.permanent hm
    _ = P.permanent := hPper.symm

lemma forceTwoRows_transpose_eq_cols (A : Matrix I I R) (i j r s : I) :
    (forceTwoRows Aᵀ i j r s)ᵀ = forceTwoCols A i j r s := by
  simp only [forceTwoRows, forceTwoCols, Matrix.updateRow_transpose, Matrix.transpose_transpose]

lemma permanent_forceTwoRows_transpose (A : Matrix I I R) (i j r s : I)
    (hij : i ≠ j) (hrs : r ≠ s) :
    (forceTwoRows Aᵀ i j r s).permanent = (forceTwoRows A r s i j).permanent := by
  rw [← Matrix.permanent_transpose, forceTwoRows_transpose_eq_cols]
  exact permanent_forceTwoCols_eq_rows A i j r s hij hrs

end OMA.MO513259



/-!
Vertex decomposition of symmetric unordered-pair sums. This fragment follows
MO513259PairSums.lean and supports the remaining doubled-row/column orbit.
-/

namespace OMA.MO513259

open scoped BigOperators

variable {I R : Type*} [Fintype I] [LinearOrder I] [CommSemiring R]

def erasePairVertex (f : I → I → R) (i : I) (a b : I) : R :=
  if a = i ∨ b = i then 0 else f a b

lemma upperPairSum_mul_left (c : R) (f : I → I → R) :
    upperPairSum (fun a b => c * f a b) = c * upperPairSum f := by
  unfold upperPairSum
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro a _
  apply Finset.sum_congr rfl
  intro b _
  by_cases h : a < b <;> simp [h]

lemma upperPairSum_vertex (f : I → I → R) (hd : ∀ a, f a a = 0)
    (hs : ∀ a b, f a b = f b a) (i : I) :
    upperPairSum f = (∑ k, f i k) + upperPairSum (erasePairVertex f i) := by
  classical
  have hp (a b : I) : (if a < b then f a b else 0) =
      (if a = i then if i < b then f i b else 0 else 0) +
      (if b = i then if a < i then f a i else 0 else 0) +
      (if a < b then erasePairVertex f i a b else 0) := by
    by_cases ha : a = i
    · subst a
      by_cases hb : b = i
      · subst b
        simp [erasePairVertex]
      · simp [erasePairVertex, hb]
    · by_cases hb : b = i
      · subst b
        simp [erasePairVertex, ha]
      · simp [erasePairVertex, ha, hb]
  have hsplit : upperPairSum f =
      (∑ b, if i < b then f i b else 0) + (∑ a, if a < i then f a i else 0) +
        upperPairSum (erasePairVertex f i) := by
    unfold upperPairSum
    calc
      (∑ a, ∑ b, if a < b then f a b else 0) = ∑ a, ∑ b,
          ((if a = i then if i < b then f i b else 0 else 0) +
          (if b = i then if a < i then f a i else 0 else 0) +
          (if a < b then erasePairVertex f i a b else 0)) := by
        apply Finset.sum_congr rfl
        intro a _
        apply Finset.sum_congr rfl
        intro b _
        exact hp a b
      _ = _ := by simp only [Finset.sum_add_distrib]; simp
  have hinc : (∑ b, if i < b then f i b else 0) +
      (∑ a, if a < i then f a i else 0) = ∑ k, f i k := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro k _
    rcases lt_trichotomy i k with h | h | h
    · simp [h, not_lt_of_ge h.le]
    · subst k
      simp [hd]
    · simp [h, not_lt_of_ge h.le, hs k i]
  rw [hsplit, hinc]

lemma twice_upperPairSum_erase_two (f : I → I → ZMod 8) (hd : ∀ a, f a a = 0)
    (hs : ∀ a b, f a b = f b a) (i j : I) (hij : i ≠ j)
    (hijzero : 2 * f i j = 0)
    (hpair : ∀ k, k ≠ i → k ≠ j → 2 * (f i k + f j k) = 0) :
    2 * upperPairSum f =
      2 * upperPairSum (erasePairVertex (erasePairVertex f i) j) := by
  classical
  have hgd : ∀ a, erasePairVertex f i a a = 0 := by
    intro a
    simp [erasePairVertex, hd]
  have hgs : ∀ a b, erasePairVertex f i a b = erasePairVertex f i b a := by
    intro a b
    simp [erasePairVertex, or_comm, hs a b]
  have hz : 2 * ((∑ k, f i k) + (∑ k, erasePairVertex f i j k)) = 0 := by
    rw [← Finset.sum_add_distrib, Finset.mul_sum]
    apply Finset.sum_eq_zero
    intro k _
    by_cases hi : k = i
    · subst k
      simp [erasePairVertex, hd]
    · by_cases hj : k = j
      · subst k
        simpa [erasePairVertex, hd, hij, Ne.symm hij] using hijzero
      · simpa [erasePairVertex, hi, Ne.symm hi, hij, Ne.symm hij] using hpair k hi hj
  rw [upperPairSum_vertex f hd hs i,
    upperPairSum_vertex (erasePairVertex f i) hgd hgs j]
  calc
    2 * ((∑ k, f i k) + ((∑ k, erasePairVertex f i j k) +
        upperPairSum (erasePairVertex (erasePairVertex f i) j))) =
        2 * ((∑ k, f i k) + (∑ k, erasePairVertex f i j k)) +
          2 * upperPairSum (erasePairVertex (erasePairVertex f i) j) := by ring
    _ = _ := by rw [hz, zero_add]

end OMA.MO513259



/-!
Duplicated-column identities and removal of the two internal image columns
from the doubled-row/column permanent. This integration fragment follows the
generic permanent, copied-row orbit and vertex-pair helpers.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommSemiring R]

lemma forceTwoRows_copyCol_external (A : Matrix I I R) (i j : I) (hij : i ≠ j)
    (k l : I) (hki : k ≠ i) (hkj : k ≠ j) (hli : l ≠ i) (hlj : l ≠ j) :
    forceTwoRows (copyCol A i j) i j k l = copyCol (forceTwoRows A i j k l) i j := by
  classical
  ext a b
  by_cases ha : a = i <;> by_cases hb : a = j <;> by_cases hc : b = i <;>
    simp_all [forceTwoRows, copyCol, Matrix.updateRow_apply, Matrix.updateCol_apply,
      Matrix.col_apply, Pi.single_apply, eq_comm]

lemma forceTwoRows_copyCol_key_swap (A : Matrix I I R) (i j : I) (hij : i ≠ j)
    (k : I) (hki : k ≠ i) (hkj : k ≠ j) :
    (forceTwoRows (copyCol A i j) i j i k).permanent =
      (forceTwoRows (copyCol A i j) i j j k).permanent := by
  classical
  have hm : (forceTwoRows (copyCol A i j) i j i k).submatrix id (Equiv.swap i j) =
      forceTwoRows (copyCol A i j) i j j k := by
    ext a b
    by_cases ha : a = i <;> by_cases hb : a = j <;>
      by_cases hc : b = i <;> by_cases hd : b = j <;>
        simp_all [forceTwoRows, copyCol, Matrix.submatrix_apply,
          Matrix.updateRow_apply, Matrix.updateCol_apply, Matrix.col_apply,
          Equiv.swap_apply_def, Pi.single_apply, eq_comm]
  calc
    (forceTwoRows (copyCol A i j) i j i k).permanent =
        ((forceTwoRows (copyCol A i j) i j i k).submatrix id (Equiv.swap i j)).permanent :=
      (Matrix.permanent_permute_rows _ _).symm
    _ = (forceTwoRows (copyCol A i j) i j j k).permanent := by rw [hm]

section Ordered

variable [LinearOrder I]

lemma permanent_copyCol_eq_two_ordered_half (A : Matrix I I R)
    (i j : I) (hij : i ≠ j) :
    (copyCol A i j).permanent = 2 * copyRowHalf Aᵀ i j := by
  unfold copyCol
  rw [← Matrix.permanent_transpose, ← Matrix.updateRow_transpose]
  exact permanent_copyRow_eq_two_ordered_half Aᵀ i j hij

lemma permanent_doubleCopy_eq_two_ordered_half (A : Matrix I I R)
    (i j : I) (hij : i ≠ j) :
    (copyCol (copyRow A i j) i j).permanent = 2 * copyRowHalf (copyCol A i j) i j := by
  rw [copyCol_copyRow]
  unfold copyRow
  exact permanent_copyRow_eq_two_ordered_half _ i j hij

def doubleCopyWeight (A : Matrix I I R) (i j k l : I) : R :=
  (copyCol A i j) j k * (copyCol A i j) j l *
    (forceTwoRows (copyCol A i j) i j k l).permanent

lemma doubleCopy_inside_images_vanish (A : Matrix I I (ZMod 8))
    (i j : I) (hij : i ≠ j) (heven : ∃ u, A j j = 2 * u) :
    2 * upperPairSum (doubleCopyWeight A i j) =
      2 * upperPairSum (erasePairVertex (erasePairVertex (doubleCopyWeight A i j) i) j) := by
  classical
  have hdiag : ∀ k, doubleCopyWeight A i j k k = 0 := by
    intro k
    simp [doubleCopyWeight, forceTwoRows_permanent_same _ i j hij k]
  have hsym : ∀ k l, doubleCopyWeight A i j k l = doubleCopyWeight A i j l k := by
    intro k l
    unfold doubleCopyWeight
    rw [forceTwoRows_permanent_swap _ i j hij k l]
    ring
  have hci : (copyCol A i j) j i = A j j := by
    simp [copyCol, Matrix.updateCol_apply, Matrix.col_apply]
  have hcj : (copyCol A i j) j j = A j j := by
    simp [copyCol, Matrix.updateCol_apply, Matrix.col_apply, hij, Ne.symm hij]
  obtain ⟨u, hu⟩ := heven
  have h8 : (8 : ZMod 8) = 0 := by decide
  apply twice_upperPairSum_erase_two _ hdiag hsym i j hij
  · unfold doubleCopyWeight
    rw [hci, hcj, hu]
    calc
      2 * (2 * u * (2 * u) *
          (forceTwoRows (copyCol A i j) i j i j).permanent) =
          (8 : ZMod 8) * u ^ 2 *
            (forceTwoRows (copyCol A i j) i j i j).permanent := by ring
      _ = 0 := by rw [h8]; ring
  · intro k hki hkj
    have hp := forceTwoRows_copyCol_key_swap A i j hij k hki hkj
    unfold doubleCopyWeight
    rw [hci, hcj, hu, hp]
    calc
      2 * (2 * u * (copyCol A i j) j k *
          (forceTwoRows (copyCol A i j) i j j k).permanent +
          2 * u * (copyCol A i j) j k *
          (forceTwoRows (copyCol A i j) i j j k).permanent) =
          (8 : ZMod 8) * u * (copyCol A i j) j k *
            (forceTwoRows (copyCol A i j) i j j k).permanent := by ring
      _ = 0 := by rw [h8]; ring

def externalDoubleHalf (A : Matrix I I R) (i j k l : I) : R :=
  if k = i ∨ k = j ∨ l = i ∨ l = j then 0 else
    A j k * A j l * copyRowHalf ((forceTwoRows A i j k l)ᵀ) i j

lemma erased_doubleCopyWeight_eq_twice (A : Matrix I I R)
    (i j : I) (hij : i ≠ j) (k l : I) :
    erasePairVertex (erasePairVertex (doubleCopyWeight A i j) i) j k l =
      2 * externalDoubleHalf A i j k l := by
  classical
  by_cases h : k = i ∨ k = j ∨ l = i ∨ l = j
  · rcases h with h | h | h | h <;>
      simp [erasePairVertex, externalDoubleHalf, h]
  · have hki : k ≠ i := fun hk => h (Or.inl hk)
    have hkj : k ≠ j := fun hk => h (Or.inr (Or.inl hk))
    have hli : l ≠ i := fun hl => h (Or.inr (Or.inr (Or.inl hl)))
    have hlj : l ≠ j := fun hl => h (Or.inr (Or.inr (Or.inr hl)))
    have he : erasePairVertex (erasePairVertex (doubleCopyWeight A i j) i) j k l =
        doubleCopyWeight A i j k l := by
      simp [erasePairVertex, hki, hkj, hli, hlj]
    rw [he]
    unfold doubleCopyWeight externalDoubleHalf
    rw [if_neg h, forceTwoRows_copyCol_external A i j hij k l hki hkj hli hlj,
      permanent_copyCol_eq_two_ordered_half _ i j hij]
    have hck : (copyCol A i j) j k = A j k := by
      simp [copyCol, Matrix.updateCol_apply, Matrix.col_apply, hki, Ne.symm hki]
    have hcl : (copyCol A i j) j l = A j l := by
      simp [copyCol, Matrix.updateCol_apply, Matrix.col_apply, hli, Ne.symm hli]
    rw [hck, hcl]
    ring

lemma permanent_doubleCopy_eq_four_outer (A : Matrix I I (ZMod 8))
    (i j : I) (hij : i ≠ j) (heven : ∃ u, A j j = 2 * u) :
    (copyCol (copyRow A i j) i j).permanent =
      4 * upperPairSum (externalDoubleHalf A i j) := by
  have he : erasePairVertex (erasePairVertex (doubleCopyWeight A i j) i) j =
      fun k l => 2 * externalDoubleHalf A i j k l := by
    funext k l
    exact erased_doubleCopyWeight_eq_twice A i j hij k l
  calc
    (copyCol (copyRow A i j) i j).permanent =
        2 * upperPairSum (doubleCopyWeight A i j) := by
      rw [permanent_doubleCopy_eq_two_ordered_half _ i j hij]
      rfl
    _ = 2 * upperPairSum (erasePairVertex (erasePairVertex (doubleCopyWeight A i j) i) j) :=
      doubleCopy_inside_images_vanish A i j hij heven
    _ = 4 * upperPairSum (externalDoubleHalf A i j) := by
      rw [he, upperPairSum_mul_left]
      ring

end Ordered
end OMA.MO513259



/-!
The four-by-four alternating determinant over F2. The scalar identity is
kernel-decided over all64 possible six-entry matrices, so it is a complete
finite algebra lemma. It does not replace the missing arbitrary-order graph
argument. Cornelius Lytollis (@con123-gif), assisted by ChatGPT (GPT-6 Codex;
the exact serving variant is not exposed).
-/

namespace OMA.MO513259

open scoped Matrix

def alternatingFour (a b c d e f : ZMod 2) : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![0, a, b, c; a, 0, d, e; b, d, 0, f; c, e, f, 0]

set_option maxRecDepth 10000 in
lemma det_alternatingFour (a b c d e f : ZMod 2) :
    (alternatingFour a b c d e f).det = a * f + b * e + c * d := by
  have h : ∀ a b c d e f : ZMod 2,
      (alternatingFour a b c d e f).det = a * f + b * e + c * d := by decide
  exact h a b c d e f

lemma det_four_submatrix_mod_two {I : Type*} (A : Matrix I I (ZMod 2))
    (hA : A.IsSymm) (hd : ∀ i, A i i = 0) (i j k l : I) :
    (A.submatrix ![i, j, k, l] ![i, j, k, l]).det =
      A i j * A k l + A i k * A j l + A i l * A j k := by
  have hm : A.submatrix ![i, j, k, l] ![i, j, k, l] =
      alternatingFour (A i j) (A i k) (A i l) (A j k) (A j l) (A k l) := by
    ext a b
    fin_cases a <;> fin_cases b <;>
      simp [alternatingFour, Matrix.submatrix_apply, hd,
        hA.apply i j, hA.apply i k, hA.apply i l,
        hA.apply j k, hA.apply j l, hA.apply k l]
  rw [hm, det_alternatingFour]

end OMA.MO513259



/-! Four-index transpose symmetry and diagonal collapse for MO513259.
This fragment follows parity, alternating and four-minor helpers. -/

namespace OMA.MO513259
open scoped BigOperators Matrix

def blockSwapFour : Equiv.Perm (Fin 4) where
  toFun := ![2, 3, 0, 1]
  invFun := ![2, 3, 0, 1]
  left_inv := by intro a; fin_cases a <;> rfl
  right_inv := by intro a; fin_cases a <;> rfl

lemma four_inverse_kernel_symm {I R : Type*} [CommRing R]
    (A : Matrix I I R) (hA : A.IsSymm) (i j k l r s : I) :
    (A.submatrix ![k, l, i, j] ![i, j, r, s]).det =
      (A.submatrix ![r, s, i, j] ![i, j, k, l]).det := by
  let M := A.submatrix ![k, l, i, j] ![i, j, r, s]
  have hm : Mᵀ.submatrix blockSwapFour blockSwapFour =
      A.submatrix ![r, s, i, j] ![i, j, k, l] := by
    dsimp [M]
    rw [Matrix.transpose_submatrix, hA.eq, Matrix.submatrix_submatrix]
    ext a b
    fin_cases a <;> fin_cases b <;> rfl
  calc
    M.det = Mᵀ.det := (Matrix.det_transpose M).symm
    _ = (Mᵀ.submatrix blockSwapFour blockSwapFour).det :=
      (Matrix.det_submatrix_equiv_self blockSwapFour Mᵀ).symm
    _ = _ := congrArg Matrix.det hm

lemma four_inverse_kernel_diagonal {I : Type*} (A : Matrix I I (ZMod 2))
    (hA : A.IsSymm) (hd : ∀ i, A i i = 0) (i j k l : I) :
    (A.submatrix ![k, l, i, j] ![i, j, k, l]).det =
      A i j * A k l + A i k * A j l + A i l * A j k := by
  let M := A.submatrix ![k, l, i, j] ![i, j, k, l]
  let P := A.submatrix ![i, j, k, l] ![i, j, k, l]
  have hm : M = P.submatrix blockSwapFour id := by
    ext a b
    fin_cases a <;> fin_cases b <;> rfl
  calc
    M.det = M.permanent := (permanent_eq_det_mod_two M).symm
    _ = P.permanent := by rw [hm, Matrix.permanent_permute_cols]
    _ = P.det := permanent_eq_det_mod_two P
    _ = _ := det_four_submatrix_mod_two A hA hd i j k l

lemma sum_symmetric_mod_two_diagonal {J : Type*} [Fintype J] [DecidableEq J]
    (W : J → J → ZMod 2) (hs : ∀ a b, W a b = W b a) :
    (∑ a, ∑ b, W a b) = ∑ a, W a a := by
  let C : Matrix J J (ZMod 2) := fun a b => W a b - (if a = b then W a a else 0)
  have hC : C.IsSymm := by
    apply Matrix.IsSymm.ext
    intro a b
    by_cases h : a = b
    · subst b
      rfl
    · simp only [C, if_neg h, if_neg (Ne.symm h), sub_zero]
      exact hs b a
  have hd : ∀ a, C a a = 0 := by intro a; simp [C]
  have hz := quadratic_zero_mod_two C hC hd (fun _ => 1)
  apply sub_eq_zero.mp
  simpa [C, dotProduct, Matrix.mulVec, Finset.sum_sub_distrib] using hz

end OMA.MO513259



/-!
Four forced rows as one coordinate-row determinant replacement for MO513259.
Prerequisites: the parent Permanent, RowReplacement and RowExpansion fragments.
Only the four replaced rows must be distinct; their first two keys are arbitrary.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidate awaits pinned checking.
-/

namespace OMA.MO513259

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [DecidableEq I] [CommRing R]

def forceFourRows (A : Matrix I I R) (i j r s k l : I) : Matrix I I R :=
  forceTwoRows (forceTwoRows A i j k l) r s i j

lemma det_forceFourRows (A : Matrix I I R) (hA : IsUnit A.det)
    (i j r s k l : I) (hij : i ≠ j) (hir : i ≠ r) (his : i ≠ s)
    (hjr : j ≠ r) (hjs : j ≠ s) (hrs : r ≠ s) :
    (forceFourRows A i j r s k l).det =
      A.det * ((A⁻¹).submatrix (![k, l, i, j] : Fin 4 → I)
        (![i, j, r, s] : Fin 4 → I)).det := by
  classical
  let selected : Fin 4 → I := ![i, j, r, s]
  let keys : Fin 4 → I := ![k, l, i, j]
  have hsel : Function.Injective selected := by
    intro a b he
    fin_cases a <;> fin_cases b <;> simp_all [selected, eq_comm]
  have hrows (q : Fin 4) (b : I) :
      forceFourRows A i j r s k l (selected q) b = (1 : Matrix I I R) (keys q) b := by
    fin_cases q <;>
      simp [selected, keys, forceFourRows, forceTwoRows, Matrix.updateRow_apply,
        Matrix.one_apply, Pi.single_apply, hij, hir, his, hjr, hjs, hrs, eq_comm] <;>
      split_ifs with h <;> simp only [h, if_true, if_false]
  have hm : coordinateRowReplacement A selected keys = forceFourRows A i j r s k l := by
    ext a b
    by_cases hi : a = i
    · subst a
      change coordinateRowReplacement A selected keys (selected (0 : Fin 4)) b = _
      rw [coordinateRowReplacement_selected A selected keys hsel (0 : Fin 4) b]
      exact (hrows 0 b).symm
    · by_cases hj : a = j
      · subst a
        change coordinateRowReplacement A selected keys (selected (1 : Fin 4)) b = _
        rw [coordinateRowReplacement_selected A selected keys hsel (1 : Fin 4) b]
        exact (hrows 1 b).symm
      · by_cases hr : a = r
        · subst a
          change coordinateRowReplacement A selected keys (selected (2 : Fin 4)) b = _
          rw [coordinateRowReplacement_selected A selected keys hsel (2 : Fin 4) b]
          exact (hrows 2 b).symm
        · by_cases hs : a = s
          · subst a
            change coordinateRowReplacement A selected keys (selected (3 : Fin 4)) b = _
            rw [coordinateRowReplacement_selected A selected keys hsel (3 : Fin 4) b]
            exact (hrows 3 b).symm
          · have hn : ∀ q : Fin 4, a ≠ selected q := by
              intro q
              fin_cases q
              · simpa [selected] using hi
              · simpa [selected] using hj
              · simpa [selected] using hr
              · simpa [selected] using hs
            have he := coordinateRowReplacement_unselected A selected keys a b hn
            simpa [forceFourRows, forceTwoRows, Matrix.updateRow_apply,
              hi, hj, hr, hs, eq_comm] using he
  calc
    (forceFourRows A i j r s k l).det =
        (coordinateRowReplacement A selected keys).det := congrArg Matrix.det hm.symm
    _ = A.det * ((A⁻¹).submatrix (![k, l, i, j] : Fin 4 → I)
        (![i, j, r, s] : Fin 4 → I)).det :=
      det_coordinateRowReplacement A hA selected keys hsel

end OMA.MO513259



/-!
Symmetric cancellation on the finite set of upper ordered pairs over F2.
Assemble after PairSums and FourKernel. This finite-sum identity alone is
not a solution of the source graph problem.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
-/

namespace OMA.MO513259

open scoped BigOperators

lemma nested_upperPairSum_symm_diagonal {I : Type*} [Fintype I] [LinearOrder I]
    (W : I → I → I → I → ZMod 2)
    (hs : ∀ k l r s, W k l r s = W r s k l) :
    upperPairSum (fun k l ↦ upperPairSum (fun r s ↦ W k l r s)) =
      upperPairSum (fun k l ↦ W k l k l) := by
  classical
  let V : (I × I) → (I × I) → ZMod 2 := fun a b ↦
    if a.1 < a.2 then (if b.1 < b.2 then W a.1 a.2 b.1 b.2 else 0) else 0
  have hV : ∀ a b, V a b = V b a := by
    rintro ⟨k, l⟩ ⟨r, s⟩
    by_cases hkl : k < l
    · by_cases hrs : r < s
      · simp only [V, if_pos hkl, if_pos hrs]
        exact hs k l r s
      · simp [V, hkl, hrs]
    · by_cases hrs : r < s <;> simp [V, hkl, hrs]
  have he := sum_symmetric_mod_two_diagonal V hV
  simp only [Fintype.sum_prod_type] at he
  have hleft : (∑ k, ∑ l, ∑ r, ∑ s, V (k, l) (r, s)) =
      upperPairSum (fun k l ↦ upperPairSum (fun r s ↦ W k l r s)) := by
    unfold upperPairSum
    apply Finset.sum_congr rfl
    intro k _
    apply Finset.sum_congr rfl
    intro l _
    by_cases hkl : k < l
    · simp only [V, if_pos hkl]
    · simp [V, hkl]
  have hright : (∑ k, ∑ l, V (k, l) (k, l)) =
      upperPairSum (fun k l ↦ W k l k l) := by
    unfold upperPairSum
    apply Finset.sum_congr rfl
    intro k _
    apply Finset.sum_congr rfl
    intro l _
    by_cases hkl : k < l <;> simp [V, hkl]
  calc
    upperPairSum (fun k l ↦ upperPairSum (fun r s ↦ W k l r s)) =
        ∑ k, ∑ l, ∑ r, ∑ s, V (k, l) (r, s) := hleft.symm
    _ = ∑ k, ∑ l, V (k, l) (k, l) := he
    _ = upperPairSum (fun k l ↦ W k l k l) := hright

end OMA.MO513259



/-!
Four-index expansion of the external doubled-row/column permanent orbit.
This fragment uses the checked copied-row, matching-edge and four-row helpers.
It does not by itself prove either source graph conjecture.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.MO513259
open scoped Matrix BigOperators

variable {I : Type*} [Fintype I] [LinearOrder I]

def externalFourWeight (B : Matrix I I (ZMod 2)) (i j k l r s : I) : ZMod 2 :=
  if k = i ∨ k = j ∨ l = i ∨ l = j then 0 else
  if r = i ∨ r = j ∨ s = i ∨ s = j then 0 else
    B j k * B j l * B j r * B j s * (forceFourRows B i j r s k l).det

lemma externalDoubleHalf_mod_two_expansion (B : Matrix I I (ZMod 2))
    (hB : B.IsSymm) (i j : I) (hij : i ≠ j) (k l : I) :
    externalDoubleHalf B i j k l =
      upperPairSum (externalFourWeight B i j k l) := by
  classical
  by_cases hout : k = i ∨ k = j ∨ l = i ∨ l = j
  · simp [externalDoubleHalf, externalFourWeight, hout, upperPairSum]
  · have hki : k ≠ i := fun h => hout (Or.inl h)
    have hkj : k ≠ j := fun h => hout (Or.inr (Or.inl h))
    have hli : l ≠ i := fun h => hout (Or.inr (Or.inr (Or.inl h)))
    have hlj : l ≠ j := fun h => hout (Or.inr (Or.inr (Or.inr h)))
    let P := forceTwoRows B i j k l
    have hPi : P i j = 0 := by
      simp [P, forceTwoRows, Matrix.updateRow_apply, Pi.single_apply,
        hij, Ne.symm hij, hkj, Ne.symm hkj]
    have hPj : P j j = 0 := by
      simp [P, forceTwoRows, Matrix.updateRow_apply, Pi.single_apply, hlj, Ne.symm hlj]
    unfold externalDoubleHalf
    rw [if_neg hout]
    unfold copyRowHalf
    rw [← upperPairSum_mul_left]
    change upperPairSum (fun r s => B j k * B j l *
      (Pᵀ j r * Pᵀ j s * (forceTwoRows Pᵀ i j r s).permanent)) = _
    unfold upperPairSum
    apply Finset.sum_congr rfl
    intro r _
    apply Finset.sum_congr rfl
    intro s _
    by_cases hrs : r < s
    · simp only [if_pos hrs]
      by_cases hin : r = i ∨ r = j ∨ s = i ∨ s = j
      · rcases hin with h | h | h | h <;> subst_vars <;>
          simp [externalFourWeight, hout, Matrix.transpose_apply, hPi, hPj]
      · have hri : r ≠ i := fun h => hin (Or.inl h)
        have hrj : r ≠ j := fun h => hin (Or.inr (Or.inl h))
        have hsi : s ≠ i := fun h => hin (Or.inr (Or.inr (Or.inl h)))
        have hsj : s ≠ j := fun h => hin (Or.inr (Or.inr (Or.inr h)))
        have hpr : P r j = B j r := by
          simp [P, forceTwoRows, Matrix.updateRow_apply, hri, hrj, hB.apply j r]
        have hps : P s j = B j s := by
          simp [P, forceTwoRows, Matrix.updateRow_apply, hsi, hsj, hB.apply j s]
        change B j k * B j l *
          (Pᵀ j r * Pᵀ j s * (forceTwoRows Pᵀ i j r s).permanent) = _
        rw [permanent_forceTwoRows_transpose P i j r s hij hrs.ne,
          permanent_eq_det_mod_two]
        simp only [Matrix.transpose_apply, hpr, hps, externalFourWeight,
          if_neg hout, if_neg hin]
        dsimp only [forceFourRows, P]
        ring
    · simp only [if_neg hrs]

noncomputable def externalInverseKernel (B A : Matrix I I (ZMod 2))
    (i j k l r s : I) : ZMod 2 :=
  if k = i ∨ k = j ∨ l = i ∨ l = j then 0 else
  if r = i ∨ r = j ∨ s = i ∨ s = j then 0 else
    B j k * B j l * B j r * B j s *
      (A.submatrix (![k, l, i, j] : Fin 4 → I) (![i, j, r, s] : Fin 4 → I)).det

lemma externalDoubleHalf_mod_two_kernel (B : Matrix I I (ZMod 2))
    (hB : B.IsSymm) (hu : IsUnit B.det) (i j : I) (hij : i ≠ j) (k l : I) :
    externalDoubleHalf B i j k l =
      upperPairSum (externalInverseKernel B B⁻¹ i j k l) := by
  classical
  rw [externalDoubleHalf_mod_two_expansion B hB i j hij k l]
  unfold upperPairSum
  apply Finset.sum_congr rfl
  intro r _
  apply Finset.sum_congr rfl
  intro s _
  by_cases hrs : r < s
  · simp only [if_pos hrs]
    by_cases hout : k = i ∨ k = j ∨ l = i ∨ l = j
    · simp [externalFourWeight, externalInverseKernel, hout]
    · by_cases hin : r = i ∨ r = j ∨ s = i ∨ s = j
      · simp [externalFourWeight, externalInverseKernel, hin]
      · have hri : r ≠ i := fun h => hin (Or.inl h)
        have hrj : r ≠ j := fun h => hin (Or.inr (Or.inl h))
        have hsi : s ≠ i := fun h => hin (Or.inr (Or.inr (Or.inl h)))
        have hsj : s ≠ j := fun h => hin (Or.inr (Or.inr (Or.inr h)))
        have hdet : B.det = 1 := by
          have ht : ∀ z : ZMod 2, z ≠ 0 → z = 1 := by decide
          exact ht _ hu.ne_zero
        simp only [externalFourWeight, externalInverseKernel, if_neg hout, if_neg hin]
        rw [det_forceFourRows B hu i j r s k l hij (Ne.symm hri) (Ne.symm hsi)
          (Ne.symm hrj) (Ne.symm hsj) hrs.ne, hdet, one_mul]
  · simp only [if_neg hrs]

lemma externalInverseKernel_symm (B A : Matrix I I (ZMod 2)) (hA : A.IsSymm)
    (i j k l r s : I) :
    externalInverseKernel B A i j k l r s = externalInverseKernel B A i j r s k l := by
  classical
  by_cases hout : k = i ∨ k = j ∨ l = i ∨ l = j <;>
    by_cases hin : r = i ∨ r = j ∨ s = i ∨ s = j
  all_goals simp only [externalInverseKernel, hout, hin, if_true, if_false]
  rw [four_inverse_kernel_symm A hA i j k l r s]
  ring

lemma four_pfaffian_repeat_zero (A : Matrix I I (ZMod 2)) (hA : A.IsSymm)
    (hd : ∀ a, A a a = 0) (i j k l : I)
    (h : k = i ∨ k = j ∨ l = i ∨ l = j) :
    A i j * A k l + A i k * A j l + A i l * A j k = 0 := by
  rcases h with h | h | h | h
  · subst k
    rw [hd, hA.apply i j]
    ring_nf
    simp only [show (2 : ZMod 2) = 0 by decide, mul_zero]
  · subst k
    rw [hd]
    ring_nf
    simp only [show (2 : ZMod 2) = 0 by decide, mul_zero]
  · subst l
    rw [hd, hA.apply i k, hA.apply i j]
    ring_nf
    simp only [show (2 : ZMod 2) = 0 by decide, mul_zero]
  · subst l
    rw [hd, hA.apply j k]
    ring_nf
    simp only [show (2 : ZMod 2) = 0 by decide, mul_zero]

lemma externalInverseKernel_diagonal (B A : Matrix I I (ZMod 2))
    (hA : A.IsSymm) (hd : ∀ a, A a a = 0) (i j k l : I) :
    externalInverseKernel B A i j k l k l =
      B j k * B j l * (A i j * A k l + A i k * A j l + A i l * A j k) := by
  classical
  by_cases h : k = i ∨ k = j ∨ l = i ∨ l = j
  · simp only [externalInverseKernel, if_pos h]
    rw [four_pfaffian_repeat_zero A hA hd i j k l h, mul_zero]
  · simp only [externalInverseKernel, if_neg h]
    rw [four_inverse_kernel_diagonal A hA hd i j k l]
    have hidem : ∀ a b : ZMod 2, a * b * a * b = a * b := by decide
    rw [hidem]

lemma upperPairSum_add (f g : I → I → ZMod 2) :
    upperPairSum (fun k l => f k l + g k l) = upperPairSum f + upperPairSum g := by
  unfold upperPairSum
  simp only [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro k _
  apply Finset.sum_congr rfl
  intro l _
  by_cases h : k < l <;> simp [h]

lemma pfaffian_pairSum (B A : Matrix I I (ZMod 2)) (hA : A.IsSymm)
    (hBA : B * A = 1) (i j : I) (hij : i ≠ j) :
    upperPairSum (fun k l => B j k * B j l *
      (A i j * A k l + A i k * A j l + A i l * A j k)) =
      A i j * upperPairSum (fun k l => A k l * B j k * B j l) +
        ∑ k, B j k * A k i * A k j := by
  have he : (fun k l => B j k * B j l *
      (A i j * A k l + A i k * A j l + A i l * A j k)) =
      (fun k l => A i j * (A k l * B j k * B j l) +
        B j k * B j l * (A i k * A j l + A j k * A i l)) := by
    funext k l
    ring
  rw [he, upperPairSum_add, upperPairSum_mul_left, upperPairSum_polar]
  have hz : (∑ k, B j k * A i k) = 0 := by
    have he := congrFun (congrFun hBA j) i
    simpa only [Matrix.mul_apply, Matrix.one_apply, if_neg (Ne.symm hij),
      hA.apply i] using he
  rw [hz, zero_mul, zero_add]
  congr 1
  apply Finset.sum_congr rfl
  intro k _
  rw [hA.apply i k, hA.apply j k]

lemma externalDoubleHalf_mod_two_closed (B : Matrix I I (ZMod 2))
    (hB : B.IsSymm) (hd : ∀ a, B a a = 0) (hu : IsUnit B.det)
    (i j : I) (hij : i ≠ j) :
    upperPairSum (externalDoubleHalf B i j) =
      (B⁻¹) i j * upperPairSum (fun k l => (B⁻¹) k l * B j k * B j l) +
        copyRowHalf B i j := by
  let A := B⁻¹
  have hA : A.IsSymm := hB.inv
  have hBA : B * A = 1 := Matrix.mul_nonsing_inv B hu
  have hAd : ∀ a, A a a = 0 :=
    right_inverse_diagonal_zero_mod_two B A hB hd hBA
  have he : externalDoubleHalf B i j = fun k l =>
      upperPairSum (externalInverseKernel B A i j k l) := by
    funext k l
    exact externalDoubleHalf_mod_two_kernel B hB hu i j hij k l
  rw [he, nested_upperPairSum_symm_diagonal
    (externalInverseKernel B A i j) (externalInverseKernel_symm B A hA i j)]
  have hdia : (fun k l => externalInverseKernel B A i j k l k l) =
      (fun k l => B j k * B j l *
        (A i j * A k l + A i k * A j l + A i l * A j k)) := by
    funext k l
    exact externalInverseKernel_diagonal B A hA hAd i j k l
  rw [hdia, pfaffian_pairSum B A hA hBA i j hij, copyRowHalf_mod_two_closed B hu i j hij]


end OMA.MO513259




/-!
The additive order-two embedding used for congruence increments modulo eight.
This fragment follows MO513259Parity.lean. Its finite scalar checks are full
proofs of the finite-ring identities, not evidence for arbitrary matrix size.
-/

namespace OMA.MO513259

open scoped BigOperators

def liftFour : ZMod 2 →+ ZMod 8 where
  toFun x := 4 * (x.val : ZMod 8)
  map_zero' := rfl
  map_add' := by
    intro x y
    fin_cases x <;> fin_cases y <;> decide

lemma four_mul_eq_liftFour (x : ZMod 8) : 4 * x = liftFour (modTwoEight x) := by
  change (4 : ZMod 8) * x = 4 * (((x.val : ZMod 2).val : ℕ) : ZMod 8)
  fin_cases x <;> decide

lemma four_mul_eq_of_mod_two_eq (x y : ZMod 8) (h : modTwoEight x = modTwoEight y) :
    4 * x = 4 * y := by
  rw [four_mul_eq_liftFour x, four_mul_eq_liftFour y, h]

lemma four_mul_sum {I : Type*} [Fintype I] (v : I → ZMod 8) :
    4 * (∑ i, v i) = liftFour (∑ i, modTwoEight (v i)) := by
  classical
  calc
    4 * (∑ i, v i) = ∑ i, 4 * v i := Finset.mul_sum _ _ _
    _ = ∑ i, liftFour (modTwoEight (v i)) := by
      apply Finset.sum_congr rfl
      intro i _
      exact four_mul_eq_liftFour _
    _ = liftFour (∑ i, modTwoEight (v i)) := (map_sum liftFour _ _).symm

end OMA.MO513259



/-!
From the characteristic-two four-orbit calculation to the exact modulo-eight
permanent congruence increment. This is one component of MO513259, not the
full source theorem. Credit: Cornelius Lytollis (@con123-gif), assisted by Codex.
-/
namespace OMA.MO513259
open scoped Matrix BigOperators

lemma liftFour_mul (c : ZMod 8) (z : ZMod 2) :
    liftFour (modTwoEight c * z) = c * liftFour z := by
  fin_cases c <;> fin_cases z <;> decide

lemma scalar_permanent_increment (t u r : ZMod 8) (q : ZMod 2) :
    2 * t * (2 * r) + t ^ 2 * liftFour (modTwoEight u * q + modTwoEight r) =
      t * u * liftFour q := by
  have hz : ∀ x : ZMod 2, x ^ 2 = x := by decide
  calc
    _ = liftFour (modTwoEight t * modTwoEight r) +
        liftFour (modTwoEight (t ^ 2) * (modTwoEight u * q + modTwoEight r)) := by
      rw [liftFour_mul t, liftFour_mul (t ^ 2), ← four_mul_eq_liftFour r]
      ring
    _ = liftFour ((modTwoEight t * modTwoEight r) +
        modTwoEight (t ^ 2) * (modTwoEight u * q + modTwoEight r)) :=
      (map_add liftFour _ _).symm
    _ = liftFour (modTwoEight (t * u) * q) := by
      congr 1
      rw [map_pow, hz, map_mul]
      ring_nf
      simp only [show (2 : ZMod 2) = 0 by decide, mul_zero, zero_add]
    _ = _ := liftFour_mul (t * u) q

variable {I R : Type*} [Fintype I] [LinearOrder I] [CommRing R]

lemma map_upperPairSum {S : Type*} [CommRing S] (f : R →+* S) (g : I → I → R) :
    f (upperPairSum g) = upperPairSum (fun k l => f (g k l)) := by
  simp only [upperPairSum, map_sum, apply_ite, map_zero]

lemma map_externalDoubleHalf {S : Type*} [CommRing S] (f : R →+* S)
    (B : Matrix I I R) (i j k l : I) :
    f (externalDoubleHalf B i j k l) = externalDoubleHalf (B.map f) i j k l := by
  classical
  have ht (M : Matrix I I R) : Mᵀ.map f = (M.map f)ᵀ := rfl
  by_cases h : k = i ∨ k = j ∨ l = i ∨ l = j
  · simp only [externalDoubleHalf, if_pos h, map_zero]
  · simp only [externalDoubleHalf, if_neg h, map_mul, map_copyRowHalf,
      ht, map_forceTwoRows, Matrix.map_apply]

lemma externalDoubleHalf_eight_closed (B : Matrix I I (ZMod 8))
    (hB : B.IsSymm) (hd : ∀ a, modTwoEight (B a a) = 0) (hu : IsUnit B.det)
    (i j : I) (hij : i ≠ j) :
    modTwoEight (upperPairSum (externalDoubleHalf B i j)) =
      modTwoEight ((B⁻¹) i j) * upperPairSum (fun k l =>
        modTwoEight ((B⁻¹) k l) * modTwoEight (B j k) * modTwoEight (B j l)) +
      modTwoEight (copyRowHalf B i j) := by
  let C := B.map modTwoEight
  have hC : C.IsSymm := by
    apply Matrix.IsSymm.ext
    intro a b
    exact congrArg modTwoEight (hB.apply a b)
  have hCd : ∀ a, C a a = 0 := hd
  have hCu : IsUnit C.det := by
    have he := modTwoEight.map_det B
    change modTwoEight B.det = C.det at he
    rw [← he]
    exact hu.map modTwoEight
  have he := externalDoubleHalf_mod_two_closed C hC hCd hCu i j hij
  have hinv : C⁻¹ = (B⁻¹).map modTwoEight :=
    (map_matrix_inverse modTwoEight B hu).symm
  rw [map_upperPairSum]
  simp only [map_externalDoubleHalf]
  simpa only [C, hinv, Matrix.map_apply, ← map_copyRowHalf] using he

lemma permanent_doubleCopy_eq_liftFour (B : Matrix I I (ZMod 8))
    (hB : B.IsSymm) (hd : ∀ a, modTwoEight (B a a) = 0) (hu : IsUnit B.det)
    (i j : I) (hij : i ≠ j) :
    (copyCol (copyRow B i j) i j).permanent = liftFour
      (modTwoEight ((B⁻¹) i j) * upperPairSum (fun k l =>
        modTwoEight ((B⁻¹) k l) * modTwoEight (B j k) * modTwoEight (B j l)) +
      modTwoEight (copyRowHalf B i j)) := by
  rw [permanent_doubleCopy_eq_four_outer B i j hij
    ((modTwoEight_zero_iff_two_mul (B j j)).mp (hd j)), four_mul_eq_liftFour,
    externalDoubleHalf_eight_closed B hB hd hu i j hij]

lemma permanent_shear_increment_quadratic (B : Matrix I I (ZMod 8))
    (hB : B.IsSymm) (hd : ∀ a, modTwoEight (B a a) = 0) (hu : IsUnit B.det)
    (i j : I) (hij : i ≠ j) (t : ZMod 8) :
    (colShear (rowShear B i j t) i j t).permanent - B.permanent =
      t * (B⁻¹) i j * liftFour (upperPairSum (fun k l =>
        modTwoEight ((B⁻¹) k l) * modTwoEight (B j k) * modTwoEight (B j l))) := by
  rw [permanent_double_shear B hB i j t,
    show (copyRow B i j).permanent = 2 * copyRowHalf B i j from
      permanent_copyRow_eq_two_ordered_half B i j hij,
    permanent_doubleCopy_eq_liftFour B hB hd hu i j hij]
  calc
    _ = 2 * t * (2 * copyRowHalf B i j) + t ^ 2 * liftFour
        (modTwoEight ((B⁻¹) i j) * upperPairSum (fun k l =>
          modTwoEight ((B⁻¹) k l) * modTwoEight (B j k) * modTwoEight (B j l)) +
          modTwoEight (copyRowHalf B i j)) := by ring
    _ = _ := scalar_permanent_increment t ((B⁻¹) i j) (copyRowHalf B i j) _

end OMA.MO513259



/-!
The complementary two-index cofactor of a deleted principal matrix over F2.
This fragment follows the alternating and forced-minor helpers. It identifies
the cofactor in the separate odd-hollow identity without dividing by two.
-/

namespace OMA.MO513259

open scoped Matrix

lemma deleted_cofactor_mod_two {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod 2))
    (hA : A.IsSymm) (hd : ∀ i, A i i = 0) (hdet : IsUnit A.det)
    (j : Fin (n + 1)) (r s : Fin n) :
    (A.submatrix j.succAbove j.succAbove).adjugate s r =
      (A⁻¹) (j.succAbove r) j * (A⁻¹) (j.succAbove s) j := by
  let H := A.submatrix j.succAbove j.succAbove
  let C := A.updateRow (j.succAbove r) (Pi.single (j.succAbove s) 1)
  have hjr : j ≠ j.succAbove r := (Fin.succAbove_ne j r).symm
  have hsub : C.submatrix j.succAbove j.succAbove = H.updateRow r (Pi.single s 1) := by
    ext a b
    simp [C, H, Matrix.submatrix_apply, Matrix.updateRow_apply,
      Pi.single_apply, Fin.succAbove_right_inj]
  have hcof : (forceTwoRows A j (j.succAbove r) j (j.succAbove s)).det =
      H.adjugate s r := by
    calc
      (forceTwoRows A j (j.succAbove r) j (j.succAbove s)).det =
          (C.updateRow j (Pi.single j 1)).det := by
        rw [forceTwoRows, Matrix.updateRow_comm A hjr]
      _ = C.adjugate j j := by rw [Matrix.adjugate_apply]
      _ = (H.updateRow r (Pi.single s 1)).det := by
        rw [Matrix.adjugate_fin_succ_eq_det_submatrix,
          show (-1 : ZMod 2) = 1 by decide, one_pow, one_mul, hsub]
      _ = H.adjugate s r := by rw [Matrix.adjugate_apply]
  have hinvdiag : (A⁻¹) j j = 0 :=
    right_inverse_diagonal_zero_mod_two A A⁻¹ hA hd (Matrix.mul_nonsing_inv A hdet) j
  have hdetone : A.det = 1 := by
    have ht : ∀ x : ZMod 2, x ≠ 0 → x = 1 := by decide
    exact ht _ hdet.ne_zero
  have hneg : ∀ x : ZMod 2, -x = x := by decide
  calc
    H.adjugate s r = (forceTwoRows A j (j.succAbove r) j (j.succAbove s)).det := hcof.symm
    _ = A.det * ((A⁻¹) j j * (A⁻¹) (j.succAbove s) (j.succAbove r) -
        (A⁻¹) j (j.succAbove r) * (A⁻¹) (j.succAbove s) j) :=
      det_forceTwoRows A hdet j (j.succAbove r) hjr j (j.succAbove s)
    _ = (A⁻¹) (j.succAbove r) j * (A⁻¹) (j.succAbove s) j := by
      rw [hdetone, one_mul, hinvdiag, zero_mul, zero_sub, hneg,
        hA.inv.apply (j.succAbove r) j]

end OMA.MO513259



/-!
Transport ordered quadratic sums across deletion of a zero coordinate.
This fragment follows MO513259PairSums.lean.
-/

namespace OMA.MO513259

open scoped BigOperators

lemma upperPairSum_delete_zero {R : Type*} [CommSemiring R] {n : ℕ}
    (f : Fin (n + 1) → Fin (n + 1) → R) (j : Fin (n + 1))
    (hr : ∀ b, f j b = 0) (hc : ∀ a, f a j = 0) :
    upperPairSum (fun a b : Fin n => f (j.succAbove a) (j.succAbove b)) =
      upperPairSum f := by
  symm
  calc
    upperPairSum f = ∑ a : Fin n, ∑ b : Fin (n + 1),
        if j.succAbove a < b then f (j.succAbove a) b else 0 := by
      unfold upperPairSum
      rw [Fin.sum_univ_succAbove _ j]
      simp [hr]
    _ = ∑ a : Fin n, ∑ b : Fin n,
        if j.succAbove a < j.succAbove b then
          f (j.succAbove a) (j.succAbove b) else 0 := by
      apply Finset.sum_congr rfl
      intro a _
      rw [Fin.sum_univ_succAbove _ j]
      simp [hc]
    _ = upperPairSum (fun a b : Fin n => f (j.succAbove a) (j.succAbove b)) := by
      simp only [upperPairSum, Fin.succAbove_lt_succAbove_iff]

lemma lowerPairSum_eq_upper {I R : Type*} [Fintype I] [LinearOrder I]
    [CommSemiring R] (f : I → I → R) (hs : ∀ a b, f a b = f b a) :
    (∑ a, ∑ b, if b < a then f a b else 0) = upperPairSum f := by
  rw [Finset.sum_comm]
  unfold upperPairSum
  apply Finset.sum_congr rfl
  intro a _
  apply Finset.sum_congr rfl
  intro b _
  rw [hs b a]

end OMA.MO513259



/-!
First-order multilinear and determinant expansion over ZMod4, for MO513259.
This generic helper is not a complete solution of the source graph conjectures.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Complete candidates await pinned checking.
-/

namespace OMA.MO513259.DetFirstOrder

open scoped BigOperators

variable {I : Type*} [Fintype I] [DecidableEq I]
variable {M : I → Type*} [∀ i, AddCommGroup (M i)] [∀ i, Module (ZMod 4) (M i)]

/-- Every term changing at least two coordinates is killed by four. -/
lemma multilinear_high_order_zero
    (f : MultilinearMap (ZMod 4) M (ZMod 4)) (x h : ∀ i, M i)
    (s : Finset I) (hs : 2 ≤ s.card) :
    f (s.piecewise ((2 : ZMod 4) • h) x) = 0 := by
  let y : ∀ i, M i := s.piecewise h x
  have he : s.piecewise (fun i => (2 : ZMod 4) • y i) y =
      s.piecewise ((2 : ZMod 4) • h) x := by
    funext i
    by_cases hi : i ∈ s <;> simp [y, hi]
  have hm := f.map_piecewise_smul (fun _ => (2 : ZMod 4)) y s
  rw [he] at hm
  have hp : (∏ _i ∈ s, (2 : ZMod 4)) = 0 := by
    simp only [Finset.prod_const]
    obtain ⟨k, hk⟩ : ∃ k, s.card = k + 2 := ⟨s.card - 2, by omega⟩
    rw [hk, pow_add, show (2 : ZMod 4) ^ 2 = 0 by decide, mul_zero]
  rw [hm, hp, zero_smul]

/-- The exact first-order expansion, not an asymptotic or an assumed derivative rule. -/
lemma multilinear_add_two_smul
    (f : MultilinearMap (ZMod 4) M (ZMod 4)) (x h : ∀ i, M i) :
    f (x + (2 : ZMod 4) • h) =
      f x + 2 * ∑ i, f (Function.update x i (h i)) := by
  have hz : (∑ s : Finset I with 2 ≤ s.card,
      f (s.piecewise ((2 : ZMod 4) • h) x)) = 0 := by
    apply Finset.sum_eq_zero
    intro s hs
    exact multilinear_high_order_zero f x h s (Finset.mem_filter.mp hs).2
  rw [f.map_add_eq_map_add_linearDeriv_add x ((2 : ZMod 4) • h), hz, add_zero]
  rw [map_smul, MultilinearMap.linearDeriv_apply, smul_eq_mul]

lemma det_add_two_smul (C D : Matrix I I (ZMod 4)) :
    (C + (2 : ZMod 4) • D).det =
      C.det + 2 * ∑ i, (Matrix.updateRow C i (D i)).det := by
  let f : MultilinearMap (ZMod 4) (fun _ : I => I → ZMod 4) (ZMod 4) :=
    Matrix.detRowAlternating.toMultilinearMap
  exact multilinear_add_two_smul f C D

end OMA.MO513259.DetFirstOrder



/-!
Quotient-free odd-hollow determinant identity for the MO513259 argument.
Prerequisites: SignedHalves.odd_skew_integer_det_zero and the proved
DetFirstOrder expansion (concatenated separately in the standalone probe).
This is a helper, not a complete solution of the original graph conjectures.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidates await pinned checking.
-/

namespace OMA.MO513259.OddHollow

open scoped BigOperators Matrix

variable {I R : Type*} [Fintype I] [LinearOrder I] [CommRing R]

lemma det_updateRow_eq_cofactor_sum (A : Matrix I I R) (i : I) (u : I → R) :
    (Matrix.updateRow A i u).det = ∑ j, u j * A.adjugate j i := by
  rw [← Matrix.cramer_transpose_apply A u i,
    Matrix.cramer_eq_adjugate_mulVec, ← Matrix.adjugate_transpose]
  simp [Matrix.mulVec, dotProduct, mul_comm]

def skewLift (H : Matrix I I ℤ) : Matrix I I ℤ :=
  fun i j => if i < j then H i j else -H i j

def lowerPart (H : Matrix I I ℤ) : Matrix I I ℤ :=
  fun i j => if j < i then H i j else 0

lemma skewLift_skew (H : Matrix I I ℤ) (hH : H.IsSymm)
    (hd : ∀ i, H i i = 0) : (skewLift H)ᵀ = -skewLift H := by
  ext i j
  have hji := hH.apply i j
  rcases lt_trichotomy i j with h | rfl | h
  · simp [skewLift, h, not_lt_of_ge (le_of_lt h), hji]
  · simp [skewLift, hd]
  · simp [skewLift, h, not_lt_of_ge (le_of_lt h), hji]

lemma skewLift_add_twice_lower (H : Matrix I I ℤ) (hd : ∀ i, H i i = 0) :
    H = skewLift H + (2 : ℤ) • lowerPart H := by
  ext i j
  simp only [Matrix.add_apply, Matrix.smul_apply, smul_eq_mul]
  rcases lt_trichotomy i j with h | rfl | h
  · simp [skewLift, lowerPart, h, not_lt_of_ge (le_of_lt h)]
  · simp [skewLift, lowerPart, hd]
  · simp [skewLift, lowerPart, h, not_lt_of_ge (le_of_lt h)]
    ring

lemma cast_two_skewLift (H : Matrix I I ℤ) :
    (skewLift H).map (Int.castRingHom (ZMod 2)) = H.map (Int.castRingHom (ZMod 2)) := by
  ext i j
  by_cases h : i < j <;> simp [skewLift, h, ZMod.neg_eq_self_mod_two]

def modTwoFour : ZMod 4 →+* ZMod 2 :=
  ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)

lemma twice_eq_of_modTwoFour_eq (x y : ZMod 4) (h : modTwoFour x = modTwoFour y) :
    2 * x = 2 * y := by
  revert h
  fin_cases x <;> fin_cases y <;> decide

lemma twice_adjugate_skewLift (H : Matrix I I ℤ) (i j : I) :
    2 * ((skewLift H).adjugate i j : ZMod 4) = 2 * (H.adjugate i j : ZMod 4) := by
  let f := Int.castRingHom (ZMod 2)
  have hm : (skewLift H).adjugate.map f = H.adjugate.map f := by
    calc
      _ = ((skewLift H).map f).adjugate := f.map_adjugate _
      _ = (H.map f).adjugate := by rw [cast_two_skewLift]
      _ = _ := (f.map_adjugate _).symm
  have he : ((skewLift H).adjugate i j : ZMod 2) = (H.adjugate i j : ZMod 2) :=
    congrFun (congrFun hm i) j
  apply twice_eq_of_modTwoFour_eq
  simpa only [map_intCast] using he

/-- The odd-hollow determinant is twice its strict-lower cofactor sum modulo four. -/
lemma odd_hollow_det_mod_four (H : Matrix I I ℤ) (hH : H.IsSymm)
    (hd : ∀ i, H i i = 0) (hodd : Odd (Fintype.card I)) :
    (H.det : ZMod 4) = 2 * ∑ i, ∑ j,
      if j < i then (H i j : ZMod 4) * (H.adjugate j i : ZMod 4) else 0 := by
  let f := Int.castRingHom (ZMod 4)
  let C : Matrix I I (ZMod 4) := (skewLift H).map f
  let D : Matrix I I (ZMod 4) := (lowerPart H).map f
  have hKdet : (skewLift H).det = 0 :=
    odd_skew_integer_det_zero _ (skewLift_skew H hH hd) hodd
  have hCdet : C.det = 0 := by
    calc
      _ = f (skewLift H).det := (f.map_det _).symm
      _ = _ := by rw [hKdet, map_zero]
  have hdecomp : H.map f = C + (2 : ZMod 4) • D := by
    ext i j
    have he : H i j = skewLift H i j + 2 * lowerPart H i j := by
      simpa only [Matrix.add_apply, Matrix.smul_apply, smul_eq_mul] using
        congrFun (congrFun (skewLift_add_twice_lower H hd) i) j
    have hz := congrArg f he
    simpa [C, D] using hz
  have hCAdj (i j : I) : C.adjugate i j = ((skewLift H).adjugate i j : ZMod 4) := by
    exact congrFun (congrFun (f.map_adjugate (skewLift H)).symm i) j
  have hrow (i : I) : (Matrix.updateRow C i (D i)).det =
      ∑ j, (lowerPart H i j : ZMod 4) * ((skewLift H).adjugate j i : ZMod 4) := by
    rw [det_updateRow_eq_cofactor_sum]
    apply Finset.sum_congr rfl
    intro j _
    change (lowerPart H i j : ZMod 4) * C.adjugate j i = _
    rw [hCAdj]
  calc
    (H.det : ZMod 4) = (H.map f).det := f.map_det H
    _ = C.det + 2 * ∑ i, (Matrix.updateRow C i (D i)).det := by
      rw [hdecomp]
      exact DetFirstOrder.det_add_two_smul C D
    _ = 2 * ∑ i, ∑ j,
        (lowerPart H i j : ZMod 4) * ((skewLift H).adjugate j i : ZMod 4) := by
      rw [hCdet, zero_add]
      simp_rw [hrow]
    _ = _ := by
      simp only [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      by_cases hji : j < i
      · simp only [lowerPart, hji, if_true]
        calc
          2 * ((H i j : ZMod 4) * ((skewLift H).adjugate j i : ZMod 4)) =
              (H i j : ZMod 4) * (2 * ((skewLift H).adjugate j i : ZMod 4)) := by ring
          _ = (H i j : ZMod 4) * (2 * (H.adjugate j i : ZMod 4)) := by
            rw [twice_adjugate_skewLift]
          _ = _ := by ring
      · simp [lowerPart, hji]

end OMA.MO513259.OddHollow



/-!
Lift/cast corollaries of the quotient-free odd-hollow identity for MO513259.
Prerequisites: exact SignedHalves, DetFirstOrder and OddHollow fragments.
No full graph theorem or inverse-minor quadratic identity is asserted here.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidates await pinned checking.
-/

namespace OMA.MO513259.OddHollowEight

open scoped BigOperators Matrix
open OddHollow

variable {I : Type*} [Fintype I] [LinearOrder I]

def integerLift {n : ℕ} (A : Matrix I I (ZMod n)) : Matrix I I ℤ :=
  fun i j => (A i j).val

lemma map_integerLift {n : ℕ} [NeZero n] (A : Matrix I I (ZMod n)) :
    (integerLift A).map (Int.castRingHom (ZMod n)) = A := by
  ext i j
  simp [integerLift, ZMod.natCast_zmod_val]

lemma integerLift_symm {n : ℕ} (A : Matrix I I (ZMod n)) (hA : A.IsSymm) :
    (integerLift A).IsSymm := by
  apply Matrix.IsSymm.ext
  intro i j
  exact congrArg (fun z : ZMod n => (z.val : ℤ)) (hA.apply i j)

lemma integerLift_diag {n : ℕ} (A : Matrix I I (ZMod n)) (hd : ∀ i, A i i = 0) :
    ∀ i, integerLift A i i = 0 := by
  intro i
  simp [integerLift, hd]

def modFourEight : ZMod 8 →+* ZMod 4 :=
  ZMod.castHom (by decide : 4 ∣ 8) (ZMod 4)

lemma twice_eq_of_modFourEight_eq (x y : ZMod 8)
    (h : modFourEight x = modFourEight y) : 2 * x = 2 * y := by
  revert h
  fin_cases x <;> fin_cases y <;> decide

/-- Quotient-free odd-minor identity directly in the ring needed by the graph proof. -/
lemma twice_odd_hollow_det (A : Matrix I I (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, A i i = 0) (hodd : Odd (Fintype.card I)) :
    2 * A.det = 4 * ∑ i, ∑ j,
      if j < i then A i j * A.adjugate j i else 0 := by
  let H := integerLift A
  let f := Int.castRingHom (ZMod 8)
  have hm : H.map f = A := map_integerLift A
  have hdet : (H.det : ZMod 8) = A.det := by
    calc
      _ = (H.map f).det := f.map_det H
      _ = _ := congrArg Matrix.det hm
  have hentry (i j : I) : (H i j : ZMod 8) = A i j := congrFun (congrFun hm i) j
  have hadj (i j : I) : (H.adjugate i j : ZMod 8) = A.adjugate i j := by
    have he := f.map_adjugate H
    change H.adjugate.map f = (H.map f).adjugate at he
    rw [hm] at he
    exact congrFun (congrFun he i) j
  have hmapdet : modFourEight A.det = (H.det : ZMod 4) := by
    rw [← hdet]
    simp only [map_intCast]
  have hmapentry (i j : I) : modFourEight (A i j) = (H i j : ZMod 4) := by
    rw [← hentry]
    simp only [map_intCast]
  have hmapadj (i j : I) : modFourEight (A.adjugate i j) = (H.adjugate i j : ZMod 4) := by
    rw [← hadj]
    simp only [map_intCast]
  have htwo : modFourEight (2 : ZMod 8) = (2 : ZMod 4) := by decide
  have hr : modFourEight A.det =
      modFourEight (2 * ∑ i, ∑ j, if j < i then A i j * A.adjugate j i else 0) := by
    calc
      _ = (H.det : ZMod 4) := hmapdet
      _ = 2 * ∑ i, ∑ j,
          if j < i then (H i j : ZMod 4) * (H.adjugate j i : ZMod 4) else 0 :=
        odd_hollow_det_mod_four H (integerLift_symm A hA) (integerLift_diag A hd) hodd
      _ = _ := by
        rw [map_mul, htwo, map_sum]
        congr 1
        apply Finset.sum_congr rfl
        intro i _
        rw [map_sum]
        apply Finset.sum_congr rfl
        intro j _
        by_cases hji : j < i
        · simp only [hji, if_true, map_mul, hmapentry, hmapadj]
        · simp only [hji, if_false, map_zero]
  have ht := twice_eq_of_modFourEight_eq _ _ hr
  calc
    2 * A.det = 2 * (2 * ∑ i, ∑ j, if j < i then A i j * A.adjugate j i else 0) := ht
    _ = _ := by ring

/-- A hollow symmetric unit matrix in characteristic two has even size. -/
lemma even_card_of_hollow_unit_mod_two (A : Matrix I I (ZMod 2)) (hA : A.IsSymm)
    (hd : ∀ i, A i i = 0) (hunit : IsUnit A.det) : Even (Fintype.card I) := by
  rcases Nat.even_or_odd (Fintype.card I) with heven | hodd
  · exact heven
  · exfalso
    let H := integerLift A
    let f := Int.castRingHom (ZMod 2)
    have hKzero : (skewLift H).det = 0 :=
      odd_skew_integer_det_zero _
        (skewLift_skew H (integerLift_symm A hA) (integerLift_diag A hd)) hodd
    have hm : (skewLift H).map f = A :=
      (cast_two_skewLift H).trans (map_integerLift A)
    have hz : A.det = 0 := by
      calc
        _ = ((skewLift H).map f).det := (congrArg Matrix.det hm).symm
        _ = f (skewLift H).det := (f.map_det _).symm
        _ = _ := by rw [hKzero, map_zero]
    exact hunit.ne_zero hz

end OMA.MO513259.OddHollowEight



/-!
Principal-adjugate quadratic identification for MO513259.
Prerequisites: the verified parent DeletedCofactor/DeletedPairs/LiftFour,
DetShear, OddHollow and OddHollowEight helper fragments.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidate awaits pinned checking.
-/

namespace OMA.MO513259.HalfAdjugate

open scoped BigOperators Matrix

lemma map_nonsing_inv_mod_two {I : Type*} [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) (hunit : IsUnit A.det) :
    (A.map modTwoEight)⁻¹ = (A⁻¹).map modTwoEight := by
  apply Matrix.inv_eq_right_inv
  have h := congrArg (fun M : Matrix I I (ZMod 8) => M.map modTwoEight)
    (Matrix.mul_nonsing_inv A hunit)
  simpa only [Matrix.map_mul, Matrix.map_one, map_zero, map_one] using h

lemma twice_principal_adjugate {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, modTwoEight (A i i) = 0) (hunit : IsUnit A.det)
    (j : Fin (n + 1)) :
    2 * (DetShear.Z A).adjugate j j = liftFour (upperPairSum (fun r s =>
      modTwoEight (A r s) * modTwoEight ((A⁻¹) r j) * modTwoEight ((A⁻¹) s j))) := by
  let C := DetShear.Z A
  let A2 := A.map modTwoEight
  let H := C.submatrix j.succAbove j.succAbove
  let Q := fun r s => modTwoEight (A r s) *
    modTwoEight ((A⁻¹) r j) * modTwoEight ((A⁻¹) s j)
  have hA2symm : A2.IsSymm := hA.map _
  have hA2diag : ∀ i, A2 i i = 0 := hd
  have hA2unit : IsUnit A2.det := by
    have h := hunit.map modTwoEight
    rw [modTwoEight.map_det] at h
    exact h
  have heven := OddHollowEight.even_card_of_hollow_unit_mod_two A2 hA2symm hA2diag hA2unit
  have hHodd : Odd (Fintype.card (Fin n)) := by
    simp only [Fintype.card_fin] at heven ⊢
    obtain ⟨k, hk⟩ := heven
    exact ⟨k - 1, by omega⟩
  have hCsymm : C.IsSymm := DetShear.Z_symm A hA
  have hHsymm : H.IsSymm := hCsymm.submatrix _
  have hHdiag : ∀ r, H r r = 0 := by intro r; simp [H, C, DetShear.Z]
  have hCmap : C.map modTwoEight = A2 := DetShear.map_Z A hd
  have hHmap : H.map modTwoEight = A2.submatrix j.succAbove j.succAbove := by
    ext r s
    exact congrFun (congrFun hCmap (j.succAbove r)) (j.succAbove s)
  have hHentry (r s : Fin n) : modTwoEight (H r s) =
      modTwoEight (A (j.succAbove r) (j.succAbove s)) :=
    congrFun (congrFun hHmap r) s
  have hHadj (r s : Fin n) : modTwoEight (H.adjugate s r) =
      modTwoEight ((A⁻¹) (j.succAbove r) j) *
        modTwoEight ((A⁻¹) (j.succAbove s) j) := by
    have he := modTwoEight.map_adjugate H
    change H.adjugate.map modTwoEight = (H.map modTwoEight).adjugate at he
    rw [hHmap] at he
    have hv := congrFun (congrFun he s) r
    rw [deleted_cofactor_mod_two A2 hA2symm hA2diag hA2unit j r s,
      map_nonsing_inv_mod_two A hunit] at hv
    exact hv
  have hv0 : modTwoEight ((A⁻¹) j j) = 0 :=
    map_inverse_diagonal_zero_mod_two modTwoEight A hA hd hunit j
  have hQsymm (r s : Fin (n + 1)) : Q r s = Q s r := by
    dsimp [Q]
    rw [hA.apply r s]
    ring
  have hsum : (∑ r : Fin n, ∑ s : Fin n,
      if s < r then modTwoEight (H r s) * modTwoEight (H.adjugate s r) else 0) =
      upperPairSum Q := by
    calc
      _ = ∑ r : Fin n, ∑ s : Fin n,
          if s < r then Q (j.succAbove r) (j.succAbove s) else 0 := by
        apply Finset.sum_congr rfl
        intro r _
        apply Finset.sum_congr rfl
        intro s _
        by_cases hsr : s < r
        · simp only [hsr, if_true, hHentry, hHadj, Q]
          ring
        · simp only [hsr, if_false]
      _ = upperPairSum (fun r s : Fin n => Q (j.succAbove r) (j.succAbove s)) :=
        lowerPairSum_eq_upper _ (fun r s => hQsymm _ _)
      _ = upperPairSum Q := by
        apply upperPairSum_delete_zero Q j <;> intro k <;> simp [Q, hv0]
  have hsign : (-1 : ZMod 8) ^ ((j : ℕ) + (j : ℕ)) = 1 := by
    rw [← two_mul, pow_mul]
    norm_num
  have hcof : C.adjugate j j = H.det := by
    rw [Matrix.adjugate_fin_succ_eq_det_submatrix, hsign, one_mul]
  change 2 * C.adjugate j j = liftFour (upperPairSum Q)
  rw [hcof, OddHollowEight.twice_odd_hollow_det H hHsymm hHdiag hHodd,
    four_mul_eq_liftFour]
  congr 1
  simpa only [map_sum, apply_ite, map_mul, map_zero] using hsum

lemma determinant_shear_increment_quadratic {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, modTwoEight (A i i) = 0) (hunit : IsUnit A.det)
    (i j : Fin (n + 1)) (hij : i ≠ j) (t : ZMod 8) :
    (DetShear.Z (DetShear.inverseShear A i j t)).det - (DetShear.Z A).det =
      t * A i j * liftFour (upperPairSum (fun r s =>
        modTwoEight (A r s) * modTwoEight ((A⁻¹) r j) * modTwoEight ((A⁻¹) s j))) := by
  rw [DetShear.det_Z_inverseShear A hA hd hunit i j hij t]
  calc
    2 * t * A i j * (DetShear.Z A).adjugate j j =
        t * A i j * (2 * (DetShear.Z A).adjugate j j) := by ring
    _ = _ := by rw [twice_principal_adjugate A hA hd hunit j]

end OMA.MO513259.HalfAdjugate



/-!
Block Schur elimination infrastructure for MathOverflow 513259.
This helper follows the independently verified CoreDeterminantAndCRT body.
It is not a complete solution of the graph conjecture.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.MO513259.BlockSchur

open scoped Matrix BigOperators

variable {I J : Type*} [Fintype I] [DecidableEq I]
  [Fintype J] [DecidableEq J]

lemma eliminate_fromBlocks (P : Matrix I I (ZMod 8))
    (B : Matrix I J (ZMod 8)) (C : Matrix J I (ZMod 8))
    (Q : Matrix J J (ZMod 8)) (hP : P.IsSymm) (hCB : Cᵀ = B)
    (hu : IsUnit P.det) :
    let L := Matrix.fromBlocks 1 0 (-(C * P⁻¹)) 1
    L * Matrix.fromBlocks P B C Q * Lᵀ =
      Matrix.fromBlocks P 0 0 (Q - C * P⁻¹ * B) := by
  dsimp only
  have hcancel : C * P⁻¹ * P = C := Matrix.nonsing_inv_mul_cancel_right P C hu
  have hcancel' : P * (P⁻¹ * B) = B := Matrix.mul_nonsing_inv_cancel_left P B hu
  simp only [Matrix.fromBlocks_transpose, Matrix.transpose_one, Matrix.transpose_zero,
    Matrix.transpose_neg, Matrix.transpose_mul, hP.inv.eq, hCB,
    Matrix.fromBlocks_multiply, Matrix.one_mul, Matrix.mul_one, Matrix.zero_mul,
    Matrix.mul_zero, add_zero, zero_add, Matrix.neg_mul, Matrix.mul_neg,
    hcancel, hcancel', neg_add_cancel, add_neg_cancel, sub_eq_add_neg, neg_zero, add_comm]

noncomputable def complement (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8)) :
    Matrix J J (ZMod 8) :=
  M.toBlocks₂₂ - M.toBlocks₂₁ * M.toBlocks₁₁⁻¹ * M.toBlocks₁₂

noncomputable def eliminator (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8)) :
    Matrix (I ⊕ J) (I ⊕ J) (ZMod 8) :=
  Matrix.fromBlocks 1 0 (-(M.toBlocks₂₁ * M.toBlocks₁₁⁻¹)) 1

lemma top_left_symm (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) : M.toBlocks₁₁.IsSymm :=
  hM.submatrix Sum.inl

lemma lower_transpose_upper (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) : M.toBlocks₂₁ᵀ = M.toBlocks₁₂ := by
  ext i j
  exact (hM.apply (Sum.inr j) (Sum.inl i)).symm

lemma block_eliminate (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) (hP : IsUnit M.toBlocks₁₁.det) :
    eliminator M * M * (eliminator M)ᵀ =
      Matrix.fromBlocks M.toBlocks₁₁ 0 0 (complement M) := by
  simpa only [eliminator, complement, Matrix.fromBlocks_toBlocks] using
    eliminate_fromBlocks M.toBlocks₁₁ M.toBlocks₁₂ M.toBlocks₂₁ M.toBlocks₂₂
      (top_left_symm M hM) (lower_transpose_upper M hM) hP

lemma congruence_symm (M L : Matrix I I (ZMod 8)) (hM : M.IsSymm) :
    (L * M * Lᵀ).IsSymm := by
  unfold Matrix.IsSymm
  simp only [Matrix.transpose_mul, Matrix.transpose_transpose, hM.eq, Matrix.mul_assoc]

lemma complement_symm (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) (hP : IsUnit M.toBlocks₁₁.det) :
    (complement M).IsSymm := by
  have h := congruence_symm M (eliminator M) hM
  rw [block_eliminate M hM hP] at h
  exact (Matrix.isSymm_fromBlocks_iff.mp h).2.2.2

lemma determinant_eliminator (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8)) :
    (eliminator M).det = 1 := by
  simp only [eliminator, Matrix.det_fromBlocks_zero₁₂, Matrix.det_one, one_mul]

lemma determinant_factor (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) (hP : IsUnit M.toBlocks₁₁.det) :
    M.det = M.toBlocks₁₁.det * (complement M).det := by
  have h := congrArg Matrix.det (block_eliminate M hM hP)
  simpa only [Matrix.det_mul, Matrix.det_transpose, determinant_eliminator,
    one_mul, mul_one, Matrix.det_fromBlocks_zero₁₂] using h

lemma complement_det_unit (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) (hP : IsUnit M.toBlocks₁₁.det) (hU : IsUnit M.det) :
    IsUnit (complement M).det := by
  rw [determinant_factor M hM hP] at hU
  exact isUnit_of_mul_isUnit_right hU

lemma congruence_diagonal_even (M L : Matrix I I (ZMod 8))
    (hM : M.IsSymm) (hd : ∀ i, OMA.MO513259.modTwoEight (M i i) = 0) (i : I) :
    OMA.MO513259.modTwoEight ((L * M * Lᵀ) i i) = 0 := by
  have hsym : (M.map OMA.MO513259.modTwoEight).IsSymm := by
    apply Matrix.IsSymm.ext
    intro a b
    exact congrArg OMA.MO513259.modTwoEight (hM.apply a b)
  have hdiag : ∀ a, (M.map OMA.MO513259.modTwoEight) a a = 0 := hd
  have h := OMA.MO513259.quadratic_zero_mod_two
    (M.map OMA.MO513259.modTwoEight) hsym hdiag
    (fun j => OMA.MO513259.modTwoEight (L i j))
  rw [Matrix.mul_assoc]
  simpa only [Matrix.mul_apply, Matrix.mulVec, dotProduct, Matrix.map_apply,
    Matrix.transpose_apply, map_sum, map_mul] using h

lemma complement_diagonal_even (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) (hP : IsUnit M.toBlocks₁₁.det)
    (hd : ∀ i, OMA.MO513259.modTwoEight (M i i) = 0) (i : J) :
    OMA.MO513259.modTwoEight (complement M i i) = 0 := by
  have h := congruence_diagonal_even M (eliminator M) hM hd (Sum.inr i)
  rw [block_eliminate M hM hP] at h
  exact h

theorem block_reduction (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : M.IsSymm) (hP : IsUnit M.toBlocks₁₁.det) (hU : IsUnit M.det)
    (hd : ∀ i, OMA.MO513259.modTwoEight (M i i) = 0) :
    (eliminator M * M * (eliminator M)ᵀ =
      Matrix.fromBlocks M.toBlocks₁₁ 0 0 (complement M)) ∧
    (complement M).IsSymm ∧
    (∀ i, OMA.MO513259.modTwoEight (complement M i i) = 0) ∧
    IsUnit (complement M).det := by
  exact ⟨block_eliminate M hM hP, complement_symm M hM hP,
    complement_diagonal_even M hM hP hd, complement_det_unit M hM hP hU⟩

end OMA.MO513259.BlockSchur


/-!
Finite transvection reachability infrastructure for MathOverflow 513259.
This helper follows the independently verified CoreDeterminantAndCRT body.
No complete graph theorem or acceptance is asserted by this helper alone.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.MO513259.LowerUnipotent

open scoped Matrix BigOperators

variable {I J : Type*} [Fintype I] [DecidableEq I]
  [Fintype J] [DecidableEq J]

def unipotent (C : Matrix J I (ZMod 8)) :
    Matrix (I ⊕ J) (I ⊕ J) (ZMod 8) :=
  Matrix.fromBlocks 1 0 C 1

lemma unipotent_zero : unipotent (0 : Matrix J I (ZMod 8)) = 1 :=
  Matrix.fromBlocks_one

lemma unipotent_add (C D : Matrix J I (ZMod 8)) :
    unipotent (C + D) = unipotent C * unipotent D := by
  simp only [unipotent, Matrix.fromBlocks_multiply, Matrix.one_mul,
    Matrix.mul_one, Matrix.zero_mul, Matrix.mul_zero, zero_add, add_zero]

lemma unipotent_single (i : J) (j : I) (t : ZMod 8) :
    unipotent (Matrix.single i j t) =
      Matrix.transvection (Sum.inr i) (Sum.inl j) t := by
  ext a b
  cases a <;> cases b <;>
    simp [unipotent, Matrix.transvection, Matrix.fromBlocks, Matrix.single,
      Matrix.one_apply, eq_comm]

noncomputable def entryOrder : List (J × I) :=
  (Finset.univ : Finset (J × I)).toList

def factor (C : Matrix J I (ZMod 8)) (p : J × I) :
    Matrix (I ⊕ J) (I ⊕ J) (ZMod 8) :=
  Matrix.transvection (Sum.inr p.1) (Sum.inl p.2) (C p.1 p.2)

lemma list_factorization (C : Matrix J I (ZMod 8)) (l : List (J × I)) :
    unipotent ((l.map fun p => Matrix.single p.1 p.2 (C p.1 p.2)).sum) =
      (l.map (factor C)).prod := by
  induction l with
  | nil => simp only [List.map_nil, List.sum_nil, List.prod_nil, unipotent_zero]
  | cons p l ih =>
      simp only [List.map_cons, List.sum_cons, List.prod_cons]
      rw [unipotent_add, unipotent_single, ih]
      rfl

lemma entry_sum (C : Matrix J I (ZMod 8)) :
    ((entryOrder.map fun p => Matrix.single p.1 p.2 (C p.1 p.2)).sum) = C := by
  unfold entryOrder
  rw [Finset.sum_map_toList, Fintype.sum_prod_type]
  exact Matrix.sum_sum_single C

theorem unipotent_factorization (C : Matrix J I (ZMod 8)) :
    unipotent C = (entryOrder.map (factor C)).prod := by
  have h := list_factorization C entryOrder
  rw [entry_sum] at h
  exact h

lemma transvection_rowShear {K : Type*} [Fintype K] [DecidableEq K]
    (M : Matrix K K (ZMod 8)) (i j : K) (t : ZMod 8) :
    Matrix.transvection i j t * M = OMA.MO513259.rowShear M i j t := by
  ext a b
  by_cases ha : a = i
  · subst a
    simp [OMA.MO513259.rowShear, Matrix.updateRow_apply, Pi.add_apply,
      Pi.smul_apply, smul_eq_mul]
  · simp [OMA.MO513259.rowShear, Matrix.updateRow_apply, ha]

lemma transvection_double_shear {K : Type*} [Fintype K] [DecidableEq K]
    (M : Matrix K K (ZMod 8)) (i j : K) (t : ZMod 8) :
    Matrix.transvection i j t * M * (Matrix.transvection i j t)ᵀ =
      OMA.MO513259.colShear (OMA.MO513259.rowShear M i j t) i j t := by
  rw [transvection_rowShear]
  unfold OMA.MO513259.colShear
  simpa only [Matrix.transpose_mul, Matrix.transpose_transpose] using
    congrArg Matrix.transpose (transvection_rowShear
      (OMA.MO513259.rowShear M i j t)ᵀ i j t)

lemma list_congruence_preserves
    (P : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8) → Prop)
    (hstep : ∀ M (i : J) (j : I) (t : ZMod 8), P M →
      P (OMA.MO513259.colShear
        (OMA.MO513259.rowShear M (Sum.inr i) (Sum.inl j) t)
        (Sum.inr i) (Sum.inl j) t))
    (C : Matrix J I (ZMod 8)) (l : List (J × I))
    (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8)) (hM : P M) :
    P ((l.map (factor C)).prod * M * ((l.map (factor C)).prod)ᵀ) := by
  induction l with
  | nil => simpa only [List.map_nil, List.prod_nil, Matrix.one_mul,
      Matrix.transpose_one, Matrix.mul_one] using hM
  | cons p l ih =>
      have h := hstep
        ((l.map (factor C)).prod * M * ((l.map (factor C)).prod)ᵀ)
        p.1 p.2 (C p.1 p.2) ih
      rw [← transvection_double_shear] at h
      simpa only [List.map_cons, List.prod_cons, factor, Matrix.transpose_mul,
        Matrix.mul_assoc] using h

theorem unipotent_congruence_preserves
    (P : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8) → Prop)
    (hstep : ∀ M (i : J) (j : I) (t : ZMod 8), P M →
      P (OMA.MO513259.colShear
        (OMA.MO513259.rowShear M (Sum.inr i) (Sum.inl j) t)
        (Sum.inr i) (Sum.inl j) t))
    (C : Matrix J I (ZMod 8)) (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8))
    (hM : P M) : P (unipotent C * M * (unipotent C)ᵀ) := by
  rw [unipotent_factorization]
  exact list_congruence_preserves P hstep C entryOrder M hM

end OMA.MO513259.LowerUnipotent


/-!
Reverse closure bridge following the complete LowerUnipotentFactorization helper.
Infrastructure only; not a complete MO513259 proof.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.MO513259.LowerUnipotent

open scoped Matrix BigOperators

variable {I J : Type*} [Fintype I] [DecidableEq I]
  [Fintype J] [DecidableEq J]

lemma unipotent_neg_mul (C : Matrix J I (ZMod 8)) :
    unipotent (-C) * unipotent C = 1 := by
  rw [← unipotent_add, neg_add_cancel, unipotent_zero]

lemma unipotent_undo_congruence (C : Matrix J I (ZMod 8))
    (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8)) :
    unipotent (-C) * (unipotent C * M * (unipotent C)ᵀ) *
      (unipotent (-C))ᵀ = M := by
  calc
    _ = (unipotent (-C) * unipotent C) * M *
        (unipotent (-C) * unipotent C)ᵀ := by
      simp only [Matrix.transpose_mul, Matrix.mul_assoc]
    _ = M := by
      simp only [unipotent_neg_mul, Matrix.one_mul, Matrix.transpose_one, Matrix.mul_one]

theorem unipotent_congruence_iff
    (P : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8) → Prop)
    (hstep : ∀ M (i : J) (j : I) (t : ZMod 8), P M →
      P (OMA.MO513259.colShear
        (OMA.MO513259.rowShear M (Sum.inr i) (Sum.inl j) t)
        (Sum.inr i) (Sum.inl j) t))
    (C : Matrix J I (ZMod 8)) (M : Matrix (I ⊕ J) (I ⊕ J) (ZMod 8)) :
    P (unipotent C * M * (unipotent C)ᵀ) ↔ P M := by
  constructor
  · intro h
    have h' := unipotent_congruence_preserves P hstep (-C)
      (unipotent C * M * (unipotent C)ᵀ) h
    rwa [unipotent_undo_congruence] at h'
  · exact unipotent_congruence_preserves P hstep C M

end OMA.MO513259.LowerUnipotent


/-!
Permanent block and reindex infrastructure for MathOverflow 513259.
This helper is not a complete solution of the graph conjecture.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.

The two proofs adapt the corresponding signless parts of Mathlib's
LinearAlgebra/Matrix/Determinant/Basic.lean.
Copyright (c) 2018 Kenny Lau. All rights reserved.
Released under Apache 2.0 license as described in Mathlib's LICENSE.
Authors of the adapted Mathlib file: Kenny Lau, Chris Hughes, Anne Baanen.
-/

namespace OMA.MO513259.PermanentBlocks

open Equiv Fintype Finset Function Matrix
open scoped BigOperators Matrix

variable {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n]
  {R : Type*} [CommSemiring R]

theorem permanent_submatrix_equiv_self (e : m ≃ n) (A : Matrix n n R) :
    (A.submatrix e e).permanent = A.permanent := by
  rw [Matrix.permanent, Matrix.permanent]
  apply Fintype.sum_equiv (Equiv.permCongr e)
  intro σ
  apply Fintype.prod_equiv e
  intro i
  rw [Equiv.permCongr_apply, Equiv.symm_apply_apply, Matrix.submatrix_apply]

theorem permanent_reindex_self (e : m ≃ n) (A : Matrix m m R) :
    (Matrix.reindex e e A).permanent = A.permanent :=
  permanent_submatrix_equiv_self e.symm A

theorem permanent_fromBlocks_zero₂₁ (A : Matrix m m R) (B : Matrix m n R)
    (D : Matrix n n R) :
    (Matrix.fromBlocks A B 0 D).permanent = A.permanent * D.permanent := by
  classical
  simp_rw [Matrix.permanent]
  convert! Eq.symm <|
    sum_subset (M := R)
      (subset_univ ((Equiv.Perm.sumCongrHom m n).range : Set (Equiv.Perm (m ⊕ n))).toFinset)
      ?_
  · simp_rw [Finset.sum_mul_sum, ← sum_product', univ_product_univ]
    refine sum_nbij (fun σ => σ.fst.sumCongr σ.snd) ?_ ?_ ?_ ?_
    · intro σ₁₂ _
      rw [Set.mem_toFinset]
      exact ⟨σ₁₂, rfl⟩
    · intro σ₁ _ σ₂ _
      dsimp only
      intro h
      have h2 : ∀ x, Equiv.Perm.sumCongr σ₁.fst σ₁.snd x =
          Equiv.Perm.sumCongr σ₂.fst σ₂.snd x := DFunLike.congr_fun h
      simp only [Sum.map_inr, Sum.map_inl, Equiv.Perm.sumCongr_apply,
        Sum.forall, Sum.inl.injEq, Sum.inr.injEq] at h2
      ext x
      · exact h2.left x
      · exact h2.right x
    · intro σ hσ
      rw [mem_coe, Set.mem_toFinset] at hσ
      obtain ⟨σ₁₂, hσ₁₂⟩ := hσ
      use σ₁₂
      rw [← hσ₁₂]
      simp
    · simp only [forall_prop_of_true, Prod.forall, mem_univ]
      intro σ₁ σ₂
      rw [Fintype.prod_sum_type]
      simp_rw [Equiv.sumCongr_apply, Sum.map_inr, Sum.map_inl,
        Matrix.fromBlocks_apply₁₁, Matrix.fromBlocks_apply₂₂]
  · rintro σ - hσn
    have h1 : ¬∀ x, ∃ y, Sum.inl y = σ (Sum.inl x) := by
      rw [Set.mem_toFinset] at hσn
      simpa only [Set.MapsTo, Set.mem_range, forall_exists_index,
        forall_apply_eq_imp_iff] using
        mt Equiv.Perm.mem_sumCongrHom_range_of_perm_mapsTo_inl hσn
    obtain ⟨a, ha⟩ := not_forall.mp h1
    rcases hx : σ (Sum.inl a) with a2 | b
    · have hn := (not_exists.mp ha) a2
      exact absurd hx.symm hn
    · apply Finset.prod_eq_zero (Finset.mem_univ (Sum.inl a))
      rw [hx, Matrix.fromBlocks_apply₂₁, Matrix.zero_apply]

theorem permanent_fromBlocks_zero₁₂ (A : Matrix m m R) (C : Matrix n m R)
    (D : Matrix n n R) :
    (Matrix.fromBlocks A 0 C D).permanent = A.permanent * D.permanent := by
  rw [← Matrix.permanent_transpose, Matrix.fromBlocks_transpose,
    Matrix.transpose_zero, permanent_fromBlocks_zero₂₁,
    Matrix.permanent_transpose, Matrix.permanent_transpose]

theorem permanent_block_diagonal (A : Matrix m m R) (D : Matrix n n R) :
    (Matrix.fromBlocks A 0 0 D).permanent = A.permanent * D.permanent :=
  permanent_fromBlocks_zero₂₁ A 0 D

end OMA.MO513259.PermanentBlocks


/-!
Finite-cardinality block congruence induction for MathOverflow 513259.
This is a structural principle with explicit invariant hypotheses, not a
complete proof of the source permanent congruence.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.MO513259.BlockInduction

open scoped Matrix BigOperators

def Admissible {I : Type} [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) : Prop :=
  A.IsSymm ∧ (∀ i, OMA.MO513259.modTwoEight (A i i) = 0) ∧ IsUnit A.det

lemma admissible_submatrix {I J : Type} [Fintype I] [DecidableEq I]
    [Fintype J] [DecidableEq J] (A : Matrix I I (ZMod 8)) (e : J ≃ I)
    (hA : Admissible A) : Admissible (A.submatrix e e) := by
  refine ⟨hA.1.submatrix e, fun j => hA.2.1 (e j), ?_⟩
  rw [Matrix.det_submatrix_equiv_self]
  exact hA.2.2

lemma admissible_blocks {I J : Type} [Fintype I] [DecidableEq I]
    [Fintype J] [DecidableEq J] (A : Matrix I I (ZMod 8))
    (D : Matrix J J (ZMod 8)) (hA : Admissible A) (hD : Admissible D) :
    Admissible (Matrix.fromBlocks A 0 0 D) := by
  refine ⟨Matrix.IsSymm.fromBlocks hA.1 (by simp) hD.1, ?_, ?_⟩
  · intro i
    cases i with
    | inl i => exact hA.2.1 i
    | inr i => exact hD.2.1 i
  · rw [Matrix.det_fromBlocks_zero₂₁]
    exact hA.2.2.mul hD.2.2

lemma admissible_double_shear {I : Type} [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) (i j : I) (t : ZMod 8)
    (hij : i ≠ j) (hA : Admissible A) :
    Admissible (OMA.MO513259.colShear
      (OMA.MO513259.rowShear A i j t) i j t) := by
  rw [← OMA.MO513259.LowerUnipotent.transvection_double_shear]
  refine ⟨OMA.MO513259.BlockSchur.congruence_symm _ _ hA.1,
    OMA.MO513259.BlockSchur.congruence_diagonal_even _ _ hA.1 hA.2.1, ?_⟩
  have ht : (Matrix.transvection i j t).det = 1 :=
    Matrix.det_transvection_of_ne i j hij t
  simpa only [Matrix.det_mul, Matrix.det_transpose, ht, one_mul, mul_one]
    using hA.2.2

abbrev Complement {I : Type} (i j : I) := {x : I // x ≠ i ∧ x ≠ j}

def splitMap {I : Type} (i j : I) : Fin 2 ⊕ Complement i j → I
  | Sum.inl a => if a = 0 then i else j
  | Sum.inr a => a.val

lemma splitMap_bijective {I : Type} (i j : I) (hij : i ≠ j) :
    Function.Bijective (splitMap i j) := by
  constructor
  · rintro (a | a) (b | b) h
    · fin_cases a <;> fin_cases b <;> simp_all [splitMap]
    · fin_cases a
      · have hh : i = (b : I) := by simpa [splitMap] using h
        exact False.elim (b.property.1 hh.symm)
      · have hh : j = (b : I) := by simpa [splitMap] using h
        exact False.elim (b.property.2 hh.symm)
    · fin_cases b
      · have hh : (a : I) = i := by simpa [splitMap] using h
        exact False.elim (a.property.1 hh)
      · have hh : (a : I) = j := by simpa [splitMap] using h
        exact False.elim (a.property.2 hh)
    · change (a : I) = (b : I) at h
      exact congrArg Sum.inr (Subtype.ext h)
  · intro x
    by_cases hx : x = i
    · subst x
      exact ⟨Sum.inl 0, by simp [splitMap]⟩
    · by_cases hxj : x = j
      · subst x
        exact ⟨Sum.inl 1, by simp [splitMap]⟩
      · exact ⟨Sum.inr ⟨x, hx, hxj⟩, rfl⟩

noncomputable def splitEquiv {I : Type} (i j : I) (hij : i ≠ j) :
    Fin 2 ⊕ Complement i j ≃ I :=
  Equiv.ofBijective (splitMap i j) (splitMap_bijective i j hij)

lemma split_pivot {I : Type} (A : Matrix I I (ZMod 8))
    (i j : I) (hij : i ≠ j) :
    (A.submatrix (splitEquiv i j hij) (splitEquiv i j hij)).toBlocks₁₁ =
      (!![A i i, A i j; A j i, A j j] : Matrix (Fin 2) (Fin 2) (ZMod 8)) := by
  ext a b
  fin_cases a <;> fin_cases b <;> rfl

theorem finite_block_congruence_induction
    (P : ∀ I : Type, Matrix I I (ZMod 8) → Prop)
    (hEmpty : ∀ (I : Type) [Fintype I] [DecidableEq I] [IsEmpty I]
      (A : Matrix I I (ZMod 8)), P I A)
    (hTwo : ∀ A : Matrix (Fin 2) (Fin 2) (ZMod 8), Admissible A → P (Fin 2) A)
    (hReindex : ∀ (I J : Type) [Fintype I] [DecidableEq I]
      [Fintype J] [DecidableEq J] (e : I ≃ J) (A : Matrix J J (ZMod 8)),
      P J A → P I (A.submatrix e e))
    (hBlocks : ∀ (J : Type) [Fintype J] [DecidableEq J]
      (A : Matrix (Fin 2) (Fin 2) (ZMod 8)) (D : Matrix J J (ZMod 8)),
      Admissible A → Admissible D → P (Fin 2) A → P J D →
      P (Fin 2 ⊕ J) (Matrix.fromBlocks A 0 0 D))
    (hShear : ∀ (I : Type) [Fintype I] [DecidableEq I]
      (A : Matrix I I (ZMod 8)) (i j : I) (t : ZMod 8),
      i ≠ j → Admissible A → P I A →
      P I (OMA.MO513259.colShear (OMA.MO513259.rowShear A i j t) i j t)) :
    ∀ (I : Type) [Fintype I] [DecidableEq I] (A : Matrix I I (ZMod 8)),
      Admissible A → P I A := by
  classical
  have aux : ∀ n : ℕ, ∀ (I : Type) [Fintype I] [DecidableEq I],
      Fintype.card I = n → ∀ A : Matrix I I (ZMod 8), Admissible A → P I A := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro I instF instD hc A hA
      by_cases hn : n = 0
      · have hz : Fintype.card I = 0 := hc.trans hn
        letI : IsEmpty I := Fintype.card_eq_zero_iff.mp hz
        exact hEmpty I A
      · have hp : 0 < Fintype.card I := by omega
        letI : Nonempty I := Fintype.card_pos_iff.mp hp
        let i : I := Classical.choice inferInstance
        obtain ⟨j, hij, huij⟩ := OMA.MO513259.exists_unit_offdiagonal A hA.2.1 hA.2.2 i
        let J := Complement i j
        let e : Fin 2 ⊕ J ≃ I := splitEquiv i j hij
        let N : Matrix (Fin 2 ⊕ J) (Fin 2 ⊕ J) (ZMod 8) := A.submatrix e e
        have hN : Admissible N := admissible_submatrix A e hA
        have hcard : Fintype.card I = 2 + Fintype.card J := by
          calc
            Fintype.card I = Fintype.card (Fin 2 ⊕ J) := Fintype.card_congr e.symm
            _ = 2 + Fintype.card J := by rw [Fintype.card_sum, Fintype.card_fin]
        have hlt : Fintype.card J < n := by omega
        have hPivot : IsUnit N.toBlocks₁₁.det := by
          change IsUnit ((A.submatrix (splitEquiv i j hij) (splitEquiv i j hij)).toBlocks₁₁.det)
          rw [split_pivot]
          exact OMA.MO513259.offdiagonal_pivot_det_unit A hA.1 hA.2.1 i j huij
        have hTop : Admissible N.toBlocks₁₁ :=
          ⟨hN.1.submatrix Sum.inl, fun a => hN.2.1 (Sum.inl a), hPivot⟩
        let D := OMA.MO513259.BlockSchur.complement N
        have hD : Admissible D :=
          ⟨OMA.MO513259.BlockSchur.complement_symm N hN.1 hPivot,
            OMA.MO513259.BlockSchur.complement_diagonal_even N hN.1 hPivot hN.2.1,
            OMA.MO513259.BlockSchur.complement_det_unit N hN.1 hPivot hN.2.2⟩
        have pD : P J D := ih (Fintype.card J) hlt J rfl D hD
        have pTop : P (Fin 2) N.toBlocks₁₁ := hTwo _ hTop
        let R := Matrix.fromBlocks N.toBlocks₁₁ 0 0 D
        have hR : Admissible R := admissible_blocks _ _ hTop hD
        have pR : P (Fin 2 ⊕ J) R := hBlocks J _ _ hTop hD pTop pD
        let Q : Matrix (Fin 2 ⊕ J) (Fin 2 ⊕ J) (ZMod 8) → Prop :=
          fun M => Admissible M ∧ P (Fin 2 ⊕ J) M
        have hStep : ∀ M (a : J) (b : Fin 2) (t : ZMod 8), Q M →
            Q (OMA.MO513259.colShear
              (OMA.MO513259.rowShear M (Sum.inr a) (Sum.inl b) t)
              (Sum.inr a) (Sum.inl b) t) := by
          intro M a b t hM
          have hab : (Sum.inr a : Fin 2 ⊕ J) ≠ Sum.inl b := by simp
          exact ⟨admissible_double_shear M _ _ t hab hM.1,
            hShear (Fin 2 ⊕ J) M _ _ t hab hM.1 hM.2⟩
        let C := -(N.toBlocks₂₁ * N.toBlocks₁₁⁻¹)
        have hElim : OMA.MO513259.LowerUnipotent.unipotent C * N *
            (OMA.MO513259.LowerUnipotent.unipotent C)ᵀ = R := by
          exact OMA.MO513259.BlockSchur.block_eliminate N hN.1 hPivot
        have hQN : Q N :=
          (OMA.MO513259.LowerUnipotent.unipotent_congruence_iff Q hStep C N).mp
            (by rw [hElim]; exact ⟨hR, pR⟩)
        have pBack := hReindex I (Fin 2 ⊕ J) e.symm N hQN.2
        have hBack : N.submatrix e.symm e.symm = A := by
          ext x y
          simp [N, Matrix.submatrix_apply]
        rwa [hBack] at pBack
  intro I instF instD A hA
  exact aux (Fintype.card I) I rfl A hA

end OMA.MO513259.BlockInduction


/-!
Inverse transport under a simultaneous elementary row and column shear.
Prerequisites: verified DetShear and LowerUnipotentFactorization fragments.
Finite index type is arbitrary; coefficients are the source ring ZMod8.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidate awaits pinned checking.
-/

namespace OMA.MO513259.InverseShear

open scoped Matrix

variable {I : Type*} [Fintype I] [DecidableEq I]

lemma transpose_transvection (i j : I) (t : ZMod 8) :
    (Matrix.transvection i j t)ᵀ = Matrix.transvection j i t := by
  simp [Matrix.transvection, Matrix.transpose_add, Matrix.transpose_one, Matrix.transpose_single]

lemma inverse_inverseShear (A : Matrix I I (ZMod 8)) (hunit : IsUnit A.det)
    (i j : I) (hij : i ≠ j) (t : ZMod 8) :
    (DetShear.inverseShear A i j t)⁻¹ =
      colShear (rowShear A⁻¹ i j t) i j t := by
  let U : Matrix I I (ZMod 8) := Matrix.transvection j i (-t)
  let V : Matrix I I (ZMod 8) := Matrix.transvection i j (-t)
  let W : Matrix I I (ZMod 8) := Matrix.transvection i j t
  let X : Matrix I I (ZMod 8) := Matrix.transvection j i t
  have hVW : V * W = 1 := by
    simpa only [V, W, neg_add_cancel, Matrix.transvection_zero] using
      Matrix.transvection_mul_transvection_same i j hij (-t) t
  have hUX : U * X = 1 := by
    simpa only [U, X, neg_add_cancel, Matrix.transvection_zero] using
      Matrix.transvection_mul_transvection_same j i (Ne.symm hij) (-t) t
  have hleft : DetShear.inverseShear A i j t = U * A * V := by
    simpa only [DetShear.inverseShear, U, V, transpose_transvection] using
      (LowerUnipotent.transvection_double_shear A j i (-t)).symm
  have hright : colShear (rowShear A⁻¹ i j t) i j t = W * A⁻¹ * X := by
    simpa only [W, X, transpose_transvection] using
      (LowerUnipotent.transvection_double_shear A⁻¹ i j t).symm
  apply Matrix.inv_eq_right_inv
  rw [hleft, hright]
  calc
    (U * A * V) * (W * A⁻¹ * X) = U * A * (V * W) * A⁻¹ * X := by
      simp only [Matrix.mul_assoc]
    _ = U * (A * A⁻¹) * X := by
      rw [hVW]
      simp only [Matrix.mul_one, Matrix.mul_assoc]
    _ = U * X := by rw [Matrix.mul_nonsing_inv A hunit, Matrix.mul_one]
    _ = 1 := hUX

lemma isUnit_det_inverseShear (A : Matrix I I (ZMod 8)) (hunit : IsUnit A.det)
    (i j : I) (hij : i ≠ j) (t : ZMod 8) :
    IsUnit (DetShear.inverseShear A i j t).det := by
  rw [DetShear.det_inverseShear A i j t hij]
  exact hunit

end OMA.MO513259.InverseShear



/-!
Reindexing, bases and block multiplication of the corrected permanent identity.
The elementary-shear invariant is an explicit hypothesis of the final helper;
its proof is provided separately by the orbit and determinant calculations.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.MO513259
namespace InvariantStructure
open scoped Matrix BigOperators

def Formula {I : Type} [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) : Prop :=
  A.det * (A⁻¹).permanent = (DetShear.Z A).det

def Corrected (I : Type) (A : Matrix I I (ZMod 8)) : Prop :=
  ∀ (f : Fintype I) (d : DecidableEq I), @Formula I f d A

lemma corrected_iff {I : Type} [f0 : Fintype I] [d0 : DecidableEq I]
    (A : Matrix I I (ZMod 8)) :
    Corrected I A ↔ A.det * (A⁻¹).permanent = (DetShear.Z A).det := by
  constructor
  · intro h
    exact h f0 d0
  · intro h f d
    have hf : f = f0 := Subsingleton.elim _ _
    cases hf
    have hd : d = d0 := Subsingleton.elim _ _
    cases hd
    exact h

lemma corrected_empty (I : Type) [Fintype I] [DecidableEq I] [IsEmpty I]
    (A : Matrix I I (ZMod 8)) : Corrected I A := by
  apply (corrected_iff A).mpr
  simp [Matrix.permanent]

lemma Z_submatrix {I J : Type} [DecidableEq I] [DecidableEq J]
    (A : Matrix J J (ZMod 8)) (e : I ≃ J) :
    DetShear.Z (A.submatrix e e) = (DetShear.Z A).submatrix e e := by
  ext i j
  by_cases h : i = j
  · subst j
    simp [DetShear.Z, Matrix.sub_apply, Matrix.diagonal_apply, Matrix.diag_apply]
  · have he : e i ≠ e j := fun he => h (e.injective he)
    simp [DetShear.Z, Matrix.sub_apply, Matrix.submatrix_apply,
      Matrix.diagonal_apply, Matrix.diag_apply, h, he]

lemma corrected_reindex (I J : Type) [Fintype I] [DecidableEq I]
    [Fintype J] [DecidableEq J] (e : I ≃ J) (A : Matrix J J (ZMod 8))
    (hA : Corrected J A) : Corrected I (A.submatrix e e) := by
  apply (corrected_iff _).mpr
  rw [Matrix.det_submatrix_equiv_self, Matrix.inv_submatrix_equiv,
    PermanentBlocks.permanent_submatrix_equiv_self, Z_submatrix,
    Matrix.det_submatrix_equiv_self]
  exact (corrected_iff A).mp hA

lemma Z_blocks {I J : Type} [DecidableEq I] [DecidableEq J]
    (A : Matrix I I (ZMod 8)) (D : Matrix J J (ZMod 8)) :
    DetShear.Z (Matrix.fromBlocks A 0 0 D) =
      Matrix.fromBlocks (DetShear.Z A) 0 0 (DetShear.Z D) := by
  ext i j
  cases i <;> cases j <;>
    simp [DetShear.Z, Matrix.sub_apply, Matrix.diagonal_apply, Matrix.diag_apply]

lemma inverse_blocks {I J : Type} [Fintype I] [DecidableEq I]
    [Fintype J] [DecidableEq J] (A : Matrix I I (ZMod 8))
    (D : Matrix J J (ZMod 8)) (hA : IsUnit A.det) (hD : IsUnit D.det) :
    (Matrix.fromBlocks A 0 0 D)⁻¹ = Matrix.fromBlocks A⁻¹ 0 0 D⁻¹ := by
  apply Matrix.inv_eq_right_inv
  simp only [Matrix.fromBlocks_multiply, Matrix.zero_mul, Matrix.mul_zero,
    add_zero, zero_add, Matrix.mul_nonsing_inv A hA, Matrix.mul_nonsing_inv D hD,
    Matrix.fromBlocks_one]

lemma corrected_blocks (J : Type) [Fintype J] [DecidableEq J]
    (A : Matrix (Fin 2) (Fin 2) (ZMod 8)) (D : Matrix J J (ZMod 8))
    (hA : BlockInduction.Admissible A) (hD : BlockInduction.Admissible D)
    (hpA : Corrected (Fin 2) A) (hpD : Corrected J D) :
    Corrected (Fin 2 ⊕ J) (Matrix.fromBlocks A 0 0 D) := by
  apply (corrected_iff _).mpr
  rw [Matrix.det_fromBlocks_zero₂₁, inverse_blocks A D hA.2.2 hD.2.2,
    PermanentBlocks.permanent_block_diagonal, Z_blocks, Matrix.det_fromBlocks_zero₂₁]
  calc
    _ = (A.det * (A⁻¹).permanent) * (D.det * (D⁻¹).permanent) := by ring
    _ = _ := by rw [(corrected_iff A).mp hpA, (corrected_iff D).mp hpD]

lemma corrected_two (A : Matrix (Fin 2) (Fin 2) (ZMod 8))
    (hA : BlockInduction.Admissible A) : Corrected (Fin 2) A := by
  apply (corrected_iff _).mpr
  obtain ⟨a, ha⟩ := (modTwoEight_zero_iff_two_mul (A 0 0)).mp (hA.2.1 0)
  obtain ⟨c, hc⟩ := (modTwoEight_zero_iff_two_mul (A 1 1)).mp (hA.2.1 1)
  have hb : IsUnit (A 0 1) := by
    obtain ⟨j, hj, hu⟩ := exists_unit_offdiagonal A hA.2.1 hA.2.2 0
    fin_cases j
    · exact False.elim (hj rfl)
    · exact hu
  have he : A = evenTwo a (A 0 1) c := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [evenTwo, ← ha, ← hc, hA.1.apply 0 1]
  rw [he]
  have hz : DetShear.Z (evenTwo a (A 0 1) c) =
      (!![0, A 0 1; A 0 1, 0] : Matrix (Fin 2) (Fin 2) (ZMod 8)) := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [DetShear.Z, Matrix.sub_apply, Matrix.diagonal_apply, Matrix.diag_apply, evenTwo]
  rw [hz]
  exact base_two_corrected_congruence a (A 0 1) c hb

theorem universal_corrected_of_shear
    (hShear : ∀ (I : Type) [Fintype I] [DecidableEq I]
      (A : Matrix I I (ZMod 8)) (i j : I) (t : ZMod 8),
      i ≠ j → BlockInduction.Admissible A → Corrected I A →
      Corrected I (colShear (rowShear A i j t) i j t)) :
    ∀ (I : Type) [Fintype I] [DecidableEq I] (A : Matrix I I (ZMod 8)),
      BlockInduction.Admissible A → Corrected I A := by
  exact BlockInduction.finite_block_congruence_induction Corrected
    corrected_empty corrected_two corrected_reindex corrected_blocks hShear

end InvariantStructure
end OMA.MO513259



/-!
Elementary-congruence invariance of the corrected permanent identity.
The two increment calculations are established in the preceding components.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/
namespace OMA.MO513259
namespace InvariantStructure
open scoped Matrix BigOperators

lemma unit_mul_liftFour (u : ZMod 8) (hu : IsUnit u) (z : ZMod 2) :
    u * liftFour z = liftFour z := by
  have hn : modTwoEight u ≠ 0 := (isUnit_iff_modTwoEight_ne_zero u).mp hu
  have hone : modTwoEight u = 1 := by
    have ht : ∀ x : ZMod 2, x ≠ 0 → x = 1 := by decide
    exact ht _ hn
  rw [← liftFour_mul, hone, one_mul]

lemma corrected_inverseShear_fin {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod 8))
    (i j : Fin (n + 1)) (t : ZMod 8) (hij : i ≠ j)
    (hA : BlockInduction.Admissible A) (hpA : Corrected (Fin (n + 1)) A) :
    Corrected (Fin (n + 1)) (DetShear.inverseShear A i j t) := by
  apply (corrected_iff _).mpr
  let B := A⁻¹
  have hB : B.IsSymm := hA.1.inv
  have hBu : IsUnit B.det := Matrix.isUnit_nonsing_inv_det A hA.2.2
  have hBd : ∀ a, modTwoEight (B a a) = 0 :=
    map_inverse_diagonal_zero_mod_two modTwoEight A hA.1 hA.2.1 hA.2.2
  have hBi : B⁻¹ = A := Matrix.nonsing_inv_nonsing_inv A hA.2.2
  let q := upperPairSum (fun r s =>
    modTwoEight (A r s) * modTwoEight (B j r) * modTwoEight (B j s))
  let inc := t * A i j * liftFour q
  have hper : ((DetShear.inverseShear A i j t)⁻¹).permanent - B.permanent = inc := by
    rw [InverseShear.inverse_inverseShear A hA.2.2 i j hij t]
    have he := permanent_shear_increment_quadratic B hB hBd hBu i j hij t
    rw [hBi] at he
    simpa only [B, q, inc] using he
  have hdet : (DetShear.Z (DetShear.inverseShear A i j t)).det -
      (DetShear.Z A).det = inc := by
    have he := HalfAdjugate.determinant_shear_increment_quadratic A hA.1 hA.2.1 hA.2.2
      i j hij t
    simpa only [B, hB.apply j, q, inc] using he
  have hscalar : A.det * inc = inc := by
    calc
      _ = (t * A i j) * (A.det * liftFour q) := by dsimp [inc]; ring
      _ = _ := by rw [unit_mul_liftFour A.det hA.2.2]
  have hp := (corrected_iff A).mp hpA
  rw [DetShear.det_inverseShear A i j t hij,
    sub_eq_iff_eq_add.mp hper, mul_add, hp, hscalar]
  exact (sub_eq_iff_eq_add.mp hdet).symm

lemma inverseShear_submatrix {I J : Type} [Fintype I] [DecidableEq I]
    [Fintype J] [DecidableEq J] (A : Matrix J J (ZMod 8)) (e : I ≃ J)
    (i j : J) (t : ZMod 8) :
    (DetShear.inverseShear A i j t).submatrix e e =
      DetShear.inverseShear (A.submatrix e e) (e.symm i) (e.symm j) t := by
  ext a b
  simp only [Matrix.submatrix_apply, DetShear.inverseShear_apply,
    Equiv.apply_symm_apply, e.apply_eq_iff_eq_symm_apply]

lemma corrected_inverseShear (I : Type) [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) (i j : I) (t : ZMod 8) (hij : i ≠ j)
    (hA : BlockInduction.Admissible A) (hpA : Corrected I A) :
    Corrected I (DetShear.inverseShear A i j t) := by
  classical
  cases hc : Fintype.card I with
  | zero =>
    have hp : 0 < Fintype.card I := Fintype.card_pos_iff.mpr ⟨i⟩
    omega
  | succ n =>
    let e : Fin (n + 1) ≃ I := (Fintype.equivFinOfCardEq hc).symm
    have hclass := BlockInduction.admissible_submatrix A e hA
    have hprop := corrected_reindex (Fin (n + 1)) I e A hpA
    have hne : e.symm i ≠ e.symm j := fun he => hij (e.symm.injective he)
    have hfin := corrected_inverseShear_fin (A.submatrix e e)
      (e.symm i) (e.symm j) t hne hclass hprop
    have hback := corrected_reindex I (Fin (n + 1)) e.symm _ hfin
    have he : (DetShear.inverseShear (A.submatrix e e) (e.symm i) (e.symm j) t).submatrix
        e.symm e.symm = DetShear.inverseShear A i j t := by
      rw [← inverseShear_submatrix A e i j t]
      ext a b
      simp
    rwa [he] at hback

lemma corrected_shear (I : Type) [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) (i j : I) (t : ZMod 8) (hij : i ≠ j)
    (hA : BlockInduction.Admissible A) (hpA : Corrected I A) :
    Corrected I (colShear (rowShear A i j t) i j t) := by
  simpa only [DetShear.inverseShear, neg_neg] using
    corrected_inverseShear I A j i (-t) (Ne.symm hij) hA hpA

theorem universal_corrected (I : Type) [Fintype I] [DecidableEq I]
    (A : Matrix I I (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, modTwoEight (A i i) = 0) (hu : IsUnit A.det) :
    A.det * (A⁻¹).permanent = (DetShear.Z A).det := by
  exact (corrected_iff A).mp
    (universal_corrected_of_shear corrected_shear I A ⟨hA, hd, hu⟩)

end InvariantStructure
end OMA.MO513259



/-!
KNOWN BACKGROUND for MO513259 Conjecture2, not a new result or separate count.
Anna Knezevic, Greg Cohen and Marina Domanskaya, Some Facts on Permanents in
Finite Characteristics (2017), https://arxiv.org/abs/1710.01783, p21,
LemmaII.2.5.1 and its immediate full-inverse specialization. The actual primary
text was read. This is an independent finite-F3 signed-sum formalization.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidate awaits pinned checking.
-/

namespace OMA.MO513259.TernaryPermanent

open scoped BigOperators Matrix

variable {I : Type*} [Fintype I] [DecidableEq I]

def P (v : I → ZMod 3) : ZMod 3 := ∏ i, v i

def moment (t : I → I) : ZMod 3 := ∑ v : I → ZMod 3, P v * ∏ i, v (t i)

def S (A : Matrix I I (ZMod 3)) : ZMod 3 :=
  ∑ v : I → ZMod 3, P v * P (A.mulVec v)

def flip (j : I) : (I → ZMod 3) ≃ (I → ZMod 3) where
  toFun v := Function.update v j (-v j)
  invFun v := Function.update v j (-v j)
  left_inv v := by
    funext i
    by_cases hi : i = j <;> simp [hi, Function.update_apply]
  right_inv v := by
    funext i
    by_cases hi : i = j <;> simp [hi, Function.update_apply]

lemma P_flip (j : I) (v : I → ZMod 3) : P (flip j v) = -P v := by
  change (∏ i, Function.update v j (-v j) i) = -(∏ i, v i)
  rw [Finset.prod_update_of_mem (Finset.mem_univ j) v (-v j),
    ← Finset.mul_prod_erase Finset.univ v (Finset.mem_univ j)]
  simp only [Finset.sdiff_singleton_eq_erase] <;> ring

lemma moment_zero_of_not_bijective (t : I → I) (ht : ¬Function.Bijective t) :
    moment t = 0 := by
  classical
  have hmiss : ∃ j, ∀ i, t i ≠ j := by
    by_contra h
    push_neg at h
    exact ht ⟨Finite.injective_iff_surjective.mpr h, h⟩
  obtain ⟨j, hj⟩ := hmiss
  have hterm (v : I → ZMod 3) :
      P (flip j v) * (∏ i, (flip j v) (t i)) = -(P v * ∏ i, v (t i)) := by
    rw [P_flip]
    have hp : (∏ i, (flip j v) (t i)) = ∏ i, v (t i) := by
      apply Finset.prod_congr rfl
      intro i _
      simp [flip, hj i, Function.update_apply]
    rw [hp]
    ring
  have he : moment t = -moment t := by
    calc
      moment t = ∑ v : I → ZMod 3, P (flip j v) * ∏ i, (flip j v) (t i) :=
        ((flip j).sum_comp (fun v => P v * ∏ i, v (t i))).symm
      _ = ∑ v : I → ZMod 3, -(P v * ∏ i, v (t i)) := by
        apply Finset.sum_congr rfl
        intro v _
        exact hterm v
      _ = -moment t := by rw [Finset.sum_neg_distrib]; rfl
  have hz : (2 : ZMod 3) * moment t = 0 := by
    calc
      2 * moment t = moment t + moment t := two_mul _
      _ = moment t + -moment t := congrArg (fun x => moment t + x) he
      _ = 0 := add_neg_cancel _
  exact (mul_eq_zero.mp hz).resolve_left (by decide)

lemma moment_perm (e : Equiv.Perm I) : moment (e : I → I) = (-1 : ZMod 3) ^ Fintype.card I := by
  have hsq : (∑ x : ZMod 3, x ^ 2) = (-1 : ZMod 3) := by decide
  calc
    moment (e : I → I) = ∑ v : I → ZMod 3, ∏ i, (v i) ^ 2 := by
      apply Finset.sum_congr rfl
      intro v _
      rw [Equiv.prod_comp e v]
      simp only [P, ← Finset.prod_mul_distrib, pow_two]
    _ = ∏ _i : I, ∑ x : ZMod 3, x ^ 2 := (Fintype.prod_sum (fun (_ : I) (x : ZMod 3) => x ^ 2)).symm
    _ = _ := by simp [hsq]

lemma sum_functions_eq_sum_permutations (g : (I → I) → ZMod 3)
    (hz : ∀ t, ¬Function.Bijective t → g t = 0) :
    (∑ t : I → I, g t) = ∑ e : Equiv.Perm I, g (e : I → I) := by
  classical
  let e : Equiv.Perm I ≃ {t : I → I // Function.Bijective t} :=
    { toFun := fun p => ⟨p, p.bijective⟩
      invFun := fun t => Equiv.ofBijective t.val t.property
      left_inv := by intro p; apply Equiv.ext; intro i; rfl
      right_inv := by intro t; apply Subtype.ext; rfl }
  have hs := Fintype.sum_subtype_add_sum_subtype (fun t : I → I => Function.Bijective t) g
  have hzero : (∑ t : {t : I → I // ¬Function.Bijective t}, g t.val) = 0 := by
    apply Finset.sum_eq_zero
    intro t _
    exact hz t.val t.property
  rw [hzero, add_zero] at hs
  have he := e.sum_comp (fun t : {t : I → I // Function.Bijective t} => g t.val)
  exact hs.symm.trans he.symm

lemma S_eq_signed_permanent (A : Matrix I I (ZMod 3)) :
    S A = (-1 : ZMod 3) ^ Fintype.card I * A.permanent := by
  classical
  have hexpand (v : I → ZMod 3) :
      P (A.mulVec v) = ∑ t : I → I, ∏ i, A i (t i) * v (t i) := by
    simp only [P, Matrix.mulVec, dotProduct]
    exact Fintype.prod_sum _
  have hper : (∑ e : Equiv.Perm I, ∏ i, A i (e i)) = A.permanent := by
    rw [← Matrix.permanent_transpose]
    rfl
  calc
    S A = ∑ v : I → ZMod 3, P v * (∑ t : I → I, ∏ i, A i (t i) * v (t i)) := by
      unfold S
      simp_rw [hexpand]
    _ = ∑ t : I → I, (∏ i, A i (t i)) * moment t := by
      simp only [Finset.mul_sum]
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro t _
      unfold moment
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro v _
      rw [Finset.prod_mul_distrib]
      ring
    _ = ∑ e : Equiv.Perm I, (∏ i, A i (e i)) * moment (e : I → I) := by
      apply sum_functions_eq_sum_permutations
      intro t ht
      rw [moment_zero_of_not_bijective t ht, mul_zero]
    _ = ∑ e : Equiv.Perm I, (∏ i, A i (e i)) * (-1 : ZMod 3) ^ Fintype.card I := by
      simp_rw [moment_perm]
    _ = (-1 : ZMod 3) ^ Fintype.card I * (∑ e : Equiv.Perm I, ∏ i, A i (e i)) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro e _
      ring
    _ = _ := by rw [hper]

lemma S_eq_inverse (A : Matrix I I (ZMod 3)) (hunit : IsUnit A.det) : S A = S A⁻¹ := by
  classical
  let e : (I → ZMod 3) ≃ (I → ZMod 3) :=
    { toFun := A.mulVec
      invFun := A⁻¹.mulVec
      left_inv := by
        intro v
        rw [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul A hunit, Matrix.one_mulVec]
      right_inv := by
        intro v
        rw [Matrix.mulVec_mulVec, Matrix.mul_nonsing_inv A hunit, Matrix.one_mulVec] }
  calc
    S A = ∑ v : I → ZMod 3, P (A.mulVec v) * P (A⁻¹.mulVec (A.mulVec v)) := by
      apply Finset.sum_congr rfl
      intro v _
      rw [Matrix.mulVec_mulVec, Matrix.nonsing_inv_mul A hunit, Matrix.one_mulVec]
      ring
    _ = S A⁻¹ := e.sum_comp (fun v => P v * P (A⁻¹.mulVec v))

/-- Known2017 background, independently formalized; no extra campaign count. -/
theorem permanent_inverse_mod_three (A : Matrix I I (ZMod 3)) (hunit : IsUnit A.det) :
    (A⁻¹).permanent = A.permanent := by
  have hc : (-1 : ZMod 3) ^ Fintype.card I ≠ 0 := pow_ne_zero _ (by decide)
  apply mul_left_cancel₀ hc
  rw [← S_eq_signed_permanent, ← S_eq_signed_permanent]
  exact (S_eq_inverse A hunit).symm

end OMA.MO513259.TernaryPermanent



/-!
Modulo-four corollary for MO513259 Conjecture2, avoiding a hafnian library.
The universal corrected even-diagonal identity is an EXPLICIT hypothesis of
the final helper and must be discharged by the main congruence proof.
Prerequisites: the parent parity/alternating/inverse helpers, DetShear,
DetFirstOrder, OddHollow and OddHollowEight. No source solve is asserted here.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidate awaits pinned checking.
-/

namespace OMA.MO513259.PermanentModFour

open scoped BigOperators Matrix

variable {I : Type*} [Fintype I] [LinearOrder I]

lemma det_erase_even_diagonal_of_adj_diagonal_zero
    (B : Matrix I I (ZMod 4)) (hd : ∀ i, ∃ d, B i i = 2 * d)
    (hAdj : ∀ i, B.adjugate i i = 0) : (DetShear.Z B).det = B.det := by
  classical
  choose d hdiag using hd
  let D : Matrix I I (ZMod 4) := Matrix.diagonal (fun i => -d i)
  have he : DetShear.Z B = B + (2 : ZMod 4) • D := by
    ext i j
    by_cases hij : i = j
    · subst j
      simp [DetShear.Z, D, hdiag] <;> ring
    · simp [DetShear.Z, D, Matrix.diagonal_apply, hij, Ne.symm hij]
  have hrow (i : I) : (Matrix.updateRow B i (D i)).det = 0 := by
    rw [OddHollow.det_updateRow_eq_cofactor_sum]
    simp [D, Matrix.diagonal_apply, hAdj]
  rw [he, DetFirstOrder.det_add_two_smul]
  simp [hrow]

/-- Conditional only on the explicitly stated universal corrected identity. -/
lemma hollow_permanent_mod_four_of_corrected
    (hCorrected : ∀ B : Matrix I I (ZMod 8), B.IsSymm →
      (∀ i, modTwoEight (B i i) = 0) → IsUnit B.det →
      B.det * (B⁻¹).permanent = (DetShear.Z B).det)
    (A : Matrix I I (ZMod 8)) (hA : A.IsSymm) (hd : ∀ i, A i i = 0)
    (hunit : IsUnit A.det) : OddHollowEight.modFourEight A.permanent = 1 := by
  classical
  let f := OddHollowEight.modFourEight
  let B := A⁻¹
  let C := B.map f
  have hdEven : ∀ i, modTwoEight (A i i) = 0 := by intro i; rw [hd, map_zero]
  have hBsymm : B.IsSymm := hA.inv
  have hBunit : IsUnit B.det := Matrix.isUnit_nonsing_inv_det A hunit
  have hBinv : B⁻¹ = A := Matrix.nonsing_inv_nonsing_inv A hunit
  have hBdiag : ∀ i, modTwoEight (B i i) = 0 :=
    map_inverse_diagonal_zero_mod_two modTwoEight A hA hdEven hunit
  have hAdjB : B.adjugate = B.det • B⁻¹ := by
    calc
      B.adjugate = B⁻¹ * (B * B.adjugate) :=
        (Matrix.nonsing_inv_mul_cancel_left B B.adjugate hBunit).symm
      _ = B⁻¹ * (B.det • (1 : Matrix I I (ZMod 8))) := by rw [Matrix.mul_adjugate]
      _ = B.det • B⁻¹ := by rw [Matrix.mul_smul, Matrix.mul_one]
  have hAdjBdiag : ∀ i, B.adjugate i i = 0 := by
    intro i
    rw [hAdjB, Matrix.smul_apply, hBinv, hd] <;> simp
  have hAdjCdiag : ∀ i, C.adjugate i i = 0 := by
    intro i
    have he := f.map_adjugate B
    change B.adjugate.map f = C.adjugate at he
    have hi := congrFun (congrFun he i) i
    change f (B.adjugate i i) = C.adjugate i i at hi
    rw [hAdjBdiag, map_zero] at hi
    exact hi.symm
  have htwo : f (2 : ZMod 8) = (2 : ZMod 4) := by decide
  have hCdiag : ∀ i, ∃ d, C i i = 2 * d := by
    intro i
    obtain ⟨d, he⟩ := (modTwoEight_zero_iff_two_mul (B i i)).mp (hBdiag i)
    refine ⟨f d, ?_⟩
    change f (B i i) = 2 * f d
    rw [he, map_mul, htwo]
  have hCdet : (DetShear.Z C).det = C.det :=
    det_erase_even_diagonal_of_adj_diagonal_zero C hCdiag hAdjCdiag
  have hZmap : (DetShear.Z B).map f = DetShear.Z C := by
    ext i j
    by_cases hij : i = j <;>
      simp [DetShear.Z, C, Matrix.diagonal_apply, hij, eq_comm, map_sub]
  have hZdet : f (DetShear.Z B).det = f B.det := by
    calc
      _ = ((DetShear.Z B).map f).det := f.map_det _
      _ = (DetShear.Z C).det := congrArg Matrix.det hZmap
      _ = C.det := hCdet
      _ = _ := (f.map_det B).symm
  have hc := congrArg f (hCorrected B hBsymm hBdiag hBunit)
  rw [hBinv, map_mul, hZdet] at hc
  have hu : IsUnit (f B.det) := hBunit.map f
  apply hu.mul_left_cancel
  simpa only [mul_one] using hc

end OMA.MO513259.PermanentModFour



/-!
Assembly of both original graph conjectures in MO513259.
The stronger corrected even-diagonal identity and all three residue components
are proved in the preceding components. The modulo-three background is due to
Anna Knezevic, Greg Cohen and Marina Domanskaya (2017), arXiv:1710.01783.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/
namespace OMA.MO513259
open scoped Matrix BigOperators

variable {I : Type} [Fintype I] [LinearOrder I]

lemma hollow_inverse_permanent_eight (A : Matrix I I (ZMod 8)) (hA : A.IsSymm)
    (hd : ∀ i, A i i = 0) (hu : IsUnit A.det) : (A⁻¹).permanent = 1 := by
  have hEven : ∀ i, modTwoEight (A i i) = 0 := by intro i; rw [hd, map_zero]
  have hZ : DetShear.Z A = A := by
    ext i j
    simp [DetShear.Z, Matrix.sub_apply, Matrix.diagonal_apply, Matrix.diag_apply, hd]
  have h := InvariantStructure.universal_corrected I A hA hEven hu
  rw [hZ] at h
  apply hu.mul_left_cancel
  simpa only [mul_one] using h

lemma modFourEight_modEightTwentyFour (x : ZMod 24) :
    OddHollowEight.modFourEight (modEightTwentyFour x) = modFourTwentyFour x := by
  fin_cases x <;> decide

lemma hollow_graph_congruence_twenty_four (A : Matrix I I (ZMod 24))
    (hA : A.IsSymm) (hd : ∀ i, A i i = 0) (hu : IsUnit A.det) :
    2 * A.permanent + (A⁻¹).permanent - 3 = 0 := by
  have hSym {m : ℕ} (f : ZMod 24 →+* ZMod m) : (A.map f).IsSymm := by
    apply Matrix.IsSymm.ext
    intro i j
    exact congrArg f (hA.apply i j)
  have hDiag {m : ℕ} (f : ZMod 24 →+* ZMod m) : ∀ i, (A.map f) i i = 0 := by
    intro i
    simp only [Matrix.map_apply, hd, map_zero]
  have hUnit {m : ℕ} (f : ZMod 24 →+* ZMod m) : IsUnit (A.map f).det := by
    have he := f.map_det A
    change f A.det = (A.map f).det at he
    rw [← he]
    exact hu.map f
  apply mod_twenty_four_of_three_component_facts A hu
  · exact hollow_inverse_permanent_eight (A.map modEightTwentyFour)
      (hSym _) (hDiag _) (hUnit _)
  · have h4 := PermanentModFour.hollow_permanent_mod_four_of_corrected
      (fun B hB hdB huB => InvariantStructure.universal_corrected I B hB hdB huB)
      (A.map modEightTwentyFour) (hSym _) (hDiag _) (hUnit _)
    rw [map_permanent] at h4
    have hm : (A.map modEightTwentyFour).map OddHollowEight.modFourEight =
        A.map modFourTwentyFour := by
      ext i j
      exact modFourEight_modEightTwentyFour (A i j)
    rwa [hm] at h4
  · exact TernaryPermanent.permanent_inverse_mod_three
      (A.map modThreeTwentyFour) (hUnit _)

end OMA.MO513259

theorem OMA.solution : type_of% @OMA.S_mo_513259.main := by
  constructor
  · intro n A hA hu
    exact OMA.MO513259.hollow_inverse_permanent_eight A hA.1 hA.2.1 hu
  · intro n A hA hu
    exact OMA.MO513259.hollow_graph_congruence_twenty_four A hA.1 hA.2.1 hu

