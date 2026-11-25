/- RUN39 | 2026-11-25 | lane 7 positivity_geometry
SOURCE-MATCHED human derivation; Lean candidate PREPARED, NOT compiled.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, observed upstream main
07be9a52ebbee066d706195cad0f6863880f9284, not substituted.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first; live proof
10e3d636b345adbcae9ddb91820a3a93f59c93bc. SWARM, HANDOFF, EXPANSION,
AGENTS and RUN37/38 inspected. Latest peer heads 2c98bf97,3843ba68,
b2536f01,a5085dd5,c28ee336,0ca8c0c7,bed688c0,32ae80bb,4ff04116,
de1f67ea,f26f77b4 inspected at commit-title level, not independent
audits of their proofs. RUN38 2d9cc30375fd4d6089edbba08f12348a109d55fb.

RESULT: authenticate the native topology and diagonal subgroup for
the ordinary adelic quotient, without assuming cross-signature
isomorphism. For one fixed F,E,J nondegenerate Hermitian, let
R=A_F tensor_F E. Native HA R0 sigma J for R0=A_F is definitionally
the subgroup HR of GL_n(R) with induced topology. Native topTens is
moduleTopology; topGroupHA explicitly takes the topological group
of matrix units and restricts to HR. The usual units topology uses
both matrix and inverse coordinates. For a unitary matrix g,
                     g^{-1} = J^{-1} sigma(g)^t J.
Indeed left multiply sigma(g)^t J g=J by J^{-1}, then multiply by
g^{-1} on the right. Therefore the inverse coordinate is continuous
in the matrix entries alone (the coefficient involution is continuous:
it is the R0-linear map id tensor sigma on the module topology).
The units topology restricted to HR agrees with the subspace
topology from matrix entries. This holds for fixed J, no comparison
of different real signatures and no determinant division needed
beyond the fixed invertible J. Rank zero trivial. The native
exists_adele_equiv is an actual continuous ring equivalence with
continuous inverse. Applying to entries of g and g^{-1} gives a
topological group identification of real/finite factors; native
ga_glue and ga_ext supply the group-level gluing. The restricted
product identification is RUN38: finite coordinates and finite
exceptional places, using both g and inverse integrality away from
a finite set. No unrestricted-product substitution.

More directly, no new rational-subgroup approximation lemma is
required. By the definitions of HFin, HFinIn and inclR,
    g in HFinIn  iff  exists gamma in U_J(F),
                          HA.mat(g) = bc(inclR)(gamma).
Here U_J(F) is the unitary group of E matrices, as an F-group.
Every matrix entry is 1 tensor gamma_ij and evaluates at each place
to that same rational coefficient. Conversely, if the local
coordinates are those of one common rational unitary matrix gamma,
joint injectivity of the coordinate projections (RUN38) gives
HA.mat(g)=bc(inclR)(gamma), and hence g in HFinIn. Different
rational witnesses at different places are not sufficient. The
native discreteTopology_HFinIn actually proves discreteness by
unpacking exactly this subgroup map and using a neighbourhood
isolating the diagonal rational points, so no extra discreteness
hypothesis is needed. countableGamma likewise supplies countability.

Apply isFundamentalDomain_iff_image to each W separately via its
topological group equivalence Phi_W and the diagonal subgroup
identity above. For any native Haar mu and fundamental domain A,
        (Phi_W)_*mu(Phi_W(A)) = mu(A).
This follows from the measurable inverse and injectivity, and
requires no particular choice of A. Thus the global quotient-volume
comparison in RUN35-38 now has an authenticated human coordinate
and rational subgroup bridge. It still requires the SAME positive
finite scalar calibration for the regularized Tamagawa Haar in
both signatures. In particular the equality of local stabilizer
volumes does not evaluate or prove convergence of the global
normalization. Retain the common convergence factors, local
unramified hypotheses, CM-type indexing and compact-dual density.
Do not infer that the signed count defect interval [-2L,m] or
ASK-MAIN is established by this result.

Original graph retained: topGroupHA, borelHA, discreteTopology_HFinIn,
countableGamma, IsVolMeas, VolTie, volMeas_fundDomain_eq_of_tiedIndep,
volume_signature_independent and original rank-one mass route.
Reduced candidate: topTens + exists_adele_equiv + native unitary
inverse identity -> fixed-form coordinate homeomorphism;
HFin/HFinIn + inclR -> diagonal identity -> native FD image
transport -> equal same-form covolumes. Retain RUN36 finite and
RUN37/38 calibration branches, regularized Haar scalar, Kottwitz
theorem and independent same-host count/entropy/local-gain premises.
No original root edge retired; exact elaborated reachability of
candidate and transitive axiom evidence still pending.
Context key: source/toolchain, F,E,J,W,D, frame, fixed lattice, all
coordinate maps, normalization, subgroup and consumer.
Backtrack to native original supplier on any mismatch.

37 exact source/hash assertions executed (eight files at pin):
Formalism/SharpRestriction/GlobalSchurBounds/GeneralLinearActions/GenusMassVolumes.lean
525618b770cb535fd890f10277af11ffbe76af40
Formalism/LocalToGlobal/GlobalTheory/GL5/FamilyMassVolumeIdentityOfClassDecomp.lean
06beeaaf2b3663f3bb3066fd4b40514d61b54a47
Development/AbelianVarietyTheory/BlockTheory/HeightDefect/AdelicUnitaryGroups.lean
5baaef9b245b93c3de204d996e78082a43b4f9e4
Development/AbelianVarietyTheory/Proofs/SiegelThetaTransformation/DiscreteTopologyRationalPointsHermitianSpace.lean
051e1d3fcc857716e8ab5e230e728ac8c659140d
Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/IsFundamentalDomainIffImageHA.lean
a031016b09028273b7075a882ac12b820af0615c
Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean
6efcfa7fffd73e9509215b0a1f6b74eda90860b5
Development/AbelianVarietyTheory/Proofs/UnitaryExistence/AdelicUnitaryEqRealMulFiniteSplit.lean
53ebeed2cebc169d170a4201607e1ccd47dd5dab
Development/AbelianVarietyTheory/Proofs/FoundationProofs/ExistsCompactAdele.lean
1732c48f8c8b91947c3427626caa8617b616edf8
Baseline CI status records reread b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode zero
(runs 45577239749 and 45576756833); NOT validation of this file.
Local command -v lean and lake yielded no paths. Native compile and
actual root substitution not executed. No new axiom evidence.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
No URT benchmark, not needed for exact cancellation.

RESUME HERE: evaluate the one regularized calibration scalar directly
with the common determinant-torus convergence factors and compact-dual
normalization, using the existing same-form quotient bridge. Audit the
finite local comparison including split/dyadic cases, then substitute
at actual VolSigIndep and signed count consumer, only after native
replay. Batch RUN35-39 with existing runner; no workflow changes.
HANDOFF TO integration, proof editor, kernel and audit.
RH OPEN.
-/
import Development.AbelianVarietyTheory.Proofs.SiegelThetaTransformation.DiscreteTopologyRationalPointsHermitianSpace
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.IsFundamentalDomainIffImageHA
import Development.AbelianVarietyTheory.BlockTheory.HeightDefect.AdelicUnitaryGroups
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

noncomputable section
namespace RHPositivity39
open NumberField MeasureTheory Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open scoped TensorProduct

-- Exact noncommutative cancellation, no analytic or order hypotheses.
theorem inverse_coordinate {A : Type*} [Monoid A]
    (K J g gi gs : A) (hK : K * J = 1)
    (hg : g * gi = 1) (hu : gs * J * g = J) :
    gi = K * gs * J := by
  calc
    gi = (K * J) * gi := by rw [hK, one_mul]
    _ = (K * (gs * J * g)) * gi := by rw [hu]
    _ = K * gs * J := by simp only [mul_assoc, hg, mul_one]

section Native
variable {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E]
    [Algebra F E] (σ : E →ₐ[F] E) {M : ℕ} (J : Matrix (Fin M) (Fin M) E)

theorem diagonal_iff (g : HA (AF F) σ J) :
    g ∈ HFinIn (AF F) σ J ↔
      ∃ γ : GL (Fin M) E, γ ∈ Formalism.UG.UJ (σ : E →+* E) J ∧
        Formalism.UG.bc (inclR (AF F)) γ = HA.mat (AF F) σ J g := by
  change HA.mat (AF F) σ J g ∈ HFin (AF F) σ J ↔ _
  unfold HFin
  exact Subgroup.mem_map

theorem diagonal_discrete : DiscreteTopology (HFinIn (AF F) σ J) := by
  first
  | (rh_reduce 3 using [GlobalTheory.RationalDiscrete.discreteTopology_HFinIn]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact GlobalTheory.RationalDiscrete.discreteTopology_HFinIn σ J

end Native

-- Exact same-form quotient pushforward. Does not identify different signatures.
theorem fd_transport {G H : Type*} [Group G] [Group H]
    [MeasurableSpace G] [MeasurableSpace H] (φ : G ≃* H)
    (hf : Measurable φ) (hi : Measurable φ.symm)
    (Γ : Subgroup G) (Λ : Subgroup H) (hΓ : ∀ g, g ∈ Γ ↔ φ g ∈ Λ)
    (μ : Measure G) (A : Set G) (hA : IsFundamentalDomain Γ A μ) :
    IsFundamentalDomain Λ (φ '' A) (μ.map φ) ∧
      (μ.map φ) (φ '' A) = μ A := by
  refine ⟨(GlobalTheory.VolIndepCompare.isFundamentalDomain_iff_image
    φ hf hi Γ Λ hΓ μ A).1 hA, ?_⟩
  let e : G ≃ᵐ H := ⟨φ.toEquiv, hf, hi⟩
  change (μ.map e) (φ '' A) = μ A
  rw [e.map_apply]
  congr 1
  ext g
  constructor
  · rintro ⟨a, ha, he⟩
    exact φ.injective he ▸ ha
  · intro hg
    exact ⟨g, hg, rfl⟩

rh_scan GlobalTheory.RationalDiscrete.discreteTopology_HFinIn limit 2000
rh_scan GlobalTheory.VolIndepCompare.isFundamentalDomain_iff_image limit 2000
rh_scan fd_transport limit 2000
rh_prune diagonal_iff as RH39DiagonalPruned
rh_prune fd_transport as RH39FDPruned
#print axioms inverse_coordinate
#print axioms diagonal_iff
#print axioms diagonal_discrete
#print axioms fd_transport
#print axioms GlobalTheory.RationalDiscrete.discreteTopology_HFinIn
#print axioms GlobalTheory.VolIndepCompare.isFundamentalDomain_iff_image
end RHPositivity39
