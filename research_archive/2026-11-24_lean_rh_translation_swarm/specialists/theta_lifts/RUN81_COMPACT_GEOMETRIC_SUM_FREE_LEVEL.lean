import New.Data.ChosenPlaceLevels
import Lib.Adelic.Transference.MassBasic
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.Tactic

/-!
# RUN81 — eliminate the DVR argument at the actual A2 freeness supplier
27 November 2026. HUMAN SOURCE-MATCHED local proof and caller analysis;
Lean candidate PREPARED, not compiled. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact source lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Historical old pin 40e56bab026552e089d7afcfeff08d2defb9c005 not mixed.

Read current ONE_EQUATION_MISSION 3adc76221a978016e3505cdf3e36ad688354d7d7,
LIVE_PROOF_SPINE f62d03bdcd987268e70657298702a238335fb3e6,
LIVE_OBLIGATIONS b24ae883acc131f657241e944d523013ac5432a9,
AGENTS, swarm protocol, handoff, expansion and continuity. RUN80
89d42759 / blob da72342b50ae8376e1ff6f6aad58104fe500ed6c established
a two-prime human argument using a minimum DVR valuation. This run
eliminates the remaining valuation infrastructure from that proof,
and attaches native finiteness to its actual chosen-level caller.
Prime 3b3629d3 and acceleration 263f1763 peer results inspected;
do not redo their normalization or frame construction. Reuse the
short spanning appendix blob 576e1b4f592a01ef3147eba7815b39fdef8fd9a6.

## Exact source interface

Relative to compact source:
* New/Data/ChosenPlaceLevels.lean d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3:
  chosenEquiv, card_chosenPlace, chosenLevel,
  classAut_eq_bot_of_le_chosenLevel, card_classAut_dvd_chosenGroupOrder.
* Lib/Adelic/Unitary/CongruenceLevel.lean 07e6502ac533d1868d68f817a00bdd2ac95f4616:
  levelOf, mem_levelOf, levelOf_le_Kf, IsLevel instance,
  Kf.reduceFamily, Kf.reduceAt_eq_of_atPlace.
* Lib/Adelic/Hecke/ClassMean.lean b9d642228711dcfb20687f0b2579fa8ff99838f3:
  HasFiniteType.finite_aut.
* Lib/Adelic/Transference/MassBasic.lean ab9b5714cab038182220a2e1631a96f2de1ddf78:
  Space.hasFiniteType_of_isLevel for the definite space.
* New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65:
  columnLevel = chosenLevel intersect last-row congruence,
  classAut_columnLevel_eq_bot (66–67).
* New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7:
  span_isShort_eq_top (105–147), span_short_ramifiedColumns (251–257),
  exists_chain_eq_sum (302–312), IsGoodDatum.gaugeLe_chain (324–335).
* New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
  Data.short_forms consumes both span and chain bounds.
* New/Filling/FillingData.lean also consumes classAut_columnLevel_eq_bot
  (source-search excerpt inspected; full file not audited in this run).

## 1. Exact cancellation before any valuation: the missing local bridge

Let R be ANY commutative local ring with residue field k, A in M_n(R)
with A mod maximal ideal = I and A^u=I for a natural u nonzero in k.
Define S=sum_(j=0)^(u-1) A^j. No inverse of u in the original matrix
expression and no division by an entry of A-I is required. The decisive
identity is

    S(A-I)=A^u-I=0,    det(S) mod m = u^n != 0.                 (1)

Since a scalar in a local ring is a unit precisely when its residue is
nonzero, S is a unit in the matrix ring. Multiply on the left by S^-1,
giving A=I. This works without completeness, a valuation, a uniformizer,
a characteristic-zero assumption on R, or a discreteness assumption.
The zero-rank case is harmless: det of the empty matrix is 1.
The only indispensable numerical condition is u nonzero in the residue
field (so u cannot be zero). For a counterexample without it, use the
one-by-one matrix -1 over Z_2 with u=2, or I+E12 over F_p with u=p.
This is an exact human proof, not a finite regression.

The three needed mathlib primitives were read AT THE COMPACT PIN:
Mathlib/Algebra/Ring/GeomSum.lean 7f7c737101ae61d9fda60a9d61e455e8593b6509
  geom_sum_mul_add, valid in a noncommutative ring;
Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean
  5f9b0440c80e58610c5f91503ca91d55d5f2ba88 residue_ne_zero_iff_isUnit;
Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean
  ed214e519f9c71ca72817ab8e78108c833721177 isUnit_iff_isUnit_det;
Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean
  1c51151d114eb9c0cd40f0f640167585f42e1fe6 det_smul;
Mathlib/Data/Matrix/Basic.lean ed4319a4f6d9aefb795b98d0a42549aa52dc0be7
  RingHom.mapMatrix; and Mathlib/GroupTheory/OrderOfElement.lean
  e3ba013b2d07a34d97767b98ef731eee5e0bdd7d
  orderOf_pow_orderOf_div, orderOf_pos, orderOf_eq_one_iff.
