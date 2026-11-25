import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.lemmaL
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.WindowHypOfRpow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN30, 25 Nov 2026 — aggregate the actual principal-window producer
before imposing any uniform power bound. Source-matched human reduction;
native scalar/caller candidate PREPARED, NOT compiled. RH OPEN.

Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc read first (unified
pipeline, shared pyramid, canonical equation, ten-page cap). SWARM
4b77b161d6876915c15cea5a4d4a519beaf5de74, HANDOFF
bbc46df7d7716a6d8863275b5271801eacfaad0d, EXPANSION, AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972, continuity
61459cfddab270c187cf628ed60b84749d290a0c, research state/log/protocol
and latest state summary inspected. Current live manuscript
75026c85481848e3c615fcec6e25bec2cfae1dbb. Previous own RUN29
ebe13020e1334474abad69454d5424c7098cc61e. Peer b7b335f6 proves
the principal sparse uniform mesh by semiconvexity; this run uses
its chord identity, DOES NOT repeat the uniform mesh proof, and
removes the requirement of uniform small upper budgets at the nodes
at the existing native WindowHyp consumer. Peers dd7cd00b (height
sign), 70732176 (same-host budget), 437f345a (even-chart) inspected.
Working commit list head 437f345a06e1f0a3761f6eb9a6e6b7996ee1b8e4.

Pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Exact source files under
src/Development/AutomorphicArithmetic/DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
LandauTheorems/landauWindow.lean 7915058f10b33a52652290cd887cbccdc00e676a
PrimitiveCosets/CoreGm.lean (relative to AutomorphicArithmetic)
3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d.
Actual bodies inspected. Latest upstream commit search:
8e5cefeeaffe7e4c12153385b7bb33fb7223c41a (observed 25 Nov);
clumped LandauTheorems/landauWindow.lean blob
c3ef70f724a72f916a4f17e1f3c52d73870e862a, same as RUN29 observed
clumped blob; no assertion of full cross-version equivalence.

## Editor-ready optional producer reduction (not a new analytic criterion)

At the actual singleton level, G=Gm F is the principal centered ramp
in the shared manuscript. Fix theta=1/2+9 eps in (1/2,1), delta=1/2.
Take Y>=1 and a finite mesh Y=a_0<...<a_N=Y^(3/2).
For each node have a nonnegative upper budget A_i>=G(a_i), derived
from the actual same-host arithmetic/geometric witnesses, not from RH.
Set h_i=a_(i+1)-a_i. The following ONE scalar inequality suffices at the
native WindowHyp consumer:
  sum_i [h_i*(A_i+A_(i+1))/(2*a_i^(theta+1))
             + h_i^3/(12*a_i^(theta+2))] <= Y^eta.              (M)
Quantifiers: for EVERY eta>0 and EVERY Y0 there exist Y>=max(1,Y0),
a mesh and upper budgets as above satisfying (M). No fixed family
may be replaced independently at different points if a retained
source producer requires the same family. The singleton F itself is
fixed for the entire argument. No proof of (M) for arbitrary distant
windows is asserted. Canonical pointwise equation [E] remains the
primary manuscript route.

Proof: on [a,b] put t=(x-a)/(b-a), h=b-a. Every von Mangoldt
coefficient is nonnegative, so its finite ramp is convex; the second
derivative of -x log x + x^2/(2a) is 1/a-1/x>=0. Adding the remaining
linear term yields convexity of G(x)+x^2/(2a), hence the exact
one-sided chord estimate from peer b7b335f6. Substitute only the
NONNEGATIVE endpoint budgets:
  G(x) <= R(x)=(1-t)A_i+t A_(i+1)+t(1-t)h^2/(2a).
The last term is nonnegative; adjacent pieces agree at their common
node, so R is a continuous nonnegative majorant on the closed window.
Extend by zero outside it (only integrability on the window matters).
The weight x^(-theta-1) is positive and decreasing; therefore
  integral_a^b R(x) x^(-theta-1) dx
    <= a^(-theta-1)*[h*(A_i+A_(i+1))/2+h^3/(12a)].
The polynomial integral is exact: integral_0^1 t(1-t) dt=1/6.
Summing proves the precise original Deduction.WindowHyp F theta delta
definition, including its pointwise nonnegativity/majorization,
integrability and every eta, every starting threshold quantifiers.
Invoke original lemmaL, then choose eps small enough for each candidate
zero and use the conditional half-strip endpoint. No exceptional pole
or positivity assumption has been weakened: those remain inside
the original poleData/landau_window and singleton identification.
This bypasses windowHyp_of_rpow, not the proof of the arithmetic
bounds or native analytic theorem.

