import New.Selmer.TwistForRows

/-!
# Compact crystalline-relation transport: extracted native interface

Status: **PREPARED, NOT KERNEL-CHECKED IN THIS REPOSITORY**.

Primary source: `lsernau/grh-lean` at
`72fead102f663d5c7a407964a13dc0cf9d977207`, `grh-compact/src`.
Mathlib: `56a005855ea17e0b0958f73ec801ae140b0a1679`; Lean: `v4.35.0`.

Exact source anchors (git blobs):

* `New/Selmer/TwistForRows.lean`
  `802242498ad4530e7f52cc4f14e0a03be2c59f4d` (the inline caller, lines 44--59);
* `Lib/General/Algebra/FittingDuality.lean`
  `50c522f409cc0214163df1d26b77aede4aa8100a` (`relEval`, `obeying`, `mapRel`,
  `relationsOn`, `mem_obeying`);
* `New/Selmer/TwistTheorem.lean`
  `bdf0bed65edefd067b584695b1fac0b6acbbd754` (downstream mapped relations);
* Mathlib `Mathlib/LinearAlgebra/Dual/Lemmas.lean` at the pinned Mathlib revision
  (`forall_dual_apply_eq_zero_iff`, whose essential premise is `Projective O O'`).

This file extracts the algebraic core currently inlined in
`exists_mFoldTwist_selmerLengthLe`: scalar extension commutes with evaluation after applying
an `O`-linear dual, so a projective coefficient module is separated by its dual.  The second
lemma records the contravariance that the caller then uses: adding relations shrinks `obeying`.
Neither lemma imports an RH conclusion.

Executed checks in this run:

* source-pin and blob authentication: PASS;
* theorem-token/source-anchor verifier `verify_compact_relation_transport_native.py`: PASS;
* finite free dual-separation exhaustive check over `F_2`, `F_3`, and `F_5`: PASS
  (reported by that verifier).

Failed/unavailable attempt: no `lean`, `lake`, or `elan` executable is installed in the run
environment, and this Cathedral repository does not vendor the compact source's `.lake` tree.
Consequently no elaboration or kernel PASS is asserted here.  The first next test is to copy this
file under the pinned compact `src/` tree and execute
`lake env lean CompactRelationTransportNative.lean`; only after that succeeds should the inline
block in `TwistForRows.lean` be replaced.

RESUME HERE: run the pinned native command above.  If elaboration rejects the generic projective
interface, preserve this file and specialize only the first lemma to `CoeffRing` plus the exact
`inclusion hO` instances constructed at `TwistForRows.lean:50--51`; do not strengthen the caller's
mathematical hypotheses.
-/

noncomputable section

open Matrix Module Finsupp
attribute [-simp] map_smul AlgHom.toRingHom_eq_coe

namespace CompactRelationTransportNative

variable {O O' Γ n : Type*} [CommRing O] [CommRing O'] [Algebra O O'] [Fintype n]

/-- If every `O`-linear functional kills the old-coefficient evaluation of a relation, then the
scalar-extended relation kills the original `O'`-valued vector.  Projectivity is exactly the
dual-separation premise used by `forall_dual_apply_eq_zero_iff`.

The decisive equation, componentwise for `l : Dual O O'`, is

`l (relEval O' (mapRel (algebraMap O O') f) z i)
   = relEval O f (fun g j ↦ l (z g j)) i = 0`.
-/
theorem relEval_mapRel_eq_zero_of_forall_dual [Projective O O']
    (f : Γ →₀ Matrix n n O) (z : Γ → n → O')
    (h : ∀ l : Dual O O', relEval O f (fun g i ↦ l (z g i)) = 0) :
    relEval O' (mapRel (algebraMap O O') f) z = 0 := by
  funext i
  refine (forall_dual_apply_eq_zero_iff O _).1 fun l ↦ ?_
  simpa [← smul_toAlgebra, mapRel, linearCombination,
    ↓sum_mapRange_index, sum] using congrFun (h l) i

/-- Relations transport into `relationsOn` once their evaluations vanish after every dual. -/
theorem mapRel_mem_relationsOn_of_forall_dual [Projective O O']
    (Z' : Submodule O' (Γ → n → O')) (f : Γ →₀ Matrix n n O)
    (h : ∀ z ∈ Z', ∀ l : Dual O O',
      relEval O f (fun g i ↦ l (z g i)) = 0) :
    mapRel (algebraMap O O') f ∈ relationsOn Z' := by
  intro z hz
  exact relEval_mapRel_eq_zero_of_forall_dual f z (h z hz)

/-- `obeying` is contravariant in its set of relations. -/
theorem obeying_antitone {B : Type*} [AddCommGroup B] [Module O B]
    {R T : Set (Γ →₀ Matrix n n O)} (hRT : R ⊆ T) :
    obeying T B ≤ obeying R B := by
  intro c hc
  exact mem_obeying.2 fun f hf ↦ mem_obeying.1 hc f (hRT hf)

end CompactRelationTransportNative
