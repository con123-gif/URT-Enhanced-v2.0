import RHDependencySatakeOneRec46
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.AutomorphyLifting.PolarizedLinkage.CompatTOf
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepLevel
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 12 RUN47, 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine), SWARM, HANDOFF, AGENTS, state and living proof fetched; root RESEARCH_LOG/PROTOCOL paths returned 404. Latest peer integration 58dbb472 (actual row-to-window same witness), kernel 98267b5b (finite seed fixed-vector), and branch commit list inspected. Preserve peer independent reduction; do not merge uncompiled finite seed into this file.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native CompatTOf.lean 73dbca9717b2f9627bac9155bc98fed282b69201; GalUnitaryT.lean c8abf18366a433b84cc2f0148ccdc171fe1dfd31; KeepLevel.lean f6bf6656c2fa3abdfd7a1f660710ddd53091e203; TSatFrobT.lean 255c4e427392059ed2d072457dc9b87296c22650; previous dependency certificate 7220d0aacdabedba4618f9e0c059f73f95a31459 at 1208fb877acd252091b71e2516959baca4216e42. Stage previous as RHDependencySatakeOneRec46 following integration RUN47 alias normalization. 
RESULT: the cofinite model-identification branch of CompatTOf can use the same Satake-to-Frobenius argument as the final levelCore consumer. Given the SAME model R, place w, local component sigma, Satake multiset B and chosen reciprocity map rc, the native row supplies
  WDT iota R (rc (algNorm sigma)) =
    exists x, IsWDOf iota R x AND (Gd (rc (algNorm sigma)) -> x = rc (algNorm sigma)).