Useful budget simplification: on peer mesh h_i<=a_i^(3/4), put
S=sum_i h_i*(A_i+A_(i+1))/(2*a_i^(theta+1)).
The curvature cost is at most sum_i h_i/(12*a_i), since theta>=1/2.
As h_i<=a_i, h_i/a_i<=2 log(a_(i+1)/a_i) (integrate 1/x).
Thus curvature cost <= log(Y)/12 at delta=1/2.
It suffices that S<=Y^(eta/2) for arbitrarily distant windows for
every eta>0: enlarge the starting threshold to absorb both that
term and log(Y)/12 into Y^eta. This is a weighted budget, not a
pointwise normalized upper bound. It can tolerate isolated larger
node budgets, but not a signed cancellation between positive
and negative budgets. Do not replace A_i by signed G(a_i) in this
argument: positivity is needed when moving the decreasing weight
outside the integral. Likewise arbitrary sparse nodes without a
curvature budget are insufficient.

The actual live manuscript's signed principal averaging yields
the local nonnegative budget
 A_i=2 Err_i/(Q_i*d_i)+4/(a_i*d_i)+1+3 a_i^(1/2+eps)
with Q_i,d_i>0, subject to its same-host, height, signed correction,
and geometry premises. Keep every such premise. A producer may
target the weighted sum of these A_i instead of proving they are
uniformly <=a_i^theta. This may simplify upstream budget construction;
the local manuscript replacement itself is not independently
kernel-verified. If the original uniform bound at nodes is available,
choose A_i=a_i^theta. Since b<=2a and theta<1, S<=3/2 sum h_i/a_i
<=3 log(Y^(1/2)), which is eventually absorbed. Thus the peer uniform
mesh implies this budget hypothesis, while the aggregate estimate
does not REQUIRE uniform bounds on the A_i. Do not infer a pointwise
canonical equation back from (M); its intended consumer is lemmaL.

## Original and overlay dependency graphs

Original (source-visible): core_gm -> windowInequality_of_artinInputs
-> formB -> zeroFree_of_rpow_window -> lemmaL + windowHyp_of_rpow;
lemmaL -> poleData + windowHypU_of_windowHyp + landau_window +
charFamily_LFunction_ne_zero_of_one_le_re.
Overlay (human): same singleton + proved node budgets + mesh
-> chord majorant -> weighted polynomial bound (M) -> WindowHyp
-> same lemmaL -> same conditional half-strip root.
No global kernel edge removal; original graph, type/value/constructor
edges, unexpanded obligations and axioms preserved. Cache key includes
(pin, singleton F, theta, eps, delta, eta, Y, mesh, actual common
family/host, individual node witnesses, A). Backtrack to pointwise
route if aggregate producer or native formalization fails.
No URT ordering advantage tested or asserted.

## Executed evidence

Local CPython + scipy, exit 0. Exact polynomial cases 4800;
actual prime powers <=32768: 3590; actual ramp evaluations 3420;
weighted cell quadratures 180; maximum positive sampled violation 0;
whole-window numerical majorant integral / proved bound range
0.7733418231180221 to 0.9115924841402222.
These are local numerical regressions and exact scalar identities,
not evidence for arbitrary distant windows or RH.

Reproduce (Python, scipy):
```python
from fractions import Fraction as F
from math import log, isqrt
from bisect import bisect_right
from scipy.integrate import quad
from scipy.special import psi
count=0
for a in range(1,41):
 for h in range(1,31):
  for A,B in [(0,0),(1,4),(10,0),(3,3)]:
   c=F(h*h,2*a)
   exact=h*(F(A)+F(B-A,2)+c/2-c/3)
   assert exact==F(h*(A+B),2)+F(h**3,12*a)
   count+=1
N=32768
sieve=bytearray(b'\x01')*(N+1);sieve[:2]=b'\0\0'
for p in range(2,isqrt(N)+1):
 if sieve[p]: sieve[p*p:N+1:p]=b'\0'*((N-p*p)//p+1)
pp=[]
for p in range(2,N+1):
 if sieve[p]:
  q=p
  while q<=N: pp.append((q,log(p)));q*=p
pp.sort(); ns=[n for n,v in pp]; s1=[0.];s2=[0.]
for n,v in pp:s1.append(s1[-1]+v/n);s2.append(s2[-1]+v)
gamma=-float(psi(1))
def G(x):
 k=bisect_right(ns,x)
 return x*s1[k]-s2[k]-x*log(x)+(1+gamma)*x
cells=checks=0; ratios=[]; max_violation=0.
for Y in (64,256,1024):
 end=Y*isqrt(Y); grid=[Y]
 while grid[-1]<end:
  a=grid[-1]; grid.append(min(end,a+max(1,int(a**.75))))
 for theta in (.55,.7,.95):
  upper=actual=0.
  for a,b in zip(grid,grid[1:]):
   h=b-a; A=max(0.,G(a));B=max(0.,G(b))
   def R(x):
    t=(x-a)/h; return (1-t)*A+t*B+t*(1-t)*h*h/(2*a)
   for j in range(1,20):
    x=a+h*j/20; v=G(x)-R(x);max_violation=max(max_violation,v)
    assert v<=1e-8*max(1,abs(G(x)),abs(R(x)));checks+=1
   mass=quad(lambda x:R(x)*x**(-theta-1),a,b,epsabs=1e-11)[0]
   bound=(h*(A+B)/2+h**3/(12*a))*a**(-theta-1)
   assert mass<=bound+1e-10; actual+=mass;upper+=bound;cells+=1
  ratios.append(actual/upper)
print(count,len(pp),checks,cells,max_violation,min(ratios),max(ratios))
```

