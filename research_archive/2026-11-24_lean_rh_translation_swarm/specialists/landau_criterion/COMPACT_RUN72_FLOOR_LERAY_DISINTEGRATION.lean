import New.Filling.StandardLevel
import Mathlib.Tactic

/-!
# RUN72 — exact Leray disintegration and tail-coordinate measure at actual B caller
27 Nov 2026. Human source-matched proof, not new kernel verification.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, including
completion-first sprint and mandatory reduction engine; AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION, manuscript 29820c25acc91450aa8ec712774b57b3d0051c41
and RUN71 6526a8e7 consulted. Peer 2057d58e and 392d881d retrieved; do
not repeat shell-to-band or Ribet work.

Actual dependency: B -> Moments -> FiniteSystem.sum_blocks_le_topKernel ->
siegel_sum_le_lintegral_quadric -> HyperbolicBasis.eventually_mass_near_quadric_le
-> HyperbolicBasis.isDisintegration_floorVolume -> Place.isDisintegration_quadricMeasure.
This discharges the specific Haar/disintegration interface retained in RUN71 §4
using native Place axioms, not a citation to the final RH theorem.

## 1. Flat-chart identity and exact measure cancellation
Lib/General/Measure/Place.lean blob 300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975,
lines 18–34, 118–134, 147–172, 210–242. Keep the native locally compact
Polish commutative ring A, involution, trace-one tau with tau+bar tau=1,
skew unit delta and skew Haar nu. Write q(w)=w* T w with T Hermitian.
The first hyperbolic pair has form bar x t+bar t x, and flat chart
  x=bar(t)^(-1) tau (delta^(-1)b-q(w))+t a,   a,b skew, t a unit.
Direct substitution gives bar x t+bar t x+q(w)=delta^(-1)b.
No division by 2. The nonunit t set is volume-null by Place.ae_isUnit.

The fixed linear splitting (b',a) -> tau delta^(-1)b'+a carries
nu x nu to additive volume by the actual Place.measurePreserving_split.
For fixed t,w put u=(t bar t)^(-1), self-adjoint unit, and
b'=u (b-delta q(w)). Then x=t(tau delta^(-1)b'+a).
By the exact skew-Haar modulus, multiplication by u pushes nu to
md(u)^(-1/2) nu=md(t) nu. Multiplication by t pushes additive volume
to md(t)^(-1) volume. Thus the chart change b,a -> x pushes nu x nu
to volume EXACTLY:
  md(t)^(-1) md((t bar t)^(-1))^(-1/2)=1.
The q(w) translation has no Haar cost.

For completeness the skew-Haar modulus follows from the same splitting:
multiplication by a self-adjoint unit v acts on both skew coordinates
by v. If its skew pushforward factor is c (positive finite, uniqueness
of additive Haar), the two-coordinate pushforward is c² times volume.
The additive pushforward factor is md(v)^(-1), hence c=md(v)^(-1/2).
The native formula uses skewPart(tau v b), which equals v b. This also
covers dyadic places without 2 invertible in the integral lattice.

Tonelli on the nonnegative measurable test F, followed by the fixed t,w
change just proved, yields
  int F(h(z,z),z) dz
    = int_b int_{t,w,a} F(delta^(-1)b, flatChart(T,b;t,w,a)) da dw dt dnu(b).
This is the actual lintegral_eq field, not just an a.e. conditional density.

## 2. Weak continuity and finite mass for every fiber
Fix f:A^(2+dim T)->R_nonneg continuous compactly supported, K its closed
compact support, M=sup f finite. Let Kx,Kt,Kw be its compact projections.
For fixed t a unit,w and b skew, define
  S_b={a skew : flatChart(T,b;t,w,a) belongs to K}.
This is compact: for the displayed x coordinate,
  a=skewPart(bar tau * t^(-1) x).
Indeed the b-q(w) term after multiplication by bar tau is self-adjoint,
and skewPart(bar tau a)=a. Thus S_b lies in ONE compact set (the image
of Kx under this projection) for all b, for fixed t. It is closed there.
The chart is continuous in b,a with fixed t,w. Integration of f over a
is continuous in b by bounded convergence on that common compact set.

