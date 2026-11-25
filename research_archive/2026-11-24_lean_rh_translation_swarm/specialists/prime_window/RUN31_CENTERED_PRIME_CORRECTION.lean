import Development.AutomorphicArithmetic.PrimitiveCosets.CoreGm
import Development.AutomorphicArithmetic.PrimitiveCosets.hostFactsS
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN31 — eliminate the higher prime powers from the signed auxiliary bound,
25 November 2026. HUMAN SOURCE-MATCHED reduction; Lean scalar certificate
PREPARED, NOT compiled. RH OPEN. One optional local premise weakening for the
native canonical equation, not an alternative RH route or a claim of a
prime-distribution estimate.

Preflight: read current ONE_EQUATION_MISSION, live HUMAN_PROOF_ONE_EQUATION,
AGENTS, SWARM, HANDOFF, RUN23, RUN26–30, latest commits through 437f345a.
The manuscript already has the principal four-mode identity and one-sided
height guard; RUN30 handles sparse scale interpolation, not the signed
higher-prime-power correction. RUN23 odd-power askG bounds concern another
observable. The present reduction is at the actual core_gm/sigA_le consumer.

## Compact proof block: no higher-power error needed in the signed correction

Use exactly the principal host in manuscript §2, and write F=G+J where
J=g_01-g_10-g_11. Here g_ab are the four projected GPsi real parts. For
prime p and k>=1, let c(p,k)=4 times the fraction of the native inertia
coset k*frob(p)+I_p projecting to (1,0) in E0. RUN29 proves 0<=c<=4.
Because E0 has exponent two, c(p,k)=c(p,1) for odd k. More importantly the
ACTUAL hostFactsS partitions primes into S=insert q H.small, d, and
unramified primes outside S and d:
* p in S: inertia AND frob have first coordinate zero, so c(p,k)=0.
* p not in S, p!=d: inertia trivial, even k projects to (0,0), so c=0.
* p=d: inertia exactly {0,sgc0}; even k projects to zero before adding
  inertia, so c(d,2j)=2 for every j>=1.
Thus ALL even powers disappear except the explicit even d series. This
uses native hostFactsS, not a claim that the whole host is unramified at
2 or at QS; also does not assume d's odd powers vanish in a general host.

For any fixed host define the convergent moments
  C_F = sum_p sum_{k>=2} c(p,k) log(p)/p^k
      = sum_p c(p,1) log(p)/(p*(p^2-1)) + 2 log(d)/(d^2-1),
  C_G = sum_p log(p)/(p*(p-1)).
Absolute convergence follows from 0<=c<=4 and sum_{n>=2} log(n)/n^2<infty.
These are exact linear coefficients, not negligible constants multiplied
by x. Set L=Re(ell_01-ell_10-ell_11), the SAME host values used in J.
The prime-only centered signed correction is
  J_1(x)=sum_{p<=x}(c(p,1)-1)log(p)*(x/p-1)+x*(L+C_F-C_G).
Define positive remainders
  R_F(x)=sum_p sum_{k>=2} c(p,k)log(p)*min(1,x/p^k),
  R_G(x)=sum_p sum_{k>=2} log(p)*min(1,x/p^k).
The scalar identity max(x/n-1,0)=x/n-min(1,x/n) gives EXACTLY
  J(x)=J_1(x)-R_F(x)+R_G(x).                                (A)
No cancellation of divergent principal prime sums or independent host
choices. The two positive remainders are finite for fixed x.

Uniform domination: write theta_P(t)=sum_{p<=t}log p <= 4 log(2)*t by
the elementary dyadic central-binomial argument (RUN28). The total
weight A_odd(t) of odd powers k>=3 for F satisfies, for t>=1,
  A_odd(t)<=16 log(2)*(t^(1/3)+(log t/log 2)*t^(1/5))
          <=(16 log(2)+120/e)*t^(1/3)<=64 t^(1/3).
The second step uses max_{t>=1} log(t)*t^(-2/15)=15/(2e).
The even d series contributes A_even(t)=2 log(d)*floor(log(t)/(2log d))
<=log t, independently of d. Tonelli for nonnegative weights gives
  sum_n a_n min(1,x/n)=x integral_x^infty A(t)/t^2 dt.
Consequently, uniformly in the actual host,
  0<=R_F(x)<=96 x^(1/3)+log x+1,    x>=1.                   (B)
This cube-root remainder replaces the generic square-root power tail;
it follows from the exact parity cancellation BEFORE bounding.

By contrast R_G(x)>=theta_P(sqrt x), retaining just prime squares.
For completeness the elementary lower Chebyshev bound follows from
  2n log 2-log(2n+1)<=log binom(2n,n)<=psi(2n).
For the upper inequality each prime-power term of the binomial valuation
is 0 or 1 and is zero above 2n; the lower follows because the central
coefficient is the largest of 2n+1 coefficients summing to 4^n.
Take n=floor(t/2) and use monotonicity:
  psi(t)>=(t-2)log 2-log(t+1).
