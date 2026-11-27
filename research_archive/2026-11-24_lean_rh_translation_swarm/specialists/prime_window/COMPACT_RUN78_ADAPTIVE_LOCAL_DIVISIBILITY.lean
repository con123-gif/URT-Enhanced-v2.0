import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN78 — separate index and divisibility budgets; adaptive truncation at the actual local caller
27 November 2026. SOURCE-MATCHED human conditional replacement. Prepared
scalar Lean certificates only, not compiled. No RH closure.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained, no migration.
Compact Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory
engine, AGENTS, SWARM, HANDOFF, EXPANSION consulted; direct lane
RESUME_HERE.md returned 404, recovered actual RUN77 cbe15af7.
Latest peers kernel RUN52 6a47079d, theta RUN78 f1abc81e, audit
446c68f9, Landau 0f636e8e read; recent commit list also inspected.
No reliance on any uncompiled peer overlay. No rediscovery of their
carry, count or log-free index bounds.

Sources relative to grh-compact/src:
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  233–240 hasType_prod_markOperator_pow, 255–260 gaugeLe_Bmu_of_isMarked,
  264–268 gaugeLe_collisionSum, 272–276 gaugeLe_pow_jetCeil_smul,
  285–307 exists_indexDvd_Bmu_divisible.
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  15–18 hasType_markOperator (for EVERY natural truncation s).
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
  83–104 allowedLoss and aggregate.
The original native graph and all primitive hypotheses remain intact.

## 1. Stronger local theorem with the existing native index bound

Fix D, a small nonsplit prime p and the same PadicPlace as the actual
exists_indexDvd_Bmu_divisible. Write L=loss(p), G=gain(p),
C=m*collisionSum(p,empty), J=jetCeil(p), M=integralColumns,
d0=finrank C(Column) (here C in finrank means complex field).
From the actual proof, L>=1, C>=0 and C<=J by collisionSum_le and
Nat.le_ceil. The three available native gauge statements have exponents
  unmarked: C+L-G;
  full marked Y^m: 2L-G;
  scaled unmarked p^J: L-G.
No change to the data or the gauges. We only alter the choice of S.

For EVERY integer beta <= G-2L there exist a natural l<=3L*d0
and S with IndexDvd M S (p^l) and the same uniform integrality
conclusion as exists_indexDvd_Bmu_divisible. The condition is strictly
weaker than beta<G-3L+1 on the actual small-nonsplit branch (L>=1).
At L=1 the new condition also includes the endpoint when integral;
for large L the gain is about one loss unit L, not one p-adic digit.
This is not a modification of the theorem on p=N or other primes.

Proof: if C+L-G<=-beta, take S=M,l=0 directly via
gaugeLe_collisionSum and the same scaling argument k at lines 289–291.
No Hecke transfer, projector, count or index theorem is needed on this
branch, EVEN when a full mark exists. Otherwise beta+C+L-G>0.
Since beta<=G-2L, this implies C>L. The source dichotomy at line 299
is full mark OR C<=L; the latter is impossible. Choose the same full
mark Lambda and Y as in the source. Define
    s=ceil_nat(beta+C+L-G).
Natural ceiling already truncates at zero. It is the least nonnegative
integer satisfying C+L-G-s<=-beta. Because beta+L-G<=-L<=0,
s<=J by C<=J and J integral. In fact
    s <= ceil_nat(C-L)
and for the original beta<G-3L+1,
    s <= ceil_nat(C-2L+1).
Use the original HasType.prod on the SAME list of marks repeated m
times, with this s in place of J. The actual per-mark theorem is
parameterized by arbitrary s, and its coefficient is nondecreasing
in s. Thus the very same sum estimate used in lines 235–240 gives
l<=3L*d0. More precisely the native witness satisfies
    l <= d0 * [128*logB/p * sum_l A_l
                  + m*|Lambda|*(s/x^14+x^40)].
This uses the actual product lemma, not a claim about divisibility
of indices over a nondiscrete valuation ring. Set
    S=Y^m M + p^s M.
For every good datum and twist prime to p, every column in S is
Y^m u + p^s v with u,v in M. The first summand has exponent
2L-G<=-beta. The second has exponent C+L-G-s<=-beta by
gaugeLe_collisionSum, linearity and norm(p^s)=p^(-s).
Apply the exact k argument in LocalStatement to each summand,
then add integral forms. No ramification assumption on u or v is
needed; the conclusion keeps the source ramified-column guard.
All choices beta,S,l,Lambda,s are made BEFORE the universal quantifier
over twists, good data and columns. They depend only on D,p,beta
and the fixed p-adic embedding. This preserves the essential
simultaneous submodule requirement.

## 2. Optional composition, not needed for the proved reduction

Theta RUN78 f1abc81e gives a human replacement of the per-mark
z guard; if independently replayed, replace 128 logB in the displayed
index by 3, giving l<=6(fa/p)d0 since s<=J. Combined with this
adaptive construction the local index and valuation budgets need
not be tied to a single 3L. In particular at beta=floor(G-2L),
the valuation shortfall is less than 2L+1, while the index bound
is the separate 6fa/p (or zero when the unmarked check succeeds).
No assertion that the downstream global product formula accepts these
separate budgets yet. Do not silently substitute 2L for allowedLoss:
its original definition also pays index, and integer rounding matters.
Keep exceptional N branch, all non-small branches, simultaneous
index assembly, archimedean and all other A/B/C premises.

