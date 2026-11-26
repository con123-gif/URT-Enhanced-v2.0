import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
RUN60 — positivity geometry, 26 November 2026.
Human source-matched proofs: flat-chart disintegration, exact near-quadric
modulus, Eichler local section, finite Siegel-to-packet energy assembly.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
d3ee05d91281a2a6264906951eae3152534b8420. Read AGENTS, protocol,
handoff, expansion, latest peer commit summaries including theta
6c88e267d243207476263cf7f37f39ff9600c23f, Galois
40ec48906f015fad9a592b675066c1f5b45a5ad3 and literature
198752edd4bfb161e720f679356b7c37dd46491c.
Previous lane RUN59 329c06fd4488c38cf662bc8c85d9dec87c005ec1.
Compact source bodies retrieved (paths relative to grh-compact/src):
Lib/General/Measure/Place.lean 300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975
Lib/DiscreteSeries/Bruhat/BigCell.lean da06dcfda1a1401b8ad51f94649da9b760907a87
Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271
New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4
New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
New/Filling/FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9
Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff

1. Actual Place.isDisintegration_quadricMeasure.
Let A be the native Place, δ its skew unit, τ its trace-one element,
ν its skew Haar measure, md its modulus. Retain measurePreserving_split:
(b,a) -> τδ^-1 b+a from skew x skew to A, and the native
map_skewMeasure_mul_unit, ae_isUnit, exists_locallyIntegrable_bound.
For T hermitian put q(w)=w*Tw. In a hyperbolic plane plus T,
h((s,t,w),(s,t,w))=star(s)t+star(t)s+q(w).
For unit t set
  s=star(t)^-1 τ(δ^-1 b-q(w))+t a,   star(a)=-a.
Then h=δ^-1 b exactly since τ+star τ=1. In fact the (b,a)
coordinates are uniquely recovered from s by the split map.
After multiplication by t, the b-coordinate is scaled by
(t star t)^-1, a self-adjoint unit. Its Haar modulus is
md((t star t)^-1)^(1/2)=md(t)^-1; the factor md(t)
from multiplying s cancels it exactly. The q(w) term is a
translation. Consequently ds = dν(b)dν(a) for fixed unit t,w,
in the sense of pushforward measures; no missing factor of two.
Tonelli, with the nonunit t set null, proves the native
lintegral_eq for every nonnegative measurable test function.

For compactly supported continuous Φ, fix its support C, and let
C_s,C_t,C_w be the coordinate projections. At fixed unit t,w,
the a-slice of the inverse image of C is a translate of a
subset of t^-1(C_s-C_s) intersected with the skew elements.
Its ν-measure is at most K_C md(t)^(-1/2), uniformly in b:
indeed for any a0 in the slice, t(a-a0) lies in C_s-C_s;
the trace-one split of two such differences lies in the compact
sum τδ^-1(C_s-C_s)+(C_s-C_s). Apply
skewMeasure_le_of_sub_mem (or its direct product-Haar proof)
to square the skew volume. This retains the native square-root
modulus and works without a lower bound on t away from zero.
Thus the inner integral is dominated by
  ||Φ||∞ K_C 1_Ct(t) 1_Cw(w) md(t)^(-1/2).
The native locally integrable bound for md(t)^(-1/2) makes this
integrable over t,w. For each fixed unit t,w, the a-support
for any b lies in the compact set obtained by taking the skew
component of t^-1 C_s (the self-adjoint component of t^-1 s
is proportional to τ). The chart depends continuously on b
there, so dominated convergence first in a, then in t,w
proves continuity and finiteness for every b. This is the
second required field of IsDisintegration, not just an
almost-everywhere fibre formula.
Uniqueness: integrate against indicators of all measurable
sets of b, times compactly supported continuous tests in
the vector. The two fibre integral functions agree a.e.
and, being continuous with full-support Haar, agree everywhere.
Test-function uniqueness gives equality of the fibre measures
at every b, including the specified norm -N. Transport through
F.floorBasis using its Gram identity and left inverse is the
actual HyperbolicBasis.isDisintegration_floorVolume in BigCell.
No arbitrary choice of exceptional fibre allowed.

