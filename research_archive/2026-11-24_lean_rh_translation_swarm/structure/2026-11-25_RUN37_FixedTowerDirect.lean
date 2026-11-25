import RHCanonicalOddCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.ThmBabOfLemmaK
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.Near1
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN37 structure lane 13, 25 Nov 2026. SOURCE-MATCHED conditional human
derivation / PREPARED Lean overlay, NOT compiled. RH OPEN.
One result: connect the previous odd fixed-count and local PT frontier
to the actual native upstream suppliers, bypassing cross-layer growth
and unipotence entirely on this branch. No new theorem of Iwasawa
theory or Poitou--Tate duality claimed.

Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine
and latest visual-spine update), SWARM 4b77b161..., HANDOFF bbc46df7...,
AGENTS 8db0201..., state and log/protocol/continuity openings read.
Peers: 79428d5b (full-weight K bridge), 2235982d (Kato W conductor),
a7ba9251 (dyadic aggregate), 21574277 (inertia signs), 2a39654b (K2).
Prior RUN35 bb0948b0, RUN36 9f9a5e0e are prepared not compiled.
Upstream 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

SOURCE LEDGER, prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
LayeredIsomorphisms/ThmBabOfLemmaK.lean 20c347251400d31a39cf68f964d6648d87f3dda4
AdditiveValuationNorms/ABoundOfIsTower.lean 3d78ba73d9e3b0373d40aa43062bc48b12b07e09
AdditiveValuationNorms/ABoundOfDescends.lean 7b5f2da8824b3e1cd85b5c1b46fd02ed1ef00df3
AdditiveValuationNorms/ExistsCentresLevel.lean 42c340126cd2d651603c6abbb30607cb2c3991dd
AdditiveValuationNorms/ShaLeV.lean 6af293f1ba30d7aab77ac39a9fa5a3524b1cc434
AdditiveValuationNorms/GenLevel.lean 82f8780e86491ee9376dfb50a6be7592fe4c45f1
AdditiveValuationNorms/Descends.lean 6771b1273de94a05686413e0c8ccc8b2f06882b6
QuadraticExtensions/IsAlgClosureRat.lean 15c0d9875f5209459548e7fe5a9670803262ed84
PublishedTheorems/FerreroWashington.lean 0a4b2b825c289b67307b5ce8d876f62151b1bb85
LayeredIsomorphisms/Near1.lean 3ba2c097a7496c4f32255699e57917c9763bd162
LayeredIsomorphisms/Layerex.lean a4b445f22e78ae3e056d13bbe3166dbd9939ebb3
GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975

EDITOR BLOCK. In the actual thmBab_of_lemmaK consumer, the native
Two.towerFixed hFW chooses R uniformly for the fixed abelian type A;
ht.gen supplies GenBy l R (XP l L0), ht.mu supplies HasMuQ.
Choose gamma, c and its level using genLevel; descends identifies
shaInv L2 l e exactly with twLen gamma u e j0 on the fixed layer
j0=log_l R+3. The native exists_centres_level (NOT exists_centres)
already gives s_i in Z_l, i=1,...,R, independent of e,Z, such that

 shaInv(L2,l,e) <= R*(j0+c) + sum_i v_l(s_i-e).

This is ENat, with infinite valuation at zero retained. No Unip
hypothesis and no growth across layers is used in exists_centres_level;
its proof is lift + determinant bound at j0. For Z>=1 put
B=floor(log_l Z). Exclude the union of residue classes
e=s_i mod l^(B+1) inside [1,Z]. Each class contributes at most one
integer since l^(B+1)>Z, so at most R exceptional twists. Outside this
union every valuation <=B and the previous canonical count follows.
Z=0 is the empty interval. Strict inequality in near1 is necessary.
Thus the canonical count is not an additional unsupported premise if
the native towerFixed, genLevel, descends and exists_centres_level
proofs and their original FerreroWashington input are authenticated.

For the exceptional transfer there is ALREADY a native exact supplier:
shaLeV hP hF hT L2 Omega l (Or.inl hl2) D e.
Its proof uses finite_level + ptShaAt, then submodule length
monotonicity. With shaLen_eq_shaInv it gives shaInv<=VLen on the SAME
field. Do not add a global PTSha premise to the original proof.
Keep hP (PoitouTateDuality), hF (LocalFinitenessK), hT
(LocalTateDualityK); the definition of FerreroWashington is also a
Prop, not a proof of the stated class-group rank bound. No premise
closed from source inspection. The dyadic Two.twoIn route still
uses full ABound; its growth and unipotence requirements survive.

Original source-visible graph:
thmBab_of_lemmaK -> thmBab_of -> FixedIn -> towerFixed + aBound_of_isTower
-> genLevel + descends + aBound_of_descends -> exists_centres_norm
-> exists_centres -> xUnip + twLen_le_growth + exists_centres_level;
SecondBound -> twLen_le_growth + shaLeV. Original PartB and PartA
consumers retained. Reduced candidate:
thmBab_of_fixed13 -> OddFixedIn13 -> towerFixed -> genLevel + descends
+ exists_centres_level + near1 + canonicalBad13_card_of_exception
+ shaLeV + shaLen_eq_shaInv. Retain LemmaK and TwoIn; all pending
native role/axiom edges and original graphs remain visible. Importing
a module is not evidence that its every theorem remains a proof edge;
no global deletion claimed. Cache key pin/toolchain, l,A,L0,R,actual
tower and gamma,u,c,L2,algebra instances,Z,e,D,hFW,hP,hF,hT.
No context merging across hosts; no URT search used because direct
specialization determines the route. No measured speedup.

ACTUAL CHECKS (connector JS): 39 exact SHA/literal-anchor checks across
the 12 source files above succeeded. Integer residue controls:
 for l in [3,5,7,11], Z=1..100:
   p=1; while p*l<=Z: p*=l
   for s=0..p*l-1:
     assert count(1<=e<=Z with e=s mod p*l)<=1
     record collisions for weaker modulus p.
Output: 50736 strict controls, 33936 non-strict collision controls.
These verify the elementary guard, not class groups or cohomology.
Earlier guessed FirstBound.lean, Point.lean and ThmBab.lean paths
returned 404; actual files SecondBound, ImportsAlt, ThmBabOf located.
Local command -v lean/lake gave no paths.
Actual baseline status JSON b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved with returncode 0,
runs 45577239749 and 45576756833; baseline only. New overlay not
compiled or queued. No new axiom evidence or root closure.

RESUME HERE: batch RUN35/RUN36 and this overlay in the pinned warmed
runner; use filenames RHOddFixedLayerBudget.lean, RHCanonicalOddCount.lean
and RHFixedTowerDirect.lean. Check the actual thmBab consumer and
#print axioms/role scans, no errors or sorryAx. Independently audit
the actual published FerreroWashington and PT suppliers and
detBound/step0; do not count this as closing those premises. Other
CountI/II/V/Vs, dyadic and geometry frontiers remain. HANDOFF TO kernel,
audit, Galois, literature, integration and editor.
-/

noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
  Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V UpperTheory.V.Base
  UpperTheory.V.Kum UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win

namespace UpperTheory.V.Win

theorem fixedCount_of_tower37 (l R : ℕ) [Fact l.Prime]
    (L₀ : Type) [Field L₀] [NumberField L₀] (ht : Tower.IsTower l L₀ R) :
    OddFixedCount13 l R L₀ := by
  classical
  obtain ⟨γ, hg, hu, _⟩ := PropA.genLevel l L₀ ht.mu
  have hd := PropA.descends l L₀ ht.mu γ hg
  have hX : PropA.GenBy l R (Tower.XP l L₀) := ht.gen
  obtain ⟨s, hs⟩ := PropA.exists_centres_level
    (xRep l l (⊤ : Subgroup (G L₀ (AlgebraicClosure L₀))) γ)
    hX hu (Win.jZero l R)
  obtain ⟨L₂, _, _, _, hL₂⟩ := layerex l (Win.jZero l R) Fact.out L₀ ht.mu
  have hmu₂ : HasMuQ l L₂ := by
    obtain ⟨ζ, hζ⟩ := ht.mu
    exact ⟨algebraMap L₀ L₂ ζ, hζ.map_of_injective (algebraMap L₀ L₂).injective⟩
  refine ⟨L₂, inferInstance, inferInstance, inferInstance, hL₂, hmu₂,
    cZero l L₀, ?_⟩
  intro Z
  let near : Fin R → Finset ℕ := fun i =>
    (Finset.Icc 1 Z).filter fun e =>
      ‖(s i : ℚ_[l]) - (e : ℚ_[l])‖ < (l : ℝ) ^ (-(Nat.log l Z : ℤ))
  let Exc : Finset ℕ := Finset.univ.biUnion near
  have hone : ∀ i : Fin R, (near i).card ≤ 1 := by
    intro i
    rw [Finset.card_le_one]
    intro a ha b hb
    change a ∈ (Finset.Icc 1 Z).filter _ at ha
    change b ∈ (Finset.Icc 1 Z).filter _ at hb
    simp only [Finset.mem_filter, Finset.mem_Icc] at ha hb
    exact near1 l ℚ_[l] (s i : ℚ_[l]) Z a b
      ha.1.1 ha.1.2 hb.1.1 hb.1.2 ha.2 hb.2
  have hcard : Exc.card ≤ R := by
    calc Exc.card ≤ ∑ i : Fin R, (near i).card := Finset.card_biUnion_le
      _ ≤ ∑ _i : Fin R, 1 := Finset.sum_le_sum fun i _ => hone i
      _ = R := by simp
  apply canonicalBad13_card_of_exception l R (cZero l L₀) L₂ Z Exc hcard
  intro e he heZ hn
  have hfar : ∀ i : Fin R, (l : ℝ) ^ (-(Nat.log l Z : ℤ)) ≤
      ‖s i - (e : ℤ_[l])‖ := by
    intro i
    have hr : (l : ℝ) ^ (-(Nat.log l Z : ℤ)) ≤
        ‖(s i : ℚ_[l]) - (e : ℚ_[l])‖ := by
      by_contra hlt
      push_neg at hlt
      apply hn
      change e ∈ Finset.univ.biUnion near
      exact Finset.mem_biUnion.mpr ⟨i, Finset.mem_univ _,
        Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨he, heZ⟩, hlt⟩⟩
    refine hr.trans (le_of_eq ?_)
    rw [PadicInt.norm_def]
    push_cast
    rfl
  rw [hd.eq_twLen he hL₂]
  calc _ ≤ ∑ i, (((Win.jZero l R + cZero l L₀ : ℕ) : ℕ∞) +
      PropA.vl l (s i - e)) := hs e
    _ ≤ ∑ _i : Fin R, (((Win.jZero l R + cZero l L₀ + Nat.log l Z : ℕ) : ℕ∞)) := by
      refine Finset.sum_le_sum fun i _ => ?_
      rw [Nat.cast_add _ (Nat.log l Z)]
      gcongr
      exact PropA.vl_le_of_norm (hfar i)
    _ = _ := by
      simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin,
        nsmul_eq_mul, Nat.cast_mul]

