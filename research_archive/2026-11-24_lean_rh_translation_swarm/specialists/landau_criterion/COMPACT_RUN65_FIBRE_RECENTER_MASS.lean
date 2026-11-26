import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
# RUN65 — exact fibre recentering and finite-sieve normalization
26 November 2026. Human source-matched reduction, not kernel replay.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact upstream lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original long pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained.
Mission, protocols and current compact peer work read; resume RUN64
(2d965f907e2dc52820d98e7dea2ed2c3e9d2e1ab).
Peer heads a5929b540, 6822e2d2, 02d32ee8, 3d8ec587, d096310c,
a6dfbea2 and a0efe5da inspected. Rallis absolute unfolding and
finite Fourier sharp mass already treated by dependency RUN58/59
and integration/2026-11-26_COMPACT_RALLIS_CUTOFF_AND_CONVERGENCE.md;
do not duplicate or treat their retained Siegel--Weil assumptions as closed.

## 1. Uniform fibre majorant with no measurable choice
Source New/RealPlace/FlatCharts.lean
cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4, lines 95--136;
Lib/General/Measure/Place.lean 300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975,
flatChart / quadricMeasure; Lib/DiscreteSeries/Bruhat/BigCell.lean
da06dcfda1a1401b8ad51f94649da9b760907a87, measurePreserving_shuffle_coords.
Work on the actual finite-place caller (and the gauge subtraction
axioms of the more general chart lemma). Write B_i for size-i vectors.
Let p=(t,x) be fixed, w the orthonormal coordinates, z=(y,a) the
remaining hyperbolic coordinates and skew coordinate. Denote the
native Hermitian level by c, and write the remaining hyperbolic
form H(x,y)=x* y+y* x, with the native coordinate ordering.
In these coordinates the flat chart is
  k_c(p,w,z)=(d tau (c-H(x,y)-h(w,w))+t a, t, x,w,y),
where d is the native total inverse of star(t).
The fibre measure zeta is product Haar in y and skew a.
The complete chart pushes forward dp dw dzeta to the coordinate
quadric measure rho; floorBasis pushes rho to F.floorQuadric b.
These are the source definitions, with permutation of product
factors preserving measure; no change of variables dividing by t.

Fix p,w. If S={z:k_c(p,w,z) in B_(j+4)} is nonempty, choose
z0=(y0,a0) in S. Exact subtraction in the first chart coordinate:
  k_c(p,w,z)_0-k_c(p,w,z0)_0
      = -d tau H(x,y-y0)+t(a-a0).
All dependence on c and on the potentially large orthonormal
quadratic form has disappeared BEFORE an estimate. In the
zero-level chart k_0 with no orthonormal coordinates, this is
exactly the first coordinate of k_0(p,z-z0). Its fixed t,x
coordinates are bounded by the anchor z0; its y-y0 coordinates
are differences of bounded coordinates. Gauge subtraction and
size monotonicity give k_0(p,z-z0) in B_(j+5). Thus
  S-z0 subset {z:k_0(p,z) in B_(j+5)}.
Translation invariance of zeta proves, including the empty case,
  zeta(S) <= mu(p):=zeta{z:k_0(p,z) in B_(j+5)}.
The choice of z0 is pointwise only, not a measurable section.
The majorant mu is independent of w and measurable by Tonelli
on the chart preimage of B_(j+5). Product regrouping (the empty
orthonormal coordinate has unit Dirac measure) gives integral
mu dp exactly the zero-cone measure of B_(j+5), hence <=M
under the native premise. This supplies every field of HasFibreBound:
chart, pushforward, unchanged p,w, s-finite zeta, measurable mu,
and integral bound. No loss in the bound from the recentering.
Retain the chart and gauge axioms rather than asserting a new
general disintegration theorem. At alpha=1 the actual B_i are
integral lattices, closed under subtraction without a size loss.

