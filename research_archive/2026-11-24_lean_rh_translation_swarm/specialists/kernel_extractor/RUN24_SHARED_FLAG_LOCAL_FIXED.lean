import RUN23_FINITE_SEED_GLOBAL_FIXED
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN24 lane 11, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine,
AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity openings read.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream head observed 4249e7b98bbb0ad3ba610e4c8c978fabf4569a83, not mixed.
RUN23 blob 6667bb8121b7a188a1c0e35cdeba61700967930a; peer integration fccd0f04452988a6fc523b48611e317295decc98
actual joint levelCore inspected: exactly the same above-l block. Peer
2becd062 scaled primary SFew, 86b7bdd4 Casimir, 17b56ded Sha, f3faec21 Satake
noted by commit message. No exhaustive peer audit.
Native paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/:
KeepLevel.lean f6bf6656c2fa3abdfd7a1f660710ddd53091e203; LevFixedSs.lean 56633d27a3559817cc0d7addbc91212855f002b7;
LevDefs.lean 0997f122799c6e933599dfb92d6f1460fb036860; FixedDvd.lean 8179b70e090cd1818b270cc001ca8d8a699b38f5;
EqOneOfDvd.lean d47c54805e422ce8286ceae3eb0392abd5d768ea.

RESULT: at a place above l in the finite seed S of the SAME representation,
the generic FixedSsAlt disjunction is unnecessary. The native proof
constructs flagPol inside fixedSs_of_prints and again at the actual caller
if l does not divide M. Use the SAME flag witness μ once for both.
If l|M, M lies in w and for inertia fixing M-th roots the exact
characteristic polynomial is (X-1)^n; apply fixedDvd' directly.
If l does not divide M, M is not in w (native not_mem_of_not_dvd).
Inertia fixes all M-th roots, so every μ_i(inertia)=1. The same factorization
supplies the first (Iwahori) output of fixedUnr_alt, and sphV converts this
to sphericality using the native guard and exactly the same polynomial.
A spherical vector is fixed by KLoc by subgroup inclusion. Thus the local
requirement is the two explicit scalar/representation conditions with
one shared μ; no need for the unused flag separation hG or generic
l|M / nonresonance / spherical implication disjunction in this branch.
This does not prove fixedDvd', fixedUnr_alt or sphV from first principles,
nor does it remove all their internal branches from the global DAG.
No change to away-l, infinity or Satake conditions; rank-three context
retained. Native actual core and caller replacement provided below.
Original selected source graph:
levelCore_finite23 -> fixedSs_of_prints -> fixed_semisimple_of_flag_fixed_dvd_fixed_unramified
 -> flagPol, fixedDvd', fixedUnr_alt; caller -> second flagPol, sphV.
Reduced source graph:
levelCore_oneFlag24 -> one flagPol, fixedDvd' (l|M) OR fixedUnr_alt.1 + sphV.
Original graph, all pending role/axiom evidence and fallback preserved.
Cache SAME P,K,n,m,M,l,Ω,ι,r,π,w,A,hA,rc,σ,κ,hp,he,μ,guard and seed.
Do not infer global removal or native proof-term size improvement from this.
Negative controls: no dropping hIwa (sphV requires it); no replacing
membership by divisibility at arbitrary places not above l; no mixing flags.

