import RUN22_DIRECT_KEEPLEVEL_WITNESS
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepLevel
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 12 RUN46 — 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Latest mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine, AGENTS, SWARM, HANDOFF, continuity, research state/log and protocol fetched. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer 65d0f958 shows the stronger flag bound is unnecessary for the consumed existential exponent; do not expand that branch now. Peer 5d4f6c50 supplies Rank3LevelWitness21 from levelCore_alt; next local target is its actual last (Frobenius) branch. Peers c46be9ef (resultant), 425c27c5 (Clozel/Borel), 5f0e858f (Kummer), 59085d33 (shell) checked at commit or handoff level. Preserve all.
Source blobs under src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/: TSatFrobT.lean 255c4e427392059ed2d072457dc9b87296c22650; KeepLevel.lean f6bf6656c2fa3abdfd7a1f660710ddd53091e203; TSatLoc.lean d4a63f8450af2c00e107dc71fc4b31b936f581bd. Peer RUN22 blob 9617a35f3cea7f480628024d0b28ec6fa4e6b4c5.

RESULT: at the unramified Satake/Frobenius consumer only, replace
  forall A h rc, IsRecT h rc -> WDT iota r (rc (algNorm sigma))
by
  forall A h, exists rc, IsRecT h rc AND WDT iota r (rc (algNorm sigma)).
This is a witness per actual place over w, NOT one place for the entire field; no swap of quantifiers across A, sigma, or B. Native proof starts by choosing a reciprocity map, then uses H only at that map. Its printed-results premise and continuity binder are also ignored. The reduced proof takes the witness directly; no standalone recTExists call in the local lemma. For actual levelCore final branch choose the SAME P.exists_reciprocity_dense supplier already used by the infinity and local-fixed branches, convert via native isRecT_of_isRecT P hrc, and apply the original hC to that exact rc. This shares a supplier family, not different witnesses in different contexts. The output remains unramifiedness and the exact Frobenius polynomial with roots normV(w)^((n-1)/2)*alpha_i (alpha_i the Satake parameters). The native inverse and power normalization are retained exactly. No change in level, representation, or Satake parameters. The other two levelCore branches, P, continuity, local and global compatibility, oddness and Hodge data stay in the combined consumer. No claim that the reciprocity existence is now proved from first principles. The stronger universal compatibility survives other consumers. A local source-level weakening is not global axiom removal.

Original selected graph: NumberU3U -> rank3 witness -> levelCore_alt -> satFrobT_alt -> recTExists, rec_algNorm_diag, gd_diag, val_inv_eq, WDT and unramified charpoly; other branches compatT / jumps / fixed vectors. Candidate: rank3_witness_oneRec46 -> levelCore_oneRec46 -> satFrob_oneRec46 + P.exists_reciprocity_dense / isRecT_of_isRecT (already used in same levelCore); all native diagonal/WD/Frobenius steps and other branches retained. All original role/type/value/constructor graphs and axiom evidence retained; no globally retired nodes. Cache by source+toolchain,K,Omega,l,iota,n,r,pi,w,A,h,sigma,B,rc and consumer; never merge merely by theorem name. Backtrack to peer rank3_witness_of_core22 or original levelCore_alt if native replay fails. No use of claimed RH theorem.
Executed 35 fail-on-error V8 static source/reversible splice and baseline checks: KeepLevel pin; current mission; peer actual witness; unused printed hypothesis and continuity; SatLoc printed premise unused separately; actual final branch unique; actual final branch reversible; rename core unique; rename core reversible; infinity supplier retained; both fixed vector routes retained; same global compatibility and continuity retained; rename witness unique; rename witness reversible; actual witness call unique; actual witness call reversible; same pi and semisimplicity; rename Satake unique; rename Satake reversible; remove P unique; remove P reversible; remove continuity unique; remove continuity reversible; weaken universal reciprocity unique; weaken universal reciprocity reversible; remove unused introductions unique; remove unused introductions reversible; one local witness unique; one local witness reversible; use witness unique; use witness reversible; local theorem independent of canonical reciprocity existence; same unramified Frobenius equality; old baseline 45577239749; old baseline 45576756833.
Existing CI jobs fetched this run: [[45577239749,[["pick","completed","success"],["run (rh-recursive-reduction-strip-root-20261125)","completed","success"],["record","completed","success"]]],[45576756833,[["pick","completed","success"],["run (rh-proof-term-prune-native-20261125)","completed","success"],["record","completed","success"]]]]. These only verify previous native engines/conditional strip. Local lean/lake/elan absent; new candidate uncompiled; no new axiom evidence, no native PASS, no claim of speedup. No registry or protected workflow changes. Stage peer RUN20/21/22 per their instructions plus native engines and this module on pinned compute runner. No URT ranking needed.
RESUME HERE: compile the local satFrob_oneRec46 and original-statement bridge first (private helper alias resolution is untested); then actual levelCore_oneRec46 and rank3 caller. Compare native rh_scan and rh_prune, transitive axioms and constructor roles. If the shared dense witness conversion is not defeq, restore canonical recTExists at the caller, preserve local reduction. Then trace the still-essential compatT supplier, especially the actual local-global WDT producer, not further algebraic rewrites. The uniform quantitative arithmetic and decisive RH inequality remain open.
HANDOFF TO kernel extractor, Galois, integration, audit.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL GlobalTheory.GalOfCusp
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Lev UpperTheory.V.Z.Win UpperTheory.Zero.LLC
open GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField
open scoped Matrix
open private rec_algNorm_diag gd_diag val_inv_eq from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TSatFrobT
open private infOf_of_weights not_mem_of_not_dvd from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.SemisimpleLevels.LevelKO

