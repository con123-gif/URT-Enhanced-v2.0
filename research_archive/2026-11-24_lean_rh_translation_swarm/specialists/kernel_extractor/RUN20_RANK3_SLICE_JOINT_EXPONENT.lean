import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN20 lane 11, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory pipeline;
SWARM/HANDOFF/EXPANSION/AGENTS, continuity and current peer commit summaries
read. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Peer RUN44 74ad2c13
recovers common Frobenius from KeepNumU, not independent selection;
integration 3463c301 covers rank-two CountQ. This is its distinct rank-three
CM companion. No uncompiled peer overlay imported. Prior RUN19 preserved.

Actual consumer numberU3U_of_adm2A_imp_adm2B uses CountKAlt only for quadratic
CM K, rank 3, m=(e-1,-1,-e-1), wt=-2, H=e+1. Replace arbitrary rank/weight
CountKAlt interface by CountK3Slice20; all classification, integrality,
purity and uniform l/Omega/iota/place/level/prime guards retained. c,A
chosen before e,N,p,w. The original source supplies the slice conditionally;
this does not prove its independent quantitative bound. Other CountK uses
remain. The common Frobenius and same catalogue D1.sum D2 are unchanged.
Aggregate before estimating: for Y=N(e+1)>=1 and d=|discr K|, the two
catalogue sizes are at most c1 Y^A1 and c2 d^A2 Y^A2, hence their sum is
at most (c1+c2 d^A2) Y^max(A1,A2), not Y^(A1+A2).
Also 2e log(q)+1 <= 4 Y log(p), since q=p^h,h<=2,log p>=1,Y>=e+1.
The existing integer anchor therefore uses 4(c1+c2 d^A2), max(A1,A2)+1
instead of 5(c1+c2 d^A2), A1+A2+1. This tighter budget is not a new
root-level premise discharge (the native final constants are existential).

Sources relative to DenseThresholdCases/:
FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
Original graph: NumberU3U_s -> KeepNumU -> CountKAlt -> countK_alt + CountQAlt
and NewAdmAlt, norm product supplier. Reduced local graph:
numberU3U_of_rank3_slice20 -> trace_rank3_slice20 -> CountK3Slice20;
CountQAlt and all other edges retained. Original bridge via countK3_slice_of_native20
is included below; all unresolved proof/type/constructor/axiom edges retained.
Cache context includes K/e/N/p/w/l/Omega/iota/B/sigma/D1/D2 and hypotheses.
Native lean/lake/elan not on local PATH. Actual CI jobs for 45577239749,
45576756833,45670987597 all completed success (older baseline only).
Executed 35 source/transform checks, 2304 exact
integer aggregate-bound cases and 512 integer log-parameter cases
(not upstream data). No new kernel PASS, no native axiom ledger or speed claim.
RESUME HERE: compile this file on pinned warmed runner; compare rh_scan
and #print axioms with originals, then specialize actual countK_alt producer
to the slice without full-rank cardinal and level suppliers. If failed
replay restore original caller. Preserve CountQ and all geometric leaves.
HANDOFF TO integration, audit, Galois, acceleration. RH OPEN.
-/
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.CuspRep GlobalTheory.GalOfCusp UpperTheory.V.Af
open scoped Matrix
namespace UpperTheory.GalN.V.Win.N

def CountK3Slice20 : Prop :=
  ∀ (K : Type) [Field K] [NumberField K] [IsCMField K], Module.finrank ℚ K = 2 → ∃ c A : ℕ,
    ∀ e : ℕ, 1 ≤ e → ∀ N : ℕ, 1 ≤ N →
    ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime → (p : 𝓞 K) ∈ w.asIdeal → ¬ p ∣ N → ¬ (p : ℤ) ∣ discr K →
      ∃ D : EigData 3 (normV w) ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] (-2), Nat.card D.S ≤ c * (N * (e + 1 + 1)) ^ A ∧
        ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p → ∀ (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ),
          D.Classifies (Ω := Ω) ι w (_root_.UpperTheory.GalN.V.AdmKNAlt ι N ![(e : ℤ) - 1, -1, -(e : ℤ) - 1])

theorem countK3_slice_of_native20 : CountKAlt → CountK3Slice20 := by
  intro h K _ _ _ _
  obtain ⟨c, A, hK⟩ := h K 3 (by norm_num)
  refine ⟨c, A, fun e he N hN p w hp hw hpN hpd => ?_⟩
  exact hK ![(e : ℤ) - 1, -1, -(e : ℤ) - 1]
    (by
      refine Fin.strictAnti_iff_succ_lt.2 fun i => ?_
      fin_cases i <;> simp <;> omega)
    (by
      intro i
      fin_cases i <;> simp [Fin.rev] <;> ring)
    (e + 1)
    (by
      intro i
      rw [abs_le]
      fin_cases i <;> simp <;> omega)
    N hN p w hp hw hpN hpd

private theorem not_mem_of_distinct_prime20 {K : Type} [Field K] [NumberField K] {p l : ℕ} (w : HeightOneSpectrum (𝓞 K)) (hp : p.Prime)
    (hl : l.Prime) (hlp : l ≠ p) (hw : (p : 𝓞 K) ∈ w.asIdeal) : (l : 𝓞 K) ∉ w.asIdeal := by
  intro h
  have hc : IsCoprime (l : 𝓞 K) (p : 𝓞 K) := Nat.Coprime.cast ((Nat.coprime_primes hl hp).2 hlp)
  obtain ⟨a, b, hab⟩ := hc
  exact w.isPrime.ne_top ((Ideal.eq_top_iff_one _).2
    (hab ▸ w.asIdeal.add_mem (w.asIdeal.mul_mem_left a h) (w.asIdeal.mul_mem_left b hw)))
private theorem admissible_twist_cyclotomic20 {K Ω : Type} [Field K] [NumberField K] [IsCMField K] [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω]
    {l : ℕ} [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (e N : ℕ) (ρ : G K Ω →* GL (Fin 3) (Qbar l)) (h : _root_.UpperTheory.GalN.V.Adm3NAlt ι e N ρ) :
    _root_.UpperTheory.GalN.V.AdmKNAlt ι N ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] (tw ρ (cycBar K Ω l)⁻¹) := by
  refine ⟨(UpperTheory.isIrr_twist_and_repIso_of_twist_repIso _ _ 3 _).1 ρ h.irr, h.aut, ?_, _root_.UpperTheory.V.Keep.oddTw' _ h.unl⟩
  have h1 := UpperTheory.level_twist_cyclotomic_pow K Ω l 3 N _ ρ (-1) h.level
  rw [zpow_neg_one] at h1
  convert h1 using 1
  funext i
  fin_cases i <;> simp <;> ring
