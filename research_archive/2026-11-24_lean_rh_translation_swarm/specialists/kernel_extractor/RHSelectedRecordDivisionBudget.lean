import Development.AutomorphicArithmetic.CharacterBoxes.DesWin
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 11: use the full native division budget, not sqrt(b)
25 Nov 2026. Source-matched human derivation; Lean PREPARED, NOT RUN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Read current shared manuscript 4f571d3bfce24fbaef352cd403666872a8981175,
editor 109c156c (determinant moment), integration's latest embedded
deep CountV simplification, handoff/protocol/AGENTS and continuity.
Previous lane principal endpoint d131f208. This is on its actual
TopG supplier branch, not a new criterion for RH.

Pinned sources (retrieved):
CharacterBoxes/DesWin.lean 94820ef32775f43f41c61da2b892a121d0549b86
CharacterBoxes/DivinNOfHypV.lean 5321920359316653b7627951429a6d7555c311b0
CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7
CharacterBoxes/Supply.lean b104f034fc9c13758e280d1b7d33ac1ea370663a
CharacterBoxes/ZeroFreeAllOfTopG.lean 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1
Formalism/SharpRestriction/GlobalTheoremInputs.lean ba31f5120ed089d48968754ae577427912d467c5
ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd
TopPlug.lean c51cb6b5bd4bf2944ace89e00a2990da16bd519a.
Paths before Formalism are under src/Development/AutomorphicArithmetic/.
Latest upstream observed 251c7b05dd869ceba1aa42c6001c00b4010f23f9
(merge PR 2787). DivinNOfHypV, TopShape, TopPlug blobs there differ
(7cb964f3001bbb42dd8b74d6b74fc5a5b706f462,
4fabac4a5b30f4333c5b2fa73d35441585c03dc3,
b4bdd73c31e85e428c602cef693ffc1240547186); DesWin old path returned 404.
No upstream equivalence claimed; stay at original pin.

Human result (direct from actual LinkN_at definition):
Write y=x^eps, B0=f*m*b*y, N=Nc>=0, S=sum_l vvTerm(D,l).
LinkN_at gives etaSum <= dZ0*[C*(y*B0+log(x)^2*N)+S]
when vvTerm is summable. The native SmallLevelRankEq gives dZ0=D0.
For x sufficiently large, log(x)^2<=y. Then, if
                     S <= y*(B0+N),
the signed C term is bounded above by |C|*y*(B0+N), since
y*B0+log(x)^2*N is nonnegative and <=y*(B0+N).
Consequently etaSum <= D0*(|C|+1)*y*(B0+N), precisely DIVinN_at.
The source uses S<=b after vvRecord from VVle(...,sqrt(b)).
That is unnecessarily strong for THIS consumer. In particular
S<=b*y^2 suffices because f,m>=1 at any actual lift, N>=0.
Even the actual selected record budget S<=y*(B0+N) suffices; no
universal quantitative bound on alternative coefficient records is
used at this stage. All ShaFinOdd and summability obligations survive.
CAUTION: the original hB binder is used implicitly by linarith; a
textual occurrence scan would incorrectly delete it. The quantitative
bound is weakened, not removed. The new pointwise proof no longer
needs lift membership to establish the scalar estimate; lift membership
still supplies LinkN and SmallLevelRankEq at the caller.

Original graph:
TopPlug -> TopShape -> topDesWin -> divinN_of_hypV -> vvRecord,
divinN_at -> LinkN_at, SmallLevelRankEq, eventual log_sq.
New overlay:
topDesWin_recordBudget -> divinN_of_recordBudget -> divinN_at_budget;
recordBudget_of_hypVWide -> vvRecord; old HypV -> HypVWide.
The source topDesWin proof is copied except its one hV consumer;
all eight other closure/geometry suppliers, the design existence,
same Fm/CH, epsilon thresholds and transport quantifiers remain.
(The nine closed inputs include hN and hZ, both retained.)
GChi in Supply.lean STILL has the original sqrt(b) condition, and
supplyChi/TopShape still use it. No claim of global VWin removal.
To obtain a global improvement one must rebuild the host supply
for the wider VAt and replace the TopShape/TopG caller, preserving
every other consumer and the common host. No assertion of that here.
Cache key pin,eps,Fm,record D,actual scale and lifts,CH, C,
original/wide hypothesis context. Original graph unchanged.
No new axioms or proof of RH claimed; native axiom evidence pending.

