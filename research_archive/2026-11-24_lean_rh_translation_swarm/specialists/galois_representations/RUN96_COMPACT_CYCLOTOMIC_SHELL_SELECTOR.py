#!/usr/bin/env python3
"""RUN96 — direct cyclotomic-shell counting for the common twist.
28 Nov 2026. SOURCE-MATCHED alternative human proof; not native Lean.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION read; recent peer commits e9a9a956,
96f2e2a0, 0265d246, a6ccfe57 inspected via branch commit list.
Prior work: RUN52 and HUMAN_PROOF_COMPACT lines 2062–2074 (audit
5512bf37) already give the common root selector via powered polynomial
interpolation. This is an alternative proof of its actual univariate
supplier, not a repeat of the downstream fitting or arithmetic budget.

Exact source: grh-compact/src/New/Selmer/RootsOfUnityPoints.lean
blob 7c07be15e6c410124a9bc5ecb470e7750ac67074,
exists_root_of_unity_eval_large -> exists_roots_of_unity_ellVal_le.
The latter feeds BOTH point selections in New/Selmer/TwistTheorem.lean
exists_anticyclotomic_twist (blob bdf0bed65edefd067b584695b1fac0b6acbbd754).
That supplier feeds the actual TwistForRows.lean theorem
exists_mFoldTwist_selmerLengthLe (802242498ad4530e7f52cc4f14e0a03be2c59f4d)
and FitTwistsExist.lean exists_isFitFamily (da769eba595af2f883eed9b82dbd322a521aea14).

1. Exact statement and quantifiers.
Fix prime p, 0<r<1, finite family of positive y_k. Normalize valuation
v by v(p)=1, v(0)=infinity; set t=v(r) in the sense
t=-log(r)/(-log|p|)>0 and b_k=-log(y_k)/(-log|p|).
For every sufficiently large N, then every sufficiently large
coefficient ring O (containing a primitive p^N-th root), and EVERY
family of integral polynomials F_k satisfying Gauss norm g_r(F_k)>=y_k,
show there is ONE zeta with zeta^(p^N)=1 and
|F_k(zeta-1)|>=r*y_k for every k. The empty family is trivial.
If any y_k>1 the premise is impossible; otherwise B=sum b_k>=0.
No bound on degrees, no restriction on coefficient ramification.
In fact the extra original assumption |p|<r^(p-1) is unnecessary
for this proof; retain it in an original-statement adapter.

2. Total root budget (factor BEFORE estimating).
In the algebraic closure factor F_k(X)=c_k prod_a (X-alpha_ka),
counting multiplicities. Each F_k is nonzero by the positive Gauss
premise. Write G_s(F)=-log(g_{|p|^s}(F))/(-log|p|).
Gauss norm multiplicativity gives
    G_s(F_k)=v(c_k)+sum_a min(s,v(alpha_ka)).
For completeness multiplicativity holds for all real radii: choose the
largest maximizing coefficient index in each factor; at their summed
index their product strictly dominates every other summand, since any
other pair has one index above its largest maximizer. Apply the
ultrametric inequality and the upper bound on every coefficient.
Integrality gives G_0(F_k)>=0; the premise gives G_t(F_k)<=b_k.
Subtract EXACTLY:
    sum_a min(t,max(0,v(alpha_ka)))=G_t(F_k)-G_0(F_k)<=b_k.
This holds also for roots zero and roots outside the unit disk.
For j>=1 let S_j={zeta-1 : zeta primitive p^j-th root},
n_j=p^(j-1)(p-1), t_j=1/n_j. All x in S_j have v(x)=t_j.
Take j0>=1 with t_j0<=t, independent of all polynomials.
Let C_j count ALL roots of all F_k, with multiplicity, at valuation
exactly t_j. Disjoint valuation shells give, for every N>=j0,
    sum_(j=j0..N) t_j C_j <= B.                        (1)

3. Cost of one root on one shell; no interpolation or powered error.
For alpha of valuation t_j define e_alpha(x)=v(x-alpha)-t_j>=0
on S_j, possibly infinity. Select a closest x0 in S_j (max v).
For x!=x0, ultrametricity and maximality imply
v(x-alpha)<=v(x-x0). Indeed strict reverse would force
v(x0-alpha)=v(x-x0)<v(x-alpha), contradiction.
The primitive cyclotomic polynomial gives exactly
    sum_(x!=x0) v(x-x0)
      = v(Phi'_(p^j)(1+x0)) = j-1/(p-1).
The derivative follows by differentiating
(X^(p^j)-1)=Phi_(p^j)(X)(X^(p^(j-1))-1) at 1+x0.
The denominator there is a primitive p-th root minus one, hence
valuation 1/(p-1). Subtract the common shell baseline:
    sum_(x!=x0) (v(x-x0)-t_j)
      = j-1-1/(p-1)+t_j <= j-1.
Cap the possibly infinite coincidence term BEFORE summing. Thus
    sum_(x in S_j) min(t,e_alpha(x)) <= t+j-1.        (2)
For alpha of any other valuation there is no excess:
v(x-alpha)=min(t_j,v(alpha)) for every x in S_j.
All formulas include p=2, j=1, repeated roots and exact coincidences.

4. The decisive contradiction.
Suppose every p^N-th root fails at least one k. Every x in S_j,
j0<=j<=N, then has a k with v(F_k(x))>b_k+t.
By monotonicity G_tj(F_k)<=G_t(F_k)<=b_k. Subtract the exact
factorization baseline: sum of excesses from its roots on this
shell is >t (including infinity if F_k(x)=0). Capping each excess
at t preserves a sum >=t. The total capped contribution across ALL
k at this x is therefore >=t. Sum over x in S_j and use (2):
    n_j t <= (t+j-1) C_j.
Divide by n_j and use (1). Necessary condition for universal failure:
    B >= sum_(j=j0..N) t/(t+j-1).                     (3)
The right-hand sum diverges as N grows (positive t). Choose N0
so that it is >B at N0; it stays >B for all N>=N0.
Contradiction. N0 depends only on p,r,finite thresholds y_k;
the coefficient-ring cutoff only needs primitive p^N roots, exactly
as in the source. This proves the univariate supplier with its
original complete quantifiers, and a strictly weaker radius premise.
It avoids the source's auxiliary power a(j+1), polynomial S and E,
derivative-error norm estimate and comparison of two Gauss radii.
It still uses finite factorization, nonarchimedean norm, cyclotomic
root valuation and primitive-root existence. No new conjectural input.

5. Integration boundary.
Use the existing multivariable/all-powers reduction unchanged:
it calls the univariate selector, then chooses each coordinate
sequentially, retaining the common degree and point-divisibility
guards and all monic exclusions. No independently chosen twists.
The resulting C1 supplier remains conditional on the other balanced,
tied-pencil, sharp fitting and value family foundations. This local
human replacement has NOT been elaborated or integrated into Lean;
no old declaration globally retired, no RH theorem imported.

Actual checks: compact source and actual caller bodies retrieved,
prior interpolation audit compared. Exact finite check below executed
locally in Python: 16 shells, 127778 ordered distinct primitive-root
pairs, 2956 capped inequalities. It checks the cyclotomic-distance
valuation sum in units of t_j; it is NOT an execution over local
fields, native Lean, rh_scan/prune/reduce/auto/frontier, nor a proof
of the analytic infinite-family claim. The human argument above
is the proof. Negative control: omitting the cap at alpha=x0
makes the left side infinite and (2) false.
RUN95 state status.json and run95/run93 receipts still absent
(404). Exact RUN95 workflow run 46112805658 cancelled; subsequent
compute run 46114460776 pending, older 46108846902 in progress
when queried. Do not report C1 replay PASS or launch duplicate jobs.

RESUME HERE: inspect the already registered C1 finite-cache job's
actual run95/run93 receipt; on authenticated compact host, if
accepted, hand its exact fit supplier to the existing squared C
caller. Independently audit the new root-shell proof at the
univariate interface before any native replacement; do not start a
second root-selector build while C1 verification is queued.
HANDOFF integration / kernel / audit. C1 and RH remain OPEN.
"""


def check():
    layers = pairs = caps = 0
    for p in (2, 3, 5, 7):
        for j in range(1, 6):
            m = p**j
            if m > 400:
                continue
            roots = [a for a in range(m) if a % p]
            n = len(roots)
            assert n == p**(j-1)*(p-1)
            for a in roots:
                excess = []
                for b in roots:
                    if a == b:
                        continue
                    d = abs(a-b)
                    k = 0
                    while d % p == 0:
                        d //= p
                        k += 1
                    excess.append(p**k-1)
                    pairs += 1
                assert sum(excess) == n*(j-1)-n//(p-1)+1
                for c in (1, 2, 3, n):
                    assert c+sum(min(c,e) for e in excess) <= c+(j-1)*n
                    caps += 1
            layers += 1
    return dict(layers=layers, pairs=pairs, caps=caps,
                negative_control="exact root coincidence has infinite uncapped valuation")


if __name__ == "__main__":
    print(check())