theorem oddCount_of_FW37 (hFW : Published.FerreroWashington) : OddCountIn13 := by
  intro l _ hl2 A hA L₀ _ _ hL
  obtain ⟨R, hR⟩ := Two.towerFixed hFW l hl2 A hA
  exact ⟨R, fixedCount_of_tower37 l R L₀ (hR L₀ hL).2⟩

theorem fixed_of_count_nativePT37
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    (h : OddCountIn13) : OddFixedIn13 := by
  intro l _ hl2 A hA L₀ _ _ hL
  obtain ⟨R, L₂, _, _, _, hL₂, hmu, c, hc⟩ := h l hl2 A hA L₀ hL
  obtain ⟨D⟩ := ldata_nonempty (F := L₂) (Ω := AlgebraicClosure L₂) l
  refine ⟨R, L₂, inferInstance, inferInstance, inferInstance,
    hL₂, hmu, D, c, ?_⟩
  intro Z
  refine ⟨canonicalBad13 l R c L₂ Z, hc Z, ?_, ?_⟩
  · intro e he heZ hn
    exact canonicalBad13_far l R c L₂ Z e he heZ hn
  · intro e _ _ _
    rw [← shaLen_eq_shaInv D]
    exact PropA.shaLeV hP hF hT L₂ (AlgebraicClosure L₂) l (Or.inl hl2) D e

theorem thmBab_of_lemmaK_fixed37
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    (hFW : Published.FerreroWashington) (hK : ∃ CK : ℝ, LemmaK CK) :
    ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct := by
  have hA : Two.TowerBound := fun l _ L _ _ R h =>
    PropA.aBound_of_isTower hP hF hT l L R h
  exact thmBab_of_fixed13 hK
    (fixed_of_count_nativePT37 hP hF hT (oddCount_of_FW37 hFW))
    (Two.twoIn hFW hA)

end UpperTheory.V.Win

open UpperTheory.V.Win
example (hFW : Published.FerreroWashington) : OddCountIn13 := by
  first | rh_reduce 3 using [oddCount_of_FW37] | exact oddCount_of_FW37 hFW
example (hFW : Published.FerreroWashington) : OddCountIn13 := by
  first | rh_auto 3 | exact oddCount_of_FW37 hFW
example (hFW : Published.FerreroWashington) : OddCountIn13 := by
  rh_auto_frontier 2
  all_goals exact oddCount_of_FW37 hFW

#print axioms UpperTheory.V.Win.fixedCount_of_tower37
#print axioms UpperTheory.V.Win.fixed_of_count_nativePT37
#print axioms UpperTheory.V.Win.thmBab_of_lemmaK_fixed37
rh_scan UpperTheory.V.Win.thmBab_of_lemmaK limit 2000
rh_scan UpperTheory.V.Win.thmBab_of_lemmaK_fixed37 limit 2000
rh_prune UpperTheory.V.Win.thmBab_of_lemmaK_fixed37 as RHThmBabFixed37Pruned
