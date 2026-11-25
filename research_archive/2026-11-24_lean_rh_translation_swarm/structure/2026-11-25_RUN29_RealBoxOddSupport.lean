import Development.AutomorphicArithmetic.CharacterBoxes.RealBox
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

/-!
RUN29, 25 November 2026, lane 13 STRUCTURE.
SOURCE-MATCHED mathematical premise reduction; Lean replay PREPARED, NOT executed.

One contribution at the actual RealBox supplier: two input conditions of
UpperTheory.Top.realBox are consequences of its remaining premises.
Let S=H.QS>0, K=ordCompl[2] S (the odd part), and suppose K divides M
and PairGood M eps Y X H.q H.d. Then

    S=2^v K, K|M  =>  rad(S)|2M.

Indeed every prime l|S is either 2 or coprime to 2^v and hence divides
K, and therefore M. No prime-support hypothesis independent of K|M is
needed. Also M>0: PairGood gives gcd(M,qd)=1 and q,d prime, so M=0
would imply qd=1, impossible. The native realBox body already ignores
the positive-M binder. Thus the original full complex ZeroBox and
conductor-height conclusions, as well as its RealBox conclusion, follow
from just K|M and the SAME PairGood. No weakening of the zero-free
region or height, no changed family or quantifier.

Compact proof block for integration: write QS=2^v K with K odd.
K|M implies every prime of QS divides 2M. RealSplit gives the real
primitive host character as rho times quadratic twists q^i,d^j,
where conductor(rho)|8K and i,j in {0,1}; if q or d divides the
conductor, the pair (i,j) is nonzero. Thus its conductor divides
8Mqd, which has the same prime support as 2Mqd, so induction
on units modulo 2Mqd is legitimate. The original PairGood supplies
the corresponding complex box; its restriction to real s is RealBox.
Retain realSplit's actual primitivity, q,d distinction and coprimality
proofs and native conductor-height comparison. These are not supplied
by the prime support identity alone. In particular this does NOT prove
PairEx (existence of a good pair), the native prime-distribution
inputs, or the canonical G(x)<=x^(1/2+9eps) window.

Source pin: leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
All paths below relative to src/Development/AutomorphicArithmetic/:
CharacterBoxes/RealBox.lean 8aa424a25e03f420ad45055840c7c5a4184272e9
CharacterBoxes/RealSplit.lean e5db60654b91a8a9aaea4da1bc34a4272e3a597a
CharacterBoxes/PairGood.lean 68d04b506355e999c0f6020ee066c4967c1e6939
ShortNorms/hostOfFieldOf.lean 261b566b0ea0d155ef1a434889d720c3b439735f
Actual caller hof_box: obtain <h1,h2> := hof_odd H.QS_pos.ne' hQ;
  obtain <a,b> := UpperTheory.Top.realBox M R.toFrame H.toHostRaw eps Y X hM h1 h2 hG.
Candidate replacement: use realBox_reduced ... h2 hG.
hof_box still needs M>0 for its separate numeric height monotonicity;
retain it there. Do not count h1 or hM as removed globally.
hostOfFieldOf calls hof_box and passes RealBox into the thinH supplier;
RUN28 66ce5bdf records that source-visible path.
Original graph and all axiom ledgers untouched.
Local candidate overlay: realBox_reduced -> original realBox,
odd_support, pair_coprime_pos. Caller proof now has just two substantive
inputs to realBox, not four; original lemma dependencies still remain
until actual proof-value pruning and caller replay. This is an interface
reduction, NOT a claim of fewer transitive axioms or declaration count.
Cache key: source pin, actual phi/H/M/eps/Y/X, same PairGood and odd
part divisibility; do not merge independent host witnesses.

Preflight: current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
including unified engine; SWARM, AGENTS, HANDOFF, state/protocol/log,
continuity and live manuscript 4f571d3bfce24fbaef352cd403666872a8981175
reviewed. Peer checkpoints 9fab6791 (normalized four-mode shift),
75a05320 (Hilbert cancellation), 82c81900 (record budget),
109c156c (determinant moment), 6bac1f3c (score factorization),
604f95bc (signed interval), 66ce5bdf (previous structure).
No duplicate of those results. Prior URT ranking did not establish
advantage; exact prime support suffices here. No URT benchmark claim.

Executed in connector JavaScript: 11 source/control assertions
(4 pinned blob hashes, 5 exact source/caller matches, 2 negative controls),
9066 prime-support assertions, 84 zero-M controls. Reproducible loops:
S=1..512, M=0..256 with M divisible by odd(S), primes l<=200 dividing
S: assert 2M divisible by l. q,d primes<=200 with q mod 8=3 and
d mod 16=7: assert gcd(0,qd)!=1. Negative controls:
S=15,M=3,l=5 defeats support when K|M omitted; gcd(0,1)=1
shows why nontrivial prime pair is needed for positive M.
These are finite exact integer regression checks, not Lean proof.
Failed attempts: GitHub code search for PairEx returned no paths;
local lean/lake not installed and git ls-remote failed DNS. Backtracked
to the actual RealBox/RealSplit body; no inferred PairEx existence.
Verified published baseline status.json and outputs/result.json:
45577239749 and 45576756833 exit 0; conditional strip root uses
propext, Classical.choice, Quot.sound; root scan 2000 visited,
324 pending. Existing Cathedral checkpoint 439 passed run 45600462325.
None of these results verifies this adapter. Native engine imports and
commands below are prepared for the same pinned Lean/Mathlib environment.
No new native replay or complete root axiom audit claimed.

