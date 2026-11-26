import Lib.Cyclotomic.Stickelberger.GaussSums
import Lib.Cyclotomic.Kolyvagin.ComponentBound
import Lib.Cyclotomic.OddSha.OddShaBound

/-!
RUN53, 26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION; native audit
PREPARED, not executed for this certificate. Compact pin:
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission latest blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb.
Read manuscript and peer results dc4a4eec (projective cocycles),
04c29781 (balanced row budget), 15b7768e (vacuum jet); this is
a distinct upstream odd-Sha supplier retained by RUN52. No
change to the sufficient unified determinant or its hypotheses.

SOURCE / DEPENDENCY LEDGER:
grh-compact/src/Lib/Cyclotomic/Stickelberger/GaussSums.lean
blob b242e0965fdabcf6a8dcc3da33511507bf8bd4bf:
sum_floorDiff, smul_gaussSum, stickelberger,
isOfFinOrder_of_norm_eq_one, exists_jacobi_family.
These are declarations with proof bodies, NOT named axioms.
grh-compact/src/Lib/Cyclotomic/Kolyvagin/ComponentBound.lean
blob 61d0f229eda03e81c8d89372f05f7444ca45b09b:
exists_kolyvagin_cocycles, caller of the same Jacobi family.
grh-compact/src/Lib/Cyclotomic/OddSha/OddShaBound.lean
blob 71e1148ba135da7530abe211af57ba8a0d63f195:
exists_length_shaOdd_le (arithmetic budget, retain full quantifiers).
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:
exists_isFitFamily. New/Endgame/LongForms.lean
9eff36cf003ac398fbd24361e80e95a03d0b0e05: actual C consumer.
RUN52 source note aa9f09ebbb9745fb7946eb3117451d2e19da0f15.
No global graph deletions: source-level old path is
local cyclotomic place facts -> Gauss valuation/equivariance
-> Jacobi family -> derivative cocycle -> odd Sha -> fit twists -> C.
Human replacement path proves the SAME Jacobi family using prime-field
binomial calculation, Galois change of variables and floor distribution;
it is not a native replacement term or an elaborated dependency graph.

1. PRIME-FIELD STICKELBERGER, INCLUDING THE TRIVIAL CHARACTER.
Fix prime p, n=p-1, B above p with ord_B(p)=1. Let omega(a)
be the unique n-th root of unity reducing to a in F_p^*, for
a=1,...,p-1. Such roots exist in Q_p by Hensel (derivative n
is a unit); the B-embedding selects the corresponding algebraic
roots. Take a primitive p-th root zeta. Put pi=zeta-1 and
G_k=sum_(a=1..p-1) omega(a)^(-k) zeta^a, 0<=k<n.
Extend characters by zero at zero, even the trivial character.
Thus G_0=-1, also when p=2.
The product of 1-zeta^a for 1<=a<=n equals p; all have the same
valuation since (1-zeta^a)/(1-zeta) reduces to a. Hence ord_B(pi)=1/n.

Expand exactly G_k=sum_(j=0..n) A_j pi^j,
A_j=sum_a omega(a)^(-k) binom(a,j), in the unramified coefficient
ring Z_p. For j<k, reduce A_j mod p: each monomial exponent in
a^(-k) binom(a,j) is strictly between -n and 0, so its sum on
F_p^* vanishes. For j=k only the leading monomial survives,
giving A_k=-1/k! mod p. Terms j<k have valuation >=1+j/n>k/n;
terms j>k have valuation >=j/n>k/n. The unique least term gives

                    ord_B G_k = k/n.                 (V)

This proves the exact fractional valuation, not just nonvanishing;
no general Stickelberger theorem needed for prime fields. For any
primitive parametrization of the n characters, k changes by an
invertible multiplier. Consequently the native map S from Z/n
to Q/Z is an injective homomorphism with image all n-torsion and
fracRep(S(t))=ord_B G(t). This includes n=1. No division in a
Selmer coefficient ring has been used.

