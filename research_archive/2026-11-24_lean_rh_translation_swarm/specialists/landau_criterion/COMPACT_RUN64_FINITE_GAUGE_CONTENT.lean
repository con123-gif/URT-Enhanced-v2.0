import New.Filling.StandardLevel
import New.Filling.FiniteSystem

/-!
RUN64 — finite gauge content moment and integral group mass
2026-11-26. Human source-matched derivations, pending independent audit.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission read: current completion-first, primitive-closure, expanded-workload,
and mandatory unified engine. RUN63 retained this precise gauge chain.
Latest peers reviewed: 0f78c5b2 (B two-factor Laplace), f775ec50 (integration
period radius), de3f5a0b (A ordinary prime gauge, distinct from this B gauge).
Actual caller: New/Filling/FiniteSystem.lean:235-289, specifically
hF.groupMeasure_boxSet_le at 288 in exists_finite_sieveSystem. P is
IntegralPlace (LocProd T), not an arbitrary ring; T finite and star-stable.

1. Clearing columns and dimension surplus (StandardLevel:159-176)
Let n=Shape.n=rho+1, D=card iota, F has m+1 extra pairs, m<9n,
D>=13n. The native volumeExponent is s=D-(3n+m+2) (truncation
inactive). Let q=3rho, k=m+5. Then D=q+s+k, k>=m, s>=n-1,
and q+k<=12n+1. Exactly q rows are imposed in the matrix of
line 163, and the selected last s+k columns have the needed surplus.

At the concrete finite product of local fields A, R is a product
of DVRs. For any q by D matrix M over A, its kernel intersects R^D
in a saturated submodule at each component: multiply by a common
denominator, and the quotient embeds in a free module. Over a DVR
it is therefore a direct summand of rank >=D-q. Extend D-q basis
vectors of it to a basis of R^D, placing them in the selected
columns of V. Combine these componentwise to V in GL_D(R).
This proves the concrete caller instance of exists_mul_clear_cols,
without a rank equality assumption; the abstract native valPair
lemma is not removed at other consumers.

Use E=F.orthonormalPart, x in box, y=y0^-1 u y0 K in positions
(u in besselU, K in principal congruence subgroup), and N=y0 x^-1 E.
The native M consists of v, the last isotropic rows of N and the
first isotropic rows of (u^-1-1)N. Let Y be the selected columns of V.
Then vY=0, the last isotropic rows of NY vanish, and the first
isotropic rows of (u^-1-1)NY vanish. By the triangular Bessel
unipotent action (native apply_inr_of_mem_besselU), the other rows
of (u^-1-1)NY vanish too. Thus
  (xy)^-1 E Y = K^-1 x^-1 E Y.
Since x^-1 and E are integral and (1-K^-1)/g is integral, Y R^(s+k)
is contained in the actual W of Gauge.com. This uses the SAME
x,y,v and selected columns, no replacement of the position set.

2. A common majorant for both consumers (StandardLevel:177-188)
Put p=Y^*u0, with u0 the argument of the majorant, and
C(p)=contentIndex 0 p. If p_0 is not an A-unit, C=+infinity,
and the pointwise bounds are immediate. Otherwise select t in
A^x and r integral such that r.p=t and c p integral iff ct integral.
At the product of DVRs take in each component an entry of smallest
valuation and its coordinate selector. These combine to t and r;
t is an A-unit (not necessarily an R-unit). Consequently
  C(p)=md(t)^(-1).
For every a in R, w=Y(a bar r) lies in W and
  u0^* w=a bar t.
Thus the image volume is >= md(t), by star preservation of md.

For the other majorant, write the two arbitrary close pairs as
(a,a-g b), (c,c-g d), with a,b,c,d integral. Since g=bar g,
  [h(a,c)-h(a-g b,c-g d)]/g
      = h(a,d)+h(b,c)-g h(b,d) in R.
This uses the integral Gram and performs cancellation before
any estimate. Apply the defining universal condition to each
column Y_j in W. It implies bar(z) bar(p_j) in R, i.e.
z p_j in R, by star stability. Thus the second set is contained
in {z:z p integral}, also of volume C(p). One common measurable
C(Y^*u0) supplies both inequalities. Measurability is the native
measurable_contentIndex (unit-test and parameterized Haar volume).
No independent choice of t between the two consumers.

