import New.Rows.MemberKernels
import Mathlib.Tactic

/-!
# RUN71 — compact CM conjugate uniform bound, actual A supplier
27 Nov 2026. Human mathematical reconstruction, conditional on the
explicit CM generator and foundational Weil identities below. No
new kernel execution. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob
9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first and unified
engine); protocol, handoff, expansion, AGENTS, manuscript
ea51739eda55a41749858377bc5635f7e9c49d41, RUN70, editor RUN74
327ee638, integration RUN74 55d81106, theta RUN73 784d021e checked
for coordination. Theta RUN73 is non-split local coefficient bound,
distinct from the archimedean supplier here.

## Source ledger (paths relative to grh-compact/src)
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0:
  exists_semilinear_isJetConjugate (actual final bound and its witnesses).
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1:
  norm_intVacuum_le, norm_dataInner_le, exists_intVacuum_ne_zero.
Lib/CM/Reciprocity/SemilinearWeilLaw.lean f0ceeb862976ee92b3dae11a122ce465901f7994:
  semilinear_intertwines_weil, multiplierRatio_sq.
Lib/Adelic/QuotientMeasure/Packing.lean 498aaa596eb8176d0ee865c61f94e8391a478f7a:
  encard_le_of_separated, integral_rpow_neg_le_of_layers, tsum_le_of_separated.
Lib/Adelic/Reduction/FirstMinimum.lean 701ad5475dc3fe1156447ce513009f9a57be6525:
  one_le_firstMinimum, firstMinimum_le.
New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d:
  N₁_mul_α_mem.
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834:
  Parameters.c.
New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1:
  exists_isJetConjugate_generator (retained, not proved here).
Readable companion at same pin grh/src/New/UpperBound/Kernels/
JetConjugatesAndBounds.lean 561bb8cd39f7f1d3e1016ad7ee04b85160e3c50e:
  useful matrix-coefficient explanation, but DO NOT copy its stronger
  unit-separation assertion to the compact proof. The compact proof
  uses scaled coordinates N₁ archCoords.

## 1. Same semilinear witness; scalar bound without a norm assumption.
Put N=P.N₁(s)≥1, r=card n, d=P.d≥1,
C=the generator theorem's chosen natural constant,
M=Nr+1, and θ°=intVacuum V=κ₀^r vac.
Retain the actual generator theorem, injectivity of nonzero-scale
Taylor series on finitePart, Heisenberg covariance, and the
semilinear Weil intertwining theorem with its actual central-character
hypothesis and conjugation-disjoint R. The native construction of L
uses a left inverse of the renamed jet map on finitePart: on each
generator translate it agrees with the supplied translated F', so
the inverse is applied only to its genuine image; linear spanning
extends the identity. It is not a claim that arbitrary formal series
are jets. The actual generator supplies the common B(σ), scale t
with |t|²=1/Ω and the generator images.
The resulting L satisfies the native covariance and jet laws.
Taking constant terms and using θ(ρ(finVec x)f)=f(finVec x)
gives Lθ°(finVec(Bx))=σ(θ°(finVec x)).
The intertwining theorem makes B a unit, so x↦Bx is bijective.
The product of rank-one vacuum values gives
 |Lθ°(finVec w)| ≤ exp(C N² r) for every finite w.
This uses precisely norm_intVacuum_le, NOT any continuity of σ.
Since L(vac)=k ω(1,z)vac, write A=σ(κ₀^r)k and
Lθ°=A ω(1,z)vac. The normalized quotient mean gives
 |dataInner(Lθ°,Lθ°)| ≤ exp(2 C N² r).
Indeed, squared modulus is invariant under the lattice translation
phases; the dense finite-coordinate test and continuity of the
datum extend the bound to the whole quotient, whose mean has mass
one (IntegralVacuum.norm_dataInner_le). Unitarity and
dataInner(vac,vac)=1 identify its left side with |A|², so
 |A| ≤ exp(C N² r).
Nonzero k follows from the same finite-value identity, injectivity of
σ and exists_intVacuum_ne_zero. The identity multiplierRatio_sq and
norm-one conjugates of the splitting character give |multiplierRatio|=1.
Translations and the other Heisenberg phase also have modulus one.
Thus the desired pointwise estimate reduces EXACTLY to |A| times
a moved unit vacuum, at the shifted argument. The same k,z,L serve
the final Schwartz–Bruhat clause; no separate choices for the bound.

