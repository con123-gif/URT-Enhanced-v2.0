import DepPairMean84
import Run101PairQuarticCost
import Lean

/-!
# Math lane — canonical fractional pair-packing equation

28 November 2026. SOURCE-MATCHED / PREPARED, not native compiled.
This canonicalizes the auxiliary graph family from RUN84 by using the
fractional matching mass of the relation of all pair-cost edges.  It proves
only the finite hitting step.  The human note records that maximal-matching
rounding makes this equivalent to the optimized RUN84 graph criterion up to
a factor two; it is not claimed as arithmetic premise weakening.  It does
not prove the packing equation, any pair-cost estimate, or RH.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module Nat

namespace RHMathCanonicalPair

/-- A finite fractional packing of blocks.  Strict positivity means the
index set is exactly the support; this loses no packing mass. -/
structure Packing (ι V : Type*) [DecidableEq ι] [DecidableEq V] where
  index : Finset ι
  block : ι → Finset V
  weight : ι → ℝ
  weight_pos : ∀ i ∈ index, 0 < weight i
  load_le_one : ∀ v : V,
    ∑ i ∈ index, (if v ∈ block i then weight i else 0) ≤ 1

def Packing.mass {ι V : Type*} [DecidableEq ι] [DecidableEq V]
    (P : Packing ι V) : ℝ :=
  ∑ i ∈ P.index, P.weight i

/-- The exact finite selection lemma behind the canonical equation: packing
mass larger than the bad-set cardinality forces a positive-weight block
disjoint from the bad set. -/
theorem exists_unhit_of_bad_card_lt_mass
    {ι V : Type*} [DecidableEq ι] [DecidableEq V]
    (P : Packing ι V) (bad : Finset V)
    (hmass : (bad.card : ℝ) < P.mass) :
    ∃ i ∈ P.index, Disjoint (P.block i) bad := by
  classical
  by_contra hex
  have hhit : ∀ i ∈ P.index, ∃ v ∈ bad, v ∈ P.block i := by
    intro i hi
    by_contra hno
    apply hex
    refine ⟨i, hi, Finset.disjoint_left.mpr ?_⟩
    intro v hvblock hvbad
    exact hno ⟨v, hvbad, hvblock⟩
  have hbound : P.mass ≤ (bad.card : ℝ) :=
    RHDepPairMean84.weighted_hit_bound P.index bad P.block P.weight
      (fun i hi => (P.weight_pos i hi).le) hhit
      (fun v _ => P.load_le_one v)
  exact (not_le_of_gt hmass) hbound

/-- The canonical arithmetic edge relation.  The orientation `d<e` only
removes duplicate unordered pairs.  Parameters and their witnesses are fixed
before the analytic variable grows. -/
def PairGood (ε : ℝ) (q : Primes × Primes) : Prop :=
  q.1.1 < q.2.1 ∧
  ∃ (P Q : Parameters), P.d = q.1 ∧ Q.d = q.2 ∧
    P.N₀ = 18480 ∧ Q.N₀ = P.N₀ ∧
    RHPrimeWindow101.PairGridCost P Q (ε / 2)

def pairBlock (q : Primes × Primes) : Finset Primes :=
  {q.1, q.2}

/-- Direct witness form of the boxed fractional-matching equation.  It is
the assertion that the canonical pair graph has fractional matching mass
not `O(X^(1-2*ε/9))`, written without introducing a supremum. -/
def CanonicalFractionalPairCount : Prop :=
  ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
    ∀ C : ℝ, 0 < C → ∀ X₀ : ℕ,
      ∃ (X : ℕ) (E : Finset (Primes × Primes))
        (w : Primes × Primes → ℝ),
        X₀ ≤ X ∧
        (∀ q ∈ E, PairGood ε q ∧ q.2.1 ≤ X) ∧
        (∀ q ∈ E, 0 < w q) ∧
        (∀ d : Primes,
          ∑ q ∈ E, (if d ∈ pairBlock q then w q else 0) ≤ 1) ∧
        C * (X : ℝ) ^ (1 - 2 * ε / 9) < ∑ q ∈ E, w q

/-- At a chosen cutoff, the direct witness in the canonical equation is a
`Packing`, so the generic finite escape theorem applies verbatim. -/
theorem pair_exists_outside_bad
    {ε : ℝ} {X : ℕ} {E : Finset (Primes × Primes)}
    {w : Primes × Primes → ℝ}
    (hgood : ∀ q ∈ E, PairGood ε q ∧ q.2.1 ≤ X)
    (hpos : ∀ q ∈ E, 0 < w q)
    (hload : ∀ d : Primes,
      ∑ q ∈ E, (if d ∈ pairBlock q then w q else 0) ≤ 1)
    (bad : Finset Primes)
    (hmass : (bad.card : ℝ) < ∑ q ∈ E, w q) :
    ∃ q ∈ E, Disjoint (pairBlock q) bad ∧ PairGood ε q := by
  classical
  let P : Packing (Primes × Primes) Primes :=
    { index := E
      block := pairBlock
      weight := w
      weight_pos := hpos
      load_le_one := hload }
  obtain ⟨q,hq,hdis⟩ := exists_unhit_of_bad_card_lt_mass P bad (by
    simpa only [Packing.mass, P] using hmass)
  exact ⟨q,hq,hdis,(hgood q hq).1⟩

end RHMathCanonicalPair

#print axioms RHMathCanonicalPair.exists_unhit_of_bad_card_lt_mass
#print axioms RHMathCanonicalPair.pair_exists_outside_bad

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHMathCanonicalPair.exists_unhit_of_bad_card_lt_mass,
        #[``RHDepPairMean84.weighted_hit_bound]),
      (``RHMathCanonicalPair.pair_exists_outside_bad,
        #[``RHMathCanonicalPair.exists_unhit_of_bad_card_lt_mass])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "CANONICAL_PAIR unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      throwError "CANONICAL_PAIR missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "CANONICAL_PAIR missing direct supplier {n}"
  logInfo "CANONICAL_FRACTIONAL_PAIR_GUARDS_OK"