Also psi(t)-theta_P(t)<=4log(2)*(sqrt(t)+(log t/log 2)*t^(1/3))=o(t),
by separating exponent two from all k>=3. Therefore eventually
  theta_P(t)>=(log 2/2)*t.
Together with (B), for all x>=X_* with one absolute threshold X_*,
independent of the changing host, R_G(x)>=R_F(x). From (A):
                       -J(x)<=-J_1(x).                     (C)

At the principal core_gm consumer, manuscript §2 currently uses the
three individual hE.bdG estimates to obtain -J(x)<=3 x^(1/2+eps).
It suffices INSTEAD to supply the single one-sided signed prime estimate
  -J_1(x)<=3 x^(1/2+eps)
on the same selected host at the same scale, beyond X_*. In particular
there is no additional higher-power loss in the canonical exponent
1/2+9eps. This is a sufficient local replacement, not an estimate that
the displayed prime-only premise holds. Original bdG remains available
and may be simpler to supply from the original analytic construction.
Do not discard the exact L term, replace C_F-C_G with zero, or infer
the new bound on J_1 directly from the old bound on J without controlling
the reverse remainder. The replacement is one-sided, not equivalent.
Keep the original G equation, same-host family, all ThinScales, compatible
ell, geometry, VWin and upstream suppliers. No independent proof route.

## Provenance and graph
Pinned upstream leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005; actual source blobs:
- src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean
  18deb7cb85d6f650a69f01fda6e0c789b9f04d89, sgc0 L17, cosetMean/primVal/GPsi
  L61–70, PrimValPow L103–105, OrthoRam L116–121.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean
  b5662cda1f3523fc53b547ee582a46bd3cd826d4, HostFactsS L18–22.
- src/Development/AutomorphicArithmetic/PrimitiveCosets/hostFactsS.lean
  440a45819936cf0cb7fb8e81156e94b25288459c, hostFactsS_pf, hostFactsS.
- same directory CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d
  (core_gm calls hostFactsS, sigA_le); SigALe.lean
  e9c80e2017ec149ac559bc20c184b9264b9ec0c2 (chr_bounded, sigA_le).
- CardPsiA.lean 4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a;
  PrimRead.lean 3960cf3e7d166f6664405a0d5fcb995924621ffb;
  PrimInj.lean 5720fe0139394b6e9d8c688b36ae2d6f5af10478;
  RecH.lean b2712cc402765cea3fd406285e05e32a7ce64ec7, toE L10–11.
- src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/
  ExplicitFormulaErrorOfHostConditions.lean ed60b4b997cd4703713660b185b9e43fd95559a1,
  EAtH; Analytic.lean 599699b5b35f6fb7bf2ab94f5f0c577b14f35ea1,
  HostRaw.BoundedCharsPointwise and An.gChi.
- ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de in
  DedekindLFunctions/LandauTheorems, core and averaging.

Original path: core_gm -> sigA_le -> chr_bounded, prim_read, EAtH.bdG,
card_PsiA; signed principal human reduction uses the three nontrivial
modes and no extra kept-character conclusion. Proposed alternate local
supplier: same core and four-mode identity, signed bound on J_1 plus
(A)–(C), elementary Chebyshev and actual hostFactsS. Retain original
graph, all value/type/constructor/axiom evidence, and unresolved nodes.
No global deletion, no replacement compiled in actual caller. Cache key
(pin, same H, ell, principal level, x, epsilon, exact c coefficients);
only the threshold in (C) is shared across hosts. Backtrack to original
bdG if J_1 is not easier to establish. URT ranking not used because
the useful reduction is exact parity and signed algebra, not a search.

Latest upstream observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a
25 Nov 11:57:33 UTC, not mixed into pin. Native tools inspected:
RHRecursiveReductionFixed blob 976c28572f11ffb00e1ae730555e938eeb564cb7,
AutoV3 a113dc56ea987abac3bf29eb480782140b82ab4a, RHProofTermPrune
f6d3e7f6047a7895ecf183be3fb54c203f4fc46a.
Local lean/lake unavailable. Actual published prior CI status read:
45577239749 PASS (98.87s), blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 PASS (77.94s), blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
These cover existing engines and conditional half-strip adapter, not
this bridge. No new native verification or axiom audit; scalar replay
prepared below for the kernel lane's existing batch, including actual
sigA_le scan/prune (expected to retain hE in its generic original body).

## Executed local regression (not a proof of infinite estimates)
CPython/NumPy 2.3.5, exit 0. Actual primes to 2^20, 82025 primes,
242 higher prime powers. Nine actual admissible quadratic prime pairs
q=3 mod8, d=7 mod16, (q/d)=1:
(3,23),(3,71),(11,7),(19,71),(43,7),(43,71),(59,23),(67,7),(83,71).
For these principal quadratic quotient characters, c(p,k)=(1-a^k)(1+b^k)
with a=(p/d), b=(p/q), including the zero at ramification. Tested exact
integer parity coefficients and (A) for common FINITE truncation of
higher powers (not evaluation of the infinite moments). 3231 scale
comparisons, max floating absolute residual 2.3283064365386963e-10,
max finite RF/(96*x^(1/3)+log x+1)=.03670652815831594;
min finite RG-RF for x>=4096=101.69375553111567. No inferred asymptotic
from finite data; analytic proof is above. No full host construction
or native Lean simulation claimed.