theorem UpperTheory.V.Z.Desc.W.satFrob_oneRec46 :
    ∀ (F Ω : Type) [Field F] [NumberField F] [Field Ω] [Algebra F Ω] [IsAlgClosure F Ω] (l : ℕ) [Fact l.Prime]
    (ι : Qbar l ≃+* ℂ) (n : ℕ) (r : G F Ω →* GL (Fin n) (Qbar l)), ∀ w : HeightOneSpectrum (𝓞 F), ((l : ℕ) : 𝓞 F) ∉ w.asIdeal →
    ∀ (σ : SmIrr (GL (Fin n) (w.adicCompletion F))) (B : Multiset ℂˣ), GlobalTheory.LFun.HasSatGL w σ.ρ B →
    (∀ (A : ValuationSubring Ω) (h : IsPlaceOver A w), ∃ rc : IrrGL (w.adicCompletion F) → WD h, IsRecT h rc ∧ Z.Win.WDT ι r (rc (algNorm σ))) →
    FrobEig ι r w (algSat n (normV w) B) := by
  intro F Ω _ _ _ _ _ l _ ι n r w hl σ B hB H A h
  obtain ⟨rc, hrec, hcompat⟩ := H A h
  obtain ⟨α, rfl, e⟩ := rec_algNorm_diag hrec σ B hB
  have hx := hcompat.isWDOf (e ▸ gd_diag _)
  have hw := (hx.wdOf_eq hl).trans e
  obtain ⟨t, ht, φ, hφ, N', a, hN, -⟩ := hx
  refine ⟨(hN.unr_wdOf_iff hl ht ι).1 (by rw [hw, WD.unr_mk]; exact WDRep.unr_diag _), fun s hs => ?_⟩
  have hd : deg (⟨s, mem_Weil_of_isFrob h hs⟩ : Weil h) = 1 := deg_eq_one_iff.2 hs
  have := hN.charPol_wdOf hl ht ι (⟨s, mem_Weil_of_isFrob h hs⟩ : Weil h)⁻¹
  rw [hw, WD.charPol_mk, WDRep.diag_ρ, charpoly_diagEnd, deg_inv, hd] at this
  refine this.symm.trans ?_
  simp only [val_inv_eq, algSat, Multiset.map_map, Multiset.pure_def, Multiset.bind_def, Multiset.bind_singleton]
  rfl

