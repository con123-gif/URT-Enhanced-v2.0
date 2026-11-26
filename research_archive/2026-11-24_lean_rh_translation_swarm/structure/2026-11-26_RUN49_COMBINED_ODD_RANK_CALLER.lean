import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.LemmaKOfLitN
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import Mathlib.Data.Fin.Tuple.Sort

/-!
Lane 13 RUN49, 26 Nov 2026 — ONE SHARED CALLER, PREPARED / NOT COMPILED.
Mission blob fb152e2897b4c1c320c43b9f42ae0ec088a7da45 (26 Nov
acceleration sprint, mandatory engine); SWARM 4b77b161, HANDOFF bbc46df7,
AGENTS 8db0201d, state/log/protocol/continuity openings consulted.
Latest peer commit index through c6f37d94; shared replay 03b9179d,
integration 526075be, audit 4072e55; do not duplicate their builds.
Prior exact certificate blobs:
2026-11-26_RUN45_ODD_RANK_WEIGHT_BOUNDARY_PRUNE.lean 1f15eed9ce5d4c4b04a6d50638d4e3b40413cc79
2026-11-26_RUN46_SURJ_GOOD_PROJECTION.lean 91cc833b2d9547123ce5ce2e154f098bfd3587b8
2026-11-26_RUN47_FINITE_COFINAL_HECKE.lean b1ec89970183a202aa0f3212814c7fde06890efb
2026-11-26_RUN48_ALTERNATING_HECKE_ORBITS.lean bbb9e47926b23b07555843eab804cc91367ec0c1
2026-11-26_RUN44_EXACT_CLASS_QUOTIENT_NATIVE_BUDGET.lean 387f0e5f57c2fc6a484dc1b7f1dd0f4993a655f8
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1;
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ClassCounting/BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/
  IteratedHeckeBounds/LemBound.lean 59e23b33fa6d779ab02f33af97bb59ce9350347b
  SBridgeAlt.lean ec6c9ebdf9477b507dee27a41d1b7ddd12fe9106
  CompactLocalSets/SLocOf.lean fb5d7d5e32be4d4e3d321e9c8540ce2d1879da55
  CompactLocalSets/Assemble.lean 99d1ccf39f6442af513cc0ba523780a2b4b22934
  CompactLocalSets/Overlap.lean c6bee9e377bdfc29ca05d6cd2ef282ee840655c4
  ArithmeticGapBounds/SGapOfParts.lean 88837e45dc5c0290bc36e35f76be5c27b38e2765

RESULT: compose four previously isolated local reductions at the actual
native SFew consumer (not four separate alternative rank wrappers).
At fixed L,k,N,pi,d,omega_b and chosen stable cycle family s, use
the SAME omega'-omega_b and SAME finite-coordinate gap. The decay
comparison remains (4/5)^t ||x0|| <= D(3/5)^t on common cofinal t,
so x0=0, and the same weight polynomial kills j=2..k+1. The signed
permutation factor cancels before squaring. No additional assumption,
new constant, or uniform-in-host estimate introduced. The local overlap
source already chooses constants independent of omega, and the finite
family can share a maximum or sum; no new local-overlap theorem needed.
Read actual SLoc/Assemble/Overlap bodies; preserve their finiteness,
Haar, compactness, integrability and invariance premises.

Original selected source graph (not kernel-extracted):
SFew -> sUpperOf -> bOdd -> bOdd_zk -> bStarOdd -> sBStarOdd_of
 -> [sSurj_of -> key -> SInv, SHecke, lem_bound;
     sWtOdd_of -> WSys -> Aev_bd].
Reduced candidate:
actual_few49 -> sUpperOf -> bOdd49 -> bOdd_zk49 -> bStarOdd49
 -> sBStarOdd_of45 [sSurj49 -> key49 -> sInvGood46,
                     sHeckeFinite47 -> assemble47,
                     lem_bound48 -> sorted coordinates;
                    sWtOdd_source45 -> WSys45].
All other SFew, original weight, topology, spectral, overlap,
stability, arithmetic, local and uniform scale dependencies retained.
SEv may survive through sLoc, stabilization etc; FFT remains through
sWtOdd_source45. No claim of global pruning. Cache by source/toolchain,
declaration, same instantiated host/degree/cycles/domain/witness and
role. Preserve original and all older candidate graphs/axiom ledgers.
Direct caller wrappers deliberately avoid auto choosing old theorem;
native bounded reduce/auto/backtracking can be applied independently
in the shared runner, not passed off as executed.

Executed 38 source checks in connector V8: pinned blobs, unique
extraction/replacement anchors, inverse reconstruction of key47,
preserved finite decay/good/weight and SFew consumer, explicit no
sorry/admit token check (NOT a transitive axiom audit), and actual
shared CI failure check. Did not rerun previous arithmetic regression
suites because no arithmetic identity changed. No local lean/lake/elan
(command -v all absent). New combined certificate not compiled.
Actual latest shared CI status blob 22989ce418dbfe8731db225af351ca57592ead73,
run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45773743341, returncode 1, 133.27s,
failed BEFORE prime candidate elaboration at unhandled Unicode module
import Development.AbelianVarietyTheory.PublishedTheorems.GaloisCohomology₂.PoitouTateNineTermTransgressionZeroApply.
The RUN25 header parser uses ASCII [A-Za-z0-9_.]+; Unicode subscript ₂
must be admitted. Python Unicode-aware [\w.]+ accepts this actual
identifier; retain explicit malformed/unsupported import fail-closed
behavior and file existence/pin checks. This is a diagnosis, not a
tested fix or a permission to edit the kernel lane runner. No second
build queued. Historical baseline does not validate this candidate.

RESUME HERE: kernel/O(N) owners repair header parser against actual
Unicode path and replay existing prime/CountQ batch once; add this
single combined candidate to shared warmed replay rather than 4
redundant rank wrappers. Check actual caller substitution, full
constructor roles and axioms; preserve failures. If any earlier
certificate fails, backtrack to the exact corresponding original
consumer while retaining other independently verified replacements.
HANDOFF TO kernel extractor, audit, integration, mathematics.
No new essential root leaf discharged; RH OPEN.
-/

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL
open scoped TensorProduct
namespace PositivityTheory.KB

def WSys45 (R : Type) [CommRing R] (k j : ℕ) (a : ∀ n : ℕ, Chn (GL (Fin n) R) (k + 1) →ₗ[ℝ] ℝ) : Prop :=
  (∀ n n' (h : n ≤ n') z, IsCyc z → a n' (cmap (stab R n n' h) (k + 1) z) = a n z) ∧
  ∀ d n z, 1 ≤ d → IsCyc z → a (d * n) (cmap (psi R d n) (k + 1) z) = (d : ℝ) ^ j * a n z

