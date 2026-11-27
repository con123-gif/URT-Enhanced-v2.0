import Lib.CM.KroneckerLimit.LogTheta
import New.Curve.FormalParameter
import Mathlib.Tactic

/-!
# RUN67 — simultaneous Teichmueller lifting at the actual formal-parameter caller
27 November 2026. SOURCE-MATCHED human derivation; independent audit and native
replacement replay outstanding. Credit Levent Alpöge, Luke Sernau, Anthropic
collaborators and Claude. Source pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, current manuscript
944957c6f43b63df7a845472b31492dc0ca1cb8f. Latest integration 219694f2
and editor cbe51302 read. Kernel RUN42 67dc9549 supplies unit discriminant,
homogeneous height and integral section quotient; prime RUN68 7fbfc4ba
supplies normalized addition and monomial span. Theta RUN69 3af9c4a3
supplies conjugate transport and takes canonical isogeny pullback.
Do not repeat those. RUN66 570210d3 retained with explicit correction below.

Sources (relative to compact/src):
Lib/CM/KroneckerLimit/LogTheta.lean 99b01af94328fe9bcfd29a14db9933e72ac5c626,
lines 94–183: normPairClosure, QuadField.exists_map_eq_and_map_star_eq_pow,
mem_normPairClosure_of_pow_eq, CMLattice.exists_log_theta.
New/Curve/FormalParameter.lean 61130bd5600a2b1f1679cfe0a18123d2c458d425,
lines 142–171: actual roots, projection, inverse and unit coefficient supplier.
Lib/CM/LocalHeight/IntegralParameter.lean 9dc955b1e8a0650c27c8eda49f6e4adaf94680bd:
IsSeriesGenerator and derivative stability (RUN66).
Lib/CM/FormalGroup/FormalHeight.lean 640cabefca81dde25d092fd6ac057c3bcdd3516e:
one_le_norm_coeff_translatedWp_nonsplit, actual log-theta consumer.

## 1. One residue lift for the element AND its conjugate

Let K=Q(sqrt(-d)), O_K=Z[omega], omega=(1+sqrt(-d))/2,
d prime 7 mod 8. Let phi:O_K -> k be a ring homomorphism into
a field of characteristic p, and q=primeNorm(d,p) (p^2 inert;
p otherwise). Let z^q=z. We require one a in O_K with
phi(a)=z and phi(conj a)=z^p, not two independent lifts.

If q=p, the roots of X^p-X in k are exactly the prime field:
the p distinct elements already exhaust the degree. Choose an
ordinary integer lift of z. It is fixed by conjugation and
z^p=z. This covers split and ramified primes, including 2
(which is split). No division by sqrt(-d) in the ramified case.

If p is inert, p is odd, p does not divide d, and
h=phi(omega) is a root of X^2-X+(d+1)/4 irreducible over F_p
(the usual quadratic splitting criterion, retained). Consequently
F_p[h] has p^2 elements, and h^p=1-h=phi(conj omega).
Every element of this field satisfies X^(p^2)=X, so its elements
are ALL roots of that polynomial in k, by the degree bound.
Write z=m+n h with m,n in F_p and choose integer representatives
m0,n0. Then a=m0+n0 omega gives the desired two equations:
phi(conj a)=m+n(1-h)=(m+n h)^p=z^p.
This is the native residue-lift theorem, with all cases included.
The field k need not be algebraically closed.

## 2. Simultaneous Teichmueller convergence by a geometric estimate

Let iota:C -> C_p be the native embedding and O its valuation
ring, k its residue field. The image of O_K is integral, as is
the conjugate image (algebraic integers satisfy monic equations).
Let |zeta|=1, zeta^q=zeta in C_p. Apply Section 1 to its reduction.
For the SAME a obtained above write
  iota(a)=zeta(1+u), iota(conj a)=zeta^p(1+v),
  |u|<1, |v|<1.
For any |w|<1 the binomial theorem yields
  |(1+w)^p-1| <= max(p^(-1)|w|, |w|^p).
All intermediate binomial coefficients divisible by p; terms
with j>=1 are bounded by |w| when |w|<=1.
Set c=max(p^(-1), |u|^(p-1), |v|^(p-1))<1.
Iterating shows for both errors that the norm after N p-power
iterations is at most c^N times its initial norm (the iterates
stay within the original radius). Thus for q=p^e,
  iota(a^(q^n)) -> zeta,
  iota(conj(a^(q^n))) -> zeta^p.
