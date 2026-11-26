import Lib.SiegelWeil.Mass.MassRatio
import Mathlib.Tactic

/-!
RUN58 — 26 November 2026, positivity geometry. Source-matched human proofs
of the conductor-stratified hermitian Gauss bound, uniform ideal-zeta
estimate and their actual consecutive-mass consumer (RUN57).
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, RUN57
c394200f842d717bebe747822752b7b7a0a5088e; read current manuscript
d185408f9b17703c84b1584444bfde1f65d57e74, unified witness
7ad9c7c64f53c621ad20422226ad9d0b756ee28e, recent audit commit
1b2053e998b7dec44dd22474669d9e4e842fa6db. Compact source modules:

Lib/SiegelWeil/Mass/TorusMajorant.lean 9228ab231ce49ed76c8548f2f06c74138e638b15
Lib/SiegelWeil/Mass/MassRatio.lean b1ed2f6ce2492042ffecbd0ba80df1614d79be04
Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff
New/Filling/FillingAdmissible.lean b52e37db6879e90b3592d2bc5d2a78140c79c86d
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271

1. The actual hermitian Gauss majorant, with exact normalization.
Let R=Ô E, E a CM field with the actual CMType/WeilData, A the
self-adjoint finite adeles, ψ the finite additive character in
TorusMajorant, C=codifferent E 1={b: ψ(bR)=1}. Haar on A gives C
measure 1. Haar on R has volume V=volÔ E>0. Use probability
Haar dm on R^n and put
  g_b=integral_R^n ψ(b(w*w-Γ)/2) dm(w).
Here Γ is the arbitrary finite adele of the native statement;
it contributes a unit-modulus scalar, so it drops out BEFORE
taking the norm. Let K_b={h in R: ψ(b h x)=1 for every x in R}.
This is an ideal: additive closure from character multiplication
and closure under multiplication by R from the universal x.
It is open: b times a sufficiently small open neighborhood of
zero is integral, and ψ is trivial on integral adeles.
Compactness of R makes q_b=[R:K_b] finite and positive.

Square the normalized integral and make the Haar-preserving
change (w,y)=(y+h,y). The half-character identity for the actual
self-adjoint b and hermitian cross term yields
  |g_b|^2 =
    integral_h ψ(b h*h/2) integral_y ψ(b h*y) dm(y) dm(h).
All integrands have modulus one and the domains are compact.
The inner integral is 1 when h belongs to K_b^n and is zero
otherwise: translate y by a vector for which the character
value differs from 1, using stability of R under conjugation.
Thus |g_b|^2 <= q_b^(-n), and |g_b| <= q_b^(-n/2).
This uses exact orthogonality before the triangle inequality,
not a pointwise bound of one on the whole character space.

The map b -> (x -> ψ(bx)) on R has kernel precisely C.
For each fixed ideal I of index q, all b with K_b=I induce
additive characters of R/I (K_b lies in the ordinary character
kernel, by taking x=1). There are exactly q characters of that
finite additive group, so this stratum has at most q cosets
of C, each of measure 1. No surjectivity of the b map needed.
All these cosets are measurable because C is compact open;
K_b is constant on each coset. The relevant finite-index ideal
set is countable (e.g. section 2, or finiteness of idealZeta).
Summing the estimate, not an unnormalized Fourier amplitude:
  integral_A |g_b| db <= sum_I q_I^(1-n/2)
                      <= sum_I q_I^(-μ) = idealZeta R μ
when n>=2(μ+1). Restoring V^n gives exactly
  integral_A |F(b)| db <= idealZeta R μ * V^n.     (G)
This is a direct source-matched human replacement for the
lintegral_le_idealZeta_mul specialization in
lintegral_gauss_sum_le_idealZeta. The general measure-cover
lemma is unnecessary for THIS consumer; still used elsewhere.
Its native hypothesis idealZeta<=2 ensures finiteness. Our
direct count needs only finiteness, supplied by section 2.
No claim that its binder is removed in the Lean graph.

