import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import Development.AutomorphicArithmetic.PrimitiveCosets.CoreGm
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune

/-!
RUN29 — normalized four-mode height shift, 25 November 2026.
SOURCE-MATCHED human reduction; scalar Lean replay PREPARED, not compiled.
One proof block for HUMAN_PROOF_ONE_EQUATION.md §2, not an independent RH route.

Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; latest live manuscript
4f571d3bfce24fbaef352cd403666872a8981175. Read AGENTS, SWARM, HANDOFF,
EXPANSION, continuity, RUN28 and current manuscript, compare since RUN28
(20 commits); inspected character_boxes RUN28, audit RUN29, structure RUN28
and editor determinant handoff. Existing §2 already removes Shares and general
one_char; it still uses bdL to bound the O(log^2 x) shift. NEW: normalize by
height before subtraction to cancel every log derivative EXACTLY; no bdL for
this shift. This does not remove bdL from unrelated consumers or prove bdG.

At the pinned principal level Lambda=Level.cyc PChar.one, o=1, KEPT={1},
A0=H. Use the same native host D, ell and TT as the original core consumer.
PsiA consists of the four characters chi_ab on E0=Z2^2, trivial on H.
Set S(z)=sum_{a,b} (-1)^a Re GPsi(D,ell,chi_ab,z)=G(z)+J(z).
J is the signed sum of the three unkept modes. For n=p^i, i>=1,
c_n=sum_{a,b} (-1)^a primVal(D,chi_ab,n) is exactly
    4 * #{v in I_p : pr_E0(i*frob_p+v)=(1,0)} / |I_p|.
Indeed primVal on prime powers is the inertia coset mean; sum over the four
characters gives 4 for equality in E0 and 0 otherwise. The inertia group is
nonempty, so 0<=c_n<=4, including ramified p. No identity multiplying primitive
values of different characters is assumed. All terms n not prime powers
have Lambda(n)=0. Extend the sums by zero ramps. GPsi gives for z>0
    S(z)/z = sum_n Lambda(n)c_n (1/n-1/z)_+ - log z + B,
where B=1+gamma+Re(ell_01-ell_10-ell_11) is the SAME fixed number for x
and y. Thus for x>=3, y>0, |y-x|<=w<=1,
    S(y) - (y/x) S(x)
      = y sum_n Lambda(n)c_n [(1/n-1/y)_+-(1/n-1/x)_+]
        - y log(y/x).                                      (A)
All sums finite, endpoints n=x,y contribute zero ramp on their own side.
There is NO bound on B in (A).

For y<=x the ramp difference lies in [-(1/y-1/x),0] and vanishes at n>=x;
the negative logarithm is nonnegative. Hence (A) >=
    -4 (x-y) psi(x)/x >= -4w log x,
where psi(x)=sum_{n<=x} Lambda(n)<=x log x (Lambda(n)<=log n).
For y>=x all ramp differences are nonnegative; log(y/x)<=y/x-1 gives
    (A)>=-y(y-x)/x>=-(4/3)w>=-4w log x.
Consequently the single normalized transfer
    S(y) >= (y/x) S(x) - 4w log x                           (B)
holds for all real x>=3 and every admissible y, on this same host. Even the
coarser bound 4(1+log x) avoids any numerical lower bound on log 3.
If one invokes the elementary Chebyshev psi(x)<=4 log(2)*x from RUN28,
the error improves to 12w (16 log 2<12 and 4/3<12). No prime distribution
theorem is required. The simple 4(1+log x) error is sufficient below.

At the actual ChCore.core consumer put r=|TT|>0, Q=rmb>0, d=|T2|/|H|>0,
y_t=a(t)/b, mu=(1/r) sum_{t in TT} y_t/x. Native sizes give
1-1/x<=mu<=1+1/x. Use hY with Y=mu S(x)-4(1+log x), by (B) and w<=1.
The original core then gives the exact shorter scalar bridge
    mu S(x) <= 2 Err/(Q d)+4/(xd)+4(1+log x).               (C)
