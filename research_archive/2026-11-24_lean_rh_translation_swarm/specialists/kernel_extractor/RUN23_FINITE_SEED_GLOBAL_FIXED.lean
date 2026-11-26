import RUN22_DIRECT_KEEPLEVEL_WITNESS
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepLevel
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN23 lane 11, 26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory engine,
AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity openings read.
Latest peer integration 58dbb472 (shared row witness), acceleration 2c6af8dc
(even Frobenius trace), editor 8d7348e7 (determinant fibres) read.
Previous RUN22 5d4f6c50; commit searches globFixed / finite exceptional /
fixed vector did not find this exact finite-seed reduction among returned hits.
Upstream DenseThresholdCases/TGlobFixed.lean 93a56295af362b97364adc5d34f8cd6ca107467a,
KeepLevel.lean f6bf6656c2fa3abdfd7a1f660710ddd53091e203, AutomorphicForms/LocIsotypic.lean
86b9b325ae4f32e8cea34ed243a78450ff4e89ab,
TemperedLocalComponents/GlobFixed.lean 51a1fe2b7434d79f9e763fd72601c60e097709b7.

Result: Fix ONE global representation rho and a nonzero seed vector fixed
by KAway(S). It suffices to establish local isotypy and nonzero level-fixed
vectors at w in this SINGLE finite set S, not every finite place, for the
global fixed-vector output. Inductively remove w: the local action commutes
with KAway(insert w S); native sub_fixed gives a nonzero common fixed vector.
Each k in KAway(S) factors as (k loc(k_w)^(-1)) loc(k_w), and both factors
fix that vector. Empty S is the entire KLev. This is a genuinely weaker
conditional interface; no uniform bound on |S| or ability to compute S is
asserted. Smoothness supplies the seed using native exists_KAway_subset;
at the actual levelCore consumer pi.ne_bot supplies nontriviality without
an arbitrary auxiliary local place. The unused P and 1<=M disappear from
the fixed-vector bridge itself, NOT from the core's other branches.

Original source-visible selected graph (retain):
rank3_witness_of_core22 -> levelCore_alt -> globFixed_alt
-> exists_KAway_subset, sub_fixed, local isotypy/fixed witnesses for all w.
Candidate graph:
rank3_witness_finite23 -> levelCore_finite23 -> globFixed_seed
+ exists_KAway_subset + pi.ne_bot + same local suppliers restricted to S.
Original infinity-jump and away-Frobenius branches copied unchanged;
all their place quantifiers and compatT, guard_of, arithmetic conditions
remain, including all B in Frobenius. Same K, n=3, e, M, l, Omega, iota, r,
pi and seed-dependent S; never merge contexts by declaration name alone.
No quantitative catalogue or VWin closure or global dependency deletion.
Original fallback: rank3_witness_of_core22 and native levelCore_alt.

Executed 19 fail-on-error V8 source and transformation checks:
glob blob; core blob; induction found; universal local use; only one local invocation; commuting place decomposition; factorization; source P and level bound unused; finite local use; subset transport; seed retained; induction base; actual consumer unique; no old global call; same compatT; same satake; same above and away; prior witness pin; actual witness spliced.
No numerical surrogate. Negative mathematical control: S empty with no
nonzero seed is insufficient (zero representation space has no fixed
nonzero vector). Removing a place without its local witness is not allowed.
No local lean/lake binaries. Historical native status.json reread:
45577239749 returncode 0 (conditional root); 45576756833 returncode 0
(bounded prune scan). Those runs do not verify this file. New native
role graphs, #print axioms, reduction tactic outputs remain outstanding.
Not queued here; stage in the existing pinned warmed batch runner.

RESUME HERE: compile this module after RUN22 and the three native engines.
Check finite-seed lemma, exact original bridge, actual core and rank-three
witness, then scan/prune and compare axiom output; retain failed attempts.
If successful propagate rank3_witness_finite23 to row-to-window peer 58dbb472.
Next prove the restricted fixed witnesses from actual local ramification
and level data; do not drop the infinity or Satake consumers.
HANDOFF TO integration, dependency, Galois, audit, acceleration. RH OPEN.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain GlobalTheory.CuspRep Filter Topology Matrix
open UpperTheory.V.Af UpperTheory.V.Af.GlobalFixedVectors

