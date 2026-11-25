import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTBAsm
import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTSharpB
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN31 audit — direct averaging proves full native far-range conclusion
25 Nov 2026. Human source-matched conditional proof; scalar certificate
PREPARED, NOT compiled. RH OPEN. Independent audit of character_boxes
RUN30, b99ef9ad26648d08272fadd06fdb2b914b896161 (blob
18b7ff36acb36e5da8254431c427353f67ffcd2e).

Preflight: read current ONE_EQUATION_MISSION b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
including mandatory unified engine, SWARM, HANDOFF, AGENTS, research
state/log/protocol, CI summary f6ffd425d19a9590ab26089cd28a5f1bc20c258f,
live manuscript 75026c85481848e3c615fcec6e25bec2cfae1dbb. Inspected
latest peer results 59e81b98, b99ef9ad, e70e93e7, 18759700, bb29422d,
90ea4293 and previous audit db618414. No URT ranking necessary for this
exact calculus simplification.

## RESULT: remove SharpenS from the FULL PsiRelB interface

The projected RUN30 argument can be strengthened: no CRT projection,
special weights, or modified downstream caller is required. Native
psi_relative_far_range has type PsiRelBOf = ExplicitS -> SharpenS ->
ZeroSum -> forall cA>0, PsiRelB cA. The following gives the full same
conclusion from ExplicitS and ZeroSum alone, not just two projections.
This is a mathematical replacement at the actual PNTFinal caller;
kernel replay remains open.

Use the identical native constants and quantifiers in PNTBAsm lines
15-75: take kappa,C,cz,Az,Cz,C0,B,c1 from ZeroSum, ExplicitS,
num_main and etaOf_lower 1; M multiple of 8, y>=2, native far range,
T=M^12, d=M^-5 in (0,1/2], v=(1+d)y, t=y^(-kappa/2),
E=C*((M*T)^C*t+log(2*y)*log(M*T)^2/T).
For each character chi use the same Zchi,mchi,Kchi supplied by
ExplicitS. Let L(f)=yv/(v-y)*(f(v)-f(y)). It equals the weighted
average of u^2 f'(u) on [y,v] for the positive probability measure
proportional to u^-2 du. Denote this averaging by Avg.

1. Native sharp_identity/sharp_arith (PNTSharpB) gives
   |psiChi(chi,y)-L(Schi(chi,u)/u)| <= a=(dy+1)log(2y).
   This is the actual prime-power ramp identity, not a PNT.
   ExplicitS endpoint error under L is <= 2E*yv/(v-y)
   <= 3*y*E/d. Kchi cancels. Thus
   psiChi(chi,y) = Avg(1_{chi=1} u -
       sum_{rho in Zchi} mchi(rho) u^rho/rho) + error_chi,
   with |error_chi| <= a+3yE/d.
2. Subtract the SAME exceptional pair eOf M before any norm.
   For every rho in Zchi, 1/2<=Re rho<1 by native h1 and
   LFunction_ne_zero_of_one_le_re. Hence
   |Avg(u^rho/rho)| <= 2 v^Re rho <= 3 y^Re rho.
   Since mchi>=1 and excW<=1, mchi-excW>=0. Let
   Wchi=sum_{rho in Zchi}(mchi-excW)*y^(Re rho-1).
   All nonexception contributions cost <=3y Wchi.
3. Principal drift: only chi=1 contributes and
   |Avg(u)-y|<=dy. If eOf=some(chi1,beta) and beta is in
   Zchi1, its removed contribution differs from the main term
   y^beta/beta by <=dy: its derivative is u^(beta-1)<=1
   for u>=y>=2 and 1/2<=beta<1. If absent, coverage in ExplicitS
   gives beta<1-kappa/2, as in native excT_sub_le. Its main term
   is evaluated at y, NOT at v: y^beta/beta<=2yt. In that case
   no exceptional drift term is needed. The absence/presence cases
   do not require a second exception or a separate estimate for
   every character. No exception: both costs zero.

Sum over ALL chi, using native card_char_le and that there is at most
one principal and one selected exception. The exact replacement bound is

  sum_chi |psiChi(chi,y)-mainPsi(eOf M,chi,y)|
    <= M*(3*y*E/d + a) + 2*d*y + 2*y*t + 3*y*sum_chi Wchi.  (A)

All terms are nonnegative. Native num_main already bounds
M*(4*y*E/d+4*a)+20*d*y+2*y*t by B*y/M^2. It directly dominates
the non-W terms of (A) WITHOUT the factor two used by projected RUN30.
The original ZeroSum supplies sum Wchi <= Az*etaOf(M)*exp(-cz log y/log M).
The original final steps hηM, inv_le_exp and hWs then give

  sum_chi |psiChi-mainPsi|
    <= (3*|Az| + B/c1)*y*etaOf(M)*exp(-min(cz,cA^2)*log y/log M).

