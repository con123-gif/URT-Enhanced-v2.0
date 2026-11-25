import RUN36_CANONICAL_GAUGE_RANK
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.ExistsFiniteAdeleBaseChangeEquiv
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.IsClosedEmbeddingOfCongruenceSubgroupsConj
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 8 RUN37, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
RH OPEN. Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read including
mandatory engine; AGENTS, SWARM, HANDOFF, EXPANSION, continuity, state/log/
protocol openings and living proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc
consulted. Latest 25 commits surveyed, especially editor c0c7d3f7, geometry
3232ac0e, Landau a9dc2a6f and integration 678de808. Prior theta 410fcbc2.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Upstream HEAD separately
observed 98d36aafeeb30c1f40fdda96c3574faa34dfa413, no mixing revisions.

NEW: the finite-adelic restricted-product dictionary on the canonical
diagonal AutInst is supplied by native ring base-change plus an elementary
coordinate lattice identity. It need not be obtained from an isomorphism
between DIFFERENT real signatures or from a new global lattice theorem.

Fix I=canonical36 H p q, n=p+q. Let A=E tensor_F Af(F), S=IntAf(F,E).
By ofSigns/ofFrames, L=O_E^n, P_v=1, and the finite topology is defined
by the congruence basis. From lamAf and mem_intLat, Lf=S^n: each generator
has all coordinates in S by inclE_int_mem; conversely the n standard
coordinate vectors belong to L, so their images span S^n. This is a
human exact equality, not an approximation or finite sample. The Lean
candidate below addresses precisely this lattice equality.

The actual source theorem GlobalTheory.AdeleBaseChange.exists_finiteAdele_baseChange_equiv
constructs a ring equivalence rho:A -> Af(E), with rational embedding
compatibility and integral equivalence y in RInt iff all P-adic valuations
of rho(y) <=1. Here RInt is the same tensor integral subring as IntAf.
The theorem proof chooses the explicit map exists_toAd, with
 rho(e tensor a)=diag(e)*adMap(F,E)(a).
For the nontrivial CM involution, the natural action on Af(E) permutes
places P over the same F-place and uses the completion extension of
sigma on each factor. The local embedding locMap(F,P) of F_v is fixed
under this transport: equality holds on dense F and both maps are
continuous. Consequently adMap(a) is fixed. The displayed pure tensor
formula then proves rho(sigR(sigma)y)=sigma(rho(y)) by tensor induction.
This is the required equivariance of the SPECIFIC ring equivalence,
not a claim about an arbitrary ring equivalence given only the first
two conjuncts of its statement. Native existence proof plus ordinary
completion argument; the latter not formalized here.

Apply rho entrywise to a unitary matrix and its inverse. The matrix
unitary equation and inverse equations are preserved and reflected;
the inverse ring equivalence gives the converse. Regrouping the E-places
over each F-place gives the usual restricted product U(J)(Af(F)).
Both directions preserve almost-everywhere integral entries of the
matrix AND inverse, because the ring is a restricted product.
For the diagonal form J with entries +/-1, the inverse is
J^(-1) g^* J, so integrality of g already implies integrality of its
inverse. Thus the native Kset is exactly the product of the usual
integral stabilizers, including all dyadic factors. No smooth model
or Haar measure conclusion follows from this identity alone.

For each integer N>=1, using the SAME integral lattice,
  g in Kg(N) iff g in Kset and for every i,j,
                         rho(g_ij-delta_ij) in N * intAd(E).
Indeed apply the congruence condition to standard vectors for the
forward direction; multiply the columns by arbitrary integral
coefficients and sum for the reverse. In the restricted product
this is precisely the product of local congruence kernels modulo N,
with the full integral stabilizer at every place not dividing N.
These sets are open, and cofinal at the identity: for any finite
set of local neighborhoods choose sufficiently high powers of the
underlying rational primes in N; at all other places remain in the
integral stabilizer. Thus the native topology and restricted-product
topology agree via rho, because both are group topologies with this
identity basis. The explicit native nhds_one_hasBasis_Kg supplies
the first basis. This bypasses any need for a further topological
comparison axiom on the canonical host. The argument does NOT use
a finite/archimedean comparison between forms of different signatures.

At infinity choose exactly the embeddings embOver from ofSigns; P_v=1.
The complexification at each real F-place is C, and the native real
factor is the ordinary U(J_v). GFset is exactly the image of U(J)(F)
under these archimedean embeddings and rho: forward by the witness
gamma in the source definition, reverse using the same gamma and
injectivity of the matrix coordinate maps. No change of rational
subgroup or independent host is permitted.

For quotient transport use native GaugeTransport.covol_map (lines
116-137) and covol_smul (139-142), not a fresh infimum-invariance
proof. The native exact-cover covol still needs comparison with the
standard quotient Haar measure; editor c0c7d3f7 gives the human
transversal proof, subject to its countability/discreteness and
measurability hypotheses. The finite dictionary above provides the
same-host rational subgroup and lattice needed there. It does not
by itself prove the global Tamagawa formula or its regularization.

Actual consumer: RUN36 CanonicalRank36 -> rankOnly_of_canonical36 ->
countingTheorem_of_rankOnly35 -> CountingTheorem; retain all native
VolumeStep fallback and other consumers. Editor's scalar recurrence
uses this same dictionary; after the remaining global trace-density
Tamagawa normalization and local mass evaluation are authenticated,
C36(I,p,q)=C36(I,p-1,q)*rankFac(I.E,p+q) follows with no independent
finite topology matching assumption. No new mass equality claimed.

Original source-visible graph retained:
CanonicalRank36 -> all canonical rank values -> gaugeVol -> covol,
AutInst.muA, Kset, GFset; native VolumeStep unchanged.
Reduced candidate supplier graph:
canonical36 -> ofSignature -> ofSigns/ofFrames -> intLat -> lamAf
-> coordinate lemma; rho from exists_finiteAdele_baseChange_equiv
+ pure-tensor sigma compatibility -> local K/Kg and rational embedding
-> topology via nhds_one_hasBasis_Kg -> covol_map and covol_smul.
Remaining: native replay of these bridges, global quotient normalization,
trace density / Tamagawa regularization and exact rank multiplier,
plus ALL other VWinAt(1,401) and RH-window obligations. No elaborated
dependency edge deleted or new axiom discharge claimed. Cache by exact
source/toolchain, F,E, CM involution, n,p,q, integral lattice,
chosen rho, embedding, normalization and actual consumer. Backtrack
to VolumeStep and original native measure routes if any identification
fails. No URT comparison: this is exact ordinary algebra/topology.

Pinned source ledger (src/):
Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean 2103e49fe83fce42d4962f85acd9d4f6a589d645 (26, 61-112)
Development/AbelianVarietyTheory/Proofs/FlagMeasures/ExistsFrameOfHasSignature.lean 13982fe910bfc0dec0938e4ed6cdb20e01ad3821 (279-299,315-382)
Development/AbelianVarietyTheory/Proofs/FlagMeasures/InclEIntMem.lean 859e7e35a612792217e926523f6ccd2e3c1ffc81
Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsFiniteAdeleBaseChangeEquiv.lean 7452a948191f52df06f6501ac70ae5e69935bc72 (locMap, adMap, exists_toAd,331-345)
Development/AbelianVarietyTheory/Proofs/FlagMeasures/IsClosedEmbeddingOfCongruenceSubgroupsConj.lean aa26856526a20099bdf53ce29137963b0d2637da
Development/AbelianVarietyTheory/Proofs/FlagMeasures/FiniteAdelicUnitaryCongruenceTopology.lean 3b4a5f88d4e95e9acdb5006b5aa23f88c3ec45ba
Development/AbelianVarietyTheory/Proofs/FlagMeasures/GaugeVolumeEqOfSemilinearIsometryGenus.lean d8e911ba588e91954a6b50bf044fd455e8715376
Development/AbelianVarietyTheory/Definitions/SemilocalFrames/DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810
All eight pinned blobs retrieved and their relevant declaration texts
inspected in this run. No synthetic matrix test asserted. Lean and Lake
not found in local container. Baseline CI status.json fetched:
45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc returncode 0;
45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0.
Neither verifies this new certificate. No new native CI run or queue
submission, zero new formally closed root obligations.

