import RHCountVActual42
import RHDirectAllCharacterCountI40
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Integration RUN43 — 25 November 2026. SOURCE-MATCHED / PREPARED,
NOT COMPILED. RH OPEN.

One result: at the actual VWin arithmetic assembly, share one
NumberU3U_s supplier for CountI and CountV, and substitute Galois
RUN40's padded all-character CountI directly, retaining the exact
native OneCharU_s supplier and every CountV premise from RUN42.
No independently selected trace catalogue, field or character witness.
The slot count is phi(N)<=N; uniqueness is within each slot, not across
slots; the two-prime valuations and their uniform quantifiers are retained
inside the imported RUN40 certificate. No new mathematical assumption.
CountII/III and tower/CountVs still require their quantitative bounds.
This is a local consumer substitution, not closure of either count.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including
mandatory pipeline; SWARM, HANDOFF, AGENTS and state consulted.
Native LinkedUnlE.lean blob 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e, actual
count_i_of_printed_bound_k_kato_automorphy. CohInp.lean
a5da0b85c6b7f82e88131ff19cfe732e1f912af1 retains hK.
FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91;
KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7;
VwinOfRow.lean 4cba179acd45ac08d3cad21f51c9b9d62715a9a4;
TopMainZj.lean 23b7a05606074da30e6f8eb3b3821e877a968d3e.
RUN42 integration blob f0f331451dd3dc956062bcdd3042d8d2da715bf1, commit 700e3969.
Galois RUN40 blob 9dc0f269712146f5741c3b30fb352a27fafc25a3, commit 51654a1e.
Galois RUN41 catalogue blob 0aac9daf23f7d11bd49a097869a748d0e9f3c366, commit 3b2b21cf:
number_of_catalogue41 can eventually supply this same hNum, but not
imported here; do not combine uncompiled changes until separately tested.
Latest peer commit metadata surveyed: c9fdbd77,706da3bb,4ec1ff21,
778190b4,13df4d53,ce4b2b8f,7f95819c,3b2b21cf,20450987,
fc0d0ec6,c8cb579a,5adee016,a824904c,619e11df,efa4abe2.
Read substantive peer certificates RUN40/RUN41 Galois, literature
weight-one Hurewicz and previous CountV; other peer metadata only.

Original selected graph:
 VWin -> countI -> U3.countI -> corGK -> propGK -> Num,One;
 VWin -> CountV -> hostNumberUE_alt -> Num;
 VWin -> hK -> CountI, joint II/III;
 VWin -> hSha -> core_sha41; CountV -> hSF via RUN42.
Candidate selected graph:
 window_shared43 -> countI_shared43 -> RHGalois40.direct_countI
   -> hNum, native OneCharU_s;
 window_shared43 -> countV_shared43 -> hostNumberUE_alt -> SAME hNum;
 window_native_shared43 -> numberU3U_of_prints (hH.toClassicalTheorems).
 All unchanged siblings retained. Both hNum applications are to the
 exact same hypothesis object. Original corGK/propGK remain fallback and
 other consumers not deleted. Source-visible edges only; transitive
 type/value/constructor and axiom ledgers unchanged pending native scan.
 Cache key: source/toolchain, exact hH/hSha/hSF/hK/hNum, host,
 coefficient/character/prime/place, catalogue and caller role.
 
Executed 25 fail-on-error source checks (hash, unique replacements,
retained siblings and same supplier). Local lean/lake not installed.
GitHub Actions jobs for 45577239749, 45576756833 and 45670987597
actually retrieved: pick/run/record completed success in each.
Those are baseline and conditional analytical endpoint only, not this
certificate. No new kernel pass, new axiom evidence or global deletion.
Original and reduced selected graphs preserved above and previous files.

