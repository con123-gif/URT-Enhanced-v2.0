import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TAlgCyc
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TAlgRes
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TwistConjugateSelfDual
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WinTop
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native certificate that `IsAutQA` is invariant under a continuous
finite-order twist with open kernel, and hence under the quadratic sign
characters used by `countQ_alt`.

Upstream source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH. It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.MainNotions.N GlobalTheory.CuspRep GlobalTheory.GalOfCusp
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Z.Win

namespace RHMathCountQAutTwist

private theorem irr_of_tw {Gamma k : Type} [Group Gamma] [Field k] {n : Nat}
    (r : Gamma ->* GL (Fin n) k) (delta : Gamma ->* kˣ)
    (h : IsIrr (tw r delta)) : IsIrr r := by
  obtain ⟨hne, -, hmin⟩ := h
  refine ⟨hne, fun _ _ _ => Submodule.mem_top, fun U _ hU => hmin U le_top fun s v hv => ?_⟩
  have e : (tw r delta s : Matrix (Fin n) (Fin n) k).mulVec v =
      (delta s : k) • (r s : Matrix (Fin n) (Fin n) k).mulVec v := by
    rw [tw_val, Matrix.smul_mulVec]
  rw [e]
  exact U.smul_mem _ (hU s v hv)

private theorem comp_tw {Gamma Delta k : Type} [Group Gamma] [Group Delta]
    [Field k] {n : Nat} (r : Gamma ->* GL (Fin n) k) (delta : Gamma ->* kˣ)
    (f : Delta ->* Gamma) :
    (tw r delta).comp f = tw (r.comp f) (delta.comp f) := by
  refine MonoidHom.ext fun s => Units.ext ?_
  simp only [MonoidHom.comp_apply, tw_val]

variable {Omega : Type} [Field Omega] [Algebra ℚ Omega] [IsAlgClosure ℚ Omega]
variable {l n : Nat} [Fact l.Prime]
variable {iota : Qbar l ≃+∗ ℂ}

/-- Exact transport theorem used to audit the `AdmRNAlt.aut` field in the
actual `countQ_alt` caller. The source supplies both the automorphic-attached
and `WitA` transports once the finite character is converted to an algebraic
Hecke character. -/
theorem isAutQA_twist_of_open_kernel
    (P : _root_.UpperTheory.V.Af.Hypotheses')
    (r : G ℚ Omega ->* GL (Fin n) (Qbar l))
    (delta : G ℚ Omega ->* (Qbar l)ˣ)
    (hr : Continuous r) (hdeltaOpen : IsOpen (delta.ker : Set (G ℚ Omega)))
    (hAut : IsAutQA iota r) : IsAutQA iota (tw r delta) := by
  have hdeltaAlg : UpperTheory.V.Sd.IsAlgChar iota delta := by
    have h := (_root_.UpperTheory.V.Sd.alg_cyclotomic_of_printed_results
      P ℚ Omega l iota).1 0 delta hdeltaOpen
    simpa using h
  intro _ K _ _ _ _ _ _ hK hirrTw
  haveI : Algebra.IsAlgebraic ℚ K := inferInstance
  haveI : IsAlgClosure K Omega :=
    ⟨IsAlgClosure.isAlgClosed ℚ,
      (IsAlgClosure.isAlgebraic (R := ℚ) (K := Omega)).tower_top K⟩
  rw [comp_tw] at hirrTw ⊢
  have hirr := irr_of_tw _ _ hirrTw
  obtain ⟨hAuto, hWit⟩ := hAut hr K hK hirr
  have hdeltaAlgK := _root_.UpperTheory.V.Sd.alg_restriction_of_printed_results
    P ℚ K Omega l iota delta hdeltaAlg
  obtain ⟨hdeltaK, art, chi, a, hart, hpos, hL⟩ := hdeltaAlgK
  have hdeltaAlgKSd : UpperTheory.V.Sd.IsAlgChar iota
      (delta.comp (AlgEquiv.restrictScalarsHom ℚ : G K Omega ->* G ℚ Omega)) :=
    ⟨hdeltaK, art, chi, a, hart, hpos, hL⟩
  have hdeltaAlgKAf : UpperTheory.V.Af.IsAlgChar iota
      (delta.comp (AlgEquiv.restrictScalarsHom ℚ : G K Omega ->* G ℚ Omega)) :=
    ⟨chi, hdeltaK, art, a, hart, hpos, hL⟩
  refine ⟨?_, ?_⟩
  · exact _root_.UpperTheory.V.Sd.twist_conjugate_selfDual
      P K Omega l iota n _ _ hdeltaAlgKSd hAuto
  · exact _root_.UpperTheory.V.Z.Win.WitA.witness_twist_algebraic_character
      P hdeltaAlgKAf hdeltaK hAuto hWit

/-- The quadratic sign constructor returns continuity and the pointwise
alternative `1` or `-1`. Those data force an open kernel, so the preceding
transport theorem applies without a conductor or level premise. -/
theorem isAutQA_twist_of_sign_range
    (P : _root_.UpperTheory.V.Af.Hypotheses')
    (r : G ℚ Omega ->* GL (Fin n) (Qbar l))
    (delta : G ℚ Omega ->* (Qbar l)ˣ)
    (hr : Continuous r) (hdeltaCont : Continuous delta)
    (hdeltaSign : forall s, delta s = 1 ∨ delta s = -1)
    (hAut : IsAutQA iota r) : IsAutQA iota (tw r delta) := by
  apply isAutQA_twist_of_open_kernel P r delta hr
  · exact GlobalTheory.HeckeGal.isOpen_ker_of_pow delta hdeltaCont (by norm_num)
      fun s => by
        rcases hdeltaSign s with hs | hs <;> rw [hs] <;> norm_num
  · exact hAut

/-- Replay through the common reduction stack; the exact theorem above is the
trusted fallback when no tactic shortens the term. -/
theorem isAutQA_twist_of_sign_range_replay
    (P : _root_.UpperTheory.V.Af.Hypotheses')
    (r : G ℚ Omega ->* GL (Fin n) (Qbar l))
    (delta : G ℚ Omega ->* (Qbar l)ˣ)
    (hr : Continuous r) (hdeltaCont : Continuous delta)
    (hdeltaSign : forall s, delta s = 1 ∨ delta s = -1)
    (hAut : IsAutQA iota r) : IsAutQA iota (tw r delta) := by
  first
  | (rh_reduce 3 using [isAutQA_twist_of_sign_range P r delta hr hdeltaCont hdeltaSign hAut]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact isAutQA_twist_of_sign_range P r delta hr hdeltaCont hdeltaSign hAut

end RHMathCountQAutTwist

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHMathCountQAutTwist.isAutQA_twist_of_sign_range limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms RHMathCountQAutTwist.isAutQA_twist_of_open_kernel
#print axioms RHMathCountQAutTwist.isAutQA_twist_of_sign_range
#print axioms RHMathCountQAutTwist.isAutQA_twist_of_sign_range_replay