def SWtOdd45 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L] (k : ℕ), Even k →
    ∃ τ : InfinitePlace L → ∀ n : ℕ, Chn (Gm L n) (k + 1) →ₗ[ℝ] ℝ, (∀ w, WSys45 (𝓞 L) k 1 (τ w)) ∧
      ∀ (N : ℕ) (ω : Form (HS L N) (k + 1)), (∀ g, FInv ω g) →
        ∃ (c : InfinitePlace L → ℝ) (a : ℕ → ∀ n : ℕ, Chn (Gm L n) (k + 1) →ₗ[ℝ] ℝ),
          (∀ j ∈ Finset.Icc 2 (k + 1), WSys45 (𝓞 L) k j (a j)) ∧
          ∀ z : Chn (Gm L N) (k + 1), IsCyc z →
            ev (emb L N) (intP ω) (one L N) z = ∑ w, c w * τ w N z + ∑ j ∈ Finset.Icc 2 (k + 1), a j N z

namespace PrimeModuloFree
open LargePrimeDiscriminant
theorem wsys_zc45 (hC : SChain) {R : Type} [CommRing R] {k j : ℕ} {a : ∀ n : ℕ, Chn (GL (Fin n) R) (k + 1) →ₗ[ℝ] ℝ}
    (ha : WSys45 R k j a) {l : ℕ} (hl : 0 < l) {n : ℕ} {z : Chn (GL (Fin n) R) (k + 1)} (hz : IsCyc z) :
    ∀ t, a (lev l n t) (zc R hl z t) = (∏ i ∈ Finset.range t, ((l : ℝ) ^ j - (l : ℝ) ^ (i + 2))) * a n z
  | 0 => by
    simp only [Finset.range_zero, Finset.prod_empty, one_mul]
    rfl
  | t + 1 => by
    have hc := isCyc_zc hC R hl hz t
    have ih := wsys_zc45 hC ha hl hz t
    rw [Finset.prod_range_succ]
    change a (l * lev l n t) (cmap (psi R l (lev l n t)) (k + 1) (zc R hl z t) -
      ((l : ℝ) ^ (t + 2)) • cmap (stab R (lev l n t) (l * lev l n t) (Nat.le_mul_of_pos_left _ hl)) (k + 1)
        (zc R hl z t)) = _
    rw [map_sub, map_smul, ha.2 l (lev l n t) _ hl hc, ha.1 _ _ _ _ hc, ih]
    simp only [smul_eq_mul]
    ring
end PrimeModuloFree

namespace BlockEvaluationBounds
open BlockInvariants
variable {L : Type} [Field L] [NumberField L]
theorem swtOdd45 (hS : SStokes) (hF : FFT) (hG : AGood) (hWP : WPad) (hWB : WBlk) (hWI : WInv)
    (hWC : WCyc) (hTS : TStab) (hTB : TBlk) (hPS : PStab) (hPB : PBlk) (hWO : WOneOdd) (hR : WRot) :
    SWtOdd45 := by
  intro L _ _ k hk
  classical
  have hodd : Odd (k + 1) := hk.add_one
  have hpos : 0 < k + 1 := Nat.succ_pos k
  have hrot : ncyc (finRotate (k + 1)) = 1 := hR (k + 1) hpos
  refine ⟨fun w n => Aev n ((finRotate (k + 1), fun _ => w, false) : Pat L (k + 1)) +
    Aev n ((finRotate (k + 1), fun _ => w, true) : Pat L (k + 1)), ?_, ?_⟩
  · intro w
    refine ⟨?_, ?_⟩
    · intro n n' h z _
      simp only [LinearMap.add_apply]
      rw [Aev_stab hWP hWI hTS hPS h, Aev_stab hWP hWI hTS hPS h]
    · intro d n z _ _
      simp only [LinearMap.add_apply]
      rw [Aev_blk hWB hWI hTB hPB, Aev_blk hWB hWI hTB hPB]
      simp only [hrot, pow_one]
      ring
  · intro N ω hω
    obtain ⟨c, hc⟩ := hF L N (k + 1) _ (uInv_of hω)
    have hone : ∀ x : Pat L (k + 1), ncyc x.1 = 1 → ∃ (r : ℝ) (w : InfinitePlace L),
        AT (N := N) x = r • (AT (N := N) ((finRotate (k + 1), fun _ => w, false) : Pat L (k + 1)) +
          AT (N := N) ((finRotate (k + 1), fun _ => w, true) : Pat L (k + 1))) :=
      fun x hx => hWO L N (k + 1) x hodd hx
    choose! rx wx hrw using hone
    refine ⟨fun w => ∑ x, if ncyc x.1 = 1 ∧ wx x = w then c x * rx x else 0,
      fun j n => ∑ x, (if ncyc x.1 = j then c x else 0) • Aev n x, ?_, ?_⟩
    · intro j _
      refine ⟨?_, ?_⟩
      · intro n n' h z _
        simp only [LinearMap.sum_apply, LinearMap.smul_apply, smul_eq_mul]
        exact Finset.sum_congr rfl fun x _ => by rw [Aev_stab hWP hWI hTS hPS h]
      · intro d n z _ _
        simp only [LinearMap.sum_apply, LinearMap.smul_apply, smul_eq_mul]
        rw [Finset.mul_sum]
        refine Finset.sum_congr rfl fun x _ => ?_
        rw [Aev_blk hWB hWI hTB hPB]
        split_ifs with hj
        · rw [hj]
          ring
        · simp
    · intro z _
      have hcont : ∀ x : Pat L (k + 1), ContinuousOn (ext (AT (N := N) x)) (Pos L N) :=
        fun x => (hG hS L N (k + 1) _ (fInv_ext (hWI L N (k + 1) x))).1
      have h1 : intP ω = fun p => ∑ x, c x * intP (ext (AT (N := N) x)) p := by
        rw [← intP_sum c _ hcont]
        apply intP_congr
        intro p hp
        rw [ext_uniq hω hp, hc, ext_sum]
      have e1 : ∀ x : Pat L (k + 1), (∑ w, (if ncyc x.1 = 1 ∧ wx x = w then c x * rx x else 0) *
          (Aev N ((finRotate (k + 1), fun _ => w, false) : Pat L (k + 1)) z +
            Aev N ((finRotate (k + 1), fun _ => w, true) : Pat L (k + 1)) z)) =
          if ncyc x.1 = 1 then c x * Aev N x z else 0 := by
        intro x
        by_cases h : ncyc x.1 = 1
        · simp only [h, true_and, if_true, ite_mul, zero_mul, Finset.sum_ite_eq, Finset.mem_univ]
          rw [Aev_comb hS hG hWI _ _ _ _ (hrw x h) z]
          ring
        · simp [h]
      have e2 : ∀ x : Pat L (k + 1), (∑ j ∈ Finset.Icc 2 (k + 1),
          (if ncyc x.1 = j then c x else 0) * Aev N x z) =
          if ncyc x.1 = 1 then 0 else c x * Aev N x z := by
        intro x
        have hb := hWC (k + 1) x.1 hpos
        simp only [ite_mul, zero_mul, Finset.sum_ite_eq, Finset.mem_Icc]
        split_ifs with h1 h2 h2
        · omega
        · rfl
        · rfl
        · omega
      rw [h1, ev_sum]
      simp only [← Aev_apply, LinearMap.add_apply, LinearMap.sum_apply, LinearMap.smul_apply,
        smul_eq_mul, Finset.sum_mul]
      rw [Finset.sum_comm (s := (Finset.univ : Finset (InfinitePlace L))),
        Finset.sum_comm (s := Finset.Icc 2 (k + 1)), ← Finset.sum_add_distrib]
      refine Finset.sum_congr rfl fun x _ => ?_
      rw [e1 x, e2 x]
      split_ifs <;> ring
