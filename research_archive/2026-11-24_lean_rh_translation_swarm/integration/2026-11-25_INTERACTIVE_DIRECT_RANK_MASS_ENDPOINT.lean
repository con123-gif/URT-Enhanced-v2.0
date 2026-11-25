import Formalism.LocalToGlobal.GlobalTheory.GL5.PacketStatementOfIndependence
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Interactive: direct same-rank mass endpoint at the sharp-count supplier
25 Nov 2026. HUMAN SOURCE-MATCHED, native candidate NOT compiled; RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Prior integration e02666f2396bbe39b574fb84cf6acb6330632619 and geometry 188850b14c12b16eef35d383222cd3b8adac69ca used rank descent to k. This replaces that descent for the count endpoint, not unrelated consumers of Conclusion2.

## Actual upstream source and replacement
PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d defines VolSigIndep, and proves vol_eq_of_indep and vol_eq_mass_of_indep. It also defines stdPos, with rank n and signature (n,0) at every embedding.
PacketStatementOfGenusClasses.lean 3cecaa7a50a0e58c9165870c12748a36439edbcd, stmtF_of_named, supplies VolSigIndep, ClassMass, GenusMassStd and LandherrSig together to theorem_two_of_landherr. The first three already suffice for the direct count normalization; LandherrSig was used for UnitSplit, unnecessary here.
Write r=k+m-1, Y=Y(0), P=stdPos(D,r). The SAME native signature-independence and volume-tie premises imply vol(Y)=vol(P). The normalized finite double-coset mass theorem at rank r alone gives
    vol(P)=sum_{[g] in Gamma\G/K} 1/|Gamma intersect g K g^-1|=massI(D,r).
Thus there is no need for a chain of m-1 indefinite spaces or m-1 geometric volume identities. The standard model Siegel mass ratio (standardLattice_aux2b, not the geometric volume-ratio proposition) telescopes:
    massI(D,r)=massI(D,k)*prod_{k<M<=r} ratioH(D,M).
Combining these yields precisely RHIntegrationMassEndpoint. Only one rank of the class/mass theorem is consumed. In fact only the chosen Y and P pair of the signature-independence theorem and the chosen P's mass normalization are needed. The latter specialization still requires an actual proof of the standard form/lattice identification if one wants to remove GenusMassStd entirely; no definitional equality claimed here.
The original broad propositions may remain needed by other consumers, including the packet's genuine geometric theorem-two, class-number, and Landherr conclusions. This is a local count branch reduction, not global pruning.

## Trace the actual class supplier, rather than treat it as a new assumption
PacketStatementOfIndependence.lean 1cebe7595e0dc808d6d38fb6d359edf122148c9f:
  genus_class_mass := unitary_class_mass_hermitian;
  classMass_of_D7 := class_mass_of_genus_classes genus_class_mass;
  definite_class_decomposition := defClassDecomp_of_UJ genus_class_mass.
PClassItems.lean 1727950e8085a74f7895746b3ae24008983d7be0:
  class_number_finite := classFin_of_UJ unitary_class_set_finite;
  class_mass_of_genus_classes applies the general theorem to actual D,W,L0, using the CM involution, lattice and definite signature hypotheses.
OrbitalBoundsConclusion/UnitaryClassMassHermitian.lean d4acb4a0535bfc603005ccd6a1729721c4f57d91:
  unitary_class_mass_hermitian := UJClassMass.unitary_class_mass.
UnitaryGroupMassFormula/UnitaryClassMass/UnitaryClassMass.lean c2168685211cda28e2a4a72b72380a2380ebe2a4:
  tensor_localization := tensLocX_of local_integral_of_substitution;
  hermitian_approximation := hermitian_approximation_of_parts local_switching_lattice tensor_localization lattices_close_locally wPlace bcU gramOK;
  unitary_class_mass := uJClassMass_of_herm hermitian_approximation.
These are real source bodies, not new axioms introduced by this note. Their transitive proofs/axioms have not been independently audited here. In particular the hermitian approximation suppliers remain in the ledger.

DiscreteSeriesOfFormalDegree.lean dce3a5b107b903a546838f17f8e029642872bc3f:
  standardLattice_aux2b := massRatio_of_modelMassRatio D siegel_mass_ratio
  under Fact HermRepUnram. This is a separate standard mass theorem, not a geometric signature-transition estimate.
  volume_mass_of_class_data proves the mass equality by using the normalized compact subgroup, finite stabilizers, fundamental domain unfolding, and the class/genus mass identity.
