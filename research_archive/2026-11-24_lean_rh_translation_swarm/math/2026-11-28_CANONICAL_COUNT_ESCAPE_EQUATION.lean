import Run98CountEscapeBudget
import Lean

/-!
# Math lane — canonical count-escape equation

28 November 2026. PREPARED, NOT compiled. This removes the auxiliary
set witness from RUN98 and leaves the single canonical count equation.
It does not prove that equation or RH.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat Asymptotics Set

namespace RHMathCanonicalCount

/-- The exact per-prime witness retained from RUN98. -/
def BudgetGood (ε : ℝ) (d : Primes) : Prop :=
  ∃ P : Parameters,
    P.d = d ∧ P.N₀ = 18480 ∧
    ∃ (eps : ℝ) (K : ℕ) (C : ℝ),
      (0 < eps / 6 ∧ eps < 1 / 100) ∧ 0 ≤ C ∧
      ((K : ℝ) + 1) * eps ≤ ε / 2 ∧
      RHIntegration97.GuardedBudgetOn P eps K C RHPrimeWindow94.QuarticScales

/-- Composites are deliberately included: the native `goodPrimes` count
filters primality. Proof irrelevance makes the value independent of `hp`. -/
def canonicalGoodSet (ε : ℝ) : Set ℕ :=
  {n | ∀ hp : n.Prime, BudgetGood ε ⟨n, hp⟩}

/-- The whole remaining arithmetic requirement, with no chosen subset. -/
def CanonicalCountEscapeBudget : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    RHDepCountEscape82.CountEscape (canonicalGoodSet ε) (4 * ε / 9)

/-- `CountEscape` is monotone under inclusion on primes. Nonprime elements
are irrelevant because `goodPrimes` filters them before cardinality. -/
theorem countEscape_mono_prime {S T : Set ℕ} {η : ℝ}
    (hST : ∀ n, n.Prime → n ∈ S → n ∈ T)
    (hS : RHDepCountEscape82.CountEscape S η) :
    RHDepCountEscape82.CountEscape T η := by
  intro hT
  apply hS
  refine .trans (.of_norm_le fun x => ?_) hT
  have hsub : RHDepCountEscape82.goodPrimes S x ⊆
      RHDepCountEscape82.goodPrimes T x := by
    intro n hn
    have hx : n ∈ Ioc 0 x ∧ n.Prime ∧ n ∈ S := by
      simpa [RHDepCountEscape82.goodPrimes] using hn
    simpa [RHDepCountEscape82.goodPrimes, hx.1, hx.2.1,
      hST n hx.2.1 hx.2.2]
  have hc : ((RHDepCountEscape82.goodPrimes S x).card : ℝ) ≤
      (RHDepCountEscape82.goodPrimes T x).card := by
    exact_mod_cast card_le_card hsub
  simpa only [Real.norm_of_nonneg (by positivity)] using hc

/-- RUN98's existential subset is exactly equivalent to count escape for
the canonical set of every prime having its retained budget witness. -/
theorem countEscapeBudget_iff_canonical :
    RHPrimeWindow98.CountEscapeBudget ↔ CanonicalCountEscapeBudget := by
  constructor
  · intro h ε he
    obtain ⟨S, hcount, hbudget⟩ := h ε he
    apply countEscape_mono_prime (hS := hcount)
    intro n hn hnS
    show ∀ hp : n.Prime, BudgetGood ε ⟨n, hp⟩
    intro hp
    exact hbudget ⟨n, hp⟩ hnS
  · intro h ε he
    refine ⟨canonicalGoodSet ε, h ε he, ?_⟩
    intro d hd
    exact hd d.2

theorem zeta_line_from_canonical_count_escape_budget
    (h : CanonicalCountEscapeBudget) : RiemannZetaZerosOnLine :=
  RHPrimeWindow98.zeta_line_from_count_escape_budget
    (countEscapeBudget_iff_canonical.mpr h)

end RHMathCanonicalCount

#print axioms RHMathCanonicalCount.countEscape_mono_prime
#print axioms RHMathCanonicalCount.countEscapeBudget_iff_canonical
#print axioms RHMathCanonicalCount.zeta_line_from_canonical_count_escape_budget

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHMathCanonicalCount.countEscapeBudget_iff_canonical,
        #[``RHMathCanonicalCount.countEscape_mono_prime]),
      (``RHMathCanonicalCount.zeta_line_from_canonical_count_escape_budget,
        #[``RHPrimeWindow98.zeta_line_from_count_escape_budget,
          ``RHMathCanonicalCount.countEscapeBudget_iff_canonical])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "canonical count unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      throwError "canonical count missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "canonical count missing direct supplier {n}"
  logInfo "CANONICAL_COUNT_ESCAPE_GUARDS_OK"
