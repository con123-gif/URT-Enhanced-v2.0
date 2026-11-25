import Development.AutomorphicArithmetic.MeanSquareBounds.twistK
import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.MSqTwistB
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN35, 25 November 2026. Native twistK supplier: cancel the exceptional
main term in the total coset mass BEFORE bounding its signed projection.
Human source-matched proof; Lean scalar certificates PREPARED NOT COMPILED.
No independent RH detour. RH OPEN.

Preflight: latest ONE_EQUATION_MISSION.md b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM_PROTOCOL 4b77b161, HANDOFF_QUEUE bbc46df7, EXPANSION c8152d07,
AGENTS 8db0201d, continuity 61459cdf, state/log/protocol and live manuscript.
Peer RESUME notes read through 3044c307 (local weight), 7e4677d9
(spectral), 0cf4b3fb (unit/wide host), fdb0ad7a (CM places),
0e1b92ab (normalization), 3e1000ef (genus), a910af41 (Landau),
d91e1e45 (layers), 1b03d6e3 (CountQ), 6ea6da30 (DH positivity),
46c378ee (Clozel), 3c6f175e (near field), c8e071b1 (energy),
141537e1 (pole data). No duplicate coset mass reduction identified.
Upstream head still d91ae2678eea19a0c3045ffca37f1da757c2e719;
use original pin 40e56bab026552e089d7afcfeff08d2defb9c005 only.
RUN34 b158e108 retained.

COMPACT HUMAN PROOF BLOCK (for editor).
Take exactly the premises of native main_twist_bound and twist_one:
m>0, odd squarefree s>1 coprime to m, gcd(a,m)=1, M=ms,
X>=0, L=liX X>0, 0<=r<=1/2, |k|<=1/2, the native
pointwise relative AP error and conditional exceptional integral bound.
B={b mod M: b=a mod m, gcd(b,s)=1}, J(b)=(b/s).
CRT identifies B with a coset of H={u in (Z/M)^*:u=1 mod m}.
J|H is nontrivial (choose a nonresidue at just one prime of s);
therefore sum_B J=0. For exceptional chi, V=liX(X^beta), the
main terms are M_b=(L-Re(chi(b))*V)/phi(M).
If no exceptional character, the signed main sum is zero.
If chi|H differs from J|H, the character J*chi is nontrivial
on H; multiply the coset by an element where it is not 1 to
obtain sum_B J*chi=0, hence sum_B J M_b=0.
If chi|H=J|H, then chi(b0*u)=chi(b0)J(u); consequently
sum_B chi=0 EXACTLY, regardless of its phase on b0. Thus
 sum_B M_b = |B| L / phi(M)
and |sum_B J M_b| <= |V| |B|/phi(M)
 <= r sum_B M_b <= r sum_B |M_b|.
This replaces 2r by r in main_twist_bound with NO new premises;
indeed r<=1/2 was unnecessary for this local bound. Empty coset
would also give zero (here CRT guarantees nonempty).
No assumption that chi is real is needed for the coset argument.

Write P=card PPset, T=X^(1/2). Keep native twist_decomp, including
its ADDITIVE truncation T. With the improved signed main estimate:
 |sum_{q in PPset} J(q)| <= 2(r+|k|)(P+T)+T. (1)
This implies the original twist_one bound. No need to reprove or
remove the original per-class relative error or its hypotheses.

At the actual caller QH.twistK, native f2,f3,f4 and count_a give
4r<=eta/8, 2|k|<=eta/8, T<=d P, d<=eta/4, 0<=eta<=1,
P>=0. Thus 2(r+|k|)<=3eta/16 and T<=P/4.
Equation (1) is <= (15/64+1/4)eta P=31eta P/64<=eta P.
CORRECTION to RUN34's written budget: its 5eta P/16 covered the
multiplicative contribution only. The original native twist_one
also has additive T, giving a valid total 9eta P/16 under the same
hypotheses. Native twistK's final linarith includes this term;
no source error claimed. The new bound retains it explicitly.
The constants improve but the exponent and hard RH obstruction
do not change.

The count_a supplier also admits a short human reconstruction,
without explicitly expanding the several finite threshold formulas.
Keep PNTAPRelW and ExcBound at exponent 1. Fix eps>0 and constants
from both suppliers BEFORE choosing Y0. Put l=log Y, u=log X,
m0=m. In the actual positive X host, admission gives u>=l^2 log m/4,
u>=Y^(eps/6), u<=Y^(eps/5)l^2, so log m/u<=4/l^2,
log(log m+2)=O_eps(l), sqrt u grows faster than l, uniformly.
The PNT relative threshold holds and its relative error is <=1/2
eventually. Choose c=min(1,c_Exc)>0. For an exceptional pair,
1-beta>=c/m, beta>=1-1/(8 log m)>=1/2, beta<1.
For X>=4, X^beta>=2. Then
 liX X-Re(chi(a)) liX(X^beta)
 >= int_{X^beta}^X dt/log t
 >= X(1-exp(-(1-beta)u))/u
 >= c X/(2m u).
