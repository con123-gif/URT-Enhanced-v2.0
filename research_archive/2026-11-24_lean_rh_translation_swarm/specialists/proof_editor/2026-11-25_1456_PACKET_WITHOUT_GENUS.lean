import Formalism.LocalToGlobal.GlobalTheory.GL5.PacketStatementOfIndependence
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Editor RUN12 — remove general genus normalization at both packet consumers
25 November 2026. Human source-matched caller reduction; Lean PREPARED, NOT compiled.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed d91ae2678eea19a0c3045ffca37f1da757c2e719.
Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc; live spine
464e82f81f646d4af85e1f5f70d379026df46261. AGENTS, SWARM, HANDOFF,
EXPANSION, continuity, research state/log/protocol and prior RUN11 inspected
(in part for long continuity files). Latest peer commits a910af41 (Landau),
d91e1e45 (cyclotomic layer), 1b03d6e3 (CountQ), 6ea6da30 (DH),
46c378ee (Clozel), 3c6f175e (near-field) checked for overlap.
Previous 8825cbd3 closed the selected standard mass identification for the count
branch; 57f243bc proposed ordinary local classification/Cayley to supply the
broader GenusMassStd. This run backtracks: the broader premise is unnecessary
for BOTH actual consumers in stmtF_of_named, given the already required
VolSigIndep. Do not delete the prior proof or any other consumer.

## Short manuscript block (same host D, every rank n, exact signatures)
Write P_n for stdPos(D,n), I_n=massI(D,n). The pinned standard model is
the identical form and lattice defining I_n, and its normalized adelic
class formula is vol(P_n)=I_n. (Use native definite_class_decomposition,
measure_KSub and measure_fd_toReal, not the general GenusMassStd.)
Signature independence gives, for every W in the original VolSigIndep
context with rank n, vol(W)=vol(P_n)=I_n. In particular this proves the
entire DefiniteVolumeEqMass input, including ranks zero and one. For
theorem two, LandherrSig supplies the same native unit splitting
W -> W' of rank n-1; the volume ratio is I_n/I_(n-1)=ratioH(D,n)
by standardLattice_aux2b, for n>=3 as in the native source. Therefore
VolRatioTrue, then Conclusion2, follow with the same witnesses and same
normalizations. Both outputs of the geometric producer in stmtF_of_named
are now obtained without the arbitrary-lattice GenusMassStd premise.
This is NOT a proof of VolSigIndep; the ordinary Tamagawa transport
remains open. Nor does it remove LandherrSig (unit splitting and small
ranks), HermRepUnram, class decomposition, ClassMass as internal
mathematics, or the analytic/arithmetic suppliers. The existing native
definite_class_decomposition uses genus_class_mass (unitary_class_mass_hermitian),
so no arbitrary ClassMass hypothesis is required at this caller, but
its actual source dependencies remain.

Original source-visible graph:
stmtF_of_named -> theorem_two_of_landherr -> volRatioTrue_of_indep
 -> vol_eq_mass_of_indep -> volume_mass_of_class_data -> GenusMassAt;
stmtF_of_named -> volume_mass_of_class_items -> GenusMassStd.
Both also retain their VolTie, class finiteness/mass, etc.
Candidate graph:
stmtF_of_open <- (Conclusion2, DefiniteVolumeEqMass)
 <- same-host VolSigIndep + stdPos-volume identity + original unitSplit
 + standard model ratio; standard-volume identity <- VolTie +
 actual definite_class_decomposition + native normalized measure formula.
Preserve full original graph and all unresolved value/type/constructor/axiom
edges. Local candidate deletion only; no global reachability claim.
Cache by (pin, D, n, W, P,Q, VolTie, VolSigIndep); no cross-host identification.
No URT or numeric surrogate. No native Lean/Lake available locally.
Prior CI jobs 45577239749 and 45576756833 independently fetched: all
three jobs in each completed success, NOT a check of this new file.
Actual source checks executed: 18 exact blob/anchor assertions;
two source transformations guarded by exact original body checks.
Native replay/axiom evidence for this new candidate still pending.
Sources (relative to src/Formalism/LocalToGlobal/GlobalTheory/GL5/):
PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d
PacketStatementOfGenusClasses.lean 3cecaa7a50a0e58c9165870c12748a36439edbcd
PacketStatementOfIndependence.lean 1cebe7595e0dc808d6d38fb6d359edf122148c9f
DiscreteSeriesOfFormalDegree.lean dce3a5b107b903a546838f17f8e029642872bc3f
Statement.lean 0c920a7767d85d1fd82dc30d6f7d01bc2e8382c7
Standard model certificate: 8825cbd3, integration/2026-11-25_INTERACTIVE_STANDARD_MASS_BY_DEFINITION.lean (reused two prepared lemmas, renamed).
RESUME HERE: compile this actual caller adapter, scan its typed/value dependencies
against stmtF_of_named, and independently check VolSigIndep measure transport.
HANDOFF TO: integration, geometry, formal audit, kernel. RH OPEN.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open MeasureTheory NumberField Finset
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem rh_editor_stdpos_mass_def (D : D7) (n : ℕ) :
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

theorem rh_editor_stdpos_volume_native_class (D : D7) (n : ℕ) (hT : VolTie D) :
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
  exact rh_editor_stdpos_mass_def D n