Prior CI status retrieved in this run: 45577239749 status blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc pass, 98.87s;
45576756833 status blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
pass, 77.94s. Neither tested this new file. Local command -v lean
and command -v lake produced no paths. Source-body replacement
checked mechanically against exact fetched DesWin blob. No fabricated
arithmetic or Lean execution counts.

RESUME HERE: in the pinned native environment compile this file
with the three already-built engine oleans; audit actual original
and replacement declarations (including constructor roles and axioms).
Then trace supplyChi / VAt / VWin to replace sqrt(b) by b*y^2 at
the SAME host, only if all other consumers permit it. Otherwise
backtrack to original route. HANDOFF TO: integration, Galois, audit,
theta and editor. Insert only the concise local reduction into shared
manuscript after audit. RH OPEN.
-/

noncomputable section
namespace UpperTheory.Top
open Formalism.BasicNotions Formalism.MainNotions

def RecordBudget {eps : ℝ} (Fm : FamP eps) : Prop :=
  ∃ x0 : ℝ, ∀ x ≥ x0, ∀ i : Fm.Ix x, ∀ j ∈ SizeData₂.lifts (Fm.D x i),
    ShaFinOdd (Fm.D x i) ∧ Summable (vvTerm (Fm.D x i)) ∧
      ∑' l, vvTerm (Fm.D x i) l ≤
        (Fm.L x i).sc.x ^ (Fm.L x i).sc.eps * ((Fm.L x i).B0 + (Fm.L x i).Nc)

def HypVWide {eps : ℝ} (Fm : FamP eps) : Prop :=
  ∃ x0 : ℝ, ∀ x ≥ x0, ∀ i : Fm.Ix x,
    VVle (Fm.D x i).host.E (Fm.D x i).R.t
      ((Fm.L x i).sc.b * ((Fm.L x i).sc.x ^ (Fm.L x i).sc.eps)^2)

theorem hypVWide_of_hypV {eps : ℝ} (Fm : FamP eps) (h : HypV Fm.toFamCore) :
    HypVWide Fm := by
  obtain ⟨x0, hx0⟩ := h
  refine ⟨x0, fun x hx i => (hx0 x hx i).mono le_rfl ?_⟩
  have hb : 1 ≤ (Fm.L x i).sc.b :=
    Real.one_le_exp (Real.rpow_nonneg (by linarith [(Fm.L x i).sc.one_lt_alt]) _)
  have hy : 1 ≤ (Fm.L x i).sc.x ^ (Fm.L x i).sc.eps :=
    Real.one_le_rpow (Fm.L x i).sc.one_lt_alt.le (Fm.L x i).sc.eps_pos.le
  have hy2 : 1 ≤ ((Fm.L x i).sc.x ^ (Fm.L x i).sc.eps)^2 := by nlinarith
  exact (Real.sqrt_le_self_iff.2 (Or.inr hb)).trans
    (by simpa using mul_le_mul_of_nonneg_left hy2 (show 0 ≤ (Fm.L x i).sc.b by linarith))

