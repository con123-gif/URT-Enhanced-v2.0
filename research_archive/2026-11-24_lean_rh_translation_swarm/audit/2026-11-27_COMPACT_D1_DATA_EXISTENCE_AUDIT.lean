import New.Data.DataExist

/-!
# D1 independent audit — admissible data, not RH
27 November 2026. Verdict AGREE (human D1 construction), PARTIAL (native/root).
Source pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read current ONE_EQUATION_MISSION blob 4aed2e68e6bd724826bc1e669c07a48e0b95eddd,
LIVE_PROOF_SPINE 42a627f92d333109537ceeb3b920a931f0518685,
LIVE_OBLIGATIONS 17d915cc436b188878df50e1384d77a5a1d4cdcc, SWARM_PROTOCOL,
AGENTS, archive section 6c (blob 619ae01be98c32e053eef1c8bcd44ccddd0664e7).
Prior derivation 1c56102f5b8526896eb2a0bfbd337ebd0db91a3e; independent audit,
not novelty claim. New peer commits f8c4e65af8f982858c92eaa485336385ddf3ca93
(B2 caller audit), 31f5d332811594f365de6e038db78a10a52958a9 (C1), and
9d3832217da12c73ccd35e2b582e57c7f7499d54 (exchange) concern different obligations.

Actual source anchors (blob SHA):
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185
New/Seesaw/IndexTypes.lean 10e0416c5d653fedde38fcd6bf895a2127a3e1a0
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3
New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2.

Original source-level caller graph (not kernel dependency extraction):
New.grh -> eventually_primeError_le_rpow -> exists_data ->
  exists_prime_modEq_one_log_mem, exists_three_term_free,
  exists_mul_principal, numeric rounding and parameter/field lemmas.
New.grh also calls entireL_ne_zero_of_primeError_le; all A/B/C suppliers
to star_inequality remain. The level N consumer in IndexTypes uses
Data.exists_prime_window at logLevelTarget, not a single fixed U.
Candidate human D1 graph replaces the arithmetic-window supplier and
rounding by conventional unconditional Siegel-Walfisz, elementary order,
the same Behrend/class-group lemmas, and native field/parameter facts.
No global edges retired. All original dependencies, including the definition
of P.c (chosen CM generator constant), retained in evidence. No reliance on
the claimed RH theorem or on URT. No full source or axiom closure claimed.

Independent check of all record fields and five supplementary conclusions:
Fix P and 0<epsilon<1/100 BEFORE x tends to infinity. Put l=log x,
logB=x^epsilon, logX1=W=x^(epsilon/6), logX=l.
Let k=ceil(log_2 sqrt(x)), j=ceil(log_3 x^5), m=2^k, r=3^j, s=22k.
Eventually k,j>=1, sqrt(x)<=m<2sqrt(x), x^5<=r<3x^5,
s<=11l/log 2+22<=32l; x^11<=2^s<2^22*x^11.
The five scale inequalities follow respectively from epsilon*l -> infinity
(P.c is fixed), 100epsilon<1, W/l -> infinity, W^5 -> infinity,
and 6log W=log logB. Also W>=(10^6 l)^2 eventually.
Thus logX, logB, logX1, s,m,r,s_le,scale,m_mem,r_mem,m_pow,r_pow
and the first four supplementary conditions hold.

