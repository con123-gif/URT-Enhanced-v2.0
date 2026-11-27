import Mathlib

/-!
# Semisimplicity questions for joint centralizers with transpose

Source: https://mathoverflow.net/questions/487192
Original question: Mare (MathOverflow user61949), February 4, 2025, CC BY-SA 4.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).

The three conjuncts retain all three explicit semisimplicity questions in the
source. The first concerns an arbitrary finite poset, the second the product
of n chains with t elements (the source's t=2 gives the Boolean lattice), and
the third arbitrary invertible matrices over characteristic-zero fields.
All centralizers are associative, unital algebras and transpose is ordinary
transpose. Decidability instances merely allow the finite incidence matrices
to be written; every finite poset admits these instances classically.
The open-ended requests for an interpretation, dimensions, and Wedderburn
decompositions assert no formula that could be included as another conjecture.
Steinberg's source comments already address the positive real/poset cases.
Our disproof addresses the third conjunct; it does not refute the first two.
-/

namespace OMA.S_mo_487192

def jointCentralizer (K : Type) [Field K] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) K) : Subalgebra K (Matrix (Fin n) (Fin n) K) :=
  Subalgebra.centralizer K ({A, A.transpose} : Set (Matrix (Fin n) (Fin n) K))

def cartan (K : Type) [Field K] (P : Type) [PartialOrder P] [DecidableLE P] :
    Matrix P P K :=
  fun i j => if i ≤ j then 1 else 0

def posetCentralizer (K : Type) [Field K] (P : Type) [PartialOrder P]
    [Fintype P] [DecidableEq P] [DecidableLE P] : Subalgebra K (Matrix P P K) :=
  Subalgebra.centralizer K ({cartan K P, (cartan K P).transpose} : Set (Matrix P P K))

open scoped Classical in
theorem main :
    (∀ (K : Type) [Field K] [CharZero K] (P : Type) [PartialOrder P]
      [Fintype P] [DecidableEq P] [DecidableLE P],
      IsSemisimpleRing (posetCentralizer K P)) ∧
    (∀ (K : Type) [Field K] [CharZero K] (n t : ℕ),
      0 < n → 0 < t → IsSemisimpleRing (posetCentralizer K (Fin n → Fin t))) ∧
    (∀ (K : Type) [Field K] [CharZero K] (n : ℕ),
      0 < n → ∀ A : Matrix (Fin n) (Fin n) K,
        IsUnit A → IsSemisimpleRing (jointCentralizer K A)) := by
  sorry

end OMA.S_mo_487192
