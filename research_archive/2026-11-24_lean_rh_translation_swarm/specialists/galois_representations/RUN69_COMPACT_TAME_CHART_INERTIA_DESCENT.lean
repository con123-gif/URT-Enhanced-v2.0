import New.Selmer.OnePlaceDefect

/-!
# RUN69 — exact tame chart subgroup and inertia descent at C
27 November 2026. Human source-matched proof and independent audit of RUN68;
prepared Lean probes, NOT a new native verification.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion-first),
manuscript 3b552f2f5c30d874e72f574a479c90037482f96d.
AGENTS, protocol, handoff, expansion, continuity, RUN68 and latest
peer head dc4a02df77c1b0916581ded875ca42bc6852b675 inspected.
Read actual literature RUN56 and RUN57, RUN68 (a824788a).
They already prove the sparse/two-size cut combinatorics, long-gap
coefficient transport, ramified ideal recursion and caller guards.
Do NOT count those again. Instead discharge the chart subgroup
and inertia restriction that RUN68 explicitly retained, and audit
its exact good-root correction and third-side jump guards.

Source ledger, relative to compact src:
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395,
  TameChart 28–36, exists_z_smul_eq_sum_tameGen 43–63,
  killsCokernel_of_isKilledBy 81–117, exists_tameChart 124–158.
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc,
  tame_types_exponent 107–end (especially local A).
Lib/PadicHodge/WachKisin/KummerChartExists.lean
  f90f19a17f77be0aff920a5db18ae389d5898561,
  differentExp 162, IsUnramified 165.
Lib/PadicHodge/Crystalline/GoodCriterion.lean
  8d7b68b9cde0290ade42ef5a6d12aaa8091db6d7,
  IsPotCrys.isCrystalline_of_inertia_fixes.
New/Lift/CupProductBound.lean a5dfa3dc1372433af295f751c4bd4917ed3e323c,
  tensorLattice and thirdSide 44–52.
New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a,
  block_defect_le_at_place, actual tame consumer.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487,
  exists_lift_of_mem_liftIdeal, mem_liftIdeal_iff.

## 1. Exact tame chart stabilizer, normality and index

Let p be the prime, e|p^f-1, p not dividing f, f>=1; put
M=p^f-1, take varpi^e=p, and let K0=Q_p(mu_M).
K0 is unramified of degree dividing f (in fact degree f, including
the trivial f=1 case). This is the standard correspondence
between finite residue extensions and unramified extensions:
the prime-to-p roots lift uniquely by Hensel. Thus mu_e is in K0.
Over K0, X^e-p is Eisenstein, so K=K0(varpi) has degree e
over K0, and contains every conjugate of varpi. K/Q_p is
Galois: the set of conjugates of mu_M and varpi is contained in K.
This proves that the exact native subgroup
  U=ker(cycCharMod_M) intersect Stab(varpi)
is Gal(Q_p^alg/K), hence open and normal. This is the SAME U as
in exists_tameChart, not an unrelated tame field.

More explicitly the ratio a(g)=g(varpi)/varpi lies in mu_e,
and satisfies a(gh)=g(a(h))*a(g). Along with the residue
Frobenius action on mu_M this gives a homomorphism to the
semidirect product mu_e ⋊ Gal(K0/Q_p); its kernel is exactly U.
In particular
  [G_p:U]=e [K0:Q_p],  and [G_p:U] divides ef.
Hence p does not divide [G_p:U]. No exponent-to-order estimate
or semisimplicity of the arithmetic representation is needed.
This supplies the prime-to-p index and normality in the actual
TameChart constructor. The homomorphism Gamma -> G_p is
bijective in the actual exponent theorem (surjectivity hj and
injectivity from the open embedding ho); pull U back through it.
The index and normality are preserved.

The chart equality U=FixesThetaZ is not automatic from field
existence. In the native construction c.varpiFlat is chosen
with c.z=teich(c.varpiFlat), theta(c.z)=varpi in the chart,
and c is built by exists_chart_of_pow_mul_eq_neg at varpi.
Fixing the roots of unity of order M is exactly FixesLambda f,
by the native fixes_roots_iff_fixesLambda comparison.
Since g(varpi)/varpi is in mu_e, the compatible
prime-to-p root system admits the tame action on this chart.
Inertia acts trivially on mu_M, and its action on varpi is
surjective onto mu_e: the polynomial remains Eisenstein over
the maximal unramified extension, whose valuation group is Z.
Take an inertia element sending varpi to a chosen primitive
multiple, and lift it through the bijection Gamma -> G_p.
The source's exists_smul_teichmuller_eq gives the corresponding
zetaE and the identity s(z)=zetaE*z with zetaE coefficient zero
of exact order e. Because s fixes Lambda, induction gives
s^k(z)=zetaE^k*z. Retain the actual compatible-flat/chart
construction and FixesThetaZ comparison: the field argument
proves normality, index and surjectivity on the tame quotient,
not the existence of a specified period ring embedding by itself.

## 2. Exact restriction of the Weil inertia action

