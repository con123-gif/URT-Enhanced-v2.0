import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.MemGalOfQuadraticOfFixesDiscrRootsOfUnity

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N GlobalTheory.GalOfCusp UpperTheory.V UpperTheory.V.Af UpperTheory.V.HV GlobalTheory.Ord2
open UpperTheory.V.Z.Kato UpperTheory.V.Z.Kato.WeilSphericalRecords
open UpperTheory.V.Z.Win UpperTheory.Zero.LLC

/-!
Lane 12, 25 Nov 2026, run 11. SOURCE-MATCHED HUMAN DERIVATION / PREPARED LEAN, not compiled.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4. Previous lane 6c92b85bac6ae3bf75dc6e7af00ed12271f89a73.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Read mission, SWARM, HANDOFF, AGENTS, continuity/state/log/protocol openings; compared 16 peer commits and read Galois, audit, math, integration and kernel checkpoints.
Correction: prior KatoUseN route is not authenticated as root-reachable. Actual VWin uses KatoTwoW, not KatoTwo; it retains WitAQ and RigidityFirstCase/RigiditySecondCase. Backtrack to this actual producer.
Exact reduction: d=|disc K| is positive odd, since gcd(d,N)=1 and N even. Native quadratic Gauss-sum theorem gives Fix(mu_d) subset Gal(Omega/K) = ker theta = ker(det W). Thus d is a common explicit conductor witness for both actual applications. No need for two generic open abelian kernel conductor searches at these sites. No continuity, irreducibility, modularity, admissibility, theta twist or spherical witness assumption removed. General KatoUseN not assumed. Same K, Omega, l, e, N, theta, psi, W, u, iota, f and hf throughout; cache only in this exact context and source/toolchain.
Original and reduced selected graphs:
Original direct source path (not full kernel DAG):
  vwin_of_row -> automorphic_window_of_inputs -> v_window_of_depth_zero_residual_bc_cm
  -> v_window_of_literal_automorphy_n -> v_window_of_automorphy_csd_ss_mono_odd
  -> vwin_of_hypotheses_H_E_alt -> count_i_of_printed_bound_k_kato_automorphy
  -> oneCharU_of_katoTwoW_rig_admI_automorphy -> oneChar_unramU
  -> ptHyp_of_autB_of_lemW_of_isBase -> bloch_kato_selmer_vanishes_of_type_ii_modular_ext.
  vwin_of_hypotheses_H_E_alt -> katoTwoW_of_printsH -> katoTwoW_of_printsH_of_rT_of_quadBC2
  -> twoS -> kwAbs; also katoTwoW_of_printsH_of_rT_of_quadBC2 -> kwAbs.
Candidate local overlay:
  rhDep37_vwin_of_hypotheses_H_E_alt -> same count_i consumer and all original siblings
  -> rhDep37_katoTwoW_of_printsH -> rhDep37_katoTwoW_of_printsH_of_rT_of_quadBC2
  -> rhDep37_twoS -> RHDep37.det_conductor; supplier also -> RHDep37.det_conductor.
  det_conductor -> Used.quad, Used.cop, Used.N_even, Used.theta_ker,
  Used.adm determinant equality, mem_galOf_quadratic_of_fixes_discr_roots_of_unity.
  The original generic kwAbs edge may survive elsewhere (including other suppliers).
  No kernel or global obligation retirement; all original graph and axiom evidence retained.
