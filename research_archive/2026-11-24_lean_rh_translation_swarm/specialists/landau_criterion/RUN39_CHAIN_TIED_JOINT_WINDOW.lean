import Development.AutomorphicArithmetic.PrimitiveCosets.LevelGmLeOnFamilyScales
import RHJoint37
import RHCoreGmMean38
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN39 lane 4, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, mandatory
engine, AGENTS, SWARM, HANDOFF, EXPANSION and continuity/state/log
openings reviewed. Current living proof fd2d51ae consulted. Latest 20
commit titles reviewed; inspected integration 2785c414, geometry
a2d27f27, editor 58d43b7e and own RUN37/38. Arithmetic peers' direct
Sha and geometry Haar calibration remain open and are not assumed.

RESULT: move signed mean replacement through ACTUAL ChainTied and
family-window caller, at level order one. On the same i0 selected by
the original ChainTied packet, EAtH.o_eq gives frame.o=1.
Native Frame.index_nsmul_mem_cyclic_subgroup yields o • u ∈ A0;
substitute o=1 to obtain all u∈A0, avoiding any new quotient machinery.
Native tr=id is already built at tiedCore_of_chainTied. Hence no
independent witness, representative or averaging measure is chosen.
Replace precisely LossBounds in native SizeData₂ by JointLoss37,
leave the other ten geometry premises and all TiePts/Global/Local/
Arith, Ident, ErrWindows, BNBounds, GrowthInequalityRemainingHyps,
CostWindows and RestSize intact. Original -> weaker packet follows
by averaging the two original pointwise losses and using c>=0.
Apply ch_top_joint37 then core_gm_mean38 with same original exponent,
same family, x, selected i0 and EAtH. The pointwise hT assumption is
now ChainTiedJoint39, not a proved supplier. No change to window length,
uniform threshold quantifiers, eps or the analytic Landau endpoint.
hΛ is order=1, not merely the presence of a principal character in a
larger cyclic family. To use the actual RH-only level separately
instantiate Λ=Level.cyc PChar.one (o=1); do not drop the four modes.

Original graph retained:
 level_gm_le_on_family_scales -> windowInequality_of_artinInputs
 -> tiedCore_of_chainTied -> ChainTied -> SizeData₂ -> LossBounds;
 -> core_gm -> ch_top -> pointwise top; all sibling consumers retained.
Candidate:
 level_gm_joint39 -> tiedCoreJoint39 -> ChainTiedJoint39
 -> SizeDataJoint39 -> JointLoss37; ch_top_joint37 -> core_gm_mean38.
Original-to-candidate adapter preserves full witness. Keep previous
proof graphs, unresolved type/value/constructor/axiom frontiers.
Cache key source+toolchain, Λ,hΛ,Fm,x,eps,i0,pt,Dd,C,eT,eP,
hE at that SAME i0, all scalar thresholds and role. Backtrack to
native route if any replay fails. No URT speedup claimed.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Pinned source ledger:
src/Formalism/SharpRestriction/GlobalSchurBounds/TieGlobal.lean 00acf811793877fe42d18c0d69f2d5833f75bf94
src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean de994949e6fd2d7238cfcb1c19d361ccdfe904fc
src/Development/AutomorphicArithmetic/PrimitiveCosets/WindowInequalityOfArtinInputs.lean c349e34925ac26b8bc76bd36e9b91562f86d6b8d
src/Formalism/SizeWindowBrackets/SChain.lean a4bc8cecac40a1f5fd307661e151639aaf6a6efa
src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/FrameFacts.lean 22402e8349688ace18526a8fc486eb659a5e7450
src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean ed60b4b997cd4703713660b185b9e43fd95559a1
src/Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean f9f34a9147750e215a6b2f206eb6f9889aa726b6
Peer RUN38 blob 9c8ecd7bc1643a20b9ce5ebe1c9b90ae7d5fb11d.
Executed 30 source/hash/guard assertions during construction
of this overlay; not an elaborated proof check. Local command -v
lean/lake returned no path. Fresh Actions jobs for 45577239749,
45576756833, 45670987597 all completed/success (including run jobs);
these are baseline and conditional analytic evidence ONLY, not this
new module or RUN37/38. No new native axiom result or CI job here.
Replay in existing pinned warmed runner: stage RUN37 as RHJoint37,
peer mean38 as RHMean38, RUN38 as RHCoreGmMean38; compile each, then
this file with same engine imports. Run included rh_scan/rh_prune,
rh_reduce/rh_auto/rh_auto_frontier on the actual adapter. Check all
logs and transitive axioms, never accept sorryAx. No protected edits.