theorem trace_rank3_slice20 :
    CountK3Slice20 → ∀ (K : Type) [Field K] [NumberField K] [IsCMField K], Module.finrank ℚ K = 2 → ∃ c A : ℕ, ∀ e : ℕ, 1 ≤ e → ∀ N : ℕ, 1 ≤ N → ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime → (p : 𝓞 K) ∈ w.asIdeal → ¬ p ∣ N → ¬ (p : ℤ) ∣ discr K → ∃ D : TrData (normV w) e, Nat.card D.S ≤ c * (N * (e + 1)) ^ A ∧ ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p → ∀ (Ω : Type) [Field Ω] [Algebra K Ω] [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ) (B : ValuationSubring Ω), IsPlaceOver B w → ∀ σ : G K Ω, IsFrob B (normV w) σ → D.Classifies ι σ⁻¹ (_root_.UpperTheory.GalN.V.Adm3NAlt ι e N) := by
  intro hC K _ _ _ hK2
  obtain ⟨c, A, hK⟩ := hC K hK2
  refine ⟨c * 2 ^ A, A, fun e he N hN p w hp hw hpN hpd => ?_⟩
  have hN' : (Ideal.absNorm w.asIdeal : ℕ) = normV w := by
    rw [Ideal.absNorm_apply, Submodule.cardQuot_apply]; rfl
  have hq : 1 ≤ normV w := by
    rw [← hN']
    exact Nat.one_le_iff_ne_zero.2 (by simpa [Ideal.absNorm_eq_zero_iff] using w.ne_bot)
  have hqC : ((normV w : ℕ) : ℂ) ≠ 0 := by exact_mod_cast (by omega : normV w ≠ 0)
  obtain ⟨D, hcard, hcl⟩ := hK e he N hN p w hp hw hpN hpd
  obtain ⟨T, u, hT⟩ := traces_from_eigenvalues_rank3 (normV w) e hq D
  refine ⟨T, ?_, fun l _ hl2 hlp Ω _ _ _ ι B hB σ hσ => ?_⟩
  · rw [← Nat.card_congr u, mul_assoc, ← mul_pow]
    refine hcard.trans (Nat.mul_le_mul_left _ (Nat.pow_le_pow_left ?_ _))
    nlinarith
  · obtain ⟨cl, h1, h2⟩ := hcl l hl2 hlp Ω ι
    refine ⟨fun r => u (cl ⟨_, admissible_twist_cyclotomic20 ι e N r.1 r.2⟩), fun r r' H => ?_, fun r => ?_⟩
    · exact (UpperTheory.isIrr_twist_and_repIso_of_twist_repIso _ _ 3 _).2 _ _ (h1 _ _ (u.injective H))
    · have hl := not_mem_of_distinct_prime20 w hp (Fact.out : l.Prime) hlp hw
      have e2 := ReciprocityTheory.Gal.cycZ_of_isFrob hl hB hσ
      have e3 : ((cycBar K Ω l σ : (Qbar l)ˣ) : Qbar l) = (normV w : Qbar l) := by
        change algebraMap ℚ_[l] (Qbar l) (((ReciprocityTheory.Gal.cycZ K Ω l σ : ℤ_[l]ˣ) : ℤ_[l]) : ℚ_[l]) = _
        rw [e2]; simp
      have h3 := (UpperTheory.map_trace_eq_sum_roots_of_charpoly_map _ ι.toRingHom _).1 _ ((h2 ⟨_, admissible_twist_cyclotomic20 ι e N r.1 r.2⟩ B hB).2 σ hσ)
      rw [tw_val, Matrix.trace_smul, MonoidHom.inv_apply, map_inv (cycBar K Ω l), inv_inv, e3, smul_eq_mul, map_mul,
        map_natCast] at h3
      rw [hT, eq_comm, RingEquiv.symm_apply_eq]
      simp only [mul_inv]
      rw [Multiset.sum_map_mul_left, ← h3, inv_mul_cancel_left₀ hqC]
      rfl

theorem numberU3U_of_rank3_slice20 :
    _root_.UpperTheory.V.Af.Hypotheses' → CountK3Slice20 → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →
    (∀ (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω]
      (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (ι : Qbar l ≃+* ℂ) (e M : ℕ), 1 ≤ e → ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e M ρ → _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M ρ) →
    _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  intro hP hSlice hLP hA hN h2 K _ _ _ hK
  obtain ⟨c₁, A₁, h₁⟩ := trace_rank3_slice20 hSlice K hK
  obtain ⟨c₂, A₂, h₂⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countQ_alt hP hLP hA) hN
  set d := (discr K).natAbs with hd
  have hd1 : 1 ≤ d := Int.natAbs_pos.2 (discr_ne_zero K)
  refine ⟨4 * (c₁ + c₂ * d ^ A₂), max A₁ A₂ + 1, ?_⟩
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
      refine add_le_add (hD₁.trans (Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (le_max_left _ _)))) (hD₂.trans ?_)
      rw [show N * d * (e + 1) = d * Y by rw [hY]; ring, mul_pow, ← mul_assoc]
      exact Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (le_max_right _ _))
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
    have hf : 2 * e * Real.log (normV w) + 1 ≤ 4 * Y * Real.log p := by
      have hmul := mul_le_mul_of_nonneg_left hlq (show 0 ≤ 2 * (e : ℝ) by positivity)
      have hmul' := mul_le_mul_of_nonneg_right heY (show 0 ≤ 4 * Real.log p by positivity)
      nlinarith
    have hf0 : 0 ≤ 2 * e * Real.log (normV w) + 1 := by positivity
    have hcard' : (Nat.card (D₁.sum D₂).S : ℝ) ≤ ((c₁ + c₂ * d ^ A₂) * Y ^ (max A₁ A₂) : ℕ) := by exact_mod_cast hcard
    have hYc : (N : ℝ) * (e + 1) = Y := by rw [hY]; push_cast; ring
    rw [hYc]
    calc (Fintype.card Orb : ℝ) * Nat.card (D₁.sum D₂).S * (2 * e * Real.log (normV w) + 1)
        ≤ Fintype.card Orb * ((c₁ + c₂ * d ^ A₂) * Y ^ (max A₁ A₂) : ℕ) * (4 * Y * Real.log p) := by gcongr
      _ = _ := by push_cast; ring
  · have hlq : ¬ l ∣ normV w := fun H' => by
      rw [hq] at H'
      exact hlp ((Nat.prime_dvd_prime_iff_eq Fact.out hp).1 ((Fact.out : l.Prime).dvd_of_dvd_pow H'))
    exact H l hlq ι _ σ⁻¹ _ ((H₁ l hl2 hlp Ω ι B hB σ hσ).sum (H₂ l hl2 hlp Ω ι B hB σ hσ)) X
      (fun o ρ hρ => (hX o ρ hρ).imp (fun k => ⟨k.irr, _root_.UpperTheory.GalN.V.csdN'_alt hP (by norm_num) k.aut, k.level, _root_.UpperTheory.V.Keep.odd3' k.unl⟩) (h2 K Ω l hl2 ι e _ he ρ)) hX'

theorem numberU3U_of_prints20 : _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.V.Z.J.NumberU3U_s := fun P =>
  numberU3U_of_rank3_slice20 P (countK3_slice_of_native20 (countK_alt P (_root_.UpperTheory.V.Keep.levelKA_alt P))) (_root_.UpperTheory.V.Keep.levelPA_alt P) (_root_.UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results P) (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)

end UpperTheory.GalN.V.Win.N

rh_prune UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_cm_eigensystem_count_alt as RHRankThreeOriginal20
rh_scan UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_cm_eigensystem_count_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.trace_rank3_slice20 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_rank3_slice20 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints20 limit 2000
#print axioms UpperTheory.GalN.V.Win.N.trace_rank3_slice20
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_rank3_slice20
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_prints20