Source ledger (relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
ModularityArgument/ThresholdArguments/DenseThresholdCases/KatoTwoWOfPublishedH.lean 173e543c2fd302a44a7ab1aca9b9d4167d0097c4
ModularityArgument/KatoQuadraticCharacters/SphericalDecomposition/SphAtTw.lean 6d17b39eca35cd05618e8a7d52d9997a3bbee738
ModularityArgument/KatoQuadraticCharacters/KatoTwoOfVanishOrd.lean 2588590ae1690d8c6b837f11e08b7f526ca31fa1
ModularityArgument/KatoQuadraticCharacters/KatoTwoOfUseN.lean d975e25df40233cba796658d93392b77b743cb72
UnitaryThreeGroups/MemGalOfQuadraticOfFixesDiscrRootsOfUnity.lean bb7d61ac95607d8e02a2469613053d97b402d17c
ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
ModularityArgument/ThresholdArguments/DenseThresholdCases/FPtHypU.lean 691a4043b5e6b8345da617fa616e4f46c7da07f8
ModularityArgument/ThresholdArguments/DenseThresholdCases/TopMainZj.lean 23b7a05606074da30e6f8eb3b3821e877a968d3e
ModularityArgument/KatoQuadraticCharacters/SphericalDecomposition/KatoTwoW.lean 3d30a9b6d531fa4091c0b1fc60922672889b9c33
Executed 49 fail-on-error JS checks including 11 pinned blob comparisons, native call sites, unique substitutions and exact reverse reconstruction, and retained sibling guards. No numerical tests needed for this exact implication. Native Lean/lake absent locally, source clone DNS failed. Conditional root baseline CI status independently reread (45577239749); NOT evidence of this candidate. No new CI run queued or verified here. Prepared source overlay only. Existing original source/axiom ledgers unchanged.
RESUME HERE: compile this exact file in the existing pinned Lean runner (engines on LEAN_PATH), inspect actual scan/prune and axiom output, then trace actual TypeII modular-ext supplier and RigidityFirstCase/RigiditySecondCase; use rh_reduce/rh_auto/rh_auto_frontier on actual typed conductor premise after replay. If overlay fails, preserve original route. No RH closure, no URT gain.
HANDOFF TO integration, kernel extractor, Galois and audit. 
-/
namespace RHDep37

theorem det_conductor {l : ℕ} [Fact l.Prime] {Ω : Type} [Field Ω] [CharZero Ω]
    [IsAlgClosure ℚ Ω] {K : Type} [Field K] [NumberField K] [Algebra K Ω]
    {e N : ℕ} {θ ψ : G ℚ Ω →* (Qbar l)ˣ}
    {W : G ℚ Ω →* GL (Fin 2) (Qbar l)}
    (u : Used l Ω K e N θ ψ W) (hdt : dt W = θ) :
    1 ≤ (discr K).natAbs ∧ KillsMu (discr K).natAbs (dt W) := by
  have hodd : Odd (discr K).natAbs :=
    Nat.coprime_two_right.1 (u.cop.coprime_dvd_right u.N_even.two_dvd)
  refine ⟨Int.natAbs_pos.2 (discr_ne_zero K), ?_⟩
  rw [hdt]
  intro g hg
  have hk : g ∈ θ.ker := by
    rw [u.θ_ker]
    exact UpperTheory.mem_galOf_quadratic_of_fixes_discr_roots_of_unity Ω K u.quad hodd g hg
  exact MonoidHom.mem_ker.mp hk

end RHDep37

private theorem rhDep37_sphAt_tw {l : ℕ} [Fact l.Prime] {Ω : Type} [Field Ω] [Algebra ℚ Ω] {ι : Qbar l ≃+* ℂ} {e : ℕ} {W : R2 Ω l}
    (h : SphAt ι e W) {N : ℕ} {θ : G ℚ Ω →* (Qbar l)ˣ} (hN : 1 ≤ N) (hθ : KillsMu N θ) : SphAt ι e (Af.tw W θ) := by
  intro M φ hM hφ
  rw [TwDet.tw_tw]
  exact h (M * N) (φ * θ) (Nat.mul_pos hM hN)
    (TwDet.killsMu_mul (TwDet.killsMu_dvd hφ (dvd_mul_right M N)) (TwDet.killsMu_dvd hθ (dvd_mul_left N M)))

theorem UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_twoS :
    GlobalTheory.Mem.LiteralAutomorphy.LitCoh → SrcS → KatoTwoS := by
  intro hC hSrc l _ Ω _ _ _ K _ _ _ e N θ ψ W u ι f hf hS
  have hV : VanishOrdL := GlobalTheory.Ord2.vanishOrdL_of_zetaUr hC Final.zetaUr
  obtain ⟨hdt, ha⟩ := u.adm hf
  have h1 : Af.tw W 1 = W := by
    ext s i j
    change mat (Af.tw W 1) s i j = mat W s i j
    rw [TwDet.tw_coe]
    simp
  refine ⟨?_, ?_⟩
  · rw [h1]
    exact hV l u.l_odd Ω ι e u.e_pos W ha (hSrc l Ω ι e W u.l_odd u.e_pos ha hS)
  · rw [← hdt]
    obtain ⟨hM, hMk⟩ := RHDep37.det_conductor u hdt
    have ha' := admissible_twist_by_det l Ω ι e W ha
    exact hV l u.l_odd Ω ι e u.e_pos _ ha'
      (hSrc l Ω ι e _ u.l_odd u.e_pos ha' (rhDep37_sphAt_tw hS hM hMk))

namespace UpperTheory.V.Z.Kato.WeilSphericalRecords
theorem rhDep37_katoTwoW_of_printsH_of_rT_of_quadBC2 (P : _root_.UpperTheory.V.Af.HypothesesH') (hR : RowT) (hQ : Z.Bc.QuadBC2) : KatoTwoW := by
  intro l _ Ω _ _ _ K _ _ _ e N θ ψ W u ι f hf hW
  have hL := _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.locQ_of_alt P.toClassicalTheorems hR hQ
  obtain ⟨hdt, ha⟩ := u.adm hf
  refine rhDep37_twoS P.toClassicalTheorems.litN.coh (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.srcS_alt P (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.twNew_alt P) (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.frobRoot_alt P.toClassicalTheorems hL)) l Ω K e N θ ψ W u ι f hf ?_
  refine sphOfWit (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.twWit_alt P.toClassicalTheorems (_root_.UpperTheory.V.Z.Win.aIsoTwOf_alt flagLaws Z.ImaginaryQuadraticEtaCharacter.winTw)) hL l u.l_odd Ω ι e u.e_pos W ha.cont
    (GlobalTheory.Ord2.IrrTransfer.isIrr_of_range W (W.comp (GlobalTheory.Ord2.H0g W).subtype) (fun s => ⟨(s : G ℚ Ω), rfl⟩) ha.irr) ?_ hW
  obtain ⟨hM, hMk⟩ := RHDep37.det_conductor u hdt
  exact ⟨(discr K).natAbs, hM, hMk⟩
theorem rhDep37_katoTwoW_of_printsH (P : _root_.UpperTheory.V.Af.HypothesesH') : KatoTwoW :=
  _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_katoTwoW_of_printsH_of_rT_of_quadBC2 P (_root_.UpperTheory.Gal.SV.rowOf' P.toClassicalTheorems.litN.aut.gal) UpperTheory.ConvolutionTheory.R2.quadBC2

end UpperTheory.V.Z.Kato.WeilSphericalRecords

open UpperTheory.Top
namespace UpperTheory.V.HV.DescentVanishingReductions
theorem rhDep37_vwin_of_hypotheses_H_E_alt (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin :=
  have hK := _root_.UpperTheory.V.ZK.lemmaK_litN_alt hH.litN
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.of_four_alt hH.litN hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

end UpperTheory.V.HV.DescentVanishingReductions

#print axioms RHDep37.det_conductor
#print axioms UpperTheory.V.Z.Kato.WeilSphericalRecords.twoS
#print axioms UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_twoS
#print axioms UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH
#print axioms UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_katoTwoW_of_printsH
#print axioms UpperTheory.V.HV.DescentVanishingReductions.rhDep37_vwin_of_hypotheses_H_E_alt
rh_scan UpperTheory.V.Z.Kato.WeilSphericalRecords.twoS limit 2000
rh_scan UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_twoS limit 2000
rh_scan UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH limit 2000
rh_scan UpperTheory.V.Z.Kato.WeilSphericalRecords.rhDep37_katoTwoW_of_printsH limit 2000
rh_prune RHDep37.det_conductor as RHDep37.det_conductor_pruned
