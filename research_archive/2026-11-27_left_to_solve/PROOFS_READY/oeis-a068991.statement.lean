import Mathlib

/-!
OEIS A068991, revision35: Cloitre's conjecture for squarefree terms of the
sequence of positive n for which Sum_{d|n} sigma(d)/phi(d) is an integer.
"Contains n" means "is divisible by n", as the source example and the
complete historical discussion explicitly clarify. The Bernoulli index is
2*n, not n. The separate informal question about recursively finding terms
is not the selected catalogue conjecture.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6;
exact serving variant not exposed). Source: https://oeis.org/A068991.
-/

namespace OMA.S_oeis_a068991

def IntegralDivisorRatio (n : ℕ) : Prop :=
  ∃ z : ℤ, (z : ℚ) =
    ∑ d ∈ n.divisors, (ArithmeticFunction.sigma 1 d : ℚ) / (Nat.totient d : ℚ)

def conjecture : Prop :=
  ∀ n : ℕ, 0 < n → Squarefree n → IntegralDivisorRatio n →
    n ∣ (bernoulli (2 * n)).den

theorem main : conjecture := by
  sorry

end OMA.S_oeis_a068991
