import New.Curve.ConjugateGenerator
import Mathlib.Tactic

/-!
# RUN68 — simultaneous torsion transport and the common CM period unit
26 November 2026, completion-first human source-matched reconstruction.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; read current
manuscript 0ef71fd3afc82ac3e5c0fc0e23d5533a9e495dc9, AGENTS,
protocol, handoff, lane expansion, RUN67 and peer commit list through
d24dae79 (rational Weil doubling, distinct from this contribution).

Source ledger:
* Lib/CM/MainTheorem/ConjugateCurve.lean 6a5c1242ed3d2ef283cbafb57a7676e4a3062c52,
  exists_taylorVia_twistedTranslate_theta, thetaQuotient_eq_one,
  conj_isogeny_mem_lattice.
* Lib/CM/LocalHeight/IsogenyIntegrality.lean 1b7411b4a950de12649c1f2cd171de834f8363fa,
  exists_conjugate_section, norm_le_one_of_isogeny.
* Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7,
  exists_latticeModule_eq_scaledIdeal_mul, area and section identities.
* Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e,
  complex_multiplication_theta, hasSum_ideal_classes, chowla_selberg.
* Lib/CM/Genus/QuadraticZeta.lean 51f575a20ca3dc4831d287d2f14f597586b96fff,
  classGroup_sq_bijective, eulerProd_one_eq_zeta_mul.
* Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626,
  kronecker_limit.
* New/Curve/ConjugateGenerator.lean ad3f02ee95b950ae5a4fa98e30fd939e41837ae1,
  exists_isJetConjugate_generator, jetScale_ne_zero.
The readable companion at the SAME pin was inspected as a cross-check:
grh/src/Lib/CM/ConjugateCurve.lean 57cdc875440bfb5cb46ab67915289432d9e1621b,
grh/src/Lib/CM/ChowlaSelberg.lean 43e85e95a45b8761b5d3fa6948f57e5952e3eca2.
It clarifies the compressed proof; no companion theorem is substituted
as a compact kernel certificate.