3. Exact ideal shells give the content moment
(FinitePlaceDensity:193-230; TorusMajorant:53-65)
General selected block size r=s+k, with k>=mu, omitted block
size q; D=q+r, d=D-s=q+k. Let beta be a unit of A and let
delta=md(beta)>0. Change variables z=beta V^* w. V^* is
measure preserving since its determinant is an R-unit; w with
beta w integral maps to z in R^D, with factor delta^(-D).
Almost every selected block has its chosen coordinate an A-unit:
zero in any field component is a null set. For such blocks,
let I=(z_selected)=(beta t), H=[R:I]>=1. Then
  C(p)=delta H.
The region where the selected block generates I has volume
at most H^(-r) in R^D, since all its entries are in I.
Its contribution is <=delta^(-D) (delta H)^s H^(-r)
=delta^(-(D-s)) H^(-k).
Sum over the actual finite-index ideals; these are countable,
and their zeta sum is finite by the native idealZeta<=2.
Since k>=mu, this yields exactly the native bound
  integral_{beta w integral} C(p)^s dw
     <= idealZeta(R,mu) md(beta)^(-(q+k)).
No issue at s=0: the integrand is one and the exceptional null
set may still be omitted. All powers here are natural; md(beta)
is positive finite. This is a direct proof of the concrete product
caller of lintegral_contentIndex_pow_le.

Take beta=alpha^j and mu=m. Write Lambda=2/md(alpha), alpha integral.
Then Lambda>=2, md(alpha)^(-1)<=Lambda,
and idealZeta(R,m)<=2 follows from the native zeta_rank.
The moment is <=Lambda^(1+j(q+k))<=Lambda^(99n(j+1)),
using q+k<=12n+1 and n>=1. Thus the actual Gauge.com integral
requirement is supplied, not merely the two pointwise inequalities.

4. Hyperbolic cone mass (FinitePlaceDensity:234-258)
Work first at beta=1 with p hyperbolic pairs, p-1>=mu+1.
Write the form as Tr(bar a.b) on A^p x A^p; delta0=skewUnit
(not the modulus delta above). For almost every a in R^p
choose t,r as in (2). The additive map
  b -> delta0 Tr(sum bar a_i b_i)
from R^p to the skew line has compact image L_a. It contains
(t bar t) times the integral skew subgroup: for x in that
subgroup after scaling, take
  b_i=tau delta0^-1 x (bar t)^-1 bar r_i.
These are integral, and Tr(tau)=1 gives the desired image x.
The subgroup has measure md(t), by skew modulus scaling,
star invariance of md and integral skew mass 1. Pushforward
of the normalized compact group Haar probability is normalized
Haar on L_a. Thus its mass on any skew neighbourhood B of zero
is <= skewMeasure(B)/md(t). Fubini then bounds normalized slab
mass by the s=1 content moment on R^p, namely <=idealZeta(R,mu).
To pass to the exact cone at zero use native
isDisintegration_quadricMeasure: the indicator of the compact
OPEN lattice is continuous and compactly supported, so its
quadric integral is continuous in the skew parameter. Average
over shrinking compact-open skew subgroups of positive measure.
The limit is exactly the value at zero, not an almost-everywhere
choice of density. This establishes the integral cone bound.

For arbitrary beta in A^x, use the native zero-cone flat chart
(t,w,a_skew) with first coordinate
  -bar(t)^-1 tau h(w,w)+t a_skew.
Under (t,w)->(beta t,beta w) this first coordinate scales by beta
too; a_skew unchanged. There are 2p-1 ordinary A coordinates
and one unchanged skew coordinate. Hence exact scaling gives
  coneMeasure {v:beta v integral}
  <= idealZeta(R,mu) md(beta)^(-(2p-1)).
The measure-zero nonunit chart coordinate remains null after scaling.
For the gauge at beta=alpha^j, p lies between m+1 and m+1+rho
with the original native rank guard; use the original
quadricMeasure_cone_le where its stronger rank hypothesis is needed.
In particular at each actual floor of F (m+1 pairs plus the
remaining floor pairs), card(FloorPairs)>=m+1, so the native
mu+1 guard holds. At alpha=1 the cone bound is simply zeta_R(m).

5. Actual group measure consumer
(StandardLevel:228-235; WeightPlancherel:49-52; FlatCharts:120-136,39-51)
Take gauge alpha=1: every size ball is R, volume 1, and all
vector-size sets are integral lattices. With the preceding
cone bound, the native hasFibreBound_floorQuadric_of_le
gives at size 7 a fibre majorant of integral <=Z=zeta_R(m).
Keep its actual chart-disintegration and fibre-recentering lemma
as a named supplier (not a new independent reconstruction here).
floorMassLe_one gives floor mass <=Z*vol(R)^D=Z.
Here the floor mass at a is the theta_a mass of sigma with
sigma g near a+1, uniformly for each g. This uses the actual
floor chart and support lemma, not a bound on the total theta_a.