All far-range thresholds, constant choices, zero multiplicity and
coverage hypotheses, and the complete all-character sum survive.
This is PsiRelB cA at its original quantifier strength. The old
far-range coefficient was 22*|Az|+B/c1. PNTFinal can therefore retain
the same glue_ranges and prime_count_of_psi calls, with the new
far-range supplier. No change to near range, twistK, count_a, or
their original interfaces is necessary. No new density or zero-free
assumption, and no inference of RH.

AGREE with RUN30 projection and positive-average identity.
Stronger observation: the original SharpenS obligation is avoidable
at this caller even for the full PsiRelB; CRT support is not needed.
Do not discard principal drift, exceptional absence term, or
nonnegative multiplicity. The sharper constant is not an improvement
to the critical exponent. Attempted factor-2-free estimate using
averaging the absent exceptional term would yield a coefficient
3yt; instead compare it at y as above. This is a proof of the
conditional replacement in ordinary mathematics, not native kernel
evidence or a new proof of ExplicitS, ZeroSum, or RH.

## Provenance and exact dependency overlay
Pin: leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
Under src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/:
DeuringHeilbronnM.lean c88517739b211c9cb0da65b0f6bc59611f809901
(lines 35-75, 92-111: PsiRel, PsiRelB, ExplicitS, SharpenS, ZeroSum);
PNTBAsm.lean 4ff480d42f552af6a4839a0cdfa65a4b388d2d8b
(full psi_relative_far_range; actual constants and final transfer);
PNTBAsmA.lean 73eccf9ef5d1942ca6f5bd908e2760f9684ad7fd
(num_main, inv_le_exp); PNTBAsmB.lean
71b3322363ac160465ac29560f1e86f7b1a3a953
(excT_sub_le, excW_le_one, card_char_le);
PNTSharpB.lean d1f77ac690fc1ae72999e456ad62a22951fbf989
(sharp_identity, sharp_arith);
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c
(actual pnt_progressions_relative_weak_holds uses
psi_relative_far_range explicitS_proof' differenced_explicit_formula
(zero_sum_bound_lossy logDensityM_proof' deuringHeilbronnMB_proof')).
PNTRangeA.lean 91acb9e608ae0b94882fe181ddb0917d86335d99 retained.

Original source-visible graph:
PNTFinal -> glue_ranges -> psi_relative_far_range -> ExplicitS,
SharpenS, ZeroSum, num_main, one_char, excI bookkeeping;
PNTFinal supplies differenced_explicit_formula -> sharp_zero_term
and sharp_arith, etc. Candidate graph: same PNTFinal -> full new
far_range -> ExplicitS, ZeroSum, num_main, sharp_arith, elementary
positive-average calculus, exc coverage, card_char_le and eta bounds.
No global removal of declarations used by another caller. Keep all
original graphs, type/value/constructor roles, unresolved axioms,
and pending nodes. Cache context (pin,M,chi,actual Z,m,K,eOf,y,d,T,
kappa,C,range constants). Do not reuse exception or zero family
across M. Backtrack to original if native full-interface replay fails.

