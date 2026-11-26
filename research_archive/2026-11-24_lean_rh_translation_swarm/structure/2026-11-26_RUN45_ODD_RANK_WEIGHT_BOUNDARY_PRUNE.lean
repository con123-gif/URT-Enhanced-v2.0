import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN45, 26 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED LEAN NOT COMPILED.
Actual upstream bStarOdd rank supplier (RUN44 eadcc941), not another restatement of RH.
For a weight-j linear functional a, the native chain filter yields exactly
  a(zc_t) = product_{i=0}^{t-1}(l^j-l^(i+2)) a(z).
The induction only uses cycle preservation, stabilization and block weight;
it NEVER uses the WSys boundary-vanishing clause. In sBStarOdd_of, the two
uses of WSys are this filter and stabilization, never boundary vanishing.
Thus replace WSys (three clauses) by WSys45 (last two); the higher weight
j=2,...,k+1 is still killed by i=j-2, and the full rank estimate follows
with the SAME regulator, same N, same cycles and same witnesses.
The independent theta kernel/boundary equivalence, separation, stability,
surjectivity and all invariance conditions are retained. No claim that
arbitrary WSys45 functionals descend to homology; this is not needed here.
Then the native swtOdd construction no longer needs SEv: its only uses
were exactly the two Aev_bd calls establishing the removed clauses.
The wrapper sWtOdd_of also visibly ignores SChain and SPsi. Propagate
the actual direct construction through bStarOdd45 and bOdd_zk45.
SChain remains needed in the rank argument; SEv, SPsi may remain in
other branches and in the transitive closure. This is a local dependency
deletion candidate, not a global axiom deletion or new rank theorem.
Original graph: BOdd -> bOdd_zk -> bStarOdd -> sBStarOdd_of -> SWtOdd
-> sWtOdd_of -> swtOdd -> Aev_bd -> SEv; sWtOdd_of also has SChain/SPsi
binder edges; rank -> wsys_zc -> WSys. Reduced graph: bOdd45 -> bStarOdd45
-> sBStarOdd_of45 -> SWtOdd45 -> swtOdd45 -> stabilization/block/FFT;
rank -> wsys_zc45 -> WSys45. All unaffected edges, original supplier,
SSurj, theta, SStab, class count, prior cofinal and quotient obligations
retained. Source-visible graph only, not kernel extracted. Cache by
source/toolchain,L,k,l,n,N,omega,z,a,actual witness,role. Backtrack to
original on failure. No imported claimed RH root or new axioms.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/KTheoryStability/ReductionBoundsTorsion/:
SBStar.lean 2e50748a0dcca2c8701f911e6107c9f3819c6952
SBStarOdd.lean 3d2dd76f9cec2a817ba0788135969b561c1555fc
TensorPrimeModuli/SBStarOf.lean da55f5bde89d1715e3f606bc5c510d83198a37c9
OddSpanRank/SBStarOddOf.lean 565b92ed21384bb9eb1352d653a40cef0bd006cd
OddWeightCycles/AevApply.lean 6cf2f0d9ccaabb65bb689aa1493c618ee452e344
OddWeightCycles/SWtOddOf.lean 42ffedb89f513924436c76f296101c5bc1476efe
FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa
TorsionIntegers/Bridge.lean 7ff84d3d02c1f4cfb386505d590e2eb4e0c96f8c
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, SWARM, HANDOFF, AGENTS/state consulted.
Peer recent commits indexed through 06c6e652; RUN44, e827b4fe, ba04fa11 read.
Local lean/lake/elan unavailable. Baseline status JSON actually fetched
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 7da354941e402b6f8b364ed03d8c5c82d27b7717
(runs 45577239749 and 45576756833), old pass only. No new native replay.
No URT used: exact proof-body cancellation.
Executed 849 fail-on-error source transformation and exact scalar assertions
(624 killed weights, 182 outside-weight negative controls; remaining
assertions source checks). Scalar reproduction: for l=1..8,k=0..12,j=1..k+2,
compute product by exact integer arithmetic; assert zero for 2<=j<=k+1
and nonzero outside this interval if l>1.
Source transformations require unique exact snippets and reversible replacements
(except explicit deleted clauses). First source fetch of TorsionIntegers/FinalOdd.lean
returned 404; corrected to FinalOdd.lean. First caller assertion omitted suffix
_of on sStokes_of; corrected against actual source and reran.
No tests on actual class groups, no new axiom evidence, not queued.
RESUME HERE: compile this candidate with the pinned warmed runner, check
original/reduced axiom ledgers and native dependency scans, then substitute
bOdd45 in actual sUpperOf / RUN44 canonical supplier only after replay.
Next mathematical task: reduce SSurj via actual JoinReconstruction.key.
HANDOFF TO kernel, audit, integration, arithmetic. RH OPEN.
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

theorem bStarOdd45 : BStarOdd := by
  have hW := sWtOdd_source45 sStokes_of
  have hSurj := sSurj_of sPrime_of sHecke sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of sInv
  first
  | (rh_reduce 2 using [sBStarOdd_of45]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact sBStarOdd_of45 sChain sSep' sBridge sStab hSurj hW

private theorem rank_heq45 (R : Type) [CommRing R] (m : ℕ) {X : Type} {a b : ℕ} (e : a = b)
    (f : X → grpH (GL (Fin a) R) m) (g : X → grpH (GL (Fin b) R) m) (h : ∀ x, HEq (f x) (g x)) :
    Module.rank ℤ (Submodule.span ℤ (Set.range f)) = Module.rank ℤ (Submodule.span ℤ (Set.range g)) := by
  subst e
  obtain rfl : f = g := funext fun x => eq_of_heq (h x)
  rfl

theorem bOdd_zk45 : UpperTheory.V.ZK.BOdd := fun L _ _ hL k hk hr l hl n hn =>
  (rank_heq45 _ _ (lev_zk l n k) _ _ fun x => zSeq_zk _ hl x k).le.trans (bStarOdd45 L hL k hk hr l hl n hn)

end PositivityTheory.KB
theorem UpperTheory.V.ZK.bOdd45 : UpperTheory.V.ZK.BOdd := PositivityTheory.KB.bOdd_zk45
end

rh_prune PositivityTheory.KB.sWtOdd_of as RHStructure45WtPruned
rh_scan PositivityTheory.KB.sWtOdd_of limit 2000
rh_scan PositivityTheory.KB.bStarOdd45 limit 2000
rh_scan UpperTheory.V.ZK.bOdd45 limit 2000
#print axioms PositivityTheory.KB.bStarOdd
#print axioms PositivityTheory.KB.bStarOdd45
#print axioms UpperTheory.V.ZK.bOdd
#print axioms UpperTheory.V.ZK.bOdd45