namespace RHLane11Finite23
theorem globFixed_seed (F : Type) [Field F] [NumberField F] (n M : ℕ)
    (V : Type) [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ (GL (Fin n) (Af F)) V)
    (S : Finset (HeightOneSpectrum (𝓞 F))) (hseed : HasFixed ρ (KAway n M S))
    (hlocal : ∀ w ∈ S, ∃ σ, LocIsotypic ρ w σ ∧ HasFixed σ.ρ (KLoc F w n M)) :
    HasFixed ρ (KLev F n M) := by
  classical
  have key : ∀ S : Finset (HeightOneSpectrum (𝓞 F)),
      (∀ w ∈ S, ∃ σ, LocIsotypic ρ w σ ∧ HasFixed σ.ρ (KLoc F w n M)) →
      HasFixed ρ (KAway n M S) → HasFixed ρ (KAway n M ∅) := by
    intro S
    induction S using Finset.induction_on with
    | empty => intro _; exact id
    | insert w S hw ih =>
      intro h
      rintro ⟨v, hv0, hv⟩
      obtain ⟨σ, ⟨-, hσ⟩, hfix⟩ := h w (Finset.mem_insert_self _ _)
      let W : Submodule ℂ V := ⨅ k : KAway n M (insert w S), LinearMap.ker (ρ k - 1)
      have hWm : ∀ x, x ∈ W ↔ ∀ k ∈ KAway n M (insert w S), ρ k x = x := fun x => by
        simp [W, Submodule.mem_iInf, sub_eq_zero]
      obtain ⟨x, hxW, hx0, hx⟩ := sub_fixed σ.ρ σ.irred (ρ.comp (locGL F n w)) hσ W (fun g x hx => (hWm _).2 fun k hk => by
        have e : k * locGL F n w g = locGL F n w g * k := gl_ext fun u => by
          by_cases hu : u = w
          · subst hu; simp [(mem_KAway.1 hk).2 u (Finset.mem_insert_self _ _)]
          · simp [pLoc_locGL_of_ne hu]
        change ρ k (ρ (locGL F n w g) x) = ρ (locGL F n w g) x
        rw [← Module.End.mul_apply, ← map_mul, e, map_mul, Module.End.mul_apply, (hWm x).1 hx k hk])
        (fun e => hv0 (by simpa [e] using (hWm v).2 hv)) _ hfix
      refine ih (fun u hu => h u (Finset.mem_insert_of_mem hu)) ⟨x, hx0, fun k hk => ?_⟩
      have h1 := loc_mem w (mem_KAway.1 hk).1
      have h2 : k * (locGL F n w (GeneralLinearGroup.map (pLoc F w) k))⁻¹ ∈ KAway n M (insert w S) := by
        refine mem_KAway.2 ⟨mul_mem (mem_KAway.1 hk).1 (inv_mem h1), fun u hu => ?_⟩
        by_cases huw : u = w
        · subst huw; simp [pLoc_locGL]
        · simp [pLoc_locGL_of_ne huw, (mem_KAway.1 hk).2 u ((Finset.mem_insert.1 hu).resolve_left huw)]
      have h3 : ρ (locGL F n w (GeneralLinearGroup.map (pLoc F w) k)) x = x := hx _ h1
      have h4 := (hWm x).1 hxW _ h2
      rwa [← h3, ← Module.End.mul_apply, ← map_mul, inv_mul_cancel_right, h3] at h4
  obtain ⟨x, hx0, hx⟩ := key S hlocal hseed
  exact ⟨x, hx0, fun k hk => hx k (mem_KAway.2 ⟨hk, by simp⟩)⟩

theorem globFixed_bridge : GlobFixed := by
  classical
  intro F _ _ n M _ V _ _ ρ hρ h
  obtain ⟨w⟩ : Nonempty (HeightOneSpectrum (𝓞 F)) := by
    obtain ⟨m, hm⟩ := Ideal.exists_maximal (𝓞 F)
    exact ⟨⟨m, hm.isPrime, Ring.ne_bot_of_isMaximal_of_not_isField hm (RingOfIntegers.not_isField F)⟩⟩
  obtain ⟨σ, ⟨hV, -⟩, -⟩ := h w
  obtain ⟨v, hv⟩ := exists_ne (0 : V)
  obtain ⟨S, hS⟩ := exists_KAway_subset (M := M) ((hρ v).mem_nhds (by simp))
  have hseed : HasFixed ρ (KAway n M S) := ⟨v, hv, fun k hk => hS hk⟩
  have hlocal : ∀ w ∈ S, ∃ σ, LocIsotypic ρ w σ ∧ HasFixed σ.ρ (KLoc F w n M) := fun w _ => h w
  first
  | (rh_reduce 3 using [globFixed_seed F n M V ρ S hseed hlocal]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact globFixed_seed F n M V ρ S hseed hlocal
end RHLane11Finite23

section
open private infOf_of_weights not_mem_of_not_dvd from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.SemisimpleLevels.LevelKO
open Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL GlobalTheory.GalOfCusp
open UpperTheory.V UpperTheory.V.Lev UpperTheory.V.Z.Win
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField
namespace UpperTheory.V.Keep
theorem levelCore_finite23 (P : _root_.UpperTheory.V.Af.Hypotheses') (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ) (hn : 2 ≤ n) (m : Fin n → ℤ)
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
    exact _root_.UpperTheory.V.Z.Desc.W.satFrobT_alt P K Ω l ι n r hL.cont w hw σ B (((_root_.UpperTheory.V.Af.satake_local_of_printed_results P K n w σ).2 _ π.finPart (hi σ hσ) B).1 hB)
      fun A h rc hrc => ((hC w σ hσ).1 A h rc hrc).1 hw

end UpperTheory.V.Keep

open scoped Matrix
namespace UpperTheory.GalN.V.Win.N
theorem rank3_witness_finite23
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_finite23 P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩


end UpperTheory.GalN.V.Win.N
end

rh_scan UpperTheory.V.Af.globFixed_alt limit 2000
rh_scan RHLane11Finite23.globFixed_seed limit 2000
rh_scan UpperTheory.V.Keep.levelCore_finite23 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_finite23 limit 2000
rh_prune UpperTheory.V.Af.globFixed_alt as RHGlobFixedPruned23
rh_prune UpperTheory.V.Keep.levelCore_finite23 as RHCoreFinitePruned23
#print axioms UpperTheory.V.Af.globFixed_alt
#print axioms RHLane11Finite23.globFixed_seed
#print axioms RHLane11Finite23.globFixed_bridge
#print axioms UpperTheory.V.Keep.levelCore_alt
#print axioms UpperTheory.V.Keep.levelCore_finite23
#print axioms UpperTheory.GalN.V.Win.N.rank3_witness_finite23
end
