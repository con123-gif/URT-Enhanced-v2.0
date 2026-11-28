# B3 — averaged prefix fixers, one nonnegative weighted good-cell supplier (28 Nov 2026)

Status: source-matched conditional human reduction; exact rational regression executed locally; no native Lean replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude for compact source. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 / 1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484. Reuse B2 fused native receipt; no rerun. This is distinct from depth-discounted worst-child induction 1a08fa08 and signed full tensor 5b537ab5: average the actual vector fixers BEFORE recursion, never choose a worst child. No claim of independent proof of the remaining analytic estimate.

## Exact source and premises
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444 (energy_fixingSet_le, sum_le_of_positive_type); New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6 (card_mul_sum_det_le); New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18 (vectorFixer, fixingSet); New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f; New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7; New/Filling/FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9. Preserve all native admissibility, WeilData, Haar, frame, and positivity hypotheses. Original root is the empty-mask instance of sum_le_of_positive_type, not an arbitrary nonempty-mask caller.

Use q=levelPrime 0, f=number of chosen places above q>0, n=rho+1, r=k+2rho+1, E=mainEnergy>=0, delta=b^-4. Fix any ordering w_1,...,w_f. Let good(s) mean at least one chosen place has all leading minors nonzero, i.e. fixingSet(empty). Let e_s=energy(amplitudeSum univ){s}; energy is additive over finite disjoint subsets. The original hB implies Theta(s)<=e_s. Theta is nonnegative positive type. At place w and order l=1,...,n use the actual two injective frame matrices A_b from Moments.lean, namely frameImage(cond b splitGram 1) times inclMatrix. They yield B_l=A_true^T pi_w(s) A_false. The transpose/inverse-transpose fixation of A_true v is exactly the original vectorFixer in the native proof by the splitGram identity; no assumption that the two group representations are independent.

## 1. Average rather than maximize the native Fourier bound
For any nonnegative positive-type mass T on the full group, define M=sum T and F_b(v)=sum T(s) over the actual stabilizer of A_b v (with contragredient when b=true).
For nonzero v,y in the order-l coordinate space, the two orthonormal bases in card_mul_sum_det_le and Cauchy-Schwarz give
  |sum_s T(s) psi(y^T B_l(s) v)| <= q^(r/2) sqrt(F_false(v) F_true(y)).
Indeed the two tensor-vector squared norms are |G| F_false(v), |G| F_true(y); their inner product is |G| q^(-r/2) times the Fourier sum (up to conjugation). Divide by |G| and use AM-GM on the right. This is the same proof before replacing each fixer mass by a maximum.

