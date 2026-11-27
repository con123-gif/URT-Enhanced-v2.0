import Lib.CM.Sigma.PadicSeriesDefs
import Lib.CM.LocalHeight.IsogenyIntegrality
import Mathlib.Tactic

/-!
COMPACT RUN68 — normalized addition, pole-order basis and exact section division.
27 November 2026. Human source-matched derivations; scalar certificates
prepared, NOT compiled. Credit Levent Alpöge, Luke Sernau, Anthropic
collaborators and Claude. Source lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, compact
manuscript 1a5e180894e9f437ed9454097c99896366afc188.
Latest peer kernel RUN42 67dc9549d479da2fda0e09707f4ad08ee67e165c
explicitly requests monomial span and normalized addition; its unit
discriminant and coefficient extraction are retained, not repeated.
Theta RUN68 3a912a78 and integration b1451de3 cover common CM period.
Own RUN67 6822e2d2 and previous graph/axiom evidence unchanged.

Sources (all retrieved at compact pin):
Lib/CM/Sigma/SigmaFunction.lean 08de17d5fa2f0e4c4cbc61c22d99a85ec367294e
148–183 sigma_mem_thetaSpace, sigma_neg, deriv_sigma_zero,
sigma_eq_zero_iff, sigma_add_mul_sigma_sub.
Lib/CM/Sigma/CurveTheta.lean cd276f383c2768ee6039051e407ecac800a7f0d7
81–121 normalization, 264–294 theta membership/zero/parity/square,
302–361 duplication, cubic, addition and phiThetaCube_spec.
Lib/CM/Sigma/PadicSeriesDefs.lean 5eebedb97cff53ded1241d70add1b515300368ca
16–83 monomialDeg, monomialSection_mem, section_division,
sections_le_span_monomialSection, twistedTranslate_comp_mem.
Lib/CM/LocalHeight/IsogenyIntegrality.lean
1b7411b4a950de12649c1f2cd171de834f8363fa 39–55, 85–117, 140–165
actual conjugate-section, coefficient integrality and isogeny consumers.

1. Sigma addition without a dimension-two theta-space decomposition.
Write S for the native sigma, W for Weierstrass P, and L for the
rank-two lattice. Keep the native existence and automorphy of S, oddness,
S'(0)=1, zeros exactly L, W periodic with principal part z^(-2)
and W' its derivative. The quasi-periodicity multiplier is
epsilon(l) exp(H(z,l)+H(l,l)/2) for l in L, with H holomorphic
linear in z, epsilon(l) a sign. All zeros are simple since
S'(l)=nonzero multiplier times S'(0). For fixed v outside L set

  A_v(u)=S(u+v)S(u-v)/(S(u)^2 S(v)^2).

The two sign factors square to one, and the H(v,l) terms cancel
before division. Thus A_v is elliptic. It is even by oddness of S,
and has only one possible pole modulo L, at zero, of order <=2.
Its Laurent leading term is -1/u^2, because S(v)S(-v)=-S(v)^2
and S(u)=u+O(u^3). Evenness rules out a simple-pole term. Hence
A_v(u)+W(u) is entire and periodic, bounded on a closed
fundamental parallelogram, and therefore constant by Liouville.
At u=v its value is W(v) (S(0)=0). Consequently
  S(u+v)S(u-v)=(W(v)-W(u)) S(u)^2 S(v)^2.
This proves the precise sigma_add_mul_sigma_sub statement from
standard Laurent and Liouville inputs; it does not require a
theta-space dimension formula at this caller. Do not delete
theta-space dimension dependencies from other consumers.

Differentiate the identity in v at v=u outside L (a neighborhood
avoids L). The left derivative is -S(2u) S'(0), the right
is W'(u) S(u)^4 since W(v)-W(u) vanishes there. Thus
  S(2u)=-W'(u) S(u)^4.
The square removes the sign only after this exact identity.

