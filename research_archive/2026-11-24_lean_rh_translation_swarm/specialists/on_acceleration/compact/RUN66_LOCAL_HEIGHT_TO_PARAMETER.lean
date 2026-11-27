import Lib.CM.LocalHeight.IsogenyIntegrality
import Lib.CM.KroneckerLimit.LogTheta
import Lib.CM.FormalGroup.FormalHeight
import New.Curve.FormalParameter
import Mathlib.Tactic

/-!
# RUN66 — local height to the actual marked parameter, without a new height assumption
27 November 2026. Source-matched human derivation; independent audit and native
replacement replay outstanding. Credit Levent Alpöge, Luke Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; latest manuscript
1a5e180894e9f437ed9454097c99896366afc188. RUN65 d096310c retained.
Editor f90ecb3c already integrated kernel peer 02d32ee8's Hasse and
odd isogeny height, so do NOT repeat their argument. Integration b1451de3
also inspected. The actual surviving foundations are the integral parameter
and local height suppliers, not another jet scalar estimate.

Source ledger, relative to grh-compact/src:
Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
  CMLattice.naiveHeight_spec, norm_monomialSection_le,
  norm_translate_le_naiveHeight_pow, phiSeriesRing,
  IsSeriesGenerator.exists_subst_inverse, of_mem, exists_mul_eq_one,
  CMLattice.taylorVia_translatedWp_mem_phiSeriesRing,
  deriv_mem_phiSeriesRing, taylorVia_curve_eq.
Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
  exists_val_coeff_le_val_eval, CMLattice.exists_eq_theta_pow_mul_of_norm_le,
  rescale_translatedWpDeriv_mem, rescale_translate_eq_theta_pow_mul.
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626:
  CMLattice.exists_log_theta.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  CMLattice.comp_mul_mem_sections, definitions of theta and translatedWp.
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e.
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425.
All results below apply at the actual nonsplit marked p>=13 caller;
where a proof uses p odd it is not a replacement at p=2.

## 1. Tate height transfer with exact phase cancellation (all primes)

Keep the native good reduction and exact naiveHeight_spec inputs:
h(z)=max(|iota sigma(z)|,|iota theta(z)|)>0, h(2z)=h(z)^4,
and |iota G(z)|<=h(z)^3 for G=phi theta^3.
Each monomial section of degree m is bounded by h^m; the native
span by these monomials gives a finite constant for any section
of degree m (sum or max of coefficient norms). Retain this spanning
theorem, not a premise of uniform constant one for every section.

For the actual isogeny a:C->D of degree N and torsion y with
n y in Lambda_D, n>0, define
  r_a(z)=|iota exp(-H_D(a z,y)-H_D(y,y)/2)| h_D(a z+y)/h_C(z)^N,
where H_D is the native hermitian form, linear in the first variable.
Let r_1 be the corresponding ratio for the identity of D.
Both are bounded: for sigma and theta separately their (2n)-th
powers are native sections of degree 2n; the translate by y remains
a section because 2n y is in the corresponding dual lattice.
Pullback multiplies the degree by N. The monomial spanning bound
applied to each of these two pulled-back sections, followed by the
positive 2n-th root, bounds r_a everywhere. This does not assume
compactness of the complex plane or continuity of iota.

Multiplication of the exponential factors and h(2z)=h(z)^4 give
the exact identity
  r_a(z)^4 = r_a(2z) r_1(2az+y).
Indeed the sum of the two exponents is
  -H_D(2az,y)-H_D(y,y)/2
  -H_D(2az+y,y)-H_D(y,y)/2
  = -4H_D(az,y)-2H_D(y,y).
The h_D(2az+y) terms cancel before taking norms. The numerator
remaining is h_D(2az+2y); the denominator is h_C(2z)^N.

Take finite suprema M_1, M_a of the respective positive ratios.
For a=1 the identity implies M_1^4<=M_1^2 (sup commutes with
the increasing power on nonnegative bounded values), so M_1<=1.
Then M_a^4<=M_a M_1<=M_a, hence M_a<=1. No maximal point is
required. This proves the unit-constant isogeny/translate
inequality for any degree m function satisfying |iota g|<=h_D^m,
by multiplying the latter at az+y by the exact degree-m shift.
This is norm_translate_le_naiveHeight_pow with the original
torsion, isogeny and pointwise hypotheses, not an asymptotic bound.

