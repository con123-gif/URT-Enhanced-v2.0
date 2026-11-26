import New.Selmer.CrystallineBound
import Mathlib.Tactic

/-!
# RUN58 — integral frame, coordinate retraction and Hodge division at C
26 November 2026. Human source-matched reconstruction, PARTIAL:
the remaining foundational frame-existence and period-ring approximation
theorems are identified exactly, not asserted as new results.
Prepared Lean probes, not compiled.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb read, as were
AGENTS, handoff, protocol, expansion, manuscript, continuity and state/log
excerpts. Prior RUN57 blob 9a887545bded252f0edd5ddaa7504509ec7682c9.
Peer 9e1dbfbe583d6c248b7687f7abb421698b913482 already reconstructs
safe-pair strictness and the cup cancellation, retaining invariant extension
of forms and integral frame/retraction. This fills those retained suppliers,
not another cup or scalar-cut assembly. Latest theta 5d295d09 concerns a
different adelic frame, acceleration 2da8ca92 a different Hecke filtration.
No URT or RH-root import.

Source ledger (relative to compact src):
Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean cd91a46eb5624b88af20a96d0450bdf059994b93,
IsPeriodMatrix, exists_basis, lifting_the_exponent.
Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean 348d083320f3e9f59100db1a2f96f5a3f8e92923,
exists_fixed_ker, IsPeriodMatrix.exists_frame.
Lib/PadicHodge/WachKisin/FrameTheorem.lean 57d6daa6060f9f00eb27be6525460ba942a73f08,
frame_theorem (actual full body).
New/Lift/ExponentLattices.lean 0549f09387b53f33790c7af7fc923fa71ca347dd,
span_kisinLoc, exists_coordRetract, Hom.map_coordRetract,
smul_sub_mem_zTau_kisinLocAinf, smul_sub_mem_zTauUnit_smul_of_deep,
frobEUnit_zpow_mem_withExponents.
New/Lift/HodgeExpansion.lean 7f8955989647bee0ddf549506d1488cf09536046,
valueAt_coordRetract_sub_mem_hodgeFil, coordRetract_mem_withExponents,
mem_withExponents_stdExponent_iff, mem_hodgeFil_of_hodge_basis.
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141,
exists_extend_form, exists_inclKer_eq_of_projTriv_eq_zero,
pointsOver_nonempty_of_killsCokernel.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487,
exists_lift_of_mem_liftIdeal, mem_liftIdeal_of_derivation.

## 1. Matrix frame to integral generators (actual frame_theorem)

Use the source period matrices M,U and frame Q,L,Z,Y,B at h=jumpBound;
retain the period-matrix existence hypotheses and IsPeriodMatrix.exists_frame.
In the original basis write s for the A_inf-linear coordinate map. The
columns n_j of the new frame satisfy tau^h n_j=s(Q e_j). They are well
defined in the ambient Witt fraction module since tau is a unit there,
NOT in A_inf. Set nu_m(t)=sum_j t_j phi^m n_j. The frame identity
Q L=tau^h I proves tau^h ainfLattice is contained in the span of n_j,
while the converse bounded denominator follows directly from the definition.
No determinant norm or division by p is necessary.

Write E_m=phi^m E. The native G' evaluation identity is
 E_m^h mu(nu_m(t)) = (basisValues(mu) psi_m(M)) dot
                   (phi^m(Z) * t),
with all appropriate embeddings to B_dR understood as in G'. Its inverse
test H uses the rows of psi_m(M)^(-1) to extract the coordinates of
E_m^(2h)t by multiplying by phi^m(Y), since Y Z=E^h I.
The testing rows are crystalline forms: the source equivariance test I
shows that their transported basis values are fixed. This is a family of
tests for every coordinate, not a single chosen functional. Thus membership
of all their evaluations in a B^+-submodule W implies E_m^(2h)t_j in W.
The columns themselves satisfy the defining Hodge conditions (native hN)
by G', fixed-field values, and cancellation of E_m at the other period
prime; hP supplies their value-field membership.

To show span equality for kisinAinf, let x be in that module. Some
tau^N x lies in ainfLattice, so tau^(N+h)x=nu_0(t) by QL.
When N+h>0, apply phi^(m+1), m>=0, to this equality.
The defining Hodge tests of x, together with the positive-filtration
factor phi^(m+1)tau, put the tested value in Fil^1. Test H(m+1)
then gives E_(m+1)^(2h) phi^(m+1)t_j in Fil^1 at the zeroth
period prime. E_(m+1) is not divisible by E_0; cancellation yields
theta(phi^(m+1)t_j)=0. The native tau_dvd_of_theta_frobEnd criterion
gives tau | t_j simultaneously for every j. Divide out this common
tau using torsion-freeness, and repeat N+h times. Therefore x=nu_0(t')
with integral t'. This is the exact saturation argument of e0, not
rational spanning. The same matrix test H with W=B^+ d and the
native divisibility-reflection premise on d supplies the frame
divisibility test: d | t_j, hence x is d times an integral Kisin vector.
The d-reflection premise cannot be dropped.

For the relation-preservation part of frame_theorem, suppose all
v_j are valueFieldPoints(fracSpan) and sum c_j v_j=0.
For each crystalline form mu, its evaluated relation is in Fil^n
for every n, in particular zero. The source sum_map_mem_of_valueField
transports this relation through any S-linear coefficient map f:A_inf->S.
The resulting vector remains in fracSpan; clear its common denominator
into ainfLattice, then use QL and test H(0,W=0) to see every frame
coordinate vanishes. Torsion-freeness cancels the denominator. This
proves the precise zero-relation transfer, not arbitrary A_inf-linearity
of f. Applying it to the columns at level l with f=coord_0 gives
the integral span of valueFieldPoints(frobKisinAinf l) in the native D l.
The remaining radius estimate (p^(4delta), with its e,A,l guards)
is NOT derived here and remains explicitly retained wherever used.
The finite height E^h phi(n_j) is expressed in the same frame via
phi Q=v Q B, by cancelling the same tau and chart unit as the source.

## 2. Retraction is well-defined and preserves all tested exponents

Write N=kisinLoc, M=A_inf N=kisinLocAinf (span_kisinLoc).
The source obtains this equality from the integral frame span and
localization at the E_a: for an element E_a times x already in the
span, the normalized inverse E_a operation preserves N, hence also
its A_inf-span. This is a saturation induction, not flatness of an
arbitrary localization of an arbitrary lattice.

For x=sum a_j n_j in M define R(x)=sum coord_0(a_j)n_j.
If two representations differ, concatenate them with opposite signs;
the difference is a zero relation among N, which are valueFieldPoints
in fracSpan, so section 1 shows its coordinate image is zero.
Thus R is S-linear, fixes N (coord_0(1)=1), and for any equivariant
map F between the lattices, F(Rx)=R(Fx) since F(n_j) belongs to N'.
These are the exact exists_coordRetract and Hom.map_coordRetract proofs.

For a test form mu and level a, suppose valueAt(a,mu,x)-v is in
Fil^n with v in valueField(a). Expand x using the same n_j. The
sum_map_mem_of_valueField theorem applies to these evaluated n_j
and to the extra term -v with coefficient 1; coord_0(1)=1 leaves
that term fixed. It gives valueAt(a,mu,Rx)-v in Fil^n.
Use v=0 for each jump, and the commutation with multiplication by
the letter operator to preserve the letter eigenspace. Hence
R(withExponents(i,c)) lies in withExponents(i,c), not merely in
a rationally equivalent module. These are the exact HodgeExpansion
valueAt_coordRetract_sub_mem_hodgeFil and coordRetract_mem_withExponents
consumers. No uniformity or common-correction quantifier is lost.

## 3. Integral extension of test forms, at the strictness caller

For the extension Y plus C with action (rho(g)y+alpha(c)(g),c),
let mu be an invariant functional on Y with lattice values in W,
a B_dR^+-submodule. Extend its restriction to Y to B_cris by base
change (the native Lambda). For each member c_j of a Z_p-basis of C,
crystallinity of alpha supplies v_j with g v_j-v_j=alpha(c_j)(g)
in B_cris tensor Y. Applying Lambda and equivariance gives
g Lambda(v_j)-Lambda(v_j)=mu(alpha(c_j)(g)) in W.
The exact native BdR.exists_sub_mem_of_smul_sub_mem now supplies
a fixed-field scalar a_j such that lambda_j=Lambda(v_j)-a_j lies
in W. Extend c_j->lambda_j Z_p-linearly and then to the functional
on the trivial lattice. The extension
 nu(y,c)=mu(y)+lambda(c)
satisfies nu(g(y,c))=g nu(y,c) by the displayed coboundary identity
on the basis and linearity. It agrees with mu on Y and takes the
integral A_inf span into W because W is closed under B_dR^+ scalars.
This proves exists_extend_form with the actual W, not merely with
W=B_dR. The chosen fixed-field approximants need not form a
canonical functor; one basis suffices for each individual form.
The deep BdR approximation theorem is an explicit retained supplier.

Apply this at LongGap.exists_inclKer_eq_of_projTriv_eq_zero:
the split underlying tensor exact sequence supplies y from w.
For the saturation defining kisinLocAinf, clear the existing
period denominators in w, apply first projection to the integral
part, and test all invariant forms via the extension with W=B_dR
or the required Hodge submodule. Thus y has the same allowed
Hodge exponents and letter as w. If w is localized, use R and its
naturality: inclusion(R y)=R w=w=inclusion(y), hence R y=y by
injectivity. This is precisely the stronger localized membership
used at the two safe-pair exponent transfers in peer 9e1dbfbe.

## 4. Division and common correction (RUN57's actual missing interface)

The frame divisibility test in section 1, with d=zTau, applies to
the Galois difference of x in kisinLoc. On the nonlocalized Kisin
module the source first writes E^h mu(x) in the chart bicommutant;
the chart congruence and its denominator version
pow_smul_gal_sub_mem_span_of_dvd give E^(2h)mu(gx-x) in B^+ zTau.
Use the specific zTau divisibility reflection (chart.tau_mul_z_pow_dvd),
then extend across E_a localization: gE_a-E_a=zTau E_a b_a by
the native chart relation, so the product-rule correction is integral
and saturation preserves the divided result. This proves
(gx-x)/zTau belongs to kisinLocAinf. If gx-x already has an
exponent profile, division preserves it because zTau is prime
to every E_a, using mem_withExponents_of_smul; no claim zTau is
a unit of A_inf. These are the actual two ExponentLattices lemmas.

At exists_lift_of_mem_liftIdeal write f=r t+s and let s multiply
the entire trivial letter lattice into the image of the specified
level. The integral frame puts any localized standard trivial
vector into the needed integral letter part (zero jumps).
Use ideal membership to choose its lift, then apply R, naturality
and preservation of exponents. The single correction becomes
coord_0(t), not a separate t per vector. This establishes the
actual lift statement from the colon ideal.

At level one x lifts (f-r t)constantAt_i(c). The chart gives
g t-t=zTau E v. The Hodge difference lemma
smul_sub_mem_hodgeFil_of_valueField raises the exponent by one
at E_0 for level-one vectors with value-field coefficients
(the scalar g f-f is divisible by zTau E); the remaining
E_a tests are preserved by zTau and E_0 division since neither
is divisible by those E_a. The normalized E_0 unit action
therefore makes D(x)=(gx-x)/(zTau E) a level-one vector.
This uses the actual value-field condition and the source
mem_withExponents_of_mem_hodgeFil, not an inference from
scalar ideal membership. Since constantAt is g-fixed,
the projection of alpha D(x)-beta x equals
 (s-r(alpha v-beta t)) constantAt_i(c),
by the exact identity
 alpha*(g f-f-r*(g t-t))-beta*zTau*E*(f-r*t)
 = zTau*E*(s-r*(alpha*v-beta*t)).
Cancel in the ambient module via the normalized units. The
correction alpha v-beta t is common to all c. This gives
mem_liftIdeal_of_derivation, hence the two descents, cut
annihilator and pointsOver in RUN57 with unchanged modulus
and actual exponent profile. Independent peer audit required.

## 5. Provenance and remaining dependency frontier

Original chain: crystalline_defect_le -> scaledCupBounds_of_cut_windows ->
killsCokernel_at_cut -> lift-ideal seed and divided derivative ->
integral frame / retraction / invariant form extension / chart congruences.
Safe-pair branch separately consumes strictness. Reduced human chain:
matrix tests and common integral generator span -> relation transport ->
single retraction -> exponent transport / common correction, also shared
by strictness. Native graph not altered, no root node declared retired.
Cache key must include chart, coefficient ring, representation, letter,
level, exponent profile and modulus, especially in cross-side transfers.

Source headers distinguish known finite-height Kisin frame (Kisin 2006,
BMS 2018, Cais-Liu 2016) from this specific native direct proof by
retractions. Do NOT cite equivalence of categories as a substitute for
the integral relation transfer or the uniform radius estimate. The
following remain in the foundational ledger: IsPeriodMatrix.exists_basis
and exists_frame (actual theorem bodies, contraction and mod-p
descent not yet fully human-derived); value-field relation transfer
sum_map_mem_of_valueField; BdR.exists_sub_mem_of_smul_sub_mem;
chart congruences and Hodge difference supplier; tau divisibility
criterion; frame radius estimate if used. These are not declared
axioms merely because the human proof still cites them. No fresh
transitive axiom evidence for these declarations; no hidden assumption
that standard literature establishes every quantitative statement.

Native Lean/Lake absent on local PATH. Actual CI receipt read:
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, run 45803534769:
six successful probes in TiltingLemma and Moments with three standard
axioms; JetExponentBound module build returned 124; full_RH_replay=false,
all_requested_checks_ok=false. This is NOT evidence for this certificate.
No scalar regression counts claimed. The exact ring identity below
is a prepared diagnostic of common-correction algebra only, not a
formal replacement of the integral module proof. No old-pin engine
replay on new source, no competing job or protected workflow edit.

RESUME HERE: audit sections 1–4 at the C callers and integrate them with
RUN57 and 9e1dbfbe. Descend the actual PeriodMatrixBasis.exists_basis
contraction and PeriodMatrixFrame.exists_frame mod-p minimal-support
descent (the integral frame's remaining foundation), then verify the
value-field approximation and chart Hodge difference lemma bodies.
Retain all other primitive row, reciprocity and defect obligations.
HANDOFF TO integration/editor, C mathematics, formal audit, shared native runner.
-/

namespace LiteratureFrameRun58

theorem common_correction {R : Type*} [CommRing R]
    (a b f t r s v z E df dt : R)
    (hf : a * df = z * E * (s + b * f))
    (ht : dt = z * E * v) :
    a * (df - r * dt) - b * z * E * (f - r * t) =
      z * E * (s - r * (a * v - b * t)) := by
  rw [ht]
  calc
    _ = a * df - a * r * (z * E * v) - b * z * E * (f - r * t) := by ring
    _ = _ := by rw [hf]; ring

end LiteratureFrameRun58

#check Lift.Chart.IsPeriodMatrix.exists_basis
#check Lift.Chart.IsPeriodMatrix.exists_frame
#check Lift.KummerChart.JumpLattice.frame_theorem
#check Lift.KummerChart.JumpLattice.exists_coordRetract
#check Lift.KummerChart.JumpLattice.coordRetract_mem_withExponents
#check Lift.KummerChart.JumpLattice.smul_sub_mem_zTauUnit_smul_of_deep
#check Lift.KummerChart.PairingSide.exists_extend_form
#check Lift.KummerChart.PairingSide.exists_inclKer_eq_of_projTriv_eq_zero
#check Lift.KummerChart.PairingSide.exists_lift_of_mem_liftIdeal
#check Lift.KummerChart.PairingSide.mem_liftIdeal_of_derivation
#print axioms Lift.KummerChart.JumpLattice.frame_theorem
#print axioms Lift.KummerChart.PairingSide.exists_extend_form
#print axioms Lift.KummerChart.PairingSide.mem_liftIdeal_of_derivation
#print axioms LiteratureFrameRun58.common_correction
