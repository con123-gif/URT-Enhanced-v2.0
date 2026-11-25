import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native certificate for the `AdmRNAlt.dual` comparison node in the
actual `countQ_alt` caller.

Upstream source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH. It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.MainNotions.N UpperTheory.V UpperTheory.V.Af

namespace RHMathCountQDualTwist

variable {Gamma k : Type} [Group Gamma] [Field k] {n : Nat}

/-- Expanding the scalar twist gives two copies of `delta`; when its square is
one, the same pairing matrix and the same polarization character work. -/
theorem dualTw_twist_of_sq_one
    (r : Gamma ->* GL (Fin n) k) (delta theta : Gamma ->* kˣ)
    (hdelta : forall s, (delta s : k) * (delta s : k) = 1)
    (hdual : DualTw r theta) : DualTw (tw r delta) theta := by
  obtain ⟨P, hP⟩ := hdual
  refine ⟨P, fun s => ?_⟩
  calc
    ((tw r delta s : Matrix (Fin n) (Fin n) k)ᵀ *
          (P : Matrix (Fin n) (Fin n) k) *
          (tw r delta s : Matrix (Fin n) (Fin n) k)) =
        (((delta s : k) * (delta s : k)) •
          ((r s : Matrix (Fin n) (Fin n) k)ᵀ *
            (P : Matrix (Fin n) (Fin n) k) *
            (r s : Matrix (Fin n) (Fin n) k))) := by
      simp only [tw_val, Matrix.transpose_smul, Matrix.smul_mul,
        Matrix.mul_smul, smul_smul]
    _ = ((r s : Matrix (Fin n) (Fin n) k)ᵀ *
          (P : Matrix (Fin n) (Fin n) k) *
          (r s : Matrix (Fin n) (Fin n) k)) := by
      rw [hdelta s, one_smul]
    _ = (theta s : k) • (P : Matrix (Fin n) (Fin n) k) := hP s

/-- The actual quadratic sign constructor supplies this pointwise range. -/
theorem dualTw_twist_of_sign_range
    (r : Gamma ->* GL (Fin n) k) (delta theta : Gamma ->* kˣ)
    (hdelta : forall s, delta s = 1 ∨ delta s = -1)
    (hdual : DualTw r theta) : DualTw (tw r delta) theta := by
  apply dualTw_twist_of_sq_one r delta theta
  · intro s
    rcases hdelta s with hs | hs <;> rw [hs] <;> norm_num
  · exact hdual

variable {Omega : Type} [Field Omega] [Algebra ℚ Omega] [IsAlgClosure ℚ Omega]
variable {l n : Nat} [Fact l.Prime] {wt : Int}

/-- Exact transport of the `dual` field of `AdmRNAlt`; the original
`IsCycWt` witness is reused and its weight is unchanged. -/
theorem admRNAlt_dual_twist_of_sign_range
    (r : G ℚ Omega ->* GL (Fin n) (Qbar l))
    (delta : G ℚ Omega ->* (Qbar l)ˣ)
    (hdelta : forall s, delta s = 1 ∨ delta s = -1)
    (hdual : exists theta, IsCycWt l wt theta ∧ DualTw r theta) :
    exists theta, IsCycWt l wt theta ∧ DualTw (tw r delta) theta := by
  obtain ⟨theta, hcyc, hpolar⟩ := hdual
  exact ⟨theta, hcyc, dualTw_twist_of_sign_range r delta theta hdelta hpolar⟩

/-- Replay through the common recursive/backtracking stack. -/
theorem admRNAlt_dual_twist_replay
    (r : G ℚ Omega ->* GL (Fin n) (Qbar l))
    (delta : G ℚ Omega ->* (Qbar l)ˣ)
    (hdelta : forall s, delta s = 1 ∨ delta s = -1)
    (hdual : exists theta, IsCycWt l wt theta ∧ DualTw r theta) :
    exists theta, IsCycWt l wt theta ∧ DualTw (tw r delta) theta := by
  first
  | (rh_reduce 3 using [admRNAlt_dual_twist_of_sign_range r delta hdelta hdual]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact admRNAlt_dual_twist_of_sign_range r delta hdelta hdual

end RHMathCountQDualTwist

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHMathCountQDualTwist.dualTw_twist_of_sq_one limit 2000
rh_scan RHMathCountQDualTwist.admRNAlt_dual_twist_of_sign_range limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms RHMathCountQDualTwist.dualTw_twist_of_sq_one
#print axioms RHMathCountQDualTwist.dualTw_twist_of_sign_range
#print axioms RHMathCountQDualTwist.admRNAlt_dual_twist_of_sign_range
#print axioms RHMathCountQDualTwist.admRNAlt_dual_twist_replay
