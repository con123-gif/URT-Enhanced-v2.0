# RUN97 — degree-free simultaneous selector via one pullback and weighted coefficient induction

28 November 2026. SOURCE-MATCHED HUMAN DERIVATION; no new native replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7, 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484. AGENTS, SWARM/HANDOFF/EXPANSION and relevant continuity read. Recent branch commits f7f1eb8f, a8f3a857, 0dfa2555, 937202ae, 9884a76f and 7166a368 inspected at commit-list level (different lanes).

Actual target: New/Selmer/RootsOfUnityPoints.lean blob 7c07be15e6c410124a9bc5ecb470e7750ac67074, both exists_root_of_unity_eval_large and exists_roots_of_unity_ellVal_le. Valuation.lean c899d1a8a4d57c8e996b653e805d26ab5309f82d supplies ellVal_le_iff, ellVal_pow, primitive-root existence. Both actual consumers in New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754, lines 119–121 (first m=1 helper; second all m powers), feed exists_anticyclotomic_twist, then existing RUN96 caller chain to fit family. Previous RUN52 / editorial audit 5512bf37 / HUMAN_PROOF_COMPACT § simultaneous twist already specialize at the still-unselected input points. This note instead pulls back all variables and powers once, then works solely with Gauss norms. It does not reprove the downstream twist construction.

## 1. Strengthened uniform univariate selector

Use the normalized valuation v(p)=1, v(0)=infinity, radius r=p^(-t), t>0. For a nonzero integral polynomial define G_t(P)=min_e(v(c_e)+t e). In RUN96 (207344a2, blob e08ecf3c035225f41445e115d1616b724f0314a4) the shell root-counting proof uses the thresholds b_i only via sum b_i, and the coefficient-ring cutoff only via primitive p^N roots. Reread and checked its largest-maximizer multiplicativity argument, exact signed subtraction G_t-G_0, closest-root ultrametric comparison, derivative shell count and cap at coincidence; no additional radius restriction was used. These are human checks, not independent external audit or native Lean.

Consequently fix any real B>=0 and t>0 BEFORE choosing N and O. For EVERY finite family of nonzero integral univariate P_i with sum_i G_t(P_i)<=B, even when the family, its size, its degrees and its actual Gauss values are chosen AFTER N and O, one common zeta in O satisfies zeta^(p^N)=1 and
    v(P_i(zeta-1)) <= G_t(P_i)+t   for every i.                 (U)

Proof: substitute b_i=G_t(P_i) in RUN96. All b_i finite nonnegative. For j0 with 1/(p^(j0-1)(p-1))<=t, universal failure forces
    B >= sum_(j=j0..N) t/(t+j-1).
Choose N0 making RHS > B. This choice is uniform in the polynomials and even family cardinality; O merely contains primitive p^N roots. Empty family uses zeta=1. An explicit (not computationally optimal) N0 is J*2^h-1 with integer J>=max(j0,t,1) and integer h>4B/t: each block [2^k J,2^(k+1)J-1] contributes >=t/4. The original univariate statement follows with B=sum_i b_i, where b_i=-log_p y_i; if some y_i>1 its premise is impossible. This quantifier strengthening is essential below: choosing a coefficient with an unbounded residual degree makes its actual Gauss threshold data-dependent. Do not silently use the original fixed-threshold statement with the quantifiers reversed.

## 2. One pullback of every polynomial

In the exact multivariate source statement fix delta>0, m,L,a,q and finite k with B_k finite nonnegative. Let I=k x [1,m] and s=#sigma<=q. Take
    t=min(1/(ma+1), delta/(q+L+1)) >0.
If s=0, all source polynomial values are already the same as input values and coordinate conclusions are vacuous. If a=0, s>0 and I nonempty, source divisibility p|(u-1)^0=1 is impossible. If I empty ignore the pullbacks and retain monic exclusions. These cases include m=0. For remaining cases a>0, d in [1,m], define ONCE
    Q_i(X_1,...,X_s)=F_i((1+X_1)^d,...,(1+X_s)^d).
For each input u_ij, factor the monic (1+X)^d-u_ij over the algebraic closure. Its roots are integral (|u_ij|<=1); their product up to sign is 1-u_ij. If u_ij=1 choose root 0; otherwise at least one has v(w_ij)>=v(1-u_ij)/d>=1/(ad)>=t by the source divisibility. Thus Q_i(w_i)=F_i(u_i), with every v(w_ij)>=t. Evaluation on the closed polydisc yields
    G_t(Q_i)=min_e(v(c_e)+t|e|) <= v(F_i(u_i)) <= B_k.
The auxiliary w_i need not lie in O and are NOT the final selected points. No extension of O depending on F or u is needed. All Q_i nonzero by the finite original valuation bound.

Set D(X)=prod_n D_n(1+X); integral, monic, degree <=L, hence G_t(D)<=Lt (empty product 1). One application per coordinate of the same D suffices for all exclusions.

## 3. Exact coefficient transport: no pointwise re-specialization

After h coordinates have been selected, write Q_i^(h) for evaluation at the chosen x_1,...,x_h in O. Induct with G_t(Q_i^(h))<=B_k+h t. For the next variable X expand
    Q_i^(h)(X,Y)=sum_beta f_i,beta(X) Y^beta.
