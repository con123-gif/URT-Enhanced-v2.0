import Lib.Weil.DualPair.FourierCoefficient
import New.Exchange.LowRankIdentity

/-!
# Integration: absolute unfolding by one uniform dual test (27 Nov 2026)
Status: source-matched human derivation, candidate stronger local supplier;
prepared Lean probes/scalar certificate, NOT compiled. No unconditional RH.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Original pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 (mandatory engine);
protocol, queue, AGENTS, continuity and recent commits inspected. This is
the separate noncoherent Fourier/exchange integrability supplier requested
by the lead 88e0a9bc, not the stable-range Rallis majorant.
Source paths relative to grh-compact/src:
* Lib/Weil/DualPair/FourierCoefficient.lean f2756c5504bd6cdc8b38c8cf17c4310ec5d38ff8:
  exists_tsum_thetaTerm_le, hasIntegrableTerms_integrated_name,
  centreCoeff_integral_eq_tsum, centreCoeff_eq_integral_stabilizer.
* Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804:
  exists_norm_name_le, name_eq_zero_of_invariant, coordMatrix_mul_ne_zero.
* Lib/Weil/DualPair/PairSplitting.lean 7060d2715dc64318e5f657357bce32c32bf11772:
  sourceTerm_varrho, hasSum_theta_sourceTerm.
* New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c:
  thetaTerm_stdDatum_spec (calls the actual integrability supplier).
Recent editor 52a17e4e and audit 75a3faea: distinct Rallis cutoff and phase.
Character-box RUN73 a9740422: retains this HasIntegrableTerms input;
positivity ff5c7bc2: separate weighted geometry. The class discriminant
supplier requested there was already reconstructed in integration note
2026-11-26_COMPACT_LATTICE_SATURATION_AND_CONVERGENCE.md §3,
blob 694fc9ade17ef624781596f6e89d45d06293f3bc; use that, not a new count.

## 1. Exact fixed-frame rational invariance

Use native spaces S,T, splitting D=(k,i,l), fixed g and same finite
named datum f0=vacElem. Set C=(k|i) in rational coordinates; multiply
by the one positive rational integer d used by the native
exists_forall_mul_mem_Ô, so its coordinates at g are finite integral.
Do not alter the support of Ψ, its fixed split set P, the map φ, or
the rapid real vector v. The relevant support hypothesis is exactly
HasLeftInv(((vecToMat y * coordMatrix(g,C)).map snd).map φ)^T
for every y in the nonzero support, with parentheses as in the source
(i.e. transpose of the matrix after the ring map). Multiplication by
d preserves this because the image of a nonzero rational scalar is a
unit; φ is unital into a nontrivial ring.

For a rational Z consider the displacement Y=T.x^-1 (Z (dC)* J_S) S.x.
The source mixed-term formula at a rational frame x is
  sourceTerm(X, rho(Y)F)
   = char((j/2) tr((Y l_ad)* J_std (2X+Y k_ad)))
       rho(Y i_ad) sourceTerm(X+Y k_ad,F),
  X=T.x^-1 x.
Because C* J_S k=0 (k isotropic, i orthogonal to k), Y k_ad=0.
The remaining character argument is a rational trace with the
same j/2, so the global additive character is exactly one.
Y i_ad is the coordinate image of a rational Hom displacement
in the smaller oscillator; its theta is invariant by rational
Heisenberg invariance. Thus EACH fixed-frame bounded functional
ell_x=theta o sourceTerm(X) is invariant under the SAME rational
translations used in exists_norm_name_le. No frame permutation or
absolute-value estimate is involved. This matters because the
coefficients of the finite dual test need not be invariant under
a permutation of the x indices.

## 2. Uniform finite dual tests, and the stronger all-moment estimate

Fix h and finite set I of rational frames. Choose u_x of modulus
one, equal to conjugate(T_x(h))/|T_x(h)| for nonzero terms and 1
at a zero term, where T_x(h)=ell_x(pairWeil(g,h) f).
Set ell_I=sum_(x in I) u_x ell_x. The exact evaluation is
  ell_I(pairWeil(g,h)f) = sum_(x in I) |T_x(h)| >= 0.
