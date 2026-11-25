import Development.AutomorphicArithmetic.PrimitiveCosets.WindowInequalityOfArtinInputs
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.WindowHypOfRpow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN30 — native principal-window scale sparsification
25 Nov 2026. SOURCE-MATCHED human proof of local replacement; Lean scalar
certificate PREPARED, NOT compiled. RH OPEN. This is not a new RH criterion
or a prime-distribution estimate: it reduces the number of actual tied-host
scale witnesses required by the existing canonical G equation.

Read mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc (current unified
pipeline and ten-page cap), live manuscript 75026c85481848e3c615fcec6e25bec2cfae1dbb,
AGENTS, SWARM, HANDOFF, EXPANSION, continuity/runner/state excerpts, prime
RUN25–29, audit RUN30, character_boxes RUN29, geometry RUN19/RUN30 index,
and the peer averaged thin Fourier block. RUN25 square mesh concerns the
DIFFERENT outer-shell deficit and a first-order one-sided bound. Here
the actual native nonnegative ramp gives a second-order chord bound.

## Compact proof block (optional scale-existence simplification, not a new appendix)

In the principal level o=1, by the established native identification,
G=Level.Gm=Deduction.G. For 1<=a<=x<=b, a<b, t=(x-a)/(b-a), write
R(z)=sum_{n<=b} Lambda(n) max(z/n-1,0) for z in [a,b]. Omit n=0
(its von Mangoldt coefficient is zero); n=1 also contributes zero.
Each summand is convex, with nonnegative coefficient, and the extension
of the finite sum from floor(z) to floor(b) is exact. Since the second
derivative of -z log z + z^2/(2a) is 1/a-1/z>=0 on this interval,
G(z)+z^2/(2a) is convex (the remaining Euler-constant term is linear).
Apply the chord inequality and subtract the quadratic exactly:
    G(x) <= (1-t)G(a)+t G(b)+ t(1-t)(b-a)^2/(2a).       (1)
There is no prime-number-theorem estimate or estimate of derivatives
at prime-power breakpoints. Equality at t=0,1 is automatic. This is
a one-sided bound; negative coefficients in a general character sum
would invalidate the convexity argument.

Fix 0<eps<min(eps0,1/18) and let theta=1/2+9eps<1.
On any native window [Y,Y^(3/2)] with Y>=1 choose a0=Y and
    a_(j+1)=min(Y^(3/2), a_j+a_j^(3/4))
until reaching the right endpoint. If the SAME chosen Fm and its uniform
constants supply the original EAtH and CoreAtH conditions just at these
nodes, all above the core_gm eventual threshold, then the original
core_gm applies at every node and yields G(a_j)<=a_j^theta.
Concavity of z^theta gives (1-t)a^theta+t b^theta<=x^theta.
Using b-a<=a^(3/4), t(1-t)<=1/4 gives (1)
    G(x) <= x^theta + sqrt(a)/8 <= (9/8)x^theta.          (2)
This constant is permitted by native windowHyp_of_rpow. Alternatively
select eps/2 at the outset, use (2) at exponent 1/2+9eps/2, and enlarge
the common eventual threshold so x^(9eps/2)>=9/8. Then the original
one-equation G(x)<=x^(1/2+9eps) holds throughout the SAME selected
window. The family/window is not reselected separately at mesh nodes;
each scale may have its own native index i as the source allows.
No requirement to construct a Tied witness between nodes is needed
at this particular principal analytic consumer if the mesh producer
is established. Do not remove original global family assumptions from
other consumers, or assert the sparser producer has been proved.

Cost: on each nonterminal step b=a+a^(3/4)<=2a, the mean-value theorem
gives b^(1/4)-a^(1/4)>=(1/4)*(2a)^(-3/4)*a^(3/4)=2^(-3/4)/4.
Thus number of cells <= 1+4*2^(3/4)*(Y^(3/8)-Y^(1/4)), and number
of nodes is one more. This replaces a continuum of scale checks, or
Theta(Y^(3/2)) integer nodes, with O(Y^(3/8)) scale nodes. No bound
on actual Lean extraction time or on witness-construction complexity
follows. The bound is asymptotic on the number of nodes ONLY.

