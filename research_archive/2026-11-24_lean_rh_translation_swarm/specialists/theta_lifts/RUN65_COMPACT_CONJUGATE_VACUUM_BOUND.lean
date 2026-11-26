import New.Curve.ConjugatesOfJets
import Mathlib

/-!
# RUN65 — The uniform CM-conjugate vacuum bound at the actual A caller
26 November 2026. Human mathematical reconstruction, conditional on
the explicitly named primitive identities below. No new Lean PASS.

Mission: ONE_EQUATION_MISSION.md blob 9f4a2272265e847b3a46422b02d4b37e976bee10,
completion-first compact translation; lane 8 theta_lifts. Primary source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Prior pinned leanprover-community/riemann-hypothesis source and original
dependency graphs remain unchanged. Latest shared manuscript read:
9870fca9396c2306122e15b676aeef4b71233d74.

RUN64 11b88ad1e9d8bbd1ca18d92fcfeea432265ea2fd reconstructed the
aggregate archimedean chain. Peer kernel RUN38 ea889f2ba73d6b799b3e92dd4a303cab665b8f8a
has since supplied the Schur/Gram spectral and factorial-scale bridge.
Do not duplicate it. Peer integration 2ce507a254186b7c1453674eb2b9f1bc72fc1693
and structure RUN61 825590bbc046023da6d59ea5d5f9727abecc3615 supply the
finite semilinear multiplier and vacuum coefficient; retain them.
This run derives the quantitative bound on the moved conjugate vacuum,
uniform in all x,g,y, not just its finite evaluations.

## Exact source ledger
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
(lines 164–225, exists_semilinear_isJetConjugate).
New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1
(norm_intVacuum_le, norm_dataInner_le).
New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1
(exists_isJetConjugate_generator).
Lib/CM/Reciprocity/SemilinearWeilLaw.lean f0ceeb862976ee92b3dae11a122ce465901f7994
(multiplierRatio_sq).
Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1
(dataInner_rho, dataInner_omega, theta evaluation, vacuum coefficient,
hasSum_dataInner).
Lib/Weil/Construction/AdelicHeisenberg.lean 6d56fe0aa1762a56778d40f9086f69e721f91b14
(vacuumFn).
Lib/Adelic/Reduction/MinkowskiSecond.lean cc0f8a639dfe23caf2ca91b348a09628e60f814e
(archCoords, firstMinimum).
Lib/Adelic/Reduction/FirstMinimum.lean 701ad5475dc3fe1156447ce513009f9a57be6525
(one_le_firstMinimum).
Lib/Adelic/QuotientMeasure/Packing.lean 498aaa596eb8176d0ee865c61f94e8391a478f7a
(encard_le_of_separated, tsum_le_of_separated).
New/Data/WeilDataOfE.lean 8baa0621fbd228428a1226da1a8e98aa1251740d
(N1_mul_alpha_mem, WeilData.j).
New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185
(card_infinitePlace_E).
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
(Parameters.c).
New/Rows/MemberKernels.lean be36c0175fe559376780b105052249fc0c9f1f4f
(norm_jet_le_of_isAdmissibleComb, witness l3).
Cross-check: expanded source grh/src/New/UpperBound/Kernels/
JetConjugatesAndBounds.lean blob 561bb8cd39f7f1d3e1016ad7ee04b85160e3c50e
contains the corresponding expanded proof, using a stronger integral
trace separation. Do NOT assume that stronger result in this compact
reconstruction; the compact N1-scaled separation suffices.

## 1. The finite amplitude is bounded by the quotient mean

Keep the exact standard positive definite space V of rank n, field E,
sigma fixing K, N=N1(s), d=P.d>=1, C=generator-bound constant.
The same CM jet conjugation L intertwines finite translations by b
with b an adelic unit and sends the vacuum v to k omega(z)v, z a
unitary finite scalar. These are the preceding source suppliers,
not conclusions of this analytic estimate. Let I=intVacuum V=a0 v;
put A=sigma(a0)k, so L(I)=A omega(z)v.

The jet constant-coefficient identity applied to the translate
rho(finVec x) I gives
  (L I)(finVec (b x)) = sigma(I(finVec x)).
No assertion that sigma is continuous or preserves norms is needed.
Multiplication by b is bijective on finite vectors, hence the
generator's bound on sigma(I(finVec x)) transfers to EVERY finite
evaluation of L(I):
  |(L I)(finVec w)| <= exp(C N^2 n).
By norm_dataInner_le (the normalized quotient mean of squared values),
  |<L I,L I>| <= exp(2 C N^2 n).