theorem UpperTheory.V.Z.Desc.W.satFrob_original_bridge46 :
    _root_.UpperTheory.V.Af.Hypotheses' → ∀ (F Ω : Type) [Field F] [NumberField F] [Field Ω] [Algebra F Ω] [IsAlgClosure F Ω] (l : ℕ) [Fact l.Prime]
    (ι : Qbar l ≃+* ℂ) (n : ℕ) (r : G F Ω →* GL (Fin n) (Qbar l)), Continuous r → ∀ w : HeightOneSpectrum (𝓞 F), ((l : ℕ) : 𝓞 F) ∉ w.asIdeal →
    ∀ (σ : SmIrr (GL (Fin n) (w.adicCompletion F))) (B : Multiset ℂˣ), GlobalTheory.LFun.HasSatGL w σ.ρ B →
    (∀ (A : ValuationSubring Ω) (h : IsPlaceOver A w) (rc : IrrGL (w.adicCompletion F) → WD h), IsRecT h rc → Z.Win.WDT ι r (rc (algNorm σ))) →
    FrobEig ι r w (algSat n (normV w) B) := by
  intro _ F Ω _ _ _ _ _ l _ ι n r _ w hl σ B hB H
  refine UpperTheory.V.Z.Desc.W.satFrob_oneRec46 F Ω l ι n r w hl σ B hB ?_
  intro A h
  obtain ⟨rc, hrc⟩ := recTExists F Ω A w h
  exact ⟨rc, hrc, H A h rc hrc⟩

