import RHIntegrationRank3Direct46
import RUN22_DIRECT_KEEPLEVEL_WITNESS
import RHDependencySatakeOneRec46
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.VwinOfRow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration RUN47, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
RH OPEN. One result: substitute peer same-pi level witness and direct
coarse rank-three count at the actual row-to-window caller. The explicit
Rank3LevelWitness21 of RUN46 is supplied by the existing levelCore
construction or the one-reciprocity variant (one rc per place, not one
rc for all places). No new premise or independent arithmetic closure.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory engine,
SWARM/HANDOFF/AGENTS, state, runner protocol, continuity and living proof
consulted. Latest selected handoffs across 14 lanes inspected (math
log-gap no-go, audit norm torsion, dependency Satake one-rec, structure
Good projection, character twisted layer, Galois Kuga, kernel KeepLevel,
Landau one-ring, literature weighted count, acceleration resultant,
geometry regular fibre, prime cyclic descent, editor orthogonal gauge,
theta determinant section). No unrelated unchecked changes merged.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Sources relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/
WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
TopMainZj.lean 23b7a05606074da30e6f8eb3b3821e877a968d3e
VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4
PublishedHypothesesFromPatching.lean 8a57b35c343ed717c225b04710c835f102deaa3b
Peer direct 2d356c4bfe636d8b9c7ac63b3580f6b6148b66c4; core 9617a35f3cea7f480628024d0b28ec6fa4e6b4c5; oneRec 7220d0aacdabedba4618f9e0c059f73f95a31459;
sliced a839ff86da5c5c223c3b1e2ac64bade3366aebcc. Stage direct as RHIntegrationRank3Direct46 and
dependency 2026-11-26_0412_SATAKE_ONE_RECIPROCITY.lean as
RHDependencySatakeOneRec46. Avoid duplicate declarations from alias
modules: in STAGED copies of RUN22 and its transitive imports normalize
RUN20_RANK3_SLICE_JOINT_EXPONENT to RHKernelRank3Slice20 and
RUN21_RANK3_EXISTENTIAL_LEVEL_WITNESS to RHKernelRank3Witness21
as required by earlier integration overlays. Preserve archive originals
and record staged hashes. Compile in dependency order.

Original graph: vwin_of_row -> automorphic_window_of_inputs ->
v_window_of_depth_zero_residual_bc_cm -> v_window_of_literal_automorphy_n
-> v_window_of_automorphy_csd_ss_mono_odd -> vwin_of_hypotheses_H_E_alt
-> original four-count branch. Candidate: exact same five wrapper
signatures and same row, O, bc, gal, cm, hN, patching and descWeak,
then window_oneRec_native47 -> window_oneRec47 -> window_rank3_direct46
-> direct count / window_sliced45 -> window_shared43. Rank3LevelWitness21
supplied by rank3_witness_oneRec46 -> levelCore_oneRec46 -> satFrob_oneRec46.
Fallback window_keep47 -> rank3_witness_of_core22 -> levelCore_alt.
Same pi, semisimplicity, weights, level and Frobenius. All original
type/value/constructor and axiom evidence retained. The native Sha
suppliers are still present, NOT newly proved. Explicit window_oneRec47
retains hSha/hSF. Local-global compatibility, cohomology, literature,
same-host geometry and decisive prime-window inequality still require
independent audit. No complete root proof. Cache key source/toolchain,
h/O/bc/gal/cm/hN/hH/hSha/hSF and K/e/M/l/Omega/iota/r/pi/w/A/h/rc,
consumer; no declaration-only merge.

Executed 39 fail-on-error static source and reversible
substitution checks: RUN22_DIRECT_KEEPLEVEL_WITNESS.lean pin; 2026-11-26_0412_SATAKE_ONE_RECIPROCITY.lean pin; WindowBoundOfLiteratureLevel.lean pin; TopMainZj.lean pin; VwinOfRow.lean pin; PublishedHypothesesFromPatching.lean pin; direct witness interface; direct actual slice; native core witness; one reciprocity witness; same pi both; existing sha fallback; existing qualitative fallback; alias conflict; unique theorem v_window_of_automorphy_csd_ss_mono_odd; reversible theorem v_window_of_automorphy_csd_ss_mono_odd47; unique _root_.UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt; reversible _root_.UpperTheory.V.HV.DescentVanishingReductions.window_oneRec_native47; unique theorem UpperTheory.V.v_window_of_literal_automorphy_n; reversible theorem UpperTheory.V.v_window_of_literal_automorphy_n47; unique _root_.UpperTheory.V.HV.DescentVanishingReductions.v_window_of_automorphy_csd_ss_mono_odd hN; reversible _root_.UpperTheory.V.HV.DescentVanishingReductions.v_window_of_automorphy_csd_ss_mono_odd47 hN; unique theorem UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm; reversible theorem UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm47; unique _root_.UpperTheory.V.v_window_of_literal_automorphy_n ; reversible _root_.UpperTheory.V.v_window_of_literal_automorphy_n47 ; unique theorem UpperTheory.One.Join.automorphic_window_of_inputs; reversible theorem UpperTheory.One.Join.automorphic_window_of_inputs47; unique _root_.UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm ; reversible _root_.UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm47 ; unique theorem UpperTheory.One.vwin_of_row; reversible theorem UpperTheory.One.vwin_of_row47; unique UpperTheory.One.Join.automorphic_window_of_inputs ; reversible UpperTheory.One.Join.automorphic_window_of_inputs47 ; actual row argument sequence; patching descWeak retained; all four literature fields retained; CM retained; no placeholder or claimed root.
First attempt failed because I inserted parentheses around native
baseChangeN h, misreading its application structure. No write occurred.
Corrected by preserving the source's exact three-argument sequence.
Local command -v lean/lake/elan produced no paths. Actual historical
CI jobs 45577239749,45576756833,45670987597 fetched this run:
pick/run/record all completed success, baseline only. No native
verification of this certificate, new axiom evidence or URT speedup.
No original obligations globally retired.

RESUME HERE: stage normalized aliases, compile RUN20/21/22, direct
rank3 and oneRec separately, then this row adapter. Compare actual
row scans and axioms preserving pending role frontiers. If oneRec
fails, backtrack to window_keep47 and the original row wrapper;
do not import the claimed RH theorem. Next prioritize actual uniform
STors/SFew, same-host geometry and the compatT/WDT supplier rather
than further rank-three cardinal refinements. HANDOFF TO kernel,
Galois, audit, dependencies, editor. RH OPEN.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
open UpperTheory.Top Formalism.GaloisCohomology GlobalTheory.Mem.LiteralAutomorphy

namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_keep47 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) (hSF : RHShaFinite40) : VWin := by
  exact window_rank3_direct46 hH hSha hSF
    (_root_.UpperTheory.GalN.V.Win.N.rank3_witness_of_core22 hH.toClassicalTheorems)

theorem window_oneRec47 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) (hSF : RHShaFinite40) : VWin := by
  have hW : _root_.UpperTheory.GalN.V.Win.N.Rank3LevelWitness21 :=
    _root_.UpperTheory.GalN.V.Win.N.rank3_witness_oneRec46 hH.toClassicalTheorems
  exact window_rank3_direct46 hH hSha hSF hW

theorem window_oneRec_native47 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_oneRec47 hH
  · first
    | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd40, _root_.UpperTheory.V.ZK.bOdd]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact _root_.UpperTheory.V.ZK.sha_of_bOdd40 _root_.UpperTheory.V.ZK.bOdd
  · exact shaLenFinite42_native

theorem v_window_of_automorphy_csd_ss_mono_odd47 (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) : VWin :=
  _root_.UpperTheory.V.HV.DescentVanishingReductions.window_oneRec_native47 (_root_.UpperTheory.V.HV.DescentVanishingReductions.published_hypotheses_from_patching_alt hN UpperTheory.V.Z.Tf.SR.descWeak)
end UpperTheory.V.HV.DescentVanishingReductions
end UpperTheory.V.HV.DescentVanishingReductions

theorem UpperTheory.V.v_window_of_literal_automorphy_n47 (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis) : VWin :=
  _root_.UpperTheory.V.HV.DescentVanishingReductions.v_window_of_automorphy_csd_ss_mono_odd47 hN

theorem UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm47 (O : _root_.UpperTheory.LiteratureTheorems.OpenImageCondition)
 (bc : _root_.PositivityTheory.Rg.BcN.BaseChangeIsobaricN) (gal : _root_.UpperTheory.V.Z.Win.RowT) (cm : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureCMHypothesis) :
    UpperTheory.Top.VWin :=
  _root_.UpperTheory.V.v_window_of_literal_automorphy_n47 ⟨_root_.UpperTheory.One.Join.local_inputs_from_literature O, _root_.UpperTheory.One.Join.automorphic_inputs_from_literature O bc gal, _root_.UpperTheory.LiteratureTheorems.galois_cohomology_from_literature O, cm⟩

theorem UpperTheory.One.Join.automorphic_window_of_inputs47 (O : _root_.UpperTheory.LiteratureTheorems.OpenImageCondition)
 (bc : _root_.PositivityTheory.Rg.BcN.BaseChangeIsobaricN) (gal : _root_.UpperTheory.V.Z.Win.RowT) :
    UpperTheory.Top.VWin :=
  _root_.UpperTheory.One.Join.v_window_of_depth_zero_residual_bc_cm47 O bc gal (_root_.UpperTheory.One.Join.cm_abelian_inputs_from_literature O)

theorem UpperTheory.One.vwin_of_row47 (h : UpperTheory.GalStar.Row0b fun h rc => UpperTheory.Zero.LLC.IsRecT h rc) : UpperTheory.Top.VWin :=
  UpperTheory.One.Join.automorphic_window_of_inputs47 (UpperTheory.LiteratureTheorems.OpenImageCondition.mk h) UpperTheory.BaseChangeIdentities.baseChangeN h

rh_scan UpperTheory.One.vwin_of_row limit 2000
rh_scan UpperTheory.One.vwin_of_row47 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_oneRec47 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_oneRec_native47 limit 2000
rh_prune UpperTheory.V.HV.DescentVanishingReductions.window_oneRec47 as RHIntegrationWindowPruned47
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_keep47
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_oneRec47
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_oneRec_native47
#print axioms UpperTheory.One.vwin_of_row47
