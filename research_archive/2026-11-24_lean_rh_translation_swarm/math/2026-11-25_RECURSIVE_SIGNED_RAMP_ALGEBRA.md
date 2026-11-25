# Recursive algebra reduction: four character ramps become one positive prime-power ramp
25 Nov 2026. Human derivation, conditional application to pinned Lean proof, not RH proof or kernel replay. User asks to remove redundant algebra as well as mathematical issues. Continues 26e90fe6 (principal signed transfer), 223e6835 (signed prime remainder), 9532e2af (rank aggregation). Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Read actual ChCore, ChBalance, CoreGm, GmAEq, SigALe, CoreAtH, and prior principal-host note. No URT needed.

## 1. Collapse the entire principal Fourier expression
Use the prior source-matched principal host identifications (modulus-one character, A0=H, only zero additive character kept). Let a(n)=(n/q), b(n)=(n/d), q=3 mod8, d=7 mod16, q|d+1, distinct odd primes. Use a,b here for characters, not the source scale parameters. The four surviving Fourier signs give
 F(y)=G0(y)+Re(Gq(y)-Gd(y)-Gqd(y)).
For nonprincipal characters Gchi(y)=sum_n Lambda(n)chi(n)(y/n-1)_+ + y ell_chi, with ell=L'/L(1); G0 uses trivial character and subtracts y log y-(1+gamma)y. Hence define the real constant L=Re(ell_q-ell_d-ell_qd) and coefficient
 c(n)=1+a(n)-b(n)-a(n)b(n)=(1+a(n))(1-b(n)).
Exactly
 F(y)=sum_{n<=y} Lambda(n)c(n)(y/n-1)-y log y+(1+gamma+L)y.
No complex-valued terms remain. For unramified primes p, c(p^k)=4 precisely when k is odd and a(p)=1,b(p)=-1, zero otherwise. At q, b(q)=1 by quadratic reciprocity and q|d+1, so c(q^k)=0. At d, a(d)=-1, so c(d^k)=2 for even k and zero for odd k. Therefore one exact expression is
 F(y)=4 sum_{p in C,k odd,p^k<=y} log p (y/p^k-1) + 2 sum_{k even,d^k<=y} log d (y/d^k-1) - y log y + (1+gamma+L)y,
 C={p:a(p)=1,b(p)=-1}.
This is algebraic cancellation before any triangle inequalities. All terms in the raw prime-power ramp are nonnegative. The centered F can have either sign; no inference of positivity of F or RH.

## 2. Eliminate the generic separate character derivative machinery in the final shift step
The centered ramp is locally absolutely continuous on y>=2, with a.e. derivative
 F'(y)=sum_{n<=y} Lambda(n)c(n)/n - log y + gamma+L.
For real y>=2, floor(y/n)>=y/(2n) for n<=y; divisor convolution sum_{d|m} Lambda(d)=log m gives
 sum_{n<=y} Lambda(n)/n <= (2/y) log(floor(y)!) <= 2 log y.
Since 0<=c<=4, obtain the exact uniform envelope
 -log y+gamma+L <= F'(y) <= 7 log y+gamma+L.
Thus for x>=3, |y-x|<=1:
 |F(y)-F(x)| <= |y-x| [7 log(x+1)+|gamma+L|].
Unlike the prior four-function shift estimate or generic CharacterBalanceMoves.one_char, this needs only ONE signed logarithmic-derivative combination, not individual norm estimates for these three characters, no koOf, weights, share deviation, generic fourth-root/log inflation A1, or characterwise derivative theorem for this final shift. It does not eliminate generic derivative/lipschitz estimates separately used inside CharacterBalanceMoves.th_le and ThinScales, or individual estimates required by independent host construction. If original PairGood supplies individual |ell|<=4 log x, their signed combination automatically satisfies |L|<=12 log x. No new bound on L is asserted.

## 3. Insert into native averaged error
Keep the exact source core hypotheses: HostFactsS, SizesA, ThinScales, CostWindows, T2 membership, and actual ASK-MAIN mean B (prior averaged core argument ae5afbdc). Let Q=|TT| m b_scale>0, d0=|T2|/|H|>0. y_t=a_scale(t)/b_scale is within 1 of x. Take R=7 log(x+1)+|gamma+L|. Since A0=H, the character-sum lower bound hY in CharacterBalanceMoves.core is now simply
 |TT|(F(x)-R) <= sum_{t in TT} F(y_t).
Thus the previous exact transfer becomes
 F(x) <= R + 2 B/(Q d0)+4/(x d0).
Equivalently G0(x)<=Re(Gd+Gqd-Gq)(x)+R+2B/(Qd0)+4/(xd0).
The signed bound rather than three separate absolute bounds suffices at this local endpoint. This is the same underlying signed cancellation criterion as 26e90fe6, now with its derivative algebra replaced by a direct elementary divisor identity, not a new analytic RH estimate. Need prove actual uniform B and signed auxiliary budget, and specialize upstream host interfaces before claiming whole-proof savings.

## 4. Actual checks and provenance
Executed local CPython, exact Legendre coefficient arithmetic for all prime powers <=10000 in pairs (11,263),(19,151),(3,23): 3840 coefficient checks (949 nonzero); 24 floating-point derivative envelope checks (8 scales per pair); all passed. These verify arithmetic identities/envelopes on finite data, not RH or actual host constraints beyond q,d congruences. Reproduction:
```python
from math import log,isqrt
N=10000
s=bytearray(b'\x01')*(N+1);s[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
 if s[p]: s[p*p::p]=b'\0'*(((N-p*p)//p)+1)
primes=[p for p in range(2,N+1) if s[p]]
def leg(a,p):
 if a%p==0:return 0
 return 1 if pow(a%p,(p-1)//2,p)==1 else -1
count=nonzero=0
for q,d in [(11,263),(19,151),(3,23)]:
 assert q%8==3 and d%16==7 and (d+1)%q==0
 assert leg(d,q)==-1 and leg(q,d)==1
 coeff=[]
 for p in primes:
  n=p;k=1
  while n<=N:
   a,b=leg(n,q),leg(n,d);w=1+a-b-a*b
   expected=4*int(p not in (q,d) and k%2==1 and leg(p,q)==1 and leg(p,d)==-1)+2*int(p==d and k%2==0)
   assert w==expected and 0<=w<=4
   count+=1;nonzero+=w>0;coeff.append((n,w,log(p)))
   n*=p;k+=1
 for y in [3,4,7,50,100,1000,9999,10000]:
  u=sum(log(p)/p**k for p in primes for k in range(1,20) if p**k<=y)
  assert u<=2*log(y)+1e-10
  w=sum(w*lp/n for n,w,lp in coeff if n<=y)
  assert -log(y)-1e-10<=w-log(y)<=7*log(y)+1e-10
assert (count,nonzero)==(3840,949)
```
Pinned source src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de (sum_A,sum_Th,core,one_char,ch_core); ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4; PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d, GmAEq.lean 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03, SigALe.lean e9c80e2017ec149ac559bc20c184b9264b9ec0c2, CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097. No Lean kernel/CI replay or new full archive audit.
RESUME HERE: apply sign-preserving algebra cancellation at earlier actual th_le weighted cutoff before norm envelopes, checking that arbitrary u,j-dependent weights do not permit unjustified Fourier cancellation. Alternatively prove a nontrivial bound on actual B; do not merely rename F. HANDOFF TO math, prime, character boxes, geometry, audit and integration. RH OPEN.