2. Uniform ideal zeta estimate, all number fields and powers.
Every finite-index ideal I of R contains q_I R, since the
finite additive quotient is killed by its cardinality. With
m=q_I, density of the integers of E in their profinite
completion gives O_E/m O_E = R/m R. Thus contraction J=I∩O_E
has the same quotient cardinality, and extension recovers I.
Equivalently use the source map_under_Ô and bijective_quot_Ô
with q_I in J. Therefore idealZeta R s <= ζ_E(s).
For each rational prime p, at most d=[E:Q] primes lie above
p and each norm is p^f with f>=1. Their Euler factors are
bounded by (1-p^(-s))^(-d). For s>1 these positive products
converge, so ζ_E(s)<=ζ(s)^d. No zero-free region or RH-scale
bound used; only the absolutely convergent Euler product.
For s>=4, the integral test gives
  log ζ(s) <= ζ(s)-1
    <= 2^(-s)+ integral_2^∞ t^(-s)dt
    = 2^(-s)(1+2/(s-1)) <= 2^(1-s).
Let a be the nonnegative integer power called n in the native
idealZeta_intAdeles_pow_le, and assume a*d<=2^v. Set s=u+v+4.
Then for z=2^(-u) in (0,1],
  log(idealZeta R s)^a <= a*d*2^(1-s) <= z/8
      <= z/(1+z) <= log(1+z).
Here the left expression means log((idealZeta R s)^a).
The last inequality follows by integrating 1/(1+t) on [0,z].
Exponentiating proves exactly the native estimate
  (idealZeta R (u+v+4))^a <= 1+2^(-u).            (Z)
This also covers a=0. All bounds are uniform in the field,
rather than fixed-field or asymptotic estimates. The real
inequality is transported to ENNReal because the zeta sum
is finite; the unit ideal supplies positivity. No need to
use the native general complex Euler-product log estimate
in this positive real specialization. Keep that theorem
for other consumers and do not claim a global deletion.

3. Actual MassRatio application.
The native rank is n=j+1, μ=(u+1)+u+4=2u+5, a=1, v=u;
8f<=2^u implies [E:Q]=2f<=2^u, and j>=4u+12
implies n>=2(μ+1). By (Z), idealZeta<=1+2^(-(u+1))<=2.
For Γ=1, F(b)=V^n on C: w*w-1 is self-adjoint integral
and is t+star(t) with t=(w*w-1)*traceOneAdele integral.
The actual ψf_half identity reduces its phase to ψ(b t)=1.
Since C has mass 1, (G) implies the complementary bound
  integral_(A outside C) |F(b)| db <= 2^(-(u+1)) V^n.
Consequently (without bounding the total integral first)
  integral_A F(b) db = V^n(1+e), |e|<=2^(-(u+1)). (M)
This also establishes absolute integrability of the finite
singular series. The actual one-vector Siegel-Weil identity
classSum_norm_eq and norm-one stabilizer mass identity give
  M_j=M_(j+1) rd^(f/2) (π^(j+1)/j!)^f V^(j+1) (1+e).
All masses are positive; hence e is real and 1+e>0.
V=(2/rd)^f. The reference ratio is therefore
  M_(j+1)/M_j = [rd^(j+1/2) j!/(2π)^(j+1)]^f/(1+e).
Integrate the derivative e/(1+te), 0<=t<=1:
  |log(1+e)| <= 2|e| <= 2^(-u) <= 2/2^u.
This recovers the original native abs_log_mass_ratio_sub_le
budget (with unused slack), without revising any downstream
constants. Substituting at FillingAdmissible and RUN57 (P2)
closes the human elementary analytic supplier of that
conditional packet comparison. The one-vector Siegel-Weil
identity itself is NOT established by the Gauss bound.

4. One-vector real-place normalization, exact substep.
The source integral_fourierChar_mul_inv_pow is ordinary
Fourier inversion. For integer k>=1, the function
h(t)=1_(t>=0) t^k exp(-t)/k! is continuous and integrable.
Its Fourier transform with convention exp(-2πizt) is
(1+2πiz)^(-(k+1)) by the Laplace gamma integral; its transform
is integrable since k+1>=2. Fourier inversion for x>=0
then gives integral exp(2πixz)(1+2πiz)^(-(k+1)) dz
= x^k exp(-x)/k!. In the actual OneVector proof the product
of complex Gaussian integrals supplies π^n times this
expression with k=n-1; the exp(-α_v) is cancelled by
the chosen exp(sum α_v) factor of the test vector g.
This recovers π^n α_v^(n-1)/(n-1)! with no extra π or 2.
Still required: the native siegel_weil identity, the actual
adapted vacuum realizing the prescribed mixed test, the
self-adjoint rational-adelic fundamental domain/unfolding
and rational Lagrangian support. The above is only the
archimedean normalization, not an independent proof of SW.

5. Shared supplier and verification boundary.
FinitePlaceDensity.mass_near_quadric_off_places_le uses (G)
at the actual codifferent scale; FiniteSystem uses (Z) and
that density estimate; GlobalToLocal uses (Z) after
idealZeta_locProd_le. Preserve the actual local level,
scaled self-adjoint character, density/disintegration
and compact support premises of those consumers. The same
uniform bound is reused; no fresh assumed zeta hypothesis.
Graph (human source-matched):
finite-index ideal contraction + Euler product + tail
 -> (Z); finite orthogonality + conductor count -> (G);
(G)+(Z)+codifferent main term -> (M);
(M)+one-vector SW+norm-one mass -> MassRatio
 -> RUN57 P2 -> FillingAdmissible -> SchurTest -> Theorem B
 -> star_inequality. The other B primitives survive.
Original/reduced native graphs and axiom ledger unchanged.

Executed Python exact Fraction budget regression: 400
(u,v) cases, and rank guard regression: 1000 u cases.
These only cross-check elementary constants, not the
analytic or geometric theorems. The universal estimates
are the mathematical arguments above. Lean/Lake absent.
Actual older baseline status JSONs on cathedral-research-state
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (strip) and
7da354941e402b6f8b364ed03d8c5c82d27b7717 (prune) read as
pass/returncode 0; compact RUN28 Actions jobs 139837755331,
139837856843,139846428086 success. These are NOT compilation
evidence for RUN58. Native engines not executable here and
older pin not mixed with compact imports. This file is
prepared for the shared compact replay; no new axiom
evidence, no root theorem imported or root closure claimed.

RESUME HERE: finish OneVector.classSum_norm_eq's exact
rational/adelic Fourier unfolding (coordinate with theta
and literature lane); then connect to the common finite
density supplier at FinitePlaceDensity rather than repeat
the proved positive-real tail and conductor estimates.
Independently tackle local Bessel band/near-one energy if
SW already covered. HANDOFF TO integration/editor/audit
and shared compact verification lane. Keep deep SW and
remaining B primitives open until actually justified.
-/

namespace RHPositivityGaussIdealZeta

theorem mass_rank_guard (u j : ℕ) (h : 4*u+12 ≤ j) :
    2*((u+1+u+4)+1) ≤ j+1 := by omega

theorem conductor_exponent_guard (mu n : ℕ) (h : 2*(mu+1) ≤ n) :
    2*mu+2 ≤ n := by omega

theorem complement_budget (total main V r : ℝ)
    (h : total ≤ (1+r)*V) (hm : main = V) :
    total-main ≤ r*V := by
  rw [hm]
  linarith

theorem tail_budget (a d bound t : ℝ) (ht : 0 ≤ t)
    (h : a*d ≤ bound) :
    a*d*t ≤ bound*t := mul_le_mul_of_nonneg_right h ht

theorem log_slack (e r : ℝ) (h : |e| ≤ r/2) :
    2*|e| ≤ r := by linarith

#print axioms mass_rank_guard
#print axioms conductor_exponent_guard
#print axioms complement_budget
#print axioms tail_budget
#print axioms log_slack
#check lintegral_gauss_sum_le_idealZeta
#check idealZeta_intAdeles_pow_le
#check volume_codifferent
#check integral_fourierChar_mul_inv_pow
#check classSum_norm_eq
#check abs_log_mass_ratio_sub_le
#print axioms lintegral_gauss_sum_le_idealZeta
#print axioms idealZeta_intAdeles_pow_le
#print axioms abs_log_mass_ratio_sub_le

end RHPositivityGaussIdealZeta
