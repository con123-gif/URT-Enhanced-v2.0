import New.Curve.FormalParameter
import Mathlib.Tactic

/-!
# RUN71 — section division, conjugate theta rigidity and integral coefficient extraction
27 November 2026. HUMAN-DERIVED relative to named foundations, native replay and independent audit pending.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first, mandatory reduction),
AGENTS, protocol, handoff, expansion, manuscript 52c0ccfd0dc525f446dd8bc935a7df71912c8709 reviewed.
RUN70 c632a8e0, prime RUN70 f5180dc9, peers 58afe07e and 4c982eab6 reviewed.
Do not repeat split Hecke, mixed-model multiplier, canonical semicharacter, or the previously integrated Tate height argument.
This note supplies the section-division foundation requested by integration and continues into the actual jet caller.

## 1. Division of sections, with only simple-zero and automorphy premises
Source Lib/CM/Sigma/PadicSeriesDefs.lean 5eebedb97cff53ded1241d70add1b515300368ca,
sections_zero_le_const 43–44, section_division 49–61, sections_le_span_monomialSection 65–76.
Retain the sigma simple-zero theorem (SigmaFunction.lean), theta shift formula and Appell–Humbert nonvanishing cocycle.
Let g(z)=(U_y theta_D)(az), a != 0, be a section of degree m of C.
The shift formula writes g as an everywhere nonzero exponential times a nonzero
constant times sigma_D(az+y+t_D). The zeros of sigma_D are simple, so
g'(z0) is the product of nonzero factors and a*sigma_D'(az0+y+t_D)
at each zero z0. Thus every zero is simple. If f has degree m+k and
vanishes wherever g vanishes, then locally at a zero write
g(z)=(z-z0)g1(z), f(z)=(z-z0)f1(z), g1(z0)!=0 by Taylor expansion.
The quotient extends uniquely as f1/g1, taking value f'(z0)/g'(z0).
At nonzeros use f/g. This proves an entire c with c*g=f without
division by a zero. If J_l(z) is the degree-one nonzero automorphy
factor, then away from zeros c(z+l)=J_l(z)^k c(z); the identity
theorem extends the equality everywhere. Thus c belongs to sections(C,k)
and hence to any containing subspace S. Only the indicated simple-zero
property is needed; no uniform separation of zeros. For k=0, c is
entire lattice-periodic, bounded on a compact fundamental parallelogram,
hence constant by Liouville. This proves the exact source division lemma.

At ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52
19–36, retain the degree N nonzero conjugate isogeny and d' guard for
the third clause only. Use RUN69 H V²=W F² with
V=theta_D'(sigma(a) z), W=sigma-function_D'(sigma(a)z)^2.
At V=0, W!=0 (half-period is not a period); hence F=0.
RUN70 proves V has degree N. By section division F=cV; F(0)=V(0)=1
so c=1. Let Q_C=theta_C' series/(sigma theta_C series), with constant 1.
The transported Taylor equality now reads
rescale(sigma(a),theta_D' series)
= Q_C^N rescale(sigma(a),sigma theta_D series).
The rescaled denominator has constant 1 and is a unit as a formal
series. Divide there, not at a theta zero. Thus Q_D(sigma(a)X)=Q_C(X)^N.
This completes the third-clause supplier from RUN69–70 and section division.

## 2. Exact rigidity of the normalized theta series
Actual ConjugateCurve.lean thetaQuotient_eq_one 46–54. Here C'=D is
at the same discriminant d prime 7 mod 8, sigma fixes K, and the invariants
match. For every nonzero a in O_K, both curves admit multiplication by a
of degree a*bar(a), same because the area ratio is one. The preceding
identity gives Q(aX)=Q(X)^(a*bar(a)). If Q != 1, take the smallest n>=1
with Q_n != 0; all lower nonconstant coefficients vanish. Coefficient n
of Q^N is N Q_n: in the product only one nonconstant factor can contribute
to degree n. The left coefficient is a^n Q_n. Cancel this nonzero number
to obtain a^n=a*bar(a). For a=2 this says 2^n=4, so n=2.
For a=omega=(1+i sqrt(d))/2, a^2=a*bar(a) implies a=bar(a), impossible
because d>0. Therefore Q=1. No convergence of the coefficientwise
field automorphism is required. In particular this supplies the equality
used at line 85 of exists_taylorVia_twistedTranslate_theta. Preserve the
actual finite-torsion transport proof (RUN68), not an assertion of a
continuous complex field automorphism.

## 3. Residue selection and integral coefficient extraction without 2-adic division
Source Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa,
exists_val_coeff_le_val_eval 67–80 and exists_eq_theta_pow_mul_of_norm_le 85–117.
Let iota be the actual p-adic embedding; write |.| for its pullback
absolute value on C, O for its valuation ring, A=a1, x=translatedWp,
y=translatedWpDeriv, T=theta and S=sigma-function. Keep the established
good-reduction guard |A^4-64|=1, |A|<=1, cubic
y²+Axy=x³+x, and native uniformization of all affine points. The monomial
span in section 1/source gives for a degree m section
  f/T^m = P(x)+y R(x)
off theta zeros, with polynomials P,R and each monomial of degree m.
The hypothesis is |f(z)|<=max(|S(z)|,|T(z)|)^m for every z.

For finitely many nonzero polynomials (here P,R,D), choose for each
a coefficient c of maximal absolute value. The normalized polynomial
has integral coefficients and nonzero reduction. The residue field
of the algebraically closed valued field C is algebraically closed:
lift a monic polynomial and take a root in C; the root is integral
by the ultrametric inequality, then reduce it. Hence the residue
field is infinite. Select a residue avoiding the finitely many roots
of all normalized nonzero polynomials, and lift it to x0 in O.
Then |P(x0)|=max_i |P_i|, |R(x0)|=max_i |R_i|, and the same for D.
Zero polynomials impose no restriction and satisfy the conclusion.
This is the one-variable actual case of exists_val_coeff_le_val_eval;
do not claim a reduction of the general multivariate declaration globally.

Put D(X)=4X^3+A²X²+4X. Its coefficient maximum is exactly 1:
all coefficients are integral; if both |4|<1 and |A²|<1 then
|A^4-64|<1, a contradiction (64=16*4). This covers p=2 without
assuming 2 a unit. Hence |D(x0)|=1. Choose y0 solving the cubic at
x0 and y1=-y0-Ax0; both are roots of the monic integral quadratic,
so |y0|,|y1|<=1. Their difference satisfies
  (y0-y1)^2=(2y0+Ax0)^2=D(x0).
Thus |y0-y1|=1, even at p=2. The exact affine uniformization gives
points z0,z1 away from the theta zeros with these coordinates.
Since x=S²/T², |x0|<=1 implies |S|<=|T| at both. Set
u=f(z0)/T(z0)^m=P(x0)+y0 R(x0),
v=f(z1)/T(z1)^m=P(x0)+y1 R(x0).
Both have absolute value <=1. Subtract BEFORE any norm:
  u-v=(y0-y1)R(x0).
The unit difference proves |R(x0)|<=1 and P(x0)=u-y0 R(x0)
then proves |P(x0)|<=1. The simultaneous choice of x0 yields
all coefficients of both polynomials integral. No factor |2|^-1,
no separate maximizing points, no loss at the ramified or split prime.
Using x and y in the native integral phiSeriesRing (IntegralParameter.lean
9dc955b1e8a0650c27c8eda49f6e4adaf94680bd, 280–298), substitute P,R to get
  taylorVia(iota,f)=taylorVia(iota,T)^m * U, U in phiSeriesRing.
For even f, theta even and the involution z -> -z sends
(x,y) to (x,-y-Ax). Therefore (2y+Ax)R(x)=0 at every affine point.
For every x with D(x)!=0, choose an affine point and deduce R(x)=0.
Infinitely many such x imply R=0. This is a polynomial identity over C,
not averaging by 1/2 in a valuation ring. If m is even, evaluate the
original monomial sum at t. Every monomial with positive theta exponent
vanishes. An exponent-zero monomial with G-degree 1 would give odd m;
only the S^m term survives. Its coefficient is P_(m/2), so
f(t)=P_(m/2) S(t)^m. This supplies all clauses of the actual lemma.

## 4. Integrate directly into the local jet caller
At IsogenyIntegrality 140–145, retain the actual nonzero delta,
delta*y in Lambda, degree N of conjugate(delta), twistedTranslate_comp_mem
(PadicSeriesDefs 79–83) and prior Tate height bound
(IntegralParameter 190–214; earlier height derivation retained).
Apply section 3 to the degree N section (U_y T)(conjugate(delta) z).
Obtain exactly its rescaled Taylor series T^N U, U integral in phi.
At 149–159 apply section 3 to the three pullbacks of monomials, in
particular T_D(a z)=T_C^N V and G_D(a z)=T_C^(3N) W with V,W in phi.
V(0)=1, since both theta functions are normalized; V is invertible
in the integral formal parameter ring. Since G_D= T_D^3 y_D near 0,
  y_D(a X)=W V^(-3)
as formal Taylor series after cancelling the unit T_C^(3N).
It lies in phi, and its linear coefficient is iota(a) because y_D'(0)=1.
Integral parameter linear coefficient one gives |iota(a)|<=1, the
actual norm_le_one_of_isogeny 163–165. This uses no assumed integrality
of a and also works for a=0,N=0.

At New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425,
jet_theta_prod_integral 27–55, the actual substitutions are
s_i= iota(conjugate(delta))^-1 * linearSeries(c_i), not unscaled c_i.
Use the preceding factorization at these substitutions so the translated
theta factors belong to the subalgebra generated by the substituted
phi ring and the native log-theta derivative/exponential terms.
The native guard |iota(conjugate(delta))^-1 c_ix / d|<=1 controls
each partial derivative by the chain rule once d times the one-variable
derivative stays in the generators. Retain exists_log_theta and the
specific d-scaled generator derivative premises from lines 43–51.
Constant coefficient evaluation is a ring map. The product rule extends
derivative stability from those generators to the entire subalgebra.
Repeated partial differentiation and an integral linear combination
therefore give an integral jet for the actual polynomial Q (no factorial
division of Taylor coefficients). This is the caller bridge, conditional
on the precise log-theta supplier, not a new proof of that supplier.
The marked mixed-model pairing has been separately handled by prime
RUN70; do not conflate these obligations.

## Verification and remaining frontier
Source-visible original chain Main -> New.grh -> star_inequality ->
Data.short_forms -> local jet/divisibility suppliers -> FormalParameter.jet_theta_prod_integral
-> rescale_translate_eq_theta_pow_mul / norm_le_one_of_isogeny
-> exists_eq_theta_pow_mul_of_norm_le -> monomial span / residue selection.
Separate CM branch ConjugateCurve.conj_isogeny_mem_lattice -> section_division;
thetaQuotient_eq_one -> actual finite-torsion transport.
Reduced human paths: simple zeros + automorphy -> degree-zero quotient;
nonzero leading coefficient + 2 and omega -> Q=1; common residue witness
+ unit quadratic-root separation -> all polynomial coefficients integral
-> rescaled parameter and translated theta -> derivative-closed jet algebra.
Context keys include compact source pin, C,D,d,p,iota,m,delta,N,y and the
actual Q,c; degree-zero quotient only when equal degrees. Preserve
all other graph edges, original and reduced graphs and axiom ledger.
No global pruning, no claimed RH import, no URT, no numerical simulations.
Local command -v lean/lake/elan found none. Actual CI artifact
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json,
cathedral-research-state, reread: six named B/C checks with three
standard axioms; A build returncode 124 after 2700.11s;
all_requested_checks_ok=false, full_RH_replay=false.
No new native rh_scan/prune/reduce/auto/frontier execution or PASS.
Scalar certificates below prepared but not compiled. Retain upstream
axiom probes for the exact suppliers; independent audit requested.

RESUME HERE: inspect the actual log-theta scaled derivative supplier at
Lib/CM/KroneckerLimit/LogTheta.lean exists_log_theta and connect this jet
algebra to the surviving A stage-index caller; coordinate with prime RUN70
mixed-model multiplier and avoid repeating its algebra. Preserve remaining
local gauge-index, marked Hecke, B/C and analytic obligations.
HANDOFF TO integration, editor, audit, native runner, prime-window.
Human RH reconstruction remains incomplete.
-/

namespace ThetaRun71

theorem root_difference (A x y : ℂ) (h : y^2 + A*x*y = x^3+x) :
    (2*y+A*x)^2 = 4*x^3+A^2*x^2+4*x := by
  linear_combination 4*h

theorem unit_discriminant_combination (A : ℂ) :
    A^4-64 = A^2*A^2-16*4 := by ring

theorem recover_coefficients (u v y z P R : ℂ)
    (hu : u=P+y*R) (hv : v=P+z*R) (h : y-z ≠ 0) :
    R=(u-v)/(y-z) ∧ P=u-y*R := by
  constructor
  · apply (eq_div_iff h).2
    linear_combination hv-hu
  · linear_combination -hu

theorem nonreal_quadratic_obstruction (a b : ℂ)
    (ha : a ≠ 0) (hab : a ≠ b) : a^2 ≠ a*b := by
  intro h
  apply hab
  apply sub_eq_zero.mp
  have hz : a*(a-b)=0 := by linear_combination h
  exact (mul_eq_zero.mp hz).resolve_left ha

#print axioms root_difference
#print axioms unit_discriminant_combination
#print axioms recover_coefficients
#print axioms nonreal_quadratic_obstruction
end ThetaRun71

#check CMLattice.section_division
#print axioms CMLattice.section_division
#check CMLattice.thetaQuotient_eq_one
#print axioms CMLattice.thetaQuotient_eq_one
#check CMLattice.exists_eq_theta_pow_mul_of_norm_le
#print axioms CMLattice.exists_eq_theta_pow_mul_of_norm_le
#check CMLattice.rescale_translate_eq_theta_pow_mul
#print axioms CMLattice.rescale_translate_eq_theta_pow_mul
#check CMLattice.norm_le_one_of_isogeny
#print axioms CMLattice.norm_le_one_of_isogeny
#check CMLattice.jet_theta_prod_integral
#print axioms CMLattice.jet_theta_prod_integral
