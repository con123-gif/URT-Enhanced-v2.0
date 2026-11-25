import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN38 lane 14, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine,
SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS 8db0201d,
state/continuity and latest peers read. Integration f26f77b4, audit
c2aa33f2, geometry 2d9cc303 and own RUN37 aba4dad7 consulted.

IMPORTANT ROUTE CORRECTION: the actual VWin caller uses ZK.lemmaK_litN_alt,
NOT K.lemmaK from GeneratorCountTuples/LemmaKOfPublished. The two
qualified theorems supply the same shared UpperTheory.V.LemmaK (defined
once, see source ledger below), but their source proof bodies differ.
The original source-visible branch is:

vwin_of_hypotheses_H_E_alt -> ZK.lemmaK_litN_alt ->
ZK.lemmaK_of_litN_alt -> ZK.lemmaK -> lemmaK_of_steps
-> SFinal(PT,LF,LT, SNum(SFew,SCount,SSha,SLayer,STors)).
SFew uses STheta, SPhi, SClass, SUpper, SDetect.
SUpper comes from sUpperOf SChain BOdd.
BOdd -> bOdd_zk -> bStarOdd -> sBStarOdd_of with odd-cycle/rank,
stabilization, Hecke, local and surjectivity suppliers.
ZK.sFinal is an explicit proof consuming the ShaK length bound,
PT/LF/LT and local H0 terms. It uses K.numFin, not a direct
application of KBridge. This is a source-level selected path; no claim
that KBridge is absent in every transitive proof/type/constructor edge.

RESULT: one exact caller cut at hK (one existential proof packet).
The original body below is byte-for-byte unchanged after removing
the one local producer and adding a typed parameter. This gives two
independent possible suppliers for the SAME consumer:
 (A) (exists C, ShaK C) plus the original PT/LF/LT via ZK.sFinal;
 (B) KBridge plus the original PT/LF/LT via K.lemmaK and torsMain,
     dropping only the extra positive-CK conjunct.
The original native ZK route remains fallback. Route B is an ALTERNATIVE,
not an established necessary obligation on the original route. The
literature/audit work on Hurewicz and integral stability pertains to B;
it cannot be reported as reducing the actual BOdd/sUpper proof without
a checked caller substitution. Route A can use the existing SNum
supplier once its actual leaves are independently authenticated.
Both routes preserve the same all-prime, all-weight LemmaK predicate,
the single hH/hN, the shared hK packet for I, II/III, V and core;
the exact same h4, hE and all sibling consumers. No implication between
ShaK and KBridge asserted. Do not conflate the rank in odd degree
k+1 in BOdd with the even degree 2e in KBridge.

Original graph retained: hK->ZK branch above; VWin->hE,h4,I,V,Core;
Core->thmBab_of_lemmaK,vwin_of_counts,CountZ,CountIV; all other
root-to-frontier edges, axioms and constructors remain pending as before.
Reduced candidate graph: window_with_lemmaK38->hK,hE,h4,I,V,Core;
window_with_sha38->ZK.sFinal,hK-cut; window_with_bridge38->K.lemmaK,
torsMain,hK-cut. No retirement of shared nodes globally; only alternative
scheduling. Backtrack to native ZK proof if B cannot be supplied or replay
fails. Cache by pin/toolchain, exact hH,hN,PT/LF/LT, supplier branch,
actual hK witness, and type/constructor roles. Never use declaration
suffix alone as identity. No URT advantage or speedup measured.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Source ledger prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
ModularityArgument/ThresholdArguments/DenseThresholdCases/KFinal.lean 9b26f8a76facea83b64788eaabdf30c492023644
ModularityArgument/ThresholdArguments/DenseThresholdCases/LemmaKOfLitN.lean d9b4b0270de55f739f2d097ffba669478feffcb9
ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
ModularityArgument/ClassCounting/BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/TorsionIntegers/Bridge.lean 7ff84d3d02c1f4cfb386505d590e2eb4e0c96f8c
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa
ModularityArgument/ClassCounting/SFinal.lean a960a48653fa69c34f72f5f8ed434135ff1163a6
GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
GeneratorCountTuples/LemmaKOfPublished.lean 82044f2422c5b48970bd94223e33087a7896fc40
GeneratorCountTuples/Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b
ModularityArgument/ThresholdArguments/DenseThresholdCases/HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
Executed 55 fail-on-error checks in connector JS: exact blob SHA,
literal qualified call/definition anchors, selected body absence of
explicit KBridge, identical caller body after producer extraction.
No native Lean/Lake on local PATH; this file not compiled or queued.
CI status files and job records fetched: baseline 45577239749 and
45576756833 returncode 0; latest 45670987597 diagonal analytic bridge
returncode 0 (status blob 0669c532840ad3a26459a9ac71be41d6f4bc9fb1),
tail explicitly says arithmetic premise not proved. None verifies
this new file. Axiom commands below are requests, not results.

RESUME HERE: replay this exact overlay and integration RUN39 together
in the existing pinned runner. Compare native role/axiom evidence for
the original ZK.lemmaK and the alternative K.lemmaK. Audit BOdd's actual
bStarOdd odd-degree source path (including rank and finite-coefficient
stability) while the literature lane completes alternative KBridge;
choose the first independently valid route, not a conjunction of both.
Do not duplicate the existing downstream prime-window proof. CountI/V,
joint CountII/III, minus/dyadic, TopG and same-host quantitative losses
are still open for independent reconstruction. RH OPEN.
HANDOFF TO integration, kernel, formal audit, literature, Galois.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
open Formalism.GaloisCohomology UpperTheory.Top

namespace UpperTheory.V.HV.DescentVanishingReductions

theorem window_with_lemmaK38 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, UpperTheory.V.LemmaK CK) : VWin :=
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.of_four_alt hH.litN hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem window_with_sha38
    (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hS : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) : VWin := by
  apply window_with_lemmaK38 hH
  exact _root_.UpperTheory.V.ZK.sFinal
    (_root_.UpperTheory.V.HV.U.pt_s hH.litN)
    hH.litN.coh.lfK hH.litN.coh.ltK hS

theorem window_with_bridge38
    (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hB : _root_.UpperTheory.V.K.KBridge) : VWin := by
  apply window_with_lemmaK38 hH
  obtain ⟨CK, _, hK⟩ := _root_.UpperTheory.V.K.lemmaK
    (_root_.UpperTheory.V.HV.U.pt_s hH.litN)
    hH.litN.coh.lfK hH.litN.coh.ltK hB
  exact ⟨CK, hK⟩

theorem window_native38
    (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_with_lemmaK38 hH
  first
  | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.lemmaK_litN_alt]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact _root_.UpperTheory.V.ZK.lemmaK_litN_alt hH.litN

end UpperTheory.V.HV.DescentVanishingReductions

rh_prune UpperTheory.V.ZK.lemmaK as UpperTheory.V.ZK.LemmaKPruned38
rh_scan UpperTheory.V.ZK.lemmaK limit 2000
rh_scan UpperTheory.V.K.lemmaK limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_with_bridge38 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_with_sha38 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
#print axioms UpperTheory.V.ZK.lemmaK
#print axioms UpperTheory.V.K.lemmaK
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_with_lemmaK38
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_with_sha38
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_with_bridge38
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_native38