theorem recordBudget_of_hypVWide {eps : ℝ} (Fm : FamP eps) (h : HypVWide Fm) :
    RecordBudget Fm := by
  obtain ⟨x0, hx0⟩ := h
  refine ⟨x0, fun x hx i j hj => ?_⟩
  obtain ⟨hf, hs, hb⟩ := vvRecord _ _ (hx0 x hx i)
  refine ⟨hf, hs, hb.trans ?_⟩
  let D := Fm.D x i
  let L := Fm.L x i
  change L.sc.b * (L.sc.x ^ L.sc.eps)^2 ≤ L.sc.x ^ L.sc.eps * (L.B0 + L.Nc)
  have hff : (1 : ℝ) ≤ D.R.f := by
    have : 0 < D.R.f := by unfold Ranks.f Ranks.n; positivity
    exact_mod_cast this
  have hm : (1 : ℝ) ≤ D.R.m := by
    have h := Finset.mem_Icc.1 hj
    exact_mod_cast le_trans h.1 h.2
  have hfm : (1 : ℝ) ≤ (D.R.f : ℝ) * D.R.m :=
    one_le_mul_of_one_le_of_one_le hff hm
  have hy : 0 ≤ L.sc.x ^ L.sc.eps := Real.rpow_nonneg (by linarith [L.sc.one_lt_alt]) _
  have hbpos : 0 < L.sc.b := Real.exp_pos _
  have hNc : 0 ≤ L.Nc := by
    simp only [SizeData₂.Nc, budgetNc, rankBudget, bSize]
    positivity
  have hB : L.B0 = (D.R.f : ℝ) * D.R.m * L.sc.b * L.sc.x ^ L.sc.eps := rfl
  have hp : 0 ≤ L.sc.b * (L.sc.x ^ L.sc.eps)^2 := by positivity
  have hmul := mul_le_mul_of_nonneg_right hfm hp
  calc
    _ ≤ ((D.R.f : ℝ) * D.R.m) * (L.sc.b * (L.sc.x ^ L.sc.eps)^2) := by simpa using hmul
    _ = L.sc.x ^ L.sc.eps * L.B0 := by rw [hB]; ring
    _ ≤ _ := by
      rw [mul_add]
      linarith [mul_nonneg hy hNc]

theorem recordBudget_of_hypV {eps : ℝ} (Fm : FamP eps) (h : HypV Fm.toFamCore) :
    RecordBudget Fm := by
  first
  | (rh_reduce 3 using [recordBudget_of_hypVWide, hypVWide_of_hypV]; done)
  | exact recordBudget_of_hypVWide Fm (hypVWide_of_hypV Fm h)

