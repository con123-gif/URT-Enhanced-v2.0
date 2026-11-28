# RUN98 — one cyclotomic exclusion suffices for the actual all-powers twist caller

28 November 2026. SOURCE-MATCHED HUMAN DERIVATION and executable finite certificate, not a native replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7, 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484 and AGENTS, SWARM, HANDOFF, EXPANSION, continuity. Latest peer commit list includes a20fc1599 (weaker spread under pending exact C), 5bde193f (pair Landau endpoint), 426d7f70 (A1 repair), 32cb51c0 (shell masks). Preserve their domains.

Actual caller New/Selmer/TwistTheorem.lean, blob bdf0bed65edefd067b584695b1fac0b6acbbd754, exists_anticyclotomic_twist, comment "Then to common roots of unity." Its second call hN J (Set.Icc 1 m) uses the monic family D_d=X^d-1 for 1<=d<=m. The returned w v <d,e> is used in the final IsAuxTwist budget after hp.pointChar_idOrConjInv (hd d) v true; all powers share the same zeta. The first call hk (Fin 1) has different characteristic-polynomial and linear exclusions and is NOT replaced. RootsOfUnityPoints.lean blob 7c07be15e6c410124a9bc5ecb470e7750ac67074; Lib/General/NumberTheory/Valuation.lean c899d1a8a4d57c8e996b653e805d26ab5309f82d. RUN96 207344a2 and RUN97 1d64a04b remain separate pending human audit/native replay. Prior aggregate Fitting selection 77bbebba and original-statement audit 5512bf37 reviewed; do not replace the required pointwise Selmer length by an average.

## 1. Exact original-selector adapter, independent of RUN96/97

Fix p prime, m>=1, k=max{a>=0:p^a<=m}, E=p^k. For any zeta with zeta^(p^N)=1 in the native coefficient ring, and any d in [1,m],

    v(zeta^d-1) <= v(zeta^E-1).                            (1)

Here v=ellVal on integral elements, including v(0)=infinity. Proof with no primitive-root valuation formula: gcd(d,p^N)=p^min(v_p(d),N) divides E, so a nonnegative integer c exists with d*c=E mod p^N (take a representative of the solution of the linear congruence). Consequently (zeta^d)^c=zeta^E. Since zeta is integral, the geometric sum identity gives
    |zeta^E-1|=|(zeta^d)^c-1| <= |zeta^d-1|.
For c=0 the left side is zero. This is exactly the norm_pow_sub_one_le_norm_sub_one inequality already used by the original RootsOfUnityPoints source. Apply the source ellVal_le_ellVal lemma with x=zeta^d-1, y=zeta^E-1. Alternatively zeta of exact order p^j has v(zeta^d-1)=infinity if v_p(d)>=j and 1/(p^(j-v_p(d)-1)(p-1)) otherwise. Since v_p(d)<=k, (1) holds including all boundary cases. E itself belongs to [1,m]; hence the maximum over d is EXACTLY v(zeta^E-1).

Use the original exists_roots_of_unity_ellVal_le with T=Fin 1, D_0=X^E-1, L=E, preserving the original hδ, m,a,q, point divisibility, F family, B bounds and all quantifiers. The polynomial is monic because E>=1. Its conclusion supplies one common tuple and the original pointwise bounds on F at all powers. It supplies v(zeta_j^E-1)<=δ for each coordinate, hence by (1) all original w j <d,e>. The actual second selector's auxiliary total degree changes from sum_(d=1..m)d=m(m+1)/2 to E<=m; no new premise, no change to the first selector's L. Choose this L before N and before the pencil J, as in the original. Same N lower cutoff for the first selected u, same ring extensions and same final character realization. For m=0 the conclusion over d in [1,m] is vacuous; choose an empty D family (or close exists_anticyclotomic_twist directly with I=empty, psi=1). For J empty the coordinate conclusions are vacuous. No primitive root or exact order N requirement is added.

The source transport is precise: only the second monic-family argument and its bound in the hN selection are replaced; restore w from the single exclusion with (1). The subsequent f s budget, hd d, pointChar power identity, final sum_le_card_nsmul and the eventual O' base-change bounds are unchanged. All actual balanced/tied-pencil, sharp Fitting, field-extension and crystalline premises remain.