Reproduce Python:
import numpy as np, math
N=2**20
s=np.ones(N+1,dtype=bool); s[:2]=False
for p in range(2,math.isqrt(N)+1):
    if s[p]: s[p*p::p]=False
pr=np.flatnonzero(s)
pp=[]
for p in pr[pr<=math.isqrt(N)]:
    p=int(p); n=p*p;k=2
    while n<=N: pp.append((n,p,k)); n*=p;k+=1
nn,pp0,kk=np.array(sorted(pp)).T
w=np.log(pp0.astype(float))
xs=np.unique(np.r_[np.geomspace(3,N,128).astype(int),nn]).astype(float)
def legendre(p,q):
    r=pow(int(p)%q,(q-1)//2,q)
    return -1 if r==q-1 else r
pairs=[(q,d) for q in map(int,pr[pr<100]) for d in map(int,pr[pr<100])
       if q%8==3 and d%16==7 and q!=d and legendre(q,d)==1]
max_res=0.; max_ratio=0.; min_tail_diff=1e100; comparisons=0
for q,d in pairs:
    a=np.array([legendre(p,d) for p in pp0])
    b=np.array([legendre(p,q) for p in pp0])
    c=(1-a**kk)*(1+b**kk)
    expected=np.where(kk%2==0,2*(pp0==d),(1-a)*(1+b))
    assert np.array_equal(c,expected) and np.all((c>=0)&(c<=4))
    CF=np.dot(c*w,1/nn); CG=np.dot(w,1/nn)
    for x in xs:
        r=np.minimum(1,x/nn); ramp=np.maximum(x/nn-1,0)
        RF=np.dot(c*w,r); RG=np.dot(w,r)
        lhs=np.dot((c-1)*w,ramp); rhs=x*(CF-CG)-RF+RG
        res=abs(lhs-rhs); max_res=max(res,max_res)
        assert res<=2e-9*max(1,abs(lhs),abs(rhs))
        assert RF<=96*x**(1/3)+math.log(x)+1
        max_ratio=max(max_ratio,RF/(96*x**(1/3)+math.log(x)+1))
        if x>=4096:min_tail_diff=min(min_tail_diff,RG-RF)
        comparisons+=1
print(len(pr),len(nn),pairs,comparisons,max_res,max_ratio,min_tail_diff)
End Python.

RESUME HERE: independently audit (C) on the native principal host and
evaluate whether the actual analytic producer can supply signed J_1
more simply than bdG, with the exact linear coefficient and uniform
host quantifiers. If not, keep the existing simpler proof. Do not add
a redundant alternate criterion to the ten-page manuscript. Kernel
lane: replay the scalar bridge in actual pinned context and inspect
the native caller; no global premise removal without a replacement.
HANDOFF TO integration/editor, character_boxes, literature, audit,
kernel extractor. The source-matched prime correction is available as
a local replacement only; original VWin and geometric leaves OPEN.
-/

namespace RHCenteredPrimeCorrection

-- Scalar component of (A); no assumptions on a prime sum or RH.
theorem ramp_center (z : ℝ) : max (z-1) 0 = z-min 1 z := by
  by_cases h : z ≤ 1
  · rw [min_eq_right h, max_eq_right (by linarith)]
    ring
  · have hz : 1 ≤ z := le_of_lt (lt_of_not_ge h)
    rw [min_eq_left hz, max_eq_left (by linarith)]

theorem signed_prime_transfer (J J1 RF RG B : ℝ)
    (h : J = J1-RF+RG) (hR : RF ≤ RG) (hB : -J1 ≤ B) :
    -J ≤ B := by linarith

theorem actual_core_scalar (G J J1 RF RG E B : ℝ)
    (hF : G+J ≤ E) (h : J = J1-RF+RG)
    (hR : RF ≤ RG) (hB : -J1 ≤ B) :
    G ≤ E+B := by
  have hb := signed_prime_transfer J J1 RF RG B h hR hB
  linarith

theorem actual_core_scalar_auto (G J J1 RF RG E B : ℝ)
    (hF : G+J ≤ E) (h : J = J1-RF+RG)
    (hR : RF ≤ RG) (hB : -J1 ≤ B) :
    G ≤ E+B := by
  rh_auto_frontier 2
  all_goals first
    | rh_reduce 3 using [actual_core_scalar]
    | exact actual_core_scalar G J J1 RF RG E B hF h hR hB
    | rh_auto 3

rh_scan UpperTheory.Comparison₂.sigA_le limit 2000
rh_prune UpperTheory.Comparison₂.sigA_le as RHCenteredPrimeCorrection.sigA_pruned
#print axioms ramp_center
#print axioms signed_prime_transfer
#print axioms actual_core_scalar
#print axioms actual_core_scalar_auto
end RHCenteredPrimeCorrection