end BlockEvaluationBounds

open PrimeModuloFree LargePrimeDiscriminant in
theorem sBStarOdd_of45 : SChain → SSep → SBridge → SStab → SSurj → SWtOdd45 → BStarOdd := by
  intro hC hSep hBr hStab hSurj hWt L _ _ hTC k hk hkr l hl n hn
  haveI : IsTotallyComplex L := hTC
  obtain ⟨θ, hθs, hθ0, hθn⟩ := hBr k
  obtain ⟨τ, hτW, hτ⟩ := hWt L k hk
  have hcard : Fintype.card (InfinitePlace L) = nrComplexPlaces L := by
    rw [card_eq_nrRealPlaces_add_nrComplexPlaces, IsTotallyComplex.nrRealPlaces_eq_zero, zero_add]
  have hM : 2 * (k + 1) + 4 ≤ lev l n k := le_trans hn (PrimeModuloFree.le_lev hl n k)
  let C : Submodule ℝ (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker :=
    Submodule.span ℝ {y | ∃ z0 : Chn (GL (Fin n) (𝓞 L)) (k + 1), IsCyc z0 ∧
      (y : Chn (GL (Fin (lev l n k)) (𝓞 L)) (k + 1)) = PrimeModuloFree.zc (𝓞 L) hl z0 k}
  calc _ ≤ ((Fintype.card (InfinitePlace L) : ℕ) : Cardinal) :=
        TwOdd.rank_span_le _ ((θ (GL (Fin (lev l n k)) (𝓞 L))).comp C.subtype)
          ((LinearMap.pi fun w : InfinitePlace L => τ w (lev l n k)).comp
            ((bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker.subtype.comp C.subtype)) ?_ ?_
    _ = _ := by rw [hcard]
  · intro z hT
    have hTw : ∀ w, τ w (lev l n k) (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker).1 = 0 :=
      fun w => congrFun hT w
    show (θ _) (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker) = 0
    refine (hθ0 _ _).2 ?_
    by_contra hnb
    have hcyc : IsCyc (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker).1 :=
      LinearMap.mem_ker.mp (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker).2
    obtain ⟨N, hMN, hN⟩ := hSurj L hTC k hkr (lev l n k)
    have hz'c := LargePrimeDiscriminant.isCyc_cmap hC (stab (𝓞 L) (lev l n k) N hMN) hcyc
    have hz'nb : ¬ IsBd (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1)
        (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker).1) :=
      fun h => hnb ((hStab (𝓞 L) k (lev l n k) N hMN hM).1 _ hcyc h)
    obtain ⟨c, hcI, hcd, hcne⟩ := hSep _ k _ hz'c hz'nb
    obtain ⟨ω, hωI, hω⟩ := hN c hcI hcd
    obtain ⟨cc, a, ha, hdec⟩ := hτ N ω hωI
    have hazero : ∀ j ∈ Finset.Icc 2 (k + 1), ∀ y ∈ C,
        a j (lev l n k) (y : Chn (GL (Fin (lev l n k)) (𝓞 L)) (k + 1)) = 0 := by
      intro j hj y hy
      induction hy using Submodule.span_induction with
      | mem x hx =>
        obtain ⟨z0, hz0, hx⟩ := hx
        rw [hx, PrimeModuloFree.wsys_zc45 (R := 𝓞 L) hC (ha j hj) hl hz0 k]
        apply mul_eq_zero_of_left
        rw [Finset.mem_Icc] at hj
        apply Finset.prod_eq_zero (i := j - 2)
        · rw [Finset.mem_range]; omega
        · rw [Nat.sub_add_cancel hj.1, sub_self]
      | zero => simp
      | add x y _ _ hx hy => simp [hx, hy]
      | smul r x _ hx => simp [hx]
    apply hcne
    rw [hω _ hz'c, hdec _ hz'c]
    have h1 : ∀ w, τ w N (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1)
        (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker).1) = 0 := by
      intro w
      rw [(hτW w).1 _ _ hMN _ hcyc]
      exact hTw w
    have h2 : ∀ j ∈ Finset.Icc 2 (k + 1), a j N (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1)
        (z : (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker).1) = 0 := by
      intro j hj
      rw [(ha j hj).1 _ _ hMN _ hcyc]
      exact hazero j hj _ z.2
    rw [Finset.sum_eq_zero (fun w _ => by rw [h1 w, mul_zero]), Finset.sum_eq_zero h2, add_zero]
  · rintro _ ⟨x, rfl⟩
    obtain ⟨z0, hz0⟩ := hθs (GL (Fin n) (𝓞 L)) (1 ⊗ₜ x)
    refine ⟨⟨⟨PrimeModuloFree.zc (𝓞 L) hl z0.1 k,
      PrimeModuloFree.isCyc_zc hC (𝓞 L) hl (LinearMap.mem_ker.mp z0.2) k⟩,
      Submodule.subset_span ⟨z0.1, LinearMap.mem_ker.mp z0.2, rfl⟩⟩, ?_⟩
    exact PrimeModuloFree.th_zc θ hθn hC (𝓞 L) hl z0.1 (LinearMap.mem_ker.mp z0.2) x hz0 k

open BlockInvariants BlockEvaluationBounds in
theorem sWtOdd_source45 (hS : SStokes) : SWtOdd45 :=
  swtOdd45 hS (fft_of cplx sw1 sw2) aGood wPad weylTwoBlockMatrix wInv wCyc tStab tBlk pStab blockSum_preserves_cone wOneOdd wRot


end PositivityTheory.KB
end

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL

namespace PositivityTheory.KB

def SInvGood46 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L] (N k : ℕ) (ω : Form (HS L N) (k + 1)),
    (∀ g, FInv ω g) → Good ω

theorem sInvGood46_of (hInv : SInv) : SInvGood46 :=
  fun L _ _ N k ω hω => (hInv L N k ω hω).1

theorem sInvGood46 : SInvGood46 := by
  intro L _ _ N k ω hω
  exact BlockInvariants.aGood sStokes_of L N (k + 1) ω hω


end PositivityTheory.KB
end

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL

namespace PositivityTheory.KB

def SHeckeFinite47 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L], IsTotallyComplex L → ∀ k : ℕ, k + 1 < nrComplexPlaces L →
    ∀ (π : 𝓞 L) (hπ : Prime π), ∃ N₀ : ℕ, ∀ N, N₀ ≤ N →
      ∃ s : Finset (Chn (Gm L N) (k + 1)), (∀ z ∈ s, IsCyc z) ∧
        ∀ F : (Fin (k + 2) → GK L N) → ℝ, Inv (toK L N) F → dC F = 0 →
          (∃ D : ℝ, 0 ≤ D ∧ ∀ j : ℕ, ∃ t : ℕ, j ≤ t ∧ ∀ z ∈ s,
            |ev (toK L N) ((hecke (toK L N) (MonoidHom.id (GK L N)) (qel L N π hπ.ne_zero))^[t] F) 1 z| ≤
              D * (3 / 5 : ℝ) ^ t) →
          ∀ z : Chn (Gm L N) (k + 1), IsCyc z → ev (toK L N) F 1 z = 0