Need an integrable majorant as t approaches nonunits; pointwise continuity
alone does not suffice. If S_b is nonempty fix a0 in S_b, and x0 its chart
coordinate. For all a,a' in S_b, x-x0=t(a-a0), x'-x0=t(a'-a0).
The map
  (a,a') -> t(tau delta^(-1)(a-a0)+(a'-a0))
has image contained in the fixed compact set
  C=tau delta^(-1)(Kx-Kx)+(Kx-Kx).
By split measure-preservation, translations and additive modulus, its
image has volume md(t) nu(S_b)^2. Hence
  nu(S_b) <= sqrt(volume(C)) / sqrt(md(t)).
If S_b empty the inequality holds directly. No dependence on b or w.
The chart fiber integral is therefore bounded by
  M sqrt(volume(C)) |g(t)| 1_Kt(t) 1_Kw(w),
where g is the native locally integrable function with
md(t)^(-1)<=|g(t)|² for units. This is integrable on product Haar:
g is integrable on compact Kt, and Kw has finite mass. Ignore the fixed
null nonunit t set, which is independent of b. Dominated convergence
proves weak continuity in b and the same bound gives finite mass on
every compactly supported test, at EVERY b, including b=0.
The two native fields of IsDisintegration have now been supplied in
the actual Place context. Positivity of f is used for Tonelli, not
assumed for any Fourier coefficient.

## 3. Transport to the actual hyperbolic floor
Lib/DiscreteSeries/Bruhat/BigCell.lean blob da06dcfda1a1401b8ad51f94649da9b760907a87,
HyperbolicBasis.measurePreserving_mulVec, map_floorBasis_volume (near 340),
floorQuadric and isDisintegration_floorVolume (423–433).
Retain actual F.gram_eq, F.card_eq, F.md_det (md det original middle Gram=1).
For the square middle basis E its Gram identity gives
  md(det E)^2 md(det original middle Gram)=md(det hyperbolic Gram)=1.
Since det E is a unit, md(det E)=1. Here md(star z)=md(z); the
hyperbolic Gram is an invertible permutation Gram with determinant ±1.
Thus E preserves volume by the native matrix modulus. Enlarging by
identity on the remaining hyperbolic coordinates and reordering/inclusion
gives map_floorBasis_volume exactly, by product Haar.

For floor inclusion M=F.floorBasis b, M* J M equals the actual chart
Gram (gram_floorBasis), and the left inverse is that given by the
nondegenerate Gram identity, L=(M*JM)^(-1) M*J. Thus the linear inclusion
has closed image (fixed points of ML) and is a homeomorphism onto it.
Compact support pulls back to compact support along this closed embedding.
Transport §1 and §2 by M, noting q_J(Mz)=q_chart(z). This proves
isDisintegration_floorVolume with the native floorVolume and floorQuadric,
not an independently chosen normalization.

## 4. Tail-coordinate determinant and actual strict slab caller
New/Filling/EichlerFlag.lean blob 3da2606a049a092719b779802cb8ead3af7141ce,
middleBaseChange, besselLatticeBasis, gram_besselLatticeBasis.
New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4,
form_tailVector and eventually_mass_near_quadric_le (37–61).
For N=pi bar pi, the exceptional two-by-two block of the linear map
(y,tau0) -> tailVector(pi,tau0,y), from y_k0,tau0 to middle lattice
coordinates v,z, is
  [[bar pi, 0],[-pi^(-1),-N^(-1)]].
All other y coordinates unchanged. Its determinant is -bar pi/N=-pi^(-1).
The full determinant differs at most by a permutation sign, so its
modulus is md(pi)^(-1). Consequently the pushforward of dy dtau0 is
md(pi) times floorVolume(top), not its inverse. Direct use of the
source Gram (orthonormal y block and z norm -N, cross zero in standard
coordinates) yields q(tailVector)=q(y)-tau0 bar(tau0)/N; its lattice
z pairing is tau0, as in form_tailVector.