RESUME HERE: replay RUN37/38/39 together in existing native runner.
If successful substitute level_gm_joint39 at the principal family
consumer, then trace the actual ChainTied producer's LossBounds field
to its tied IO and ASK-Ga suppliers and prove their joint budget
without pointwise maxima. All same-host VWinAt(1,401), ErrWindows,
rank/count, entropy and local-gain inputs remain open. Do not repeat
the analytic implication. HANDOFF TO integration, geometry, kernel,
audit, editor.
-/

noncomputable section
open Finset
open Formalism Formalism.HC Formalism.MainNotions Formalism.BasicNotions
open Deduction.CH Formalism.D5 Formalism.RankGapBounds.WeightedMeanData
  Formalism.LFunctionChainParameters.WeightedSlopeBounds
  Formalism.LFunctionChainParameters.characterSumData
  Formalism.LFunctionChainParameters.ThickSetMeanBounds
  Formalism.LFunctionChainParameters.LErr Formalism.LFunctionChainParameters.LChain
  Formalism.LFunctionChainParameters.LHost

namespace UpperTheory.Comparison₂
section
variable {U0 : Type} [Fintype U0] [Nonempty U0] {W : U0 → Type}
    [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)]
    {Top : Type} [Fintype Top] {m f : ℕ}
def SizeDataJoint39 (Dd : Data U0 W Top m f) (C : Consts) (Xpp : ℝ) : Prop :=
  Dd.HidaSetting C ∧ Dd.DIV C ∧ EComp5 Dd C ∧ Dd.HComp C ∧ Count5 Dd C ∧ Dd.Slopes C ∧
  QuotientSlopeBoundsWith Dd C Xpp ∧ JointLoss37 Dd C ∧ Dd.SlopeIneq ∧ Dd.HHBound C ∧ Dd.FParams

theorem sizeDataJoint39_of_native (Dd : Data U0 W Top m f) (C : Consts) (Xpp : ℝ)
    (h : SizeData₂ Dd C Xpp) : SizeDataJoint39 Dd C Xpp := by
  obtain ⟨s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11⟩ := h
  have hA := umean_mono (X := fun u : U0 => Dd.ASK u - Dd.Ga u)
    (Y := fun _ : U0 => Dd.LoP C) (fun u => (s8 u).1)
  have hI := umean_mono (X := Dd.IO)
    (Y := fun _ : U0 => Dd.LoP C) (fun u => (s8 u).2)
  rw [umean_const] at hA hI
  exact ⟨s1,s2,s3,s4,s5,s6,s7,jointLoss37_of_losses Dd C s1 ⟨hA,hI⟩,s9,s10,s11⟩
end
end UpperTheory.Comparison₂