The RHS is nonnegative for the native nonnegative error budget. Divide by
mu>=1-1/x>0. Native bdG on the THREE unkept modes gives -J(x)<=3 x^(1/2+eps).
Thus
    G(x) <= (2 Err/(Qd)+4/(xd)+4(1+log x))/(1-1/x)
             + 3 x^(1/2+eps).
This replaces the shift paragraph in the live proof; no individual log
derivative or horizontal character share bound is used here. If all
|y_t-x|<=w, replace the error by 4w(1+log x) and denominator by 1-w/x.
For fixed eps>0, x sufficiently large, d>=x^(-eps), the integrated
three-budget bound Err<=400 M^3 x^(2eps) B0 and 2 B0/(Qd)<=20 x^(1/2+21eps/8)
give G(x)<= (12000 M^3+10) x^(1/2+37eps/8) after increasing the threshold
to dominate logarithms (e.g. 4(1+log x)<=x^(1/2+eps), 4/x<=1).
Absorb the fixed coefficient in x^(3eps/8) to retain the existing conditional
1/2+5eps exponent and hence canonical 1/2+9eps. No window is reselected.
The factor 3/2 bounds 1/(1-1/x), not a change to the original exponent.
Same host/scale/weights and all geometric, thin, arithmetic cutoff and
Galois existence hypotheses remain. If Err is signed instead, first use
the native nonnegative upper bound. Local replacement only.

Pinned upstream leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005; source paths relative to src:
* Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean
  18deb7cb85d6f650a69f01fda6e0c789b9f04d89 L61-70 cosetMean/primVal/GPsi;
  L108-121 PrimValPow, PrimValTriv, OrthoRam.
* Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean
  94a385f59f3781ae6b1ab4beddc73850708a2bc6 L274-318 ortho_coset,
  orthogonality_ramified; L619-689 sum_cut, inner_eq.
* Development/AutomorphicArithmetic/PrimitiveCosets/CardPsiA.lean
  4fe4ded735dd1ba55db3a01fc181ad794a2c4a0a (card_PsiA);
  SigALe.lean e9c80e2017ec149ac559bc20c184b9264b9ec0c2 (sigA_le);
  GmAEq.lean 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03 (gmA_eq).
* Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/
  ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de L16-20 e1/Th,
  L56-73 sum_Th, L154-179 move/triv, L202-281 one_char,
  L283-338 core (hY L288, cancellation L334-338),
  L343-end ch_core (general derivative/one_char supplier).
* Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean
  3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d L12-74 core_gm, calls L55-62.
Latest upstream observed 251c7b05dd869ceba1aa42c6001c00b4010f23f9;
ChCore old path 404, no declaration deletion inferred. FirstPrimeNeSecondPrime
d3b68b896d305c56a951d35a44637dc2a862e0c0, StronglyIrreducible
b5bf0125c1a73d8adecb2bf9d18b7961eedaaecd unchanged from RUN28's latest
observed versions but differ from pin. No revision mixing.

Original source path: core_gm -> ch_core -> one_char/move/triv/DerivInt,
charsA (Shares, bdL), sigA_le, core. Proposed local principal path:
core_gm -> principal four-mode identity + (A)-(C) + same core + bdG on
three modes. Preserve all original role edges, axioms, other consumers and
unexpanded nodes; caller replacement not yet checked. Cache key includes
(pin,D,ell,H,A0,TT,actual x,y_t,principal level). Do not reuse between hosts.
Backtrack to prior §2 bound if the replacement fails audit.