theorem finite_decay47 {Z : Type} (s : Finset Z) (f : Z → ℕ → ℝ)
    (h : ∀ z ∈ s, ∃ C : ℝ, ∀ t : ℕ, |f z t| ≤ C * (3 / 5 : ℝ) ^ t) :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ j : ℕ, ∃ t : ℕ, j ≤ t ∧ ∀ z ∈ s,
      |f z t| ≤ D * (3 / 5 : ℝ) ^ t := by
  classical
  have hh : ∀ z : ↥s, ∃ C : ℝ, ∀ t : ℕ, |f z.1 t| ≤ C * (3 / 5 : ℝ) ^ t :=
    fun z => h z.1 z.2
  choose C hC using hh
  refine ⟨∑ z : ↥s, |C z|, by positivity, fun j => ⟨j, le_rfl, ?_⟩⟩
  intro z hz
  calc |f z j| ≤ C ⟨z, hz⟩ * (3 / 5 : ℝ) ^ j := hC ⟨z, hz⟩ j
    _ ≤ |C ⟨z, hz⟩| * (3 / 5 : ℝ) ^ j := by gcongr; exact le_abs_self _
    _ ≤ (∑ w : ↥s, |C w|) * (3 / 5 : ℝ) ^ j := by
      gcongr
      exact Finset.single_le_sum (f := fun w : ↥s => |C w|) (fun _ _ => abs_nonneg _) (Finset.mem_univ ⟨z, hz⟩)

theorem sHecke_of_finite47 (h : SHeckeFinite47) : SHecke := by
  intro L _ _ hL k hk π hπ
  obtain ⟨N₀, hN₀⟩ := h L hL k hk π hπ
  refine ⟨N₀, fun N hN F hFi hFc hdec => ?_⟩
  obtain ⟨s, hs, hTest⟩ := hN₀ N hN
  exact hTest F hFi hFc (finite_decay47 s _ fun z hz => hdec z (hs z hz))

namespace AffineStabilizerVanishing

private theorem lift_map_comp {V ι : Type} [AddCommGroup V] [Module ℝ V] [Fintype ι]
    (P Q : V →ₗ[ℝ] (ι → ℝ)) (h : ∀ v, P v = 0 → Q v = 0) :
    ∃ K : ℝ, 0 ≤ K ∧ ∀ v, ‖Q v‖ ≤ K * ‖P v‖ := by
  have hk : LinearMap.ker P ≤ LinearMap.ker Q := fun v hv => h v hv
  obtain ⟨M, hM⟩ := LinearMap.exists_extend (((LinearMap.ker P).liftQ Q hk).comp
    (P.quotKerEquivRange.symm : LinearMap.range P →ₗ[ℝ] V ⧸ LinearMap.ker P))
  refine ⟨‖LinearMap.toContinuousLinearMap M‖, norm_nonneg _, fun v => ?_⟩
  have hv : Q v = M (P v) := by
    have := LinearMap.congr_fun hM ⟨P v, LinearMap.mem_range_self P v⟩
    simp only [LinearMap.comp_apply, Submodule.subtype_apply] at this
    rw [this, LinearEquiv.coe_coe, LinearMap.quotKerEquivRange_symm_apply_image]
    rfl
  rw [hv]
  exact (LinearMap.toContinuousLinearMap M).le_opNorm (P v)

private theorem eq_zero_of_mem_all_maximalIdeal_pow {G : Type} [Group G] {k : ℕ} (E : Chn G (k + 1) →ₗ[ℝ] ℝ)
    (s : Finset (Chn G (k + 1)))
    (hs : ∀ z, IsCyc z → ∃ z' ∈ Submodule.span ℝ (s : Set (Chn G (k + 1))), IsBd (z - z'))
    (hbd : ∀ z, IsBd z → E z = 0) (h0 : ∀ z ∈ s, E z = 0) : ∀ z, IsCyc z → E z = 0 := by
  intro z hz
  obtain ⟨z', hz', hb⟩ := hs z hz
  have h1 : z' ∈ LinearMap.ker E :=
    (Submodule.span_le (p := LinearMap.ker E)).2 (fun w hw => h0 w hw) hz'
  have h2 := hbd _ hb
  rw [map_sub, LinearMap.mem_ker.1 h1, sub_zero] at h2
  exact h2

private theorem ev_resF_eq_ev_cmap_stab (L : Type) [Field L] [NumberField L] (n r k : ℕ)
    (hc : ∀ c : Gm L n, toK L (n + r) (stab (𝓞 L) n (n + r) (Nat.le_add_right n r) c) =
      stab L n (n + r) (Nat.le_add_right n r) (toK L n c))
    (G : (Fin (k + 2) → GK L (n + r)) → ℝ) (z : Chn (Gm L n) (k + 1)) :
    ev (toK L n) (resF L n r k G) 1 z =
      ev (toK L (n + r)) G 1 (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1) z) := by
  unfold ev cmap
  rw [Finsupp.lmapDomain_apply, Finsupp.sum_mapDomain_index (fun _ => by simp) (fun _ _ _ => by ring)]
  refine Finsupp.sum_congr fun g _ => ?_
  simp only [resF, smul_eq_mul, mul_one, ← map_partialProd, hc]

private theorem exists_linearMap_eq_ev {G : Type} [Group G] {H Y : Type} [Group H] [MulAction H Y] (ρ : G →* H)
    {m : ℕ} (F : (Fin (m + 1) → Y) → ℝ) (y : Y) :
    ∃ E : Chn G m →ₗ[ℝ] ℝ, ∀ z, E z = ev ρ F y z := by
  refine ⟨Finsupp.lsum ℝ fun g => LinearMap.id.smulRight (F fun j => ρ (Fin.partialProd g j) • y),
    fun z => ?_⟩
  rw [Finsupp.lsum_apply]
  unfold ev
  refine Finsupp.sum_congr fun g _ => ?_
  simp [smul_eq_mul]