Since v has inner norm 1 and omega is unitary for this inner product,
the left side is |A|^2. Thus |A| <= exp(C N^2 n).

The intertwiner on finite Weil operators has multiplier ratio q
with q^2 a quotient of values of the splitting character. Its
weight hypothesis implies both values, including the sigma image,
have absolute value 1. Therefore |q|=1 for this particular ratio.
Use the finite-part membership of I and stability under rho and omega:
  L(rho(finVec x) omega(g) I)
      = q A rho(finVec (b x)) omega(g z) v.
The translation in a point evaluation is just a shift and a phase
of modulus 1. Consequently it remains to bound omega(g')v at all
adelic arguments, with g'=gz. It would be incorrect to replace the
pointwise norm by the Hilbert norm of this unit vector.

## 2. Square the point evaluation BEFORE estimating its coefficients

For any g' and y', set f=rho(y')omega(g')v. The actual theta evaluation
identity gives theta(f)=(omega(g')v)(y'). Apply hasSum_dataInner with
both vectors f. The resulting sum is exactly
  |theta(f)|^2 = sum_{gamma in E^n}
                      <f,rho(V.vecAtPoint gamma) f>.
Conjugating the two inner-product arguments by rho(y') removes that
translation at the expense of ONE unit-modulus commutator character.
Conjugating by omega(g') then sends rho(u) to rho(g'^(-1)u).
By the normalized vacuum coefficient, for W=V.move g',
  |<f,rho(V.vecAtPoint gamma)f>|
     = |<v,rho(W.vecAtPoint gamma)v>|
     = |vacuumFn(W.vecAtPoint gamma)|.
No inequality has been taken before this exact phase and group
cancellation, and there is no term depending on y' left.

The vacuumFn definition is supported on
 T={gamma: alpha^(-1) W.vecAtPoint(gamma)_finite is integral}
and has modulus exp(-pi r_gamma^2/sqrt(d)) there, where
r_gamma=||W.archCoords gamma||. Indeed every infinite embedding used
in the CM type sends j to a number with imaginary part 1/sqrt(d),
and the remaining finite character has modulus one. Off T the
coefficient is zero. Thus the exact common pointwise estimate is
  |(omega(g')v)(y')|^2 <= sum_{gamma in T}
                               exp(-pi r_gamma^2/sqrt(d)).
The following summable majorant justifies the triangle inequality
for the infinite sum, not merely for a finite truncation.

## 3. N-scaled packing: a single analytic estimate with all constants

For gamma != delta in T, N(gamma-delta) belongs to the base lattice
of W by N alpha integral (finite coordinates linear, integral adeles
closed under subtraction and multiplication). It is nonzero, and
W is definite with one_le_firstMinimum. Hence
  ||N archCoords(gamma)-N archCoords(delta)|| >= 1.
In particular no unscaled separation or inverse-discriminant
estimate is assumed. The real dimension D of the ambient coordinate
space is 2 n #Phi. Since #Phi=towerDeg(s)*phi(N0)<=N1(s)=N,
D<=2Nn. Put M=Nn and H=D+1.

For t>=0 the number K(t) of r_gamma<=t is bounded by (1+2Nt)^D:
the open radius-1/2 balls around the N-scaled points are disjoint
and lie in the radius Nt+1/2 ball. Haar scaling by the real dimension
gives the bound for every finite subset and therefore for K(t).
In D=0 there is at most one point, so the formula remains valid.
The layer-cake identity for nonnegative summands gives
  sum exp(-H r_gamma)
    = integral_0^infty H exp(-H t) K(t) dt
    <= (1+2N)^D * H/(H-D) = (1+2N)^D * H,
using 1+2Nt <= (1+2N)exp(t). This is the compact packing lemma's
specialization and proves convergence as well as the constant.

Let a=sqrt(d)>0. Since pi>=2, the exact elementary square yields
  H r - pi r^2/a <= H r - 2 r^2/a
     = a H^2/8 - (2/a)(r-a H/4)^2 <= a H^2/8.
Thus a single aggregate bound is
  |(omega(g')v)(y')|^2 <= exp(a H^2/8) (1+2N)^D H.  (*)
The exponent 1/8 is an optional sharpening from pi>=2; the original
native bound is weaker. No inference depends on improving the
original bound or on the numerical value of pi.

If n>=1 then N<=M; D<=2M; H<=2(M+1). Also
  log((1+2N)^D H) <= D(2N+1)
     <= 2M(2M+1) <= 4(M+1)^2.
For n=0, D=0 and the log packing term is exactly 0, so the same
inequality holds. Consequently (*) gives
  |(omega(g')v)(y')| <= exp((sqrt(d)/4+2)(M+1)^2)
                      <= exp((2d+6)(M+1)^2).
Finally N^2 n <= (Nn+1)^2 for every natural n, and C>=0.
The definition c=P.c has c>=C+2d+6 with nonnegative remainder.
Combining sections 1-3 establishes the EXACT requested native
uniform bound with no enlarged budget and the same L:
  |L(rho(finVec x) omega(g) I)(y)| <= exp(c(Nn+1)^2).
The rank-zero case is covered, including the positive scalar guard.

## 4. Integration and remaining obligations

MemberKernels.norm_jet_le_of_isAdmissibleComb invokes
exists_semilinear_isJetConjugate for the positive definite hom space
of rank card(n' x n), R=empty and the SAME restricted automorphism
upsilon supplied by exists_algEquiv_norm_eq. Its l3 witness is
exactly the bound above; the jet identity l1 and scale |t|^2=1/Omega
are retained. In particular there is no change to the conjugated
polynomial, jet degree, Gaussian integral or Schur operator.
RUN64 and kernel RUN38 can therefore use the reconstructed analytic
supplier without a new hypothesis at their interface.

Original local graph:
 MemberKernels -> exists_semilinear_isJetConjugate ->
  generator/CM reciprocity, semilinear intertwining, norm_dataInner_le,
  hasSum_dataInner, first minimum, packing, vacuum coefficient.
Reduced HUMAN quantitative graph:
 finite evaluation -> quotient-mean amplitude;
 covariance + exact squared-evaluation sum -> supported Gaussian;
 N-scaled separation -> layer-cake majorant -> original c budget.
The normalized global theta functional/Parseval identity, CM generator
and integrality, actual Weil representation and multiplier law,
definite first minimum, and packing volume identity remain explicit
primitive dependencies, not proved by this scalar certificate.
No global root edge retired; original/reduced graphs and axiom
evidence are preserved. No RH theorem imported as a shortcut.
No URT premise used and no claim of novel mathematics. The expanded
source independently corroborates the method but is not a kernel
replay or proof of the compact scaled separation.

Native status: lean, lake, elan all unavailable on the actual local
PATH this run. No rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier
execution possible here. Read actual shared CI receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
(blob 088cd2ec0e935ee1a282f10096949bcf671cc804): six unrelated B/C
checks with only the three standard axioms, A module_1 exit 124
after 2700.11 s, overall false. This does NOT certify the new scalar
declaration below. Prepared independent exact scalar certificate
and source probes for existing compact runner; no synthetic tests
or unexecuted PASS. No workflow or upstream file edited.

RESUME HERE: independent audit of compact phase cancellation and
scaled separation, then integrate this and RUN38 into the actual
A short_forms height caller. Next distinct supplier: finite-part
generator's CM/frame integral section, checking actual common scalar
and every conjugation rather than repeating the finite multiplier,
or the remaining single-stage theta-kernel transfer if that CM
supplier is already completed by peers. Consult latest mission
and peer log first. Full RH proof remains incomplete in this
human reconstruction.
-/

namespace RHThetaRun65

/-- Exact scalar majorant used in the compact theta packing reduction. -/
theorem gaussian_linear_majorant (a H r : ℝ) (ha : 0 < a) :
    H * r - Real.pi / a * r ^ 2 ≤ a * H ^ 2 / 8 := by
  have hp : 0 ≤ (Real.pi - 2) * r ^ 2 :=
    mul_nonneg (sub_nonneg.mpr Real.two_le_pi) (sq_nonneg r)
  have hs : 0 ≤ (4 * r - a * H) ^ 2 := sq_nonneg _
  apply (mul_le_mul_left ha).mp
  calc
    a * (H * r - Real.pi / a * r ^ 2) =
        a * H * r - Real.pi * r ^ 2 := by
          field_simp [ne_of_gt ha] <;> ring
    _ ≤ a * (a * H ^ 2 / 8) := by nlinarith only [hp, hs]

end RHThetaRun65

#check RHThetaRun65.gaussian_linear_majorant
#print axioms RHThetaRun65.gaussian_linear_majorant
#check Parameters.exists_semilinear_isJetConjugate
#print axioms Parameters.exists_semilinear_isJetConjugate
#check Parameters.norm_dataInner_le
#check Space.hasSum_dataInner
#check Space.dataInner_rho_of_vacElem
