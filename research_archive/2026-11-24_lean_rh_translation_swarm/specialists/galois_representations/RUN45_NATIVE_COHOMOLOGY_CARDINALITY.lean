import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClozelCohomology.ClozelConjC
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.PublishedHypothesesFromPatching
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN45 lane 5, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including unified engine read.
SWARM/HANDOFF/EXPANSION/AGENTS consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream head de330e73 (Lean 4.37.0-rc1) reported by peer 4daf9080, not migrated.
Peers 4daf9080 (one Clozel premise), 5744b095 (rank-sliced VWin),
086052c6 (flag coefficient dimension), 27896ee5 (rank3 witness), ba04fa11
(torsion descent), e827b4fe (SelL), 06c6e652 (small prime) surveyed.

Result beyond RUN44 and literature peer: BOTH local cohomological premises
can be supplied directly from native theorem bodies, with no explicit
Hypotheses' or LiteratureRankNHypothesis input to CardK/CardP.
Actual root-reachable package published_hypotheses_from_patching_alt
has cohC := clozelCohC_alt hN and borelC := Z.Coh.borelInjC.
TPCohC and Z.Coh.clozelCohC bodies EXACTLY match from choose m onward after
replacing lit.aut.coh with PositivityTheory.Rg.Cz.clozelCohomological.
The latter has body clozelCohomological_of_three whitLie_holds
kugaGlue_holds Coch.cochain_holds (blob 081eca8b2cfd6af2227a48c6f6150daadbbea136).
ClozelConjC.lean exposes Z.Coh.borelInjC := Lit.Geo.borelInjC.
Its defining body uses frameEx, oneReal, harmEx, degree count, deRhamInj,
indep, and noExact' (rapid decay and harmonic positivity).
The two native propositions therefore have existing theorem suppliers;
they are not free explicit assumptions at this local consumer. They
remain substantive mathematical obligations for human reconstruction
and transitive axiom review, not proved here from foundations.
No change to same Xi, U=KLev(3M), S, cardinal bound, exponents or quantifiers.
The original CountK/CountP bodies are reproduced with only the cardinality
call changed. hP and hL retained for Satake, conjugacy, integrality,
Frobenius isomorphism and automorphic level. Do not globally delete hN.
No RH-root import used as a shortcut. No new kernel closure or axiom claim.

Original selected graph: VWin -> CountI/V -> CountK/CountP -> CardK/P
-> Weyl(P), cohBoundFree, P.cohC (= clozelCohC_alt hN), P.borelC.
Reduced candidate: CountK/P_native45 -> CardK/P_native45 ->
Weyl(no P), cohBoundFree, Z.Coh.clozelCohC, Z.Coh.borelInjC.
Clozel branch -> clozelCohomological -> whitLie, kugaGlue, cochain;
Borel branch -> Lit.Geo.borelInjC -> harmonic and de Rham suppliers above.
All other graph edges, original fallback, unresolved type/value/constructor
edges and axiom evidence remain in previous records; new graph is source-only.
Context key pin/toolchain, exact K,n,m,H,M,S,Xi,U and actual consumer.

Pinned source blobs (relative to AutomorphicVarieties):
ModularityArgument/ThresholdArguments/DenseThresholdCases/PublishedHypothesesFromPatching.lean 8a57b35c343ed717c225b04710c835f102deaa3b
ModularityArgument/ThresholdArguments/DenseThresholdCases/TPCohC.lean 7f9fd373e34917fa49051b81aa0202984519afe8
ModularityArgument/ClozelCohomology/ClozelCohC.lean a9018b183d3e089c17cec8b6a4052aad80f9880e
ModularityArgument/ClozelCohomology/ClozelConjC.lean ee87c465349ad0e87d461ead8aa003dbebc88477
LiteratureResults/LieGeometryGrowth/BorelInjC.lean 36aac37b6952a97b7b4df8670c15f91f01c14549
ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
RUN44 source blob 705692c4c3df89feb3132895ae65e32d5b8a5d96; predecessor unchanged.
Executed 25 fail-on-error static source checks:
pin ModularityArgument/ThresholdArguments/DenseThresholdCases/PublishedHypothesesFromPatching.lean; pin ModularityArgument/ThresholdArguments/DenseThresholdCases/TPCohC.lean; pin ModularityArgument/ClozelCohomology/ClozelCohC.lean; pin ModularityArgument/ClozelCohomology/ClozelConjC.lean; pin LiteratureResults/LieGeometryGrowth/BorelInjC.lean; pin ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean; actual package fields; native Borel wrapper; Borel body and non-exactness; Clozel body exact equality after supplier substitution; RUN44 body; occurrences UpperTheory.V.Published.ClozelCohC → UpperTheory.V.Published.BorelInjC →  = 2; occurrences intro hClozel hBorel K = 2; occurrences hBorel K n = 2; occurrences hClozel K n = 2; occurrences  hP.cohC hP.borelC K n hn = 2; occurrences weyl_complex44 = 3; occurrences klev_three44 = 3; occurrences card_k_from_coh44 = 2; occurrences cardP_from_coh44 = 2; occurrences countK_coh44 = 1; occurrences countP_coh44 = 1; actual consumer body exact countK_alt; actual consumer body exact countP_alt; no inserted proof holes.
Local lean/lake/elan absent. Historical CI jobs 45577239749, 45576756833
and 45670987597 retrieved: pick/run/record success; none compiles this file.
Native verification instructions below; no PASS for this candidate.

RESUME HERE: replay this self-contained candidate with native engines,
compare CountK/CountP original and reduced dependency/axiom ledgers.
Inspect the three actual Clozel suppliers and Borel noExact'/deRhamInj
for weakest sufficient native rank-three/rank-two interface. Coordinate
with 5744b095 and 086052c6; do not redo local cardinal estimates.
HANDOFF TO kernel, literature, audit, integration. RH OPEN.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
noncomputable section
open NumberField GlobalTheory.CuspRep GlobalTheory.GKCoh
open UpperTheory.V.Published

theorem UpperTheory.V.Af.weyl_complex45 :
    UpperTheory.V.Af.WeylC := by
  intro E _ _ _ n
  refine ⟨((n + 1) ^ 2) ^ (n * n * Fintype.card (E →+* ℂ)), n * n * Fintype.card (E →+* ℂ), fun m hm H hH => ?_⟩
  have hb := fun i => abs_le.1 (hH i)
  let ν : Fin n → ℕ := fun k => ((k : ℕ) + 1 + H - m k.rev : ℤ).toNat
  have hν : ∀ k, (ν k : ℤ) = (k : ℕ) + 1 + H - m k.rev := fun k => Int.toNat_of_nonneg (by have := hb k.rev; omega)
  have hanti : Antitone ν := by
    cases n with
    | zero => exact fun i => i.elim0
    | succ n =>
      refine Fin.antitone_iff_succ_le.2 fun i => ?_
      have h1 := hν i.succ
      have h2 := hν i.castSucc
      have h3 : m i.castSucc.rev < m i.succ.rev := hm (Fin.rev_lt_rev.2 Fin.castSucc_lt_succ)
      simp only [Fin.val_succ, Fin.val_castSucc] at h1 h2
      omega
  have hle : ∀ k, ν k ≤ n + 2 * H := fun k => by
    have h1 := hν k
    have h2 := hb k.rev
    have h3 := k.2
    omega
  obtain ⟨P, hP, hd, hw⟩ := UpperTheory.V.Weyl.existsScalar n ν hanti _ hle
  obtain ⟨Ξ, h1, h2⟩ := UpperTheory.V.WeylC.exists_tens (E := E) P hP _ hw (n + H)
  refine ⟨Ξ, fun τ => (UpperTheory.V.WeylC.algInfChar_iff _ _ _).2 ⟨by simp [UpperTheory.V.Af.infOf], fun u => ?_⟩, ?_⟩
  · rw [h2, UpperTheory.V.Af.infOf, Multiset.map_map, Multiset.map_map]
    congr 1
    refine (Fintype.prod_equiv Fin.revPerm _ _ fun k => ?_)
    have h3 : ((ν k : ℕ) : ℂ) = (k : ℕ) + 1 + H - m k.rev := by exact_mod_cast congrArg (Int.cast : ℤ → ℂ) (hν k)
    simp only [Function.comp_apply, Fin.revPerm_apply, h3]
    push_cast
    ring
  · refine h1.trans ((Nat.pow_le_pow_left hd _).trans ?_)
    rw [← pow_mul, ← mul_pow]
    exact Nat.pow_le_pow_left (by nlinarith [Nat.zero_le (n * n * H), Nat.zero_le H, Nat.zero_le n]) _