Last inequality: u>=1, c/m<=1, and 1-exp(-w)>=w/2 for
0<=w<=1 (convexity), monotonicity then applies at w=c/m.
Without exception use liX X>=(X-2)/u>=c X/(2m u).
Since phi(m)<=m, mainAP>=c X/(2m^2 u).
Hence piAP>=c X/(4m^2 u), and P>=that minus sqrt X.
Uniformly 2 log m/u + log u/u ->0, so for every fixed alpha
in (1/2,1) the first term eventually exceeds 2 X^alpha.
Consequently P>=X^alpha, in particular native alpha=9/10.
This is a compact source-matched proof of count_a on the positive
X domain (native handles X<=0 separately; retain fallback).
No claim to prove ExcBound, relative PNT or its log-density
suppliers. All those original dependencies remain.
TwistK quantifier: for EVERY eps,A,B>0 choose Y0, then EVERY
Y>=Y0 and admitted U,m,a, choose ONE nstar BEFORE every eligible
odd squarefree s coprime to m with 1<s<=Y^A and s!=nstar.
Do not move exception selection after s. Main PNT inputs are not RH.

SOURCE / GRAPH LEDGER, all relative to src at original pin:
Development/AutomorphicArithmetic/MeanSquareBounds/twistK.lean
07e569eaf54b3b91fedad4117991838a23b93603 lines 148-159 (quantifiers),
249-281 (unique exceptional kernel), 292-353 (budgets and caller).
Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/
 MSqTwistB.lean b59dc9c511610ee5d4cc877702b18ef933e3a3c4:
 106-114 sum_jac_cls_eq_zero; 116-219 main_twist_bound;
 132-142 exact cancellation identity; 145-181 aligned case;
 182-219 nonaligned; 221-240 twist_one (additive truncation).
 MSqTwistA.lean 19f7aefcb7e45ce8a6af4bf6ce27e4bc3fb854f4:
 13-17 clsB/smallCnt; 19-65 projection; 67-96 exact split;
 107-130 counts; 176-199 twist_decomp.
 MSqCount.lean 6883d25c4f9fcd1dbe49b19e4dea23bfe8c87935:
 13-30 cutoff; 48-74 log integral; 75-173 mainAP lower;
 275-344 count_pos; 346-397 count_a.
 PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c:
 16-24 relative PNT theorem uses explicitS, density, DH,
 glue_ranges, psi_relative_near/far and prime_count_of_psi.
Original graph (source-visible, not elaborated): supplyOfAdmOf ->
pairEx -> pair_exists -> pair_share -> stage -> meanSqK -> twistK
-> twist_one -> main_twist_bound/twist_decomp; twistK -> count_a,
page_across, jacobi_separate, PNTAPRelW, ZFRDirichlet, ExcBound,
final_ineqK, liX_pow_le. Reduced local candidate replaces aligned
mass estimate by exact coset sum, retains all other edges; count_a
can use uniform asymptotics above instead of scalar threshold
expansion in human proof. No global deletion claimed. Cache context:
pin, m,a,s,chi,beta, X,r,k and SAME exception selection. No reuse
across different host or changed zero data. All pending typed/value/
constructor and axiom edges retained from original graph.

