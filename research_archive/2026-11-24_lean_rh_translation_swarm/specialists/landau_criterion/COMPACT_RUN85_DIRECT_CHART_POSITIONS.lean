import New.RealPlace.LocalTheorem
import New.Filling.StandardLevel
import Mathlib.Tactic
import Lean

/-!
# RUN85 — fused direct chart -> selfNorm -> positions
27 November 2026. PREPARED, NOT native checked. RH OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 600487957c8cff9ab77705c1441d0ef4559138ce.
Source RUN82 825fdbd3a430c06a1253bc29d98ffdaf5e49af2d, RUN84 15c9bd2315f463a2855df20a70ded1ea65d3e5a9; original LocalTheorem 671350f97491467f09b80eafa0df13685dd8ddc6.
Read current common pipeline and protocols, latest B3 peer commits
73e689b8, 02798532, dbcfaee8 and accepted B2/C2 local graph audit.
No overlap with empty fixing-set or coarse energy target work.

## New step, not another conditional scalar bound
RUN84 exposed the floor bound as an argument of selfNorm. RUN82
constructs that bound using only the direct-volume half of com, retaining
the full original Gauge structure. Compose those two existing proofs,
then transport the actual positions theorem (LocalTheorem.lean 325–343),
whose source uses selfNorm twice, at j=0 for W,W and j for W,W'.
Use the SAME Γ' for BOTH calls, and the same position set and Haar measure.
The complete original hypotheses (cut/Bessel, head, j bound, Haar, hΘ,
hS, pointwise h) and complete conclusion are unchanged. No change of
the two gauges, no division by their constants, no strengthening of
measurability, and no change to the nonnegative extended integral argument.

Exact dependency substitutions, checked by the prepared Lean command:
  old floor -> RUN82 directChart_bridge
  RUN84 original-output bridge (from_floor + old floor)
    -> selfNorm_via_directChart (from_floor + directChart_bridge)
  original positions (two uses of old selfNorm)
    -> positions_via_directChart (two uses of selfNorm_via_directChart).
Parseval remains in from_floor. The inverse-volume com half remains
in other consumers (and possibly elsewhere transitively); do not claim
global deletion. All original proof declarations and graphs are retained.
This avoids re-elaborating the entire positions tactic script or
repeating the analytic inequality. Complete type and universe checks
precede each substitution; the kernel checks the transported value with
ordinary addDecl. Source-level occurrence guards: 1 old floor in original
selfNorm, 2 old selfNorm in original positions, 1 Parseval in selfNorm.
The source guards actually executed via connector against exact blob.
Do not confuse direct edges with the constructor-inclusive graph.

## Replay contract / verification
Local lean/lake/elan unavailable; no new Lean execution, rh_scan,
rh_prune, rh_reduce/rh_auto/rh_auto_frontier, native graph or axiom PASS.
This file contains the unchanged RUN82 and RUN84 bodies in scoped sections
and the new exact-statement transport. Both old-pin CI passes and B2/C2
local audits remain separate; no compact B3 CI receipt was obtained.
Build +New.RealPlace.LocalTheorem:olean and +New.Filling.StandardLevel:olean
in the existing shared pinned workspace, then run lake env lean -o
RHRun85.olean COMPACT_RUN85_DIRECT_CHART_POSITIONS.lean. Preserve full
compiler output and checked object, verify the named axiom reports.
Export constructor-inclusive graphs of original/new floor, selfNorm and
positions (six roots) with the existing accepted graph exporter and
independent verify_graph_v2.mjs. Confirm replacement edges, original
types, axiom closure, retained Parseval and any remaining transitive old
supplier references; record such paths rather than silently dropping them.
Apply native scan/prune and contextual reduction to the actual positions
and selfNorm declarations once the shared workspace exists. The candidate
only substitutes equal types, not a claim of premise minimality.
No Main import, no URT claim, no new workflow or duplicate bootstrap.

RESUME HERE: integration/shared runner replay this exact fused module in
the existing pinned B3 workspace and run the six-root graph verification;
if any type/proof check fails, preserve output and repair only that stage.
Remaining concrete chart majorant and quantitative B3 suppliers, A/C/star,
human audit and full RH remain OPEN.
HANDOFF TO: integration/editor/audit/shared runner, B3.
-/

section RHRun82Scope
/-!
# RUN82 — B3 direct floor-weight chart at the actual selfNorm consumer
27 November 2026. HUMAN SOURCE-MATCHED, native replacement PREPARED, not compiled.
RH OPEN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
live spine 87e949a9ea899dd09d297aa30f59df4d1b533fc4,
ledger 261b9e8bf027af37e6abe6920deb544b23352d48. RUN81 bc9da6150969097860dcc508527dd1d098d63b53.
Read current mission, spine, ledger, AGENTS, continuity, swarm/handoff/expansion
and recent commits including joint B2/C2 audit 8ca5ebf9 and B4 4cc35bab.
B2/C2 native receipts are local; do not reopen E1 or duplicate the B4 work.

## Exact source and mathematical argument