## 2. With RUN96/97, the second caller needs no monic exclusion at all

This is a separate alternative, conditional on the earlier human selector proof, not necessary for the adapter in section 1. Fix an integer Jmin>=k+1 with 1/(p^(Jmin-k-1)(p-1))<=δ. Such Jmin exists independently of all polynomials and their coefficients. In RUN96 the proof only sums shells j>=j0 with t_j<=t. Set j0 additionally >=Jmin. If all roots in those shells were bad, the same contradiction B>=sum_(j=j0..N) t/(t+j-1) follows. The tail still diverges. Thus the strengthened uniform selector can always choose each coordinate at exact order p^j for some Jmin<=j<=N, not necessarily p^N. RUN97 coefficient induction then omits its D product, taking t=min(1/(ma+1),δ/(q+1)) and B=sum_(i in I)B_i+|I|q t. All chosen roots have high enough order, so (1) and the cyclotomic valuation formula give v(zeta_j^d-1)<=δ for every d. No auxiliary exclusion polynomial at this second interface, no independent twists and no degree term. The first caller retains all its arbitrary monic exclusions.

This is a root-reachable interface reduction, not a new proof of Selmer length or RH. Prefer section 1 for native implementation because it reuses the original already defined selector and needs only the short modular-power norm adapter; section 2 awaits RUN96/97 independent audit.

## 3. Reproducible exact checks

Executed locally in Python: 62,400 congruence certificates; 60,395 finite valuation comparisons; 158,005 infinity boundary comparisons; 62,400 high-order cutoff comparisons; non-p-power-root negative control. This checks the exponent arithmetic and normalized valuation formula, not Lean elaboration or the global Galois proof.

~~~python
from fractions import Fraction
from math import gcd
def valuation(p,N,e):
    e%=p**N
    if e==0: return None
    a=0
    while e%p==0: e//=p; a+=1
    return Fraction(1,p**(N-a-1)*(p-1))
count=finite=infinite=cut=0
for p in [2,3,5,7,11]:
  for N in range(0,6):
    P=p**N
    for m in range(1,65):
      k=0
      while p**(k+1)<=m:k+=1
      E=p**k
      assert 1<=E<=m
      for d in range(1,m+1):
        g=gcd(d,P);assert E%g==0
        mod=P//g
        c=(E//g*pow(d//g,-1,mod))%mod if mod>1 else 0
        assert (d*c-E)%P==0
        count+=1
        for j in range(N+1):
          a=valuation(p,j,d);b=valuation(p,j,E)
          assert b is None or (a is not None and a<=b)
          if b is None: infinite+=1
          else: finite+=1
      delta=Fraction(1,20)
      J=k+1
      while Fraction(1,p**(J-k-1)*(p-1))>delta:J+=1
      for d in range(1,m+1):
        assert valuation(p,J,d)<=delta
        cut+=1
# Negative control: p=2,m=3, primitive cube root, d=3 gives
# zero difference and E=2 gives nonzero difference.
assert 3%3==0 and 2%3!=0
print(dict(congruences=count,finite_valuation_checks=finite,
           infinite_boundary_checks=infinite,cutoff_checks=cut,
           negative_control='non-p-power root fails'))
~~~

Actual native status: command -v lean and lake gave no paths. RUN95 state status.json, outputs/run95.json, outputs/run93/run93_receipt.json, outputs/run93/five_root_comparison.json all returned 404 on cathedral-research-state; workflow run 46120916701 returned an empty jobs array. No new CI result or rh_scan/prune/reduce/auto/frontier execution claimed, no duplicate job queued. All existing original/reduced graphs and axiom evidence retained. No claimed full RH verification. C1 and RH OPEN.

RESUME HERE: read the already registered C1 finite-cache job's actual run93 compiler receipt and repair its first diagnostic (or, if accepted, connect finite_fused_run92 to the existing exact reciprocal-height C caller). Then formalize the independent section 1 adapter at the exact second selector interface, with original-statement and constructor-inclusive graph audit. No duplicate native job while the existing C1 job is pending. HANDOFF integration/kernel/audit.