namespace Formalism.MainNotions
def ChainTiedJoint39 {eps : ℝ} (Fm : FamP eps) (eD eL K cHH eK CL x : ℝ) : Prop :=
  ∃ (i0 : Fm.Ix x) (m f : ℕ) (pt : (Fm.D x i0).R.A → Fm.Ix x) (av bv : ℕ → ℤ)
    (Top : Type) (_ : Fintype Top)
    (Dd : Data (Fm.D x i0).R.A (fun u0 => (Fm.D x (pt u0)).what₂.Word) Top m f) (C : Consts) (Xpp : ℝ)
    (ell : AddChar (E0 × (Fm.D x i0).R.A) ℂ → ℂ) (N : ℕ) (TT T2 : Finset (Fm.D x i0).R.A) (a : (Fm.D x i0).R.A → ℝ)
    (w : (Fm.D x i0).R.A → Fin m → E0 × (Fm.D x i0).R.A → ℝ) (eT : Top ≃ TT)
    (eP : Fin f ≃ PhiSet (H := (Fm.D x i0).R.A)) (η X' θ : ℝ),
    TiePts Fm x (Fm.D x i0).R.toFrame m f (Fm.D x i0).host.q (Fm.D x i0).host.d pt av bv ∧
    TieGlobal Fm x pt Dd Xpp η X' ∧ TieLocal Fm x pt Dd ∧
    TieArith Fm x pt av (arithOf (Fm.D x i0).host.toHostRaw) ell TT T2 a w ∧
    Dd.x = x ∧ Dd.ε = eps ∧ C.eDiv ≤ eD ∧ C.eLoss ≤ eL ∧ C.cHH ≤ cHH ∧
    Ident Dd (arithOf (Fm.D x i0).host.toHostRaw) N ell TT a w eT eP ∧
    UpperTheory.Comparison₂.SizeDataJoint39 Dd C Xpp ∧
    ErrWindows Dd C Xpp eK K ∧
    BNBounds Dd T2 ∧
    GrowthInequalityRemainingHyps (arithOf (Fm.D x i0).host.toHostRaw) ell N TT T2 a w x eps Dd.b Dd.b' η X' θ CL ∧
    CostWindows x (fPl (Fm.D x i0).R.A) Dd.b η θ ∧
    RestSize eps x (Fintype.card (Fm.D x i0).R.A) TT.card T2.card m Dd.b Dd.k Dd.a

theorem chainTiedJoint39_of_native {eps : ℝ} (Fm : FamP eps) (eD eL K cHH eK CL x : ℝ)
    (h : ChainTied Fm eD eL K cHH eK CL x) : ChainTiedJoint39 Fm eD eL K cHH eK CL x := by
  classical
  obtain ⟨i0, m, f, pt, av, bv, Top, iT, Dd, C, Xpp, ell, N, TT, T2, a, w, eT, eP, η, X', θ,
    t1,tg,tl,ta,h1,h2,h3,h4,h5,h7,h8,h9,h10,h11,h12,h13⟩ := h
  exact ⟨i0,m,f,pt,av,bv,Top,iT,Dd,C,Xpp,ell,N,TT,T2,a,w,eT,eP,η,X',θ,
    t1,tg,tl,ta,h1,h2,h3,h4,h5,h7,
    UpperTheory.Comparison₂.sizeDataJoint39_of_native Dd C Xpp h8,h9,h10,h11,h12,h13⟩

theorem chainTiedJoint39_reduce {eps : ℝ} (Fm : FamP eps) (eD eL K cHH eK CL x : ℝ) :
    ChainTied Fm eD eL K cHH eK CL x → ChainTiedJoint39 Fm eD eL K cHH eK CL x := by
  intro h
  first | rh_reduce 2 using [chainTiedJoint39_of_native] | exact chainTiedJoint39_of_native Fm eD eL K cHH eK CL x h

example {eps : ℝ} (Fm : FamP eps) (eD eL K cHH eK CL x : ℝ)
    (h : ChainTied Fm eD eL K cHH eK CL x) : ChainTiedJoint39 Fm eD eL K cHH eK CL x := by
  first | rh_auto 2 | exact chainTiedJoint39_of_native Fm eD eL K cHH eK CL x h

example {eps : ℝ} (Fm : FamP eps) (eD eL K cHH eK CL x : ℝ)
    (h : ChainTied Fm eD eL K cHH eK CL x) : ChainTiedJoint39 Fm eD eL K cHH eK CL x := by
  first | (rh_auto_frontier 2 <;> done) | exact chainTiedJoint39_of_native Fm eD eL K cHH eK CL x h
end Formalism.MainNotions

namespace UpperTheory.Comparison₂
theorem tiedCoreJoint39 {eps : ℝ} (Fm : FamP eps) (eD eL K cHH eK CL x : ℝ) (Λ : Level) (hΛ : Λ.o = 1) (CE : ℝ)
    (hE : ∀ i : Fm.Ix x, EAtH Λ (Fm.D x i).host.toHostRaw (Fm.D x i).host.TT x eps CE)
    (h : ChainTiedJoint39 Fm eD eL K cHH eK CL x) :
    ∃ i : Fm.Ix x, CoreAtHMean38 (Fm.D x i).host.toHostRaw (Fm.D x i).host.TT eD eL K cHH eK eps x := by
  classical
  obtain ⟨i0, m, f, pt, av, bv, Top, iT, Dd, C, Xpp, ell, N, TT, T2, a, w, eT, eP, η, X', θ,
    -, -, -, ⟨tT, t2, -, -, hell⟩, h1, h2, h3, h4, h5, h7, h8, h9, h10, ⟨⟨s1, s2, s3, s4, s5, s6, ⟨n1, n2, n3⟩, s8⟩, th, -⟩, h12, h13⟩ := h
  have hTT : TT = (Fm.D x i0).host.TT := by
    ext t
    rw [tT t, ← Fm.TT_eq x i0, Finset.mem_image]
    exact ⟨fun ⟨s, hs, e⟩ => (Frame.A.val_injective _ e) ▸ hs, fun ht => ⟨t, ht, rfl⟩⟩
  subst hTT
  refine ⟨i0, _, inferInstance, fun u0 => (Fm.D x (pt u0)).what₂.Word, fun _ => inferInstance, fun _ => inferInstance, Top, iT,
    m, f, Dd, C, Xpp, ell, N, T2, a, w, eT, eP, η, X', θ, hell, h1, h2, h3, h4, h5, h9, ?_,
    ⟨s1, s2, s3, s4, s5, s6, fun u _ => n1 u, fun u _ => n2 u, fun u _ => n3 u, fun u _ => s8 u⟩, th, h12, h13, (fun s hs => by
      obtain ⟨k, -, rfl⟩ := (t2 0 s).1 hs
      exact Frame.digit_mem_cyclic_subgroup _ k)⟩
  have hO : (Fm.D x i0).R.toFrame.o = 1 := (hE i0).o_eq.trans hΛ
  have hall : ∀ u : (Fm.D x i0).R.A, u ∈ (Fm.D x i0).R.toFrame.A0 := by
    intro u
    simpa only [hO, one_nsmul] using (Fm.D x i0).R.toFrame.index_nsmul_mem_cyclic_subgroup u
  intro hLX
  exact Deduction.ch_top_joint37 Dd C Xpp eK K (arith (Fm.D x i0).host.toHostRaw)
    ell N _ T2 a w eT eP h7 h8 h9 h10 hLX _ hall


theorem level_gm_joint39 (Λ : Level) (hΛ : Λ.o = 1) :
    ChebyshevInequalityOnWindows (Fam := FamP) (fun Fm => Fm.toFamCore)
      (fun Fm => ChainTiedJoint39 Fm) Λ := by
  rintro eD eL eps he Fm ⟨C, xE, hE⟩ ⟨K, cHH, eK, CL, x0, hT⟩
  obtain ⟨x1, hx1⟩ := core_gm_mean38 Λ eD eL K cHH eK C eps he
  refine ⟨max x1 (max x0 xE), fun x hx hw => ?_⟩
  have b := le_of_max_le_right hx
  obtain ⟨i, hi⟩ := tiedCoreJoint39 Fm eD eL K cHH eK CL x Λ hΛ C
    (hE x (le_of_max_le_right b)) (hT x (le_of_max_le_left b) hw)
  exact hx1 x (le_of_max_le_left hx) _ (Fm.D x i).host.toHostAx _
    (hE x (le_of_max_le_right b) i) hi
end UpperTheory.Comparison₂

#print axioms Formalism.MainNotions.chainTiedJoint39_of_native
#print axioms UpperTheory.Comparison₂.tiedCoreJoint39
#print axioms UpperTheory.Comparison₂.level_gm_joint39
rh_scan UpperTheory.Comparison₂.level_gm_joint39 limit 2000
rh_prune UpperTheory.Comparison₂.level_gm_joint39 as RHLevelGmJoint39Pruned
end