WeightPlancherel.lean blob 65619443ca5867bf45af038448a16dc1262103fd,
62–90, Gauge.lintegral_floorWeight_le, actual caller LocalTheorem.lean
671350f97491467f09b80eafa0df13685dd8ddc6, 117–176, lintegral_selfNorm_le.
LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e,
75–85 (floorValues/weight), 280–310 (Gauge, com, positionsOfSize).
FlatCharts.lean cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4,
54–82 (invariance/recurrence), 140–184 (volume fibre and Heisenberg bounds),
188–193 (size 14 relative displacement). BigCell.lean
da06dcfda1a1401b8ad51f94649da9b760907a87, 174–180, 447–463
(decomposition, commutation, convolution, invariance and a.e. support).

Fix same F, Gamma, g,y,j<=rho, n=rho+1, level unit G=F.g,
S=Gamma.positionsOfSize, weight P_j(g,x), exponent s=F.volumeExponent,
eta_<j=ascConv heisenbergMeasure j. Define
 I_j(g,y)=integral 1_S(g^-1 nu y) P_j(g,g^-1 nu y) d eta_<j(nu).
No finite-measure or division hypothesis is imposed on eta_<j.
The source's floorWeight_mul_left makes P_j invariant under changing
the first point by Q_j. If g is near at j, write xi*g=g0 in box,
xi=gamma*n0 with gamma in GT j, n0 in N_<j. Left invariance of eta_<j
under n0 and commutation with gamma transport I_j(g,y) exactly to
I_j(g0,gamma*y). Thus prove at ONE box point g0; j=0 gives I_0<=1.

For the induction step j=a+1, if I_(a+1)>prod K_l, it is nonzero.
The a.e. N_<(a+1) support and a nonzero integrand supply tau with
x0=g0^-1 tau*y in S. Translate y by tau using the invariant measure.
Now y0=g0*x0. In particular x0 is in S, not merely in F.positions.
Choose ONE chart majorant phi at (g0,x0, zero matrix) for the step;
it is independent of the variable Heisenberg element h and lower nu.
Let O=F.orthonormalPart. The chart's W is the set of w for which
(g0^-1 O w, y0^-1 O w) is a close pair (zero-matrix constraint vacuous).
Use only the DIRECT-volume half of Gauge.com and its integral bound.

Disintegrate eta_<(a+1) into lower eta_<a and eta_a via the exact
convolution identity/commutation; inner point x=g0^-1 nu*h*y0.
For any h with nonzero inner integral choose a supported nu in N_<a.
The relative displacement of the two supported positions is EXACTLY
 (g0*x0)(g0*x)^-1 = h^-1 nu^-1
                    = (h^-1 nu^-1 h) h^-1.
The conjugated factor lies in N_<a. FlatCharts.conj_mul_inv_close_to_one
therefore gives the column of (h^-1 nu^-1-1)/G size 14, which is precisely
the hypothesis of lintegral_heisenbergMeasure_le with unit G.
This support argument uses an actual nonzero integrand, not a guessed
support radius or a probability normalization.

For each lower nu in N_<a with x in S, take c in floorValues a g0 x,
represented by z with z(eStar a)=c and z(eStar b)=0 for b<a.
For any w in W the pairs
 z1=g0^-1 z, z2=(nu*h*y0)^-1 z,
 w1=g0^-1 O w, w2=y0^-1 O w
belong to F.closePairs. With h=heisenbergElem(a,t), v its vector part,
u=O^* T.splitGram (v/G), the native heisenbergElem_inv,
unipotentBelow_mulVec_apply and form_mulVec_mulVec give
  G^-1 (herm(z1,w1)-herm(z2,w2)) = star(c*u) dot w.
Indeed the difference is G^-1 herm(z-h^-1 nu^-1 z,O w);
the orthonormal projection of z-h^-1 nu^-1 z is c times the
projection of v: the earlier dual coordinates are zero, nu^-1
does not affect the later projection, and h^-1 subtracts c*v.
Here herm is conjugate-linear in its first entry and G is hermitian.
This is exactly the set inclusion in the source's final rintro/exists/
simp/ring block; no inequality before the identity.
Thus vol(floorValues a g0 x)<=phi(u). By the exact recurrence
 P_(a+1)=P_a*vol(floorValues)^s,
and positivity, the inner integral at h is at most
 phi(u)^s I_a(g0,h*y0) <= phi(u)^s prod_{l<a} K_l.
No subtraction of infinite integrals is used.

The same chart and same v enter the quantitative Heisenberg bound.
At size J=14, setLIntegral_orthonormalPart_le and
hasFibreBound_floorVolume give
 integral_{size J} phi(O^*H v)^s d floorVolume
 <= Lambda^(99 n (J+6)) Lambda^(99 n (J+5)).
The first exponent is the fibre mass; the second is com at size J+4.
lintegral_heisenbergMeasure_le multiplies by fl_a(G) and Lambda^(J+2).
Consequently the local step costs at most
 fl_a(G) Lambda^(16+3861 n) <= fl_a(G) Lambda^(4600 n)
 <= K_a=fl_a(G) c_place^|iota| Lambda^(4600 n).
