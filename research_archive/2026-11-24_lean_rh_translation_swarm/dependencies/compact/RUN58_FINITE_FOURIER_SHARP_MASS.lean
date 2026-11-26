import Lib.SiegelWeil.RallisInner.SharpData
import Mathlib.Tactic

/-!
# RUN58 — one Fourier pairing supplies the actual C sharp-mass witness
26 November 2026. SOURCE-MATCHED human derivation; scalar and matrix
certificates prepared, not compiled. Dependency lane, original lane 12,
compact lane 13. Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb read (including
mandatory unified engine and newest primitive-closure focus), protocol,
handoff, AGENTS and compact manuscript read. Observed branch head
3e2e639b38f30e6b707aa22a8deaa8e6099ddaca. Resume 05e90181f02183ae23d5f0abe3f7207d86d45d07.
Peers: 9e1dbfbe (safe pair and cup), 9a920a1a (four-test Frobenius),
bee7866c (conductor and zeta mass), 1b2053e9 (cut cokernel audit),
2fc26b53 (comparison norm correction). This is a different local
supplier, not another norm-budget or endgame redesign.

## Native ledger (actual bodies inspected)
Lib/Weil/Construction/FiniteHeisenberg.lean be448ff4db1da9bfa0fe7bd637272be079be2285:
  forall_psi₀_mul_eq_one_iff 43, psi₀_congr 66, semichar 70.
Lib/Weil/Construction/FiniteVacuum.lean b775c3efc7afae92b21402691f615e0dfbf73ee1:
  latticeMeasure_stdLattice 34, mem_stdLattice_iff_psi₀ 62,
  integral_psi₀_stdLattice 66.
Lib/Weil/MixedModel/AdelicSum.lean 49baa2583b79e2ffc4fff7dc791415866c03071d:
  eq_sum_cosetIndicator 130, mem_of_cosets 151,
  schrodingerAct_schrodingerAct 182, schrodingerAct_boxIndicator 188,
  schrodingerAct_idem 201, schrodingerAct_star 207,
  Space.exists_schrodingerComb_eq 218.
Lib/Weil/MixedModel/Names.lean 7dc9e83b6974266a3ed74a0ab24b47ec63a3e953:
  fourier_boxIndicator 51, dataInner_heisenbergComb 61,
  name_schrodingerComb, dataInner_name.
Lib/Weil/Construction/Projections.lean 7a187f8be18a00b889082b56818393f20a7f88e4:
  finHeisOp_projOn 122, dataInner_projOn 126, projOn_finHeisOp 149.
Lib/Weil/MixedModel/NameModulus.lean f382771e76b0624e7b10d523ce9d854737be00ec:
  reduction_surjective 90, generator_spec 99, localInner_liftFn 154.
Lib/Weil/MixedModel/NameWeilAction.lean a8bee0d694dc7891bb451bc6503f45aed919d2d3:
  omega_name 180.
Lib/SiegelWeil/RallisInner/SharpData.lean ea9f665a9a89411f1353d098ff2e0a4e59a719f5:
  isSharp_modDatum (near lines 430--456), inner_product_formula 150.
Lib/Weil/CompactLift/RallisFormula.lean 8d41f50fc88d20a40531973b916aaac7491b8e72:
  integral_eq_zero_of_lift_eq_zero 221, rallis_inner_product_euler.
New/Exchange/CharacterLiftNorm.lean 3a83f00d1356032da157bf4709b7ab4d9d829c3e:
  Data.auxLift_injective_and_hasSum_inner 113--132, actual sharp
  witness at 126--129, and rank-one norm caller at 209--215.
New/Rows/NaturalFormNear.lean 2393479c4efe2c146f1251298992c00021cba4c8:
  carrierForm_ne_zero 39--50.
New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88;
New/Rows/ComparisonForms.lean 14ef893c54f5db837ea7e4f143b2b1a444b89b5a.
No name-only equivalence with old 40e56bab source.

