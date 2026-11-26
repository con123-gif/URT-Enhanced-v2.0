import Formalism.LocalToGlobal.SiegelLatticeTheory.FlagStabilizerTensors.RootLatticeThresholds.DstarVolPf
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.LeftQuotientCovolumeEqFundamentalDomainInter
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN45 | 26 Nov 2026 | SOURCE-MATCHED / HUMAN EXACT IDENTITY /
LEAN PREPARED NOT COMPILED. RH OPEN.

Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first
including mandatory unified engine; AGENTS, SWARM, HANDOFF, EXPANSION,
continuity, state, runner log/protocol, and living proof consulted.
Prior editor 11e35a8b2f3830cda12e686130f20be89365facf.
Latest peer commits surveyed: theta 755b92513374b7971479b3801d0fc0091e82bd47
(split fundamental domain), geometry fac11f418a5e2e369bd411e720f539c1341739af
(cofinal SW normalization, coordinate fibre gap), integration
3463c3014e7b58d883e98448c12bd660f6d221f5 (rank-two CountQ).
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474; no upstream migration.

NEW: the native endpoint bridge already exists, on the actual HidaSetting
used by the row branch. Stop reconstructing separate adelic coordinate,
finite stabilizer, Haar transport and domain maps for this consumer.
DstarVolPf.covol_gen proves the identity with the very same X.B.I,
X.B.μf and X.B.fund. Its proof includes finite nonzero stabilizer mass,
normalization to 1, the measure pushforward to the native VS D group,
the transported fundamental domain, and finite positive quotient mass.
ZsCovMeas.isVolMeas_muV is the general constant-signature rectangle
transport supplying that proof. The native covol_eq_inter_fund is
exact for the actual IsFundDom predicate, not a hypothetical transversal.

Write I=X.B.I, K=μf(I.Kset), F=X.B.fund, C=prod_v c_v (gauge),
S=prod_v D.s.cdScale(2*rS+k+1,epsSH D.R), V=volY0 D.
Take the SAME finite Haar witness in both branches.
For A=univ the native covol theorem gives covol=μA(F).
Definition of gaugeVol and ENNReal.toReal multiplication/division give
  G := (gaugeVol I c μf).toReal = C * I.vol μf F / K.toReal.
The source DstarVolV gives
  V = S * I.vol μf F / K.toReal.
Thus EXACT cross-normalization:
  C * V = S * G.
No new group isomorphism, new choice of Haar or independent rational
quotient premise for this specific endpoint. No rank or field substitution
is implicit. The equality is cross-multiplied before any logarithm/norm.

Let M be the same-host positive mass telescope
massI(D,k)*prod_{j=k+1}^r ratioH(D,j), and B>0 the compact trace-density
volume volU(r)^f AFTER proving the native rank and place count equalities.
The earlier editor human argument from CDHaar.trick, IsOmegaLeb,
OmegaDensity, compact probability and tangent density gives S*B=C.
The theta determinant-torus formula plus definite mass endpoint should
give G=B*M. Keep both premises until checked in these precise coordinates.
The two defects may instead cancel:
  V/M = (G/(B*M)) * (S*B/C).
Hence only the sum of their SIGNED logarithms needs to lie in
[-2Lfk,mfk] (prior RUN44). Separate absolute error bounds are stronger
than necessary. With exact S*B=C the whole signed budget is equivalent
to the gauge endpoint mass budget. This is a genuine source-linked
shortcut to the row consumer, not a proof of the remaining gauge mass
formula or the global prime-window inequality.

Native hypotheses retained: X.B.I=InstExistsPf.instOf D, VolTie D,
cdScaleTie D, IsGaugeAll I c (or positivity of C), and same witnesses.
The compact-dual scale comparison is not the petR_minf convention.
Do not infer signature independence for all D.vol from this one endpoint.
Other uses of SW1b2, VolumeRatio2, VolTie, MassRatioUnderVolume remain.

Original graph:
  row count -> DstarVol -> DstarVolV -> covol_gen -> VolMeasOf
  -> ZsCovMeas.isVolMeas_muV -> native brg / finite & real transport.
  flag count -> gaugeVol -> covol GFset.
  signed family budget -> endpoint mass/telescope.
Reduced candidate:
  same X -> dstarVolV_of + covol_eq_inter_fund -> C*V=S*G
  -> compact relative scale + gauge endpoint mass
  -> signed budget -> RUN44 global source/items adapter.
All original graphs, type/value/constructor/axiom edges and unresolved
VWinAt(1,401), same-host arithmetic and prime obligations retained.
Cache key = source/toolchain, D, X, I equality, μf, fund, c, cd,
VolTie, rank and place correspondence, actual caller. Do not cache by
rank or signature alone. Backtrack to original branch if any bridge fails.

Pinned source ledger (src/):
Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/
 RootLatticeThresholds/DstarVolPf.lean ae7cc5313e20392b9db6cbc8e518be5af1f5be21
 RootLatticeThresholds/RowDictPf.lean 36ba24d4b9003ec478394baf7f659dbe9fb5d2fb
Formalism/LocalToGlobal/SiegelLatticeTheory/CasimirVolumeRatios/
 VolumeClassRepresentatives/ZsCovMeas.lean 82a4d4c42619ad6cb8aa7219d02792d0fe4480c7
Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 LeftQuotientCovolumeEqFundamentalDomainInter.lean 81767f05db5d4d10576659201013df459adde451
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
 2103e49fe83fce42d4962f85acd9d4f6a589d645
