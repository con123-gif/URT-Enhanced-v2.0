import Lib.CM.LocalHeight.IsogenyIntegrality
import Lib.CM.FormalGroup.FormalHeight
import New.Curve.FormalParameter
import Mathlib.Tactic

/-!
# RUN42 — CM good reduction, homogeneous height and all-prime integral section quotient
27 November 2026. SOURCE-MATCHED human derivation; native replacement
replay and independent audit pending. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; manuscript
1a5e180894e9f437ed9454097c99896366afc188. RUN41 02d32ee8 retained.
Peer acceleration RUN66 570210d30dcacc68009ba75f5fb9a93635f681fc
already proves Tate's ratio and parameter/log quotient, but explicitly
retains good reduction, exact doubling and p=2 polynomial extraction.
This run fills those particular suppliers and gives the exact cubic
point matching needed for the separate conjugate-section caller.
Reviewed latest peer commit file lists including aaf2100d, b1451de3,
f90ecb3c, 6f2682c4 and 9bd45a52; do not duplicate their B/C work.

Native sources, relative to grh-compact/src:
* Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
  CMLattice.norm_disc_eq_one, norm_a₁_le_one, naiveHeight_spec,
  norm_translate_le_naiveHeight_pow, norm_monomialSection_le.
* Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa:
  exists_conjugate_section, taylorAtZero_monomialSection,
  exists_val_coeff_le_val_eval, CMLattice.exists_eq_theta_pow_mul_of_norm_le,
  rescale_translatedWpDeriv_mem.
* Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7:
  g₂_eq, a₁_sq, disc_eq, exists_latticeModule_eq_scaledIdeal_mul,
  exists_eq_scaledIdeal_mul_of_mk_eq_one, σ_two_mul_sq, θ_two_mul,
  phiThetaCube_sq_add, derivative identities, cubic uniformization.
* Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626:
  exists_log_theta; New/Curve/FormalParameter.lean
  61130bd5600a2b1f1679cfe0a18123d2c458d425, exists_formal_parameter.
  Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e
  (RUN41 source ledger) is the actual consumer of these integral results.

## 1. Exact two-isogeny identities, without a black-box Weber unit

Let d be prime 7 mod 8, C a native normalized CM lattice, t its
distinguished nonzero two-torsion, omega=(1+sqrt(-d))/2, T=omega*t,
and U=t-T. These are the three distinct nonzero two-torsion points
by the CM datum. N(omega)=(d+1)/4 is even. Put e0=wp(t),
r=wp(T)-e0, s=wp(U)-e0. They are nonzero and distinct by the
nonsingular Weierstrass cubic and its uniformization (equivalently
wp separates points modulo sign). Its three roots have sum zero.
Normalization wp''(t)=2 gives r*s=1; hence
  e0=-(r+s)/3, g2=4(r²-r*s+s²)/3,
  b=a1^4-64=16(r-s)^2.
Use the actual native G4 lattice sum (g2=60 G4) and S(y)=sumInvPow(y,4).
At nonlattice y, S(y)=wp''(y)/6; at zero S(0)=G4, with the zero
summand omitted. Thus
  S(t)=1/3, S(T)=r(r-s)/3, S(U)=s(s-r)/3.
All these nonzero denominators follow from distinct roots and rs=1.

Take the fractional ideal J=O_K+(omega/2)O_K; the minus sign in
the native generator c₀/(-2) changes no ideal. The native lattice
relation gives D.Lambda=u( C.Lambda union (T+C.Lambda) ) for some
u≠0. Indeed the image of omega on E[2] has order two, as omega^2
equals omega modulo 2, and its nonzero value is T. This is exactly
the over-lattice obtained by applying J. In the quotient D[2],
ut is nonzero and omega*ut is zero. For D, the unique nonzero
two-torsion killed by omega is t_D-omega*t_D, since the native
three points are distinct and N(omega) even. Thus
  t_D-omega*t_D = ut modulo D.Lambda.
Splitting the absolutely convergent fourth-power sums into the
two cosets gives
  G4_D=(G4_C+S(T))/u^4,
  S_D(t_D-omega*t_D)=(S(t)+S(U))/u^4.
The latter denominator is s²/(3u^4), nonzero. This is the actual
source S transport, not a statement about complex absolute values.

Write v=240 G4_C/S(U)-16, v'=the same invariant at D, and
x=r/s=r² (x≠0,1). Substitution and cancellation of u^4 and rs=1 yield
  v=16*x²/(1-x), v'=256*x*(x-1), b=16*(x-1)²/x.