Put c=floor(log_3 s)+5, H=N0*3^c, N1=H*2^s, L=324s.
By Different.lean, N0 is a positive multiple of 18480; v=v2(N0)>=4,
the prime factors of N1 are those of N0, placeClass is the native reduction
on units through placeMulEquiv, and 2^(s+1)|N1. Take g=placeOfInt(H+1),
c0=placeOfInt(-1). Both are units. For s+1>v, the exact order of phi(g)
in units mod 2^(s+1) is J=2^(s+1-v), since squaring an integer congruent
to 1 mod 4 adds exactly one to v2(u-1), and odd powering preserves it.
No hidden identification of order in the full place group with its projection.
Choose fixed n>=3, 22/n<epsilon, B=floor(J^(1/n)/L). Eventually B>=1,
B>=J^(1/n)/(2L), and (LB)^n<=J. The native exists_three_term_free
can be reused with these exact parameters: its proof yields a sphere
of digit vectors with common squared norm, cardinal >=B^(n-2)/n.
For a direct audit, e(u)=sum u_a (LB)^a has digits <B. The weighted
relation j e(v)=i e(w)+(j-i)e(u) mod J, 0<i<j<=L, has both integers
in [0,(LB)^n) by no carry. Thus coordinate equality. Strict convexity
on the common sphere forces u=v=w. Every c0*g^e(u) is -1 modulo H
and hence under placeClass for every divisor of H as required by
thick_eq_neg_one_mod, not merely modulo N0. Injectivity follows from
e(u)<J and the exact projected order. Since 81s<3^c<=243s,
towerDeg/|T| <= C_(P,n) s^(n-1) x^(22/n)=o(x^epsilon).
This establishes thick, both thick fields, and the fifth supplementary
condition. The strict exponent margin is essential; a non-strict inequality
would not absorb the log power.

Audit of the one actual growing-modulus analytic premise:
Q=Momega(s)^2=(N0*d)^(2(s+6)). For l>=1, 2(s+6)<=76l.
Choose a fixed real A>456*log(N0*d)/epsilon. Then Q<=W^A,
so for EVERY real U>=W and y=exp U we have Q<=(log y)^A.
Use unconditional Siegel-Walfisz in its classical prime-counting form:
pi(y;Q,1)=Li(y)/phi(Q)+O_(A,D)(y/(log y)^D) uniformly in Q<=log^A y.
E.g. standard theorem as stated in
https://kskedlaya.org/ant/chap-errorbounds2.html §10.11 (use only
its classical logarithmic modulus range, no assertion of effectiveness).
Use D>A+2. Directly subtract pi(2y)-pi(y); no proper-prime-power
subtraction or prime-weight inversion is needed. Li(2y)-Li(y)
>=y/(U+log 2), and phi(Q)<=Q<=U^A. The total error is
<=3C y/U^D. Thus, uniformly for U>=W sufficiently large,

  pi(2e^U;Q,1)-pi(e^U;Q,1) >= e^U/[2 U^A (U+log 2)] > 0.

This is the single sufficient window inequality; gives p prime, p=1 mod Q,
U<log p<=U+log 2<=U+W. It supplies every native U in
[100logB,2^s], since W<=100logB and W<=sqrt(logB) eventually.
Using fixed-modulus PNT instead would not justify this step. Use the
same uniform result at U_i=10logB+2iW (i=0,...,h_K), with h_K the fixed
class number of K. Distinct intervals lie in [10logB,11logB] eventually
because (2h_K+1)W<=logB. Therefore distinct primes p_i in [b^10,b^11].
The native N1_mul_d_dvd_M_omega gives N1*d | Q; so each p_i is split in K
and satisfies both congruence fields. Choose prime ideals I_i above p_i
and J_i=bar I_i. By class-group pigeonhole some distinct i,j have
[I_i]=[I_j]; I_i J_j is principal and integral. Its generator alpha is
integral (alpha belongs to its principal integral ideal), and
alpha*bar alpha=|N_K/Q alpha|=p_i p_j, since K is imaginary quadratic.
This supplies piG, g_prime, g_modEq_one, dvd_g_sub_one, g_injective,
g_mem, norm_piG, exists_prime_window. No need for individual prime ideals
to be principal, nor an effective class number or SW constant.
All threshold constants are fixed in P,epsilon; finitely many eventual
conditions can be intersected. Data.x=x, log Data.x1=W,
log log Data.b=epsilon*l exactly by exp/log; the remaining two conclusions
were checked above. Hence independent human audit agrees with section 6c
under standard unconditional SW and native parameter/class group facts.
This is not a proof of the separate weighted non-split remainder
star_inequality. No new RH result. Exact original graph preserved.

