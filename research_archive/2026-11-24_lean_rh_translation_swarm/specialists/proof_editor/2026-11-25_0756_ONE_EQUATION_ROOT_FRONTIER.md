# RH-only recursive root reduction — direct prime-only Landau adapter
25 November 2026. Lane 15. RESULT: human source-matched conditional reduction, with a new direct analytic bridge eliminating the prime-power and integer-baseline estimates from the proof route. RH OPEN. No Lean replay, URT improvement or complete recursive reduction claimed. Prior manuscript volumes remain unchanged.

## Live root-to-frontier proof (one arithmetic obligation)
Set c=1-log 2 and
    D(x)=c*x-sum_{x/2<p<=x}(2-x/p) log p.
For each 0<eps<1/2 set theta=1/2+eps. The only *new arithmetic assumption* on the direct route below is that some C>=0, delta>0 give arbitrarily large Y with D(x)<=C*x^theta throughout [Y,Y^(1+delta)]. This is the mission's exact target; no assertion it is established.

1. Original pinned root Main.riemannHypothesis := rhOfAll := Formalism.VW.rh_of_every allChi. In rh_of_every the only use of allChi is at modulus 1 and character 1. Replace the *conclusion route* by Formalism.VW.rh_of_right, which asks for zeta(s) != 0 for Re(s)>1/2, s != 1. Auxiliary characters in the native supplier are not thereby proved dispensable.
2. **New direct prime-only adapter.** Let J(w)=integral_1^2 (2-v)v^(-w-1)dv, an entire function. Integration by parts gives w J(w)=1-integral_1^2 v^(-w)dv; hence J(w)!=0 for Re(w)>0, because the integral has modulus strictly less than 1. Also J(1)=c. For Re(w)>1, absolute convergence gives
       F(w):=integral_1^infty D(x)x^(-w-1)dx
           = c/(w-1)+J(w)*(zeta'(w)/zeta(w)+H(w)),
       H(w):=sum_p sum_{k>=2} log(p) p^(-kw).
   Indeed each prime contributes on [p,2p), and x=pv yields J(w) log(p)p^(-w). The Euler product logarithmic derivative supplies the stated sign. H is holomorphic on Re(w)>1/2: on a compact set with Re(w)>=a>1/2 it is bounded termwise by log(p)p^(-2a)/(1-2^(-a)), whose sum converges even over all integers n>=2. No O(sqrt(x)) bound on prime powers or deterministic baseline estimate is needed. At w=1 the pole cancels since zeta'/zeta=-1/(w-1)+holomorphic and J(1)=c. At every zeta zero rho with Re(rho)>1/2 there is a simple pole of F of residue m_rho J(rho), nonzero even for multiple zeros. All statements use ordinary zeta, no RH.
3. **Exact half-plane rescaling** to use the native generic theorem on Re(s)>0 without assuming continuation of the prime-only series farther left. Define g(u)=exp(-u)D(exp(2u)) for all real u, Phi(s)=F((s+1)/2)/2 on the right half-plane (assign arbitrary finite values at the pole set), Z={2rho-1: zeta(rho)=0, Re(rho)>1/2}. For Re(s)>2, substitution x=exp(2u) gives Phi(s)=integral_0^infty g(u)exp(-su)du. g measurable; for u>=0, |D(x)|<=cx+x log x for x>=1 by summing over all integers, so |g(u)|<=e^u(c+2u)<= (c+2)e^(2u). Z lies in Re>0 and is locally isolated there. Phi holomorphic away from Z, including s=1 by removal. Its residue at 2rho-1 is m_rho J(rho) (the 1/2 exactly cancels the coordinate derivative). No real poles in Z: zeta has no real zeros >1 by Euler product, nor in (1/2,1) by eta(w)>0 and zeta(w)=eta(w)/(1-2^(1-w)); the point 1 is a pole, not a zero. Thus the positive-real-residue condition is vacuous. All seven fields of the pinned Deduction.PoleData are checked in the human interpretation: meas, growth, laplace, pos, diff, iso, pole. In Lean one would need to define Phi at all complex arguments and choose the analytic continuation value at s=1 explicitly.
4. Set theta'=2theta-1=2eps in (0,1), U=log(Y)/2. The mission premise gives g(u)<=C exp(theta' u) throughout [U,(1+delta)U]. Choose R(u)=C exp(theta' u). It is nonnegative and its weighted integral is C delta U <= exp(eta U) for any eta>0 at sufficiently large U. The quantifier order is exactly WindowHypU: delta fixed before eta, eta arbitrary, U>=U0 chosen on the unbounded sequence. The pinned Deduction.landau_window gives Re(2rho-1)<=theta', hence Re(rho)<=theta. Vary eps down to zero and apply rh_of_right. This implication proves RH *if* the arithmetic assumption in the first paragraph is supplied.
   The same argument directly admits the relaxed positive-part budget: integral_U^((1+delta)U) max(g(u),0) exp(-theta' u)du = (1/2) integral_Y^(Y^(1+delta)) D_+(x)x^(-theta-1)dx. Thus the audited peer power-saving exceptional-prime mass criterion can feed this adapter with no von Mangoldt baseline bridge. Do not count the adapter as a solution of that criterion.

**Reduction achieved:** remove the centered integer and prime-power observable from the shortest conditional argument, not from the original Lean proof's dependency graph. The rescaling is necessary to avoid claiming H is holomorphic in Re>0. One unproved arithmetic window premise remains on this direct route; it may be replaced by the weaker audited sparse-exception premise. A single frontier statement is not a proof or a completion percentage.

## Recursive native supplier ledger (parallel route, not erased)
- Original root and modulus-one specialization: source bodies checked below. MainConclusion.everyCharacter_of_row consumes the Row0b package, recTExists and vwin_of_row. EveryCharacterOfLiteratureOfVWin.every_character_of_literature_of_vWin passes published_results_eigen, published_results_first, the two theta matching projections, the covolume theorem package, recT existence and hV to every_character_of_theta_integrals_local_matching. None is declared unnecessary merely because the output is specialized.
- Native arithmetic: peer 0ea93dcb has conditional common patched gcd integer B with all CaseI contributions bounded by 2 log B, but NumberU3U_s and OneCharU_s are still substantive inputs; peer 15f1c982 gives the alternative finite even K-group bound in the trivial-zero parity sector, not an effective uniform length estimate. CountII/V/Vs and 2-primary/minus are open.
- Native geometry: peer 91a5aa50 identifies an unused Green upper comparison in LinkIRR only, with remaining squarefree mass, local lower comparison and actual row counts. TopG/ASK-MAIN, tied witness construction and signed character discrepancy remain open. Peer 223e6835 gives prime-only auxiliary signal and cube-root remainder, not its needed bound.
- Direct analytic route: peer 596dc680 gives the earlier centered shell route; ce3c04a5 gives a quantitative pole-window lower bound; 90638370 independently audits and derives a fixed-power-saving exceptional prime mass sufficient criterion; e7c5909b and c7531de give reverse/forward prime-node transfer. These are human implications, not the missing unconditional estimate. Do not keep expanding equivalent observables unless needed for an actual supplier.
- Peer ce477f4e/a5911b27 report authenticated 733 expanded owners, 8291 identities, 63638 role rows, 6328 mixed-role reachable nodes, 6063 value-only; manifest 1,484,705 rows. These are peer export metrics, not proof completion. This run checked 7/7 PoleData fields in one human adapter, 0/1 arithmetic frontier assertions proved, 0 Lean replays. The full native root-to-leaf DAG is not certified exhausted.

## Source and preflight
Pinned source leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Fetched exact blobs:
- src/Main.lean dbd5db70bc11b35f18fa5751216ab335321e7bfc (riemannHypothesis).
- src/Supplements/Kernels/MainTheorems.lean 6a542d7ce969a791fd12ce575f587e6bc29044bf (rhOfAll, allChi).
- src/Formalism/GammaFactorNonvanishing/CritLine.lean 95fa4da5c50119db164aa93944d106f22fdb576d (rh_of_every).
- src/Formalism/GammaFactorNonvanishing/RhOfRight.lean 3604637147a33e72248faddd775ea750e7846ead (rh_of_right).
- src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean ee340012ab19713a8acfecf8adc6a331cbc2f1a4.
- src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 (tail of actual supplier).
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (PoleData, WindowHypU).
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a (landau_window, key).
Latest upstream API commit observed 75e2012dcc6f3093e223ef8d327b88395ff7d27c; not mixed into pinned proof. Read mission first at e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1, current updated mission at branch (blob 40edb756d8a08509c33b7a79eb92b440e303a719, recursive root directive 3bc50a36), AGENTS, SWARM, HANDOFF, expansion, manuscript spine, state/runner/continuity excerpts, latest peer commit list and named peer derivations/handoffs. General CI checkpoint #428 (07:49:54 UTC) predates this note and is not RH verification. Not an exhaustive historical peer archive reread.

## Reproducible arithmetic check
Actual local CPython/mpmath run, exit 0. This finite numerical check concerns kernel integration, Euler product sign and coordinate normalization only; the complex analytic proof above does not depend on numerical data. Tail bound used for Re(w)>1 follows by integral comparison of decreasing log(t)t^(-Re(w)) on t>=N. Double-precision Euler sums, 40 decimal quadrature; not interval-certified.
```python
import math, cmath
import mpmath as mp
N=100000
s=bytearray(b'\x01')*(N+1); s[:2]=b'\0\0'
for p in range(2,math.isqrt(N)+1):
 if s[p]: s[p*p::p]=b'\0'*(((N-p*p)//p)+1)
P=[p for p in range(2,N+1) if s[p]]
mp.mp.dps=40
c=1-mp.log(2)
assert abs(mp.quad(lambda u:(2-u)*u**-2,[1,2])-c)<mp.mpf('1e-38')
for w in [2,3,2+3j,3+7j]:
 z=mp.mpc(w); J=mp.quad(lambda v:(2-v)*v**(-z-1),[1,2]); j2=2*(1-mp.power(2,-z))/z-(1-mp.power(2,1-z))/(z-1)
 assert abs(J-j2)<mp.mpf('1e-38')
 assert abs(z*J-(1-mp.quad(lambda v:v**(-z),[1,2])))<mp.mpf('1e-38')
 L=sum(math.log(p)*cmath.exp(-complex(w)*math.log(p)) for p in P)
 H=sum(math.log(p)*cmath.exp(-2*complex(w)*math.log(p))/(1-cmath.exp(-complex(w)*math.log(p))) for p in P)
 resid=abs(L+H+complex(mp.diff(mp.zeta,z)/mp.zeta(z)))
 a=z.real; tail=float(N**(1-a)*(mp.log(N)/(a-1)+1/(a-1)**2))
 assert resid<=tail+1e-12
 print('w',w,'Euler residual',format(resid,'.7g'),'integer tail bound',format(tail,'.7g'))
 for p in [2,3,101,99991]:
  pp=mp.mpf(p); t=2*z-1
  lhs=mp.quad(lambda u:(2-mp.exp(2*u)/pp)*mp.log(pp)*mp.exp(-(t+1)*u),[mp.log(pp)/2,mp.log(2*pp)/2]); rhs=J*mp.log(pp)*pp**(-z)/2
  assert abs(lhs-rhs)<mp.mpf('1e-38')
  assert abs(lhs-2*rhs)>abs(rhs)/2
print('primes',len(P),'kernel checks',9,'prime-shell rescaling checks',16,'negative controls',16)
```
Observed:
```
w 2 Euler residual 9.982973e-06 integer tail bound 0.0001251293
w 3 Euler residual 4.987463e-11 integer tail bound 6.006463e-10
w (2+3j) Euler residual 3.155673e-06 integer tail bound 0.0001251293
w (3+7j) Euler residual 1.370119e-11 integer tail bound 6.006463e-10
primes 9592 kernel checks 9 prime-shell rescaling checks 16 negative controls 16
```
RESUME HERE: do not derive another equivalent RH criterion. Start at native UpperTheory.Top.zeroFreeAll_of_topG / UpperTheory.Comparison₂.formB and specialize the exact principal-character host supplier, tracking the first substantive quantitative dependency which would feed the arithmetic window estimate; alternatively close that estimate directly. Keep unresolved native leaves visible.
HANDOFF TO: formal audit (check affine rescaling, analytic extension and residue normalization), kernel (construct replacement PoleData with these exact premises), integration (use this compact conditional route, not another manuscript volume), arithmetic lanes (supply actual bound).