Formalism/LocalRingCardinality/DataCD.lean 449d5479b4d8ec9baeaebd3459f95232094ae222

Executed 25 exact source SHA/declaration assertions (six files);
all matched. Local command -v lean/lake absent. Retrieved actual
baseline CI status records 45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717,
both returncode 0. Baseline axioms propext, Classical.choice, Quot.sound;
bounded scan pending=324. Neither run checks this candidate.
No new native execution or axiom closure; zero root obligations retired.
No URT comparison, exact cancellation suffices.

RESUME HERE: stage this certificate with the native engines. Instantiate
S*B=C from DataCD CDHaar.trick in actual X.B.I frames (rank and real place
count must agree); apply theta RUN44 split measure to this SAME gauge
endpoint and identify the definite mass via native class-representative
formula. Prove G=B*M or signed aggregate bound, then apply RUN44 editor
global-source adapter. Do not rebuild ZsCovMeas or DstarVolPf.covol_gen.
HANDOFF: theta, geometry, integration, kernel, audit.
-/

noncomputable section
open MeasureTheory NumberField Formalism.MainNotions.S
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.L2.SG.HidaSetting GlobalTheory.FlagMeas
open scoped ENNReal

namespace RHEditorEndpoint45

theorem same_fund_gauge (I : AutInst) (c : InfinitePlace I.F → ℝ)
    (μf : Measure I.Gf) [SigmaFinite μf] [μf.IsHaarMeasure]
    (fund : Set I.GA) (hf : I.IsFundDom (I.muA μf) fund)
    (hc : 0 ≤ ∏ v, c v) :
    (gaugeVol I c μf).toReal =
      (∏ v, c v) * (I.vol μf fund / (μf I.Kset).toReal) := by
  have h := (GlobalTheory.CovolRat.covol_eq_inter_fund I μf fund
    Set.univ hf MeasurableSet.univ (by intros; trivial)).1
  rw [Set.univ_inter] at h
  unfold gaugeVol
  rw [h, ENNReal.toReal_div, ENNReal.toReal_mul, ENNReal.toReal_ofReal hc]
  unfold AutInst.vol
  ring

theorem native_endpoint_cross {D : D7} (X : HidaSetting D)
    (hI : X.B.I = Formalism.L2.SG.InstExistsPf.instOf D)
    (hVol : VolTie D) (hcd : cdScaleTie D)
    (c : InfinitePlace X.B.I.F → ℝ) (hc : 0 ≤ ∏ v, c v) :
    (∏ v, c v) * volY0 D =
      (∏ _v : InfinitePlace X.B.I.F,
        (D.s.cdScale (2 * D.R.rS + D.R.k + 1) (epsSH D.R) : ℝ)) *
      (gaugeVol X.B.I c X.B.μf).toReal := by
  have hV : Formalism.L2.SG.Pf.RowDictPf.DstarVolV X := by
    first
    | (rh_reduce 2 using [Formalism.L2.SG.Pf.DstarVolPf.dstarVolV_of]; done)
    | (rh_auto_frontier 2; done)
    | (rh_auto 2; done)
    | exact Formalism.L2.SG.Pf.DstarVolPf.dstarVolV_of X hI hVol hcd
  unfold Formalism.L2.SG.Pf.RowDictPf.DstarVolV at hV
  rw [← hV, same_fund_gauge X.B.I c X.B.μf X.B.fund X.B.fund_spec hc]
  ring

theorem endpoint_exact (C S G V B M : ℝ) (hC : C ≠ 0)
    (hcross : C*V=S*G) (hscale : S*B=C) (hmass : G=B*M) :
    V=M := by
  apply mul_left_cancel₀ hC
  calc
    C*V = S*G := hcross
    _ = (S*B)*M := by rw [hmass]; ring
    _ = C*M := by rw [hscale]

theorem endpoint_defect (C S G V B M : ℝ)
    (hC : C ≠ 0) (hB : B ≠ 0) (hM : M ≠ 0)
    (hcross : C*V=S*G) :
    V/M = (G/(B*M))*(S*B/C) := by
  field_simp
  nlinarith [hcross]

theorem signed_endpoint_budget (C S G V B M L U : ℝ)
    (hC : 0 < C) (hS : 0 < S) (hG : 0 < G) (hB : 0 < B)
    (hM : 0 < M) (hcross : C*V=S*G)
    (hlo : L ≤ Real.log (G/(B*M)) + Real.log (S*B/C))
    (hhi : Real.log (G/(B*M)) + Real.log (S*B/C) ≤ U) :
    L ≤ Real.log (V/M) ∧ Real.log (V/M) ≤ U := by
  rw [endpoint_defect C S G V B M hC.ne' hB.ne' hM.ne' hcross,
      Real.log_mul (div_ne_zero hG.ne' (mul_ne_zero hB.ne' hM.ne'))
        (div_ne_zero (mul_ne_zero hS.ne' hB.ne') hC.ne')]
  exact ⟨hlo,hhi⟩

end RHEditorEndpoint45

rh_scan Formalism.L2.SG.Pf.DstarVolPf.dstarVolV_of limit 2000
rh_scan GlobalTheory.CovolRat.covol_eq_inter_fund limit 2000
rh_scan RHEditorEndpoint45.native_endpoint_cross limit 2000
rh_prune RHEditorEndpoint45.native_endpoint_cross as RHEditorEndpoint45Pruned
#print axioms RHEditorEndpoint45.same_fund_gauge
#print axioms RHEditorEndpoint45.native_endpoint_cross
#print axioms RHEditorEndpoint45.signed_endpoint_budget
