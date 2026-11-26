import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN44, lane 3, 26 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION /
PREPARED LEAN SCALAR AND CALLER ADAPTER, NOT COMPILED. RH OPEN.

Read current mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4
including unified engine, original mission e0dc8f7f, protocol/handoff/expansion,
AGENTS, state/continuity/runner/log openings, live proof fd2d51ae, and
peer commits 72787a07, b0fd82e7, 57df69df, f304da1a, c9fdbd77,
706da3bb, 4ec1ff21 (latest shared arithmetic and geometry branches).
Continuity correction: RUN43 quartic grid is an explicit instance of
RUN30 b7b335f6 semiconvex mesh. Do not count it as a new independent
closure. The new part below is signed local averaging BEFORE positive
parts, followed by one aggregate budget instead of pointwise bounds.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream
observed fc32f2502ebb5272e14ff2f80beced1dc94a21e7 (26 Nov 00:08 UTC);
no migration. Source relative to src/Development/AutomorphicArithmetic/
DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
(defs ramp, G, Gm, WindowHyp);
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.
Actual native consumer is lemmaL, which requires WindowHyp, not a uniform
pointwise rpow bound. Singleton identification Gm F=G is retained.

## Exact arithmetic cancellation
Write c=k^4, h=k^3/4, k>=1 integer, and
 M_k=(1/(2h))*integral_(c-h)^(c+h) G(x) dx.
Set D=(1/(2h))*integral x log x dx - c log c over that same interval.
Extend the nonnegative von Mangoldt sum to floor(c+h), omitting n=0.
Integrate each hinge explicitly. For n<=c-h the mean equals its value
at c; for n>=c+h both vanish. For intermediate n the mean minus its
value at c is (h-|n-c|)^2/(4hn). The affine Euler constant term cancels.
Hence the exact native prime-power identity
 M_k = G(c) + sum_(|n-c|<h) Lambda(n)*(h-|n-c|)^2/(4hn) - D.
Taylor with f''(x)=1/x gives 0<=D<=h^2/(6(c-h))<=k^2/72:
the linear term integrates to zero, mean squared displacement h^2/3.
Thus G(k^4)<=M_k+k^2/72. No PNT, zeros, or RH assumption.
The sign of M is taken AFTER summing signed contributions within its
interval. In particular this is not the average of positive G.
Note the local positive tent correction itself is not a prime
cancellation theorem; it does not make M small.

## Aggregate rather than pointwise native window requirement
For k^4<=x<=(k+1)^4 let a=k^4,b=(k+1)^4,t=(x-a)/(b-a).
RUN30 proved G(x)<=(1-t)G(a)+tG(b)+t(1-t)(b-a)^2/(2a).
Substitute the two signed mean bounds. Since b-a<=15k^3,
(k+1)^2<=4k^2 and t(1-t)<=1/4, the total correction is
<= (225/8+4/72)k^2 <29k^2. Therefore
 G(x)_+ <= M_k^+ + M_(k+1)^+ +29k^2.
This is a pointwise majorant only on each cell, not a claim that
either endpoint is bounded at RH scale.

For theta in (1/2,1), integers 1<=K<L, define the scalar budget
 B_theta(K,L)=sum_(k=K)^L k^(-4theta-1)*max(M_k,0).
On each cell take constant R=M_k^+ + M_(k+1)^+ +29k^2.
At shared endpoints choose either adjacent value; at L^4 use the
last cell. R is nonnegative and piecewise constant. It majorizes G
on the whole compact block and R*x^(-theta-1) is integrable.
Because x>=k^4, cell width<=15k^3, and
 k^(-4theta-1)<=(2^5)*(k+1)^(-4theta-1),
 integration and reindexing give the decisive conditional bound
 integral_(K^4)^(L^4) R(x)*x^(-theta-1) dx
    <=495 B_theta(K,L)+435 sum_(k=K)^(L-1) k^(1-4theta)
    <=495 B_theta(K,L)+435*(1+1/(4theta-2)).
The final constant uses theta>1/2 and the integral test, independent
of K,L. All inequalities are one-sided and retain the same block.

Sufficient arithmetic premise (OPEN): for fixed theta>1/2 and
delta>0, for every eta>0 and every integer K0 there exist integers
K>=max(K0,2), L>=K^(1+delta) with B_theta(K,L)<=K^eta.
For native requested exponent eta0>0, apply premise at 2eta0 and
choose K sufficiently large, so 495K^(2eta0)+constant<=K^(4eta0).
Y=K^4, [Y,Y^(1+delta)] subset [K^4,L^4]; restrict R to that window.
The integral is <=Y^eta0, so native WindowHyp F theta delta holds.
Apply lemmaL directly. Repeat for theta decreasing to 1/2 and the
existing singleton/functional-equation adapter gives RH.
Uniform pointwise M_k<=C*k^(4theta) implies the budget by a harmonic
sum if L is chosen as ceil(K^(1+delta)); the original local pointwise
G bound can also use its own native rpow adapter unchanged.
The new interface permits isolated large positive cell values and
signed cancellation within each mean. No conclusion about the actual
budget on arbitrarily distant windows has been established.