The place Plancherel constant is not needed by this direct-weight chart;
keep it in K_a because the separate Fourier step in selfNorm needs it.
n>=1, Lambda>=2 and c_place>=1 give the comparisons, including s=0.
This also resolves the I_(a+1)=infinity branch: the finite product
bound contradicts the hypothesized strict inequality. If no supported
point exists, the nonnegative integral is zero. The source's proof
works in ENNReal, and all nonzero selections are under the a.e.
support laws, not unrestricted pointwise support.

## Replacement and audit scope

The actual source uses exactly one call of Gamma.com at v=0,
with x0 in positionsOfSize, and only (k u).2, never (k u).1.
Below isolates that sufficient chart interface, retaining full
F/Gamma and every native measurable, compact, measure and group
hypothesis. It is an original-output replacement plus a bridge from
the existing Gamma.com, not a claim that the global Gauge structure
or inverse-volume supplier can be deleted. The inverse half is
still used by floorMassLe_floorWeight_div and lintegral_mul_invWeight_le.

Original visible graph: selfNorm_le -> floorWeight_le ->
{floorWeight_mul_left, exists_floorGroup_mul_unipotentBelow,
ascConv invariance/support, Gamma.com, lintegral_heisenbergMeasure_le,
setLIntegral_orthonormalPart_le, hasFibreBound_floorVolume,
conj_mul_inv_close_to_one, floorWeight_succ, measure_mono}.
Replacement changes only the local com call to DirectFloorChart;
bridge restores exact original output. Original and reduced native
graphs and all root obligations remain untouched; no global
dependency removal or full RH replay claimed. Cache on pin,
F,Gamma,box point g0, centred x0, zero matrix, step a and exact measures;
do not cache phi across different support centres or gauges.
Rejected: applying one chart without the nonzero-support centring,
using the inverse-volume half in place of direct volume, replacing
the entire group measure by a finite probability measure, dropping
the inverse-volume half globally, or charging the c factor twice.

Verification this run: exact source blob guard and three one-occurrence
source transformations executed. No Lean/lake or elan toolchain in
local sandbox, so no rh_scan/prune/reduce/auto/frontier execution;
no new B3 kernel check or axiom pass. Both old-pin CI status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 re-read: pass only for
45577239749 and 45576756833, not compact B3. Joint local B2/C2
audit 8a1f052516c330d9389b4ffc4c6671a4be77b854 and B2 receipt
f8a7b2138e2e9fe1782b172a5fb943ab6637326e re-read; they now record
successful constructor-inclusive graph audits on those local chains.
No protected workflow edits, no duplicate shared runner, no URT claim.
The remaining direct-volume majorant existence at the actual concrete
gauge, rather than the conditional Gauge interface, is still a primitive
obligation; other B3 and A/C/star obligations preserved.

RESUME HERE: trace the actual concrete real/finite Gauge.com supplier
used by the TopFloor/GlobalSieve consumer, isolate its direct-volume
majorant at the zero-matrix support centre, and discharge/audit its
integral bound. Do not rederive the conditional floor-weight induction.
HANDOFF TO integration/editor/positivity/audit/shared runner:
replay directChart replacement + original-output bridge and then
retarget the actual selfNorm consumer with constructor-inclusive guards.
-/

open ENNReal FI Fintype Level Matrix MeasureTheory Place ProbabilityTheory Set Size U
attribute [local simp] AddChar.map_add_eq_mul IsHermUnit.conjTranspose_eq mulVec_neg
  indicator_apply_le' ascConv heisenbergElem_mulVec mul_add mul_assoc star_mulVec_dotProduct

variable {A ι} [CommRing A] [StarRing A] [TopologicalSpace A] [MeasureSpace A] [P : Place A]
  {𝔰 : Shape} [Fintype ι] {m j} {T : 𝔰.Form A} [IsHermUnit T.splitGram] {F : Level ι T m} (Γ :
  Gauge F)