Let b0=delta(-N) and I(b)=int f d floorQuadric(top,b), for the nonnegative
compact continuous test of the native theorem. I is finite continuous
by §3. If I(b0)<c, some neighborhood U of b0 satisfies I(b)<c
throughout. Choose V neighborhood of 0 with b0+delta V intersect
the skew subspace contained in U. For EVERY measurable S subset V,
apply §3 to the indicator q(z)+N in S times f(z):
  int_{q(y)-tau0 bar(tau0)/N+N in S} f(tailVector) dy dtau0
  = md(pi) int_{b:delta^(-1)b+N in S} I(b) dnu(b)
  <= md(pi) c nu({Gamma:delta^(-1)Gamma in S}).
The last equality of domain measures is translation by b0. This is
the actual eventually_smallSets statement, including the strict c
guard. If S includes non-self-adjoint points, only its self-adjoint
part contributes automatically; no need to replace S by a ball.
At FiniteSystem.siegel_sum_le_lintegral_quadric, take the same
Phi=Psi times the clopen distinguished-coordinate indicator from
RUN71 §4, continuous compactly supported. Its strict c guard and the
one-integer neighborhood choice are unchanged. This fills that exact
previously retained local Haar/disintegration supplier without a new
error factor. General Siegel–Weil and mixed-model/quotient supplies
remain distinct; no claim B is complete.

## Evidence and dependency ledger
Original local graph: eventually_mass_near_quadric_le -> {form_tailVector,
map_mulVec_volume, isDisintegration_floorVolume} -> {gram_floorBasis,
map_floorBasis_volume, isDisintegration_quadricMeasure, IsDisintegration.map}
-> {map_skewMeasure_mul_unit, measurePreserving_split, ae_isUnit,
exists_locallyIntegrable_bound}. Reduced human route: exact block determinant
and same-Haar split cancellation, one compact dominating fiber bound,
closed floor inclusion, strict-neighborhood integral. Retain all Place
axioms/realizations, F data and matrix identities, all unresolved
root branches and original/reduced native graphs. Context key: compact
pin + actual Place, F, pi, N, same top, chart, Haar, f. No global native
dependency deletion. Independent audit pending.
Actual local command -v lean/lake/elan printed no paths. SymPy check
executed: p,q nonzero symbols, determinant([[q,0],[-1/p,-1/(p*q)]])
=-1/p, assertion succeeded. This is only the block identity, not Lean.
Old-pin native engine receipts b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched from state branch:
status pass; no new compact native PASS, no local rh_scan/prune/reduce/
auto/frontier run. Prepared source probes and scalar certificates below.
RESUME HERE: merge this exact slab supplier into RUN71 §4 and independently
audit both changes of measure. Then tackle general convergent Siegel–Weil
at SiegelWeilFormula.lean using the native theta majorants and zero-term
recursion, or exact literature bridge if all its hypotheses are matched.
Noncoherent pair, absolute unfolding and Rallis still OPEN.
HANDOFF TO integration/editor, positivity, literature, audit, kernel runner.
Human reconstruction incomplete.
-/

namespace CompactLandauRun72

theorem tail_det_cancel (p q : ℝ) (hp : p ≠ 0) (hq : q ≠ 0) :
    q * (-(p*q)⁻¹) = -p⁻¹ := by
  field_simp
  <;> ring

theorem haar_factor_cancel (d : ℝ) (hd : d ≠ 0) : d⁻¹ * d = 1 :=
  inv_mul_cancel₀ hd

#print axioms tail_det_cancel
#print axioms haar_factor_cancel
end CompactLandauRun72

#check Place.map_skewMeasure_mul_unit
#check Place.form_flatChart
#check Place.isDisintegration_quadricMeasure
#check Place.IsDisintegration.map
#check HyperbolicBasis.measurePreserving_mulVec
#check HyperbolicBasis.map_floorBasis_volume
#check HyperbolicBasis.isDisintegration_floorVolume
#check form_tailVector
#check HyperbolicBasis.eventually_mass_near_quadric_le
#print axioms Place.isDisintegration_quadricMeasure
#print axioms HyperbolicBasis.isDisintegration_floorVolume
#print axioms HyperbolicBasis.eventually_mass_near_quadric_le
