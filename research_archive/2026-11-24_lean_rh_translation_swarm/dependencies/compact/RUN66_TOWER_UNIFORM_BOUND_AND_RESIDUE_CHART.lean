import New.SiegelWeil.DescentsVanishPlanes
import New.Rows.ComparisonForms
import New.Rows.HeckeValueHeight

/-!
# RUN66 — uniform theta-tower bound and actual integral chart
27 Nov 2026. Human source-matched derivation, native replay NOT RUN.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10; current manuscript
1a5e180894e9f437ed9454097c99896366afc188; observed head
b1451de390f01b311363fd5d48afffc029ec8db6. Previous RUN65 a5929b540.
Reviewed peer summaries b1451de3, f90ecb3c, 6f2682c4, 9bd45a52,
f937bf17, d24dae79. This is the last-plane boundedness and level chart,
not the Bessel/CM/RowBalanced work in those lanes.

## Source ledger (actual bodies fetched on pinned compact revision)
New/SiegelWeil/DescentsVanishPlanes.lean 837e8a95ebb14d58a1e379cbba0426fc79b652b3:
  DescentsVanish.integral_sourceTerm_eq_zero, descentsVanish_add_planes.
New/SiegelWeil/AuxPairVanishing.lean 8613d2aaed78ee56e6866907ddda2d7a8e951eee:
  AuxPair.exists_annihilator_or_congr_inclMatrix, smul_chosenGLRep_eq,
  descentsVanish_of_reflectionSum (local lv and H).
Lib/Weil/DualPair/KernelDecay.lean 591247fdbe42900da1ac55c3c9d2ff733f235804:
  Space.exists_short_isotropic, exists_norm_name_le.
Lib/Adelic/Reduction/FirstMinimum.lean 701ad5475dc3fe1156447ce513009f9a57be6525:
  firstMinimum_le_one, form_eq_zero_of_norm_mul_lt_one, one_le_firstMinimum.
Lib/Weil/DualPair/Lift.lean fccbd7536c6b333975f17078ed355e71d0b11f25:
  moderate_growth, fixesLeft_lift, integrable_theta_mul, exists_clm_lift.
Lib/Weil/DualPair/PairSplitting.lean 7060d2715dc64318e5f657357bce32c32bf11772:
  sourceTerm_levi, sourceTerm_radicalElt, homSource_kAdelic.
Lib/Weil/MixedModel/ZeroTerm.lean e26a6037c53efb630f1dd8cf959aef3e0855fc5d:
  zeroTerm_apply, zeroTerm_rho_kAdelic, hasSum_theta_mixedTerm.
Lib/Weil/Fock/MixedFockModel.lean a2617ad4e9dd8d0a5fc48f535464511e658bdf91:
  weightedNorm, weightedNorm_polyVector_ne_top.
FockHarmonicCoeff.lean exists_enorm_le_mul_weightedNorm_of_sub located
by source search; its full body remains to be expanded, not proved here.

## 1. Finite polynomial moment and short isotropic witness
Let v=polyVector(P) be the fixed real Fock datum from ext_integrated,
not an arbitrary vector of the Hilbert completion. Its weighted norm
mom_A(v) is integral (1+||y||_infty)^A |v(y)| dy/pi^dimension.
The polynomial times Gaussian is bounded by C exp(k||y||) times
the real vacuum exp(-sum |y_i|^2/2) (native realVac).
Use (1+t)^A <= exp(At); complete the square or use
(A+k)t <= t^2/4+(A+k)^2 with t=Euclidean length. The remaining
Gaussian exp(-t^2/4) is integrable in finite dimension. Thus mom_A(v)
is finite for each fixed P,A. This is the actual guard
weightedNorm_polyVector_ne_top; not a uniform estimate in P.

For the moved hermitian lattice L_g let lambda be the first minimum
cut off at 1, H=1/lambda. It is strictly positive. Any nonzero
lattice vector of length <1 has self pairing an algebraic integer
whose absolute value at every archimedean embedding is <1 (Cauchy
and integral finite coordinates); its norm is an integer of absolute
value <1, so the pairing vanishes. If H>2, the infimum definition
gives a nonzero vector xi with length <2lambda<1. It is isotropic.
For V definite there are no such vectors, so its cut-off minimum
equals 1 at EVERY h. In particular rho=ht_V(h)=1 exactly, rather
than a bound depending on h. This discharges the specific height
specialization in exists_norm_name_le. At H<=2 no short vector needed.

## 2. Last-plane subtraction and rational transport
The induction at l+1 uses D' with one removed hyperbolic plane and
the exact lower source character a*upsilon^l. Define Z=zeroTerm
of D'.homSource V and ell=theta-theta_0 Z (source notation overloads
theta). The quotient-mean formula and theta mixed-term identity give
  theta_0(Z phi)= integral_[A^q/E^q] theta(rho(k b)phi) db,
with normalized Haar probability. Therefore
  ell(phi)= integral (theta(phi)-theta(rho(k b)phi)) db.
