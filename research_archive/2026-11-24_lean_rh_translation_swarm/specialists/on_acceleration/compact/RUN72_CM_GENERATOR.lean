import New.Curve.ConjugatesOfJets
import Mathlib.Tactic

/-!
# Run 72 — CM generator, common finite-adele witness and uniform vacuum scale
2026-11-27. Human derivation conditional on explicitly retained suppliers.
Compact pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript
29820c25acc91450aa8ec712774b57b3d0051c41. Read current protocol,
handoff, AGENTS, expansion, Run71 and integration Run75; this is the
CM supplier of Run71, not the separate Ribet or URT lanes.

## Source ledger (paths relative to grh-compact/src)
* New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1:
  Parameters.exists_isJetConjugate_generator (actual target).
* New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14:
  Parameters.exists_finitePart_of_isTightFrame.
* New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4:
  isTightFrame_zeta_pow, coe_trace_eq_sum.
* Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1a1f08:
  Space.VacuumExpansion.
* Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
  dataInner_rho_of_vacElem, theta/translation evaluation.
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  CMLattice.complex_multiplication_theta, chowla_selberg.
* Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52:
  galConjugate, exists_taylorVia_twistedTranslate_theta.
* Lib/CM/Genus/QuadraticZeta.lean 51f575a20ca3dc4831d287d2f14f597586b96fff:
  classGroup_sq_bijective, isAlgebraic_of_padic.
* Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
  norm_a₁_le_one.
* Lib/Shimura/ComplexTheta/ThetaDimension.lean ed569261cc7a60fb2f0b0acc12f804a7201ee34e:
  IsAppellHumbert.isCompact_range_norm_thetaShift.
* Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  theta normalization and curve structure.
* New/Curve/PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef:
  vacuumRoot, periodFactor, areaScale, jetScale, bigOmega.
* Lib/Weil/Construction/FockThetaFunctions.lean 80c7d6ba1d8942e206e7420f62e85d0209c56ae4;
  Lib/Shimura/GoodReduction/ThetaOrthogonality.lean 759f783ca424063e815a89a9626fed7be4eba028:
  retain underlying theta existence and vacuum expansion.
* New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0:
  exists_semilinear_isJetConjugate (consumer).
* New/Curve/IntegralVacuum.lean c34fe7625b03009fbd5954ea00209b425ca603b1:
  rank-one choice and higher-rank products.

The readable companion grh/src/New/Derivatives/Vacuum/IntegralVacuum.lean
f735c9a79aafe8d2e5b135e2dfebfaa7871dff5c was compared, but its
different index size and neighborhood formulation were NOT substituted.

## 1. One CM witness for all finite coordinates

Fix P and an automorphism sigma fixing K. Let D be its chosen conjugate
CM curve. Retain the finite-set torsion Taylor-series conjugacy
exists_taylorVia_twistedTranslate_theta. By the scaled-ideal
description and bijectivity of squaring in the class group (prime d
congruent to 7 modulo 8), write the lattice of D as w*c^2 for a nonzero
integral ideal c of K and w nonzero. Put e=Norm(c)>0, Omega=w*e.
Since e belongs to c, Omega*e belongs to D's lattice. The area is
|w|^2 Norm(c)^2 sqrt(d)/2 = |Omega|^2 sqrt(d)/2.

For each finite S in K, the finite-set conjugacy supplies v_S in
the lattice of D such that all torsion Taylor identities for q in S
hold with translate q*v_S. Set a(S)=v_S/Omega. Since c^2 is integral,
a(S) lies in e^-1 O_K. Its finite-adele images lie in the compact set
e^-1 O_hat_K, so the net directed by inclusion of finite S has a cluster
point beta. Thus for every neighborhood U of beta and every finite T,
there is S containing T with a(S) in U in the finite adeles. This
matches the compact MapClusterPt statement, and is stronger than
choosing unrelated scalars for different coordinates. Set
B(s,sigma)=finAdeleIncl(beta) in the finite adeles of E_s.
No invertibility of B is used here. All choices precede V.

## 2. Frame specialization and exact jet conjugacy

Write N=P.N₁ s, f=number of infinite places of E_s, r=rank V.
N>=1 and f<=N. Use the N roots zeta^k, k=0,...,N-1, repeated N
times, so there are N^2 frame entries, each now of multiplicity one.
For embeddings tau,upsilon the Gram sum is N^2 if they coincide,
zero otherwise, by the geometric sum and distinct images of zeta.
Use the frame-section theorem for the degree-one theta section.
For the original curve use delta=N, a=Omega_0; for D use delta=N*e,
a=e*Omega. The area requirement reduces, before any estimate, to
(e|Omega|)^2/(N e)^2 * N^2 sqrt(d)/2 = |Omega|^2 sqrt(d)/2.
Both frame-section products therefore have the same number N^2*r of
factors. Call their finite-part vectors F and F'. At zero, theta(F)=1.

