import OMAStatements.S_mo_198816

-- Source: vansy, MathOverflow198816, CC BY-SA3.0.
-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- Joint scouting/combinatorics certificate; exact smaller-rational variant.

noncomputable section
open scoped BigOperators Matrix


namespace OMA.MO198816Witness

/- Strictly positive perturbation of the lazy chain into a sink. -/
def P : Matrix (Fin 13) (Fin 13) ℝ := fun i j =>
  1 / 260000 + (if i.val = j.val then 1 / 2 else 0) +
    (if i.val = min (j.val + 1) 12 then 9999 / 20000 else 0)

/- Positive rational probability vector, independently checked exactly. -/
def w : Fin 13 → ℝ := ![
  20608487633771132747/23404066337684849000,
  36401387099591457/11702033168842424500,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  1/1000,
  2488735266337684849/23404066337684849000]

/- Rational complex eigenvalue outside the unit disk. -/
def lam : ℂ := ⟨183241/186500, 69993/373000⟩

/- The scalar 1/lam-1, written without a division of complex numbers. -/
def c : ℂ := ⟨-6730001/373212001, -69993000/373212001⟩

/- Exact rational complex eigenvector. -/
def v : Fin 13 → ℂ := ![
  ⟨305911991/3732120010, 1212624007/7464240020⟩,
  ⟨1758379989/5971392016, 16513056063/37321200100⟩,
  ⟨871401282407/1492848004000, 1851378738461/2985696008000⟩,
  ⟨54113417335879/59713920160000, 202641516693/298569600800⟩,
  ⟨726703017708011/597139201600000, 738777618743647/1194278403200000⟩,
  ⟨1409843198747757/955422722560000, 2721349122368373/5971392016000000⟩,
  ⟨394446887431402547/238855680640000000, 104439409029665381/477711361280000000⟩,
  ⟨16496495010738149359/9554227225600000000, -1344626053764147/23885568064000000⟩,
  ⟨162239290621373538431/95542272256000000000, -63066839862268903913/191084544512000000000⟩,
  ⟨48202232506668520449/30573527121920000000, -541188632555017452117/955422722560000000000⟩,
  ⟨52912195514231841175487/38216908902400000000000, -56306561867296211945299/76433817804800000000000⟩,
  ⟨1761146097441272798700439/1528676356096000000000000, -6287846942052887957361/7643381780480000000000⟩,
  ⟨-1502214007574819041305919/1528676356096000000000000, -238672576428189323706531/76433817804800000000000⟩]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma Ppos : ∀ i j, 0 < P i j := by
  intro i j
  dsimp [P]
  split_ifs <;> norm_num

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma Pcolsum : ∀ j, ∑ i, P i j = 1 := by
  intro j
  fin_cases j <;> norm_num [P, Fin.sum_univ_succ]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma ProwDD : ∀ i, (∑ j ∈ Finset.univ.erase i, |P i j|) ≤ |P i i| := by
  intro i
  have habs : ∀ a b, |P a b| = P a b := fun a b => abs_of_pos (Ppos a b)
  simp_rw [habs]
  rw [Finset.sum_erase_eq_sub (Finset.mem_univ i)]
  fin_cases i <;> norm_num [P, Fin.sum_univ_succ]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma PcolDD : ∀ j, (∑ i ∈ Finset.univ.erase j, |P i j|) ≤ |P j j| := by
  intro j
  have habs : ∀ a b, |P a b| = P a b := fun a b => abs_of_pos (Ppos a b)
  simp_rw [habs]
  rw [Finset.sum_erase_eq_sub (Finset.mem_univ j), Pcolsum]
  fin_cases j <;> norm_num [P]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma wpos : ∀ i, 0 < w i := by
  intro i
  fin_cases i <;> norm_num [w]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma wsum : ∑ i, w i = 1 := by
  norm_num [w, Fin.sum_univ_succ]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma vne : v ≠ 0 := by
  intro hv
  have h := congrArg Complex.im (congrFun hv (0 : Fin 13))
  norm_num [v] at h

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma lam_normSq : Complex.normSq lam = 373212001 / 373000000 := by
  norm_num [lam, Complex.normSq_apply]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma one_lt_norm_lam : 1 < ‖lam‖ := by
  have h : 1 < Complex.normSq lam := by rw [lam_normSq]; norm_num
  rw [Complex.normSq_eq_norm_sq] at h
  have hnonneg := norm_nonneg lam
  nlinarith

/- Exact weighted mean of the eigenvector. -/
set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma w_dot_v : ∑ j, (w j : ℂ) * v j = c := by
  apply Complex.ext <;>
    norm_num [w, v, c, Fin.sum_univ_succ, Complex.mul_re, Complex.mul_im]

/- Finite rational matrix/vector identity; no numerical approximation. -/
set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma P_mul_v : ∀ i,
    (∑ j, (P i j : ℂ) * v j) = lam * v i + ((∑ k, P i k : ℝ) : ℂ) * c := by
  intro i
  fin_cases i <;> apply Complex.ext <;>
    norm_num [P, v, lam, c, Fin.sum_univ_succ, Complex.mul_re, Complex.mul_im]

set_option maxRecDepth 4096 in
set_option maxHeartbeats 0 in
lemma eig :
    (Matrix.map (fun i j => P i j - (∑ k, P i k) * w j : Matrix (Fin 13) (Fin 13) ℝ) Complex.ofReal) *ᵥ v = lam • v := by
  funext i
  change (∑ j, ((P i j - (∑ k, P i k) * w j : ℝ) : ℂ) * v j) = lam * v i
  calc
    (∑ j, ((P i j - (∑ k, P i k) * w j : ℝ) : ℂ) * v j) =
        (∑ j, (P i j : ℂ) * v j) -
          ((∑ k, P i k : ℝ) : ℂ) * (∑ j, (w j : ℂ) * v j) := by
      simp [Complex.ofReal_sub, Complex.ofReal_mul, sub_mul,
        Finset.sum_sub_distrib, Finset.mul_sum, mul_assoc]
    _ = lam * v i := by
      rw [w_dot_v, P_mul_v]
      ring

end OMA.MO198816Witness

-- This body is appended after the concrete witness definitions in the one-file disproof.
open scoped BigOperators Matrix

namespace OMA.MO198816Witness

lemma irreducible : P.IsIrreducible := by
  apply (Matrix.isIrreducible_iff_exists_pow_pos
    (fun i j => le_of_lt (Ppos i j))).2
  intro i j
  exact ⟨1, by norm_num, by simpa using Ppos i j⟩

lemma lam_mem_spectrum :
    lam ∈ spectrum ℂ ((OMA.S_mo_198816.perturbation P w).map Complex.ofReal) := by
  let M := (OMA.S_mo_198816.perturbation P w).map Complex.ofReal
  have heig : M *ᵥ v = lam • v := by
    dsimp only [M, OMA.S_mo_198816.perturbation]
    exact eig
  have hevec : Module.End.HasEigenvector M.toLin' lam v := by
    apply Module.End.hasEigenvector_iff.mpr
    refine ⟨Module.End.mem_eigenspace_iff.mpr ?_, vne⟩
    simpa only [Matrix.toLin'_apply] using heig
  have hmem := (Module.End.hasEigenvalue_of_hasEigenvector hevec).mem_spectrum
  simpa only [Matrix.spectrum_toLin'] using hmem

lemma lam_norm_gt_one : 1 < ‖lam‖ := by
  have hsq : 1 < Complex.normSq lam := by
    norm_num [lam, Complex.normSq_apply]
  rw [Complex.normSq_eq_norm_sq] at hsq
  nlinarith [norm_nonneg lam]

end OMA.MO198816Witness

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_198816.main) := by
  intro h
  have hradius := h 13 (by norm_num) OMA.MO198816Witness.P
    OMA.MO198816Witness.irreducible OMA.MO198816Witness.Pcolsum
    OMA.MO198816Witness.ProwDD OMA.MO198816Witness.w
    OMA.MO198816Witness.wpos OMA.MO198816Witness.wsum
  have hnn : (1 : NNReal) < ‖OMA.MO198816Witness.lam‖₊ := by
    exact_mod_cast OMA.MO198816Witness.lam_norm_gt_one
  have hnorm : (1 : ENNReal) <
      (‖OMA.MO198816Witness.lam‖₊ : ENNReal) := by
    exact_mod_cast hnn
  have hbound : (‖OMA.MO198816Witness.lam‖₊ : ENNReal) ≤
      spectralRadius ℂ ((OMA.S_mo_198816.perturbation
        OMA.MO198816Witness.P OMA.MO198816Witness.w).map Complex.ofReal) := by
    unfold spectralRadius
    exact le_iSup₂ (α := ENNReal) OMA.MO198816Witness.lam OMA.MO198816Witness.lam_mem_spectrum
  exact (not_lt_of_ge (le_trans (le_of_lt hnorm) hbound)) hradius
