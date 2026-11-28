import MathCanonicalCount
import Lean

/-!
# Audit — canonical count escape, cofinal tolerances and full upper exponent
28 November 2026. AGREE with the human conditional RUN82/RUN98/canonical
selection argument; PARTIAL for the new native adapter (PREPARED, not compiled).
Credit Alpöge, Sernau, Anthropic collaborators and Claude. No RH claim.

Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484;
AGENTS, SWARM and first sections of HANDOFF, EXPANSION, state, protocol, log,
continuity. Branch head b4804e50b7cd86486b45eaa450e5e495a963634d read.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Native DataExist blob 634c6a1f88791a3bb770326785b70411e8289b41,
AdmissibleData 04208a5044bb7cf6464ef142a14d939148bed834,
New/Main 198ed5bf26aa294898931e0649bc2b88f1389f65,
OneSidedCriterion 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3,
ZeroFreeTwist 1d873bd3fef2c4ba301ce38e0469cc1817e6aa11, line 147.
Stage MathCanonicalCount from math/2026-11-28_CANONICAL_COUNT_ESCAPE_EQUATION.lean
blob 455666b5bdd64fd9c2e12ba38619fb0a13aa5541, commit 5c8c0ef5.
Its suppliers RUN82 edfb195d5ef76d7a46b7cadcfa64f9f9cb7c66e9,
RUN98 b1572949fc9032a7b5de11f8ee8c451bc2a70bb6, Integration97
ff20a7853578c8e3672914710cadf25d98766140 are PREPARED.
Read all four source bodies and RUN94/96. No repeated finite-power adapter.
Mathlib exact rpow_le_rpow_of_exponent_le and IsBigO.of_bound' inspected
at blobs 97c12aed7085a7fc77727567d87e508064b49a18 and
ba527424152cc972de5d8d2030d47288fb530d25.

## Independent audit
The native bad-prime predicate retains primality, mod 8, coprimality, finite
character set and complex height. For eta=4 eps/9 and beta=1/2+8 eps,
1/2+9 eta=1/2+4 eps<=beta. Finite union bound uses a fixed height and
modulus, not a uniform bound over heights. If every prime in S is bad,
N_S(X)<=sum_xi N_bad,xi(X)=O(X^(1-eta/2)), contradicting CountEscape.
The signed Landau continuation in RUN82 was compared byte-for-byte over
its 454-character proof tail to native OneSidedCriterion: identical.
RUN98 preserves one P,d,eps0,K,C and threshold per prime BEFORE x grows,
and all five guarded-scale premises. Integration97 divides by positive
m,a,#thick and retains the signed polar error; no norm or reversed sign.
The canonical set includes composites harmlessly because goodPrimes
filters primality. No hidden uniformity or missing premise identified
in the human argument. This is not a compiler verdict for these files.

## New exact premise normalization (human proof)
Write G_e for the canonical BudgetGood prime set, and N_e(X) for its
prime-filtered counting function. If 0<e<=E then G_e subset G_E:
retain EXACTLY the same P,eps0,K,C, eventual threshold and native guards;
only the slack bound (K+1)eps0<=e/2 weakens to <=E/2.
For X>=1, if a<=b then X^a<=X^b. Consequently if
    N_e is not O(X^(1-2e/9)),
then N_E is not O(X^(1-2E/9)). Otherwise the latter Big-O and both
monotonicities contradict the former. This proves that the continuum
of analytic tolerances can be replaced by ANY cofinal sequence of
positive tolerances tending to zero (e.g. 1/(200*2^n)).
No common prime set, P, exponent, constant or x-threshold is required.

More strongly the existing all-tolerance canonical premise is equivalent
to the following single type of counting requirement:
    for every 0<E<1/100 and every delta>0,
    N_E(X) is not O(X^(1-delta)).
Forward: choose e=min(E,9 delta/2)>0; then 2e/9<=delta, and use inclusion
and exponent comparison exactly as above. Reverse: choose delta=2E/9.
This expresses upper counting exponent 1 for every positive tolerance
(the logarithm may be taken of max(1,N_E(X))), since N_E(X)<=X.
The original root and all retained premises are unchanged, except
presentation of the sufficient arithmetic obligation. This does not
prove the counting requirement, A/B/C or RH.

