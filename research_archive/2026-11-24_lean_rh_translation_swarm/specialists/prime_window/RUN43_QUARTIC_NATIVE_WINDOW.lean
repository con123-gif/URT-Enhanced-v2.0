import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ZeroFreeOfRpowWindow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN43 lane 3, 25 Nov 2026. Human source-matched arithmetic reduction /
PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (including engine);
original e0dc8f7f, SWARM, HANDOFF, EXPANSION, AGENTS, state/protocol/
continuity/log openings consulted. Peer 5adee016, a824904c, 619e11df,
efa4abe2, 700e3969, a35ccf3d, 1c2ef505, 2ff2915c inspected. Prior
RUN42 2f96ecf8 retained; its propagation is already owned by integration
and acceleration. Search commits quartic/interpolation/grid window/convex
ramp returned no prior RH quartic-grid result (not proof of novelty).
Peer prime-only shell 4f64844a and math outer-shell transfer 596dc680
already give conditional criteria, not prime cancellation.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream
observed 686902ae1da717a63faf52d2dc6a50e5722942cd; no migration.
Source relative to src/Development/AutomorphicArithmetic/DedekindLFunctions:
CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872
LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002
LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.
Actual declarations Deduction.ramp, G, Gm, WindowHyp, windowHyp_of_rpow,
zeroFree_of_rpow_window and lemmaL reread. Use only RH singleton Gm=G
(as in d131f208 / fedd3a7e), not arbitrary signed-character Gm.

RESULT: unconditional envelope of actual native G between sparse sample
points, using only positivity of genuine Mangoldt weights and exact
cancellation of the affine Euler-constant term. For 1<=a<=x<=b,
x=(1-t)a+tb, 0<=t<=1, define R(x)=sum_{n<=x} Lambda(n)(x/n-1).
Extend all three sums to floor(b), since max(x/n-1,0)=0 for n>x;
n=0 has zero Mangoldt coefficient. Each nonnegative weighted hinge
max(x/n-1,0) is convex; thus R(x)<=(1-t)R(a)+t R(b).
Subtract x log x and cancel the affine term (1+gamma)x exactly.
Since log(u)<=u-1 for u>0,
  E=(1-t)a log(a/x)+tb log(b/x)
    <= (1-t)a(a/x-1)+tb(b/x-1)
     = (x-a)(b-x)/x.
Consequently
  G(x) <= (1-t)G(a)+tG(b)+(x-a)(b-x)/x.
No asymptotic prime theorem used. It is false to simply drop E (negative
control below). For a=k^4, b=(k+1)^4, k>=1, h=b-a<=15 k^3, so
  G(x) <= max(G(k^4),G((k+1)^4)) + (225/4) sqrt(x).