2. EQUIVARIANCE, OFF-p UNITS, AND NORM.
For an automorphism sigma write a_sigma and b_sigma for its
cyclotomic action modulo n and p, respectively. Changing the
summation variable by b_sigma gives exactly
sigma G(t) = chi_(a_sigma t)(b_sigma)^(-1) G(a_sigma t).
The prefactor is a multiplicative character in t. Thus in the
native additive notation for algebraic multiplicative units,
sigma G(t)=G(a_sigma t)+K_sigma(a_sigma t), where K is additive.
Set j(t)=c G(t)-G(ct), and J(S(t))=j(t)-j(-t); define J=1
(multiplicative notation) off the n-torsion subgroup. The K
terms cancel BEFORE any valuation, giving sigma J(x)=J(a x)
whenever M|n, Mx=0 and a is sigma's cyclotomic residue mod M.
In ordinary multiplicative notation this same family is

             J(x) = G(t)^c G(-ct)/(G(ct) G(-t)^c).    (J)

All Gauss sums are integral and divide p: the trivial sum is
-1, and G(t)G(-t)=chi_t(-1) p for nontrivial t (expand the
product, group pairs by their ratio, then use additive and
multiplicative character orthogonality). In every complex
embedding the latter identity and conjugation imply
|G(t)|=sqrt(p) for t nonzero and |G(0)|=1.
Therefore G(t) is a unit at every place off p; the same holds
for J. Since t and -t, ct and -ct have the same zero/nonzero
status, |J(x)|=1 in EVERY complex embedding, including c=0.

By (V), ord_B j(t)=c fracRep(x)-fracRep(cx)=floor(c fracRep(x)).
Subtracting j(-t) gives exactly ord_B J(x)=floorDiff c x,
not twice this number, and with the correct sign at integral
c x and x=0. At another place A over p choose sigma carrying
A to B (or its inverse according to valuation transport).
Then ord_A J(x)=floorDiff c(a x) for the corresponding unit a.
The field is the same finite cyclotomic field for all these
values. No identification of distinct places or of their
residue characters is assumed.

3. DISTRIBUTION BY EXACT CANCELLATION BEFORE NORMS.
Write f_c(x)=floor(c fracRep(x)). For r>=1 with gcd(c,r)=1,
the r representatives of x+b/r are (j+u)/r for j=0..r-1,
where u=fracRep(rx). Write c j=r q_j+s_j, 0<=s_j<r.
The residues s_j permute 0,...,r-1. Hence
sum_j q_j=(c-1)(r-1)/2, and
sum_j floor((s_j+c u)/r)=floor(c u) (write floor(c u)=r h+k).
It follows that
sum_b f_c(x+b/r)=f_c(rx)+(c-1)(r-1)/2.
Apply also to -x, reindex b -> -b and subtract; the constants
cancel EXACTLY:
sum_b floorDiff c(x+b/r)=floorDiff c(rx).             (D)
This is native sum_floorDiff, and a unit multiplier of b only
permutes terms. It holds for r=1 including c=0.

Let M|n, r|M, Mx=0, gcd(c,r)=1. The quotient
Q=prod_b J(x+b/r)/J(rx) has valuation zero at B by (D).
At any other A over p, apply equivariance: multiplication
by the corresponding cyclotomic unit permutes b mod r, so
the same (D) gives valuation zero there. At places off p all
factors are units. Thus Q is an algebraic integer (indeed a
unit), and every complex conjugate has modulus one. Kronecker
gives Q torsion. For completeness: the monic integer polynomials
of Q^k have bounded degree and bounded coefficients by the
elementary symmetric bounds, so only finitely many occur;
their combined finite root set contains every Q^k. Two powers
coincide, and Q nonzero implies finite order. No full
Davenport-Hasse product formula or analytic RH is needed.