def Gauge.DirectFloorChart : Prop :=
  ∀ x ∈ F.boxSet, ∀ y ∈ Γ.positionsOfSize,
    let W := {w | (0 : Matrix (Fin 𝔰.ϱ) ι A) *ᵥ w = 0 ∧
      (x⁻¹.1.1 *ᵥ F.orthonormalPart *ᵥ w,
        (x * y)⁻¹.1.1 *ᵥ F.orthonormalPart *ᵥ w) ∈ F.closePairs}
    ∃ φ, Measurable φ ∧
      (∀ u, volume {c : A | ∀ w ∈ W, ∃ z ∈ F.closePairs, ∃ z' ∈ F.closePairs,
        star (c • u) ⬝ᵥ w =
          F.g⁻¹ * (star z.1 ⬝ᵥ T.splitGram *ᵥ z'.1 -
            star z.2 ⬝ᵥ T.splitGram *ᵥ z'.2)} ≤ φ u) ∧
      ∀ j, ∫⁻ u in Γ.vecsOfSize j, φ u ^ F.volumeExponent ≤ Γ.Λ ^ (99 * 𝔰.n * (j + 1))

lemma Gauge.directFloorChart_of_com : Γ.DirectFloorChart := by
  intro x hx y hy
  obtain ⟨φ, hm, hk, he⟩ := Γ.com x hx y hy.1 0
  exact ⟨φ, hm, fun u ↦ (hk u).2, he⟩

attribute [-simp] InvMemClass.coe_inv Subgroup.coe_inv in
lemma Gauge.lintegral_floorWeight_le_directChart (hcom : Γ.DirectFloorChart) (hj : j ≤ 𝔰.ϱ) g y : F.IsNear j g → ∫⁻ ν,
  Γ.positionsOfSize.indicator (F.floorWeight j g) (g⁻¹ * (ν * y))
  ∂ascConv heisenbergMeasure j ≤ ∏ l ∈ .range j, Γ.floorConst l := fun ⟨ξ, h, hg⟩ ↦ by
  obtain ⟨⟨γ, k, n, l, rfl⟩, _⟩ :=
    exists_floorGroup_mul_unipotentBelow h, Γ.measurableSet_positionsOfSize
  rw [← indicator_congr fun _ _ ↦ floorWeight_mul_left h,
    ← (ascConv_heisenbergMeasure_invariant (inv_mem l)).2, lintegral_dirac_mconv,
    lintegral_eq_of_dirac_mconv_eq (ascConv_heisenbergMeasure_dirac_comm _
    k)]; simp [-Finset.prod_mul_distrib]; grw [← Γ.one_le_c_and_ne_top.1]
  refine j.rec (by simp [floorWeight]) (fun j ih hj y ↦ le_of_not_gt fun c ↦ c.not_ge ?_) hj (γ * y)
  lift j to Fin 𝔰.ϱ using hj
  obtain ⟨τ, _, hτ, z⟩ := by simpa using exists_ne_zero_of_ae ae_ascConv_mem_unipotentBelow c.ne_bot
  obtain ⟨φ, _, k, e⟩ := hcom _ hg _ z
  rw [← (ascConv_heisenbergMeasure_invariant hτ).1, lintegral_mconv_dirac, ascConv,
    lintegral_mconv_symm, Finset.prod_range_succ]
  refine lintegral_heisenbergMeasure_le _ (setLIntegral_orthonormalPart_le hasFibreBound_floorVolume
    (e _)) fun t n ↦ have ⟨ν, a, b⟩ := exists_ne_zero_of_ae ae_ascConv_mem_unipotentBelow n
    ⟨⟨_, conj_mem_unipotentBelow (inv_mem (heisenbergElem_mem_floorUnipotent j t).1) (inv_mem a),
      (conj_mul_inv_close_to_one hg z (by simpa using b) (by simp) · _)⟩, ?_⟩
  grw [← ih j.2.le, ← lintegral_mul_const,
    lintegral_le_of_ae_imp ae_ascConv_mem_unipotentBelow fun ν a ↦ ?_]
  simp [-mulVec_smul, ← indicator_mul_const]; gcongr; grw [floorWeight_succ, ← k _,
    measure_mono]
  rintro _ ⟨w, ⟨hw, o⟩, rfl⟩ u hu; exists _, hw, _, hu.2
  rw [← mulVec_smul, star_mulVec_dotProduct]
  simp [-mulVec_smul, ← mulVec_mulVec, form_mulVec_mulVec, heisenbergElem_inv, ← inverse_star_unit,
    star_g, -star_mulVec_dotProduct]
  simp [dotProduct, unipotentBelow_mulVec_apply (inv_mem a) o, j.2.le.trans]; ring
  repeat fun_prop


lemma Gauge.lintegral_floorWeight_le_directChart_bridge (hj : j ≤ 𝔰.ϱ) g y :
    F.IsNear j g → ∫⁻ ν,
      Γ.positionsOfSize.indicator (F.floorWeight j g) (g⁻¹ * (ν * y))
        ∂ascConv heisenbergMeasure j ≤ ∏ l ∈ .range j, Γ.floorConst l :=
  Γ.lintegral_floorWeight_le_directChart Γ.directFloorChart_of_com hj g y

#print axioms Gauge.directFloorChart_of_com
#print axioms Gauge.lintegral_floorWeight_le_directChart
#print axioms Gauge.lintegral_floorWeight_le_directChart_bridge
#print axioms Gauge.lintegral_floorWeight_le
#check Gauge.lintegral_mul_invWeight_le

end RHRun82Scope

section RHRun84Scope
/-!
# RUN84 — division-free integral frame and exact selfNorm caller
27 November 2026. HUMAN SOURCE-MATCHED / PREPARED; not Lean replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969, c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
RUN83 6f6dac944d7184ffcd0efcbf87c2964da2218846; RUN82 825fdbd3a430c06a1253bc29d98ffdaf5e49af2d.
Read protocols and AGENTS, current branch peer commits including
0279853292510b1962819fddc0a7837b22374016 (empty fixing-set B3) and
6246313ab32691e171ccef60168fc734f8e00d74 (prime chord replay).
No overlapping change to those callers. Current ledger B3 remains open.

## 1. Actual integral-frame supplier: proof without division or rank
FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001 lines 44–88,
ValuationPair.lean 46f7d3a3fc67d432aa9c6a52997563aff69f4f95 line 382.
The exact primitive IsValuationPair gives for a,b in A an idempotent
e in R and a=d*p,b=d*q with p,q in R, d=(1-e)a+e*b. Do NOT divide by d:
A is a commutative ring, not necessarily a domain. Define

    J = [[1-e,-e],[e,1-e]],   r=(1-e)q-e*p,
    S = [[1,-r],[0,1]],       (a,b) J S = (d,0).

The determinants of J and S are both 1, using e^2=e. Their inverses
are [[1-e,e],[-e,1-e]] and [[1,r],[0,1]], with all entries in R.
No cancellation of a zero divisor or nonzero pivot assumption. This
gives a short independent proof of the unweighted clearing consequence
of the native Hermite argument. Enumerate rows of C (k rows, D columns)
and give each row its designated distinct pivot column via injection i.
At each row apply the two-column operation to its pivot and each
remaining unprocessed column. Previously treated rows vanish on all
unprocessed columns, so their zeros are preserved. The current row
ends zero outside processed pivots and its pivot. Induction, including
empty row/column sets, gives C V zero outside i(k), V and V^-1 integral.
No rank or determinant of C enters. Native hermite supplies stronger
triangular data to other callers; do not remove that theorem globally.

## 2. Actual StandardLevel chart
StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4 lines
148–188; LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e
lines 72,81,296–301. Let n=rho+1, D=card iota, F has m+1 pairs;
s=D-(3n+1+(m+1)), so d=s+m+5=D-3rho. The native dimension lower
bound ensures nontruncation. C consists of the v rows and exactly
two rho-row blocks from N=(y0*x^-1)O and (u^-1-1)N. Use the SAME
sigma : SplitIndex rho (Fin rho) + Fin d ~= iota. The injection
selects the 3rho designated pivot columns; Y=V restricted to
sigma(inr j). Then CY=0. Its integral left inverse is the matching
rows of V^-1, so Y is a primitive frame, not merely a kernel basis
over A. The full V is integral unimodular, hence also gives the
unit-modulus transformation required by the content integral.
The source uses the same Y and V in both halves of Gauge.com and in
lintegral_contentIndex_pow_le (lines 177–182).

For actual positions y=y0^-1*u*y0*k with u in besselU and k in
congruence group, native apply_inr_of_mem_besselU (inv_mem hu)
(170–174) and the other N-row zeros imply (u^-1-1)N Y=0.
This is not arbitrary unipotent fixedness. With O=orthonormalPart,
B=x^-1 OY, exact cancellation:

    (xy)^-1 OY = k^-1 y0^-1 u^-1 N Y = k^-1 B.

B is integral by the integral box and level data and integral Y.
k^-1 is integral and g^-1*(1-k^-1) is integral by congruence.
Thus B t and g^-1*(B t-k^-1 B t) are integral for every t in R^d.
These are exactly the native closePairs conditions. Since vY=0,
Yt belongs to the SAME W. The frame supplier follows without an
unproved field rank step. RUN83's direct and inverse content-set
arguments use this frame; retain measurable content strata, zeta
estimate, real common kernel and polar integral. Their native
replay remains outstanding.

## 3. Actual consumer
LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6 lines
120–175; WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd
lines 62–65. Actual selfNorm consumes floorWeight exactly once
at lines 144–146, for the current induction floor l. Isolate the
sufficient premise hfloor for all l,g,y with native near condition.
All remaining measure, convolution, kernel, Parseval and Haar
assumptions/steps unchanged. The new caller is the original body
with exactly that call substituted. The bridge uses native floorWeight.
For RUN82, instantiate hfloor with
    fun l hl g y => Gamma.lintegral_floorWeight_le_directChart hcom hl g y
after compiling RUN82, hcom supplied by its directFloorChart_of_com.
This is a prepared source-level connection, not a joint replay.
The actual RUN82 module must be compiled separately by the runner.

Original graph: selfNorm -> floorWeight -> Gauge.com -> real
common kernel / finite valPair clearing and content; selfNorm ->
parseval (retained). Candidate graph: selfNorm_from_floor -> hfloor,
bridge -> native floorWeight or RUN82 direct chart. No removal of
inverse com globally. Preserve all original/reduced graphs and
axiom evidence. Cache by compact pin, place, SAME box/position,
v, sigma, depth, exact measures. Rejected: field rank-nullity over
product ring, division by d, rational basis lacking integral
inverse, arbitrary unipotent fixedness, global deletion of com half.

## Verification
Local lean/lake/elan check found no installation. Native rh_scan,
rh_prune/rh_reduce/rh_auto/rh_auto_frontier not executed.
Actual SymPy: 7 matrix identities verified modulo e^2-e (two J
inverse checks, two JS inverse checks, pivot and residual formulas
and direct row elimination). First assertion compared reduced
expression to unreduced RHS; corrected by reducing their difference.
Connector source SHA guard, exact 56-line caller slice and single
substitution guard executed. Below two scalar lemmas, one caller
and one bridge PREPARED, NOT compiled. Old-pin status JSONs re-read:
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 both pass for 45577239749
and 45576756833, not compact B3. No new kernel PASS.
No URT claim, no RH root import, no protected workflow edits.
Root B3, A/C/star remain open.

RESUME HERE: submit RUN82 direct-chart and RUN84 exact selfNorm
caller in one native replay module, instantiate hfloor with actual
RUN82 replacement, compare complete type to Gauge.lintegral_selfNorm_le,
and check constructor-inclusive reachability and axioms. Preserve
native fallback and failed replay. Then audit the quantitative
chart suppliers at their concrete original declarations.
-/

namespace RHRun84

lemma pair_clear {A : Type*} [CommRing A] (a b d e p q : A)
    (hd : d = (1-e)*a+e*b) (ha : a=d*p) (hb : b=d*q) :
    (1-e)*a+e*b=d ∧
    a*(-e-(1-e)*((1-e)*q-e*p))+
      b*((1-e)-e*((1-e)*q-e*p))=0 := by
  constructor
  · exact hd.symm
  · calc
      _ = (-e*a+(1-e)*b)-((1-e)*q-e*p)*((1-e)*a+e*b) := by ring
      _ = (-e*a+(1-e)*b)-((1-e)*q-e*p)*d := by rw [← hd]
      _ = 0 := by rw [ha,hb]; ring

lemma pair_det {A : Type*} [CommRing A] (e r : A) (he : e*e=e) :
    (1-e)*((1-e)-e*r)-e*(-e-(1-e)*r)=1 := by
  linear_combination 2*he

end RHRun84

noncomputable section


open Matrix MeasureTheory Measure ENNReal Fintype ComplexConjugate InnerProductSpace Level Finset
  Function RCLike Place
attribute [-simp] Subtype.forall Subtype.exists inv_mul_cancel₀
variable {A} [CommRing A] [StarRing A] [TopologicalSpace A] [MeasureSpace A] [P : Place A] {ι}
  [Fintype ι] {m} {𝔰 : Shape} (j : ℕ) {T : 𝔰.Form A} [IsHermUnit T.splitGram] {F :
  Level ι T m} (p q : ℕ → Aˣ)
  {ξ : Aˣ} {I : Type} [Fintype I] (W W' : T.G → EuclideanSpace ℂ I) (x : T.G) (Γ Γ' : Gauge F)

attribute [local simp] mul_assoc div_eq_mul_inv formIntegrand formIntegrandOne
  Fin.prod_univ_castSucc floorModulus floorForm lintegral_prod lintegral_mconv_symm
  ENNReal.inv_mul_cancel_left ENNReal.mul_inv_cancel prod_range coe_weylRatio weylRatio_inv
variable {j p q W W' x}

lemma Gauge.lintegral_selfNorm_le_from_floor [F.groupMeasure.IsHaarMeasure] {k d c} (hfloor : ∀ (l : ℕ), l ≤ 𝔰.ϱ → ∀ (g y : T.G), F.IsNear l g → ∫⁻ ν,
    Γ.positionsOfSize.indicator (F.floorWeight l g) (g⁻¹ * (ν * y))
    ∂ascConv heisenbergMeasure l ≤ ∏ a ∈ .range l, Γ.floorConst a) (hK :
  F.IsPairingKernel j k d) (hj : j ≤ 𝔰.ϱ) (e : (∏ l ∈
  .range 𝔰.ϱ, Γ.floorConst l) * ∫⁻ g, ∫⁻ y, ‖k g y‖ₑ ^ 2 ∂F.upperMeasure 0 ∂F.upperMeasure 0 =
  c) : ∫⁻ x in Γ.positionsOfSize, F.selfNorm j k x ∂F.groupMeasure ≤ 𝔰.n * c := by
  obtain ⟨hB, I⟩ := Γ.measurableSet_positionsOfSize, fun {l n} ↦ by simpa using @hK.law l 1 n
  let W l g y := ∫⁻ ν, Γ.positionsOfSize.indicator 1 (g⁻¹ * (ν * y)) ∂ascConv heisenbergMeasure l
  let Φ l g y := ∞ * W l g y ⊓ ‖F.upperPairing (l + 1) k g y‖ₑ ^ 2
  have V {l g y σ t} h : W l g y = W l (σ * g) (t * y) :=
    (lintegral_eq_of_dirac_mconv_eq (s := σ) (t := t) h).trans (by simp [W])
  apply le_add_self.trans (Nat.decreasingInduction' (P := fun l ↦ ∃ ρ, SFinite ρ ∧ l * c + ∫⁻ x in
    Γ.positionsOfSize, F.selfNorm l k x ∂F.groupMeasure ≤ 𝔰.n * c ∧ F.groupMeasure = ascConv
    heisenbergMeasure l ∗ₘ ρ ∧ (∏ a ∈ range l, if a < 𝔰.ϱ then Γ.floorConst a else 1) * ∫⁻ g, ∫⁻ y,
    Φ l g y ∂ρ ∂descConv F.floorMeasure 0 (l + 1) ≤ c) (fun l h _ ⟨ρ, _, z, e, i⟩ ↦ (fun a ↦ ⟨_,
    inferInstance, .trans ?_ z, a⟩) ⟨e ▸ mconv_assoc .., .trans ?_ i⟩) hj.step ⟨F.upperMeasure 0,
    inferInstance, by simp [selfNorm, weightedSquareSum], by simp [stackMeasure_zero_eq, ascConv],
    e ▸ by gcongr ?_ * ∫⁻ g, ∫⁻ y, ?_ ∂_ ∂_ <;> simp [Φ, upperPairing, descConv]⟩).choose_spec.2.1
  · simp [hK.selfNorm_eq_add_succ h.le_pred, weightedSquare, add_one_mul, add_assoc]
    grw [lintegral_add_left, ← add_le_add_left a.2, lintegral_lintegral_swap, ← lintegral_const_mul]
    gcongr with g
    grw [← lintegral_indicator hB, ← lintegral_mul_left_eq_self _ g⁻¹, a.1, lintegral_mconv_symm,
      ← lintegral_const_mul]
    any_goals fun_prop
    exact lintegral_mono fun y ↦ not_lt.1 fun n ↦ n.not_ge ((lintegral_le_of_ae_imp
      ae_ascConv_mem_unipotentBelow fun ν h ↦ by simp [I h, Set.indicator, ← ofReal_norm]).trans
      ((lintegral_mul_const _ (by fun_prop)).trans_le (mul_le_mul' ((hfloor l (by lia) g y ((exists_ne_zero_of_ae ae_ascConv_mem_unipotentBelow n.ne_bot).elim
      (by simp; grind [→ IsPairingKernel.isNear_of_upperPairing_ne_zero, IsNear]))).trans
      (by gcongr; grind)) (le_min ((top_mul fun z ↦ (exists_ne_zero_of_ae ((lintegral_eq_zero_iff
      (by fun_prop)).1 z) n.ne_bot).elim (by simp_all)).ge.trans' le_top) le_rfl))))
  grw [prod_range_succ, mul_assoc, descConv_succ (l + 1), lintegral_mconv_symm,
    ← lintegral_const_mul (ite ..)]
  gcongr with g
  grw [← lintegral_floorMeasure_congr rfl fun σ a ↦ lintegral_mul_left_eq_of_factor e
    ae_ascConv_mem_unipotentBelow (by grind [ascConv_heisenbergMeasure_invariant])
    (ascConv_heisenbergMeasure_dirac_comm _ a) _ fun s o y ↦ by simp [Φ,
    @V (l + 1) _ y 1 s (by simp [ascConv_heisenbergMeasure_invariant o]), I o, ← ofReal_norm],
    lintegral_lintegral_swap, ← lintegral_const_mul, lintegral_mconv_symm, lintegral_mono fun y ↦
    if z : W (l + 1) g y = 0 then ((lintegral_mono fun n ↦ inf_le_left).trans_eq (by simpa (disch :=
    with_unfolding_all fun_prop) [W, ascConv] using z)).trans zero_le else ?_]
  any_goals fun_prop
  simp +contextual only [Φ, ← V (ascConv_heisenbergMeasure_dirac_comm _ _), top_mul z]; split
  grw [Γ.parseval_heisenbergMeasure_of_box ⟨l, ‹_›⟩ F.g⁻¹ F.g 0 1 (hK.mono (by lia)) g y
    (fun s c ↦ by simp [hK.3 _ (floorGroup_anti ‹_› c.1), simpleRootSum_eq_zero_of_mem_besselH])
    (fun n a H ↦ ⟨And.intro a (by simp at H; simpa using And.imp (exists_ne_zero_of_ae
    ae_ascConv_mem_unipotentBelow) hK.isNear_of_upperPairing_ne_zero H), by simp⟩) (by
    rintro _ ⟨u, ⟨_, h₁, e₀⟩, _, o, k⟩
    obtain ⟨t, ht, ν, hν, rfl⟩ :=
      exists_floorGroup_mul_unipotentBelow (unitriGroup_anti l.le_succ o)
    exact ⟨t, ⟨(mul_mem_cancel_right (unipotentBelow_le_unitriGroup hν)).1 o, ht⟩, _, by grind,
      Γ.hasMatSize_box k, fun n ⟨hn, ⟨μ, hμ, e⟩, _⟩ ↦ ⟨_, conj_mem_unipotentBelow ht
      (mul_mem (mul_mem hν h₁) (conj_mem_unipotentBelow (mul_mem u (inv_mem
      hn)).1 (inv_mem (mul_mem hν hμ)))), (conj_mul_inv_close_to_one k e₀ e (by group) · _)⟩⟩)]
  simp; ring_nf; rfl
  grw [heisenbergMeasure_eq_dirac_one (by lia), ← hK.pivotModulus_sq_le (u := 1)
    (by simp [FloorMassLe, IsNear, measureH_spec, (by lia : l = 𝔰.ϱ)]),
    ← hK.enorm_upperPairing_le]; simp

lemma Gauge.lintegral_selfNorm_le_from_floor_bridge [F.groupMeasure.IsHaarMeasure] {k d c} (hK :
  F.IsPairingKernel j k d) (hj : j ≤ 𝔰.ϱ) (e : (∏ l ∈
  .range 𝔰.ϱ, Γ.floorConst l) * ∫⁻ g, ∫⁻ y, ‖k g y‖ₑ ^ 2 ∂F.upperMeasure 0 ∂F.upperMeasure 0 =
  c) : ∫⁻ x in Γ.positionsOfSize, F.selfNorm j k x ∂F.groupMeasure ≤ 𝔰.n * c :=
  Γ.lintegral_selfNorm_le_from_floor (fun l hl g y ↦ Γ.lintegral_floorWeight_le hl g y) hK hj e


#check IsValuationPair.hermite
#check IsValuationPair.exists_mul_clear_cols
#check IntegralPlace.IsStdLevel.gauge
#check Gauge.lintegral_floorWeight_le
#print axioms RHRun84.pair_clear
#print axioms RHRun84.pair_det
#print axioms Gauge.lintegral_selfNorm_le_from_floor
#print axioms Gauge.lintegral_selfNorm_le_from_floor_bridge
#print axioms Gauge.lintegral_selfNorm_le

end

end RHRun84Scope

section RHRun85Transport
set_option pp.fullNames true
set_option debug.skipKernelTC false

-- Reuse exact checked declaration types and proof bodies, not tactic re-elaboration.
run_cmd do
  let oldFloor ← Lean.getConstInfo ``Gauge.lintegral_floorWeight_le
  let newFloor ← Lean.getConstInfo ``Gauge.lintegral_floorWeight_le_directChart_bridge
  let oldSelf ← Lean.getConstInfo ``Gauge.lintegral_selfNorm_le
  let bridge ← Lean.getConstInfo ``Gauge.lintegral_selfNorm_le_from_floor_bridge
  unless oldFloor.levelParams == newFloor.levelParams &&
      oldSelf.levelParams == bridge.levelParams do
    Lean.throwError "RUN85 universe parameter mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    return (← Lean.Meta.isDefEq oldFloor.type newFloor.type) &&
      (← Lean.Meta.isDefEq oldSelf.type bridge.type)
  unless same do Lean.throwError "RUN85 floor/selfNorm statement mismatch"
  let some body := bridge.value? (allowOpaque := true) |
    Lean.throwError "RUN85 no selfNorm bridge value"
  unless body.getUsedConstants.contains oldFloor.name &&
      body.getUsedConstants.contains ``Gauge.lintegral_selfNorm_le_from_floor do
    Lean.throwError "RUN85 wrong selfNorm bridge suppliers"
  let value := body.replace fun e ↦
    match e with
    | .const n ls => if n == oldFloor.name then some (.const newFloor.name ls) else none
    | _ => none
  let deps := value.getUsedConstants
  unless deps.contains newFloor.name &&
      deps.contains ``Gauge.lintegral_selfNorm_le_from_floor do
    Lean.throwError "RUN85 missing direct chart / conditional selfNorm"
  for n in #[oldFloor.name, oldSelf.name, bridge.name] do
    if deps.contains n then Lean.throwError "RUN85 forbidden direct selfNorm dependency"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `Gauge.lintegral_selfNorm_le_via_directChart
    levelParams := oldSelf.levelParams
    type := oldSelf.type
    value := value
  })
  Lean.logInfo "RUN85_SELF: original complete statement and direct replacement guards"

run_cmd do
  let oldSelf ← Lean.getConstInfo ``Gauge.lintegral_selfNorm_le
  let newSelf ← Lean.getConstInfo ``Gauge.lintegral_selfNorm_le_via_directChart
  let oldPos ← Lean.getConstInfo ``Gauge.lintegral_positions_le
  unless oldSelf.levelParams == newSelf.levelParams do
    Lean.throwError "RUN85 positions supplier universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq oldSelf.type newSelf.type
  unless same do Lean.throwError "RUN85 positions supplier type mismatch"
  let some body := oldPos.value? (allowOpaque := true) |
    Lean.throwError "RUN85 positions proof unavailable"
  unless body.getUsedConstants.contains oldSelf.name do
    Lean.throwError "RUN85 positions missing original selfNorm supplier"
  let value := body.replace fun e ↦
    match e with
    | .const n ls => if n == oldSelf.name then some (.const newSelf.name ls) else none
    | _ => none
  let deps := value.getUsedConstants
  unless deps.contains newSelf.name do
    Lean.throwError "RUN85 missing replacement in positions"
  for n in #[oldPos.name, oldSelf.name] do
    if deps.contains n then Lean.throwError "RUN85 forbidden direct positions dependency"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `Gauge.lintegral_positions_le_via_directChart
    levelParams := oldPos.levelParams
    type := oldPos.type
    value := value
  })
  Lean.logInfo "RUN85_POSITIONS: original complete statement, all selfNorm occurrences retargeted"

#print axioms Gauge.lintegral_selfNorm_le_via_directChart
#print axioms Gauge.lintegral_positions_le_via_directChart
#print axioms Gauge.lintegral_positions_le
end RHRun85Transport
