import RHIntegrationRow47
import RHDependencyCompat47
import RHKernelFinite23
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration RUN48, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
One result: compose the two independent reductions at the SAME rank-three levelCore and actual row-to-window caller. The global fixed-vector branch requires local witnesses only on one finite set S selected by a nonzero smooth seed of the SAME pi; cofinite model identification and final Frobenius branch share satFrob_oneRec46. No stronger claim that all places disappear: the infinity-jump and final away-Frobenius branches retain their full quantifiers. No new unconditional proof or global node retirement.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine, AGENTS, SWARM, HANDOFF, state openings read; latest selected handoffs from all 14 peers inspected (math terminal prime; audit exact Pe unit; dependency shared Satake; structure finite cofinal Hecke; character joint late Sha; Galois Casimir; kernel finite seed; Landau normalized mass; literature relative level; acceleration even trace; geometry Euler mean; prime cyclic descent; editor relative mass; theta trace-one lift).
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer source blobs 8144e2875f80bfe451f70b17221641c1db85fab1 (dependencies/2026-11-26_0512_COMPAT_SHARED_SATAKE.lean), 6667bb8121b7a188a1c0e35cdeba61700967930a (specialists/kernel_extractor/RUN23_FINITE_SEED_GLOBAL_FIXED.lean), cf35323d97439ae28fbd3f3eaf7d2637ec971347 (integration/2026-11-26_0500_ROW_TO_WINDOW_SHARED_WITNESS.lean). Native source pins reported by these peers: KeepLevel f6bf6656c2fa3abdfd7a1f660710ddd53091e203, CompatTOf 73dbca9717b2f9627bac9155bc98fed282b69201, TGlobFixed 93a56295af362b97364adc5d34f8cd6ca107467a, VwinOfRow 4cba179acd45ac08d3cad21f51c9b9d62715a9a4. Stage peers as RHDependencyCompat47, RHKernelFinite23 and RHIntegrationRow47, normalizing their transitive import aliases as in RUN47, including RUN20/21/22 exactly once. Do not edit archive originals.
Original selected graph: vwin_of_row -> automorphic_window_of_inputs -> v_window_of_depth_zero_residual_bc_cm -> v_window_of_literal_automorphy_n -> v_window_of_automorphy_csd_ss_mono_odd -> vwin_of_hypotheses_H_E_alt -> rank-three level witness -> levelCore_alt -> compatT, globFixed_alt, satFrobT_alt. Prior RUN47 graph and both peers retained. Candidate: vwin_of_row48 -> same five wrapper signatures -> window_joint_native48 -> window_joint48 -> window_rank3_direct46 + rank3_witness_joint48 -> levelCore_joint48 -> compatTOf_sharedSat47 + globFixed_seed + satFrob_oneRec46. Separate Sha/qualitative, rank-three count, cohomology, literature, geometric and analytic premises unchanged. compatTOf is a proposed same-interface supplier, not an authenticated transitive dependency of compatT. All original role/axiom evidence and pending nodes retained. Cache exact row, O, bc, gal, cm, hN, hH, hSha, hSF, P, K, n, e, M, l, Omega, iota, r, pi, seed v, S, w, sigma, rc and all context/role keys, not names alone.
Executed 40 fail-on-error static checks: dependency pin; kernel pin; integration pin; range theorem levelCore_sharedSat47; range   · letI : Nontrivial π.V; range   · refine _root_.UpperTheory.V.Af.globFixed_alt; finite seed; old global supplier; all local fixed proofs byte-identical; finite block unique; finite block reversible; core name unique; core name reversible; range theorem rank3_witness_sharedSat47; witness name unique; witness name reversible; witness core unique; witness core reversible; range namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_keep47; row window_oneRec_native47 count 2; row reversible window_oneRec_native47; row window_oneRec47 count 2; row reversible window_oneRec47; row rank3_witness_oneRec46 count 1; row reversible rank3_witness_oneRec46; row v_window_of_automorphy_csd_ss_mono_odd47 count 2; row reversible v_window_of_automorphy_csd_ss_mono_odd47; row v_window_of_literal_automorphy_n47 count 2; row reversible v_window_of_literal_automorphy_n47; row v_window_of_depth_zero_residual_bc_cm47 count 2; row reversible v_window_of_depth_zero_residual_bc_cm47; row automorphic_window_of_inputs47 count 2; row reversible automorphic_window_of_inputs47; row vwin_of_row47 count 1; row reversible vwin_of_row47; both Satake uses retained; no old fixed consumer; Sha suppliers retained; shared row h retained; range set_option maxHeartbeats. Local command -v lean/lake/elan yielded no paths. Historical actual CI status.json blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc (45577239749), 7da354941e402b6f8b364ed03d8c5c82d27b7717 (45576756833) both status pass, returncode 0; baseline only. New module not compiled or queued; no new axiom evidence. No synthetic tests or URT benefit claim.
RESUME HERE: native replay staged peers separately, then this composite; check original-statement bridges and actual row scans with roles and pending counts. Backtrack to either single reduction if composition fails, and to RUN47 original fallback if necessary. Prioritize actual uniform STors/SFew and same-host relative mass; no more rank-three cardinal refinements until verification. HANDOFF TO kernel, audit, dependencies, Galois, editor. RH OPEN.
-/
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal GlobalTheory.LocGL GlobalTheory.GalOfCusp UpperTheory.V UpperTheory.V.Af
open UpperTheory.Zero.LLC GlobalTheory.UnitaryBC GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.RoadU UpperTheory.V.Z.Win UpperTheory.V.Lev
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField
open scoped Matrix
open private plain_all gd_of from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.AutomorphyLifting.PolarizedLinkage.CompatTOf
open private infOf_of_weights not_mem_of_not_dvd from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.SemisimpleLevels.LevelKO

