import Development.AutomorphicArithmetic.MeanSquareBounds.BadShare
import Development.AutomorphicArithmetic.MeanSquareBounds.StagePow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN33 — 25 Nov 2026. Human source-matched proof; scalar Lean certificate
PREPARED, NOT COMPILED. RH OPEN.

Preflight: current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM/HANDOFF/EXPANSION/AGENTS and continuity records; shared manuscript
7beedb2752d934a81d4c92b5a19c1c48362e0dc9; RUN32 bb29422d; peer
4510eb2b (parity), 5991ed4b (joint windows), c11635a0 (two-sided ramp),
e02666f2 (count caller), 188850b1 (signature), e627db49 (signed slack).
Do not duplicate these. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest observed upstream 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a,
unchanged from RUN32; do not mix revisions.

Actual c1 supplier: ShortNorms/supplyOfAdmOf.lean uses QH.pairEx in
winPairs, then boundedTw on the same host and PairGood. Thus the
finite signed-prime correction of RUN32 need not become a new open
premise: retain the native auxiliary-character bounds and reconstruct
their producer. The alternative EAtH-of-HostConditions.c1 consumer
is not asserted to be the only route.

COMPACT HUMAN PROOF BLOCK for integration/editor:
Fix C>=0, tau>0, Y>=2, X>=Y, real Z, finite P and fixed kappa with
|kappa(n)|<=1. Assume the original MeanSq C Z P [Y,X], uniformly for
EVERY bounded coefficient function, not only the chosen kappa.
Write a=1+2*tau and, for q in P,
  S_q(v)=sum_{1<=n<=floor_nat Z} Lambda(n) min(1,v/n)
                           kappa(n) Jacobi(n,q),
  D_q(v)=sum_{v<n<=floor_nat Z} Lambda(n) kappa(n) Jacobi(n,q)/n.
S is continuous piecewise linear, with derivative D off finitely many
integer breakpoints. For v>0, the mask kappa_v(n)=kappa(n)1_{v<n}
is bounded by one and vD_q(v)=S(v,q,kappa_v). Hence the SAME MeanSq
assumption gives sum_q |D_q(v)|^2 <= C |P| log(v)/v at every v in
[Y,X], as in native bs_sum_D_le. No moving mask is substituted into
the original fixed-kappa target; it is used only in this pointwise
derivative estimate.

Complete the square BEFORE bounding:
 d/dv [|S_q(v)|^2/v^a]
   = |D_q(v)|^2/(a v^(a-1))
       - |a S_q(v)-v D_q(v)|^2/(a v^(a+1)).
This identity is valid on each smooth cell; the energy is continuous
and absolutely continuous on the compact positive interval.
Integrate from Y to any y in [Y,X], enlarge the nonnegative first
integral to X, then take sup and sum over the finite P. Initial
MeanSq at Y and the derivative estimate yield
 sum_{q in P} sup_{Y<=y<=X} |S_q(y)|^2/y^a
 <= C |P| [Y^(-2tau) log Y
        + (1/a) integral_Y^X log(v)/v^(1+2tau) dv].
No dyadic partition, individual witness selection, or geometric
series required. For b=2tau>0, integration by parts gives
 integral_Y^infinity log(v)/v^(1+b) dv
       = Y^(-b)(log Y/b+1/b^2).
Indeed the boundary v^(-b)log v tends to zero, and the remaining
integral is Y^(-b)/b^2. Consequently, writing B for any subset of P
whose members have some witness y in [Y,X] with
 |S_q(y)| > y^(1/2+tau)/2, we get the single estimate
 |B| <= 4 C |P| Y^(-2tau)
       [log Y + (log Y/(2tau)+1/(4tau^2))/(1+2tau)].       (*)
Each bad member contributes >1/4 to the nonnegative supremum sum.
If P is empty there is nothing to prove; if X<Y then B must be empty
by its witness premise. No division by |P|. Since the coefficient in
(*) tends to zero for every fixed tau>0, for every eta>0 choose Y0>=2
depending only on C,tau,eta. For ALL Y>=Y0, X,Z,P,B,kappa with the
original hypotheses, |B|<=eta|P|. This supplies exactly QH.bad_share,
with decay O_tau(Y^(-2tau) log Y), rather than the native coarse
O_tau(Y^(-tau)). It is uniform even for X very large. The geometric
or class-group existence premises and the zeta prime discrepancy
itself are NOT proved by this step.