The functional is bounded (finite sum) and inherits the rational
invariance from §1. For every test datum F the native moderate
estimate gives
  |ell_I(pairWeil(g,h)F)| <= sum_x |ell_x(pairWeil(g,h)F)|
                          <= Y ||F|| H^A,
where H=height_T(h)>0 and Y,A depend on g, not I,h or the phases.
Enlarging Y to nonnegative is harmless. In particular this is
a simultaneous bound on the functional on ALL F, not just f.

If H>2, use the same short rational isotropic d_h from
T.exists_short_isotropic: its coordinates have norm <=2/H.
The columns of dC at g have fixed finite bound Z0 and are
integral by the chosen denominator. The product of their real
sizes is <=2 Z0/H. The actual onto support hypothesis and
T.coordMatrix_mul_ne_zero (X=1; d_h nonzero; rational d a unit)
give the required nonzero contraction on the support:
  (coordMatrix(h,d_h)_f)* y coordMatrix(g,dC)_f != 0.
This is the first alternative of exists_norm_name_le.
The short vector and fixed column block do not depend on I or
u_x. The H<=2 branch is already part of that lemma.

Apply exists_norm_name_le with rho=1, H as above, exponent N
ANY nonnegative natural number, and A from the moderate bound.
All moments of v are finite by IsRapidDatum. Its constant
C_N depends on the fixed source context and moment order, not
on ell_I, h or I. Therefore
  H^N sum_(x in I) |T_x(h)|
     <= C_N (weightedNorm (N+A) v).toReal.
Take the supremum over all finite subsets (nonnegative terms).
The same bound holds for the whole absolute sum:
  height_T(h)^N sum_x |T_x(h)| <= C_N mom_(N+A)(v).       (U)
This is stronger than the actual source N=0 proof, with exactly
the same support/rapidity, and uses the same decay lemma rather
than a stable-range dimension hypothesis. It is not a new proof
of exists_norm_name_le or of the full-rank support construction.
No exchange of an infinite complex sum or choice of a global
measurable phase is required: the phases are only finite dual
tests at each h. The nonnegative sum is measurable from the
continuous native terms, the countable rational frame index,
and rational-equivariance (which permutes frames when changing
quotient representative). No assertion that one phase choice
works simultaneously for all h.

## 3. Actual exchange caller and weighted extension

Take N=0. On the SAME finite-volume quotient of U(T), the
nonnegative absolute sum is bounded by the finite constant
M=C_0 mom_A(v). Its lintegral is at most M times quotient
volume. This supplies HasIntegrableTerms with y=1 at
LowRankIdentity.thetaTerm_stdDatum_spec. Keep the finite
adaptedFrame support proof at that caller: the nonzero
determinant character forces an invertible y(K|I)N, and the
parabolic inverse block gives the right inverse for the actual
coordinate matrix at p. This is NOT the stable-range vacuum
argument and works without imposing stable range at the
noncoherent exchange stage.

More generally, for any measurable multiplier y on the
quotient with finite L1 norm,
  integral sum_x |T_x(h) y(h)| <= M integral |y(h)| < infinity.
For such a multiplier this proves the weighted integrability
guard, but the actual Fourier/stabilizer theorem's extra
continuity and left-invariance assumptions on y remain.
For y of polynomial height growth use (U) with sufficiently
large N, provided the applicable height lower bound and
quotient invariance/measurability are separately checked.
No arbitrary y is declared continuous or integrable.

Thus use the SAME guard for the actual centreCoeff expansion
and for invertible-Gram stabilizer unfolding. The latter still
requires Witt transitivity, the exact stabilizer quotient Haar
identity and the Gram-unit guard. This feeds character-box
RUN73 negative-complement vanishing, whose rank-one circle
proof is distinct. Keep real period, finite partner, top-of-
tower and scalar C normalization suppliers and all A/C gaps.
Original dependency graph unchanged. Reduced human branch:
LowRankIdentity -> HasIntegrableTerms <- {uniform moderate
bound, fixed-frame rational invariance, short isotropic vector,
full-rank support, uniform named-data decay, finite volume}.
No global node retirement. Cache key includes pin, S,T,D,g,
P,Ψ,φ,v, N, and the one denominator d; no reuse across changed
support or moment order. Do not use the RH theorem as premise.

