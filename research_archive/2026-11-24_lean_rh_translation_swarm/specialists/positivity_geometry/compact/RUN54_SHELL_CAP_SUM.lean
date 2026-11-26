import New.RealPlace.ComplexShells

/-!
RUN54 — actual complex shell cap and summation (26 Nov 2026).
HUMAN SOURCE-MATCHED; conditional on named native geometric and
tower/measure suppliers. No native replay or complete B closure.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb read, including
binding primitive focus and unified reduction engine; AGENTS, protocol,
handoff, expansion and peers 2d288dd4, 6d738bf3 read. Peers already
reconstruct gauge inverse moment, cone mass, Fourier and joint law;
RUN53 fc278308 handles Schur/exponent/Gram. Do not repeat.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0.
Checked source blob IDs:
 New/RealPlace/ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53
 New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6
 New/RealPlace/FlatCharts.lean cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4
 New/RealPlace/WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd
 New/RealPlace/LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e
 New/RealPlace/ComplexGauge.lean 86c2d26bfaf34292de7d1e79c1634b020b26c1f3
 New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058

1. Shell support at actual IsCutBessel.formConst_mul_lintegral_le.

Keep the same level, heads p,q for L>=rho, j<=varrho, cut F,
Bessel W supported near j, and all native hW,hE,hp,hq,hs,ht,hf,h.
n=varrho+1, k=s+3n+2, s>10^9 n^3, L>=rho>=2.
Set T_i=t L^(11 n i), t>=1. Let C_i be positionsOfSize for
the complex gauge of size T_(i+1)^(99n). Level g=1: these
are entrywise bounds on x-1; the increasing C_i exhaust the group.
S_0=C_0, S_i=C_i minus C_(i-1) for i>=1, measurable and disjoint.
For i>=1 and x in S_i, some entry of x-1 exceeds T_i^(99n).

At any pair y,yx tested by the support condition of
Gauge.formMajorant_sq_le, the unshifted F pairing is nonzero.
Its cut support gives u,v in the local Bessel unipotent with
uy,v(yx) in the SAME box of norm<=rho. Their norm difference
is <=2rho<=T_i^2. The two shifted points are near j by the
actual condition. Every size-10n element of the L-gauge has
norm <=L^(10n)<=T_i. If EVERY a>=j had a nonzero c in
floorValues a y x with |c^-1|<=T_i, the native
Gauge.hasMatSize_sub_one_of_floorValues for the T_i gauge
would imply x-1 has size 99n, contradiction.
Consequently SOME a>=j has its entire floorValues set
inside the open complex disk |c|<1/T_i (zero included).
Hence its volume is <=pi/T_i^2. The floor a may depend on
y,x. No uniform choice of a is needed. This supplies precisely
c in Gauge.formMajorant_sq_le.

FlatCharts proves the matrix-control lemma using the near-point
head entries for a<j; for a>=j use the chosen c and its close-pair
witness w, scaled by c^-1 and translated by u. Its dual pairing
and difference bounds furnish hasMatSize_one_sub_inv with c=6.
The resulting unipotent difference, together with the box
difference and inverse of the box matrix, bounds x-1 by size 99n.
Keep the head-entry and one_sub_inv estimates as explicit native
suppliers, not independently reconstructed or pruned here.

2. Common floor mass and pointwise coefficient.

Use the rho gauge for mass, NOT expanding T_i.
FlatCharts.hasFibreBound_floorQuadric at size 7 gives
(rho^2)^(99 n (7+6)); WeightPlancherel.floorMassLe_one
multiplies by vol(size 11)^(k-1) <= (rho^2)^(12(k-1)).
Thus V=rho^(2574n+24(k-1))>=1 for every floor.
For i>=1 apply formMajorant_sq_le with sigma=pi/T_i^2 and
volumeExponent=s. Its squared inequality implies
 f(x)^2 <= e_i^2 selfNormProduct(x),
 e_i=(pi rho^24)^k rho^(9999n)/T_i^s,
using s<=k, pi>=1, rho>=1, 2574n<=9999n. No division by
selfNormProduct. For i=0,t=1 take sigma=pi>=1, so no cap
hypothesis is needed. For i=0,t>1 use the native input h
with T_0=t, enlarging its coefficient. Do not apply the
geometric contradiction to the first shell.

3. Sum with the actual normalization.

Let lambda be the native positive finite Haar ratio, I0=card I.
pairingNorm(F,F)*pairingNorm(F,W) <= (epsilon*(lambda I0)^2)^2:
inner-product Cauchy-Schwarz, shared wave invariance,
haarRatio_spec and the two actual quotient L2 bounds.
No division by epsilon. Apply Gauge.lintegral_positions_le
with head gauge L and position gauge of size T_(i+1)^(99n).
floorModulus=1 at g=1, c=pi^2, card iota=k-1,
Lambda=L^2, Lambda'=T_(i+1)^(198n). Thus
 Lambda'^(50000 n^2)=T_(i+1)^(9900000 n^3).