Executed exact CPython Fraction regression, exit 0: 168 actual primes,
193 actual prime powers, 5790 scaled-ramp checks, 13 cutoff endpoints.
Also exhaustively 80 quotient Fourier projection equalities across all
5 subgroups of E0 and all 16 choices of coset representative/target.
This tests arithmetic and quotient symmetry, not an actual host simulation
or an asymptotic estimate. Reproduce:
```python
from fractions import Fraction as F
from math import isqrt
from itertools import combinations
N=1000
s=bytearray(b'\1')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
 if s[p]:s[p*p::p]=b'\0'*(((N-p*p)//p)+1)
pp=[]
for p in range(2,N+1):
 if s[p]:
  n=p
  while n<=N:pp.append(n);n*=p
count=cross=0
for n in pp:
 for x in map(F,[3,10,47,97,256,997]):
  for d in [F(-1),F(-1,2),F(0),F(1,2),F(1)]:
   y=x+d
   r=lambda z:max(z/n-1,0)
   a=r(y)-y/x*r(x)
   assert -max(-d,0)/x<=a<=max(d,0)/x
   assert (a>=0 if y>=x else a<=0)
   count+=1;cross+=int(min(x,y)<n<=max(x,y))
print(sum(s),len(pp),count,cross)
E=[(0,0),(0,1),(1,0),(1,1)]
add=lambda a,b:tuple(x^y for x,y in zip(a,b))
chi=lambda a,h:(-1)**sum(x*y for x,y in zip(a,h))
subs=[set(c) for k in range(1,5) for c in combinations(E,k)
      if (0,0) in c and all(add(a,b) in c for a in c for b in c)]
num=0
for I in subs:
 for h in E:
  for g in E:
   S=sum(F(chi(a,g)*sum(chi(a,add(h,i)) for i in I),len(I)) for a in E)
   assert S==F(4*int(add(g,h) in I),len(I)) and 0<=S<=4
   num+=1
print(len(subs),num)
```

Native verification: no lean/lake on PATH. Independently retrieved prior
CI statuses 45577239749 (pass 98.87s, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc)
and 45576756833 (pass 77.94s, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717).
They cover engines and conditional strip root ONLY. Original root scan still
324 pending, no new native result, no new axiom audit. The scalar Lean
lemmas below are prepared for actual CI replay, not compiled. No URT
performance claim. No import of Main or claimed RH theorem.
RESUME HERE: compile the normalized ramp scalar lemmas and lift to GPsi
finite-sum quotient projection, then use (C) in the principal core caller.
Independent audit of same-host B cancellation and no hidden bdL consumer.
HANDOFF TO integration/editor: replace §2 shift paragraph with (A)-(C) after
audit, retain all upstream existence leaves. Kernel and audit lanes: check
actual caller bridge and transitive axiom ledger. RH remains OPEN.
-/

namespace RHNormalizedFourMode

-- scalar normalized positive-part inequality; u=1/y, v=1/x
theorem normalized_ramp (z u v : ℝ) :
    max (z-v) 0 - max (z-u) 0 ≤ max (u-v) 0 := by
  have h : max (z-v) 0 ≤ max (z-u) 0 + max (u-v) 0 := by
    apply max_le
    · linarith [le_max_left (z-u) (0:ℝ), le_max_left (u-v) (0:ℝ)]
    · exact add_nonneg (le_max_right _ _) (le_max_right _ _)
  linarith

theorem normalized_ramp_lower (z u v : ℝ) :
    -max (v-u) 0 ≤ max (z-v) 0 - max (z-u) 0 := by
  linarith [normalized_ramp z v u]

theorem normalized_cancel (R1 R2 B L1 L2 : ℝ) :
    (R1-L1+B)-(R2-L2+B) = R1-R2-(L1-L2) := by ring

theorem mu_transfer (mu m S E : ℝ) (hm : 0 < m)
    (hmu : m ≤ mu) (hE : 0 ≤ E) (h : mu*S ≤ E) :
    S ≤ E/m := by
  apply (le_div_iff₀ hm).2
  by_cases hS : 0 ≤ S
  · exact (mul_le_mul_of_nonneg_right hmu hS).trans h
  · exact (mul_nonpos_of_nonneg_of_nonpos hm.le (le_of_not_ge hS)).trans hE

theorem mu_transfer_auto (mu m S E : ℝ) (hm : 0 < m)
    (hmu : m ≤ mu) (hE : 0 ≤ E) (h : mu*S ≤ E) :
    S ≤ E/m := by
  rh_auto_frontier 2
  all_goals first | exact mu_transfer mu m S E hm hmu hE h | rh_reduce 3 using [mu_transfer] | rh_auto 3

rh_scan Deduction.CharacterBalanceMoves.core limit 2000
rh_prune Deduction.CharacterBalanceMoves.one_char as RHNormalizedFourMode.one_char_pruned
#print axioms normalized_ramp
#print axioms normalized_cancel
#print axioms mu_transfer
end RHNormalizedFourMode