At the actual local A inside tame_types_exponent, let V be
either of the given potentially crystalline representations.
Let B(s)=linearFrob(V,s,0) on the native potentially crystalline
period space, for s in inertia. It is a group representation
there by linearFrob_mul at degree zero. Its kernel on inertia
is open by the native eventual_linearFrob_eq_one, so its image
is finite (inertia is compact). The IsTameType hypothesis for
EVERY inertia element, and the native IsKilledBy clause in
InClass, give
                           B(s)^e = I.
For the second side use K'(s)=K(s^-1) and apply the identical
hypothesis to s^-1; this does not interchange the two lattices.

Let P be wild inertia. Its image under B is a finite p-group
because P is pro-p. Each element has order dividing e as well
as a power of p, so is the identity. Thus B factors through
tame inertia I_t=I/P, a procyclic prime-to-p group.
For e prime to p its e-th power subgroup is closed of index e:
I_t/eI_t is cyclic of order e (equivalently use the product
of Z_q over primes q != p, with the cyclotomic twist).
Since B is abelian on this quotient and every element is
killed by e, B annihilates eI_t.

The character I_t -> mu_e given by g(varpi)/varpi is surjective,
as in section 1. It annihilates eI_t and both quotients have
order e, so its kernel is EXACTLY eI_t. Because inertia fixes
mu_M, the inertia subgroup I intersect U is precisely the
inverse image of this kernel. Therefore
                B(s)=I for every s in I intersect U.
This is the tame_inertia input at the actual A, with the SAME
e and varpi as the chart, not a claim that V is crystalline
over Q_p. It avoids any eigenvalue argument or simultaneous
diagonalization; finite inertia and e-th power cancellation
suffice. If e=1 it directly gives trivial inertia.