In particular v,v',b are nonzero, and the exact native identities are
  v'=-b*v, (48+v+b)*(-v')=4096.
These are over C before applying any embedding. Four rational-function
identities, including both v formulas, were independently simplified
to zero by exact SymPy cancel in the current local container; command
reproduction below. This does not establish the lattice facts by
numerical testing.

## 2. Finite-class-cycle argument, including p=2

The ideal class of J has finite order h>0. Starting at any actual C,
choose successive normalized CM data using the native scaled-ideal
existence; at step h choose the original C, since J^h is principal.
No assertion that arbitrary normalizations yield the same v is needed.
For an arbitrary native embedding iota:C->C_p write
a_i=|iota(v_i)|>0, c=|4096|_p in (0,1]. On each edge the two
identities give |iota(b_i)|=a_{i+1}/a_i and
  c=a_{i+1}|48+v_i+b_i|_p.
Use |48|_p<=1 and ultrametric dominance only.

If a_i<c, an edge to a_{i+1}>=c would have |b_i|>1, |v_i|<1,
so c=a_{i+1}²/a_i>a_{i+1}>=c, impossible. An edge to
a_{i+1}<=a_i would have all three summand norms <=1, so
c<=a_{i+1}<c, also impossible. Hence the region a<c is
forward-invariant and strictly increasing, impossible on the finite
closed cycle. Thus all a_i>=c.
If a_i>1 and a_{i+1}<=a_i, v_i uniquely dominates, giving
a_{i+1}=c/a_i<c. Therefore a_i>1 forces a_{i+1}>a_i,
again impossible on a closed finite cycle. Thus a_i<=1.
Finally any increase a_{i+1}>a_i gives |b_i|>1 while |v_i|<=1,
so c=a_{i+1}²/a_i>a_{i+1}>=c. No increases; by cyclicity all
a_i equal. Consequently |iota(b_i)|=1 at every step, in
particular the original C. The argument covers c<1 at p=2
without applying an odd-prime reduction. It proves exactly
norm_disc_eq_one using the original source class/CM and lattice
sum facts, not an extra good-reduction assumption. Since
a1^4=b+64 and |64|<=1, |iota(a1)|<=1.

## 3. Homogeneous height and exact doubling

At z let H=max(|sigma(z)|,|theta(z)|)>0 (all values read through
iota). Positivity follows from the disjoint theta and sigma zeros.
Choose the actual coordinate c0 attaining H and divide sigma,theta
by c0, obtaining S,T0 in the valuation ring with max norm 1.
Write A=iota(a1), W=(S*T0)^2. The native homogeneous identities give
  sigma(2z)^2/c0^8 = W[4(S^4+T0^4)+A² W],
  theta(2z)/c0^4 = T0^4-S^4.
Both are integral. If both have norm <1, reduce modulo the maximal
ideal. T0^4=S^4 and one coordinate is a unit, so both are units.
Thus W is nonzero in the residue field and
  A² W = -4(S^4+T0^4).
Square this equality and use (S^4+T0^4)^2=4 W² to deduce
  (A^4-64)W²=0.
This contradicts Section 2. The calculation is valid in residue
characteristic 2; it does not divide by 2 or 4. Hence at least one
normalized doubled coordinate is a unit and H(2z)=H(z)^4.
For G=phiThetaCube divide its native cubic identity by c0^6,
putting g=G/c0^3:
  g²+A S² T0 g=S^6+S² T0^4.
If |g|>1 the leading g² uniquely dominates the other terms,
contradiction. Thus |G|<=H³. This proves the three clauses of
naiveHeight_spec with the actual height, supplies norm_monomialSection_le,
and removes the exact height premises retained in acceleration RUN66.

## 4. The all-prime coefficient witness; extension of RUN66