2. Actual near-quadric slab (StandardLevel).
Use the native coordinates tailVector π τ' y with π starπ=N
(the symbol τ' here is a variable, not the trace-one element).
From middleBaseChange in EichlerFlag the middle coordinate
matrix is lower block triangular with upper diagonal 1 except
starπ at the marked coordinate, lower last diagonal -N^-1.
Its determinant is -starπ/N=-π^-1. Thus the pushforward
of dy dτ' is md(π) times floorVolume, not md(N) or its inverse.
Direct evaluation of the Gram form gives exactly
  h(e,e)=q(y)-N^-1 τ' starτ',   (J e)_z=τ'.
Therefore for a measurable S and compactly supported
continuous Φ>=0 the slab integral in StandardLevel is exactly
  md(π) ∫_{b: δ^-1 b+N∈S} (∫ Φ d floorQuadric(top,b)) dν(b).
For c>∫ Φ d floorQuadric(top,δ(-N)), weak continuity from
step 1 gives a neighborhood U of δ(-N) where the inner
integral is <=c. For every sufficiently small measurable S
the displayed domain lies in U, and by translation its measure
is ν{Γ:δ^-1Γ∈S}. Hence the native slab bound
  slab(S) <= md(π) ν(δ S) c.
All small sets, not only a chosen sequence or one fixed ball.
This proves the measure normalization and the near-level
inequality with the original strict c hypothesis.

3. Actual local Eichler section (FinitePlaceDensity).
Write h(x,y)=x*Jy, z the native top frame vector, u its
isotropic partner h(u,x)=x_z, u_z=0. Set v=e-z, β=e_z,
Δ=h(e,e)-h(z,z), s=h(v,e)-τΔ, w=v+s u. On the open
unit locus of β define
  g=I+A, A=u v*J - β^-1 w u*J.
The native formula uses the total inverse, so if β is
not a unit in A it gives I (with the total inverse convention).
For unit β, h(u,v)=β-1, h(u,w)=β-1, h(u,u)=0,
and s+star(s)=h(v,v) by e=v+z and τ+starτ=1.
Let † be the J-adjoint. Expanding A+A†+A†A, the
coefficients of u v*J and v u*J respectively are
  1-barβ^-1-barβ^-1(barβ-1)=0,
  1-β^-1-β^-1(β-1)=0.
The remaining u u*J coefficient is
  [h(w,w)-s barβ-star(s) β]/(β barβ)
  =[h(v,v)-s-star(s)]/(β barβ)=0.
Hence g†g=I; over the native commutative ring this makes g
invertible (determinant/adjugate), g^-1=g†. Also
  ge=e+u h(v,e)-w = z+τΔu.
For e in the norm fibre Δ=0, ge=z, i.e. orbitPoint(g)=e.
The floor membership follows from the source support of u
and v in V_rho and orthogonality to the preceding fixed
frame vectors; no extra root dependence removed. At e=z
one has g=I, and the formula is continuous on the open
unit locus. This provides the actual continuous local
section in eventually_sum_packets_le_energy, after
conjugation by the chosen l_o, rather than asserting
transitivity implies a continuous section.

4. FiniteSystem.siegel_sum_le_lintegral_quadric assembly.
Keep the exact hypotheses of the native caller: finite
weighted set s of (class,y), Nq(y)=t star t-N², integrality
off T, local orbit lower bounds, ht at all infinite places.
Let B=sum c_z; the case B=0 is immediate. RUN59 constructs
the locally constant compactly supported Ψ<=f and its
finite adelic lift n. Keep column-level invariance, compact
support and summability of the native class sum.
Write β=(t star t-N²)/N and t'=eval_T t; let I be the
finite self-adjoint Fourier integral of n at β. By OneVector
B<=|C| |I|, where
  C=#Classes |disc E|^(1/4) prod_v[π^k/(k-1)! β_v^(k-1)].
Put r=(1+b^-6)/(1+2^-n)>1 using the source rank guard.
Then B<r |C||I| and I is integrable by the native nonzero
integral argument. The shifted phase is
  b(τ')=N^-1 τ' starτ'-N-β_T,
which vanishes exactly at t'. The Fourier integral cut to
codifferent C_M, shifted by adeleOfLocal T b(τ'), tends
to I jointly as the neighborhood scale shrinks and τ'->t'.
For each fixed Fourier variable, its phase eventually equals
one and its cutoff eventually equals one; domination is
the integrable absolute value of the original Fourier
integrand. Thus there is a single small neighborhood of t'
and a cutoff threshold with B<r|C||I_{M,τ'}| throughout.
No uniform oscillatory estimate or additional zeta bound needed.

For each small clopen L use Φ(e)=1_{(Je)_z-t'∈L} Ψ(e).
It is continuous and compactly supported. Select any finite
c>∫Φ d floorQuadric (if the latter is infinite the target is
immediate). Step 2 supplies a single small slab neighborhood.
Choose M large/divisible enough that the local congruence
S_M={x: M^-1 x integral at T} lies inside that neighborhood,
and C_M meets the Fourier cutoff threshold, exactly as
mem_nhds_zero_finAdele_iff in the source. Use the same
M and its off-place density v_M for every τ'∈t'+L.
The projector of RUN59 turns |I_{M,τ'}| into
vol(C_M) v_M times the local congruence integral.
Shrinking L also ensures
Ψ(tailVector π t' y)=Ψ(tailVector π τ' y) by uniform
small translation invariance. The latter tail satisfies
(Je)_z=τ', so Φ equals Ψ on this part of the slab.
Integrating the strict lower inequality over t'+L, enlarging
only the nonnegative slab integral and applying step 2 gives
  B vol(L) <= r |C| vol(C_M) v_M ν(δ S_M) md(π) c
           <= r |C| ζ_Ô(ρ+1) volÔ^k md(π) c.
Here the second inequality is precisely RUN59(D), with the
same cutoff and v_M. Since ζ<=1+2^-n, the r denominator
cancels. Infimize over c, retaining the source finite
constant and strict-to-weak argument. The product formula
in md_evalPlaces_rpow_half gives md(π)=N^-f because
π starπ=N and both π and its inverse are integral off T.
Since β_v=(|t_v|²-N²)/N, the resulting factor is
  |C| volÔ^k md(π)=#Classes*siegelConst*G,
  G=prod_v(|t_v|²-N²)^(k-1).
All N exponents are -f(k-1)-f=-fk, exactly the denominator
in Setup.siegelConst. Replacing Ψ by f via monotonicity now
recovers the native bound. No RH premise. Remaining inputs:
the one-vector formula's SW and adapted-vacuum suppliers,
the precise column-level invariance and local density
identities from RUN59 and the native product formula.

5. Coherent energy at actual sum_blocks_le_topKernel.
Keep the exact source Gram matrix R common for all i and
the head-density condition ρ_p h_p = r0 sqrt(G).
Let J_p(l)=correlation Z (ω p) l, with coset-pair coordinates
indexed by x. The exact finite expansion is
  sum_pq R_pq <J_p(l),J_q(l)>
      = sum_x v_x* R v_x >=0,  v_x(p)=J_p(l)_x.
All heads have the same top parameter t, so the band
indicator is the SAME for every p,q. Integrate this equality
before norms; integrability comes from floorForm_top_eq_integral
at zero frequency. Push forward floorMeasure by orbitPoint,
and use the native stackMeasure_top H convolution. The
infimum defining energy is no greater than the H integral
at each representative, so
  integral_band energy <= Q=Re sum_pq R_pq topKernel(p,q).
This is the native lintegral_energy_le_topKernel, without
an entrywise absolute value estimate.

For a fibre g(i)=(class, γ_i z in X0), each pair (i,b)
with b in Z.Cosets selects a distinct local packet/coset
coordinate, as required by eventually_sum_packets_le_energy.
The native proof uses the floor-group intersection and
eq_and_mem_classUnip_of_besselS to prove injectivity; do
not infer it merely from distinct original tuples. Step 3
provides its local orbit section; the remaining requirements
are the exact eventual uniform correlation identity,
H-invariance and the packet-injectivity bridge. Given these,
disjoint translates of K(g) in H (or disjoint coordinate
labels on overlaps) yield lower energy by summing their
nonnegative contributions; their Haar mass is μ_H(K(g)).

Let K0=groupMeasure K(g), d=|Z.Cosets|, M=massRatio Z,
D=|image(besselS)| unipOrder. Source GlobalToLocal
correlation_smul_eq_cosetAmplitude states the equality
of local correlation times the archimedean vector with
h_p K0 amplitude. Thus for each pair (i,b), the shared
Gram identity and the head-density relation yield exactly
  v*Rv = G K0² y_i,
where y_i=r0² ||sum_p amplitude_i,p||². This calculation
must precede any norm bound. The lower energy on this fibre
is >= μ_H(K(g)) d G K0² sum_{i in fibre} y_i
             >= G (M/D) sum_{i in fibre} y_i.
The last inequality is exactly the native f inequality
in sum_blocks_le_topKernel, obtained from finite coset
counting and unipotent mass normalization. All factors
are positive and finite. These are therefore permissible
weights c_z for step 4. Summing over the image fibres
counts each i once. The common G cancels from the resulting
upper/lower comparison, giving
  sum_i y_i <= (1+b^-6) packetConst * Q/(vol L * M),
where packetConst=D #Classes siegelConst.
This is the actual B consumer, with no arbitrary independent
choice of Gram matrices or repeated norm loss. It uses
the native sharp correlation unfolding and packet
injectivity as explicit premises; not a claim they have
now been independently reconstructed.

Dependency bookkeeping: original graph retained. Local human
substitution edges: flatChart -> isDisintegration_quadricMeasure
-> isDisintegration_floorVolume -> eventually_mass_near_quadric_le
-> siegel_sum_le_lintegral_quadric; Eichler section ->
eventually_sum_packets_le_energy (other hypotheses remain);
Gram positivity + stack convolution + orbit pushforward ->
lintegral_energy_le_topKernel -> sum_blocks_le_topKernel ->
Moments -> FillingTheorem -> B -> star. No native graph/axiom
pruning claimed; original pin evidence not applied across versions.
Local command -v lean/lake returned no executable. Earlier compact
targeted CI 45799225653 jobs 139837755331,139837856843,139846428086
actually retrieved success this run; it does not compile this file.
The following scalar cancellation and exact caller checks are
prepared only. No new numerical diagnostics; no new CI PASS.
No protected workflows or existing files modified.

RESUME HERE: derive the sharp absolute unfolding in
GlobalToLocal.correlation_smul_eq_cosetAmplitude and
TopFloor.floorForm_top_eq_integral with exact integrability,
then uniform eventual correlation and the packet injectivity
bridge in FiniteSystem.sum_blocks_le_topKernel. The local
quadric modulus and coherent energy normalization above are
sufficient, so do not optimize them again. Coordinate adapted
vacuum/Siegel–Weil with literature and dependency workers.
HANDOFF TO integration/editor/audit/shared compact replay.
-/

namespace RHPositivityQuadricPacketEnergy

theorem chart_modulus_cancel (a : ℝ) (ha : a ≠ 0) :
    a * a⁻¹ = 1 := mul_inv_cancel₀ ha

theorem eichler_coeff (s sb b bb q w : ℝ)
    (hb : b ≠ 0) (hbb : bb ≠ 0)
    (hs : s+sb=q) (hw : w=q+s*(bb-1)+sb*(b-1)) :
    1-b⁻¹-b⁻¹*(b-1)=0 ∧
    1-bb⁻¹-bb⁻¹*(bb-1)=0 ∧
    (w-s*bb-sb*b)/(b*bb)=0 := by
  constructor
  · field_simp <;> ring
  constructor
  · field_simp <;> ring
  rw [hw, ← hs]
  ring

theorem packet_cancel (G M D Y C Q L : ℝ)
    (hG : 0 < G) (hM : 0 < M) (hD : 0 < D) (hL : 0 < L)
    (h : (G*(M/D)*Y)*L ≤ C*G*Q) :
    Y ≤ (D*C)*Q/(L*M) := by
  apply (le_div_iff₀ (mul_pos hL hM)).2
  have h' : G*(Y*(L*M)) ≤ G*((D*C)*Q) := by
    calc
      G*(Y*(L*M)) = D*((G*(M/D)*Y)*L) := by field_simp <;> ring
      _ ≤ D*(C*G*Q) := mul_le_mul_of_nonneg_left h hD.le
      _ = G*((D*C)*Q) := by ring
  exact le_of_mul_le_mul_left h' hG

#print axioms chart_modulus_cancel
#print axioms eichler_coeff
#print axioms packet_cancel
#check Place.isDisintegration_quadricMeasure
#check HyperbolicBasis.isDisintegration_floorVolume
#check HyperbolicBasis.eventually_mass_near_quadric_le
#check IntegralPlace.exists_eichler_orbitPoint_eq
#check IntegralPlace.IsStdLevel.lintegral_energy_le_topKernel
#check Filling.IsFillingLevel.siegel_sum_le_lintegral_quadric
#check Filling.IsFillingLevel.sum_blocks_le_topKernel
#print axioms Filling.IsFillingLevel.sum_blocks_le_topKernel

end RHPositivityQuadricPacketEnergy