FamilyMassVolumeIdentityOfClassDecomp.lean 06beeaaf2b3663f3bb3066fd4b40514d61b54a47:
  measure_fd_eq_sum: on each double coset choose g_i K, weighted by the inverse finite stabilizer size. Its Gamma-orbit sum equals 1, because precisely that many translates hit the chosen coset; integrate over a fundamental domain and use left invariance. This is the ordinary unfolding argument; no new analytic estimate.
PClassDecomp.lean d5314d6eafc39137887a835a1e901abd4f481119 separates class finiteness and class mass; they are recombined by defClassRest_of.
Spaces.lean aef70f55737cb9275617f5d83449efd7b3e48c3f defines the positive standard space with diagonal all-positive form. GenusMassStd remains retained at rank r because the equality to the exact massI form/lattice has not been independently checked.

Human manuscript insertion: By signature independence compare the actual starting space directly with the positive definite standard space of the same rank r. Normalized adelic double-coset unfolding gives its volume as the rank-r model mass (the finite class sum). The model Siegel mass ratios telescope to the rank-k mass times the required product. The count branch therefore needs no rank-by-rank indefinite descent. Retain the original route for other consumers.

Verification: retrieved pinned source bodies and matched the named declarations; retrieved current peer commit list before saving. No local Lean execution or new native axiom check. No numerical RH evidence and no URT speed claim. Source-level replacement below prepared for native replay; preserve original graph and same-host context. No claim of unconditional RH.

RESUME HERE: audit the actual supplier of VolSigIndep for the one pair (Y(0),stdPos(D,r)); trace HermRepUnram and hermitian_approximation transitively; replay this rank-r certificate and compare axioms to the prior endpoint route. Check the exact standard form/lattice equality to drop the last genus-normalization field at the chosen standard space. 
HANDOFF TO geometry, kernel, integration and editor; PARTIAL.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice Finset
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem rh_direct_base_mass (D : D7) (hT : VolTie D) (hI : VolSigIndep D)
    (hC : ClassItemsAt D D.R.r) : BaseVolumeEqualsMass D := by
  have hsum : D.R.sigY0.1 + D.R.sigY0.2 = D.R.r := by
    have := D.R.rS_two
    have := D.R.r_eq
    simp only [Ranks.sigY0]
    omega
  have hrY : (D.sp.Y 0).rank = D.R.r := by
    have hs := Formalism.BasicNotions.sig_sum (D.sp.Y 0) (D.sp.Y_sig 0) D.host.φ₀
    rw [D.sp.baseSpace_signature_eq D.host.φ₀] at hs
    omega
  change D.vol (D.sp.Y 0) = massI D D.R.r
  exact vol_eq_mass_of_indep D D.R.r hT hI hC (D.sp.Y 0)
    D.R.sigY0.1 D.R.sigY0.2 (D.sp.Y_sig 0)
    (fun τ => D.sp.baseSpace_signature_eq τ) hrY

theorem rh_direct_base_mass_native_class (D : D7) (hT : VolTie D)
    (hI : VolSigIndep D) (hG : GenusMassAt D D.R.r) :
    BaseVolumeEqualsMass D :=
  rh_direct_base_mass D hT hI
    ⟨hG, class_number_finite_rank D D.R.r, classMassAt_of D (classMass_of_D7 D) D.R.r⟩

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh_direct_mass_endpoint (D : D7) (hT : VolTie D) (hI : VolSigIndep D)
    (hG : GenusMassAt D D.R.r) :
    volY0 D = massI D D.R.k *
      ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M := by
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have := D.R.r_eq
    have := D.R.two_le_m
    omega
  have hk := D.R.k_ge
  have hbase : volY0 D = massI D D.R.r := rh_direct_base_mass_native_class D hT hI hG
  rw [hbase, hr]
  exact mass_telescope D (standardLattice_aux2b D) (host_v_pos D) D.R.k (by omega) (D.R.m - 1)

rh_scan rh_direct_base_mass_native_class limit 2000
rh_scan rh_direct_mass_endpoint limit 2000
rh_scan PI.UnitaryGroupMassFormula.UJClassMass.unitary_class_mass limit 2000
rh_prune rh_direct_base_mass as RHDirectBaseMassPruned
#print axioms rh_direct_base_mass
#print axioms rh_direct_mass_endpoint
#print axioms PI.UnitaryGroupMassFormula.UJClassMass.unitary_class_mass

end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
