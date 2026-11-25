import Formalism.LocalToGlobal.GlobalTheory.GL5.PacketStatementOfIndependence
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Interactive: eliminate general genus mass normalization at the chosen standard space

25 Nov 2026. SOURCE-MATCHED human reduction; new Lean certificate PREPARED, not compiled; RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Continuation of interactive 708a3eb763c2f05a618ce79c71b1f5c177a2d287, which bypassed the rank descent but retained GenusMassAt at rank r. Current peer head checked before work.

## Actual mathematical closure of the model-identification premise

For the selected P=stdPos(D,r), the native definitions in
PNamed.lean (fcfd96e6e8385ec5e1de13f41d5706803d565c5d) and Spaces.lean
(aef70f55737cb9275617f5d83449efd7b3e48c3f) give the following, not just an isomorphic model:
  V_P=E^r,
  h_P(x,y)=sum_i conjugate(x_i)*1*y_i,
  L_P=span_{O_E}{e_i}.
The native massTelescope_form and massTelescope_lat in
HermitianLatticesProofs/MassTelescope.lean (b0991a5b95ecff7998f2f4a6ecc98e5deb1280da)
are exactly the same form and lattice. The source
ThickPlacesCorollaryOfAnyTranslate.lean (a91264c8b21d7263cd4bddaee24ef428b141d869)
already proves standard_form_eq_telescope_form and standard_lattice_eq_telescope_lattice.
Consequently mass(h_P,L_P)=massI(D,r), by substitution, without GenusMassStd or GenusMassAt.
This is a direct equality of the selected native objects, not a statement about arbitrary
definite spaces or all unimodular lattices.

Use the actual class decomposition of P supplied by definite_class_decomposition D
(PacketStatementOfIndependence.lean 1cebe7595e0dc808d6d38fb6d359edf122148c9f).
For its normalized Haar measure and fundamental domain from VolTie, the native
measure_KSub gives mu(K)=1; measure_fd_toReal then identifies vol(P) with
sum_i |Gamma intersect g_i K g_i^-1|^-1, which the decomposition's final field
identifies with mass(h_P,L_P). This is the existing proof of
mass_volume_identity_of_class_decomp, specialized to the selected P and without
its broad genus equality premise (FamilyMassVolumeIdentityOfClassDecomp.lean
06beeaaf2b3663f3bb3066fd4b40514d61b54a47).
Thus the direct same-rank route yields
  volY0(D)=vol(P)=massI(D,r)=massI(D,k)*product_{k<M<=r} ratioH(D,M).
The first equality still consumes signature independence and VolTie, and the
last consumes the actual model Siegel mass ratio (with Fact HermRepUnram).
The class decomposition and all its upstream hermitian approximation suppliers
remain essential, not assumed eliminated. Other consumers of GenusMassStd and
geometric theorem two are retained in the original graph.

## Short manuscript insertion
For the standard positive definite space P of the same rank r as Y0,
h_P(x,y)=sum_i conjugate(x_i)y_i and L_P=O_E^r. These are exactly the form
and lattice defining massI(D,r), so the normalized adelic double-coset
class formula gives vol(P)=massI(D,r) without a general genus-normalization
theorem. Signature independence transports this value to Y0, and the
ordinary model mass recurrence telescopes to the required rank-k formula.

Original count graph: VolTie + VolSigIndep + GenusMassAt(r) + ClassFinAt(r)
+ ClassMassAt(r) + model mass recurrence -> endpoint.
New local graph: VolTie + VolSigIndep (one chosen pair) + actual native class
decomposition at P + definitional model identities + model mass recurrence
-> same endpoint. No new premises; no global axiom deletion claimed.
No URT performance claim. No new numerical tests, no native compile, no new
axiom audit. The source equality proof below is prepared for independent replay.