Here zeta^(q^n)=zeta and the same holds for zeta^p. Conjugation
commutes with powering. Therefore the actual sequence of pairs
  (iota(a^(q^n)), iota(a^(q^n) conj(a^(q^n))))
converges to (zeta,zeta^(p+1)). Each pair belongs to the defining
set of normPairClosure(d). This proves the native closure
supplier, without a p-adic logarithm or an additive-character
equivalence. Includes p=2, since the same estimate works then.
The statement is about one common quadratic-integer sequence.

## 3. Exact log-theta identity and correction to RUN66

Write theta(z)=1+O(z^2), sigma(z)=z+O(z^3), x=translatedWp.
The actual theta addition formula (prime RUN68) is
  theta(z+w)theta(z-w)=theta(z)^2[theta(w)^2-x(z)sigma(w)^2].
Differentiate twice in w at zero. The left is
2 theta(z) theta''(z)-2 theta'(z)^2; the right is
2 theta(z)^2(theta''(0)-x(z)).
Divide off theta(z)^2 near the origin, where it is nonzero,
then pass to Taylor coefficients and the field embedding.
For L=-log(theta) as a FORMAL series:
  L''=L2+x, L2=-iota(theta''(0)), L(0)=L'(0)=0.
No continuity of the complex embedding is used.

Let A=O[[phi]] with phi(0)=0, phi'(0)=1, and use RUN66
integral-generator/inverse and derivative stability. For each
nonzero a in O_K put b=iota(a conj a), alpha=iota(a).
Tate transfer and the quotient give
  phi(alpha z) in A,
  Q=exp(b L(z)-L(alpha z)) in A, Q(0)=1.
Hence Q'/Q=(bL-L(alpha z))' in A.
For a=0 the same three statements hold with 0,1,0 directly.
These statements persist on normPairClosure: compose with
the fixed tangent inverse of phi; each coefficient is a
polynomial in alpha,b with fixed field coefficients (formal
exponential of a constant-zero series is coefficientwise
finite), and the valuation ring is closed. Differentiation
and inversion of a unit-constant formal series are likewise
coefficientwise finite. This is not analytic convergence.

CORRECTION to RUN66 Section 5: the constant term of Q'/Q
is ZERO, not (b-alpha^2)L2. Apply derivative stability
to Q'/Q once more and take the constant term:
  ((bL-L(alpha z))'')(0)=(b-alpha^2)L2.
For a=omega and conj omega, b is the same. Subtract the
two second derivatives before taking the norm. Since
omega+conj omega=1, the result (choosing the order suitably) is
  iota(omega-conj omega)*L2=iota(sqrt(-d))*L2.
Its norm is <=1 because it is the constant coefficient of
a series in A. This fixes the derivative-order error in the
earlier human note and supplies the precise native bound
used in FormalHeight and FormalParameter. No change to native
statement, no extra integrality assumption.

## 4. Actual projection and inverse support at exists_formal_parameter

Set m=q-1>0, choose the native primitive mth root zeta.
Both m and every zeta^i are p-adic units. For each i,
zeta^i has qth power itself, so Section 2 and Section 3 give
phi(zeta^i z) in A. Consequently the SAME projected series
  T(z)=(1/m) sum_(i=0)^(m-1) zeta^(-i) phi(zeta^i z)
belongs to A. For coefficient n the multiplier is
  (1/m) sum_i zeta^(i(n-1)) = 1 if n=1 mod m, else 0.
This follows by multiplying the geometric sum by
1-zeta^(n-1) in the nontrivial case; no inequalities needed.
T is tangent: its constant is zero and its linear coefficient
is one. It generates A by RUN66. For its compositional inverse Z,
T(zeta z)=zeta T(z) implies Z(zeta z)=zeta Z(z), by composing
with the inverse and using uniqueness. Thus Z_n=0 unless
n=1 mod m, and Z-X is divisible by X^(m+1). This supplies
the exact hT, hZ and hX in the actual caller, using the same
root and parameter, not independently chosen integral series.
At m=1 the support statement is vacuous and the divisibility
is just tangency. Downstream first-unit coefficient and
exceptional rescaling bounds are RUN65 and kernel RUN41, not
rederived. Retain their exact height/Hasse hypotheses.