4. CONGRUENCE AT EVERY AUXILIARY PLACE.
Let q be any prime dividing n, b in Q/Z with qb=0, and A above q.
Write b=S(s), qs=0. For any a in F_p^*, chi_s(a) is a q-th
root of unity and reduces to 1 in characteristic q, since
X^q-1=(X-1)^q there. Termwise G(t+s) = G(t) mod A's
maximal ideal. These sums are A-units by section 2 since q!=p.
The same argument for -s, cs, -cs, and multiplication/division
of units in (J) yields J(x+b)/J(x) = 1 mod A, for EVERY A
over q. In additive native units J(x+b)-J(x) belongs to
principalUnits A. No assumption q|M is required; q|n suffices,
as in the actual declaration. This universal-place guard is
essential for the gamma transport in RUN52's transition.
Sections 1-4 establish all six properties of the SAME family
in exists_jacobi_family, with its actual simultaneous M,x,r,q
quantifiers. This supplies the retained human Jacobi premise
of RUN52; no new analytic or arithmetic conjecture. It does
not close the separate actual row, local crystalline,
reciprocity-to-isotropy and balanced comparison suppliers in C.

PROVENANCE: source REFERENCES.md bc5207de20acf124d1f70c078a5157be639089b1
explicitly lists GaussSums among citations NOT part of its review.
The file cites Washington, Introduction to Cyclotomic Fields,
2nd ed., section 6.2 and theorem 15.1, and Davenport-Hasse,
J. reine angew. Math. 172 (1935). Exact Washington page was not
independently authenticated this run. Cross-check: Theorem 2.5
of Cameron-Liebler line classes with parameter x=(q^2-1)/2,
DOI 10.1016/j.jcta.2015.02.004, states the standard
Teichmuller digit-sum valuation (prime field case is (V)).
The accessible theorem excerpt was inspected. The above direct
prime-field proof and distribution argument avoid reliance on
the precise cited Washington numbering or the stronger
Davenport-Hasse relation. Remaining accepted mathematical
inputs are Hensel, cyclotomic Galois action and transitivity
on places, ordinary algebraic-integer integrality criterion;
Kronecker and prime-field scalar identities explicitly derived.

EXECUTION: local lean/lake not installed. Actual compact CI
45799225653 jobs pick/run/record successful; state output
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e inspected.
Its roster is limited to 10 native checks and 4 scalar checks,
NOT this Jacobi theorem, NOT this note and NOT a full replay.
No new native PASS. The following exact Python checks executed
locally (standard library + sympy); these are scalar regressions,
not a test of algebraic-number field implementations or Lean:

from fractions import Fraction as F
from math import gcd,comb,factorial
from sympy import primerange
cnt=0
for p in primerange(2,100):
    for k in range(p-1):
        for j in range(k+1):
            val=sum(pow(a,-k,p)*comb(a,j) for a in range(1,p))%p
            assert val==(0 if j<k else -pow(factorial(k),-1,p)%p)
            cnt+=1
print(cnt) # actual 32368
N=0
for r in range(1,20):
    for c in range(0,25):
        if gcd(r,c)!=1: continue
        for d in range(1,21):
            for a in range(d):
                def f(x):
                    return (c*(x%1)).__floor__()-(c*((-x)%1)).__floor__()
                x=F(a,d)
                assert sum(f(x+F(b,r)) for b in range(r))==f(r*x)
                N+=1
print(N) # actual 61740

RESUME HERE: independently audit RUN50-53 together at the
odd-Sha caller (especially large-prime descent: actual component
annihilator, small-prime uniform detector, all-prime common
integer, no illicit cyclotomic division). If complete, send
the single Jacobi formula and exact distribution proof to
editor, then audit the outstanding crystalline/local defect
primitive at the actual C caller. Preserve source pins,
original/reduced graph and axiom evidence; no new proof of RH
claimed, no import of Main, no old-toolchain engine reuse.
HANDOFF TO integration/editor, C mathematics, independent
audit and existing shared native runner.
-/

#check sum_floorDiff
#check smul_gaussSum
#check stickelberger
#check isOfFinOrder_of_norm_eq_one
#check exists_jacobi_family
#check exists_kolyvagin_cocycles
#check exists_length_shaOdd_le
#print axioms sum_floorDiff
#print axioms smul_gaussSum
#print axioms stickelberger
#print axioms isOfFinOrder_of_norm_eq_one
#print axioms exists_jacobi_family
#print axioms exists_kolyvagin_cocycles
#print axioms exists_length_shaOdd_le