The helper uses precisely these operations. No new number theoretic axiom.

## 2. No prime-power factorization is needed either

Work first with K=D.chosenLevel, not an arbitrary subgroup K'.
The native IsLevel instance for levelOf supplies
Space.hasFiniteType_of_isLevel at stdSpace. Thus the actual stabilizer
H=classAut stdRatPoints D.chosenLevel g is finite by finite_aut.
This avoids re-proving full lattice finiteness in Lean and avoids wrongly
assuming IsLevel for an arbitrary subgroup of the chosen level.

If x in H is not identity, its order M>1 has a prime divisor ell.
Then y=x^(M/ell) has order ell. The SAME y belongs to H and hence
g^-1 y g reduces to identity at all chosen places. Choose the chosen
place above D.g 0 unless ell=D.g 0, in which case choose a place above
D.g 1. The two residue characteristics differ (D.g_injective), and
D.chosenEquiv ensures that both chosen-place sets are nonempty.
At that place the local component of g^-1 y g belongs to GL_n(LocInt w)
by mem_levelOf, levelOf_le_Kf and mem_Kf_iff; its reduction is I
by Kf.reduceFamily and Kf.reduceAt_eq_of_atPlace. The integral lift is
unique because LocInt w embeds in LocField w. The lifted matrix has
ell-th power I by injectivity, and ell is nonzero in its residue field.
Apply (1). Local identity of the conjugate implies local identity of y;
as y is a rational point, the embedding E -> LocField w is injective
entrywise, giving y=I globally. Contradiction to order ell.
No statement that a general adelic element is determined by one place
is used: rationality is indispensable. No use of original neatness or
rank bound is needed for this human derivation.

Therefore H=bottom. For ANY K'<=D.chosenLevel, its stabilizer embeds
in H by definition classAut=Gamma intersect conjugate(K'), so is
trivial even if K' is not open. This is the exact statement of the
existing Data.classAut_eq_bot_of_le_chosenLevel with its rank guard
unused. Finite class sums and IsLevel at other consumers are unchanged.

## 3. Caller and graph audit

At ColumnDefs.classAut_columnLevel_eq_bot, use K'=D.columnLevel 0
and inf_le_left. At ChainValuation.exists_chain_eq_sum, the actual
stage-j argument to H.sum_chain_mem_nsmul is the same substitution
with K'=D.columnLevel j and inf_le_left; no change to the joint
invariance, B, N_j, r_j, support, class count or final g.
At span_short_ramifiedColumns use the stage-zero substitution in
span_isShort_eq_top; preserve the different, Schur and numerical bounds.
The unchanged Data.short_forms receives both conclusions.

Original graph:
  short_forms -> span_short_ramifiedColumns / weylNormSq_Bmu_le /
  exists_indexDvd_Bmu_divisible -> columnLevel freeness / chain freeness
  -> Data.classAut_eq_bot_of_le_chosenLevel -> classAut_eq_bot
  -> signed-frame large trace norm.
Candidate:
  same callers -> chosenLevel H finite -> prime order obstruction
  -> actual local integral lift + residue map -> geometric sum unit
  -> H=bottom -> subgroup monotonicity.
The native local-component bridge has NOT been elaborated; the generic
matrix and prime-order helpers below and exact chosenLevel conditional
adapter are prepared. In particular do NOT claim that native
hkill is supplied by merely importing the original freeness theorem.
The actual bridge still needs connecting local matrix representatives,
residue characteristic, rational-point injectivity to hkill.
No dependency removed globally; card_GL_dvd_chosenGroupOrder and other
rank consumers preserved, all A1–A3 and B/C/D/E/V remain open.
Context key: compact pin, D, E, n, g, same rational y, chosen w, ell,
LocInt w residue map; not an arbitrary adelic element.
No URT advantage asserted. Backtrack from general DVR power
factorization to prime-order geometric sum; no scalar tests duplicated.

## 4. Verification and handoff

command -v lean lake elan in local shell yielded no binaries.
No native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier run.
No new native PASS. Actual B2 replay receipt a5dba18064d92bade88f3133b7217addcfe9b9ff
re-read: eight helpers and six separate original probes accepted,
negative control rejected, caller_replacements_checked=false.
New repaired pair/energy status path
compute/rh-compact-b2-energy-repair-20261127/status.json on
cathedral-research-state returned 404 in this run; no new claim.
Actual A build timeout receipt 088cd2ec0e935ee1a282f10096949bcf671cc804
re-read, exit 124. All prior evidence retained.

RESUME HERE: in the shared compact A verification environment, compile
the local matrix lemma and conditional chosen-level bridge below, then
implement hkill using actual mem_levelOf, mem_Kf_iff,
Kf.reduceAt_eq_of_atPlace and rational embedding injectivity as in §2;
check the original-statement bridge and its axioms before replacing
the exact stage-zero and chain freeness arguments. No new unrelated
exponent optimization. HANDOFF TO kernel, integration, editor, audit.
-/

namespace ThetaRun81

/-- A prime-to-residue-characteristic torsion matrix cannot lie in
the identity congruence kernel. No DVR hypothesis. -/
theorem matrix_torsion_eq_one
    {R n : Type*} [CommRing R] [IsLocalRing R]
    [Fintype n] [DecidableEq n] (A : Matrix n n R) (u : ℕ)
    (hA : A.map (IsLocalRing.residue R) = 1)
    (hu : (u : IsLocalRing.ResidueField R) ≠ 0)
    (hpow : A ^ u = 1) : A = 1 := by
  classical
  let f : Matrix n n R →+* Matrix n n (IsLocalRing.ResidueField R) :=
    (IsLocalRing.residue R).mapMatrix
  have hf : f A = 1 := hA
  let S : Matrix n n R := ∑ j ∈ Finset.range u, A ^ j
  have hS : f S = (u : IsLocalRing.ResidueField R) •
      (1 : Matrix n n (IsLocalRing.ResidueField R)) := by
    simp [S, map_sum, hf, Nat.cast_smul_eq_nsmul]
  have hd : IsLocalRing.residue R S.det ≠ 0 := by
    rw [RingHom.map_det]
    change (f S).det ≠ 0
    rw [hS, Matrix.det_smul, Matrix.det_one, mul_one]
    exact pow_ne_zero _ hu
  have hunit : IsUnit S :=
    (Matrix.isUnit_iff_isUnit_det S).2
      ((IsLocalRing.residue_ne_zero_iff_isUnit S.det).1 hd)
  have hz : S * (A - 1) = 0 := by
    have he := geom_sum_mul_add (A - 1) u
    have he' : S * (A - 1) + 1 = 0 + 1 := by
      simpa [S, sub_add_cancel, hpow] using he
    exact add_right_cancel he'
  obtain ⟨U, hU⟩ := hunit
  rw [← hU] at hz
  have hz' := congrArg (fun X : Matrix n n R =>
    (↑(U⁻¹) : Matrix n n R) * X) hz
  have hz'' : A - 1 = 0 := by
    simpa [← mul_assoc] using hz'
  exact sub_eq_zero.mp hz''