The native section span writes f/theta^m=R0(x)+y R1(x), x=xi, y=phi,
with monomial degree 2b+3e<=m and e=0 or 1. The two sheets are y,
y'=-A*x-y, with (y-y')²=D(x)=4x³+A²x²+4x. The missing p=2 case
is solved uniformly: the polynomial D has coefficient Gauss norm
one. If |4|<1 and |A²|<1 then |A^4-64|<1, impossible by Section 2;
and all coefficients have norm <=1. Normalize each nonzero R_i
by its own maximal coefficient; reduce these and D in the residue
field of the restriction of iota to C. This residue field is
algebraically closed (residue of an algebraically closed valued
field; a monic polynomial lifts and all its roots are integral),
in particular infinite. The finite union of roots of the three
nonzero polynomials is not the whole residue field. Lift one
common residue to an x with |x|<=1. At this x, both R_i attain
their Gauss norms and D(x) is a unit; ignore identically zero R_i.
Cubic uniformization produces the two actual points z,-z above
this x with theta nonzero. Monicity gives |y|,|y'|<=1, and
|y-y'|=1. Since sigma²=x theta², H/|theta|=1 at both. The native
pointwise bound on f implies both values R0+yR1 and R0+y'R1
are integral. Subtract before taking norms to get R1(x) integral,
then R0(x) integral. Thus every coefficient of both polynomials
is integral, including at p=2. This is the actual integrality
principle, not a finite sample or a separate choice of x for each
coefficient. If f even, theta even and the difference is identically
zero for generic x with D(x)≠0; hence R1=0 in characteristic zero.
No division by 2 in the valuation ring. Evaluating the homogeneous
monomial expansion at t with theta(t)=0 gives f(t)=R0_(m/2)*sigma(t)^m
for m even. Taylor substitution gives U in O[[phi]] by the native
integral x-series proof, already supplied in acceleration RUN66.
This covers the full p-scope of exists_eq_theta_pow_mul_of_norm_le,
including its even top coefficient. The actual odd-isogeny consumer
RUN41 and the rescale/translate consumer RUN66 now use this same
integral witness. The native section span and uniformization are
retained standard inputs at their exact hypotheses.

## 5. Separate conjugate-section point bridge

At the actual exists_conjugate_section assume A'_1=sigma(A_1)
for the complex field automorphism sigma (not the sigma function).
For z with theta'(z)≠0, read x',y' on the target cubic; applying
sigma^{-1} to the coefficients and coordinates puts the pair on
the source cubic. Native uniformization gives a source point w
with exactly these coordinates after applying sigma. Its theta
does not vanish. Set mu=theta'(z)/sigma(theta(w))≠0.
The homogeneous identities then identify all three generators
theta, sigma_function², G with factors mu, mu², mu³, respectively.
If theta'(z)=0, use w=t. Both sigma_function values s' and
sigma(s(t)) are nonzero; both G values g' and sigma(G(t)) are
nonzero and satisfy G²=s^6 at these points. Set
  r=s'/sigma(s(t)), k=g'/sigma(G(t)), mu=k/r².
Then k²=r^6, mu²=r², mu³=k and mu≠0. This proves precisely the
homogeneous generator identities at the exceptional point, with
the required w=t. No assumption that the complex automorphism
preserves norms or signs. For Taylor transport, x,y both start
at zero and the native differential system x'=2y+A1*x,
y'=1+3x²-A1*y determines every next coefficient from earlier
coefficients by division by n+1 in characteristic zero. Thus
their target Taylor series equal the coefficientwise sigma-images.
Each monomial of degree m therefore transports with common
factor (theta_target/sigma(theta_source))^m in the Taylor series.
The native monomial span extends this by semilinearity to an
arbitrary section; all evaluations use the SAME w,mu independent
of the section and degree. This supplies the exact source
conjugate_section bridge used by the common CM-period argument,
not an archimedean isometry claim.

## Evidence, graph and handoff

Original source-visible edges: star -> short_forms -> marked local
jet/Hecke -> thetaProducts_normal_form -> exists_formal_parameter ->
FormalHeight and LogTheta -> isogeny integrality -> local height and
unit discriminant. Separate conjugate-section edge at the CM-period
consumer (integrated common CM-period in b1451de3).
Reduced human graph substitutes Sections 1–4 into the actual
RUN41/RUN66 chain, and Section 5 into that separate caller.
Retain class-group finiteness, CM lattice existence and 2-torsion
identifications, lattice sum/Weierstrass identities, section span,
uniformization, actual torsion pullback/degree and closure hypotheses.
Retain all other A/B/C obligations. No global kernel dependency
deletion, no new elaborated graph; prior original/reduced graphs and
axiom evidence untouched. Context key: compact pin, C,D, embedding,
omega, J, actual finite cycle, normalized t and roots, section/degree
and common x, sigma and same w,mu. No RH theorem imported.

