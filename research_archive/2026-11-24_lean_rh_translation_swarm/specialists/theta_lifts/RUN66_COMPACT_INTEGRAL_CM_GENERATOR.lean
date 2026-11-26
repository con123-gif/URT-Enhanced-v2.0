import New.Curve.ConjugateGenerator
import Mathlib.Tactic

/-!
# RUN66 — integral CM theta generator at the actual Theorem A caller
26 November 2026. Human source-matched derivation, with primitive inputs
explicitly retained and independent scalar certificates prepared (not compiled).
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Primary source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; completion-first.
Manuscript d6bcd68693074c5d4220541d68c61a222287cb42.
Prior theta RUN65 44a5d463; kernel RUN39 e1c6215b already audits
the semilinear/quotient amplitude and finite multiplier steps; do not
repeat them. Integration RUN65 059f9ed6 and acceleration RUN63 f2750806
read; the general-length frame construction is already peer work.
This run instead reconstructs the torsion-height argument and the
specific frame-to-integral-generator supplier used by ConjugateGenerator.

Source ledger, relative to grh-compact/src:
* Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
  norm_disc_eq_one, naiveHeight_spec, norm_monomialSection_le,
  norm_translate_le_naiveHeight_pow.
* New/Curve/FrameSections.lean 6bc331571971534045115e265473cfa148de9f14:
  taylor_line_eq_subst_jetSeries, jetSeries_eq_prod,
  exists_finitePart_of_isTightFrame.
* New/Curve/TightFrameExists.lean 4f2e76afa45ba54fe9040704b505b2da1865f2b4:
  coe_trace_eq_sum, herm_mem_quadInt, isTightFrame_zeta_pow.
* Lib/Weil/Construction/FockThetaFunctions.lean 80c7d6ba1d8942e206e7420f62e85d0209c56ae4:
  exists_entireTheta_eq, exists_finiteImage_approx, entireTheta_translate_finiteImage.
* Lib/Weil/Construction/ConjugateJetDefs.lean bdc5981f77f6b2e3f94b757118ea664a7a1f08:
  VacuumExpansion, IsJetConjugate.
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
  complex_multiplication_theta, chowla_selberg.
* New/Curve/PeriodDefs.lean 7dcfa329642087071f8bc9f1976e004eb7fb20ef.
* New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1.
Expanded same-pin cross-check grh/src/New/Derivatives/Vacuum/IntegralVacuum.lean
f735c9a79aafe8d2e5b135e2dfebfaa7871dff5c, its zetaCoord and IsThetaProduct.
The compact VacuumExpansion has a larger index count than some expanded
Fourier formulas; use the compact count, not the smaller expanded one.

## 1. Tate's trick: eliminate the unknown section bound exactly

Fix the native prime d = 7 mod 8, p-adic embedding iota, CM curves
C,C', isogeny a of degree q (the native zero-map q=0 is also allowed),
and y torsion on C' with k y in its lattice, k>0. Let h,h' be the
native naive heights. Retain the primitive good-reduction identities
h>0, h(2z)=h(z)^4 and the monomial bound from naiveHeight_spec.
For the twisted translation write
 u_y(w)=exp(-H'(y,w)-H'(y,y)/2)
and define
 R_a(z)=|iota u_y(az)| h'(az+y)/h(z)^q,
 R_1(w)=|iota u_y(w)| h'(w+y)/h'(w).
These are positive. Both ratios are bounded above: for f=theta
or sigma, f^(2k) is a degree-2k section and its twist by y is
again a section, since 2k*y lies in the original dual lattice
(equivalently y lies in the dual for the degree-2k form).
Pullback along a is a degree-2kq section (use the actual
comp_mul_mem_sections). Every section lies in the finite complex
span of the monomial sections, so its p-adic value divided by
the corresponding height power is bounded, using the maximum
of finitely many coefficient norms. Taking positive 2k-th roots
bounds each of the two constituents of R_a, hence R_a itself.
Apply the same argument to the identity isogeny for R_1.
For q=0 the pullback is a constant section of degree zero; no
division by q is used.

Now use the exact exponential identity BEFORE applying iota:
 u_y(2w) u_y(2w+y) = u_y(w)^4.
It follows by expanding H'(y,2w+y) additively: both exponents are
-4H'(y,w)-2H'(y,y). This needs no assertion that iota is continuous
or respects exp, only that it respects multiplication and powers.
Cancellation of the intermediate h'(2az+y) and exact doubling give
    R_a(z)^4 = R_a(2z) R_1(2az+y).                 (T)
