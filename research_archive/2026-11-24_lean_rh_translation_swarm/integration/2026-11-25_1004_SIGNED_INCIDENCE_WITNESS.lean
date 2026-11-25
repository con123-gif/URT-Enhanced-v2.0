import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration RUN11 — signed incidence replaces nearly-full geometric coverage
25 Nov 2026. One SOURCE-MATCHED conditional mathematical join, PREPARED native
certificate, exact local regression executed. RH OPEN. No URT or physics.

## Result
Join the actual common positive arithmetic kernel (lane 14, 93284779), the
almost-coverage selection (e8d168ea), and the derivative-free endpoint
(d5e73014). Use the SAME principal host H=A0, h=|H|, T=TT, r=|T|>0,
d=|T2|/h>0, a=xb, b>0, x>=3, k>=1, A_t=a(t), S=sum A_t>0,
J=eta+1>=0, and y=y_L>=x+w where w=1/(k*x^12). Retain all exact host,
cutoff, common-table, native weight windows, signed thin reference and
pointwise geometry premises in f5bab469 and d5e73014. Actual aT_win
gives x<=A_t/b<=x+w. If this tie or y>=x+w is unavailable, backtrack
to the original broader kernel bounds. No new choice of tables after u.

For n>=1 set
 c(A,n)=(A/n-A/y)_+-(A/n-b)_+ + J 1_{n<=A/b}.
The positive kernel K(n,v)=Re Kc(D,n,e1(v)) has total mass <=2 on H
for prime powers, including ramified ones; Lambda(n)=0 otherwise.
Define L_tv=sum_n Lambda(n) K(n,v) c(A_t,n)>=0 and L=sum_{t,v} L_tv.
The actual two-scale arithmetic score in f5bab469/93284779 is
 M(u)=B-sum_{t in T,s in T2} L_{t,s+u-t}, B independent of u.
Exactly mean_H M=B-d L by translation bijection.

Use the sharpened common upper envelope
 c+(n)=b-a/y+J                               if n<=x;
       (a+b*w)(1/n-1/y)+J 1_{n<=x+w}         if x<n<=y;
       0                                     otherwise.
Because y>=x+w and A_t/b>=x, for n<=x the exact difference is
 (A_t-a)/y. For x<n<=y the ramp difference is
 (a+b*w-A_t)(1/n-1/y)+(A_t/n-b)_+.
The latter positive part is <=(A_t-a)/n since a/n<b. Thus the two
terms combined are <=b*w/n; the indicator adds at most J on
(x,x+w]. Beyond y both vanish. Consequently
 0<=c+(n)-c(A_t,n)<=
   (b*w/y)1_{n<=x}+(b*w/n)1_{x<n<=y}+J 1_{x<n<=x+w}.       (1)
No triangle inequality on signed prime discrepancies. Put
 P(v)=sum_n Lambda(n) K(n,v)c+(n), C(u)=sum_{s,t}P(s+u-t),
 E=r*sum_v P(v)-L>=0.
Then M(u)>=B-C(u). Summing (1) against actual positive mass gives
 E<=2r[b*w*psi(x)/y+b*w*sum_{x<n<=y}Lambda(n)/n+J*log(x+w)].
The last term is necessary if the interval crosses an integer; w<1
means at most one integer. Native y<=xn X', log n=O(log x),
X'=exp(x^(eps/3)), J/b<=1 eventually, and elementary Chebyshev
psi(z)<=4 log(2) z give E/(rb)=O(w*(1+log(y/x))+(J/b)*log x).
This is negligible at RH scale, uniformly on the native windows.
No removal of boundary jump without a proof. No estimate on L by RH:
the unconditional bound in e8d168ea gives L=O(S*x^(eps/3)).

## New signed coverage criterion (the actual join)
Let G be ANY nonempty set of actual carrying translations with the
required same-data geometry gapA(u)<=Err. Do not assume G is large,
independent of the arithmetic data or closed under translations.
Choose a probability mass mu supported on G; uniform on G suffices.
Define the actual additive incidence
 rho(v)=sum_{u in G,t in T,s in T2} mu(u) 1_{v=s+u-t}.
Its total is r*|T2|, hence its uniform mean is r*d.
The only new scalar contraction is
 Delta=sum_v (rho(v)-r*d)*P(v).
Do not take abs(Delta). Average C over mu, interchange finite sums:
 mean_mu C=r*d*sum_v P(v)+Delta=d(L+E)+Delta.
Since a minimum on G is <= its mu-average, choose u* in G minimizing
C. Then
 M(u*)>=B-C(u*)>=mean_H M-d*E-Delta.                       (2)
In particular the old almost-full coverage condition can be replaced
by the signed incidence budget
    Delta <= d*S*O(x^(-1/2+eps))                            (3)