## 1. One annihilator identity, including the normalization
Let L=Ohat^n, measure(L)=1, S disjoint from its conjugate, e=idem S,
e*=idem conjugate S, L_S={x:ex in L}, L_off={x:(1-e)x in L}.
Let chi=psi0, with pairing chi(star z dot x). The actual WeilData
self-duality says annihilator(L)=L: test a single coordinate with
each integral scalar, using forall_psi₀_mul_eq_one_iff. For any z,
translation by y0 in L preserves normalized Haar measure, so the
integral I(z) of the character over L obeys
 I(z)=chi(star z dot y0) I(z).
If z is not in L choose y0 with phase !=1, then I(z)=0. Otherwise
I(z)=1. No estimate or choice of additive character normalization.

In Names.fourier_boxIndicator the integrand is
  1_{L_S}(x+m) chi(star z dot e(x+m)) c 1_{L_S}(z).
Translate x by e m inside L_off, using e(x+m)=e(x+em).
Then 1_{L_S} restricts L_off to L. The remaining integral is I(e* z).
Multiply by 1_{L_S}(z); because ee*=0 this is exactly
  c 1_{L_{S union conjugate S}}(z).
This recovers the precise caller formula with no extra index or
volume factor; m need not be integral.

## 2. Finite Fourier expansion on the SAME lattice
Write B=star(t)L where t is the integral finite idele in
exists_schrodingerComb_eq. B is open in compact L, so N=[L:B] is
positive finite. For x in L_S let v=e t^-1 x. The phase
  q -> chi(-star q dot v)
descends to L/B since star(b) dot v is integral for b in B.
Each coset has measure 1/N. The normalized finite sum of these phases
therefore equals I(-v) = 1_{v in L}. For x outside L_S the product
with 1_{L_S}(x) is zero; t integral implies v cannot be integral there.
Thus
  1_{L_S}(t^-1 x)
    = 1_{L_S}(x) / N * sum_{q in L/B} chi(-star q dot e t^-1 x).
For the translated coset centered at z replace x by x-z.
Each summand is exactly A(-ez) A(-e* star(t^-1)q) 1_{L_S},
where A=schrodingerAct, by the pure translation and multiplication
laws. The native cocycle composes these into one A(y) with a unit
phase, absorbed into the coefficient. This is the finite sum in
AdelicSum 218, with the integral-idele condition essential.
Compact support and local constancy give the finite coset cover
in eq_sum_cosetIndicator / mem_of_cosets, hence every admissible
Psi lies in the finite range. No claim for arbitrary functions.