Negative control: increasing beta beyond G-2L cannot be justified
by increasing s, because s only scales the unmarked summand;
the marked summand is unchanged. Also the zero-index branch is
justified by the gauge bound, not by estimating a small positive index.

Original local graph:
allowedLoss(=3L) -> choose full mark first or C<=L ->
HasType at J and two gauge estimates -> common index+valuation.
Candidate human graph:
check beta+C+L-G<=0 first -> direct unmarked (index zero);
else full mark via C>L -> HasType at adaptive s + two separate
gauge bounds -> same index, stronger valuation.
Old native graph and axiom ledger untouched; no global retirement.
Cache key: compact pin,D,p,embedding,beta,L,G,C,J,M,Lambda,Y,s;
same good-data and twist quantifiers. No declaration-only reuse.

## 3. Executed checks and boundary
Local CPython 3 Fraction arithmetic actually executed:
    from fractions import Fraction as F
    from math import ceil, floor
    checks=skip=positive=0
    for L0 in range(1,21):
      for L in (F(L0),F(2*L0+1,2)):
        for C in (F(0),L/2,L,2*L,3*L,10*L):
          for G in (F(0),L/2,2*L,10*L):
            for b in range(floor(G-2*L)-5,floor(G-2*L)+1):
              J=ceil(C); s=max(0,ceil(b+C+L-G))
              assert s<=J and 2*L-G<=-b and C+L-G-s<=-b
              assert s<=max(0,ceil(C-L))
              if s==0:
                assert C+L-G<=-b; skip+=1
              else:
                assert C+L-G-(s-1)>-b; positive+=1
              if C<=L: assert s==0
              if b<G-3*L+1: assert s<=max(0,ceil(C-2*L+1))
              checks+=1
    print(checks,skip,positive)
Output: checks=5760 skip=3023 positive=2737, exit 0.
These are scalar tests only, not actual D/p observations or an
asymptotic prime test. The symbolic proof is separate.

Local command -v lean/lake returned none. No native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier run. Prepared
scalar lemmas below, not compiled. Historical actual state files
compute/rh-recursive-reduction-strip-root-20261125/status.json
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
compute/rh-proof-term-prune-native-20261125/status.json
7da354941e402b6f8b364ed03d8c5c82d27b7717 re-read: both pass, old
conditional strip root and bounded scan only; 324 pending in scan.
Compact compute/rh-compact-primitives-replay-20261126/outputs/
targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804
re-read: six B/C declarations report standard three axioms,
A build timeout 124 at 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. No new native PASS. No URT.

RESUME HERE: independent audit of the adaptive construction at
LocalStatement lines 285–307, then inspect the exact global short-row
consumer to determine whether separate valuation and index budgets
reduce its total loss after integer rounding. Do not change
allowedLoss globally before that proof. Retain the decisive
prime-window bound as OPEN. HANDOFF TO integration, theta, kernel,
formal audit and editor.
-/

namespace CompactPrimeRun78

theorem old_threshold_implies_new (L G b : ℝ)
    (hL : 1 ≤ L) (hb : b < G - 3*L + 1) :
    b ≤ G - 2*L := by linarith

theorem adaptive_exponent (L G C b : ℝ) (J : ℕ)
    (hL : 0 ≤ L) (hC : C ≤ (J:ℝ)) (hb : b ≤ G-2*L) :
    let s := ⌈b+C+L-G⌉₊
    s ≤ J ∧ 2*L-G ≤ -b ∧ C+L-G-(s:ℝ) ≤ -b := by
  dsimp
  have hs := Nat.le_ceil (b+C+L-G)
  refine ⟨(Nat.ceil_le).2 ?_, by linarith, by linarith⟩
  linarith

theorem skip_mark (L G C b : ℝ) (hC : C ≤ L)
    (hb : b ≤ G-2*L) : C+L-G ≤ -b := by linarith

theorem adaptive_is_minimal (L G C b : ℝ) (s : ℕ)
    (h : C+L-G-(s:ℝ) ≤ -b) :
    ⌈b+C+L-G⌉₊ ≤ s := by
  apply Nat.ceil_le.mpr
  linarith

theorem monotone_index_payment (A q r n : ℝ) (s J : ℕ)
    (hq : 0 ≤ q) (hn : 0 ≤ n) (hs : s ≤ J) :
    (A+q*(s:ℝ)+r)*n ≤ (A+q*(J:ℝ)+r)*n := by
  have hcast : (s:ℝ) ≤ (J:ℝ) := by exact_mod_cast hs
  have hmul := mul_le_mul_of_nonneg_left hcast hq
  apply mul_le_mul_of_nonneg_right _ hn
  linarith

#print axioms old_threshold_implies_new
#print axioms adaptive_exponent
#print axioms skip_mark
#print axioms adaptive_is_minimal
#print axioms monotone_index_payment
end CompactPrimeRun78

#check Data.IsMarked.hasType_markOperator
#check Data.IsMarked.hasType_prod_markOperator_pow
#check Data.IsGoodDatum.gaugeLe_collisionSum
#check Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
#check Data.exists_indexDvd_Bmu_divisible
#print axioms Data.exists_indexDvd_Bmu_divisible