Negative controls: infinitely many eligible primes are NOT enough.
From an infinite eligible class choose an increasing subsequence
d_j>=2^j. Its count is O(log X) and hence O(X^a) for every a>0.
Also at a fixed tolerance, merely limsup log(N_e)/log X >= 1-2e/9
does not imply CountEscape: equality at the critical exponent can
satisfy Big-O (e.g. floor(X^a) at exponent a). The all-tolerance
normalization avoids this equality trap by allowing smaller e.
Do not exchange the order of eps0,K,C and x.

Executed connector JS: five exact source checks, two missing/duplicate
caller anchor controls rejected, and 936 exact BigInt exponent-order
checks. First test harness used base exponent 100 with one test
exponent negative and aborted (RangeError); repaired common offset
to 200, all 936 passed. Reproduce: for E=1..12,e=1..E,t=1..12,
s=min(4e,9t); assert s<=4E, s<=9t, 2^(200-s)>=2^(200-9t).
These test only direction of exponent comparisons, not prime estimates.
Local command -v lean/lake returned no path. No native rh_scan/prune,
reduce/auto/frontier or CI run claimed; no global dependency deletion.
Prior searches for cofinal/dyadic tolerance or epsilon monotonicity
returned no relevant candidate; no novelty claim. All original graphs,
accepted RUN95 conditional receipt and outstanding suppliers preserved.

RESUME HERE: after actual RUN82, Integration97, RUN98 and MathCanonicalCount
receipts, stage this file as AuditCanonicalCountTolerance in that SAME
authenticated compact workspace; run normal kernel, standard axiom
guards and strict constructor-inclusive comparison against canonical root.
If a dependency fails, retain its actual diagnostic and repair that
dependency rather than queue a cold duplicate. Report the cofinal
arithmetic target to prime/integration, not a solved estimate.
HANDOFF TO math / prime / integration / kernel. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Filter Finset Nat Real Asymptotics
open RHMathCanonicalCount RHDepCountEscape82

namespace RHAuditCanonicalTolerance

theorem canonical_mono {e E : ℝ} (h : e ≤ E) :
    ∀ n, n.Prime → n ∈ canonicalGoodSet e → n ∈ canonicalGoodSet E := by
  intro n hn hm
  change ∀ hp : n.Prime, BudgetGood e ⟨n,hp⟩ at hm
  change ∀ hp : n.Prime, BudgetGood E ⟨n,hp⟩
  intro hp
  obtain ⟨P, hd, hM, eps, K, C, heps, hC, hslack, hb⟩ := hm hp
  exact ⟨P, hd, hM, eps, K, C, heps, hC,
    hslack.trans (by linarith), hb⟩

theorem countEscape_mono_eta {S : Set ℕ} {a b : ℝ} (hab : a ≤ b)
    (h : CountEscape S a) : CountEscape S b := by
  unfold CountEscape at h ⊢
  intro hbad
  apply h
  have hpow : (fun x : ℕ => (x : ℝ) ^ (1 - b/2)) =O[atTop]
      (fun x : ℕ => (x : ℝ) ^ (1 - a/2)) := by
    apply Asymptotics.IsBigO.of_bound'
    filter_upwards [mem_atTop (1 : ℕ)] with x hx
    have hx' : (1 : ℝ) ≤ (x : ℝ) := by exact_mod_cast hx
    change ‖(x : ℝ) ^ (1-b/2)‖ ≤ ‖(x : ℝ) ^ (1-a/2)‖
    rw [Real.norm_of_nonneg (Real.rpow_nonneg (by positivity) _),
        Real.norm_of_nonneg (Real.rpow_nonneg (by positivity) _)]
    exact Real.rpow_le_rpow_of_exponent_le hx' (by linarith)
  exact hbad.trans hpow

/-- Count escape at a smaller tolerance implies escape at any larger
tolerance, without choosing new arithmetic records. -/
theorem canonical_escape_mono {e E : ℝ} (h : e ≤ E)
    (he : CountEscape (canonicalGoodSet e) (4*e/9)) :
    CountEscape (canonicalGoodSet E) (4*E/9) :=
  countEscape_mono_eta (by linarith) (countEscape_mono_prime (canonical_mono h) he)