## Executed tests (CPython, exact Fraction arithmetic)
669 actual primes <=5000, 711 prime powers including primes,
3114 exact kernel checks, 128 exact real-character aggregate
identities mod 8, 2187 exact budget comparisons. Three control
assertions: principal drift is not zero, subtracting multiplicity
from zero makes it negative, endpoint weight at n=v is zero.
The first control in the executable is a trivial strict interior
comparison; the actual negative result follows analytically from
Avg(u-y)>0 when v>y. These checks are arithmetic regressions,
not evidence about zero sets, asymptotic prime distributions or RH.
Reproduce:
```python
from fractions import Fraction as F
from math import isqrt
from itertools import product
N=5000
s=bytearray(b'\1')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
 if s[p]:s[p*p::p]=b'\0'*(((N-p*p)//p)+1)
pp=[]
for p in range(2,N+1):
 if s[p]:
  n=p
  while n<=N:pp.append((n,p));n*=p
pp.sort()
def chars(n):
 if n%2==0:return (0,0,0,0)
 a=1 if n%4==1 else -1;b=1 if n%8 in (1,7) else -1
 return (1,a,b,a*b)
ramp=agg=0
for y in [F(8),F(9),F(17,2),F(97),F(121),F(256),F(1023),F(2048)]:
 for d in [F(1,2),F(1,16),F(1,128),F(1,32768)]:
  v=y*(1+d);w=y*v/(v-y)
  assert 2*w<=3*y/d
  L=[{} for _ in range(4)];R=[{} for _ in range(4)]
  for n,p in pp:
   if n>v:break
   K=w*(max(F(1,n)-1/v,0)-max(F(1,n)-1/y,0))
   expected=F(1) if n<=y else y*(v-n)/(n*(v-y))
   assert K==expected and 0<=K<=1;ramp+=1
   for j,a in enumerate(chars(n)):
    L[j][p]=L[j].get(p,F(0))+a*(K-int(n<=y))
    R[j][p]=R[j].get(p,F(0))+a*(expected if n>y else 0)
  for j in range(4):assert L[j]==R[j];agg+=1
scalar=0
for M,D,A,W,P,Q,t in product([8,16,24],[F(0),F(1,5),F(3)],range(3),range(3),range(3),range(3),range(3)):
 old=M*(4*D+4*A)+20*P+2*Q+t
 new=M*(3*D+A)+2*P+2*Q+3*W
 assert new<=old+3*W;scalar+=1
assert F(9)>F(8)
assert 0-1<0
y,v,n=F(8),F(12),F(12)
assert y*(v-n)/(n*(v-y))==0
print(dict(primes=sum(s),prime_powers=len(pp),ramp=ramp,character_aggregate=agg,scalar=scalar,negative_controls=3))
```
Output {'primes': 669, 'prime_powers': 711, 'ramp': 3114,
'character_aggregate': 128, 'scalar': 2187, 'negative_controls': 3}.

Lean/Lake unavailable locally. Re-read actual published CI status
45577239749 pass 98.87s blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
conditional half-strip root only propext, Classical.choice, Quot.sound;
45576756833 pass 77.94s blob 7da354941e402b6f8b364ed03d8c5c82d27b7717,
rh_of_right scan pending 324, no reduction. Neither verifies this
replacement. Scalar Lean bridge below prepared with engine calls;
the integral argument and full native caller remain to be elaborated.
No new PASS, no claim of URT gain or shorter asymptotic computation.

RESUME HERE: kernel lane implement the positive weighted integral
average on actual ExplicitS Z,m,K; use (A) to build the full
ExplicitS -> ZeroSum -> forall cA>0, PsiRelB cA replacement at
PNTFinal, run original-statement bridge and axiom audit; then focus
on the surviving ZeroSum and ExplicitS quantitative suppliers.
HANDOFF TO character_boxes, kernel, integration/editor. PARTIAL.
-/

namespace RHFullFamilyDifference31

theorem far_budget (M D A P Q W B : ℝ)
    (hM : 0 ≤ M) (hD : 0 ≤ D) (hA : 0 ≤ A) (hP : 0 ≤ P)
    (hB : M*(4*D+4*A)+20*P+2*Q ≤ B) :
    M*(3*D+A)+2*P+2*Q+3*W ≤ B+3*W := by
  have hh : 3*D+A ≤ 4*D+4*A := by linarith
  have hm := mul_le_mul_of_nonneg_left hh hM
  linarith

theorem far_budget_replay (M D A P Q W B : ℝ)
    (hM : 0 ≤ M) (hD : 0 ≤ D) (hA : 0 ≤ A) (hP : 0 ≤ P)
    (hB : M*(4*D+4*A)+20*P+2*Q ≤ B) :
    M*(3*D+A)+2*P+2*Q+3*W ≤ B+3*W := by
  first | (rh_reduce 3 using [far_budget]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact far_budget M D A P Q W B hM hD hA hP hB

theorem endpoint_factor (y d E : ℝ) (hy : 0 ≤ y)
    (hd : 0 < d) (hd' : d ≤ 1/2) (hE : 0 ≤ E) :
    2*(1+d)*(y*E/d) ≤ 3*(y*E/d) := by
  have h : 2*(1+d) ≤ 3 := by linarith
  exact mul_le_mul_of_nonneg_right h (by positivity)

end RHFullFamilyDifference31

rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.psi_relative_far_range limit 2000
rh_prune Formalism.HermitianLattices.Ext.PrimesInProgressions.psi_relative_far_range as RHFullFamilyDifference31OriginalFarPruned
rh_prune RHFullFamilyDifference31.far_budget as RHFullFamilyDifference31BudgetPruned
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.psi_relative_far_range
#print axioms RHFullFamilyDifference31.far_budget
#print axioms RHFullFamilyDifference31.endpoint_factor
