import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 12 RUN44, 26 November 2026. SOURCE-MATCHED / elementary human reduction; PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including Mandatory unified reduction engine read first; AGENTS, SWARM, HANDOFF, continuity/state/log/protocol consulted. Peer head 74ad2c137d35b20b42cc7105291c4e14d0e219c4 (same Frobenius/positive product), 3463c301 (rank-two CountQ), 24e7f2d1 (weight -1 injection), prior own 6615a312 (qualitative Kummer). No uncompiled peer overlay merged. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: two avoidable quantitative exponent inflations at actual shared CountI and CountV supplier. Native TCardK gives exactly |S| <= c2 M^A2 Xi.d and Xi.d <= c1 (H+1)^A1. Hence before homogenizing, |S| <= c1*c2*M^A2*(H+1)^A1. Since both bases >=1, each exponent can be increased to D=max(A1,A2), giving |S| <= c1*c2*(M*(H+1))^D. This uses max rather than A1+A2; no added premises or changes to choice of Xi, S, field, level, or weights. It is strict as a bound when both exponents >0 and the combined base >1. Max is the smallest general single exponent from these separate bounds if each base can grow with the other held fixed (not a lower bound for the native objects themselves).

At KeepNumU the CM and rational trace catalogues are constructed for the SAME K,p,w,e,N, with rational level N*d where d=|disc K|. Put Y=N*(e+1). Exact catalogue disjoint sum size is |D1.S|+|D2.S|, so
  |(D1.sum D2).S| <= c1*Y^A1 + c2*d^A2*Y^A2 <= (c1+c2*d^A2)*Y^max(A1,A2).
Keep the factor d^A2 (it is not uniformly bounded as K varies). Thus the actual common integer NN satisfies
  log|NN| <= 5*(c1+c2*d^A2)*|Orb|*Y^(max(A1,A2)+1)*log p
instead of exponent A1+A2+1 for the same input witnesses, with all valuation-product/nonvanishing/classification statements unchanged. The outer exponent A1 refers to the CM trace count after the first improvement; A2 refers to the independent rational trace count. This is an improved explicit witness to the same existential polynomial bound, not a proof of a smaller numerical exponent when input exponents are unknown, not a new uniform bound in K, and not a proof of RH. No log/norm separation before exact cardinal sum. Negative control min(A1,A2) fails already for arbitrary M=2,H+1=1,A1=1,A2=0 if the growing base is the one with exponent 1. We do not claim any finite arithmetic controls test the native automorphic theorems.

Original selected dependency graph: count_i_of_printed_bound_k_kato_automorphy and count_v_of_printed_bound_k_reduced_unitary_lift -> numberU3U_of_prints -> numberU3U_of_adm2A_imp_adm2B -> CM trace bound -> countK_alt -> card_k_of_printed_results -> weyl_complex_of_printed_results + cohBoundFree; rational trace bound -> countQ_alt (unchanged).
Candidate graph: count_i_max44/count_v_max44 -> numberU3U_of_prints_max44 -> numberU3U_max44 -> same native CM trace adapter -> countK_max44 -> card_k_max44 -> same Weyl/cohomology suppliers. Other inputs and original graph preserved. No globally removed logical obligation or axiom claimed. Rank-three CM and rank-two rational classification, all host/prime/weight/isomorphism guards, CountV cohomology, and uniform full-window VWinAt(1,401) obligations remain. Cache by source+toolchain, K,n,e,N,d,p,w,weights,level,H,S,constants and actual caller/role; do not merge different witnesses. Backtrack to original upon failed replay. No import of claimed RH theorem.

