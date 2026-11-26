import RH43SignedDefectCountCallers

/-!
Lane 15 RUN44, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, AGENTS, SWARM,
HANDOFF, EXPANSION, living proof and recent peer commit list consulted.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.
LinkMin.lean b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f, lines 725-815.
Prior editor 8c83c6328da417d5d8ab8d364296610cecc81ce8,
blob 135e26b8b071b53349c6ae43f3de4afbe36d24a8.
Stage RUN43 as RH43SignedDefectCountCallers.lean after RUN42 and engines.

Actual new caller propagation: the old family_of_global_sources invokes
linkGLOBAL7_min, whose two mass inputs are consumed ONLY in the
division_level_prime_family invocation. The separate items_of_min has
the same use. Replace those two inputs by the one uniform RH43FamilyBudget
on the identical Fm. This removes the need for BOTH VolumeRatio₂ and
DefiniteVolumeEqMass at THIS upper caller, not globally. Their original
massRatio_of_definiteVolume / volumeY0EqualsMass_of_aux2v calls are
absent in the overlay. All rank, slope, weight, local integrality,
free module and congruence premises are unchanged. No new choice of Fm.

Original source-visible graph:
family_of_global_sources -> linkGLOBAL7_min -> division_level_prime_family
  -> MassRatio₂, BaseVolumeEqualsMass
family_of_global_sources -> [massRatio_of_definiteVolume,
  volumeY0EqualsMass_of_aux2v] -> VolumeRatio₂, DefiniteVolumeEqMass.
Alternative items_of_min -> division_level_prime_family, same mass inputs.
Overlay:
rh44_family_of_global_sources -> rh44_linkGLOBAL7_min
  -> rh43_division_level_prime_family -> RH43FamilyBudget;
rh44_items_of_min -> same supplier.
Retain linkGLOBAL7_items, family_part_five_of_explicit_constants, all
other source and elaborated type/value/constructor edges, original fallback
and independent mass-error consumers. Context key pin,toolchain, Fm,eps,
x,i,D,sc,k,m,r,f,host,word,Cabs,CH,C0,C5,consumer. No global deletion
or root retirement until replay and parent substitution.

New sufficient geometric test: for positive V,M and F=f*k>0,
if a,b>=0, V>=M*exp(-a), V<=M*exp(b), a<=2LF, b<=mF,
then the exact log defect log(V/M) is in [-2LF,mF].
Even a common scalar calibration c>0 cancels BEFORE logarithms if both
V and M are scaled by c. In particular exact equality is sufficient,
but an estimate of endpoint ratio in this exponential interval suffices
for this consumer. Here M=massI(D,k)*prod ratioH; positivity cannot be
dropped. This is a sufficient test, not an established endpoint estimate.
Peer geometry fac11f418a5e2e369bd411e720f539c1341739af traces SW rank-one
normalization using cofinal density growth (fibre bridge still open);
theta f296aa34449f61b64e628744d7efe5a1cb8be6c1 constructs normalized
finite Haar (Tamagawa transport remains). Do not assume either overlay
verified. Other recent peers integration ce4476bd, audit 6e70b2a0,
Galois 24e7f2d1, literature cbb7d21f, character 182be28b noted.
No URT comparison because deterministic substitution suffices.

Executed 24 source hash/unique replacement/guard checks in V8, all matched.
Not a kernel test. Local Lean/Lake absent. Actual prior status.json outputs
retrieved, runs 45577239749 and 45576756833 pass/returncode 0,
blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717. Those checks are baseline
only, not evidence for this file. Baseline axiom evidence propext,
Classical.choice, Quot.sound; 324 scan nodes pending. No new axiom claim.

RESUME HERE: integrate the same-host finite Haar and rank-one SW fibre
bridge into a proof of the positive endpoint ratio bound; replay RUN42-44
and inspect parent call to family_of_global_sources, preserving independent
mass-error, CountI/II/Vs, same-host Sha/TopG/J/VWin and prime inequality.
HANDOFF TO integration, geometry, theta, kernel, audit.
-/

noncomputable section
namespace Formalism.MainNotions
open Formalism.BasicNotions Formalism.MainNotions.Lnk Formalism.MainNotions.GlobalTheoryTheory Formalism.L2.GlobalTheoryTheory
variable {eps : ℝ}

theorem rh44_endpoint_log_budget (V M F L m a b : ℝ)
    (hV : 0 < V) (hM : 0 < M)
    (hl : M * Real.exp (-a) ≤ V) (hu : V ≤ M * Real.exp b)
    (ha : a ≤ 2 * L * F) (hb : b ≤ m * F) :
    -2 * L * F ≤ Real.log (V / M) ∧ Real.log (V / M) ≤ m * F := by
  have hl' : Real.exp (-a) ≤ V / M := (le_div_iff₀ hM).2 (by simpa [mul_comm] using hl)
  have hu' : V / M ≤ Real.exp b := (div_le_iff₀ hM).2 (by simpa [mul_comm] using hu)
  have al := Real.log_le_log (Real.exp_pos (-a)) hl'
  have au := Real.log_le_log (div_pos hV hM) hu'
  rw [Real.log_exp] at al au
  constructor <;> linarith

