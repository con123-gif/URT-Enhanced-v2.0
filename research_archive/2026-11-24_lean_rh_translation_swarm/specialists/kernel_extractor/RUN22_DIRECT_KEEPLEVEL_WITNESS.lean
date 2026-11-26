import RUN20_RANK3_SLICE_JOINT_EXPONENT
import RUN21_RANK3_EXISTENTIAL_LEVEL_WITNESS
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepLevel

/-!
RUN22 lane 11, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission latest blob f8b4b837301f8cf43d673be4979f04c4e4b415a4, mandatory
engine; AGENTS, SWARM, HANDOFF, EXPANSION and continuity consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. No upstream migration.
Sources: DenseThresholdCases/KeepLevel.lean f6bf6656c2fa3abdfd7a1f660710ddd53091e203
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7, AutQN.lean d626de1e423ebf58d4b7357f69905fd98829ff51.
RUN20 blob c7690d1be83523d4ec31cd8ebfde42971b936cc3; RUN21 blob e638a13b5d650ffc4bf167bafc83b364b0c8630b.
Peers 65d0f958 (rank3 direct coarse exponent), 425c27c5 (native Borel/Clozel),
c46be9ef (resultant), bbb56405 (geometry), e3f9d949 (Kummer),
59085d33 (prime shell), 893007c3 (row gauge) checked; preserve their work.

Result: Rank3LevelWitness21 is not a new mathematical premise at the
actual NumberU3U consumer. Native levelKA_alt already constructs it
through levelCore_alt; splice its polarization and core application
directly into the rank-three witness. The SAME pi extracted from hr.aut
satisfies infinity character, level-fixed vectors and Frobenius at all
places away from l. Semisimplicity is ha.1. No new assumptions.
The original strict-antitone parameter of levelKA_alt is unused in its
body (underscore in intro); the levelCore_alt call does not require it.
Rank-three strict-antitone is still needed in the catalogue conjugacy
argument; no global deletion. Field degree and e>=1 stay in the interface.
The core still has three genuinely needed outputs and invokes local-global
compatibility, jumps, fixed vectors and Satake. Do not confuse replacing
a wrapper by its proof with proving these substantive inputs.

Original selected graph:
  numberU3U_of_prints -> numberU3U_of_adm2A_imp_adm2B ->
  countK_alt <- levelKA_alt <- levelCore_alt.
Reduced candidate:
  numberU3U_of_prints22 -> numberU3U_of_rank3_slice20 ->
  countK_rank3_native22 -> countK_rank3_of_witness21 +
  rank3_witness_of_core22 -> levelCore_alt.
All remaining CountP/LevelPNAlt/AdmRes/NewAdm/Adm2B suppliers retained.
In peer 65d0f958, supply rank3_witness_of_core22 hH.toClassicalTheorems
to window_rank3_direct46, eliminating its explicit hW input.
No original dependencies or trust evidence removed globally. Keep core,
all other consumers and unresolved role edges. Context key: pin/toolchain,
K/e/M/l/Omega/iota/r/pi and same level, local conditions and caller.
No declaration-only context merges. Fallback is native numberU3U_of_prints20.

Executed 20 fail-on-error static V8 source checks:
pinned KeepLevel.lean; pinned KeepNumU.lean; pinned AutQN.lean; native unused strict anti binder; native polarization exact body; core invocation exact; same pi result; native actual caller; admitted odd; admitted automorphy; admitted level; native witness unpack; native witness semisimplicity; slice definitions identical; unique existing fallback; reversible caller edit; native rank3 direct producer; core has distinct three branches; core level remains; core Frobenius remains.
Local lean/lake/elan absent. Actual GitHub jobs for 45577239749 and
45576756833 were fetched this run: pick/run/record completed success.
Those historical jobs do NOT verify this candidate. New kernel/axiom
output unavailable. No PASS or proof-closure claim for RUN22.

RESUME HERE: stage RUN20, RUN21, this module and the three native engines
with the pinned warmed runner. Check exact slice defeq and witness first,
then actual NumberU3U and peer window_rank3_direct46 substitution.
Scan type/value/constructor edges and inspect actual axiom outputs.
If failure preserve original graph and fallback. Next reduce
levelCore_alt via its actual compatT, guard_of, and fixed-vector
consumers, keeping the same pi and all retained local/global premises.
HANDOFF TO integration, Galois, audit, acceleration. RH OPEN.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.LocGL GlobalTheory.GalOfCusp
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Lev UpperTheory.V.Z.Win
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField
open scoped Matrix

namespace UpperTheory.GalN.V.Win.N

theorem rank3_witness_of_core22
    (P : _root_.UpperTheory.V.Af.Hypotheses') : Rank3LevelWitness21 := by
  intro K _ _ _ _ e _ M hM l _ hl2 Ω _ _ _ ι r hr
  obtain ⟨π, hreg, hd, ha⟩ := hr.aut.1
  have hpol : GlobalTheory.ContraPair.PolarizedPair π (quadChar K ^ (3 : ℕ)) :=
    ⟨fun v => by rw [locInf_pow, quadChar_locInf], by
      rw [map_pow, compNorm_quadChar, one_pow]; exact (GlobalTheory.ContraPair.dualIsConjBy_one π).2 hd⟩
  have h := _root_.UpperTheory.V.Keep.levelCore_alt P K 3 (by norm_num)
    ![(e : ℤ) - 1, -1, -(e : ℤ) - 1] M hM l hl2 Ω ι r π
    (LevelF.of_level hr.level) hr.odd (hr.aut.2 hr.level.cont) hreg ⟨_, hpol⟩ ha
  exact ⟨π, ⟨h.1, hd, h.2.1⟩, ha.1, h.2.2⟩

theorem slice_identity22 : CountK3Slice21 = CountK3Slice20 := rfl

theorem countK_rank3_native22
    (P : _root_.UpperTheory.V.Af.Hypotheses') : CountK3Slice20 := by
  have hw := rank3_witness_of_core22 P
  have h : CountK3Slice21 := countK_rank3_of_witness21 P hw
  exact h

theorem countK_rank3_auto22
    (P : _root_.UpperTheory.V.Af.Hypotheses') : CountK3Slice21 := by
  first
  | (rh_reduce 3 using [countK_rank3_of_witness21, rank3_witness_of_core22]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact countK_rank3_of_witness21 P (rank3_witness_of_core22 P)

theorem numberU3U_of_prints22 :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.V.Z.J.NumberU3U_s := fun P =>
  numberU3U_of_rank3_slice20 P (countK_rank3_native22 P) (_root_.UpperTheory.V.Keep.levelPA_alt P) (_root_.UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results P) (_root_.UpperTheory.V.Z.Win.A4.newAdmS_alt P) (_root_.UpperTheory.GalN.V.adm2B_of_adm2B P)

end UpperTheory.GalN.V.Win.N

rh_scan UpperTheory.V.Keep.levelKA_alt limit 2000
rh_scan UpperTheory.V.Keep.levelCore_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.rank3_witness_of_core22 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.numberU3U_of_prints22 limit 2000
rh_prune UpperTheory.GalN.V.Win.N.rank3_witness_of_core22 as RHRank3WitnessPruned22
#print axioms UpperTheory.V.Keep.levelCore_alt
#print axioms UpperTheory.GalN.V.Win.N.rank3_witness_of_core22
#print axioms UpperTheory.GalN.V.Win.N.countK_rank3_native22
#print axioms UpperTheory.GalN.V.Win.N.numberU3U_of_prints22
