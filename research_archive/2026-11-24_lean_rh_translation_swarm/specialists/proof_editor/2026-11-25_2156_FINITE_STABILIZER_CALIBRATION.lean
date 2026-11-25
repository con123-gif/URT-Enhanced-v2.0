import Development.AbelianVarietyTheory.Proofs.FlagMeasures.ExistsContinuousMulEquivCongruenceTopologyAdelicStatement
import Development.AbelianVarietyTheory.Proofs.FlagMeasures.GaugeVolumeEqOfSemilinearIsometryGenus
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.CompletedLatticeStabilizerCompactOpen
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15, RUN40, 2026-11-25. SOURCE-MATCHED / HUMAN DERIVATION /
LEAN CERTIFICATE PREPARED, NOT EXECUTED. RH OPEN.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first,
including mandatory engine and all-lane unification; SWARM, EXPANSION,
AGENTS, HANDOFF and living proof consulted. Prior lane commit 58d43b7e.
Peer results consulted: theta 5a05ee9c (integral trace pairing),
integration 2785c414 (same ShaK witness), audit 3e19ae4d (tame cancellation).
Keep the actual VWinAt(1,401) and root frontier unchanged.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: the finite stabilizer correspondence and common scalar
calibration of RUN39 are not independent missing mathematical
premises. Native source already supplies the former. Haar
uniqueness and evaluation on the compact-open stabilizer give
the latter. No strong approximation or extra global lattice choice.

Let I be the actual AutInst. Write K0=I.Kset, e for the native
finite continuous multiplicative equivalence, and K for the
completed-lattice stabilizer returned by exists_compact_open_stab.
The matrix coordinate identity for e and the native membership
iff for K0 give e(K0)=K, exactly. The same proof works without
assuming the canonical diagonal model. For the canonical model,
the local identification can be explained as follows.

latHat is an algebraically generated AddSubgroup.closure, NOT a
topological closure. Choose finitely many O_F-module generators
g_i of L (finite because L is O_E-finite and O_E is O_F-finite).
For each finite place v put L_v=sum_i O_v g_i. In the standard
tensor/restricted-product coordinate identification, every element
of latHat has components in L_v. Conversely choose coefficients
c_{vi} in O_v for each component of an element of product_v L_v.
Since the SAME finite list g_i works at every v, each
a_i=(c_{vi})_v is an integral finite adele and the vector equals
sum_i a_i tensor g_i. This proves latHat=product_v L_v.
In particular for L=O_E^n it gives the usual integral lattice
(O_E tensor O_F O_v)^n at each v. The product stabilizer is exactly
the product of the local stabilizers: use a vector supported at
one v for the forward implication and apply the inverse as well.
No approximation or independence-of-witness step occurs.
The finite-generation argument is human mathematics under the
standard tensor-coordinate identification; its native transport
and canonical local integral-unitary model still need elaboration.

For the actual Haar measure mu_f, 0<mu_f(K0)<infinity since K0
is nonempty compact open (native adelic_topology). Let nu_f be
the reference Haar normalized by nu_f(K)=1, which exists by
scaling any Haar by its positive finite stabilizer mass. Haar
uniqueness gives e_*mu_f=a nu_f. Evaluating at K now forces
a=mu_f(K0). This scalar is not an extra hypothesis.
For the product of the archimedean and finite factors, let nu_inf
be the trace-density Haar and C=product_v c_v the archimedean
gauge correction. Once the archimedean trace-density equality
from the earlier lane is established in the same coordinates,
T_*(C muA)=mu_f(K0) (nu_inf times nu_f).
The native covol_map and covol_smul then cancel the entire finite
factor, giving
  gaugeVol = covol(Gamma, nu_inf times nu_f).
No additional comparison of arbitrary finite Haar witnesses is
required. This is a conditional reduction of the existing
Tamagawa route, not the remaining Tamagawa/product-density proof.
Do not equate nu_inf with CDHaar until the CD-scale comparison
is established for the separate D.vol consumer. In particular
IsVolMeasF and StabHat in CdScaleTieIff use the same finite
stabilizer definition but different archimedean normalization.

Negative control (exact): without nu_f(K)=1, evaluation yields
mu_f(K0)=a*nu_f(K), not a. For a=3, nu_f(K)=2 it is 6.
Thus never remove the normalization premise. The scalar a is
positive finite; never cancel an arbitrary extended real.

Source ledger (pinned paths relative to src/):
 Development/AbelianVarietyTheory/Proofs/FlagMeasures/
  ExistsContinuousMulEquivCongruenceTopologyAdelicStatement.lean
    47d69e8b34ae11a17a127343b4e54f0309986f9e
  ExistsContinuousMulEquivCongruenceTopologyAdelic.lean
    522bbd82 (implementation, mem_lamAf_iff)
  GaugeVolumeEqOfSemilinearIsometryGenus.lean
    d8e911ba588e91954a6b50bf044fd455e8715376
  FiniteAdelicUnitaryCongruenceTopology.lean 3b4a5f88
 Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
  CompletedLatticeStabilizerCompactOpen.lean
    c3244199df571fddbe70ded5d7044f071338b473
 Development/AbelianVarietyTheory/Definitions/Foundations/
  CdScaleTieIff.lean 471f92ee9723578af84524a4af40b68f4c16137c
 Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean
    cb758a6c5f78e610b8f946d4b733d07902b15f5d
 Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
    2103e49fe83fce42d4962f85acd9d4f6a589d645
