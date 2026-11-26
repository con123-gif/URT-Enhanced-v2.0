import New.Filling.FillingAdmissible
import Mathlib.Tactic

/-!
RUN57 — 26 November 2026. Source-matched human proof of the actual packet
normalization at Filling.IsAdmissible.packetConst_mul_mass_le, and its
mass/degree/class suppliers. Attribution: Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; RUN56
5a7952de01b6d1cbd1798cbd640edd41ba4ffd56; latest lead WIP
a2eff659f493fee4a703d454d9a2450befde6fb4 read. Lead has incorporated
RUN56 support, but explicitly retains packet/Siegel mass prerequisites.
No RH root import. No native replay claimed.

Pinned source bodies retrieved:
New/Filling/FillingAdmissible.lean b52e37db6879e90b3592d2bc5d2a78140c79c86d
New/Filling/DegreeBounds.lean ce002c043a5f5e1d8f5902fe47eebd7ae03c87ba
New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
Lib/DiscreteSeries/Haar/CompactDualMeasure.lean f635acc5ac6f4c029eaa652374087216a1dccb6a
Lib/SiegelWeil/Mass/MassRatio.lean b1ed2f6ce2492042ffecbd0ba80df1614d79be04
Lib/Adelic/Transference/MassBasic.lean ab9b5714cab038182220a2e1631a96f2de1ddf78
Lib/SiegelWeil/OneVector/OneVector.lean d9f90a7b5170a98542f261fa08b05aee695a6bff

1. The two exact finite counts.
Write h=varrho, n=h+1, r=k+2h+1, l=r-k, f=numInfPlaces E,
d=h(k+h), H=|reducedImage besselH|, U=unipOrder=g^(f h(2k+2h+1)),
C=card Classes, I=card BesselCoord, M_j=mass E j, D=besselDegree,
V=volO=(2/rd)^f, disc=|disc E|=rd^(2f).
All scalar divisions below have positive finite denominators.
The actual comap of latStabilizer to Kf(X0) is the level preimage
of the product of inverse-transpose vector stabilizers at the
chosen split places. The vector is e_(k0), not its line. The
lattice condition is reduction of the indicated row/column to
e_(k0), from inclHFin_mem_latStabilizer and the native divisibility
criterion. Surjective split reduction and independent factors
give index (N^k-1)^f by transitivity of GL_k(F_N) on nonzero vectors.
Class sums weight each class by the inverse order of its
automorphism group. Refining a compact level multiplies the
weighted sum by the index: for each finite automorphism group A
acting on the finite coset set X, sum_orbits 1/|A_x|=|X|/|A|.
The actual principal column level has trivial automorphisms
(D.classAut_columnLevel_eq_bot). Refine first to the stabilizer
and then through its reduction kernel, whose index is H.
Thus the exact native class count is
    C = H (N^k-1)^f M_k.                             (C1)
Do not replace M_k by an unweighted class number.
The other count is |Sbar|=H U. The native GlobalToLocal proof
uses the actual compact local unipotent mass U * mass_u=1,
pushforward to the reduction kernel and disjointness of the
unipotent and middle images. Their multiplication bijects
onto the Bessel image: any Bessel element splits as u h and
integrality of the product forces integrality of h and then u.
This retains the finite reduction, disjointness and measure
supplier; it does not count independent arbitrary subgroups.

2. Exact packet equation at the actual caller.
Let F=frameScaleProd, nu=unipCovolume, c*=siegelConst,
cG=openCellConst. The source defines
    nu F = U N^(-kf) V^(-d) disc^(h/4),
    c*=(pi^k/((k-1)! N^k))^f disc^(1/4) V^k,
    P=packetConst=H U^2 C c*,
    mainEnergy=C^2 I^2/(D M_r).
Divide the left side of packetConst_mul_mass_le by its
right side WITHOUT (1+b^-9), using the actual D and I:
    Q=P / [mainEnergy D cG^f/V^n * (nu F/I)^2].
All of D,I,F,U,H cancel using C1 before taking estimates:
    Q=(M_r/M_k) (N^k/(N^k-1))^f
      (pi^k/(k-1)!)^f V^(k+n+2d) disc^(1/4-h/2)/cG^f. (P1)
This is the same packet used by RUN56, not an independent
normalization. In particular no bound on formal degree or
Bessel dimension is needed in THIS field of IsAdmissible.
They remain needed for its other fields.