Local command -v lean and lake returned no paths. Actual existing CI
status files fetched: run 45577239749 blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (pass,98.87s);
run 45576756833 blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
(pass,77.94s). Prior conditional half-strip root axioms:
propext, Classical.choice, Quot.sound. Prior scan of rh_of_right
bounded at 2000, 324 pending. Neither CI job compiles this candidate.
No new kernel or axiom result, no global proof validation.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Scalar candidates and native consumer replay below are executable
Lean source for the established runner, uncompiled. The replay assumes
WindowHyp itself; it does NOT certify the full piecewise integral
construction. No new CI job submitted.

RESUME HERE: independent audit of the mesh integration and exact
quantifiers; formalize the piecewise continuous majorant and finite
interval-additivity bridge to WindowHyp in pinned Lean. Galois and
geometry peers may test whether their actual same-host producers
supply the weighted budget, retaining local guards. If not, retain
the original uniform route. Stop further alternate analytic
expansions unless they remove a concrete upstream obligation.
HANDOFF TO integration/editor, prime window, geometry, kernel and
audit. The weighted arithmetic budget and original equation are OPEN.
-/

noncomputable section
namespace RHWeightedMeshWindow

-- Exact substitution of upper endpoint budgets before integration.
theorem chord_upper (g ga gb A B t c : ℝ)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hA : ga ≤ A) (hB : gb ≤ B)
    (hg : g ≤ (1-t)*ga+t*gb+c) :
    g ≤ (1-t)*A+t*B+c := by
  have hleft := mul_le_mul_of_nonneg_left hA (sub_nonneg.mpr ht1)
  have hright := mul_le_mul_of_nonneg_left hB ht
  linarith

theorem chord_nonnegative (A B t c : ℝ)
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hc : 0 ≤ c) : 0 ≤ (1-t)*A+t*B+c := by
  exact add_nonneg (add_nonneg (mul_nonneg (sub_nonneg.mpr ht1) hA)
    (mul_nonneg ht hB)) hc

-- Exact integrated polynomial, with c=h^2/(2a) supplied separately.
theorem poly_mass (A B h c : ℝ) :
    h*(A+(B-A)/2+c/2-c/3) = h*(A+B)/2+h*c/6 := by ring

theorem curvature_mass (a h : ℝ) (ha : a ≠ 0) :
    h*(h^2/(2*a))/6 = h^3/(12*a) := by
  field_simp [ha] <;> ring

-- Native consumer replay, not a proof of the mesh-to-WindowHyp lemma.
theorem native_aggregate_window (F : Deduction.CharFamily)
    {theta delta : ℝ} (ht : 0 < theta) (ht1 : theta < 1)
    (hd : 0 < delta) (h : Deduction.WindowHyp F theta delta) :
    Deduction.ZeroFree F theta := by
  first | rh_reduce 2 using [Deduction.lemmaL] |
    exact Deduction.lemmaL F ht ht1 hd h

theorem native_aggregate_frontier (F : Deduction.CharFamily)
    {theta delta : ℝ} (ht : 0 < theta) (ht1 : theta < 1)
    (hd : 0 < delta) (h : Deduction.WindowHyp F theta delta) :
    Deduction.ZeroFree F theta := by
  rh_auto_frontier 2
  all_goals first | exact native_aggregate_window F ht ht1 hd h | rh_auto 3

rh_scan Deduction.lemmaL limit 2000
rh_scan Deduction.windowHyp_of_rpow limit 2000
rh_prune Deduction.lemmaL as lemmaL_pruned30
#print axioms Deduction.lemmaL
#print axioms chord_upper
#print axioms chord_nonnegative
#print axioms poly_mass
#print axioms curvature_mass
#print axioms native_aggregate_window
end RHWeightedMeshWindow
