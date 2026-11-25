/- RUN38 | 2026-11-25 | positivity_geometry
Status: source-matched human argument; Lean candidate PREPARED, not compiled.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; live proof 10e3d636b345adbcae9ddb91820a3a93f59c93bc.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed main ce1560fba43e59629abdf3c27a279218fad9f77a, not substituted.
Prior RUN37 3232ac0eba349fe396ec9bbdf28d0c18971077db.
Latest peer commit metadata read c2aa33f2 (Hurewicz audit), c9d417b7 (literature), 8aed7b77 (CountQ), c55df0a0 (character valuations), f2bb1e4b (Galois). None changes this normalization.

NEW: identify the entire finite calibration factor with the product of local
stabilizers, rather than proving a separate global matrix conjugacy between
different signatures. Fix the SAME host F,E, form W, full lattice L=L0c D W
and rational frame. Write O_v for the completed ring of integers of F_v,
E_v=F_v tensor_F E (possibly split), L_v=O_v-span of L in E_v^n.

Human restricted-product proof:
Choose an F-basis e_1,...,e_d of E. Outside finitely many v, its O_v-span
is the completed ring of integers of E over v: clear denominators in both
directions against any finite O_F generating set of O_E. For a finite
dimensional F-vector space, the tensor module topology agrees with the
finite coordinate product topology (coordinate maps and inverse are
continuous linear maps for the module topology). Thus
 A_F^f tensor_F E = (A_F^f)^d = restricted product_v E_v,
as topological rings under coordinate evaluation. The last equality uses
the finite exceptional set just identified; multiplication is componentwise
by bilinearity. It does not claim that the full unrestricted product is
the adele ring. For matrices, apply the same map to entries of BOTH g and
g^{-1}; the equations gg^{-1}=g^{-1}g=1 and g^*Jg=J are local and reflect
back by injectivity. Outside a finite set containing denominators of the
frame, J, J^{-1}, and generators of L, L_v is the standard coordinate
lattice. The resulting restricted product of unitary groups is with
respect to K_v=Stab(L_v). The topology agrees with the matrix-units
topology using the entry and inverse-entry coordinates. Identification
of that topology with the native HA topology still requires checking
the actual native topGroupHA definition/instances, not only abstract
continuity of the tensor split.

For a finite list of O_F generators l_j of L (full lattice), the native
latHat is exactly sum_j intAf(F) l_j: its defining additive subgroup
closure consists of finite sums of the indicated tensors, and all
coefficients can be collected in the integral adele ring. Conversely
each summand is one generator. Under evaluation this is product_v L_v:
given arbitrary local y_v in L_v, choose coefficients a_{j,v} in O_v
for the SAME finite list at every v. Each a_j=(a_{j,v}) is an integral
adele, so y is the image of sum_j a_j l_j. Conversely evaluate a finite
sum. No infinite summation in a lattice, no approximation/density
assumption. This reuses RUN33.

Consequently, for the native membership predicate in IsVolMeas,
  [forall y, y in latHat iff finMat(h)y in latHat]
       iff [forall v, g_v L_v = L_v].
Indeed the finite action is componentwise and bijective. Necessity:
embed a single local y_v by using zero at every other place, which is
in the integral lattice product when y_v is integral. This yields
g_v L_v subset L_v; apply the inverse action to get the opposite
inclusion. Sufficiency follows by the coordinatewise iff. No uniform
choice of local isometries across different W is required. Each K_v is
compact open as the intersection of the closed local unitary group with
the compact open stabilizer of a full O_v-lattice in GL_{F_v}(E_v^n).

Native exact source consumers:
src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean
  cb758a6c5f78e610b8f946d4b733d07902b15f5d (intAf, latHat, finMat, IsVolMeas, VolTie).
src/Development/AbelianVarietyTheory/Definitions/ExistenceOfLattices/Hat1.lean
  5955993355c697e3c7394083cf050c9975d2800b (hat, fv).
src/Development/AbelianVarietyTheory/Definitions/ExistenceOfLattices/CoeSelfDualLatticeInFrameCoordinatesEq.lean
  1dcc8eb4ac37d4ba9da8c3c4e40dcc44433fe3c9 (coe_selfDualLatticeInFrameCoordinates_eq).
src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/ExistsAdeleRingTensorEquivInfiniteProdFinite.lean
  6efcfa7fffd73e9509215b0a1f6b74eda90860b5 (exists_adele_equiv, continuous both ways).
src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/AdelicUnitaryEqRealMulFiniteSplit.lean
  53ebeed2cebc169d170a4201607e1ccd47dd5dab (gl_glue, ga_ext, ga_glue, real_finite_split).
src/Formalism/SharpRestriction/GlobalSchurBounds/GeneralLinearActions/GenusMassVolumes.lean
  525618b770cb535fd890f10277af11ffbe76af40 (HA, HA.mat, HFin, HFinIn, evalV).
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/IsFundamentalDomainIffImageHA.lean
  a031016b09028273b7075a882ac12b820af0615c.
src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdelicQuotientVolumeEqOfSignatureRankIndep.lean
  5df13f58118a8edd91ceed1143cf20581f71a1ec.

The calibration rectangle is therefore (in conventional adelic coordinates)
  R_W = product_rho B_rho x product_v K_v.
Under matched Tamagawa convergence factors and archimedean densities
(RUN35-37), its measure is
  T_W(R_W) = c(F,E,n) * product_rho cd(B_rho).