Pinned source ledger (all paths src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/):
TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96
FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
Executed 40 fail-on-error source/round-trip checks: pin TCardK.lean; pin FrobeniusTraceCountBoundOfCmEigensystemCount.lean; pin KeepNumU.lean; pin LinkedUnlE.lean; extract private theorem klev_three; helper rename forward 2; helper rename reverse; card rename forward 1; card rename reverse; card exponent forward 6; card exponent reverse; M exponent monotonicity forward 1; M exponent monotonicity reverse; H exponent monotonicity forward 1; H exponent monotonicity reverse; extract theorem countK_alt :; count rename forward 1; count rename reverse; actual card supplier substitution forward 1; actual card supplier substitution reverse; extract theorem numberU3U_of_adm2A_imp_adm2B :; number rename forward 2; number rename reverse; actual CountK supplier substitution forward 1; actual CountK supplier substitution reverse; joint catalogue exponent forward 4; joint catalogue exponent reverse; two exponent sites; reverse both exponent sites; print wrapper rename forward 1; print wrapper rename reverse; extract theorem count_i_of_printed_bound_k_kato_automorphy; countI rename forward 1; countI rename reverse; countV rename forward 1; countV rename reverse; both actual callers forward 2; both actual callers reverse; negative control: min exponent fails M=2,H=1,a=1,b=0; no proof holes in copied candidates.
Executed 1296 exact BigInt inequality controls for a,b=0..5 and both bases=1..6; 875 strict improvements over sum exponent in the homogeneous bound. This is regression arithmetic only. Local lean/lake/elan absent (shell). Actual CI run status fetched: 45577239749, 45576756833, 45670987597 completed/success for OLD baselines only. No new native output, no new axiom ledger, not queued. Native scan/prune and bounded reduction commands below PREPARED; original and candidate dependencies and axioms to compare at replay. No URT or speed claim.

RESUME HERE: compile this file in the existing pinned warmed engine environment and compare #print axioms and constructor-inclusive dependency scans for both actual callers; inspect the actual CM trace adapter's extracted rank-three family (e-1,-1,-e-1), then isolate that family's uniform Weyl/cohomological dimension suppliers, coordinating with rank-two CountQ integration 3463c301. Preserve original fallback and all unresolved same-host VWin, geometry and prime-window obligations.
HANDOFF TO kernel extractor, integration, Galois, literature, audit.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