2. Normalized theta addition and both cubic generators.
Let t be the native nonlattice two-torsion, e=W(t), A=a1,
x(z)=W(z+t)-e, y(z)=(W'(z+t)-A x(z))/2.
In particular A^2=12e and W''(t)=2. The exact normalized
translated sigma is T(z)=exp(-H(z,t)) S(z+t)/S(t), from
CurveTheta 98–112: the constant exp(-H(t,t)/2) cancels in
the normalization. Thus T(0)=1, with simple zeros -t+L.
T is even: the ratio T(-z)/T(z) is 1 by S oddness and the
quasiperiod at 2t, as follows. S(t-z)=-S(z-t);
S(z+t)=epsilon(2t)exp(H(z-t,2t)+H(2t,2t)/2) S(z-t)
=-exp(2H(z,t))S(z-t), since t not in L. Substitute.
For w outside L, apply sigma addition with u=w, v=t,
and use S(w-t)=-exp(-2H(w,t)) S(w+t). This gives
  T(w)^2=(W(w)-e) S(w)^2.
For z+t outside L, apply the sigma addition identity with
u=z+t, v=w. The two exponential factors multiply to exactly
exp(-2H(z,t)), independent of w. Hence
  T(z+w)T(z-w)
    =T(z)^2 (W(w)-W(z+t)) S(w)^2
    =T(z)^2 (T(w)^2-x(z) S(w)^2).
Both sides are entire in w, so extend across L. This is
theta_add_mul_theta_sub, with no extra period scalar.

Alternatively setting w=-t in this same identity gives
T(z-t)T(z+t)=-T(z)^2 x(z) S(t)^2. By theta evenness
and its translation law at 2t (or directly S oddness and
sigma quasi-periodicity), the left hand product equals
-S(z)^2 S(t)^2: indeed T(z-t)=exp(-H(z-t,t))S(z)/S(t),
T(z+t)=-exp(-H(z+t,t)+2H(z,t)+2H(t,t))S(z)/S(t);
their product is -exp(2H(t,t)) S(z)^2/S(t)^2.
To identify the normalization without a modulus argument:
T(t)=0 and theta square near z=t gives
T'(t)^2=(W''(t)/2) S(t)^2=S(t)^2; the product formula
at z=0 or the explicit derivative T'(t)=
-exp(H(t,t))/S(t) shows exp(2H(t,t))=S(t)^4.
Therefore the product is exactly -S(z)^2 S(t)^2.
This uses W''(t)=2 and S'(0)=1, not an arbitrary rescaling.
It follows that S(z)^2=x(z)T(z)^2 off the theta zero.
Equivalently derive the same identity directly by putting
w=z+t in the theta-square identity and using the translated
sigma formula and the same constant relation.

Differentiate S^2=x T^2 on the open set. With G the native
entire function S(S' T-S(T'+A T/2)), the exact cancellation is
  G=(x'/2-A x/2)T^3=y T^3.
The cubic equation y^2+Axy=x^3+x gives the homogeneous
  G^2+A S^2 T G=S^6+S^2 T^4
on this open set and by the identity theorem on all C.
Also w=z in theta addition yields
  T(2z)=T(z)^4-S(z)^4
using T(0)=1 and S^2=x T^2, again extended by holomorphy.
For sigma duplication, put U=W(z)-e. The native cubic
and W''(t)=2 imply W'(z)^2=4U^3+A^2 U^2+4U.
Using T^2=U S^2 and the exact sigma duplication of section 1,
  S(2z)^2=(S(z)T(z))^2
              (4(T(z)^4+S(z)^4)+(A S(z)T(z))^2).
These supply the two actual duplication inputs and homogeneous
cubic used by kernel RUN42's naiveHeight_spec. No p-adic estimate
is inferred from the complex identity itself.

3. Pole-order proof of the exact section basis at every m >=0.
A section f in C.sections m is entire and has the SAME lattice
automorphy as T^m (CurveTheta 106–108, 264–267). Thus R=f/T^m
is elliptic meromorphic with only a possible pole at -t mod L,
of order at most m. Conversely multiplying an elliptic function
with this pole bound by T^m yields an entire section. The
automorphy factors are nonzero; the quotient is well-defined
on the complement and extends meromorphically.

In the local coordinate s=z+t, x=s^(-2)+O(1),
y=-s^(-3)+O(s^(-2)). Thus x^b y^c with b>=0,c in {0,1}
has EXACT pole order 2b+3c, leading coefficient (-1)^c, except
the constant (b,c)=(0,0). The positive pole orders represented
are precisely all integers >=2, uniquely: even orders use c=0,
odd orders >=3 use c=1. Descend from the largest actual pole
order r<=m; subtract the unique scalar multiple of the monomial
of order r to cancel its principal leading term. Every subtraction
reduces the pole order. The possible final simple pole has zero
residue: integrate around a translated fundamental parallelogram
with no poles on its boundary; opposite integrals cancel by
periodicity, and the sole residue is therefore zero by the residue
theorem. A simple pole with residue zero is removable. The remaining
entire elliptic function is constant by Liouville. This proves
  f=T^m sum_{2b+3c<=m,c<=1} d_bc x^b y^c
   =sum_{a+2b+3c=m,c<=1} d_bc T^a S^(2b) G^c.
There is no Riemann–Roch or dimension induction required. The
identity on the complement extends across theta zeros because all
exponents a are nonnegative and monomials entire. Conversely each
monomial is a section by periodicity of x,y and this identity.
Independence follows from the distinct highest pole orders.
For m=0 or 1 the sole monomial is T^m; for m>=2 the count
is 1+(m-1)=m. The native theorem only needs spanning, not this
extra count. This proves PadicSeriesDefs 65–76 without its
recursive section division/finrank theta-space route at this
particular caller. The original proof and all native dependencies
are retained; this is a human replacement, not kernel pruning.

4. Keep section_division and its exact isogeny caller independently.
For the actual native hypotheses D,y,m,k,S_sub,f,g,a, g(z) is
(U_y T_D)(a z), a nonzero. Its zeros are simple: the exponential
twist never vanishes, affine substitution has nonzero derivative
a, and T_D has simple zeros as in section 2. If f vanishes at
every zero of g then f/g has removable singularities at all those
points. Its automorphy is the quotient of that of f (degree
m+k) by g (degree m), hence that of degree k. The entire quotient
lies in C.sections k subset S_sub, so its product with g is f
everywhere by continuity. This is the exact 49–61 section_division
statement; no claim about division at multiple zeros for arbitrary
sections. This theorem remains independently available to the
isogeny caller (do not globally delete it because section basis
has a different human proof).

5. Actual A consumer bridge to prior peer, not a new assumed input.
For a given m, the basis yields R0(X) + Y R1(X) with degree
constraints 2b<=m or 2b+3<=m. If f is even then T,x even
(x(-z)=x(z) by 2t in L), while y(-z)=-A x(z)-y(z);
subtraction of the two expressions gives W'(z+t) R1(x(z))=0.
Since W' not identically zero, and x nonconstant, R1=0.
No division by 2 in the p-adic residue field is involved.
At t (theta zero), when m even only b=m/2,c=0 can survive
because a=0 forces c=0 by parity. Its value is
  f(t)=R0.coeff(m/2)*S(t)^m.
This supplies the two polynomial-form fields of
exists_eq_theta_pow_mul_of_norm_le 89–95,117, with exact
degree and parity. Kernel RUN42 has separately established the
simultaneous Gauss coefficient witness with D(X)=4X^3+A^2X^2+4X
unit Gauss norm from the unit discriminant; combine that proof
rather than claiming integrality just from this complex basis.
Together the actual section and coefficient suppliers feed
rescale_translate_eq_theta_pow_mul and
rescale_translatedWpDeriv_mem (140–159), and the common
conjugate-section construction at 39–55. Retain all the native
period, good reduction, coefficient, integral generator,
isogeny and theta-product/marked-Hecke premises in their
respective callers. No unconditional Data.short_forms, star,
primeError, RH or full reconstruction is asserted.

Source-visible original graph: short_forms <- marked local
Hecke and normal theta products <- formal parameter/isogeny
integrality <- monomial span and section_division, cubic
generators, theta/sigma duplication <- normalized theta addition.
New human derivation uses elliptic Laurent subtraction for
sigma and monomial span and one normalized shift cancellation
for addition. It supplies exact caller statements but no
elaborated edge deletion. Original and reduced graphs and axiom
evidence unchanged. Cache key (compact pin,C,D,t,m,k,z,w,a,y,
embedding,actual section,chosen normalization).
Local command -v lean/lake/elan returned none. No native
rh_scan/prune/reduce/auto/frontier replay; old pin different.
Actual CI state reread 27 Nov: status a56e2d3afb99ed8275e81fd63c8494306e57c43f
and targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804,
run 45803534769, six named B/C audits (propext, Classical.choice,
Quot.sound); A module timeout 124 after 2700.11s;
all_requested_checks_ok=false and full_RH_replay=false.
No simulation or fabricated test count. The small Lean scalar
certificates and source probes below are prepared, not executed.
Independent audit requested for the shift factor at t, simple
pole argument and exact polynomial coefficient extraction.

RESUME HERE: merge Sections 1–5 with kernel RUN42 and acceleration
RUN66 at the actual integral section/normal-form consumer. Trace
remaining normalized theta product / marked-Hecke caller,
especially finite Weil/CM compatibility and the local jet
integrality in its precise embedding context; do not rederive
the already integrated chain height. Native runner should audit
this local source cluster with matching toolchain before claiming
PASS; no protected workflow changes. HANDOFF TO integration,
editor, formal audit, theta, kernel, acceleration.
-/

namespace PrimeWindowRun68

theorem unique_pole_weight (b c b' c' : ℕ)
    (hc : c ≤ 1) (hc' : c' ≤ 1)
    (h : 2*b+3*c=2*b'+3*c') : b=b' ∧ c=c' := by omega

theorem even_top_weight (m b c : ℕ) (hc : c ≤ 1)
    (hm : m % 2 = 0) (h : 2*b+3*c=m) :
    c=0 ∧ b=m/2 := by omega

theorem sigma_square_duplication {K : Type*} [Field K]
    (s t u a : K) (h : t^2=u*s^2) :
    (4*u^3+a^2*u^2+4*u)*s^8 =
      (s*t)^2*(4*(t^4+s^4)+(a*s*t)^2) := by
  calc
    _ = (s^2*(u*s^2))*(4*((u*s^2)^2+s^4)+a^2*s^2*(u*s^2)) := by ring
    _ = _ := by rw [← h]; ring

theorem homogeneous_cubic {K : Type*} [Field K]
    (s t x y a g : K) (hs : s^2=x*t^2) (hg : g=y*t^3)
    (h : y^2+a*x*y=x^3+x) :
    g^2+a*s^2*t*g=s^6+s^2*t^4 := by
  rw [hg, show s^6=(s^2)^3 by ring, hs]
  linear_combination t^6*h

#print axioms unique_pole_weight
#print axioms even_top_weight
#print axioms sigma_square_duplication
#print axioms homogeneous_cubic
end PrimeWindowRun68

#check sigma_add_mul_sigma_sub
#check CMLattice.theta_add_mul_theta_sub
#check CMLattice.phiThetaCube_spec
#check CMLattice.θ_two_mul
#check CMLattice.σ_two_mul_sq
#check CMLattice.section_division
#check CMLattice.sections_le_span_monomialSection
#print axioms CMLattice.sections_le_span_monomialSection
#check CMLattice.exists_eq_theta_pow_mul_of_norm_le
#print axioms CMLattice.exists_eq_theta_pow_mul_of_norm_le
#check CMLattice.rescale_translate_eq_theta_pow_mul
#check CMLattice.rescale_translatedWpDeriv_mem
