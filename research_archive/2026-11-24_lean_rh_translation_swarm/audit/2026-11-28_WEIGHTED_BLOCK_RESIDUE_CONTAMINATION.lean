import Mathlib

/-!
# Audit — weighted block residue contamination, not singleton selection
28 November 2026. HUMAN DERIVATION / PREPARED scalar Lean certificate.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484;
AGENTS, SWARM, HANDOFF; branch head c2887c5e30a61d7a807d0e66513274042d135567.
Peer weighted dyadic note c08f76e4e0d243d49894f3452587972bc35198c2,
RUN84 pair/block packing 9c65fc2c222ec6a47b50239a98642b9db9234d8b,
RUN98 b1572949fc9032a7b5de11f8ee8c451bc2a70bb6 and RUN102 repair f700db28
read. This is not another dyadic-count equivalence, nor the RUN84
all-good-block hitting argument: a SINGLE large block may contain
nonreal exceptional twists. We bound their actual residue contribution.

## Sufficient arithmetic target

Fix M=18480, 0<e<1/100, beta=1/2+8e, eta=8e/9, a=1-2e/9.
For arbitrarily distant dyadic windows X=2^k, k>=1, require a finite
set B of primes X<d<=2X, d=9239 mod M, with |B|>=X^a. Each member
must avoid real zeros of ALL entireL(quadTwist xi d) at real s>beta.
This last condition is independent of any hypothetical nonreal zero.
Write w(d)=log(d)/d, W=sum_B w(d)>0. The new arithmetic hypothesis is
one eventual weighted-average bound for the SAME fixed block:
    sum_B w(d) primeError(d,M,x) / W <= x^(beta-1).
Neither an individual bound nor a disjoint packing of all-good blocks
is assumed. B is chosen before the variable x tends to infinity.
Require these blocks for a sequence of e tending to zero.
The one weighted mean bound for such blocks is OPEN, not a result of
ordinary prime distribution or zero density.

## 1. Actual source and signs

New/Endgame/PrimeError.lean blob 63eb3d79d95ad815878e623b96f237240058c8e2,
isPolar_primeError, gives residue
    r_d(s)=(U(s)-T_d(s))/(phi(M)*s*(1-s)),
where U(s)=sum_xi ord_s entireL(xi), T_d(s)=sum_xi ord_s entireL(quadTwist xi d).
Lib/Analytic/Landau/PolarLandau.lean 6b80c9062a74ecadcd9c51f9459cb3c71ac2ded9,
IsPolar.landau, entireL_ne_zero, tendsto_sub_mul_logDeriv_entireL,
quadTwist_ne_one. All order counts are nonnegative integers. For
real beta<s<1 the block's real-zero exclusion gives T_d(s)=0.
Consequently the weighted residue is nonnegative there. For real
s>=1 every order is zero by entireL_ne_zero (at s=1 use the native
total division convention). Do NOT replace this sign guard by an
asymptotically small positive bad fraction: any negative residue
at a real zero may obstruct the native Landau lemma.

The finite positive weighted average is IsPolar: use the same weighted
average of meromorphic witnesses, finite linearity of the integral
on Re(s)>2, finite linearity of the analytic-at and punctured-limit
conditions, and the weighted average of the finitely many growth
constants in the definition. This generalizes RUN84's pair mean
without needing a pair incidence argument. Its residue is
    r_B(s)=(U(s)-sum_B w(d)*T_d(s)/W)/(phi(M)*s*(1-s)).
No limit of meromorphic functions is exchanged. IsPolar.landau with
the stipulated mean bound forces r_B(rho)=0 at any Re(rho)>beta.

## 2. Nonreal exceptional multiplicity is only logarithmic

Let rho=sigma+it with beta<sigma<1 fixed. For any xi mod M and any
eligible prime d, the twisted character is nonprincipal modulo q=Md
by quadTwist_ne_one; hence entireL equals its ordinary L-function.
A nonprincipal character has zero sum per period, so its partial sums
are bounded by q. Abel summation gives, on Re(z)>0,
    L(z,chi)=z integral_1^infty A(u) u^(-z-1) du,
    |L(z,chi)| <= q |z| / Re(z).