private theorem klev_three45 (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e

theorem UpperTheory.V.Af.card_k_native45 :
    UpperTheory.V.Af.CardK := by
  intro K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex45 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := UpperTheory.V.Z.Coh.borelInjC K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨UpperTheory.V.Z.Coh.clozelCohC K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three45 K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

theorem UpperTheory.V.Br.cardP_native45 :
    UpperTheory.V.Br.CardP := by
  intro K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex45 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := UpperTheory.V.Z.Coh.borelInjC K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨UpperTheory.V.Z.Coh.clozelCohC K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three45 K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.GalOfCusp
open scoped Matrix
open Formalism.L2.Host GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal UpperTheory.V.Published
open UpperTheory.V.Af.Bc
namespace UpperTheory.GalN.V.Win.N
theorem countK_native45 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.Win.N.CountKAlt := by
  intro hP hL K _ _ _ n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Af.card_k_native45 K n hn
  refine ⟨c, A, fun m hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
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
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut.1
    obtain ⟨hπ, hF⟩ := hL K n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.odd (r.2.aut.2 r.2.level.cont) h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
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

theorem countP_native45 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.Win.N.CountPAlt := by
  intro hP hL K _ _ _ hK n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Br.cardP_native45 K n hn
  refine ⟨c, A, fun m wt hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigP K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigP K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.GalN.V.conjP_alt hP K hK n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := wt)
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
      exact _root_.UpperTheory.V.Z.Int.intP'_alt hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmPNAlt ι M m r}, ∃ π : ↥(SigP K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut
    obtain ⟨hπ, hF⟩ := hL K hK n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.safe r.2.unl h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
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
end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.V.Z.Coh.clozelCohC limit 2000
rh_scan UpperTheory.V.Lit.Geo.borelInjC limit 2000
rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan UpperTheory.V.Af.card_k_native45 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_native45 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_native45 limit 2000
rh_prune UpperTheory.V.Af.clozelCohC_alt as RH45ClozelPruned
rh_prune UpperTheory.V.Af.weyl_complex_of_printed_results as RH45WeylPruned
#print axioms UpperTheory.V.Z.Coh.clozelCohC
#print axioms UpperTheory.V.Z.Coh.borelInjC
#print axioms UpperTheory.V.Af.card_k_native45
#print axioms UpperTheory.V.Br.cardP_native45
#print axioms UpperTheory.GalN.V.Win.N.countK_native45
#print axioms UpperTheory.GalN.V.Win.N.countP_native45

example : UpperTheory.V.Af.CardK := by
  first | (rh_reduce 2 using [UpperTheory.V.Af.card_k_native45]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact UpperTheory.V.Af.card_k_native45

example : UpperTheory.V.Br.CardP := UpperTheory.V.Br.cardP_native45

example : UpperTheory.V.Af.Hypotheses' → UpperTheory.V.Af.CardK :=
  fun _ => UpperTheory.V.Af.card_k_native45

example : UpperTheory.V.Af.Hypotheses' → UpperTheory.V.Br.CardP :=
  fun _ => UpperTheory.V.Br.cardP_native45