RESUME HERE: replay the coordinate identity, then formalize the explicit
rho equivariance and Kg neighborhood-basis bridge with the native
baseChange theorem (use its actual construction, not arbitrary rho).
Use the native covol_map at this same canonical host and complete the
global Haar/Tamagawa normalization with editor/geometry, not another
downstream inequality rewrite. Batch RUN34-37 in existing pinned
runner; inspect compiler output, original bridge, axioms and constructor
roles. Keep all open graph leaves. HANDOFF TO geometry, literature,
kernel extractor, editor, integration, audit.
-/

noncomputable section
open Classical NumberField Matrix Finset
open Formalism.MainNotions.S Formalism.UG
open scoped TensorProduct

namespace RHTheta37

variable {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]
variable {n : ℕ}

theorem coordinate_lattice (x : Fin n → E ⊗[F] Af F) :
    x ∈ lamAf (F := F) (GlobalTheory.AutInhab.intLat E n) ↔
      ∀ i, x i ∈ IntAf F E := by
  constructor
  · intro hx
    unfold lamAf at hx
    induction hx using Submodule.span_induction with
    | mem y hy =>
      rcases hy with ⟨⟨z, hz⟩, rfl⟩
      intro i
      obtain ⟨a, ha⟩ := (GlobalTheory.AutInhab.mem_intLat z).1 hz i
      rw [← ha]
      exact GlobalTheory.VectorInclusion.inclE_int_mem (F := F) a
    | zero => intro i; exact zero_mem _
    | add a b _ _ ha hb => intro i; exact add_mem (ha i) (hb i)
    | smul c a _ ha => intro i; exact mul_mem c.2 (ha i)
  · intro hx
    have hb (i : Fin n) : Pi.single i (1 : E ⊗[F] Af F) ∈
        lamAf (F := F) (GlobalTheory.AutInhab.intLat E n) := by
      have hz : Pi.single i (1 : E) ∈ GlobalTheory.AutInhab.intLat E n := by
        apply (GlobalTheory.AutInhab.mem_intLat _).2
        intro j
        by_cases h : j = i
        · subst j; simpa using (one_mem ((algebraMap (𝓞 E) E).range))
        · simpa [Pi.single_apply, h] using (zero_mem ((algebraMap (𝓞 E) E).range))
      apply Submodule.subset_span
      refine ⟨⟨Pi.single i (1 : E), hz⟩, ?_⟩
      funext j
      by_cases h : j = i
      · subst j; simp
      · simp [Pi.single_apply, h]
    have hs (i : Fin n) : Pi.single i (x i) ∈
        lamAf (F := F) (GlobalTheory.AutInhab.intLat E n) := by
      have h := Submodule.smul_mem _ (⟨x i, hx i⟩ : IntAf F E) (hb i)
      have he : (⟨x i, hx i⟩ : IntAf F E) •
          Pi.single i (1 : E ⊗[F] Af F) = Pi.single i (x i) := by
        funext j
        by_cases hji : j = i
        · subst j; simp [Subring.smul_def]
        · simp [Pi.single_apply, hji, Subring.smul_def]
      rwa [he] at h
    have he : (∑ i : Fin n, Pi.single i (x i)) = x := by
      funext j
      simp [Finset.sum_apply, Pi.single_apply]
    rw [← he]
    exact Submodule.sum_mem _ fun i _ => hs i

theorem canonical_coordinate (H : AutInst) (p q : ℕ)
    (x : Fin (p+q) → H.E ⊗[H.F] Af H.F) :
    x ∈ (GlobalTheory.FlagMeas.VolRatio.canonical36 H p q).Lf ↔
      ∀ i, x i ∈ IntAf H.F H.E := by
  first
  | (rh_reduce 2 using [coordinate_lattice]; done)
  | (rh_auto 2; done)
  | exact coordinate_lattice x

end RHTheta37

rh_scan GlobalTheory.AdeleBaseChange.exists_finiteAdele_baseChange_equiv limit 2000
rh_scan GlobalTheory.StabUnfold.nhds_one_hasBasis_Kg limit 2000
rh_scan GlobalTheory.GaugeTransport.covol_map limit 2000
rh_scan RHTheta37.canonical_coordinate limit 2000
rh_prune RHTheta37.canonical_coordinate as RHTheta37CoordinatePruned
#print axioms RHTheta37.coordinate_lattice
#print axioms RHTheta37.canonical_coordinate
#print axioms GlobalTheory.AdeleBaseChange.exists_finiteAdele_baseChange_equiv
#print axioms GlobalTheory.GaugeTransport.covol_map
