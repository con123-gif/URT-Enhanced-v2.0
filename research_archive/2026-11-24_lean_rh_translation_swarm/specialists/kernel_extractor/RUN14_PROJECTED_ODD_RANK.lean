import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11 RUN14, 25 Nov 2026. SOURCE-MATCHED human reduction, PREPARED Lean,
NOT COMPILED. RH OPEN. One result: quotient the actual odd-rank consumer
by exact weight annihilation before demanding a decomposition of forms.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first, original mission
e0dc8f7f, SWARM, HANDOFF, EXPANSION, AGENTS, continuity, state and protocol
consulted. Latest integration f26f77b4, lane14 de1f67ea, audit c2aa33f2,
previous lane11 8eef4b8a, literature e669681c (paired torsion) checked.
Do not duplicate the paired torsion or alternative KBridge route.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Actual source route: vwin_of_hypotheses_H_E_alt -> lemmaK_litN_alt
-> lemmaK_of_litN_alt (bOdd) -> bOdd_zk -> bStarOdd -> sBStarOdd_of.
In that last proof let C be the real linear span, INSIDE the cycles, of
z_c(z0,k) for cycles z0 at the original matrix rank n. Native wsys_zc
gives the exact factor product_{i=0}^{k-1}(l^j-l^(i+2)).
For every 2<=j<=k+1 its factor i=j-2 is zero, including l=1.
By linearity these higher-weight forms vanish on all of C; by native
stability they vanish on the stabilized C at N>=lev(l,n,k).
Thus the only detection premise the rank proof requires is:

  for all z in C, (all tau_w(z)=0) => ev(omega,stab(z))=0.

The tau_w are linear on cycles at ONE matrix rank and may depend on
n,l. No need in this interface to produce higher-weight maps, their
boundary vanishing, block-power laws, or a coefficient expansion of
omega on arbitrary cycles. The original SWtOdd supplier entails the
projected detection by the exact native filter and linearity. This is
a weaker sufficient interface, not a proof that a shorter independent
supplier exists. Preserve common N, all hC/hSep/hBr/hStab/hSurj guards,
odd degree k+1, even k, field and rank hypotheses. In particular do not
divide by the weight-one multiplier: at l=1 and k>0 it is zero.
No division or norm bound is used.

The wrapper sWtOdd_of also explicitly ignores its SChain and SPsi
arguments; replicate its exact body with two explicit premises SEv and
SStokes. SChain still used in the rank consumer, and nothing asserts
sPsi is globally absent from transitive proofs of the other suppliers.

Original graph retained: bStarOdd -> sBStarOdd_of, sSurj_of,
sWtOdd_of -> swtOdd, plus all native and type/constructor edges.
Candidate: bStarOdd14 -> rank_of_detect14, projected_of_weight14,
wt_odd14, same sSurj_of. The new rank consumer has no explicit
higher-weight decomposition. Its current producer uses the original
weight proof, so no global dependency retirement is asserted.
bOdd14 repeats exact heterogeneous transport (same zSeq_zk) and
lemmaK14 substitutes at the actual hN consumer. Cache key: pin,
toolchain, L,k,l,n, actual stabilization proof and cycle submodule,
hC/hSep/hBr/hStab/hSurj and candidate producer; no cross-host merging.
Backtrack to original bOdd if replay fails.

Pinned source ledger (relative to AutomorphicVarieties/):
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/SBStarOdd.lean 3d2dd76f9cec2a817ba0788135969b561c1555fc
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/OddSpanRank/SBStarOddOf.lean 565b92ed21384bb9eb1352d653a40cef0bd006cd
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/TensorPrimeModuli/SBStarOf.lean da55f5bde89d1715e3f606bc5c510d83198a37c9
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/OddWeightCycles/SWtOddOf.lean 42ffedb89f513924436c76f296101c5bc1476efe
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/TorsionIntegers/Bridge.lean 7ff84d3d02c1f4cfb386505d590e2eb4e0c96f8c
ModularityArgument/ClassCounting/BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
ModularityArgument/ThresholdArguments/DenseThresholdCases/KFinal.lean 9b26f8a76facea83b64788eaabdf30c492023644
Executed connector JS: 27 exact blob/anchor checks, 1092 exact
integer evaluations of the native annihilator for even k<=24, l=1..7,
j=2..k+1; 12 l=1 weight-one zero controls. These check the
algebra only, not the Lean declarations. Source proof of zero factor
covers all k,l without extrapolation. Local command -v lean/lake
returned no paths. Actual CI job records for 45577239749, 45576756833,
45670987597 all report success; none verifies this new certificate.
Axiom commands are requests, not results; no new kernel evidence.
No URT advantage claim.