EXECUTION: local Python 3 exact integer/Fraction regression,
exit 0: 25,997 actual primes <=300000; 244 coset zero sums,
792 matching-character identities, 856 nonmatching identities,
732 actual prime truncation identities, 598 exact conditional
no-exception relative-error bounds. Empirical uniform mean used
only for regression, not an actual liX approximation or PNT proof.
No numerical test of exceptional zeros, relative PNT, or RH.
Reproduce (standalone Python):
from math import gcd,isqrt,prod
from fractions import Fraction as F
from collections import Counter
N=300000
sieve=bytearray(b'\1')*(N+1);sieve[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
 if sieve[p]:sieve[p*p::p]=b'\0'*((N-p*p)//p+1)
ps=[p for p in range(N+1) if sieve[p]]
def leg(n,p):
 t=pow(n%p,(p-1)//2,p);return -1 if t==p-1 else t
def jac(n,fs):return prod(leg(n,p) for p in fs)
crt=cases=matched=nonmatch=counts=0
for m in (8,24,40,120):
 for fs in ((3,),(5,),(7,),(11,),(3,7),(5,11),(7,11)):
  s=prod(fs)
  if gcd(m,s)!=1:continue
  M=m*s
  for a in range(m):
   if gcd(a,m)!=1:continue
   B=[b for b in range(a,M,m) if gcd(b,s)==1]
   J={b:jac(b,fs) for b in B};assert sum(J.values())==0;crt+=1
   for sf in [(),*[(p,) for p in fs],fs]:
    for t in (0,1):
     chi={b:jac(b,sf)*((-1)**((b-1)//2) if t else 1) for b in B}
     if sf==fs:
      assert sum(chi.values())==0 and abs(sum(J[b]*chi[b] for b in B))==len(B);matched+=1
     else:
      assert sum(J[b]*chi[b] for b in B)==0;nonmatch+=1
   for X in (10000,100000,300000):
    P=[q for q in ps if q<=X and q%m==a];big=[q for q in P if q>isqrt(X)];small=[q for q in P if q<=isqrt(X)]
    C=Counter(q%M for q in P);T=Counter(q%M for q in small)
    raw=sum(jac(q,fs) for q in big)
    assert raw==sum(J[b]*(C[b]-T[b]) for b in B);counts+=1
    u=F(sum(C[b] for b in B),len(B))
    if u==0:continue
    k=max(abs(F(C[b])-u)/u for b in B)
    if k>F(1,2):continue
    assert abs(raw)<=k/(1-k)*(len(big)+len(small))+len(small);cases+=1
print(len(ps),crt,matched,nonmatch,counts,cases)
End Python.

Lean/Lake not installed locally. Retrieved prior actual CI
45577239749 pass 98.87s b1c96f58, 45576756833 pass 77.94s
7da35494; latest general orchestrator 45638750039 PASS unrelated.
These are NOT RUN35 validation. Prior reduced root axioms
propext, Classical.choice, Quot.sound; 324 pending scan nodes
retained. New certificates below are scalar bridge and actual
native theorem scan/prune requests, not compiled or queued.
No new native PASS. No URT advantage claimed.

RESUME HERE: audit exact coset mass and compile native replacement
of main_twist_bound using its existing permutation lemma; replay
twistK with the additive truncation retained. Then trace relative
PNT near/far range and actual log-density/DH input with character
boxes, avoiding duplicate work. HANDOFF TO integration/editor,
formal audit, kernel and character boxes. Preserve native fallback.
-/

namespace RHCosetMass35

theorem aligned_mass (L V phi n j c : ℝ)
    (hL : 0 < L) (hphi : 0 < phi) (hn : 0 ≤ n)
    (hr : 0 ≤ c) (hv : |V| ≤ c*L) (hj : |j| ≤ n) :
    |V/phi*j| ≤ c*(n*L/phi) := by
  rw [abs_mul, abs_div, abs_of_pos hphi]
  have h1 := div_le_div_of_nonneg_right hv hphi.le
  have h2 := mul_le_mul h1 hj (abs_nonneg j)
    (div_nonneg (mul_nonneg hr hL.le) hphi.le)
  calc
    |V| / phi * |j| ≤ c*L/phi*n := h2
    _ = c*(n*L/phi) := by ring

theorem improved_twist_budget (P T r k eta D : ℝ)
    (hP : 0 ≤ P) (hT : 0 ≤ T) (hr : 0 ≤ r) (h0 : 0 ≤ eta)
    (h1 : eta ≤ 1) (hr4 : 4*r ≤ eta/8) (hk2 : 2*|k| ≤ eta/8)
    (hcut : T ≤ eta*P/4)
    (hD : D ≤ 2*(r+|k|)*(P+T)+T) :
    D ≤ 31*eta*P/64 := by
  have ht : T ≤ P/4 := by
    have h := mul_le_mul_of_nonneg_right h1 hP
    linarith
  have ha : 2*(r+|k|) ≤ 3*eta/16 := by linarith
  have hb := mul_le_mul_of_nonneg_right ha (add_nonneg hP hT)
  have hc := mul_le_mul_of_nonneg_left
    (show P+T ≤ 5*P/4 by linarith) (show 0 ≤ 3*eta/16 by positivity)
  linarith

theorem replay (P T r k eta D : ℝ)
    (hP : 0 ≤ P) (hT : 0 ≤ T) (hr : 0 ≤ r) (h0 : 0 ≤ eta)
    (h1 : eta ≤ 1) (hr4 : 4*r ≤ eta/8) (hk2 : 2*|k| ≤ eta/8)
    (hcut : T ≤ eta*P/4)
    (hD : D ≤ 2*(r+|k|)*(P+T)+T) :
    D ≤ 31*eta*P/64 := by
  first
  | (rh_reduce 2 using [improved_twist_budget]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact improved_twist_budget P T r k eta D hP hT hr h0 h1 hr4 hk2 hcut hD

end RHCosetMass35

open Formalism.HermitianLattices.Ext.LogarithmicIntegralBounds
rh_scan main_twist_bound limit 2000
rh_scan twist_one limit 2000
rh_scan count_a limit 2000
rh_scan QH.twistK limit 2000
rh_prune main_twist_bound as RH35MainTwistPruned
rh_prune QH.twistK as RH35TwistKPruned
#print axioms QH.twistK
#print axioms main_twist_bound
#print axioms count_a
#print axioms RHCosetMass35.replay