on the same native windows. This concerns certified carrying geometry,
not arbitrary u. No claim of an unconditional supplier for (3).
It is a strict weakening of the geometric *selection* requirement:
if rho(v)<= (1+z)r*d for all v, z>=0, then Delta<=z*d*(L+E).
For uniform mu on G, each pair (s,t) has at most one u for each v, and
rho(v)<=r*|T2|/|G|, so z<=h/|G|-1 is always an available choice.
Thus the previous almost-coverage bound is retained up to the extra
already negligible envelope error; if G is small but incidence is
uniform, z=0, Delta=0. Example for the algebra only: H=Z/8, G={0,4},
T2={0,1,2,3}, any nonempty T. Each (t,v) has exactly one (s,u) pair,
so rho(v)=r/2 even with only 1/4 of H available. More generally a
coset G of subgroup K and a T2 with equal counts on each K-coset
gives uniform rho for ANY T. No assertion the native Behrend sets or
actual geometry have that property. In the unbalanced case retain
the exact signed Delta; no inference from mere nonemptiness.

Use the lower-envelope geometry inequality of f5bab469
 gapA(u*)>=m M(u*)-3m S/x
and gapA(u*)<=Err, plus the exact original mean identity
 mean M=(b*d/2) sum_t F(y_t)+L_ref+T_ref-J*d*Msum.
The normalized shift from d5e73014 gives the single joined bound:
 F(x)<= w + (2*x/(d*S)) *
   (Err/m + 3*S/x - L_ref - T_ref + J*d*Msum + d*E + Delta). (4)
All denominators positive. Since E>=0 and S>=rbx, the new envelope
cost 2xE/S is negligible. Under (3) the signed incidence cost is
O(x^(1/2+eps)). The signed Delta may even be favorable. No replacement
of the exact denominator by a bound on a signed numerator.
This is a rigorous conditional reduction of the actual geometry
selection requirement, NOT a proof of (3), actual geometric coverage,
the signed thin or prime cancellation, or RH. Computationally P is one
shared prime-power kernel and rho is the convolution of the actual masks
and mu, so use cached finite group sums; no universal O(N) assertion.
The finite proof of (2) works even with mu depending on all arithmetic
and geometric data. The exact G still must be produced or certified.

## Root spine / obligation ledger (original graph untouched)
Original: Main.riemannHypothesis -> rhOfAll -> rh_of_every -> rh_of_right;
all-character upstream graph retained. Conditional native half-strip
adapter independently checked in prior run 45577239749. Its open input
is zeta nonvanishing on 1/2<Re(s)<1, not the claimed Main theorem.
Direct alternative: weighted outer-shell bound for all eps on arbitrarily
distant power windows -> singleton Landau -> half-strip. Peer 2a2a11a5
removes small factors/higher powers unconditionally at RH scale; signed
joint high-prime correlation plus harmonic centering A+C still OPEN.
Low-band Gaussian / block increment alternatives remain OPEN.
Native arithmetic: corGK -> cotLen -> VVle -> VWinAt -> supplyChi.
91c8057c quasipolynomial budget sufficient, 4cd96476 Euler cancellation,
048163e3 saturated dual, 2b8a92ce fixed-order weight-one block; the
full uniform all-prime/all-length/local conditions, Count I/II/V/Vs,
2-primary/minus remain OPEN. No fixed-order bound extrapolated.
Native geometry: linkGLOBAL_of -> common tables, CoverAll, hChr ->
CoreAtH/ChainTied -> ch_top -> ch_core/core -> ch_balance,sum_Th ->
GmA/SigA -> window. Original source-visible edges/type/value/constructor
evidence and axioms retained. Proposed overlay in this exact context:
actual common tables -> Kc/aT_win -> P,E; certified G,mu -> rho,Delta;
(1),(2) + selected local geometry -> (4) -> remaining scale/window transfer.
Peers a4681a51,3f57da2e,fec5acd7,4d395181,823d1b3d prepare pointwise
producer, IO, signed local loss and joint word/rank budget, not yet native
replayed here. 8f108c35,eae577c6 give local mean-square reduction;
affaca49 generic character minorant; 359a3b34 thin exceptional filter.
Surviving: actual common host, table and ObjCP/selected geometry,
same-point PtH/LinkG_at/bad prime budgets, rank/DIV/quotient/entropy
and signed word budget, TopG/Green, uniform arithmetic lengths, thin
reference contractions, signed auxiliary pair, final scale and caller
transfer; all unexpanded dependencies and axioms preserved.
No deletion of CoverAll in other consumers. Cache key =
(pin, principal A0, D, ell, TT,T2, aT table, b,x,k,J,y, G,mu,cutoffs,
inertia/Frobenius data). Changing these invalidates the cached score.
Backtrack to exact max over all H, old almost-coverage, or native
unreduced core if the incidence condition is not available. No global
minimality, proof coverage percentage or unconditional RH closure.