This is the actual cov: a pointwise difference bound B for all b
implies |ell(phi)|<=B, without an estimate of the full theta integral
by height. The zero term is invariant under rho(k b) by translation
of the quotient mean. For rational b, theta is invariant as well,
so ell is invariant under the same rational subgroup.

Choose rational Witt transport gamma identifying the fixed isotropic
last-plane line with the short isotropic vector at g, in the direction
specified by hgamma in the native proof (xi=gamma^{-1} l).
Use g'=gamma*g. The theta lift is unchanged by this rational left
translation. The actual short basis d of V.move h has all columns
of norm <=c, with c independent of h because its first minimum is
one. Set the small source matrix to the transported xi (one column).
The product of radii is <=2c/H. The Hermitian isotropy makes the
Heisenberg phases for this subgroup cancel in products. Covariance
omega rho omega^{-1} transports this subgroup to that used by Z;
the change of adelic shift variable is invertible, given in the
source by matToVec(Y^{-1} x_V dualFrame^{-1} vecToMat b).
Hence the second, difference-bound branch of exists_norm_name_le
applies for all test data, NOT the full-rank-support branch. In
particular Psi is the empty-place box indicator here, and finite
f0 is finHeisOp y vacElem. One cannot demand nonzero rank support.

For the general decay lemma the finite f0 has an open subgroup of
finite Heisenberg shifts fixing it. Choose a nonzero integer M
clearing the compact set of finite representatives into that
subgroup. Reduce every adelic shift modulo rational vectors
using the compact fundamental domain. The finite component becomes
trivial and the remaining real shift size is <=K rho/H by the
column-norm product and fixed coordinate constants. Isotropy gives
the additive group action; rational invariance makes replacing the
shift by its representative exact, not a norm loss. The analytic
small-shift moment inequality exists_enorm_le_mul_weightedNorm_of_sub
with t=max(2,K)rho/H applies to the functional L composed with
integration of the fixed finite datum. If t>=1 its norm bound
suffices, otherwise the second branch just proved gives its
difference premise. Using ||L|| <= (2C)(rho H)^A, the factors
t^(N+A) and H^N cancel the H dependence and leave
  |L(integrated v)| H^N <= C' mom_(N+A)(v) rho^(N+2A).
This expands the native exists_norm_name_le assembly, retaining
the small-shift moment theorem, fundamental domain, finite
stabilizer, moderate growth and short-basis theorem as suppliers.
No claim that moderateness itself implies boundedness.

