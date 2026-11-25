import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.ThmBabOfLemmaK
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN38 lane 6, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 and mandatory
engine, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
AGENTS 8db0201d, state/log/protocol/continuity openings consulted.
Peer delta from c55df0a0 to b2536f01: 14 commits; inspected prime RUN40,
structure RUN38, acceleration RUN38, Galois RUN38, math CountQ.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest upstream main lookup: 07be9a52ebbee066d706195cad0f6863880f9284, not substituted.

RESULT: cancel an entire round trip through H2 at the ACTUAL thmBab consumer.
Native ZK.lemmaK_of_steps first obtains exists C, ShaK C from SNum and
only then uses SFinal to pass from shaInv to H2 via local H0/PT.
Native aBound_of_descends already gives the stronger SAME-anchor inequality
    shaInv(L1,l,e) <= shaInv(L2,l,e) + R*(m-jZero(l,R))_+.
This is the growth theorem plus two exact Descends.eq_twLen identities.
The original proof subsequently weakens shaInv(L2) to VLen using shaLeV,
then point -> klen -> LemmaK estimates the larger H2 length.
Do not take that detour: directly use ShaK at L2, with
    shaInv(L2,l,e) * log(l) <= kBound(C,e,n,D).
As log(l)>=1/2, the original numeric upper bound 2*kBound is recovered,
including finiteness (no ENat subtraction). All far-centre, Good,
discriminant, tower, field, window and admission hypotheses unchanged.
Both dyadic PartA and odd PartB use the SAME stronger anchor bound.
Normalize C to max(C,1) by monotonicity of kBound (base >= 2, log D>=0).
The entire original ThmBab conclusion follows directly from
    (exists C, ShaK C) and FerreroWashington.
No additional PT/LF/LT or H2 cardinality/length/explicit local H0 bound is
required by this replacement at this consumer. This DOES NOT remove PT
from unrelated uses, the SNum/BOdd/SSha suppliers, or LemmaK from Count I,
II/III, V. The root VWin wrapper explicitly also passes hK to those
branches; keep their original proof until independently reduced.
No assertion of RH closure or new proof of ShaK.

Original local graph: thmBab_of_lemmaK -> thmBab_of -> partA/partB ->
point2 -> point -> klen -> LemmaK -> ZK.sFinal (ShaK/PT/LF/LT/local H0).
aBound_of_isTower -> aBound_of_descends -> growth + shaLeV.
Candidate: anchorThmBab_of_sha38 -> anchorThmBab38 -> anchorPartA38/
anchorPartB38 -> anchorPoint238 -> anchorPoint38 -> anchorKlen38 -> ShaK;
anchorABound_of_isTower38 -> anchorABound_of_descends38 -> growth +
Descends.eq_twLen; same fixedIn/twoIn tower rank suppliers. Preserve
original graph and all type/constructor/axiom evidence. Cache key
pin/toolchain,l,R,L0,L1,L2,e,m,actual gamma and tower, C, all Good/Exc
and same-host window witnesses. No substitution of separate hosts.
Backtrack to original if any replay fails. No URT used.
Source ledger, all relative to AutomorphicVarieties/:
LayeredIsomorphisms/SecondBound.lean a2e12927214cad3ce637b33adb435f42992c1c65
AdditiveValuationNorms/ABoundOfDescends.lean 7b5f2da8824b3e1cd85b5c1b46fd02ed1ef00df3
AdditiveValuationNorms/ABoundOfIsTower.lean 3d78ba73d9e3b0373d40aa43062bc48b12b07e09
QuadraticExtensions/IsAlgClosureRat.lean 15c0d9875f5209459548e7fe5a9670803262ed84
LayeredIsomorphisms/Exc.lean d0d49933faebf73a8162c153b8115139e36efa82
LayeredIsomorphisms/Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
LayeredIsomorphisms/ImportsAlt.lean ef9122254fb295f15e9f01d9512d70a26e6f6884
LayeredIsomorphisms/Point2.lean 977e6ed246ef1343d9bf537ea845a5565528c0ae
LayeredIsomorphisms/PartA.lean c41983a3d9483591b7d7eedfb3b672d72cde101a
LayeredIsomorphisms/PartB.lean cd8a7cae15738f4054f543cddf4af595a6d1f7dc
LayeredIsomorphisms/ThmBabOf.lean d4b0c37c79996fca0b0d30fb53fe798eceb90cff
LayeredIsomorphisms/Kmono.lean b4179c5de83455bbea00538fd802d92dd8eb7423
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
Executed connector JS: 80 fail-on-error source cuts/replacements
and scope checks before writing this file. This is static source checking,
not a Lean build or numeric evidence of actual cohomology.
Local lean/lake unavailable (PATH checked).
Baseline CI status JSONs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched, returncode 0,
runs 45577239749 and 45576756833. These do not verify this file.
Native engine/axiom requests below are prepared, not executed.
RESUME HERE: replay the exact overlay in the pinned native runner;
extract the existing SNum existential before SFinal in lemmaK_of_steps
and substitute anchorThmBab_of_sha38 at the actual HVCore caller.
Keep hK for sibling counts. Then inspect whether those callers use
only ShaK as well; never prune a global dependency from this local cut.
Independent audit requested. HANDOFF TO integration, Galois, kernel,
prime, structure, literature, formal audit, editor. RH OPEN.
-/

noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V UpperTheory.V.LDataCardLeFinrank
open UpperTheory.V.Win UpperTheory.V.Base UpperTheory.V.Kum UpperTheory.V.Tower UpperTheory.V.ZK
open scoped Pointwise

namespace UpperTheory.V.Win
def AnchorSecond38 (l R : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀] : Prop :=
  ∀ e : ℕ, 1 ≤ e → ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
    ∀ (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra L₀ L₂], IsLayer l (jZero l R) L₀ L₂ →
      shaInv L₁ l e ≤ shaInv L₂ l e + ((R * (m - jZero l R) : ℕ) : ℕ∞)

def AnchorABound38 (l R : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀] : Prop :=
  (∃ (K : Type) (_ : NormedField K) (_ : NormedAlgebra ℚ_[l] K) (_ : IsUltrametricDist K) (c R' : ℕ) (s : Fin R' → K),
    R' ≤ R ∧ (∃ ζ : L₀, IsPrimitiveRoot ζ (l ^ c)) ∧
    ∀ e : ℕ, 1 ≤ e → ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
      ∀ B : ℕ, (∀ i, (l : ℝ) ^ (-(B : ℤ)) ≤ ‖s i - (e : K)‖) →
        shaInv L₁ l e ≤ ((R' * (max m (jZero l R) + c + B) : ℕ) : ℕ∞)) ∧
  AnchorSecond38 l R L₀

def AnchorFixedIn38 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ A : AbF, A.HasMu l → ∀ (L₀ : Type) [Field L₀] [NumberField L₀], IsAbField A L₀ →
    ∃ R : ℕ, AnchorABound38 l R L₀

def AnchorTwoIn38 : Prop :=
  ∀ M : AbF, ∃ R : ℕ, ∀ q d : ℕ, PrimePair M.m q d →
    ∃ (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀), TwoBase M q d L₀ ∧ AnchorABound38 2 R L₀
end UpperTheory.V.Win

namespace UpperTheory.V.PropA
variable {l : ℕ} [Fact l.Prime] {L₀ : Type} [Field L₀] [NumberField L₀]
theorem anchorABound_of_descends38 {R c : ℕ}
    (ht : IsTower l L₀ R) {γ : G L₀ (AlgebraicClosure L₀)} (hu : IsLevel l (cycZ L₀ _ l γ : ℤ_[l]) c)
    (hc : ∃ ζ : L₀, IsPrimitiveRoot ζ (l ^ c)) (h : Descends l L₀ γ) : Win.AnchorABound38 l R L₀ := by
  have hX : GenBy l R (XP l L₀) := ht.gen
  have hγ := xUnip L₀ (AlgebraicClosure L₀) l l ⊤ isClosed_univ ht.gen.finite γ (mem_levU_one (lteNorm l _ c hu).2.1)
  refine ⟨?_, fun e he m L₁ _ _ _ h₁ L₂ _ _ _ h₂ => ?_⟩
  · obtain ⟨s, hs⟩ := exists_centres_norm hX hγ hu
    refine ⟨ℚ_[l], inferInstance, inferInstance, inferInstance, c, R, fun i => s i, le_rfl, hc,
      fun e he m L₁ _ _ _ h₁ B hB => ?_⟩
    rw [h.eq_twLen he h₁]
    refine hs e m B fun i => (hB i).trans (le_of_eq ?_)
    rw [PadicInt.norm_def]
    push_cast
    rfl
  · rw [h.eq_twLen he h₁]
    refine (twLen_le_growth hX hγ hu e m).trans (add_le_add ?_ le_rfl)
    rw [← h.eq_twLen he (m := jZero l R) h₂]
end UpperTheory.V.PropA

theorem UpperTheory.V.PropA.anchorABound_of_isTower38
    (l : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀] [NumberField L₀] (R : ℕ) (ht : UpperTheory.V.Tower.IsTower l L₀ R) :
    UpperTheory.V.Win.AnchorABound38 l R L₀ := by
  obtain ⟨γ, h₁, h₂, h₃⟩ := UpperTheory.V.PropA.genLevel l L₀ ht.mu
  exact UpperTheory.V.PropA.anchorABound_of_descends38 ht h₂ h₃ (UpperTheory.V.PropA.descends l L₀ ht.mu γ h₁)

namespace UpperTheory.V.Two
def AnchorTowerBound38 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L] (R : ℕ), Tower.IsTower l L R → Win.AnchorABound38 l R L

theorem anchorTwoIn38 (hFW : Published.FerreroWashington) (hA : AnchorTowerBound38) : Win.AnchorTwoIn38 := fun M => by
  obtain ⟨R, hR⟩ := towerTwo hFW M
  refine ⟨R, fun q d hp => ?_⟩
  obtain ⟨L, _, _, hL⟩ := abExists (base2 M q d)
  exact ⟨L, inferInstance, inferInstance, twoBase M q d hp L hL, hA 2 L R (hR q d hp L hL).2⟩

theorem anchorFixedIn38 (hFW : Published.FerreroWashington) (hA : AnchorTowerBound38) : Win.AnchorFixedIn38 := fun l _ h2 A hμ L _ _ hL => by
  obtain ⟨R, hR⟩ := towerFixed hFW l h2 A hμ
  exact ⟨R, hA l L R (hR L hL).2⟩
end UpperTheory.V.Two

theorem UpperTheory.V.Win.anchorExc38 :
    ∀ (l R : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀], AnchorABound38 l R L₀ →
      ∃ c : ℕ, (∃ ζ : L₀, IsPrimitiveRoot ζ (l ^ c)) ∧ ∀ Z : ℕ, ∃ Exc : Finset ℕ, FirstBound l R c L₀ Z Exc := by
  intro l R _ L₀ _ h
  classical
  obtain ⟨⟨K, _, _, hU, c, R', s, hR', hζ, hb⟩, -⟩ := h
  refine ⟨c, hζ, fun Z => ?_⟩
  obtain ⟨near, hnear⟩ : ∃ near : Fin R' → Finset ℕ, near = fun i =>
      (Finset.Icc 1 Z : Finset ℕ).filter
        (fun e : ℕ => ‖s i - (e : K)‖ < (l : ℝ) ^ (-(Nat.log l Z : ℤ))) :=
    ⟨_, rfl⟩
  refine ⟨Finset.univ.biUnion near, ?_⟩
  unfold FirstBound
  refine ⟨?_, ?_⟩
  · have hone : ∀ i : Fin R', (near i).card ≤ 1 := by
      intro i
      rw [Finset.card_le_one]
      intro a ha b hb'
      rw [hnear] at ha hb'
      simp only [Finset.mem_filter, Finset.mem_Icc] at ha hb'
      exact near1 l K (s i) Z a b ha.1.1 ha.1.2 hb'.1.1 hb'.1.2 ha.2 hb'.2
    calc (Finset.univ.biUnion near).card ≤ ∑ i : Fin R', (near i).card := Finset.card_biUnion_le
      _ ≤ ∑ _i : Fin R', 1 := Finset.sum_le_sum (fun i _ => hone i)
      _ = R' := by simp
      _ ≤ R := hR'
  · intro e he1 heZ hne m L₁ _ _ _ hL
    have hfar : ∀ i : Fin R', (l : ℝ) ^ (-(Nat.log l Z : ℤ)) ≤ ‖s i - (e : K)‖ := by
      intro i
      by_contra hlt
      push_neg at hlt
      apply hne
      rw [hnear]
      simp only [Finset.mem_biUnion, Finset.mem_univ, true_and, Finset.mem_filter, Finset.mem_Icc]
      exact ⟨i, ⟨he1, heZ⟩, hlt⟩
    have h1 := hb e he1 m L₁ hL (Nat.log l Z) hfar
    exact h1.trans (by gcongr)

private theorem anchorComplex38 (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L] (h : HasMuQ l L) :
    IsTotallyComplex L := by
  obtain ⟨ζ, hζ⟩ := h
  set n := if l = 2 then 4 else l with hn
  have hn2 : 2 < n := by
    have := (Fact.out : l.Prime).two_le
    rw [hn]; split_ifs with h2
    · norm_num
    · omega
  have : NeZero n := ⟨by omega⟩
  have : IsCyclotomicExtension {n} ℚ (IntermediateField.adjoin ℚ {ζ}) :=
    hζ.intermediateField_adjoin_isCyclotomicExtension ℚ
  have : IsTotallyComplex (IntermediateField.adjoin ℚ {ζ}) :=
    IsCyclotomicExtension.Rat.isTotallyComplex (IntermediateField.adjoin ℚ {ζ}) hn2
  exact isTotallyComplex_of_algebra (IntermediateField.adjoin ℚ {ζ}) L

theorem UpperTheory.V.Win.anchorKlen38 (CK : ℝ) (hK : UpperTheory.V.ZK.ShaK CK)
    (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L]
    (hmu : HasMuQ l L) (e : ℕ) (he : 1 ≤ e) :
    shaInv L l e ≠ ⊤ ∧ ((shaInv L l e).toNat : ℝ) ≤
      2 * kBound CK e (Module.finrank ℚ L) (discr L).natAbs := by
  obtain ⟨s, hs, hlog⟩ := hK l L (anchorComplex38 l L hmu) hmu e he
  rw [hs, ENat.toNat_coe]
  refine ⟨ENat.coe_ne_top _, ?_⟩
  have hl2 : (2 : ℝ) ≤ l := by exact_mod_cast (Fact.out : l.Prime).two_le
  have hlogl : (1 / 2 : ℝ) ≤ Real.log l := by
    have h1 : Real.log 2 ≤ Real.log l := Real.log_le_log (by norm_num) hl2
    have h2 := Real.log_two_gt_d9
    linarith
  have hs0 : (0 : ℝ) ≤ s := Nat.cast_nonneg s
  nlinarith [mul_le_mul_of_nonneg_left hlogl hs0]

theorem UpperTheory.V.Win.anchorPoint38 :
    ∀ CK : ℝ, 0 < CK → ShaK CK → ∀ (l R c : ℕ) [Fact l.Prime] (L₀ : Type) [Field L₀], HasMuQ l L₀ → AnchorSecond38 l R L₀ →
      ∀ (Z : ℕ) (Exc : Finset ℕ), FirstBound l R c L₀ Z Exc →
        ∀ (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra L₀ L₂], IsLayer l (jZero l R) L₀ L₂ →
          ∀ (eps Ct c0 x : ℝ) (n0 : ℕ), 0 < eps → 0 ≤ c0 → 1 ≤ x → Good (eps / (2 * CK)) Ct Exc x →
            Module.finrank ℚ L₂ ≤ n0 → Real.log (2 * ((discr L₂).natAbs : ℝ)) ≤ c0 * x ^ (eps / 4) →
            ∀ e : ℕ, 1 ≤ e → e ≤ Z → (e : ℝ) ≤ x ^ Ct →
              ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
                shaInv L₁ l e ≠ ⊤ ∧ ((shaInv L₁ l e).toNat : ℝ) ≤
                  (R : ℝ) * ((m : ℝ) + jZero l R + c + Nat.log l Z) +
                    2 * Real.exp ((2 * (n0 : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) := by
  intro CK hCK hK l R c _ L₀ _ hmu hSec Z Exc hF L₂ _ _ _ hL₂ eps Ct c0 x n0 heps hc0 hx hgood hn hdisc e he1 heZ hex m L₁ _ _ _ hL₁
  have hexp : 0 ≤ 2 * Real.exp ((2 * (n0 : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) := by positivity
  by_cases he : e ∈ Exc
  · have hg : (e : ℝ) ≤ x ^ (eps / (2 * CK)) := hgood e he hex
    have hmu2 : HasMuQ l L₂ := by
      obtain ⟨ζ, hζ⟩ := hmu
      exact ⟨algebraMap L₀ L₂ ζ, hζ.map_of_injective (algebraMap L₀ L₂).injective⟩
    obtain ⟨hvt, hvb⟩ := anchorKlen38 CK hK l L₂ hmu2 e he1
    have hkb := kexp CK eps c0 x e (Module.finrank ℚ L₂) n0 (discr L₂).natAbs hCK heps hc0 hx hg hn hdisc
    have hs := hSec e he1 m L₁ hL₁ L₂ hL₂
    generalize shaInv L₂ l e = v at hvt hvb hs
    generalize shaInv L₁ l ↑e = s at hs ⊢
    lift v to ℕ using hvt
    have hst : s ≠ ⊤ := by
      refine ne_top_of_le_ne_top ?_ hs
      rw [← Nat.cast_add]
      exact ENat.coe_ne_top _
    lift s to ℕ using hst
    have hs' : s ≤ v + R * (m - jZero l R) := by exact_mod_cast hs
    refine ⟨ENat.coe_ne_top s, ?_⟩
    rw [ENat.toNat_coe]
    simp only [ENat.toNat_coe] at hvb
    have hN : s ≤ v + R * (m + jZero l R + c + Nat.log l Z) := by
      refine le_trans hs' (Nat.add_le_add_left (Nat.mul_le_mul_left _ ?_) _)
      omega
    have hR : (s : ℝ) ≤ (v : ℝ) + (R : ℝ) * ((m : ℝ) + jZero l R + c + Nat.log l Z) := by
      exact_mod_cast hN
    linarith
  · have hb := hF.2 e he1 heZ he m L₁ hL₁
    generalize shaInv L₁ l ↑e = s at hb ⊢
    have hst : s ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) hb
    lift s to ℕ using hst
    have hs' : s ≤ R * (max m (jZero l R) + c + Nat.log l Z) := by exact_mod_cast hb
    refine ⟨ENat.coe_ne_top s, ?_⟩
    rw [ENat.toNat_coe]
    have hN : s ≤ R * (m + jZero l R + c + Nat.log l Z) := by
      refine le_trans hs' (Nat.mul_le_mul_left _ ?_)
      omega
    have hR : (s : ℝ) ≤ (R : ℝ) * ((m : ℝ) + jZero l R + c + Nat.log l Z) := by
      exact_mod_cast hN
    linarith

theorem UpperTheory.V.Win.anchorPoint238 :
    ∀ CK : ℝ, 0 < CK → ShaK CK → ∀ (l R c1 n0 : ℕ) [Fact l.Prime] (c0 J Ct eps a : ℝ), 0 ≤ c0 → 0 < J → 0 ≤ Ct → 0 < eps →
      0 ≤ a → ∃ C : ℝ, 0 ≤ C ∧ ∀ (L₀ : Type) [Field L₀], HasMuQ l L₀ → AnchorSecond38 l R L₀ →
        ∀ (c : ℕ) (X : ℝ) (Exc : Finset ℕ), c ≤ c1 → FirstBound l R c L₀ ⌊X ^ Ct⌋₊ Exc →
        ∀ (L₂ : Type) [Field L₂] [NumberField L₂] [Algebra L₀ L₂], IsLayer l (jZero l R) L₀ L₂ → Module.finrank ℚ L₂ ≤ n0 →
          ∀ x : ℝ, 1 ≤ x → X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
            Real.log (2 * ((discr L₂).natAbs : ℝ)) ≤ c0 * x ^ (eps / 4) →
            ∀ e : ℕ, 1 ≤ e → (e : ℝ) ≤ x ^ Ct →
              ∀ (m : ℕ) (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀ L₁], IsLayer l m L₀ L₁ →
                (m : ℝ) ≤ a * (1 + Real.log x) →
                  shaInv L₁ l e ≠ ⊤ ∧ ((shaInv L₁ l e).toNat : ℝ) + 1 ≤ ptBound C eps x := by
  intro CK hCK hK l R c1 n0 hl c0 J Ct eps a hc0 hJ hCt heps ha
  have hA : 0 ≤ (R : ℝ) * (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) + 1 := by positivity
  have hB : 0 ≤ (2 * (n0 : ℝ)) ^ CK * c0 := by positivity
  refine ⟨((R : ℝ) * (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) + 1) + (2 * (n0 : ℝ)) ^ CK * c0, by positivity, ?_⟩
  intro L₀ _ hmu hS c X Exc hc hF L₂ _ _ _ hL₂ hn x hx hXx hxX hG hD e he hex m L₁ _ _ _ hL₁ hm
  have hX : 1 ≤ X := hx.trans hxX
  have heZ : e ≤ ⌊X ^ Ct⌋₊ :=
    Nat.le_floor (hex.trans (Real.rpow_le_rpow (by linarith) hxX hCt))
  obtain ⟨h1, h2⟩ := UpperTheory.V.Win.anchorPoint38 CK hCK hK l R c L₀ hmu hS _ Exc hF L₂ hL₂ eps Ct c0 x n0 heps hc0 hx hG hn hD
    e he heZ hex m L₁ hL₁
  refine ⟨h1, ?_⟩
  have hlog := UpperTheory.V.Win.logs.1 l J Ct X x hl.out.two_le hJ hCt hX hXx
  have hL : 0 ≤ Real.log x := Real.log_nonneg hx
  have hcr : (c : ℝ) ≤ c1 := by exact_mod_cast hc
  have hp : 0 ≤ x ^ (3 * eps / 4) := by positivity
  have hj : (0 : ℝ) ≤ jZero l R := Nat.cast_nonneg _
  have hc1 : (0 : ℝ) ≤ c1 := Nat.cast_nonneg _
  have hR : (0 : ℝ) ≤ R := Nat.cast_nonneg _
  have hCJ : 0 ≤ 2 * Ct * J := by positivity
  have hin : (m : ℝ) + jZero l R + c + Nat.log l ⌊X ^ Ct⌋₊ ≤
      (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) * (1 + Real.log x) := by
    nlinarith [mul_nonneg hj hL, mul_nonneg hc1 hL]
  have hR' := mul_le_mul_of_nonneg_left hin hR
  have hexp : Real.exp ((2 * (n0 : ℝ)) ^ CK * c0 * x ^ (3 * eps / 4)) ≤
      Real.exp ((((R : ℝ) * (a + (jZero l R : ℝ) + c1 + 2 * Ct * J) + 1) + (2 * (n0 : ℝ)) ^ CK * c0) *
        x ^ (3 * eps / 4)) := by
    apply Real.exp_le_exp.mpr
    exact mul_le_mul_of_nonneg_right (by linarith) hp
  unfold ptBound
  have hBL : 0 ≤ (2 * (n0 : ℝ)) ^ CK * c0 * (1 + Real.log x) := by positivity
  nlinarith

private theorem anchorNeTop38 (a b : ℕ∞) (hb : b ≠ ⊤) (h : a ≤ 1 + b) :
    a ≠ ⊤ ∧ a.toNat ≤ 1 + b.toNat := by
  obtain ⟨n, rfl⟩ := ENat.ne_top_iff_exists.mp hb
  have h' : a ≤ ((1 + n : ℕ) : ℕ∞) := by push_cast; exact h
  have ha : a ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h'
  obtain ⟨m, rfl⟩ := ENat.ne_top_iff_exists.mp ha
  refine ⟨ha, ?_⟩
  simp only [ENat.toNat_coe]
  exact_mod_cast h'

theorem UpperTheory.V.Win.anchorPartA38 :
    ∀ CK : ℝ, 0 < CK → ShaK CK → ∀ (M : AbF) (R : ℕ) (J Ct eps A1 : ℝ), 0 < J → 0 ≤ Ct → 0 < eps →
      ∃ x0 : ℝ, ∀ e t : ℝ → ℕ, admitted A1 Ct e t → ∀ (X : ℝ) (q d : ℕ), PrimePair M.m q d →
        Real.log ((q : ℝ) * d) ≤ X ^ (eps / (4 * J)) →
        ∀ (L₀ : Type) [Field L₀] [NumberField L₀], TwoBase M q d L₀ → AnchorABound38 2 R L₀ →
          ∃ Exc : Finset ℕ, Exc.card ≤ R ∧ ∀ x ≥ x0, X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
            BaAt M eps e t q d x := by
  intro CK hCK hK M R J Ct eps A1 hJ hCt heps
  obtain ⟨n0, c0, hc0, hLD⟩ := layerdisc 2 (jZero 2 R) (8 * M.deg) (4 * M.m) Nat.prime_two
    (by have := M.pos; omega)
  obtain ⟨C, hC0, hC⟩ := anchorPoint238 CK hCK hK 2 R (16 * M.deg) n0 c0 J Ct eps (2 * |A1| + 2)
    hc0 hJ hCt heps (by positivity)
  obtain ⟨x0, hx02, hx0⟩ := final Ct eps C heps
  refine ⟨x0, fun e t hAdm X q d hPP hlogqd L₀ _ _ hTB hAB => ?_⟩
  obtain ⟨hmu, hfin, hcyc, hE⟩ := hTB
  have hSB : AnchorSecond38 2 R L₀ := hAB.2
  obtain ⟨c, hζ, hZ⟩ := anchorExc38 2 R L₀ hAB
  have hc : c ≤ 16 * M.deg := by
    have h1 := rootdeg L₀ 2 c Nat.prime_two hζ
    have h2 : c < 2 ^ c := Nat.lt_two_pow_self
    omega
  obtain ⟨L₂, i1, i2, i3, hL₂⟩ := layerex 2 (jZero 2 R) Nat.prime_two L₀ hmu
  obtain ⟨Exc, hExc⟩ := hZ ⌊X ^ Ct⌋₊
  refine ⟨Exc, hExc.1, fun x hx hXx hxX hG E _ _ hEc => ?_⟩
  have hx1 : (1 : ℝ) ≤ x := by linarith
  have hX1 : (1 : ℝ) ≤ X := by linarith
  have hlog : 0 ≤ Real.log x := Real.log_nonneg hx1
  obtain ⟨he2, h2e, -, htx⟩ := hAdm x (by linarith)
  have hw : (1 : ℝ) ≤ x ^ (eps / 4) := Real.one_le_rpow hx1 (by positivity)
  have hP : 0 < q * d := Nat.mul_pos hPP.1.pos hPP.2.2.1.pos
  have hlogP : Real.log ((q * d : ℕ) : ℝ) ≤ x ^ (eps / 4) := by
    push_cast
    exact hlogqd.trans (logs.2.1 J eps X x hJ heps hX1 hXx)
  have hcyc' : Nonempty (L₀ →ₐ[ℚ] CyclotomicField (4 * M.m * (q * d)) ℚ) := by
    rw [← mul_assoc]; exact hcyc
  obtain ⟨hn0, hdisc⟩ := hLD (q * d) (x ^ (eps / 4)) hP hw hlogP L₀ L₂ hfin hcyc' hL₂
  obtain ⟨m, L₁, j1, j2, j3, hL₁, hme, hsha⟩ := hE (e x) he2 E hEc
  have hm : (m : ℝ) ≤ (2 * |A1| + 2) * (1 + Real.log x) := by
    have h3 := logs.2.2 (e x) A1 x hx1 h2e
    have h4 : (m : ℝ) ≤ (e x : ℝ) + 2 := by exact_mod_cast hme
    linarith
  have hpb : 0 ≤ ptBound C eps x := by
    show 0 ≤ C * (1 + Real.log x) + 2 * Real.exp (C * x ^ (3 * eps / 4))
    exact add_nonneg (mul_nonneg hC0 (by linarith)) (by positivity)
  show VVat 2 E (t x) (Real.exp (x ^ (4 * eps / 5)))
  refine vvat 2 (t x) E (x ^ Ct) (ptBound C eps x) _ hpb htx (hx0 x hx) ?_
  intro k hk1 hkt
  have hkx : (k : ℝ) ≤ x ^ Ct := le_trans (by exact_mod_cast hkt.le) htx
  have hk := hC L₀ hmu hSB c X Exc hc hExc L₂ hL₂ hn0 x hx1 hXx hxX hG hdisc k hk1 hkx
    m L₁ hL₁ hm
  obtain ⟨hne, hle⟩ := anchorNeTop38 _ _ hk.1 (hsha k hk1)
  refine ⟨hne, ?_⟩
  have h5 : ((shaInv E 2 k).toNat : ℝ) ≤ 1 + ((shaInv L₁ 2 k).toNat : ℝ) := by
    exact_mod_cast hle
  linarith [hk.2]

private theorem anchorPrimitive38 (A : AbF) (l : ℕ) [Fact l.Prime] (hA : A.HasMu l) (L : Type) [Field L]
    [NumberField L] (hL : IsAbField A L) : ∃ ζ : L, IsPrimitiveRoot ζ l := by
  obtain ⟨N, hN, j, ζ, h1, h2, h3⟩ := hL
  obtain ⟨k, hk⟩ := hA.1.trans h1
  have hz : IsPrimitiveRoot (ζ ^ k) l := h2.pow (NeZero.pos N) (by rw [hk, mul_comm])
  have key : ζ ^ k ∈ IntermediateField.fixedField (IntermediateField.fixingSubgroup j.fieldRange) := by
    rintro ⟨τ, hτ⟩
    rw [IntermediateField.mem_fixingSubgroup_iff] at hτ
    obtain ⟨a, -, ha⟩ := h2.eq_pow_of_pow_eq_one
      (show (τ ζ) ^ N = 1 by rw [← map_pow, h2.pow_eq_one, map_one])
    have hker := (h3 τ a ha.symm).mp (fun x => hτ (j x) ⟨x, rfl⟩)
    have hmod := hA.2 a hker
    show τ (ζ ^ k) = ζ ^ k
    rw [map_pow, ← ha, ← pow_mul]
    have ha1 : 1 ≤ a := by
      rcases Nat.eq_zero_or_pos a with h | h
      · subst h
        have hl1 : l ∣ 1 := Nat.modEq_zero_iff_dvd.mp hmod.symm
        exact absurd (Nat.le_of_dvd one_pos hl1) (not_le.mpr (Fact.out : l.Prime).one_lt)
      · exact h
    obtain ⟨q, hq⟩ := (Nat.modEq_iff_dvd' ha1).mp hmod.symm
    have ha' : a = l * q + 1 := (Nat.sub_eq_iff_eq_add ha1).mp hq
    calc ζ ^ (a * k) = ζ ^ (k + N * q) := by
          congr 1
          rw [ha', hk]
          ring
      _ = ζ ^ k := by rw [pow_add, pow_mul, h2.pow_eq_one, one_pow, mul_one]
  haveI : IsGalois ℚ (CyclotomicField N ℚ) :=
    IsCyclotomicExtension.isGalois (S := {N}) (K := ℚ) (L := CyclotomicField N ℚ)
  rw [IsGalois.fixedField_fixingSubgroup] at key
  obtain ⟨y, hy⟩ := key
  refine ⟨y, ?_⟩
  rw [← hy] at hz
  exact (IsPrimitiveRoot.map_iff_of_injective j.toRingHom.injective).mp hz

theorem UpperTheory.V.Win.anchorPartB38 :
    ∀ CK : ℝ, 0 < CK → ShaK CK → ∀ (l R : ℕ) [Fact l.Prime], l ≠ 2 → ∀ A : AbF, A.HasMu l →
      ∀ (L₀ : Type) [Field L₀] [NumberField L₀], IsAbField A L₀ → AnchorABound38 l R L₀ →
        ∀ J Ct eps A1 : ℝ, 0 < J → 0 ≤ Ct → 0 < eps → ∃ x0 : ℝ, ∀ e t : ℝ → ℕ, admitted A1 Ct e t → ∀ X : ℝ,
          ∃ Exc : Finset ℕ, Exc.card ≤ R ∧ ∀ x ≥ x0, X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
            ∀ (L₀' : Type) [Field L₀'] [NumberField L₀'], IsAbField A L₀' →
              ∀ (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀' L₁], IsLayer l (jZero l R) L₀' L₁ →
                VVat l L₁ (t x) (Real.exp (x ^ (4 * eps / 5))) := by
  intro CK hCK hK l R _ hl2 A hA L₀ _ _ hL₀ hAB J Ct eps A1 hJ hCt heps
  have hmu0 : HasMuQ l L₀ := by
    obtain ⟨ζ, hζ⟩ := anchorPrimitive38 A l hA L₀ hL₀
    exact ⟨ζ, by rw [if_neg hl2]; exact hζ⟩
  obtain ⟨c, -, hc⟩ := anchorExc38 l R L₀ hAB
  obtain ⟨L₂, i1, i2, i3, hL₂⟩ := layerex l (jZero l R) Fact.out L₀ hmu0
  have hc0 : 0 ≤ Real.log (2 * ((NumberField.discr L₂).natAbs : ℝ)) := by
    apply Real.log_nonneg
    have : (1 : ℝ) ≤ ((NumberField.discr L₂).natAbs : ℝ) :=
      Nat.one_le_cast.mpr (Int.natAbs_pos.mpr (NumberField.discr_ne_zero L₂))
    linarith
  obtain ⟨C, -, hP⟩ := anchorPoint238 CK hCK hK l R c (Module.finrank ℚ L₂)
    (Real.log (2 * ((NumberField.discr L₂).natAbs : ℝ))) J Ct eps (jZero l R : ℝ) hc0 hJ hCt heps
    (Nat.cast_nonneg _)
  obtain ⟨x1, hx1two, hx1⟩ := final Ct eps C heps
  refine ⟨x1, fun e t hAdm X => ?_⟩
  obtain ⟨Exc, hExc⟩ := hc ⌊X ^ Ct⌋₊
  refine ⟨Exc, hExc.1, fun x hx hXx hxX hgood L₀' _ _ hL₀' L₁ _ _ _ hL₁ => ?_⟩
  obtain ⟨f0⟩ := abiso A L₀ L₀' hL₀ hL₀'
  obtain ⟨f1⟩ := layeriso l (jZero l R) Fact.out L₀ L₀' L₂ L₁ ⟨f0⟩ hL₂ hL₁
  have hx1' : (1 : ℝ) ≤ x := by linarith
  have hadm := hAdm x (by linarith)
  have hQ : ∀ e' : ℕ, 1 ≤ e' → (e' : ℝ) ≤ x ^ Ct →
      shaInv L₂ l e' ≠ ⊤ ∧ ((shaInv L₂ l e').toNat : ℝ) + 1 ≤ ptBound C eps x := by
    intro e' he1 he2
    refine hP L₀ hmu0 hAB.2 c X Exc le_rfl hExc L₂ hL₂ le_rfl x hx1' hXx hxX hgood ?_ e' he1 he2
      (jZero l R) L₂ hL₂ ?_
    · exact le_mul_of_one_le_right hc0 (Real.one_le_rpow hx1' (by positivity))
    · exact le_mul_of_one_le_right (Nat.cast_nonneg _) (by linarith [Real.log_nonneg hx1'])
  have hb : 0 ≤ ptBound C eps x := by
    have := (hQ 1 le_rfl (by simpa using Real.one_le_rpow hx1' hCt)).2
    have : (0 : ℝ) ≤ ((shaInv L₂ l 1).toNat : ℝ) := Nat.cast_nonneg _
    linarith
  refine vvat l (t x) L₁ (x ^ Ct) (ptBound C eps x) _ hb hadm.2.2.2 (hx1 x hx) ?_
  intro e' he1 he2
  rw [← shaInv_congr f1]
  have h := hQ e' he1 (le_trans (by exact_mod_cast he2.le) hadm.2.2.2)
  exact ⟨h.1, by linarith [h.2]⟩

theorem UpperTheory.V.Win.shaMono38 :
    ∀ C C' : ℝ, C ≤ C' → ShaK C → ShaK C' := by
  intro C C' hCC hK
  unfold ShaK at hK ⊢
  intro l _ L _ _ hL hMu e he
  obtain ⟨s, hs, hb⟩ := hK l L hL hMu e he
  refine ⟨s, hs, hb.trans ?_⟩
  unfold kBound
  apply Real.exp_le_exp.mpr
  apply mul_le_mul_of_nonneg_right
  · apply Real.rpow_le_rpow_of_exponent_le _ hCC
    have hn : 0 < Module.finrank ℚ L := Module.finrank_pos
    have h1 : (1 : ℝ) ≤ (e : ℝ) := by exact_mod_cast he
    have h2 : (1 : ℝ) ≤ (Module.finrank ℚ L : ℝ) := by exact_mod_cast hn
    nlinarith
  · rcases Nat.eq_zero_or_pos (discr L).natAbs with h0 | h0
    · rw [h0]
      simp
    · apply Real.log_nonneg
      have : (1 : ℝ) ≤ ((discr L).natAbs : ℝ) := by exact_mod_cast h0
      linarith

theorem UpperTheory.V.Win.anchorThmBab38 :
    (∃ CK : ℝ, ShaK CK) → AnchorFixedIn38 → AnchorTwoIn38 → ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct := by
  rintro ⟨CK0, hK0⟩ hF hT
  classical
  have hCK1 : (1 : ℝ) ≤ max CK0 1 := le_max_right _ _
  have hCKpos : (0 : ℝ) < max CK0 1 := lt_of_lt_of_le one_pos hCK1
  have hK : ShaK (max CK0 1) := shaMono38 CK0 _ (le_max_left _ _) hK0
  let P : ℕ → AbF → ℕ → Prop := fun l A R =>
    ∃ (_ : Fact l.Prime) (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀), IsAbField A L₀ ∧ AnchorABound38 l R L₀
  let R0 : AbF → ℕ := fun M => Classical.choose (hT M)
  let Rl : ℕ → AbF → ℕ := fun l A => if h : ∃ R, P l A R then Classical.choose h else 0
  refine ⟨BConst.mk R0 Rl (max CK0 1) hCKpos, fun Ct hCt => ?_⟩
  unfold ThmBab BShape IsBWindow
  intro M B' L hAux eps A1 heps heps'
  unfold OddPrimesWithRootsOfUnity at hAux
  have hCt0 : 0 < Ct := lt_of_lt_of_le one_pos hCt
  set CK : ℝ := max CK0 1 with hCKdef
  set R : ℕ := R0 M + ∑ l ∈ B', Rl l (L l) with hRdef
  set J : ℝ := 2 ^ (R + 2) * (2 * CK * Ct / eps) ^ R with hJdef
  have hJpos : 0 < J := by
    have : 0 < 2 * CK * Ct / eps := by positivity
    positivity
  obtain ⟨x0A, hA⟩ := anchorPartA38 CK hCKpos hK M (R0 M) J Ct eps A1 hJpos hCt0.le heps
  have hB : ∀ l ∈ B', ∃ x0 : ℝ, ∀ e t, admitted A1 Ct e t → ∀ X : ℝ, ∃ Exc : Finset ℕ,
      Exc.card ≤ Rl l (L l) ∧ ∀ x ≥ x0, X ^ (1 / J) ≤ x → x ≤ X → Good (eps / (2 * CK)) Ct Exc x →
        ∀ (_ : Fact l.Prime) (L₀' : Type) [Field L₀'] [NumberField L₀'], IsAbField (L l) L₀' →
          ∀ (L₁ : Type) [Field L₁] [NumberField L₁] [Algebra L₀' L₁],
            IsLayer l (Nat.log l (Rl l (L l)) + 3) L₀' L₁ → VVat l L₁ (t x) (Real.exp (x ^ (4 * eps / 5))) := by
    intro l hl
    obtain ⟨hp, hl2, hmu⟩ := hAux l hl
    haveI : Fact l.Prime := ⟨hp⟩
    by_cases hex : ∃ (L₀ : Type) (_ : Field L₀) (_ : NumberField L₀), IsAbField (L l) L₀
    · obtain ⟨L₀, _, _, hab⟩ := hex
      have hP : ∃ R, P l (L l) R := by
        obtain ⟨R', hR'⟩ := hF l hl2 (L l) hmu L₀ hab
        exact ⟨R', ⟨_, L₀, _, _, hab, hR'⟩⟩
      have hRl : Rl l (L l) = Classical.choose hP := by
        show (if h : ∃ R, P l (L l) R then Classical.choose h else 0) = _
        rw [dif_pos hP]
      obtain ⟨_, L₀₀, _, _, hab0, hR0⟩ := Classical.choose_spec hP
      obtain ⟨x0, hx0⟩ := anchorPartB38 CK hCKpos hK l (Classical.choose hP) hl2 (L l) hmu L₀₀ hab0 hR0
        J Ct eps A1 hJpos hCt0.le heps
      refine ⟨x0, fun e t hAdm X => ?_⟩
      obtain ⟨Exc, hcard, hx⟩ := hx0 e t hAdm X
      refine ⟨Exc, hRl ▸ hcard, fun x hxx hlo hhi hg _ L₀' _ _ hab' L₁ _ _ _ hlay => ?_⟩
      rw [hRl] at hlay
      exact hx x hxx hlo hhi hg L₀' hab' L₁ hlay
    · refine ⟨0, fun e t _ X => ⟨∅, by simp, ?_⟩⟩
      intro x _ _ _ _ _ L₀' _ _ hab' _ _ _ _ _
      exact absurd ⟨L₀', _, _, hab'⟩ hex
  choose! f hf using hB
  set x1 : ℝ := max 1 (max x0A (∑ l ∈ B', |f l|)) with hx1def
  have hfle : ∀ l ∈ B', f l ≤ x1 := fun l hl =>
    (le_abs_self _).trans ((Finset.single_le_sum (fun i _ => abs_nonneg (f i)) hl).trans
      ((le_max_right _ _).trans (le_max_right _ _)))
  have hx0A : x0A ≤ x1 := (le_max_left _ _).trans (le_max_right _ _)
  have hx1pos : 0 ≤ x1 := zero_le_one.trans (le_max_left _ _)
  refine ⟨max 2 (x1 ^ J), fun e t hAdm X hX q d hqd hlog => ?_⟩
  have hX2 : 2 ≤ X := (le_max_left _ _).trans hX
  have hXJ : x1 ^ J ≤ X := (le_max_right _ _).trans hX
  have hlow : x1 ≤ X ^ (1 / J) := by
    calc x1 = (x1 ^ J) ^ (1 / J) := by
          rw [← Real.rpow_mul hx1pos, mul_one_div_cancel hJpos.ne', Real.rpow_one]
      _ ≤ X ^ (1 / J) := Real.rpow_le_rpow (Real.rpow_nonneg hx1pos _) hXJ (by positivity)
  obtain ⟨L₀, _, _, hTB, hAB⟩ := Classical.choose_spec (hT M) q d hqd
  obtain ⟨ExcA, hcardA, hxA⟩ := hA e t hAdm X q d hqd hlog L₀ hTB hAB
  have hB2 := fun l hl => hf l hl e t hAdm X
  choose! g hg using hB2
  have hcard : (ExcA ∪ B'.biUnion g).card ≤ R :=
    (Finset.card_union_le _ _).trans (add_le_add hcardA
      (Finset.card_biUnion_le.trans (Finset.sum_le_sum fun l hl => (hg l hl).1)))
  have heta : 0 < eps / (2 * CK) := by positivity
  have hetaCt : eps / (2 * CK) ≤ Ct := by
    have h1 : eps / (2 * CK) ≤ 1 := by
      rw [div_le_one (by positivity)]
      linarith
    linarith
  obtain ⟨Y, hY, hgood⟩ := window R (eps / (2 * CK)) Ct X (ExcA ∪ B'.biUnion g) heta hetaCt
    (by linarith) hcard
  have hJeq : (2 : ℝ) ^ (R + 2) * (Ct / (eps / (2 * CK))) ^ R = J := by
    rw [hJdef, show Ct / (eps / (2 * CK)) = 2 * CK * Ct / eps by rw [div_div_eq_mul_div]; ring]
  rw [hJeq] at hY
  refine ⟨Y, hY, fun x hYx hxY => ?_⟩
  have hG := hgood x hYx hxY
  have hXlo : X ^ (1 / J) ≤ x := hY.1.trans hYx
  have hXhi : x ≤ X := hxY.trans hY.2
  have hGsub : ∀ S ⊆ ExcA ∪ B'.biUnion g, Good (eps / (2 * CK)) Ct S x :=
    fun S hS n hn => hG n (hS hn)
  refine ⟨hxA x (hx0A.trans (hlow.trans hXlo)) hXlo hXhi (hGsub _ Finset.subset_union_left), ?_⟩
  unfold BbAt
  intro l hl _ L₀' _ _ hab L₁ _ _ _ hlay
  exact (hg l hl).2 x ((hfle l hl).trans (hlow.trans hXlo)) hXlo hXhi
    (hGsub _ ((Finset.subset_biUnion_of_mem g hl).trans Finset.subset_union_right)) _ L₀' hab L₁ hlay

theorem UpperTheory.V.Win.anchorThmBab_of_sha38 (hFW : Published.FerreroWashington)
    (hK : ∃ C : ℝ, ShaK C) : ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct :=
  have hA : UpperTheory.V.Two.AnchorTowerBound38 :=
    fun l _ L _ _ R h => UpperTheory.V.PropA.anchorABound_of_isTower38 l L R h
  anchorThmBab38 hK (UpperTheory.V.Two.anchorFixedIn38 hFW hA)
    (UpperTheory.V.Two.anchorTwoIn38 hFW hA)

example (hFW : Published.FerreroWashington) (hK : ∃ C : ℝ, ShaK C) :
    ∃ K : BConst, ∀ Ct : ℝ, 1 ≤ Ct → ThmBab K Ct := by
  first
  | (rh_reduce 3 using [UpperTheory.V.Win.anchorThmBab_of_sha38]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact UpperTheory.V.Win.anchorThmBab_of_sha38 hFW hK

rh_scan UpperTheory.V.Win.thmBab_of_lemmaK limit 2000
rh_scan UpperTheory.V.Win.anchorThmBab_of_sha38 limit 2000
rh_prune UpperTheory.V.Win.anchorThmBab_of_sha38 as RH38AnchorPruned
#print axioms UpperTheory.V.PropA.anchorABound_of_descends38
#print axioms UpperTheory.V.Win.anchorThmBab_of_sha38
#print axioms UpperTheory.V.Win.thmBab_of_lemmaK
end