## 2. Compact separation with the actual denominator.
Let W=V.move(1,g z) and
 T={γ∈E^n: α⁻¹ (W.vecAtPoint γ)_fin is integral in every coordinate}.
For distinct γ,δ in T the vector N(γ−δ) is in W.baseLattice:
factor the finite coordinate as (Nα) times an integral difference.
This is exactly N₁_mul_α_mem. It is nonzero because N≠0 in
characteristic zero. Definiteness gives firstMinimum≥1, hence
  ||N archCoords(γ)−N archCoords(δ)|| ≥ 1.
Do not infer ||archCoords(γ)−archCoords(δ)||≥1 from this.
Let h=real dimension of the archimedean space, D=h+1,
tγ=||archCoords γ||. Then h=2 r #Φ≤2Nr by the native
infinite-place count and Euler totient bound. The scaled points
have norms N tγ ≤ N exp(tγ).

## 3. Packing and summation, not a finite numerical surrogate.
For uγ=exp(tγ)≥1 and U≥1, the points with uγ≤U
fit in the ball of radius NU with pairwise distance at least 1.
Disjoint open balls of radius 1/2 give by volume scaling
 # {γ:uγ≤U} ≤ (1+2NU)^h ≤ (1+2N)^h U^h.
For h=0 separation permits at most one point and the same holds.
For any finite subset F⊂T, write
 uγ^(-D)=D∫_{uγ}^∞ v^(-D-1) dv.
Sum this nonnegative identity and use the counting bound:
 Σ_F uγ^(-D) ≤ D(1+2N)^h ∫_1^∞ v^(h-D-1)dv
 = (1+2N)^h D ≤ (1+2N)^h exp(h).
Taking the supremum over finite F proves summability and the
same bound on the full sum (no countability assumption needed).
This is the precise compact tsum_le_of_separated call with
m=1, R=N, exponent D and c=exp h; preserves the actual scale.

## 4. Matrix coefficients and comparison of exponents.
Retain the native theta square identity hasSum_dataInner,
unitarity, phase commutation, vacuumFn formula and the coordinate
identity norm_sq_eq. For f=ρ(y)ω(1,g z)vac, the coefficient
of γ in |θ f|² is zero off T; on T its norm is exactly
 exp(−π tγ²/√d), since commuting the translation gives only
a unit phase. In particular no absolute values are applied
before the representation cancellation.
For a=√d>0 and t=tγ,
 a D² − Dt + π t²/a =
 (t/2−aD)²/a + (π−1/4)t²/a ≥0.
Thus exp(−π t²/a) ≤ exp(aD²) exp(−Dt).
Absolute summability follows from §3; applying the triangle
inequality to the actual theta identity gives
 |ω(1,g z)vac(y)|² ≤ exp(√d (h+1)²)(1+2N)^h exp(h)
 ≤ exp(√d (h+1)²+(2N+1)h).
For h≤2Nr, N≥1 and r natural:
 √d(h+1)² ≤ 4d M² (√d≤d, h+1≤2M).
 (2N+1)h ≤ 6N²r ≤ 6M² (r≤r², also r=0).
Therefore the exponent is at most (4d+6)M², which is
≤2(2d+6)M², the original available allowance. Taking the
nonnegative square root yields the native sufficient bound
 |ω(1,g z)vac(y)| ≤ exp((2d+6)M²).
No optimization or alteration of Parameters.c is needed.
Since N²r≤M² and C≥0, combining §1 yields
 |L(ρ(finVec x)ω(1,g)θ°)(y)|
 ≤ exp((C+2d+6)M²) ≤ exp(P.c M²),
because the remaining summand in Parameters.c is nonnegative.
This establishes the actual uniform-bound conjunct conditional on
the retained generator/covariance, quotient and theta identities.
It discharges the packing, square-completion, scale comparison
and finite-to-global norm steps, not the CM generator theorem.