theorem rh44_common_calibration (V M c : ℝ) (hM : M ≠ 0) (hc : c ≠ 0) :
    Real.log ((c * V) / (c * M)) = Real.log (V / M) := by
  congr 1
  field_simp [hc, hM]

theorem rh44_linkGLOBAL7_min (Fm : FamP eps) (Cabs CH C0 C5 : ℝ) (hCabs : 0 ≤ Cabs) (hCH : 0 < CH) (hC0 : 3 ≤ C0)

    (hbudget : StandardLattice.RH43FamilyBudget Fm) (h3 : flipTwoThree.fam0 Fm StandardLattice.SigmaDegreeTwoSidedBoundOfGap)

    (hZa : flipTwoThree.FamilySlopeLowerOpenPart Fm) (hZb : flipTwoThree.FamilySlopeMaxOpenPart Fm C5)
    (tCV : ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (i : Fm.Ix x) u, Nonempty (flipTwoThree.ColVal (Fm.D x i) u))

    (hW : FamU Fm fun D u => Nonempty (product_first_zeroth_parts.FreeT D u)) (hμ : FamU Fm product_first_zeroth_parts.SlopeLine)

    (hI : FamU Fm LocalLatticeBases.HeckeIntegralLevelZero) (hR : FamU Fm LocalLatticeBases.HeckeRamifiedLevelZero) (hB : FamU Fm LocalLatticeBases.SecondBranchInclusionLength) :
    TuSize Fm → LinkGLOBAL7 Fm Cabs CH C0 Cabs 0 :=
  linkGLOBAL7_items Fm Cabs CH C0 hCabs hCH hC0 (family_part_five_of_explicit_constants Fm (StandardLattice.rh43_division_level_prime_family Fm hbudget h3))
    (flipTwoThree.familySlopeLower_of_open Fm hZa) (flipTwoThree.familySlopeMax_of_open Fm C5 hZb) tCV
    ((hW.and hμ).mono fun _ _ hS h => by obtain ⟨⟨W⟩, hm⟩ := h; exact product_first_zeroth_parts.division_side_conditions_at_sizeData hS W hm)
    ((hB.and (hI.and hR)).mono fun _ _ hS h => LocalLatticeBases.congruence_no_kernel_minimal hS h.1 h.2.1 h.2.2)

theorem rh44_items_of_min (Fm : FamP eps) (C5 : ℝ)
    (hbudget : StandardLattice.RH43FamilyBudget Fm) (h3 : flipTwoThree.fam0 Fm StandardLattice.SigmaDegreeTwoSidedBoundOfGap)
    (hZa : flipTwoThree.FamilySlopeLowerOpenPart Fm) (hZb : flipTwoThree.FamilySlopeMaxOpenPart Fm C5)
    (hW : FamU Fm fun D u => Nonempty (product_first_zeroth_parts.FreeT D u)) (hμ : FamU Fm product_first_zeroth_parts.SlopeLine)
    (hI : FamU Fm LocalLatticeBases.HeckeIntegralLevelZero) (hR : FamU Fm LocalLatticeBases.HeckeRamifiedLevelZero) (hB : FamU Fm LocalLatticeBases.SecondBranchInclusionLength) :
    StandardLattice.PartFiveFamilyBounds Fm ∧ flipTwoThree.ConclusionF5 Fm ∧ flipTwoThree.ConclusionF6 Fm ∧ FamU Fm product_first_zeroth_parts.family_property_and ∧ FamU Fm LocalLatticeBases.CongruenceLatticeLengthBound :=
  ⟨family_part_five_of_explicit_constants Fm (StandardLattice.rh43_division_level_prime_family Fm hbudget h3), flipTwoThree.familySlopeLower_of_open Fm hZa, flipTwoThree.familySlopeMax_of_open Fm C5 hZb,
    (hW.and hμ).mono fun _ _ hS h => by obtain ⟨⟨W⟩, hm⟩ := h; exact product_first_zeroth_parts.division_side_conditions_at_sizeData hS W hm,
    (hB.and (hI.and hR)).mono fun _ _ hS h => LocalLatticeBases.congruence_no_kernel_minimal hS h.1 h.2.1 h.2.2⟩

