import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN21 lane 11, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission latest blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory
engine; AGENTS, SWARM, HANDOFF, EXPANSION and continuity preflight read.
Peer commits 9a71ca2c (orbit fibre), c5fe320e (row gauge), 94cfd3a4
(rank-one scalar), ba04fa11 (norm descent), 8be39223 (prime shell)
checked by commit metadata; distinct from this rank-three catalogue lane.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD observed 3cdce6af94b8d17e9f51ebf58b7ae7267d590787
(not adopted; no upstream equivalence inferred). Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Sources: DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean
1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40; AutQN.lean d626de1e423ebf58d4b7357f69905fd98829ff51;
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7.
Prior RUN20 blob c7690d1be83523d4ec31cd8ebfde42971b936cc3 and commit 2355b4d2 remain unchanged.

Actual consumer countK_alt builds catalogue via hform. The original
LevelKNAlt demands correct level and Frobenius data for every admissible
automorphic presentation; only one such presentation for each admitted
representation is used. Replace it by Rank3LevelWitness21, at quadratic
CM fields, rank three and m=(e-1,-1,-e-1). Retain one SAME pi for every
good v, not a separate pi for each v. This is the precise quantifier
reduction: (forall pi, eligible(r,pi) -> good(r,pi)) plus existence
implies (exists pi, good(r,pi)). No converse claimed.
Constants c,A chosen before e,M,p,w,l,Omega,iota; no local-to-uniform
inference. The native card, conjugacy, purity, integrality, global
Frobenius comparison and finite catalogue construction are unchanged.
The native rank-three catalogue is constructed directly, not by calling
the full CountKAlt supplier. All other CountKAlt uses survive.
Original local graph: KeepNumU -> CountKAlt -> countK_alt ->
LevelKNAlt + card_k_of_printed_results + Satake + conjugacy + purity +
integrality + iso_of_frobenius + exists_eigData.
Candidate: KeepNumU (RUN20) -> CountK3Slice21 -> countK_rank3_of_witness21
-> Rank3LevelWitness21 + same remaining suppliers at n=3.
Bridge rank3_witness_of_level21 retains the original fallback.
The two rank3 slice definitions are text-identical apart from names;
integration must check definitional equality and actual caller replay.
No original type/value/constructor/axiom evidence retired.
Context cache: pin, K/e/M/p/w/l/Omega/iota/r/pi, shared witnesses and
local guards. Avoid merging pointwise witness and uniform witness.

Static V8 source transformation executed 17 assertions (source
blobs, exact hform splice, retained native consumers). No native Lean,
Lake or elan on PATH. Actual prior status files read: runs 45577239749
and 45576756833 pass; 45670987597 jobs success (different certificate).
No new kernel or axiom PASS. rh_reduce/rh_auto/rh_auto_frontier
are prepared on actual local goal, with explicit fallback and
# print axioms plus scans; none executed in this session.
RESUME HERE: compile this direct producer and RUN20 together on the
existing pinned warmed runner; replace the call to countK3_slice_of_native20
(countK_alt ...) by the direct producer after verifying type equality,
scan values/types/constructors, inspect axiom output; then derive the
rank-three witness from the actual KeepLevel producer without full
LevelKNAlt. If failed, keep old graph. No RH proof, no URT speed claim.
HANDOFF TO integration, audit, Galois, acceleration. RH OPEN.
-/
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL UpperTheory.V.Published UpperTheory.V.Af.Bc
open scoped Matrix
namespace UpperTheory.GalN.V.Win.N

def CountK3Slice21 : Prop :=
  ∀ (K : Type) [Field K] [NumberField K] [IsCMField K], Module.finrank ℚ K = 2 → ∃ c A : ℕ,
    ∀ e : ℕ, 1 ≤ e → ∀ N : ℕ, 1 ≤ N →
    ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime → (p : 𝓞 K) ∈ w.asIdeal → ¬ p ∣ N → ¬ (p : ℤ) ∣ discr K →
      ∃ D : EigData 3 (normV w) ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] (-2), Nat.card D.S ≤ c * (N * (e + 1 + 1)) ^ A ∧
        ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p → ∀ (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ),
          D.Classifies (Ω := Ω) ι w (_root_.UpperTheory.GalN.V.AdmKNAlt ι N ![(e : ℤ) - 1, -1, -(e : ℤ) - 1])

