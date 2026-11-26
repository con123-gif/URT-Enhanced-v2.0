import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN44 lane 5, 26 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED,
NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
pipeline, AGENTS/SWARM/HANDOFF/EXPANSION and continuity heads consulted.
Prior RUN43 retained. Peer 2355b4d2 rank-three slice, 3463c301 rank-two
joint, 054230d9 exponent compression, 74ad2c13 common Frobenius,
eadcc941 class quotient, 755b9251 theta, 6aaed9d5 Landau and 7e262184
prime-window read. No uncompiled peer overlay, no repeated exponent tuning.

Actual supplier reduction: the Weyl coefficient construction has no
mathematical use of the printed-results package P: the native binder is
literally "intro _ E ...". Copy the proof unchanged after removing that
unused argument. Thus WeylC follows from its existing mathematical
construction, not from the ten-field Hypotheses' record.
For both CardK and CardP, only ClozelCohC and BorelInjC are consumed.
The exact native bound before homogenization is
  |S| <= cohDim(top,KLev(K,n,3M),Xi.mat)
      <= c2*M^A2*Xi.d <= c1*c2*M^A2*(H+1)^A1.
The same coefficient Xi works for all members of S and the same level
inclusion KLev(3M) <= KLev(M) is used. The cohomology bound is the
unconditional native theorem cohBoundFree; its proof body constructs
A2=[F:Q]*n^2 using the index estimate and finite orbit bounds.
The actual CardK and CardP proof bodies are textually identical after
renaming signatures. We keep their different native predicates and
avoid inferring definitional equality. Eight other fields of Hypotheses'
are not needed at these two LOCAL cardinality suppliers, including litN,
conjC, galR, smoR, gkR, admR, bc, newform. No change of exponent or host.
This is not an unconditional automorphic count: the two genuine
cohomological literature inputs remain to authenticate, as do other
uses of the larger P record. In particular countK/countP still need
P for Satake, conjugacy, integrality and global Frobenius isomorphism.
No new global dependency closure claimed.