Set a_w(s)=sum_l (#ker B_l(s)-1)/(q-1).
Nonzero y,v orthogonality gives the exact centered count from 5b537ab5. Define
  c=sum_l (1-q^(-l))/(q-1),
  K_l=q^(r/2) q^(-l)(q^l-1)^2/(q-1), K=sum_l K_l,
  p_w(s)=sum_l (K_l/K) [sum_{b in {false,true},v!=0} 1_{Fix(w,b,l,v)}(s)/(2(q^l-1))].
All K_l>0. This is a convex combination of genuine subgroup indicators, so 0<=p_w<=1 and it is positive type. The exact pointwise function uses kernel counts of the two actual linear fixation systems, not random samples.

AM-GM and summing over both vectors yield
  sum T a_w <= c M + K sum T p_w.
Proof: for each l, each F_false(v) occurs q^l-1 times and likewise F_true(y); the coefficient after AM-GM is exactly K_l times the uniform mean over b,v. Outside good, EVERY chosen place has at least one nonzero-order singular minor, so a_w>=1. Thus at any chosen w, without a support restriction on T,
  (1-c) sum T <= sum_good T + K sum T p_w.                 (P)

## 2. Only f averaged stages, no branching or prescribed fixer hypothesis
Let d=1-c>0, L=K/d, T_j(s)=Theta(s) prod_{i<=j} p_{w_i}(s). Each T_j is nonnegative positive type by Schur/tensor closure (each p_w has the Gram representation of a convex mixture of permutation orbit vectors). Let M_j=sum T_j and H_j=sum_good T_j. Apply (P) to T_j at w_{j+1} and unroll the linear inequality, without any max or separate choice of a vector:
  M_0 <= d^-1 sum_{j=0}^{f-1} L^j H_j + L^f M_f.         (U)
No missing mask, sign choice or assumption of product independence. The finite family of original worst-child obligations is replaced by the following ONE nonnegative good-cell supplier:
  sum_s e_s W(s) <= (1+8 delta) E,                         (AVG)
where W(s)=1_good(s) sum_{j=0}^{f-1} L^j prod_{i<=j} p_{w_i}(s).
This follows because Theta<=e_s; no positive-type claim is made for the indicator good. Only one prefix order is necessary. Equivalently AVG is an explicit weighted sum of the average good-cell energies for prefix lengths j<f. The averaging is over orders and actual nonzero frame directions at each selected place, not over independently sampled group elements. Can sum over permutations too, but unnecessary.

## 3. Terminal and budget
The terminal product is a convex mixture of FULL-mask subgroup intersections. For each tuple apply actual energy_le_of_linkEnergy_le with T=univ, R=empty, w=0, X=q^f, C=b^(-6kf) E, exactly as 5b537ab5 section 3. The full-mask fixation proof is the native image of chosen places into place/direction labels. X is nonzero; stability and nonnegative w,C hold. tailScale=b^(kf/4), besselEnergy<=tailScale^-44 E ensure tailScale^20 besselEnergy<=C and besselEnergy<=C; tailScale^12 E/X^k<=b^(-7kf)E<=C; linkEnergy for empty R is zero. hB bounds each term by its full-mask energy. Therefore M_f<=b^-12 b^(-6kf) E without the sharp finite-sieve theorem for that mask.

Native q in [b^10,b^11], n<=b, k>=1000(2rho+2), b>=1000 give c<=2b^-9, d^-1<=2 and n+r/2<=501k/1000. Thus L b^-6k<=4b^-9 (use K<= n q^(n+r/2)/(q-1)). In (U) terminal contribution <=b^-12 E. Under AVG,
  M_0 <= [(1+8delta)/d + b^-12]E <= (1+9delta)E,
since c(1+9delta)+d b^-12<=delta. This is precisely the original empty-mask output. No division by E; the E=0 case also covered.

Consistency: native energy_fixingSet_le for every prefix tuple would imply AVG. Its coefficient is F0=(1-delta)(1+9delta)=1+8delta-9delta^2; hence sum e_s W(s)<= F0 E sum_{j=0}^{f-1}(L b^-6k)^j. The tail beyond j=0 is at most 2*4b^-9/(1-4b^-9)<=9b^-9<=9delta^2. This verifies that AVG is a justified sufficient weakening, not a stronger obligation disguised by a change of variables. It is NOT an independent proof of AVG or of removal of the native sharp estimates. Unlike the signed tensor route, W is nonnegative and contains no product of signed kernel counts. Unlike worst-child induction, a uniform bound for every prescribed vector is not required on this alternative path. Need actual joint sieve supplier for AVG; existing individual finite-system estimates remain valid fallback.

## 4. Executed checks
CPython exact Fraction arithmetic on GL(2,F_q), q=3,5, diagonal or direct product (q=5 diagonal only), two places, both orders, and four nonnegative positive-type masses given by intersections of stabilizers. The test uses identity frame rather than native arithmetic data. 72 assertions of (P) and (U) passed (48 local, 24 unrolled). q=2,n=2 is skipped because c>=1 (outside source size hypotheses). Reproduction:
```python
from fractions import Fraction as F
from itertools import product
from math import prod
def mats(q):
    return [a for a in product(range(q),repeat=4) if (a[0]*a[3]-a[1]*a[2])%q]
def fix(a,v,b,q):
    if b: a=(a[0],a[2],a[1],a[3])
    return ((a[0]*v[0]+a[1]*v[1])%q,(a[2]*v[0]+a[3]*v[1])%q)==v
checks=0
for q in (2,3,5):
    vs={l:[v+(0,)*(2-l) for v in product(range(q),repeat=l) if any(v)] for l in (1,2)}
    ks={l:F(q*(q**l-1)**2,q**l*(q-1)) for l in vs}
    c=sum(F(q**l-1,q**l*(q-1)) for l in vs)
    if c>=1: continue
    K=sum(ks.values()); L=K/(1-c); G=mats(q)
    def p(a):
        return sum(ks[l]*F(sum(fix(a,v,b,q) for v in vs[l] for b in (0,1)),2*len(vs[l])) for l in vs)/K
    for diagonal in (True,False):
        if q==5 and not diagonal: continue
        GG=[(a,a) for a in G] if diagonal else list(product(G,repeat=2))
        for mask in range(4):
            def theta(ab): return int(all(fix(ab[j],(1,0),0,q) for j in range(2) if mask>>j&1))
            rows=[(theta(ab),p(ab[0]),p(ab[1]),any(a[0]!=0 for a in ab)) for ab in GG]
            for order in ((0,1),(1,0)):
                M=[sum(t*prod((a,b)[i] for i in order[:j]) for t,a,b,g in rows) for j in range(3)]
                H=[sum(t*g*prod((a,b)[i] for i in order[:j]) for t,a,b,g in rows) for j in range(2)]
                for j in range(2):
                    assert (1-c)*M[j]<=H[j]+K*M[j+1]; checks+=1
                assert M[0]<=(H[0]+L*H[1])/(1-c)+L**2*M[2]; checks+=1
print(checks)
```
Actual local output 72. Lean/lake not available in current host (command -v both empty). No native engine run, no new axiom or graph receipt. Existing source/replay evidence preserved; RH open.

RESUME HERE: derive AVG at the actual FixedLines.exists_intermediateGroup_lines / FiniteSystem.exists_finite_sieveSystem and Moments.energy_fixingSet_le consumer, specifically whether averaging the normalized positive kernels over nonzero frame directions before the global sieve gives the needed prefix-weighted bottom bound without a pointwise sharp estimate for each direction. If not, record the exact obstruction and keep this as a conditional alternative. Do not duplicate peer RUN93 shell replay or import Main. HANDOFF integration/Landau/positivity.
