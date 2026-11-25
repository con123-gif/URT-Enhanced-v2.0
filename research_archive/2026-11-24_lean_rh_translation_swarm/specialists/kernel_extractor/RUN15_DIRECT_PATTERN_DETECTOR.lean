import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11 RUN15, 25 Nov 2026 21 UTC. SOURCE-MATCHED / PREPARED Lean,
NOT COMPILED. RH OPEN. Direct pattern detector replaces the intermediate
SWtOdd producer at the actual BStarOdd -> BOdd -> LemmaK caller.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, SWARM, HANDOFF,
EXPANSION, AGENTS, state and continuity inspected. Prior RUN14
4ff04116; latest integration 2785c414 (shared Sha witness), lane12
46e9230b (Type I frame), lane14 33888226 (direct CountVs Sha), editor
58d43b7e (gauge normalization) inspected. No duplicate Sha adapter.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Exact native Aev_stab and Aev_blk hold on ALL chains, not just cycles.
For any pattern x with j=ncyc(x.1), the native zc recurrence yields

 Aev(lev(l,n,t),x)(zc_t) =
   [prod_{i<t}(l^j-l^(i+2))] Aev(n,x)(z).

No boundary-vanishing argument is needed here, even for the individual
pattern maps, and no hypothesis SChain is needed for this scalar identity.
For k even, q=k+1, all patterns with j != 1 have 2<=j<=q by WCyc;
their product vanishes at t=k. By linearity they vanish on the actual
projected cycle span, and by Aev_stab on its stabilization. Each
remaining one-cycle pattern is proportional to a single place's sum
of the real and imaginary alternating trace patterns by native WOneOdd.
Use FFT at the actual stabilization N, AGood/SStokes for legitimate
integral linearity, and Aev_comb. If the fixed place detectors vanish
on the projected span, every invariant form evaluates to zero there.
This directly supplies OddDetect without proving full SWtOdd, its
boundary vanishing SEv, global weight systems, WRot, or a decomposition
of higher-weight evaluations. SEv and WRot removed as EXPLICIT
requirements of this detector only; SChain still used by rank, and
transitive uses of SEv or WRot in retained suppliers not ruled out.
No division by l^1-l^j, so l=1 and k=0 are included.

Original route: lemmaK_litN_alt -> bOdd -> bOdd_zk -> bStarOdd ->
sBStarOdd_of + sWtOdd_of -> swtOdd -> Aev_bd, Aev_stab, Aev_blk,
Aev_comb, FFT, WOneOdd, WRot, WCyc and all structural/type/value edges.
Candidate: lemmaK15 -> bOdd15 -> bStarOdd15 -> rank_of_detect15
(RUN14 consumer copied unchanged except identifiers) + direct_detect15
-> aev_zc15, Aev_stab, Aev_blk, Aev_comb, FFT, WOneOdd, WCyc,
AGood/SStokes, WInv, transport. Same SSurj, SChain, SSep, SBridge,
SStab and host/degree constraints. No global deletion until native
role and axiom evidence and actual caller replay. Context cache key:
pin, toolchain, L,k,l,n, same stabilization N and hMN, pattern,
cycle span and coefficient expansion at N. Do not merge different
fields or stabilization witnesses. Backtrack to RUN14 or native bOdd
if any comparison fails. Remaining uniform SNum/Sha, torsion, CountI,
II, III, V, Vs, TopG/ASK and prime-window estimate not solved.

