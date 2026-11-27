Formalize the full original OEIS A068991 conjecture. A complete pinned-kernel-verified proof is supplied below for the subsequent proof stage.

Agent: Codex, assisted by ChatGPT
Model: GPT-6 (exact serving variant not exposed)
Owner/credit: Cornelius Lytollis (@con123-gif).

Exact source: https://oeis.org/A068991 , current revision35; full entry and all35 historical changes/discussions read. For EVERY positive squarefree n, if sum_{d|n}sigma(d)/phi(d) is an integer, n divides the denominator of B_(2n). The source history explicitly clarifies that "contains n" means "divisible by n". The statement retains the ORIGINAL rational divisor sum and Bernoulli denominator. It does not replace the target by a reformulated totient condition. The separate later question about recursive search is not the selected catalogue claim.

Complete proof: squarefreeness and multiplicativity rewrite the divisor sum as 2^omega(n)*n/phi(n), so integrality forces phi(n)|2^omega(n)*n. Odd valuations give squarefree predecessor odd-parts supported on n. The two-adic budget excludes any predecessor with valuation>=3 using the least support prime>7 and a fully kernel-checked finite divisor classification. Therefore p-1 divides2n for every prime p|n, and classical von Staudt-Clausen gives the ORIGINAL denominator divisibility. All parity cases, p2 and n1 are covered.

Actual FULL pinned verification: https://github.com/con123-gif/open-math-agents/actions/runs/46067781887 , job140737180507, immutable commit91d229e3cd1dcbcca0fc684fd93743067701a7f5,21:05:30UTC November27,2026. OMA.solution axioms are EXACTLY propext, Classical.choice and Quot.sound. Actual compiler exit0 is recorded in artifact15230903891, whose ZIP SHA25647e220694173fc6d58b062417140417ffb5642b7672b7f6bcee77d7c5441a206 matches GitHub. No compiler error in any form occurs. An independent collaborating AI reviewer downloaded and verified the artifact, exit0, exact immutable public probe bytes, faithful source prefix and entire clean proof body. Official unmodified statement checker separately accepted run46066060267/job140731536796. This PR registers the statement; a separate imported-target proof PR follows after the definition actually merges. Fork verification is not an official acceptance.

Prior mathematics is credited: classical multiplicativity and von Staudt-Clausen; Kellner2005's full two-page note and Reble2018's full four-page note supply related prime-support methods, not this inspected sigma/phi implication. Those methods are not claimed new. Full related A106741/A099008/A014117 entries were read. Proper all-state upstream exact-ID PR search and recent100 direct collection, actual TrureTuring repository code, complete Eppie62-text-file archive, both search engines and global Lean exact-ID search found no exact earlier settlement within checked scope (the single global Lean hit was verified incidental hex). This does not establish universal absence or historical priority.

Explicit prior-audit LIMITATION: the related Victor Miller2012 NMBRTHRY email could not be read: direct HTTP and HTTPS return503, web retrieval fails and the WaybackCDX query returned[]. It remains an unread reference, not an asserted negative finding. Collaborating AI runtime and algebra/review agents developed/challenged the proof; no human reviewer is claimed.

Frozen source SHA256:3d57c86dc80ab0ffdf3a012182ad8d2963db5e0a17b88775719a683fb088b76a
Frozen proof SHA256:874ace929fd11249784a314383812d296d09066c255b0441b353eba0207f1878

Complete checked proof for the registered target after merge:

```lean
import OMAStatements.S_oeis_a068991

/-!
Full A068991 certificate: the ORIGINAL integral sum of sigma(d)/phi(d),
under squarefreeness, implies divisibility of the ORIGINAL Bernoulli denominator.
Classical von Staudt-Clausen is supplied by Mathlib. The finite prime-support
method is credited to the background of Kellner2005 and Reble2018; no new
method or historical priority is claimed. Related Miller2012 email was
inaccessible (HTTP/HTTPS503); this remains an explicit prior-audit limitation.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact
serving variant not exposed). Collaborating AI runtime supplied the Bernoulli
denominator bridge; collaborating AI agents independently reviewed the argument.
-/

open scoped BigOperators

namespace A068991Certificate

noncomputable def sigmaPhi : ArithmeticFunction ℚ :=
  ⟨fun n => (ArithmeticFunction.sigma 1 n : ℚ) / (Nat.totient n : ℚ), by simp⟩

theorem sigmaPhi_multiplicative : ArithmeticFunction.IsMultiplicative sigmaPhi := by
  constructor
  · norm_num [sigmaPhi]
  · intro m n hmn
    change (ArithmeticFunction.sigma 1 (m * n) : ℚ) / (Nat.totient (m * n) : ℚ) = _
    rw [ArithmeticFunction.isMultiplicative_sigma.map_mul_of_coprime hmn,
      Nat.totient_mul hmn]
    simp only [Nat.cast_mul]
    exact (div_mul_div_comm _ _ _ _).symm

theorem totient_product {n : ℕ} (hs : Squarefree n) :
    Nat.totient n = ∏ p ∈ n.primeFactors, (p - 1) := by
  rw [Nat.totient_eq_prod_factorization hs.ne_zero,
    Nat.prod_factorization_eq_prod_primeFactors]
  apply Finset.prod_congr rfl
  intro p hp
  rw [Nat.factorization_eq_one_of_squarefree hs
    (Nat.prime_of_mem_primeFactors hp) (Nat.dvd_of_mem_primeFactors hp)]
  simp

theorem divisor_sum_eq {n : ℕ} (hs : Squarefree n) :
    (∑ d ∈ n.divisors, (ArithmeticFunction.sigma 1 d : ℚ) / (Nat.totient d : ℚ)) =
      (2 : ℚ) ^ n.primeFactors.card * (n : ℚ) / (Nat.totient n : ℚ) := by
  classical
  have hz : ArithmeticFunction.IsMultiplicative
      (ArithmeticFunction.zeta : ArithmeticFunction ℚ) :=
    ArithmeticFunction.isMultiplicative_zeta.natCast
  have hexpand := hz.prodPrimeFactors_add_of_squarefree sigmaPhi_multiplicative hs
  rw [ArithmeticFunction.prodPrimeFactors_apply hs.ne_zero,
    ArithmeticFunction.coe_zeta_mul_apply] at hexpand
  have h₁ : ∑ d ∈ n.divisors,
      (ArithmeticFunction.sigma 1 d : ℚ) / (Nat.totient d : ℚ) =
      ∏ p ∈ n.primeFactors, (2 : ℚ) * (p : ℚ) / ((p - 1 : ℕ) : ℚ) := by
    change (∑ d ∈ n.divisors, sigmaPhi d) = _
    rw [← hexpand]
    apply Finset.prod_congr rfl
    intro p hp
    have hprime : p.Prime := Nat.prime_of_mem_primeFactors hp
    have hp2 : 2 ≤ p := hprime.two_le
    have hσ : ArithmeticFunction.sigma 1 p = p + 1 := by
      rw [ArithmeticFunction.sigma_apply, hprime.divisors]
      simp only [pow_one]
      change (∑ x ∈ ({1, p} : Finset ℕ), x) = p + 1
      rw [Finset.sum_pair (by omega : (1 : ℕ) ≠ p)]
      omega
    have hpcast : ((p - 1 : ℕ) : ℚ) = (p : ℚ) - 1 := Nat.cast_sub hprime.one_le
    have hd : (p : ℚ) - 1 ≠ 0 := by
      have hp2Q : (2 : ℚ) ≤ p := by exact_mod_cast hp2
      linarith
    change (ArithmeticFunction.zeta p : ℚ) +
      (ArithmeticFunction.sigma 1 p : ℚ) / (Nat.totient p : ℚ) = _
    rw [ArithmeticFunction.zeta_apply_ne hprime.ne_zero, hσ, Nat.totient_prime hprime]
    simp only [Nat.cast_add, Nat.cast_one, hpcast]
    field_simp [hd] <;> ring
  have hP : (∏ p ∈ n.primeFactors, (p : ℚ)) = (n : ℚ) := by
    simpa only [Nat.cast_prod] using
      congrArg (fun m : ℕ => (m : ℚ)) (Nat.prod_primeFactors_of_squarefree hs)
  have hT : (∏ p ∈ n.primeFactors, ((p - 1 : ℕ) : ℚ)) = (Nat.totient n : ℚ) := by
    exact_mod_cast (totient_product hs).symm
  rw [h₁, Finset.prod_div_distrib, Finset.prod_mul_distrib, Finset.prod_const, hP, hT]

theorem integral_implies_totient_dvd {n : ℕ} (hs : Squarefree n)
    (hz : ∃ z : ℤ, (z : ℚ) =
      ∑ d ∈ n.divisors, (ArithmeticFunction.sigma 1 d : ℚ) / (Nat.totient d : ℚ)) :
    Nat.totient n ∣ 2 ^ n.primeFactors.card * n := by
  obtain ⟨z, hz⟩ := hz
  rw [divisor_sum_eq hs] at hz
  have ht : (Nat.totient n : ℚ) ≠ 0 := by
    exact_mod_cast (Nat.totient_pos.mpr (Nat.pos_of_ne_zero hs.ne_zero)).ne'
  have heq : (2 : ℚ) ^ n.primeFactors.card * (n : ℚ) =
      (Nat.totient n : ℚ) * (z : ℚ) := by
    have h := (eq_div_iff ht).mp hz
    nlinarith
  have hdiv : (Nat.totient n : ℤ) ∣ ((2 ^ n.primeFactors.card * n : ℕ) : ℤ) := by
    refine ⟨z, ?_⟩
    exact_mod_cast heq
  exact_mod_cast hdiv

end A068991Certificate


open scoped BigOperators

namespace A068991Certificate

theorem pair_le_sum {S : Finset ℕ} {g : ℕ → ℕ} {a b : ℕ}
    (ha : a ∈ S) (hb : b ∈ S) (hab : a ≠ b) :
    g a + g b ≤ ∑ x ∈ S, g x := by
  classical
  have hsub : ({a, b} : Finset ℕ) ⊆ S := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact ha
    · exact (Finset.mem_singleton.mp hx).symm ▸ hb
  have h := Finset.sum_le_sum_of_subset (f := g) hsub
  simpa only [Finset.sum_pair hab] using h

theorem excess_unique {S : Finset ℕ} {g : ℕ → ℕ} {a : ℕ}
    (ha : a ∈ S) (ha2 : 2 ≤ g a) (hbudget : (∑ x ∈ S, g x) ≤ 2) :
    g a = 2 ∧ ∀ b ∈ S, b ≠ a → g b = 0 := by
  have hsingle : g a ≤ ∑ x ∈ S, g x :=
    Finset.single_le_sum (fun _ _ => Nat.zero_le _) ha
  constructor
  · omega
  · intro b hb hba
    have hp := pair_le_sum (g := g) ha hb hba.symm
    omega

set_option maxRecDepth 10000 in
set_option maxHeartbeats 1000000 in
theorem finite_predecessor_check : ∀ q : Fin 170,
    q.val.Prime → (q.val - 1) ∣ 168 →
      ((2 ∣ q.val - 1 ∧ ¬4 ∣ q.val - 1) ∨ 8 ∣ q.val - 1) →
        q.val = 3 ∨ q.val = 7 ∨ q.val = 43 := by
  decide

theorem three_le_factorization_two_implies_gt_seven {q : ℕ}
    (hq : 2 ≤ q) (hv : 3 ≤ (q - 1).factorization 2) : 7 < q := by
  have hq0 : q - 1 ≠ 0 := by omega
  have hd : 8 ∣ q - 1 := by
    simpa using (Nat.prime_two.pow_dvd_iff_le_factorization hq0).mpr hv
  have h8 : 8 ≤ q - 1 := Nat.le_of_dvd (by omega) hd
  omega

theorem finite_small_prime_check : ∀ q : Fin 8,
    q.val.Prime → q.val ≠ 2 → q.val ≠ 5 → q.val = 3 ∨ q.val = 7 := by
  decide

end A068991Certificate


/- Assemble after the squarefree product-reduction helper. -/

open scoped BigOperators

namespace A068991Certificate

theorem totient_factorization_sum {n : ℕ} (hs : Squarefree n) (ell : ℕ) :
    (Nat.totient n).factorization ell =
      ∑ p ∈ n.primeFactors, (p - 1).factorization ell := by
  rw [totient_product hs]
  apply Nat.factorization_prod_apply
  intro p hp
  have hp2 := (Nat.prime_of_mem_primeFactors hp).two_le
  omega

theorem valuation_sum_bound {n : ℕ} (hs : Squarefree n)
    (hdiv : Nat.totient n ∣ 2 ^ n.primeFactors.card * n) (ell : ℕ) :
    (∑ p ∈ n.primeFactors, (p - 1).factorization ell) ≤
      (if ell = 2 then n.primeFactors.card else 0) + n.factorization ell := by
  have ht0 : Nat.totient n ≠ 0 :=
    (Nat.totient_pos.mpr (Nat.pos_of_ne_zero hs.ne_zero)).ne'
  have hb0 : 2 ^ n.primeFactors.card * n ≠ 0 := mul_ne_zero (by positivity) hs.ne_zero
  have h := (Nat.factorization_le_iff_dvd ht0 hb0).mpr hdiv ell
  rw [totient_factorization_sum hs] at h
  have hR : (2 ^ n.primeFactors.card * n).factorization ell =
      (if ell = 2 then n.primeFactors.card else 0) + n.factorization ell := by
    rw [Nat.factorization_mul (by positivity : 2 ^ n.primeFactors.card ≠ 0) hs.ne_zero,
      Nat.prime_two.factorization_pow]
    simp only [Finsupp.add_apply, Finsupp.single_apply, eq_comm]
  simpa only [hR] using h

theorem predecessor_odd_valuation_le {n p ell : ℕ} (hs : Squarefree n)
    (hdiv : Nat.totient n ∣ 2 ^ n.primeFactors.card * n)
    (hp : p ∈ n.primeFactors) (hell : ell ≠ 2) :
    (p - 1).factorization ell ≤ n.factorization ell := by
  have hterm : (p - 1).factorization ell ≤
      ∑ q ∈ n.primeFactors, (q - 1).factorization ell :=
    Finset.single_le_sum (f := fun q : ℕ => (q - 1).factorization ell)
      (fun _ _ => Nat.zero_le _) hp
  have htotal : (∑ q ∈ n.primeFactors, (q - 1).factorization ell) ≤
      n.factorization ell := by
    simpa only [if_neg hell, zero_add] using (valuation_sum_bound hs hdiv ell)
  exact hterm.trans htotal

theorem predecessor_odd_factor_mem {n p ell : ℕ} (hs : Squarefree n)
    (hdiv : Nat.totient n ∣ 2 ^ n.primeFactors.card * n)
    (hp : p ∈ n.primeFactors) (hell : ell.Prime) (hell2 : ell ≠ 2)
    (hd : ell ∣ p - 1) : ell ∈ n.primeFactors := by
  have hp2 := (Nat.prime_of_mem_primeFactors hp).two_le
  have hpred0 : p - 1 ≠ 0 := by omega
  have hpos : 1 ≤ (p - 1).factorization ell :=
    (hell.dvd_iff_one_le_factorization hpred0).mp hd
  have hnpos : 1 ≤ n.factorization ell :=
    hpos.trans (predecessor_odd_valuation_le hs hdiv hp hell2)
  exact Nat.mem_primeFactors.mpr
    ⟨hell, (hell.dvd_iff_one_le_factorization hs.ne_zero).mpr hnpos, hs.ne_zero⟩

theorem predecessor_two_pos {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2) :
    1 ≤ (p - 1).factorization 2 := by
  have hpge := hp.two_le
  exact (Nat.prime_two.dvd_iff_one_le_factorization (by omega : p - 1 ≠ 0)).mp
    (even_iff_two_dvd.mp (hp.even_sub_one hp2))

theorem odd_excess_sum_le {n : ℕ} (hs : Squarefree n)
    (hdiv : Nat.totient n ∣ 2 ^ n.primeFactors.card * n) :
    (∑ p ∈ n.primeFactors.erase 2, ((p - 1).factorization 2 - 1)) ≤
      2 * n.factorization 2 := by
  classical
  let P := n.primeFactors
  let O := P.erase 2
  let f : ℕ → ℕ := fun p => (p - 1).factorization 2
  have hsum : (∑ p ∈ P, f p) = ∑ p ∈ O, f p := by
    by_cases h2 : 2 ∈ P
    · have h := Finset.sum_erase_add P f h2
      simpa [O, f] using h.symm
    · simp [O, Finset.erase_eq_of_notMem h2]
  have hcard : P.card = O.card + n.factorization 2 := by
    by_cases h2 : 2 ∈ P
    · have hf : n.factorization 2 = 1 := Nat.factorization_eq_one_of_squarefree hs
        Nat.prime_two (Nat.dvd_of_mem_primeFactors h2)
      have hc := Finset.card_erase_of_mem h2
      have hp : 0 < P.card := Finset.card_pos.mpr ⟨2, h2⟩
      dsimp [O]
      rw [hc, hf]
      omega
    · have hd : ¬2 ∣ n := by
        intro hd
        exact h2 (Nat.mem_primeFactors.mpr ⟨Nat.prime_two, hd, hs.ne_zero⟩)
      simp [O, Finset.erase_eq_of_notMem h2, Nat.factorization_eq_zero_of_not_dvd hd]
  have hpositive : ∀ p ∈ O, 1 ≤ f p := by
    intro p hp
    obtain ⟨hp2, hpP⟩ := Finset.mem_erase.mp hp
    exact predecessor_two_pos (Nat.prime_of_mem_primeFactors hpP) hp2
  have hsplit : (∑ p ∈ O, f p) = O.card + ∑ p ∈ O, (f p - 1) := by
    calc
      (∑ p ∈ O, f p) = ∑ p ∈ O, (1 + (f p - 1)) := by
        apply Finset.sum_congr rfl
        intro p hp
        have h := hpositive p hp
        omega
      _ = O.card + ∑ p ∈ O, (f p - 1) := by rw [Finset.sum_add_distrib]; simp
  have hval := valuation_sum_bound hs hdiv 2
  change (∑ p ∈ P, f p) ≤ P.card + n.factorization 2 at hval
  rw [hsum, hsplit, hcard] at hval
  change (∑ p ∈ O, (f p - 1)) ≤ 2 * n.factorization 2
  omega

end A068991Certificate


/- Assemble after ProductReduction, SmallArithmetic and ValuationBounds. -/

open scoped BigOperators

namespace A068991Certificate

theorem predecessor_two_le_two {n : ℕ} (hs : Squarefree n)
    (hdiv : Nat.totient n ∣ 2 ^ n.primeFactors.card * n) :
    ∀ p ∈ n.primeFactors, (p - 1).factorization 2 ≤ 2 := by
  classical
  intro p hp
  by_contra hbad
  have hlarge : 3 ≤ (p - 1).factorization 2 := by omega
  have hprime : p.Prime := Nat.prime_of_mem_primeFactors hp
  have hp7 : 7 < p := three_le_factorization_two_implies_gt_seven hprime.two_le hlarge
  let P := n.primeFactors
  let O := P.erase 2
  let g : ℕ → ℕ := fun q => (q - 1).factorization 2 - 1
  have hpO : p ∈ O := Finset.mem_erase.mpr ⟨by omega, hp⟩
  have hg : 2 ≤ g p := by dsimp [g]; omega
  have hbudget0 := odd_excess_sum_le hs hdiv
  change (∑ q ∈ O, g q) ≤ 2 * n.factorization 2 at hbudget0
  have hn2 := hs.natFactorization_le_one 2
  have hbudget : (∑ q ∈ O, g q) ≤ 2 := by omega
  obtain ⟨hgp, hothers⟩ := excess_unique (g := g) hpO hg hbudget
  have hshape : ∀ q ∈ O,
      (q - 1).factorization 2 = 1 ∨ (q - 1).factorization 2 = 3 := by
    intro q hq
    by_cases hqp : q = p
    · subst q
      right
      dsimp [g] at hgp
      omega
    · left
      have hqzero := hothers q hq hqp
      obtain ⟨hq2, hqP⟩ := Finset.mem_erase.mp hq
      have hqpos := predecessor_two_pos (Nat.prime_of_mem_primeFactors hqP) hq2
      dsimp [g] at hqzero
      omega
  have h5 : 5 ∉ P := by
    intro h5P
    have h5O : 5 ∈ O := Finset.mem_erase.mpr ⟨by decide, h5P⟩
    have h5zero : ((5 : ℕ) - 1).factorization 2 - 1 = 0 :=
      hothers 5 h5O (by omega : 5 ≠ p)
    have h5val : 2 ≤ (5 - 1).factorization 2 :=
      (Nat.prime_two.pow_dvd_iff_le_factorization (by decide : (5 : ℕ) - 1 ≠ 0)).mp
        (by decide : (2 : ℕ) ^ 2 ∣ 5 - 1)
    omega
  let Q := P.filter fun q => 7 < q
  have hQ : Q.Nonempty := ⟨p, Finset.mem_filter.mpr ⟨hp, hp7⟩⟩
  let q := Q.min' hQ
  have hqQ : q ∈ Q := Finset.min'_mem Q hQ
  obtain ⟨hqP, hq7⟩ := Finset.mem_filter.mp hqQ
  have hqprime : q.Prime := Nat.prime_of_mem_primeFactors hqP
  have hq0 : q - 1 ≠ 0 := by omega
  have hqO : q ∈ O := Finset.mem_erase.mpr ⟨by omega, hqP⟩
  have hqval := hshape q hqO
  have hsmall : ∀ ell : ℕ, ell.Prime → ell ≠ 2 → ell ∣ q - 1 →
      ell = 3 ∨ ell = 7 := by
    intro ell hell hell2 hd
    have hellP : ell ∈ P := predecessor_odd_factor_mem hs hdiv hqP hell hell2 hd
    have hell5 : ell ≠ 5 := by intro he; exact h5 (he ▸ hellP)
    have hellq : ell < q := by
      have hle := Nat.le_of_dvd (by omega : 0 < q - 1) hd
      omega
    have hell7 : ell ≤ 7 := by
      by_contra hgt
      have hellQ : ell ∈ Q := Finset.mem_filter.mpr ⟨hellP, by omega⟩
      have hmin : q ≤ ell := Finset.min'_le Q ell hellQ
      omega
    exact finite_small_prime_check ⟨ell, by omega⟩ hell hell2 hell5
  have hqDvd : q - 1 ∣ 168 := by
    apply (Nat.factorization_le_iff_dvd hq0 (by decide : (168 : ℕ) ≠ 0)).mp
    intro ell
    by_cases hell2 : ell = 2
    · subst ell
      have hleft : (q - 1).factorization 2 ≤ 3 := by omega
      have hright : 3 ≤ (168 : ℕ).factorization 2 :=
        (Nat.prime_two.pow_dvd_iff_le_factorization (by decide : (168 : ℕ) ≠ 0)).mp
          (by decide : (2 : ℕ) ^ 3 ∣ 168)
      omega
    · by_cases hell : ell.Prime
      · by_cases hd : ell ∣ q - 1
        · have hcases := hsmall ell hell hell2 hd
          have hell168 : ell ∣ 168 := by rcases hcases with rfl | rfl <;> decide
          have hleft : (q - 1).factorization ell ≤ 1 :=
            (predecessor_odd_valuation_le hs hdiv hqP hell2).trans
              (hs.natFactorization_le_one ell)
          have hright : 1 ≤ (168 : ℕ).factorization ell :=
            (hell.dvd_iff_one_le_factorization (by decide : (168 : ℕ) ≠ 0)).mp hell168
          omega
        · rw [Nat.factorization_eq_zero_of_not_dvd hd]
          exact Nat.zero_le _
      · rw [Nat.factorization_eq_zero_of_not_prime _ hell]
        exact Nat.zero_le _
  have hqPredicate : (2 ∣ q - 1 ∧ ¬4 ∣ q - 1) ∨ 8 ∣ q - 1 := by
    rcases hqval with hv1 | hv3
    · left
      constructor
      · exact (Nat.prime_two.dvd_iff_one_le_factorization hq0).mpr (by omega)
      · intro hd
        have hv2 : 2 ≤ (q - 1).factorization 2 :=
          (Nat.prime_two.pow_dvd_iff_le_factorization hq0).mp
            (show (2 : ℕ) ^ 2 ∣ q - 1 from hd)
        omega
    · right
      simpa using (Nat.prime_two.pow_dvd_iff_le_factorization hq0).mpr
        (show 3 ≤ (q - 1).factorization 2 by omega)
  have hqle := Nat.le_of_dvd (by decide : 0 < (168 : ℕ)) hqDvd
  have hcases : q = 3 ∨ q = 7 ∨ q = 43 :=
    finite_predecessor_check ⟨q, by omega⟩ hqprime hqDvd hqPredicate
  have hq43 : q = 43 := by
    rcases hcases with h3 | h7 | h43
    · omega
    · omega
    · exact h43
  have h43P : 43 ∈ P := hq43 ▸ hqP
  have h7P : 7 ∈ P := predecessor_odd_factor_mem hs hdiv h43P Nat.prime_seven
    (by decide) (by decide : 7 ∣ (43 : ℕ) - 1)
  have hpair := pair_le_sum (g := fun t => (t - 1).factorization 3)
    h7P h43P (by decide : (7 : ℕ) ≠ 43)
  have h7val : 1 ≤ ((7 : ℕ) - 1).factorization 3 :=
    (Nat.prime_three.dvd_iff_one_le_factorization (by decide : (7 : ℕ) - 1 ≠ 0)).mp
      (by decide : 3 ∣ (7 : ℕ) - 1)
  have h43val : 1 ≤ ((43 : ℕ) - 1).factorization 3 :=
    (Nat.prime_three.dvd_iff_one_le_factorization (by decide : (43 : ℕ) - 1 ≠ 0)).mp
      (by decide : 3 ∣ (43 : ℕ) - 1)
  have htotal : (∑ t ∈ P, (t - 1).factorization 3) ≤ n.factorization 3 := by
    simpa using valuation_sum_bound hs hdiv 3
  have hn3 := hs.natFactorization_le_one 3
  omega

theorem predecessor_dvd_twice {n p : ℕ} (hs : Squarefree n)
    (hdiv : Nat.totient n ∣ 2 ^ n.primeFactors.card * n)
    (hp : p ∈ n.primeFactors) : p - 1 ∣ 2 * n := by
  classical
  have hprime : p.Prime := Nat.prime_of_mem_primeFactors hp
  have hp2 := hprime.two_le
  have hp0 : p - 1 ≠ 0 := by omega
  apply (Nat.factorization_le_iff_dvd hp0 (mul_ne_zero (by decide) hs.ne_zero)).mp
  intro ell
  by_cases hell2 : ell = 2
  · subst ell
    have hR : (2 * n).factorization 2 = 1 + n.factorization 2 := by
      rw [Nat.factorization_mul (by decide : (2 : ℕ) ≠ 0) hs.ne_zero,
        Nat.prime_two.factorization]
      simp only [Finsupp.add_apply, Finsupp.single_eq_same]
    rw [hR]
    have hn2 := hs.natFactorization_le_one 2
    by_cases hnzero : n.factorization 2 = 0
    · by_cases hpistwo : p = 2
      · subst p
        simp
      · have hpO : p ∈ n.primeFactors.erase 2 := Finset.mem_erase.mpr ⟨hpistwo, hp⟩
        have hsingle : (p - 1).factorization 2 - 1 ≤
            ∑ q ∈ n.primeFactors.erase 2, ((q - 1).factorization 2 - 1) :=
          Finset.single_le_sum (f := fun q : ℕ => (q - 1).factorization 2 - 1)
            (fun _ _ => Nat.zero_le _) hpO
        have hbudget := odd_excess_sum_le hs hdiv
        omega
    · have hbound := predecessor_two_le_two hs hdiv p hp
      omega
  · have hR : (2 * n).factorization ell = n.factorization ell := by
      rw [Nat.factorization_mul (by decide : (2 : ℕ) ≠ 0) hs.ne_zero,
        Nat.prime_two.factorization]
      simp only [Finsupp.add_apply, Finsupp.single_apply, if_neg (Ne.symm hell2), zero_add]
    rw [hR]
    exact predecessor_odd_valuation_le hs hdiv hp hell2

end A068991Certificate


/-
Bernoulli denominator bridge for A068991.
The public von Staudt-Clausen API was checked on the exact campaign pin
in run46066060267. This bridge uses only public rational-denominator and
prime-coprimality results; no source conjecture is assumed.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
-/

open Finset
open scoped BigOperators

namespace A068991Certificate

theorem bernoulli_integral_available (k : ℕ) :
    bernoulli (2 * k) +
      ∑ p ∈ range (2 * k + 2) with p.Prime ∧ (p - 1) ∣ 2 * k,
        (1 : ℚ) / p ∈ Set.range (Int.cast : ℤ → ℚ) :=
  Bernoulli.vonStaudt_clausen k

theorem prime_dvd_den_of_prime_correction {b : ℚ} {S : Finset ℕ}
    (hS : ∀ q ∈ S, q.Prime)
    (hi : b + ∑ q ∈ S, (1 : ℚ) / q ∈ Set.range (Int.cast : ℤ → ℚ))
    {p : ℕ} (hpS : p ∈ S) : p ∣ b.den := by
  classical
  have hp : p.Prime := hS p hpS
  let R : ℚ := ∑ q ∈ S.erase p, (1 : ℚ) / q
  have hcopprod :
      (∏ q ∈ S.erase p, ((1 : ℚ) / q).den).Coprime p := by
    refine Nat.Coprime.prod_left fun q hq ↦ ?_
    obtain ⟨hqp, hqS⟩ := Finset.mem_erase.mp hq
    have hqprime : q.Prime := hS q hqS
    rw [show ((1 : ℚ) / q).den = q by simp [hqprime.ne_zero]]
    exact (Nat.coprime_primes hqprime hp).mpr hqp
  have hRden : R.den ∣ ∏ q ∈ S.erase p, ((1 : ℚ) / q).den :=
    Rat.den_sum_dvd_prod_den _ _
  have hcopR : R.den.Coprime p := Nat.Coprime.of_dvd_left hRden hcopprod
  have hnot : ¬ p ∣ R.den :=
    (Nat.Prime.coprime_iff_not_dvd hp).mp hcopR.symm
  obtain ⟨z, hz⟩ := hi
  have hsum : (∑ q ∈ S, (1 : ℚ) / q) = (1 : ℚ) / p + R := by
    exact (Finset.add_sum_erase S (fun q : ℕ ↦ (1 : ℚ) / q) hpS).symm
  rw [hsum] at hz
  have hbR : b + R = (z : ℚ) - (1 : ℚ) / p := by linarith
  have hden : (b + R).den = p := by
    rw [hbR, Rat.intCast_sub_den]
    simp [hp.ne_zero]
  have hdiv : p ∣ b.den * R.den := by
    rw [← hden]
    exact Rat.add_den_dvd b R
  rcases hp.dvd_mul.mp hdiv with hb | hr
  · exact hb
  · exact False.elim (hnot hr)

theorem prime_dvd_den_bernoulli {n p : ℕ} (hn : 0 < n)
    (hp : p.Prime) (hpn : p ∣ n) (hd : p - 1 ∣ 2 * n) :
    p ∣ (bernoulli (2 * n)).den := by
  let S : Finset ℕ := (range (2 * n + 2)).filter
    (fun q ↦ q.Prime ∧ (q - 1) ∣ 2 * n)
  refine prime_dvd_den_of_prime_correction
    (b := bernoulli (2 * n)) (S := S) ?_ ?_ ?_
  · intro q hq
    exact (Finset.mem_filter.mp hq).2.1
  · exact bernoulli_integral_available n
  · have hp_le : p ≤ n := Nat.le_of_dvd hn hpn
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_range.mpr (by omega), hp, hd⟩

theorem squarefree_div_den_bernoulli {n : ℕ} (hn : 0 < n) (hs : Squarefree n)
    (h : ∀ p : ℕ, p.Prime → p ∣ n → p - 1 ∣ 2 * n) :
    n ∣ (bernoulli (2 * n)).den := by
  have hd : (bernoulli (2 * n)).den ≠ 0 := (bernoulli (2 * n)).den_nz
  apply (Nat.factorization_le_iff_dvd hs.ne_zero hd).mp
  intro p
  by_cases hp : p.Prime
  · by_cases hpn : p ∣ n
    · have hpden : p ∣ (bernoulli (2 * n)).den :=
        prime_dvd_den_bernoulli hn hp hpn (h p hp hpn)
      have hlow := (hp.dvd_iff_one_le_factorization hd).mp hpden
      have hhigh := hs.natFactorization_le_one p
      omega
    · rw [Nat.factorization_eq_zero_of_not_dvd hpn]
      exact Nat.zero_le _
  · rw [Nat.factorization_eq_zero_of_not_prime n hp]
    exact Nat.zero_le _

end A068991Certificate

open OMA.S_oeis_a068991 A068991Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a068991.main := by
  intro n hn hs hi
  have hdiv := integral_implies_totient_dvd hs hi
  apply squarefree_div_den_bernoulli hn hs
  intro p hp hpd
  exact predecessor_dvd_twice hs hdiv
    (Nat.mem_primeFactors.mpr ⟨hp, hpd, hs.ne_zero⟩)

```
