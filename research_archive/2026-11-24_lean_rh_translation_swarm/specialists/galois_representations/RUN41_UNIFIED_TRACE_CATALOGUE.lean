/-!
RUN41 lane 5, 25 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED,
NOT COMPILED. RH OPEN.
Actual NumberU3U_s supplier located: KeepNumU.numberU3U_of_prints.
Replace the rank-generic automorphic hypothesis package at its local
consumer by one uniform same-place trace catalogue. Native TrData
retains complex automorphism permutation, trace bound 3, q^e integrality
and classification up to RepIso, NOT merely the set of distinct traces.
The two native catalogues at ranks 3 and 2 combine by disjoint sum.
For Y=N(e+1), d=|disc K|, exact cardinality addition BEFORE estimates:
  |D.S| <= c1 Y^A1 + c2(dY)^A2
       <= (c1+c2 d^A2) Y^max(A1,A2).
Then native frobenius_trace_norm_nonzero_log_bound gives the integer
certificate with exponent max(A1,A2)+1 instead of A1+A2+1.
The catalogue is selected before l, Omega, iota, B, sigma and X and
must work for all those choices. Neither independent local catalogues
nor deduplication of equal trace values suffice. Constants depend on
fixed K, not N,e,p,l. This isolates a weaker local supplier, not a proof
of unconditional automorphic counting. The old native premises imply
the catalogue as shown below; they are not globally deleted.
Original selected graph: CountI -> CorGK -> PropGK -> NumberU3U_s ->
KeepNumU.numberU3U_of_prints -> numberU3U_of_adm2A_imp_adm2B ->
CountKAlt,CountQAlt,NewAdmAlt,rank3/2 conversion,TrData.sum,norm.
RUN40 proposed direct_countI -> NumberU3U_s + OneCharU_s.
Candidate: NumberU3U_s -> number_of_catalogue41 -> CountITraceCatalogue41,
native norm; catalogue_of_native41 -> same upstream native suppliers
with max exponent. Preserve original, RUN40 and all unresolved
type/value/constructor edges and axiom evidence. Cache by source/toolchain,
K/instances,N,e,p,w,q,D,l,Omega,iota,B,sigma,representation predicate and
caller role. Backtrack if native replay fails. No imported RH proof.
OneCharU_s actual supplier also located: FOneCharU.oneCharU_of_katoTwoW_rig_admI_automorphy ->
oneChar_unramU -> model_upper, vlen_le, rigidity/automorphy, coefficient
descent. Its independent length comparison and all premises remain.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest upstream observed 686902ae1da717a63faf52d2dc6a50e5722942cd
(cache-layout change; no pin migration).
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; mandatory pipeline,
SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d,
continuity/state/protocol openings and baseline summary inspected.
Peer 5adee016 (trace detector), a824904c (adjacent torsion), 700e3969
(CountV qualitative Sha), 619e11df (same), a35ccf3d (CountQ prime avoidance)
surveyed; no combining uncompiled changes. RUN40 blob 9dc0f269 preserved.
Pinned blobs in DenseThresholdCases:
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
AutomorphicForms/Classifies.lean 6a79b362efaef184a302c96e631e34613abd8f49
CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674.
Executed 15 fail-on-error source/hash/unique edit checks and
3888 exact integer envelope checks (3,5 fixed sample coefficients;
not a computation of automorphic eigensystems). Lean/lake absent locally.
Historical actual status files for 45577239749 and 45576756833 retrieved
returncode 0 (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717), baseline only. New native
replay, caller substitution, transitive axiom audit outstanding; no new
root obligations kernel-closed. No protected workflows or schedules edited.
RESUME HERE: compile this single file with existing engines, and RUN40
separately; check catalogue classifies monotonicity and all original
consumer bridges. Then focus on proving the rank-specific uniform
catalogue (native countK_alt rank3 and countQ_alt rank2, actual level
and eigensystem count inputs), and on independent OneChar length bound.
Do not repeatedly adjust exponents. HANDOFF TO kernel, audit,
integration, literature. RH OPEN.
-/

import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FOneCharU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp
namespace UpperTheory.GalN.V.Win.N
noncomputable section

def CountITraceCatalogue41 : Prop :=
  ∀ (K : Type) [Field K] [NumberField K] [IsCMField K], Module.finrank ℚ K = 2 →
    ∃ c A : ℕ, ∀ e : ℕ, 1 ≤ e → ∀ N : ℕ, 1 ≤ N →
      ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime →
        (p : 𝓞 K) ∈ w.asIdeal → 7 ≤ p → ¬ p ∣ N → ¬ (p : ℤ) ∣ discr K →
      ∃ D : TrData (normV w) e, Nat.card D.S ≤ c * (N * (e + 1)) ^ A ∧
        ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p →
          ∀ (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω]
            [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ) (B : ValuationSubring Ω), IsPlaceOver B w →
            ∀ σ : G K Ω, IsFrob B (normV w) σ →
              D.Classifies ι σ⁻¹ (fun ρ => _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨
                _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ)

theorem catalogue_of_native41 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →
    (∀ (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω]
      (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (ι : Qbar l ≃+* ℂ) (e M : ℕ), 1 ≤ e → ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e M ρ → _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M ρ) →
    CountITraceCatalogue41 := by
  intro hP hLK hLP hA hN h2 K _ _ _ hK
  obtain ⟨c₁, A₁, h₁⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_cm_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countK_alt hP hLK) K
  obtain ⟨c₂, A₂, h₂⟩ := _root_.UpperTheory.GalN.V.Win.N.frobenius_trace_count_bound_of_rat_eigensystem_count_alt (_root_.UpperTheory.GalN.V.Win.N.countQ_alt hP hLP hA) hN
  set d := (discr K).natAbs with hd
  have hd1 : 1 ≤ d := Int.natAbs_pos.2 (discr_ne_zero K)
  refine ⟨c₁ + c₂ * d ^ A₂, max A₁ A₂, ?_⟩
  intro e he N hN p w hp hw h7 hpN hpd
  obtain ⟨h, hh1, hh2, hq⟩ := UpperTheory.exists_normV_eq_prime_pow_le_finrank K p w hp hw
  obtain ⟨D₁, hD₁, H₁⟩ := h₁ e he N hN p w hp hw hpN hpd
  have hpM : ¬ p ∣ N * d := fun H => (hp.dvd_mul.1 H).elim hpN fun H' => hpd (Int.natCast_dvd.2 H')
  have H₂' := h₂ K e he (N * d) (Nat.mul_pos hN hd1) p h w hp hw hpM
  rw [← hq] at H₂'
  obtain ⟨D₂, hD₂, H₂⟩ := H₂'
  refine ⟨D₁.sum D₂, ?_, ?_⟩
  · set Y : ℕ := N * (e + 1) with hY
    have hY1 : 1 ≤ Y := Nat.mul_pos hN (Nat.succ_pos e)
    rw [TrData.card_sum, add_mul]
    refine add_le_add (hD₁.trans (Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (Nat.le_max_left _ _)))) (hD₂.trans ?_)
    rw [show N * d * (e + 1) = d * Y by rw [hY]; ring, mul_pow, ← mul_assoc]
    exact Nat.mul_le_mul_left _ (Nat.pow_le_pow_right hY1 (Nat.le_max_right _ _))
  · intro l _ hl2 hlp Ω _ _ _ _ _ ι B hB σ hσ
    obtain ⟨cl,hcl,htr⟩ := (H₁ l hl2 hlp Ω ι B hB σ hσ).sum (H₂ l hl2 hlp Ω ι B hB σ hσ)
    let f : {ρ : G K Ω →* GL (Fin 3) (Qbar l) //
        _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨
        _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ} →
        {ρ // _root_.UpperTheory.GalN.V.Adm3NAlt ι e N ρ ∨
        _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e (N*d) ρ} :=
      fun r => ⟨r.1, r.2.imp
        (fun k => ⟨k.irr, _root_.UpperTheory.GalN.V.csdN'_alt hP (by norm_num) k.aut, k.level, _root_.UpperTheory.V.Keep.odd3' k.unl⟩)
        (h2 K Ω l hl2 ι e _ he r.1)⟩
    exact ⟨cl ∘ f, fun r r' h => hcl (f r) (f r') h, fun r => htr (f r)⟩

theorem number_of_catalogue41 : CountITraceCatalogue41 → _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  intro hCat K _ _ _ hK
  obtain ⟨c,A,hC⟩ := hCat K hK
  refine ⟨5*c,A+1,?_⟩
  intro e he N hN p w hp hw h7 hpN hpd Orb _ z hz hc
  obtain ⟨h,hh1,hh2,hq⟩ := UpperTheory.exists_normV_eq_prime_pow_le_finrank K p w hp hw
  obtain ⟨D,hD,hCl⟩ := hC e he N hN p w hp hw h7 hpN hpd
  have hq7 : 7 ≤ normV w := by
    rw [hq]; exact h7.trans (Nat.le_self_pow (by omega) p)
  obtain ⟨NN,h0,hb,H⟩ := frobenius_trace_norm_nonzero_log_bound (normV w) e hq7 he D Orb z hz hc
  refine ⟨NN,h0,hb.trans ?_,?_⟩
  · set Y : ℕ := N*(e+1) with hY
    have hp1 : (1 : ℝ) ≤ Real.log p := by
      rw [Real.le_log_iff_exp_le (by exact_mod_cast hp.pos)]
      have h7' : (7 : ℝ) ≤ p := by exact_mod_cast h7
      linarith [Real.exp_one_lt_d9]
    have hlq : Real.log (normV w) ≤ 2 * Real.log p := by
      rw [hq,Nat.cast_pow,Real.log_pow]
      have : (h : ℝ) ≤ 2 := by exact_mod_cast hK ▸ hh2
      nlinarith
    have heY : (e : ℝ) + 1 ≤ Y := by
      have : e + 1 ≤ Y := Nat.le_mul_of_pos_left _ hN
      exact_mod_cast this
    have he0 : (0 : ℝ) ≤ e := Nat.cast_nonneg e
    have hf : 2 * e * Real.log (normV w) + 1 ≤ 5 * Y * Real.log p := by nlinarith
    have hf0 : 0 ≤ 2 * e * Real.log (normV w) + 1 := by positivity
    have hcard' : (Nat.card D.S : ℝ) ≤ (c * Y ^ A : ℕ) := by exact_mod_cast hD
    have hYc : (N : ℝ) * (e + 1) = Y := by rw [hY]; push_cast; ring
    rw [hYc]
    calc (Fintype.card Orb : ℝ) * Nat.card D.S * (2 * e * Real.log (normV w) + 1)
        ≤ Fintype.card Orb * (c * Y ^ A : ℕ) * (5 * Y * Real.log p) := by gcongr
      _ = _ := by push_cast; ring
  · intro l _ hl2 hlp Ω _ _ _ _ _ ι B hB σ hσ X hX hX'
    have hlq : ¬ l ∣ normV w := fun H' => by
      rw [hq] at H'
      exact hlp ((Nat.prime_dvd_prime_iff_eq Fact.out hp).1 ((Fact.out : l.Prime).dvd_of_dvd_pow H'))
    exact H l hlq ι _ σ⁻¹ _ (hCl l hl2 hlp Ω ι B hB σ hσ) X hX hX'

theorem numberU3U_of_native41 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.AdmResNAlt → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →
    (∀ (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω]
      (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (ι : Qbar l ≃+* ℂ) (e M : ℕ), 1 ≤ e → ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e M ρ → _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M ρ) →
    _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  intro hP hLK hLP hA hN h2
  exact number_of_catalogue41 (catalogue_of_native41 hP hLK hLP hA hN h2)

theorem numberU3U_of_prints41 : _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.V.Z.J.NumberU3U_s := fun P =>
  numberU3U_of_native41 P (_root_.UpperTheory.V.Keep.levelKA_alt P) (_root_.UpperTheory.V.Keep.levelPA_alt P) (_root_.UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results P) (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)
end
end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints41 limit 2000
rh_prune UpperTheory.GalN.V.Win.N.number_of_catalogue41 as RH41NumberPruned
#print axioms UpperTheory.GalN.V.Win.N.catalogue_of_native41
#print axioms UpperTheory.GalN.V.Win.N.number_of_catalogue41
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_prints41

open UpperTheory.GalN.V.Win.N in
example (h : CountITraceCatalogue41) : UpperTheory.V.Z.J.NumberU3U_s := by
  first | (rh_reduce 2 using [number_of_catalogue41]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact number_of_catalogue41 h
