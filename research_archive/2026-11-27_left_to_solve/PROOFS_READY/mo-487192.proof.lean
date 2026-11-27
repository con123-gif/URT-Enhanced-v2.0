import OMAStatements.S_mo_487192
import Mathlib

noncomputable section

-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- GPT-6; exact serving variant not exposed.
-- Question 3 only: a symmetric, invertible 3-by-3 complex counterexample.

namespace MO487192Certificate

lemma central_square_zero_eq_zero {R : Type*} [Ring R] [IsSemisimpleRing R]
    (x : R) (hcentral : ∀ r : R, x * r = r * x) (hsq : x * x = 0) : x = 0 := by
  obtain ⟨e, he, hI⟩ := IsSemisimpleRing.ideal_eq_span_idempotent
    (Ideal.span ({x} : Set R))
  have hemem : e ∈ Ideal.span ({x} : Set R) := by
    rw [hI]
    exact Ideal.mem_span_singleton_self e
  obtain ⟨t, ht⟩ := Ideal.mem_span_singleton'.mp hemem
  have hesq : e * e = 0 := by
    rw [← ht]
    calc
      (t * x) * (t * x) = t * (x * t) * x := by noncomm_ring
      _ = t * (t * x) * x := by rw [hcentral t]
      _ = (t * t) * (x * x) := by noncomm_ring
      _ = 0 := by rw [hsq, mul_zero]
  have hezero : e = 0 := (show e * e = e from he).symm.trans hesq
  have hxmem : x ∈ Ideal.span ({x} : Set R) := Ideal.mem_span_singleton_self x
  rw [hI, hezero] at hxmem
  simpa using hxmem

abbrev Mat := Matrix (Fin 3) (Fin 3) ℂ

def N : Mat := !![Complex.I, 1, 0; 1, -Complex.I, 0; 0, 0, 0]

def A : Mat := 1 + N

lemma N_square : N * N = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [N, Matrix.mul_apply, Fin.sum_univ_succ]

lemma N_transpose : N.transpose = N := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

lemma A_transpose : A.transpose = A := by
  simp [A, N_transpose]

lemma A_isUnit : IsUnit A := by
  refine ⟨{ val := A, inv := 1 - N, val_inv := ?_, inv_val := ?_ }, rfl⟩
  · calc
      A * (1 - N) = 1 - N * N := by dsimp [A]; noncomm_ring
      _ = 1 := by rw [N_square]; simp
  · calc
      (1 - N) * A = 1 - N * N := by dsimp [A]; noncomm_ring
      _ = 1 := by rw [N_square]; simp

abbrev R := OMA.S_mo_487192.jointCentralizer ℂ A

noncomputable def nilpotentElement : R := ⟨N, by
  apply (Subalgebra.mem_centralizer_iff ℂ).mpr
  intro g hg
  have hgA : g = A := by simpa [A_transpose] using hg
  subst g
  dsimp [A]
  noncomm_ring⟩

lemma nilpotentElement_square : nilpotentElement * nilpotentElement = 0 := by
  apply Subtype.ext
  exact N_square

lemma nilpotentElement_nonzero : nilpotentElement ≠ 0 := by
  intro h
  have hN : N = 0 := congrArg (fun x : R => (x : Mat)) h
  have h01 := congrArg (fun M : Mat => M 0 1) hN
  norm_num [N] at h01

lemma nilpotentElement_central (x : R) :
    nilpotentElement * x = x * nilpotentElement := by
  apply Subtype.ext
  have hx := (Subalgebra.mem_centralizer_iff ℂ).mp x.property A (by simp)
  change A * (x : Mat) = (x : Mat) * A at hx
  change N * (x : Mat) = (x : Mat) * N
  simpa only [A, add_mul, mul_add, one_mul, mul_one, add_left_cancel_iff] using hx

lemma not_semisimple : ¬ IsSemisimpleRing R := by
  intro h
  letI : IsSemisimpleRing R := h
  exact nilpotentElement_nonzero (central_square_zero_eq_zero nilpotentElement
    nilpotentElement_central nilpotentElement_square)

end MO487192Certificate

theorem OMA.disproof : ¬ (type_of% @OMA.S_mo_487192.main) := by
  intro h
  exact MO487192Certificate.not_semisimple
    (h.2.2 ℂ 3 (by decide) MO487192Certificate.A MO487192Certificate.A_isUnit)