## 1. Simultaneous torsion translations (one point, all s)
Fix d prime 7 mod 8, K=Q(sqrt(-d)), CM curves C,D with
a1(D)=sigma(a1(C)), sigma fixes K, Lambda_C=Omega O_K. Write
tau=sigma^-1. Given finite S in K choose nonzero integer n with
nS subset O_K, and w=Omega/(2 n^2). Use exists_conjugate_section
in direction D to C at w. It supplies one point w' on D and
mu !=0 for ALL homogeneous sections f of D, simultaneously:
    Taylor(g)=tau Taylor(f),    g(w)=mu^m tau(f(w')).
Here m is degree, g is the transported section, and the first
identity uses RUN67 thetaQuotient_eq_one, not an assumption that
tau is analytic. All maps on series are coefficientwise.
For a in O_K, precompose with multiplication by a, which is
an isogeny of degree N(a). Entire functions are determined by
Taylor series; tau fixes a. Hence
    g(a w)=mu^(m N(a)) tau(f(a w')).
This is also valid at a=0 for zero comparison: both values have
the same zero status by their constant coefficients. In particular
for the monomial sections theta and sigma_function^2, zeros
correspond for all a in O_K. Their zero loci are t+Lambda and
Lambda respectively. Since 2 n^2 w=Omega belongs to Lambda_C,
v=2 n^2 w' belongs to Lambda_D by the second zero comparison.
The point v is chosen before any individual s in S.

Fix s in S. Let F_C(z)=(U_(s Omega) theta_C)(n z),
F_D(z)=(U_(s v) theta_D)(n z). These are homogeneous sections
of degree n^2 since n*s is integral and n*s*Omega, n*s*v are
periods. Apply transport to F_D to get g on C. We prove
g vanishes on every zero z of F_C. Such z satisfies
n z+s Omega+t_C in Lambda_C. Since 2t_C is a period, write
    z=(b-2ns)w,    b in O_K,
by multiplying the lattice equation by 2n and using
Lambda_C=Omega O_K. At this point
    n (b-2ns)w + s(2n^2 w)=n b w.
The same exact cancellation holds with w'. Since nb is integral,
the theta zero comparison makes theta_D(nb w') zero.
The nonzero exponential in U preserves zeros; hence F_D vanishes
at (b-2ns)w'. Now b-2ns is integral, so the transported section
comparison makes g(z)=0. No absolute values of tau enter.
The zeros of F_C are simple (theta simple zeros, n nonzero).
Section division (same degree and holomorphic quotient with
trivial multiplier) makes g=c F_C. This is the actual source
section_division argument, not a dimension-only assertion.

## 2. The missing scalar is exactly one, including the zero case
Put z_C=n^2 s w, z_D=n^2 s w'. Then s Omega=2z_C and s v=2z_D.
Use the SAME conjugate point transport on both F_D and the
untranslated section theta_D(n dot), at a=-ns. Because theta is
even and both sections have degree n^2, the same multiplier
M=mu^(n^2 N(ns)) is used in both comparisons (if ns=0, directly
use the constant coefficient comparison). The native identities are
    (U_(2z) theta)(-z)=theta(z),
    theta(z)=0 => (U_(2z) theta)(0)=-1.
The first follows from the exact shift exponent at -z; the second
uses the lattice multiplier for 2z, a doubled point in the theta
zero coset, not a freely chosen sign.
Thus
    c theta_C(z_C)=M tau(theta_D(z_D)),
      theta_C(z_C)=M tau(theta_D(z_D)).
If theta_C(z_C) !=0, cancel it. Otherwise theta_D(z_D)=0
(M !=0), and the constant coefficients in Taylor(g)=tau Taylor(F_D)
give c*(-1)=tau(-1)=-1, so c=1. For s=0 directly compare the
constant 1 of both unshifted theta series. No division by a
possibly vanishing theta value remains.
Finally apply sigma to Taylor(g)=tau Taylor(F_D) and cancel
the coefficientwise scale n^k, nonzero for every k>=0 and fixed
by sigma. This gives the required exact simultaneous identity
    sigma Taylor(U_(s Omega) theta_C)
      = Taylor(U_(s v) theta_D),   every s in S.
It supplies the finite-S premise used in RUN67's compact-adelic
cluster construction. Retain the homogeneous section transport,
curve zero loci, simple-zero and multiplier identities, and
section division as upstream mathematical inputs.

## 3. A single period unit for all conjugates
Let h=|Cl(K)|>0, and choose one nonzero fractional ideal A_c in
each class c. Squaring permutes the classes (odd class number).
Set B_c=A_(c^2)/A_c. Then [B_c]=c and product_c B_c=O_K,
exactly, not merely up to a principal ideal.
For the original C choose CM curves D_c and u_c !=0 such that
    Lambda_(D_c)=u_c B_c Lambda_C.
The isogeny-integrality lemma applies to every scalar in u_c B_c
and, using the inverse inclusion, to every scalar in
u_c^-1 B_c^-1. Fix an arbitrary prime p and embedding iota.
Since the product of the B_c is O_K, 1 is a finite sum of
products of one member from each B_c. Multiplying this sum by
product u_c and using the ultrametric triangle inequality shows
|iota(product u_c)|<=1. Apply the same argument to inverse ideals
and inverse scalars to obtain |iota(product u_c)^-1|<=1.
Both products are nonzero, so equality holds. This does NOT
claim each u_c separately is a p-adic unit.

Write Delta_c=a1(D_c)^4-64, the actual Weierstrass discriminant.
Each is nonzero and a p-adic unit by norm_disc_eq_one. Choose
one complex U satisfying
    U^(12h)= product_c u_c^12 Delta_c.
The right side is nonzero, hence U!=0. Taking p-adic absolute
values gives |iota(U)|^(12h)=1, so |iota(U)|=1 for every p and
every embedding. U is chosen before sigma. No absolute values
are used to define U, which must be conjugated as a complex
field element at the actual caller.

The conjugate-isogeny lemma transports each forward inclusion
and its inverse: since sigma fixes K, for E_c=D_c^sigma,
    Lambda_(E_c)=sigma(u_c) B_c Lambda_(C^sigma).
Consequently the E_c range over the ideal classes once (the
class of Lambda_(C^sigma) is a fixed translation), and with
A=area(C^sigma)>0,
    A_c'=area(E_c)=|sigma(u_c)|^2 N(B_c) A.
Norms of fractional ideals are positive, multiplicative; their
product is 1. Also Delta(E_c)=sigma(Delta_c).
Take sixth powers to avoid any ambiguity of roots:
    product_c (A_c'^6 |Delta(E_c)|)
      = A^(6h) |sigma(U)|^(12h)
      = (A |sigma(U)|^2)^(6h).
Taking real logarithms and dividing by 6 gives the exact identity
    sum_c (log A_c'+ (log |Delta(E_c)|)/6)
      = h log(A |sigma(U)|^2).
No additional discriminant or norm factor survives.

## 4. Kronecker sum, exact constant and generator caller
Put k=2/sqrt(d)>0, and gamma=Euler's constant. The pinned
kronecker_limit applied to each E_c produces F_c(s) on 1<s<2
with right limit F_c(1)=pi*k and right derivative
    F_c'(1)=pi*k [2gamma-log(A_c'/(k*pi^2))
                          -(log |Delta(E_c)|)/6].
For a lattice t I in a fractional ideal class, its area is
|t|^2 N(I) sqrt(d)/2. Hence |ty|^2/(k area)=|N(y)|/N(I).
The map y !=0 -> (y) I^-1 ranges over integral nonzero ideals
of class [I]^-1, and each ideal has exactly w_K=|O_K^times|
generators in this parametrization (finite for imaginary
quadratic K). The zero term is zero as in the native real-rpow
convention. Since the E_c cover all ideal classes, summing their
absolutely convergent Epstein series gives
    sum_c F_c(s)=w_K (s-1) zeta(s) L(s,chi_K).
Here the Euler factors agree at split, inert and ramified primes
by the exact quadratic zeta factorization, not RH. At s=1 the
right side and its right derivative are respectively
    w_K L(1),   w_K [gamma L(1)+L'(1)].
Equality on (1,2), continuity and uniqueness of right
derivatives give w_K L(1)=h pi k>0. Thus L(1) !=0 is derived
here without a zero-free conjecture. Dividing the derivative
identity by pi*k, taking real parts and using that value gives
    sum_c [2gamma-log(A_c'/(k*pi^2))
                -(log |Delta(E_c)|)/6]
       = h [gamma+Re L'(1)/L(1)].
Insert the exact logarithmic product from section 3, cancel
h>0, and exponentiate:
    A |sigma(U)|^2
       = k*pi^2 exp(gamma-Re L'(1)/L(1)).
Since k=2/sqrt(d), this is precisely the constant
pi*exp(chowlaSelbergConst d)*(2*pi/sqrt(d)) in the native
chowla_selberg theorem. It is uniform for the SAME U under
ALL sigma, not a separate period normalization for each sigma.

At ConjugateGenerator.exists_isJetConjugate_generator the
chosen t is sigma(periodFactor s)/Omega_sigma*areaScale,
where Omega_sigma is from complex_multiplication_theta,
not U. The native equality for its norm uses both
area(C^sigma)=|Omega_sigma|^2 sqrt(d)/2 (RUN67) and the just
derived area(C^sigma)|sigma(U)|^2=k*pi^2 exp(ell).
Their common area cancels: |Omega_sigma|^2 |sigma(U)|^2
= (4*pi^2/d) exp(ell). This supplies the exact common-period
input to the existing norm_gal_vacuumRoot and native
bigOmega/areaScale/periodFactor calculation. Retain that
root norm theorem and definitions; do not infer any separate
formula for t without them. The period unit and finite-S
transport are now source-matched human derivations, with
foundational inputs listed explicitly.

## Dependency and verification ledger
Actual root path (source-visible): compact Main -> New.grh ->
star_inequality -> Data.short_forms -> A theta chain ->
exists_isJetConjugate_generator -> {complex_multiplication_theta,
chowla_selberg, norm_gal_vacuumRoot}. RUN67 left the finite-S
translation and common unit as gaps. Their human supplier
substitutions above retain conjugate_section, isogeny transport,
section division, curve/shift formulas, CM lattice existence,
genus theory, norm_le_one_of_isogeny, norm_disc_eq_one,
Kronecker limit and analytic zeta regularization, and all prior
A/B/C gaps. No global native graph pruning or axiom deletion.
Context key: compact pin, d, C,D,sigma, finite S, same n,w,w',mu,
and for the period the same indexed ideals, curves, U across
all embeddings. No URT or claimed RH import.
Lean/lake/elan unavailable locally. Actual published shared
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804
at cathedral-research-state:compute/rh-compact-primitives-replay-20261126/outputs/
reread: six named B/C theorem checks with only propext,
Classical.choice, Quot.sound; A build 124 after 2700.11s,
all_requested_checks_ok=false, full_RH_replay=false.
Native rh_scan/prune/reduce/auto/frontier not executed on this
compact context; no fresh PASS. Certificates below are prepared
scalar sublemmas and native declaration/axiom probes, uncompiled.
No numerical regressions and no independent whole-proof audit.

RESUME HERE: reconstruct the upstream exists_conjugate_section
at the actual IsogenyIntegrality caller, in particular the cubic
point matching and the nonzero homogeneous multiplier at the
theta-zero point; then trace norm_disc_eq_one and its 2-adic
good-reduction supplier (coordinate with kernel/literature).
Do not redo the torsion or period product. HANDOFF TO integration,
editor, audit and literature. Human RH reconstruction incomplete.
-/

namespace ThetaRun68

theorem torsion_recenter (n s b w : ℂ) :
    n * ((b - 2 * n * s) * w) + s * (2 * n ^ 2 * w) = n * b * w := by
  ring

theorem normalized_scalar (c x : ℂ) (h : c * x = x)
    (hz : x = 0 → c * (-1) = -1) : c = 1 := by
  by_cases hx : x = 0
  · have hc := hz hx
    linear_combination -hc
  · apply mul_right_cancel₀ hx
    simpa using h

theorem period_area_lock (A O U k r : ℝ)
    (hd : A = O * k / 2) (h : A * U = r) (hk : k ≠ 0) :
    O * U = 2 * r / k := by
  apply (eq_div_iff hk).2
  rw [hd] at h
  linear_combination 2 * h

#print axioms torsion_recenter
#print axioms normalized_scalar
#print axioms period_area_lock
end ThetaRun68

#check CMLattice.exists_taylorVia_twistedTranslate_theta
#print axioms CMLattice.exists_taylorVia_twistedTranslate_theta
#check CMLattice.chowla_selberg
#print axioms CMLattice.chowla_selberg
#check kronecker_limit
#print axioms kronecker_limit
#check Parameters.exists_isJetConjugate_generator