theorem divinN_at_budget {D : D7} (L : SizeData₂ D) (j : ℕ) (C : ℝ)
    (hN : LinkN_at L j C) (hs : Summable (vvTerm D))
    (hb : ∑' l, vvTerm D l ≤ L.sc.x ^ L.sc.eps * (L.B0 + L.Nc))
    (hd : L.dZ0 j = D.what₂.D0) (hlog : Real.log L.sc.x ^ 2 ≤ L.sc.x ^ L.sc.eps) :
    DIVinN_at L j (|C| + 1) := by
  have hy : 0 ≤ L.sc.x ^ L.sc.eps := Real.rpow_nonneg (by linarith [L.sc.one_lt_alt]) _
  have hbpos : 0 < L.sc.b := Real.exp_pos _
  have hNc : 0 ≤ L.Nc := by
    simp only [SizeData₂.Nc, budgetNc, rankBudget, bSize]
    positivity
  have hB : L.B0 = (D.R.f : ℝ) * D.R.m * L.sc.b * L.sc.x ^ L.sc.eps := rfl
  have hB0 : 0 ≤ L.B0 := by rw [hB]; positivity
  have hL : L.sc.L = L.sc.x ^ L.sc.eps := rfl
  have hE := hN hs
  rw [hd, hL] at hE
  unfold DIVinN_at
  refine le_trans hE (mul_le_mul_of_nonneg_left ?_ (Nat.cast_nonneg _))
  let y := L.sc.x ^ L.sc.eps
  change C * ((D.R.f : ℝ) * D.R.m * L.sc.b * y ^ 2 + Real.log L.sc.x ^ 2 * L.Nc) +
      ∑' l, vvTerm D l ≤ (|C| + 1) * y * (L.B0 + L.Nc)
  have hP1 : (D.R.f : ℝ) * D.R.m * L.sc.b * y ^ 2 = y * L.B0 := by rw [hB]; dsimp [y]; ring
  have hP2 : Real.log L.sc.x ^ 2 * L.Nc ≤ y * L.Nc := mul_le_mul_of_nonneg_right hlog hNc
  have hP0 : 0 ≤ y * L.B0 + Real.log L.sc.x ^ 2 * L.Nc := by
    exact add_nonneg (mul_nonneg hy hB0) (mul_nonneg (sq_nonneg _) hNc)
  rw [hP1]
  have h1 : C * (y * L.B0 + Real.log L.sc.x ^ 2 * L.Nc) ≤ |C| * (y * (L.B0 + L.Nc)) :=
    le_trans (mul_le_mul_of_nonneg_right (le_abs_self C) hP0)
      (mul_le_mul_of_nonneg_left (by linarith) (abs_nonneg C))
  have hbudget : ∑' l, vvTerm D l ≤ y * (L.B0 + L.Nc) := hb
  have h3 : (|C| + 1) * y * (L.B0 + L.Nc) = |C| * (y * (L.B0 + L.Nc)) + y * (L.B0 + L.Nc) := by ring
  rw [h3]
  exact add_le_add h1 hbudget

theorem divinN_of_recordBudget {eps : ℝ} (Fm : FamP eps) (heps : 0 < eps)
    (hV : RecordBudget Fm) (hN : LinkN Fm) (hR : SmallLevelRankEq Fm) :
    DIVinN Fm := by
  obtain ⟨x1, h1⟩ := hV
  obtain ⟨C, x3, h3⟩ := hN
  obtain ⟨x4, h4⟩ := hR
  obtain ⟨x6, h6⟩ := log_sq_le_rpow heps
  refine ⟨|C| + 1, max (max x1 (max x3 x4)) (max x6 (Fm.x1 + 1)), fun x hx i j hj => ?_⟩
  simp only [ge_iff_le, max_le_iff] at hx
  obtain ⟨⟨g1, g3, g4⟩, g6, g7⟩ := hx
  obtain ⟨hf, hs, hb⟩ := h1 x g1 i j hj
  refine divinN_at_budget _ j C (h3 x g3 i hf j hj) hs hb (h4 x g4 i j hj) ?_
  rw [Fm.L_x x i (by linarith), Fm.L_eps x i]
  exact h6 x g6

theorem topDesWin_recordBudget (𝒞 𝒞' ℰ : FamClass) (Cabs C0 eD eL : ℝ) (hEx : DesignExists (WithTw (WithSm 𝒞')) C0)
    (h1 : ∀ {eps : ℝ} (Fm : FamP eps), 𝒞' Fm → 𝒞 Fm) (h2 : ∀ {eps : ℝ} (Fm : FamP eps), 𝒞' Fm → ℰ Fm)
    (hV : ∀ {eps : ℝ} (Fm : FamP eps), ℰ Fm → RecordBudget Fm)
    (hN : Closed (Des 𝒞 C0) fun Fm _ => LinkN Fm)
    (hEta : Closed (Des 𝒞 C0) fun Fm _ => LinkEta Fm)
    (hIRR : Closed (Des 𝒞 C0) fun Fm _ => LinkIRR Fm)
    (hZ : Closed (Des 𝒞 C0) fun Fm _ => SmallLevelRankEq Fm)
    (hDIV : Closed (Des 𝒞 C0) fun Fm CH => TuSize Fm → DGamSize Fm → LinkDIVt Fm Cabs CH)
    (hRk : Closed (Des 𝒞 C0) fun Fm CH => ChosenE Fm C0 CH → NuFullF Fm ∧ J.MuRank Fm)
    (hG : Closed (Des 𝒞 C0) fun Fm _ => LinkG Fm)
    (hS : Closed (Des 𝒞 C0) fun Fm _ => TuSize Fm → LinkS Fm C0)
    (hGL : Closed (Des 𝒞 C0) fun Fm CH => TuSize Fm → DGamSize Fm → LinkGLOBAL Fm Cabs CH C0 eD eL) : FamilyClassConnected ℰ := by
  obtain ⟨ε1, hε1, hA⟩ := hN.and (hDIV.and (hEta.and (hIRR.and (hZ.and (hRk.and (hG.and (hS.and hGL)))))))
  obtain ⟨ε3, hε3, hEx⟩ := hEx
  refine ⟨eD, eL, min ε1 ε3, lt_min hε1 hε3, fun ε h0 hlt => ?_⟩
  obtain ⟨K, hK⟩ := hA ε h0 (le_of_lt (lt_of_lt_of_le hlt (min_le_left _ _)))
  obtain ⟨Fm, CH, hc, -, hL, hCh, hT, hDG⟩ := hEx ε h0 (le_of_lt (lt_of_lt_of_le hlt (min_le_right _ _))) K
  obtain ⟨aN, aD, aE, aI, aZ, aR, aG, aS, aGL⟩ := hK Fm CH ⟨⟨⟨h1 Fm hc.1.1, hc.1.2⟩, hc.2⟩, ⟨CH, hCh⟩, hT, hDG⟩ hL
  have hD := aD hT hDG aE (divinN_of_recordBudget Fm h0 (hV Fm (h2 Fm hc.1.1)) aN aZ)
  exact ⟨Fm, h2 Fm hc.1.1, aGL hT hDG hCh ⟨aG, aS hT, aI, hD,
    J.linkMu_of_linkDIV Fm hD (aR hCh).1 (aR hCh).2 (muTu_of_tuSize Fm h0 hT) (J.muDGam_of_fact Fm hDG)⟩⟩