def Rank3LevelWitness21 : Prop :=
  ∀ (K : Type) [Field K] [NumberField K] [IsCMField K], Module.finrank ℚ K = 2 →
    ∀ e : ℕ, 1 ≤ e → ∀ M : ℕ, 1 ≤ M →
    ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 →
    ∀ (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ)
      (r : G K Ω →* GL (Fin 3) (Qbar l)),
      _root_.UpperTheory.GalN.V.AdmKNAlt ι M ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] r →
      ∃ π : CuspSub K 3, π ∈ SigK K ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M ∧
        IsSSRep r ∧ ∀ w : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∉ w.asIdeal →
          ∀ B, (CG.mk π).HasSat w B → FrobEig ι r w (algSat 3 (normV w) B)

private theorem strict_rank3_21 (e : ℕ) (he : 1 ≤ e) :
    StrictAnti (![ (e : ℤ) - 1, -1, -(e : ℤ) - 1 ] : Fin 3 → ℤ) := by
  refine Fin.strictAnti_iff_succ_lt.2 fun i => ?_
  fin_cases i <;> simp <;> omega

theorem rank3_witness_of_level21 : _root_.UpperTheory.GalN.V.LevelKNAlt → Rank3LevelWitness21 := by
  intro hL K _ _ _ hK e he M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, h1, h2, h3⟩ := hr.aut.1
  obtain ⟨hπ, hF⟩ := hL K 3 (by norm_num) _ (strict_rank3_21 e he) M hM l hl2 Ω ι r π
    hr.level hr.odd (hr.aut.2 hr.level.cont) h1 h2 h3
  exact ⟨π, hπ, h3.1, hF⟩

theorem countK_rank3_of_witness21 :
    _root_.UpperTheory.V.Af.Hypotheses' → Rank3LevelWitness21 → CountK3Slice21 := by
  intro hP hW K _ _ _ hK
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Af.card_k_of_printed_results hP K 3 (by norm_num)
  refine ⟨c, A, fun e he M hM p w hp hw hpM hpd => ?_⟩
  let n : ℕ := 3
  let m : Fin n → ℤ := ![(e : ℤ) - 1, -1, -(e : ℤ) - 1]
  let H : ℕ := e + 1
  have hn : 2 ≤ n := by decide
  have hm : StrictAnti m := strict_rank3_21 e he
  have hwt : ∀ i, m i + m i.rev = 1 - (n : ℤ) := by
    intro i
    fin_cases i <;> simp [m, n, Fin.rev] <;> ring
  have hH : ∀ i, |m i| ≤ (H : ℤ) := by
    intro i
    rw [abs_le]
    fin_cases i <;> simp [m, n, H] <;> omega
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigK K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigK K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.V.Af.conjK_alt hP K n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := 1 - n)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intK_of_prints hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmKNAlt ι M m r}, ∃ π : ↥(SigK K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, hπ, hss, hF⟩ := hW K hK e he M hM l hl2 Ω ι r.1 r.2
    refine ⟨⟨π, hπ⟩, hss, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm

theorem countK_rank3_native_bridge21 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → CountK3Slice21 := by
  intro hP hL
  first
  | rh_reduce 3 using [countK_rank3_of_witness21, rank3_witness_of_level21]
  | exact countK_rank3_of_witness21 hP (rank3_witness_of_level21 hL)

theorem countK_rank3_auto21
    (hP : _root_.UpperTheory.V.Af.Hypotheses') (hW : Rank3LevelWitness21) :
    CountK3Slice21 := by
  first
  | rh_auto 2
  | exact countK_rank3_of_witness21 hP hW

theorem countK_rank3_frontier21
    (hP : _root_.UpperTheory.V.Af.Hypotheses') (hW : Rank3LevelWitness21) :
    CountK3Slice21 := by
  first
  | solve
    | rh_auto_frontier 2
  | exact countK_rank3_of_witness21 hP hW

end UpperTheory.GalN.V.Win.N

rh_prune UpperTheory.GalN.V.Win.N.countK_alt as RHCountKOriginal21
rh_scan UpperTheory.GalN.V.Win.N.countK_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_of_level21 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_rank3_of_witness21 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_rank3_native_bridge21 limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countK_alt
#print axioms UpperTheory.GalN.V.Win.N.rank3_witness_of_level21
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_of_witness21
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_native_bridge21