RESUME HERE: compile and audit this certificate, and isolate the actual
VolSigIndep producer for the selected same-rank pair; trace the native
class decomposition and HermRepUnram rather than treating them as closed.
HANDOFF TO editor, geometry, integration and kernel. PARTIAL.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open MeasureTheory NumberField Finset
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem rh_stdpos_mass_def (D : D7) (n : ℕ) :
    Formalism.HermitianLatticesTheory.mass (stdPos D n).hT (stdPos D n).L0 = massI D n := by
  unfold massI
  rw [standard_form_eq_telescope_form, standard_lattice_eq_telescope_lattice]
  change Formalism.HermitianLatticesTheory.mass
    (Formalism.BasicNotions.Examples₂.diagForm n (fun _ => false))
    (Formalism.BasicNotions.Examples₂.stdLat n) = _
  have hf : Formalism.BasicNotions.Examples₂.diagForm (E := D.host.E) n (fun _ => false) =
      Formalism.HermitianLatticesTheory.massTelescope_form D.host.E n := by
    apply LinearMap.ext
    intro x
    apply LinearMap.ext
    intro y
    rw [Formalism.BasicNotions.Examples₂.diagForm_apply,
      Formalism.HermitianLatticesTheory.massTelescope_form_apply]
    simp [Formalism.BasicNotions.Examples₂.sgn]
  rw [hf]
  rfl

theorem rh_stdpos_volume_native_class (D : D7) (n : ℕ) (hT : VolTie D) :
    D.vol (stdPos D n) = massI D n := by
  let W := stdPos D n
  have hW : W.SigOK := stdPos_sigOK D n
  have hsig : ∀ τ, W.sig τ = (W.rank, 0) := fun τ => rfl
  obtain ⟨⟨μ, hμ⟩, hall⟩ := hT W W.rank 0 hW hsig
  obtain ⟨⟨𝓕, h𝓕⟩, hvol⟩ := hall μ hμ
  obtain ⟨θ, hθ⟩ := hμ.2.1
  obtain ⟨A, hA⟩ := (hμ.2.2 θ hθ).1
  obtain ⟨hKm, m, g, hcov, hdisj, hfin, hsum⟩ :=
    definite_class_decomposition D W hW hsig θ hθ A hA
  have hK1 := measure_KSub D W W.rank μ hμ θ hθ A hA
  haveI := hμ.1
  haveI := Unfold.measurableMulHA D.sp.cm.sig W.gram
  haveI : Countable ↥(GamA D W) := Unfold.countableGamma D.sp.cm.sig W.gram
  have e := Unfold.measure_fd_toReal μ hKm hK1 g hcov hdisj hfin h𝓕
  rw [hvol 𝓕 h𝓕, ENNReal.toReal_ofReal (D.vol_pos W).le] at e
  rw [e, hsum]
  exact rh_stdpos_mass_def D n

theorem rh_direct_base_without_genus (D : D7) (hT : VolTie D)
    (hI : VolSigIndep D) : BaseVolumeEqualsMass D := by
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
  rw [vol_eq_of_indep D hT hI (D.sp.Y 0) (stdPos D D.R.r)
    D.R.sigY0.1 D.R.sigY0.2 D.R.r 0 (D.sp.Y_sig 0) (stdPos_sigOK D D.R.r)
    (fun τ => D.sp.baseSpace_signature_eq τ) (stdPos_sig D D.R.r)
    (by rw [hrY, stdPos_rank])]
  exact rh_stdpos_volume_native_class D D.R.r hT

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh_endpoint_without_genus (D : D7) (hT : VolTie D)
    (hI : VolSigIndep D) :
    volY0 D = massI D D.R.k *
      ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M := by
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have := D.R.r_eq
    have := D.R.two_le_m
    omega
  have hk := D.R.k_ge
  have hbase : volY0 D = massI D D.R.r := rh_direct_base_without_genus D hT hI
  rw [hbase, hr]
  exact mass_telescope D (standardLattice_aux2b D) (host_v_pos D) D.R.k (by omega) (D.R.m - 1)

rh_scan rh_stdpos_mass_def limit 1000
rh_scan rh_endpoint_without_genus limit 2000
rh_prune rh_stdpos_mass_def as RHStdposMassPruned
#print axioms rh_stdpos_mass_def
#print axioms rh_stdpos_volume_native_class
#print axioms rh_endpoint_without_genus

end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