## Caller and dependency ledger

Original source-visible graph:
residue lift -> mem_normPairClosure_of_pow_eq -> exists_formal_parameter.hi
Tate/isogeny quotient + theta addition + derivative stability
-> exists_log_theta -> hi and nL
-> projected tangent generator + inverse support -> actual formal parameter
-> thetaProducts_normal_form -> marked gauge -> exists_indexDvd_Bmu_divisible
-> Data.short_forms -> star_inequality.
Reduced human graph: substitute Sections 1–4, with one common
residue lift, elementary contraction, corrected derivative order
and exact character projection. Ordinary quadratic splitting,
theta addition, isogeny quotient, integral coordinate inverse,
and downstream unit coefficient bounds remain explicit.
The already derived good-reduction and section-span blocks
are supplied by kernel RUN42 and prime RUN68; integration should
use those, not repeat them. Canonical pullback and downstream
actual marked Hecke caller audit remain pending. Other A/B/C
frontier nodes remain. No elaborated edge deletion, no changes
to original/reduced graph files or native axiom ledger.
Context key: compact pin, d,p,embedding,actual residue map,
zeta, same a and conjugate, same C, phi, projected T and inverse Z.
No URT, no import of claimed RH theorem, no speed claim.

Local lean/lake/elan absent. Actual CI status reread:
cathedral-research-state:compute/rh-compact-primitives-replay-20261126/
status.json a56e2d3afb99ed8275e81fd63c8494306e57c43f,
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804.
Run 45803534769, A build timeout 124 (2700.11s), six B/C named
checks only with propext, Classical.choice, Quot.sound;
all_requested_checks_ok=false, full_RH_replay=false.
No new native rh_scan/prune/reduce/auto/frontier. Old-pin engines
do not verify compact work. Below are prepared scalar bridges
and named probes, not compiled; no finite simulations.

RESUME HERE: integration/editor correct RUN66 Section 5 wherever
used (second derivative, not first), merge Sections 1–4 at actual
FormalParameter lines 152–171. Read theta worker's canonical pullback
before next run; then audit its exact composition with the marked
normal-form/Hecke witnesses and check remaining finite Weil supplier.
HANDOFF TO integration, editor, theta, formal audit, kernel runner.
Human RH reconstruction incomplete.
-/

namespace AccelerationRun67

theorem conjugate_second_derivative {K : Type*} [Field K]
    (a b N L : K) (h : a+b=1) :
    (N-b^2)*L-(N-a^2)*L=(a-b)*L := by
  calc
    _=(a-b)*(a+b)*L := by ring
    _=(a-b)*L := by rw [h, mul_one]

theorem contraction_step (x y c r s : ℝ)
    (hx : 0 ≤ x) (hy : y ≤ max (r*x) (s*x))
    (hr : r ≤ c) (hs : s ≤ c) : y ≤ c*x := by
  exact hy.trans (max_le (mul_le_mul_of_nonneg_right hr hx)
    (mul_le_mul_of_nonneg_right hs hx))

theorem character_sum_vanish {K : Type*} [Field K]
    (z S : K) (hz : z ≠ 1) (h : (1-z)*S=0) : S=0 := by
  exact (mul_eq_zero.mp h).resolve_left (sub_ne_zero.mpr (Ne.symm hz))

theorem inverse_support_coefficient {K : Type*} [Field K]
    (u v a : K) (h : u*a=v*a) (hne : u ≠ v) : a=0 := by
  have e : (u-v)*a=0 := by linear_combination h
  exact (mul_eq_zero.mp e).resolve_left (sub_ne_zero.mpr hne)

#print axioms conjugate_second_derivative
#print axioms contraction_step
#print axioms character_sum_vanish
#print axioms inverse_support_coefficient
end AccelerationRun67

#check QuadField.exists_map_eq_and_map_star_eq_pow
#print axioms QuadField.exists_map_eq_and_map_star_eq_pow
#check mem_normPairClosure_of_pow_eq
#print axioms mem_normPairClosure_of_pow_eq
#check CMLattice.exists_log_theta
#print axioms CMLattice.exists_log_theta
#check CMLattice.exists_formal_parameter
#print axioms CMLattice.exists_formal_parameter
