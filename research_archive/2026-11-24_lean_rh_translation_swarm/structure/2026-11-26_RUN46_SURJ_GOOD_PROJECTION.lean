import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN46, 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine),
SWARM, HANDOFF, AGENTS, state/log/protocol/continuity checked.
Peer latest 92d36547,1208fb87,5f0e858f,e3f9d949 inspected; own RUN45 4695f11c.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/KTheoryStability/ReductionBoundsTorsion/:
IteratedHeckeBounds/LemForm.lean fa1fbd6622fa0603e9e2d08b8d7a9815aa7f73fc
PermutationSigns/SinvOfSwt.lean cb11b7a226d3f2b8eb80f07ba5bd349fa13774db
SBridgeAlt.lean ec6c9ebdf9477b507dee27a41d1b7ddd12fe9106
SInv.lean 72923b276e37c480be9f322e3bf0fba695c3995f
FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa
SurjectivityCase/SSurjOf.lean 391d94a766083f8a66e9e936981f94b1f138d6c4
PermutationSigns/SInvOf.lean dd77dfcdb970cd4bf56765bcfb9131a86703130b
PermutationSigns/SwtAll.lean bc55ed07afa61fb3b95abee1e7c1f1caa61134ec

RESULT: native JoinReconstruction.key uses SInv exactly once, at
(hInv L N k omega_b h_omega_bI).1, i.e. Good(omega_b). Its second
component (primitive-cycle evaluation vanishes for odd k) is unused.
The ACTUAL first component of sinv_of_swt is hG hS L N (k+1) omega h_omega.
Thus replace SInv by SInvGood46, supplied directly by aGood sStokes_of;
no need for SWt/swt_all, SPsi or the primitive-cycle cancellation as
inputs to THIS supplier. In particular the source's full odd-weight
decomposition with FFT/block identities is bypassed in the SSurj branch.
This is a caller-level local removal, not global elimination of these
dependencies: the remaining odd rank weight branch uses FFT, and other
callers can need the full SInv. Retain all previous certificates, original
fallback, all original SSurj hypotheses except the unused SInv component,
and the same N, d, pi, omega_b, integrability, Hecke and norm bounds.
Original graph: bStarOdd -> sSurj_of -> key -> SInv -> sInv_of ->
sinv_of_swt -> [AGood,SStokes,SChain,SPsi,SWt] -> swt_all -> SEv/FFT/etc.
Reduced graph: bStarOdd46 -> sSurj46 -> key46 -> SInvGood46 ->
[aGood,sStokes_of]. All other edges unchanged, source-visible only.
The SInv -> SInvGood46 projection is supplied as original-premise bridge;
no converse asserted (truth-table negative control g=true,p=false).
The actual original proof body of key is copied with exactly 3 replacements,
checked reversibly. Direct human derivation: the original proof's
hG0 needs only Good(omega_b) to subtract dC and continuity; all remaining
uses concern h_omega_bI and the mean identity already supplied by SMean.
The independent SInv second projection is never invoked.
Executed 21 fail-on-error JS source/logic checks including one negative control;
reproduce by checking unique occurrences of theorem key, (hInv : SInv),
(hInv L N k omega_b h_omega_bI).1 (actual Unicode below), two hInv
tokens, and reversing the three replacements byte-for-byte on trimmed
key body; check exact supplier snippets above and all 4 Boolean cases
(g and p) implies g. No native Lean/lake/elan found (command -v).
Historical status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched; status pass and
returncode 0 (old runs 45577239749/45576756833 only). No new CI or axioms
result, no URT benchmark claimed. Failed source guesses JoinReconstruction.lean
and SurjectivityCase/JoinReconstruction.lean returned 404; actual key
found via SSurjOf import IteratedHeckeBounds/LemForm.lean.
Cache by pin, toolchain, full declaration, instantiated host/degree/N/d,
c, witnesses and proof role; original fallback on failed elaboration.
RESUME HERE: replay key46 and bStarOdd46 with existing warmed runner;
combine sSurj46 with RUN45's sBStarOdd_of45 and sWtOdd_source45.
Then trace the actual SHecke decay-to-vanishing supplier; do not drop
the exponential rate 3/5 before inspecting its actual use.
HANDOFF TO kernel, audit, integration, arithmetic. RH OPEN.
-/

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

namespace JoinReconstruction
theorem key46 (hPrime : SPrime) (hHecke : SHecke) (hHt : SHt) (hPU : SPU) (hMom : SMom) (hWhit : SWhit)
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
  have hF0 := hN₀ N hN0 _ hFI hFd fun z hz =>
    lem_bound hGap hLoc L hC π hπ hπ25 N k h3N d (ω' - ωb) hG0 hγ0 hs0 hLz0 z hz
  refine ⟨ωb, hωbI, fun z hz => ?_⟩
  have h5 := hF0 z hz
  rw [ev_toK _ (intP (ω' - ωb)) (fun y => rfl) z, e2, ev_sub] at h5
  rw [← hω'z z hz]
  linarith

end JoinReconstruction

theorem sSurj46 : SSurj := by
  have hGood := sInvGood46
  first
  | (rh_reduce 2 using [JoinReconstruction.key46]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact JoinReconstruction.key46 sPrime_of sHecke sHt_of sPU sMom sWhit sCen sGap_of sLoc sMean_of hGood

theorem bStarOdd46 : BStarOdd :=
  sBStarOdd_of sChain sSep' sBridge sStab sSurj46
    (sWtOdd_of sChain sEv sPsi sStokes_of)

end PositivityTheory.KB
end

rh_prune PositivityTheory.KB.JoinReconstruction.key as RHStructure46KeyPruned
rh_scan PositivityTheory.KB.JoinReconstruction.key limit 2000
rh_scan PositivityTheory.KB.JoinReconstruction.key46 limit 2000
rh_scan PositivityTheory.KB.bStarOdd46 limit 2000
#print axioms PositivityTheory.KB.JoinReconstruction.key
#print axioms PositivityTheory.KB.JoinReconstruction.key46
#print axioms PositivityTheory.KB.sInvGood46
#print axioms PositivityTheory.KB.bStarOdd46