## 2. Integral generator, inverse and derivation

Let O be the valuation ring, K=C_p, phi the translatedWpDeriv
Taylor series read via iota. It has constant zero and linear
coefficient one. By definition A=O[[phi]] is the image of the
integral formal-series ring under substitution by phi.
For any tangent T in A, T=F(phi) with F over O, F(0)=0, F_1=1.
The coefficient recursion for the inverse of F solves degree j
with coefficient one multiplying the new unknown; all other terms
involve lower degrees. Thus F^{-1} is over O and A=O[[T]].
The inverse Z of T over K is tangent and satisfies
  f in A iff f(Z) belongs to O[[X]].
In particular this is valid for the projected T of RUN65, not a
claim that its coefficients in the analytic z-coordinate are
all integral. Likewise a series in A with unit constant has an
inverse in A, by the ordinary multiplicative recursion over O.

Write x=translatedWp, A1=iota(a1) and y=phi. Native cubic:
  x(1+x^2-A1 y)=y^2.
In the coordinate y the polynomial equation has unique root
x(0)=0, since the coefficient of x at the origin is one.
Coefficient recursion, with all coefficients in O (|A1|<=1),
constructs x in O[[y]] with x=y^2+... . Substitution recovers
the native analytic series by the same uniqueness over K.
No division by 2 is needed. Native differential identities
x'=2y+A1 x and y'=1+3x^2-A1 y now give
  d/dz F(y) = F'(y)(1+3x^2-A1 y) in A
for every integral F. This proves the derivative stability
used in both FormalHeight and FormalParameter. After changing
to any tangent T, the earlier inverse has Z'=(T'(Z))^{-1}
integral: T' belongs to A, and its constant is one.
These prove the exact generator, inverse and differentiation
suppliers used by the earlier source-matched parameter argument.

## 3. Polynomial extraction from pointwise height bound (p odd)

Use the native section span to write f/theta^m = R0(x)+y R1(x)
away from theta=0, with polynomials over C (coefficients read
via iota). Degree bounds are inherited from the monomials
theta^a sigma^(2b) G^c of total degree a+2b+3c=m, reducing
powers of y via the native cubic. If f is even, replace R1 by
zero after averaging the two signs and absorbing -A1 x R1/2
in R0. The even representation also follows directly from the
native even span; preserve the top value f(t)=R0_(m/2) sigma(t)^m
for even m by evaluating the actual polynomial/monomial expression
at theta(t)=0 (not by substituting a pole into a Taylor series).

To bound the coefficients for a general f, use the two
points over one common x, BEFORE taking norms.
Choose x in C with |iota x|<=1 at which both R0,R1 attain
their Gauss coefficient norms and the polynomial
  D(x)=4x^3+A1^2 x^2+4x
has norm one. For each nonzero polynomial divide by a coefficient
of maximal norm and reduce. Each normalized polynomial is
nonzero over the infinite residue field; only finitely many
residues are excluded. The cubic D reduces nontrivially for
p odd since 4 is a unit, and |A1|<=1. The residue of the image
of C contains the algebraic closure of F_p (lift roots of
unity of order prime to p), so one common admissible residue
exists. Zero polynomials impose no condition.
This gives the p-odd portion of exists_val_coeff_le_val_eval
needed here. No independent evaluation point for each coefficient.

