import Formalism.LocalToGlobal.SiegelLatticeTheory.CokernelGLCounts.RankPointCounts.FStarCut
import Formalism.LocalToGlobal.SiegelLatticeTheory.CokernelGLCounts.RankPointCounts.FStarBetaIF
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN36, lane 14, 25 November 2026. SOURCE-MATCHED replay candidate, not compiled.
Pin: leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mission blob cd0a176134d46b5b624896e56843a24915c14477; SWARM, HANDOFF,
EXPANSION, AGENTS and living proof 464e82f81f646d4af85e1f5f70d379026df46261
consulted. Peer geometry ddc287ea, kernel 3f25eb66, dependency bb971bc3,
Landau 1d03f804, prior lane 904a3009 retained.

CORRECTION TO RUN35 FRONTIER:
The scalar fibre-mass equality need not be supplied as a NEW premise.
The actual cutAt_of_deep caller already supplies densTh_of_ga
(SplitCoefficientComponents.GaPlusTh_holds M δ u u'). Here is the
short human argument for that supplier, not an independent RH proof.

At each place, same-kind corners agree. Equality of the relevant
theta classes yields an isomorphism of shifted matrices; matching
cross minors fixes the distinguished inverse corner. LiftOrb then
gives invertible integral left and right matrices L,P preserving that
corner. In the notation of CrossOfComp.gaPlusTh_of,
Y'=LYP, Y=Z+cEc, Y'=Z'+cEc, L Ec P=Ec. Cancel the shift exactly:
                         Z'=L Z P.
The two local split cases yield a Gram congruence G'=A* G A with
integral A and unit determinant. Density_congruence_holds constructs
the integral inverse y adj(A) and a bijection of primitive tuples
modulo the uniformizer; congruences, primitivity and the normalizing
denominator are preserved. Thus densP(Z')=densP(Z), with the native
same-kind, nonempty-theta and AtMat guards intact. The actual caller
uses this equality and the original mass formula; no estimate on the
density can replace equality at that step. The RUN35 equality is
therefore supplied within the original conditional context; do not
seek an extra raw-mass axiom.

Further upstream, for a FIXED D, FStarCut.cutLeavesDeep_of_betaInt
supplies StepsU from countAt_holds and unimodAt_holds, StabApprox
from stabApprox, and FStarC from fStarC_of_int. Its BetaInt hypothesis
is supplied by the existing FStarBetaIF.betaInt_holds. In betaInt_of,
let X be the target isotropic subspace, L1=beta0(L), L2=target lattice.
Both are self-dual by localization. The frame equality identifies
their intersection with X, and both contain the distinguished z.
LsetB yields equality of their orthogonal restrictions modulo X:
pair with elements of X-perp, cancel the X-difference, use local
self-duality and integrality at every place, then dual_sum globally.
BwdNA.main uses these two directions, the shared X and z, and the
host's integral trace-one element, producing a correcting isometry n
with n(L2)=L1, fixing the frame and acting trivially on X-perp modulo X.
Consequently (n^-1 beta0)(L)=L2 exactly. IotaB supplies the remaining
typed compatibility for this same correcting isometry. PinB supplies
both LsetB and IotaB; do not independently select them or discard IotaB.
This reconstructs the native composition below, not an existence proof
for D or a new estimate for the geometry.

Original source graph (direct source references, NOT elaborated complete):
cutAt_of_deep -> cutAt_of_leaves -> fiberCount_of_rest -> fiberCount_of
cutAt_of_deep -> densTh_of_ga -> density_congruence_holds,GaPlusTh_holds
GaPlusTh_holds -> gaPlusTh_of,LiftOrb_holds -> RF.srLift_holds
cutLeavesDeep_of_betaInt -> countAt_holds,unimodAt_holds,stabApprox,fStarC_of_int
fStarC_of_int -> fStarC_of_beta,betaRat_holds
betaInt_holds -> betaInt_of,lsetB_of,iotaB_of,pinB_holds
lattice_input_of_open_leaves -> rowsInputP_of_deep,Closed.NormProd_holds
TheoremSClosedP.theoremS_closedP consumes hRIA : ∀ D, RowsInputP D.
Proposed replay overlay (no original nodes or edges deleted):
rh36_cutLeavesDeep -> cutLeavesDeep_of_betaInt,betaInt_holds
rh36_rowsInput -> lattice_input_of_open_leaves,rh36_cutLeavesDeep
The exact original upstream caller of cutLeavesDeep_of_betaInt was
not located this run; no claim that this overlay is the native route
or that these bounded scans establish actual root reachability.
Cache keys must include pin, toolchain, declaration, all D/host data,
local place and model, same-kind/class/AtMat guards and instantiated
context. On any elaboration failure backtrack to original source.
All unresolved original and reduced dependencies and axiom obligations
remain; no inferred cancellation across different hosts.

Pinned RankPointCounts source blobs:
FiberCountTh 5a39f65ba4dd9f37d5c136c17a159e74402b52a0
CoefCutDeep 0c363dee7fb1ff22e2a73205eb007141aaf8b6c2
GaPlusThHolds 0ce5c31444b230795df388b140abe46ccd1f9e3d
CrossOfComp d5fd3c8fc62e030e6661ff092b37ac47040014aa
DensCongClose dda2a7969a0c796bb682d38cf4aa08b3e5fac264
CoefDensTh d47fdffa98d15f90c5a8f1627b3ade554dc487bc
FStarCut 339b4bd50b2c4b23a41cf871355aa503a53a2458
FStarBetaIF 34cb2470f9c213d0d290510653f299c71433a833
FStarBetaIB 45013f92c506268c0c40ded39d62064ab0b17452

Executed 16 fail-on-error pinned blob and source-anchor checks. No runtime
or memory benchmark: mathematical source tracing, no acceleration claim.
Local lean/lake unavailable. Earlier status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 are pass for old certificates only.
New peer Landau retry status blob 43a439847e030afb4d5563e30df51399fcbc78d8
is ERROR, returncode 1: RH33DirectLogWindow line 156 unexpected '|*';
do not infer upstream sorryAx from failed candidate. This overlay is
uncompiled, no axiom or root reachability claim. RH remains open.

RESUME HERE: Native compile this fixed-D supplier with exact pinned
imports; audit bounded scans and generated original bridge separately.
Locate native RowsInputP producer on actual theoremS_closedP route.
Give editor the above concise source-derived fibre proof; do not
revisit individual density factors unless kernel replay fails.
Actual same-host VWinAt(1,401), rank/count, entropy and local gain
suppliers remain to be authenticated. Preserve all earlier graphs.
-/

noncomputable section
open NumberField Formalism.BasicNotions Formalism.MainNotions.S
open Formalism.MainNotions.S.Lat Formalism.MainNotions.S.LocalSplitGroups
open Formalism.L2.SG.TermDef Formalism.L2.SG.DataCut Formalism.L2.SG.LsDatumB
open Formalism.L2.SG.Pf.FrameGlobalPatching.FStar
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem rh36_cutLeavesDeep (D : Formalism.BasicNotions.D7) :
    Formalism.L2.SG.Pf.Coef.CutLeavesDeep D := by
  apply cutLeavesDeep_of_betaInt D
  intro δ M hA u u' F0 what₂
  exact betaInt_holds ⟨δ, M, hA⟩ u u' F0 what₂

theorem rh36_rowsInput (D : Formalism.BasicNotions.D7) :
    Formalism.L2.SG.DataCut.RowsInputP D := by
  first
  | (rh_reduce 2 using [Formalism.L2.SG.Pf.Coef.lattice_input_of_open_leaves, rh36_cutLeavesDeep]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact Formalism.L2.SG.Pf.Coef.lattice_input_of_open_leaves (rh36_cutLeavesDeep D)

rh_scan Formalism.L2.SG.Pf.Coef.cutAt_of_deep limit 2000
rh_scan rh36_cutLeavesDeep limit 2000
rh_scan rh36_rowsInput limit 2000
rh_prune rh36_rowsInput as RH36RowsInputPruned
#print axioms Formalism.L2.SG.Pf.Coef.cutAt_of_deep
#print axioms Formalism.L2.SG.Pf.FrameGlobalPatching.FStar.betaInt_holds
#print axioms rh36_cutLeavesDeep
#print axioms rh36_rowsInput
