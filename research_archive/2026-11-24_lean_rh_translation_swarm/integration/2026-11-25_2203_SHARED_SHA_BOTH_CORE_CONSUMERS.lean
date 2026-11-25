import RHSharedShaActualVWin40
import RHCountVsDirectSha39
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration RUN41, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
RH OPEN. One result: combine the two direct-Sha reductions at the actual
VWin consumer. The entire of_four_alt core can now accept the same ShaK
packet instead of LemmaK; keep LemmaK at its sibling count producers.

Mission current f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine, SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d,
state, protocol, continuity and summary consulted. Latest 35 commits
surveyed; previous integration 2785c414 and peers 33888226, 94eea89e,
9530ff09, a5db7249, 3e19ae4d, 51bb79cc, 1c042f1c, 3408a84d,
5a05ee9c, c7e8eb61, 30a2c2d9, 4fd3152d, abca5bf7, 46e9230b
consulted (diffs or resume extracts). Literature's alternative KBridge
is not imported or substituted here.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native source ledger (relative to AutomorphicVarieties):
HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
Peer modules:
integration/2026-11-25_2100_SHARED_SHA_ACTUAL_VWIN.lean
  2e073cfcd45bb9b21162782749515f842434d479 (2785c414)
specialists/on_acceleration/RUN39_COUNTVS_DIRECT_SHA.lean
  9d2004efcd740c3ec6b0d8b1485887e561374e1a (33888226)
Both are prepared, not native-verified in this run.

Mathematics: the tower anchor needs Sha at its descended field;
CountVs at its actual vsField L and weight 1 needs
  V <= shaLen(D,1)*eO + card(T)*h0.
In both, the same uniform ShaK packet gives
  s log(l) <= kBound(C,e,n,disc),  shaInv = s < infinity.
Since log(l)>=1/2 this gives the required length bound at the
same fields, with no H2 detour. The two fields need not be equal:
the SAME universal bound covers both instantiations. Do not identify
their contexts or suppose their lengths are equal. No independent
existential constant is selected per prime or weight.

Selected source graph BEFORE:
 VWin -> hK=SFinal(SNum(BOdd,...)), hE,h4,CountI,CountV,core.
 core -> thmBab_of_lemmaK(hK), vwin_of_counts(hK), CountZ, Odd.
 vwin_of_counts -> pointHV_of_counts -> CountVs -> shaLeV,klen.
AFTER (candidate):
 VWin -> hSha=SNum(BOdd,...), hK=SFinal(hSha), hE,h4,CountI,CountV.
 core_sha41(hSha, four counts, hN) -> direct anchor(hSha),
   vwin_of_counts_sha39(hSha) -> CountVs_of_sha39 -> shaOne39,
   CountZ, Odd.
No direct LemmaK binder remains in core_sha41; hK survives at all
three sibling count suppliers (joint II/III, I, V). PT also survives
at Odd/CountIV. Neither SFinal nor H2 is globally retired. Retain
all original/reduced graphs, type/value/constructor/axiom evidence,
and every unresolved supplier. The same VWin conclusion, 401,
CountZ, CountIV, FW, hH and original sibling expressions are intact.
Window_native_sha41 has the exact original statement, conditional
on successful replay of the prepared components. Cache by pin,
toolchain, exact hH,hN,hSha,hK, prime/weight/field/coefficients and
role. Backtrack to RUN40 or native original if replay fails.

Executed 21 fail-on-error connector JS checks:
blob f4b900eb48df14f16eea03d08b7d9ef077f3d4a1; blob 01c499108485b16d33791a9e46fbb1e2af865522; blob 2f86e49421d870aa158af11ad1388da80b5d70d1; blob 3b29717c74e14806d898cbbf9f96417396a2d37d; blob 2e073cfcd45bb9b21162782749515f842434d479; blob 9d2004efcd740c3ec6b0d8b1485887e561374e1a; native two consumers; native CountVs consumer; native Sha->VLen; peer direct count; removed core LemmaK binder and extraction; preserved tower witness; preserved downstream count inputs; same hSha twice; PT remains for CountIV; actual sibling hK retained; native same hypothesis original statement; original hE and h4 exact; native original caller exact sibling expression; unchanged native 401; no forbidden root import.
These are static source/transform checks, not kernel verification.
Local lean and lake absent. Actual CI runs 45577239749, 45576756833,
45670987597 fetched; all jobs completed/success (baseline engine
and conditional analytic endpoint only). New overlay NOT COMPILED,
not queued in this run; no new axiom results. No URT claim.

RESUME HERE: replay RHDirectShaAnchor38, then the RUN40 file as
RHSharedShaActualVWin40, and RUN39 CountVs file as RHCountVsDirectSha39,
then this overlay in one warmed pinned runner. Check original and
replacement at the actual caller, with the role-aware graph and
axiom audit; keep original fallback. Next prioritize the native SNum
uniform bound and actual h4/CountI/CountV sibling consumers, not
another downstream reformulation. In particular check the peer
SFinal local ramification budget and direct tame cancellation in
their exact contexts. TopG/ASK joint loss remains open.
HANDOFF TO kernel, audit, editor, Galois, character boxes, acceleration.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.V.HV.Core
open UpperTheory.V.Lit UpperTheory.V.W

theorem core_sha41
    (hN : _root_.GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis)
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C)
    (h1 : CountI) (h2 : CountII) (h3 : CountIII) (h5 : CountV) : VWin := by
  obtain ⟨B, hB⟩ := Win.anchorThmBab_of_sha38 FW.ferreroWashington hSha
  exact _root_.UpperTheory.V.HV.vwin_of_counts_sha39 hSha (hB 401 (by norm_num))
    (Odd.thmBcFree_of (ML.iv (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.uo)) h1 h2 h3 h5 (countZ X.propZ)

end UpperTheory.V.HV.Core

namespace UpperTheory.V.HV.DescentVanishingReductions

theorem window_sha41 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) : VWin :=
  have hK := _root_.UpperTheory.V.ZK.sFinal (_root_.UpperTheory.V.HV.U.pt_s hH.litN) hH.litN.coh.lfK hH.litN.coh.ltK hSha
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.core_sha41 hH.litN hSha (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem window_native_sha41 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_sha41 hH
  first
  | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd40, _root_.UpperTheory.V.ZK.bOdd]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact _root_.UpperTheory.V.ZK.sha_of_bOdd40 _root_.UpperTheory.V.ZK.bOdd

end UpperTheory.V.HV.DescentVanishingReductions

rh_prune UpperTheory.V.HV.Core.core_sha41 as UpperTheory.V.HV.Core.CoreShaPruned41
rh_scan UpperTheory.V.HV.Core.of_four_alt limit 2000
rh_scan UpperTheory.V.HV.Core.core_sha41 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_native_sha41 limit 2000
#print axioms UpperTheory.V.HV.Core.core_sha41
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_sha41
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_native_sha41