## Provenance and pipeline
Latest mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 including
4b677bc2 mandatory pipeline read first; SWARM_PROTOCOL, AGENTS,
HANDOFF_QUEUE, state/log/protocol/continuity excerpts, latest 25 peer
commit subjects and relevant bodies read (not exhaustive archive audit).
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream
observed a85077714ca7b298f69e48798497519ed5326a89 09:29:19 UTC, not mixed.
Fresh pinned source retrieval:
src/Formalism/LocalRingCardinality/DataParams₂.lean
 50914500995df91e2646d91a6c5c99a7e603a51b (Scale.A=26,aT_win).
src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean
 94a385f59f3781ae6b1ab4beddc73850708a2bc6 (inner_eq, colour_balance).
src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean
 878f5077bc382426c7da988e5a375b85deeaa7de (sum_A,sum_Th,th_le,core).
same directory ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4
 (orthogonality_ramified calls, Kc, askExp). Retain source transport
 of aT_win and native scale bounds from d5e73014 and f5bab469.
Native engine versions fetched: RHProofTermPrune f6d3e7f6047a7895ecf183be3fb54c203f4fc46a,
RHRecursiveReductionFixed 976c28572f11ffb00e1ae730555e938eeb564cb7,
RHRecursiveReductionAutoV3 a113dc56ea987abac3bf29eb480782140b82ab4a.
Published status.json directly retrieved for runs 45577239749 (pass,
98.87s; reduced_strip_root axioms propext,Classical.choice,Quot.sound)
and 45576756833 (pass,77.94s; actual rh_of_right bounded scan 2000
visited, 324 pending, three axioms; no binder drop). These are PRIOR
engine tests only. Orchestrator 45584953091 checkpoint 434 PASS
09:45 UTC predates this contribution. Local command -v lean and lake
returned no paths; no native execution or new axiom evidence. Prepared
certificate below includes actual core scan/prune, bounded reduction,
auto and frontier; native caller still needs actual incidence identity
and (3). No new CI job registered, no new native PASS. Do not import Main.

## Executed local CPython regression (exact rational, exit 0)
Reproduce by extracting the following Python block. Finite algebra
controls are not native host/Frobenius data or proof of asymptotics.
```python
from fractions import Fraction as Q
from itertools import combinations

def c(A,n,b,y,J):
    return max(A/n-A/y,0)-max(A/n-b,0)+J*(n<=A/b)
def cp(a,w,n,b,y,J):
    x=a/b
    if n<=x:return b-a/y+J
    if n<=y:return (a+b*w)*(1/n-1/y)+J*(n<=x+w)
    return Q(0)
rows=0
for x in map(Q,['3','31/10','399/100','4','499/100','10']):
    for b in map(Q,[1,3,11]):
        for w in [Q(1,100),Q(1,13),1/x**12]:
            for y in [x+w,x+w+Q(1,2),2*x,10*x]:
                for J in map(Q,[0,1,5]):
                    for frac in [Q(0),Q(1,3),Q(1)]:
                        A=b*(x+w*frac)
                        for k in range(1,int(y)+2):
                            n=Q(k)
                            diff=cp(b*x,w,n,b,y,J)-c(A,n,b,y,J)
                            bound=b*w/y*(n<=x)+b*w/n*(x<n<=y)+J*(x<n<=x+w)
                            assert 0<=diff<=bound
                            rows+=1
h=4; H=range(h)
sets=[s for j in range(1,h+1) for s in combinations(H,j)]
P=list(map(Q,[3,1,7,0])); cases=0; gain=0; signed_gain=0; favorable=0
for T in sets:
    for T2 in sets:
        d=Q(len(T2),h); r=len(T)
        Ltv={(t,v):P[v]*Q(1+((t+v)%3),3) for t in T for v in H}
        L=sum(Ltv.values()); E=r*sum(P)-L
        M=lambda u:-sum(Ltv[t,(s+u-t)%h] for t in T for s in T2)
        C=lambda u:sum(P[(s+u-t)%h] for t in T for s in T2)
        mean=sum(map(M,H))/h
        assert mean==-d*L and E>=0
        for G in sets:
            rho=[Q(sum((s+u-t)%h==v for s in T2 for t in T for u in G),len(G)) for v in H]
            z=max(rho)/(r*d)-1
            assert z>=0 and sum(rho)==r*len(T2)
            assert z<=Q(h,len(G))-1
            u=min(G,key=C)
            assert C(u)<=sum(rho[v]*P[v] for v in H)
            delta=sum((rho[v]-r*d)*P[v] for v in H)
            assert M(u)>=mean-d*E-delta
            assert delta<=z*d*(L+E)
            assert M(u)>=mean-d*(z*L+(1+z)*E)
            signed_gain+=delta<z*d*(L+E)
            favorable+=delta<0
            cases+=1;gain+=z<Q(h,len(G))-1
assert gain>0
h=8; G=[0,4]; T2=[0,1,2,3]; T=[0,2,6]
rho=[Q(sum((s+u-t)%h==v for s in T2 for t in T for u in G),len(G)) for v in range(h)]
assert rho==[Q(3,2)]*8
assert max([int(v==0) for v in range(8)])>Q(1,8)
x=Q(399,100);w=Q(1,100);y=Q(8);b=Q(1);J=Q(5);n=Q(4)
assert cp(b*x,w,n,b,y,J)-c(b*x,n,b,y,J)>b*w/n
print('exact scalar checks',rows,'incidence checks',cases,'strict coverage gains',gain,'signed gains',signed_gain,'favorable',favorable,'negative controls',2)
```
Observed: exact scalar checks 34533 incidence checks 3375 strict coverage
gains 2358 signed gains 2152 favorable 1108 negative controls 2.
Failed shortcut: treating every single carrying translation as adequate
is invalid (sparse T2 and singleton G). Omitting indicator jump also
fails even with narrow width. Neither negative control is native data.
Failed native access: no Lean/Lake executable.