Executed 24 V8 source pin, native block, consumer and reversible splice
assertions, no numerical surrogate. Local command -v lean/lake/elan no paths.
Actual historical baseline status 45577239749 and 45576756833 pass; separately
actual conditional diagonal root CI 45670987597 pass, result blob
78072e44e60b0725f99c7cad36327e64a9a45114 and scan ledger
82313a98e9d31fee19a8cd02d83b719e76f4ed96 inspected: eight named results have
only propext, Classical.choice, Quot.sound; all ten bounded scans missing=0;
root 2000 visited / 291 pending; three prune attempts no reduction.
This is analytic conditional only; no native validation of RUN24.
No new root leaf closure, no URT advantage. Not queued: no verified full
built native source environment in this session. Do not use a claimed RH
theorem import. Replay after RUN20/21/22/23 in existing pinned environment.
RESUME HERE: stage RUN24 and run native scan/prune and axiom audit on actual
levelCore_oneFlag24 and rank3_witness_oneFlag24; compile prior modules first.
If successful splice identical block into peer joint48 at row consumer;
if failure revert to finite23 / original. Check shared flag and the
actual hIwa/sphV types, then pursue direct ramified support and spherical
supplier. HANDOFF TO integration, audit, dependency, Galois. RH OPEN.
-/
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL GlobalTheory.GalOfCusp
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Lev UpperTheory.V.Z.Win
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField
open private infOf_of_weights not_mem_of_not_dvd from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.SemisimpleLevels.LevelKO
namespace UpperTheory.V.Keep
theorem levelCore_oneFlag24 (P : _root_.UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ) (hn : 2 ≤ n) (m : Fin n → ℤ)
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
      obtain ⟨μ, m1, m2, -⟩ := flagPol K Ω l ι n M hM m r hL.cont w A hA O Bw hj κ hκ hp
      have hpol : ∀ s, (rc (algNorm σ)).charPol s = ∏ i, (X - C (μ i s : ℂ)) := fun s => by
        rw [← he, m1]
      by_cases hlM : l ∣ M
      · have hwM : (M : 𝓞 K) ∈ w.asIdeal := by
          obtain ⟨k, rfl⟩ := hlM
          rw [Nat.cast_mul]
          exact Ideal.mul_mem_right _ _ hw
        refine _root_.UpperTheory.V.Z.Win.T2.fixedDvd' P K Ω n M hM w hwM A hA rc hrc σ fun s hs => ?_
        rw [hpol]
        simp [m2 _ s hs]
      · have hwM := not_mem_of_not_dvd hw hlM
        have hin : ∀ i (s : ↥(Ine (F := K) A)), μ i (ineIncl hA s) = 1 := fun i s =>
          m2 i s (UpperTheory.inertia_fixes_roots_of_unity_prime_to_residue_char K Ω w A hA M hwM s s.2)
        have hiw := (_root_.UpperTheory.V.Z.Win.T2.fixedUnr_alt P K Ω n w A hA rc hrc σ μ hpol hin).1
        have hS : GlobalTheory.SmGL.IsSpherical σ.ρ := by
          refine sphV (_root_.UpperTheory.V.Z.Win.toV' hrc) σ g.2.2 n (fun s => ?_) hiw
          rw [← he, m1]
          simp only [fun i => m2 i s (UpperTheory.inertia_fixes_roots_of_unity_prime_to_residue_char K Ω w A hA M hwM s s.2), Units.val_one, C_1,
            Finset.prod_const, Finset.card_univ, Fintype.card_fin]
        obtain ⟨v, hv, hv0⟩ := (Submodule.ne_bot_iff _).1 hS
        exact ⟨v, hv0, fun u hu => by simpa using hv ⟨u, (UpperTheory.mem_maximalCompact_and_congruent_of_mem_principalCongruence K w n M u hu).1⟩⟩
    · obtain ⟨A, hA, χ, h1, h2⟩ := hL.away w hw
      obtain ⟨rc, hrc⟩ := P.exists_reciprocity_dense hA
      have g := guard_of plainRec hreg ha hW (hw' w) (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc) hσ
      exact _root_.UpperTheory.V.Z.Win.T2.local_fixed_vectors_statement P K Ω n M hM w A hA rc hrc σ
        (_root_.UpperTheory.V.Af.weil_deligne_away_of_printed_results P K Ω l ι n M hM r hL.cont w hw A hA χ h1 h2 _
          ((((hC w σ hσ).1 A hA rc (_root_.UpperTheory.V.Z.Desc.W.isRecT_of_isRecT P hrc)).1 hw).isWDOf g.2))
  · obtain ⟨⟨σ, hσ⟩, hi⟩ := _root_.UpperTheory.V.Af.local_comp_complex_of_printed_results P K n π w
    exact _root_.UpperTheory.V.Z.Desc.W.satFrobT_alt P K Ω l ι n r hL.cont w hw σ B (((_root_.UpperTheory.V.Af.satake_local_of_printed_results P K n w σ).2 _ π.finPart (hi σ hσ) B).1 hB)
      fun A h rc hrc => ((hC w σ hσ).1 A h rc hrc).1 hw

end UpperTheory.V.Keep
open scoped Matrix
namespace UpperTheory.GalN.V.Win.N
theorem rank3_witness_oneFlag24
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_oneFlag24 P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩
end UpperTheory.GalN.V.Win.N
rh_scan UpperTheory.V.Keep.levelCore_alt limit 2000
rh_scan UpperTheory.V.Keep.levelCore_oneFlag24 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_oneFlag24 limit 2000
rh_prune UpperTheory.V.Keep.levelCore_oneFlag24 as RHCoreFlagPruned24
#print axioms UpperTheory.V.Keep.levelCore_alt
#print axioms UpperTheory.V.Keep.levelCore_oneFlag24
#print axioms UpperTheory.GalN.V.Win.N.rank3_witness_oneFlag24
end