## 3. Actual boundedness at the tower consumer
Apply the above with N=0, rho=1, H=ht(g)>0 and the same datum.
Then
  |ell(omega(g',h) f)| <= C' mom_A(polyVector P)
for ALL g,h, with C' fixed in g,h. Multiply by |Y(h)| <= M_Y
(definite automorphic quotient) and integrate. The induction
hypothesis says integral theta_0(Z omega(g',h) f) Y(h) dh =0
using integral_sourceTerm_eq_zero: the Iwasawa radical fixes the
zero term, the Levi contributes a scalar and lower pair action,
and the compact factor preserves the required vacuum projector.
Thus the original lift equals the integral of the DIFFERENCE,
not the sum of two independently height-bounded integrals:
  |F(g)| <= C' mom_A(polyVector P) M_Y vol([V]).
The native quotMeasure normalization handles the volume; finite
volume is enough. The integrability of the theta factor follows
from integrable_theta_mul, of the difference from this uniform
majorant and measurability; subtraction is then legitimate.
The rational transport depends on g, but C' does not. For H<=2
the native decay lemma uses its no-small-shift case.
This supplies BddAbove(range norm F) at the actual
eq_zero_of_heckePolyOp_eq_zero caller, not a spectral bound or
assumption of compactness of W'. Together with RUN65 rank and
strict contraction, the lift for each polynomial datum is zero;
continuous linearity and ext_integrated give every datum in the
actual vacuum projector. The induction base p=0 remains as RUN65.

## 4. Integral residue chart and the exact reflection shift
Fix one DVR R with fraction field K and residue k. Let X be the
appended n' by r full-column-rank matrix in the native chart.
Saturate its column space: M=im_K(X) intersect R^n'. This is a
saturated free rank r submodule, with free quotient over the DVR,
hence a direct summand. Choose columns P of an R-basis and an
integral left inverse L, LP=I. There is b in GL_r(K) with X b=P.
The projection defect T=PL-I satisfies TX=0.
Let J be the chosen coordinate injection, of rank r. If every
row of T vanishes on J modulo the maximal ideal then
  Pbar Lbar Jbar=Jbar.
Applying the coordinate retraction Jbar^t gives
  (Jbar^t Pbar)(Lbar Jbar)=I_r.
Both square factors are invertible, hence L J is invertible over
R (unit determinant). Put A=b(L J). Then XA=P L J and XA=J
mod maximal ideal. No integral inverse of X, no condition on its
individual minors is assumed. This is precisely
exists_annihilator_or_congr_inclMatrix and supplies the all-zero
annihilator case in RUN65. Saturation uses ordinary finite free
module theory over a DVR; the native primitive-matrix lemma gives
the same witness even if its implementation uses valuation subring.

For the nonzero-row case the native X has top block D z and
bottom t I, with D diagonal, t nonzero, D_i=uniformizer exactly
on nonchosen rows at Q and D_i=1 otherwise. An annihilator row
is (u,v) with u D z+ t v=0, u,v integral. Lift a residue vector
x to an integral column. Put A0=J, B0^t=x u D and G=I+J x u D.
Then the TWO needed identities are
  G z-z = -t J x v,
  B0^t A0 mod maximal ideal = x (ubar Jbar).
The first proves (Gz-z)/t is integral, even when t has negative
valuation; no norm or size argument. At M, Gbar Jbar is contained
in the chosen columns. At Q, the nonchosen entries of uD vanish
mod maximal ideal, so the transposed condition holds instead.
The chosen r-by-r block is s=I+x m, m=ubar Jbar. Sylvester's
determinant identity gives det G mod maximal ideal=det s;
when s invertible G belongs to GL_n(R). These are exactly the
local lv hypotheses for q=z. More generally a q with
(q-Gz)/t integral has the same coset indicator after G, since
G and G^{-1} are integral. This is the actual coset equality
in lv; the Weil covariance and finite level action
smul_chosenGLRep_eq then give C_q(weighted translate y)=C_z(y).
The unit character factors and transpose at Q cannot be omitted.
The two reflection branches in RUN65 now have an explicit
integral matrix witness; the last all-zero branch has the chart
above. The global adelic assembly exists_atPlace_eq, precise
level-character covariance, and Schwartz-Bruhat coset expansion
remain native suppliers (not newly proved here).

## Original/reduced dependencies and audit
Original caller graph preserved: C height consumers -> period
vanishing -> tower -> eq_zero_of_heckePolyOp_eq_zero AND
boundedness, plus reflection lv, integral chart, covariance.
New exposition replaces the boundedness assembly by
finite moment + definite first minimum + short isotropic transport
+ difference averaging + decay lemma + previous zero-term integral.
Chart replaces the finite annihilator argument by saturation and
the two exact matrix identities. No global edge or assumption
retired; all small-shift, level, measure and remaining A/B/C leaves
remain. Context key (pin,D',W',V,chi,S,P,y,hY,level,role).
Original graphs, old pin and axiom ledgers preserved; no circular
import of RH theorem. No URT. No O(N) performance claim.

Local command -v lean/lake/elan returned no executable. Actual
CI status and result retrieved: compute/rh-compact-primitives-replay-20261126/
status.json a56e2d3afb99ed8275e81fd63c8494306e57c43f,
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804.
Run 45803534769: module_0 and module_2 each three named native
checks, only propext/Classical.choice/Quot.sound; module_1 timeout
124, all_requested_checks_ok=false, full_RH_replay=false. None
checks this new derivation. Old-engine PASS does not transfer
across pins. Native query and scalar bridges below PREPARED ONLY.
No competing CI job, request shared targeted replay.

RESUME HERE: expand the exact full FockHarmonicCoeff
exists_enorm_le_mul_weightedNorm_of_sub proof (finite-difference
iteration and moment cost) and actual smul_chosenGLRep_eq
level-factor transport, then integrate with RUN65 class period
and RUN64 HeckeValueHeight caller. Retain all analytic normalization
and actual character hypotheses. HANDOFF TO integration/editor,
theta, positivity, kernel/audit. No claim of complete human RH proof.
-/

namespace CompactTower66

/-- Definite-side height one and N=0 remove every variable height
factor in the actual decay bound. -/
theorem uniform_bound (A : ℕ) (v C M H rho : ℝ)
    (hr : rho = 1)
    (h : v * H ^ (0 : ℕ) ≤ C * M * rho ^ (0 + 2*A)) :
    v ≤ C * M := by
  simpa [hr] using h

/-- The exact additive relation behind the reflection coset shift.
Here b=t v and a=uDz; no assumption t is a unit in the DVR. -/
theorem exact_shift {K : Type*} [Field K]
    (a b t v : K) (ht : t ≠ 0) (h : a + b = 0)
    (hb : b = t*v) : a / t = -v := by
  apply (div_eq_iff ht).2
  rw [hb] at h
  calc
    a = -(t * v) := eq_neg_of_add_eq_zero_left h
    _ = -v * t := by ring

#check Space.exists_short_isotropic
#check exists_norm_name_le
#check weightedNorm_polyVector_ne_top
#check DescentsVanish.integral_sourceTerm_eq_zero
#check descentsVanish_add_planes
#check AuxPair.exists_annihilator_or_congr_inclMatrix
#check AuxPair.smul_chosenGLRep_eq
#print axioms descentsVanish_add_planes
#print axioms AuxPair.descentsVanish_of_reflectionSum
#print axioms uniform_bound
#print axioms exact_shift

end CompactTower66