/-- Any cofinal collection of successful tolerances suffices. -/
theorem canonical_of_cofinal
    (h : ∀ E : ℝ, 0 < E → ∃ e : ℝ, 0 < e ∧ e < 1/100 ∧ e ≤ E ∧
      CountEscape (canonicalGoodSet e) (4*e/9)) :
    CanonicalCountEscapeBudget := by
  intro E hE
  obtain ⟨e, _, _, heE, he⟩ := h E (by linarith [hE.1])
  exact canonical_escape_mono heE he

/-- Full upper prime-count exponent at every tolerance. The exponent
here is 1-t/2, so t=2*delta in the human statement. -/
def FullUpperCount : Prop :=
  ∀ E : ℝ, 0 < E/6 ∧ E < 1/100 → ∀ t : ℝ, 0 < t →
    CountEscape (canonicalGoodSet E) t

theorem canonical_iff_full_upper_count :
    CanonicalCountEscapeBudget ↔ FullUpperCount := by
  constructor
  · intro h E hE t ht
    let e : ℝ := min E (9*t/4)
    have heE : e ≤ E := min_le_left _ _
    have het : e ≤ 9*t/4 := min_le_right _ _
    have he0 : 0 < e := lt_min (by linarith [hE.1]) (by positivity)
    have he : 0 < e/6 ∧ e < 1/100 := by
      constructor <;> linarith [hE.2]
    exact countEscape_mono_eta (by linarith : 4*e/9 ≤ t)
      (countEscape_mono_prime (canonical_mono heE) (h e he))
  · intro h E hE
    exact h E hE (4*E/9) (by linarith [hE.1])

theorem zeta_line_from_cofinal
    (h : ∀ E : ℝ, 0 < E → ∃ e : ℝ, 0 < e ∧ e < 1/100 ∧ e ≤ E ∧
      CountEscape (canonicalGoodSet e) (4*e/9)) :
    RiemannZetaZerosOnLine :=
  zeta_line_from_canonical_count_escape_budget (canonical_of_cofinal h)

end RHAuditCanonicalTolerance

#print axioms RHAuditCanonicalTolerance.canonical_mono
#print axioms RHAuditCanonicalTolerance.countEscape_mono_eta
#print axioms RHAuditCanonicalTolerance.canonical_escape_mono
#print axioms RHAuditCanonicalTolerance.canonical_of_cofinal
#print axioms RHAuditCanonicalTolerance.canonical_iff_full_upper_count
#print axioms RHAuditCanonicalTolerance.zeta_line_from_cofinal

open Lean in
run_cmd do
  for (n, req) in #[
      (``RHAuditCanonicalTolerance.canonical_mono, #[]),
      (``RHAuditCanonicalTolerance.countEscape_mono_eta, #[]),
      (``RHAuditCanonicalTolerance.canonical_escape_mono,
        #[``RHAuditCanonicalTolerance.canonical_mono,
          ``RHMathCanonicalCount.countEscape_mono_prime,
          ``RHAuditCanonicalTolerance.countEscape_mono_eta]),
      (``RHAuditCanonicalTolerance.canonical_of_cofinal,
        #[``RHAuditCanonicalTolerance.canonical_escape_mono]),
      (``RHAuditCanonicalTolerance.canonical_iff_full_upper_count,
        #[``RHAuditCanonicalTolerance.countEscape_mono_eta,
          ``RHMathCanonicalCount.countEscape_mono_prime]),
      (``RHAuditCanonicalTolerance.zeta_line_from_cofinal,
        #[``RHAuditCanonicalTolerance.canonical_of_cofinal,
          ``RHMathCanonicalCount.zeta_line_from_canonical_count_escape_budget])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "audit count unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "audit count missing value {n}"
    unless req.all (fun a => v.getUsedConstants.contains a) do
      throwError "audit count missing direct supplier {n}"
  logInfo "AUDIT_CANONICAL_COUNT_TOLERANCE_GUARDS_OK"