Original source graph:
Gm rpow all x -> windowHyp_of_rpow -> lemmaL -> ZeroFree.
Proposed principal-only graph:
same Gm=G, exact hinge mean, semiconvex chord, signed aggregate budget
-> explicit piecewise R -> WindowHyp -> lemmaL -> ZeroFree.
Do not delete the original graph or any shared consumer of pointwise
G; the entire quantitative arithmetic/geometric producer remains open.
Cache key pin+F+Gm=G+theta+delta+K,L+signed mean normalization.
Backtrack to original rpow path if integration/measure bridge fails.
No URT comparator required: exact integration and cancellation.

## Executed actual-prime regression
CPython + NumPy, exit 0. 148933 primes, 149235 nonzero prime powers,
37 signed means, 7 negative means. Independent direct hinge-integral
vs local correction max abs residual 7.40614005678708e-08.
Minimum endpoint bound slack 0.003405924206309363.
18468 cell checks, max excess -0.003405924206309363.
Midpoint quadrature (illustrative, NOT rigorous) smallest ratio
max(M,0)/mean(G_+) = 0.8222122970402327 at k=27.
No finite-to-infinite inference; floating logs not interval-certified.
Reproduction:
PYTHON
import numpy as np, math
N=2_000_000
p=np.ones(N+1,dtype=bool);p[:2]=False
for i in range(2,math.isqrt(N)+1):
 if p[i]: p[i*i::i]=False
lam=np.zeros(N+1)
for q in np.flatnonzero(p):
 j=int(q)
 while j<=N:
  lam[j]=math.log(int(q));j*=int(q)
n=np.arange(N+1,dtype=float)
L=np.cumsum(lam); W=np.cumsum(lam/np.maximum(n,1)); gamma=0.5772156649015329
def G(x):
 i=np.floor(x).astype(int)
 return x*W[i]-L[i]-x*np.log(x)+(1+gamma)*x
def ent(c,h):
 r=h/c
 return c*sum(r**(2*j)/((2*j-1)*(2*j)*(2*j+1)) for j in range(1,30))
M={}; max_res=0.; min_slack=float('inf'); neg=0
for k in range(1,38):
 c=k**4;h=k**3/4
 if c+h>N: break
 lo=c-h;hi=c+h
 i=np.arange(math.floor(lo)+1,math.floor(hi)+1)
 correction=np.sum(lam[i]*np.maximum(h-np.abs(i-c),0)**2/(4*h*i))
 d=ent(c,h)
 m=float(G(np.array(c)))+correction-d
 j=np.arange(1,math.floor(hi)+1)
 direct=np.sum(lam[j]*(np.maximum(hi-j,0)**2-np.maximum(lo-j,0)**2)/(4*h*j))
 direct-=c*math.log(c)+d;direct+=(1+gamma)*c
 err=abs(m-direct); max_res=max(max_res,err)
 assert err<2e-7*max(1,c/1e5),(k,err)
 bound=h*h/(6*(c-h))
 assert float(G(np.array(c)))<=m+bound+1e-8
 min_slack=min(min_slack,m+bound-float(G(np.array(c))))
 M[k]=m
 if m<0:neg+=1
checks=0;max_excess=-float('inf')
for k in range(1,max(M)):
 a=k**4;b=(k+1)**4
 t=np.linspace(0,1,513);x=(1-t)*a+t*b
 E=(1-t)*M[k]+t*M[k+1]+(1-t)*math.sqrt(a)/72+t*math.sqrt(b)/72+t*(1-t)*(b-a)**2/(2*a)
 g=G(x)
 ex=float(np.max(g-E));max_excess=max(max_excess,ex)
 assert ex<1e-7,(k,ex)
 checks+=len(t)
ratios=[]
for k in M:
 c=k**4;h=k**3/4
 x=c-h+(np.arange(1024)+.5)*(2*h/1024)
 avg_pos=float(np.maximum(G(x),0).mean())
 if avg_pos>0:ratios.append((max(M[k],0)/avg_pos,k))
print(p.sum(),np.count_nonzero(lam),len(M),neg,max_res,min_slack,checks,max_excess,min(ratios))
END PYTHON

Native Lean/Lake absent on PATH. Baseline strip-root run 45577239749
status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and prune run
45576756833 status 7da354941e402b6f8b364ed03d8c5c82d27b7717 reread:
pass only for previous declarations. Latest orchestrator 45724408129
is unrelated to this certificate. No native PASS for RUN44.
Below is a scalar cancellation and actual lemmaL adapter; the finite
hinge integral and piecewise budget are human proved above but not
formalized here. Their assumptions are explicit, not axioms.

RESUME HERE: attack the arithmetic budget B itself only if useful to
the same-host producer; do not derive more grid-equivalent criteria.
Integration and audit should check whether the signed averaged
budget is materially cheaper for native inputs; if not, retain the
earlier canonical G equation. Native replay and exact cell integral
formalization remain requested; no proof obligation globally retired.
HANDOFF TO integration, landau, kernel-extractor and formal audit.
-/

open MeasureTheory Set
noncomputable section
namespace RHPrimeWindow44

theorem mean_to_point (G M T D E : ℝ)
    (hM : M = G + T - D) (hT : 0 ≤ T) (hD : D ≤ E) :
    G ≤ M + E := by
  linarith

theorem cell_bound (Gx Ga Gb Ma Mb t eA eB eC E : ℝ)
    (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hG : Gx ≤ (1-t)*Ga+t*Gb+eC)
    (ha : Ga ≤ Ma+eA) (hb : Gb ≤ Mb+eB)
    (he : (1-t)*eA+t*eB+eC ≤ E) :
    Gx ≤ max Ma 0+max Mb 0+E := by
  have ht0 : 0 ≤ 1-t := sub_nonneg.mpr ht1
  have h1 := mul_le_mul_of_nonneg_left ha ht0
  have h2 := mul_le_mul_of_nonneg_left hb ht
  have h3 := mul_le_mul_of_nonneg_left (le_max_left Ma 0) ht0
  have h4 := mul_le_mul_of_nonneg_left (le_max_left Mb 0) ht
  have h5 := mul_le_mul_of_nonneg_right (show 1-t ≤ 1 by linarith) (le_max_right Ma 0)
  have h6 := mul_le_mul_of_nonneg_right ht1 (le_max_right Mb 0)
  nlinarith only [hG,h1,h2,h3,h4,h5,h6,he]

-- The native measure premise is NOT claimed discharged by the scalar lemma.
-- R is the explicit piecewise majorant from the human derivation.
def CellBudget (θ δ : ℝ) : Prop :=
  ∀ η : ℝ, 0 < η → ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧ ∃ R : ℝ → ℝ,
    IntegrableOn (fun y => R y * y ^ (-θ - 1)) (Icc Y (Y ^ (1+δ))) ∧
    (∀ y ∈ Icc Y (Y ^ (1+δ)),
      ∃ a b Ma Mb t eA eB eC E : ℝ,
      0 ≤ t ∧ t ≤ 1 ∧ 0 ≤ E ∧
      Deduction.G y ≤ (1-t)*Deduction.G a+t*Deduction.G b+eC ∧
      Deduction.G a ≤ Ma+eA ∧ Deduction.G b ≤ Mb+eB ∧
      (1-t)*eA+t*eB+eC ≤ E ∧ R y = max Ma 0+max Mb 0+E) ∧
    ∫ y in Icc Y (Y ^ (1+δ)), R y * y ^ (-θ - 1) ≤ Y ^ η

theorem window_of_cells (F : Deduction.CharFamily)
    (hF : ∀ x, Deduction.Gm F x = Deduction.G x) {θ δ : ℝ}
    (h : CellBudget θ δ) : Deduction.WindowHyp F θ δ := by
  intro η hη Y₀
  obtain ⟨Y,hY,R,hi,hcells,hint⟩ := h η hη Y₀
  refine ⟨Y,hY,R,hi,?_,hint⟩
  intro y hy
  obtain ⟨a,b,Ma,Mb,t,eA,eB,eC,E,ht,ht1,hE,hG,ha,hb,he,hR⟩ := hcells y hy
  rw [hR,hF]
  exact ⟨add_nonneg (add_nonneg (le_max_right Ma 0) (le_max_right Mb 0)) hE,
    cell_bound _ _ _ _ _ _ _ _ _ _ ht ht1 hG ha hb he⟩

theorem zeroFree_of_cells (F : Deduction.CharFamily)
    (hF : ∀ x, Deduction.Gm F x = Deduction.G x) {θ δ : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)
    (h : CellBudget θ δ) : Deduction.ZeroFree F θ := by
  first
  | (rh_reduce 2 using [Deduction.lemmaL, window_of_cells]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact Deduction.lemmaL F hθ hθ1 hδ (window_of_cells F hF h)

end RHPrimeWindow44

rh_prune RHPrimeWindow44.mean_to_point
rh_prune RHPrimeWindow44.cell_bound
rh_scan Deduction.zeroFree_of_rpow_window limit 2000
rh_scan Deduction.lemmaL limit 2000
rh_scan RHPrimeWindow44.zeroFree_of_cells limit 2000
#print axioms RHPrimeWindow44.mean_to_point
#print axioms RHPrimeWindow44.cell_bound
#print axioms RHPrimeWindow44.zeroFree_of_cells