theorem topDesWin_original_via_recordBudget (𝒞 𝒞' ℰ : FamClass) (Cabs C0 eD eL : ℝ) (hEx : DesignExists (WithTw (WithSm 𝒞')) C0)
    (h1 : ∀ {eps : ℝ} (Fm : FamP eps), 𝒞' Fm → 𝒞 Fm) (h2 : ∀ {eps : ℝ} (Fm : FamP eps), 𝒞' Fm → ℰ Fm)
    (hV : ∀ {eps : ℝ} (Fm : FamP eps), ℰ Fm → HypV Fm.toFamCore)
    (hN : Closed (Des 𝒞 C0) fun Fm _ => LinkN Fm)
    (hEta : Closed (Des 𝒞 C0) fun Fm _ => LinkEta Fm)
    (hIRR : Closed (Des 𝒞 C0) fun Fm _ => LinkIRR Fm)
    (hZ : Closed (Des 𝒞 C0) fun Fm _ => SmallLevelRankEq Fm)
    (hDIV : Closed (Des 𝒞 C0) fun Fm CH => TuSize Fm → DGamSize Fm → LinkDIVt Fm Cabs CH)
    (hRk : Closed (Des 𝒞 C0) fun Fm CH => ChosenE Fm C0 CH → NuFullF Fm ∧ J.MuRank Fm)
    (hG : Closed (Des 𝒞 C0) fun Fm _ => LinkG Fm)
    (hS : Closed (Des 𝒞 C0) fun Fm _ => TuSize Fm → LinkS Fm C0)
    (hGL : Closed (Des 𝒞 C0) fun Fm CH => TuSize Fm → DGamSize Fm → LinkGLOBAL Fm Cabs CH C0 eD eL) : FamilyClassConnected ℰ := by
  exact topDesWin_recordBudget 𝒞 𝒞' ℰ Cabs C0 eD eL hEx h1 h2
    (fun Fm hc => recordBudget_of_hypV Fm (hV Fm hc)) hN hEta hIRR hZ hDIV hRk hG hS hGL

theorem recordBudget_auto {eps : ℝ} (Fm : FamP eps) (h : HypV Fm.toFamCore) :
    RecordBudget Fm := by
  first
  | (rh_auto 3; done)
  | exact recordBudget_of_hypV Fm h

theorem recordBudget_frontier {eps : ℝ} (Fm : FamP eps) (h : HypV Fm.toFamCore) :
    RecordBudget Fm := by
  first
  | (rh_auto_frontier 3; done)
  | exact recordBudget_of_hypV Fm h

end UpperTheory.Top
rh_scan UpperTheory.Top.divinN_at limit 2000
rh_scan UpperTheory.Top.topDesWin limit 2000
rh_scan UpperTheory.Top.topDesWin_recordBudget limit 2000
rh_prune UpperTheory.Top.divinN_at as RHNativeDivinNPruned
rh_prune UpperTheory.Top.divinN_at_budget as RHBudgetDivinNPruned
rh_prune UpperTheory.Top.topDesWin_recordBudget as RHTopDesWinBudgetPruned
#print axioms UpperTheory.Top.divinN_at
#print axioms UpperTheory.Top.divinN_at_budget
#print axioms UpperTheory.Top.recordBudget_of_hypVWide
#print axioms UpperTheory.Top.topDesWin_recordBudget
#print axioms UpperTheory.Top.topDesWin_original_via_recordBudget
#print axioms UpperTheory.Top.recordBudget_auto
#print axioms UpperTheory.Top.recordBudget_frontier
end