Executable regression (Python 3, actually run in sandbox):
```python
from math import gcd
from itertools import product
from collections import Counter
def v2(z): return (z & -z).bit_length()-1
def log3(z):
    c=0
    while z>=3: z//=3; c+=1
    return c
orders=divisors=guards=0
for q in (1,2,3,5,16,27,64,231):
    N0=18480*q
    for s in (22,44,66,88):
        H=N0*3**(log3(s)+5); N1=H*2**s
        J=2**(s+1-v2(N0)); mod=2**(s+1)
        assert gcd(H+1,N1)==1 and pow(H+1,J,mod)==1 and pow(H+1,J//2,mod)!=1
        orders+=1
        assert N0**(s+6)%N1==0
        divisors+=1
        assert 81*s<3**(log3(s)+5)<=243*s
        guards+=1
triples=0
for n,B,L in ((3,2,2),(3,3,3),(4,2,4),(4,3,4),(3,4,6)):
    base=L*B; J=1<<((base**n-1).bit_length())
    pts=list(product(range(B),repeat=n))
    counts=Counter(sum(x*x for x in u) for u in pts)
    k=max(counts,key=counts.get); S=[u for u in pts if sum(x*x for x in u)==k]
    assert len(S)*(n*(B-1)**2+1)>=B**n
    es={u:sum(x*base**a for a,x in enumerate(u)) for u in S}
    for j in range(2,L+1):
        for i in range(1,j):
            for u,v,w in product(S,repeat=3):
                a=j*es[v]; b=i*es[w]+(j-i)*es[u]
                assert 0<=a<J and 0<=b<J
                if a%J==b%J: assert u==v==w
                triples+=1
assert (2*(4-1)-(1-1))%2==0 and (4-1)%2!=0 # capacity counterexample
assert 2*1==0+2 and len({0,1,2})==3 # unequal norm counterexample
print(dict(order=orders,conductor_divisibility=divisors,tower_bounds=guards,
           behrend_triples=triples,negative_controls=2))
```
Observed: order=32, conductor_divisibility=32, tower_bounds=32,
behrend_triples=15579, negative_controls=2. These are exact finite
regressions, not a test of SW or all x.

Native status: local lean/lake absent. The following is a source-typed
prepared replacement for the exact Data.exists_prime_window field,
NOT compiled. No new axiom evidence. Original DataExist and caller proofs
untouched. No use of rh_prune/rh_scan or rh_reduce/rh_auto/rh_auto_frontier
possible locally; send this source context to shared native runner, do
not re-run old-pin demonstrations as compact evidence.
Historical receipts independently fetched:
45577239749 status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 status blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Both pass old pin only, standard three axioms, second scan 324 pending.
Compact targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named original checks, module_1_build exit 124, all_requested_checks_ok=false,
full_RH_replay=false. No native D1 closure claimed.

RESUME HERE: Editor/integration may mark D1 human derivation independently
audited with the uniform SW premise explicitly cited; V1 remains open.
Replay the exact Data field adapter below, then a full replacement witness
for exists_data and its actual eventually_primeError_le_rpow consumer;
separately audit E1 residue/zero-free twist quantifiers. Do not reopen D1
rounding or add unrelated scalar tests unless a specific discrepancy arises.
-/

namespace RHDataExistAudit

/-- Transfer the uniform prime-window input to the exact native Data field,
with the lower cutoff and required width explicitly retained. -/
lemma prime_window_field (P : Parameters) (s : ℕ) (logB W : ℝ)
    (hLower : W ≤ 100 * logB) (hWidth : W ≤ Real.sqrt logB)
    (hWindow : ∀ U : ℝ, W ≤ U → ∃ p : ℕ,
      p.Prime ∧ p ≡ 1 [MOD P.Mω s ^ 2] ∧ Real.log p ∈ Set.Icc U (U + W)) :
    ∀ U ∈ Set.Icc (100 * logB) (2 ^ s), ∃ p : ℕ,
      p.Prime ∧ p ≡ 1 [MOD P.Mω s ^ 2] ∧
      Real.log p ∈ Set.Icc U (U + Real.sqrt logB) := by
  intro U hU
  obtain ⟨p, hp, hm, hlog⟩ := hWindow U (hLower.trans hU.1)
  exact ⟨p, hp, hm, hlog.1, hlog.2.trans (add_le_add_left hWidth U)⟩

#print axioms prime_window_field

end RHDataExistAudit