Local finite densities coincide on K_v across the two forms by RUN36
under the original unramified self-dual hypotheses. The regularized
product must use the SAME local normalizations/convergence factors; an
unregularized infinite product cannot replace it. Hence, once the
remaining native topology and rational diagonal match are checked, the
scalar c is shared. The native covolume ratio equals the Tamagawa-number
ratio, which is one by inner-form invariance. No cross-signature real
group isomorphism is assumed.

Original graph kept: IsVolMeas -> native finite membership + frame
rectangles -> VolTie -> volMeas_fundDomain_eq_of_tiedIndep;
volume_signature_independent -> original signature-volume supplier.
Candidate graph: native ga_ext + ga_glue -> unique real/finite gluing;
finite coordinate basis + L generators -> product membership -> local
stabilizer iff -> calibration; retain Haar existence, all native
topology, rational subgroup, local self-duality and regularization
obligations, Tamagawa supplier and actual quotient consumer. The local
coordinate equivalence is not a retirement of the global count premise.
Native root reachability of the replacement has not been certified.
Cache key: pin, D, W, F,E,J, frame, L, local bases, topology,
normalization and exact consumer; no cross-host merging. Backtrack to
native IsVolMeas/VolTie if any coordinate or topology mismatch.
The weighted-mean/joint-loss and prime-window premises are unaffected.

Verification performed: retrieved eight pinned source files above,
mission and prior checkpoint, peer metadata, and baseline CI status
records b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717: returncode 0, runs
45577239749 and 45576756833. These are baseline only. No Lean/Lake
on local PATH; no native compilation/pruning/scan or new axiom report.
No URT comparison; exact basis/coordinate reduction does not need it.
Lean below is a proposed actual-source gluing bridge and generic
product-membership core (not the full adelic topology theorem).
Use existing native engine on these declarations and actual consumer,
and retain original graph and axioms until checked.

RESUME HERE: verify native HA topGroupHA uses matrix and inverse-entry
topology, and identify HFinIn with the diagonal rational subgroup
under the explicit coordinate equivalence. Then use the actual
calibration above with common regularization and apply RUN37; only
after native replay and independent audit propagate to signed mass
defect/count anchor. HANDOFF TO integration/kernel/audit/editor.
RH OPEN.
-/

import Development.AbelianVarietyTheory.Proofs.UnitaryExistence.AdelicUnitaryEqRealMulFiniteSplit
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.IsFundamentalDomainIffImageHA

noncomputable section
namespace RHPositivity38
open NumberField IsDedekindDomain Formalism.BasicNotions Formalism.MainNotions Formalism.BasicNotions.TH Formalism.L2.Theta Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes Formalism.L2.Pj GlobalTheory.Member
open scoped TensorProduct Matrix
attribute [local instance] Formalism.BasicNotions.Host.cmStar

-- Actual native glue and extensionality: uniqueness is not a new premise.
theorem unique_gluing {D : D7} (V : HSp D)
    (a : GL (Fin V.rank) (Ainf D.host.F ⊗[D.host.F] D.host.E))
    (b : GL (Fin V.rank) (Af D.host.F ⊗[D.host.F] D.host.E))
    (ha : a ∈ HR (Ainf D.host.F) D.sp.cm.sig V.gram)
    (hb : b ∈ HR (Af D.host.F) D.sp.cm.sig V.gram) :
    ∃! g : GA D V, infHom V g = a ∧ finHom V g = b := by
  obtain ⟨g, h₁, h₂⟩ := GlobalTheory.UnitarySplit.ga_glue V a b ha hb
  refine ⟨g, ⟨h₁, h₂⟩, ?_⟩
  intro h hh
  exact GlobalTheory.UnitarySplit.ga_ext V (hh.1.trans h₁.symm) (hh.2.trans h₂.symm)

-- Exact product membership reduction, with one-coordinate test vectors.
theorem product_stabilizer_iff {ι : Type*} {X : ι → Type*}
    [∀ i, Zero (X i)] (L : ∀ i, Set (X i)) (h0 : ∀ i, 0 ∈ L i)
    (g : ∀ i, X i → X i) (hg0 : ∀ i, g i 0 = 0) :
    (∀ y : ∀ i, X i, (∀ i, y i ∈ L i) ↔ (∀ i, g i (y i) ∈ L i)) ↔
      (∀ i (z : X i), z ∈ L i ↔ g i z ∈ L i) := by
  classical
  constructor
  · intro h i z
    let y : ∀ j, X j := Function.update (fun j => 0) i z
    constructor
    · intro hz
      have hy : ∀ j, y j ∈ L j := by
        intro j
        by_cases hj : j = i
        · subst j
          simpa [y] using hz
        · simpa [y, Function.update_of_ne hj] using h0 j
      have hh := (h y).1 hy i
      simpa [y] using hh
    · intro hz
      have hy : ∀ j, g j (y j) ∈ L j := by
        intro j
        by_cases hj : j = i
        · subst j
          simpa [y] using hz
        · simpa [y, Function.update_of_ne hj, hg0 j] using h0 j
      have hh := (h y).2 hy i
      simpa [y] using hh
  · intro h y
    exact ⟨fun hy i => (h i (y i)).1 (hy i),
      fun hy i => (h i (y i)).2 (hy i)⟩

#print axioms unique_gluing
#print axioms product_stabilizer_iff
#print axioms GlobalTheory.UnitarySplit.ga_glue
#print axioms GlobalTheory.UnitarySplit.real_finite_split
end RHPositivity38