namespace UpperTheory.V.Keep
theorem levelCore_joint48 (P : _root_.UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ) (hn : 2 ≤ n) (m : Fin n → ℤ)
    (M : ℕ) (hM : 1 ≤ M) (l : ℕ) [Fact l.Prime] (hl : l ≠ 2) (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ)
    (r : G K Ω →* GL (Fin n) (Qbar l)) (π : CuspSub K n) (hL : LevelF l M m r)
    (hU : ∀ w : HeightOneSpectrum (𝓞 K), ((l : ℕ) : 𝓞 K) ∈ w.asIdeal → Unl1 r w ∨ PotUnl r w) (hW : WitA ι r)
    (hreg : (CG.mk π).IsRegAlg) (hpol : ∃ χ, GlobalTheory.ContraPair.PolarizedPair π χ) (ha : AttC ι r π) :
    (∀ τ, π.HasInfChar τ (infOf m)) ∧ HasFixed π.finPart (KLev K n M) ∧
      ∀ w : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∉ w.asIdeal → ∀ B, (CG.mk π).HasSat w B → FrobEig ι r w (algSat n (normV w) B) := by
  obtain ⟨HT, hwt, hC⟩ := _root_.UpperTheory.V.Z.Win.compatTOf_sharedSat47 (_root_.UpperTheory.Gal.SV.rowOf' P.litN.aut.gal) plainRec K Ω l ι n (by omega) r π hL.cont hreg hpol ha
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
  · letI : Nontrivial π.V := Submodule.nontrivial_iff_ne_bot.2 π.ne_bot
    obtain ⟨v, hv⟩ := exists_ne (0 : π.V)
    obtain ⟨S, hS⟩ := _root_.UpperTheory.V.Af.GlobalFixedVectors.exists_KAway_subset
      (M := M) ((π.isSmooth_finPart v).mem_nhds (by simp))
    refine _root_.RHLane11Finite23.globFixed_seed K n M _ π.finPart S
      ⟨v, hv, fun k hk => hS hk⟩ (fun w _ => ?_)
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
theorem rank3_witness_joint48
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_joint48 P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩


end UpperTheory.GalN.V.Win.N

namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_joint48 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) (hSF : RHShaFinite40) : VWin := by
  have hW : _root_.UpperTheory.GalN.V.Win.N.Rank3LevelWitness21 :=
    _root_.UpperTheory.GalN.V.Win.N.rank3_witness_joint48 hH.toClassicalTheorems
  exact window_rank3_direct46 hH hSha hSF hW

theorem window_joint_native48 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_joint48 hH
  · first
    | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd40, _root_.UpperTheory.V.ZK.bOdd]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact _root_.UpperTheory.V.ZK.sha_of_bOdd40 _root_.UpperTheory.V.ZK.bOdd
  · exact shaLenFinite42_native

theorem v_window_of_automorphy_csd_ss_mono_odd48 (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) : VWin :=
  _root_.UpperTheory.V.HV.DescentVanishingReductions.window_joint_native48 (_root_.UpperTheory.V.HV.DescentVanishingReductions.published_hypotheses_from_patching_alt hN UpperTheory.V.Z.Tf.SR.descWeak)
end UpperTheory.V.HV.DescentVanishingReductions
end UpperTheory.V.HV.DescentVanishingReductions

theorem UpperTheory.V.v_window_of_literal_automorphy_n48 (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) : VWin :=
  _root_.UpperTheory.V.HV.DescentVanishingReductions.v_window_of_automorphy_csd_ss_mono_odd48 hN

theorem UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm48 (O : _root_.UpperTheory.LiteratureTheorems.OpenImageCondition)
 (bc : _root_.PositivityTheory.Rg.BcN.BaseChangeIsobaricN) (gal : _root_.UpperTheory.V.Z.Win.RowT) (cm : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureCMHypothesis) :
    UpperTheory.Top.VWin :=
  _root_.UpperTheory.V.v_window_of_literal_automorphy_n48 ⟨_root_.UpperTheory.One.Join.local_inputs_from_literature O, _root_.UpperTheory.One.Join.automorphic_inputs_from_literature O bc gal, _root_.UpperTheory.LiteratureTheorems.galois_cohomology_from_literature O, cm⟩

theorem UpperTheory.One.Join.automorphic_window_of_inputs48 (O : _root_.UpperTheory.LiteratureTheorems.OpenImageCondition)
 (bc : _root_.PositivityTheory.Rg.BcN.BaseChangeIsobaricN) (gal : _root_.UpperTheory.V.Z.Win.RowT) :
    UpperTheory.Top.VWin :=
  _root_.UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm48 O bc gal (_root_.UpperTheory.One.Join.cm_abelian_inputs_from_literature O)

theorem UpperTheory.One.vwin_of_row48 (h : UpperTheory.GalStar.Row0b fun h rc => UpperTheory.Zero.LLC.IsRecT h rc) : UpperTheory.Top.VWin :=
  UpperTheory.One.Join.automorphic_window_of_inputs48 (UpperTheory.LiteratureTheorems.OpenImageCondition.mk h) UpperTheory.BaseChangeIdentities.baseChangeN h


rh_scan UpperTheory.One.vwin_of_row limit 2000
rh_scan UpperTheory.One.vwin_of_row48 limit 2000
rh_scan UpperTheory.V.Keep.levelCore_joint48 limit 2000
rh_prune UpperTheory.V.Keep.levelCore_joint48 as RHJointCorePruned48
#print axioms UpperTheory.V.Keep.levelCore_joint48
#print axioms UpperTheory.GalN.V.Win.N.rank3_witness_joint48
#print axioms UpperTheory.One.vwin_of_row48