For a rational vector gamma in E^r, the shift of the kth factor in
coordinate i is Omega_0*q_ki(gamma) or Omega*q_ki(gamma), where
q_ki(gamma)=-Tr_{E/K}(gamma_i*star(zeta^k))/N belongs to K.
In particular q_ki(a gamma)=a q_ki(gamma) for a in K. The finite set T
of all such traces is fixed for this gamma. Local constancy of the
finite-part translates of F' gives a neighborhood U of beta on which
the translate by incl(b)*finiteImage(gamma) equals the one by B*gamma.
Choose S containing T and a(S) in U using section 1. Thus the single
rational vector a(S)*gamma gives EXACTLY the required translate of F'.
Each corresponding univariate theta Taylor series is conjugate by the
same sigma by the finite-set CM theorem.

Write A=areaScale and s1=periodFactor. The linear form coefficients
for the original at jetScale=s1*A/Omega_0 are
s1/N * conj(Phi_tau(zeta^k)) in the ith coordinate, zero elsewhere.
Choose t=sigma(s1)*A/Omega for the conjugate. Its linear form
coefficients are sigma(s1)/N * conj(Phi_tau(zeta^k)). The automorphism
commutes with star on the CM field E and permutes the places; no
commutation with complex conjugation on arbitrary C is assumed.
After the prescribed inverse place permutation, the forms correspond.
Coefficientwise sigma commutes with products and substitution of
zero-constant formal series. Multiplying the N^2*r identities proves
IsJetConjugate on rational finiteImage points. Both translates are
locally constant in the finite-adele variable, so density extends
this equality to every x. This does NOT require continuity of sigma.

## 3. Recover one nonzero vacuum scalar and spanning

Retain the actual VacuumExpansion from the original frame:
for finite nonempty J, shifts x_j, natural m, and each linear form l,
sum_j m*l(rho(x_j)vac)*rho(-x_j)F = |J|*l(F)*vac.
Here all rho are at finVec, and |J|=(N^2)^(2*f*r)=N^(4*f*r).
This is the compact index; the readable companion has a different
count. With l=theta and theta(F)=1, pair with vac, using inner product
linear in its second argument and <vac,vac>=1. Some j has
A_j=<vac,rho(-x_j)F> nonzero, since otherwise the left side is zero
and the right side is |J|. The same identity implies m nonzero.
Now take l=m^-1*<vac,rho(-x_j)(.)>. Cancel m exactly to obtain
c*vac = sum_k <vac,rho(-x_j)rho(x_k)vac>*rho(-x_k)F,
c=|J|*A_j/m nonzero.
At finite points the Heisenberg law and vacuum matrix coefficient
reduce each coefficient to zero or a phase of finite order. Evaluation
of the translated F gives a finite value of F times such a phase.
These phases have p-adic norm one and archimedean norm one after
any conjugation. Thus all p-adic norms of c*vac at finite points
are <=1 by the ultrametric inequality and the retained frame-section
integrality of F. The same c works for all places and sigma, not a
new choice after conjugation. Dividing the vector identity by c
puts vac in the span of translates of F; Heisenberg covariance
makes the span stable under further translations. This spans the
finite part because vacuum translates generate it, without an
extra irreducibility assumption. Conversely the F translates belong
to the finite part.

## 4. Uniform conjugate bound with the correct compact index

The retained integral invariant bound norm_a₁_le_one and
isAlgebraic_of_padic give a rational polynomial annihilating a₁(C).
Its finite root set contains every sigma(a₁(C)). For roots realized
by CM lattices, choose the lattice by the same existential predicate
as the source galConjugate definition (proof irrelevance of the
existence proof). For each such lattice the norm of a degree-one
theta shift at zero has compact range by the Appell-Humbert
compactness lemma: its norm is periodic and continuous on the compact
torus. The union of these finitely many compact ranges is bounded by
M, which may be taken nonnegative. Hence M is independent of s,r,
sigma and all torsion translations.

The constant terms of section 2 show that each conjugate finite
value of F is a finite value of F' at B*x. Use local constancy to
evaluate it at a rational finiteImage point, where it is a product
of N^2*r shifted theta values of D. Thus its norm is at most
exp(M*N^2*r), since M<=exp(M). Apply the ordinary triangle inequality
to the SAME vacuum expansion of section 3:
|sigma(c*vac(x))| <= N^(4*f*r)*exp(M*N^2*r)
                 <= exp((M+4)*N^2*r).
The last step uses log N<=N and f<=N, with the exact slack
(M+4)N^2r-(4frN+MN^2r)=4Nr(N-f)>=0.
Consequently C=Nat.ceil(M)+4 works uniformly, including r=0.
This supplies the actual compact constant, not the +2 from the
readable alternative.

## 5. Scale normalization

