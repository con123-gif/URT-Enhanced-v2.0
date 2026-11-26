import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN44 lane 14, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission incl mandatory pipeline read first; SWARM/HANDOFF/EXPANSION/AGENTS
consulted; latest peer commits 3463c301, 86de3c73, 6e70b2a0, 24e7f2d1
read. No uncompiled peer overlay merged. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
The apparent common Frobenius obstruction from kernel RUN19 is already
handled at the actual CountI consumer: FPropGKU chooses w above p, then
B above w and sigma a Frobenius at B, then hD applies for ALL X at this
same sigma. In particular singleton X proves every individual nonzero,
and the exact same hD applies again to the whole chosen orbit family.
KeepNumU constructs hD using a SINGLE integer NN from the summed
catalogue D1.sum D2, with NN != 0, before l/Omega/B/sigma/X are chosen.
No independent choice of Frobenius per character/model is needed here.
The producer's quantitative proof body is present in the pinned source;
this does not authenticate its transitive assumptions.

Exact simplification: the first conjunct of hD is logically redundant.
For every fixed admissible orbit family X the inequality
  0 < ||NN||_l <= product_{o,rho in X(o)} ||tr rho(sigma^-1)-t_o||_l
already implies every factor is nonzero. A zero factor makes the product
zero. This is exact before logarithms and preserves empty-family cases
(empty product = 1). Retain NN != 0, prime-to-p/2, all classification,
iso-uniqueness, level, same-host and uniform quantifier guards. If NN=0
the implication fails; if a family does not include a factor, no conclusion
about that factor is justified. Singleton admissible families in FPropGKU
are valid because admissibility is independent of o. No arbitrary common
Frobenius selection or new conjecture introduced.

Original selected graph:
CountI -> propGK_of_numberU3U_of_oneCharU -> NumberU3U_s [hD.1 nonzero,
hD.2 norm product] -> numberU3U_of_prints -> KeepNumU ->
frobenius_trace_norm_nonzero_log_bound + CountK/CountQ catalogues.
Reduced selected graph:
count_i_of_norm44 -> propGK_norm44 -> NumberU3UNorm44 [norm product]
-> number_norm_to_native44 -> exact nonzero by positive product.
Original consumer and native theorem body retained, new interface
equivalent, not a strict mathematical weakening globally. No removal of
the upstream proof-term nonvanishing edges or CountQ obligations claimed.
Cache key includes pin/toolchain,K,p,w,e,N,Orb,z,NN,l,Omega,iota,B,sigma,X,
admissibility and RepIso uniqueness; no reuse across changed witnesses.
Backtrack to original on failed replay. Source/type/value/constructor
graphs and all unresolved axiom evidence retained in previous runs.

Source paths below DenseThresholdCases/:
NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
Executed 25 fail-on-error exact source/roundtrip/negative-control checks,
and 96 exact positive-product arithmetic regression cases; 37
zero-anchor/zero-product cases demonstrate necessity of positive anchor.
Arithmetic controls are not tests of upstream Lean or actual trace data.
Local lean/lake/elan absent; actual CI 45577239749,45576756833,45670987597
freshly fetched completed/success, older baselines ONLY.
No native replay or new axiom ledger; no essential root premise retired
and no speedup measured. The unproved independent quantitative challenge
is upstream catalogue construction/authentication and other same-host
geometric/cohomological conditions, not a new common Frobenius choice.

RESUME HERE: compile this file with the pinned warmed engine oleans;
audit number_norm_to_native44 and actual count_i_of_norm44, compare
constructor-inclusive roles and #print axioms to original. Trace the
actual frobenius_trace_norm_nonzero_log_bound and CountK/CountQ suppliers,
coordinate with integration 3463c301, rather than attempting to construct
a second unrelated common Frobenius. Preserve full original graph.
HANDOFF TO kernel, integration, audit, Galois. RH OPEN.
-/
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial GlobalTheory.CuspRep GlobalTheory.HeckeGal GlobalTheory.GalOfCusp
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Published UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy UpperTheory.V.Lit UpperTheory.V.W UpperTheory.V.J

namespace UpperTheory.V.Z.J