## Actual root-visible interface and preserved premises

Pinned upstream leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005; exact source blobs:
* src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean
  81c8dfd66d910d083d5bc88c664c7917fdbdfe96 (ramp, G, WindowHyp).
* src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean
  3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d (core_gm).
* src/Development/AutomorphicArithmetic/PrimitiveCosets/WindowInequalityOfArtinInputs.lean
  c349e34925ac26b8bc76bd36e9b91562f86d6b8d (FamCoreConstantBounds;
  windowInequality_of_artinInputs picks i at each x from hT and hE).
* src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean
  a6ac464a67f99a546566ee3a3e0fd1db1f4c2550 (ChebyshevInequalityOnFamilyWindows,
  ChebyshevInequalityAtWindowScale, level_of_tiedWin).
* src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/WindowHypOfRpow.lean
  dde1c159371538875c28374574ca7e452b0450d9 (windowHyp_of_rpow).
* GmAEq.lean 2f1a763f43d65eea1f6e61018c8b70c02d2dfa03 in PrimitiveCosets.

Original path (source-visible): principal level_of_tiedWin ->
windowInequality_of_artinInputs -> core_gm, hE, hT at all large x in Win ->
native FormB. Proposed local principal path: same core_gm, hE and
hT at grid nodes in same large window -> (1),(2) -> same FormB,
or windowHyp_of_rpow with constant 9/8 at the existing singleton
Landau path. Preserve all original graph edges, unresolved premises
and axiom evidence; replacement not yet accepted at native caller.
Cannot simply use this in the generic signed multi-character Gm route.
The unresolved arithmetic/geometric tied-family producer remains OPEN;
the only relaxation is its scale quantifier at the RH-only consumer.
Context-cache key includes pin, actual Fm, level, uniform constants,
eps, chosen Y and actual grid nodes; no reuse between different families.
Backtrack to the original continuum producer if the mesh bridge fails.

Latest upstream observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a
(25 Nov 11:57:33 UTC); no revision mixing or claim of checking latest root.

## Executed finite arithmetic regression
Local CPython + NumPy, exit 0; actual primes/prime powers to 2^20.
82,025 primes, 82,267 nonzero prime-power nodes, 214 cells and 6,634
interior comparisons of (1). max(defect-bound)=-0.0005086842177786069,
max(defect/bound)=0.2751231685325492. Floating logarithms, not interval
arithmetic; analytic proof above is independent of the finite check.
For Y=10000, window [10000,1000000], 89 cells/90 nodes versus
990001 integer nodes including endpoints. These are grid counts, NOT
a measured proof-reconstruction speedup.
Reproduce:
PYTHON:
import math, numpy as np
N=2**20
s=np.ones(N+1,dtype=bool);s[:2]=False
for p in range(2,math.isqrt(N)+1):
 if s[p]:s[p*p::p]=False
lam=np.zeros(N+1)
for p in np.flatnonzero(s):
 q=int(p)
 while q<=N:lam[q]=math.log(int(p));q*=int(p)
L=np.cumsum(lam);n=np.arange(N+1);R=np.cumsum(lam/np.maximum(n,1))
gamma=0.5772156649015329
def G(x):
 i=np.floor(x).astype(np.int64)
 return x*R[i]-L[i]-x*np.log(x)+(1+gamma)*x
checks=0;cells=0;max_excess=-float('inf');max_ratio=0.;counts=[]
for Y in [16,64,256,1024,4096,10000]:
 end=Y**1.5;a=float(Y);c=0
 while a<end:
  b=min(end,a+a**.75);t=np.arange(1,32)/32;x=(1-t)*a+t*b
  chord=(1-t)*G(np.array(a))+t*G(np.array(b))
  err=t*(1-t)*(b-a)**2/(2*a);defect=G(x)-chord
  assert np.all(defect<=err+1e-7)
  max_excess=max(max_excess,float((defect-err).max()))
  max_ratio=max(max_ratio,float((defect/err).max()))
  checks+=len(t);cells+=1;c+=1;a=b
 counts.append((Y,end,c,math.ceil(end-Y)))