Choose beta_i attaining the minimum in
    G_t(Q_i^(h)) = G_t(f_i,beta_i)+t|beta_i|.                 (1)
This is an exact finite coefficient grouping (no norm estimate before grouping). All f integral. The sum of G_t(f_i,beta_i) over I is <= sum_i B_k+|I| q t, independently of all choices. Append D, paying at most Lt. Use (U) with the fixed budget
    B = sum_(i in I) B_k + |I| q t + Lt.
Thus one N0 and eventual O work for all s<=q, all degrees, and all stages, even though the coefficient indices are chosen adaptively. At the next common x=zeta-1, the coefficient at beta_i of the evaluated Q is EXACTLY f_i,beta_i(x). Consequently
    G_t(Q_i^(h+1))
      <= v(f_i,beta_i(x))+t|beta_i|
      <= G_t(f_i,beta_i)+t+t|beta_i|
       = G_t(Q_i^(h))+t <= B_k+(h+1)t.                    (2)
No loss from other monomials, no degree bound. The same zeta has v(D(zeta-1))<=G_t(D)+t<=(L+1)t<=delta. Each integral D_n(zeta) has nonnegative valuation, so each <=delta (product is nonzero). Previously selected coordinates are never changed. Repeat s times. At h=s the Gauss valuation is the scalar valuation:
    v(F_i(zeta_1^d,...,zeta_s^d)) <= B_k+s t <= B_k+delta.
Every zeta_j is a p^N-th root in the SAME O, satisfying all exclusions. This is the entire original multivariate conclusion, with exact order of quantifiers and no independent choices of twists. No original source premises dropped at its interface. The decisive replacement is (1)–(2), using the strengthened uniform (U), instead of repeatedly specializing at the input points u and reconstructing a root witness at every coordinate. It still needs standard algebraic closure, valuation, cyclotomic derivative and finite polynomial lemmas. It is not a proof of the sharp Fitting polynomial, balanced/tied pencil, crystalline foundations or C1 as a whole.

## 4. Executable finite regression and limitations

The following code was run locally with Python (540 coefficient identities; 3,061 accepted specialization implications). This tests exact integer polynomial coefficient grouping and valuation cancellation, not p-adic cyclotomic existence or a Lean theorem. Negative control at the proof-interface level: Q(X,Y)=Y^M has selected f=1, G_t(Q)=Mt. Using only the old fixed threshold p^(-Mt) for f certifies v(f(x))<=(M+1)t and after multiplying by Y^M yields (2M+1)t, NOT the target (M+1)t for M>0. Actual f=1 of course meets the stronger estimate; the counterexample is to the weaker certificate's inference, not the selection theorem.

```python
from fractions import Fraction as Q
from itertools import product
from random import Random

def vp(n,p):
    if not n:return None
    n=abs(n); k=0
    while n%p==0:n//=p;k+=1
    return k

def gauss(poly,p,t):
    return min((Q(vp(c,p))+t*sum(e) for e,c in poly.items() if c),default=None)

def eval_first(poly,x):
    out={}
    for (a,*b),c in poly.items():
        b=tuple(b);out[b]=out.get(b,0)+c*x**a
    return out

rng=Random(97); tests=accepted=0
for p,q,t in product((2,3,5),(1,2,3),(Q(1,3),Q(1,2),Q(2))):
    for _ in range(20):
        P={tuple(rng.randrange(5) for _ in range(q)):rng.randrange(-30,31) for _ in range(15)}
        g=gauss(P,p,t)
        if g is None:continue
        e,c=min(((e,c) for e,c in P.items() if c),key=lambda z:Q(vp(z[1],p))+t*sum(z[0]))
        b=e[1:]; f={(a,):v for (a,*beta),v in P.items() if tuple(beta)==b}
        gf=gauss(f,p,t); assert gf+t*sum(b)==g; tests+=1
        for x in range(-3,4):
            ev=eval_first(f,x).get((),0); v=vp(ev,p)
            if v is not None and v<=gf+t:
                new=gauss(eval_first(P,x),p,t);assert new is not None and new<=g+t;accepted+=1
print(tests,accepted)  # actual 540 3061
```

Native Lean/lake not installed locally. No rh_scan/prune/reduce/auto/frontier execution, new kernel axioms or graph comparisons claimed. Existing original/reduced graphs and all earlier obligations untouched. RUN95 queued cache status.json, outputs/run95.json, outputs/run93/run93_receipt.json and outputs/run93/five_root_comparison.json were individually fetched from cathedral-research-state compute/rh-compact-c1-finite-cache-20261128/ and all returned 404. Existing older c1_native_results.json still records original callers accepted and RUN84 sorryAx failure; do not import failed replacements. Latest compute queue run 46120916701 pending when queried; no duplicate job submitted. Do not infer successful verification from status alone.

RESUME HERE: inspect the registered RUN95 actual run93 compiler receipt and fix its first failing diagnostic, or if accepted connect finite_fused_run92 to the squared C caller. Keep RUN96/97 selector as a separate human candidate requiring independent audit and native original-statement transport; no second root-selector build while the C1 cache job is pending. HANDOFF integration/kernel/audit. C1 and RH remain OPEN.