/-- It suffices to exclude prime-order torsion in the same finite group. -/
theorem finite_group_trivial {G : Type*} [Group G] [Finite G]
    (kill : ∀ y : G, ∀ p : ℕ, p.Prime → y ^ p = 1 → y = 1)
    (x : G) : x = 1 := by
  by_contra hn
  have hM : orderOf x ≠ 1 := fun h => hn (orderOf_eq_one_iff.mp h)
  obtain ⟨p, hp, hd⟩ := Nat.exists_prime_and_dvd hM
  let y := x ^ (orderOf x / p)
  have ho : orderOf y = p :=
    orderOf_pow_orderOf_div (orderOf_pos x).ne' hd
  have hy : y ^ p = 1 := orderOf_dvd_iff_pow_eq_one.mp (by rw [ho])
  have hy' := kill y p hp hy
  rw [hy', orderOf_one] at ho
  exact hp.ne_one ho.symm

/-- Exact caller adapter. The local-component hkill premise is NOT
discharged here; the preceding human derivation identifies how. -/
theorem chosenLevel_free_of_prime_kill {P} {D : Data P}
    {n : Type} [Fintype n]
    (hkill : ∀ g, ∀ y : classAut stdRatPoints (D.chosenLevel (n := n)) g,
      ∀ p : ℕ, p.Prime → y ^ p = 1 → y = 1) :
    ∀ g, classAut stdRatPoints (D.chosenLevel (n := n)) g = ⊥ := by
  intro g
  letI : Finite (classAut stdRatPoints (D.chosenLevel (n := n)) g) :=
    HasFiniteType.finite_aut g
  apply bot_unique
  intro x hx
  have h := finite_group_trivial (hkill g)
    (⟨x, hx⟩ : classAut stdRatPoints (D.chosenLevel (n := n)) g)
  exact Subgroup.mem_bot.mpr (congrArg Subtype.val h)

/-- No openness hypothesis on the smaller subgroup. -/
theorem smallerLevel_free {P} {D : Data P} {n : Type} [Fintype n]
    {K : Subgroup (Gf D.E n)} (hK : K ≤ D.chosenLevel)
    (hfree : ∀ g, classAut stdRatPoints (D.chosenLevel (n := n)) g = ⊥) :
    ∀ g, classAut stdRatPoints K g = ⊥ := by
  intro g
  apply bot_unique
  intro x hx
  have hm : x ∈ classAut stdRatPoints (D.chosenLevel (n := n)) g :=
    ⟨hx.1, hK hx.2⟩
  simpa [hfree g] using hm

#print axioms matrix_torsion_eq_one
#print axioms finite_group_trivial
#print axioms chosenLevel_free_of_prime_kill
#print axioms smallerLevel_free
end ThetaRun81

#check Data.classAut_eq_bot_of_le_chosenLevel
#check Space.hasFiniteType_of_isLevel
#check Kf.reduceAt_eq_of_atPlace
#check mem_Kf_iff
#check mem_levelOf