Let S=sup R_1, A=sup R_a. Both are finite and strictly positive.
Taking sup in (T) first for the identity gives S^4<=S^2, hence
S<=1. Then for a, A^4<=AS<=A, hence A<=1.
No maximum need be attained. Thus whenever |iota g(w)|<=h'(w)^m,
  |iota ((U_y^m g)(az))|
     <= (|iota u_y(az)| h'(az+y))^m <= h(z)^(mq).
This is the exact original Tate bound, including the zero-map
consumer q=0 and m=0. The section-span and good-reduction
identities are retained, not derived from the supremum argument.
In particular we do not use an unproved CM height bound at infinity.
The scalar lemma below certifies the final supremum inference once
the exact boundedness and identities have been supplied.

## 2. Actual frame product, including the torsion denominator

Write A0=sqrt(2*pi/sqrt(d)) and delta*bar(delta)=Q>0.
Let w_i with multiplicities m_i be the native tight frame of
length M, so sum_i m_i Phi_tau(w_i) conjugate(Phi_nu(w_i))
=M delta_(tau,nu). Let a in the CM lattice and
area(C)=|a|^2 M sqrt(d)/(2Q). Put b=a/bar(delta).
For each coordinate j define
 L_ij(z)=(b/A0) sum_tau conjugate(Phi_tau(w_i)) z_(tau,j).
The curve Hermitian form is (pi/area(C))*conj(u)*v. Directly
expand the pullback forms and sum BEFORE estimating:
 sum_ij m_i H_C(L_ij u,L_ij v)
  = pi*|b|^2*M/(area(C)*A0^2) sum_(tau,j) conj(u_tau,j)v_tau,j
  = sum_(tau,j) conj(u_tau,j)v_tau,j.
The factor is exactly one, by Q and the area identity.
At realImage gamma, L_ij is b times the trace
Tr_{E/K}(gamma_j*bar(w_i)), since the native realImage has
factor A0. At bar(delta)*gamma the scalar becomes a, so for
finiteImage gamma integral, the actual herm_mem_quadInt puts
this trace in O_K. Multiplication by a therefore lands in
the curve lattice. The product of monomial sections of degrees
m_i has the canonical normalized translation rule on the
bar(delta)-scaled ideal lattice: the Riemann forms add by the
displayed pullback identity and canonical multipliers multiply,
since they are exp(pi i E(b0*x,x)) and b0 is the native
K-scalar conjugate traceOne, commuting with the K-linear forms.
This is the input to exists_entireTheta_eq. Its conclusion supplies
one F in finitePart and the VacuumExpansion; it is not assumed
that a general entire function is a theta vector.

Translate by any rational gamma. The exact shift formula and
the same pullback identity express its theta as the product
of the curve monomials twisted by
 y_ij=-b Tr_{E/K}(gamma_j*bar(w_i)).
For an arbitrary finite x choose rational gamma with the
SAME translated F by exists_finiteImage_approx. Choose a
positive integer k clearing finiteImage gamma into the integral
lattice. Then k Q y_ij=-a*delta*Tr(k gamma_j*bar(w_i)) lies
in the curve lattice, by herm_mem_quadInt and delta in O_K.
This is the exact torsion condition; no assumption that kQ is
prime to p. Evaluate section 1 at the zero isogeny and z=0:
 |iota ((U_yij^mi monomial_ij)(0))| <= 1.
Multiplying these bounds gives |iota F(finVec x)|<=1, for
EVERY p and every embedding, using one fixed F. This discharges
the arithmetic inference at exists_finitePart_of_isTightFrame
rather than presuming integrality from tightness alone.

## 3. Jet formula and cancellation of the conjugate lattice level

The translated entire function is exactly the product just found.
Its Taylor series at c*z is the product of the single-variable
Taylor series substituted at c L_ij(z). One rigorous check is
to restrict to z=t*v, compare each homogeneous coefficient
of t using the ordinary Taylor product/chain rule, then use
polynomial identity over C as v varies. This retains the
native taylor_line_eq_subst_jetSeries (Gaussian differentiation
under the integral) identifying the entire Taylor series with
V.jetSeries, and the finitePart hypothesis.

In ConjugateGenerator write N=N1(s), not Q. The frame consists
of all N powers of zeta, each repeated N times: M=N^2.
For the original curve delta=N, a=Omega0; for its conjugate
delta=N*e_sigma, a=Omega_sigma*e_sigma, where e_sigma>0
comes from complex_multiplication_theta. In BOTH cases
  b=a/bar(delta)=Omega_curve/N.
Thus both jet products have N^2 factors per rank coordinate,
with no factor e_sigma in their linear forms. Define
 t_kj=-Tr_{E/K}(gamma_j*bar(zeta^k))/N in K.
For any one rational gamma all t_kj form a finite set S in K.
The exact CM theorem supplies a common a_S for these curve
translations simultaneously, mapping each Taylor series of
U_(Omega0*t_kj)theta to U_(Omega_sigma*a_S*t_kj)theta'.
Enlarge S to contain those finitely many t_kj and use its
cluster property to choose a_S sufficiently close to beta_sigma
that the corresponding finite translate of F' equals its
translate by beta_sigma on the given gamma; this is possible
by local constancy and continuity of the map from the finite
adele of K to the finite vector space. Trace is K-linear, so
t_kj(a_S*gamma)=a_S*t_kj(gamma). There is no continuity of sigma
on C used here, and no separate a_S for different factors.

Under sigma the conjugated coefficient of the old linear form
is sigma(periodFactor)/N times sigma(conj(Phi_tau(zeta^k))).
Since sigma fixes K, the embedding restricted to E is the
permuted embedding placePerm, and conjugated embeddings agree
on the root-of-unity inverse. Set
  t = sigma(periodFactor)*A0/Omega_sigma.
The new coefficient is (Omega_sigma/N/A0)*t times the same
permuted root-of-unity inverse, exactly equal to the old one.
This proves the actual jet product equality on rational gamma.
Extend to all finite vectors by density and local constancy of
both translated vectors; this is not an analytic continuation
of a field automorphism. The uniform B(sigma) is the inclusion
of beta_sigma from the CM theorem, independent of rank and
of gamma. The scale norm, using the two exact period inputs
and area(C^sigma)=|Omega_sigma|^2 sqrt(d)/2, is
  |t|^2 = pi*|sigma(vacuumRoot)|^2 /
                (area(C^sigma)*|sigma(u0)|^2)
        = rootDiscr(E)/(2*pi*exp(chowlaSelbergConst(d)))
        = 1/bigOmega(P,s).
Retain the native norm_gal_vacuumRoot and chowla_selberg,
not an assumed Galois norm isometry.

## 4. Common integral scaled vacuum, no division by the orbit size

For e=1 the original product F has theta(F)=1 since theta_C(0)=1.
Use its actual VacuumExpansion: with J=N^(4*f*n)>0,
  sum_j m*l(rho(x_j)vac) rho(-x_j)F = J*l(F) vac
for every complex linear l. Here f is the number of infinite
places, n is rank, and m is the natural multiplier.
Taking l=theta and applying the linear functional <vac,-> to
both sides shows some <vac,rho(-x_j)F> is nonzero, because
the right side is J (vacuum norm squared is 1). In particular
m is nonzero. Fix such j0 and take
  l(v)=m^(-1)<vac,rho(-x_j0)v>.
Then c=J*l(F) is nonzero and the expansion expresses c*vac
as a sum of translates of F with coefficients
<vac,rho(-x_j0)rho(x_j)vac>. By the actual finite Heisenberg
law and vacuum coefficient these are zero or roots of unity,
including the commutator phase. Thus the p-adic ultrametric
triangle gives integrality of c*vac at all finite points,
using section 2 (further translation only adds a root-of-unity
factor). No division by J or m is used to prove integrality
of a value; m^-1 in l cancels algebraically before evaluating.
The same identity also puts vac in the complex span of
translates of F; invariance of that span under rho and the
definition of finitePart give the required spanning property.

For the archimedean bound, retain the exact finite family
of conjugate curves: a1 is algebraic from its all-place
integrality and the native algebraicity criterion; the
compact union in ConjugateGenerator supplies a common M0>=1
bounding the absolute translated theta values on these curves.
For every finite evaluation of sigma(F), meaning sigma applied
to its value, the jet constant coefficient and the target frame
product give |sigma(value)|<=M0^(N^2*n), via rational
approximation of the target translate. Conjugating each
vacuum-expansion term, roots of unity remain of modulus 1.
Thus
  |sigma(c*vac(finVec x))| <= N^(4*f*n) M0^(N^2*n)
       <= exp((4+log M0)*N^2*n)
using f<=N and log N<=N. Choose a natural C>=4+log M0,
independent of s and rank, as required by the native generator.
Rank zero has empty products and J=1; no rank division.
This is the exact common scale bound, not a pointwise-dependent
choice of c or C. It supplies the generator input retained
by theta RUN65 and kernel RUN39 at exists_semilinear_isJetConjugate,
and hence at MemberKernels.norm_jet_le_of_isAdmissibleComb.

## Dependency and verification
Original local graph: ConjugatesOfJets -> ConjugateGenerator ->
{FrameSections, complex_multiplication_theta, chowla_selberg,
norm_gal_vacuumRoot, compact conjugate-family bound}; FrameSections
-> {herm_mem_quadInt, exists_entireTheta_eq, norm_translate_le_naiveHeight_pow,
Taylor/Fock identification}; Tate -> {good reduction, section span,
torsion/ isogeny section law}. Human reduced graph: same CM and Fock
primitives -> exact tight-frame pullback + Tate ratio -> integral F ->
finite trace-product identity + orthogonality -> common integral
scaled vacuum and conjugate jet generator. Context cache key:
compact pin, P,s,V, same sigma, delta,Q, curve, frame and p-adic
embedding; do not reuse the identity at unrelated levels without
checking its area relation. No global root edge retired. Retain
good-reduction quartic and discriminant proof, section-span theorem,
CM reciprocity/class-group and Chowla–Selberg proof, arithmetic
herm_mem_quadInt, Fock inversion/orthogonality, compact-family and
Gaussian Taylor foundations as named OPEN or established only via
their actual source or verified external theorem. The reduction
here is human source-matched, not a claimed new proof of these
primitive theorems. No RH theorem imported, no URT assumption,
no deletion or overwrite of original/reduced graph or axiom evidence.

Execution: command -v lean/lake/elan found none. Actual shared native
receipt status a56e2d3afb99ed8275e81fd63c8494306e57c43f and
targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804, state
branch, run 45803534769: six B/C named probes standard axioms,
A build 124 at 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. No local native engines executed; old-pin
engine CI does not certify compact replacements. Certificates and
actual source probes below are prepared only, no new PASS.
No synthetic tests needed for this derivation.
RESUME HERE: audit section 2 multiplier compatibility and section 4
against actual FrameSections and VacuumExpansion (especially phase
orientation); derive the CM compact-family and conjugate period
primitive from its actual source or an exact published theorem,
then discharge the finite Fock orthogonality supplier. Retain
the good-reduction/discriminant and section-span foundations for
literature audit. HANDOFF TO integration, editor, kernel and
literature lanes. Human RH reconstruction incomplete.
-/

namespace ThetaRun66

theorem exponent_double_product (u v : ℂ) :
    (-(2*u+v/2)) + (-(2*u+v+v/2)) = 4*(-(u+v/2)) := by ring

theorem tate_supremum_step (S A : ℝ) (hS : 0 < S) (hA : 0 < A)
    (hSS : S^4 ≤ S^2) (hAS : A^4 ≤ A*S) : S ≤ 1 ∧ A ≤ 1 := by
  have hs : S ≤ 1 := by
    by_contra! h
    have h1 : 0 < S^2 := by positivity
    have h2 : 0 < S^2 - 1 := by nlinarith
    nlinarith [mul_pos h1 h2]
  refine ⟨hs, ?_⟩
  by_contra! h
  have h1 : A*S ≤ A := by nlinarith [mul_nonneg hA.le (sub_nonneg.mpr hs)]
  have h2 : 0 < A^2 - 1 := by nlinarith
  have h3 : 0 < A^2 := by positivity
  have h4 : A ≤ A^2 := by nlinarith [mul_pos hA (sub_pos.mpr h)]
  nlinarith [mul_pos h3 h2]

theorem level_cancel (N e omega : ℂ) (hN : N ≠ 0) (he : e ≠ 0) :
    omega*e/(N*e) = omega/N := by field_simp

#print axioms exponent_double_product
#print axioms tate_supremum_step
#print axioms level_cancel
end ThetaRun66

#check CMLattice.norm_translate_le_naiveHeight_pow
#print axioms CMLattice.norm_translate_le_naiveHeight_pow
#check Parameters.exists_finitePart_of_isTightFrame
#check Space.VacuumExpansion
#check Parameters.exists_isJetConjugate_generator
#print axioms Parameters.exists_isJetConjugate_generator