namespace UpperTheory.V.Keep
theorem levelCore_oneRec46 (P : _root_.UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ) (hn : 2 ≤ n) (m : Fin n → ℤ)
    (M : ℕ) (hM : 1 ≤ M) (l : ℕ) [Fact l.Prime] (hl : l ≠ 2) (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ)
    (r : G K Ω →* GL (Fin n) (Qbar l)) (π : CuspSub K n) (hL : LevelF l M m r)
    (hU : ∀ w : HeightOneSpectrum (𝓞 K), ((l : ℕ) : 𝓞 K) ∈ w.asIdeal → Unl1 r w ∨ PotUnl r w) (hW : WitA ι r)
    (hreg : (CG.mk π).IsRegAlg) (hpol : ∃ χ, GlobalTheory.ContraPair.PolarizedPair π χ) (ha : AttC ι r π) :
    (∀ τ, π.HasInfChar τ (infOf m)) ∧ HasFixed π.finPart (KLev K n M) ∧
      ∀ w : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∉ w.asIdeal → ∀ B, (CG.mk π).HasSat w B → FrobEig ι r w (algSat n (normV w) B) := by
  obtain ⟨HT, hwt, hC⟩ := compatT (_root_.UpperTheory.Gal.SV.rowOf' P.litN.aut.gal) K Ω l ι n (by omega) r π hL.cont hreg hpol ha
  have hw' : ∀ w : HeightOneSpectrum (𝓞 K), ((l : ℕ) : 𝓞 K) ∉ w.asIdeal ∨ Unl1 r w ∨ PotUnl r w := fun w =>
    (em _).elim (fun e => Or.inr (hU w e)) Or.inl
  refine ⟨fun φ => ?_, ?_, fun w hw B hB => ?_⟩
  · let τ : K →+* Qbar l := ι.symm.toRingHom.comp φ
    have hφ : ι.toRingHom.comp τ = φ := RingHom.ext fun x => ι.apply_symm_apply _
    obtain ⟨w, hw, hτ⟩ := GlobalTheory.GalFirstClause.existsIsInduced l K Ω τ
    obtain ⟨A, hA, κ, hκ⟩ := hL.above w hw
    obtain ⟨O, _, _, _, Bw, hj⟩ := exists_bridge (l := l) hA hw
    obtain ⟨τ', hτ'⟩ := hτ A hA O Bw hj
    obtain ⟨⟨σ, hσ⟩, -⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
    have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
    have hJ := _root_.UpperTheory.V.Af.jumps_above_of_printed_results P K Ω l hl n M hM m r hL.cont w A hA O Bw hj κ hκ τ _
      (((hC w σ hσ).2 g.1 A hA O Bw hj).2 τ _ τ' hτ')
    have hw := hwt τ
    rw [hJ, hφ] at hw
    rw [← infOf_of_weights hw]
    exact ParLaws.hasInfChar_infChar (CG.mk π) φ
  · refine _root_.UpperTheory.V.Af.globFixed_alt P K n M hM _ π.finPart π.isSmooth_finPart fun w => ?_
    obtain ⟨⟨σ, hσ⟩, hi⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    refine ⟨σ, hi σ hσ, ?_⟩
    by_cases hw : ((l : ℕ) : 𝓞 K) ∈ w.asIdeal
    · obtain ⟨A, hA, κ, hκ⟩ := hL.above w hw
      obtain ⟨O, _, _, _, Bw, hj⟩ := exists_bridge (l := l) hA hw
      obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
      have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
      obtain ⟨hp, he⟩ := ((hC w σ hσ).1 A hA rc (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc)).2 O Bw hj g.2
      refine _root_.UpperTheory.V.Lev.fixedSs_of_prints P K Ω l ι n M hM m r hL.cont w A hA O Bw hj κ hκ hp rc hrc σ (fun _ s => by rw [he]) ?_
      by_cases hlM : l ∣ M
      · exact Or.inl hlM
      refine Or.inr (Or.inr fun _ => ?_)
      obtain ⟨μ, m1, m2, -⟩ := flagPol K Ω l ι n M hM m r hL.cont w A hA O Bw hj κ hκ hp
      refine sphV (_root_.UpperTheory.V.Z.Win.toV' hrc) σ g.2.2 n fun s => ?_
      rw [← he, m1]
      simp only [fun i => m2 i s (UpperTheory.inertia_fixes_roots_of_unity_prime_to_residue_char K Ω w A hA M (not_mem_of_not_dvd hw hlM) s s.2), Units.val_one, C_1,
        Finset.prod_const, Finset.card_univ, Fintype.card_fin]
    · obtain ⟨A, hA, χ, h1, h2⟩ := hL.away w hw
      obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
      have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
      exact _root_.UpperTheory.V.Z.Win.T2.local_fixed_vectors_statement P K Ω n M hM w A hA rc hrc σ
        (_root_.UpperTheory.V.Af.weil_deligne_away_of_printed_results P K Ω l ι n M hM r hL.cont w hw A hA χ h1 h2 _
          ((((hC w σ hσ).1 A hA rc (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc)).1 hw).isWDOf g.2))
  · obtain ⟨⟨σ, hσ⟩, hi⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    have hBs := (((_root_.UpperTheory.V.Af.satake_local_of_printed_results P K n w σ).2 _ π.finPart (hi σ hσ) B).1 hB)
    refine _root_.UpperTheory.V.Z.Desc.W.satFrob_oneRec46 K Ω l ι n r w hw σ B hBs ?_
    intro A h
    obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense h
    have ht := _root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc
    exact ⟨rc, ht, ((hC w σ hσ).1 A h rc ht).1 hw⟩

end UpperTheory.V.Keep

namespace UpperTheory.GalN.V.Win.N
theorem rank3_witness_oneRec46
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_oneRec46 P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩


theorem countK_rank3_oneRec46 (P : _root_.UpperTheory.V.Af.Hypotheses') : CountK3Slice21 := by
  first
  | (rh_reduce 3 using [countK_rank3_of_witness21, rank3_witness_oneRec46]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact countK_rank3_of_witness21 P (rank3_witness_oneRec46 P)

end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.V.Z.Desc.W.satFrobT_alt limit 2000
rh_scan UpperTheory.V.Z.Desc.W.satFrob_oneRec46 limit 2000
rh_scan UpperTheory.V.Keep.levelCore_oneRec46 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_oneRec46 limit 2000
rh_prune UpperTheory.V.Z.Desc.W.satFrob_oneRec46 as RHSatFrobOneRecPruned46
#print axioms UpperTheory.V.Z.Desc.W.satFrob_original_bridge46
#print axioms UpperTheory.V.Keep.levelCore_oneRec46
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_oneRec46