## 2. Integrate the majorant, then recenter the floor
Source same FlatCharts, setLIntegral_le_of_hasFibreBound,
setLIntegral_orthonormalPart_le; New/RealPlace/WeightPlancherel.lean
65619443ca5867bf45af038448a16dc1262103fd, floorMassLe_of_chart
and floorMassLe_one. If ambient F.floorBasis*x has size j,
its coordinate vector x has size j+4 by the native Gram-inverse
basis bound. For a nonnegative measurable integrand Phi majorized
on this preimage by G(p,w), integrate over z first:
  integral_z 1_preimage Phi <= mu(p) G(p,w).
Integrating in w gives <=K mu(p) under the native section-wise
integral bound. Finally integrate over p to obtain <=M K.
For the actual consumer Phi is constant one; for the orthonormal
projection consumer the projection equals w because of
gram_floorBasis, so use G(p,w)=1_B_(j+4)(w) phi(w).
This argument needs no measurable choice of z0, nor a claim
that arbitrary section-wise measurable G is jointly measurable.
The constant-one case gives M vol(B_(j+4) scalar)^card(iota).

Now take the actual floor b, j=7, and f=1. If g is not near b,
no sigma in GT b can make sigma*g near b+1, by IsNear.of_floorGroup_mul.
If it is near b, choose xi in Q_b=unitriGroup b with k=xi*g
in the box. Right translate sigma by xi^-1 in the near-(b+1)
indicator, using lintegral_floorMeasure_mul_right; that indicator
is left Q_(b+1)-invariant. No invariance of the unrestricted floor
measure on arbitrary test functions is asserted. If xi' in Q_(b+1)
has xi'*sigma*k in the box, xi' fixes the marked frame vector
in the orbitPoint identity. The native inverse-size estimate gives
orbitPoint b sigma in size 7 (k has matrix size 1).
Push forward the restricted indicator by measurePreserving_orbitPoint;
this bounds floor mass by the quadric mass of B_7, already <=
M vol(size 11)^card(iota). These are the exact source hypotheses.
At the finite integral gauge alpha=1, vol(R)=1 and RUN64's cone
bound M=zeta_R(m) therefore yields the uniform floor mass <=M.
Backward convolution induction (RUN64) and the unit-modulus
unipotent product in StandardLevel give
  groupMeasure(boxSet) <= zeta_R(m)^n <= 1+2^(-n).
Use the original n=Shape.n and rank guard, not a chosen n.
Source LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e;
StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4.

## 3. Exact normalization at the actual finite-sieve caller
Source New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
massRatio_ne_zero_and_ne_top, floorZeroForm_on_congGroup,
enorm_integral_phase_eq_upperPairing, floorZeroForm_le_main_term;
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7,
exists_finite_sieveSystem, especially final norm_bot_le branch.
Write Z for intermediate group K(g)<=Z<=K; v for unipotentMass;
z=groupMeasure Z, k=groupMeasure K(g), r=Z.massRatio=z*k/v^2.
The groups contain a compact open subgroup and lie in K; the
native Haar instance gives 0<z,k<infinity. Each factor in v is
a positive finite modulus power, hence 0<v,r<infinity.
For x in K(g) and y in Z, yxy^-1 belongs to K(g) by normality
in K; phase is one. Thus the contribution of K(g) to floorZeroForm
is exactly z^2*k. In the actual normalization this contribution
is (z^2*k)/(v^2*r)=z, not z^2 or an unnormalized index.
The native remaining shell bound is
  floorZeroForm <= z*k*(z+e),
where e=vol(R minus R^x)^(t+1)*2^(-n), with the stated t/rank guard.
It follows by exact cancellation (all denominators nonzero finite)
  floorZeroForm/(v^2*r) <= z+e <= 1+2^(-n)+e.
The retained identity enorm_integral_phase_eq_upperPairing
supplies the factor v BEFORE squaring, and the FiniteSystem
bottom-form comparison is retained. Do not identify this
normalized auxiliary quantity with the entire finite-sieve
kernel or remove its other frequency/energy estimates.
This derivation checks the specific normalization factors in
the bottom branch; it does not prove the shell bound itself.
No dependence on RH or the conjectured prime lower bound.