Put A=9900000 n^3. Combine BEFORE estimating:
 T_(i+1)^A/T_i^s = L^(11n A) t^(A-s) L^(-11n i(s-A)).
Since s-A>1, L>=2, the last factor is <=2^-i.
The disjoint shell sum costs <=2. The L exponent, absorbing
rho^(9999n) and this factor 2, is
 108900000 n^4 + 3000000 n^3 + 9999n + 3 <= 10^9 n^4.
Difference after n=1+u has ascending coefficients
 888089998, 3555390001, 5337600000, 3561400000, 891100000.
The c-factor and pi^k together are <=pi^((2varrho+1)k).
formConst cancels (lambda I0)^2 exactly (positive finite).
Remaining constant is the native bandConst =
volU(k)/volU(r)*pi^((2varrho+1)k).
Therefore the actual conclusion is
 |formConst| headDensity integral f dM
 <= bandConst L^(10^9 n^4) rho^(24k) t^(9900000 n^3-s) epsilon.
For W=F,epsilon=1,t=1, strict positive finite formConst and
headDensity (heads are units) give finite majorant integral,
the actual premise of the peer joint-law descent. No infinity
cancellation or new witness is introduced.

4. Scope and reproducibility.

Original retained path: complexGauge + FlatCharts matrix control
+ WeightPlancherel floor mass + LocalTheorem capped pivot and
positions integral + haarRatio_spec -> ComplexShells shell theorem
-> majorant integrability / frequency band -> BandLimits ->
BesselSystem -> Moments -> Data.enough_forms -> star_inequality.
Reduced human path replaces shell assembly and scalar sum by
sections 1-3. No native edge removed; no new axiom evidence.
Retain original/reduced graphs and all predecessor obligations,
especially head-entry/unipotent geometry, capped tower recursion,
weighted selfNorm integral, Haar comparison. Peer candidates
need independent audit. Seven blob ID comparisons succeeded;
the first fetch comparison caught a typo in RUN53's recorded
BesselSystem hash (corrected above). Exact integer polynomial
expansion and four independent direct integer evaluations
executed in JS. Actions jobs 45799225653,45577239749,45576756833
fetched and all completed/success, for prior runs only.
No compatible native Lean environment available to this
connector; rh_prune/scan/reduce/auto/frontier not run here.
Prepared scalar certificate and native interface/axiom audit
below, uncompiled. No new PASS.

RESUME HERE: reconstruct actual RealPlaceSizes.haarRatio_spec
from open-cell Bruhat measure and gramSection comparison, or
the primitive head-entry/one_sub_inv geometry if not already
handled by integration. Parallel B branch:
BlockBound.sum_pairWeight_le (commonLink/restricted frame index
divisibility). Do not repeat sufficient scalar shell sum.
HANDOFF TO integration/editor/audit/shared compact runner.
-/

namespace RHPositivityCompactShell

theorem exponent_budget (n : ℕ) (hn : 1 ≤ n) :
    108900000*n^4 + 3000000*n^3 + 9999*n + 3 ≤ 1000000000*n^4 := by
  have hn2 : n ≤ n^2 := by
    calc
      n = n*1 := by simp
      _ ≤ n*n := Nat.mul_le_mul_left n hn
      _ = n^2 := by ring
  have hn3 : n^2 ≤ n^3 := by
    calc
      n^2 = n^2*1 := by simp
      _ ≤ n^2*n := Nat.mul_le_mul_left (n^2) hn
      _ = n^3 := by ring
  have hn4 : n^3 ≤ n^4 := by
    calc
      n^3 = n^3*1 := by simp
      _ ≤ n^3*n := Nat.mul_le_mul_left (n^3) hn
      _ = n^4 := by ring
  omega

theorem floor_mass_budget (n k : ℕ) :
    2574*n + 24*(k-1) ≤ 9999*n + 24*k := by omega

#print axioms exponent_budget
#print axioms floor_mass_budget
#check Gauge.hasMatSize_sub_one_of_floorValues
#check Gauge.floorMassLe_one
#check Gauge.formMajorant_sq_le
#check Gauge.lintegral_positions_le
#check IsCutBessel.formConst_mul_lintegral_le
#check IsCutBessel.lintegral_formMajorant_ne_top
#print axioms IsCutBessel.formConst_mul_lintegral_le

end RHPositivityCompactShell