This defines the same analytic continuation by equality on Re(z)>1.
At z0=2+it, absolute convergence gives
    |L(z0,chi)| >= 1-sum_{n>=2} n^(-2) = 2-zeta(2) > 0.
In the disc of radius 7/4 around z0, Re(z)>=1/4,
|z|<=|t|+4, so the maximum is <=4q(|t|+4).
Jensen's formula on a radius R in (13/8,7/4) avoiding boundary
zeros gives, for zeros within radius 3/2 counted with multiplicity,
    N <= log(4q(|t|+4)/(2-zeta(2))) / log(13/12).
Indeed each such zero contributes at least log(R/(3/2))>log(13/12).
The fixed rho lies strictly within radius 3/2. Thus summing over the
phi(M) characters gives T_d(rho) <= C_(M,t) log(2Md).
No unproved RH, uniformity over t, or bound for a varying rho is used.
The finite-character count and constants may depend on fixed M,t.

## 3. Density controls contamination, not only hitting

Lib/Analytic/QuadraticTwist/ZeroFreeTwist.lean blob
1d873bd3fef2c4ba301ce38e0469cc1817e6aa11, zero_density_quadTwist,
for fixed eta>0 and y=|t| bounds bad primes <=2X by O((2X)^(1-eta/2))
after the finite union over xi. Use eta=8e/9 so
1/2+9eta=beta and 1-eta/2=1-4e/9. This uses the exact native
weak inequality Re(s)>=beta. Every d with T_d(rho)>0 is in that
exceptional set. No uniformity in y needed.
On X<d<=2X, X>=2, w(d) between log X/(2X) and log(2X)/X,
so wmax/wmin<=4. Therefore on the chosen block
    0 <= sum_B w(d) T_d(rho)/W
      <= 4 C_(M,t) log(4MX) * #bad(2X)/|B|
      = O_(M,t,e)(X^(-2e/9) log(4MX)) -> 0.
The exponent slack is essential: the logarithmic multiplicity is not
controlled by merely unbounded ratio at the SAME density exponent.

If some entireL(xi0) vanishes at rho, U(rho)>=1. For a sufficiently
distant eligible block the average twist order is <1, hence
    U(rho)-sum_B w(d) T_d(rho)/W > 0.
The denominator is nonzero (rho neither 0 nor 1). This contradicts
Landau's zero-residue conclusion for this SAME fixed block.
The conclusion is the right half-plane nonvanishing for the fixed
modulus M and, by principal-character induction and the functional
equation already used by RUN82, RH. Nothing here imports New.Main or
asserts the arithmetic block-average premise unconditionally.

## 4. Relation to the previous target and a real obstruction

The previous all-tolerance canonical singleton count escape with
exponent a supplies the new target: use its peer dyadic shell count
escape to find arbitrarily large windows with count >2 X^a; delete
the real exceptional set O(X^(1-4e/9)) using the stronger native eta
above. The survivors number >=X^a for sufficiently large X.
Each individually good prime has the endpoint bound by the existing
RUN98 bridge, so a finite weighted average retains it, taking the
maximum of finitely many thresholds. All native class guards retained.
This implication does not require a new geometric bound.

The new condition does not ask that every chosen prime have its own
upper bound. Nor does it require the chosen block to be free of
nonreal exceptional twists; it can contain such twists as long as
their weighted orders cannot cancel the base multiplicity. This is
a genuine relaxation of the requested arithmetic object, not a
claim of strict separation for actual primeError (unknown).
It opens a direct block-average route for quadratic-character mean
estimates. A mean with a moving block depending on x is NOT sufficient:
it has no fixed meromorphic transform. Also a mean over an arbitrary
block containing real-zero twists cannot use the same Landau sign
argument. Both are rejected routes, not counterexamples to RH.

