import RHKernelRank3Slice20
import RHIntegrationRank2Joint
import RHIntegrationShared43

/-!
Integration 26 Nov 2026 — combined actual rank-three CM / rank-two rational
trace supplier at the shared VWin consumer. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read including unified engine;
SWARM, HANDOFF, AGENTS, state, continuity and runner protocol consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Peer sources and status:
- RHKernelRank3Slice20 = specialists/kernel_extractor/RUN20_RANK3_SLICE_JOINT_EXPONENT.lean (c7690d1be83523d4ec31cd8ebfde42971b936cc3, commit 2355b4d2).
- RHIntegrationRank2Joint = integration/2026-11-26_0202_JOINT_COUNTQ_RANK_TWO.lean (7f40c6bc6cd5ce74f960f39b6afdd4da1e50dba0, 3463c301).
- RHIntegrationShared43 = integration/2026-11-25_2358_SHARED_COUNTI_COUNTV_TRACE_SUPPLIER.lean (f8867f1ea01ab97ecf10115cc7ba78cae84c953c, f304da1a).
Stage transitive peer imports under the names in their headers, then compile each
separately before this certificate. None of these prepared overlays is treated as verified.
Native KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7; FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40,
both relative to DenseThresholdCases. Dependency max-exponent candidate a5cadf3e280ea55df0dd7db6713c30877e72c57d (054230d9).
Recent other peer results surveyed: 9a71ca2c (orbit fibre power), c5fe320e
(same-row gauge endpoint), 94cfd3a4 (rank-one measure), ba04fa11 (norm descent),
8be39223 (prime shell), 4daf9080 (Clozel), e897aeb5 (unit valuation),
2b75bc4a (cohomology), eadcc941 (twisted class quotient), 755b9251
(split quotient), 6aaed9d5 (small prime), 7e262184 (hyperbola).
Do not merge their unchecked changes merely because they are available.

Result: native KeepNumU consumes the CM trace only at quadratic K and the
rational trace on the rank-two family. Both peer trace OUTPUT interfaces
match the original string exactly from existential constants onward.
The CM peer has extra quadratic-host premise hK, already present in
NumberU3U_s. Replace all-rank LevelKNAlt, LevelPNAlt, AdmResNAlt inputs
of this local assembler with CountK3Slice20 and the rank-two specialised
supplier derived from hP. Keep hP (used by csdN'_alt), NewAdmAlt,
Adm2A->Adm2B, same catalogue union and identical Frobenius witness.
For Y=N(e+1)>=1 and d=|disc K|, exact cardinal sum gives
  |D1.S|+|D2.S| <= (c1+c2*d^A2)*Y^max(A1,A2).
Retain original safe log coefficient 5 to avoid an unrelated change.
The resulting NumberU3U_s feeds BOTH CountI and CountV through
window_shared43; no new witness or additional premise at the native wrapper.
No global deletion of level theorems: the native source bridge for the
rank-three slice still uses countK_alt and levelKA_alt. The useful reduced
frontier is the slice-specific theorem, not the fallback wrapper.
All original graphs/type/value/constructor edges, axioms and pending
nodes preserved in predecessor files. Candidate selected graph:
 VWin -> window_sliced45 -> window_shared43 -> CountI/CountV
 -> SAME numberU3U_sliced45 -> trace_rank3_slice20 + rankTwo_trace_joint
 -> CountK3Slice20 + CountQFamily 2 RankTwoWeight, with retained suppliers.
Cache key pin/toolchain, hP/hSlice/hN/h2, K,e,N,p,w,l,Omega,iota,B,sigma,
D1/D2, discriminant, exact window/consumer; not just declaration name.
Backtrack to original native KeepNumU if any compiler/axiom check fails.
Executed 31 fail-on-error source and reversible edit assertions (6 pins,
2 exact output interfaces, forward/reverse transformations, caller and
same-Frobenius controls, no placeholders). Local lean/lake/elan not on PATH.
Actual GitHub Actions jobs for 45577239749,45576756833,45670987597
retrieved this run: pick/run/record completed success in each, OLD
baseline only. No new compilation/axiom audit, not queued here. No URT claim.
No unconditional root obligation retired.
RESUME HERE: stage the three dependency modules plus their documented
imports on the existing pinned native runner; compile one at a time and
compare actual consumer scans and axioms. Then replace countK_alt's
all-rank cardinal/level premises by a direct proof of CountK3Slice20 at
the quadratic host and fixed triple, retaining the common trace catalogue.
The unresolved quantitative arithmetic and same-host geometry remain open.
HANDOFF TO kernel, audit, Galois, literature, editor. RH OPEN.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
namespace UpperTheory.GalN.V.Win.N
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.GalOfCusp UpperTheory.V.Af
theorem numberU3U_sliced45 :
    _root_.UpperTheory.V.Af.Hypotheses' → CountK3Slice20 → _root_.UpperTheory.GalN.V.Win.N.NewAdmAlt →
    (∀ (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω] [IsAlgClosure K Ω]
      (l : ℕ) [Fact l.Prime], l ≠ 2 → ∀ (ι : Qbar l ≃+* ℂ) (e M : ℕ), 1 ≤ e → ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e M ρ → _root_.UpperTheory.V.Z.Win.Dn.Adm2B ι e M ρ) →
    _root_.UpperTheory.V.Z.J.NumberU3U_s := by
  intro hP hSlice hN h2 K _ _ _ hK
  obtain ⟨c₁, A₁, h₁⟩ := trace_rank3_slice20 hSlice K hK
  obtain ⟨c₂, A₂, h₂⟩ := RHIntegrationCountQ.rankTwo_trace_joint hP hN
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

theorem numberU3U_sliced_native45 (P : _root_.UpperTheory.V.Af.Hypotheses') :
    _root_.UpperTheory.V.Z.J.NumberU3U_s :=
  numberU3U_sliced45 P
    (countK3_slice_of_native20 (countK_alt P (_root_.UpperTheory.V.Keep.levelKA_alt P)))
    (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)

end UpperTheory.GalN.V.Win.N

namespace UpperTheory.V.HV.DescentVanishingReductions
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy

theorem window_sliced45 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) (hSF : RHShaFinite40)
    (hSlice : _root_.UpperTheory.GalN.V.Win.N.CountK3Slice20) : VWin := by
  let P := hH.toClassicalTheorems
  have hNum := _root_.UpperTheory.GalN.V.Win.N.numberU3U_sliced45 P hSlice
    (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)
  first
  | (rh_reduce 2 using [window_shared43]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact window_shared43 hH hSha hSF hNum

theorem window_sliced_native45 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_shared43 hH
  · exact _root_.UpperTheory.V.ZK.sha_of_bOdd40 _root_.UpperTheory.V.ZK.bOdd
  · exact shaLenFinite42_native
  · exact _root_.UpperTheory.GalN.V.Win.N.numberU3U_sliced_native45 hH.toClassicalTheorems

end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_adm2A_imp_adm2B limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_sliced45 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_sliced45 limit 2000
rh_prune UpperTheory.GalN.V.Win.N.numberU3U_sliced45 as RHIntegrationNumberSlicedPruned
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_sliced45
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_sliced_native45
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_sliced45
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_sliced_native45