Write s0=vacuumRoot, u0=the Chowla-Selberg unit, s1=s0/u0.
Retain the source norm of sigma(s0)^2 (squared absolute value)
=rd_E/sqrt(d), and the precise Chowla-Selberg normalization
area(D)*|sigma(u0)|^2=pi*exp(ell)*(2*pi/sqrt(d)).
Here ell is the source Chowla-Selberg exponent. As |A|^2=2*pi/sqrt(d)
and area(D)=|Omega|^2 sqrt(d)/2,
|t|^2 = pi*|sigma(s0)|^2/(area(D)*|sigma(u0)|^2)
      = rd_E/(2*pi*exp(ell)) = 1/bigOmega.
All period factors cancel before taking any estimate; sigma is never
applied to pi in this calculation.

## Actual consumer and dependency status

Original source-level route:
finite-set CM conjugacy + odd class-group/ideal description
 -> complex_multiplication_theta
 -> exists_isJetConjugate_generator
 -> exists_semilinear_isJetConjugate
 -> Run71 uniform bound -> Run70 stage -> Run69 global -> A -> star.
Other original suppliers: frame construction, theta existence,
vacuum expansion, local heights, phase and matrix coefficients,
algebraicity/compactness, Chowla-Selberg and vacuumRoot norm.
Reduced human route: sections 1--5 replace the assembly of the
generator, with the above suppliers retained. The rank-one scalar
choice is the one used in IntegralVacuum, not a different
normalization. No global dependency edge or axiom removed, no
original graph modified, no claim of native proof-term reachability
beyond the source-level consumers. Cache context: compact pin,
P,s,V,rank,sigma,e,frame,same c,B,F,F',t. No URT.

Outstanding: finite-set CM torsion-series conjugacy in
ConjugateCurve, exact theta orthogonality/vacuum expansion and
local-height inputs in the frame-section theorem, exact
Chowla-Selberg/vacuumRoot suppliers, independent audit, native replay.
No new RH theorem imported as a shortcut; the bound is an actual
conditional A supplier, not the prime window itself.

## Execution and CI
Local command -v lean/lake/elan: none. Python SymPy exact symbolic
cancellation executed for the area factor, scale quotient and
exponent slack; all three assertions succeeded, not a Lean check.
Actual CI artifact cathedral-research-state:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Six checks (3 TiltingLemma, 3 Filling.Moments) with standard axioms
propext, Classical.choice, Quot.sound; module_1_build timeout 124
at 2700.11s, all_requested_checks_ok=false, full_RH_replay=false.
No native rh_scan/prune/reduce/auto/frontier on this compact run;
old-pin baseline engine results not relabeled as compact verification.
The following scalar certificates and source probes are prepared,
uncompiled. No fresh native PASS. No synthetic speed benchmark.

RESUME HERE: read Lib/CM/MainTheorem/ConjugateCurve.lean
exists_taylorVia_twistedTranslate_theta, isolate the finite torsion
lift and exact translation/Taylor normalization. Then discharge
theta orthogonality or coordinate the already exposed level-N
Fourier-power supplier with theta lane. Preserve the common scalar
and all unresolved suppliers; don't rerun this assembly.
-/

namespace AccelerationRun72

open scoped BigOperators

theorem area_factor (N e a d : ℝ) (hN : N ≠ 0) (he : e ≠ 0) :
    (e*a)^2 / (N*e)^2 * N^2 * d / 2 = a^2*d/2 := by
  field_simp
  <;> ring

theorem period_scale (R D p E : ℝ) (hD : D ≠ 0) (hp : p ≠ 0) (hE : E ≠ 0) :
    ((R/D)*p)/(p*E*(2*p/D)) = R/(2*p*E) := by
  field_simp
  <;> ring

theorem exponent_budget (N f r M : ℝ) (hN : 0 ≤ N) (hr : 0 ≤ r) (hf : f ≤ N) :
    4*f*r*N + M*N^2*r ≤ (M+4)*N^2*r := by
  have h := mul_nonneg (sub_nonneg.mpr hf)
    (mul_nonneg (mul_nonneg (show (0:ℝ) ≤ 4 by norm_num) hr) hN)
  nlinarith only [h]

theorem nonzero_pairing {I : Type} [Fintype I] (a w : I → ℂ)
    (k : ℂ) (hk : k ≠ 0) (h : ∑ i, w i * a i = k) :
    ∃ i, a i ≠ 0 := by
  by_contra! hn
  have hz : (∑ i, w i * a i) = 0 := by simp [hn]
  exact hk (h.symm.trans hz)

#print axioms area_factor
#print axioms period_scale
#print axioms exponent_budget
#print axioms nonzero_pairing
end AccelerationRun72

#check Parameters.exists_isJetConjugate_generator
#check Parameters.exists_finitePart_of_isTightFrame
#check CMLattice.complex_multiplication_theta
#check Space.VacuumExpansion
#print axioms Parameters.exists_isJetConjugate_generator