Source ledger (relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/KTheoryStability/ReductionBoundsTorsion/):
OddWeightCycles/AevApply.lean 6cf2f0d9ccaabb65bb689aa1493c618ee452e344
OddWeightCycles/Weights.lean fe47906524e522aba674e20db1c00bd6102812f9
OddWeightCycles/WOneOdd.lean 993d84f9ea44d44bd8543b4a79b9e2d075856485
PermutationSigns/Weights.lean 41d9a552a9433ac7a17fdb27f19cfca4eaae6901
TensorPrimeModuli/SBStarOf.lean da55f5bde89d1715e3f606bc5c510d83198a37c9
OddSpanRank/SBStarOddOf.lean 565b92ed21384bb9eb1352d653a40cef0bd006cd
FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa
Actual BOdd/KFinal pins 4a683e6c236327e51ab03bc84da83f6f1f0602cc,
9b26f8a76facea83b64788eaabdf30c492023644.
Executed connector JS: 27 pinned hash/anchor assertions; 245
integer recurrence/annihilation evaluations and 28 nonzero
weight-one controls (even k<=12, l=1..5, j=1..k+1).
These check the polynomial only, not Lean elaboration or the rank bound.
No local lean/lake. Read actual status.json for CI 45577239749 and
45576756833: returncode 0, baseline only. No new CI dispatch or axiom
results; commands below request fresh evidence. No URT claim.
To replay: compile this standalone overlay in pinned environment with
the three existing reduction-engine oleans in LEAN_PATH; no Main import.
RESUME HERE: batch replay RUN15 and shared Sha integration RUN40,
compare native and replacement axiom/type/value/constructor ledgers;
if valid substitute bOdd15 at integration's sha_of_bOdd40, then
inspect SNum uniform bound rather than add another downstream wrapper.
HANDOFF TO integration, dependency, audit, literature, acceleration.
-/

noncomputable section
open NumberField NumberField.InfinitePlace Matrix MeasureTheory UpperTheory.V.KT UpperTheory.V.KL
open scoped TensorProduct
namespace PositivityTheory.KB

def oddSpan15 (L : Type) [Field L] [NumberField L] (k l n : ℕ) (hl : 0 < l) :
    Submodule ℝ (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker :=
  Submodule.span ℝ {y | ∃ z0 : Chn (GL (Fin n) (𝓞 L)) (k + 1), IsCyc z0 ∧
    (y : Chn (GL (Fin (lev l n k)) (𝓞 L)) (k + 1)) = PrimeModuloFree.zc (𝓞 L) hl z0 k}

def OddDetect15 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L] (k : ℕ), Even k →
    ∀ (l : ℕ) (hl : 0 < l) (n : ℕ),
      ∃ τ : InfinitePlace L → (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker →ₗ[ℝ] ℝ,
        ∀ (N : ℕ) (hMN : lev l n k ≤ N) (ω : Form (HS L N) (k + 1)),
          (∀ g, FInv ω g) → ∀ z : oddSpan15 L k l n hl,
            (∀ w, τ w z.1 = 0) →
            ev (emb L N) (intP ω) (one L N)
              (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1) = 0


open PrimeModuloFree LargePrimeDiscriminant BlockInvariants BlockEvaluationBounds in
theorem aev_zc15 {L : Type} [Field L] [NumberField L]
    (hWP : WPad) (hWB : WBlk) (hWI : WInv)
    (hTS : TStab) (hTB : TBlk) (hPS : PStab) (hPB : PBlk)
    {k l n : ℕ} (hl : 0 < l) (x : Pat L (k + 1))
    (z : Chn (Gm L n) (k + 1)) :
    ∀ t, Aev (lev l n t) x (PrimeModuloFree.zc (𝓞 L) hl z t) =
      (∏ i ∈ Finset.range t, ((l : ℝ) ^ ncyc x.1 - (l : ℝ) ^ (i + 2))) * Aev n x z
  | 0 => by
    simp only [Finset.range_zero, Finset.prod_empty, one_mul]
    rfl
  | t + 1 => by
    have ih := aev_zc15 hWP hWB hWI hTS hTB hPS hPB hl x z t
    rw [Finset.prod_range_succ]
    change Aev (l * lev l n t) x
      (cmap (psi (𝓞 L) l (lev l n t)) (k + 1) (PrimeModuloFree.zc (𝓞 L) hl z t) -
       ((l : ℝ) ^ (t + 2)) • cmap (stab (𝓞 L) (lev l n t) (l * lev l n t)
         (Nat.le_mul_of_pos_left _ hl)) (k + 1) (PrimeModuloFree.zc (𝓞 L) hl z t)) = _
    rw [map_sub, map_smul, Aev_blk hWB hWI hTB hPB,
      Aev_stab hWP hWI hTS hPS, ih]
    simp only [smul_eq_mul]
    ring

open PrimeModuloFree LargePrimeDiscriminant BlockInvariants BlockEvaluationBounds in
theorem direct_detect15 (hS : SStokes) (hF : FFT) (hG : AGood)
    (hWP : WPad) (hWB : WBlk) (hWI : WInv) (hWC : WCyc)
    (hTS : TStab) (hTB : TBlk) (hPS : PStab) (hPB : PBlk)
    (hWO : WOneOdd) : OddDetect15 := by
  intro L _ _ k hk l hl n
  classical
  let τ (w : InfinitePlace L) (m : ℕ) : Chn (Gm L m) (k + 1) →ₗ[ℝ] ℝ :=
    Aev m ((finRotate (k + 1), fun _ => w, false) : Pat L (k + 1)) +
    Aev m ((finRotate (k + 1), fun _ => w, true) : Pat L (k + 1))
  refine ⟨fun w => (τ w (lev l n k)).comp
    (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker.subtype, ?_⟩
  intro N hMN ω hω z hTw
  have htN : ∀ w, τ w N
      (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1) = 0 := by
    intro w
    simp only [τ, LinearMap.add_apply]
    rw [Aev_stab hWP hWI hTS hPS, Aev_stab hWP hWI hTS hPS]
    exact hTw w
  have hzero : ∀ x : Pat L (k + 1), ncyc x.1 ≠ 1 →
      ∀ y ∈ oddSpan15 L k l n hl,
        Aev (lev l n k) x (y : Chn (Gm L (lev l n k)) (k + 1)) = 0 := by
    intro x hx y hy
    have hb := hWC (k + 1) x.1 (Nat.succ_pos k)
    have hj : 2 ≤ ncyc x.1 := by omega
    have hmax : ncyc x.1 ≤ k + 1 := by omega
    unfold oddSpan15 at hy
    induction hy using Submodule.span_induction with
    | mem y hy =>
      obtain ⟨z0, hz0, he⟩ := hy
      rw [he, aev_zc15 hWP hWB hWI hTS hTB hPS hPB hl x z0 k]
      apply mul_eq_zero_of_left
      apply Finset.prod_eq_zero (i := ncyc x.1 - 2)
      · rw [Finset.mem_range]; omega
      · rw [Nat.sub_add_cancel hj, sub_self]
    | zero => simp
    | add a b _ _ ha hb => simp [ha, hb]
    | smul r a _ ha => simp [ha]
  let zz := cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1
  have hpattern : ∀ x : Pat L (k + 1), Aev N x zz = 0 := by
    intro x
    by_cases hx : ncyc x.1 = 1
    · obtain ⟨r, w, hr⟩ := hWO L N (k + 1) x hk.add_one hx
      rw [Aev_comb hS hG hWI _ _ _ _ hr]
      have ht : Aev N ((finRotate (k + 1), fun _ => w, false) : Pat L (k + 1)) zz +
          Aev N ((finRotate (k + 1), fun _ => w, true) : Pat L (k + 1)) zz = 0 := htN w
      rw [ht, mul_zero]
    · change Aev N x (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1) = 0
      rw [Aev_stab hWP hWI hTS hPS]
      exact hzero x hx z.1 z.2
  obtain ⟨c, hc⟩ := hF L N (k + 1) _ (uInv_of hω)
  have hcont : ∀ x : Pat L (k + 1), ContinuousOn (ext (AT (N := N) x)) (Pos L N) :=
    fun x => (hG hS L N (k + 1) _ (fInv_ext (hWI L N (k + 1) x))).1
  have h1 : intP ω = fun p => ∑ x, c x * intP (ext (AT (N := N) x)) p := by
    rw [← intP_sum c _ hcont]
    apply intP_congr
    intro p hp
    rw [ext_uniq hω hp, hc, ext_sum]
  change ev (emb L N) (intP ω) (one L N) zz = 0
  rw [h1, ev_sum]
  simp only [← Aev_apply]
  exact Finset.sum_eq_zero fun x _ => by rw [hpattern x, mul_zero]

open PrimeModuloFree LargePrimeDiscriminant in
theorem rank_of_detect15 (hC : SChain) (hSep : SSep) (hBr : SBridge)
    (hStab : SStab) (hSurj : SSurj) (hD : OddDetect15) : BStarOdd := by
  intro L _ _ hTC k hk hkr l hl n hn
  haveI : IsTotallyComplex L := hTC
  obtain ⟨θ, hθs, hθ0, hθn⟩ := hBr k
  obtain ⟨τ, hτ⟩ := hD L k hk l hl n
  have hcard : Fintype.card (InfinitePlace L) = nrComplexPlaces L := by
    rw [card_eq_nrRealPlaces_add_nrComplexPlaces, IsTotallyComplex.nrRealPlaces_eq_zero, zero_add]
  have hM : 2 * (k + 1) + 4 ≤ lev l n k := le_trans hn (PrimeModuloFree.le_lev hl n k)
  let C := oddSpan15 L k l n hl
  calc _ ≤ ((Fintype.card (InfinitePlace L) : ℕ) : Cardinal) :=
        TwOdd.rank_span_le _ ((θ (GL (Fin (lev l n k)) (𝓞 L))).comp C.subtype)
          ((LinearMap.pi τ).comp C.subtype) ?_ ?_
    _ = _ := by rw [hcard]
  · intro z hT
    have hTw : ∀ w, τ w z.1 = 0 := fun w => congrFun hT w
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
    apply hcne
    rw [hω _ hz'c]
    exact hτ N hMN ω hωI z hTw
  · rintro _ ⟨x, rfl⟩
    obtain ⟨z0, hz0⟩ := hθs (GL (Fin n) (𝓞 L)) (1 ⊗ₜ x)
    refine ⟨⟨⟨PrimeModuloFree.zc (𝓞 L) hl z0.1 k,
      PrimeModuloFree.isCyc_zc hC (𝓞 L) hl (LinearMap.mem_ker.mp z0.2) k⟩,
      Submodule.subset_span ⟨z0.1, LinearMap.mem_ker.mp z0.2, rfl⟩⟩, ?_⟩
    exact PrimeModuloFree.th_zc θ hθn hC (𝓞 L) hl z0.1 (LinearMap.mem_ker.mp z0.2) x hz0 k


open BlockInvariants BlockEvaluationBounds in
theorem native_detector15 : OddDetect15 :=
  direct_detect15 sStokes_of (fft_of cplx sw1 sw2) aGood wPad
    weylTwoBlockMatrix wInv wCyc tStab tBlk pStab blockSum_preserves_cone wOneOdd

theorem bStarOdd15 : BStarOdd := by
  apply rank_of_detect15 sChain sSep' sBridge sStab
    (sSurj_of sPrime_of sHecke sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of sInv)
  first
  | (rh_reduce 2 using [native_detector15]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact native_detector15

private theorem rank_heq15 (R : Type) [CommRing R] (m : ℕ) {X : Type} {a b : ℕ} (e : a = b)
    (f : X → grpH (GL (Fin a) R) m) (g : X → grpH (GL (Fin b) R) m) (h : ∀ x, HEq (f x) (g x)) :
    Module.rank ℤ (Submodule.span ℤ (Set.range f)) = Module.rank ℤ (Submodule.span ℤ (Set.range g)) := by
  subst e
  obtain rfl : f = g := funext fun x => eq_of_heq (h x)
  rfl

theorem bOdd15 : UpperTheory.V.ZK.BOdd := fun L _ _ hL k hk hr l hl n hn =>
  (rank_heq15 _ _ (lev_zk l n k) _ _ fun x => zSeq_zk _ hl x k).le.trans
    (bStarOdd15 L hL k hk hr l hl n hn)

end PositivityTheory.KB

namespace UpperTheory.V.ZK
theorem lemmaK15 (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) :
    ∃ CK, LemmaK CK :=
  lemmaK_of_litN_alt hN PositivityTheory.KB.bOdd15
end UpperTheory.V.ZK


rh_scan PositivityTheory.KB.BlockEvaluationBounds.swtOdd limit 2000
rh_scan PositivityTheory.KB.direct_detect15 limit 2000
rh_scan PositivityTheory.KB.bStarOdd limit 2000
rh_scan PositivityTheory.KB.bStarOdd15 limit 2000
rh_scan UpperTheory.V.ZK.lemmaK_litN_alt limit 2000
rh_scan UpperTheory.V.ZK.lemmaK15 limit 2000
rh_prune PositivityTheory.KB.direct_detect15 as PositivityTheory.KB.DirectDetectPruned15
rh_prune PositivityTheory.KB.rank_of_detect15 as PositivityTheory.KB.RankDetectPruned15
#print axioms PositivityTheory.KB.BlockEvaluationBounds.swtOdd
#print axioms PositivityTheory.KB.aev_zc15
#print axioms PositivityTheory.KB.direct_detect15
#print axioms PositivityTheory.KB.bStarOdd15
#print axioms PositivityTheory.KB.bOdd15
#print axioms UpperTheory.V.ZK.lemmaK15
end