print(sum(s),np.count_nonzero(lam),cells,checks,max_excess,max_ratio,counts)
END PYTHON

Native Lean/Lake not installed on local PATH. Prior CI status files
independently read: strip root 45577239749 pass, blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (98.87s), and native prune
45576756833 pass, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
(77.94s). Those certify prior engines/conditional root, NOT this bridge.
Latest orchestrator checkpoint #441 run 45606030273 is project/physical
regression, not new RH evidence. No new Lean or CI PASS claimed.
No URT superiority asserted; exact convexity is the useful reduction.

RESUME HERE: prove the finite-ramp convexity bridge and the sparse
principal caller in the actual pinned Lean environment; inspect whether
the existing full-length VWin and tied geometry producers can exploit
the relaxed scale quantifier. Do not duplicate geometric suppliers.
HANDOFF TO integration/editor, on_acceleration, audit, kernel extractor:
the three-line convexity block is available if it shortens the actual
host construction, otherwise keep the original proof spine. RH OPEN.
-/

namespace RHSparseNativeWindow

-- Exact convexity of each ramp (before multiplication by nonnegative Lambda).
theorem ramp_chord (u v t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) :
    max ((1-t)*u+t*v) 0 ≤ (1-t)*max u 0+t*max v 0 := by
  have hu : 0 ≤ 1-t := by linarith
  apply max_le
  · exact add_le_add (mul_le_mul_of_nonneg_left (le_max_left u 0) hu)
      (mul_le_mul_of_nonneg_left (le_max_left v 0) ht)
  · exact add_nonneg (mul_nonneg hu (le_max_right u 0))
      (mul_nonneg ht (le_max_right v 0))

theorem quadratic_chord (a b t : ℝ) :
    (1-t)*a^2+t*b^2-((1-t)*a+t*b)^2 = t*(1-t)*(b-a)^2 := by ring

-- Scalar component after proving convexity of G+z^2/(2a) on [a,b].
theorem semiconvex_chord (Ga Gb Gx a b t : ℝ) (ha : 0 < a)
    (hc : Gx+((1-t)*a+t*b)^2/(2*a) ≤
      (1-t)*(Ga+a^2/(2*a))+t*(Gb+b^2/(2*a))) :
    Gx ≤ (1-t)*Ga+t*Gb+t*(1-t)*(b-a)^2/(2*a) := by
  have he : (1-t)*(a^2/(2*a))+t*(b^2/(2*a))-
      ((1-t)*a+t*b)^2/(2*a) = t*(1-t)*(b-a)^2/(2*a) := by
    field_simp [ha.ne']
    <;> ring
  linarith

theorem cell_transfer (Gx Ga Gb U V W E t : ℝ)
    (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hGa : Ga ≤ U) (hGb : Gb ≤ V)
    (hconcave : (1-t)*U+t*V ≤ W)
    (hchord : Gx ≤ (1-t)*Ga+t*Gb+E) :
    Gx ≤ W+E := by
  have ha : (1-t)*Ga ≤ (1-t)*U :=
    mul_le_mul_of_nonneg_left hGa (by linarith)
  have hb : t*Gb ≤ t*V := mul_le_mul_of_nonneg_left hGb ht
  linarith

theorem cell_transfer_auto (Gx Ga Gb U V W E t : ℝ)
    (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hGa : Ga ≤ U) (hGb : Gb ≤ V)
    (hconcave : (1-t)*U+t*V ≤ W)
    (hchord : Gx ≤ (1-t)*Ga+t*Gb+E) :
    Gx ≤ W+E := by
  rh_auto_frontier 2
  all_goals first | exact cell_transfer Gx Ga Gb U V W E t ht ht1 hGa hGb hconcave hchord |
    rh_reduce 3 using [cell_transfer] | rh_auto 3

rh_scan UpperTheory.Comparison₂.windowInequality_of_artinInputs limit 2000
rh_prune Deduction.windowHyp_of_rpow as RHSparseNativeWindow.windowHyp_pruned
#print axioms ramp_chord
#print axioms quadratic_chord
#print axioms semiconvex_chord
#print axioms cell_transfer
end RHSparseNativeWindow