theorem rh_editor_vol_eq_mass_of_indep (D : D7) (hT : VolTie D)
    (hI : VolSigIndep D) (W : HSpace D.host.E) (P Q : ℕ)
    (hW : W.SigOK) (hs : ∀ τ, W.sig τ = (P,Q)) :
    D.vol W = massI D W.rank := by
  rw [vol_eq_of_indep D hT hI W (stdPos D W.rank) P Q W.rank 0 hW
    (stdPos_sigOK D W.rank) hs (stdPos_sig D W.rank) (by rw [stdPos_rank])]
  exact rh_editor_stdpos_volume_native_class D W.rank hT

theorem rh_editor_definite_volume_no_genus (D : D7) (hT : VolTie D)
    (hI : VolSigIndep D) : DefiniteVolumeEqMass D := by
  intro W hW hsig
  exact rh_editor_vol_eq_mass_of_indep D hT hI W W.rank 0 hW hsig

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh_editor_volRatio_no_genus (D : D7) (hT : VolTie D) (hI : VolSigIndep D)
    (hU : UnitSplit D) : VolRatioTrue D := by
  intro W P Q hW hs hM s hsP
  obtain ⟨x, hx, W', ι, h1, h2, hW', hs'⟩ := hU W P Q hW hs hM s hsP
  refine ⟨x, hx, W', ι, h1, h2, hW', hs', ?_⟩
  intro μ 𝓕 μ' 𝓕' hμ h𝓕 hμ' h𝓕'
  have hrk : W.rank = P + Q := by
    have := Formalism.BasicNotions.sig_sum W hW D.host.φ₀
    rw [hs D.host.φ₀] at this
    omega
  have hs'' : ∀ τ, W'.sig τ = (if s then P - 1 else P, if s then Q else Q - 1) := by
    intro τ; rw [hs' τ]; cases s <;> simp
  have hrk' : W'.rank = W.rank - 1 := by
    have := Formalism.BasicNotions.sig_sum W' hW' D.host.φ₀
    rw [hs'' D.host.φ₀] at this
    cases s <;> simp at this hsP <;> omega
  rw [volTie_toReal D hT W P Q hW hs μ 𝓕 hμ h𝓕,
    volTie_toReal D hT W' _ _ hW' hs'' μ' 𝓕' hμ' h𝓕',
    rh_editor_vol_eq_mass_of_indep D hT hI W P Q hW hs,
    rh_editor_vol_eq_mass_of_indep D hT hI W' _ _ hW' hs'', hrk']
  exact standardLattice_aux2b D W.rank hM

end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes

namespace Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.ClosedKudlaFamilyStandardLattice
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions Formalism.L2.GlobalTheoryTheory.ConcTop
attribute [local instance] Formalism.BasicNotions.Host.cmStar

variable [Fact Formalism.HermitianLattices.Ext.L3.HermRepUnram] in
theorem rh_editor_stmtF_without_genus {eps : ℝ} (Fm : FamP eps) (C3 : ℝ) (hC3 : 1 ≤ C3)
    (hR : ∀ x (i : Fm.Ix x), Formalism.L2.Theta.RealTied (Fm.D x i))
    (hW : WeilSiegelCM)
    (hV : ∀ x (i : Fm.Ix x), VolSigIndep (Fm.D x i))
    (hHC : ∀ x (i : Fm.Ix x), HCFormalDegree (Fm.D x i))
    (hL : ∀ x (i : Fm.Ix x), LandherrSig (Fm.D x i))
    (hN : FamilyMassVolumeBounds Fm → FamilyLevelConditionAdmitted Fm → ∀ x (hx : Fm.x1 < x) (i : Fm.Ix x), ClassNumberFormula₂ (Fm.D x i) (Fm.ex x hx i).lev) :
    KudlaFamilyStatement Fm C3 :=
  stmtF_of_open Fm C3 (by linarith) (siegel_weil_part_one_of_weil_theorem eps Fm hW)
    (fun _ => standardMassRatio_of_modelMassRatio Formalism.HermitianLattices.SiegelMassBounds.siegel_mass_ratio)
    (fun _ hT x i => ⟨theorem_two_of_volume_ratio (Fm.D x i)
        (rh_editor_volRatio_no_genus (Fm.D x i) (hT x i) (hV x i)
          (unitSplit_of_landherr (Fm.D x i) (hL x i))) (hT x i),
      rh_editor_definite_volume_no_genus (Fm.D x i) (hT x i) (hV x i)⟩)
    (fun hA x i => theorem_three_all_unitary (Fm.D x i) C3 hC3 (hR x i).cdScale (hHC x i) (hA x i).2.2)
    (fun x hx i => levels_pro_g (Fm.D x i) (Fm.ex x hx i).lev)
    hN
    (fun x i => Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.landherrSmall_of_hasse (Fm.D x i) (landherrHasse_of_sig (Fm.D x i) (hL x i)))

rh_scan rh_editor_stmtF_without_genus limit 2000
rh_prune rh_editor_stmtF_without_genus as RHEditorPacketPruned
#print axioms rh_editor_stmtF_without_genus
#print axioms rh_editor_volRatio_no_genus
#print axioms rh_editor_stdpos_volume_native_class
end Formalism.L2.GlobalTheoryTheory.GenusMassVolumes.ClosedKudlaFamilyStandardLattice