section
private theorem klev_three44 (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e
theorem UpperTheory.V.Af.card_k_max44 :
    _root_.UpperTheory.V.Af.Hypotheses' → UpperTheory.V.Af.CardK := by
  intro P K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_of_printed_results P K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, max A₁ A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := P.borelC K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨P.cohC K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three44 K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (max A₁ A₂) := Nat.pow_le_pow_right hM (le_max_right A₁ A₂)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (max A₁ A₂) := Nat.pow_le_pow_right (by omega) (le_max_left A₁ A₂)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (max A₁ A₂) * (c₁ * (H + 1) ^ (max A₁ A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (max A₁ A₂) := by rw [mul_pow]; ring
end

section
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
namespace UpperTheory.GalN.V.Win.N
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.GalOfCusp
open scoped Matrix
open NumberField IsDedekindDomain Formalism.L2.Host
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal GlobalTheory.GalOfCusp UpperTheory.V UpperTheory.V.Af UpperTheory.V.Published
open UpperTheory.V.Af.Bc
theorem countK_max44 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.Win.N.CountKAlt := by
  intro hP hL K _ _ _ n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Af.card_k_max44 hP K n hn
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
end UpperTheory.GalN.V.Win.N
end
end

section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
namespace UpperTheory.GalN.V.Win.N
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp UpperTheory.V.Af
theorem numberU3U_max44 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →
    (∀ (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω]
      (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (ι : Qbar l ≃+* ℂ) (e M : ℕ), 1 ≤ e → ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e M ρ → _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M ρ) →
    _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  intro hP hLK hLP hA hN h2 K _ _ _ hK
  obtain ⟨c₁, A₁, h₁⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_cm_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countK_max44 hP hLK) K
  obtain ⟨c₂, A₂, h₂⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countQ_alt hP hLP hA) hN
  set d := (discr K).natAbs with hd
  have hd1 : 1 ≤ d := Int.natAbs_pos.2 (discr_ne_zero K)
  refine ⟨5 * (c₁ + c₂ * d ^ A₂), max A₁ A₂ + 1, ?_⟩
  intro e he N hN p w hp hw h7 hpN hpd Orb _ z hz hc
  obtain ⟨h, hh1, hh2, hq⟩ := UpperTheory.exists_normV_eq_prime_pow_le_finrank K p w hp hw
  obtain ⟨D₁, hD₁, H₁⟩ := h₁ e he N hN p w hp hw hpN hpd
  have hpM : ¬ p ∣ N * d := fun H => (hp.dvd_mul.1 H).elim hpN fun H' => hpd (Int.natCast_dvd.2 H')
  have H₂' := h₂ K e he (N * d) (Nat.mul_pos hN hd1) p h w hp hw hpM
  rw [← hq] at H₂'
  obtain ⟨D₂, hD₂, H₂⟩ := H₂'
  have hq7 : 7 ≤ normV w := by
    rw [hq]; exact h7.trans (Nat.le_self_pow (by omega) p)
  obtain ⟨NN, h0, hb, H⟩ := frobenius_trace_norm_nonzero_log_bound (normV w) e hq7 he (D₁.sum D₂) Orb z hz hc
  refine ⟨NN, h0, hb.trans ?_, fun l _ hl2 hlp Ω _ _ _ _ _ ι B hB σ hσ X hX hX' => ?_⟩
  · set Y : ℕ := N * (e + 1) with hY
    have hY1 : 1 ≤ Y := Nat.mul_pos hN (Nat.succ_pos e)
    have hcard : Nat.card (D₁.sum D₂).S ≤ (c₁ + c₂ * d ^ A₂) * Y ^ (max A₁ A₂) := by
      rw [TrData.card_sum, add_mul]
      refine add_le_add (hD₁.trans (Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (le_max_left A₁ A₂)))) (hD₂.trans ?_)
      rw [show N * d * (e + 1) = d * Y by rw [hY]; ring, mul_pow, ← mul_assoc]
      exact Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (le_max_right A₁ A₂))
    have hp1 : (1 : ℝ) ≤ Real.log p := by
      rw [Real.le_log_iff_exp_le (by exact_mod_cast hp.pos)]
      have h7' : (7 : ℝ) ≤ p := by exact_mod_cast h7
      linarith [Real.exp_one_lt_d9]
    have hlq : Real.log (normV w) ≤ 2 * Real.log p := by
      rw [hq, Nat.cast_pow, Real.log_pow]
      have : (h : ℝ) ≤ 2 := by exact_mod_cast hK ▸ hh2
      nlinarith
    have heY : (e : ℝ) + 1 ≤ Y := by
      have : e + 1 ≤ Y := Nat.le_mul_of_pos_left _ hN
      exact_mod_cast this
    have he0 : (0 : ℝ) ≤ e := Nat.cast_nonneg e
    have hf : 2 * e * Real.log (normV w) + 1 ≤ 5 * Y * Real.log p := by nlinarith
    have hf0 : 0 ≤ 2 * e * Real.log (normV w) + 1 := by positivity
    have hcard' : (Nat.card (D₁.sum D₂).S : ℝ) ≤ ((c₁ + c₂ * d ^ A₂) * Y ^ (max A₁ A₂) : ℕ) := by exact_mod_cast hcard
    have hYc : (N : ℝ) * (e + 1) = Y := by rw [hY]; push_cast; ring
    rw [hYc]
    calc (Fintype.card Orb : ℝ) * Nat.card (D₁.sum D₂).S * (2 * e * Real.log (normV w) + 1)
        ≤ Fintype.card Orb * ((c₁ + c₂ * d ^ A₂) * Y ^ (max A₁ A₂) : ℕ) * (5 * Y * Real.log p) := by gcongr
      _ = _ := by push_cast; ring
  · have hlq : ¬ l ∣ normV w := fun H' => by
      rw [hq] at H'
      exact hlp ((Nat.prime_dvd_prime_iff_eq Fact.out hp).1 ((Fact.out : l.Prime).dvd_of_dvd_pow H'))
    exact H l hlq ι _ σ⁻¹ _ ((H₁ l hl2 hlp Ω ι B hB σ hσ).sum (H₂ l hl2 hlp Ω ι B hB σ hσ)) X
      (fun o ρ hρ => (hX o ρ hρ).imp (fun k => ⟨k.irr, _root_.UpperTheory.GalN.V.csdN'_alt hP (by norm_num) k.aut, k.level, _root_.UpperTheory.V.Keep.odd3' k.unl⟩) (h2 K Ω l hl2 ι e _ he ρ)) hX'
theorem numberU3U_of_prints_max44 : _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.V.Z.J.NumberU3U_s := fun P =>
  _root_.UpperTheory.GalN.V.Win.N.numberU3U_max44 P (_root_.UpperTheory.V.Keep.levelKA_alt P) (_root_.UpperTheory.V.Keep.levelPA_alt P) (_root_.UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results P) (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)

theorem numberU3U_max44_engine (P : _root_.UpperTheory.V.Af.Hypotheses') :
    _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  first
  | (rh_reduce 2 using [numberU3U_of_prints_max44]; done)
  | (rh_auto_frontier 1; done)
  | (rh_auto 1; done)
  | exact numberU3U_of_prints_max44 P

end UpperTheory.GalN.V.Win.N
end

section
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.V.Z.J
open UpperTheory.V.HV UpperTheory.V.Lit UpperTheory.V.W UpperTheory.V.J
theorem count_i_max44 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hKa : _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW) (h3 : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt) : CountI :=
  have hC := _root_.UpperTheory.V.HV.Core0.cohInp_alt hH.litN hK
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  U3.countI (U3.corGK (_root_.UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU (_root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints_max44 hH.toClassicalTheorems)
    (_root_.UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy hC Alg.M.main_holds Alg.M.mprime_holds Alg.lemmaP hKa (_root_.UpperTheory.V.Z.J.rigIUE_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE)
      (_root_.UpperTheory.V.Z.Win.RR.rigII_a_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH)) (_root_.UpperTheory.V.Z.J.admissible_typeI_even_level_alt hC hH hE) h3)))
theorem count_v_max44 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hS : _root_.UpperTheory.V.Aut.ThmS6Core_s) : CountV := by
  have hN := hH.litN
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  obtain ⟨CK, hL⟩ := hK
  exact _root_.UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host (_root_.UpperTheory.V.UnitaryThreeInertia.unitary_lift_of_reduced_core hS) Alg.M.main_holds Alg.M.mprime_holds hN.coh.lf hN.coh.lt hN.coh.le
    hN.coh.gf hN.coh.ge hN.coh.pt (X.So.hostVanE CK hL (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.lfK hN.coh.ltK hN.coh.lf hN.coh.lt hN.coh.le)
    (X.xpp (X.corX X.lemmaX X.residual_bernoulli_nonvanishing)) (_root_.UpperTheory.V.Z.J.hostRigidUE_alt hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE) (_root_.UpperTheory.V.Z.J.hostNumberUE_alt hH hE (_root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints_max44 hH.toClassicalTheorems))
end UpperTheory.V.Z.J
end

rh_prune UpperTheory.V.Af.card_k_of_printed_results as RHDep44CardKPruned
rh_prune UpperTheory.GalN.V.Win.N.numberU3U_of_adm2A_imp_adm2B as RHDep44NumPruned
rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan UpperTheory.V.Af.card_k_max44 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints_max44 limit 2000
rh_scan UpperTheory.V.Z.J.count_i_max44 limit 2000
rh_scan UpperTheory.V.Z.J.count_v_max44 limit 2000
#print axioms UpperTheory.V.Af.card_k_max44
#print axioms UpperTheory.GalN.V.Win.N.countK_max44
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_max44
#print axioms UpperTheory.V.Z.J.count_i_max44
#print axioms UpperTheory.V.Z.J.count_v_max44
#print axioms UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy
#print axioms UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift
