import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatioOfUnfolding
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsSelfDualLatticeCompletionMaxOrderStatement
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN41, 2026-11-25. SOURCE-MATCHED DERIVATION; PREPARED LEAN,
NOT EXECUTED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first, including
mandatory unified reduction. SWARM, HANDOFF, EXPANSION, AGENTS and
living proof consulted. Prior lane a5db7249. Latest geometry
RUN41_TWO_ENDPOINT_TAMAGAWA_COUNT blob 1484f176668fff83c4e991c7d1db3dfdd2306800,
RUN40_TRACE_DENSITY_REGULARIZED_CALIBRATION blob 63405676f1b463b4954a1d8d1fc1e295179f7d15,
integration shared Sha and kernel adjacent torsion budget reviewed.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

NEW: for the actual D7, HSpace W in the two-endpoint volume reduction,
do not introduce a new AutInst or independently reconstruct integral
lattice comparison. The native ratio_of_setting already obtains the
local self-dual maxOrder lattice Lv, with membership exactly latLoc.
The native frameLat is the pullback of W.L0 under W.frame, and L0c D W
is exactly its carrier. The finite-generation proof of mem_latHat_iff
assembles one common finite generating family into integral adeles.
The native levelOpen stabilizer equivalence uses singleFin-supported
vectors for its converse, so neither density nor strong approximation
nor an additional independent local-global witness is required.

Consequently, for L=frameLat W and K(W) the finite stabilizer condition
in IsVolMeas D W, one has
  g in K(W) iff for every finite v, g_v in Stab(L_v).
This is a set/membership identity inside the existing adelic coordinates.
The local lattices L_v are self-dual over maxOrder, not arbitrary lattices.
For a standard coordinate lattice, mem_latLoc_stdLattice combined with
mem_maxOrder_iff_mem_intLoc gives membership in maxOrder^n exactly.
No comparison with an unrelated host or rank is used. Apply the same
construction separately to the two actual endpoint spaces of RUN41 geometry.

Proof detail: if a global g preserves the completed lattice, insert any
local z supported at v. All other coordinates are zero and remain zero
under matrix multiplication. The global membership equivalence then
implies the local membership equivalence. The reverse follows by
coordinatewise application and mem_latHat_iff. No estimate is involved.
The proof uses membership rather than treating finprod=1 as a converse
without support control: the native indicator product proof explicitly
establishes eventually_vecLoc_mem_latLoc first. Without finite support
one cannot use finprod_eq_zero merely from a zero factor.

Native source ledger (relative to src/Development/AbelianVarietyTheory):
Definitions/Foundations/HermitianSpaceBaseLatticeEqFrameLattice.lean
 b59d93f552f6303050b75bb24f0c28d027efbc3e
 mem_latHat_iff, mem_levelOpen_iff_latHat, mem_levelOpen, mem_stabLoc,
 frameLat_fg, hermitianSpaceBaseLattice_eq_frameLattice, mem_latLoc_stdLattice.
Proofs/FlagMeasures/ExistsSelfDualLatticeCompletionMaxOrderStatement.lean
 0ba5ddd5d1373203afc2e9175467432f55bd77e3
Proofs/FlagMeasures/ExistsSelfDualLatticeCompletionMaxOrder.lean
 c85c442162055221094b4086ad1448ab1d941cc6
 mem_maxOrder_iff_mem_intLoc; exists_isSelfDualLattice.
Proofs/GlobalInterpolation/VolumeRatioOfUnfolding.lean
 bf534d0467940a3315375b49ab216a548170c422
 ratio_of_setting uses exactly hJ, hlat, hsd and
 exists_selfDualLattice_completion_maxOrder ... hJ hlat hsd v.
Proofs/FlagMeasures/IndicatorCompletedLatticeEqFinprodLocal.lean
 e289f9861a9bc26d68ff25c87b420163b087454a
 indicator proof with eventual membership.
24 actual source hash/anchor checks: 24 matched, zero failures.
No native lean/lake executable on PATH. Prior CI baseline status files
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717 retrieved:
runs 45577239749 and 45576756833 pass, returncode 0.
They verify engine/conditional root baseline, NOT this certificate.
The baseline conditional root axioms propext, Classical.choice,
Quot.sound remain distinct from this adapter's unexecuted axiom audit.
No new native PASS, no retired root obligation, no RH import.

Original graph retained: ratio_of_setting -> hJ, hlat, hsd -> Lv;
native unfolding and all its consumers retained. Geometry RUN41
alternative: actual endpoint measure -> lattice/stabilizer transport
+ real CD density + restricted product group/Haar comparison +
Tamagawa + rank-k mass -> aggregate anchor -> count.
Candidate reduced graph: lattice/stabilizer transport membership
is supplied by existing frameLat, mem_latHat_iff, mem_levelOpen_iff_latHat,
exists_selfDualLattice_completion_maxOrder. Do not conflate membership
with a topological product-group isomorphism or Haar product equality.
Still open: exact native restricted product topology/measure comparison
for both endpoints, local smooth integral unitary model and density,
real CD/trace measure equality, global Tamagawa normalization, mass
and count propagation, joint same-host arithmetic/Sha/TopG/VWin,
decisive weighted prime-window bound. Original root frontier retained.
Cache key: pin,D,W,frame,Gram,L,v,local model,normalization,consumer.
On replay failure backtrack to original endpoint transport premises.
No URT comparison performed; exact identities suffice locally.

RESUME HERE: use these native coordinate lemmas at the two-endpoint
Tamagawa rectangle, not another independent lattice comparison.
Replay in pinned environment; apply rh_scan/rh_prune and
rh_reduce/rh_auto/rh_auto_frontier to actual adapter goals,
audit axioms and compare original/reduced dependencies. Next resolve
the real CD normalization and finite restricted-product Haar equality,
then propagate endpoint formula into the actual geometry count.
HANDOFF TO geometry, theta, kernel extractor, integration and audit.
-/

noncomputable section
open NumberField IsDedekindDomain MeasureTheory Matrix Formalism.BasicNotions
open Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open GlobalTheory.IndefiniteRowSideFullHecke
open GlobalTheory.IndefiniteRowSideFullHecke.SelfDualUnramifiedPlaces
open GlobalTheory.AdelicU
open Formalism.UG
open scoped ENNReal TensorProduct
attribute [local instance] Formalism.BasicNotions.Host.cmStar

namespace RHEditorEndpoint41

theorem native_endpoint_model (D : D7) (W : HSpace D.host.E) :
    ∃ Lv : ∀ v : HeightOneSpectrum (𝓞 D.host.F),
      Submodule (maxOrder D.host.F D.host.E v)
        (Fin W.rank → Fv D.host.F v ⊗[D.host.F] D.host.E),
      (∀ v, IsSelfDualLattice D.sp.cm.sig W.gram v (Lv v)) ∧
      (∀ y : Fin W.rank → Af D.host.F ⊗[D.host.F] D.host.E,
        y ∈ latHat D.host.F D.host.E (L0c D W) ↔
          ∀ v, vecLoc v y ∈ Lv v) := by
  classical
  have hJ := GlobalTheory.Mem.VolExists.isHermND D.sp.cm W
  have hlat := GlobalTheory.AdelicU.SelfDual.isLattice_frameLat W
  have hsd := (GlobalTheory.AdelicU.SelfDual.forall_isSelfDualAt_iff hJ.2 hlat).1
    (GlobalTheory.AdelicU.SelfDual.isSelfDualAt_frameLat_of_cm D.sp.cm W)
  choose Lv hLv hmem using
    (GlobalTheory.T.exists_selfDualLattice_completion_maxOrder _ _ _ _ _ _ hJ hlat hsd)
  refine ⟨Lv, hLv, fun y => ?_⟩
  rw [GlobalTheory.AdelicU.hermitianSpaceBaseLattice_eq_frameLattice,
    GlobalTheory.AdelicU.mem_latHat_iff hlat.fg]
  exact forall_congr' fun v => (hmem v (vecLoc v y)).symm

theorem endpoint_stab (D : D7) (W : HSpace D.host.E)
    (g : GAd D.sp.cm.sig W.gram) :
    (∀ y, y ∈ latHat D.host.F D.host.E (L0c D W) ↔
      (finMat D.sp.cm.sig W.gram g).mulVec y ∈
        latHat D.host.F D.host.E (L0c D W)) ↔
    ∀ v, proj D.sp.cm.sig W.gram v g ∈
      stabLoc D.sp.cm.sig W.gram (frameLat W) v := by
  rw [GlobalTheory.AdelicU.hermitianSpaceBaseLattice_eq_frameLattice,
    ← GlobalTheory.AdelicU.mem_levelOpen_iff_latHat _ _ (frameLat_fg W) g,
    GlobalTheory.AdelicU.mem_levelOpen]

theorem standard_coordinate {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] {n : ℕ}
    (v : HeightOneSpectrum (𝓞 F)) (y : Fin n → Fv F v ⊗[F] E) :
    y ∈ latLoc F (stdLattice E n) v ↔ ∀ i, y i ∈ maxOrder F E v := by
  rw [mem_latLoc_stdLattice]
  exact forall_congr' fun i =>
    (GlobalTheory.CompletedSelfDual.mem_maxOrder_iff_mem_intLoc v (y i)).symm

end RHEditorEndpoint41

rh_scan GlobalTheory.VolRatioUnfold.ratio_of_setting limit 2000
rh_scan RHEditorEndpoint41.native_endpoint_model limit 2000
rh_scan RHEditorEndpoint41.endpoint_stab limit 2000
rh_prune RHEditorEndpoint41.endpoint_stab as RHEditorEndpoint41.StabPruned
#print axioms RHEditorEndpoint41.native_endpoint_model
#print axioms RHEditorEndpoint41.endpoint_stab
#print axioms RHEditorEndpoint41.standard_coordinate