RESUME HERE: replay RUN40 as RHDirectAllCharacterCountI40 and RUN42
as RHCountVActual42 (with its existing imports), then this file.
Check original CountI/CountV statements, actual VWin caller, typed
scan, original bridge and axioms. Backtrack to RUN42 if it fails.
Then verify Galois RUN41 number_of_catalogue41 independently and
substitute its output for hNum only after verification. The decisive
remaining work is the uniform trace catalogue/OneChar length and
joint II/III plus same-host geometric J; do not mistake sharing a
proof witness for proving it. HANDOFF TO kernel, audit, editor, Galois.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

section
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.V.Z.J
open UpperTheory.V.HV UpperTheory.V.Lit UpperTheory.V.W UpperTheory.V.J

theorem countI_shared43 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hKa : _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW) (h3 : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt) (hNum : _root_.UpperTheory.V.Z.J.NumberU3U_s) : CountI :=
  have hC := _root_.UpperTheory.V.HV.Core0.cohInp_alt hH.litN hK
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  RHGalois40.direct_countI hNum
    (_root_.UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy hC Alg.M.main_holds Alg.M.mprime_holds Alg.lemmaP hKa (_root_.UpperTheory.V.Z.J.rigIUE_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE)
      (_root_.UpperTheory.V.Z.Win.RR.rigII_a_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH)) (_root_.UpperTheory.V.Z.J.admissible_typeI_even_level_alt hC hH hE) h3)

theorem countV_shared43 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hSF : RHShaFinite40) (hS : _root_.UpperTheory.V.Aut.ThmS6Core_s) (hNum : _root_.UpperTheory.V.Z.J.NumberU3U_s) : CountV := by
  have hN := hH.litN
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  exact _root_.UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host (_root_.UpperTheory.V.UnitaryThreeInertia.unitary_lift_of_reduced_core hS) Alg.M.main_holds Alg.M.mprime_holds hN.coh.lf hN.coh.lt hN.coh.le
    hN.coh.gf hN.coh.ge hN.coh.pt (X.So.hostVanE42 hSF hN.coh.lf hN.coh.lt hN.coh.le)
    (X.xpp (X.corX X.lemmaX X.residual_bernoulli_nonvanishing)) (_root_.UpperTheory.V.Z.J.hostRigidUE_alt hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE) (_root_.UpperTheory.V.Z.J.hostNumberUE_alt hH hE hNum)

end UpperTheory.V.Z.J
end

namespace UpperTheory.V.HV.DescentVanishingReductions
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy

theorem window_shared43 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hSha : ∃ C : ℝ, _root_.UpperTheory.V.ZK.ShaK C) (hSF : RHShaFinite40) (hNum : _root_.UpperTheory.V.Z.J.NumberU3U_s) : VWin :=
  have hK := _root_.UpperTheory.V.ZK.sFinal (_root_.UpperTheory.V.HV.U.pt_s hH.litN) hH.litN.coh.lfK hH.litN.coh.ltK hSha
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.core_sha41 hH.litN hSha (_root_.UpperTheory.V.Z.J.countI_shared43 hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1) hNum) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.countV_shared43 hH hSF hE.2 hNum)

theorem window_native_shared43 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin := by
  apply window_shared43 hH
  · first
    | (rh_reduce 2 using [_root_.UpperTheory.V.ZK.sha_of_bOdd40, _root_.UpperTheory.V.ZK.bOdd]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact _root_.UpperTheory.V.ZK.sha_of_bOdd40 _root_.UpperTheory.V.ZK.bOdd
  · exact shaLenFinite42_native
  · exact _root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints hH.toClassicalTheorems

end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy limit 2000
rh_scan UpperTheory.V.Z.J.countI_shared43 limit 2000
rh_scan UpperTheory.V.Z.J.countV_shared43 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_native_shared43 limit 2000
rh_prune UpperTheory.V.HV.DescentVanishingReductions.window_shared43
#print axioms UpperTheory.V.Z.J.countI_shared43
#print axioms UpperTheory.V.Z.J.countV_shared43
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_native_shared43