Graph and source ledger (all at pin; paths under
src/Development/AutomorphicArithmetic/):
- ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc
  (lines 29,125: pairEx, boundedTw).
- CharacterBoxes/BoundedTw.lean 69e88858735720bd60454c30c64d6380e216613f
  (boundedTw_key, boundedTw; nontrivial twists, same host, eps/2<=eps).
- CharacterBoxes/PairGood.lean 68d04b506355e999c0f6020ee066c4967c1e6939
  (18-30: PairGood bounds and boxes, PairEx).
- MeanSquareBounds/pairEx.lean 0020840fcf9b97e9e6e834c591e8516b9875e003
  (112-169: pair_exists with N0=8M,tau=eps/2, kappa4).
- MeanSquareBounds/PairExists.lean 7e63fdeda04264253733059bf951a4c1635cebaa
  (9-49: pair_exists, eta=1/2).
- MeanSquareBounds/PairShare.lean 712579c16be75074705a2c5c00f69e2f5d835cf9
  (26-52: stage1 and stage2).
- MeanSquareBounds/Stage1Succ.lean 79f79fe71e41f403a4d22e5b86540410748ac7c3
  (36-96); CharOf.lean 3eeed8077330efa249cde313d99d89a7c09d8ba6
  (61-217: adjusted 6eps/5, <=2*card base characters).
- MeanSquareBounds/StagePow.lean 2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7
  (41-170: QH.stage; meanSqK at 50, bad_share at 55 and 155-158,
   union at 159-170; retain separate zero-box bad set B1 and count_bad).
- MeanSquareBounds/BadShare.lean 5cd176ccccf4c232a31c6f852536aa579320d4d3
  (9-11: bsD, 76-96: FTC and mask, 146-161: bs_sum_D_le;
   163-249: bs_block/bs_markov, 251-318: QH.bad_share).
- MeanSquareBounds/PrimeSetTwoBounds.lean
  45616f33334b6ef360b18a8e64c0eb325f9463b8 (13-14:S,26-27:MeanSq).
- MeanSquareBounds/meanSqK.lean 136f54f1321278b0ed23791fb2660ddd162bac97
  (50-54: actual mean-square supplier; all progression and exceptional
   character bounds remain).
- MeanSquareBounds/BoxOfS.lean 2744746f957268e351b72b7e971600b943f9ebdb
  (28-60: finite explicit formula and tail); Kappa4Loglog.lean
  e7f65342e957fa42936e7d8223888312a8967462 (126-153).

Original source-visible path retained:
core_gm <- EAtH <- supplyOfAdmOf <- boundedTw / winPairs <- pairEx
<- pair_exists <- pair_share <- stage1/stage2 <- stage
<- bad_share <- bs_block/bs_markov + dyadic partition;
stage also depends on meanSqK, count_bad and box_of_S.
Candidate replacement only at bad_share: FTC + uniform mask + energy
identity + log integral + count. Original graph, every other consumer
and all unknown elaborated type/value/axiom edges retained; no global
deletion claimed. Context cache key includes pin,C,Z,P,kappa,Y,X,tau,
the same PairGood host q,d and selected window parameters; no
cross-host reuse. No URT advantage established or needed for algebra.

Actual local execution (Python/SymPy, exit 0): exact polynomial
expansion identity 1/1; 14 genuine primes q>256^2 with q=3 mod 8,
70 prime-power rows up to 256; 18,816 derivative/accumulated
energy inequalities checked using actual log weights, three bounded
coefficient modes and four exponents (including a=1.01 and 1.02).
Maximum absolute derivative identity residual 1.1102230246251565e-15;
minimum accumulated slack 4.271945980294234e-06. These are finite
floating-point kernel regressions, NOT MeanSq validation or RH.
Reproduce in CPython with SymPy:

import math, sympy as s
a,v,r,i,d,e=s.symbols('a v r i d e',real=True)
assert s.expand(a*(2*v*(r*d+i*e)-a*(r*r+i*i))-v*v*(d*d+e*e)+(a*r-v*d)**2+(a*i-v*e)**2)==0
Z=256
N=66000
p=[True]*(N+1);p[:2]=[False,False]
for k in range(2,math.isqrt(N)+1):
 if p[k]:p[k*k::k]=[False]*((N-k*k)//k+1)
ps=[k for k in range(2,N+1) if p[k]]
qs=[q for q in ps if q>Z*Z and q%8==3]
rows=[]
for l in ps:
 if l>Z:break
 n=l
 while n<=Z:rows.append((n,l));n*=l
def leg(n,q):
 v=pow(n%q,(q-1)//2,q);return -1 if v==q-1 else v
cnt=0;maxres=0.;minslack=math.inf
for q in qs:
 for mode in (0,1,2):
  coeff=[(n,math.log(l)*leg(n,q)*(1 if mode==0 else leg(n,3) if mode==1 else leg(n,3)*1j)) for n,l in rows]
  for a in (1.01,1.02,2.,3.):
   Y=16.;X=128.;E=lambda v:abs(sum(c*min(1.,v/n) for n,c in coeff))**2/v**a
   bound=E(Y)
   for l in range(int(Y),int(X)):
    r=l+1.;m=l+.5;D=sum(c/n for n,c in coeff if n>m);S=sum(c*min(1.,m/n) for n,c in coeff)
    lhs=(2*m*(S.conjugate()*D).real-a*abs(S)**2)/m**(a+1)
    rhs=abs(D)**2/(a*m**(a-1))-abs(a*S-m*D)**2/(a*m**(a+1))
    maxres=max(maxres,abs(lhs-rhs));assert abs(lhs-rhs)<1e-10
    I=(math.log(r/l) if a==2 else l**(2-a)*math.expm1((2-a)*math.log(r/l))/(2-a))*abs(D)**2/a
    bound+=I
    slack=bound-E(r);minslack=min(minslack,slack);assert slack>=-1e-10
    cnt+=1
print(len(qs),len(rows),cnt,maxres,minslack)
End Python.

Native Lean/Lake unavailable locally (command -v both returned no
path). Retrieved prior actual CI status files: 45577239749 pass,
98.87s blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc;
45576756833 pass, 77.94s blob 7da354941e402b6f8b364ed03d8c5c82d27b7717.
Only older engine/conditional strip verification; no new native
PASS, no new axiom evidence. Earlier conditional strip axioms
propext, Classical.choice, Quot.sound; bounded scan 324 pending.
Scalar certificate prepared below for shared native batch; full
complex differentiation/FTC and QH.bad_share replacement not yet
formalized. Actual original theorem scan/prune and axiom commands
included; they have not executed here.

RESUME HERE: independently audit (*) including the uniform moving
mask, integrate the scalar identity in the pinned Lean setting and
replay QH.stage with the replacement. Then reconstruct actual
meanSqK exceptional squarefree kernel/prime progression supplier,
rather than creating another independent RH-equivalent criterion.
HANDOFF TO integration/editor (one short proof block), kernel,
formal audit and character boxes. Preserve original proof fallback.
-/

namespace RHNormalizedEnergy33

theorem normalized_energy_numerator (a v sr si dr di : ℝ) :
    a * (2*v*(sr*dr+si*di)-a*(sr^2+si^2)) =
    v^2*(dr^2+di^2)-((a*sr-v*dr)^2+(a*si-v*di)^2) := by
  ring

theorem numerator_bound (a v sr si dr di : ℝ) :
    a * (2*v*(sr*dr+si*di)-a*(sr^2+si^2)) ≤ v^2*(dr^2+di^2) := by
  rw [normalized_energy_numerator]
  nlinarith [sq_nonneg (a*sr-v*dr), sq_nonneg (a*si-v*di)]

theorem count_transfer (b p budget E : ℝ) (h1 : b/4 ≤ E)
    (h2 : E ≤ p*budget) : b ≤ 4*p*budget := by
  linarith

theorem replay (a v sr si dr di : ℝ) :
    a * (2*v*(sr*dr+si*di)-a*(sr^2+si^2)) ≤ v^2*(dr^2+di^2) := by
  first
  | (rh_reduce 2 using [numerator_bound]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact numerator_bound a v sr si dr di

end RHNormalizedEnergy33

rh_scan QH.bad_share limit 2000
rh_scan QH.stage limit 2000
rh_prune QH.bad_share as RH33OriginalBadSharePruned
#print axioms QH.bad_share
#print axioms QH.stage
#print axioms RHNormalizedEnergy33.normalized_energy_numerator
#print axioms RHNormalizedEnergy33.replay