Let U_l(c)=upperMeasure_l{g:g c near rho+2}. At l=n, the
remaining middle Haar measure has mass <=1 by measureH_spec.
At l>=n+1 the terminal point mass is <=1. For l<n, convolution
and support of the higher factors show that the integral is
over sigma for which sigma c is near l+1 (native
IsNear.of_floorGroup_mul); consequently
  U_l(c)<= Z^(n-l-1) * floorMass_l(c) <=Z^(n-l).
Induct backwards. The exact RUN63 mixed-floor congruence
and RUN62 Haar normalization at g=1 give unipotent product
mass 1; stackMeasure_zero_eq and unfold_besselU thus give
  groupMeasure(boxSet)=U_0(1)<=Z^n<=1+2^(-n).
This is the required input at FiniteSystem:288, alongside the
native floorZeroForm_le_main_term and massRatio estimate.
Keep those other hypotheses. No claim of the whole finite sieve.

Source ledger (compact pin):
New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271
Lib/SiegelWeil/Mass/TorusMajorant.lean 9228ab231ce49ed76c8548f2f06c74138e638b15
Lib/General/Measure/Place.lean 300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975
New/RealPlace/LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e
New/RealPlace/FlatCharts.lean cc98bd4c6c1bf499ec8298a4476f0715e9c3b2f4
New/RealPlace/WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd.
Original graph: valPair clear cols -> content existence -> com;
ideal zeta -> content moment -> cone -> gauge.fib; gauge and
fibre chart -> floorMassLe_one -> upperMeasure_isNear_le ->
groupMeasure_boxSet_le -> FiniteSystem -> enough_forms -> star.
Reduced human context-specific graph: DVR saturated kernel ->
same W and same content majorant; exact ideal-shell exponent ->
moment -> continuous slab density -> cone scaling; native fibre
bridge + floor support and RUN62/63 -> backwards mass product.
Do not remove shared original declarations or any axiom nodes.
Open: audit actual fibre-recentering and chart normalization,
the remaining Rallis/Siegel-Weil test-space and massRatio
suppliers, full finite sieve and global B assembly, other A/C
primitives. No new kernel-verified deletion.

Verification: local command -v lean/lake/elan gave no paths.
Actual compact CI compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json (run 45803534769) retrieved:
six named B/C declaration checks with propext, Classical.choice,
Quot.sound; module_1_build returncode 124, all_requested_checks_ok
false, full_RH_replay false. Old native engines are on long pin
40e56bab...; no execution on compact pin claimed. No redundant
numerical diagnostics. Following scalar certificate and native
probes are prepared, not compiled. Independent audit required.

RESUME HERE: prove exact fibre-recentering bridge FlatCharts:123-131
and its actual chart normalization if not merged; then trace
FiniteSystem:286-288 massRatio and the precise Rallis/Siegel-Weil
test-space input. Hand off sections 1-5 to integration/editor,
positivity, audit, literature, compact runner. Human proof incomplete.
-/

namespace CompactRun64

theorem dimension_surplus (n D m : ℕ) (hn : 1 ≤ n)
    (hm : m < 9*n) (hD : 13*n ≤ D) :
    let s := D-(3*n+m+2)
    let q := 3*(n-1)
    let k := m+5
    D = q+s+k ∧ n-1 ≤ s ∧ m ≤ k ∧ q+k ≤ 12*n+1 := by
  dsimp
  omega

theorem close_pair_cancel {R : Type*} [CommRing R]
    (g h1 h2 h3 h4 : R) :
    h1-(h1-g*h2-g*h3+g^2*h4) = g*(h2+h3-g*h4) := by
  ring

#print axioms dimension_surplus
#print axioms close_pair_cancel
#check IntegralPlace.exists_content
#check IntegralPlace.lintegral_contentIndex_pow_le
#check IntegralPlace.quadricMeasure_cone_le
#check IntegralPlace.IsStdLevel.gauge
#check IntegralPlace.IsStdLevel.groupMeasure_boxSet_le
#check Filling.IsFillingLevel.exists_finite_sieveSystem
#print axioms IntegralPlace.IsStdLevel.groupMeasure_boxSet_le
end CompactRun64