Actual local execution: command -v lean/lake/elan returned none.
Exact SymPy reproduction (executed, four zeros):
  import sympy as S
  r=S.symbols('r', nonzero=True); s=1/r
  g2=S.Rational(4,3)*(r*r-r*s+s*s)
  St=S.Rational(1,3); ST=r*(r-s)/3; SU=s*(s-r)/3
  v=4*g2/SU-16; vp=(4*g2+240*ST)/(St+SU)-16; b=16*(r-s)**2
  checks=[v-16*r**4/(1-r*r),vp-256*r*r*(r*r-1),
          vp+b*v,(48+v+b)*(-vp)-4096]
  assert all(S.cancel(f)==0 for f in checks)
This is exact algebra only; excludes zero denominators r=0 and r²=1.
Actual native CI reread: run 45803534769, status blob
a56e2d3afb99ed8275e81fd63c8494306e57c43f, targeted_results.json
088cd2ec0e935ee1a282f10096949bcf671cc804. Six B/C named checks with
propext, Classical.choice, Quot.sound; A build timeout 124
(2700.11s); all_requested_checks_ok=false, full_RH_replay=false.
No fresh native run, no compact rh_scan/prune/reduce/auto/frontier
execution, no use of old-pin CI as compact validation. Below are
prepared scalar certificates and named source/axiom probes only.
Independent audit requested especially for the normalized ideal
cycle labels and fourth-power sum conventions.

RESUME HERE: audit the ideal-cycle/lattice-sum normalization at
norm_disc_eq_one and integrate Sections 1–4 with acceleration RUN66
and RUN41, Section 5 with the CM conjugate-period caller. Then
establish the precise monomial span and normalized theta addition
supplier, and connect to weylNormSq_Bmu_le and marked Hecke at the
actual A caller. Shared native runner: prioritize these local modules
rather than a competing full A build; no protected workflow change.
HANDOFF TO integration, editor, audit, theta, acceleration, shared
native runner. Human RH reconstruction incomplete.
-/

namespace KernelRun42

theorem two_isogeny_identity_one (x : ℚ) (h0 : x ≠ 0) (h1 : x ≠ 1) :
    256*x*(x-1) = -(16*(x-1)^2/x)*(16*x^2/(1-x)) := by
  field_simp [h0, h1, sub_ne_zero.mpr (Ne.symm h1)] <;> ring

theorem two_isogeny_identity_two (x : ℚ) (h0 : x ≠ 0) (h1 : x ≠ 1) :
    (48+16*x^2/(1-x)+16*(x-1)^2/x)*(-(256*x*(x-1))) = 4096 := by
  field_simp [h0, h1, sub_ne_zero.mpr (Ne.symm h1)] <;> ring

-- This certificate is over every field, including characteristic two.
theorem residue_discriminant {K : Type*} [Field K] (A s t : K)
    (hs : s ≠ 0) (ht : t ≠ 0) (h1 : t^4 = s^4)
    (h2 : 4*(s^4+t^4)+A^2*(s*t)^2=0) : A^4-64=0 := by
  have h : (A^4-64)*(s*t)^4 = 0 := by
    linear_combination (A^2*(s*t)^2-4*(s^4+t^4))*h2 + 16*(t^4-s^4)*h1
  exact (mul_eq_zero.mp h).resolve_right (pow_ne_zero _ (mul_ne_zero hs ht))

theorem homogeneous_exception {K : Type*} [Field K] (r k : K)
    (hr : r ≠ 0) (h : k^2=r^6) :
    (k/r^2)^2=r^2 ∧ (k/r^2)^3=k := by
  constructor
  · field_simp [hr] <;> linear_combination h
  · field_simp [hr] <;> linear_combination k*h

#print axioms two_isogeny_identity_one
#print axioms two_isogeny_identity_two
#print axioms residue_discriminant
#print axioms homogeneous_exception
end KernelRun42

#check CMLattice.norm_disc_eq_one
#print axioms CMLattice.norm_disc_eq_one
#check CMLattice.naiveHeight_spec
#print axioms CMLattice.naiveHeight_spec
#check CMLattice.norm_translate_le_naiveHeight_pow
#check CMLattice.exists_eq_theta_pow_mul_of_norm_le
#print axioms CMLattice.exists_eq_theta_pow_mul_of_norm_le
#check exists_conjugate_section
#print axioms exists_conjugate_section
#check CMLattice.rescale_translatedWpDeriv_mem
#check CMLattice.exists_formal_parameter