def NumberU3UNorm44 : Prop :=
  ∀ (K : Type) [Field K] [NumberField K] [IsCMField K], Module.finrank ℚ K = 2 → ∃ c A : ℕ,
    ∀ e : ℕ, 1 ≤ e → ∀ N : ℕ, 1 ≤ N → ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime → (p : 𝓞 K) ∈ w.asIdeal → 7 ≤ p →
      ¬ p ∣ N → ¬ (p : ℤ) ∣ discr K →
    ∀ (Orb : Type) [Fintype Orb] (z : Orb → ℂ), (∀ o, ∃ k : ℕ, 0 < k ∧ z o ^ k = 1) →
      (∀ σ : ℂ ≃+* ℂ, ∃ u : Orb ≃ Orb, ∀ o, z (u o) = σ (z o)) →
    ∃ NN : ℤ, NN ≠ 0 ∧ Real.log |(NN : ℝ)| ≤ c * Fintype.card Orb * ((N : ℝ) * (e + 1)) ^ A * Real.log p ∧
      ∀ (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p → ∀ (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω] [IsScalarTower ℚ K Ω]
        [IsAlgClosure K Ω] (ι : Qbar l ≃+* ℂ) (B : ValuationSubring Ω), IsPlaceOver B w →
        ∀ σ : G K Ω, IsFrob B (normV w) σ →
        ∀ X : Orb → Finset (G K Ω →* GL (Fin 3) (Qbar l)),
          (∀ o, ∀ ρ ∈ X o, _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ) →
          (∀ o, ∀ ρ ∈ X o, ∀ ρ' ∈ X o, RepIso ρ ρ' → ρ = ρ') →
          ‖((NN : ℤ) : Qbar l)‖ ≤
            ∏ o, ∏ ρ ∈ X o, ‖(ρ σ⁻¹ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ι.symm (eis3 (normV w) e (z o))‖

theorem number_native_to_norm44 : NumberU3U_s → NumberU3UNorm44 := by
  intro h K _ _ _ hK
  obtain ⟨c, A, hc⟩ := h K hK
  refine ⟨c, A, ?_⟩
  intro e he N hN p w hp hw h7 hpN hpd Orb _ z hz hcz
  obtain ⟨NN, h0, hb, H⟩ := hc e he N hN p w hp hw h7 hpN hpd Orb z hz hcz
  refine ⟨NN, h0, hb, ?_⟩
  intro l _ hl2 hlp Ω _ _ _ _ _ ι B hB σ hσ X hX hX'
  exact (H l hl2 hlp Ω ι B hB σ hσ X hX hX').2

theorem number_norm_to_native44 : NumberU3UNorm44 → NumberU3U_s := by
  intro h K _ _ _ hK
  obtain ⟨c, A, hc⟩ := h K hK
  refine ⟨c, A, ?_⟩
  intro e he N hN p w hp hw h7 hpN hpd Orb _ z hz hcz
  obtain ⟨NN, h0, hb, H⟩ := hc e he N hN p w hp hw h7 hpN hpd Orb z hz hcz
  refine ⟨NN, h0, hb, ?_⟩
  intro l _ hl2 hlp Ω _ _ _ _ _ ι B hB σ hσ X hX hX'
  have hnorm := H l hl2 hlp Ω ι B hB σ hσ X hX hX'
  refine ⟨?_, hnorm⟩
  intro o ρ hρ heq
  classical
  have hz' : ∏ ρ' ∈ X o, ‖(ρ' σ⁻¹ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ι.symm (eis3 (normV w) e (z o))‖ = 0 := by
    apply Finset.prod_eq_zero hρ
    rw [heq, sub_self, norm_zero]
  have hz'' : ∏ o', ∏ ρ' ∈ X o', ‖(ρ' σ⁻¹ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ι.symm (eis3 (normV w) e (z o'))‖ = 0 :=
    Finset.prod_eq_zero (Finset.mem_univ o) hz'
  have hpos : 0 < ‖((NN : ℤ) : Qbar l)‖ := norm_pos_iff.2 (by exact_mod_cast h0)
  rw [hz''] at hnorm
  exact (not_lt_of_ge hnorm) hpos

theorem number_norm_iff44 : NumberU3UNorm44 ↔ NumberU3U_s :=
  ⟨number_norm_to_native44, number_native_to_norm44⟩

theorem propGK_norm44 : NumberU3UNorm44 → OneCharU_s → PropGK := by
  intro hN hO
  first
  | (rh_reduce 2 using [propGK_of_numberU3U_of_oneCharU, number_norm_to_native44]; done)
  | (rh_auto_frontier 1; done)
  | (rh_auto 1; done)
  | exact propGK_of_numberU3U_of_oneCharU (number_norm_to_native44 hN) hO

theorem count_i_of_norm44 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hKa : _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW) (h3 : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt) (hNum : NumberU3UNorm44) : CountI :=
  have hC := _root_.UpperTheory.V.HV.Core0.cohInp_alt hH.litN hK
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  U3.countI (U3.corGK (_root_.UpperTheory.V.Z.J.propGK_norm44 hNum
    (_root_.UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy hC Alg.M.main_holds Alg.M.mprime_holds Alg.lemmaP hKa (_root_.UpperTheory.V.Z.J.rigIUE_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE)
      (_root_.UpperTheory.V.Z.Win.RR.rigII_a_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH)) (_root_.UpperTheory.V.Z.J.admissible_typeI_even_level_alt hC hH hE) h3)))

end UpperTheory.V.Z.J

rh_prune UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU as RHPropGK44Pruned
rh_scan UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU limit 2000
rh_scan UpperTheory.V.Z.J.propGK_norm44 limit 2000
rh_scan UpperTheory.V.Z.J.count_i_of_norm44 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints limit 2000
#print axioms UpperTheory.V.Z.J.number_norm_to_native44
#print axioms UpperTheory.V.Z.J.number_native_to_norm44
#print axioms UpperTheory.V.Z.J.propGK_norm44
#print axioms UpperTheory.V.Z.J.count_i_of_norm44
#print axioms UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy
