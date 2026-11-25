import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import RHDirectShaAnchor38
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration RUN40, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
RH OPEN. One result: integrate the direct Sha anchor into the ACTUAL
VWin caller using the SAME native ShaK existential for both branches,
rather than invoking the Sha->H2->Sha round trip in the tower branch.

Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory reduction engine, SWARM 4b77b161, HANDOFF bbc46df7, AGENTS
8db0201d, state, log/protocol and continuity openings consulted.
Latest 30 commits surveyed and 14 peer checkpoint files consulted:
editor 58d43b7e, audit 989910ad, literature 1f13cbb4, geometry a2d27f27,
character 2c98bf97, math 3843ba68, Galois b2536f01, theta a5085dd5,
structure c28ee336, Landau 0ca8c0c79, prime bed688c0, dependency 32ae80bb,
kernel 4ff04116, acceleration de1f67ea; prior integration f26f77b4 retained.
The actual route uses BOdd and SNum, not the alternative KBridge.
No reliance on the claimed RH theorem.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Pinned source ledger (relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
ModularityArgument/ClassCounting/BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
ModularityArgument/ClassCounting/SFinal.lean a960a48653fa69c34f72f5f8ed434135ff1163a6
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
KFinal.lean 9b26f8a76facea83b64788eaabdf30c492023644 and
DenseThresholdCases/LemmaKOfLitN.lean d9b4b0270de55f739f2d097ffba669478feffcb9.

Exact shared invariant: the same SNum proof packet exists C, ShaK C
supplies the original LemmaK via SFinal, AND the direct tower anchor.
The native aBound_of_descends estimate before shaLeV is
  shaInv(L1,l,e) <= shaInv(L2,l,e) + R*(m-jZero(l,R))_+.
Under all retained tower hypotheses the direct anchor bounds the first
summand using ShaK at L2, rather than increasing it to VLen and bounding
H2. Since log l >= 1/2, the original 2*kBound scale is sufficient.
This is the character lane's human derivation; this run propagates it
at the actual upstream caller, without adding any assumption on the
native route or duplicating the large tower proof. It also extracts the
actual SNum existential from lemmaK_of_steps (the 20 inputs were parsed
from lemmaK and substituted into its explicit application tree).
The original SFinal remains required for the count branches.
Core still consumes PT/LF/LT, hK, the same four counts, CountZ, CountIV,
FerreroWashington and the original 401. No change to host, hE, h4,
uniform all-prime/all-weight scope, or the window conclusion. BConst
and CK are distinct native constants; no equality between them assumed.

Original graph (selected source edges):
 VWin -> hK -> ZK.lemmaK_litN_alt -> ZK.lemmaK -> SFinal(SNum(...)).
 VWin -> hE,h4,CountI,CountV,of_four_alt.
 of_four_alt -> thmBab_of_lemmaK(hK),vwin_of_counts(hK),CountZ,Odd.
 thmBab_of_lemmaK -> H2 bound -> tower ShaInv estimate.
Candidate graph:
 sha_of_bOdd40 -> SNum(same SFew,SCount,SSha,SLayer,STors).
 window_native_sha40 -> sha_of_bOdd40(bOdd),window_sha40.
 window_sha40 -> SFinal(hSha),hE,h4,CountI,CountV,core_sha40.
 core_sha40 -> anchorThmBab_of_sha38(hSha),vwin_of_counts(hK),CountZ,Odd.
The two branches share one hSha proof object. This is a source-graph
replacement, NOT a global retirement of SFinal, PT or H2. All prior
original/reduced graphs, type/value/constructor/axiom frontiers, all
unresolved geometric and arithmetic leaves remain unchanged.
Cache by pin/toolchain, exact hH,hN,hSha,hK, BOdd proof, coefficient
and tower context, and role. Backtrack to of_four_alt and original
hK producer if direct-anchor replay fails. No URT benchmark claim.

Executed 20 fail-on-error connector JS checks: six exact source SHAs,
peer signature, extracted 20 inputs, application-tree anchor,
SFinal/BOdd anchor, exact source core cut, 401 and CountZ preserved,
joint h4 and CountV, unchanged sibling body after replacement.
A preliminary search for literal "theorem bOdd" failed because the
actual theorem uses its fully qualified name; corrected and checked.
Local command -v lean/lake found neither. Actual Actions runs
45577239749, 45576756833 and 45670987597 fetched: all completed/success.
Those are engine/conditional analytical evidence ONLY, not this file.
New file and peer direct anchor not compiled in this run, no PASS
claimed and no native job registered here. Axiom requests below are
not results.

Replay prerequisite: copy peer
specialists/character_boxes/RUN38_DIRECT_SHA_ANCHOR.lean
from commit 2c98bf976fb20958d79da8c28f8ee8cddd595c77
(blob 2de40ab81f600baab16740f88862f4aaa5a5dc39)
into the warmed pinned runner as RHDirectShaAnchor38.lean on the
same LEAN_PATH as the three engines; compile to RHDirectShaAnchor38.olean
before this overlay. No modifications to frozen upstream are required.
Do not report success until actual native outputs of BOTH are checked.

RESUME HERE: batch replay the peer anchor then this overlay and RUN39.
If successful compare role-aware scans at native and reduced actual
VWin caller, including SFinal survival at count branches. Next inspect
whether CountI and joint II/III/V actually require full LemmaK or only
a weaker Sha length at their own SAME-host consumer; no global deletion
by analogy. Prioritize actual BOdd projected detection and uniform
SNum estimate, plus TopG/ASK signed geometry. Preserve original route.
HANDOFF TO kernel, audit, editor, character boxes, Galois, literature.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy

namespace UpperTheory.V.ZK

theorem sha_of_bOdd40 (hB : BOdd) : ∃ C : ℝ, ShaK C :=
  sNum
    (LateralTheory.Fin.SFewOf.intersectionNumber_baseChange
      (sThetaOf sChain sPrism sPrismMul sZc sTrans sCoc)
      sPhi
      (sClassOf sChain sPrism sPrismMul sZc
        LateralTheory.Fin.SRel.intersectionNumber_baseChange sEta
        LateralTheory.Fin.SStein.intersectionNumber_baseChange)
      (sUpperOf sChain hB)
      LateralTheory.Fin.SDetect.intersectionNumber_baseChange)
    sCount PositivityTheory.QuaternionShaBounds.sSha
    LateralTheory.Fin.SLayer.intersectionNumber_baseChange sTors

end UpperTheory.V.ZK

namespace UpperTheory.V.HV.Core
open UpperTheory.V.Lit UpperTheory.V.W

theorem core_sha40
    (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis)
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C)
    (hK : ∃ CK : ℝ, LemmaK CK)
    (h1 : CountI) (h2 : CountII) (h3 : CountIII) (h5 : CountV) : VWin := by
  obtain ⟨B, hB⟩ := Win.anchorThmBab_of_sha38 FW.ferreroWashington hSha
  obtain ⟨CK, hL⟩ := hK
  exact vwin_of_counts (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.lfK hN.coh.ltK hL (hB 401 (by norm_num))
    (Odd.thmBcFree_of (ML.iv (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.uo)) h1 h2 h3 h5 (countZ X.propZ)

end UpperTheory.V.HV.Core

namespace UpperTheory.V.HV.DescentVanishingReductions

theorem window_sha40 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) : VWin :=
  have hK := _root_.UpperTheory.V.ZK.sFinal (_root_.UpperTheory.V.HV.U.pt_s hH.litN) hH.litN.coh.lfK hH.litN.coh.ltK hSha
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.core_sha40 hH.litN hSha hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem window_native_sha40 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_sha40 hH
  first
  | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd40, _root_.UpperTheory.V.ZK.bOdd]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact _root_.UpperTheory.V.ZK.sha_of_bOdd40 _root_.UpperTheory.V.ZK.bOdd

end UpperTheory.V.HV.DescentVanishingReductions

rh_prune UpperTheory.V.ZK.sha_of_bOdd40 as UpperTheory.V.ZK.ShaPruned40
rh_prune UpperTheory.V.HV.Core.core_sha40 as UpperTheory.V.HV.Core.CoreShaPruned40
rh_scan UpperTheory.V.ZK.lemmaK limit 2000
rh_scan UpperTheory.V.ZK.sha_of_bOdd40 limit 2000
rh_scan UpperTheory.V.HV.Core.of_four_alt limit 2000
rh_scan UpperTheory.V.HV.Core.core_sha40 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_native_sha40 limit 2000
#print axioms UpperTheory.V.ZK.sha_of_bOdd40
#print axioms UpperTheory.V.ZK.sFinal
#print axioms UpperTheory.V.Win.anchorThmBab_of_sha38
#print axioms UpperTheory.V.HV.Core.core_sha40
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_sha40
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_native_sha40