RESUME HERE: batch replay this overlay with integration RUN39 and lane14
RUN38 in existing pinned runner. Compare rank_of_detect14 and
sBStarOdd_of role/type/constructor and axiom exports. Then seek direct
projected detector from invariant forms restricted to the actual cycle
span, rather than expanding the full SWtOdd decomposition. Keep same
host SSurj, torsion, CountI/II/III/V/Vs and geometry obligations open.
HANDOFF TO integration, audit, literature, dependency and lane14.
-/

noncomputable section
open NumberField NumberField.InfinitePlace Matrix UpperTheory.V.KT UpperTheory.V.KL
open scoped TensorProduct

namespace PositivityTheory.KB

def oddSpan14 (L : Type) [Field L] [NumberField L] (k l n : ℕ) (hl : 0 < l) :
    Submodule ℝ (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker :=
  Submodule.span ℝ {y | ∃ z0 : Chn (GL (Fin n) (𝓞 L)) (k + 1), IsCyc z0 ∧
    (y : Chn (GL (Fin (lev l n k)) (𝓞 L)) (k + 1)) = PrimeModuloFree.zc (𝓞 L) hl z0 k}

def OddDetect14 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L] (k : ℕ), Even k →
    ∀ (l : ℕ) (hl : 0 < l) (n : ℕ),
      ∃ τ : InfinitePlace L → (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker →ₗ[ℝ] ℝ,
        ∀ (N : ℕ) (hMN : lev l n k ≤ N) (ω : Form (HS L N) (k + 1)),
          (∀ g, FInv ω g) → ∀ z : oddSpan14 L k l n hl,
            (∀ w, τ w z.1 = 0) →
            ev (emb L N) (intP ω) (one L N)
              (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1) = 0

open PrimeModuloFree LargePrimeDiscriminant in
theorem projected_of_weight14 (hC : SChain) (hWt : SWtOdd) : OddDetect14 := by
  intro L _ _ k hk l hl n
  obtain ⟨τ, hτW, hτ⟩ := hWt L k hk
  refine ⟨fun w => (τ w (lev l n k)).comp
    (bd (GL (Fin (lev l n k)) (𝓞 L)) k).ker.subtype, ?_⟩
  intro N hMN ω hωI z hTw
  have hcyc : IsCyc z.1.1 := LinearMap.mem_ker.mp z.1.2
  have hz'c := LargePrimeDiscriminant.isCyc_cmap hC (stab (𝓞 L) (lev l n k) N hMN) hcyc
  obtain ⟨cc, a, ha, hdec⟩ := hτ N ω hωI
  have hazero : ∀ j ∈ Finset.Icc 2 (k + 1), ∀ y ∈ oddSpan14 L k l n hl,
      a j (lev l n k) (y : Chn (GL (Fin (lev l n k)) (𝓞 L)) (k + 1)) = 0 := by
    intro j hj y hy
    unfold oddSpan14 at hy
    induction hy using Submodule.span_induction with
    | mem x hx =>
      obtain ⟨z0, hz0, hx⟩ := hx
      rw [hx, PrimeModuloFree.wsys_zc (R := 𝓞 L) hC (ha j hj) hl hz0 k]
      apply mul_eq_zero_of_left
      rw [Finset.mem_Icc] at hj
      apply Finset.prod_eq_zero (i := j - 2)
      · rw [Finset.mem_range]; omega
      · rw [Nat.sub_add_cancel hj.1, sub_self]
    | zero => simp
    | add x y _ _ hx hy => simp [hx, hy]
    | smul r x _ hx => simp [hx]
  have h1 : ∀ w, τ w N (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1) = 0 := by
    intro w
    rw [(hτW w).2.1 _ _ hMN _ hcyc]
    exact hTw w
  have h2 : ∀ j ∈ Finset.Icc 2 (k + 1),
      a j N (cmap (stab (𝓞 L) (lev l n k) N hMN) (k + 1) z.1.1) = 0 := by
    intro j hj
    rw [(ha j hj).2.1 _ _ hMN _ hcyc]
    exact hazero j hj _ z.2
  rw [hdec _ hz'c, Finset.sum_eq_zero (fun w _ => by rw [h1 w, mul_zero]),
    Finset.sum_eq_zero h2, add_zero]

open PrimeModuloFree LargePrimeDiscriminant in
theorem rank_of_detect14 (hC : SChain) (hSep : SSep) (hBr : SBridge)
    (hStab : SStab) (hSurj : SSurj) (hD : OddDetect14) : BStarOdd := by
  intro L _ _ hTC k hk hkr l hl n hn
  haveI : IsTotallyComplex L := hTC
  obtain ⟨θ, hθs, hθ0, hθn⟩ := hBr k
  obtain ⟨τ, hτ⟩ := hD L k hk l hl n
  have hcard : Fintype.card (InfinitePlace L) = nrComplexPlaces L := by
    rw [card_eq_nrRealPlaces_add_nrComplexPlaces, IsTotallyComplex.nrRealPlaces_eq_zero, zero_add]
  have hM : 2 * (k + 1) + 4 ≤ lev l n k := le_trans hn (PrimeModuloFree.le_lev hl n k)
  let C := oddSpan14 L k l n hl
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
theorem wt_odd14 : SEv → SStokes → SWtOdd := fun hE hS =>
  swtOdd hE hS (fft_of cplx sw1 sw2) aGood wPad weylTwoBlockMatrix wInv wCyc tStab tBlk pStab blockSum_preserves_cone wOneOdd wRot

theorem wt_original_bridge14 : SChain → SEv → SPsi → SStokes → SWtOdd :=
  fun _ hE _ hS => wt_odd14 hE hS

theorem bStarOdd14 : BStarOdd := by
  apply rank_of_detect14 sChain sSep' sBridge sStab
    (sSurj_of sPrime_of sHecke sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of sInv)
  first
  | (rh_reduce 2 using [projected_of_weight14, wt_odd14, sChain, sEv, sStokes_of]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact projected_of_weight14 sChain (wt_odd14 sEv sStokes_of)

private theorem rank_heq14 (R : Type) [CommRing R] (m : ℕ) {X : Type} {a b : ℕ} (e : a = b)
    (f : X → grpH (GL (Fin a) R) m) (g : X → grpH (GL (Fin b) R) m) (h : ∀ x, HEq (f x) (g x)) :
    Module.rank ℤ (Submodule.span ℤ (Set.range f)) = Module.rank ℤ (Submodule.span ℤ (Set.range g)) := by
  subst e
  obtain rfl : f = g := funext fun x => eq_of_heq (h x)
  rfl

theorem bOdd14 : UpperTheory.V.ZK.BOdd := fun L _ _ hL k hk hr l hl n hn =>
  (rank_heq14 _ _ (lev_zk l n k) _ _ fun x => zSeq_zk _ hl x k).le.trans
    (bStarOdd14 L hL k hk hr l hl n hn)

end PositivityTheory.KB

namespace UpperTheory.V.ZK
theorem lemmaK14 (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) :
    ∃ CK, LemmaK CK :=
  lemmaK_of_litN_alt hN PositivityTheory.KB.bOdd14
end UpperTheory.V.ZK

rh_prune PositivityTheory.KB.sWtOdd_of as PositivityTheory.KB.WtOddOriginalPruned14
rh_prune PositivityTheory.KB.rank_of_detect14 as PositivityTheory.KB.RankDetectPruned14
rh_scan PositivityTheory.KB.sBStarOdd_of limit 2000
rh_scan PositivityTheory.KB.rank_of_detect14 limit 2000
rh_scan PositivityTheory.KB.bStarOdd limit 2000
rh_scan PositivityTheory.KB.bStarOdd14 limit 2000
rh_scan UpperTheory.V.ZK.lemmaK_litN_alt limit 2000
rh_scan UpperTheory.V.ZK.lemmaK14 limit 2000
#print axioms PositivityTheory.KB.sWtOdd_of
#print axioms PositivityTheory.KB.wt_odd14
#print axioms PositivityTheory.KB.projected_of_weight14
#print axioms PositivityTheory.KB.rank_of_detect14
#print axioms PositivityTheory.KB.bOdd14
#print axioms UpperTheory.V.ZK.lemmaK14
end
