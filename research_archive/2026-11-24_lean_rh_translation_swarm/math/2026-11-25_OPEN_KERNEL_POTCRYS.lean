import Development.AutomorphicArithmetic.AutomorphicVarieties.PadicHodgeTheory.RankOneCharacterIsdRAndJumpsZero
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.IsCrysLatOfTrivial
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.RepERankOne
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared root-reachable certificate for the remaining `countQ_alt` local
Hodge leaf.

Upstream pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH.  It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open Formalism Formalism.BasicNotions Formalism.BasicNotions.Loc
open Formalism.MainNotions Formalism.MainNotions.N
open GlobalTheory.Pst GlobalTheory.TripleGal

namespace RHMathOpenKernelPotCrys

variable {l : Nat} [Fact l.Prime]
variable {E Omega : Type} [Field E] [Field Omega] [Algebra E Omega]
variable {Gw : Subgroup (Omega ≃ₐ[E] Omega)}
variable {O : Type} [CommRing O] [Algebra ℤ_[l] O] [TopologicalSpace O]

/-- An open-kernel representation becomes trivial after a finite local
extension and is therefore potentially crystalline.  The coefficient model
is constructed first, so no scalar-to-field identification is assumed. -/
theorem isPotCrysAt_of_isOpen_ker
    (P : LocPrime l) (Bw : LocBridge l E Omega Gw O) {a : Nat}
    (r : Gw →* GL (Fin a) (Om l))
    (hr : Continuous fun g => ((r g : GL (Fin a) (Om l)) : Matrix (Fin a) (Fin a) (Om l)))
    (hker : IsOpen (r.ker : Set Gw)) :
    IsPotCrysAt P Bw r := by
  haveI : CompactSpace Gw := Bw.e.symm.surjective.compactSpace Bw.e_symm_cont
  obtain ⟨LL, hLL, hent⟩ :=
    GlobalTheory.CompactRepField.exists_finExt_entries_mem l Gw a r hr Bw.LL
  obtain ⟨rL, hrL⟩ :=
    GlobalTheory.CompactRepField.exists_hom_of_entries_mem r LL.1 hent
  have hmodel : IsModel Bw r LL rL := ⟨hLL, by
    ext g i j
    exact hrL g i j⟩

  have hopen : IsOpen {g : GK Bw.Kw | Bw.e.symm g ∈ r.ker} :=
    hker.preimage Bw.e_symm_cont
  obtain ⟨U, hU, hUeq⟩ := isOpen_induced_iff.1 hopen
  have hUone : (1 : GQ l) ∈ U := by
    have h1 : (1 : GK Bw.Kw) ∈ Subtype.val ⁻¹' U := by
      rw [hUeq]
      simp
    exact h1
  obtain ⟨K0, hK0, hK0U⟩ :=
    (krullTopology_mem_nhds_one_iff ℚ_[l] (Om l) U).1 (hU.mem_nhds hUone)
  let K : FinExt l := supExt Bw.Kw ⟨K0, hK0⟩
  have hKwK : Bw.Kw.1 ≤ K.1 := le_sup_left

  refine ⟨LL, rL, hmodel, K, hKwK, ?_⟩
  refine GlobalTheory.TrivCrys.isCrys_of_trivial _ _ fun g x => ?_
  set g0 : GK Bw.Kw := Subgroup.inclusion (GK_le hKwK) g with hg0
  have hgU : g0 ∈ Subtype.val ⁻¹' U :=
    hK0U (GK_le (K := ⟨K0, hK0⟩) (K' := K) le_sup_right g.2)
  rw [hUeq] at hgU
  have hrg : r (Bw.e.symm g0) = 1 := MonoidHom.mem_ker.1 hgU
  have hrLone : rL (Bw.e.symm g0) = 1 := by
    apply Units.ext
    ext i j
    apply (algebraMap LL.1 (Om l)).injective
    have he := congrArg
      (fun f : Gw →* GL (Fin a) (Om l) =>
        ((f (Bw.e.symm g0) : GL (Fin a) (Om l)) : Matrix (Fin a) (Fin a) (Om l)) i j)
      hmodel.2
    rw [hrg] at he
    simpa [mapRep] using he
  change Matrix.toLin'
    ((rL (Bw.e.symm g0) : GL (Fin a) LL.1) : Matrix (Fin a) (Fin a) LL.1) x = x
  rw [hrLone]
  simp

/-- The finite sign characters produced in `countQ_alt` have open kernel, so
their rank-one representations satisfy the only Hodge premise left by the
previous reduction. -/
theorem rankOne_isPotCrysAt_of_finite_sign
    (P : LocPrime l) (Bw : LocBridge l E Omega Gw O)
    (mu : Gw →* (Om l)ˣ) (hmu : Continuous mu)
    (hsign : ∀ g, mu g = 1 ∨ mu g = -1) :
    IsPotCrysAt P Bw (rk1 mu) := by
  have hm1 : (-1 : (Om l)ˣ) ≠ 1 := by
    intro h
    have hv := congrArg Units.val h
    simp only [Units.val_neg, Units.val_one] at hv
    exact one_ne_zero (by linear_combination hv)
  have hset : mu ⁻¹' ({-1}ᶜ : Set ((Om l)ˣ)) = (mu.ker : Set Gw) := by
    ext g
    change mu g ≠ -1 ↔ mu g = 1
    constructor
    · intro hn
      exact (hsign g).resolve_right hn
    · intro h1 hneg
      exact hm1 (hneg.symm.trans h1)
  have hker : IsOpen (mu.ker : Set Gw) := by
    rw [← hset]
    exact isClosed_singleton.isOpen_compl.preimage hmu
  have hr : Continuous fun g =>
      (((rk1 mu) g : GL (Fin 1) (Om l)) : Matrix (Fin 1) (Fin 1) (Om l)) := by
    refine continuous_matrix fun i j => ?_
    fin_cases i
    fin_cases j
    simpa [rk1] using Units.continuous_val.comp hmu
  exact isPotCrysAt_of_isOpen_ker P Bw (rk1 mu) hr (by
    refine Subgroup.isOpen_mono ?_ hker
    intro g hg
    simpa [rk1] using hg)

/-- Mandatory bounded replay on the actual reduced local leaf. -/
theorem finiteSign_potCrys_replay
    (P : LocPrime l) (Bw : LocBridge l E Omega Gw O)
    (mu : Gw →* (Om l)ˣ) (hmu : Continuous mu)
    (hsign : ∀ g, mu g = 1 ∨ mu g = -1) :
    IsPotCrysAt P Bw (rk1 mu) := by
  first
  | (rh_reduce 4 using
      [rankOne_isPotCrysAt_of_finite_sign P Bw mu hmu hsign]; done)
  | (rh_auto_frontier 4; done)
  | (rh_auto 4; done)
  | exact rankOne_isPotCrysAt_of_finite_sign P Bw mu hmu hsign

end RHMathOpenKernelPotCrys

rh_scan RHMathOpenKernelPotCrys.isPotCrysAt_of_isOpen_ker limit 2000
rh_scan RHMathOpenKernelPotCrys.rankOne_isPotCrysAt_of_finite_sign limit 2000
rh_scan RHMathOpenKernelPotCrys.finiteSign_potCrys_replay limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
#print axioms RHMathOpenKernelPotCrys.isPotCrysAt_of_isOpen_ker
#print axioms RHMathOpenKernelPotCrys.rankOne_isPotCrysAt_of_finite_sign
#print axioms RHMathOpenKernelPotCrys.finiteSign_potCrys_replay