## Graph and verification
Original local graph (source-visible, not extracted kernel DAG):
cone -> hasFibreBound_floorQuadric_of_le ->
setLIntegral_orthonormalPart_le -> floorMassLe_one ->
upperMeasure_isNear_le -> groupMeasure_boxSet_le ->
exists_finite_sieveSystem -> downstream energy/prime root.
Retain shell bound, Haar, phase/upper-pairing identity, rank,
massRatio finiteness and all other callers. Reduced human graph:
fixed-coordinate subtraction + translation -> cone majorant ->
two product integrals -> uniform floor mass -> same convolution
bound -> exact bottom normalization. Cache key: compact pin,
same level, gauge, floor, p,w, same intermediate subgroup Z and
principal modulus g; anchor eliminated pointwise only.
No original graph or axiom file changed; no kernel edge removed.
Local command -v lean/lake/elan found no executable. Old-pin
native CI results 45577239749 and 45576756833 re-read, both pass.
Compact replay 45803534769 re-read: 6 named B/C probes with
propext, Classical.choice, Quot.sound, A module build timeout 124,
overall all_requested_checks_ok=false, full_RH_replay=false.
No fresh run of rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier
on compact source; no new native PASS. Source reduction is human,
not a kernel pruning certificate. Three exact symbolic checks
executed locally in SymPy using the expressions in this note:
expand(first_difference - recentered_first)=0,
cancel(z^2*k/(v^2*r)-z)=0,
cancel(z*k*(z+e)/(v^2*r)-(z+e))=0, with r=z*k/v^2.
Output: 3 exact symbolic cancellations verified; no native theorem replay.
The Lean scalar identities below and named probes are prepared
but uncompiled. They do not formalize the full chart argument.

RESUME HERE: hand the closed local fibre bridge to integration
and positivity; inspect the actual shell estimate of
floorZeroForm_le_main_term and its primitive rank/volume
dependencies against peer reductions, then integrate the
result at the finite-sieve caller. Keep Rallis/Siegel--Weil
retained hypotheses and all unresolved A/B/C obligations.
-/

namespace CompactRun65

theorem recenter_first {R : Type*} [CommRing R]
    (d tau t c h h0 w a a0 : R) :
    (d*tau*(c-h-w)+t*a) - (d*tau*(c-h0-w)+t*a0) =
      -d*tau*(h-h0)+t*(a-a0) := by
  ring

theorem principal_mass_cancel (z k v : ℝ) (hz : z ≠ 0)
    (hk : k ≠ 0) (hv : v ≠ 0) :
    (z^2*k)/(v^2*(z*k/v^2)) = z := by
  field_simp <;> ring

theorem shell_mass_cancel (z k v e : ℝ) (hz : z ≠ 0)
    (hk : k ≠ 0) (hv : v ≠ 0) :
    (z*k*(z+e))/(v^2*(z*k/v^2)) = z+e := by
  field_simp <;> ring

#print axioms recenter_first
#print axioms principal_mass_cancel
#print axioms shell_mass_cancel
#check Gauge.hasFibreBound_floorQuadric_of_le
#check Gauge.setLIntegral_le_of_hasFibreBound
#check Gauge.floorMassLe_one
#check IntegralPlace.IsStdLevel.groupMeasure_boxSet_le
#check IntegralPlace.IsStdLevel.massRatio_ne_zero_and_ne_top
#check IntegralPlace.IsStdLevel.floorZeroForm_on_congGroup
#check IntegralPlace.IsStdLevel.floorZeroForm_le_main_term
#check Filling.IsFillingLevel.exists_finite_sieveSystem
#print axioms Gauge.hasFibreBound_floorQuadric_of_le
#print axioms IntegralPlace.IsStdLevel.groupMeasure_boxSet_le
#print axioms Filling.IsFillingLevel.exists_finite_sieveSystem

end CompactRun65