Uniformization of the native cubic gives z away from theta=0
with this translated x and one root y of y^2+A1 x y=x^3+x.
The point -z has same x and other root y'=-A1 x-y. Their
difference satisfies (y-y')^2=D(x), so |y-y'|=1.
Both roots are integral by the monic equation with integral
coefficients (a norm >1 would make y^2 uniquely dominant).
The assumed pointwise |iota f(z)|<=h(z)^m and
sigma^2=x theta^2 imply |f/theta^m|<=1 at these points
since h/|theta|=max(1,|x|^(1/2))=1.
Subtracting exactly:
  (f(z)/theta(z)^m)-(f(-z)/theta(-z)^m)=(y-y')R1(x).
The difference has norm at most one, so |R1(x)|<=1.
Then |R0(x)|<=1 using either value and |y|<=1.
The common Gauss witness proves every coefficient integral.
For even f the same subtraction forces R1=0 (over the
function field, characteristic zero), so the top value and
integral polynomial come from the same expansion.
The analytic identity gives the formal Taylor identity
  f = theta^m U, U=R0(x)+y R1(x) in A.
This proves the p-odd branch of the actual
exists_eq_theta_pow_mul_of_norm_le, including its extra even
polynomial witness. It does not rely on the degree q top unit
claim, which is downstream, and does not replace the p=2 proof.

## 4. Actual isogeny and torsion quotient

For the same isogeny a:C->D of degree N, apply Sections 1 and
3 to theta_D(a z) and G_D(a z), where G_D=phi_D theta_D^3.
They are sections of degrees N and 3N by the native pullback.
The monomial height bounds give
  theta_D(a z)=theta_C(z)^N v(z),
  G_D(a z)=theta_C(z)^(3N) u(z),  u,v in A_C.
The normalization theta_D(0)=theta_C(0)=1 gives v(0)=1;
thus v^{-1} belongs to A_C by Section 2. Cancel the common
theta factor exactly and obtain
  phi_D(a z)=u(z) v(z)^(-3) in A_C.
This is both projections of rescale_translatedWpDeriv_mem.
In particular the linear coefficient yields |iota a|<=1.
For a torsion translate with delta*y in Lambda, delta nonzero,
a=conj(delta), N=delta conj(delta), the native twisted section
pullback is degree N. N*y lies in Lambda by CM stability.
Apply the exact Tate inequality and integral quotient to the
translated theta; this supplies rescale_translate_eq_theta_pow_mul,
including the same scaling delta and exponent N used in RUN65.

## 5. Log-theta closure, constant term and actual caller

The formal log L=-log(theta) is well-defined because theta(0)=1;
theta even gives L_1=0. Retain the native theta addition identity
giving L''=L2+x (L2 is a scalar, not its degree-2 coefficient).
For a in O_K, b=a conj(a), Section 4 shows
  phi(a z) in A, U_a=theta(a z)/theta(z)^b in A, U_a(0)=1.
Its derivative divided by U_a belongs to A, by Section 2:
  U_a'/U_a = (b L(z)-L(a z))' in A.
The same three membership conclusions extend to normPairClosure:
membership in A is equivalent to integral coefficients after
substitution of the fixed inverse of phi. Each coefficient of
these rescalings, formal exponentials of constant-zero series,
derivatives, and substitutions depends continuously on finitely
many coefficients and the pair (a,b) in C_p. The valuation ring
is closed. This is coefficientwise closure, not convergence
of an analytic logarithm on a p-adic disc.
For omega=(1+sqrt(-d))/2 and its conjugate, subtract the
constant terms of the derivatives of the two log-quotients.
Their norm is <=1 by integral derivative stability, and
the exact difference is (omega^2-conj(omega)^2)L2
=(omega-conj(omega))L2. Hence |iota(sqrt(-d))*L2|<=1.
This supplies all log-theta conclusions from the retained
theta addition identity and the now-derived local quotients.

Integration: insert Sections 1–5 into the existing RUN65
parameter, editor f90ecb3c's height proof, and RUN64's normal
form. The actual marked nonsplit p>=13 caller uses the same
integral parameter ring, root-of-unity projection, common
torsion scaling and isogeny/height witnesses. No added
prime-distribution, theta positivity or URT assumptions.
This closes these supplier derivations at human level
conditional on the listed good-reduction, exact height doubling,
monomial span, uniformization, theta addition, torsion pullback
and norm-pair existence inputs. Do not claim those foundations
are discharged by an algebraic identity. The native proof also
covers p=2; that branch was not replaced here.

Original source-visible graph:
  good reduction & exact height doubling & section span
  -> Tate ratio bound -> polynomial quotient (cubic uniformization)
  -> isogeny/translate quotient -> log-theta closure
  -> FormalHeight & FormalParameter -> thetaProducts_normal_form
  -> mem_raises -> gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked
  -> exists_indexDvd_Bmu_divisible -> Data.short_forms -> star_inequality.
  generator/inverse & cubic -> derivative -> polynomial/log/height.
Reduced human graph substitutes Sections 1–5 at the p-odd caller;
all surviving premises kept. No global kernel edge deletion, no
new elaborated graph, no import of Main or RH theorem. Preserve
all original native role/axiom ledgers and earlier old-pin artifacts.

Actual native evidence: reread compact targeted_results.json
at cathedral-research-state:compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json, blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Run 45803534769: A module build timed out 124 (2700.11s);
six B/C named checks only, propext, Classical.choice, Quot.sound;
all_requested_checks_ok=false, full_RH_replay=false.
Local command -v lean/lake/elan found none. The following scalar
certificates and named supplier probes are PREPARED, not compiled;
use shared compact native runner. No new rh_scan/prune/reduce/auto/
frontier execution, synthetic finite tests or measured speedup.

RESUME HERE: derive CMLattice.naiveHeight_spec (IntegralParameter.lean,
exact doubling and G bound) from the normalized homogeneous duplication
identity and unit discriminant, and check the good-reduction supplier
norm_disc_eq_one rather than restating Tate transfer. Then check the
section span and theta addition identity at their precise normalized
caller. Integrate Sections 1–5 at the existing theta/Schur-jet branch;
do not repeat RUN65 or editor's FormalHeight derivation.
HANDOFF TO integration, theta, literature, audit, kernel extractor.
-/

namespace AccelerationRun66

theorem self_sup_bound (M : ℝ) (hM : 0 ≤ M) (h : M^4 ≤ M^2) :
    M ≤ 1 := by
  by_contra! h1
  have h2 : 1 < M^2 := by nlinarith
  have h3 : 0 < M^2 := by positivity
  have h4 := mul_lt_mul_of_pos_left h2 h3
  nlinarith [h4]

theorem isogeny_sup_bound (M B : ℝ) (hM : 0 ≤ M)
    (hB : B ≤ 1) (h : M^4 ≤ M*B) : M ≤ 1 := by
  by_contra! h1
  have h2 : 1 < M^2 := by nlinarith
  have h3 : M ≤ M^2 := by nlinarith
  have h4 := mul_le_mul_of_nonneg_left hB hM
  have hh : M^4 ≤ M^2 := by linarith
  exact (not_lt_of_ge (self_sup_bound M hM hh)) h1

theorem cubic_discriminant_identity {K : Type*} [Field K] (x y a : K)
    (h : y^2+a*x*y=x^3+x) :
    (2*y+a*x)^2=4*x^3+a^2*x^2+4*x := by
  linear_combination 4*h

theorem shared_value_difference {K : Type*} [Field K]
    (r s y y' : K) : (r+y*s)-(r+y'*s)=(y-y')*s := by ring

theorem conjugate_constant_difference {K : Type*} [Field K]
    (a b L : K) (h : a+b=1) :
    (a^2-b^2)*L=(a-b)*L := by
  calc
    (a^2-b^2)*L=(a-b)*(a+b)*L := by ring
    _=(a-b)*L := by rw [h, mul_one]

#print axioms self_sup_bound
#print axioms isogeny_sup_bound
#print axioms cubic_discriminant_identity
#print axioms shared_value_difference
#print axioms conjugate_constant_difference
end AccelerationRun66

#check CMLattice.norm_translate_le_naiveHeight_pow
#check IsSeriesGenerator.exists_subst_inverse
#check IsSeriesGenerator.of_mem
#check CMLattice.deriv_mem_phiSeriesRing
#check CMLattice.exists_eq_theta_pow_mul_of_norm_le
#check CMLattice.rescale_translatedWpDeriv_mem
#check CMLattice.rescale_translate_eq_theta_pow_mul
#check CMLattice.exists_log_theta
#check CMLattice.exists_formal_parameter
#print axioms CMLattice.norm_translate_le_naiveHeight_pow
#print axioms CMLattice.exists_eq_theta_pow_mul_of_norm_le
