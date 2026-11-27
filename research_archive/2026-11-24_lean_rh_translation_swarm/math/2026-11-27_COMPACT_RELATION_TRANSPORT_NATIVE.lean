import Lib.General.Algebra.FittingDuality

/-!
# Compact crystalline-relation transport — native replay

**Result status: REPLAYED for these three declarations; not integrated at the Selmer caller.**

Primary source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src`; Lean `v4.35.0`; Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

Exact source anchors (git blobs):

* `Lib/General/Algebra/FittingDuality.lean`
  `50c522f409cc0214163df1d26b77aede4aa8100a`: `relEval`, `obeying`, `mapRel`,
  `relationsOn`, `mem_obeying`;
* `New/Selmer/TwistForRows.lean`
  `802242498ad4530e7f52cc4f14e0a03be2c59f4d`: actual inline consumer at lines 44--59;
* `New/Selmer/TwistTheorem.lean`
  `bdf0bed65edefd067b584695b1fac0b6acbbd754`: downstream mapped relation set at
  lines 109--111;
* pinned Mathlib `Mathlib/LinearAlgebra/Dual/Lemmas.lean`:
  `forall_dual_apply_eq_zero_iff`, requiring `Projective O O'`.

The first prepared version used `smul_toAlgebra`, a helper made visible only through the larger
Selmer import.  Native compilation against the defining module rejected that identifier and
showed `sorryAx` for the failed declarations.  Replacing it by the standard equality
`Algebra.smul_def` removes the accidental import dependency.  The repaired file compiled with
exit code 0 on 27 November 2026 and all three `#print axioms` commands reported exactly
`propext`, `Classical.choice`, and `Quot.sound`.

Original local graph:

`CoeffRing inclusion + finite/torsion-free coefficient extension + crystalline relation proof`
` -> inline dual separation in TwistForRows -> relationsOn membership -> obeying inclusion`
` -> Selmer length monotonicity`.

Reduced local graph certified here:

`Projective O O' + dual-tested old relation -> relEval_mapRel_eq_zero_of_forall_dual`
` -> mapRel_mem_relationsOn_of_forall_dual`, together with `obeying_antitone`.

Surviving obligations are unchanged: the actual caller must still construct `Projective O O'`
from its finite/torsion-free `CoeffRing` inclusion; the crystalline functoriality and local twist
triviality that prove the dual-tested premise remain necessary; and full caller substitution plus
axiom output has not been replayed.  This local extraction does not prove `FitTwistsExist`, the
star inequality, or RH.

Executed commands and full status are recorded by
`verify_compact_relation_transport_native.py` beside this file.

RESUME HERE: copy/import this declaration in the pinned compact tree, replace only the dual-
separation/mapRel sub-block at `New/Selmer/TwistForRows.lean:50--58`, build
`New.Selmer.TwistForRows`, and compare its original/replacement `#print axioms`; retain the
inline proof if instance synthesis or caller conversion fails.
-/

noncomputable section

open Matrix Module Finsupp
attribute [-simp] map_smul AlgHom.toRingHom_eq_coe

namespace CompactRelationTransportNative

variable {O O' Γ n : Type*} [CommRing O] [CommRing O'] [Algebra O O'] [Fintype n]

/-- Dual separation transports a relation across scalar extension.

The decisive componentwise equation is

`l (relEval O' (mapRel (algebraMap O O') f) z i)
   = relEval O f (fun g j ↦ l (z g j)) i = 0`.
-/
theorem relEval_mapRel_eq_zero_of_forall_dual [Projective O O']
    (f : Γ →₀ Matrix n n O) (z : Γ → n → O')
    (h : ∀ l : Dual O O', relEval O f (fun g i ↦ l (z g i)) = 0) :
    relEval O' (mapRel (algebraMap O O') f) z = 0 := by
  funext i
  refine (forall_dual_apply_eq_zero_iff O _).1 fun l ↦ ?_
  simpa [← Algebra.smul_def, mapRel, linearCombination,
    ↓sum_mapRange_index, sum] using congrFun (h l) i

/-- The dual-tested relation belongs to the scalar-extended relation module. -/
theorem mapRel_mem_relationsOn_of_forall_dual [Projective O O']
    (Z' : Submodule O' (Γ → n → O')) (f : Γ →₀ Matrix n n O)
    (h : ∀ z ∈ Z', ∀ l : Dual O O',
      relEval O f (fun g i ↦ l (z g i)) = 0) :
    mapRel (algebraMap O O') f ∈ relationsOn Z' := by
  intro z hz
  exact relEval_mapRel_eq_zero_of_forall_dual f z (h z hz)

/-- Adding relations shrinks the module of functions obeying them. -/
theorem obeying_antitone {B : Type*} [AddCommGroup B] [Module O B]
    {R T : Set (Γ →₀ Matrix n n O)} (hRT : R ⊆ T) :
    obeying T B ≤ obeying R B := by
  intro c hc
  exact mem_obeying.2 fun f hf ↦ mem_obeying.1 hc f (hRT hf)

#print axioms relEval_mapRel_eq_zero_of_forall_dual
#print axioms mapRel_mem_relationsOn_of_forall_dual
#print axioms obeying_antitone

end CompactRelationTransportNative