Set sigma_j=2 pi^j/(j-1)!, V_j=prod_{i=1}^j sigma_i.
Native cG=V_k/V_r * sigma_k, so
    cG=(2 pi^k/(k-1)!) prod_{j=k}^{r-1} j!/(2 pi^(j+1)).
For k<=j<r define the signed discrepancy
    e_j=log M_(j+1)-log M_j
        - f[(j+1/2)log rd + log j! -(j+1)log(2pi)].
MassRatio bounds |e_j|<=2/2^h, with EXACT guards
8f<=2^h, 4h+12<=j and the CMType/WeilData of the actual E.
Telescoping gives M_r/M_k as exp(sum e_j) times the product
of the displayed reference ratios. Substitute before bounding:
all factorials and pi factors cancel. Write A=k+n+2d and
S=sum_(j=k)^(r-1)(j+1)=l(k+h+1). Then the remaining powers
of rd and 2 have exponents, respectively,
    f(S-l/2-A+1/2-h)=0,
    f(-1-S+l+A)=0.
Therefore the exact decisive equation is
    Q = exp(sum e_j) * (N^k/(N^k-1))^f.              (P2)
It follows that log Q <= 2l/2^h+2f/N, because N>=2,k>=1,
log(1+1/(N^k-1))<=1/(N^k-1)<=2/N.
The ACTUAL native Data.HasLogBound guard in FillingAdmissible
is l*2/2^h <= log(1+b^-9)-2f/N. Keep this as the original
size supplier (not an asymptotic estimate). It proves
Q<=1+b^-9, exactly the desired packet field.
The factorial, representation degree and arbitrary frame weights
have disappeared from this normalized comparison, not from
the whole theorem. Substitute this field into RUN56 P1 and
SchurTest.le_classSize_and_cellMass_le; the other local support,
cut, and leading-minor premises stay unchanged.

3. Consecutive mass ratio: actual deep supplier, not assumed RH.
MassBasic.classSum_card_norm_one_eq_mass counts norm-one vectors
in each integral lattice of rank j+1 with automorphism weights.
Rational Witt transitivity and integral orthonormal extension
at finite places identify the stabilizer with the standard
rank-j unitary group; stably unramified is required. The
weighted orbit formula of section 1 then gives exactly M_j.
OneVector.classSum_norm_eq with alpha=1, K=Kf and the indicator
of the standard lattice gives
    M_j = M_(j+1) disc^(1/4)
          (pi^(j+1)/j!)^f integral F(z) dz,
where F(z)=integral_(x integral) psi_f(z(x*x-1)/2) dx on
self-adjoint finite adeles. Retain the source measures
(volO and volume_codifferent), rank>=3, compact support,
level invariance and WeilData. The native codifferent is
the region on which the phase is one: the trace-one adele
and half-character identity are essential. MassRatio splits
this integral into its positive main term and complementary
complex error, then uses lintegral_gauss_sum_le_idealZeta
and idealZeta_intAdeles_pow_le with 8f<=2^h, j>=4h+12.
In the source normalization the resulting relative error has
modulus <=2^(-h). The elementary last step is
|log(1+w)|<=2|w| for |w|<=1/2 (integrate the derivative
w/(1+t w), t in [0,1]); take the real logarithm of the
positive mass ratio, with the sign reversed for the inverse.
This gives |e_j|<=2/2^h. The compact source explicitly uses
Complex.norm_log_one_add_half_le_self. This section maps the
actual mass proof and identifies its remaining deep primitive:
the stated Gauss integral domination by ideal zeta, the
uniform ideal-zeta bound, and the one-vector Siegel-Weil
identity themselves are not reproved here. No appeal to a
claimed RH theorem or hypothetical RH-scale analytic bound.

4. Separate degree and coordinate fields (same actual system).
FillingData.exists_besselSystem uses the discrete-series formal
degree, branching and the same Schur representation, not an
independently normalized peak. DegreeBounds rewrites its degree
by the Weyl product:
    D = prod_v prod_{j=k-1}^{r-1}
          [prod_{i=0}^{j-1}(p_vi-p_vj)/j!],
where p is Data.rowParameter. Source strict antitonicity gives
each gap>=1; the first k-1 gaps in each factor are >= nominalWeight(v),
and the upper gap bounds use rowParameter_sub_mem/log_w_le,
with log gap<=log nominalWeight(v)+1/x. There are
r-(k-1)=m such factors. Taking logs and adding the exact factorial
sum gives the native lower and upper bounds
    m(k-1) sum_v log w_v
    <= log D+f sum_{j=k-1}^{r-1} log j!
    <= m r sum_v (log w_v+1/x).
No replacement of the formal-degree formula by an estimate
for an unrelated representation. The actual Bessel coordinate
space at v is isomorphic (via the chosen invertible pairing
and schur_one_row_eq_symPowMatrix) to a one-row symmetric
power on k letters. Its cardinal is binomial(k+a_v-1,k-1)
for a_v=kappa(v,1)<=a. By the elementary bound
binomial(s,t)<=s^t and k>=1, it is <=(k+a)^k.
Product over f places and (k-1)!<=k^k give
    I ((k-1)!)^f <= [k(k+a)]^(kf)
                     <= ((sqrt(sqrt b)^5)^k)^f
with the original Data.HasLogBound guard k(k+a)<=b^(5/4).
This reconstructs the quantitative bound
card_besselCoord_mul_factorial_le, conditional on the actual
Schur symmetric-power equivalence and original guard.
These are separate suppliers for the degree, energy and band
fields; no false claim that P2 removes them globally.

5. Reproducibility and status.
Executed in Python/SymPy: the two exponent residuals in P2
and the d sum are identically zero. Exact Fraction checks
over h=0..4,k=1..7,f=1..3 with rd=49, pi=22/7, N=3
returned the exact finite-index factor in all 105 cases.
These are algebra regression checks, NOT mass estimates or
experimental evidence for RH. They use rational pi only
to test a symbolic cancellation, not as a mathematical input.
Lean and Lake unavailable locally; the certificate below is
prepared, not compiled. Earlier strip/prune state statuses
read back as pass/returncode 0 (old pin). Actual compact
RUN29 status a56e2d3afb99ed8275e81fd63c8494306e57c43f
is error/returncode 1, not a full PASS despite successful
workflow recording; lead reports six native probes and A
timeout. RUN28 actions run 45799225653 completed success,
not evidence for these new proofs. No new native axiom
evidence; original/reduced native graphs and old axioms
untouched. Human graph: class/index and unip order +
MassRatio + size guard -> P2 -> packet field -> RUN56
SchurTest -> BlockBound -> Moments -> enough_forms ->
star_inequality. Degree and coordinate edges survive at
the remaining IsAdmissible fields. No root closure claimed.

RESUME HERE: descend MassRatio's actual
lintegral_gauss_sum_le_idealZeta and idealZeta_intAdeles_pow_le
suppliers (coordinate with literature/Siegel-Weil lane), or
the independent Gaussian/near-one Bessel peak primitive if
mass suppliers already covered by peers. Verify native
Data.HasLogBound guards and same-system formal degree at the
other energy/band fields, not P2 again. HANDOFF TO
integration/editor/audit and shared compact native replay lane.
-/

namespace RHPositivityPacketMass

theorem discr_exponent (h k : ℝ) :
    (2*h+1)*(k+h+1) - (2*h+1)/2 -
      (k+(h+1)+2*h*(k+h)) + 1/2-h = 0 := by ring

theorem two_exponent (h k : ℝ) :
    -1-(2*h+1)*(k+h+1)+(2*h+1)+
      (k+(h+1)+2*h*(k+h)) = 0 := by ring

theorem unip_exponent (h k : ℝ) :
    h*(h-1)+h*(k+1)=h*(k+h) := by ring

theorem packet_log_budget (e i L : ℝ) (he : e ≤ L-i)
    (hi : i ≤ i) : e+i ≤ L := by linarith

#print axioms discr_exponent
#print axioms two_exponent
#print axioms unip_exponent
#print axioms packet_log_budget
#check Data.relIndex_latStabilizer
#check Data.card_classes_filling
#check Filling.card_reducedImage_besselS
#check Filling.IsAdmissible.packetConst_mul_mass_le
#check abs_log_mass_ratio_sub_le
#check classSum_norm_eq
#check classSum_card_norm_one_eq_mass
#check Data.log_filling_besselDegree_mem_Icc
#check Data.card_besselCoord_mul_factorial_le
#print axioms abs_log_mass_ratio_sub_le
#print axioms Data.log_filling_besselDegree_mem_Icc
#print axioms Data.card_classes_filling

end RHPositivityPacketMass