## 3. Factorization of the Gram matrix; choice independence
Put P=projOn S, a_y=A(y)1_{L_S}, U_y=rho(finVec((e+e*)y)).
The projective action laws have the SAME beta. A_y preserves
localInner since the phase is unit and the change x->x+ey
preserves L_off. U_y preserves dataInner. With z=y'-y,
move the first operator across the inner product; both sides
acquire the common beta(-y,y') (and A(-y),U(-y) are inverses).
The remaining scalar localInner(1,A(z)1) is zero unless ez integral,
and the Fourier integral from section 1 forces e*z integral.
When both hold, the scalar equals semichar((e+e*)z)^(-1):
schrodingerAct_boxIndicator gives precisely this equality.
On the vacuum side P U_z P is zero unless the same condition
holds, by projOn_finHeisOp, and otherwise is the same
semichar inverse times P by finHeisOp_projOn. Self-adjointness
of P supplies
  <U_y P f,U_y' P f'> = localInner(a_y,a_y') <P f,P f'>.
Expand finite coefficients conjugate-linearly in the first slot
and linearly in the second. This is dataInner_heisenbergComb.
If two coefficient vectors represent the same Psi, apply the
identity to their difference with itself; the named difference
has zero self-inner-product and hence is zero. The generalized
inverse defining name is therefore choice-independent ON THE
range (not on all functions). With section 2 this gives
  <name(Psi)f,name(Psi')f'> = localInner(Psi,Psi') <P f,P f'>.
All phases are cancelled before any bound.

## 4. Actual sharp caller, no norm estimate or new mass assumption
Use the modulus m coprime to its conjugate and S=places(m).
For n' coordinate slots put Q=(O_E/m)^{n'}, N=|Q|.
On L the surjective reduction gives N equal-measure cosets,
each 1/N, since the kernel is generator(m)L and translations
preserve Haar measure. Both liftFn vanish off L_S and are constant
on those cosets, so
  localInner(liftFn F,liftFn G) = (sum_{u in Q} conj(F(u)) G(u))/N.
In isSharp_modDatum take n'=m_rank*n_rank and G=F. The vacuum is
unit and P fixes it; section 3 gives exactly
  <named F,named F> = (sum |F(u)|^2)/N.
Its nonzero hypothesis is star F dot F !=0 (not just a chosen
normalization). Native stdLevelIndex_levelOfSubgroup gives the
additional denominator |GL_n(O_E/m)| for the trivial residue
subgroup. The mass c is therefore exactly
  c = (sum |F(u)|^2)/( |Q| * |GL_n(O_E/m)| ).

For the sharp coefficient consider the given SAME fixed residue
matrix L0 with L0 Y=1 at every nonzero F(Y). If g integral and
the transformed residue Yg (or Yg^-1 by the native action convention)
also lies in support, multiplication by L0 gives g=1 in the
residue group. This proves exact zero off the principal level
within Kf. On the principal level the tame character contribution
is one, by the actual hψ premise and the residue identity.
For a point not in Kf but integral off S union conjugate S, the
native omega_name formula reduces the coefficient to an integral
with both F(x) and F(xg) nonzero (using inverse convention
interchange g and g^-1). At each w in S, reduction left
invertibility implies both lifted matrices X,Y have integral
left inverses A,B: a lift of L0 has product congruent to identity
mod the maximal ideal, and that square matrix is invertible
over the local valuation ring by its unit determinant. If Y=Xg,
then g=AY and g^-1=BX. Both are integral matrices. Thus
g is integral invertible at w, and at its conjugate by the
unitary inverse relation. Together with the stipulated off-S
integrality this contradicts g not in Kf. The local integrand
is zero pointwise, so its integral is zero without bounding
a possibly large multiplier. This reconstructs the decisive
support argument in isSharp_modDatum, not an assertion that
nonzero F alone implies sharpness. Its other clauses are retained:
finitePart by name_mem_finitePart, vacuum_off by
projOn_name_vacElem, clean by the primitive-matrix witness and
either definite signs or nonempty modulus places.

At CharacterLiftNorm.auxLift_injective_and_hasSum_inner the
actual f,c from O.levelIndicator_support_and_normSq give L0
and the nonzero residue norm. The actual tame_eq_one,
nonempty_modulus_places and level-invariance premises enter
isSharp_modDatum at lines 126--129. Consequently the SAME F
supplies nonzero sharp mass, cutoff and clean support in the
Rallis theorem. The rank hypothesis, real edge, rapid decay,
Siegel-Weil theorem, unfolding integrability, Rallis coset
convergence and auxDatum-to-formLift transport remain genuine
suppliers. The normalized mass also enters the actual rank-one
Hecke norm caller at 209--215 and carrier nonvanishing at
NaturalFormNear 46. No independent determinant or row family
introduced. This establishes the human local supplier, not
the C reciprocity-to-isotropy or balanced-row estimate.

## Original/reduced graph, status
Source graph: C row volume -> auxLift_injective_and_hasSum_inner
 -> rallis_inner_product_euler, isSharp_modDatum, actual
 levelIndicator_support_and_normSq, tame and level guards.
 isSharp_modDatum -> dataInner_name, localInner_liftFn, omega_name,
 primitive matrix support, vacuum_off and stdLevelIndex.
 dataInner_name -> exists_schrodingerComb_eq, dataInner_heisenbergComb
 -> fourier_boxIndicator, projOn_finHeisOp, finHeisOp_projOn.
 Reduced human graph shares one normalized annihilator integral
 and finite quotient measure; the same source premises survive.
 No kernel edges deleted, no root obligation counted as newly
 kernel-discharged. Retain context keys pin,E,n,m,S,t,P,F,G,L0,g,w,
 modulus, actual lift index and twist; do not merge different
 coefficient contexts by declaration name. Full previous original
 and reduced graphs and unresolved A/B/C ledgers untouched.
 No native Lean or Lake in local container; no rh_scan/prune/auto
 execution. Prepared certificates below are not executed.
 CI independently reread RUN29 status and targeted results
 (a56e2d3afb99ed8275e81fd63c8494306e57c43f and
 088cd2ec0e935ee1a282f10096949bcf671cc804).
 Run 45803534769 has six native B/C declarations with only
 propext, Classical.choice, Quot.sound; overall ERROR because
 module_1 timed out (2700.11s). This is not new verification.
 No new axiom evidence or native proof-term graph coverage.
 No independent full RH proof, no URT claim, no competing job.

RESUME HERE: at SharpData.inner_product_formula lines 155--195,
 derive the exact measure-preserving orbit unfolding and its
 absolute-integrability majorant from siegel_weil and the actual
 rapid data (not a formal interchange of infinite sums); then
 match the resulting HasSum to CharacterLiftNorm line 132 and
 isolate the remaining comparison/reciprocity primitive. Submit
 this local batch to shared native verification.
HANDOFF TO integration, audit, kernel, literature.
-/

namespace CompactDependencyRun58

-- Translation of a nontrivial character forces its integral to vanish.
theorem invariant_integral_zero (phase I : ℂ) (hp : phase ≠ 1)
    (h : phase * I = I) : I = 0 := by
  have e : (phase - 1) * I = 0 := by rw [sub_mul, one_mul, h, sub_self]
  exact (mul_eq_zero.mp e).resolve_left (sub_ne_zero.mpr hp)

-- Exact normalized quotient mass, after the Haar partition identity.
theorem quotient_mean (N I mass : ℂ) (hN : N ≠ 0)
    (h : N * I = mass) : I = mass / N := by
  apply (eq_div_iff hN).2
  simpa [mul_comm] using h

-- The actual support overlap test: a common residue left inverse
-- annihilates every nonidentity right translate, over ANY residue ring.
theorem common_left_inverse_forces_identity
    {R : Type*} [CommRing R] {n m : Type*} [Fintype n] [Fintype m]
    [DecidableEq n] (L : Matrix n m R) (X : Matrix m n R)
    (g : Matrix n n R) (hX : L * X = 1) (hY : L * (X * g) = 1) :
    g = 1 := by
  rw [← Matrix.mul_assoc, hX, one_mul] at hY
  exact hY

-- Both directions of local integrality reduce to products with
-- integral left inverses, not to an entrywise norm estimate.
theorem overlap_factor
    {R : Type*} [CommRing R] {n m : Type*} [Fintype n] [Fintype m]
    [DecidableEq n] (A B : Matrix n m R) (X Y : Matrix m n R)
    (g gi : Matrix n n R) (hA : A * X = 1) (hB : B * Y = 1)
    (hY : Y = X * g) (hX : X = Y * gi) :
    g = A * Y ∧ gi = B * X := by
  constructor
  · rw [hY, ← Matrix.mul_assoc, hA, one_mul]
  · rw [hX, ← Matrix.mul_assoc, hB, one_mul]

end CompactDependencyRun58

#check Space.exists_schrodingerComb_eq
#check Space.fourier_boxIndicator
#check Space.dataInner_heisenbergComb
#check Space.dataInner_name
#check Modulus.localInner_liftFn
#check isSharp_modDatum
#print axioms CompactDependencyRun58.invariant_integral_zero
#print axioms CompactDependencyRun58.quotient_mean
#print axioms CompactDependencyRun58.common_left_inverse_forces_identity
#print axioms CompactDependencyRun58.overlap_factor
