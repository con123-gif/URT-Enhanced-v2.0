import OMAStatements.S_oeis_a337945
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Standard squarefree divisibility and explicit integer constructions.

namespace A337945Certificate
open OMA.S_oeis_a337945

lemma obstruction (m : ℕ) (h : represented m) :
    ¬ (Odd m ∧ Squarefree m) := by
  rintro ⟨hodd, hsq⟩
  obtain ⟨s, t, k, hs, hst, hk, hkm, hsum, heq⟩ := h
  have hsumZ : (s : ℤ) + (t : ℤ) = (m : ℤ) := by exact_mod_cast hsum
  have heqZ : (s : ℤ) ^ 2 + (t : ℤ) ^ 2 = (k : ℤ) * (m : ℤ) := by
    exact_mod_cast heq
  have hdivZ : (m : ℤ) ∣ 2 * (s : ℤ) ^ 2 := by
    refine ⟨(k : ℤ) + (s : ℤ) - (t : ℤ), ?_⟩
    rw [← hsumZ] at heqZ ⊢
    nlinarith
  have hdiv : m ∣ 2 * s ^ 2 := by exact_mod_cast hdivZ
  have hcop : Nat.Coprime m 2 := by simpa using hodd
  have hsqdiv : m ∣ s ^ 2 := hcop.dvd_of_dvd_mul_left hdiv
  have hsdiv : m ∣ s := (hsq.dvd_pow_iff_dvd (by decide : (2 : ℕ) ≠ 0)).mp hsqdiv
  exact (Nat.not_dvd_of_pos_of_lt (by omega : 0 < s) (by omega : s < m)) hsdiv

lemma even_construction (m : ℕ) (hm : 0 < m) (heven : Even m) :
    represented m := by
  obtain ⟨d, rfl⟩ := heven
  refine ⟨d, d, d, by omega, by omega, by omega, by omega, rfl, ?_⟩
  ring

lemma square_construction (u d : ℕ) (hd : 0 < d) :
    represented ((u + 2) * (u + 2) * d) := by
  have hbound : d * (1 + (u + 1) ^ 2) < (u + 2) * (u + 2) * d := by
    nlinarith [Nat.zero_le (d * u)]
  refine ⟨(u + 2) * d, (u + 2) * d * (u + 1), d * (1 + (u + 1) ^ 2),
    ?_, ?_, ?_, ?_, ?_, ?_⟩
  · have : 0 < (u + 2) * d := by positivity
    omega
  · nlinarith [Nat.zero_le ((u + 2) * d * u)]
  · have : 0 < d * (1 + (u + 1) ^ 2) := by positivity
    omega
  · omega
  · ring
  · ring

lemma nonsquarefree_construction (m : ℕ) (hm : 0 < m) (hsq : ¬ Squarefree m) :
    represented m := by
  rw [Nat.squarefree_iff_prime_squarefree] at hsq
  push_neg at hsq
  obtain ⟨p, hp, d, hd⟩ := hsq
  have hdpos : 0 < d := by
    by_contra h
    have hd0 : d = 0 := by omega
    rw [hd0] at hd
    norm_num at hd
    omega
  obtain ⟨u, hu⟩ : ∃ u : ℕ, p = u + 2 := ⟨p - 2, by have := hp.two_le; omega⟩
  rw [hd, hu]
  exact square_construction u d hdpos

lemma complete (m : ℕ) (hm : 0 < m) (h : ¬ (Odd m ∧ Squarefree m)) :
    represented m := by
  rcases Nat.even_or_odd m with heven | hodd
  · exact even_construction m hm heven
  · exact nonsquarefree_construction m hm (fun hsq => h ⟨hodd, hsq⟩)

end A337945Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a337945.main := by
  intro m hm
  exact ⟨A337945Certificate.obstruction m, A337945Certificate.complete m hm⟩