Original graph retained:
RUN98 -> RUN82 singleton count -> density -> native residue/Landau -> RH.
RUN84 graph retained:
degree-normalized pair packing -> all-good block -> mean Landau -> RH.
New source-level conditional graph:
fixed real-safe weighted block mean + native density + logarithmic
multiplicity -> positive aggregate order at rho -> finite mean
IsPolar.landau -> fixed-M nonvanishing -> existing reflection.
No global dependency deletion or kernel graph claim.

## 5. Executed evidence

Local Python, exact Fractions, 271452 weighted contamination tests
and one strict real-sign negative control, all assertions succeeded:
```python
from fractions import Fraction as F
from itertools import product
nchecks=0
for n in range(1,6):
 for w in product(range(1,5),repeat=n):
  for t in product(range(3),repeat=n):
   b=sum(v>0 for v in t)
   assert F(sum(a*v for a,v in zip(w,t)),sum(w)) <= F(8*b,n)
   nchecks+=1
assert nchecks==271452
assert F(1,10)<1
assert (F(0)-F(1,10))/(F(3,4)*(1-F(3,4)))<0
```
These verify finite normalization/sign controls, not the asymptotic
arithmetic premise. Actual RUN99 status on state branch blob
294e96059d7723a0ca2162d790ff0d7aeb5dea6b is ERROR (46129085575,
09:36:01Z); RUN102 repair status and output paths returned 404
when read in this run. No new native replay or graph accepted.
Local command -v lean/lake empty; native rh_scan/prune/reduce/auto/
frontier not executed. The scalar certificate below is PREPARED only.
No URT performance claim.

RESUME HERE: connect the fixed-block arithmetic mean to the actual
native guarded budget identity using the per-prime positive normalizer
m*a*H; aggregate BEFORE absolute values, not by summing separate
pointwise bounds. Keep real-zero exclusion and fixed-block quantifier.
Use RUN84 finite mean IsPolar infrastructure for native replay after
the shared RUN102 receipt, no new cold build or schedule changes.
HANDOFF TO prime/math/dependency/integration. PARTIAL; RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false

namespace RHAuditWeightedBlock

/-- Exact finite contamination bound before dividing by the total weight. -/
theorem weighted_order_sum_le {ι : Type*} [DecidableEq ι]
    (B bad : Finset ι) (w t : ι → ℝ) (whi L : ℝ)
    (hb : bad ⊆ B)
    (hw : ∀ i ∈ B, 0 ≤ w i ∧ w i ≤ whi)
    (ht : ∀ i ∈ B, 0 ≤ t i ∧ t i ≤ L)
    (hz : ∀ i ∈ B, i ∉ bad → t i = 0)
    (hL : 0 ≤ L) :
    (∑ i ∈ B, w i * t i) ≤ (bad.card : ℝ) * (whi * L) := by
  classical
  have heq : (∑ i ∈ bad, w i * t i) = ∑ i ∈ B, w i * t i := by
    apply Finset.sum_subset hb
    intro i hi hin
    simp [hz i hi hin]
  rw [← heq]
  calc
    _ ≤ ∑ i ∈ bad, whi * L := by
      apply Finset.sum_le_sum
      intro i hi
      have hwi := hw i (hb hi)
      have hti := ht i (hb hi)
      exact (mul_le_mul_of_nonneg_left hti.2 hwi.1).trans
        (mul_le_mul_of_nonneg_right hwi.2 hL)
    _ = _ := by simp [nsmul_eq_mul]

/-- Nonzero base multiplicity survives a weighted contamination < 1. -/
theorem positive_residue_numerator (U T W : ℝ)
    (hU : 1 ≤ U) (hW : 0 < W) (hT : T < W) :
    0 < U - T/W := by
  have h : T/W < 1 := (div_lt_iff₀ hW).2 (by simpa using hT)
  linarith

end RHAuditWeightedBlock

#print axioms RHAuditWeightedBlock.weighted_order_sum_le
#print axioms RHAuditWeightedBlock.positive_residue_numerator