The four full hash checks and twelve declaration/definition anchor
checks were actually rerun against the pin (16/16 matched).
Native Lean and lake absent from PATH. Existing CI status.json
blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched; returncode 0,
runs 45577239749 and 45576756833. Their prior PASS and baseline
axiom reports are retained, not transferred to this new file.
No new CI job or native output. No root obligations formally retired.

Original local graph (source-matched): RUN39 calibration requires
finite coordinate equivalence + Kset correspondence + common
scalar equality + arch density + diagonal transport -> gaugeVol
-> canonical C36 recurrence -> geometry consumer.
Reduced local graph: native finite equivalence + native compact
open stabilizer -> membership iff -> Haar uniqueness + normalization
-> scalar equality automatically. Archive original graph, preserve
all upstream axioms, local coordinate/integral lattice comparison,
arch density, product-density and determinant quotient steps,
Tamagawa, canonical recurrence, separate CD-scale and D.vol,
same-host arithmetic/Sha/TopG/VWin and all unresolved root obligations.
Cache key: (source pin,I,e,K0,K,mu_f,nu_f,normalization,consumer).
Do not merge across distinct I or witnesses. On replay failure,
backtrack to original RUN39 hmap/hK hypotheses. URT not needed.

RESUME HERE: replay this certificate in the pinned Lean environment,
then discharge the coordinate comparison of the canonical integral
lattice with the local unitary model and check the arch trace gauge
against the existing CD-scale data. The finite calibration is now
one native adapter plus Haar uniqueness; use the same proof object
for both geometric consumers where their exact premises match.
HANDOFF TO geometry, theta, kernel extractor, integration and audit.
-/

noncomputable section
open MeasureTheory NumberField Matrix Formalism.MainNotions.S
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes (HA)
open scoped TensorProduct ENNReal NNReal BigOperators

namespace RHEditorFinite40

theorem finite_stab_match (I : AutInst) :
    ∃ (e : I.Gf ≃ₜ* HA (Af I.F) I.cm.sig I.J)
      (K : Subgroup (HA (Af I.F) I.cm.sig I.J)),
      IsOpen (K : Set (HA (Af I.F) I.cm.sig I.J)) ∧
      IsCompact (K : Set (HA (Af I.F) I.cm.sig I.J)) ∧
      (∀ x : I.Gf, x ∈ I.Kset ↔ e x ∈ K) := by
  obtain ⟨e, hm, hs⟩ :=
    GlobalTheory.T.exists_continuousMulEquiv_congruenceTopology_adelicUnitary I
  obtain ⟨K, hK, ho, hc⟩ :=
    GlobalTheory.Mem.Vol.StabGroup.exists_compact_open_stab
      I.F I.E I.cm.sig I.n I.J I.L I.L_fg I.L_span
  refine ⟨e, K, ho, hc, fun x => ?_⟩
  rw [hK, hm]
  exact hs x

theorem same_scalar {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (e : X ≃ᵐ Y) (μ : Measure X) (ν : Measure Y)
    (K : Set Y) (K' : Set X) (hK : K' = e ⁻¹' K)
    (hmK : MeasurableSet K) (a : ℝ≥0)
    (hmap : μ.map e = a • ν) (hν : ν K = 1) :
    μ K' = (a : ENNReal) := by
  rw [hK, ← Measure.map_apply e.measurable hmK, hmap,
    Measure.coe_nnreal_smul_apply, hν, mul_one]

theorem simultaneous_coefficients {ι α : Type*} [Fintype ι]
    {R : α → Type*} [∀ v, CommRing (R v)]
    {M : α → Type*} [∀ v, AddCommMonoid (M v)]
    [∀ v, Module (R v) (M v)]
    (g : ∀ v, ι → M v) (x : ∀ v, M v)
    (h : ∀ v, ∃ c : ι → R v, ∑ i, c i • g v i = x v) :
    ∃ c : ι → ∀ v, R v, ∀ v, ∑ i, c i v • g v i = x v := by
  classical
  choose c hc using h
  exact ⟨fun i v => c v i, hc⟩

end RHEditorFinite40

-- Run native engines against the actual bridge, not the claimed RH theorem.
rh_scan GlobalTheory.T.exists_continuousMulEquiv_congruenceTopology_adelicUnitary limit 2000
rh_scan RHEditorFinite40.finite_stab_match limit 2000
rh_prune RHEditorFinite40.finite_stab_match as RHEditorFinite40.StabPruned
#print axioms RHEditorFinite40.finite_stab_match
#print axioms RHEditorFinite40.same_scalar
#print axioms RHEditorFinite40.simultaneous_coefficients