This proves an RH-scale interpolation envelope, not an upper estimate of
the sample values. For 1/2<=theta<1, C>=0, delta>0, suppose for arbitrarily
large Y every k^4 in [Y,Y^(1+delta)] satisfies G(k^4)<=C*(k^4)^theta.
Choose Y' the first fourth power >=Y; Y'<=16Y. For x in
[Y',(Y')^(1+delta/2)], the bracketing consecutive fourth powers are
>=Y' and <=16x<=16*(16Y)^(1+delta/2)<=Y^(1+delta) for sufficiently
large Y (delta fixed). Then both samples obey G<=16*C*x^theta and
the envelope gives G(x)<=(16*C+57)*x^theta. Y' remains unbounded.
Native windowHyp_of_rpow accepts this pointwise upper bound, with
delta/2 and the same theta. Its integral is (16*C+57)*(delta/2)*log Y',
which is <=(Y')^eta for every eta>0 eventually. Thus for every
theta=1/2+eps the sparse premise suffices for RH by singleton
zeroFree_of_rpow_window and the already pinned rh_of_right adapter.
This reduces sampling cardinality on [1,X] from floor X integer
checks to floor(X^(1/4)) grid checks; NOT a computational complexity
claim for evaluating G, NOT an asymptotic bound, and NOT a removal
of a quantitative arithmetic supplier. Unlike a synthetic test,
the envelope holds for the exact native ramp; the finite tests
only check its implementation. It does not interpolate the
discontinuous prime-only outer shell directly.

Original local graph: singleton Gm=G + pointwise power window ->
windowHyp_of_rpow -> lemmaL -> zeroFree_of_rpow_window -> RH adapter.
Candidate: same singleton + fourth-power samples + proved positive
hinge/entropy/cover envelope -> original power-window interface.
No original dependency retirement globally; actual VWin arithmetic,
joint geometric suppliers and the direct outer-shell bound remain
open. Context key pin, toolchain, F with Gm F=G, theta, delta, C and
actual window endpoints. No merging arbitrary signed-character
ramps. Backtrack to original pointwise window if replay fails.

Executed local CPython/NumPy below (exit 0): 78,498 actual primes,
78,734 prime powers (including primes), 30,030 real sample points
over 30 quartic cells, 90,090 floating-point inequality checks.
Max convex residual 0.0; observed max (G-chord)/sqrt(x)
0.14603877124463632; max E/sqrt(x) 1.999163209803074;
negative-control G(3.5)-(G(3)+G(4))/2 = 0.035836765508157065.
These are finite checks, not proof of RH. Reproduce with:
```python
import numpy as np, math
N=1_000_000
prime=np.ones(N+1,dtype=bool);prime[:2]=False
for p in range(2,math.isqrt(N)+1):
 if prime[p]: prime[p*p::p]=False
lam=np.zeros(N+1)
for p0 in np.flatnonzero(prime):
 p=int(p0); j=p
 while j<=N:
  lam[j]=math.log(p);j*=p
A=np.cumsum(lam); W=np.r_[0.,np.cumsum(lam[1:]/np.arange(1,N+1))]
gamma=0.5772156649015328606
def ramp(x):
 n=np.floor(x).astype(int)
 return x*W[n]-A[n]
def G(x):return ramp(x)-x*np.log(x)+(1+gamma)*x
cnt=0; maxres=-float('inf'); maxgain=0.; maxcurv=0.
for k in range(1,31):
 a=float(k**4);b=float((k+1)**4); x=np.linspace(a,b,1001);t=(x-a)/(b-a)
 chord=(1-t)*G(a)+t*G(b)
 entropy=(1-t)*a*math.log(a)+t*b*math.log(b)-x*np.log(x)
 bound=(x-a)*(b-x)/x
 assert np.max(G(x)-chord-entropy)<1e-7
 assert np.max(entropy-bound)<1e-7
 assert np.max(bound-56.25*np.sqrt(x))<1e-7
 maxres=max(maxres,np.max(G(x)-chord-entropy))
 maxgain=max(maxgain,np.max((G(x)-chord)/np.sqrt(x)))
 maxcurv=max(maxcurv,np.max(entropy/np.sqrt(x)));cnt+=len(x)
negative=float(G(3.5)-.5*(G(3.)+G(4.)))
assert negative>0
print(np.count_nonzero(prime),np.count_nonzero(lam),cnt,3*cnt,
      maxres,maxgain,maxcurv,negative)
```

Actual baseline CI status.json read: 45577239749 and 45576756833
returncode 0. Actual analytic overlay run 45652878741 returncode 1
(measurability mismatch and unqualified scans, sorryAx from failed
elaboration); preserved, not evidence against original theorem.
Local lean/lake absent. No new CI run or axiom evidence; below is a
prepared native envelope and caller bridge, with the finite cutoff
convexity and quartic cover as explicit interfaces pending native
formalization (human proofs above). All original/reduced graphs and
unresolved axioms remain. No claimed RH theorem imported.

RESUME HERE: audit and replay the envelope at Deduction.G, then
formalize native finite cutoff extension (same floor(b) for all x)
and quartic cover; use the original caller as fallback. The genuine
remaining mathematical objective is uniform RH-scale cancellation of
the quartic sample values or direct prime-only shell deficit, NOT
more sampling identities. Seek a bound on the signed prime sum
rather than fitting constants. HANDOFF TO integration, Landau,
audit, kernel.
-/

noncomputable section
namespace RHPrimeWindow43

theorem hinge (a b x d t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hx : x = (1-t)*a+t*b) :
    max (x/d-1) 0 ≤ (1-t)*max (a/d-1) 0+t*max (b/d-1) 0 := by
  apply max_le
  · calc
      x/d-1 = (1-t)*(a/d-1)+t*(b/d-1) := by rw [hx]; ring
      _ ≤ _ := add_le_add (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left (le_max_left _ _) ht)
  · positivity

theorem entropy_budget (a b x t : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hx0 : 0 < x) (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hx : x = (1-t)*a+t*b) :
    (1-t)*a*Real.log a+t*b*Real.log b-x*Real.log x ≤ (x-a)*(b-x)/x := by
  have hA : Real.log (a/x) ≤ a/x-1 := Real.log_le_sub_one_of_pos (div_pos ha hx0)
  have hB : Real.log (b/x) ≤ b/x-1 := Real.log_le_sub_one_of_pos (div_pos hb hx0)
  calc
    _ = (1-t)*a*Real.log (a/x)+t*b*Real.log (b/x) := by
      rw [Real.log_div (ne_of_gt ha) (ne_of_gt hx0), Real.log_div (ne_of_gt hb) (ne_of_gt hx0)]
      linear_combination -(Real.log x)*hx
    _ ≤ (1-t)*a*(a/x-1)+t*b*(b/x-1) :=
      add_le_add (mul_le_mul_of_nonneg_left hA (mul_nonneg (sub_nonneg.mpr ht1) ha.le))
        (mul_le_mul_of_nonneg_left hB (mul_nonneg ht hb.le))
    _ = _ := by
      field_simp [ne_of_gt hx0]
      rw [hx]
      <;> ring

def R (x : ℝ) : ℝ := (Deduction.ramp (fun _ => 1) x).re

-- Explicit interface; human proof uses common finite cutoff and hinge.
def RampConvex : Prop :=
  ∀ a b x t : ℝ, 1 ≤ a → a ≤ x → x ≤ b → 0 ≤ t → t ≤ 1 →
    x = (1-t)*a+t*b → R x ≤ (1-t)*R a+t*R b

theorem G_envelope (hR : RampConvex) (a b x t : ℝ) (ha : 1 ≤ a)
    (hax : a ≤ x) (hxb : x ≤ b) (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hx : x = (1-t)*a+t*b) :
    Deduction.G x ≤ (1-t)*Deduction.G a+t*Deduction.G b+(x-a)*(b-x)/x := by
  have h1 := hR a b x t ha hax hxb ht ht1 hx
  have h2 := entropy_budget a b x t (by linarith) (by linarith) (by linarith) ht ht1 hx
  unfold R at h1
  unfold Deduction.G
  linear_combination h1 + h2 + (1+Real.eulerMascheroniConstant)*hx

-- Explicit cover interface from the quartic grid construction. Its
-- sample and curvature budgets are distinct from the desired G(x) bound.
def Cover (theta delta C : ℝ) : Prop :=
  ∀ Y0 : ℝ, ∃ Y : ℝ, Y0 ≤ Y ∧ ∀ x ∈ Set.Icc Y (Y ^ (1+delta)),
    ∃ a b t : ℝ, 1 ≤ a ∧ a ≤ x ∧ x ≤ b ∧ 0 ≤ t ∧ t ≤ 1 ∧
      x = (1-t)*a+t*b ∧
      Deduction.G a ≤ C*x^theta ∧ Deduction.G b ≤ C*x^theta ∧
      (x-a)*(b-x)/x ≤ 57*x^theta

theorem power_window (hR : RampConvex) (F : Deduction.CharFamily)
    (hF : ∀ x, Deduction.Gm F x = Deduction.G x) {theta delta C : ℝ}
    (hC : Cover theta delta C) :
    ∀ Y0 : ℝ, ∃ Y : ℝ, Y0 ≤ Y ∧ ∀ x ∈ Set.Icc Y (Y^(1+delta)),
      Deduction.Gm F x ≤ (C+57)*x^theta := by
  intro Y0
  obtain ⟨Y,hY,h⟩ := hC Y0
  refine ⟨Y,hY,?_⟩
  intro x hx
  obtain ⟨a,b,t,ha,hax,hxb,ht,ht1,hxt,hA,hB,hE⟩ := h x hx
  have hG := G_envelope hR a b x t ha hax hxb ht ht1 hxt
  rw [hF]
  calc
    _ ≤ (1-t)*Deduction.G a+t*Deduction.G b+(x-a)*(b-x)/x := hG
    _ ≤ (1-t)*(C*x^theta)+t*(C*x^theta)+57*x^theta :=
      add_le_add (add_le_add (mul_le_mul_of_nonneg_left hA (sub_nonneg.mpr ht1))
        (mul_le_mul_of_nonneg_left hB ht)) hE
    _ = _ := by ring

theorem zeroFree_of_cover (hR : RampConvex) (F : Deduction.CharFamily)
    (hF : ∀ x, Deduction.Gm F x = Deduction.G x) {theta delta C : ℝ}
    (hθ : 0 < theta) (hθ1 : theta < 1) (hδ : 0 < delta)
    (hC : Cover theta delta C) : Deduction.ZeroFree F theta := by
  first
  | (rh_reduce 2 using [Deduction.zeroFree_of_rpow_window, power_window]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact Deduction.zeroFree_of_rpow_window F hθ hθ1 hδ (power_window hR F hF hC)

end RHPrimeWindow43

rh_prune RHPrimeWindow43.G_envelope
rh_prune RHPrimeWindow43.zeroFree_of_cover
rh_scan Deduction.zeroFree_of_rpow_window limit 2000
rh_scan RHPrimeWindow43.zeroFree_of_cover limit 2000
#print axioms RHPrimeWindow43.hinge
#print axioms RHPrimeWindow43.entropy_budget
#print axioms RHPrimeWindow43.zeroFree_of_cover