Take x = wdOf h hw iota R. Continuity gives IsWDOf, P.away.tor gives the conditional equality. Spherical Satake yields the diagonal parameter and its Gd property by the prior Satake lemma, so the resulting FrobEig matches the native normalization exactly. This removes the separate plainIff/sphUnl/gd_of/rec_eq_sat/frobEig_of argument at the cofinite identification consumer. No removal of H (PlainRec) globally: the later Hodge branch still uses gd_of and plain_all. The original Hodge and local comparison transports and cofinite semisimple isomorphism are retained. No separate witness for R or pi, no changes to weights or field. 
Original source-visible selected graph: KeepLevel.levelCore_alt -> compatT(rowOf' P.litN.aut.gal); exact internal body of compatT not authenticated here. Independent same-interface native supplier CompatTOf -> hRow, cofinite isoOfFrob -> suppFacts + plainIff/sphUnl/gd_of + rec_eq_sat + frobEig_of; later WDT.of_conj/PstConj/local_conj. Candidate graph: rank3_witness_sharedSat47 -> levelCore_sharedSat47 -> compatTOf_sharedSat47 applied to same row and existing plainRec -> same cofinite isoOfFrob -> suppFacts + local Satake conversion + satFrob_oneRec46 + native P.away.tor; final levelCore also uses satFrob_oneRec46. This is a proposed actual caller replacement of the same CompatT interface, NOT an assertion that original compatT calls compatTOf or that its transitive kernel dependencies were identified. Original graphs/axiom ledgers and fallback remain unchanged; no global node retirement. 
Conditional proof: native prior satFrob_oneRec46 must compile, and private aliases plain_all/gd_of in this file must resolve. If they do not, stage verbatim original local helper definitions in a separate overlay, or restore prior levelCore_oneRec46. Preserve all hypotheses including regularity, polarization, continuous semisimple R and r, same host, all places and reciprocity maps in the final CompatT conclusion, and local Hodge comparisons. Negative control: WDT is NOT unconditional IsWDOf for arbitrary y; retain Gd guard and prove it via diagonal Satake. Cannot apply cofinite equality at bad places or remove Ha/semisimplicity.
Cache context: source+toolchain, row, H, F, Omega, l, iota, n, R, r, pi, chi, w, sigma, B, A, h, rc and proof role; never merge different model R/r or different places. No URT ranking needed.
Executed 33 fail-on-error V8 static source/pin/reversible substitution/baseline checks: native CompatTOf blob; prior certificate blob; native KeepLevel blob; cofinite model identification unique; cofinite model identification reversible; theorem rename unique; theorem rename reversible; same representation isomorphism; same cofinite filter; direct model away tor; same local Satake bridge; no old specialized satWD route; retained later gd_of; same final WDT transport; same Hodge transport; same potentially semistable transport; actual KeepLevel call exists; actual core rename unique; actual core rename reversible; actual core compatibility substitution unique; actual core compatibility substitution reversible; rank3 caller substitution unique; rank3 caller substitution reversible; rank3 rename unique; rank3 rename reversible; count rename unique; count rename reversible; two rank witness references; same pi at actual witness; same final Satake; same native guard; prior CI strip output; prior CI prune output. No numerical simulation. Local lean/lake/elan absent (command -v checks); baseline CI status JSON blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0 for previous engines only. New module not compiled or queued; no new kernel axiom/constructor evidence, no PASS for this candidate, no speedup claim.
RESUME HERE: stage and compile prior Satake one-reciprocity module, then compatTOf_sharedSat47 and actual levelCore/rank3/count consumers, inspect rh_scan/rh_prune and axioms (original and replacement). Check same CompatT interface and root reachability via peer integration. If private alias or conversion fails retain original supplier; next isolate the essential row P.away.tor and P.above.nice suppliers. Quantitative cohomology and RH prime-window inequality remain open.
HANDOFF TO kernel extractor, integration, Galois, audit.
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

theorem UpperTheory.V.Z.Win.compatTOf_sharedSat47 :
    UpperTheory.V.Z.Win.CompatTOf := by
  intro hRow H F Ω _ _ _ _ _ _ l _ ι n hn r π hr hreg ⟨χ, hχ⟩ ha
  obtain ⟨R, wt, HT, P⟩ := hRow F Ω l ι n hn π χ hreg hχ
  have hRc : Continuous fun g => (R g : Matrix (Fin n) (Fin n) (Qbar l)) := Units.continuous_val.comp P.cont
  obtain ⟨p, hp⟩ : RepIso R r := by
    refine GlobalTheory.IsoOfFrobFree.main F Ω l ι n R r P.cont hr P.ss ha.1 ?_
    filter_upwards [ha.2, eventually_not_mem F l] with w ⟨B, hB, hf⟩ hw
    obtain ⟨⟨s, σ, hσ, -⟩, -⟩ := UpperTheory.V.Z.Gam.suppFacts F n hn π w
    obtain ⟨α, hα, hS⟩ := GlobalTheory.LFun.SphComp.hasSatake_of_isLocComp π ((CG.hasSat_mk π w B).1 hB) hσ
    have hBσ : GlobalTheory.LFun.HasSatGL w σ.ρ B := hα ▸ GlobalTheory.T.hasSatakeGL_of_hasSatakeParameters_principalSeries F w n _ σ.ρ α hS
    refine ⟨_, UpperTheory.V.Z.Desc.W.satFrob_oneRec46 F Ω l ι n R w hw σ B hBσ (fun A h => ?_), hf⟩
    obtain ⟨rc, hrc⟩ := UpperTheory.Zero.LLC.recTExists F Ω A w h
    exact ⟨rc, hrc, ⟨wdOf h hw ι R, isWDOf_wdOf hw ι hRc,
      fun g => (P.away w hw A h rc hrc σ hσ).tor g.1 g.2⟩⟩
  refine ⟨HT, P.weights, fun w σ hσ => ⟨fun A h rc hrc => ⟨fun hw => ?_, fun O _ _ _ Bw hj hg => ?_⟩, fun hT A h O _ _ _ Bw hj => ?_⟩⟩
  · exact WDT.of_conj ⟨wdOf h hw ι R, isWDOf_wdOf hw ι hRc, fun g => (P.away w hw A h rc hrc σ hσ).tor g.1 g.2⟩ hw p
      fun g => by rw [hp, inv_mul_cancel_right]
  · obtain ⟨-, k2, -, k4⟩ := (P.above (Loc.PP l) _ (Loc.tiedP l) w A h O Bw hj).nice σ hσ rc hrc (Or.inr hg.1) hg.2
    have h3 := GlobalTheory.PstConj.main F Ω l ι n _ _ (Loc.tiedP l) w A h O Bw hj (R.comp (Dec (F := F) A).subtype)
      (r.comp (Dec (F := F) A).subtype) p (fun g => hp g.1) k2
    exact ⟨h3.1, by rw [h3.2]; exact k4.tor hg.1 hg.2⟩
  · obtain ⟨rc, hrc⟩ := UpperTheory.Zero.LLC.recTExists F Ω A w h
    obtain ⟨g1, g2⟩ := gd_of H hn hrc hσ (plain_all hn hσ hT)
    obtain ⟨k1, -, k3, -⟩ := (P.above (Loc.PP l) _ (Loc.tiedP l) w A h O Bw hj).nice σ hσ rc hrc (Or.inr g1) g2
    obtain ⟨d1, -, -, d4⟩ := GlobalTheory.ConjLocal.local_conj l (Loc.PP l) F Ω O _ Bw n (R.comp (Dec (F := F) A).subtype)
      (r.comp (Dec (F := F) A).subtype) p fun g => hp g.1
    exact ⟨d1 k1, fun τ LL' τ' hi => d4 τ _ (k3 τ LL' τ' hi)⟩

namespace UpperTheory.V.Keep
theorem levelCore_sharedSat47 (P : _root_.UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ) (hn : 2 ≤ n) (m : Fin n → ℤ)
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
theorem rank3_witness_sharedSat47
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_sharedSat47 P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩


theorem countK_rank3_sharedSat47 (P : _root_.UpperTheory.V.Af.Hypotheses') : CountK3Slice21 := by
  first
  | (rh_reduce 3 using [countK_rank3_of_witness21, rank3_witness_sharedSat47]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact countK_rank3_of_witness21 P (rank3_witness_sharedSat47 P)

end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.V.Z.Win.compatTOf limit 2000
rh_scan UpperTheory.V.Z.Win.compatTOf_sharedSat47 limit 2000
rh_scan UpperTheory.V.Keep.levelCore_sharedSat47 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_sharedSat47 limit 2000
rh_prune UpperTheory.V.Z.Win.compatTOf_sharedSat47 as RHCompatSharedSatPruned47
#print axioms UpperTheory.V.Z.Win.compatTOf
#print axioms UpperTheory.V.Z.Win.compatTOf_sharedSat47
#print axioms UpperTheory.V.Keep.levelCore_sharedSat47
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_sharedSat47