theorem rh44_family_of_global_sources (Fm : FamP eps) (Cabs CH C0 : ℝ) (hCabs : 0 ≤ Cabs) (hCH : 0 < CH) (hC0 : 3 ≤ C0)

    (hbudget : StandardLattice.RH43FamilyBudget Fm)

    (h3S : flipTwoThree.fam0 Fm StandardLattice.DiscreteSeriesDegreeBoundsOfGap) (hWK : DiscreteSeriesWeylDimension.WeylForK) (hLK : DiscreteSeriesWeylDimension.LowKMultOne) (tDs : flipTwoThree.fam0 Fm StandardLattice.DsigEx)

    (hCS : flipTwoThree.fam0 Fm flipTwoThree.ColSlopeEq) (hSMx : flipTwoThree.fam0 Fm flipTwoThree.SlopeMaxGiven)
    (tCV : ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (i : Fm.Ix x) u, Nonempty (flipTwoThree.ColVal (Fm.D x i) u))

    (hW : FamU Fm fun D u => Nonempty (product_first_zeroth_parts.FreeT D u)) (hμ : FamU Fm product_first_zeroth_parts.SlopeLine) (hB : FamU Fm product_first_zeroth_parts.LemB)

    (hI : FamU Fm product_first_zeroth_parts.IntAtT) (hFi : FamU Fm product_first_zeroth_parts.FiSt) (hX : FamU Fm product_first_zeroth_parts.CrossDia) (hU : FamU Fm product_first_zeroth_parts.UnfAll) :
    TuSize Fm → LinkGLOBAL7 Fm Cabs CH C0 Cabs 0 :=
  rh44_linkGLOBAL7_min Fm Cabs CH C0 4 hCabs hCH hC0 hbudget
    (family_property_mono (low_weight_bound_at h3S tDs) fun D h => StandardLattice.theorem_three_sigma_holds D h.1 (DiscreteSeriesWeylDimension.lowest_K_type_count_of_weyl D hWK hLK) h.2)
    (flipTwoThree.familySlopeLowerOpen_of_std flipTwoThree.stdSlopeLow_holds flipTwoThree.hookBound_holds Fm hCS) (flipTwoThree.family_slope_bound_of_max_slope flipTwoThree.hookBound_holds Fm hSMx) tCV hW hμ
    (hI.mono fun _ _ _ h => fun w hw hs v => h 0 (Nat.zero_le _) w hw hs v)
    ((hFi.and (hX.and hU)).mono fun _ _ _ h => fun v φ hφ => by
      have h9 := product_first_zeroth_parts.ram_of h.1 (product_first_zeroth_parts.DiaMul_of h.1 h.2.2) h.2.1 h.2.2 0 (Nat.zero_le _) v φ hφ
      exact ⟨h9.1, h9.2.1, h9.2.2.2.2.2⟩)
    (hB.mono fun _ _ _ h => LocalLatticeBases.secondBranchInclusionLength_of_lemB h)

-- Actual context: bounded engine search with deterministic native fallback.
theorem rh44_replay (Fm : FamP eps) (Cabs CH C0 C5 : ℝ)
    (hCabs : 0 ≤ Cabs) (hCH : 0 < CH) (hC0 : 3 ≤ C0)
    (hbudget : StandardLattice.RH43FamilyBudget Fm)
    (h3 : flipTwoThree.fam0 Fm StandardLattice.SigmaDegreeTwoSidedBoundOfGap)
    (hZa : flipTwoThree.FamilySlopeLowerOpenPart Fm) (hZb : flipTwoThree.FamilySlopeMaxOpenPart Fm C5)
    (tCV : ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (i : Fm.Ix x) u, Nonempty (flipTwoThree.ColVal (Fm.D x i) u))
    (hW : FamU Fm fun D u => Nonempty (product_first_zeroth_parts.FreeT D u)) (hμ : FamU Fm product_first_zeroth_parts.SlopeLine)
    (hI : FamU Fm LocalLatticeBases.HeckeIntegralLevelZero) (hR : FamU Fm LocalLatticeBases.HeckeRamifiedLevelZero) (hB : FamU Fm LocalLatticeBases.SecondBranchInclusionLength) :
    TuSize Fm → LinkGLOBAL7 Fm Cabs CH C0 Cabs 0 := by
  first
  | (rh_reduce 2 using [rh44_linkGLOBAL7_min]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh44_linkGLOBAL7_min Fm Cabs CH C0 C5 hCabs hCH hC0 hbudget h3 hZa hZb tCV hW hμ hI hR hB

rh_scan family_of_global_sources limit 2000
rh_scan rh44_family_of_global_sources limit 2000
rh_prune rh44_family_of_global_sources as RH44GlobalSourcesPruned
#print axioms family_of_global_sources
#print axioms rh44_endpoint_log_budget
#print axioms rh44_linkGLOBAL7_min
#print axioms rh44_items_of_min
#print axioms rh44_family_of_global_sources
end Formalism.MainNotions
