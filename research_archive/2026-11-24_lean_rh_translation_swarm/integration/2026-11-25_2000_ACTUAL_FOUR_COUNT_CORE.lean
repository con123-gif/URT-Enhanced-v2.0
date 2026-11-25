import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration RUN39, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
RH OPEN. One result: factor the actual root-reachable four-count VWin
consumer through the four cohomology inputs it really uses, with one
common LemmaK witness. Correct the live proof's CountZ source gap.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including
mandatory engine; SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d,
research state and living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc
consulted. Latest 20 commits surveyed. Detailed peer files consulted:
8eef4b8a (PropZ), 2235982d (actual Kato W), 79428d5b (power-image),
e4d69792 (fixed towers), 2d9cc303 (finite calibration), d5bb73cf
(determinant torus), 4445c6bd (finite adele dictionary), a9dc2a6f
(joint mean), 8aed7b77 (CountQ twist). Do not duplicate those results.

Frozen source 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Source ledger (prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
ModularityArgument/ThresholdArguments/DenseThresholdCases/TopMainZj.lean 23b7a05606074da30e6f8eb3b3821e877a968d3e
ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4
LevelCohomology/PropZ.lean 725ebfc6d262f113cb593a8db61c12e7e6b028a3
HeightAndVanishing/CountZ.lean 5601df23547fac2586abcd3717f6ae7c468e8b03
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1
LayeredIsomorphisms/ThmBabOfLemmaK.lean 20c347251400d31a39cf68f964d6648d87f3dda4
PrimitiveFrobeniusFixed/Iv.lean 36bec10c7288c234494fb286431d314f9ac9e393
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVFinalU.lean 03a1a89bfd216d404766ac95c0a6c6e11e307b0c
ModularityArgument/ThresholdArguments/DenseThresholdCases/LitAut.lean c9c972597441f9f26e9ada3f63d5c063cb6438bd

Actual native path (source-visible, not complete kernel graph):
vwin_of_row -> automorphic_window_of_inputs ->
v_window_of_depth_zero_residual_bc_cm -> v_window_of_literal_automorphy_n
-> v_window_of_automorphy_csd_ss_mono_odd -> vwin_of_hypotheses_H_E_alt
-> Core.of_four_alt -> vwin_of_counts -> jointWin_of_counts
-> thmHV_of_counts -> pointHV_of_counts -> sumIn and sumOut.
Sibling consumers in vwin_of_hypotheses_H_E_alt are unchanged:
hK=lemmaK_litN_alt hH.litN, hE=ends0_alt hH, h4=the single
countII_and_countIII_of_printsH_of_sp4In hH hK (sp4In0_alt hH);
CountI uses KatoTwoW; CountV uses reduced unitary lift hE.2.

Correction to live proof section 5: PropZ source HAS been located
by lane 11; more importantly, the actual root-reachable of_four_alt
ALREADY passes (countZ X.propZ). CountZ is not an independent missing
premise in the original path. Its proof chooses exponent zero and
Vlen=0 under the native CaseZ guards. PropZ splits l-1 | e and its
negation (zOne,zQuad). CountIV is likewise ALREADY supplied by the
native pointHV_of_counts, not an additional independent premise.
Do not report either as new kernel-closed by this session, or assert
CountIV is universally zero. CountIII remains the second projection
of the same h4; no deletion of it in this generic VWin route. Retain
the local decomposition condition in zQuad and the actual source
proof's class-field/duality/axiom dependencies.

Actual local weakening: of_four_alt receives LiteratureRankNHypothesis,
which has four fields loc, aut, coh, cm. Its body consumes only pt_s hN
(normalized PT from hN.coh.pt), hN.coh.lfK, hN.coh.ltK, hN.coh.uo.
The new theorem receives just PT, LF, LT, UnramifiedOrthogonality and
the original LemmaK and four count inputs. Destruct hK once and use
the same CK,hL for both thmBab_of_lemmaK and vwin_of_counts; the former
takes the existential packet so provide precisely the same witness.
No change to constants 401, universal VWin conclusion, host choices,
or all-weight/all-prime quantifiers. FerreroWashington remains the
same native supplier. This is not a proof of PT/LF/LT/UO, LemmaK or
the four count estimates. The new actual caller below preserves hH,
hE,hK,h4 and every sibling; it only changes the local consumer
interface. No import of Main or the claimed RH theorem.

Reduced candidate graph:
window_core39 -> core_cohomology39 -> thmBab_of_lemmaK (same hK witness),
vwin_of_counts -> same pointHV; core_cohomology39 also -> PT,LF,LT,UO,
ML.iv, Odd.thmBcFree_of, FW.ferreroWashington, countZ X.propZ.
Original graph and pending kernel/type/constructor/axiom edges retained.
The entire hN packet is still consumed by sibling routes; its fields
cannot be removed globally. Cache by pin/toolchain, hH/hN, exact hK
context, CK and the four count proofs; do not combine independent host
choices. If native replay fails backtrack to of_four_alt and original
caller. No proof obligation globally retired.

Executed 49 exact source/blob and anchor checks across 11
pinned files in connector JS. Four earlier guessed DenseThresholdCases
paths failed with 404; corrected prefix from dependency lane.
Local command -v lean/lake returned no paths. Actual GitHub Actions
run 45670987597 jobs pick/run/record retrieved; all concluded success
including conditional diagonal-root abs-fix job. This is not verification
of this new candidate. No native run queued or claimed here.
No URT benchmark or proof speedup claim.

RESUME HERE: integration/editor replace the stale "original PropZ supplier
body has not been located" in HUMAN_PROOF_ONE_EQUATION.md with the above
actual caller correction. Batch replay this exact file and peer RUN13
PropZ in the pinned warmed runner; compare actual original and candidate
role scans including constructor/type/axiom ledger, preserve failures.
Focus on the actual hK producer lemmaK_litN_alt and the KBridge power
image supplier, joint h4, CountI/V, minus, dyadic and simultaneous
same-host geometric loss, not another CountZ wrapper.
HANDOFF TO: human editor, kernel extractor, formal audit, math/Galois.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy

namespace UpperTheory.V.HV.Core
open UpperTheory.V.Lit UpperTheory.V.W

theorem core_cohomology39
    (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK)
    (hU : ReciprocityTheory.Gal.UnramifiedOrthogonality)
    (hK : ∃ CK : ℝ, LemmaK CK)
    (h1 : CountI) (h2 : CountII) (h3 : CountIII) (h5 : CountV) : VWin := by
  obtain ⟨CK, hL⟩ := hK
  obtain ⟨B, hB⟩ := Win.thmBab_of_lemmaK hP hF hT FW.ferreroWashington ⟨CK, hL⟩
  have hz : CountZ := by
    first
    | (rh_reduce 2 using [UpperTheory.V.HV.countZ, UpperTheory.V.X.propZ]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact countZ X.propZ
  exact vwin_of_counts hP hF hT hL (hB 401 (by norm_num))
    (Odd.thmBcFree_of (ML.iv hP hU)) h1 h2 h3 h5 hz

theorem core_of_four_bridge39
    (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis)
    (hK : ∃ CK : ℝ, LemmaK CK)
    (h1 : CountI) (h2 : CountII) (h3 : CountIII) (h5 : CountV) : VWin :=
  core_cohomology39 (_root_.UpperTheory.V.HV.U.pt_s hN)
    hN.coh.lfK hN.coh.ltK hN.coh.uo hK h1 h2 h3 h5

end UpperTheory.V.HV.Core

namespace UpperTheory.V.HV.DescentVanishingReductions

theorem window_core39 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin :=
  have hK := _root_.UpperTheory.V.ZK.lemmaK_litN_alt hH.litN
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.core_cohomology39
    (_root_.UpperTheory.V.HV.U.pt_s hH.litN) hH.litN.coh.lfK
    hH.litN.coh.ltK hH.litN.coh.uo hK
    (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1))
    h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

end UpperTheory.V.HV.DescentVanishingReductions

rh_prune UpperTheory.V.HV.Core.of_four_alt as UpperTheory.V.HV.Core.OfFourOriginalPruned39
rh_prune UpperTheory.V.HV.Core.core_cohomology39 as UpperTheory.V.HV.Core.CoreCohPruned39
rh_scan UpperTheory.V.HV.Core.of_four_alt limit 2000
rh_scan UpperTheory.V.HV.Core.core_cohomology39 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_core39 limit 2000
#print axioms UpperTheory.V.X.propZ
#print axioms UpperTheory.V.HV.countIV
#print axioms UpperTheory.V.HV.Core.of_four_alt
#print axioms UpperTheory.V.HV.Core.core_cohomology39
#print axioms UpperTheory.V.HV.Core.core_of_four_bridge39
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_core39