For the final passage to crystalline over K, choose finite
Galois L/K over which V is crystalline. Put D_L=(Bcris tensor
V)^{G_L}, over the maximal unramified subfield L0. Under the
native nearOne/linearFrob comparison the action on D_L of
the inertia subgroup of Gal(L/K) is the restriction of B,
hence trivial by the preceding paragraph. Consequently the
action descends to Gal(L0/K0') where K0' is the maximal
unramified subfield of K. By ordinary finite Galois descent
for semilinear vector spaces, D_L^Gal(L/K) has the full
required dimension over K0'. This invariant space is
(Bcris tensor V)^{G_K} by the tower of invariants, proving
crystallinity over K. For coefficient lattices apply this
after inverting p and restricting scalars, as in the native
isAdmissible_comp_iff passage. The actual identification
between the native Dpcris, degree-zero action and D_L is a
retained period comparison; the native theorem
IsPotCrys.isCrystalline_of_inertia_fixes supplies the same
conclusion at this caller. No need to re-prove its general
open-subgroup statement to use the finite Galois argument.

This closes the group-theoretic restriction and supplies
the exact hypothesis of the crystalline criterion on Gamma'.
The universalSide constructors then use that crystalline
restriction on each pairing side. It does NOT supply an
integral Kisin lattice or the frame theorem by itself.

## 3. Audit good-root descent: common correction and no inverse in A_inf

Use the actual Q=q(X)(X-1), fixed modulus R=p^(kappa+1),
z chart variable, s=tameGen, xi=zetaE. At a good positive
exponent k the induction hypothesis gives p^c z^k in the
level-zero lift ideal. The exact native
exists_lift_of_mem_liftIdeal provides a SINGLE correction u
for every projected constant c0, with u=w+z*t, w fixed
by s. Write pi for projection from the extension to its
trivial quotient, and choose the corresponding integral
lift x of (p^c z^k-R*u)c0 at this letter. The lattice
divisibility theorem exists_z_smul_eq_sum_tameGen gives
y in kisinAinf such that
                     z*y = sum_j Q_j s^j(x).
This is an integral divisibility theorem; no inverse of z
in A_inf has been used. Project y to the SAME letter,
which remains a valid standard level-zero lift by the
native letterProj_mem_withExponents. Since s fixes the
letter and its constant c0, apply pi and use Q(1)=0:
  z*pi(y_i) =
    [p^c z^k Q(xi^k)
        - R*z*sum_j Q_j xi^j s^j(t)] c0.
Cancellation takes place in the ambient Witt Cflat module:
z is a unit there by not_p_dvd_z. Hence
  pi(y_i) = [p^c z^(k-1)Q(xi^k)-R*t_new] c0,
  t_new = sum_j Q_j xi^j s^j(t).
The correction t_new is integral and independent of c0.
The letter-projection step and common correction are both
essential; cancelling z in A_inf instead would be invalid.
At a good exponent Q(xi^k) has nonzero residue, so is a
Witt unit, also a unit after its map into A_inf. Ideal
membership permits dividing this unit, giving precisely
p^c z^(k-1) in the SAME lift ideal. At bad exponents use
the separate exact factorial cost from RUN68. No additional
assumptions. This independently checks RUN68 section 3
at the actual native caller.

## 4. Third-side jump and different exponent correction

At a common letter, S and S' have jumps u,v in
[-eta,eta] or opposite signed far windows of width W
and centre b. The thirdSide U is exactly insert 0 of
the image -u-v-1 (CupProductBound 44–52).
In the two-low case |u+v|<=2eta, in the mixed case
|u+v|<=b+W+eta, in the two-high case opposite signs
give |u+v|<=W (not 2b+2W). Thus for eta>=1 all three
lattices' jumps are bounded above by n=b+6(W+eta).
The inserted zero is harmless and eta>=1 holds in the
actual OnePlaceDefect (D.h2^2+1). The native prime guard
n+kappa+2<p applies without any extra rank factor.
This proves the exact jump hypothesis of the three
killsCokernel_of_isKilledBy applications, not merely a
bound for one side. The earlier tensor polynomial
degree argument RUN68 is unchanged.

CORRECTION to RUN68 section 4: by the actual definition,
differentExp=0 when e=1, and otherwise v_p(e)+1.
For tame e it is therefore <=1, not always =1.
This matters at r=0 or a chart with e=1, though the
original bound is unchanged: use the inequality before
paying the cup exponent, obtaining
  3*(kappa+(48*(eta+W)+4)*differentExp)
    <=3*kappa+150*(eta+W+1).
The no-multiple guard follows since each integer in
the windows around 0 and +/-b has absolute value at
most b+6(W+eta)<p. With a=0 the missing-low-negative
interval [-a,0) is empty. All hypotheses of the actual
LongGap.scaledCupBounds_of_killsCokernel are now matched
at this tame branch, conditional on its retained integral
cup walk. The final cupOrthogonal implication is exactly
ExponentTheorems.mem_cupOrthogonal_of_scaledCupBounds;
the outer normLength payment was supplied by literature
RUN67. Do not count it again.

Graph delta (source-visible): OnePlaceDefect ->
tame_types_exponent -> exists_tameChart [subgroup
normality/index and tame inertia generator] -> local A
[finite image, wild killed, tame kernel, crystalline
descent] -> universalSide -> thirdSide/KillsCokernel
[RUN68, good-root audit] -> cup walk -> cupOrthogonal.
Retained: actual chart construction/flat root identities,
native nearOne/period comparisons, integral frame,
initial z-power and derivation, cup safety/profile inputs.
No globally retired native nodes or changes to original
and reduced DAG files/axiom ledger. Cache context includes
pin, p, e, f, fixed chart and varpi, subgroup U, SAME
representations and coefficient ring, fixed letter and
modulus R, actual u,v and eta,W,b,kappa. No URT or RH
assumption, no import of Main or New.Main.

Execution: source retrieval and mathematical audit, local
command -v lean/lake/elan empty. Actual CI artifact read
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six existing native TiltingLemma/Filling.Moments declarations
report propext/Classical.choice/Quot.sound, module_1 build
timed out (124, 2700.11s), all_requested_checks_ok=false,
full_RH_replay=false. No native replay of this file.
Old-pin rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier
not run on compact source. Below are prepared scalar
certificates and probes, not formal certificates for the
tame inertia or integral frame suppliers.

RESUME HERE: do not repeat literature RUN56/57 cut recursion
or RUN68 caller guards; integrate the subgroup and tame
restriction proof and correct d<=1. Next expand the remaining
native chart/period comparison at exists_chart_of_pow_mul_eq_neg
and fixesLambda/FixesThetaZ, or the exact integral
exists_lift_of_mem_liftIdeal/coordinate retract and Hodge
division. Check latest literature and audit before selecting
one of these to avoid duplication. Human RH proof incomplete.
HANDOFF TO integration/editor, C math, formal audit,
literature and compact kernel replay.
-/

namespace RHGaloisRun69

-- Scalar consequences at the actual third-side and exponent caller.
theorem opposite_jump_guard (eta W b u v : ℤ)
    (he : 1 ≤ eta) (hw : 0 ≤ W) (hb : 0 ≤ b)
    (hu : (-eta ≤ u ∧ u ≤ eta) ∨ (b ≤ u ∧ u ≤ b+W))
    (hv : (-eta ≤ v ∧ v ≤ eta) ∨ (b ≤ -v ∧ -v ≤ b+W)) :
    -u-v-1 ≤ b+6*(W+eta) := by
  rcases hu with hu | hu <;> rcases hv with hv | hv <;> omega

theorem tame_different_payment (kappa eta W d : ℕ) (hd : d ≤ 1) :
    3*(kappa+(48*(eta+W)+4)*d) ≤ 3*kappa+150*(eta+W+1) := by
  have h := Nat.mul_le_mul_left (48*(eta+W)+4) hd
  simp at h
  omega

#print axioms opposite_jump_guard
#print axioms tame_different_payment
#check Lift.exists_tameChart
#check IsPotCrys.isCrystalline_of_inertia_fixes
#check Lift.TameChart.killsCokernel_of_isKilledBy
#check Lift.TameChart.exists_z_smul_eq_sum_tameGen
#check Lift.tame_types_exponent
#check block_defect_le_at_place
#print axioms Lift.exists_tameChart
#print axioms IsPotCrys.isCrystalline_of_inertia_fixes
#print axioms Lift.tame_types_exponent

end RHGaloisRun69
