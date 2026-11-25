import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/- RUN40: SOURCE MATCHED; PREPARED / NOT COMPILED.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; prior lane 33888226; integration a5f9e057.
Actual original graph, with source blob and unique call anchor:
soFin | LevelCohomology/ExistsAb.lean | a616bcdfbf6405706c6feba205be8a823a7d1c80 | (hK l L Ω D htc hmu e he).1
soVec | LevelCohomology/IntIffNorm.lean | 6645d8e9edcc159cf08c92fb0e5970f3bdcc25e7 | soFin CK hK hPT hLF hLT
soBar | LevelCohomology/FdAdjoinRange.lean | 18b0c460e4f92a7fa7f973d5ddf05ba27fade635 | UpperTheory.V.X.soVec CK hK hPT hLF hLT
soCoc | LevelCohomology/CobDown.lean | b879489f7a7b2dbbb325d8e219cbec88dfdcadbc | UpperTheory.V.X.soBar CK hK hPT hLF hLT
soCocL | LevelCohomology/SoCocL.lean | dcf4e5309372b443b989f37055d34a1071aa9140 | So.soCoc CK hK pt fK tK
lineNeg | LevelCohomology/SoLineNeg.lean | bc274f45064e9d602be9f6b0079fc8f03ec8b1dd | So.soCocL CK hK pt fK tK
hostVanE | LevelCohomology/SoHostVanE.lean | 4d97dce5963b96608015bfdc5de00f94eae9c5bd | So.lineNeg CK hK hPT hLFK hLTDK
count_v_of_printed_bound_k_reduced_unitary_lift | ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean | 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e | X.So.hostVanE CK hL (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.lfK hN.coh.ltK
CountV -> hostVanE -> lineNeg -> soCocL -> soCoc -> soBar -> soVec -> soFin -> (H2 finite, shaLeV).
Proposed graph: same consumer chain -> soFin40 -> RHShaFinite40 -> qualitative Sha finiteness; derive from ShaK via shaLen_eq_shaInv. Only first projection of LemmaK consumed; no numeric kBound or uniform exponent needed. The same field L, D, prime, weight, character, upV, local H0, eO, local and global hypotheses remain. No global removal of PT or LemmaK. CountI and II/III still require original suppliers. Original graphs and axiom evidence preserved in earlier commits; no new axiom evidence yet. Baseline CI 45577239749 and 45576756833 verified, not verification of this candidate.
Static checks: 21 source anchors and exact transformations. Cache key must include pin, toolchain, instantiated field, closure, D, prime, weight, character and local context. Backtrack to original if elaboration fails.
RESUME HERE: compile core below, inspect prune/scan/axioms; propagate RHShaFinite40 through seven caller signatures above, replacing only the marked calls and removing now-unused arguments. In window_sha41 replace CountV's hK by hSha after native verification; leave hK at CountI and joint II/III. Seek an independent qualitative finiteness supplier.
HANDOFF TO integration, kernel, audit, literature, Galois.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.V.Odd UpperTheory.V.ML UpperTheory.V.X
open private exists_ab from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.ExistsAb

def RHShaFinite40 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
    IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
    shaLen D (e : ℤ) ≠ ⊤

theorem rhShaFinite_of_sha40 (h : ∃ C : ℝ, UpperTheory.V.ZK.ShaK C) :
    RHShaFinite40 := by
  obtain ⟨C, hC⟩ := h
  intro l _ L Ω _ _ _ _ _ D ht hm e he
  obtain ⟨s, hs, _⟩ := hC l L ht hm e he
  rw [UpperTheory.V.LDataCardLeFinrank.shaLen_eq_shaInv, hs]
  exact ENat.coe_ne_top _

theorem UpperTheory.V.X.soFin40 :
    RHShaFinite40 → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Algebra ℤ_[l] O] [Module.Finite ℤ_[l] O] (ψ : G k Ω →* Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → Chr.V l e ψ ≠ ⊤ := by
  intro hSF k Ω _ _ _ _ _ l _ O _ _ _ _ _ ψ hψ e he
  classical
  set N : ℕ := if l = 2 then 4 else l with hN
  have hN2 : 2 < N := by
    have := (Fact.out : l.Prime).two_le
    rw [hN]
    split_ifs with h <;> omega
  haveI : NeZero N := ⟨by omega⟩
  haveI : Fact (1 < N) := ⟨by omega⟩
  obtain ⟨L, hfin, hab, hgal, hmem⟩ := exists_ab k Ω (ψ.prod (Chr.cls k Ω N)) (by
    rw [MonoidHom.ker_prod, Subgroup.coe_inf]
    exact hψ.inter (Chr.clsFacts k Ω N).1)
  haveI := hfin
  haveI := hab
  haveI : NumberField L := NumberField.of_module_finite k L
  haveI : Algebra.IsAlgebraic L Ω := Algebra.IsAlgebraic.tower_top (K := k) L
  haveI : IsAlgClosed Ω := IsAlgClosure.isAlgClosed k
  haveI : IsAlgClosure L Ω := ⟨IsAlgClosure.isAlgClosed k, inferInstance⟩
  haveI : CharZero Ω := (RingHom.charZero_iff (algebraMap k Ω).injective).1 inferInstance
  obtain ⟨ζ, hζ⟩ := HasEnoughRootsOfUnity.exists_primitiveRoot Ω N
  have hζL : ζ ∈ L := by
    apply hmem
    intro g hg
    have h1 : Chr.cls k Ω N g = 1 := (MonoidHom.mem_ker).1 (Subgroup.mem_inf.1 (by rwa [MonoidHom.ker_prod] at hg)).2
    rw [Chr.cls_spec N g ζ hζ.pow_eq_one, h1, Units.val_one, ZMod.val_one, pow_one]
  have hζ' : IsPrimitiveRoot (⟨ζ, hζL⟩ : L) N :=
    IsPrimitiveRoot.of_map_of_injective (f := algebraMap L Ω) hζ (algebraMap L Ω).injective
  haveI htc : IsTotallyComplex L := NumberField.nrRealPlaces_eq_zero_iff.1
    (NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt hN2 hζ')
  have hmu : HasMuQ l L := ⟨⟨ζ, hζL⟩, hζ'⟩
  obtain ⟨D⟩ := Formalism.GaloisCohomology.ldata_nonempty (F := L) (Ω := Ω) l
  have hsha : shaLen D (e : ℤ) ≠ ⊤ := hSF l L Ω D htc hmu e he
  have hle : galOf k L Ω ≤ ψ.ker := by
    rw [hgal, MonoidHom.ker_prod]
    exact inf_le_left
  have hup := Chr.upV k Ω L l O D e ψ hle Finset.univ (by rw [Finset.coe_univ, Subgroup.closure_univ])
  have heO : eO l O ≠ ⊤ := (Chr.rootVal l O 1 one_ne_zero).2.2.1
  have hopen : IsOpen (Subgroup.map (cycZ k Ω l) ψ.ker : Set ℤ_[l]ˣ) := by
    have h0 : IsOpen ((cycZ L Ω l).range : Set ℤ_[l]ˣ) := by
      rw [(UpperTheory.V.LDataCardLeFinrank.ranges L Ω l D).1]
      exact KStar.TotallyRealRoots.isOpen_galImage
    refine Subgroup.isOpen_mono ?_ h0
    rintro _ ⟨σ, rfl⟩
    refine ⟨galEmb k L Ω σ, hle ?_, ?_⟩
    · rw [← UpperTheory.V.Base.range_galEmb]
      exact ⟨σ, rfl⟩
    · rfl
  have hh0 : Chr.h0 l e ψ ⊤ ≠ ⊤ := by
    refine ne_top_of_le_ne_top ?_ (le_trans ((Chr.h0Nu k Ω l O e ψ ⊤).1 ψ.ker le_top)
      ((Chr.h0Nu k Ω l O e ψ ψ.ker).2 le_rfl))
    exact WithTop.mul_ne_top (KStar.TotallyRealRoots.nu_ne_top hopen (by omega)) heO
  refine ne_top_of_le_ne_top ?_ hup
  exact WithTop.add_ne_top.2 ⟨WithTop.mul_ne_top hsha heO, WithTop.mul_ne_top (ENat.coe_ne_top _) hh0⟩

theorem rhShaFinite_replay40 (h : ∃ C : ℝ, UpperTheory.V.ZK.ShaK C) : RHShaFinite40 := by
  first
  | (rh_reduce 2 using [rhShaFinite_of_sha40 h]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rhShaFinite_of_sha40 h

rh_prune rhShaFinite_replay40
rh_scan UpperTheory.V.X.soFin
rh_scan UpperTheory.V.X.soFin40
#print axioms rhShaFinite_of_sha40
#print axioms UpperTheory.V.X.soFin40