## Consumer and audit
Use this in RUN70 §1 (same σ, space Hom(I_n,I_n'), same finite g
and same admissible datum); its Gaussian and Schur stage estimates
then follow with no added archimedean size premise beyond the listed
foundations. Path: generator + jet injectivity + semilinear Weil
law -> scalar bound + compact separation -> packing and theta
identity -> uniform conjunct -> MemberKernels.norm_jet_le_of_isAdmissibleComb
-> RUN69 composite norm -> A short_forms -> star_inequality.
Original and reduced graphs/axiom evidence retained; no global
dependency deletion or theorem import as an RH shortcut.
Context key compact pin, P,s,V,σ,R, actual generator, same L,k,z,
N,r,d, moved point, normalized quotient measure. No URT used.
Still open here: reconstruct exact CM generator from tight frame
and CM theta conjugation, including its uniform algebraic
coefficient constant and scale; verify foundational identities and
native caller substitution; level-N Fourier-power supplier (check
latest theta/editor first). Do not claim entire A is closed.

Native evidence fetched actual state-branch
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six named TiltingLemma/
Moments checks with the three standard axioms; module_1_build
return 124 at 2700.11s; all_requested_checks_ok=false,
full_RH_replay=false. Local command -v lean/lake/elan empty.
No rh_scan/prune/reduce/auto/frontier or Lean certificate execution
this run; scalar certificates below prepared only. No new PASS.
RESUME HERE: New/Curve/ConjugateGenerator.lean, theorem
exists_isJetConjugate_generator: inspect exact nonzero frame
coefficient and CM conjugated Taylor-series equality before
attempting the global uniform constant; coordinate with theta,
then close level-N Fourier power if not already integrated.
HANDOFF TO integration, editor, theta, kernel and audit.
Human RH reconstruction incomplete.
-/

namespace AccelerationRun71

theorem gaussian_complete_square (a D t : ℝ) (ha : 0 < a) :
    -(Real.pi * t^2 / a) ≤ a*D^2 - D*t := by
  have hp : 0 ≤ Real.pi - 1/4 := by linarith [Real.two_le_pi]
  have h := mul_nonneg hp (sq_nonneg t)
  have h2 := sq_nonneg (t/2-a*D)
  apply (le_iff_sub_nonneg).2
  apply (le_of_mul_le_mul_right _ ha)
  calc
    0*a ≤ (Real.pi-1/4)*t^2+(t/2-a*D)^2 := by nlinarith
    _ = (a*D^2-D*t- -(Real.pi*t^2/a))*a := by
      field_simp
      <;> ring

theorem scaled_packing_radius (N t : ℝ) (hN : 0 ≤ N) (ht : 0 ≤ t) :
    N*t ≤ N*Real.exp t := by
  have h := Real.add_one_le_exp t
  exact mul_le_mul_of_nonneg_left (by linarith) hN

theorem exponent_budget (d M h N r : ℝ)
    (hd : 1 ≤ d) (hN : 1 ≤ N) (hr : 0 ≤ r) (hr2 : r ≤ r^2)
    (hh : 0 ≤ h) (hbound : h ≤ 2*N*r) (hM : M = N*r+1) :
    d*(h+1)^2+(2*N+1)*h ≤ 2*(2*d+6)*M^2 := by
  have hM0 : 0 ≤ M := by rw [hM]; positivity
  have h1 : h+1 ≤ 2*M := by rw [hM]; linarith
  have h2 : (h+1)^2 ≤ (2*M)^2 := by
    nlinarith [mul_nonneg (show 0 ≤ 2*M-(h+1) by linarith)
      (show 0 ≤ 2*M+(h+1) by linarith)]
  have h3 := mul_le_mul_of_nonneg_left h2 (show 0 ≤ d by linarith)
  have h4 : (2*N+1)*h ≤ (3*N)*(2*N*r) :=
    mul_le_mul (by linarith) hbound hh (by positivity)
  have h5 := mul_le_mul_of_nonneg_left hr2 (show 0 ≤ 6*N^2 by positivity)
  have h6 : 6*N^2*r^2 ≤ 6*M^2 := by
    rw [hM]
    nlinarith [mul_nonneg (show 0 ≤ N by linarith) hr]
  nlinarith [sq_nonneg M]

#print axioms gaussian_complete_square
#print axioms scaled_packing_radius
#print axioms exponent_budget
end AccelerationRun71

#check Parameters.exists_isJetConjugate_generator
#check Parameters.exists_semilinear_isJetConjugate
#check Parameters.norm_dataInner_le
#check Parameters.N₁_mul_α_mem
#check tsum_le_of_separated
#check Space.one_le_firstMinimum
#check Space.semilinear_intertwines_weil
#print axioms Parameters.exists_semilinear_isJetConjugate