RESUME HERE: establish or refute the signed incidence budget (3) for
actual certified carrying points from ObjCP at the fixed common host.
In particular inspect whether its geometric construction yields a coset
or complete set of representatives balanced against native T2 or TT;
if not retain exact Delta and use original selected-point existence.
Compile prepared certificate in pinned upstream environment, audit
original/reduced kernel edges and axioms, then join actual selected
ChCore caller (not Main). HANDOFF TO geometry, acceleration, audit,
kernel, editor, mathematics. RH OPEN.
-/

open Finset
noncomputable section
namespace RHIncidenceWitness

theorem weighted_upper {ι : Type*} (I : Finset ι) (p rho : ι → ℝ)
    (A : ℝ) (hp : ∀ v ∈ I, 0 ≤ p v)
    (hr : ∀ v ∈ I, rho v ≤ A) :
    (∑ v ∈ I, rho v * p v) ≤ A * (∑ v ∈ I, p v) := by
  rw [Finset.mul_sum]
  exact Finset.sum_le_sum fun v hv => mul_le_mul_of_nonneg_right (hr v hv) (hp v hv)

theorem centered_identity {ι : Type*} (I : Finset ι) (p rho : ι → ℝ)
    (a : ℝ) :
    (∑ v ∈ I, rho v * p v) =
      a * (∑ v ∈ I, p v) + ∑ v ∈ I, (rho v-a)*p v := by
  simp_rw [sub_mul, Finset.sum_sub_distrib, ← Finset.mul_sum]
  ring

theorem signed_selection (B C M Mmean d L E rP Delta : ℝ)
    (hm : Mmean = B-d*L) (he : E+L=rP)
    (hc : C ≤ d*rP+Delta) (hM : B-C ≤ M) :
    Mmean-d*E-Delta ≤ M := by
  have h : d*rP=d*L+d*E := by rw [← he]; ring
  linarith

theorem signed_selection_transfer (B C M Mmean d L E rP Delta cap : ℝ)
    (hm : Mmean = B-d*L) (he : E+L=rP)
    (hc : C ≤ d*rP+Delta) (hM : B-C ≤ M)
    (hcap : M ≤ cap) : Mmean-d*E-Delta ≤ cap := by
  have h : Mmean-d*E-Delta ≤ M := by
    rh_reduce 3 using [signed_selection B C M Mmean d L E rP Delta hm he hc hM]
  exact h.trans hcap

theorem signed_selection_auto (a b c : ℝ) (h : a ≤ b) (h' : b ≤ c) :
    a ≤ c := by
  rh_auto_frontier 2
  all_goals first | exact h.trans h' | rh_auto 2

end RHIncidenceWitness

rh_scan Deduction.CharacterBalanceMoves.core limit 2000
rh_scan Deduction.CharacterBalanceMoves.sum_Th limit 2000
rh_prune Deduction.CharacterBalanceMoves.core as RHIncidenceCorePruned
rh_scan RHIncidenceWitness.signed_selection limit 2000
#print axioms Deduction.CharacterBalanceMoves.core
#print axioms RHIncidenceWitness.weighted_upper
#print axioms RHIncidenceWitness.centered_identity
#print axioms RHIncidenceWitness.signed_selection
#print axioms RHIncidenceWitness.signed_selection_transfer