Original selected graph: CountI/V -> common trace -> countK_alt and
countQ_alt -> countP_alt -> card_k_of_printed_results/cardP_of_prints ->
Weyl(P), cohBoundFree, P.cohC, P.borelC.
Candidate: countK_coh44/countP_coh44 -> card_k_from_coh44/cardP_from_coh44
-> Weyl (no P), cohBoundFree, hClozel, hBorel. Both actual count
theorem bodies copied with only the cardinality call changed.
All original hypotheses, type/value/constructor graphs, unresolved
axiom evidence and alternate routes retained. Cache by pin/toolchain,
K,n,m,H,M,S,Xi, level, caller and hypotheses; no merging different
fields/weights. Backtrack to original on failed replay.
No claimed RH theorem imported as a shortcut.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest upstream de330e73d828ea08f621cb28395d48480806d00f reported by
peer 6aaed9d5; not independently refetched here; no migration.
Source ledger (relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
ModularityArgument/ThresholdArguments/DenseThresholdCases/TWeylC.lean d716d26265f83c1266a7f10f76c3fedc914bfb66
ModularityArgument/ThresholdArguments/DenseThresholdCases/TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96
ModularityArgument/ThresholdArguments/DenseThresholdCases/BrCardP.lean a2e96d9c993a392281385cc7f723acf78e614b21
ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
ModularityArgument/ThresholdArguments/DenseThresholdCases/AutomorphicFormHyp.lean 3bc564e5a5ab8c087c50cddef276d9fb799848a3
AutomorphicForms/TemperedLocalComponents/CohBoundFree.lean 3eb3da1c74e98bfa35f2b86c0942f380bf4748b0
Executed 67 fail-on-error static source/transform checks:
pin TWeylC; pin TCardK; pin Count; pin Hyp; pin BrCardP; pin Coh; find theorem UpperTheory.V.Af.weyl_complex_of_printed_results :; end theorem UpperTheory.V.Af.weyl_complex_of_printed_results :; Weyl rename unique; Weyl rename roundtrip; Weyl remove premise unique; Weyl remove premise roundtrip; Weyl remove unused binder unique; Weyl remove unused binder roundtrip; find private theorem klev_three ; end private theorem klev_three ; find private theorem klev_three ; end private theorem klev_three ; identical level inclusion helper; find theorem UpperTheory.V.Af.card_k_of_printed_results :; end theorem UpperTheory.V.Af.card_k_of_printed_results :; find theorem UpperTheory.V.Br.cardP_of_prints :; end theorem UpperTheory.V.Br.cardP_of_prints :; CardK/CardP identical bodies after signature rename; rename UpperTheory.V.Af.card_k_from_coh44 unique; rename UpperTheory.V.Af.card_k_from_coh44 roundtrip; two fields UpperTheory.V.Af.card_k_from_coh44 unique; two fields UpperTheory.V.Af.card_k_from_coh44 roundtrip; binders UpperTheory.V.Af.card_k_from_coh44 unique; binders UpperTheory.V.Af.card_k_from_coh44 roundtrip; Weyl supplier UpperTheory.V.Af.card_k_from_coh44 unique; Weyl supplier UpperTheory.V.Af.card_k_from_coh44 roundtrip; Borel UpperTheory.V.Af.card_k_from_coh44 unique; Borel UpperTheory.V.Af.card_k_from_coh44 roundtrip; Clozel UpperTheory.V.Af.card_k_from_coh44 unique; Clozel UpperTheory.V.Af.card_k_from_coh44 roundtrip; level helper UpperTheory.V.Af.card_k_from_coh44 unique; level helper UpperTheory.V.Af.card_k_from_coh44 roundtrip; rename UpperTheory.V.Br.cardP_from_coh44 unique; rename UpperTheory.V.Br.cardP_from_coh44 roundtrip; two fields UpperTheory.V.Br.cardP_from_coh44 unique; two fields UpperTheory.V.Br.cardP_from_coh44 roundtrip; binders UpperTheory.V.Br.cardP_from_coh44 unique; binders UpperTheory.V.Br.cardP_from_coh44 roundtrip; Weyl supplier UpperTheory.V.Br.cardP_from_coh44 unique; Weyl supplier UpperTheory.V.Br.cardP_from_coh44 roundtrip; Borel UpperTheory.V.Br.cardP_from_coh44 unique; Borel UpperTheory.V.Br.cardP_from_coh44 roundtrip; Clozel UpperTheory.V.Br.cardP_from_coh44 unique; Clozel UpperTheory.V.Br.cardP_from_coh44 roundtrip; level helper UpperTheory.V.Br.cardP_from_coh44 unique; level helper UpperTheory.V.Br.cardP_from_coh44 roundtrip; find theorem countK_alt :; end theorem countK_alt :; countK rename unique; countK rename roundtrip; countK supplier unique; countK supplier roundtrip; find theorem countP_alt :; end theorem countP_alt :; countP rename unique; countP rename roundtrip; countP supplier unique; countP supplier roundtrip; actual hypothesis field types; cohomology unconditional source and exponent; no inserted proof holes.
Local shell lean/lake/elan absent. Actual GitHub jobs for 45577239749,
45576756833 and 45670987597: pick/run/record each completed success,
OLD baselines only. New native replay, actual caller substitution up
the chain and transitive axiom audit still pending; no new kernel closure.
RESUME HERE: compile this file on the pinned warmed environment; compare
both original and new caller scans and axiom ledgers, and inspect actual
ClozelCohC and BorelInjC definitions and native supplier bodies from
published-results package. Authenticate those precise cohomological
inputs, rather than adding more estimates or redoing the finite catalogue.
Keep the original fallback and all uniform CountI/V and VWin obligations.
HANDOFF TO kernel, audit, literature, integration. RH OPEN.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
noncomputable section
open NumberField GlobalTheory.CuspRep GlobalTheory.GKCoh
open UpperTheory.V.Published

theorem UpperTheory.V.Af.weyl_complex44 :
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

private theorem klev_three44 (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e

theorem UpperTheory.V.Af.card_k_from_coh44 :
    UpperTheory.V.Published.ClozelCohC → UpperTheory.V.Published.BorelInjC → UpperTheory.V.Af.CardK := by
  intro hClozel hBorel K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex44 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := hBorel K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨hClozel K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three44 K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

theorem UpperTheory.V.Br.cardP_from_coh44 :
    UpperTheory.V.Published.ClozelCohC → UpperTheory.V.Published.BorelInjC → UpperTheory.V.Br.CardP := by
  intro hClozel hBorel K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex44 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := hBorel K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨hClozel K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three44 K n M hu)⟩⟩
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
theorem countK_coh44 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.Win.N.CountKAlt := by
  intro hP hL K _ _ _ n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Af.card_k_from_coh44 hP.cohC hP.borelC K n hn
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

theorem countP_coh44 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.Win.N.CountPAlt := by
  intro hP hL K _ _ _ hK n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Br.cardP_from_coh44 hP.cohC hP.borelC K n hn
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

rh_scan UpperTheory.V.Af.weyl_complex_of_printed_results limit 2000
rh_prune UpperTheory.V.Af.weyl_complex_of_printed_results as RH44WeylPruned
rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan UpperTheory.V.Af.card_k_from_coh44 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_coh44 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_coh44 limit 2000
rh_prune UpperTheory.V.Af.card_k_from_coh44 as RH44CardKPruned
rh_prune UpperTheory.V.Br.cardP_from_coh44 as RH44CardPPruned
#print axioms UpperTheory.V.Af.weyl_complex44
#print axioms UpperTheory.V.Af.card_k_from_coh44
#print axioms UpperTheory.V.Br.cardP_from_coh44
#print axioms UpperTheory.GalN.V.Win.N.countK_coh44
#print axioms UpperTheory.GalN.V.Win.N.countP_coh44

example (P : UpperTheory.V.Af.Hypotheses') : UpperTheory.V.Af.CardK := by
  first | (rh_reduce 2 using [UpperTheory.V.Af.card_k_from_coh44]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact UpperTheory.V.Af.card_k_from_coh44 P.cohC P.borelC

example (P : UpperTheory.V.Af.Hypotheses') : UpperTheory.V.Br.CardP :=
  UpperTheory.V.Br.cardP_from_coh44 P.cohC P.borelC
