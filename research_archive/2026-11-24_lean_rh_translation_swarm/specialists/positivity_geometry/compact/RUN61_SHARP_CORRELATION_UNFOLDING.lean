import New.Filling.FiniteSystem
import Mathlib.Tactic

/-!
RUN61 — 26 Nov 2026. Positivity geometry, compact Theorem B.
Human source-matched unfolding and uniformity, independent audit pending.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript a78c38a72d502bd41ee9081aee5aa42a054ed02e; previous
RUN60 5040237a7625ed7b518ad7b689896fd380f57c4f. Read AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES and current
peer commits (2bd8f96d,2ce507a2,4aee920f,403556a7,b7b304a3,
622fbfec,a599aa5c,38418a9b). The latest mission prioritizes
completion before compression; no new RH equivalent.
Source paths relative to grh-compact/src:
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1
New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6
New/RealPlace/FloorKernels.lean 594b1553ed02ba5c074180fb32d0f5215918ad52
New/RealPlace/WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd

1. Sharp absolute bound at GlobalToLocal:302–376 (not the
different Rallis C unfolding). Fix exactly S.IsAdmissible,
Side, sigma in GT rho, gamma=w_p sigma, position(gamma)
integral off T, k in latStabilizer, and coset labels a,b
with k_T^-1 a_out b_out^-1 in K=congGroup. Write P(gamma)
for termPosition c c' gamma, U for rational besselU, and
delta(u,v)=u gamma v^-1. Define Q(u,v) to require P_c(u)
integral off T and delta in termsOver(c,reduction k,c').
The summand on the finite-place group times the real group is
  g_uv(z,y)=1_{P_c(u)_T z in K} 1_Q
    beta_c(u_inf y) beta_c'(delta_inf^-1 u_inf y)
    Wkernel(delta,u_inf y).
Here beta are exactly classCutoff and Wkernel=besselKernel,
not scalar absolute values substituted into the amplitude.
Each function is measurable. Nonnegative Tonelli and left
Haar translation give the exact identity
  integral ||g_uv|| = mu(K) 1_Q amplitudeAbs(c,c',delta).
For fixed gamma in the big cell, the native big_cell_unique
(hypothesis sigma in GT rho) implies the map (u,v)->delta is
injective; restricting to Q retains injectivity. Therefore
  sum_uv integral ||g_uv||
    <= mu(K) sum_{delta in termsOver(c,reduction k,c')}
                 amplitudeAbs(c,c',delta) < infinity.
K is compact with finite Haar mass, and the second factor
is the actual AmplitudeSums.amplitudeAbs_lt_top_and_cut_le
with T=univ, not an assumption of summability of coset sums.
This proves absolute integrability for the exchange of
integrals and countable sum in the exact vector coordinates
(tsum_integral_apply). In the complex vector integral itself
left invariance gives integral g_uv=mu(K)1_Q amplitude(delta).
Neither an extra |U| factor nor a square root loss occurs.
Retain the native absolute-amplitude theorem's tail majorant
and rational boxed-point injection as its own supplier.

2. Phase factorization at the same caller. Right-translate
the finite integration variable by a_out. Choose x integral
off T lifting the resulting z (exists_toPlaces_eq).
Set xi=P(gamma)^-1 x k; it is integral off T by the guards.
Using the native termPosition multiplication identities,
  [P_c(u)_T z in K and Q(u,v)]
     iff [P_c(u)x in principalLevel
          and P_c'(v)xi in principalLevel].
Indeed P_c(u) x being principal first gives integral
P_c(u) off T, since x and inverse are integral there.
With l=P_c(u)x and l'=P_c'(v)xi the term condition is
equivalent to l k (l')^-1 in the required reduction coset:
P(delta)=l k (l')^-1 (with the indicated c,c' bases).
Thus either membership implies the other by solving for l'.
All local-to-global conditions use mem_principalLevel_iff;
one cannot replace the off-T condition merely by membership
of z at T.

For each fixed x define B_c(x,u,y)=beta_c(u_inf y) when
P_c(u)x is principal, zero otherwise. If phase(z)!=0,
a local unipotent gives the coset support; lift it with
exists_toPlaces_eq and use exists_rat_approx_unipotentChar_eq
to get a rational v0 with P_c(v0)x principal. The set of
admissible u is precisely classUnip(c) v0, by multiplication
with the inverse of the chosen principal element. Its
B-sum equals sum_{w in classUnip(c)} beta_c(w_inf v0_inf y)=1
by tsum_classCutoff_eq_one. This is the actual shifted
partition of unity, not the unrestricted sum over U.
For an admissible u the local phase is chi(u)^-1:
factor P_c(u)x as principal, use phase_besselU_mul,
psi_simpleRootSum_eq_unipotentChar and the character's
principal-level conjugation law. Apply this also to xi,v.
The finite correlation integrand after translation is
  phase(z) conj phase(xi_T k_T^-1 a_out b_out^-1).
The last three factors are in K by the coset hypothesis,
so right K invariance makes it phase(z) conj phase(xi_T).
The real kernel transform
  Wkernel(delta,u_inf y)=chi(u)^-1 chi(v) Wkernel(gamma,y)
is exactly besselKernel_besselU_mul. Therefore the complex
phase factors are independent of u,v on the two admissible
cosets. The cutoffs factor as B_c(x,u,y)
B_c'(xi,v,gamma_inf^-1 y). Both sums equal one if the
product phase is nonzero, and when it is zero each
admissible summand is zero by the phase law. Sum the
nonnegative cutoff factors before integrating. By part 1
Fubini is justified. The native correlation vector identity
follows, coordinate by coordinate, with its exact factor:
  correlation_fin(Z,q,position(sigma)^-1)[a,b]
    * correlation_inf(gamma)
    = headDensity(q,1) mu(K) cosetAmplitude_T(gamma).
The real/finite product and coset orientation are as in the
source; the headDensity is not counted twice.

3. Uniform local constancy (TopFloor:447–472). The gauge is
chosen once for p and 1, using a unit alpha near zero with
star(alpha)*alpha times each inverse prefix product in the
size ring. Density of units and finitely many open prefix
conditions give this choice; openness keeps it valid for all
p' in a single neighborhood of p. Set C={y:HasMatSize
(60 n^2)} in this gauge, compact by the matrix size lemma.
For W=besselVector Z, if W(y) and either W(l w_p^-1 y) or
W(l l' w_p'^-1 y) is nonzero, hasMatSize_of_ne_zero places
y in C, uniformly for l,l' in GT rho. For y in C,
  d(y,p',l')=y^-1 w_p l' w_p'^-1 y
is continuous and d(y,p,1)=1. Openness of K and the tube
lemma for compact C give ONE neighborhood of (p,1) with
d in K simultaneously for every y in C. W is right
K-invariant: in each coordinate the coset representative
belongs to Z<=K(1), which normalizes K. Consequently
W(l l' w_p'^-1 y)=W(l w_p^-1 y) whenever W(y)!=0 and either
term is nonzero; if both are zero equality is automatic.
If W(y)=0 the correlation integrands both vanish. Hence
equality of integrands holds for EVERY l, without a
neighborhood depending on l or an unproved uniform
dominated-convergence argument. Shrink the same neighborhood
so p_j^-1 p'_j and its inverse are integral units for all
j<rho. The two modulus inequalities imply md(p'_j)=md(p_j).
All headDensity factors are consequently identical.
Integrating proves the actual eventually_correlation_eq,
not just continuity at each fixed l. This supplies the
uniform correlation premise of RUN60.

4. Top floor absolute unfolding (TopFloor:513–559).
Write omega(x)=psi(xi frameGram(x,top,top)), |omega|=1,
w_p=weylElem rho p and W=besselVector Z. Fix the common
gauge for p,q. For l in GT rho the integrands defining the
correlation inner product have compact support in BOTH y,y'
by hasMatSize_of_ne_zero; continuous W makes their product
integrable on that compact. Expanding the finite tensor
coordinates, then multiplying their two integrals, yields
  <J_W(w_p l^-1),J_W(w_q l^-1)>
  = int <W(x),W(y)> <W(l w_q^-1 y),W(l w_p^-1 x)> dmu(x)dmu(y)
with the native convention conjugate-linear first slot.
The second inner product is exactly the conjugate of
<W(l w_p^-1 x),W(l w_q^-1 y)>.
For the triple integral including omega(l^-1), the
nonzero support in (x,y) lies in C x C, outside a null set
where l fails GT rho. From isPairingKernel_self at floor rho
and its exists_lintegral_le there is a finite constant e
uniform in g,y such that int ||<W(h g),W(h y)>||
d upperMeasure(rho)(h) <= e. The upper measure here is
the top stack measure (descConv of the final two factors).
Use g=w_q^-1 y, y'=w_p^-1 x in this same bound. Tonelli
therefore gives
  triple integral of absolute value
    <= e * int_{C x C} ||<W(x),W(y)>|| d(mu x mu)
    < infinity.
The final integral is finite by continuity and compactness.
This proves absolute integrability BEFORE any complex
Fubini, including xi=0 needed for the Gram energy caller.
The native uniform kernel bound is kept, rather than
mistaking fixed-l compact support for global integrability.

The native measure transport E in TopFloor gives the
following explicit calculation. Put y0 for the original
first variable; replace the second by y0 x using Haar
invariance. Decompose mu(dy0) using descConv_add into
y0=h sigma y with h measured by measureH, sigma by
floorMeasure(rho), y by stackMeasure(0,rho). For each
h,sigma right-translate l by (h sigma)^-1 using the native
stackMeasure_mconv_dirac invariance, then decompose its
untranslated variable as k tau using stackMeasure_top.
The resulting l=k tau (h sigma)^-1 has
omega(l^-1)=omega(sigma tau^-1) by frameGram_diag_mul
(the h and k factors disappear). The top floor group
commutes with the prefix Weyl factors; the two remaining
W arguments are z=k tau w_p^-1 y and
weylRatio(p,q) z x. Thus the transported integrand is
  omega(sigma tau^-1)
  <W(h sigma y),W(h sigma y x)>
  <W(weylRatio(p,q) z x),W(z)>.
This equality is equality of integrals of ALL nonnegative
measurable tests of the complex value (the source IdentDistrib),
not merely equality of an integral whose convergence is
unknown. Its justification is the Haar product swap and
the exact convolution/right-translation identities, not
Lebesgue measure in arbitrary matrix coordinates.
Hence absolute integrability transfers as well. Fubini
over h,k yields the two upperPairing factors at rho+1,
the second conjugated. Integrating sigma,tau gives
formIntegrand; integrating x,y gives floorForm divided by
headDensity(p,q). Multiplicativity of md shows exactly
headDensity(p,1) headDensity(q,1)=headDensity(p,q).
Consequently the full weighted stack integral is floorForm,
with no Haar scalar lost. This closes the analytic
unfolding at its actual consumer given the stated native
gauge, kernel and convolution suppliers.

5. Caller and remaining obligations. In FiniteSystem:156–229,
retain the actual selected A(i,b) with k_i,T^-1 b_out
A(i,b)_out^-1 in K. Part 2 applies with (a,b)=(b,A(i,b)).
Part 3 provides a single open neighborhood for all heads;
the finite head family makes their intersection open.
Part 4 at xi=0 gives integrability of all Gram terms used in
lintegral_energy_le_topKernel. The nonnegative finite Gram
contraction and the exact mass cancellation are RUN60;
packet label injectivity uses the editor source-matched
argument (FiniteSystem:220–229) and its group intersections.
No use of RH. This run does not derive the remaining
absolute-amplitude majorant (tail estimates and rational
box count), all class approximation/group intersection
lemmas, or the one-vector Siegel–Weil/adapted vacuum input
from independent accepted foundations. These remain open
in the human proof wherever not already audited.

Original/reduced dependency and axiom graphs unchanged.
Context key: source pin, actual S, Side, T, Z, sigma,p,c,c',
k,a,b and off-T guard; top floor same gauge and W.
Human replacement edges: amplitudeAbs + big_cell_unique +
class cutoff + local phase -> correlation_smul_eq_cosetAmplitude;
compact gauge + cut support + K normalization ->
eventually_correlation_eq; uniform kernel + Haar transport ->
floorForm_top_eq_integral -> lintegral_energy_le_topKernel;
these three -> sum_blocks_le_topKernel -> Moments -> B.
No deletion from native graph; no old-pin engine result
applied to compact. Local command -v lean/lake/elan empty.
Retrieved actual jobs for CI 45803534769 (three wrapper
jobs concluded success), and the committed primitive
receipt (overall_task_passed=false, six checks with three
standard axioms, JetExponentBound build timeout 124).
This is not verification of this new certificate.
No new native PASS; the following executable scalar and
caller probes are prepared for shared replay, not compiled.
No protected workflow edits; no synthetic tests.

RESUME HERE: expand AmplitudeSums.amplitudeAbs_lt_top_and_cut_le
at its actual tail.exists_majorant and tsum_classCutoff_box_le
suppliers, and independently check exists_rat_approx_unipotentChar_eq
and the finite group intersection used at FiniteSystem:220–229.
Coordinate the exact one-vector Siegel–Weil/adapted vacuum
supplier with literature/dependencies. Do not repeat RUN60
normalization or this run's phase/measure algebra.
HANDOFF TO integration/editor/audit/shared compact native replay.
-/

namespace RHPositivitySharpCorrelation

-- Nontrivial scalar check of the exact multiplicative
-- normalization and phase order; native callers below.
theorem head_pair (a b c d : ℝ) :
    (a * b) * (c * d) = (a * c) * (b * d) := by ring

theorem phase_cancel (a b : ℂ) (ha : a ≠ 0) (hb : b ≠ 0) :
    (a⁻¹ * b) * (a * b⁻¹) = 1 := by
  field_simp <;> ring

#print axioms head_pair
#print axioms phase_cancel
#check Filling.tsum_integral_apply
#check Filling.amplitudeAbs_lt_top_and_cut_le
#check Filling.IsFillingLevel.correlation_smul_eq_cosetAmplitude
#check IntegralPlace.IsStdLevel.eventually_correlation_eq
#check IntegralPlace.IsStdLevel.floorForm_top_eq_integral
#check IntegralPlace.IsStdLevel.lintegral_energy_le_topKernel
#check Filling.IsFillingLevel.sum_blocks_le_topKernel
#print axioms Filling.IsFillingLevel.correlation_smul_eq_cosetAmplitude
#print axioms IntegralPlace.IsStdLevel.floorForm_top_eq_integral

end RHPositivitySharpCorrelation