theorem assemble47 (hCh : SChain) (hEv : SEv) (hSt : SStab) (hFin : SFin) (hAff : SAff) (hKey : PKey)
    (hF : PHeckeFormal) (hK : PHeckeKer) (hI : PIndex) (hSK : PStabK) : SHeckeFinite47 := by
  unfold SHeckeFinite47
  classical
  intro L _ _ hL k hk π hπ
  have hπ0 : π ≠ 0 := hπ.ne_zero
  have hCh' := hCh
  obtain ⟨_, hcm, _, _⟩ := hCh
  have hbdmap : ∀ {G H : Type} [Group G] [Group H] (f : G →* H) (w : Chn G (k + 1)), IsBd w →
      IsBd (cmap f (k + 1) w) := by
    intro G H _ _ f w hw
    obtain ⟨v, rfl⟩ := hw
    exact ⟨cmap f (k + 2) v, hcm G H f (k + 1) v⟩
  have hcycmap : ∀ {G H : Type} [Group G] [Group H] (f : G →* H) (w : Chn G (k + 1)), IsCyc w →
      IsCyc (cmap f (k + 1) w) := by
    intro G H _ _ f w hw
    unfold IsCyc at *
    rw [hcm, hw, map_zero]
  set n := 2 * (k + 1) + 4 with hn_def
  have hn1 : 1 ≤ n := by omega
  obtain ⟨s, hs1, hs2⟩ := hFin L hL n k
  have hfinn := (hI L n π hπ).1
  let P : invCoc L n k →ₗ[ℝ] (↥s → ℝ) :=
    { toFun := fun H z₀ => ev (toK L n) (H : (Fin (k + 2) → GK L n) → ℝ) 1 z₀.1
      map_add' := fun H H' => by
        funext z₀
        simp only [Submodule.coe_add, ev_fadd1, Pi.add_apply]
      map_smul' := fun c H => by
        funext z₀
        simp only [Submodule.coe_smul, ev_fsmul, Pi.smul_apply, smul_eq_mul, RingHom.id_apply] }
  let Q : invCoc L n k →ₗ[ℝ] (↥s → ℝ) :=
    { toFun := fun H z₀ => ev (toK L n) (hecke (toK L n) (MonoidHom.id (GK L n)) (qel L n π hπ0)
        (H : (Fin (k + 2) → GK L n) → ℝ)) 1 z₀.1
      map_add' := fun H H' => by
        funext z₀
        have h1 := (hF _ _ (toK L n) _ hfinn (k + 1) H H' 1 H.2.1).2.2
        rw [one_smul, one_smul] at h1
        simp only [Submodule.coe_add, h1, ev_fadd1, Pi.add_apply]
      map_smul' := fun c H => by
        funext z₀
        have h1 := (hF _ _ (toK L n) _ hfinn (k + 1) 0 H c (fun _ _ => rfl)).2.2
        rw [zero_add, hecke_zero, zero_add] at h1
        simp only [Submodule.coe_smul, h1, ev_fsmul, Pi.smul_apply, smul_eq_mul, RingHom.id_apply] }
  have hPQ : ∀ H, P H = 0 → Q H = 0 := by
    intro H hH
    have hvan : ∀ z : Chn (Gm L n) (k + 1), IsCyc z → ev (toK L n) (H : (Fin (k + 2) → GK L n) → ℝ) 1 z = 0 := by
      obtain ⟨E, hE⟩ := exists_linearMap_eq_ev (toK L n) (H : (Fin (k + 2) → GK L n) → ℝ) (1 : GK L n)
      intro z hz
      rw [← hE]
      refine eq_zero_of_mem_all_maximalIdeal_pow E s hs2 (fun w hw => ?_) (fun w hw => ?_) z hz
      · rw [hE]
        exact (hEv _ _ _ (toK L n) k _ H.2.1 H.2.2).1 1 w hw
      · rw [hE]
        exact congrFun hH ⟨w, hw⟩
    funext z₀
    exact hK hEv _ _ (toK L n) (toK_injective L n) _ hfinn k _ H.2.1 H.2.2 hvan z₀.1 (hs1 _ z₀.2)
  obtain ⟨K, hK0, hKb⟩ := lift_map_comp P Q hPQ
  set i0 : ℝ := ((Gq (toK L n) (qel L n π hπ0)).index : ℝ) with hi0_def
  refine ⟨n + 1 + ⌈5 * (1 + K) * i0⌉₊, fun N hN => ?_⟩
  obtain ⟨r, rfl⟩ : ∃ r, N = n + r := ⟨N - n, by omega⟩
  let f := cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1)
  refine ⟨s.image f, ?_, ?_⟩
  · intro w hw
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hw
    exact hcycmap _ _ (hs1 _ hv)
  intro F hFi hFc hdec z hz
  have hr : 1 ≤ r := by omega
  have hfinN := hI L (n + r) π hπ
  set iN : ℝ := ((Gq (toK L (n + r)) (qel L (n + r) π hπ0)).index : ℝ) with hiN_def
  have hiN : ((n + r : ℕ) : ℝ) ≤ iN := Nat.cast_le.2 hfinN.2
  have hi0 : 0 ≤ i0 := Nat.cast_nonneg _
  have hceil : 5 * (1 + K) * i0 ≤ iN := by
    have h1 := Nat.le_ceil (5 * (1 + K) * i0)
    have h2 : ((n + 1 + ⌈5 * (1 + K) * i0⌉₊ : ℕ) : ℝ) ≤ ((n + r : ℕ) : ℝ) := by exact_mod_cast hN
    push_cast at h2 hiN
    linarith
  have hiNpos : 0 < iN := by
    have h1 : (1 : ℝ) ≤ ((n + r : ℕ) : ℝ) := by exact_mod_cast (by omega : 1 ≤ n + r)
    linarith
  set a : ℝ := i0 / iN with ha
  have ha0 : 0 ≤ a := div_nonneg hi0 hiNpos.le
  have haK : a * (1 + K) ≤ 1 / 5 := by
    rw [ha, div_mul_eq_mul_div, div_le_iff₀ hiNpos]
    linarith
  have ha15 : a ≤ 1 / 5 := by nlinarith [mul_nonneg ha0 hK0]
  set TN : ((Fin (k + 2) → GK L (n + r)) → ℝ) → ((Fin (k + 2) → GK L (n + r)) → ℝ) := hecke (toK L (n + r)) (MonoidHom.id (GK L (n + r))) (qel L (n + r) π hπ0) with hTN
  have hit : ∀ j, Inv (toK L (n + r)) (TN^[j] F) ∧ dC (TN^[j] F) = 0 := by
    intro j
    induction j with
    | zero => exact ⟨hFi, hFc⟩
    | succ j ih =>
      rw [Function.iterate_succ_apply']
      obtain ⟨h1, h2, _⟩ := hF _ _ (toK L (n + r)) _ hfinN.1 (k + 1) (TN^[j] F) 0 0 ih.1
      refine ⟨h1, ?_⟩
      rw [h2, ih.2, hecke_zero]
  have hc := (hSK L π hπ0 n r hn1).1
  have hres : ∀ G : (Fin (k + 2) → GK L (n + r)) → ℝ, Inv (toK L (n + r)) G → dC G = 0 →
      resF L n r k G ∈ invCoc L n k := by
    intro G hGi hGc
    refine ⟨fun g y => ?_, ?_⟩
    · have h1 := hGi (stab (𝓞 L) n (n + r) (Nat.le_add_right n r) g)
        (fun j => stab L n (n + r) (Nat.le_add_right n r) (y j))
      rw [hc] at h1
      simp only [resF, smul_eq_mul, map_mul] at h1 ⊢
      exact h1
    · funext y
      have h1 := congrFun hGc (fun j => stab L n (n + r) (Nat.le_add_right n r) (y j))
      simpa [dC, resF] using h1
  let x : ℕ → (↥s → ℝ) := fun j z₀ => ev (toK L (n + r)) (TN^[j] F) 1
    (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1) z₀.1)
  have hstep : ∀ j, (4 / 5 : ℝ) * ‖x j‖ ≤ ‖x (j + 1)‖ := by
    intro j
    have hy : ‖Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩‖ ≤ K * ‖x j‖ := by
      have hP : P ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩ = x j :=
        funext fun z₀ => ev_resF_eq_ev_cmap_stab L n r k hc _ z₀.1
      rw [← hP]
      exact hKb _
    have hxy : (1 - a) • x j = x (j + 1) - a • Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩ := by
      funext z₀
      have h1' : x (j + 1) z₀ = (1 - a) * x j z₀ +
          a * Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩ z₀ := by
        have h1 := hKey hCh' hEv hAff L hL k hk π hπ n r hn1 hr (TN^[j] F) (hit j).1 (hit j).2 z₀.1
          (hs1 _ z₀.2)
        simp only [x, Function.iterate_succ_apply']
        exact h1
      simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul]
      rw [h1']
      ring
    have h1 := norm_sub_le (x (j + 1)) (a • Q ⟨resF L n r k (TN^[j] F), hres _ (hit j).1 (hit j).2⟩)
    rw [← hxy, norm_smul, norm_smul, Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg ha0,
      abs_of_nonneg (by linarith)] at h1
    have h2 := mul_le_mul_of_nonneg_left hy ha0
    have h3 := mul_le_mul_of_nonneg_right haK (norm_nonneg (x j))
    nlinarith [norm_nonneg (x j)]
  have hlow : ∀ j, (4 / 5 : ℝ) ^ j * ‖x 0‖ ≤ ‖x j‖ := by
    intro j
    induction j with
    | zero => simp
    | succ j ih =>
      rw [pow_succ]
      nlinarith [hstep j, ih]
  obtain ⟨D, hD, hdecD⟩ := hdec
  have hup : ∀ j : ℕ, ∃ t : ℕ, j ≤ t ∧ ‖x t‖ ≤ D * (3 / 5 : ℝ) ^ t := by
    intro j
    obtain ⟨t, hjt, ht⟩ := hdecD j
    refine ⟨t, hjt, (pi_norm_le_iff_of_nonneg (by positivity)).2 ?_⟩
    intro z₀
    rw [Real.norm_eq_abs]
    exact ht _ (Finset.mem_image.mpr ⟨z₀.1, z₀.2, rfl⟩)
  have hx0 : ‖x 0‖ = 0 := by
    have hb : ∀ j, ‖x 0‖ ≤ D * (3 / 4 : ℝ) ^ j := by
      intro j
      obtain ⟨t, hjt, ht⟩ := hup j
      have h1 := (hlow t).trans ht
      have hp : (0 : ℝ) < (4 / 5) ^ t := by positivity
      have h2 : (3 / 5 : ℝ) ^ t = (3 / 4) ^ t * (4 / 5) ^ t := by rw [← mul_pow]; norm_num
      rw [h2] at h1
      have h3 : (4 / 5 : ℝ) ^ t * ‖x 0‖ ≤ (4 / 5 : ℝ) ^ t * (D * (3 / 4) ^ t) := by linarith
      exact (le_of_mul_le_mul_left h3 hp).trans
        (mul_le_mul_of_nonneg_left (pow_le_pow_right_of_le_one (by norm_num) (by norm_num) hjt) hD)
    have ht : Filter.Tendsto (fun j : ℕ => D * (3 / 4 : ℝ) ^ j) Filter.atTop (nhds 0) := by
      simpa using (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : (0 : ℝ) ≤ 3 / 4)
        (by norm_num)).const_mul D
    exact le_antisymm (ge_of_tendsto' ht hb) (norm_nonneg _)
  have hx0' : ∀ z₀ ∈ s, ev (toK L (n + r)) F 1
      (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1) z₀) = 0 := by
    intro z₀ hz₀
    exact congrFun (norm_eq_zero.1 hx0) ⟨z₀, hz₀⟩
  obtain ⟨E, hE⟩ := exists_linearMap_eq_ev (toK L (n + r)) F (1 : GK L (n + r))
  have hall := eq_zero_of_mem_all_maximalIdeal_pow (E.comp (cmap (stab (𝓞 L) n (n + r) (Nat.le_add_right n r)) (k + 1))) s hs2
    (fun w hw => by
      rw [LinearMap.comp_apply, hE]
      exact (hEv _ _ _ _ k F hFi hFc).1 1 _ (hbdmap _ w hw))
    (fun w hw => by
      rw [LinearMap.comp_apply, hE]
      exact hx0' w hw)
  obtain ⟨z₀, hz₀, hb⟩ := (hSt (𝓞 L) k n (n + r) (Nat.le_add_right n r) (le_refl _)).2 z hz
  have h1 := (hEv _ _ _ _ k F hFi hFc).1 1 _ hb
  have h2 := hall z₀ hz₀
  rw [← hE, map_sub] at h1
  rw [LinearMap.comp_apply] at h2
  rw [← hE]
  linarith


end AffineStabilizerVanishing

open AffineStabilizerVanishing

theorem sHeckeFinite47 : SHeckeFinite47 := by
  first
  | (rh_reduce 2 using [AffineStabilizerVanishing.assemble47]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact assemble47 sChain sEv sStab sFin sAff (pKey (pTransfer pCobSub pEvDC))
      pHeckeFormal (pHeckeKer (pTransfer pCobSub pEvDC) pEvDC) pIndex pStabK


end PositivityTheory.KB
end

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL

namespace PositivityTheory.KB.JoinReconstruction

theorem lz_neg48 {L : Type} [Field L] [NumberField L] {N : ℕ}
    (d : Dom L N) {f : Gp L N → ℝ} (hf : Lz d f) : Lz d (fun x => -f x) := by
  obtain ⟨hc, he, hs, hi, h0⟩ := hf
  refine ⟨hc.neg, fun γ x => by rw [he], fun s x => by rw [hs], ?_, ?_⟩
  · simpa only [neg_sq] using hi
  · rw [integral_neg, h0, neg_zero]

theorem lem_bound48 (hGap : SGap) (hLoc : SLoc) (L : Type) [Field L] [NumberField L] (hC : IsTotallyComplex L)
    (π : 𝓞 L) (hπ : Prime π) (hπ25 : 25 ≤ Ideal.absNorm (Ideal.span {π})) (N k : ℕ) (h3N : 3 ≤ N)
    (d : Dom L N) (ω₀ : Form (HS L N) (k + 1)) (hω₀G : Good ω₀) (hω₀γ : ∀ γ, FInv ω₀ (emb L N γ))
    (hω₀s : ∀ s, FInv ω₀ (scal L N s)) (hLz0 : ∀ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)), StrictMono v →
      Lz d (fun x => fr ω₀ x (fun i => Module.finBasis ℝ (HS L N) (v i))))
    (z : Chn (Gm L N) (k + 1)) (hz : IsCyc z) :
    ∃ C : ℝ, ∀ r : ℕ, |ev (toK L N) ((hecke (toK L N) (MonoidHom.id (GK L N)) (qel L N π hπ.ne_zero))^[r]
      (fun y => intP ω₀ fun j => toP L N (y j) • one L N)) 1 z| ≤ C * (3 / 5 : ℝ) ^ r := by
  obtain ⟨K, hK0, hK⟩ := lem_nrm (L := L) (N := N) k
  obtain ⟨Cz, hCz⟩ := hLoc L N k (by omega) d z hz
  obtain ⟨S0, hS0⟩ : ∃ S0, S0 = ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
      ∫ x in d.D, fr ω₀ (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ := ⟨_, rfl⟩
  refine ⟨|Cz| * √(K * S0), fun r => ?_⟩
  rw [ev_toK _ _ (hecke_iter (qel L N π hπ.ne_zero) hω₀G.1 r) z]
  obtain ⟨ωr, hωr⟩ : ∃ ωr, ωr = (Hk (qel L N π hπ.ne_zero))^[r] ω₀ := ⟨_, rfl⟩
  rw [← hωr]
  obtain ⟨hrG, hrγ, hrs⟩ := Hk_iter_props (qel L N π hπ.ne_zero) hω₀G hω₀γ hω₀s r
  rw [← hωr] at hrG hrγ hrs
  have hLzr : ∀ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
      Lz d (fun x => fr ωr x fun i => Module.finBasis ℝ (HS L N) (v i)) ∧
      ∫ x in d.D, fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ ≤
        ((3 / 5 : ℝ) ^ 2) ^ r * ∫ x in d.D, fr ω₀ (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ :=
    fun v => by
      classical
      by_cases hv : Function.Injective v
      · let σ := Tuple.sort v
        let w := v ∘ σ
        have hwi : Function.Injective w := hv.comp σ.injective
        have hw : StrictMono w := fun i j hij =>
          lt_of_le_of_ne ((Tuple.monotone_sort v) hij.le) (hwi.ne hij.ne)
        have h := lem_gap hGap hC π hπ hπ25 h3N d _ (hLz0 w hw) r
        rw [← comp_Hk_iter, ← hωr] at h
        have hp (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
            fr ω x (fun i => Module.finBasis ℝ (HS L N) (w i)) =
              Equiv.Perm.sign σ • fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) := by
          simpa only [w, Function.comp_def] using
            (fr ω x).toAlternatingMap.map_perm (fun i => Module.finBasis ℝ (HS L N) (v i)) σ
        rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with hsign | hsign
        · have he (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
              fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) =
                fr ω x (fun i => Module.finBasis ℝ (HS L N) (w i)) := by
            simpa [hsign] using (hp ω x).symm
          simpa only [he] using h
        · have he (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
              fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) =
                -fr ω x (fun i => Module.finBasis ℝ (HS L N) (w i)) := by
            have hh := hp ω x
            simp [hsign, Units.smul_def] at hh
            linarith
          refine ⟨?_, ?_⟩
          · simpa only [he] using lz_neg48 d h.1
          · simpa only [he, neg_sq] using h.2
      · have hzero (ω : Form (HS L N) (k + 1)) (x : Gp L N) :
            fr ω x (fun i => Module.finBasis ℝ (HS L N) (v i)) = 0 := by
          apply ContinuousAlternatingMap.map_eq_zero_of_not_injective
          intro hi
          exact hv (fun i j hij => hi (congrArg (Module.finBasis ℝ (HS L N)) hij))
        simp [hzero, Lz]
  have hsumint : Integrable (fun x => K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
      fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2) (d.μ.restrict d.D) :=
    (integrable_finsetSum _ fun v _ => (hLzr v).1.2.2.2.1).const_mul _
  have hint_r : IntegrableOn (fun x => ‖fr ωr (ofS L N x)‖ ^ 2) d.D d.μ :=
    Integrable.mono' hsumint ((lem_meas d hrG.1).norm.pow 2) (Filter.Eventually.of_forall fun x => by
      show ‖‖fr ωr (ofS L N x)‖ ^ 2‖ ≤ _
      rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]; exact hK _)
  have hIr : ∫ x in d.D, ‖fr ωr (ofS L N x)‖ ^ 2 ∂d.μ ≤ ((3 / 5 : ℝ) ^ 2) ^ r * (K * S0) := by
    calc ∫ x in d.D, ‖fr ωr (ofS L N x)‖ ^ 2 ∂d.μ
        ≤ ∫ x in d.D, K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
            fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ :=
          integral_mono hint_r hsumint fun x => hK _
      _ = K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)),
            ∫ x in d.D, fr ωr (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ := by
          rw [integral_const_mul, integral_finsetSum _ fun v _ => (hLzr v).1.2.2.2.1]
      _ ≤ K * ∑ v : Fin (k + 1) → Fin (Module.finrank ℝ (HS L N)), ((3 / 5 : ℝ) ^ 2) ^ r *
            ∫ x in d.D, fr ω₀ (ofS L N x) (fun i => Module.finBasis ℝ (HS L N) (v i)) ^ 2 ∂d.μ :=
          mul_le_mul_of_nonneg_left (Finset.sum_le_sum fun v _ => (hLzr v).2) hK0
      _ = ((3 / 5 : ℝ) ^ 2) ^ r * (K * S0) := by rw [hS0, ← Finset.mul_sum]; ring
  have hsq : √(((3 / 5 : ℝ) ^ 2) ^ r * (K * S0)) = (3 / 5 : ℝ) ^ r * √(K * S0) := by
    rw [← pow_mul, mul_comm 2 r, pow_mul, Real.sqrt_mul (sq_nonneg _), Real.sqrt_sq (by positivity)]
  calc |ev (emb L N) (intP ωr) (one L N) z|
      ≤ Cz * √(∫ x in d.D, ‖fr ωr (ofS L N x)‖ ^ 2 ∂d.μ) := hCz _ hrG hrγ hrs hint_r
    _ ≤ |Cz| * √(((3 / 5 : ℝ) ^ 2) ^ r * (K * S0)) :=
        mul_le_mul (le_abs_self _) (Real.sqrt_le_sqrt hIr) (Real.sqrt_nonneg _) (abs_nonneg _)
    _ = |Cz| * √(K * S0) * (3 / 5 : ℝ) ^ r := by rw [hsq]; ring


theorem key49 (hPrime : SPrime) (hHecke : SHeckeFinite47) (hHt : SHt) (hPU : SPU) (hMom : SMom) (hWhit : SWhit)
    (hCen : SCen) (hGap : SGap) (hLoc : SLoc) (hMean : SMean) (hGood : SInvGood46) : SSurj := by
  intro L _ _ hC k hkr n₀
  obtain ⟨π, hπ, hπ25⟩ := hPrime L
  obtain ⟨a, hPUa⟩ := hPU L hC
  obtain ⟨N₀, hN₀⟩ := hHecke L hC k hkr π hπ
  obtain ⟨N₁, hN₁⟩ := hMom L hC (2 * (a * (k + 1)))
  obtain ⟨N, hN⟩ : ∃ N, N = max (max N₀ N₁) (max n₀ 3) := ⟨_, rfl⟩
  have hN0 : N₀ ≤ N := by rw [hN]; exact (le_max_left N₀ N₁).trans (le_max_left _ _)
  have hN1 : N₁ ≤ N := by rw [hN]; exact (le_max_right N₀ N₁).trans (le_max_left _ _)
  have hn₀ : n₀ ≤ N := by rw [hN]; exact (le_max_left n₀ 3).trans (le_max_right _ _)
  have h3N : 3 ≤ N := by rw [hN]; exact (le_max_right n₀ 3).trans (le_max_right _ _)
  have h1N : 1 ≤ N := by omega
  refine ⟨N, hn₀, fun c hcI hcd => ?_⟩
  obtain ⟨d, hd⟩ := hN₁ N hN1
  obtain ⟨ω', hω'G, hω'γ, hω's, hω'z, K, hK⟩ :=
    lem_form hHt hPU hWhit hCen L hC k a N h1N (hPUa N h1N) c hcI hcd
  obtain ⟨_, _, ⟨c0, hc0, hc0le⟩, _⟩ := hHt L hC N h1N
  have hht0 : ∀ x, 0 ≤ ht x := fun x => hc0.le.trans (hc0le x)
  haveI : IsFiniteMeasure (d.μ.restrict d.D) := isFiniteMeasure_restrict.2 d.fin.ne
  have hsq' : IntegrableOn (fun x => ‖fr ω' (ofS L N x)‖ ^ 2) d.D d.μ := by
    refine Integrable.mono' (hd.const_mul (K ^ 2)) ((lem_meas d hω'G.1).norm.pow 2)
      (Filter.Eventually.of_forall fun x => ?_)
    show ‖‖fr ω' (ofS L N x)‖ ^ 2‖ ≤ K ^ 2 * ht (ofS L N x) ^ (2 * (a * (k + 1)))
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), mul_comm 2 (a * (k + 1)), pow_mul, ← mul_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hK _) 2
  have hint' : IntegrableOn (fun x => fr ω' (ofS L N x)) d.D d.μ := by
    refine Integrable.mono' (hsq'.add (integrable_const (1 : ℝ))) (lem_meas d hω'G.1)
      (Filter.Eventually.of_forall fun x => ?_)
    show ‖fr ω' (ofS L N x)‖ ≤ ‖fr ω' (ofS L N x)‖ ^ 2 + 1
    nlinarith [sq_nonneg (‖fr ω' (ofS L N x)‖ - 1)]
  obtain ⟨ωb, hωbI, hωbfr⟩ := hMean L N (k + 1) h1N d ω' hω'G.1 hω'γ hω's hint'
  have hωbG : Good ωb := hGood L N k ωb hωbI
  have hγ0 : ∀ γ, FInv (ω' - ωb) (emb L N γ) := fun γ => finv_sub (hω'γ γ) (hωbI _)
  have hs0 : ∀ s, FInv (ω' - ωb) (scal L N s) := fun s => finv_sub (hω's s) (hωbI _)
  have hLz0 := lem_Lz d hω'G.1 hωbG.1 hγ0 hs0 hωbfr hint' hsq'
  have e2 : intP (ω' - ωb) = fun y => intP ω' y - intP ωb y := funext (intP_sub hω'G.1 hωbG.1)
  have hG0 : Good (ω' - ωb) := by
    refine ⟨hω'G.1.sub hωbG.1, ?_⟩
    rw [e2, dC_sub, hω'G.2, hωbG.2]
    funext y
    simp
  have hFI : Inv (toK L N) (fun y : Fin (k + 2) → GK L N => intP (ω' - ωb) fun j => toP L N (y j) • one L N) :=
    fun γ y => by
      show (intP (ω' - ωb) fun j => toP L N (toK L N γ • y j) • one L N) =
        intP (ω' - ωb) fun j => toP L N (y j) • one L N
      simp only [smul_eq_mul, map_mul, mul_smul]
      exact intP_inv (hγ0 γ) _
  have hFd : dC (fun y : Fin (k + 2) → GK L N => intP (ω' - ωb) fun j => toP L N (y j) • one L N) = 0 := by
    funext y
    have h4 := congrFun hG0.2 (fun j => toP L N (y j) • one L N)
    simp only [dC, Pi.zero_apply] at h4 ⊢
    exact h4
  obtain ⟨s, hs, hTest⟩ := hN₀ N hN0
  have hF0 := hTest _ hFI hFd (finite_decay47 s _ fun z hz =>
    lem_bound48 hGap hLoc L hC π hπ hπ25 N k h3N d (ω' - ωb) hG0 hγ0 hs0 (fun v _ => hLz0 _) z (hs z hz))
  refine ⟨ωb, hωbI, fun z hz => ?_⟩
  have h5 := hF0 z hz
  rw [ev_toK _ (intP (ω' - ωb)) (fun y => rfl) z, e2, ev_sub] at h5
  rw [← hω'z z hz]
  linarith


end PositivityTheory.KB.JoinReconstruction

namespace PositivityTheory.KB


theorem sSurj49 : SSurj :=
  JoinReconstruction.key49 sPrime_of sHeckeFinite47 sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of sInvGood46

theorem bStarOdd49 : BStarOdd :=
  sBStarOdd_of45 sChain sSep' sBridge sStab sSurj49 (sWtOdd_source45 sStokes_of)



private theorem rank_heq45 (R : Type) [CommRing R] (m : ℕ) {X : Type} {a b : ℕ} (e : a = b)
    (f : X → grpH (GL (Fin a) R) m) (g : X → grpH (GL (Fin b) R) m) (h : ∀ x, HEq (f x) (g x)) :
    Module.rank ℤ (Submodule.span ℤ (Set.range f)) = Module.rank ℤ (Submodule.span ℤ (Set.range g)) := by
  subst e
  obtain rfl : f = g := funext fun x => eq_of_heq (h x)
  rfl

theorem bOdd_zk49 : UpperTheory.V.ZK.BOdd := fun L _ _ hL k hk hr l hl n hn =>
  (rank_heq45 _ _ (lev_zk l n k) _ _ fun x => zSeq_zk _ hl x k).le.trans (bStarOdd49 L hL k hk hr l hl n hn)


end PositivityTheory.KB

theorem UpperTheory.V.ZK.bOdd49 : UpperTheory.V.ZK.BOdd := PositivityTheory.KB.bOdd_zk49
end

noncomputable section
open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK
namespace RHStructure49
theorem actual_few49 : SFew :=
  LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
    (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc) sPhi
    (sClassOf sChain sPrism sPrismMul sZc LateralTheory.Fin.SRel.intersectionNumber_baseChange sEta
      LateralTheory.Fin.SStein.intersectionNumber_baseChange)
    (sUpperOf sChain UpperTheory.V.ZK.bOdd49) LateralTheory.Fin.SDetect.intersectionNumber_baseChange
end RHStructure49
end

-- Engine calls for the actual original/reduced declarations, not the RH root.
rh_prune PositivityTheory.KB.JoinReconstruction.key as RHStructure49NativeKeyPruned
rh_scan PositivityTheory.KB.JoinReconstruction.key limit 2000
rh_scan PositivityTheory.KB.JoinReconstruction.key49 limit 2000
rh_scan UpperTheory.V.ZK.bOdd49 limit 2000
rh_scan RHStructure49.actual_few49 limit 2000
#print axioms PositivityTheory.KB.JoinReconstruction.key
#print axioms PositivityTheory.KB.JoinReconstruction.key49
#print axioms UpperTheory.V.ZK.bOdd
#print axioms UpperTheory.V.ZK.bOdd49
#print axioms RHStructure49.actual_few49