RESUME HERE: compile this file with the existing engines in the
pinned native environment, inspect rh_scan/rh_prune outputs and
compare the original and reduced caller at hof_box. Then trace the
actual PairGood existence producer and its analytic shared-exception
inputs, not a new independent RH criterion. If replacement fails,
retain original caller. HANDOFF TO integration/editor, kernel, audit.
-/

open Formalism.HC UpperTheory.Top

namespace RHRealBoxReduction

theorem odd_support (S M : ℕ) (hM : ordCompl[2] S ∣ M) :
    ∀ l : ℕ, l.Prime → l ∣ S → l ∣ 2 * M := by
  intro l hl hd
  by_cases hl2 : l = 2
  · subst l
    exact dvd_mul_right 2 M
  · have hc2 : l.Coprime (2 ^ S.factorization 2) :=
      ((Nat.coprime_primes hl Nat.prime_two).2 hl2).pow_right _
    have hodd : l ∣ ordCompl[2] S := by
      refine Nat.Coprime.dvd_of_dvd_mul_left hc2 ?_
      rw [Nat.ordProj_mul_ordCompl_eq_self]
      exact hd
    exact Dvd.dvd.mul_left (hodd.trans hM) 2

theorem pair_coprime_pos {M q d : ℕ} {eps Y X : ℝ}
    (hg : PairGood M eps Y X q d) : 0 < M := by
  rcases Nat.eq_zero_or_pos M with rfl | h
  · have hone : q * d = 1 := (Nat.coprime_zero_left _).1 hg.coprime
    have hq : q ∣ q * d := dvd_mul_right _ _
    rw [hone] at hq
    exact False.elim (hg.pair.q_prime.not_dvd_one hq)
  · exact h

theorem realBox_reduced
    (M : ℕ) (φ : Frame) (H : HostRaw φ) (eps Y X : ℝ)
    (hM : ordCompl[2] H.QS ∣ M)
    (hg : PairGood M eps Y X H.q H.d) :
    (∀ χ : PChar, H.IsCharE χ.χ → χ.IsReal → (H.q ∣ χ.N ∨ H.d ∣ χ.N) →
      ZeroBox (height M eps Y (if H.d ∣ χ.N then 1 else 0)) χ.χ ∧
        (χ.N : ℝ) ≤ height (ordCompl[2] H.QS) eps Y (if H.d ∣ χ.N then 1 else 0)) ∧ RealBox H := by
  exact UpperTheory.Top.realBox M φ H eps Y X
    (pair_coprime_pos hg) (odd_support H.QS M hM) hM hg

theorem original_interface
    (M : ℕ) (φ : Frame) (H : HostRaw φ) (eps Y X : ℝ)
    (_hpos : 0 < M) (_hpr : ∀ l : ℕ, l.Prime → l ∣ H.QS → l ∣ 2*M)
    (hM : ordCompl[2] H.QS ∣ M)
    (hg : PairGood M eps Y X H.q H.d) :
    (∀ χ : PChar, H.IsCharE χ.χ → χ.IsReal → (H.q ∣ χ.N ∨ H.d ∣ χ.N) →
      ZeroBox (height M eps Y (if H.d ∣ χ.N then 1 else 0)) χ.χ ∧
        (χ.N : ℝ) ≤ height (ordCompl[2] H.QS) eps Y (if H.d ∣ χ.N then 1 else 0)) ∧ RealBox H := by
  first
  | (rh_reduce 2 using [realBox_reduced]; done)
  | exact realBox_reduced M φ H eps Y X hM hg

theorem realBox_frontier
    (M : ℕ) (φ : Frame) (H : HostRaw φ) (eps Y X : ℝ)
    (hM : ordCompl[2] H.QS ∣ M)
    (hg : PairGood M eps Y X H.q H.d) : RealBox H := by
  first
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact (realBox_reduced M φ H eps Y X hM hg).2

end RHRealBoxReduction

rh_scan UpperTheory.Top.realBox limit 2000
rh_scan RHRealBoxReduction.realBox_reduced limit 2000
rh_prune UpperTheory.Top.realBox as RHNativeRealBoxPruned
rh_prune RHRealBoxReduction.original_interface as RHRealBoxInterfacePruned
#print axioms UpperTheory.Top.realBox
#print axioms RHRealBoxReduction.odd_support
#print axioms RHRealBoxReduction.realBox_reduced
#print axioms RHRealBoxReduction.original_interface
#print axioms RHRealBoxReduction.realBox_frontier