## 4. Exact regression and native evidence

Local SymPy executed:
J=[[0,1,0],[1,0,0],[0,0,1]], k=e1,l=e2,i=e3,
C=[k i], symbolic 2x2 Z. Y=Z C^T J.
Verified Yk=0, Yl=Z[:,0], Yi=Z[:,1]; negative control
C=[l i] does not kill k. With complex rational terms
0,3+4i,-5+12i,8-15i,-7-24i, exact phases have modulus 1,
each phase-times-term equals its norm; sum exactly 60.
This checks algebraic orientations and cancellation only,
not a native model, height bound or analytic proof.

Lean and Lake absent locally (command -v). New probes/scalar
certificate below prepared only; actual uniform decay proof
not kernel-replayed. Latest actual shared native receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
on cathedral-research-state, blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six checks in TiltingLemma/Moments, each reports standard three
axioms; one module build timeout 124 after 2700.11s,
all_requested_checks_ok=false, full_RH_replay=false. No new
native PASS. Historical 4.33 engine CI does not certify 4.35
compact proof. No original graph or axiom record overwritten.

## Integration checkpoint

Editor 52a17e4e independently validates finite cutoff F3–F10
with local 2n<=M, and corrects the lead's Rallis shorthand:
the dominating L1 function is the ORIGINAL FULL product
Phi(g)=weilMatrixCoeff_b(f,f,g) Petersson(y',R(g)y), not the
bare coefficient. Cutoff multiplies this same product;
strict 2n<M remains for the Rallis caller. Adopt this correction
and retain the exact edge and sharpness assumptions. Do not
conflate this Rallis majorant with (U).

RESUME HERE: replay the source-matched uniform dual test at
FourierCoefficient.hasIntegrableTerms_integrated_name by
replacing N=0 with arbitrary N and keeping its actual support.
Audit exists_norm_name_le's uniformity and the named-data
translation modulus/compact fundamental domain argument;
then check thetaTerm_stdDatum_spec's exact support inverse
and quotient exchange callbacks. Integrate the existing
class-discriminant note §3 and ff5c7bc2 at the B weighted
count without duplicating their geometry. A/C remain open.
HANDOFF TO lead integration, character boxes, positivity,
independent audit, shared native runner. Preserve all pins
and unresolved obligations; no RH closure or new axiom claim.
-/

namespace RHIntegrationUniformDualTest

/-- Exact finite phase alignment is used before the norm bound. -/
theorem finite_phase_sum_bound {ι : Type*} (I : Finset ι)
    (z u : ι → ℂ) (B : ℝ)
    (halign : ∑ i ∈ I, u i * z i = ((∑ i ∈ I, ‖z i‖ : ℝ) : ℂ))
    (hbound : ‖∑ i ∈ I, u i * z i‖ ≤ B) :
    ∑ i ∈ I, ‖z i‖ ≤ B := by
  rw [halign, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (Finset.sum_nonneg fun _ _ => norm_nonneg _)] at hbound
  exact hbound

/-- A uniform nonnegative bound transfers to the same weighted integrand. -/
theorem weighted_absolute_bound (a b w : ℝ) (hab : a ≤ b) (hw : 0 ≤ w) :
    a * w ≤ b * w := mul_le_mul_of_nonneg_right hab hw

end RHIntegrationUniformDualTest

#check Space.Splitting.hasIntegrableTerms_integrated_name
#check Space.Splitting.centreCoeff_integral_eq_tsum
#check Space.Splitting.centreCoeff_eq_integral_stabilizer
#print axioms RHIntegrationUniformDualTest.finite_phase_sum_bound
#print axioms RHIntegrationUniformDualTest.weighted_absolute_bound
