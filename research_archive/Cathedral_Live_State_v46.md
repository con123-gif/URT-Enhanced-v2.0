# Newton's Cathedral / URT — Canonical Live State

**Owner:** Cornelius Lytollis  
**Canonical project:** Newton's Cathedral / URT  
**Last updated:** 2026-09-07 UTC  
**Purpose:** authoritative resumption checkpoint across chats and context compaction. This is continuity infrastructure, not a paper or a claim of empirical validation.

## 0. Mandatory resume protocol

When Cornelius says **proceed**, **continue**, **pick up**, **finish it**, **our work**, or otherwise refers to prior Cathedral/URT work:

1. Read this file completely before doing mathematics.
2. Read `Cathedral_Master_Index.md`, then `URT_Nature_Checkpoint_2026-08-25/urt_full_claim_ledger.json` for chronology and contradictions.
3. Read the dated solver, `framework_core.py`, and the latest audit named in the relevant section below before modifying a claimed result.
4. Treat this file plus the newest applicable, successfully reproduced certificate as authoritative. Older scripts remain historical evidence and do not override dated corrections or their recorded defects.
5. State the recovered endpoint in one sentence, then continue from the exact **Current frontier** in section 14.
6. If this file or a required certificate cannot be retrieved, say so immediately. Never silently substitute an older endpoint.
7. Preserve status labels: **E** exact/proved for the defined object; **N** numerical certificate; **C** conditional theorem; **P** physical identification open; **F** falsified/no-go; **W** withdrawn/superseded; **U** unresolved.
8. Never revive an **F/W** route without explicitly identifying and proving the new premise that repairs it.
9. Do not fit masses, CKM, PMNS, cosmology, or other observations during a blind derivation. Comparison occurs only after the operator is frozen.
10. Do not merely list an open gate. Attempt its next safe calculation and report the result.
11. Keep answers in the conversation. Do not create a manuscript, PDF, presentation, or collaborator attribution unless Cornelius asks.
12. Do not delegate to other agents unless Cornelius explicitly asks.
13. After every material derivation, update this file with exact equations, residuals, status changes, failed branches, and the next executable calculation.

## 1. Companion sources and read order

Deep history and executable baseline, now co-located in this Cathedral archive:

1. `Cathedral_Master_Index.md` — archive map, precedence, integrity warnings and source gaps.
2. `URT_Nature_Checkpoint_2026-08-25/urt_full_claim_ledger.json` — complete recoverable chronology, claims, dependencies and contradictions through 2026-08-25.
3. `URT_Nature_Checkpoint_2026-08-25/urt_nature_solver.py`, its results, manifest and reproducibility matrix — dated frozen checkpoint, not the post-Hopf frontier.
4. `framework_core.py` — compact reconstructed framework and response layer, subject to the recorded regressions below.
5. `URT_Nature_Checkpoint_2026-08-25/urt_blind_dirac_gate.json` — exact pre-Hopf finite-Dirac underdetermination certificate.
6. `lytollis_urt_operator_closure_audit.py` — reconstructed (A_5), Clebsch, hidden-quartet, charge-word, vacuum and finite-amplitude definitions.
7. `cathedral_master_verifier.py` — exterior Gibbs, Hopf-spacetime, curvature and other theorem certificates.
8. `hopf_dirac_continuation.py` and `cathedral_hopf_dirac_results.json` — 2026-08-28 Hopf link, (2I), endpoint gauge covariance, passive-prior and minimal joint-history no-go.
9. `urt_wilson_history_continuation.py` and `urt_wilson_history_results.json` — 2026-08-28 equivariant dyadic/Wilson coding, dual Hopf channel, full directed-edge frame, ordered five-cycle invariant, KO-6 underdetermination and blind flavour no-go.
10. `urt_orientation_pfaffian_continuation.py` and `urt_orientation_pfaffian_results.json` — 2026-09-03 exhaustive degree-five branch invariant classification, KO-6 branch-orientation lift and Pfaffian-coefficient underdetermination theorem.
11. `urt_chiral_dirac_continuation.py` and `urt_chiral_dirac_results.json` — 2026-09-03 full-history reversal chirality, Ginsparg--Wilson hopping obstruction, physical chiral half-spaces, fermion-measure ambiguity and (A_4\)-root overlap/doubler theorem.
12. `urt_determinant_line_continuation.py` and `urt_determinant_line_results.json` — 2026-09-03 determinant zero-divisor/winding calculation, regulator transition and anomaly-insufficiency theorem.
13. `urt_haar_dilation_continuation.py` and `urt_haar_dilation_results.json` — 2026-09-03 canonical Haar edge isometries, Szegedy GW walk, chiral-rank defect and Stinespring-completion no-go.
14. `urt_polar_history_continuation.py` and `urt_polar_history_results.json` — 2026-09-03 exact polar factorization of the Haar transfer, covariant GW lift, zero-mode and orientation-erasure no-go.
15. `urt_microscopic_axiom_audit.py` and `urt_microscopic_axiom_audit_results.json` — 2026-09-03 foundational source audit, positive-cost flux-even theorem, modular/KMS circularity and explicit axiom boundary.
16. `urt_domain_wall_history_continuation.py` and `urt_domain_wall_history_results.json` — 2026-09-03 oriented domain-wall candidate, exact local-history-boundary obstruction, finite-wall/overlap witnesses and uniqueness no-go.
17. `urt_nonlocal_boundary_projector_continuation.py` and `urt_nonlocal_boundary_projector_results.json` — 2026-09-03 complete regular-representation classification of equivariant rank-12 projectors, principal spectral-band candidate and nonlocal uniqueness no-go.
18. `urt_a4_minimax_locality_continuation.py` and `urt_a4_minimax_locality_results.json` — 2026-09-03 target-blind spectral-conditioning extremum for the normalized A4 overlap family, with an algebraic candidate Wilson coefficient and explicit proof obligation.
19. `urt_a4_lower_envelope_proof.py` and `urt_a4_lower_envelope_proof_results.json` — 2026-09-03 exact five-phase lower-envelope proof, equality classification and rational isolation of the conditional minimax root.
20. `urt_a4_complex_locality_continuation.py` and `urt_a4_complex_locality_results.json` — 2026-09-03 complex-momentum overlap singularity audit comparing spectral conditioning with an (A_5)-invariant analytic-radius proxy.
21. `urt_a4_complex_kkt_continuation.py` and `urt_a4_complex_kkt_results.json` — 2026-09-03 symmetric Laurent/KKT derivation and full tangent-Hessian audit of the (1+1+3) complex singularity.
22. `urt_relaxation_selector_continuation.py` and `urt_relaxation_selector_results.json` — 2026-09-04 exact URT uniform-contraction selector consequence and a conservative certified complex zero-free strip at the selected kernel.
23. `urt_history_contraction_no_go.py` and `urt_history_contraction_no_go_results.json` — 2026-09-04 exact proof that the same contraction selector drives the history Möbius family to the orientation-blind boundary operator rather than selecting a nontrivial history kernel.
24. `urt_joint_action_invariant_no_go.py` and `urt_joint_action_invariant_no_go_results.json` — 2026-09-04 lowest-degree joint invariant classification and exact proof that common normalization and the declared symmetries leave the determinant-line coefficient continuous.
25. `urt_anomaly_inflow_no_go.py` and `urt_anomaly_inflow_no_go_results.json` — 2026-09-04 exact local-anomaly arithmetic plus the established vanishing fifth spin-bordism result for the \(\mathbb Z_6\)-quotient gauge group, proving that anomaly inflow cannot select the remaining local measure phase.
26. `urt_icosahedral_seed_uniqueness.py` and `urt_icosahedral_seed_uniqueness_results.json` — 2026-09-04 exact conditional uniqueness theorem for the antipodal 12-direction second/fourth-isotropic shell and simultaneous derivation of the \(1/20,2/5\) kinetic weights.
27. `urt_a4_gauge_action_closure.py` and `urt_a4_gauge_action_closure_results.json` — 2026-09-04 shortest-loop classification on the \(A_4\) root lattice, exact bivector tight frame and conditional uniqueness of the one-parent-trace Wilson gauge action.
28. `urt_gauge_coupling_scale_no_go.py` and `urt_gauge_coupling_scale_no_go_results.json` — 2026-09-04 exact scale-circularity and monotonicity proof showing that the relative-information functional does not select a nonzero absolute bare gauge coupling.
29. `urt_gravity_normalization_no_go.py` and `urt_gravity_normalization_no_go_results.json` — 2026-09-04 exact two-derivative metric-action classification, trace-free projection, Gibbs vacuum-shift invariance and conservation counterexample proving that the present entropy/curvature data do not select \(G/a_*^2\) or \(\Lambda a_*^2\).
30. `urt_su5_adjoint_breaking_no_go.py` and `urt_su5_adjoint_breaking_no_go_results.json` — 2026-09-04 complete generic stationary-stratum classification for a renormalizable \(SU(5)\) adjoint potential and an exact proof that an allowed quartic coefficient selects between the \(3+2\) and \(4+1\) global vacua.
31. `urt_born_measurement_boundary.py` and `urt_born_measurement_boundary_results.json` — 2026-09-04 explicit continuous unitary-covariant non-Born family plus the precise conditional Gleason closure on the 16-dimensional exterior carrier.
32. `urt_icosahedral_continuum_stencil.py` and `urt_icosahedral_continuum_stencil_results.json` — 2026-09-04 exact derivation of the antipodal moment premises from a self-adjoint fourth-order-isotropic propagation symbol, conditional Gaussian weight closure, sixth-order anisotropy and the rank-three crystallographic obstruction.
33. `urt_a4_bivector_icosahedral_lift.py` and `urt_a4_bivector_icosahedral_lift_results.json` — 2026-09-04 exact minimal rank-six cut-and-project origin of the twelve icosahedral directions from the six order-five fixed axes in \(\Lambda^2A_4=3\oplus3'\).
34. `urt_cut_project_window_no_go.py` and `urt_cut_project_window_no_go_results.json` — 2026-09-04 continuous fixed-volume acceptance-window family, compact-window uniform-streaming no-go and exact short-vector classification for \(\Lambda^2A_4\).
35. `urt_ball_window_markov_repair.py` and `urt_ball_window_markov_repair_results.json` — 2026-09-04 conditional isoperimetric ball-window radius closure and reversible proposal/rejection kernel with exact averaged \(13\)-state weights.
36. `urt_ball_window_homogenization_no_go.py` and `urt_ball_window_homogenization_no_go_results.json` — 2026-09-04 strict corrector theorem proving that graph correlations renormalize the naive \(c_s^2=1/5\) continuum coefficient.
37. `urt_clock_orientation_scale_no_go.py` and `urt_clock_orientation_scale_no_go_results.json` — 2026-09-04 separation of reversible history, entropy arrow and Lorentz time orientation, with an exact positive generator-rescaling no-go for a physical clock rate.
38. `urt_master_affine_identifiability_no_go.py` and `urt_master_affine_identifiability_no_go_results.json` — 2026-09-04 master affine-cost quotient and conservative audit of ten continuous sector choices still unconstrained by the proved kinematics.
39. `urt_entropy_spectral_action_audit.py` and `urt_entropy_spectral_action_audit_results.json` — 2026-09-04 generic cutoff-moment independence, universal fermionic-entropy cutoff moments and exact finite Cathedral KMS factorizations.
40. `urt_kms_geometry_selection_no_go.py` and `urt_kms_geometry_selection_no_go_results.json` — 2026-09-04 exact passive-state reconstruction of the scalar positive generator, signed-Dirac ambiguity and hidden-eigenspace moduli.
41. `urt_entropy_dirac_scale_no_go.py` and `urt_entropy_dirac_scale_no_go_results.json` — 2026-09-04 strict entropy scale-orbit monotonicity and exact beta--Dirac identifiability no-go.
42. `urt_quasifree_gibbs_merger.py` and `urt_quasifree_gibbs_merger_results.json` — 2026-09-04 exact noncommuting quasi-free relative-information merger, inverse response map and second-quantization codimension theorem.
43. `urt_history_kms_type_mismatch.py` and `urt_history_kms_type_mismatch_results.json` — 2026-09-04 exact proof that the normalized Cathedral history heat states are one-particle-conditioned, rather than full, fermionic KMS states.
44. `urt_occupancy_chemical_potential_audit.py` and `urt_occupancy_chemical_potential_audit_results.json` — 2026-09-04 complete intrinsic occupancy-selector audit: symmetry continuum, Hodge incompatibility and conditioning erasure.
45. `urt_monoidal_fock_extension_obstruction.py` and `urt_monoidal_fock_extension_obstruction_results.json` — 2026-09-04 strongest parameter-free full-Fock extension and exact failure to descend to the master identity-shift quotient.
46. `urt_a4_time_reflection_closure.py` and `urt_a4_time_reflection_closure_results.json` — 2026-09-04 unique minimal two-coset closure of the \(A_4\) root lattice under the selected time reflection, its 28-direction short graph and exact \(3/5:2/5\) orbit weights.
47. `urt_reflection_positive_wilson_kernel.py` and `urt_reflection_positive_wilson_kernel_results.json` — 2026-09-04 first free Wilson/overlap construction on cubic slices with half-cube temporal incidence; its copied pre-reflection \(r\) and unit-layer normalization are superseded below.
48. `urt_os_reflection_phase_selector.py` and `urt_os_reflection_phase_selector_results.json` — 2026-09-04 exact anti-linear OS elimination of the reflection-even local \(\chi\Omega_5\) phase.
49. `urt_entropy_gauge_normalization.py` and `urt_entropy_gauge_normalization_results.json` — 2026-09-04 conditional entropy-cutoff gauge normalization and exact survival of the overall action/trace normalization.
50. `urt_entropy_gravity_normalization.py` and `urt_entropy_gravity_normalization_results.json` — 2026-09-04 conditional entropy spectral-action values for \(G\Lambda^2\) and \(\Lambda_E/\Lambda^2\), with the remaining normalization and finite-Dirac invariants explicit.
51. `urt_reflection_positive_gauge_action.py` and `urt_reflection_positive_gauge_action_results.json` — 2026-09-04 compact site-OS Wilson gauge action and exact plaquette frame; its inherited-metric \(6:1\) ratio is one branch, not the joint selected cone.
52. `urt_os_chiral_measure_global_audit.py` and `urt_os_chiral_measure_global_audit_results.json` — 2026-09-04 local/global anomaly closure and exact survival of the reflection-odd topological \(\theta\) angle.
53. `urt_gauge_covariant_overlap_admissibility.py` and `urt_gauge_covariant_overlap_admissibility_results.json` — 2026-09-04 gauge-covariant polar overlap and a conservative link-small gap chart; its old kernel parameters are superseded below.
54. `urt_entropy_su5_breaking_audit.py` and `urt_entropy_su5_breaking_audit_results.json` — 2026-09-04 corrected \(5,16,24\) trace identities and proof that bare binary entropy supplies neither a finite breaking radius nor a representation-independent \(3+2\) vacuum.
55. `urt_lorentz_cone_matching.py` and `urt_lorentz_cone_matching_results.json` — 2026-09-04 common gauge/fermion cone equations, exposure of the inconsistent \(c_t=1\) plus \(6:1\) pairing, and the initially unresolved anisotropic-overlap OS step.
56. `urt_anisotropic_overlap_os_region.py` and `urt_anisotropic_overlap_os_region_results.json` — 2026-09-04 exact anisotropic free-overlap OS height region, a direct negative covariance witness at inherited \(M=1\), and the continuous low-height repair.
57. `urt_reflected_kernel_contraction_selector.py` and `urt_reflected_kernel_contraction_selector_results.json` — 2026-09-04 re-optimization of the full reflected kernel and exact proof that uniform contraction leaves a continuous time-aspect interval.
58. `urt_reflected_locality_flat_direction.py` and `urt_reflected_locality_flat_direction_results.json` — 2026-09-04 positive-transfer no-go and general complex-pole searches finding a common \(c_t\)-independent nearest spatial singularity.
59. `urt_interacting_overlap_os_boundary_audit.py` and `urt_interacting_overlap_os_boundary_audit_results.json` — 2026-09-04 calibrated finite gauge-boundary tests distinguishing an invalid fixed-link false lead from valid strict-half and boundary-Haar tests; the interacting proof remains open.
60. `urt_strong_coupling_gauge_invariant_os_audit.py` and `urt_strong_coupling_gauge_invariant_os_audit_results.json` — 2026-09-04 independent-training/holdout, determinant-weighted β=0 (U(1)) scalar-density OS search; the apparent adaptive negative mode is statistically unresolved rather than a counterexample.
61. `urt_clock_universality_quotient.py` and `urt_clock_universality_quotient_results.json` — 2026-09-04 continuum expansion proving that (c_t) first enters the canonically normalized free overlap operator through irrelevant (O(a^2)) terms, conditional on existence of the interacting continuum limit.
62. `urt_strong_coupling_clifford_os_audit.py` and `urt_strong_coupling_clifford_os_audit_results.json` — 2026-09-04 determinant-weighted holdout search over all 16 local Hermitian Clifford bilinears; no finite-cell negative witness was confirmed.
63. `urt_strong_coupling_point_split_os_audit.py` and `urt_strong_coupling_point_split_os_audit_results.json` — 2026-09-04 gauge-covariant holdout search over all 112 elementary positive-half point-split mesons; no finite-cell negative witness was confirmed.
64. `urt_compact_overlap_global_gap_obstruction.py` and `urt_compact_overlap_global_gap_obstruction_results.json` — 2026-09-04 numerical minimization plus exact Hermitian-inertia bracket locating an overlap-kernel sector boundary on the full compact link space.
65. `urt_reflection_positive_admissibility_weight.py` and `urt_reflection_positive_admissibility_weight_results.json` — 2026-09-04 compact-support autocorrelation construction with nonnegative character coefficients, together with the Creutz no-go showing that exact admissibility requires nonanalyticity at the identity.
66. `urt_temporal_link_coherence_obstruction.py` and `urt_temporal_link_coherence_obstruction_results.json` — 2026-09-04 exact four-plus/four-minus future-link field on which the old parallelogram gauge action vanishes while (D_W-M) has four zero modes; the old face set is rejected.
67. `urt_diagonal_coherence_gauge_repair.py` and `urt_diagonal_coherence_gauge_repair_results.json` — 2026-09-04 minimal replacement of the 24 electric parallelograms by 24 elementary triangles, exact face-complete bivector frame and repaired isotropic weights (a/d=2\tau^2-1).
68. `urt_overlap_transfer_admissibility_trilemma.py` and `urt_overlap_transfer_admissibility_trilemma_results.json` — 2026-09-04 exact regulator trilemma: analytic positive-character full support contains explicit polar singularities, whereas exact open-set admissibility in that cone is necessarily nonanalytic.
69. `urt_literal_entropy_coupling_phenomenology.py` and `urt_literal_entropy_coupling_phenomenology_results.json` — 2026-09-04 post-freeze PDG comparison falsifying the literal (c\nu=1) entropy coupling as a high-scale Standard Model common coupling; the previously free normalization must absorb a factor about 24.
70. `urt_triangular_u1_gap_certificate.py` and `urt_triangular_u1_gap_certificate_results.json` — 2026-09-04 exact Fourier, Hodge and Bernstein proof of a nonempty finite (N_t=6,N_s=2), zero-lift (U(1)) triangular admissible domain, with face-angle threshold (0.00298539857027\ldots).
71. `urt_hodge_gap_volume_scaling_no_go.py` and `urt_hodge_gap_volume_scaling_no_go_results.json` — 2026-09-04 exact long-wavelength spectrum proving that the global flat-connection/Hodge gap proof shrinks as (L^{-3}) and cannot supply a volume-uniform admissibility theorem.
72. `urt_local_triangle_coherence_bounds.py` and `urt_local_triangle_coherence_bounds_results.json` — 2026-09-04 volume-independent compact-group shift bounds from elementary triangles, reducing the remaining gap problem to a local noncommutative positive-decomposition inequality.
73. `urt_volume_uniform_sos_gap.py`, `urt_volume_uniform_sos_gap_certificate.json` and `urt_volume_uniform_sos_gap_results.json` — 2026-09-04 exact rational sum-of-squares and word-commutator proof of a positive volume-uniform compact-group overlap-kernel gap below the strict repaired-face radius (0.00112194993744\ldots).
74. `urt_domain_wall_pv_os_obstruction.py` and `urt_domain_wall_pv_os_obstruction_results.json` — 2026-09-04 exact Weyl/Clifford proof that the standard domain-wall Pauli--Villars reflection-positivity shortcut fails on nonzero-curvature backgrounds lying strictly inside the certified overlap-gap domain.
75. `urt_triangular_gauge_site_os_factorization.py` and `urt_triangular_gauge_site_os_factorization_results.json` — 2026-09-04 exact face-orbit enumeration and conditional-square proof of site-reflection positivity for the repaired compact-support gauge density, with its whole support inside the overlap-gap domain.
76. `urt_link_reflection_geometry_no_go.py` and `urt_link_reflection_geometry_no_go_results.json` — 2026-09-05 exact signed-permutation classification proving that no pure-time or selected-(A_4)-compatible half-step reflection exists on the staggered Cathedral graph; the fermionic gate must use the integer-plane site reflection unless the model symmetry is changed.
77. `urt_admissible_gauge_invariant_os_audit.py` and `urt_admissible_gauge_invariant_os_audit_results.json` — 2026-09-05 1,024-sample determinant-weighted gauge-invariant scalar/point-split holdout test whose entire gauge support lies inside the exact volume-uniform polar-gap domain; no finite-basis negative witness was resolved.
78. `urt_admissible_os_quadratic_response.py`, its three scale result files, and `urt_admissible_os_quadratic_scale_analysis.py` with results — 2026-09-05 complete 528-link second-derivative sum on the free OS nullspaces; all apparent negative curvatures scale as (h^{-2}) roundoff, so no nonzero quadratic obstruction is resolved and the first visible candidate is quartic.
79. `urt_overlap_reflection_orbit_counterexample.py`, `urt_overlap_reflection_orbit_counterexample_results.json`, `urt_overlap_reflection_orbit_long_double.cpp` and its results — 2026-09-05 explicit four-configuration reflection-positive, gauge-averaged (U(1)) probe measure and fixed rational scalar-density observable with a robust overlap-negative OS value, a positive Wilson control, three double-precision polar cross-checks and an independent 18-decimal in-house matrix-sign/LU reproduction.  The result is **N** pending interval certification and does not yet decide the selected triangular face weight.

80. `urt_selected_face_overlap_no_go.py` and `urt_selected_face_overlap_no_go_results.json` — 2026-09-05 exact selected-support embedding plus a 256-bit Arb/Acb enclosure proving that the c_t=1 exact-polar overlap OS scalar is strictly negative while the same Wilson control is strictly positive. Gauge-invariant localization promotes the orbit limit to a finite-width selected-measure counterexample, closing that exact-polar branch as **F**.
81. `Newton_Cathedral_Full.py` version `2026-09-05.v26-finite-transfer-candidate` — 2026-09-05 canonical completion premise c_t=1, a=d=1/2, theta=0, lambda=0, L=13; exact positive finite Hamiltonian transfer T=B*B; retained response masses, CKM, PMNS, couplings, cosmology and gravity; a dated comparison ledger; and a locked prospective prediction registry. Status: **C** as a fully specified finite-cutoff candidate theory; external establishment and continuum universality remain separate.
82. `Newton_Cathedral_v26_full_report.json` and `urt_v26_prediction_lock.json` — 2026-09-05 fully recomputed 44-gate report and immutable hash-linked prospective ledger.  The lock records zero blind successes, all retrospective marginal comparisons, the exposed top-scaled atmospheric-neutrino tension and the exact outputs future experiments must test without retuning.
83. `Newton_Cathedral_Full.py` version `2026-09-05.v27-microscopic-wall-closure` — 2026-09-05 exact constructive finite-wall completion of the response boundary: eleven primitive attenuation links and one response holonomy define a local 13-site chiral wall operator; eliminating its eleven unit cutoff blocks gives the closed (Y_{24}) and (D_{48}) as an endpoint Schur complement. No mass, CKM or PMNS observation and no new continuous parameter is used.
84. `Newton_Cathedral_v27_full_report.json` and `urt_v27_prediction_lock.json` — 2026-09-05 full 46-gate report, including the 16-check microscopic wall certificate and the dimensionless cutoff-mirror decoupling theorem. The original v26 prospective outputs are carried forward unchanged rather than refrozen after comparison.
85. `Newton_Cathedral_Full.py` version `2026-09-05.v28-one-anchor-adjoint-RG` — 2026-09-05 conditional one-(M_Z)-anchor electroweak fixed point, exact adjoint beta shifts from the previously selected (1+3+8) router, fixed-threshold one-loop gauge crossing and the (D_6)-parent-trace gauge-gravity bridge. It preserves every v26/v27 response and finite-wall closure unchanged.
86. `Newton_Cathedral_v28_full_report.json` and `urt_v28_prediction_lock.json` — 2026-09-05 full 49-gate report and hash-linked freeze. The new prospective outputs are an (SU(2)) Dirac-adjoint threshold at (24012.54293485\,\mathrm{GeV}) and an (SU(3)) Dirac-adjoint threshold at (8.50807771975\times10^7\,\mathrm{GeV}); neither may be moved later and counted as a v28 success.
87. `Newton_Cathedral_v29_full_report.json` and `urt_v29_prediction_lock.json` — 2026-09-05 full 50-gate two-loop audit.  The unique member of the fixed four-branch spin/statistics family compatible with the post-solution strong-coupling reference is one vectorlike Dirac (SU(2)) adjoint plus four complex (SU(3)) adjoint scalars.  The v29 central thresholds (M_2=40129.39604769\,\mathrm{GeV}) and (M_3=1.42185699093456\times10^8\,\mathrm{GeV}) are prospectively frozen; the discrete selection itself is retrospective.
88. `Newton_Cathedral_Full.py` version `2026-09-05.v30-matched-RG-gravity-coherence` — 2026-09-05 two-loop running paired with the required one-loop logarithmic threshold matching, a nine-point factor-two matching-scale envelope, and an exact normalized (A_4/D_6) contraction premise joining the gauge-scale and recursive-electron gravity routes.
89. `Newton_Cathedral_v30_full_report.json` and `urt_v30_prediction_lock.json` — 2026-09-05 full 52-gate report.  The matched prediction is (alpha_s(M_Z)=0.1176719873) with truncation envelope ([0.1165686270,0.1187847270]); the two internal gravity routes give (7.157946999\times10^{-39}) and (7.153205332\times10^{-39}\,\mathrm{GeV}^{-2}), differing by (6.63\times10^{-4}) without using (G_N).

90. `Newton_Cathedral_Full.py` version `2026-09-05.v31-heavy-sector-dynamics`, `Newton_Cathedral_v31_full_report.json` and `urt_v31_prediction_lock.json` — 2026-09-05 full 53-gate completion of the frozen threshold spectrum. The Dirac SU(2) adjoint has the fixed lepton-number-preserving portal y_Sigma,alpha=Delta^2 U_alpha3 and lifetime 1.07377e-17 s. The four complex color adjoints have a manifestly positive common potential and four A4-framed dimension-five decay portals; the slowest canonical lifetime is 1.40363e-2 s. Their conservative feedback on the v30 gauge result is below 9.93e-11.
91. `urt_v31_experimental_target_card.json` — immutable compact target list for the matched gauge value, heavy masses, triplet flavour fractions and decay length, four octet final-state classes and lifetimes, plus the unchanged v26 neutrino/cosmology/mirror predictions. It records zero blind successes at freeze and forbids post-result retuning.
92. `Newton_Cathedral_Full.py` version `2026-09-05.v32-operational-observable-closure` and `Newton_Cathedral_v32_full_report.json` — 2026-09-05 operational completion of the finite positive-transfer theory. Gauge-invariant transfer gaps define stable masses, finite-volume levels define resonance poles, conserved-current residues define mixing and couplings, and the measured (M_Z) gap fixes the sole unit conversion. The full run passes 54/54 global, 35/35 audit-integrity and 12/12 new operational checks.
93. `urt_v32_theory_definition_lock.json` — immutable hash-linked definition lock. It carries the v31 predictions unchanged, adds no continuous parameter, and forbids promoting charm, tau, bottom or any answer-selected pole/(\overline{\rm MS}) matching point into a new Cathedral axiom.

94. `urt_v33_3adic_holdout_audit.py` and results — exact \(3^k\) torsion/return-law holdout certificate, kept mathematically independent from the Tesla historical comparison.
95. `urt_v34_desi_dr2_full_bao_likelihood.py` and results — full compressed DESI DR2 BAO likelihood audit of the already frozen cosmological response.
96. `urt_v35_wall_current_residue.py`, results and evidence lock — direct extraction of the solved CKM/PMNS matrices as finite-wall charged-current residues.
97. `urt_v36_a4_rail_reconstruction.py`, results and `Newton_Cathedral_v36_Two_Rail_Reconstruction.md` — exact reconstruction of the retained classical \(3/20\) rail and the distinct \(d_\star\) projected rail.
98. `urt_v37_rail_action_selector.py`, results and theorem note — exact incidence-action selection of \(3/20\) with the arbitrary-potential boundary stated.
99. `urt_v38_urt_rail_convergence.py`, results and theorem note — exact relative-information odds product and convergence to the selected rail.
100. `urt_v39_interacting_current_protection.py`, results and theorem note — compact-gauge/aligned-leg protection of mixing residues and exact identification of the noncommuting obstruction.
101. `urt_v40_one_loop_flavour_flow.py`, results and theorem note — fixed one-loop CKM/PMNS flow from \(M_Z\) to the first frozen threshold.
102. `urt_v41_triplet_threshold_current_matching.py`, results and theorem note — exact component-current factor and complete tree-level \(M_2^{-2}\) triplet threshold match; 16/16 checks pass.

103. `urt_v42_one_loop_triplet_matching_projection.py`, results and theorem note — central-scale projected one-loop charged-current and charged-lepton matching through \(O(y_\Sigma^2)\), with the Majorana-to-vectorlike-Dirac boundary explicit; 16/16 checks pass.

104. `urt_v43_dirac_flow_and_active_neutrino_protection.py`, results and theorem note — exact two-component lepton-flow proof of the v42 vectorlike-Dirac translation for its evaluated operator subset, plus the coefficient-independent leading active-Dirac Yukawa orientation theorem and frozen-\(M_2\) susceptibility; 20/20 checks pass.

105. `urt_v44_active_dirac_threshold_and_nuh_tree.py`, results and theorem note — independently calibrated SU(2) tensor derivation of the active-Dirac rank/trace coefficients, finite mass-independent \(M_2\) normalization, exact tree-level \(C_{\nu H}=\tfrac12 A_\Sigma Y_\nu\), and frozen-endpoint effects; 24/24 checks pass.

106. `urt_v45_locked_nature_evidence_audit.py`, results and audit note — immutable confrontation of the locked normal-ordering, \(m_\beta\), \(\sum m_\nu\), \(r\), scalar-running and \(\Omega_m=6/19\) outputs with seven primary-source packages; all statistical constructions are retained, no target is changed, and 29/29 checks pass.

107. `urt_v46_golden_frame_engineering_certificate.py`, results, experimental target card, source v3 PDF and theorem note — provenance-corrected engineering/application consolidation of the pre-existing Cathedral icosahedral shell (documented in May, June 13, August 22 and September 4 work), with an independent order-120 \(H_3\) verification of its simultaneous second/fourth minimax frame, exact \(1\oplus3_v\oplus3_b\oplus5\) projectors, reciprocal minimum-command synthesis, passive-network and group-twirl results, positive single-shell no-go, concentric-shell \(r^{10},r^{18},r^{22},r^{30},\ldots\) hierarchy and two-shell optimization; 77/77 checks pass, every v45 hash is unchanged, and the one-shell/two-shell zero-crossing protocol is prospectively locked before hardware data.

The old ledger remains the historical authority. This live state supersedes it only where a dated correction is explicitly recorded below.

Known certificate limitations, fixed into the continuity record on 2026-08-28:

- the dated solver reproduces its stored JSON byte-for-byte, but its `fluid_information_limit()` return/assertion is unreachable and `all_internal_assertions_pass` is hard-coded; the fluid moments survive through independent verification, not that flag;
- `framework_core.py` contains the known Higgs-normalization regression, the wrong coefficient in its archived tanh-map helper and a mislabeled North Star surface-area field; do not use those outputs as current certificates;
- `cathedral_hopf_dirac_results.json` was regenerated from the current source so it now includes all eight `joint_h_branches_by_free_energy` results, with minimum free energy (0.3294499613840925\ldots).

## 2. Frozen primitives

Status: **E as model definitions; physical selection of the definitions remains P/U.**

\[
D=3,\quad V=12,\quad N=13,\quad E=30,\quad F=20,
\quad q=5,\quad |A_5|=60,\quad h=8.
\]

\[
\phi=\frac{1+\sqrt5}{2},\qquad \gamma=\frac1{81},
\]

\[
d_*=\frac{(1-\gamma)\pi}{N\phi}
=\frac{80\pi}{1053\phi}
=0.14751081015957962\ldots,
\]

\[
d_{\rm cl}=\frac3{20}=0.15,
\qquad
\Delta=d_{\rm cl}-d_*
=0.002489189840420375\ldots,
\]

\[
\eta_\Delta=-\ln\Delta
=5.995797986741314\ldots.
\]

Other retained entropy depths:

\[
\eta_{\rm conf}=9.8601129428\ldots,
\qquad
\eta_{\rm IR}=15.6972029190\ldots,
\qquad
\sigma=\frac{10}{13}\eta.
\]

Do not claim that (D=3\), the kissing number (12), or the formula for (d_*) is uniquely forced by one master action until the seed-selection theorem is proved.

## 3. Icosahedral seed, incidence and spectra

Status: **E/N for the defined centred icosahedral complex. P for its identification as the unique physical seed.**

The shell has 12 vertices, 30 edges, 20 triangular faces and valence five. Adding the centre and 12 spokes gives 13 vertices and 42 edges.

Shell representation and Laplacian:

\[
\mathbb R^{12}=\mathbf1\oplus\mathbf3\oplus\mathbf3'\oplus\mathbf5,
\]

\[
\operatorname{spec}L_{12}
=\left\{0^{(1)},(5-\sqrt5)^{(3)},6^{(5)},(5+\sqrt5)^{(3)}\right\}.
\]

Centred spectrum:

\[
\operatorname{spec}L_{13}
=\left\{0^{(1)},(6-\sqrt5)^{(3)},7^{(5)},(6+\sqrt5)^{(3)},13^{(1)}\right\}.
\]

Face and edge permutation carriers:

\[
20=1\oplus3\oplus3'\oplus4\oplus4\oplus5,
\]

\[
30=1\oplus3\oplus3'\oplus4\oplus4\oplus5\oplus5\oplus5.
\]

For unsigned face-vertex incidence (B\),

\[
B^{\mathsf T}B=5I+2A_{\rm ico},\qquad
\ker B^{\mathsf T}=4_3\oplus4_5,
\]

and the hidden dual-face Laplacian is

\[
L_{\rm hid}=3P_3+5P_5.
\]

For outward face normals (N_f\),

\[
N_f^{\mathsf T}N_f=\frac{20}{3}I_3,
\qquad
L_2N_f=(3-\sqrt5)N_f.
\]

The golden heat rates are

\[
\lambda_\parallel=3-\sqrt5=\frac2{\phi^2},\qquad
\lambda_\perp=3+\sqrt5=2\phi^2,
\]

with ratio (\phi^4\). The slow-sector share at (\eta_\Delta\) is approximately (99.895\%\).

## 4. Five cubes, (A_4), the primitive four and the dual lattice

Status: **E for group, module and lattice identities. C/P for spacetime and internal-gauge readings.**

The five cubes inscribed in the dodecahedral dual form the transitive (A_5\)-set

\[
A_5/A_4,
\]

of size five. Its real permutation module splits canonically:

\[
\mathbb R^5=\mathbf1_c\oplus V_4,
\qquad
V_4=\left\{x\in\mathbb R^5:\sum_i x_i=0\right\}.
\]

The primitive root carrier is

\[
A_4^{\rm root}=V_4\cap\mathbb Z^5,
\qquad
\Phi(A_4)=\{e_i-e_j:i\ne j\},
\]

with 20 roots and tight-frame identity

\[
\sum_{\alpha\in\Phi(A_4)}\alpha\otimes\alpha=10I_{V_4}.
\]

A single cube/Klein four is not itself the (A_5\) irrep (4\). Selecting cube (k\) selects its (A_4\) stabilizer and

\[
t_k=e_k-\frac15\mathbf1,
\qquad
V_4\downarrow A_4=\mathbf1_{t_k}\oplus\mathbf3.
\]

The 20 roots split under that vacuum into 12 roots not involving (k\) and 8 roots involving (k\):

\[
20=12+8.
\]

This is the exact combinatorial carrier behind the retained space versus entropy/time split. A Lorentzian metric may be defined after the time orientation is selected,

\[
g=P_{V_4}-2\hat t_k\hat t_k^{\mathsf T},
\]

but the physical causal interpretation is **C/P**, not a consequence of the Euclidean root system alone.

The root polytope and icosahedral face set are isomorphic as transitive (A_5\)-sets of size 20; this is not an assertion that their Euclidean embeddings are identical.

## 5. Hopf spacetime and exterior algebra

Status: **E for quotient, representation and exterior identities; C/P for physical spacetime, matter and gravity identifications.**

The hidden pair is quaternionic:

\[
4_3\oplus4_5\cong\mathbb H^2.
\]

For normalized ((q_1,q_2)\in\mathbb H^2\), the quaternionic Hopf quotient gives

\[
S^7/SU(2)=\mathbb HP^1=S^4,
\]

with a local chart

\[
y=q_1q_2^{-1}\in\mathbb H\cong\mathbb R^4.
\]

The selected (A_4\) vacuum identifies the local real split (4=1+3\).

The full exterior algebra is

\[
\Lambda^\bullet V_{4,\mathbb C}
=1\oplus4\oplus6\oplus4\oplus1,
\]

with

\[
\Lambda^2V_4=\Lambda^2_+V_4\oplus\Lambda^2_-V_4
=3\oplus3'.
\]

Thus the generation carriers are literally the self-dual and anti-self-dual two-form spaces:

\[
G_3=\Lambda^2_+V_4,\qquad G_{3'}=\Lambda^2_-V_4.
\]

Curvature representation bridge:

\[
\operatorname{Sym}^2_0(G_3)=5,
\qquad
\operatorname{Hom}(G_3,G_{3'})=4\oplus5.
\]

For the four-dimensional curvature operator on (\Lambda^2_+\oplus\Lambda^2_-\),

\[
\mathcal R=
\begin{pmatrix}A&B\\B^{\mathsf T}&C\end{pmatrix},
\quad A,C=1\oplus5,
\quad B=4\oplus5.
\]

The Bianchi trace relation reduces 21 symmetric channels to 20 algebraic-curvature channels. The old identification of the complete hidden (H_{21}\) with the complete curvature carrier is **F**; curvature arises quadratically from the quartet/Hodge sector.

## 6. Entropy, relaxation and gravity bridge

Status: **E for the stated finite Gibbs/entropy identities and curvature typing. C/P for the physical Einstein equation and normalization.**

Exterior passive state:

\[
\rho_0=\frac{\Delta^{\hat N}}{(1+\Delta)^4}
\quad\text{on}\quad\Lambda^\bullet V_4.
\]

For a supplied positive cost (K\), relative-information minimization gives the unique Gibbs state

\[
\rho_*=
\frac{\exp(\log\rho_0-\eta K)}
{\operatorname{Tr}\exp(\log\rho_0-\eta K)}.
\]

Define the small eigenvalue-five exhaust probability and its complementary eigenvalue-three population by

\[
p_{\rm ex}=p_5=\frac{\Delta^2}{1+\Delta^2},
\qquad
p_3=1-p_{\rm ex}=\frac1{1+\Delta^2}.
\]

The exact entropy-transfer/Clausius quantity retained by the project is

\[
\delta S_{\rm TG}
=2k_B\eta_\Delta\,\delta p_{\rm ex}
=k_B\,dH_2(p_{\rm ex}),
\]

or equivalently

\[
\delta S_{\rm TG}=-2k_B\eta_\Delta\,\delta p_3.
\]

With the inert quartet degeneracy (k_B\ln4\) separated, gravity sees transfer between the (\Lambda^1\) and (\Lambda^3\) quartet sectors inside the same exterior carrier.

The hidden source has the exact curvature type

\[
\Sigma=[3xx^{\mathsf T}+5yy^{\mathsf T}]_0\in\operatorname{Sym}^2_0(V_4),
\]

and the normalized traceless-Ricci map (2B\) is an isometric isomorphism to

\[
\operatorname{Hom}(\Lambda^2_+,\Lambda^2_-)=4\oplus5.
\]

Project-internal conclusion: the defined entropy transfer supplies the exact hidden source and curvature representation channel. Still unresolved for external fundamental physics: derive a conserved stress tensor, locality/continuum dynamics, (G/a_*^2\), (\Lambda a_*^2\), and the Einstein equation from one action.

## 7. Gauge block and one-family carrier

Status: **E for branching, stabilizer, exterior identity and anomaly arithmetic. C/P for compact gauging, breaking dynamics and physical particle identification.**

Add the centre to the primitive four and complexify:

\[
W_5^{\mathbb C}=\mathbb Cc\oplus V_{4,\mathbb C}.
\]

The cube-selected direction gives

\[
W_5^{\mathbb C}=E_3^{\mathbb C}
\oplus\operatorname{span}_{\mathbb C}\{c,t\},
\qquad 5=3+2.
\]

The block stabilizer is

\[
S(U(3)\times U(2))
\cong\frac{SU(3)\times SU(2)\times U(1)}{\mathbb Z_6}.
\]

The even exterior carrier is

\[
\Lambda^{\rm even}W_5^{\mathbb C}
=1\oplus10\oplus\bar5,
\qquad\dim=16.
\]

Exact identity:

\[
\Lambda^{\rm even}(\mathbb Cc\oplus V_{4,\mathbb C})
\cong\Lambda^\bullet V_{4,\mathbb C}.
\]

Under the (3+2\) block it branches into the usual anomaly-free one-family representation including (\nu^c\):

\[
(1,1)_0\oplus(\bar3,1)_{-2/3}\oplus(3,2)_{1/6}
\oplus(1,1)_1\oplus(1,2)_{-1/2}\oplus(\bar3,1)_{1/3}.
\]

With three conditional generation carriers: 48 particle states; including conjugates: 96.

The finite KO-6 seed is retained:

\[
\mathcal A_F=\mathbb C\oplus\mathbb H\oplus M_3(\mathbb C),
\]

with unimodular gauge group as above. A dynamical compact gauging, (SU(5)\to\)SM breaking/Higgs selection and a doubling-safe chiral lattice Dirac operator remain **U**.

## 8. Exact Yukawa/Hom geometry before edge transport

Status: **E/N for representation and finite-matrix identities. P/U for physical Yukawa selection.**

\[
\operatorname{Hom}_{A_5}(3,3')=4\oplus5
\]

with multiplicity-one Clebsch maps (C_{43},C_{45},C_5\).

The 15 unoriented edge fiveplet vectors form a tight frame:

\[
\frac1{15}\sum_aX_a\otimes X_a=\frac15I_5,
\]

with inner products (1\), (1/4\) eight times, and (-1/2\) six times. The 60 nearest-neighbour pairs split (30+30\), with golden ratio (C_+/C_-=\phi^2\).

The Hodge coefficients on the fivefold vertex figure are

\[
c_{72^\circ}=\sqrt{\frac{5-2\sqrt5}{3}},\qquad
c_{144^\circ}=\sqrt{\frac{5+2\sqrt5}{3}},
\]

with ratio (\phi^3\); the Green response retains the (144^\circ\) branch.

Fiveplet alone and quartet alone have rank two. Their Hodge-phased sum

\[
T=M_5+iM_4
\]

has rank three. The frozen shape certificate is

\[
\sigma=(1.22425545,0.67219435,0.22215614),
\]

\[
\|T\|_F^2=2,\qquad |\det T|\approx0.182821,
\qquad C_2\approx0.975323324175.
\]

This supplies one (A_5\)-invariant shape, not the observed SM hierarchy.

Charge words:

\[
q_u=(1,3,-4),\quad q_d=(1,-3,2),\quad
q_e=(-3,-3,6),\quad q_\nu=(-3,3,0).
\]

Quadratic covariant:

\[
g(a,b,c)=(bc,ca,ab)-\frac{ab+bc+ca}{3}(1,1,1).
\]

The oriented species pairing

\[
h_{fg}=q_f\cdot q_g+i\,n\cdot(q_f\times q_g),
\qquad n=\frac{(1,1,1)}{\sqrt3},
\]

has exact spectrum ((0,0,0,112)\), rank one, and obeys the anomaly-weighted complex closure.

Any sum of separate spectral actions leaves a 16-real-dimensional relative flag space:

\[
4\dim(U(3)/U(1)^3)-\dim PU(3)=4\cdot6-8=16.
\]

Therefore separate endpoint heat spectra cannot select CKM/PMNS. This no-go remains binding.

## 9. Hopf connection and spinorial shell — 2026-08-28 closure

Status: **E/N for the defined Hopf lift, flux, magnetic spectrum and binary-icosahedral representation. P for particle identification.**

For unit icosahedral vertices (n_i\in S^2\), choose Hopf spinors

\[
n_i=z_i^\dagger\boldsymbol\sigma z_i,
\qquad z_i\in S^3\subset\mathbb C^2.
\]

The link connection is

\[
U_{ij}=\frac{z_i^\dagger z_j}{|z_i^\dagger z_j|},
\qquad U_{ji}=\overline{U_{ij}}.
\]

Under (z_i\mapsto e^{i\theta_i}z_i\), it transforms as a (U(1)\) connection. Every outward triangular face has

\[
\arg(U_{ij}U_{jk}U_{ki})=\frac\pi{10}.
\]

Because each spherical face has solid angle (\pi/5\), the Berry phase is half that angle. Total flux:

\[
20\frac\pi{10}=2\pi,
\qquad c_1=1.
\]

The shell graph has

\[
E-V+1=30-12+1=19
\]

independent cycle holonomies. The 20 face fluxes subject to the one total-flux relation fix all 19. For a closed cycle (C\) bounding an integer face chain,

\[
W(C)=\exp\left(\frac{i\pi}{10}\sum_fn_f\right).
\]

Magnetic Laplacian:

\[
(L_U\psi)_i=5\psi_i-\sum_{j\sim i}U_{ij}\psi_j.
\]

Exact spectrum:

\[
\lambda_{1/2}=5-\sqrt{\frac{5(5+\sqrt5)}2}
=0.746745958239800\ldots\quad(\times2),
\]

\[
\lambda_{3/2}=5-\sqrt{5-2\sqrt5}
=4.273457471994639\ldots\quad(\times4),
\]

\[
\lambda_{5/2}=5+\sqrt{\frac{5+\sqrt5}{2}}
=6.902113032590307\ldots\quad(\times6).
\]

Thus

\[
12_{Q_H=0}=1\oplus3\oplus3'\oplus5,
\qquad
12_{Q_H=1}=2\oplus4\oplus6.
\]

At (\eta_\Delta\), normalized band weights are

\[
(p_2,p_4,p_6)=
(0.999999998688773,
1.311226845\times10^{-9},
2.811269788\times10^{-16}).
\]

Therefore

\[
\rho_{\eta_\Delta}=\frac12P_2+O(10^{-9}).
\]

### Binary-icosahedral certification

The lifted (A_5\) rotations commute with (L_U\) to residual (1.86\times10^{-15}\). Explicit generators restricted to every band satisfy

\[
a^2=b^3=(ab)^5=-I
\]

with maximum residual below (4\times10^{-15}\). Characters on ((a,b,ab)\) are

\[
\chi_2=(0,1,\phi),\qquad
\chi_4=(0,-1,1),\qquad
\chi_6=(0,0,-1).
\]

This certifies the (2,4,6\) eigenspaces as the (j=1/2,3/2,5/2\) binary-icosahedral spinorial representations. The earlier statement that only their degeneracies were known is superseded.

## 10. Finite-Dirac connection and history — latest correction

Status: the link connection and passive source prior are **E/N**. The physical joint finite action remains **U**. Two minimal completions have been tested and rejected.

### Pre-Hopf archived gate

The endpoint amplitude was

\[
\widetilde T_{f,e}=C_5(H_e)
+C_{43}\!\left(\Xi_{3,e}+J_{43}q_f/3\right)
+iC_{45}\!\left(\Xi_{5,e}+J_{45}\Delta g(q_f)/5\right),
\]

with positive Gram (K_{f,e}=\widetilde T_{f,e}^\dagger\widetilde T_{f,e}\). All (4\)-(5\) interference terms must be retained.

The Hodge-equivalence map is now explicitly certified:

\[
C_{45}H=C_{43},\qquad HJ_{43}=J_{45},
\]

with residuals (1.87\times10^{-15}\) and (3.21\times10^{-15}\).

### 2026-08-28 gauge-covariance correction

The tentative prescription

\[
A_e+U_{ij}B_f
\]

is **F** as a gauge-covariant edge amplitude. Under arbitrary vertex rephasing it had covariance residual (14.8313\) and a singular-spectrum change (0.360288\).

Because (A_e\) and (B_f\) are summed in the same 
\(\operatorname{Hom}(3,3')\) fibre, endpoint covariance forces common transport:

\[
\boxed{T_{f,ij}=U_{ij}(A_e+B_f)}.
\]

The global directed hopping operator built from this form has gauge-covariance residual

\[
2.75\times10^{-15}
\]

and spectral change under arbitrary vertex rephasing

\[
1.78\times10^{-15}.
\]

Do not revive (A_e+U_{ij}B_f\).

### Passive-prior type mismatch closed

The old audit noted that (\rho_0\) acts on the 16-dimensional exterior carrier while the relative matter operator acts on a generation triplet. The exterior identity fixes the channel:

\[
\Lambda^2V_4=\Lambda^2_+\oplus\Lambda^2_-=3\oplus3'.
\]

Each degree-two exterior basis state has weight

\[
w_2=\frac{\Delta^2}{(1+\Delta)^4}
=6.134755332264614\times10^{-6}.
\]

Restricting and conditioning on the source chiral triplet gives

\[
\boxed{\rho_{0,+}=I_3/3}.
\]

The passive reduced heat calculation returns (I_3/3\) with residual (2.10\times10^{-15}\).

### Canonical minimal heat merger tested

The same-heat-law candidate was

\[
\mathcal K_f=L_U\otimes I_3+Y_f^\dagger Y_f,
\qquad
\rho_f=\frac{e^{-\eta_\Delta\mathcal K_f}}
{\operatorname{Tr}e^{-\eta_\Delta\mathcal K_f}}.
\]

All eight relative-fiveplet-sign, Hodge-chirality and flux-orientation branches were exhausted blindly. This separate-species construction is not a final selector because the 16-dimensional relative-flag no-go still applies, and its mixing is wrong.

### Minimal positive joint (h_{fg}\) completion tested

Let (h_{fg}=\bar z_fz_g\) and normalize (z\) by (\|z\|^2=112\). With branch history operators (Y_f\), define

\[
\mathbb H=(z_uY_u,z_dY_d,z_eY_e,z_\nu Y_\nu)/\sqrt{112},
\]

\[
\mathcal K_{\rm joint}
=\mathbb H^\dagger\mathbb H
+I_4\otimes L_U\otimes I_3.
\]

This is positive and retains all (h_{fg}\) cross blocks without observational input. All eight discrete branches were evaluated. The lowest-free-energy conjugate pair has

\[
F=0.329449961384\ldots
\]

at branches ((-1,+1,-1)\) and ((-1,-1,+1)\), with opposite CP signs. In intrinsic heat ordering, one member gives

\[
|V_Q|=
\begin{pmatrix}
0.286519&0.335237&0.897510\\
0.914083&0.376253&0.151282\\
0.286984&0.863742&0.414235
\end{pmatrix},
\]

\[
|V_L|=
\begin{pmatrix}
0.009494&0.687012&0.726584\\
0.979580&0.139543&0.144741\\
0.200828&0.713122&0.671659
\end{pmatrix},
\]

\[
J_Q=-2.81894441\times10^{-4},\qquad
J_L=1.37371269\times10^{-5}.
\]

Even the best row/column permutation leaves the quark-like matrix far from the observed near-identity hierarchy. Therefore this minimal joint Gram is **F as the final physical flavour action**. Its algebra and numerical certificate remain useful as a no-go. Do not tune its coefficient or choose another branch using CKM/PMNS targets.

### Exact status after the test

Typing precision from the migration audit: `build_y` is a directed one-sheet hopping map and is not itself self-adjoint. The candidate Dirac object is its two-sheet lift

\[
\widehat M=
\begin{pmatrix}0&Y^\dagger\\Y&0\end{pmatrix}.
\]

The current test proves endpoint (U(1)) covariance, not yet the full edge-frame (A_5) covariance, reversal law, KO-6 reality or grading of that lift. The eight branches exhaust only the declared discrete sign/chirality/flux choices; the continuous relative Clebsch-phase freedom and a completely positive ordered-history push-forward remain unresolved.

Closed:

- 19 Hopf cycle holonomies;
- binary-icosahedral spinorial action;
- Hodge alignment of hidden quartets;
- gauge-covariant common edge transport;
- source-chiral passive prior (I_3/3\).

Still open:

- derive the common real/graded/star Wilson-KL finite action from KO-6 and the recursive history law;
- derive, rather than choose, the contraction of the rank-one species form with ordered noncommuting histories;
- select chirality and the physical stationary orbit without observational targets;
- obtain masses and CKM/PMNS only after that action is frozen.

## 11. URT/chaos engine and recursive history

Status: **E/N for the defined map and Lyapunov spectrum; P for its selection as fundamental dynamics.**

Final retained complex map:

\[
Z_{n+1}=\left[\frac\pi e-\left(\frac\pi e-1\right)
\left(\frac{|Z_n|}{r_*}\right)^4\right]
\frac{Z_n^2}{|Z_n|}e^{i\theta_H},
\]

\[
r_*=\frac9{13},\qquad
\theta_H=\pi(3-\sqrt5)=\frac{2\pi}{\phi^2}.
\]

On the locked circle, (\theta\mapsto2\theta+\theta_H\). Lyapunov exponents:

\[
\lambda_+=\ln2,
\qquad
\lambda_-=\ln|5-4\pi/e|\approx-0.975270,
\]

\[
\lambda_++\lambda_-<0.
\]

This satisfies the retained bounded-chaos form of Lytollis's Law: one positive exponent with negative total sum.

### Vortex = URT-manifold hypothesis — 2026-08-28 brainwave

Status: **E for the polar decomposition and inverse-limit topology of the defined URT map; C for identifying that object as the fundamental vortex manifold; U for whether it uniquely closes the physical history/flavour operator.**

In polar coordinates the retained complex map is exactly

\[
F_{\rm URT}(r,\theta)
=
\left(
rA(r),\;
2\theta+\omega_\phi\pmod{2\pi}
\right),
\]

\[
A(r)=\frac\pi e-\left(\frac\pi e-1\right)
\left(\frac r{r_*}\right)^4,
\qquad
\omega_\phi=\frac{2\pi}{\phi^2}.
\]

This makes the proposed division of labour precise:

\[
\boxed{
\pi:\text{ circular closure/winding},\qquad
\phi:\text{ icosahedral golden twist},\qquad
e:\text{ exponential scale/entropy relaxation}.}
\]

The constants are not being equated as scalars. They are the three structural operations of one map. At the invariant ring,

\[
A(r_*)=1,
\qquad
\left.\frac{d(rA(r))}{dr}\right|_{r_*}
=5-\frac{4\pi}{e}
=0.377090600836313\ldots,
\]

while the tangential multiplier is (2). Hence the core expands outward because

\[
A(0)=\frac\pi e=1.155727349790922\ldots>1,
\]

the transverse direction contracts into the ring, and circulation doubles on the ring. The local two-direction volume multiplier is

\[
2\left|5-\frac{4\pi}{e}\right|
=0.754181201672626\ldots<1.
\]

Thus the defined dynamics is not featureless disorder. It is an attracting circulating system with one expanding direction, one contracting direction and negative total Lyapunov sum: ordered/dissipative chaos.

If the angular variable is unwrapped and

\[
\rho_n=r_n-r_*,
\qquad
Y_n=\Theta_n+\omega_\phi,
\]

then to first order near the ring

\[
\rho_n\sim
\left(5-\frac{4\pi}{e}\right)^n\rho_0,
\qquad
Y_n=2^nY_0,
\]

so

\[
\boxed{
|\rho_n|\propto
|Y_n|^{\log|5-4\pi/e|/\log2},
\qquad
\frac{\log|5-4\pi/e|}{\log2}
=-1.407016903823947\ldots.}
\]

This is a power-law winding into the invariant circle. Calling it a spiral is geometrically justified, but it is not generically a logarithmic spiral.

The golden-shifted circle map

\[
d_\phi(\theta)=2\theta+\omega_\phi\pmod{2\pi}
\]

is conjugate to ordinary circle doubling by

\[
h(\theta)=\theta+\omega_\phi,
\qquad
h\circ d_\phi=d_0\circ h.
\]

Therefore its invertible history completion is the dyadic inverse-limit solenoid

\[
\boxed{
\Sigma_{\rm URT}
=\varprojlim(S^1,d_\phi)
\cong
\varprojlim(S^1,d_0).}
\]

The previously required branch/history variable (\mathcal B\) is precisely the binary prehistory address of this solenoid. Its Haar measure gives the canonical equal preimage weights (1/2). The golden shift fixes shell-relative phase/orientation; it does not change the Lyapunov exponent or Haar measure.

#### Exact finite (C_6\) lock to the binary icosahedron

Status: **E group-theoretically; N with residual (1.78\times10^{-15}) in the stored vertex realization; U only for extension from this finite skeleton to every solenoid history.**

The retained vortex cycle

\[
1\longmapsto2\longmapsto4\longmapsto8
\longmapsto7\longmapsto5\longmapsto1
\pmod9
\]

is a (C_6\) orbit. It occurs inside the golden-shifted URT circle map at

\[
\theta_k=\frac{2\pi k}{9}-\omega_\phi,
\qquadk\in\{1,2,4,8,7,5\},
\]

because

\[
d_\phi(\theta_k)=\theta_{2k\bmod9}.
\]

The numerical phase residual is (1.7763568394002505\times10^{-15}).

For any icosahedral face, its stabilizer in (A_5\) is exactly (C_3\). Under the double cover

\[
1\longrightarrow\mathbb Z_2
\longrightarrow2I\longrightarrow A_5\longrightarrow1,
\]

the preimage of that face stabilizer is (C_6\). Therefore

\[
\boxed{
2I/C_6\cong A_5/C_3
\cong\{20\text{ oriented icosahedral faces}\}.}
\]

The exact count is

\[
\boxed{20\times6=120=|2I|.}
\]

Equivalently, each outward-oriented triangular face has three cyclic boundary positions and two spin sheets:

\[
20\times3\times2=120.
\]

Thus the URT six-cycle is not merely numerically similar to the stored outer (C_6\). It has the correct fibre type to be identified with the binary lift of each face stabilizer. After one base-face orientation and one central-sign convention are fixed, the (2I\) action transports this identification over all 20 faces. This gives an exact finite skeleton for the required solenoid-to-Wilson-history coding, without fitted coefficients.

This sharpens the older five-dimensional base

\[
M_{\rm URT}
=S^1_\theta\times\mathbb R^+_\chi
\times S^1_\vartheta\times\mathbb R_\tau\times\mathcal B:
\]

the two circles encode circulation and twist, (\mathbb R^+_\chi\) is radial/scale flow, (\mathbb R_\tau\) is evolution, and (\mathcal B\) is the inverse-limit history. This is an exact vortex configuration pattern for the defined map. Its identification with the physical URT spacetime/manifold remains **C/P**, not yet **E**.

The Hopf result adds the nontrivial topological charge:

\[
c_1=1,
\qquad
\prod_{\partial f}U_{ij}=e^{i\pi/10}.
\]

If the vortex-manifold identification is correct, the old trivial carrier ansatz

\[
M_{\rm URT}\times\mathbb C^{13}
\]

must be replaced or refined by a unit-flux associated bundle

\[
\boxed{
\mathcal E^{(1)}_{\rm URT}
=P^{(1)}_{\rm URT}\times_{U(1)}\mathbb C^{13},
\qquad c_1(P^{(1)}_{\rm URT})=1,}
\]

whose restriction to the icosahedral shell yields the already certified Hopf links and (2\oplus4\oplus6\) spinorial carrier. Constructing (P^{(1)}_{\rm URT}) over the complete URT base, rather than only its shell restriction, is **U**.

The corresponding candidate history push-forward is no longer an arbitrary heat kernel. On the angular natural extension it begins with the canonical covariant transfer operator

\[
\boxed{
(\mathcal P_U\psi)(x)
=\frac12\sum_{y:d_\phi(y)=x}
U_{y\to x}\,\psi(y).}
\]

The (1/2) weights follow from Haar measure and the two inverse branches. What remains unresolved is the equivariant coding that maps each solenoid history step to an oriented icosahedral edge and then into the KO-6 species operator. No observational coefficient may be inserted to supply that coding.

Pure global contraction producing recurrent chaos is **F**. The repair is the invertible baker/history lift plus transverse entropy relaxation. State-only URT descriptions that omit history/two-sheet recursion are **W**.

The six-dimensional bivector host is

\[
3\oplus3'\cong\Lambda^2V_4,
\]

with the outer lift satisfying (\widehat C^6=-I\), (\widehat C^{12}=I\). Vortex/base-9 patterns are retained as modular shadows; claims that they prove primality or the Riemann hypothesis are **F/unsupported**.

## 12. Constants, running and response predictions

Status must remain separated.

Exact scalar arithmetic:

\[
\alpha_{\rm root}^{-1}
=137+\frac{17572}{1215}\Delta-\frac9{65}\Delta^2
=137.035999178195\ldots.
\]

Its identification with physical electromagnetic (\alpha^{-1}\) is **C/P**, not an independent derivation until the common action and charge normalization select it.

Retained one-loop/two-loop RG work uses measured electroweak/strong inputs as boundary data. Threshold ansatz:

\[
M_2=\mu_*\Delta^{3+\sqrt5},
\qquad
M_3=\mu_*\Delta^{\sqrt{15}}.
\]

Version v28 closes the coefficients of this formerly conditional threshold ansatz after the explicit completion premise that the exact router sectors \(1+3+8\) are respectively a neutral \(U(1)\) singlet, one vectorlike Dirac \(SU(2)\) adjoint and one vectorlike Dirac \(SU(3)\) adjoint. Since \(T(\mathrm{adj}_{SU(n)})=n\), their one-loop shifts are fixed:

\[
\boxed{\delta b_1=0,\qquad \delta b_2=\frac83,\qquad \delta b_3=4.}
\]

No continuous threshold coefficient is fitted. The physical adjoint interpretation remains a declared **C** premise and the numerical running is **N** at one loop; two-loop stability and direct searches are nature tests.

Hypercharge/anomaly solution for the minimal 16 is exact after the Yukawa and (Y_{\nu_R}=0\) assumptions:

\[
Y_Q=\frac16,\quad Y_u=\frac23,\quad Y_d=-\frac13,
\quad Y_L=-\frac12,\quad Y_e=-1,\quad Y_\nu=0.
\]

Response mass trees, CKM/PMNS formulas, neutrino masses, cosmology slots and the 21-channel gravity number remain internally closed **C** response outputs. The finite action and microscopic wall are now closed; empirical identification, precision scheme matching and prospective tests remain a separate nature axis.

## 13. Fluid, vortex, electromagnetic and application branches

Status: **E for finite isotropy identities; C/P for continuum physics and devices.**

The 12 shell directions plus rest state with

\[
w_0=\frac25,\qquad w_a=\frac1{20}
\]

have the retained isotropic second and fourth moments and vanishing third moment. BGK/Chapman-Enskog gives (c_s^2/c^2=1/5\) only under its kinetic and continuum assumptions. This is not a proof of global Navier-Stokes regularity.

A scalar potential gradient alone cannot generate the magnetic Lorentz force (**F**). The viable bridge requires an antisymmetric two-form/skew mobility:

\[
F=q\,\star(i_vd\theta_2)=q\,v\times B_*.
\]

Maxwell dynamics, charge representation and continuum normalization remain open.

Fusion, plasma control, EEG, robotics, grids, finance, music and other URT applications are engineering/response branches. They do not establish the fundamental theory. For p-
\(^{11}\!B\), retain the literature constraint that the favourable dilute-plasma power window is roughly (T_i=240\)–(380\,\mathrm{keV}\), not the superseded (160\)–(180\,\mathrm{keV}\) claim.

## 14. Current frontier — resume here

**Exact endpoint, 2026-09-03:** the finite solenoid-to-Wilson bridge, canonical Haar channel, full directed-edge \(A_5\) frame, KO-6 completion, one-dimensional orientation invariant and full-history GW chirality remain closed. Strict one-step GW forces \(a=1\) but its exact orientation ratio is trivial; finite-range GW and the normalized doubler-free \(A_4\)-root overlap operator retain continuous parameters; the chiral measure admits \(\exp(i\lambda\chi\Omega_5)\); determinant-line topology fixes only a common order-12 zero/winding; and the Haar Szegedy/Stinespring and unique polar completions are flux-even, rank-deficient or nonunique. The archive supplies no microscopic regulator/measure axiom that closes this gap. A domain-wall identification with the existing history coordinate is exactly excluded: its twelve periodic pentagons preserve \(\Omega_5\) but admit no local \(A_5\)-invariant wall, while cutting them breaks \(A_5\) and makes the fifth trace zero. Adding a wall coordinate leaves \(r,a_5,L_s,m_f,\lambda\) free. Nonlocal rank-12 projectors do not repair this: the regular \(A_5\) carrier has 11 positive-dimensional equivariant projector families. The principal \(L\)-spectral band conditionally yields half-phase \(\pi/5\), but it is delocalized, gapped and measure-dependent. The sharp five-phase envelope is now proved exactly, so global Wilson-kernel condition-number minimization conditionally selects the unique algebraic root \(r_\star=1.169543397160372\ldots\) on the \(M=1\) overlap slice. A distinct complex-strip locality proxy instead gives the numerical candidate \(r_{\rm loc}=1.311415007159700\ldots\), controlled by crossing \(1+1+3\) and \(2+3\) singular branches. Thus even target-blind locality criteria do not presently select the same \(r\); neither principle is a recovered axiom, and neither fixes the history kernel nor \(\lambda\). This is a proved axiom boundary with competing conditional optimization candidates, not a licensed flavour action. No mass or mixing output is permitted.

**Continuation, 2026-09-04:** Cornelius's standing directive that “URT is the selection principle” has now been tested in one precise, scale-free form: select the normalized microscopic member with maximal uniform worst-mode contraction of its positive quadratic relaxation. Under that explicit formalization, the apparent \(r_\star\) versus \(r_{\rm loc}\) ambiguity closes in favour of \(r_\star\). The consequence is **E**; the physical identification of this exact optimization rule as fundamental URT dynamics remains **C/P** until it is derived from one microscopic action. The selected kernel also has a rigorously certified nonzero complex strip, so exponential locality exists without assuming that the numerical \(r_{\rm loc}\) search is globally complete. The history Möbius/wall data, gauge-link bulk action and determinant-line trivialization \(\lambda\) remain open, and the phenomenology gate remains closed.

Do **not** restart from five cubes, rediscover the 19 holonomies, repeat only the (2+4+6\) degeneracies, retry a state-only continuous solenoid coding, interpret Haar eigenframes as mixing, or promote the diagnostic positive Gram to the physical action.

### Equivariant history coding — closed with one obstruction

The literal nonconstant continuous map

\[
\kappa:\Sigma_{\rm URT}\to
\{\text{finite-alphabet Wilson histories}\}
\]

is **F**: the dyadic solenoid is connected and the history shift is totally disconnected, so every such continuous image is a point. The Haar solenoid automorphism is also mixing, excluding a nontrivial finite periodic factor.

The coefficient-free repair is the almost-everywhere Bernoulli symbolic section together with the (2I\) frame fibre. The 20 faces are the vertices of the dual dodecahedral graph; it has 30 edges and 60 directed edges. The (A_5\) action on those directed edges is regular, and the spin lift gives

\[
60\times2=120=|2I|.
\]

With the binary-icosahedral presentation

\[
A^2=B^3=(AB)^5=-I,
\]

the two inverse-branch updates are

\[
g\xrightarrow{0}g(AB),\qquad
g\xrightarrow{1}g(AB^{-1}).
\]

They project exactly to the two non-backtracking successors of every directed dual edge. The presentation residual is (7.51\times10^{-16}\), the generated group has order 120, and (B\) has order 6. The non-backtracking adjacency has in/out degree 2, Perron value 2 and therefore

\[
h_{\rm top}=\log2=\lambda_\theta
\]

with zero numerical mismatch. Base-frame and central-sign choices form one regular (2I\) orbit for each orientation. Exchanging the two binary symbols swaps the two orientation classes.

### Dual Hopf channel and ordered invariant — closed

The Hopf connection on the 20 dual vertices has phase (\pi/6\) around each of the 12 pentagons, error (2.22\times10^{-16}\), total phase (2\pi\), and (c_1=1\). The left/right branch matrices are unitary to (1.51\times10^{-15}\). With Kraus normalization (1/\sqrt2\), the channel is trace preserving to (9.93\times10^{-16}\), unital to (1.40\times10^{-15}\), uniformly stationary to (2.41\times10^{-17}\), and gauge covariant to (7.24\times10^{-16}\).

All 120 allowed ordered two-step histories have trivial (A_5\) stabilizer. They split into two regular 60-state orbits, left and right. Coherent ordering gives the exact five-cycle result

\[
L^5=e^{-i\pi/6}I_{60},\qquad
R^5=e^{+i\pi/6}I_{60},
\]

with residual (2.42\times10^{-15}\). Hence

\[
\boxed{
\Omega_5
=\frac1{60}\operatorname{Im}\operatorname{Tr}(R^5-L^5)
=1,}
\]

and (\Omega_5\mapsto-\Omega_5\) under flux conjugation. This is the first coefficient-free orientation-sensitive Wilson scalar. A construction using only (Y^\dagger Y\) erases it.

### Full edge frame and KO-6 result

The unique (A_5\) frame of each directed edge transports the base charge plane by

\[
B_{f,s}=R_{3'}(p_s)B_{f,0}R_3(p_s)^{-1}.
\]

The resulting Haar history amplitude is (A_5\)-covariant with worst tested residual (7.95\times10^{-15}\). For an arbitrary complex history amplitude (M\), the four-block real completion (D_M\) has residual exactly zero for self-adjointness, odd grading, (J^2=+1\), (JD_M=D_MJ\), and (J\gamma=-\gamma J\).

This proves a theorem-level **F/no-go** for the previous immediate question: those KO-6 identities hold for every (M\), so they impose no equation on the relative phase in

\[
M(\varphi)=e^{i\varphi}M_5+M_{43}+i\chi M_{45}
\]

and do not determine how the rank-one species form contracts with ordered histories. A dynamical principle beyond KO-6 kinematics is required; no coefficient may be fitted.

### Blind flavour results and failed branches

For the canonical Haar history action, every reduced generation density satisfies

\[
\rho_f=I_3/3
\]

with maximum eigenvalue deviation (5.00\times10^{-16}\). This is exact by Schur's lemma, so its apparent CKM/PMNS eigenframes are undefined and must not be reported as physics.

As a diagnostic only, the stored 30-vacuum was inserted through its coefficient-free Ruelle equilibrium measure into the previously rejected positive rank-one Gram. The Markov residuals are (2.22\times10^{-16}\) for row normalization and (4.56\times10^{-16}\) for stationarity. Blind phase minimization gives

\[
\varphi_*=4.6946924503
=\frac{3\pi}{2}-0.0176965301,
\qquad
F_*=-1.07253106242922,
\]

with positive phase curvature (8.08\times10^{-3}\) and four conjugate/flux partners degenerate within (1.95\times10^{-13}\). This does **not** rescue the Gram. The vacuum orbit has size 30 and stabilizer (C_2\), field-invariance residual (4.56\times10^{-16}\). On the generation triplet its nonidentity element has spectrum ((1,-1,-1)\), enforcing a common (1\oplus2\) split for every species. Consequently only one real mixing angle can survive and the Jarlskog invariants vanish numerically ((|J|<6\times10^{-21})\). This 30-vacuum route is **F** as a complete flavour selector.

### Degree-five branch orientation and Pfaffian result — 2026-09-03

Status: **E/N for the algebra, exhaustive finite enumeration and residuals; F for coefficient selection from the presently declared KO-6/relative-information/Pfaffian data; U for the microscopic chiral operator that must repair it.**

On the branch-doubled history space define

\[
\mathbb W=\begin{pmatrix}L&0\\0&R\end{pmatrix},
\qquad
\tau_3=\begin{pmatrix}-I_{60}&0\\0&I_{60}\end{pmatrix}.
\]

All (2^5=32\) ordered words in (L,R\) were exhausted. Exactly two close on the regular 60-state (A_5\) history set:

\[
L^5=e^{-i\pi/6}I_{60},\qquad
R^5=e^{+i\pi/6}I_{60};
\]

the other 30 words have zero fixed states and zero trace. Therefore the real degree-five trace plane splits into exactly one reversal-even and one reversal-odd line,

\[
E_5=\frac1{120}\operatorname{ReTr}(\mathbb W^5)
=\frac{\sqrt3}{2},
\]

\[
\Omega_5=-\frac{i}{60}\operatorname{Tr}(\tau_3\mathbb W^5)=1.
\]

Hodge chirality is reversal-odd, so

\[
\boxed{
\dim\bigl[\text{real, gauge- and }A_5\text{-invariant,
reversal-even degree-five terms linear in }\chi\bigr]=1,
\qquad
S_5=\lambda\,\chi\Omega_5.}
\]

The branch orientation lifts consistently into KO-6 as

\[
\widehat\tau_3
=\operatorname{diag}(\tau_3,\tau_3,-\tau_3,-\tau_3),
\]

commuting with (D\) and the grading and anticommuting with (J\), all with zero numerical residual. Separate-branch gauge covariance has residual (1.22\times10^{-15}\), and (A_5\)-generator covariance has residual (1.47\times10^{-15}\).

The canonical finite chiral Pfaffian block obeys

\[
\operatorname{Pf}
\begin{pmatrix}0&-M^{\mathsf T}\\M&0\end{pmatrix}
=\det M
\]

in the present even dimensions. Since each branch consists of twelve five-cycles and the twelve pentagon phases sum to (\mp2\pi\),

\[
\det L=\det R=1
\]

to residuals below (2.3\times10^{-15}\). Hence the unshifted KO-6 Pfaffian and the full four-block determinant are exactly orientation-blind.

The most general minimal shifted witness already exposes the remaining freedom. For

\[
\mathcal A_s(a)=
\begin{pmatrix}
0&-[I-aU_s]^{\mathsf T}\\
I-aU_s&0
\end{pmatrix},
\qquad 0<a<1,
\]

\[
\frac{\operatorname{Pf}\mathcal A_R(a)}
{\operatorname{Pf}\mathcal A_L(a)}
=\left[
\frac{1-a^5e^{+i\pi/6}}
{1-a^5e^{-i\pi/6}}
\right]^{12},
\]

and therefore

\[
\boxed{
\frac{\chi}{2i}
\log\frac{\operatorname{Pf}\mathcal A_R(a)}
{\operatorname{Pf}\mathcal A_L(a)}
=-6a^5\chi\Omega_5+O(a^{10}).}
\]

Both the classical Haar value (a=1/2\) and the quantum Kraus/Stinespring amplitude (a=1/\sqrt2\) obey every stated symmetry and positivity condition, but give respectively

\[
\lambda_5=-\frac3{16},
\qquad
\lambda_5=-\frac3{2\sqrt2}.
\]

The determinant formulas are reproduced with residual below (1.14\times10^{-15}\). Thus the invariant direction and the normalization (\Omega_5=1\) are fixed, but the action coefficient is not. Relative information gives a unique Gibbs state after a positive cost is supplied; it does not select (a\), and the Pfaffian phase is not itself a bounded real KL cost. This is an exact underdetermination theorem for the declared principle, not permission to choose (\lambda\) from CKM/PMNS.

### Chiral Dirac, physical half-space and measure obstruction — 2026-09-03

Status: **E/N for the finite-history chirality, GW identities, \(A_4\)-root symbol and doubler classification; F for uniqueness from the five requested conditions; U for a microscopic measure/regulator principle that could supply the missing datum.**

Let \(S|a,b\rangle=|b,a\rangle\) reverse a directed dual edge. There is an \(A_5\)-covariant monomial intertwiner

\[
Q=\operatorname{diag}(d)S,
\qquad
QRQ^\dagger=L^\dagger,
\qquad
Q^\dagger LQ=R^\dagger.
\]

Reversal intertwining alone has nullity 12, one phase for each pentagon. Commutation with the two stored \(A_5\) generators reduces this to one global phase: the combined nullity is one, the next singular value is \(0.4749028553\), \(|d_i|=1\) within \(2.2\times10^{-15}\), and the worst intertwining/\(A_5\) residual is \(6.86\times10^{-15}\). Thus on the full branch-doubled history space

\[
\Gamma=
\begin{pmatrix}0&Q\\Q^\dagger&0\end{pmatrix},
\qquad
\Gamma^2=I,
\qquad
\Gamma\mathbb W\Gamma=\mathbb W^\dagger
\]

with worst residual \(1.20\times10^{-14}\). It transforms covariantly under arbitrary endpoint Hopf gauge changes; a generic gauge test has residual below \(1.6\times10^{-14}\).

For the strict affine one-step ansatz

\[
D_a=I-a\mathbb W,
\]

the standard Ginsparg--Wilson equation gives the exact identity

\[
\boxed{
\{\Gamma,D_a\}-D_a\Gamma D_a=(1-a^2)\Gamma.}
\]

Therefore its real solutions are \(a=\pm1\), and positive history hopping forces \(a=1\). At that point

\[
D_{\rm GW}=I-\mathbb W,
\qquad
\widehat\Gamma=\Gamma(1-D_{\rm GW})=\Gamma\mathbb W,
\]

with GW residual \(8.20\times10^{-15}\). The index is zero and the finite history operator has no internal zero mode; its smallest singular value is exactly

\[
2\sin\frac{\pi}{60}=0.1046719125\ldots.
\]

The physical chiral map is explicit. Isometries for the target \(P_+=(I+\Gamma)/2\) and source \(\widehat P_-=(I-\widehat\Gamma)/2\) half-spaces are

\[
U_+=\frac1{\sqrt2}\binom{Q}{I},
\qquad
V_-=\frac1{\sqrt2}\binom{-QR}{I},
\]

and

\[
\boxed{U_+^\dagger D_{\rm GW}V_-=I-R}
\]

to residual \(8.8\times10^{-15}\). This exact half-space does not produce the required phase. Rather,

\[
\det(I-L)=(1-e^{-i\pi/6})^{12},
\qquad
\det(I-R)=(1-e^{+i\pi/6})^{12},
\]

and both sides are the same negative real number. Hence

\[
\boxed{\frac{\det(I-R)}{\det(I-L)}=1}
\]

with residual \(2.91\times10^{-15}\). The Abel-continuous half-log ratio at \(a\uparrow1\) is \(-5\pi\), so the full ratio is \(e^{-10\pi i}=1\): the leading \(-6a^5\Omega_5\) term is canceled by the complete tower of higher \(5n\)-step closed walks. Strict one-step GW fixes \(a\), but precisely at an orientation-blind point.

GW itself does not restore uniqueness when strict one-step locality is relaxed. For every \(-1<t<1\),

\[
V_t=(\mathbb W-tI)(I-t\mathbb W)^{-1},
\qquad
D_t=I-V_t
\]

is unitary-kernel, gauge- and \(A_5\)-covariant and obeys the same GW equation. For \(t\ne0\) it is a pentagon-range rational function of \(\mathbb W\), and

\[
\frac{\det D_t(R)}{\det D_t(L)}
=\left[
\frac{1-t^5e^{-i\pi/6}}
{1-t^5e^{+i\pi/6}}
\right]^{12},
\qquad
\frac1{2i}\log\frac{\det D_t(R)}{\det D_t(L)}
=6t^5\Omega_5+O(t^{10}).
\]

The tested \(t=1/2\) and \(t=1/\sqrt2\) cases have GW residuals below \(9.1\times10^{-15}\) but different exact phase actions \(0.1926989514\) and \(1.2478752444\). Thus locality range trades against an unselected continuous orientation coefficient.

The independent \(A_4\)-root doubling test gives a second continuous freedom. For the ten positive primitive roots \(\alpha=e_i-e_j\), define

\[
S(p)=\frac15\sum_{i<j}\gamma(\alpha_{ij})\sin(p_i-p_j),
\qquad
B(p)=\frac15\sum_{i<j}[1-\cos(p_i-p_j)].
\]

The half-root tight frame is \(\sum_{i<j}\alpha_{ij}\otimes\alpha_{ij}=5I_{V_4}\), so \(S(p)=\gamma\!\cdot\!p+O(p^3)\). With \(Z=\sum_j e^{ip_j}\), \(S=0\) iff \(Z=0\) or all five phases split into two antipodal clusters, and

\[
\sum_{i<j}[1-\cos(p_i-p_j)]
=\frac{25-|Z|^2}{2}.
\]

The first nonphysical derivative zero is the \(1+4\) split, where \(B=8/5\); the next values are \(12/5\) and \(5/2\). Consequently the conventional overlap family

\[
A_m=iS+B-m,
\qquad
D_m=m\left[I+A_m(A_m^\dagger A_m)^{-1/2}\right]
\]

has one physical massless orbit and no root-lattice doublers for every

\[
0<m<\frac85.
\]

All members have the same normalized \(i\gamma\cdot p\) principal symbol. More strongly, fixing both that coefficient and the standard GW radius to one still leaves

\[
A_r=iS+rB-1,
\qquad
D_r=I+A_r(A_r^\dagger A_r)^{-1/2},
\qquad
r>\frac58.
\]

The witnesses \(r=3/4,1,2\) all have standard-GW residual below \(4.5\times10^{-16}\), principal-symbol residual below \(6.7\times10^{-13}\), and no doublers. The \(A_4\) geometry therefore does not select the Wilson/overlap kernel.

Finally, the projectors do not determine the fermionic measure. Replacing the chiral frames by

\[
U_+\mapsto U_+B_+,
\qquad
V_-\mapsto V_-B_-
\]

multiplies the determinant by \(\det(B_+^\dagger)\det(B_-)\) without changing either half-space. In particular the gauge-, \(A_5\)- and reversal-compatible factor

\[
\boxed{\exp(i\lambda\chi\Omega_5),\qquad\lambda\in\mathbb R}
\]

is an allowed measure/counterterm phase. A direct arbitrary-phase witness is reproduced to \(2.69\times10^{-15}\). The missing \(\chi\Omega_5\) coefficient is therefore exactly the unfixed determinant-line trivialization, not a number hidden in the existing symmetry identities.

This closes the stronger requested **F/no-go**: the five conditions do not select one microscopic chiral Dirac/measure pair. No flavour observable may be computed from an arbitrarily chosen member.

### Determinant-line topology and anomaly result — 2026-09-03

Status: **E/N for the divisor and winding; F for selection of the local measure phase or overlap kernel from anomaly/index data alone.**

Let a branch holonomy vary as \(z\in\mathbb C^*\), with twelve five-cycles satisfying \(U_z^5=zI_{60}\). For the full GW Möbius family the chiral determinant is exactly

\[
F_t(z)=\det\!\left[I-(U_z-tI)(I-tU_z)^{-1}\right]
=(1+t)^{60}\frac{(1-z)^{12}}{(1-t^5z)^{12}},
\qquad -1<t<1.
\]

For every admissible \(t\), \(F_t\) has the same zero of order 12 at \(z=1\), no pole in the closed unit disk, and small-loop winding 12. Moreover

\[
\frac{F_t(z)}{F_0(z)}
=\frac{(1+t)^{60}}{(1-t^5z)^{12}}
\]

is holomorphic and nowhere zero there, with winding zero. Direct \(60\times60\) determinant checks at \(t=0,1/2,1/\sqrt2,-1/2\) reproduce the formula within \(1.22\times10^{-14}\); fitted zero orders lie between \(11.999976\) and \(12.000168\), and all computed small-loop windings equal 12 exactly to displayed precision. Nevertheless their Hopf-point half-phases are respectively \(0\), \(0.1926989514\), \(1.2478752444\), and \(-0.1825452607\).

On the unitary flux locus \(z=e^{i\vartheta}\),

\[
\Omega_5=-i(z-z^{-1})=2\sin\vartheta.
\]

The allowed measure factor

\[
C_\lambda(z)=\exp(i\lambda\chi\Omega_5)
\]

is periodic, nowhere zero and has winding zero for every real \(\lambda\). The explicit \(\lambda=0.731\) witness has modulus one within \(2.2\times10^{-16}\), large-gauge periodicity residual \(3.58\times10^{-16}\), and winding below \(3.6\times10^{-17}\). It therefore changes the local orientation phase without changing any divisor, index or anomaly class.

The pre-GW regulator \(\det(I-aU_z)=(1-a^5z)^{12}\) makes the missing input visible: its order-12 zero lies outside the unit disk for \(a<1\), on the unit circle at \(a=1\), and inside for \(a>1\). Choosing the regulator side is extra boundary data. Likewise, the connected gapped \(A_4\) interval \(r>5/8\) has constant overlap index, so its topology cannot select one \(r\). The full conjugate KO-6 completion gives a positive power of \(|F_t|^2\) on the unitary locus and cancels the chiral phase entirely.

Thus

\[
\boxed{
\text{anomaly/index data determine the determinant-line topology,
not its local trivialization or }\lambda.}
\]

Naming anomaly inflow is not a repair. A specified microscopic bulk/regulator, its independently derived level, and a fixed boundary phase convention would be genuinely new data.

### Haar Stinespring/Szegedy dilation result — 2026-09-03

Status: **E/N for the canonical dilation and spectra; F for selection of the orientation action by the closed Haar channel.**

On the 120 allowed transitions over the 60 directed history states, define two isometries \(A,B:\mathbb C^{60}\to\mathbb C^{120}\) so that \(A\) assigns the two outgoing branches amplitude \(1/\sqrt2\), \(B\) assigns the corresponding incoming Hopf amplitudes, and

\[
A^\dagger B=T=\frac{L+R}{2}.
\]

The isometry/overlap residuals are below \(1.72\times10^{-15}\), full \(A_5\)-intertwining residuals below \(1.66\times10^{-15}\), and generic endpoint-gauge covariance residual below \(3.77\times10^{-15}\). The coefficient-free Szegedy completion is

\[
R_A=2AA^\dagger-I,
\qquad
R_B=2BB^\dagger-I,
\qquad
U_S=R_BR_A.
\]

With \(\Gamma_S=R_A\),

\[
\Gamma_SU_S\Gamma_S=U_S^\dagger,
\qquad
D_S=I-U_S
\]

obeys the standard GW equation with residual \(9.55\times10^{-15}\). However, if \(P=L^\dagger R\), then

\[
P^3=I,
\qquad
\operatorname{spec}P=\{1,\omega,\omega^2\}
\quad\text{with multiplicities }(20,20,20),
\]

and

\[
T^\dagger T=\frac12I+\frac14(P+P^\dagger).
\]

Thus the singular values of \(T\) are \(1\) with multiplicity 20 and \(1/2\) with multiplicity 40. The Szegedy spectrum is consequently

\[
\operatorname{spec}U_S={1,e^{+2\pi i/3},e^{-2\pi i/3}\}
\quad\text{with multiplicities }(40,40,40),
\]

and \(U_S^3=I\) to residual \(1.32\times10^{-14}\). Hence \(D_S\) has 40 zero modes. The physical chiral block has singular values \(0\) with multiplicity 20 and \(\sqrt3\) with multiplicity 40, so its rank is 40 and its kernel dimension is 20.

This spectrum depends only on \(T^\dagger T\); flux conjugation changes no eigenvalue (zero measured spectral residual). The canonical range-only dilation therefore erases \(\Omega_5\) and is also rank-deficient.

Retaining the full Stinespring unitary does not help. With

\[
K=\frac1{\sqrt2}\binom LR,
\qquad
K_\perp=\frac1{\sqrt2}\binom L{-R},
\]

every unitary completion is

\[
\boxed{U_C=[K,K_\perp C],\qquad C\in U(60).}
\]

The regular \(A_5\) history representation leaves a large right-group-algebra commutant; even the local scalar family \(C=e^{i\varphi}I\) is continuously gauge- and \(A_5\)-covariant. Requiring the same fixed scalar completion to be carried to its complex conjugate restricts it to the two real choices \(\varphi=0,\pi\), but both are flux-even and orientation-blind. Pairing conjugate Hodge sectors as \(C_\chi=e^{i\chi\varphi}I\) preserves reversal for every \(\varphi\), so the continuous freedom returns.

Therefore the Haar probability \(1/2\) does canonically produce amplitudes \(1/\sqrt2\), but its coefficient-free unitary dilation either loses the ordered Wilson phase or introduces an arbitrary completion. It does not select the microscopic Dirac/measure pair.

### Unique polar-history completion — 2026-09-03

Status: **E/N for the exact polar reduction and covariance; F for orientation/action selection.**

Because \(T=(L+R)/2=L(I+P)/2\) with \(P=L^\dagger R\) and \(P^3=I\), let

\[
\Pi_1=\frac{I+P+P^2}{3}.
\]

Then the polar decomposition is exact:

\[
|T|=\frac{I+\Pi_1}{2},
\qquad
C=\operatorname{polar}\!\left(\frac{I+P}{2}\right)
=P_{\rm principal}^{1/2},
\qquad
\boxed{V_T=LC=T(T^\dagger T)^{-1/2}.}
\]

The minimum singular value of \(T\) is \(1/2\), so \(V_T\) is unique and is the unique Frobenius-nearest unitary. The exact/numerical polar formulas agree to \(3.53\times10^{-15}\); unitarity, reconstruction and \(P^{1/2}\)-squaring residuals are below \(5.39\times10^{-15}\). \(A_5\), generic endpoint-gauge and flux-conjugation residuals are below \(4.42\times10^{-15}\).

Uniqueness does not preserve the orientation invariant. The spectrum of \(V_T\) is conjugate-paired to residual \(1.12\times10^{-15}\), \(\det V_T=1\), and every \(\operatorname{Tr}V_T^k\) for \(1\le k\le60\) is real within \(6.76\times10^{-15}\). In particular

\[
\operatorname{Tr}V_T^5
=13.6853397141\ldots+O(10^{-16})i,
\qquad
\operatorname{ImTr}V_T^5=0.
\]

There are ten eigenvalues \(V_T=1\), hence ten zero modes of \(I-V_T\); the universal forward/backward GW lift

\[
\mathbb V_T=\operatorname{diag}(V_T,V_T^\dagger),
\qquad
\Gamma=\begin{pmatrix}0&I\\I&0\end{pmatrix}
\]

has GW residual \(7.57\times10^{-15}\), twenty zero modes and no orientation phase. Thus the unique polar completion symmetrizes away the ordered Wilson information and cannot freeze \(\lambda\).

### Foundational microscopic-axiom audit — 2026-09-03

Status: **E for the finite-dimensional insufficiency identities; F for every recovered candidate as a selector of the missing coefficient; U at a genuinely new-axiom boundary.**

The authoritative live state, master index, full claim ledger, dated solver, two foundational reconstructions, master verifier, recovered \(A_4\) Clifford script and historical global-modular scripts were audited. No recoverable pre-2026-09-03 declaration was found of a KMS/Tomita boundary condition, reflection-positive fermion action, Pauli--Villars/domain-wall regulator, anomaly-inflow bulk, determinant-line normalization or fermion-measure convention. This is an archive-retrieval statement, not a claim about any lost or unindexed source.

The recovered candidates do not fill the gap:

- The relative-information theorem \(F_\eta(\rho)=D(\rho\Vert\rho_0)+\eta\operatorname{Tr}(\rho K)\) gives a unique Gibbs state only after \(\rho_0,K,\eta\), the trace domain and normalization are supplied. Ledger entry C-2026-08-12 explicitly leaves the physical \(K_{\rm URT}\) and finite \(D_X\) open.
- The candidate \(K_{\rm URT}=\widehat C_{\rm closure}+D_X^\dagger D_X\) contains the unknown operator inside a positive square; it cannot select that operator and is flux-conjugation even.
- The hidden Gibbs identities at \(\eta_\Delta=-\log\Delta\) are exact for their stated costs, but no declared map identifies \(\eta_\Delta\) with a history hop, overlap mass, Wilson coefficient, regulator boundary or determinant phase.
- The historical “global modular” construction defines \(K_Q=\log[(I-Q)/Q]\) only after constructing and averaging a Gaussian occupation \(Q\). Ledger entry C-2026-08-09 already marks its flavour claim **F/NO_GO**. It is not an independently specified modular flow or KMS boundary condition.
- The dated \(A_4\) regulator supplies only a positive scalar Laplacian and explicitly states that the chiral lattice Dirac is absent. The finite exterior Clifford amplitude is an internal carrier, not that regulator.
- The recovered hypercharge anomaly calculation is conditional representation arithmetic, not an anomaly-inflow bulk or determinant-line trivialization.

There are two exact general obstructions. First, if flux reversal gives \(M_-=\overline{M_+}\), then

\[
K_-=M_-^\dagger M_-=\overline{K_+},
\]

so the Hermitian spectra coincide. Therefore every real \(\operatorname{Tr}f(K)\), Gibbs partition function, relative-information minimum and positive spectral action is flux-even. A random complex witness gives zero spectrum and partition-function mismatch to displayed floating precision.

Second, for every faithful density matrix and every \(\beta>0\),

\[
H_\beta=-\frac1\beta\log\rho+cI
\qquad\Longrightarrow\qquad
\rho=\frac{e^{-\beta H_\beta}}{\operatorname{Tr}e^{-\beta H_\beta}}.
\]

Thus a state called modular or KMS does not select its inverse-temperature scale or Hamiltonian normalization. The tested \(\beta=1/2,1,2,5\) reconstructions agree within \(6.17\times10^{-16}\) while the corresponding Hamiltonian norms span a factor ten.

The precise boundary is now:

\[
\boxed{
\text{current premises determine }\chi\Omega_5\text{ and its covariance class,
but not a regulator point or its determinant-line phase.}}
\]

The minimum genuinely new input is a microscopic fermion action or higher-dimensional regulator specified independently of flavour observations, including its kernel normalization, boundary conditions and measure phase. It must yield a unique equation, not merely name a framework. In particular it is forbidden to identify \(\eta_\Delta\) with a hop without a derived map, choose \(1/2\) or \(1/\sqrt2\) because both occur elsewhere, truncate the determinant without a controlled expansion, select an overlap point by convention, or fit \(\lambda\), masses, CKM or PMNS.

### Oriented domain-wall / recursive-history boundary audit — 2026-09-03

Status: **E/N for the history-boundary obstruction, wall profiles, overlap limit and transfer identities; C for the externally motivated regulator candidate; F for selecting the microscopic action merely by naming domain-wall or anomaly inflow.**

The standard domain-wall/overlap machinery was introduced only as an explicitly new candidate, not silently adopted as a URT axiom. Its method provenance was checked against Kaplan, Furman--Shamir and Neuberger; no observational target was used.

The first result is intrinsic to the existing 60-state history carrier. Each branch transfer is a disjoint union of twelve five-cycles, with

\[
\operatorname{Tr}L^5=60e^{-i\pi/6},
\qquad
\operatorname{Tr}R^5=60e^{+i\pi/6},
\qquad
\frac{\operatorname{Tr}R^5-\operatorname{Tr}L^5}{60i}
=\Omega_5=1
\]

to residual \(2.3\times10^{-16}\). A local wall is a diagonal projector on history states. Commutation with the two stored \(A_5\) generators gives a rank-59 constraint matrix on its 60 diagonal entries: the nullity is one and the next singular value is \(0.4749028553\). Thus the only local \(A_5\)-invariant projectors have rank 0 or 60. There is no local invariant rank-12 choice selecting one boundary site per pentagon.

Cutting one edge in each pentagon makes twelve open five-site chains, but the representative rank-12 boundary projector and open shift have generator-commutator norm

\[
2\sqrt2=2.8284271247\ldots,
\]

while

\[
L_{\rm open}^5=0,
\qquad
\operatorname{Tr}L_{\rm open}^5=0
\]

exactly. Hence the same finite history coordinate cannot simultaneously provide a domain wall and retain the ordered Wilson invariant:

\[
\boxed{
\text{periodic history preserves }\Omega_5\text{ but has no wall;}
\quad
\text{a local cut creates a wall but breaks }A_5\text{ and erases }\Omega_5.}
\]

Adding an independent wall coordinate avoids that local obstruction but introduces new data. For the \(A_4\)-root symbol the tested kernel was

\[
A_{r,M}(p)=iS(p)+[rB(p)-M]I,
\qquad
H_{r,M}=\gamma_5A_{r,M}.
\]

The exact \(A_4\) single-orbit chamber is

\[
r>0,\qquad 0<M<\frac{8r}{5},
\]

and the half-line surface profile is \(\psi_s\propto(1-M)^s\), normalizable for \(0<M<2\). The combined chamber is therefore

\[
r>0,\qquad 0<M<\min\!\left(2,\frac{8r}{5}\right).
\]

A finite open slab has a rank-2 Weyl sector on each wall, not one isolated sector. At \(M=1\) and wall extent eight, the four boundary zero modes are exact. An end-to-end boundary mass \(m_f=0.1\) lifts all four to singular value \(0.1\), while the heavy/PV choice \(m_f=1\) lifts them to 1. Both obey reflection-\(\gamma_5\) Hermiticity exactly. Choosing one wall, its extent and \(m_f\) is extra boundary data.

The infinite-wall limit is

\[
D_\infty
=I+\gamma_5\operatorname{sign}H_{r,M}
=I+\frac{A_{r,M}}{\sqrt{A_{r,M}^\dagger A_{r,M}}}.
\]

Fixing the conventional GW radius and the \(i\gamma\!\cdot\!p\) coefficient sets \(M=1\), but every \(r>5/8\) remains. The witnesses \(r=3/4,1,2\) all have \(A_5\)-root covariance residual below \(1.8\times10^{-16}\), overlap GW residual below \(1.5\times10^{-15}\), and principal-symbol residual below \(6.7\times10^{-13}\).

At finite wall extent the transfer formula

\[
T_{a_5}=(I-a_5H)(I+a_5H)^{-1},
\qquad
\varepsilon_{L_s}
=\frac{I-T_{a_5}^{L_s}}{I+T_{a_5}^{L_s}}
=\tanh[L_s\operatorname{artanh}(a_5H)]
\]

is reproduced within \(1.25\times10^{-13}\). Different \(a_5\) values give different finite operators at the same \(L_s\), and different extents give different residual chiral violations. Neither datum is selected.

Finally, the inherited determinant-line winding remains 12, but

\[
\exp(i\lambda\chi\Omega_5),\qquad \lambda\in\mathbb R,
\]

is still periodic, nowhere zero and winding-free. Three direct witnesses have modulus one and periodicity residual below \(5.6\times10^{-16}\). A vectorlike reflection/KO-6 slab retains reality but cancels the phase; isolating one chiral boundary determinant reintroduces the measure choice.

The uniqueness verdict is therefore **F/no-go**. A domain-wall label does not supply a unique action: it leaves the wall realization, \(r,a_5,L_s,m_f\), gauge-link bulk action and \(\lambda\) unselected. The phenomenology gate remains closed.

### Nonlocal equivariant boundary-projector closure — 2026-09-03

Status: **E/N for the regular-representation classification, cyclic spectral projectors, reversal and gauge tests; C for the principal-log spectral-band rule; F for a unique nonlocal wall or determinant measure.**

The two stored generators produce 60 distinct monomial action matrices. The identity character is 60 and every nonidentity character is zero, so the history carrier is the regular representation and its commutant has dimension 60:

\[
\mathbb C[A_5]
\cong
V_1\otimes\mathbb C^1
\oplus V_3\otimes\mathbb C^3
\oplus V_{3'}\otimes\mathbb C^3
\oplus V_4\otimes\mathbb C^4
\oplus V_5\otimes\mathbb C^5.
\]

Every \(A_5\)-equivariant orthogonal projector has the form

\[
P=\bigoplus_\rho I_{d_\rho}\otimes P_\rho,
\]

where \(P_\rho\) is an arbitrary projector on the multiplicity space \(\mathbb C^{d_\rho}\). Its rank is

\[
k_1+3k_3+3k_{3'}+4k_4+5k_5.
\]

There are exactly 11 allowed multiplicity-rank patterns with total rank 12. Every component is continuous: their real Grassmannian dimensions range from 4 to 18. Thus \(A_5\) covariance supplies no isolated nonlocal rank-12 projector.

The five most structured examples are the cyclic Fourier bands

\[
P_k(L)=\frac15\sum_{n=0}^4\lambda_k^{-n}L^n,
\qquad
\lambda_k=\exp i\!\left(-\frac{\pi}{30}+\frac{2\pi k}{5}\right).
\]

Each is Hermitian and idempotent to residual below \(5.5\times10^{-15}\), has rank 12, commutes with \(A_5\) below \(1.1\times10^{-15}\), transforms under a generic endpoint gauge below \(9.3\times10^{-16}\), and is paired by reversal as

\[
Q P_k(R)Q^\dagger=P_{-k}(L)
\]

below \(5.2\times10^{-15}\). Every band retains normalized \(\Omega_5=1\). None is a local wall: every diagonal entry is \(1/5\), every row has support on all five sites of a pentagon, and the off-diagonal norm is \(3.0983866769\ldots\).

Inside the additional subclass “one complete band \(P=f(L)\), selected by the principal logarithm,” the minimum absolute phase does uniquely choose \(k=0\):

\[
\arg\lambda_0=-\frac{\pi}{30},
\qquad
\arg\mu_0=+\frac{\pi}{30}.
\]

The next absolute-angle gap is \(\pi/3\). The restricted spectral-band determinant ratio is

\[
\left(\frac{1-e^{+i\pi/30}}{1-e^{-i\pi/30}}\right)^{12}
=e^{2\pi i/5},
\]

so its candidate half-phase is

\[
\boxed{\frac{\pi}{5}}.
\]

This is **C**, not a physical prediction. The principal-band rule is new input not implied by \(A_5\), and the selected operator has nonzero gap

\[
|1-e^{-i\pi/30}|=2\sin\frac{\pi}{60}
=0.1046719125\ldots;
\]

it is a delocalized low-phase Fourier sector, not a chiral wall zero mode.

The remaining continuous freedom is explicit. Let

\[
U_\alpha=\exp\!\left[\frac{i\alpha}{2}(R+R^\dagger)\right],
\qquad
P_L(\alpha)=U_\alpha P_0(L)U_\alpha^\dagger,
\qquad
P_R(\alpha)=Q^\dagger P_L(\alpha)Q.
\]

For \(\alpha=0,0.2,0.5,1\), rank, Hermiticity, idempotence, \(A_5\) covariance, endpoint-gauge covariance and reversal pairing hold below \(8.7\times10^{-15}\), while normalized \(\Omega_5=1\) within \(4.5\times10^{-16}\). At nonzero \(\alpha\), every row has 51 nonzero entries and \([P_L,L]\ne0\). This identifies exactly what the extra principal-band postulate removes; the current symmetry data do not remove it.

Even after imposing that postulate, a determinant-line frame rotation or

\[
\exp(i\lambda\chi\Omega_5)
\]

changes the \(\pi/5\) candidate continuously without changing the projector, covariance, index or winding. Therefore the nonlocal route is also **F/no-go** for freezing the microscopic action and measure.

### \(A_4\) spectral-locality minimax candidate — 2026-09-03

Status: **E for the invariant reduction, both sharp envelopes, equality classification and the algebraic minimax theorem; C for adopting global condition-number minimization as a microscopic selection axiom; N for the independent full-torus corroboration.**

On the normalized overlap slice \(M=1,\ r>5/8\), let

\[
Z=\sum_{j=1}^5e^{ip_j},
\qquad
B=\frac{25-|Z|^2}{10},
\qquad
S_j=\frac15\operatorname{Im}(e^{ip_j}\overline Z).
\]

Then the Hermitian Wilson kernel satisfies

\[
H_r(p)^2=\|S(p)\|^2+[rB(p)-1]^2.
\]

Rotating \(Z=\rho\) to the real axis and applying Cauchy gives the exact upper bound

\[
\|S\|^2
=\frac{\rho^2}{25}\sum_j\sin^2p_j
\le 2B-\frac45B^2.
\]

The sharp lower envelope is

\[
\|S\|^2\ge 2B-\frac54B^2,
\qquad 0\le B\le\frac85,
\]

with equality exactly on a two-phase \(1+4\) cluster, up to common phase, permutation and conjugation. Beyond \(B=8/5\) its right side is nonpositive. This is now **E**.

For the proof, rotate \(Z=\rho>0\), write \(z_j=x_j+iy_j\), and put

\[
Y=\sum_jy_j^2,
\qquad
a=\frac{\rho^2-15}{2\rho}.
\]

The four-vector resultant bound gives

\[
|Z-z_j|\le4
\quad\Longrightarrow\quad
x_j\ge a,
\]

and the desired statement is equivalent to

\[
Y\ge \frac54(1-a^2)
=\frac{5(25-\rho^2)(\rho^2-9)}{16\rho^2}.
\]

If one vector points backward, write its longitudinal component as \(x_1=-u\). There can be at most one such vector for \(\rho\ge3\), and \(u\le-a\). Since \(y_1=-\sum_{j>1}y_j\), Cauchy gives

\[
Y\ge y_1^2+\frac{y_1^2}{4}
=\frac54(1-u^2)
\ge\frac54(1-a^2).
\]
Equality forces the other four transverse components to agree and \(|Z-z_1|=4\), hence the four phases coincide.

For the all-forward case, the exact auxiliary moment inequality is

\[
\sum_{j=1}^5u_j^4
\le\frac{13}{20}\left(\sum_{j=1}^5u_j^2\right)^2,
\qquad \sum_ju_j=0.
\]

Its proof is finite: after normalizing the second moment, a fourth-moment maximizer satisfies the depressed cubic

\[
4u^3-2\alpha u-\beta=0.
\]

Two occupied roots with multiplicities \(1+4\) and \(2+3\) give ratios \(13/20\) and \(7/30\); three occupied roots have multiplicities \(3+1+1\) or \(2+2+1\) and give \(1/2\) or \(1/4\). Thus \(13/20\) is sharp, with equality only for a permutation and scaling of \((4,-1,-1,-1,-1)\).

For \(a\ge0\), set \(c=1-a^2\), \(u_j=y_j/\sqrt c\), \(b=\sqrt{1-c/16}\), and \(h(v)=\sqrt{1-cv}\). The quadratic Hermite minorant \(q(v)=A+Bv+Cv^2\), fixed by

\[
q(1)=a,
\qquad q(1/16)=b,
\qquad q'(1/16)=h'(1/16),
\]

has \(B,C<0\), \(0<A\le1\), and the exact factorization

\[
h(v)^2-q(v)^2
=\left(v-\frac1{16}\right)^2(1-v)
\left[C^2v+256(1-A^2)\right]\ge0.
\]

Therefore, if \(E=\sum u_j^2\le5/4\),

\[
\sum_jh(u_j^2)
\ge5A+\frac54B+\frac{65}{64}C
=a+4b=\rho.
\]

Equality rigidity forces \(E=5/4\) and the same \(1+4\) vector. If \(\rho<\sqrt{15}\) while all \(x_j\ge0\), the \(a=0\) version would force \(\rho\ge\sqrt{15}\) whenever \(Y\le5/4\); hence this remaining case is strictly above the target. Finally,

\[
\|S\|^2=\frac{\rho^2Y}{25}
\ge\frac{(25-\rho^2)(\rho^2-9)}{80}
=2B-\frac54B^2.
\]

The exact proof is emitted by `urt_a4_lower_envelope_proof.py`; its deterministic factor audit has maximum squared-factorization residual below \(1.1\times10^{-13}\), and its rational root certificate is byte-identical on rerun.

The minimum of \(H_r^2\) moves off the \(B=8/5\) doubler boundary at

\[
r_{\rm entry}=\frac{5+\sqrt{185}}{16}
=1.1625919068\ldots.
\]

For \(r\ge r_{\rm entry}\),

\[
h_{\min}^2(r)=\frac{2r-9/4}{r^2-5/4},
\qquad
h_{\max}^2(r)=\left(\frac52r-1\right)^2.
\]

Stationarity of their ratio reduces exactly to

\[
240r^3-392r^2-28r+185=0.
\]

On the admissible branch the derivative polynomial is strictly increasing. Its unique zero is rationally isolated in

\[
1.16954339716037<r_\star<1.16954339716038,
\]

so

\[
\boxed{r_\star=1.169543397160372\ldots}.
\]

At this point

\[
B_{\min}=1.4388599497\ldots,
\quad
h_{\min}^2=0.7560507961\ldots,
\quad
h_{\max}^2=3.7012315007\ldots,
\]

and

\[
\kappa(H)=\sqrt{\frac{h_{\max}^2}{h_{\min}^2}}
=2.2125731475\ldots.
\]

Independent differential-evolution searches on all four relative phases reproduce the analytic minimum and maximum within \(6.2\times10^{-13}\) and \(2.8\times10^{-13}\). The minimum is the predicted \(1+4\) cluster; the maximum has \(Z=0\), \(B=5/2\). At \(r_\star\), the overlap operator has GW residual \(1.77\times10^{-16}\), \(A_5\)-root covariance below \(1.8\times10^{-16}\), principal-symbol residual \(2.48\times10^{-13}\), and positive first-doubler margin \(0.8712694355\ldots\).

Thus the target-blind algebraic minimax theorem is now **E conditional on one new statement only**: the axiom “minimize global kernel condition number.” That selection principle is not a recovered URT premise. Its adoption would still not determine the history Möbius parameter \(t\), wall transfer data, gauge-link bulk action or determinant-line phase \(\lambda\). The phenomenology gate remains closed.

### Complex-momentum locality audit — 2026-09-03

Status: **E for the analytic continuation and symmetry-reduced zero equations; N for the nearest-zero search and locality-proxy optimum; U for a certified full-complex-torus radius.**

Continue the normalized kernel holomorphically, without complex conjugation:

\[
F_r(q)=\sum_{\mu=1}^4 S_\mu(q)^2+[rB(q)-1]^2,
\qquad q\in V_{4,\mathbb C}.
\]

Every zero of \(F_r\) is a branch singularity of the overlap polar factor and therefore gives an upper bound on its analytic strip. The audit uses the canonical \(A_5\)-invariant Euclidean radius

\[
\tau(r)=\inf_{F_r(p+i\eta)=0}\|\eta\|_{V_4}.
\]

For a two-cluster split with multiplicities \(k+(5-k)\), phase difference \(w\), and

\[
B=\frac{k(5-k)}5(1-\cos w),
\]

the zero equation reduces exactly to

\[
1+2(1-r)B+left(r^2-\frac5{k(5-k)}\right)B^2=0,
\]

with strip distance

\[
\tau_k=\sqrt{\frac{k(5-k)}5}\,|\operatorname{Im}w|.
\]

These \(1+4\) and \(2+3\) slices are not sufficient. Deterministic eight-variable minimization finds a closer antipodal \(1+1+3\) stratum. Up to permutation and overall shift it is

\[
q=(\pi+iu,iv,0,0,0).
\]

On this stratum,

\[
B=\frac{7+\cosh(u-v)+3\cosh u-3\cosh v}{5},
\]

\[
\mathcal D=\frac1{25}\left[
(\sinh(u-v)+3\sinh u)^2
(\sinh(u-v)+3\sinh v)^2
3(\sinh u-\sinh v)^2
\right],
\]

\[
F_r=(rB-1)^2-\mathcal D,
\qquad
\|\eta\|^2=\frac{4u^2+4v^2-2uv}{5}.
\]

At the exact condition-number coefficient \(r_\star\), constrained stationarity gives

\[
u=0.2707404557\ldots,qquad
v=0.9671381952\ldots,qquad
\tau=0.8379665698\ldots.
\]

The rising \(1+1+3\) radius meets the falling \(2+3\) radius at

\[
r_{\rm loc}=1.311415007159700\ldots,
\qquad
\tau_{\rm loc}=0.941739439163908\ldots,
\]

where

\[
u=0.3017774555\ldots,qquad
v=1.0869846169\ldots.
\]

The crossing residual is below \(3.9\times10^{-16}\). Forty deterministic full-complex multistarts at each coefficient all converge to the displayed \(1+1+3\) orbit; best kernel-square residuals are below \(1.0\times10^{-13}\). Within the three explicit singular families, \(r_{\rm loc}\) improves the radius by \(12.3839\%\) over \(r_\star\).

The full stationarity audit can be written symmetrically. With

\[
z_j=e^{iq_j},\qquad P_m=\sum_jz_j^m,\qquad
X=P_1P_{-1},\qquad Q=r(25-X)-10,
\]

the holomorphic kernel square has the exact Laurent form

\[
100F_r=-P_{-1}^2P_2-P_1^2P_{-2}+10X+Q^2.
\]

If \(g_j=\partial F/\partial q_j\), the KKT equations at a regular nearest zero reduce, after removing the common mode, to

\[
\kappa\left(g_j-\frac15\sum_kg_k\right)=2i\eta_j
\]

for one complex multiplier \(\kappa\). Since \(\eta_j=-\log|z_j|\), the norm constraint makes this system transcendental even though \(F\) and \(g\) are Laurent polynomials. Thus \(A_5\) symmetry alone does not force a two-cluster classification.

At \(r_\star\) and \(r_{\rm loc}\), the \(1+1+3\) witnesses satisfy this full KKT equation with residuals \(2.49\times10^{-16}\) and \(2.38\times10^{-16}\). The six constrained tangent-Hessian eigenvalues are respectively

\[
(0.133829,0.133829,0.475907,1.524093,1.866171,1.866171)
\]

and

\[
(0.034615,0.143897,0.143897,1.856103,1.856103,1.965385).
\]

All are positive, so both are strict local minima in the full eight-real-dimensional problem. The unresolved statement is global exclusion of a different, nearer zero.

This is not yet a global proof of \(\tau(r)\), so \(r_{\rm loc}\) is **N**, not **E**. It is already enough to expose a new axiom ambiguity: “minimize the real-torus condition number” and “maximize the searched complex analytic radius” are inequivalent target-blind prescriptions. No recovered rule chooses between them, so neither coefficient is silently adopted.

### Next executable calculation

Certify or refute the numerical complex-radius candidate by proving that no zero with \(\|\operatorname{Im}q\|<0.9417394391\) lies outside the \(1+1+3\) and \(2+3\) strata at \(r_{\rm loc}\). The KKT equation is now exact; the remaining task is a permutation-stratified interval exclusion over its transcendental branches. Success promotes \(r_{\rm loc}\) only **conditional on a second, distinct locality axiom**; failure replaces the candidate with the discovered nearer branch. This remains target-blind and still cannot freeze \(\lambda\).

Masses and CKM/PMNS remain quarantined until this orientation-sensitive joint action is frozen.

### URT uniform-contraction selector and certified locality — 2026-09-04

Status: **E for the relaxation/condition-number equivalence and the explicit zero-free strip; C/P for declaring maximal uniform contraction to be the fundamental microscopic URT law.**

Make the standing statement “URT is the selection principle” mathematically precise on the already normalized \(M=1\) overlap family: among admissible \(r\), select the member with the smallest worst-mode contraction after optimizing the overall relaxation step. Write

\[
a(r)=h_{\min}^2(r)=\frac{2r-9/4}{r^2-5/4},
\qquad
b(r)=h_{\max}^2(r)=\left(\frac52r-1\right)^2.
\]

For the positive quadratic flow with Hessian \(H_r^2\), the Richardson update

\[
\psi_{n+1}=(I-\alpha H_r^2)\psi_n
\]

has the unique optimal scale and worst-mode factor

\[
\alpha_*(r)=\frac{2}{a(r)+b(r)},
\qquad
\rho_*(r)=\frac{b(r)-a(r)}{b(r)+a(r)}.
\]

Both \(\rho_*\) and every other strictly increasing condition-number convergence factor are monotone functions of

\[
K(r)=\frac{b(r)}{a(r)}
=\frac{(5r-2)^2(4r^2-5)}{4(8r-9)}.
\]

The exact derivative identity is

\[
\frac{K'(r)}{K(r)}
=\frac{10}{5r-2}+\frac{8r}{4r^2-5}-\frac8{8r-9},
\]

whose combined numerator is

\[
2\left(240r^3-392r^2-28r+185\right).
\]

Therefore the sharp-envelope theorem already proves that maximal uniform contraction selects the same unique coefficient

\[
\boxed{r_{\rm URT}=r_\star=1.169543397160372\ldots.}
\]

At this point

\[
\alpha_*=0.44870391122343\ldots,
\qquad
\rho_*=0.66075705071063\ldots.
\]

For the corresponding positive \(|H|\) interval, the optimal scale-free factor is

\[
\rho_{|H|}
=\frac{h_{\max}-h_{\min}}{h_{\max}+h_{\min}}
=0.37744608195463\ldots.
\]

At the searched strip candidate \(r_{\rm loc}\), the \(H^2\) and \(|H|\) factors are respectively \(0.73482501845573\ldots\) and \(0.43785018416512\ldots\), worse by \(11.2096\%\) and \(16.0034\%\). Thus \(r_{\rm loc}\) is not a competing selector under the explicit URT contraction rule; it remains a diagnostic for the largest complex strip.

Locality itself is now certified at \(r_\star\), without claiming the exact nearest singularity. For \(q=p+i\eta\), every \(A_4\) root satisfies \(|\alpha\cdot\eta|\le\sqrt2\|\eta\|\). With

\[
d_S=2\sqrt2\sinh(\sqrt2\|\eta\|),
\qquad
d_B=2\sinh(\sqrt2\|\eta\|),
\]

the exact real-torus bound \(\|S(p)\|\le\sqrt5/2\) gives

\[
|F_r(p+i\eta)-F_r(p)|
\le d_S(\sqrt5+d_S)
+r d_B\left[2\left(\frac52r-1\right)+r d_B\right].
\]

Using the rational outward bounds \(\sqrt2<1.415\), \(\sqrt5<2.237\), \(\sinh x\le x/(1-x)\), and the exact isolating interval for \(r_\star\), at \(\|\eta\|\le0.031\) the right side is below

\[
0.731712248220374,
\]

while the real-torus gap is above

\[
0.756050796090433.
\]

The strict margin is greater than \(0.024338547870059\). Hence

\[
\boxed{F_{r_\star}(p+i\eta)\ne0
\quad\text{for every }p\text{ and }\|\eta\|\le0.031.}
\]

This supplies a conservative theorem-level analytic strip and therefore an exponential Fourier-locality bound for the selected overlap symbol.

One tempting cross-identification fails exactly. The frozen URT radial multiplier is

\[
\left|5-\frac{4\pi}{e}\right|
=0.377090600836313\ldots,
\]

which is \(0.000355481118318\ldots\), or \(0.09427\%\), below the globally minimal \(|H|\) contraction factor. The near-match cannot be promoted to equality on the normalized kernel family.

The calculation is reproduced byte-for-byte by `urt_relaxation_selector_continuation.py`. It closes \(r\) only conditional on the precise uniform-contraction reading of URT. It does not fix the independent history Möbius parameter, wall extent/boundary data, gauge-link bulk action or \(\lambda\).

### History contraction boundary-collapse theorem — 2026-09-04

Status: **E for the exact spectrum and monotonicity; F for selecting a nontrivial history Möbius parameter by contraction alone.**

The same URT contraction rule was applied to the still-free history family

\[
V_t=(\mathbb W-tI)(I-t\mathbb W)^{-1},
\qquad D_t=I-V_t,
\qquad -1<t<1.
\]

Since

\[
\operatorname{spec}\mathbb W
=\left\{e^{i(\pm\pi/30+2\pi k/5)}:k=0,\ldots,4\right\},
\]

each singular value is exactly

\[
\sigma_t(\theta)^2
=\frac{2(1+t)^2(1-\cos\theta)}
{1+t^2-2t\cos\theta}.
\]

This expression is strictly decreasing in \(\cos\theta\). Hence its minimum occurs at \(c_{\max}=\cos(\pi/30)\) and its maximum at \(c_{\min}=-\sqrt3/2\). The squared condition number is

\[
K_D(t)=
\frac{1-c_{\min}}{1-c_{\max}}
\frac{1+t^2-2tc_{\max}}
{1+t^2-2tc_{\min}},
\]

and

\[
\boxed{
\frac{d}{dt}\log K_D(t)
=\frac{2(c_{\min}-c_{\max})(1-t^2)}
{(1+t^2-2tc_{\max})(1+t^2-2tc_{\min})}<0
}
\]

for every \(-1<t<1\). There is no interior contraction optimum. The infimum occurs as \(t\to1\), where the absence of a unit eigenvalue of \(\mathbb W\) gives

\[
V_1=-I,
\qquad
\boxed{D_1=2I}.
\]

The condition number becomes one only by erasing all dependence on the ordered history operator. At the same boundary

\[
\frac{\det D_1(R)}{\det D_1(L)}=1,
\]

so the physical orientation ratio is trivial. Numerical diagonal witnesses reproduce the singular-value formula within \(2.3\times10^{-15}\).

This is a new exact no-go: uniform contraction is sufficient to select \(r_\star\) inside the nontrivial \(A_4\) overlap family, but it cannot select a nontrivial \(t\). Applied alone, it collapses the history dynamics to \(2I\). A joint action must therefore constrain relaxation and the ordered orientation sector simultaneously; inserting an arbitrary scalar tradeoff between them would merely rename the missing coefficient.

### Lowest-degree joint-action non-uniqueness theorem — 2026-09-04

Status: **E for the invariant dimension and continuous family; F for freezing \(\lambda\) by common normalization or the presently declared symmetries.**

The lowest independent allowed lines are

\[
E_2=\frac1{\dim\mathcal H}\operatorname{Tr}(D^\dagger D)
\quad\text{or the selected }H_{r_\star}^2\text{ quadratic form},
\]

and

\[
O_5=\chi\Omega_5,
\qquad
\Omega_5=-\frac{i}{60}\operatorname{Tr}(\tau_3\mathbb W^5)=1.
\]

The first is real, positive and reversal even. The second is also reversal even because \(\chi\) and \(\Omega_5\) are separately reversal odd, but it is orientation sensitive and linear in chirality. Hence the two invariant functions are linearly independent. The lowest joint action space therefore contains

\[
\boxed{\operatorname{span}_{\mathbb R}\{E_2,iO_5\}}
\]

and has real dimension two. Its general normalized member is

\[
\boxed{S_\lambda=E_2+i\lambda\chi\Omega_5,
\qquad\lambda\in\mathbb R.}
\]

One overall action normalization fixes the coefficient of \(E_2\) but leaves the projective ratio \(\lambda=b/a\) continuous. For every real \(\lambda\), the extra multiplier has unit modulus, is unchanged when reversal flips both \(\chi\) and \(\Omega_5\), and is taken to its complex conjugate by flux conjugation. It leaves \(D^\dagger D\), the selected \(r_\star\), the relaxation factors and determinant-line winding unchanged. Direct branch witnesses reproduce \(E_5=\sqrt3/2\), \(\Omega_5=1\), exact branch-conjugate positive traces and the phase transformation laws within \(8.3\times10^{-16}\).

Allowing higher products of \(E_2\) and \(O_5\) enlarges the invariant algebra; it cannot remove an already permitted one-parameter subfamily without a new non-homogeneous equation. Thus common normalization, covariance, KO-6, reversal, index and contraction do not quantize \(\lambda\). This is an exact joint-action non-uniqueness theorem, not a failure of numerical search.

### Compact-gauge anomaly/inflow no-go — 2026-09-04

Status: **E for the exact local anomaly arithmetic; E from the cited bordism computation for the global group; F for fixing \(\lambda\) by compact-gauge anomaly inflow.**

For the left-handed \(16\)-state branching

\[
Q=(3,2)_{1/6},\quad u^c=(\bar3,1)_{-2/3},\quad
d^c=(\bar3,1)_{1/3},\quad L=(1,2)_{-1/2},
\quad e^c=(1,1)_1,\quad\nu^c=(1,1)_0,
\]

exact rational arithmetic gives

\[
\mathcal A_{SU(3)^3}=2-1-1=0,
\]

\[
\mathcal A_{SU(3)^2U(1)}
=\frac16-\frac13+\frac16=0,
\qquad
\mathcal A_{SU(2)^2U(1)}
=\frac14-\frac14=0,
\]

\[
\mathcal A_{U(1)^3}
=6\left(\frac16\right)^3
+3\left(-\frac23\right)^3
+3\left(\frac13\right)^3
+2\left(-\frac12\right)^3+1=0,
\]

and

\[
\mathcal A_{{\rm grav}^2U(1)}
=6\left(\frac16\right)
+3\left(-\frac23\right)
+3\left(\frac13\right)
+2\left(-\frac12\right)+1=0.
\]

The perturbative \(SU(2)^3\) coefficient vanishes, and the mod-two doublet count is

\[
3+1=4\equiv0\pmod2.
\]

Thus the complete local six-form anomaly polynomial vanishes identically; evaluating it on the certified \(c_1=1\) Hopf sector still gives zero.

For the actual compact group

\[
G=\frac{SU(3)\times SU(2)\times U(1)}{\mathbb Z_6},
\]

the established bordism computation of Davighi, Gripaios and Lohitsiri gives

\[
\boxed{\Omega^{\rm Spin}_5(BG)=0}
\]

(arXiv:1910.11277, Eq. 4.45). Hence there is no independent five-dimensional global gauge-anomaly class on spin four-manifolds and no torsion inflow phase to normalize on the unit-Hopf sector.

The consequence is exact: anomaly cancellation removes the obstruction to defining a gauge-invariant fermion measure, but it does not select a trivialization of the topologically trivial determinant line. The already certified factor

\[
\exp(i\lambda\chi\Omega_5)
\]

remains admissible for every real \(\lambda\). Compact-gauge anomaly inflow therefore supplies neither a forced bulk level nor the missing non-homogeneous equation for \(\lambda\).

### Current microscopic verdict — updated 2026-09-04

The explicit URT maximal-contraction rule conditionally selects \(r_\star\), and exponential locality at that coefficient is rigorously nonzero. The same rule collapses the history Möbius family to the trivial boundary \(D=2I\). The lowest joint invariant space retains a continuous relative coefficient, and both local and global compact-gauge anomalies vanish, so neither symmetry nor inflow can remove it. A genuinely specified UV regulator/measure convention is therefore irreducible new physical input; it is not recoverable from the present finite boundary data.

### Icosahedral seed uniqueness from moment isotropy — 2026-09-04

Status: **E for the uniqueness theorem and weight closure conditional on its premises; C/P for deriving those continuum premises from the fundamental microscopic action.**

Assume twelve unit directions in \(\mathbb R^3\) occur as six antipodal pairs \(\{\pm v_i\}_{i=1}^6\) and obey the equal-weight isotropic moments already used in the continuum/fluid branch:

\[
\sum_{a=1}^{12}n_a n_a^{\mathsf T}=4I_3,
\]

\[
\sum_{a=1}^{12}n_a^{\otimes4}
=\frac45(\delta_{ij}\delta_{kl}+\delta_{ik}\delta_{jl}
+\delta_{il}\delta_{jk}).
\]

Put

\[
u_i=v_iv_i^{\mathsf T}-\frac13I
\in\operatorname{Sym}^2_0(\mathbb R^3),
\qquad\dim\operatorname{Sym}^2_0(\mathbb R^3)=5.
\]

The two moment equations give

\[
\sum_i u_i=0,
\qquad
\|u_i\|^2=\frac23,
\qquad
\sum_i u_i\otimes u_i=\frac45I_5.
\]

Six equal-norm tight-frame vectors in dimension five whose sum is zero form a regular simplex. Therefore

\[
\operatorname{Gram}(u)=\frac45\left(I_6-\frac16J_6\right),
\qquad
\langle u_i,u_j\rangle=-\frac2{15}\quad(i\ne j),
\]

and hence

\[
\boxed{(v_i\cdot v_j)^2=\frac15\quad(i\ne j).}
\]

Choose signs for the six axes and write their Gram matrix as

\[
G=I_6+\frac1{\sqrt5}S.
\]

Tightness gives \(G^2=2G\), equivalently

\[
S^2=5I_6.
\]

After sign-switching the axes so that the first row of \(S\) is positive, \((S^2)_{1j}=0\) forces every row of the remaining \(5\times5\) block to contain two \(+1\) and two \(-1\) entries. Its \(+1\) graph is therefore 2-regular on five vertices and must be \(C_5\). Thus there is exactly one switching/permutation class of the six-line system. Exhaustive integer enumeration finds the expected \((5-1)!/2=12\) labelled five-cycles and no other normalized conference matrix.

Consequently

\[
\boxed{\text{the twelve signed endpoints are uniquely the regular icosahedron, up to }O(3).}
\]

Valence five is a consequence rather than an extra premise: for each endpoint, exactly one endpoint on each other axis has inner product \(+1/\sqrt5\). The graph therefore has degree 5, 30 edges and 20 triangular faces. Coordinate residuals for the second and fourth moments are \(0\) and \(6.3\times10^{-16}\).

If the moving directions have common weight \(w\), a rest state has weight \(w_0\), and the second/fourth Gaussian moment coefficients share \(c_s\), then

\[
c_s^2=4w,
\qquad
\frac45w=c_s^4,
\qquad
w_0+12w=1.
\]

The unique nonzero solution is

\[
\boxed{w=\frac1{20},\qquad w_0=\frac25,
\qquad c_s^2=\frac15.}
\]

This removes geometric moduli from the 12-direction seed. The remaining physical premise is why the microscopic action requires reversal pairing and rotational isotropy through fourth order; the theorem does not silently assume that nature must.

### Shortest-loop \(A_4\) gauge action — 2026-09-04

Status: **E for the loop orbit and bivector frame; C for strict shortest-loop locality plus one parent trace as the physical gauge-action premise; U for the overall coupling and breaking scale.**

The primitive steps are the twenty roots \(e_i-e_j\). The shortest non-backtracking closed paths are

\[
(e_i-e_j)+(e_j-e_k)+(e_k-e_i)=0.
\]

There are ten unoriented triangle types per translation cell, indexed by the three-element subsets of \(\{1,\ldots,5\}\). The \(60\) even permutations act transitively on those ten types with stabilizer order six. Hence \(A_5\) invariance forces one common coefficient on every shortest plaquette.

For the raw triangle bivectors

\[
A_{ijk}=(e_i-e_j)\wedge(e_j-e_k),
\]

let \(M=\sum A_{ijk}\otimes A_{ijk}\) in the ambient ten-dimensional bivector coordinates. Direct integer arithmetic gives

\[
M^2=5M,
\qquad
\operatorname{rank}M=6.
\]

Its image is \(\Lambda^2V_4\), so exactly

\[
\boxed{\sum_{i<j<k}A_{ijk}\otimes A_{ijk}
=5I_{\Lambda^2V_4}.}
\]

For geometric triangle areas \(A_{ijk}/2\), the coefficient is \(5/4\). Thus the small-holonomy quadratic term is proportional to the full isotropic norm \(\operatorname{Tr}F_{\mu\nu}F^{\mu\nu}\); the \(3\) and \(3'\) Hodge blocks receive the same coefficient.

Under strict shortest-loop locality, gauge invariance, \(A_5\) invariance, reversal reality and one chosen parent fundamental trace, the action is unique up to an additive constant and one overall coefficient:

\[
\boxed{
S_g=\beta\sum_{x,\{i,j,k\}}
\left[1-\frac1{d_R}\operatorname{ReTr}_R U_{x;ijk}\right].}
\]

On the canonical parent carrier \(\mathbb C^5=\mathbb C^3\oplus\mathbb C^2\), use

\[
Y=\operatorname{diag}\left(-\frac13,-\frac13,-\frac13,
\frac12,\frac12\right),
\qquad
\operatorname{Tr}_5Y^2=\frac56.
\]

Then \(T_1=\sqrt{3/5}\,Y\) obeys \(\operatorname{Tr}_5T_1^2=1/2\), the same normalization as the fundamental non-Abelian generators. A single parent coupling gives

\[
\boxed{g_3=g_2=g_1,
\qquad g_1=\sqrt{\frac53}\,g_Y,}
\]

and conditionally \(\sin^2\theta_W=3/8\) at the parent scale. Without the one-parent-trace premise, the three ideals \(u(1)\oplus su(2)\oplus su(3)\) admit three independent positive coefficients and the three couplings remain free.

### Absolute gauge-coupling scale no-go — 2026-09-04

Status: **E for the scale identity and monotonicity; F for selecting a nonzero absolute coupling from the present relative-information functional.**

After the shortest-loop form and parent-trace ratios are fixed, write the remaining positive gauge cost as

\[
K_g(\beta)=\beta K_0,
\qquad K_0\ge0.
\]

In the declared master functional,

\[
F_{\eta,\beta}(\rho)
=D(\rho\Vert\rho_0)+\eta\beta\operatorname{Tr}(\rho K_0),
\]

the two parameters occur only through their product:

\[
F_{c\eta,\beta/c}=F_{\eta,\beta}
\qquad(c>0).
\]

At its Gibbs minimum,

\[
F_{\min}(\beta)=-\log Z(\beta),
\]

and the exact Duhamel/trace derivative is

\[
\boxed{
\frac{dF_{\min}}{d\beta}
=\eta\operatorname{Tr}(\rho_\beta K_0)\ge0.}
\]

It is strictly positive whenever \(K_0\) is nonzero on the faithful support. Therefore there is no positive interior stationary coupling; minimizing over \(\beta\) sends the action to the zero-coupling boundary. Deterministic Gibbs witnesses reproduce the \(\eta\beta\) rescaling exactly and the derivative within \(8.1\times10^{-11}\).

The fixed \(\eta_\Delta\), the \(5I_{\Lambda^2V_4}\) plaquette frame and the parent trace determine the state-temperature input, geometric tensor and coupling ratios respectively. They do not supply a non-homogeneous equation for the common magnitude. Setting \(\beta\) or \(g\) to one would be a convention.

### Gravity form, normalization and vacuum-energy no-go — 2026-09-04

Status: **E for the two-derivative classification, trace-free projection and Gibbs shift theorem; C for the Einstein-Hilbert form because its continuum premises are added; F for selection of \(G/a_*^2\), \(\Lambda a_*^2\) or a conserved source from the present finite data.**

Assume a four-dimensional torsion-free metric, a local diffeomorphism-invariant bulk action and at most two metric derivatives. Modulo boundary terms, the complete bulk basis is

\[
\int\!\sqrt{|g|},
\qquad
\int\!\sqrt{|g|}\,R,
\]

so the general action is

\[
S_g=\int\!d^4x\sqrt{|g|}\,(A R+B),
\qquad
A=\frac1{16\pi G},
\qquad
B=-\frac{\Lambda}{8\pi G}.
\]

This fixes the Einstein-Hilbert-plus-cosmological **form**, not either coefficient. In lattice units the two independent combinations are

\[
g_G=\frac{G}{a_*^2},
\qquad
\lambda_\Lambda=\Lambda a_*^2,
\]

with action coefficients \(1/(16\pi g_G)\) and \(-\lambda_\Lambda/(8\pi g_G)\). Supplying \(a_*\) supplies units only.

The trace-free projection of the Einstein equation is

\[
\boxed{\operatorname{Ric}_0=8\pi G\,T_0.}
\]

It annihilates \(\Lambda g_{\mu\nu}\) identically. Therefore the exact hidden source

\[
\Sigma=[3xx^{\mathsf T}+5yy^{\mathsf T}]_0\in\operatorname{Sym}^2_0(V_4)
\]

contains no information about \(\Lambda\). If its physical conversion is \(T_0=C\Sigma/a_*^4\), the equation sees only \((G/a_*^2)C\); \((g_G,C)\mapsto(sg_G,C/s)\) is an exact degeneracy.

There is a separate exact vacuum ambiguity in the master Gibbs state:

\[
\rho_K=\frac{e^{\log\rho_0-\eta K}}{Z_K}
\quad\Longrightarrow\quad
\boxed{
\rho_{K+cI}=\rho_K,
\qquad
Z_{K+cI}=e^{-\eta c}Z_K.}
\]

Every normalized-state and entropy-transfer observable is blind to \(c\), while a constant local cost per cell becomes precisely a volume/vacuum term when the geometry or cell count varies. Thus the declared information principle cannot select the cosmological coefficient. Noncommuting deterministic witnesses reproduce the state identity and partition shift within \(8.9\times10^{-16}\).

Finally, the representation map is algebraic, not differential. On flat \(\mathbb R^4\), choosing \(x(u)=(1+u)e_1\), \(y=0\) gives a pointwise trace-free \(\Sigma\) but

\[
\partial^\mu\Sigma_{\mu1}=\frac92(1+u)\ne0.
\]

Hence membership in \(4\oplus5\cong\operatorname{Sym}^2_0(V_4)\) does not imply the conservation law required by the Bianchi identity. The current construction fixes a curvature/source **channel**, but neither the stress-tensor dynamics nor either gravitational coefficient.

### Adjoint \(SU(5)\) breaking classification and no-go — 2026-09-04

Status: **E for the invariant and stationary-stratum classification; E that the existing symmetries do not select the \(3+2\) vacuum or breaking scale; U for the missing microscopic Higgs action.**

For a traceless Hermitian adjoint field \(\Phi\), the complete real \(SU(5)\)-invariant polynomial through degree four is, up to a constant,

\[
V(\Phi)
=\frac a2\operatorname{Tr}\Phi^2
+\frac b3\operatorname{Tr}\Phi^3
+\frac c4(\operatorname{Tr}\Phi^2)^2
+\frac d4\operatorname{Tr}\Phi^4.
\]

These are four independent coefficients. Since \(SU(5)\) invariance already contains the \(A_5\) Weyl action, the finite symmetry imposes no relation among them. Restricting only to \(A_5\) would permit more invariants, not remove this family.

At a constrained stationary point with real eigenvalues \(x_i\) and \(\sum_i x_i=0\), every eigenvalue obeys the same cubic

\[
d x_i^3+b x_i^2+(a+cS_2)x_i-\ell=0,
\qquad S_2=\sum_jx_j^2.
\]

Thus every generic stationary spectrum has at most three values. The complete multiplicity list is

\[
5,\qquad4+1,\qquad3+2,\qquad3+1+1,\qquad2+2+1.
\]

For a two-value branch with multiplicities \((m,n=5-m)\) and eigenvalues \((nq,-mq)\), the exact radial equation is

\[
a+b(n-m)q+
\bigl[5cmn+d(25-3mn)\bigr]q^2=0.
\]

The three-value branches are also explicit: for \((u,u,u,v,w)\),

\[
u=\frac b{2d},\quad v+w=-3u,\quad
vw=\frac{a+(12c+3d)u^2}{2c+d},
\]

and for \((u,u,v,v,w)\),

\[
s=u+v=\frac bd,\quad w=-2s,\quad
uv=\frac{a+(6c+2d)s^2}{4c+d}.
\]

An exact orbit-space inequality closes the global comparison:

\[
\boxed{
\frac7{30}\le
\frac{\operatorname{Tr}\Phi^4}{(\operatorname{Tr}\Phi^2)^2}
\le\frac{13}{20}.}
\]

The lower equality is precisely the \(3+2\) spectrum \((2,2,2,-3,-3)\); the upper equality is the \(4+1\) spectrum \((1,1,1,1,-4)\). In the already sufficient reflection-symmetric subfamily \(b=0,a<0\), minimization at fixed orbit ratio gives

\[
S_2=-\frac a{c+dr},
\qquad
V_{\min}(r)=-\frac{a^2}{4(c+dr)}.
\]

Consequently \(d>0\) selects the \(3+2\) stabilizer type, \(d<0\) selects \(4+1\), and \(d=0\) leaves all directions degenerate, whenever the quartic is bounded. Two exact bounded witnesses are

\[
(a,b,c,d)=(-1,0,1,1)
\quad\Rightarrow\quad3+2,\;V_{\min}=-\frac{15}{74},
\]

\[
(a,b,c,d)=(-1,0,1,-1)
\quad\Rightarrow\quad4+1,\;V_{\min}=-\frac57.
\]

Their Cartan Hessians are strictly positive modulo gauge-orbit zero modes, and all branch stationarity residuals are below \(1.2\times10^{-15}\).

The existing centre-plus-tetrahedral plane still supplies the exact candidate direction

\[
Y=-\frac13P_3+\frac12P_2,
\]

but a gauge-invariant potential sees its spectrum, not a fixed external direction. Therefore the project identifies what the desired orbit would stabilize; it does not dynamically select that orbit. The continuous ratios among \(a,b,c,d\) also leave the symmetry-breaking scale free.

### Born rule and physical measurement boundary — 2026-09-04

Status: **E for the non-Born counterfamily and the mathematical Gleason implication; C for Born because projector noncontextuality/additivity is an added premise; U for a physical measurement process.**

The exact carrier \(\Lambda^\bullet V_{4,\mathbb C}\) has complex dimension 16, so it exceeds the dimension-three Gleason threshold. Nevertheless, positivity, normalization, continuity, phase independence, eigenstate certainty and simultaneous unitary covariance do not select Born probabilities. For every \(\alpha>0\),

\[
p_i^{(\alpha)}(\psi;\{e_j\})
=\frac{|\langle e_i,\psi\rangle|^{2\alpha}}
{\sum_j|\langle e_j,\psi\rangle|^{2\alpha}}
\]

obeys all those weaker requirements. Born is only the member \(\alpha=1\).

Context dependence is exact. Embed the squared amplitudes \((1/2,1/4,1/4)\) in the 16-dimensional carrier and let \(P=\operatorname{span}(e_1,e_2)\). Rotating the basis inside the same \(P\) to align with \(P\psi\) gives squared amplitudes \((3/4,0,1/4)\). At \(\alpha=2\),

\[
p^{(2)}(P\mid\text{first frame})=\frac56,
\qquad
p^{(2)}(P\mid\text{rotated frame})=\frac9{10},
\]

a gap of \(1/15\), while Born gives \(3/4\) in both. Simultaneous-unitary covariance residuals for the explicit 16-dimensional witnesses are below \(6.7\times10^{-16}\).

The conditional closure is precise. If one additionally supplies a nonnegative normalized measure \(\mu(P)\) on **every** orthogonal projector, independent of the containing frame and additive on every orthogonal family, Gleason's theorem gives a unique positive trace-one \(\rho\) with

\[
\mu(P)=\operatorname{Tr}(\rho P).
\]

For a pure preparation \(\psi\), certainty \(\mu(P_\psi)=1\) then forces \(\rho=P_\psi\), hence

\[
\boxed{\mu(P_e)=|\langle e,\psi\rangle|^2.}
\]

In finite dimension at least three, nonnegativity and frame additivity suffice; continuity need not be separately assumed. The theorem is mathematically exact, but the Cathedral Gibbs law already uses density matrices and \(\operatorname{Tr}(\rho K)\) as inputs. Reinterpreting that trace pairing as a derivation of physical outcomes would be circular. No current microscopic dynamics supplies an instrument, persistent outcome record, state-update law, or the required projector noncontextuality.

### Icosahedral continuum-symbol closure and lattice obstruction — 2026-09-04

Status: **E for the propagation-symbol implications and crystallographic obstruction; C for adopting fourth-order continuum matching as microscopic selection; U for exact local streaming.**

Consider one translation-invariant scalar step with a rest state and twelve equal-weight unit directions:

\[
(Tf)(x)=w_0f(x)+w\sum_{a=1}^{12}f(x+\ell n_a),
\qquad
\chi(k)=w_0+w\sum_a e^{i\ell n_a\cdot k}.
\]

The adjoint convolution has weight \(w_{-v}\) on translation \(v\). Therefore \(T=T^*\) forces \(w_v=w_{-v}\), and twelve distinct equal positive directions occur as six antipodal pairs. Expanding the real symbol gives

\[
\chi(k)=1-\frac{\ell^2}{2}M^{(2)}_{ij}k_ik_j
+\frac{\ell^4}{24}M^{(4)}_{ijkl}k_ik_jk_kk_l
+O(|k|^6).
\]

Rotational invariance through fourth order requires

\[
M^{(2)}=A\delta,
\qquad
M^{(4)}=B(\delta\delta+\delta\delta+\delta\delta).
\]

Because all twelve speeds are one, tracing gives \(A=4w\) and \(B=4w/5\). Dividing by the common nonzero weight produces exactly

\[
\sum_an_an_a^{\mathsf T}=4I_3,
\qquad
\sum_an_a^{\otimes4}=\frac45\operatorname{sym}(\delta\otimes\delta).
\]

Combined with the preceding projective-design/conference theorem, this forces the regular icosahedron uniquely up to \(O(3)\). Thus the former antipodality and moment assumptions follow from one explicit self-adjoint fourth-order-isotropic stencil premise.

Rotational invariance alone does **not** fix the weights: any \(0<w\le1/12\) with \(w_0=1-12w\) remains possible. Matching the complete fourth-order jet of an isotropic Gaussian heat characteristic,

\[
\chi(k)=e^{-c_s^2\ell^2|k|^2/2}+O(|k|^6),
\]

adds \(B=c_s^4\). Then

\[
c_s^2=4w,qquad c_s^4=\frac45w,qquad w_0+12w=1,
\]

whose unique moving solution is

\[
\boxed{w=\frac1{20},\quad w_0=\frac25,\quad c_s^2=\frac15.}
\]

This identifies the exact extra premise behind the stored weights: Gaussian/Maxwellian fourth-cumulant matching, not pressure isotropy by itself.

The closure ends at finite order. With \(w=1/20\), the directional sixth moments are

\[
M_6(\text{vertex})=\frac{13}{125},\qquad
M_6(\text{edge})=\frac2{25},\qquad
M_6(\text{face})=\frac{17}{225},
\]

so the first anisotropic truncation term is \(O(|k|^6)\), with exact vertex-face gap \(32/1125\).

There is also an exact microscopic lattice obstruction. A nontrivial order-five rotation of \(\mathbb R^3\) has trace \(\phi\) or \(1-\phi\). A rank-three Bravais-lattice automorphism is represented by an integer matrix and must have integer trace. Hence no rank-three Bravais lattice carries full icosahedral symmetry. Exact site-to-site streaming needs an off-lattice rule, quasicrystal/cut-and-project construction, or higher-dimensional lift; none is presently specified.

### Canonical \(A_4\)-bivector origin of the icosahedral shell — 2026-09-04

Status: **E for the minimal rank-six carrier, Hodge split and twelve-direction orbit; U for a unique acceptance window and local adjacency.**

The rank-four root module cannot itself produce an equivariant icosahedral physical space:

\[
\operatorname{Hom}_{A_5}(V_4,3)
=\operatorname{Hom}_{A_5}(V_4,3')=0.
\]

This is also a rationality obstruction. The characters of \(3\) and \(3'\) contain the conjugate values \(\phi\) and \(1-\phi\) on the two five-cycle classes. Any integral/rational representation containing one must contain the other with equal multiplicity. The minimal possible rational rank is therefore six, achieved by the already present carrier
\[
\boxed{\Lambda^2A_4,\qquad
\Lambda^2V_4=3\oplus3'.}
\]

In the integral simple-root bivector basis, the Hodge star is

\[
*=\frac{N}{\sqrt5},
\qquad N\in M_6(\mathbb Z),
\qquad N^2=5I_6.
\]

The integer matrix \(N\) is self-adjoint for the bivector Gram metric and commutes exactly with all 60 \(A_5\) actions; every tested identity has integer residual zero.

There are 24 order-five elements and six Sylow \(C_5\) subgroups. For every such subgroup \(H\), the integral average

\[
A_H=\sum_{h\in H}h
\]

has rank two on \(\Lambda^2V_4\), and its Hodge projections have ranks one and one. A representative integral orbit sum is

\[
s=(2,1,2,1,1,2),
\qquad
Ns=(5,5,5,5,5,5),
\]

so its two fixed directions are

\[
\pi_\pm(s)=\frac12\left(s\pm\frac{Ns}{\sqrt5}\right).
\]

Their squared norms are the Galois-conjugate pair

\[
\|\pi_+(s)\|^2=\frac{25+10\sqrt5}{2},
\qquad
\|\pi_-(s)\|^2=\frac{25-10\sqrt5}{2}.
\]

In either Hodge sector the oriented stabilizer is \(C_5\) of order five, so the orbit has 12 points; the unoriented stabilizer has order ten, so there are six axes. The 66 pairwise products consist exactly of

\[
6\text{ copies of }-1,qquad
30\text{ copies of }-\frac1{\sqrt5},qquad
30\text{ copies of }+\frac1{\sqrt5},
\]

with residual below \(2.8\times10^{-16}\). Each orbit Gram matrix has nonzero eigenvalues \((4,4,4)\). Therefore either Hodge orbit is exactly the regular icosahedron. The twelve directions are not an external geometric insertion; they are the canonical order-five axes of the existing \(A_4\) bivector carrier, up to orientation/Hodge conjugation.

The locality issue remains exact. The projections \(\pi_\pm:\Lambda^2A_4\to3,3'\) are injective on the integral lattice: \(Nz=\mp\sqrt5z\) has no nonzero integral solution. Hence each projected additive group has rank six in \(\mathbb R^3\) and cannot be discrete. Its closure is \(A_5\)-invariant, and irreducibility forces that closure to be the whole three-space. A discrete quasicrystalline site set therefore requires a compact acceptance window in the conjugate Hodge space plus a finite-neighbour rule.

### Acceptance-window and uniform-streaming no-go — 2026-09-04

Status: **E for continuous window nonuniqueness, the uniform-streaming obstruction and the short-vector shells; C for the proposed isoperimetric/internal-distance repair.**

For a regular compact internal window \(W\subset E_-\), define the model set

\[
\mathcal L(W)={\pi_+(z):z\in\Lambda^2A_4,\ \pi_-(z)\in W\}.
\]

The inherited symmetries do not select \(W\), even after its volume is fixed. The first nonconstant even icosahedral spherical invariant can be written

\[
h_6(u)=\sum_{v\in I_{12}}(u\cdot v)^6-\frac{12}{7},
\]

with exact values

\[
h_6(\text{vertex})=\frac{64}{175},\qquad
h_6(\text{edge})=-\frac4{35},\qquad
h_6(\text{face})=-\frac{64}{315}.
\]

For every sufficiently small \(\varepsilon\), the radial windows

\[
r_\varepsilon(u)=R C_\varepsilon[1+\varepsilon h_6(u)]
\]

can be normalized to the same volume and remain smooth, centrally symmetric, \(A_5\)-invariant and strictly convex. Since the internal lattice projection is dense, different windows produce different model sets. Thus metric, Hodge conjugation, symmetry, reversal, covolume and fixed density still leave a continuum.

There is also an exact global translation obstruction. If a nonzero lattice displacement \(\ell\) and its inverse mapped every site of \(\mathcal L(W)\) back into \(\mathcal L(W)\), density in internal space would imply

\[
W+\pi_-(\ell)=W.
\]

A nonempty compact set cannot be invariant under a nonzero translation, while injectivity of \(\pi_-\) rules out \(\pi_-(\ell)=0\). Hence no nonzero 12-direction displacement can be a globally available reversible stream; every quasicrystal graph must have site-dependent missing edges.

The integral short shells are exact. Exhaustion is finite because \(q(z)\le5\) implies \(|z_i|\le2\):

\[
q=3:20\text{ vectors},\qquad
q=4:30\text{ vectors},\qquad
q=5:24\text{ vectors}=12+12.
\]

The shortest \(q=3\) shell projects to the regular 20-point dodecahedral orbit, not the desired 12 directions. For a representative \(C_5\), every fixed integral vector is

\[
z=(a,b,a,b,b,a),
\qquad
q(z)=5[a^2+(a-b)^2].
\]

Its minimum is five. Across the six \(C_5\) subgroups, the 24 minimizers split into two \(A_5\) orbits of 12 with Hodge signatures \(\pm10\); they swap the physical/internal squared lengths

\[
\frac{5+2\sqrt5}{2},
\qquad
\frac{5-2\sqrt5}{2}.
\]

A precise target-blind conditional repair is now isolated: at fixed window volume, boundary-area minimization selects a centered ball by isoperimetry; after choosing the physical Hodge sector, minimum internal displacement selects one of the two 12-vector orbits. This defines a canonical **partial** neighbour graph, but these optimization rules are new premises and do not evade the global-streaming theorem.

### Conditional ball-window Markov repair and its strict continuum limit — 2026-09-04

Status: **E conditional for the algebraic radius, detailed balance and averaged one-step moments; F for retaining \(c_s^2=1/5\) as the homogenized per-step coefficient.**

Adopt the added isoperimetric ball window and the minimum-internal-length \(C_5\) orbit. Its internal displacement satisfies

\[
d_-^2=\frac{5-2\sqrt5}{2}.
\]

For equal three-balls of radius \(R\) whose centres are separated by \(d\), the normalized overlap is

\[
f(d/R)=1-\frac{3d}{4R}+\frac{d^3}{16R^3}.
\]

Propose each of the twelve signed lattice displacements with probability \(1/12\), rejecting to a self-loop when the translated internal point leaves the ball. Requiring the already derived spatially averaged moving fraction \(12w=3/5\), and writing \(x=d/(2R)\), gives

\[
\boxed{5x^3-15x+4=0.}
\]

The polynomial is strictly decreasing on \((0,1)\), changes sign on

\[
\frac{6837}{25000}<x<\frac{27349}{100000},
\]

and therefore has one physical root,

\[
x=0.2734850178188649\ldots,qquad
\frac Rd=1.828253715642884\ldots,qquad
R=0.9392528198990248\ldots.
\]

Regular model-set frequencies equal normalized window-overlap volumes. Hence each oriented move has average probability

\[
\frac{f}{12}=\frac1{20},
\]

and the average rejected/rest probability is \(2/5\). The averaged second, third and fourth moment residuals are respectively below \(1.3\times10^{-16}\), \(7.0\times10^{-18}\), and \(2.2\times10^{-16}\). The kernel is exactly row stochastic and reversible because every accepted edge and its inverse both have probability \(1/12\).

This does not restore a translation-invariant stencil. At the internal centre all 12 moves exist and the local rest probability is zero. At \(y=(R/2)u\) along a shell direction, exactly the outward move is missing, so

\[
\deg(y)=11,
\qquad
b(y)=-\frac{v}{12},
\qquad
\|b(y)\|=\frac1{12}.
\]

The strict inequalities defining this pattern persist on an open set. Thus the local drift field is nonzero in \(L^2\).

For a unit physical direction \(e\), the reversible corrector energy is

\[
\mathcal E_e(\varphi)
=\Big\langle\sum_a\frac{I_a(y)}{12}
\big[e\cdot v_a+\varphi(y+t_a)-\varphi(y)\big]^2\Big\rangle_W.
\]

If the standard diffusive homogenized limit exists, its directional variance is \(\sigma_e^2=\inf_\varphi\mathcal E_e(\varphi)\). The constant trial gives \(\mathcal E_e(0)=1/5\). Edge reversal yields the exact first variation

\[
\left.\frac d{d\varepsilon}\mathcal E_e(\varepsilon\varphi)
\right|_{0}
=-4\langle b_e,\varphi\rangle.
\]

Taking \(\varphi=b_e\) strictly lowers the energy because \(\|b_e\|_2>0\). Therefore

\[
\boxed{\sigma_e^2<\frac15}
\]

for every \(e\); \(A_5\) forces the result to remain isotropic. A deterministic 400,000-point trial gives the illustrative upper bound \(0.1914430\ldots\), but the strict theorem does not depend on that numerical integration. An accepted move also has exact next-step backtracking probability \(1/12\), versus \(1/20\) in the iid averaged walk, directly exposing the correlations.

Thus the ball construction is a valid reversible quasicrystal Markov model, but it does not have the stored Gaussian heat coefficient per microscopic step. Restoring the number by rescaling time introduces a new continuous clock normalization, and the fourth-order graph corrector remains unsolved.

### Physical-clock orientation and rate no-go — 2026-09-04

Status: **E for the sign and scaling identities; C for an entropy-semigroup arrow; U for Lorentz future orientation, history alignment and a physical clock rate.**

Three structures must remain distinct:

1. the baker/two-sheet history map is invertible, and \(B\leftrightarrow B^{-1}\) reverses its ordering convention;
2. a positive dissipative mobility defines a forward entropy semigroup;
3. a Lorentzian metric has two cone components and needs a choice of future.

For the retained Lorentz reflection,

\[
g=h-2u\otimes u,
\]

one has the exact identity

\[
\boxed{g(u)=g(-u).}
\]

Thus the seed can fix signature \((1,3)\) after the reflection premise but cannot select the sign of the future cone.

Let \(L\) be any detailed-balance Markov/Lindblad/gradient generator with stationary Gibbs state \(\rho_*\). For every \(\kappa>0\),

\[
L_\kappa=\kappa L
\]

has the same stationary state, fixed points, detailed balance, covariance and entropy-production sign, while all gaps and physical rates scale by \(\kappa\). A finite reversible witness preserves stationarity and detailed balance to \(7.3\times10^{-17}\); its entropy derivative and spectral gap scale linearly within \(1.8\times10^{-15}\). Negative \(\kappa\) reverses entropy production and generally fails forward Markov positivity, so dissipation selects a semigroup **orientation**, not a positive magnitude.

The contraction selector supplies the dimensionless factors

\[
\rho_{H^2}=0.6607570507106295\ldots,
\qquad
\rho_{|H|}=0.3774460819546315\ldots,
\]

and hence decrements \(-\log\rho=0.4143690548\ldots\) and \(0.9743275498\ldots\) per declared iteration. A physical rate remains

\[
\Gamma=-\frac{\log\rho}{\tau_{\rm step}},
\]

with arbitrary \(\tau_{\rm step}>0\). The dimensionless Gibbs depth \(\eta_\Delta\) is not a time; the lattice length becomes one only after a propagation-speed/light-crossing postulate; and entropy depth is a state-space scalar that vanishes as a clock at equilibrium. No current map identifies these objects with the tangent one-form \(u\).

Therefore the project presently selects at most a dimensionless iteration arrow. It does not select the Lorentz future, seconds per update, or the absolute diffusion/relaxation rate.

### Master affine-identifiability and non-uniqueness theorem — 2026-09-04

Status: **E for the affine quotient; F that the present axioms define a unique physical theory; U for an empirical theory of nature.**

For the declared master functional on normalized states,

\[
F_{\eta,K}(\rho)
=D(\rho\Vert\rho_0)+\eta\operatorname{Tr}(\rho K),
\qquad\operatorname{Tr}\rho=1,
\]

take any \(a>0\) and \(b\in\mathbb R\), and set

\[
K'=aK+bI,
\qquad
\eta'=\frac\eta a.
\]

Then exactly

\[
\boxed{
F_{\eta',K'}(\rho)
=F_{\eta,K}(\rho)+\frac{\eta b}{a},}
\]

and hence

\[
\boxed{
\rho_{\eta',K'}=\rho_{\eta,K},
\qquad
Z_{\eta',K'}=e^{-\eta b/a}Z_{\eta,K}.}
\]

Noncommuting finite witnesses reproduce these identities within \(7.2\times10^{-15}\). Every normalized-state output therefore factors through \(\eta K\) modulo the scalar identity. The master state cannot separately identify a cost scale and inverse-depth scale, and it is exactly blind to an additive energy/vacuum zero. It also contains no kinetic generator, measurement instrument or seconds-per-step map.

The sector audits now expose ten conservative continuous directions still unconstrained by the currently proved kinematics:

1. determinant-line phase \(\lambda\);
2. common parent gauge coupling;
3. Newton/source normalization;
4. cosmological/vacuum coefficient;
5. adjoint-Higgs orbit-shape ratio;
6. adjoint-Higgs radial scale;
7. physical clock rate;
8. cut-and-project window scale;
9. fixed-volume window deformation;
10. measurement-response exponent under the derived weaker premises.

This is a count of independently open sector choices, not a claimed manifold dimension of completed interacting theories; no coupled continuum completion yet exists. Conditional new axioms can remove entries only by being explicitly added. Even one surviving continuous extension suffices to prove the logical conclusion:

\[
\boxed{
\text{the current Cathedral/URT axiom set does not determine a unique physical theory.}}
\]

This no-go does not say that no future completion is possible. It says that further exact arithmetic inside a chosen branch cannot promote that choice to a theorem from the weaker current premises.

### Entropy spectral action and exact finite KMS factorization — 2026-09-04

Status: **E for the spectral-action mathematics and finite factorizations; C for adopting entropy as the Cathedral bosonic action; U for the full Dirac/action completion.**

A generic four-dimensional spectral action

\[
\operatorname{Tr}f(|D|/\Lambda)
\sim f_4\Lambda^4a_0+f_2\Lambda^2a_2+f_0a_4+\cdots
\]

contains three independent cutoff data.  For the positive family
\(f_s(x)=e^{-sx}\), \(s=1,2,3\), the rows \((f_0,f_2,f_4)\) have exact determinant

\[
\boxed{-\frac59\ne0.}
\]

Thus the finite algebra alone cannot select a generic cutoff.  The fermionic KMS entropy theorem supplies a genuine stronger candidate,

\[
h(x)=\log(1+e^{-x})+\frac{x}{1+e^x},
\qquad S_{\rm vN}=\operatorname{Tr}h(\beta D),
\]

with exact moments

\[
h_0=\log2,
\qquad h_2=\frac94\zeta(3),
\qquad h_4=\frac{225}{8}\zeta(5).
\]

The Cathedral finite formulas connect to this construction exactly.  On four fermionic modes,

\[
\rho_0=\frac{\Delta^N}{(1+\Delta)^4},
\qquad \Delta=e^{-\eta_\Delta},
\qquad S(\rho_0)=4h(\eta_\Delta).
\]

The hidden \(3^4+5^4\) cost block is, up to the Gibbs-invisible shift \(3I_8\), the Fock lift of \(\operatorname{diag}(0,0,2)\), and

\[
S_{\rm hidden}=2\log2+h(2\eta_\Delta)
=\log4+H_2\!\left(\frac{\Delta^2}{1+\Delta^2}\right).
\]

The numerical identity residuals are below \(3.9\times10^{-16}\), while the quadrature checks of the universal moments are below \(1.1\times10^{-14}\).  This is the first exact cross-connection between the stored finite entropy data and a non-arbitrary spectral cutoff.  It does not yet identify either finite generator with the full fluctuated history/spacetime/Yukawa Dirac operator, and the even action remains blind to the chiral determinant phase.

### KMS state does not select a nontrivial Dirac geometry — 2026-09-04

Status: **E for the reconstruction and dichotomy; F that the passive state supplies the missing Dirac geometry.**

For an ordinary finite CAR Gibbs state generated by \(d\Gamma(A)\), the one-particle density block divided by the vacuum block is \(e^{-\beta A}\).  The passive prior makes it \(\Delta I_4\).  Therefore

\[
\boxed{\beta A=(-\log\Delta)I_4,}
\]

and at \(\beta=\eta_\Delta\),

\[
\boxed{A=I_4.}
\]

This commutes with every represented algebra element, so its Connes one-forms and inner fluctuations vanish.  If instead the state Hamiltonian is \(|D|\), the state fixes only \(|D|=I_4\).  The self-adjoint involutions

\[
D(\theta)=
\begin{pmatrix}
\cos2\theta&\sin2\theta&0&0\\
\sin2\theta&-\cos2\theta&0&0\\
0&0&1&0\\
0&0&0&-1
\end{pmatrix}
\]

all obey \(D(\theta)^2=I\), have the same KMS state and entropy, but for \(P=\operatorname{diag}(1,0,0,0)\),

\[
\boxed{\|[D(\theta),P]\|=|\sin2\theta|.}
\]

The fixed-signature family contains the eight-real-dimensional orbit \(U(4)/(U(2)\times U(2))\).  Full \(A_5\) covariance on irreducible \(V_4\) invokes Schur's lemma and collapses an equivariant involution to \(D=\pm I_4\), again trivial.  Hence the exact dichotomy is: preserve the full seed symmetry and get no differential geometry, or break/relax it and introduce an entropy-invisible continuous choice.

Likewise, the hidden spectrum is shared by

\[
K(Q)=3I_8+2Q
\]

for every rank-four projector \(Q\), a \(32\)-real-dimensional Grassmannian \(U(8)/(U(4)\times U(4))\).  Its spectrum and entropy do not choose the eigenspaces or their coupling to geometry.

### Entropy Dirac-scale no-go — 2026-09-04

Status: **E for the scale theorem; F that entropy selects a finite nonzero Dirac normalization.**

For singular values \(\sigma_j\ge0\), define

\[
S(s)=\sum_j h(\beta s\sigma_j).
\]

Since

\[
h'(x)=-\frac{x e^x}{(1+e^x)^2},
\]

one obtains

\[
\boxed{
S'(s)=-\beta^2s\sum_j
\frac{\sigma_j^2e^{\beta s\sigma_j}}
{(1+e^{\beta s\sigma_j})^2}<0
}
\]

for every \(s>0\) if \(D\ne0\).  Maximizing entropy selects the trivial point \(D=0\); minimizing the positive entropy action runs to infinite nonzero singular values, leaving only \(\dim\ker D\log2\).  There is no nonzero finite stationary scale.  In addition,

\[
\boxed{S_{\beta/a}(aD)=S_\beta(D)}
\]

for every \(a>0\), with numerical residual \(2.3\times10^{-16}\).  The universal cutoff fixes its dimensionless moment ratios, but not \(\beta\), the normalization of \(D\), the boson/fermion action weight or a vacuum counterterm.  A norm, principal symbol, volume or lattice-to-length constraint can stop the orbit only as an added premise.

### Exact quasi-free merger is a response theorem, not a selector — 2026-09-04

Status: **E for the merger and inverse map; F that relative information selects its one-particle cost; U for locality/reflection positivity.**

Let

\[
\rho_0=\frac{e^{-d\Gamma(H_0)}}{Z_0},
\qquad
F_V(\rho)=D(\rho\Vert\rho_0)+\operatorname{Tr}[\rho\,d\Gamma(V)].
\]

Without assuming \([H_0,V]=0\), the Gibbs variational identity and linearity of second quantization give

\[
\boxed{
\rho_V=\frac{e^{-d\Gamma(H_0+V)}}
{\det(1+e^{-(H_0+V)})},
\qquad
Q_V=(1+e^{H_0+V})^{-1},
}
\]

and

\[
\boxed{\min F_V=\log Z_0-\log Z_V.}
\]

A genuinely noncommuting finite witness, with \(\|[H_0,V]\|=1.29099\ldots\), verifies the density, determinant, covariance and minimum identities to residuals below \(1.8\times10^{-15}\).

The exact inverse is

\[
\boxed{V_Q=\log[(I-Q)Q^{-1}]-H_0}
\]

for every faithful covariance \(0<Q<I\).  Thus the variational principle is a bijective response map once \(V\) is supplied; it imposes no selection among faithful covariances.  Even positivity leaves the continuous family \(V_\gamma=\gamma|u\rangle\langle u|\), \(\gamma\ge0\).

There is also a typing restriction.  On \(\mathcal F(\mathbb C^4)\), all number-preserving Hermitian operators have real dimension

\[
\sum_{k=0}^4\binom4k^2=\binom84=70,
\]

whereas \(d\Gamma(V)+cI\) has dimension \(16+1=17\), a codimension of \(53\).  A generic positive many-body Gram is therefore not a one-particle Dirac cost.  The merger supplies a finite unitary dynamics after \(V\) and a time normalization are chosen, but static relative entropy alone does not supply lattice locality, a reflection, Osterwalder--Schrader positivity, Lorentzian continuation, chirality or a fermion measure.

### History heat state versus full fermionic KMS state — 2026-09-04

Status: **E for the conditioning and shift identities; F that the current history heat state is already the full fermionic KMS state.**

The Cathedral history calculations use

\[
\rho_B(k)=\frac{e^{-\beta k}}{\operatorname{Tr}e^{-\beta k}}
\]

on a one-particle/history Hilbert space.  Fermionic entropy instead belongs to

\[
\rho_F(k)=\frac{e^{-\beta d\Gamma(k)}}
{\det(1+e^{-\beta k})}
\]

on \(\mathcal F(H_1)\).  These are related exactly by

\[
\boxed{
\frac{P_1\rho_FP_1}{\operatorname{Tr}(P_1\rho_F)}
=\rho_B(k),}
\]

because \(d\Gamma(k)|_{\Lambda^1H_1}=k\).  A non-diagonal witness verifies this at \(1.34\times10^{-16}\), while its conditioned entropy is \(0.937815\ldots\) and the full Fock entropy is \(1.744141\ldots\).  Only the latter equals \(\operatorname{Tr}h(\beta k)\).

The distinction is also exposed by an identity shift:

\[
\rho_B(k+cI)=\rho_B(k),
\]

but, at fixed chemical potential,

\[
\rho_F(k+cI)\ne\rho_F(k).
\]

The numerical Fock-state distance is \(0.29739\ldots\) for the certified witness, while the conditioned-state residual is \(5.2\times10^{-16}\).  The full state is restored only by the new simultaneous choice \(\mu\mapsto\mu+c\), since it depends on \(k-\mu I\).

The actual stored history spaces have dimensions \(36\), \(144\), \(180\) and \(720\), explicitly factored as shell/history \(\times\) generation \(\times\) species spaces; none is an unconstrained full finite CAR Fock dimension.  They can be declared one-particle generators of new Fock spaces of dimensions \(2^{36}\), \(2^{144}\), \(2^{180}\) or \(2^{720}\), but then the vacuum, multiparticle sectors and chemical-potential/occupancy convention are new data.  The exact \(16=2^4\) exterior and \(8=2^3\) hidden factorizations remain valid; they do not automatically promote the history heat states to full KMS states.

### Occupancy and chemical-potential selector audit — 2026-09-04

Status: **E for the classification and incompatibilities; C for any added mean-number rule; F that the surviving intrinsic premises select the missing fugacity.**

On irreducible \(V_{4,\mathbb C}\), Schur's lemma classifies every \(A_5\)-invariant gauge-invariant quasi-free covariance as

\[
\boxed{Q=pI_4,\qquad 0\le p\le1.}
\]

Thus symmetry equalizes the four occupations but leaves \(p\) continuous.  The stored value is

\[
p=\frac{\Delta}{1+\Delta}=0.002483009159247505\ldots,
\qquad
\langle N\rangle=4p=0.009932036636990016\ldots.
\]

Exterior Hodge/particle-hole conjugation sends degree \(k\) to \(4-k\).  Invariance of the degree weights requires

\[
\Delta^k\propto\Delta^{4-k}\quad\hbox{for all }k,
\]

whose unique positive solution is

\[
\boxed{\Delta=1,\quad p=\frac12,\quad\eta=0.}
\]

This conflicts with the stored prior; its degree distribution has total-variation distance \(0.9999630692\ldots\) from its Hodge reverse.  Half filling and neutrality of the centered number charge \(N-2\) impose the same incompatible result.

Conditioning explains why the reduced prior cannot repair this.  For every \(z>0\), conditioning \(z^N/(1+z)^4\) on \(N=2\) gives \(I_6/6\), and conditioning further on either Hodge triplet gives \(I_3/3\).  Residuals across six orders of fugacity are below \(5.6\times10^{-17}\).  More generally,

\[
\boxed{
\frac{z e^{-\beta k}}{\operatorname{Tr}(z e^{-\beta k})}
=\frac{e^{-\beta k}}{\operatorname{Tr}e^{-\beta k}}}
\]

so every existing one-particle history output erases the full-Fock fugacity exactly.  A fixed grand-canonical mean \(m\) would select one chemical potential because

\[
\frac{d\bar N}{d\mu}
=\beta\sum_j f_j(1-f_j)>0,
\]

but \(m\) is a new ensemble premise; conditioning on \(N=1\) does not imply \(\bar N=1\), and \(\beta\) remains unselected.

### Strongest monoidal Fock repair and its quotient obstruction — 2026-09-04

Status: **E conditional for the monoidal construction; E for its obstruction; F that it closes the present master theory without a new axiom.**

There is one clean parameter-free numerical extension: require unitary covariance and direct-sum monoidality, and copy the exterior fugacity to every finite carrier,

\[
\boxed{
\rho_{0,n}=\frac{\Delta^N}{(1+\Delta)^n}.}
\]

The direct-sum tensor identity is verified to \(2.3\times10^{-16}\).  For a history cost \(K\), the full state

\[
\rho_F\propto
\exp[-d\Gamma(\eta_\Delta I+\beta K)]
\]

conditions on \(N=1\) to the existing \(e^{-\beta K}/\operatorname{Tr}e^{-\beta K}\), with residual below \(9.1\times10^{-16}\).  This adds no fitted number, but universality of the \(V_4\) fugacity on every history carrier is a new structural premise.

More decisively, it does not descend to the already proved master quotient.  Although

\[
K\sim K+bI
\]

in every existing normalized history state, second quantization gives

\[
d\Gamma(K+bI)=d\Gamma(K)+bN.
\]

At fixed \(\Delta\), the full state and its mean occupancy therefore change continuously for allowed positive shifts.  The exact compensation is

\[
\boxed{
\eta_\Delta' =\eta_\Delta-\beta b,
\qquad
\Delta'=\Delta e^{\beta b},}
\]

which makes the chemical potential transform with the arbitrary identity representative.  The numerical compensation residual is zero.  Alternatively one must choose a section of the quotient: minimum eigenvalue zero, trace zero, a fixed mean number, or a fixed number sector.  These respectively add a spectral-zero rule, lose positivity, add an occupancy constraint, or forfeit the full fermionic entropy interpretation.  No present axiom selects among them.

### Local vacuum-OS axiom and minimal reflection closure — 2026-09-04

Status: **E for the lattice/reflection algebra; C for adopting local vacuum OS positivity as the new microscopic premise; P/U for the interacting physical theory.**

The requested continuation supplied the explicit new premise left open above: require a local vacuum Euclidean action with Osterwalder--Schrader positivity.  For the selected cube time vector

\[
w=(4,-1,-1,-1,-1),\qquad \hat t=w/\sqrt{20},
\]

the corresponding reflection does not preserve the bare root lattice \(A_4\).  Its unique minimal reflection-stable superlattice is

\[
\boxed{L_{\rm ref}=A_4+\mathbb Z\frac w2},\qquad L_{\rm ref}/A_4\cong C_2.
\]

The reflected 20-root orbit closes to 28 squared-norm-two directions: 12 spatial, eight future and eight past.  The orbit moments are

\[
M_{\rm sp}=8P_{\rm sp},\qquad
M_{\rm temp}=4P_{\rm sp}+20P_t.
\]

Full edge reversal and the stabilizer give the unique isotropic positive ratio \(a:b=2:1\), hence probability \(1/20\) per spatial direction, \(1/40\) per oriented temporal direction, and total weights \(3/5,2/5\).  This is an exact reflection-compatible graph theorem, not yet a selection of seconds per layer.

The natural lattice symmetry is reflection through an integer slice.  If the odd slices are labelled by integer cubic coordinates with physical offset \(t(1,1,1)/2\), the involution is

\[
\boxed{\theta(t,n)=(-t,n+t(1,1,1))}.
\]

Consequently claims imported from the standard hypercubic **link**-reflection proof must be checked in the adapted site-reflection geometry; the spectral covariance tests below do this for the free kernel, while the interacting boundary remains open.

### Free reflected Wilson/overlap layer and local phase — 2026-09-04

Status: **E for the finite-range Wilson algebra, one-species condition, GW identity and the free spectral inequalities in the stated parameter regions; C for the finite-volume OS cone transfer; W for copying the old \(A_4\)-root coefficient into the reflected family.**

With cubic spatial slices and eight half-cube future links,

\[
C(p)=\prod_{i=1}^3\cos\frac{p_i}{2}\ge0,
\]

and the finite-range Wilson symbol is

\[
D_W=i\gamma_i\sin p_i+i c_t\gamma_0C(p)\sin\omega
+r\sum_i(1-\cos p_i)+1-C(p)\cos\omega.
\]

The nonnegative scalar part has one zero only, so there is a single massless species.  The temporal Wilson hop matrices are positive for \(0<c_t\le1\).  Polar normalization gives an exact GW operator wherever \(X=D_W-M\) has a gap.

The selected time reflection anti-commutes with the Hodge star.  Thus \(\chi\mapsto-\chi\), \(\Omega_5\mapsto-\Omega_5\), and the formerly free local invariant \(O_5=\chi\Omega_5\) is reflection-even.  Anti-linearity sends \(e^{i\lambda O_5}\) to \(e^{-i\lambda O_5}\), so local vacuum OS reality forces

\[
\boxed{\lambda=0}
\]

for that recovered local phase family.  This does not eliminate a topological theta term: \(Q\mapsto-Q\), so \(e^{i\theta Q}=F_\theta\theta(F_\theta)\) is OS-compatible for every \(\theta\in\mathbb R/2\pi\mathbb Z\).  Local anomalies cancel, the \(SU(2)\) mod-two count is even, and the cited \(\Omega_5^{\rm Spin}(G)=0\) input supplies no torsion selector.  CP narrows \(\theta\) only to \(0\) or \(\pi\).

### Entropy spectral normalizations and breaking audit — 2026-09-04

Status: **E for the trace/moment arithmetic; C for the quoted spectral-action identifications; F that entropy alone fixes the overall normalization or the \(SU(5)\) breaking scale.**

Using the literal entropy cutoff moment \(F_0=\log2\) in the standard three-generation spectral-action gauge relation gives the conditional numbers

\[
g_U^2=\frac{\pi^2}{2\log2}=7.11941466249\ldots,
\quad
\alpha_U=\frac{\pi}{8\log2}=0.566545017728\ldots,
\quad
\sin^2\theta_W=\frac38.
\]

They are not absolute predictions: an allowed overall bosonic-action/trace weight \(c\nu\) rescales \(g_U\) by \(1/\sqrt{c\nu}\).  Likewise the scalar-free Euclidean entropy spectral action has

\[
f_2=\frac94\zeta(3),\qquad f_4=\frac{225}{8}\zeta(5),
\]

and conditionally yields

\[
G\Lambda^2=\frac{\pi}{144\zeta(3)}=0.01814940340\ldots,
\qquad
\frac{\Lambda_E}{\Lambda^2}=75\frac{\zeta(5)}{\zeta(3)}=64.69708833\ldots.
\]

The overall trace/action weight, the map \(\beta/a\), finite Majorana invariants and the volume counterterm remain independent.

For an adjoint eigenvalue vector \(\Phi\), the corrected exact traces are

\[
\operatorname{Tr}_{5}\Phi^2=p_2,
\quad \operatorname{Tr}_{24}(\operatorname{ad}\Phi)^2=10p_2,
\quad \operatorname{Tr}_{16}\rho(\Phi)^2=4p_2,
\]

\[
\operatorname{Tr}_{24}(\operatorname{ad}\Phi)^4=10p_4+6p_2^2,
\quad
\operatorname{Tr}_{16}\rho(\Phi)^4=3p_2^2-2p_4.
\]

The binary entropy expansion decreases strictly along every nonzero radial ray.  At small fixed norm the \(5\) and \(24\) carriers prefer the \(3+2\) stratum, whereas the actual exterior \(16\) prefers \(4+1\).  Bare entropy therefore supplies neither a finite breaking radius nor a representation-independent \(3+2\) vacuum.

### Compact gauge action, face-set rejection and triangular repair — 2026-09-04

Status: **F/W for the old spatial-square plus electric-parallelogram face set; E for the repaired triangular bivector frame and its site-reflection pairing; U for a complete link-orientation proof and the interacting merger.**

For physical temporal layer length \(\tau\) in spatial-edge units, unit fermion cone speed requires

\[
c_t\tau=1.
\]

The historical spatial/electric parallelogram frames were

\[
M_{\rm sp}=\operatorname{diag}(0_3,I_3),\qquad
M_{\rm el}=\operatorname{diag}(8\tau^2I_3,4I_3),
\]

and would have fixed

\[
\boxed{a/b=8\tau^2-4}.
\]

That action is now withdrawn.  Its 24 electric parallelograms compare a fixed future-link type at neighboring sites but never compare two different members of the eight-link future cube.  For every \(0<M<2\), set all spatial links to one and take four constant future phases \(\alpha_+=-\omega+\phi\) and four \(\alpha_-=-\omega-\phi\), where \(\cos\phi=1-M\).  Every old face then has identity holonomy and zero action, while

\[
\frac18\sum_d e^{i(\omega+\alpha_d)}=\cos\phi=1-M
\]

annihilates both temporal kinetic and scalar parts of \(X=D_W-M\).  Directly, the selected finite matrix has four zero modes to \(3.83\times10^{-16}\).  Thus the old \(6:1\) and \(4:1\) ratios describe an incomplete cell complex and are **W**, not physical branches.

Each old parallelogram is the union of a top and bottom elementary triangle.  Replacing the 24 parallelograms by all 12 top and 12 bottom triangles makes the sign-cube adjacency connected.  Their exact bivector frames are

\[
M_{\rm top}=M_{\rm bottom}=\frac18M_{\rm el},\qquad
M_{\rm tri}=\frac14M_{\rm el}
=\operatorname{diag}(2\tau^2I_3,I_3).
\]

For

\[
S_g=\beta\left[a\sum_{\square_s}W(U_\square)
+d\sum_{\triangle}W(U_\triangle)\right],
\]

quadratic isotropy is now

\[
\boxed{\frac ad=2\tau^2-1},\qquad
d=\frac{c_t^2}{2},\qquad a=1-\frac{c_t^2}{2},\qquad c_t\tau=1.
\]

Both weights are positive throughout the surviving clock interval.  The correct ratio is

\[
1\le\frac ad\le1.09140667730735\ldots,
\]

not \(4\) to \(4.3656\).  Top and bottom triangles are exchanged by slice reflection and nonnegative compact-group character weights retain the site-reflection cone; a full link-orientation audit is still required.

Gauge covariantization of every hop preserves \(\gamma_5\)-Hermiticity, exact gauge covariance and the GW relation within any gap-preserving link chart.  The earlier \(5/(43\sqrt2)\) chart belongs to the now-superseded copied-\(r\), \(M=1\) point; only its method, not its numerical radius, transfers to the re-optimized kernel below.

### Exact anisotropic-overlap OS region — 2026-09-04

Status: **E for the branch/discriminant theorem and the negative covariance witness; C for carrying the standard free spectral cone proof to the adapted finite-volume site reflection.**

At zero spatial momentum and in a \(\gamma_0\) eigenspace,

\[
X_s(\omega)=(r_t-M)-r_t\cos\omega+i s c_t\sin\omega.
\]

For \(0<c_t<r_t\), its polar radicand has real energy branch points exactly when

\[
(r_t-M)^2+c_t^2-r_t^2\ge0.
\]

On the low-height branch this is

\[
\boxed{0<M\le r_t-\sqrt{r_t^2-c_t^2}}.
\]

For the inherited values \(r_t=1,c_t=2/\sqrt5\), the formerly used \(M=1\) lies outside this region.  Its branch points are \(\cosh E=\pm2i\).  At physical overlap mass \(m_f=1/2\), the \(2\times2\) covariance moment block has

\[
G_1=0.448254511969\ldots,\quad
G_2=0.149534156998\ldots,\quad
G_3=0.0374367081952\ldots,
\]

\[
\det\begin{pmatrix}G_1&G_2\\G_2&G_3\end{pmatrix}
=-0.00557929074723\ldots,
\]

with minimum eigenvalue \(-0.0112277672784\ldots\).  Hence that specific \(M=1\) anisotropic overlap theory is not reflection positive.

The aspect ratio itself survives.  The continuous repair is

\[
\boxed{0<M\le1-\frac1{\sqrt5}=0.552786404500\ldots}.
\]

For example \(M=1/2\) has \(\cosh E=3/2,7/2\), a finite positive-energy cut and exact full-spatial discriminant lower bound \(1/25\) for \(r\ge7/6\).  On every cut the least OS residue eigenvalue is positive because

\[
c_tC\sinh E>
\sqrt{S^2+(A-C\cosh E)^2}
\quad\Longleftrightarrow\quad Q_p(\cosh E)<0.
\]

Thus OS excludes the old height, not the inherited time aspect, and cannot select a unique clock by itself.

### Re-optimized reflected contraction and surviving clock interval — 2026-09-04

Status: **E for the time-face reduction and continuous no-go; N for the full global \((r,M)\) optimum and complex-radius equality.**

The old algebraic \(r=1.16954339716\ldots\) optimized the pre-reflection \(A_4\)-root symbol and is withdrawn for the new reflected family.  On the low-height OS region write \(y=\cos\omega\) and

\[
F(y,p)=S^2+c_t^2C^2(1-y^2)+[rB+1-M-Cy]^2.
\]

Since \(A=rB+1-M\ge\sqrt{1-c_t^2}\ge(1-c_t^2)C\), \(F\) decreases on \([-1,1]\).  Its minimum is at \(y=1\), its maximum at \(y=-1\), and both endpoint values are independent of \(c_t\).  This proves exactly that the uniform-contraction objective is flat in the time coefficient once OS holds.

The active KKT system plus twelve independent full spatial multistarts gives

\[
\boxed{r_*=0.355508034923519\ldots,\qquad
M_*=0.790940592107124\ldots}
\]

with residual \(1.78\times10^{-15}\),

\[
F_{\min}=0.625587020242767\ldots,
\quad F_{\max}=6.004156622750285\ldots,
\]

\[
\kappa=9.59763618564255\ldots,
\quad \rho_{\rm opt}=0.811278669604684\ldots.
\]

Global algebraic proof of the KKT stratum remains open, so the displayed \((r_*,M_*)\) is **N**, not **E**.  Conditional on it, OS leaves the exact continuum

\[
\boxed{
0.977902941999604\ldots
=\sqrt{2M_*-M_*^2}\le c_t\le1,}
\]

or

\[
1\le\tau\le1.02259637132823\ldots,
\qquad
1\le a/d\le1.09140667730735\ldots.
\]

The inherited \(c_t=2/\sqrt5\) slice has constrained best condition number \(21.7869449964\ldots\), so it is not a global contraction minimizer.

Positive one-step transfer is exact throughout the surviving low-height branch and does not split the interval.  General constrained searches in all complex momentum components at both endpoints and the midpoint found the same nearest pole,

\[
\omega=0,\qquad p=(iu,q,0),
\]

and permutations, with

\[
u=0.664911308818205\ldots,
\qquad q=2.70433752950868\ldots.
\]

It is exactly \(c_t\)-independent because \(\sin\omega=0\); 244 successful constrained searches give a radius spread \(2.45\times10^{-13}\).  Equality with the global complex radius is **N**, so locality supplies strong evidence for another flat direction but not a global theorem.

### Interacting gauge-boundary audit — 2026-09-04

Status: **N for the finite tests; F for the fixed-background false lead; U for interacting overlap reflection positivity and the chiral gauge measure.**

The finite reflected-cell audit uses \(N_t=6,N_s=2\), antiperiodic time, the exact site involution above and the determinant-weighted covariance Gram.  Free Wilson and overlap controls are positive semidefinite to \(3.6\times10^{-16}\).  Twelve reflection-paired backgrounds with all varied links strictly inside the two halves remain positive to roundoff, as factorization requires.

Allowing arbitrary fixed reflection-plane links produces a negative eigenvalue at link amplitude \(0.01\), but it does so for both overlap and Wilson controls:

\[
\lambda_{\min}^{\rm ov}=-2.27\times10^{-7},\qquad
\lambda_{\min}^{\rm W}=-2.79\times10^{-7}.
\]

This is not an overlap counterexample; it proves that boundary Haar integration cannot be replaced by a fixed-link covariance test.  A 64-point determinant-weighted \(U(1)\) Haar quadrature over one boundary link is positive for both theories to \(1.3\times10^{-16}\).  The primary free-overlap proof explicitly leaves gauge models for future work.  No all-boundary character/cone factorization and no gauge-invariant negative observable has yet been obtained.

### Strong-coupling gauge-invariant OS searches — 2026-09-04

Status: **N for the finite determinant-weighted searches; no counterexample found; U for the interacting theorem.**

Three independent-training/holdout audits sampled the full 528-link \(U(1)\) Haar ensemble at \(\beta=0\) on the same \(N_t=6,N_s=2\) cell.  Every observable was gauge invariant and every holdout sign was evaluated only after its direction had been selected on the training subset.

The 4,096-sample scalar-density search had overlap effective holdout sample size \(2543.44\) and returned

\[
\lambda_{\rm holdout}^{\rm scalar}
=-4.45346\times10^{-5},\qquad
{\rm CI}_{3.5\sigma}
=[-1.67785\times10^{-4},\,7.87154\times10^{-5}].
\]

The 2,048-sample complete local Hermitian-Clifford basis returned

\[
\lambda_{\rm holdout}^{\rm Clifford}
=9.83660\times10^{-5},\qquad
{\rm CI}_{3.5\sigma}
=[-3.62351\times10^{-4},\,5.59083\times10^{-4}].
\]

The 4,096-sample basis of all 112 elementary positive-half point-split scalar mesons, with explicitly reflected parallel transporters and gauge-covariance residual \(2.36\times10^{-15}\), returned

\[
\lambda_{\rm holdout}^{\rm split}
=6.98370\times10^{-6},\qquad
{\rm CI}_{3.5\sigma}
=[-2.19112\times10^{-5},\,3.58786\times10^{-5}].
\]

All three intervals contain zero, and matched Wilson controls are likewise unresolved.  The earlier raw minimum was adaptive selection noise around null directions.  These searches remove three candidate counterexample classes; they do not prove the interacting OS cone.

### Compact overlap support and the analytic-admissibility trilemma — 2026-09-04

Status: **E for the explicit singular family, the regulator trilemma and a nonanalytic positive-character gauge weight enforcing the certified gap; F for a globally gapped polar overlap with analytic full-support Wilson weights; U for the fermionic OS/continuum completion of the nonanalytic branch.**

The triangular action charges the former zero-action configuration, but at every finite \(\beta\) an ordinary Wilson or heat-kernel weight remains strictly positive there.  The same analytic construction works for every \(0<M<2\):

\[
\phi=\arccos(1-M),\qquad
\alpha_\pm=-\omega\pm\phi,\qquad
\frac18\sum_d e^{i(\omega+\alpha_d)}=1-M.
\]

Thus a finite-action compact-link configuration has \(X=D_W-M\) exactly singular.  Continuity puts arbitrarily small gaps in positive-weight neighborhoods, so the exact polar overlap has no uniform global gap on analytic full compact support.  Independent minimization of all 528 phases reached \(1.87\times10^{-30}\), while a one-link inertia bracket changed the Hermitian Wilson-kernel index from 0 to 1, corroborating the exact obstruction.

Exact open-set admissibility can remove the singular neighborhood.  For any compact group, if \(f\) is a nonnegative central function of small support, then

\[
w=f*\widetilde f,\qquad
\widehat w(R)=\widehat f(R)\widehat f(R)^\dagger\succeq0
\]

is pointwise nonnegative, compactly supported and lies in the nonnegative-character reflection cone.  For \(U(1)\), the triangular example has

\[
w_\delta(\theta)=\max(1-|\theta|/\delta,0),\qquad
\widehat w_\delta(n)=\frac{1-\cos(n\delta)}{\pi\delta n^2}\ge0.
\]

However, Creutz's positivity theorem implies that a nonzero single-face weight cannot simultaneously be analytic near the identity, have nonnegative character coefficients and vanish on an open set.  Smooth compact-support autocorrelations are \(C^\infty\) but necessarily nonanalytic at the identity.  The current regulator class therefore cannot possess all three of:

1. a uniform global exact-polar gap;
2. analytic positive-transfer face weights;
3. exact open-set admissibility.

The new volume-uniform threshold makes the nonanalytic branch explicit.  For (U(1)), choose the triangular autocorrelation support angle

\[
\delta=\frac{\epsilon_*}{2}.
\]
Then (2\sin(\delta/2)<\delta<\epsilon_*), so every configuration in the weight's support obeys the exact kernel-gap theorem.  For any compact group in the fermion representation, choose an identity neighborhood (V) with (VV^{-1}) inside the (epsilon_*) norm ball and set (w=f*\widetilde f).  This weight is pointwise nonnegative, compactly supported and has positive-semidefinite Peter--Weyl coefficients.  Thus the gauge-weight/gap merger is **E**, conditional on accepting nonanalyticity.  What remains unproved is the polar-overlap fermion boundary cone and the continuum limit of this nonanalytic action.

The axioms still have not selected among that nonanalytic admissible overlap, an almost-everywhere overlap, or an explicit finite Wilson/domain-wall regulator.

### Finite triangular \(U(1)\) gap and the volume-uniform frontier — 2026-09-04

Status: **E for the finite zero-lift \(U(1)\) theorem, the local coherence reduction and a volume-uniform compact-group gap theorem; F only for the global-Hodge route.**

On the \(N_t=6,N_s=2\) reflected cell, the repaired face-link incidence matrix has 528 columns and 1,296 rows.  Exact Fourier-block annihilators and trace moments give

\[
\operatorname{rank}B=477,\qquad
\dim\ker B=51=(48-1)+4,
\]

so the only real zero-curvature link modes are 47 gauge transformations and four torons.  Its exact least nonzero curvature eigenvalue is

\[
\lambda_{\min}^+(B^\dagger B)=6-2\sqrt7,
\qquad
\sigma_{\min}^+(B)=0.841722862865693\ldots.
\]

For the exact decimal-rational frozen values

\[
r=\frac{355508034923519}{10^{15}},\qquad
M=\frac{790940592107124}{10^{15}},
\]

a 13-leaf exact Bernstein subdivision proves throughout the surviving clock interval

\[
X_{\rm flat}^\dagger X_{\rm flat}\ge\frac35.
\]

In the zero-lift \(U(1)\) sector, \(|f_p|\le\delta\) on every repaired face gives

\[
\sigma_{\min}(X_U)\ge
\sqrt{\frac35}
-\frac{36(5+3r)}{\sqrt{6-2\sqrt7}}\,\delta.
\]

Therefore

\[
\boxed{\delta<0.00298539857027052\ldots}
\]

is a rigorous nonempty finite-volume overlap domain.  This is the first gauge-invariant gap theorem for the repaired faces, but it is not volume uniform, non-Abelian or inclusive of all topological sectors.

The failure of the global extrapolation is exact.  At zero spatial momentum and temporal phase \(z=e^{ik}\), the curvature Gram block has

\[
\det(xI-H)=x(x-8)^3(x-12)
\left[x^2-12x+8q\right]^3,\qquad
q=4\sin^2\frac k2.
\]

At \(k=2\pi/N_t\),

\[
\lambda_-(k)=6-2\sqrt{9-8\sin^2(\pi/N_t)}
=\frac{8\pi^2}{3N_t^2}+O(N_t^{-4}).
\]

Consequently the global flat-connection/Hodge sufficient radius shrinks at least as \(L^{-3}\) on isotropic cells.  That proof route is **F**, not local admissibility itself.

The elementary faces nevertheless give volume-independent compact-group bounds.  With \(S_i\) the spatial shifts, \(V_b\) the eight future shifts and \(A=\frac18\sum_bV_b\),

\[
\|S_iV_b-V_{b+e_i}\|\le\epsilon,\qquad
\|V_bS_i-V_{b+e_i}\|\le\epsilon,
\]

\[
\|[S_i,V_b]\|\le2\epsilon,\qquad
\left\|A-\frac{(1+S_3)(1+S_2)(1+S_1)}8V_{---}\right\|
\le\frac32\epsilon.
\]

Spatial-square reordering costs at most \(3\epsilon/4\), and replacing the temporal Wilson term by the coherent product costs at most \(3\epsilon\).  The next exact gap calculation is now sharply reduced to an HJL-style noncommutative positive decomposition for that coherent-product kernel.

That remaining local calculation is now closed.  At \(c_t=1\), an exact 54-monomial rational Gram certificate gives

\[
Y_1^\dagger Y_1-\frac12=W^\dagger QW+E,
\qquad Q>0.
\]

The certificate is independent of its numerical SDP discovery: after exact rational coefficient repair, every Laurent coefficient agrees identically, and a rational invertible congruence \(H=R^TQR\) is strictly diagonally dominant.  Its weakest exact row margin is

\[
0.999999642010475\ldots>0,
\]

so Gershgorin proves \(Q>0\) without floating-point assumptions.  Expanding the noncommuting remainder into 2,744 reduced word/Clifford terms and sorting each word with only the face-derived commutators gives

\[
\|E\|\le C_{\rm sos}\epsilon,
\qquad
C_{\rm sos}
=\frac{31609995260211360153317050551539}
{281250000000000000000000000000}
=112.391094258529\ldots.
\]

Let

\[
B=6+6r-M=7.34210761743399.
\]

The surviving clock range obeys \(\|Y_c-Y_1\|\le1-c\), while triangle coherence gives \(\|X_c-Y_c\|\le3\epsilon\).  Using the strict rational lower bound

\[
\frac{977902941999603}{10^{15}}<\sqrt{2M-M^2}
\]

therefore proves, exactly and for every allowed \(c_t\),

\[
X_c^\dagger X_c
\ge
0.175522044264809\ldots
-156.443739963133\ldots\,\epsilon.
\]

Consequently the repaired local face condition

\[
\boxed{\epsilon<0.00112194993744187\ldots}
\]

gives a strictly positive overlap-kernel gap uniformly in lattice volume.  The proof uses only unitary shift algebra, so it applies to every compact gauge group in the fermion representation and does not require a global gauge fixing, an Abelian reduction or a topologically trivial sector.  The polar overlap is therefore well-defined and exponentially local throughout this conditional admissible domain.

This closes the locality/gap gate.  It does **not** select a measure that enforces the strict face condition: analytic positive-character weights cannot do so by the Creutz obstruction.  Nor does it prove interacting fermionic reflection positivity, a global chiral determinant measure or a continuum limit.

### Exact gauge-sector site-reflection factorization — 2026-09-04

Status: **E for the repaired compact-support gauge sector, including the entire gap-supported domain; U only after the polar fermion factor is introduced.**

In integer slice coordinates the Cathedral reflection is

\[
\vartheta(t,n)=(-t,n+t(1,1,1)).
\]

Exact enumeration of all face types shows that spatial squares at time (t) map to spatial squares at (-t), preserving orientation.  A bottom triangle in slab ([t,t+1]) maps to a top triangle in slab ([-t-1,-t]), reversing orientation; applying (\vartheta) again returns the original face.  There are no fixed time-spanning faces.  Only the spatial squares on the (t=0) slice are fixed.

For every real central pointwise-nonnegative face weight with (w(g^{-1})=w(g)), this gives the exact density factorization

\[
W_{\rm gauge}=W_0W_+\vartheta(W_+),\qquad W_0\ge0.
\]

Haar invariance then yields, for every positive-half gauge observable (F),

\[
\int dU\,\vartheta(F)F W_{\rm gauge}
=\int dU_0\,W_0
\left|\int dU_+\,F W_+\right|^2\ge0.
\]

Therefore the repaired autocorrelation gauge measure is site-reflection positive, and the support choice described above keeps every contributing configuration inside the volume-uniform overlap-gap domain.  This removes the gauge-only transfer ambiguity.  It does not imply the corresponding factorization after multiplying by the gauge-dependent polar-overlap fermion action.

### Domain-wall Pauli--Villars shortcut inside the gap domain — 2026-09-04

Status: **F for the standard domain-wall/PV proof shortcut on curved gauge backgrounds; U, not F, for interacting polar-overlap reflection positivity itself.**

An older 2001 proceedings report sketched a gauge-overlap positivity claim through the domain-wall representation, but cited its detailed proof only as “in preparation.”  The later 2010 analysis by Kikukawa and Usui proved the free and nongauge cases and explicitly identified the missing step: with gauge interaction, time reflection exchanges the Pauli--Villars kernels \(Y^\dagger Y\) and \(YY^\dagger\), which differ when covariant time and space shifts do not commute.

The issue is not confined to rough fields.  Set \(S_2=S_3=I\) and use finite Weyl unitaries

\[
SV=qVS,\qquad q=e^{2\pi i/N}.
\]

Assign the four minus future-link types to \(V\) and the four plus types to \(SV\).  Every spatial square, every axis-two/three triangle and every bottom axis-one triangle is flat; the remaining top triangles have deviation \(|q-1|\).  The future average is exactly \(A=(1+S)V/2\), so this is the coherent kernel used in the gap theorem.

Exact Weyl/Clifford expansion gives 18 nonzero coefficients in

\[
Y^\dagger Y-YY^\dagger.
\]

Every coefficient is divisible by \(q-1\), and the coefficient of \(S\gamma_0\) is particularly simple:

\[
\boxed{-\frac{q-1}{4}}.
\]

It is independent of \(r\) and \(M\).  At \(N=5601\), using \(\pi<355/113\),

\[
|q-1|=2\sin\frac\pi N
<\frac{2(355/113)}{5601}
<0.00112194993744187\ldots=\epsilon_*.
\]

Thus \(Y\) is demonstrably nonnormal on a background lying strictly inside the certified overlap-gap domain.  The simple Pauli--Villars factorization route cannot prove reflection positivity there.  This does not constitute a negative OS observable for the polar overlap itself; a direct cross-boundary factorization or a gauge-invariant counterexample remains necessary.

The literature frontier was rechecked through 2026-09-04.  Kikukawa's 29 June 2026 YITP presentation, [*On the Hamiltonian formalism of Spin(10) chiral lattice gauge theory*](https://indico.yukawa.kyoto-u.ac.jp/event/78/contributions/1982/), states reflection positivity for its Spin(10) overlap-Weyl construction **in the weak gauge-coupling limit**.  The same presentation explicitly says that at finite coupling reflection positivity is not maintained even by its gauge-field action because of the usual admissibility condition.  This is current conference material, not a published all-coupling theorem.  Its complete-saturation/'t Hooft-vertex measure construction is also specific to a Spin(10) chiral 16 and is not automatically a construction for the Cathedral exterior carrier.

The Cathedral autocorrelation weight removes the presentation's gauge-action-specific objection at the gauge-only level: its compact support enforces admissibility while its nonnegative character coefficients and the face-orbit factorization preserve gauge reflection positivity.  But the weak-coupling presentation does not factor the gauge-dependent polar kernel at finite coupling, so it does not close the remaining Cathedral fermion gate.

### Half-step reflection geometry no-go — 2026-09-05

Status: **E for the affine graph classification; F for importing an ordinary pure-time link reflection; U for the site-reflected polar fermion cone.**

Write the staggered lattice in physical coordinates as

\[
\Lambda=\{(t,x):t\in\mathbb Z,\ x=n+t h,\ n\in\mathbb Z^3\},
\qquad h=\frac12(1,1,1).
\]

Every half-step affine graph reflection with a cubic signed-permutation linear part has the form

\[
\Theta_{R,a}(t,x)=(1-t,Rx+a).
\]

Lattice preservation and involutivity are exactly

\[
a-h\in\mathbb Z^3,
\qquad R^2=I,
\qquad (I+R)a=0.
\]

Putting \(v=2a\), these say that every component of \(v\) is odd and \(Rv=-v\).  An involutive signed permutation admits such an odd vector if and only if every one-cycle has sign \(-1\).  Exhausting the 48 signed permutations gives 20 linear involutions and exactly seven admissible half-step linear parts: central inversion and six determinant-one edge-axis half turns.  Every induced direction-map residual is zero.

The pure-time choice \(R=I\) is impossible: involutivity requires \(a=0\), while lattice preservation requires \(a-h\in\mathbb Z^3\).  More strongly, the intersection of the seven admissible parts with the selected order-12 tetrahedral \(A_4\) stabilizer is empty.  Thus the usual pure-time link-reflection proof geometry cannot be imported without enlarging or twisting the selected spatial symmetry.  The physical integer-plane site reflection

\[
\vartheta(t,n)=(-t,n+t(1,1,1))
\]

survives and remains the geometry on which the interacting Cathedral fermion question must be decided.

### Admissible gauge-invariant nullspace tests — 2026-09-05

Status: **N for the finite tests; no negative witness in the sampled local bases; no nonzero quadratic response resolved; U for the full selected face-weight cone.**

To remove the rough-field scope defect of the earlier \(\beta=0\) searches, take independent link angles in

\[
[-\alpha,\alpha],
\qquad
\alpha=\frac{\epsilon_*}{8}
=0.000140243742180233\ldots,
\]

and Haar-average their product measure over local gauge transformations.  The average is gauge invariant and leaves face holonomies unchanged.  Before that average, identical even link densities pair across the site reflection and the fixed-plane density is pointwise nonnegative, so the measure is reflection positive on the gauge-invariant algebra.  Uniform support gives the exact bounds

\[
|\phi_{\square}|\le4\alpha=\frac{\epsilon_*}{2},
\qquad
|\phi_{\triangle}|\le3\alpha=\frac{3\epsilon_*}{8},
\qquad
|e^{i\phi}-1|\le|\phi|<\epsilon_*.
\]

Hence every configuration lies inside the proved volume-uniform overlap-gap domain.  In 1,024 deterministic-seed samples, every overlap and Wilson determinant was positive, the holdout effective sample sizes were 768 to roundoff, and

\[
\min X^\dagger X=0.681552885561\ldots.
\]

The overlap-selected scalar-density witness returned

\[
-1.27844\times10^{-13},
\qquad
\mathrm{CI}_{3.5\sigma}
=[-7.63883\times10^{-13},5.08195\times10^{-13}],
\]

and the complete elementary point-split meson basis returned

\[
-3.40260\times10^{-12},
\qquad
\mathrm{CI}_{3.5\sigma}
=[-1.76648\times10^{-11},1.08596\times10^{-11}].
\]

Both contain zero; matched Wilson controls do too.  This is not positivity evidence beyond the tested finite basis and is not a counterexample.

The complete determinant-reweighted second derivative was then summed over all 528 link directions and compressed to every free OS nullspace.  Three Richardson regimes, \((h,h/2)=(8,4)10^{-4},(2,1)10^{-2},(4,2)10^{-2}\), show that all apparent negative minima obey

\[
|\lambda_{\rm apparent}(h)|\propto h^{-2}.
\]

The four fitted exponents lie between 1.9205 and 2.0489, while \(h^2|\lambda|\) varies by at most 17.1%.  That is accumulated second-difference roundoff, not convergence to a nonzero quadratic coefficient.  No second-order overlap obstruction is resolved; the first stable signal occurs at fourth order on a localized reflection orbit below.

### Explicit reflection-orbit overlap-negative witness — 2026-09-05

Status: **N, robustly overlap-specific, for a finite reflection-positive gauge probe; interval certification and the selected triangular face weight remain U.**

On the \(N_t=6,N_s=2\) reflection cell, vary the reflected future-link pair

\[
\ell=((2,0,0,0),(1,-1,0,-1)),
\qquad
\vartheta\ell=((3,0,1,0),(1,0,-1,0)).
\]

Each link independently takes

\[
z=\frac{12+5i}{13}
\quad\text{or}\quad
z^{-1}=\frac{12-5i}{13}
\]

with probability \(1/2\); all other links are the identity.  This four-point product measure factors across the reflection orbit and is gauge-sector site-reflection positive.  Local Haar gauge averaging makes it gauge invariant without changing the following gauge-invariant expectation.  Its largest triangle deviation is \(\sqrt{2/13}\), every spatial square is flat, and all four overlap kernels remain deeply gapped:

\[
\min X^\dagger X=0.679434736616\ldots.
\]

Let \(S_{t,n}=\sum_a\bar\psi_{t,n,a}\psi_{t,n,a}\) and

\[
F=\sum_{t=1,2}\sum_{n\in\mathbb Z_2^3}c_{t,n}S_{t,n},
\]

with the fixed rational coefficients

\[
c_{1,n}=-\frac{17}{10000},
\]

and, for \(|n|\) the Hamming weight,

\[
c_{2,n}=
\begin{cases}
223/250,&|n|=0,\\
51/10000,&|n|=1,\\
-1019/5000,&|n|=2,\\
-1411/5000,&|n|=3.
\end{cases}
\]

After normalizing this coefficient vector and including the one-flavour massive determinant, three independent polar constructions give

\[
\boxed{
\langle\vartheta(F)F\rangle_{\rm overlap}
=-4.5357286\times10^{-8}<0,
}
\]

with a method spread \(2.50\times10^{-15}\), whereas the same fixed witness gives

\[
\boxed{
\langle\vartheta(F)F\rangle_{\rm Wilson}
=+8.9679888\times10^{-8}>0.
}
\]

The largest pairwise polar-operator discrepancy among the \(X^\dagger X\), SVD and Hermitian-sign constructions is \(8.75\times10^{-15}\).  An independent implementation using 18-decimal `long double`, in-house pivoted LU and Newton matrix sign gives

\[
-4.535728340394875\times10^{-8}
\quad\text{and}\quad
+8.967988808128068\times10^{-8},
\]

with \(\|S^2-I\|_F=4.18\times10^{-17}\).  Thus the negative sign is not a raw-eigenvalue, gauge-variance, rough-field, singular-kernel, Wilson-control or shared-LAPACK artifact.

The negative small eigenvalue scales as \(-2.407\times10^{-6}s^4\) from link angle \(s=0.02\) through \(0.1\), while the Wilson minimum stays at its arithmetic floor.  This was the numerical bridge to the sharper selected-support interval theorem recorded next.  Its former “pending interval certification” status is superseded by that theorem; the rough \((12+5i)/13\) witness itself remains a historical **N** certificate.

### Selected-face interval no-go and finite-transfer completion — 2026-09-05

Status: **E/F for the \(c_t=1\) exact-polar branch; C with an exact positivity theorem for the replacement finite-transfer theory.**

The selected triangular support radius is

\[
\epsilon_*=
\frac{394924599595820227835064176865}
{351998414917049746226536404412312},
\qquad
\delta=\frac{\epsilon_*}{2}.
\]

Put the reflected link-orbit angle at

\[
s=\frac{\epsilon_*}{4}=\frac{\delta}{2}
=0.00028048748436046672\ldots.
\]

Exact face enumeration shows that every spatial square is flat and exactly twelve repaired triangles have angle magnitude \(s\).  Every nonzero triangular hat factor is therefore

\[
w_\delta(s)=1-\frac{|s|}{\delta}=\frac12,
\]

so the selected positive-half density at every orbit point is exactly \(2^{-12}=1/4096>0\).  The earlier rough witness lay outside this support; this scaled witness does not.

An independent 33-decimal quad-precision matrix-sign/LU calculation gives the minimum scalar Gram eigenvalue

\[
-1.49085903700544937230604754738723226\times10^{-20},
\]

with coefficient \(\lambda_{\min}/s^4=-2.40869955695752\times10^{-6}\).  The decisive 256-bit Arb/Acb calculation encloses the determinant-weighted overlap scalar in

\[
\boxed{
-1.490859037005104043136618184680535588155\times10^{-20}
\le Q_{\rm ov}\le
-1.490859037005104043136523340756550350519\times10^{-20}<0.
}
\]

The same fixed witness for Wilson fermions obeys

\[
\boxed{
3.055017533281635522193808020001451139198\times10^{-20}
\le Q_{\rm W}\le
3.055017533281635522193808020001451139200\times10^{-20}.
}
\]

All inputs \(r,M,m,\epsilon_*\) and witness coefficients are exact rationals; \(\exp(is)\) is enclosed by Arb transcendental balls.  Ten rational Newton-sign iterations plus the certified \(\|S_k^2-I\|_F\) remainder give a maximum exact-sign spectral error below \(2.528\times10^{-47}\).  The maximum Hermiticity residual is below \(1.570\times10^{-75}\).

On the finite connected compact \(U(1)\) graph, Wilson-loop coordinates separate gauge orbits.  Multiplying a positive-half fermion observable by real gauge-invariant cylinder bumps localizes it near the two orbit points; reflection supplies the negative half.  Since the selected density is strictly positive there, its amplitude can be compensated, and strict negativity persists for sufficiently narrow nonzero-width bumps by continuity.  Therefore the selected face integral cannot average the mode away.

This is an **E** finite-volume no-go at \(c_t=1\), and the selected nonlocal exact-polar merger is **F** there.  Other surviving \(c_t\) values show the same sign numerically but are not covered by this interval theorem.

The completion premise now fixes the face-democracy endpoint

\[
c_t=1,\qquad a=d=\frac12,\qquad \theta=0,\qquad \lambda=0,
\]

and replaces the failed nonlocal determinant by the local \(L=N=13\) Wilson/domain-wall Hamiltonian transfer.  With

\[
K=6+6r-M,\qquad a_5=\frac1{2K},\qquad a_5K=\frac12,
\]

the free wall tail is \(|1-M|^{13}=1.4571568708\times10^{-9}\).  The mirror wall is explicitly retained as a KO-6-conjugate cutoff-mass sector.  For self-adjoint local \(H_{\rm local}\), nonnegative selected face multiplication \(W_\delta\), and the compact-gauge Gauss projector \(P_G\), define

\[
T=P_GW_\delta^{1/2}e^{-aH_{\rm local}}W_\delta^{1/2}P_G,
\qquad
B=e^{-aH_{\rm local}/2}W_\delta^{1/2}P_G.
\]

Then

\[
\boxed{T=B^*B\ge0,}
\]

so every finite cylinder OS Gram matrix is positive semidefinite before any fermion determinant is formed.  This is exact for the declared finite model.  In v27 the \(48\times48\) response Dirac/Yukawa operator is no longer merely supplied as infrared boundary data: it is the exact endpoint Schur complement of a finite local wall operator. Masses, CKM, PMNS, neutrinos, couplings, cosmology and the conditional gravity response are retained unchanged.

### Microscopic \(L=13\) response-wall closure — 2026-09-05 v27

Status: **C/E finite constructive theorem; 16/16 implementation checks pass.**

Let \(G_j\), \(j=0,\ldots,10\), be the eleven diagonal attenuation links made only from the already closed primitive mass-route factors, padded by identity transmissions. The longest nontrivial route is the eight-factor neutrino-1 route, so no fractional-root splitting is used. Let

\[
U_{24}=I_9\oplus(V_{\rm CKM}\otimes I_3)\oplus I_3\oplus U_{\rm PMNS},
\qquad R_{11}=-U_{24},\quad R_j=G_j.
\]

On thirteen wall sites, define the \(312\times312\) lower-bidiagonal chiral operator

\[
(A_{\rm wall})_{ss}=I_{24}\quad(1\le s\le11),
\qquad
(A_{\rm wall})_{s+1,s}=-R_s,
\]

with vanishing endpoint diagonal blocks. Eliminating the eleven unit cutoff blocks gives

\[
\boxed{
(A_{\rm wall}/A_{\rm internal})_{12,0}
=-R_{11}R_{10}\cdots R_0
=U_{24}\,\operatorname{diag}(m_f/m_t)
=Y_{24}.
}
\]

Consequently

\[
D_{48}=\begin{pmatrix}0&Y_{24}^*\\Y_{24}&0\end{pmatrix}
\]

is derived from the microscopic wall rather than inserted into it. The full nearest-wall matter operator

\[
D_{\rm wall}=\begin{pmatrix}0&A_{\rm wall}^*\\A_{\rm wall}&0\end{pmatrix}
\]

has shape \(624\times624\) and is exactly self-adjoint by construction. Numerical reproduction residuals are \(5.7411\times10^{-29}\) for the endpoint \(Y_{24}\), \(8.1191\times10^{-29}\) for \(D_{48}\), \(5.1054\times10^{-16}\) for \(U_{24}\) unitarity, zero for the gauge-charge commutator, and zero for wall-Dirac Hermiticity. The internal block condition number is \(14.5172\). This closes the former finite microscopic-boundary insertion gate without changing any response output.

### Cutoff-mirror decoupling — 2026-09-05 v27

Status: **C/N for the declared gravity-scale and standard inflationary/thermal premises.**

Using the declared physical identification \(G_{\rm geom}=G_N/a_*^2\), one cutoff unit is

\[
M_{\rm cut}=a_*^{-1}=\sqrt{G_{\rm geom}}M_{\rm Pl}.
\]

The already closed identities \(\alpha_G^{(e)}=(m_e/M_{\rm Pl})^2\) and \(m_e/m_t\) eliminate every dimensionful calibration:

\[
\boxed{
\frac{M_{\rm mirror}}{m_t}
=\sqrt{G_{\rm geom}}\,
\frac{m_e/m_t}{\sqrt{\alpha_G^{(e)}}}
=5.353374188607143\times10^{15}.
}
\]

This is \(6.794061654070535\times10^{13}\) times the full 13.6 TeV LHC Run-3 centre-of-mass energy, with an order-one dimension-six power ceiling \(2.1664\times10^{-28}\). From the locked \(A_s\) and \(r\), the standard slow-roll relations give

\[
\frac{M_{\rm mirror}}{V_*^{1/4}}=198.3733,
\qquad
\frac{M_{\rm mirror}}{H_*}=1.737736\times10^5.
\]

Even taking \(T_{\rm reh}=V_*^{1/4}\) gives \(\exp(-M/T)=7.0398\times10^{-87}\); the adiabatic gravitational estimate has \(\log_{10}\exp(-2\pi M/H)=-474185.25\). Direct production, order-one virtual flavour effects and standard inflationary/thermal production are therefore closed as decoupled in this selected branch. The \(1.4572\times10^{-9}\) finite-wall chiral tail is not a relic abundance. An independently imposed nonthermal trans-cutoff initial population is outside this theorem and must not be silently assumed either present or absent.

### One-anchor scale, fixed adjoint RG and \(D_6\) gauge-gravity bridge — 2026-09-05 v28

Status: **C/N** for three explicit bridges; no mass, CKM, PMNS, neutrino, coupling, cosmology, wall or mirror response formula is reopened or retuned.

Use \(M_Z=91.1876\,\mathrm{GeV}\) as the sole dimensional calibration. With the already closed

\[
\alpha_0^{-1}=137.035999178195\ldots,
\qquad \sin^2\theta_W=\frac3{13},
\qquad y_t=1-\Delta,
\]

and all charged ratios \(m_f/m_t\), solve the declared one-loop point-fermion fixed point

\[
\alpha_Z^{-1}=\alpha_0^{-1}
-\sum_{f<M_Z}\frac{N_cQ_f^2}{3\pi}
\left[2\ln\frac{M_Z}{m_f}-\frac53\right],
\]

\[
\frac{m_t}{M_Z}=\frac{\sqrt2\,y_t\cos\theta_W}{g_2},
\qquad
g_2^2=\frac{4\pi}{\alpha_Z^{-1}\sin^2\theta_W}.
\]

The unique iterated solution is

\[
\boxed{\alpha_Z^{-1}=127.740736644743\ldots,\qquad
\frac{m_t}{M_Z}=1.895001944347\ldots,\qquad
m_t=172.800679300342\ldots\ \mathrm{GeV}.}
\]

The top value is \(0.795\sigma\) from the recorded direct-average benchmark, but this is retrospective. The same bridge gives

\[
\Delta m_{21}^2=7.33082519137\times10^{-5}\ \mathrm{eV}^2,
\qquad
\Delta m_{32}^2=2.38091235176\times10^{-3}\ \mathrm{eV}^2,
\]

so the atmospheric diagnostic remains \(3.395\sigma\) low. More decisively, comparing the partonic \(\alpha_Z^{-1}\) directly with the quoted \(\overline{\mathrm{MS}}\) benchmark produces a scheme-mixed \(23.66\sigma\) discrepancy. This is not hidden: pointlike \(u,d,s\) vacuum polarization is not a controlled replacement for nonperturbative hadronic polarization. Thus the one-anchor algebraic fixed point is closed under its declared approximation, while precision electroweak matching is not.

For GUT-normalized \(A_i=\alpha_i^{-1}\) and

\[
\frac{dA_i}{d\ln\mu}=-\frac{b_i}{2\pi},
\qquad
(b_1,b_2,b_3)=\left(\frac{41}{10},-\frac{19}{6},-7\right),
\]

the fixed downward threshold logs are

\[
\ell_2=(3+\sqrt5)\eta_\Delta=31.394405837934\ldots,
\qquad
\ell_3=\sqrt{15}\eta_\Delta=23.221625749873\ldots.
\]

Using the measured electroweak \(M_Z\) coordinates only to solve the \(A_1=A_2\) crossing gives

\[
\boxed{\mu_U=1.034797503866\times10^{18}\ \mathrm{GeV},
\qquad \alpha_U^{-1}=34.88720993005\ldots.}
\]

The independent (A_1=A_3) crossing differs by only

\[
\Delta\ln\mu=-0.006058122346,
\]

and the three-coupling inverse mismatch at the \(A_1=A_2\) scale is \(-3.0677\times10^{-4}\) fractionally. Without using the strong coupling to solve that crossing, the fixed threshold law predicts

\[
\boxed{\alpha_s(M_Z)=0.117851167750,}
\]

which is \(-0.162\sigma\) from the recorded \(0.1180\pm0.0009\) benchmark after propagation of the electroweak input uncertainty. This agreement is strong but retrospective and one-loop.

The corresponding v28 prospective thresholds are now frozen:

\[
\boxed{M_{\mathbf3}=2.401254293485\times10^4\ \mathrm{GeV},
\qquad
M_{\mathbf8}=8.508077719748\times10^7\ \mathrm{GeV}.}
\]

Finally, combine the already closed spectral invariant

\[
\frac{G\Lambda_{\rm grav}^2}{g_U^2}=\frac{\eta_\Delta}{16\pi}
\]

with the new explicit one-parent-trace bridge

\[
\Lambda_{\rm grav}^2
=\operatorname{Tr}_{D_6}(\mu_U^2I_6)
=6\mu_U^2.
\]

Newton's constant is then an output:

\[
\boxed{G_N^{\rm Cathedral}=6.68742257313\times10^{-39}\ \mathrm{GeV}^{-2},
\qquad M_{\rm Pl}=1.222842759997\times10^{19}\ \mathrm{GeV}.}
\]

The central (G_N) difference is (-0.3191\%\), or (-0.149\sigma) after propagating only the quoted electroweak input uncertainty. The (D_6) trace factor is not fitted, and (G_N) is not used to solve the gauge scale. However, the bridge was articulated with (G_N) already known, so this is a precise retrospective compatibility result, not a blind success. It must survive two-loop threshold matching and derivation of the trace normalization from the continuum action.

### External comparison and prospective freeze — 2026-09-05

Status: **N external audit; no blind success claimed.**

The 2025 PDG three-generation unitary CKM fit gives a worst elementwise marginal pull of \(1.0334\sigma\) for the frozen Cathedral matrix; its phase and Jarlskog invariant are each within \(0.18\sigma\).  Against the PDG 2025 normal-ordering neutrino ledger, the three PMNS angle pulls are \(-0.322\sigma,\ 0.094\sigma,\ 1.370\sigma\), the phase lies inside the published three-sigma range, and the scale-free splitting ratio differs by \(0.390\sigma\) in an uncorrelated marginal diagnostic.  The response \(\alpha_s=0.1183431953\ldots\) is \(0.381\sigma\) from the PDG 2025 average \(0.1180\pm0.0009\).  The Planck marginal pulls for \(\Omega_m,\sigma_8,n_s,\tau\) all have magnitude below \(0.34\sigma\).

The later DESI DR2 analysis reports that dynamical dark energy is preferred to rigid \(\Lambda\)CDM at \(3.1\sigma\) for DESI BAO plus CMB and at \(2.8\)–\(4.2\sigma\) after adding supernova samples.  That is a modern-data pressure test on the Cathedral's fixed \(\Omega_\Lambda=13/19\) response, not evidence to omit.  DESI's quoted \(\Lambda\)CDM 95% bound \(\sum m_\nu<0.064\) eV still contains the locked Cathedral value \(0.05803464102\) eV.  A full likelihood comparison remains mandatory.

Those agreements are retrospective compatibility because the formulas were developed with historical knowledge of the targets.  They are not counted as blind confirmation.  A direct \(172.6\) GeV top-unit calibration predicts

\[
\Delta m_{32}^2=2.3753854941\times10^{-3}\ {\rm eV}^2,
\]

which is \(3.635\sigma\) below the chosen PDG marginal reference.  The dimensionless splitting ratio remains compatible. Version v28 now supplies a single-\(M_Z\) conditional scale map, but its \(3.395\sigma\) one-anchor atmospheric tension and uncontrolled light-quark polarization show that precision scheme/running validation is still not closed. The mass tree itself remains internally solved and unchanged.

Version v26 locks the following prospective outputs against retuning:

\[
\text{normal ordering},\quad
m_1=2.2895359061\times10^{-9}\ {\rm eV},\quad
\sum m_\nu=0.05803464102\ {\rm eV},
\]

\[
m_\beta=0.008789076475\ {\rm eV},\quad
r=0.0004916918203,\quad
\alpha_s'\equiv\frac{dn_s}{d\ln k}=-6.196066062\times10^{-6},
\]

together with the retained cutoff-mass mirror wall.  Any later change is a new model version and cannot count as a successful prediction by v26.

Version v28 separately locks the physical-completion prediction of a vectorlike Dirac \(SU(2)\) adjoint at \(24.01254293485\,\mathrm{TeV}\) and a vectorlike Dirac \(SU(3)\) adjoint at \(8.50807771975\times10^7\,\mathrm{GeV}\). The quoted \(1.0796\%\) scale uncertainty propagates only the electroweak input errors; uncomputed higher-order systematics are not disguised as a confidence interval. Moving either central threshold or either exponent after this date creates a new model version.

### Clock quotient and first frozen phenomenology check — 2026-09-04

Status: **E for the free continuum expansion and one-loop comparison arithmetic; C for calling \(c_t\) a regulator redundancy; F for the literal \(c\nu=1\) high-scale Standard Model coupling identification.**

With physical variables \(p_i=ak_i\) and \(\omega=ak_0/c_t\), canonical overlap normalization gives

\[
\frac{2M}{a}D_{\rm ov}
=i\gamma^\mu k_\mu+\frac{a}{2M}k^2+O(a^2).
\]

The first \(c_t\)-dependence occurs in dimension-six, \(O(a^2)\) artifacts.  Hence all surviving clock values have the same free continuum kinetic operator.  Calling them one universality class remains conditional on construction of the interacting continuum limit.

The previously frozen literal entropy branch has

\[
\alpha_U^{\rm literal}=\frac{\pi}{8\log2}
=0.566545017728399\ldots,\qquad
(\alpha_U^{\rm literal})^{-1}=1.76508480122\ldots.
\]

Using PDG 2024 \(\overline{\rm MS}\) inputs at \(M_Z\) gives

\[
\alpha_1=0.0169478,\qquad
\alpha_2=0.0337964,\qquad
\alpha_3=0.1180.
\]

At one-loop in the Standard Model, \(b_2=-19/6\) and \(b_3=-7\), so both \(\alpha_2\) and \(\alpha_3\) decrease above \(M_Z\).  Neither can ever reach the much larger literal value.  The \(U(1)\)-\(SU(2)\) crossing is

\[
\mu_{12}=1.01396\times10^{13}\ {\rm GeV},\qquad
\alpha_{12}=0.0235806,
\]

where \(\alpha_3=0.0271659\), still \(15.20\%\) larger; the minimal one-loop Standard Model has no exact triple crossing.  Matching the electroweak crossing requires

\[
\boxed{c\nu=24.0258731\ldots}.
\]

Thus the normalization-one identification is empirically **F** under the stated spectral-action and Standard Model running assumptions.  The wider framework is not falsified by this test because \(c\nu\), thresholds and additional matter were already unfixed—but that is precisely why the entropy value is not an absolute coupling prediction.

### Matched two-loop gauge branch and normalized gravity coherence — 2026-09-05 v29/v30

Status: **C/N** for the declared finite spin/statistics family, matching scheme and normalized contraction premise.

The exact router shifts \(\Delta b=(0,8/3,4)\) admit four spin/statistics realizations when each non-Abelian sector independently uses either one vectorlike Dirac adjoint or \(D+1=4\) complex adjoint scalars. A deterministic two-loop RK4 evolution with the Standard Model two-loop gauge matrix and one-loop top-Yukawa feedback selects, after comparison, the unique Dirac-\(SU(2)\)/four-scalar-\(SU(3)\) branch:

\[
\mu_U=1.72933782875344\times10^{18}\ {\rm GeV},\qquad
\alpha_U^{-1}=34.3039760050435,
\]

\[
\boxed{M_2=4.01293960476915\times10^4\ {\rm GeV}},\qquad
\boxed{M_3=1.42185699093456\times10^8\ {\rm GeV}},
\]

\[
\boxed{\alpha_s(M_Z)=0.117671987309317.}
\]

No continuous coefficient is fitted, but the spin/statistics choice used the known strong-coupling reference and is therefore retrospective. The two masses are frozen prospectively in v29.

For two-loop running, the required one-loop \(\overline{\rm MS}\) matching identity is

\[
A_{\rm high}(\mu_d)-A_{\rm low}(\mu_d)
=-\frac{\Delta b}{2\pi}\ln\frac{\mu_d}{M},
\qquad A=\alpha^{-1}.
\]

The central rule \(\mu_d=M\) has zero finite one-loop constant. Scanning each decoupling scale independently over \(M/2,M,2M\), without changing either physical mass or any response primitive, gives

\[
\boxed{0.116568627020<\alpha_s(M_Z)<0.118784727038},
\]

\[
1.71171195925\times10^{18}<\mu_U<1.74713565384\times10^{18}\ {\rm GeV}.
\]

The reference \(0.1180\pm0.0009\) lies inside this two-loop-consistent no-retuning envelope. Three-loop running would require two-loop finite matching constants and is a later perturbative order, not missing data at the declared v30 order.

The \(A_4\) shortest-loop bivectors obey \(\sum A_{ijk}\otimes A_{ijk}=5I\) on \(\Lambda^2(V_4)\), while the unit-normalized \(D_6\) parent trace is \(I_6/\sqrt6\). The declared normalized continuum contraction therefore fixes

\[
\frac{\Lambda_{\rm grav}^2}{\mu_U^2}=\frac5{\sqrt6}.
\]

Combining it with the already closed spectral invariant gives

\[
G_{\rm gauge}=7.15794699863\times10^{-39}\ {\rm GeV}^{-2}.
\]

Independently, the closed recursive \(21\)-channel value \(\alpha_G^{(e)}\) and the one-\(M_Z\)-anchor electron coordinate give

\[
G_{\rm recursive}=7.15320533167\times10^{-39}\ {\rm GeV}^{-2}.
\]

Their relative difference is \(6.62873\times10^{-4}\), and the electron mass inferred from the gauge-gravity route differs from the one-anchor response mass by \(3.31272\times10^{-4}\). Neither internal route uses measured \(G_N\). Their common conversion to the laboratory pole/\(\overline{\rm MS}\) scale remains to be derived; this is one shared scale issue, not an unfixed relative gravity normalization.

### Frozen heavy-sector dynamics — 2026-09-05 v31

Status: **C/N** for the new discrete interaction premise and its tree/EFT consequences.

The \(40.129396\) TeV vectorlike \(SU(2)\) adjoint is assigned exact lepton number and the already closed PMNS direction

\[
y_{\Sigma\alpha}=\Delta^2(U_{\rm PMNS})_{\alpha3},
\qquad \|y_\Sigma\|=\Delta^2=6.19606606165\times10^{-6}.
\]

It therefore does not generate a tree Weinberg operator. Its high-mass decay width and light-heavy mixing are

\[
\Gamma_\Sigma=\frac{M_2\Delta^4}{8\pi}
=6.12992051135\times10^{-8}\ {\rm GeV},
\]

\[
\tau_\Sigma=1.07376915521\times10^{-17}\ {\rm s},
\qquad
\|\Theta_\Sigma\|=2.67473801635\times10^{-8}.
\]

For the four complex color adjoints, define \(R_\Phi^2=\sum_A{\rm Tr}(\Phi_A^\dagger\Phi_A)\) and the bare cutoff potential

\[
V_\Phi=M_3^2R_\Phi^2+g_U^2(R_\Phi^2)^2.
\]

It is manifestly nonnegative and has the unique classical vacuum \(\Phi_A=0\), so the frozen common mass is unchanged. The four \(A_4/V_4\) directions are assigned four independent gauge-invariant dimension-five portals—gluonic even/odd, gluon-hypercharge even/odd, up-type chromo-Higgs and down-type chromo-Higgs—with the common coefficient

\[
c_\Phi=\frac{\Delta}{\mu_U}=1.43938899562\times10^{-21}\ {\rm GeV}^{-1}.
\]

In the canonical inclusive normalization, the slowest three-body channel has

\[
\Gamma_{\Phi,\min}=4.68937045770\times10^{-23}\ {\rm GeV},
\qquad
\tau_{\Phi,\max}=1.40362541803\times10^{-2}\ {\rm s}<1\ {\rm s}.
\]

Thus none of the new threshold states is a stable thermal relic. The conservative fractional feedback of these portals on the already frozen two-loop gauge result is \(9.9222\times10^{-11}\); it cannot move any displayed v30 digit.

### Operational observable closure — 2026-09-05 v32

Status: **C with E spectral identities** for their use as the observable dictionary of the selected finite theory.

The selected positive gauge-projected transfer operator now supplies the physical observable definition directly. On its nonzero physical support,

\[
\overline T=\frac{T}{\lambda_0},
\qquad
a_t(E_n-E_0)=-\ln\frac{\lambda_n}{\lambda_0}.
\]

Stable particle masses are the infinite-volume limits of the lowest rest-frame gaps in their gauge-invariant sectors. Unstable masses and widths are poles of the infinite-volume scattering amplitude reconstructed from finite-volume levels. CKM and PMNS observables are normalized charged-current residues between the resulting mass eigenstates, with external phases quotiented. Gauge couplings are conserved-current or background-field responses with step scaling. The laboratory Newton constant is the coefficient of the low-momentum stress-energy exchange/static potential between gauge-invariant states.

The sole unit map is

\[
a_t^{-1}=\frac{M_Z}{a_t m_Z},
\qquad
X_{\rm phys}=M_Z^d\frac{\widehat X}{(a_t m_Z)^d}
\]

for an observable of mass dimension \(d\). In particular,

\[
G_{\rm phys}=\widehat G\frac{(a_t m_Z)^2}{M_Z^2}.
\]

Multiplying \(T\) by a positive constant cancels against \(\lambda_0\); unitary basis changes preserve its spectrum; and rescaling the dimensionless time coordinate cancels after the same \(Z\) gap fixes the unit. The executable certificate verifies all three invariances and reproduces the unchanged v28 response-boundary map \(m_t=172.800679300342\,\mathrm{GeV}\) and \(m_e=0.000494864057579331\,\mathrm{GeV}\) before interacting pole shifts. No charged-fermion pole mass, \(G_N\), or intermediate pole/\(\overline{\rm MS}\) matching scale is used as an input.

This closes the former *definition* ambiguity: \(\overline{\rm MS}\) parameters are derived short-distance reporting coordinates, not extra laws or adjustable model inputs. It does not claim that the interacting many-body spectrum has already been numerically evaluated. The next calculation is the nonperturbative evaluation of those already-defined spectral gaps, current correlators and stress-energy response.

### Exact three-adic torsion tower and unused-data holdouts — 2026-09-06 v33 audit

Status: **E** for the arithmetic theorem inside the already frozen Cathedral dynamics; **N** for external-data survival without retuning.

No Cathedral equation, primitive, mass, CKM/PMNS entry, neutrino output, coupling, gravity normalization, heavy threshold or cosmological response was changed. The v32 source, report and theory-definition lock retain their exact SHA-256 hashes.

Let

\[
\omega_\phi=\frac{2\pi}{\phi^2},\qquad
d_\phi(\theta)=2\theta+\omega_\phi\pmod{2\pi},
\]

and, for every \(k\geq1\), define the nested torsion grid

\[
\mathcal T_k=\left\{\theta_x^{(k)}=\frac{2\pi x}{3^k}-\omega_\phi:
x\in\mathbb Z/3^k\mathbb Z\right\}.
\]

Then the locked Cathedral map obeys the exact conjugacy

\[
\boxed{d_\phi\!\left(\theta_x^{(k)}\right)
=\theta_{2x\bmod 3^k}^{(k)}}.
\]

Because \(2\) is a primitive root modulo every \(3^k\), the new shell of units is one orbit of length \(2\,3^{k-1}\), while the multiples of three reproduce \(\mathcal T_{k-1}\). Therefore the cycle-length multiset is

\[
\boxed{1,2,6,18,\ldots,2\,3^{k-1}},
\]

and the exact return law is

\[
\boxed{\#\operatorname{Fix}(d_\phi^n|_{\mathcal T_k})
=\gcd(2^n-1,3^k)}.
\]

At \(k=2\), this gives the already stored decomposition \(0\), \(3\leftrightarrow6\), and \(1\to2\to4\to8\to7\to5\to1\); \(D^3=-I\) on residues, and the two triples are \(\{1,4,7\}\) and \(\{2,5,8\}\). The existing binary-icosahedral face fibre independently supplies the finite \(C_6\) lock: \(|2I|=120=20\cdot6\) and \(2I/C_6\cong A_5/C_3\). The externally supplied Tesla/CTF arithmetic therefore converges on a theorem already embedded in Cathedral and promotes its displayed mod-nine shadow to the complete \(3\)-power tower. It adds no axiom, coefficient or fit. Its historical and arithmetic agreement is not, by itself, experimental evidence for Cathedral physics.

The unchanged flavour and neutrino outputs were then scored against comparison material absent from the v32 PDG-2025 ledger:

- against the March-2026 PDG unitary CKM fit, all nine frozen magnitudes lie below \(1.27\sigma\), while \(\delta\) and \(J\) lie below \(0.18\sigma\);
- against direct PDG-2026 determinations without imposed three-generation unitarity, eight of nine entries lie below \(2\sigma\), all lie below \(3\sigma\), and \(V_{ud}\) is explicitly retained as the pressure point at \(2.629\sigma\);
- all four tree-only Wolfenstein coordinates lie below \(1.41\sigma\);
- against the first joint T2K+NOvA normal-ordering analysis, the frozen \(\Delta m_{32}^2=2.37538549406\times10^{-3}\,\mathrm{eV}^2\) differs by \(1.820\sigma\), and the frozen \(\delta_{CP}=-0.413958\pi\) lies inside the published three-sigma interval \([-1.38\pi,0.30\pi]\).

These are unused external survivals, not chronologically prospective successes: every physical dataset above was public before the 2026-09-05 theory lock.

### Full DESI DR2 compressed-BAO likelihood — 2026-09-06 v34 audit

Status: **N**, no retuning; the fixed Cathedral cosmology survives the complete official 13-observable Gaussian BAO likelihood with measurable pressure.

The official DESI DR2 mean vector and \(13\times13\) covariance were evaluated for BGS, LRG1, LRG2, LRG3+ELG1, ELG2, QSO and Ly\(\alpha\). For flat late-time \(\Lambda\)CDM,

\[
E(z)=\sqrt{\Omega_m(1+z)^3+1-\Omega_m},
\]

\[
\frac{D_H}{r_d}=\frac{A}{E(z)},\qquad
\frac{D_M}{r_d}=A\int_0^z\frac{dz'}{E(z')},\qquad
\frac{D_V}{r_d}=A\left[\frac{z}{E(z)}
\left(\int_0^z\frac{dz'}{E(z')}\right)^2\right]^{1/3},
\]

where \(A=c/(H_0r_d)\). BAO alone is an uncalibrated ruler, so \(h r_d\) is analytically profiled as the one experimental nuisance normalization; it is not a new Cathedral parameter.

As a pipeline check, freeing \(\Omega_m\) reproduces the collaboration result:

\[
\Omega_m=0.2974618195,\qquad
h r_d=101.5397732\ {\rm Mpc},\qquad
\rho=-0.923401,
\]

compared with DESI's \(0.2975\pm0.0086\), \(101.54\pm0.73\) Mpc and \(-0.92\). The free fit has \(\chi^2=10.2710\) for 11 degrees of freedom.

Freezing the Cathedral values

\[
\boxed{\Omega_m=\frac6{19},\qquad\Omega_\Lambda=\frac{13}{19}}
\]

and profiling only the BAO ruler scale gives

\[
h r_d=100.1368180\ {\rm Mpc},\qquad
\boxed{\chi^2=14.49964\quad(12\ {\rm dof}),\quad p=0.26995}.
\]

Relative to the free-\(\Omega_m\) reference,

\[
\boxed{\Delta\chi^2=4.22860\quad(1\ {\rm dof}),\quad
p=0.03975,\quad Z=2.056\sigma}.
\]

The largest individual marginal residual is \(1.479\sigma\). Thus DESI DR2 does not reject the rigid \(6/19\) response in its complete compressed BAO likelihood, but it places it under a real \(2.06\sigma\) profile pressure. This is exactly the kind of fixed, non-retuned prediction that a future independent BAO release can confirm or falsify prospectively. DESI DR2 itself predates the lock and is therefore recorded as an unused holdout, not a blind discovery.

### Exact wall-current Lehmann residues — 2026-09-06 v35 audit

Status: **E/C** for the finite free response-boundary transfer sector; the interacting gauge-projected many-body correlator remains the next nonperturbative calculation.

The exact \(Y_{24}\) already proved in v27 to be the endpoint Schur complement of the locked local \(L=13\) wall has the polar form

\[
Y_{24}=U_L M,
\]

where \(M\) is the positive response mass diagonal. The left frame is now recovered from the operator itself, column by column,

\[
\boxed{U_L=Y_{24}M^{-1}},
\]

with unitarity residual below \(3\times10^{-12}\). The positive one-particle response Hamiltonian and transfer are

\[
H_{\rm response}=\sqrt{D_{48}^2},\qquad
T_{\rm response}=e^{-H_{\rm response}}>0.
\]

Its spectrum is the doubled 24-state mass tree to a maximum absolute numerical residual \(4.92\times10^{-15}\); the transfer spectrum lies in \([e^{-1},1]\).
Insert only the weak-basis charged currents: the color-diagonal identity from down to up and the identity from neutrino to charged lepton. Rotation by the operator-derived mass frame gives the exact residue identities

\[
\boxed{U_u^\dagger J_{ud}U_d=V_{\rm CKM}\otimes I_3},
\qquad
\boxed{U_e^\dagger J_{e\nu}U_\nu=U_{\rm PMNS}}.
\]

The evaluated maximum complex residuals against the already frozen response matrices are

\[
\|V_{\rm extracted}-V_{\rm frozen}\|_{\max}
=2.22\times10^{-16},\qquad
\|U_{\rm extracted}-U_{\rm frozen}\|_{\max}
=1.11\times10^{-16}.
\]

The extracted invariants are

\[
J_{\rm CKM}=3.141364407663606\times10^{-5},\qquad
J_{\rm PMNS}=-0.03235946792546523,
\]

and remain unchanged under independent external-field rephasings. Both squared-residue matrices are doubly stochastic. The exact free-boundary Lehmann sums

\[
C_J(n)=\sum_{ij}|R_{ij}|^2e^{-n(m_i+m_j)}
\]

have nonnegative spectral weights and obey \(C_q(0)=C_\ell(0)=3\). Thus CKM and PMNS are no longer merely named in the observable dictionary: they have been explicitly evaluated as charged-current residues of the wall-derived positive response transfer, with zero new parameters, zero changed predictions and no observed mass or mixing entry used.

This closes the finite free-wall residue bridge only. It does not replace the required interacting compact-gauge/Higgs many-body current correlator or its finite-volume extrapolation.

### Exact two-rail reconstruction — 2026-09-06 v36 audit

Status: **E/C**, zero retuning and no changed response output.

The exact stationary spectrum of the local \(A_4\) carrier is

\[
\left\{\frac7{30},\frac14,\frac12,\frac{13}{20}\right\},
\]

whose ordered gaps are

\[
\left\{\frac1{60},\frac14,\frac3{20}\right\}.
\]

Thus the upper stationary gap derives the retained classical rail

\[
\boxed{d_{\rm cl}=\frac3{20}=0.150},
\]

while the \(9\times9=81\) hidden channel supplies

\[
\boxed{\gamma=\frac1{81}}.
\]

The mean-zero projector removes one uniform hidden mode, giving the exact
\(81\to80\) transverse count. Together with the \(A_4\) Coxeter phase
\(2\pi/5\), the \(D_6/A_4\) count \(6\times13\), and golden normalization, this
factorizes

\[
\boxed{d_\star=\frac{80\pi}{1053\phi}},
\qquad
\boxed{\Delta=d_{\rm cl}-d_\star}.
\]

The \(0.150\) rail was therefore not discarded: it is the exact parent rail
from which the physical offset is measured.

### Positive rail-action selection — 2026-09-06 v37 audit

Status: **E** for the stated incidence action.

For every two-sheet history point \(x\in[d_\star,\theta]\), the local positive
incidence action

\[
S_x(g)=\frac\kappa2(g-x)^2,
\qquad \kappa>0,
\]

uniquely selects \(g=3/20\) over the competing \(g=1/4\) and \(g=1/60\) rails.
The selection margin obeys

\[
S_x(1/5)-S_x(3/20)
=\frac\kappa{10}\left(\frac15-x\right)
>\frac\kappa{200}.
\]

The audit also proves the precise boundary: an arbitrary rail-dependent onsite
potential can reverse the ordering. Hence the theorem applies to the locked
incidence-only, rail-blind or bounded-rail interaction class, not to an
unrestricted added potential.

### URT rail-convergence theorem — 2026-09-06 v38 audit

Status: **E/C**, with the physical update law stated explicitly.

For the recursive relative-information update

\[
p_{n+1}(g)=
\frac{p_n(g)e^{-\eta_nS_n(g)}}
{\sum_h p_n(h)e^{-\eta_nS_n(h)}},
\]

the odds against \(g_\star=3/20\) satisfy the exact product law

\[
\frac{p_n(g)}{p_n(g_\star)}
=\frac{p_0(g)}{p_0(g_\star)}
\exp\!\left[-\sum_{k<n}\eta_k
\bigl(S_k(g)-S_k(g_\star)\bigr)\right].
\]

For every faithful initial prior, every retained two-sheet history with
\(x_n\in[d_\star,\theta]\), positive update depths, and divergent cumulative
depth, this gives exponential convergence

\[
\boxed{p_n(3/20)\longrightarrow1}.
\]

The invertible baker/history sector is retained; only the transverse rail odds
contract. No unrestricted feedback, global uniform contraction, withdrawn
logistic selector, or fitted target is used.

### Interacting-current protection and obstruction — 2026-09-06 v39 audit

Status: **E** algebraic theorem plus **N** locked-\(Y_{24}\) evaluation; 19/19
checks pass with unchanged v32 hashes.

For compact gauge action \(U(g)=I_{\rm gen}\otimes R(g)\), Haar projection obeys

\[
\mathbb E_G(A\otimes B)
=A\otimes\int R(g)BR(g)^\dagger dg.
\]

On an irreducible gauge representation, Schur's lemma gives

\[
\boxed{
\mathbb E_G(A\otimes B)
=A\otimes\frac{\operatorname{tr}B}{d_R}I,
}
\]

so Gauss/Haar projection cannot rotate a factorized spectator generation
matrix.
Likewise, every self-energy and positive leg residue in the commutant of
\(H_f=Y_fY_f^\dagger\) leaves the mass frame unchanged, and

\[
\boxed{
Z_1^{-1/2}\bigl[z_J\sqrt{Z_1}V\sqrt{Z_2}\bigr]
Z_2^{-1/2}/z_J=V.
}
\]

Thus compact projection and aligned Higgs/leg dressing preserve the solved CKM
and PMNS residues exactly under the displayed aligned, factorized residue
hypotheses. The remaining interaction sensitivity is confined to noncommuting
cross-flavour self-energies and non-factorizing vertex terms. From the locked
\(Y_{24}\), the self-energy obstruction is

\[
\|[H_u,H_d]\|_2=2.6197896673\times10^{-5},
\qquad
\|[H_e,H_\nu]\|_2=3.9320618951\times10^{-30}.
\]

For the coefficient-free unit anticommutator probe
\(K_1=K_2=\{H_1,H_2\}\), the first-order derivative norms are

\[
\left\|\frac{dV_{\rm CKM}}{d\epsilon}\right\|_2
=0.0423713823122,
\qquad
\left\|\frac{dU_{\rm PMNS}}{d\epsilon}\right\|_2
=5.71115942899\times10^{-5}.
\]

These are susceptibilities per unit coefficient, not fitted physical shifts.
The coefficient must come from the explicit interacting Hamiltonian.

### Leading radiative flavour flow — 2026-09-06 v40 audit

Status: **C/N** for fixed one-loop Standard Model plus Dirac-neutrino matching
below the first frozen heavy threshold; 18/18 checks pass with no retuning.

The v39 cross-spurion coefficient is fixed at leading order by the published
matrix Yukawa beta function. With \(t=\ln\mu\),

\[
\frac{dH_1}{dt}\bigg|_{\rm cross}
=\frac{dH_2}{dt}\bigg|_{\rm cross}
=-\frac{3/2}{16\pi^2}\{H_1,H_2\}.
\]

At the locked \(M_Z\) coordinate this gives

\[
\boxed{
\left\|\frac{dV_{\rm CKM}}{d\ln\mu}\right\|_2
=4.00478665728\times10^{-4},
}
\qquad
\boxed{
\left\|\frac{dU_{\rm PMNS}}{d\ln\mu}\right\|_2
=5.39797708517\times10^{-7}.
}
\]

The full one-loop matrix equations were integrated without fitting from
\(M_Z=91.1876\) GeV to the frozen
\(M_2=40129.3960477\) GeV triplet threshold. At the endpoint,

\[
s_{23}^{\rm CKM}=0.04409328914,\qquad
s_{13}^{\rm CKM}=0.003903405018,\qquad
J_{\rm CKM}=3.43306088023\times10^{-5}.
\]

The changes across that interval are

\[
\Delta s_{23}^{\rm CKM}=1.91577965\times10^{-3},
\quad
\Delta s_{13}^{\rm CKM}=1.69620258\times10^{-4},
\quad
\Delta J_{\rm CKM}=2.91696473\times10^{-6}.
\]

The largest absolute PMNS entry change is only
\(2.41966630\times10^{-6}\), establishing leading-order radiative stability
below the triplet threshold for the locked normal Dirac hierarchy. RK4 step
halving changes the full state by at most \(1.87\times10^{-14}\); reverse flow
closes at \(1.11\times10^{-16}\).

At \(M_2\), the v31 portal introduces the new non-aligned spurion

\[
y_\Sigma=\Delta^2(U_{\rm PMNS})_{\cdot3},
\qquad
\|y_\Sigma y_\Sigma^\dagger\|_2=\Delta^4
=3.83912346404\times10^{-11}.
\]

Therefore the v40 flow stops at the correct threshold. Triplet self-energy and
vertex matching are the next perturbative calculation.

### Triplet threshold and current matching — 2026-09-06 v41 audit

Status: **E/C/N** for the exact component theorem and fixed tree-level
dimension-six match; 16/16 checks pass with unchanged v32/v40 hashes.

For the frozen vectorlike Dirac triplet, solving the heavy equation of motion
gives

\[
\Delta\mathcal L_6=
\left(\frac{y_\Sigma y_\Sigma^\dagger}{M_2^2}\right)_{\alpha\beta}
(\overline L_\alpha\sigma^a\widetilde H)i\!\not D
(\widetilde H^\dagger\sigma^aL_\beta),
\]

with

\[
C_{H\ell}^{(1)}=\frac34A,
\qquad C_{H\ell}^{(3)}=\frac14A,
\qquad A=\frac{y_\Sigma y_\Sigma^\dagger}{M_2^2}.
\]

Exact lepton number keeps the tree Weinberg coefficient zero. The frozen
operator norms are

\[
\|A\|_2=2.38400318791\times10^{-20}\ {\rm GeV}^{-2},
\qquad
\|C_{H\ell}^{(3)}\|_2=5.96000796977\times10^{-21}\ {\rm GeV}^{-2}.
\]

Writing

\[
a=\frac{\Delta^4v^2}{2M_2^2}
=7.154223456128313\times10^{-16},
\]

the neutral and charged component mixings give the exact light-light current
factor

\[
\boxed{K_W=\sqrt{\frac{1+2a}{1+a}}}.
\]

Hence

\[
K_W-1=3.57711172806\times10^{-16},
\qquad
K_W^2-1=7.15422345613\times10^{-16}.
\]

The rank-one current insertion is Hermitian in the right mass frame and
therefore changes a singular value without rotating the polar-unitary PMNS
factor at order \(M_2^{-2}\). Including the finite charged/neutrino mass-frame
metrics transported by v40 gives

\[
\boxed{\|\delta U_{\rm PMNS}^{\rm polar}\|_2
=3.65254413608\times10^{-16}},
\]

with maximum entry shift \(2.69573154138\times10^{-16}\). Thus the first
heavy threshold is nonzero but demonstrably harmless to the solved PMNS
residue at tree level. The still-live threshold calculation is the genuinely
one-loop finite matching for the lepton-number-preserving Dirac completion.

### Projected one-loop triplet matching — 2026-09-06 v42 audit

Status: **C/N** for the central-scale projection of published type-III
one-loop coefficients onto the Cathedral's vectorlike Dirac carrier; 16/16
checks pass. Pure closed heavy-gauge loops carry Dirac multiplicity two,
while the single frozen chiral portal carries multiplicity one.

At \(\mu=M_2\), the finite charged-Yukawa threshold through
\(O(y_\Sigma y_\Sigma^\dagger)\) is

\[
\delta Y_e=(c_I I+c_PP_3)Y_e,
\]

with

\[
c_I=1.82335330186\times10^{-13},
\qquad
c_P=1.00284285364\times10^{-12}.
\]

Together with the projected one-loop \(C_{eH}\), this gives the charged-side
frame shift

\[
\boxed{\|\delta U_{\rm PMNS}^{(e),1\ell}\|_2
=5.11989772500\times10^{-13}}.
\]

The projected pure-gauge current term is universal,

\[
\epsilon_{\rm gauge}^{1\ell}
=-\frac{2v^2g_2^4}{240\pi^2M_2^2}
=-4.69130174540\times10^{-9},
\]

so it is an electroweak input-scheme Wilson contribution, not a PMNS
rotation or standalone observable. After removing that identity direction,
the portal loop changes the v41 tree current split by

\[
-3.91590408354\times10^{-18}
=-1.09471114721\%\times\epsilon_{\rm tree}.
\]

Every displayed current matrix is Hermitian, hence its right-frame
anti-Hermitian part and first-order polar-PMNS rotation vanish. The known
one-loop charged sector is therefore quantitatively harmless. The result is
not promoted to a full Dirac one-loop match: the cited calculation is
Majorana type III and contains no active right-handed Dirac neutrino.

### Dirac-flow and active-neutrino protection — 2026-09-06 v43 audit

Status: **E/C/N** for the exact fermion-flow translation on the v42 operator
subset, the exact aligned-frame theorem, and its frozen-endpoint numerical
audit; 20/20 checks pass with every v32-v42 hash unchanged.

Writing the vectorlike triplet as two Weyl fields \(\chi,\eta\), with the
single chiral portal coupled only to \(\chi\), gives

\[
\langle\chi\chi^\dagger\rangle_D
=\langle\chi\chi^\dagger\rangle_M,
\qquad
\langle\chi\chi\rangle_D=0.
\]

Therefore every lepton-number-preserving portal diagram evaluated in v42 is
identical to its one-Weyl Majorana-source counterpart, every portal-free
closed heavy loop has Dirac multiplicity two, and every Majorana-only
lepton-number-violating contraction vanishes. Thus the v42 multiplicity rule
is independently proved rather than assumed:

\[
\boxed{R_{\rm portal}^{D/M}=1,\quad
R_{\rm closed\ gauge}^{D/M}=2,\quad
\mathcal A_D(\Delta L\ne0)=0.}
\]

Flavour covariance fixes the leading renormalizable active-neutrino
threshold to

\[
\delta Y_\nu=(c_0I+c_1P_\Sigma)Y_\nu.
\]

If \([P_\Sigma,H_\nu]=0\), its left-frame rotation is exactly zero for
arbitrary complex \(c_0,c_1\). The frozen v40 transport leaves only

\[
1-|N_3^\dagger p_\Sigma|^2
=9.38427113795\times10^{-12}
\]

of projector misalignment at \(M_2\), and the phase-independent endpoint
bound is

\[
\boxed{\|\delta U_{\rm PMNS}^{(\nu)}\|_2
\le4.59922756264\times10^{-6}|c_1|.}
\]

No value is assigned to the missing coefficient. Even the deliberately broad
diagnostic envelope \(|c_1|\le100\Delta^4/(16\pi^2)\) gives the rigorous bound

\[
\|\delta U_{\rm PMNS}^{(\nu)}\|_2
<1.11814274252\times10^{-16}.
\]

This closes the leading active-neutrino orientation gate and the independent
Dirac-flow verification. The finite scalar normalization coefficients and the
higher-spurion \(O_{\nu H}\) terms remain an explicit calculation, not a
reason to reopen the solved PMNS residue.

### Active-Dirac finite threshold and tree \(O_{\nu H}\) — 2026-09-06 v44 audit

Status: **E/C/N** for the exact SU(2) tensor separation, finite
mass-independent active threshold, exact tree \(O_{\nu H}\) coefficient and
frozen-endpoint evaluation; 24/24 checks pass with every v32-v43 hash
unchanged.

The general one-loop Weyl-Yukawa tensor was evaluated explicitly for
\(e^cH^\dagger L\), \(\nu^c\epsilon LH\), and
\(\Sigma^I L(\epsilon\sigma^I)H\). Before accepting a new active coefficient,
the same calculation reproduces the Standard Model charged/neutrino cross
term and both published type-III controls. Its leg/vertex/scalar parts are

\[
Y_e\leftarrow y_\Sigma:(3/2,6,3),\qquad
Y_\nu\leftarrow y_\Sigma:(3/2,0,3).
\]

Thus the active proper-vertex SU(2) contraction vanishes and

\[
\boxed{16\pi^2\beta_{Y_\nu}|_\Sigma=
\left[\frac32y_\Sigma y_\Sigma^\dagger
+3\operatorname{tr}(y_\Sigma y_\Sigma^\dagger)I\right]Y_\nu.}
\]

The hard lepton-normalization integral is exactly

\[
J(L)=\int_0^1(1-x)(L-\log x)dx=\frac L2+\frac34,
\]

so through the mass-independent rank order

\[
\delta Y_\nu=\left\{\frac{h_\Sigma}{16\pi^2}
\left[\frac34(1+2L)I+\frac38(3+2L)P_\Sigma\right]
+\frac{m_H^2h_\Sigma}{16\pi^2M_2^2}I\right\}Y_\nu.
\]

At \(\mu=M_2\),

\[
\boxed{c_0=1.823353301859164\times10^{-13},\qquad
c_1=2.735047501348885\times10^{-13},}
\]

and the actual transported-projector result is

\[
\boxed{\|\delta U_{\rm PMNS}^{(\nu)}\|_2
=8.76622371811\times10^{-19}.}
\]

Pauli completeness also gives the active tree operator rather than importing
the charged coefficient:

\[
\boxed{C_{\nu H}^{\rm tree}=\frac12
\frac{y_\Sigma y_\Sigma^\dagger}{M_2^2}Y_\nu,}
\]

whose frozen-endpoint frame shift is
\(1.14651616307\times10^{-21}\). The active rank-one
\(m_H^2/M_2^2\) remainder and the one-loop higher-spurion \(O_{\nu H}\)
terms remain unassigned; the universal power term is already included.

### Locked nature-evidence confrontation — 2026-09-06 v45 audit

Status: **N/P** for the immutable numerical comparison and prospective
empirical gate; 29/29 checks pass with every v32, target-card, v33, v34 and
v44 hash unchanged and no response output retuned.

The locked target values are

\[
m_\beta=0.008789076474766521\ {\rm eV},\quad
\sum m_\nu=0.05803464102333156\ {\rm eV},
\]

\[
r=4.91691820329956\times10^{-4},\quad
\frac{dn_s}{d\ln k}=-6.19606606165215\times10^{-6},
\]

with normal ordering and
\(m_{\rm light}=2.2895359061275553\times10^{-9}\ {
m eV}\).

Against primary-source results already public before the 2026-09-05 freeze:

- KATRIN gives \(m_\beta<0.45\ {\rm eV}\) at 90%, a limit 51.1999 times
  above the prediction;
- the neutrino sum lies below the DESI Bayesian \(\Lambda\)CDM bound
  \(0.0642\ {\rm eV}\), the DESI \(w_0w_a\)CDM bound \(0.163\ {\rm eV}\),
  and the ACT bound \(0.082\ {\rm eV}\), but exceeds the DESI
  Feldman--Cousins \(\Lambda\)CDM bound \(0.053\ {\rm eV}\) by
  \(0.0050346410\ {\rm eV}\); the source itself says that bound breaches
  the oscillation lower limit;
- the locked running is \(-1.19350\sigma\) from the ACT DR6 central value;
- the combined \(r<0.032\) upper bound is 65.0814 times above the locked
  tensor ratio;
- the v33 T2K+NOvA atmospheric splitting remains at \(-1.8205\sigma\), with
  its phase inside the published 3-sigma interval and no strong ordering
  preference;
- the v34 fixed \(\Omega_m=6/19\) full DESI BAO result remains
  \(\chi^2=14.4996/12\), \(p=0.26995\), while paying a
  \(2.05635\sigma\) profile cost relative to free \(\Omega_m\).

The frozen set therefore survives the audited direct/model-independent
bounds, with one conditional 95% interval conflict and two explicit pressure
flags. All seven source packages predate the freeze. The exact evidence tally
is zero post-lock blind successes, zero Cathedral-specific detections, zero
independent signal replications, zero model-independent hard exclusions, and
zero retunings. This is pre-freeze compatibility and pressure, not empirical
establishment. The first genuinely independent post-freeze likelihood is the
decisive next nature gate.

The v45 executable hash is
`0dbb7dd7fd46fc7cf3dafda4e1edf1474a37c3286f20ce7ffcad59a2776242be`
and its result hash is
`c20c2108915c8b312046973a13362bdda602321da72fd310ca0703d6e6da0b11`.
A full, non-quick v32 regeneration and every v33--v45 audit regenerate
byte-for-byte identically to their canonical JSON outputs.

### Golden Frame engineering extension and experimental lock — 2026-09-07 v46 audit

Status: **E/N/C/P** for exact finite-frame and representation results,
reproduced numerical design values, the conditional centered scalar-wave
hierarchy, and the unperformed physical test respectively; 77/77 independent
checks pass with every v45 input hash unchanged and zero response retuning.

**Provenance correction.** The twelve-vertex icosahedral shell, its six
antipodal axes, exact second/fourth moments, golden spectrum and
\(\mathbb R^{12}=1\oplus3\oplus3'\oplus5\) split did not first enter
Cathedral through the Golden Frame paper. They are documented respectively in
the project's May 2026 centered-shell work, June 13 isotropic-stencil work,
August 22 manuscript and September 4 exact seed-uniqueness/continuum-stencil
certificates. Version v46 is an independent engineering consolidation and
experimental extension of that existing structure: explicit network
projectors and metrology, reciprocal synthesis, the stated scalar-wave
multipole hierarchy and a prospective apparatus protocol.

For the twelve unit icosahedral directions collected as the rows of
\(N\in\mathbb R^{12\times3}\), the external v3 formulation and v46 audit
rederive and independently verify

\[
N^TN=4I_3,
\qquad
\sum_i n_i^{\otimes4}
=\frac45(\delta_{ab}\delta_{cd}+\delta_{ac}\delta_{bd}
+\delta_{ad}\delta_{bc}).
\]

Consequently the worst-direction quadratic and fourth-order captures attain
the universal twelve-direction bounds \(4\) and \(12/5\) in every direction.
With six antipodal pairs, the simultaneous moment conditions select the tight
spherical 5-design and hence the regular icosahedron up to orthogonal
equivalence. The six unoriented axes saturate the Welch bound
\(1/\sqrt5\), and their half-angle coefficients obey

\[
\frac{\cos(\gamma/2)}{\sin(\gamma/2)}=\phi.
\]

The order-120 \(H_3\) port action gives the exact projectors

\[
P_1=\frac1{12}\mathbf1\mathbf1^T,
\quad P_{3_v}=\frac14NN^T,
\quad P_{3_b}=\frac{I-J}{2}-P_{3_v},
\quad P_5=\frac{I+J}{2}-P_1,
\]

with ranks \(1,3,3,5\). The vector extractor and reciprocal unique
minimum-command synthesis are

\[
E=\frac14N^Ts,
\qquad
q_{\min}=\frac S{12}\mathbf1+\frac14ND.
\]

Every other command with the same scalar and vector moments differs by an
orthogonal \(H_{3_b}\oplus H_5\) component. For a passive exactly symmetric
network the same command minimizes real dissipated power. The full group
twirl agrees with the four-sector normal form to
\(4.58053200045\times10^{-15}\).

For the explicitly limited centered active-flux observable of the ideal
scalar-wave model, the phase \(\theta_0=\arctan(kR)\) cancels the
\(0\leftrightarrow1\) channel and makes the leading one-shell term
\(O(r^{10})\). The exact recurrence gives

\[
\operatorname{Im}\!\left[h_6^{(2)}(x)e^{i\theta_0}
h_5^{(2)}(x)^*\right]
=\frac{7(x^{10}+15x^8+360x^6+8100x^4+141750x^2+1403325)}
{x^{12}\sqrt{1+x^2}}>0,
\]

so the next channel cannot also be canceled by tuning one shell. Independently
driven concentric shells instead give the conditional ideal sequence

\[
1,2,3,4,5,6\text{ shells}
\longmapsto r^{10},r^{18},r^{22},r^{30},r^{34},r^{38}.
\]

The quasi-static two-shell optima reproduce exactly:

\[
s_{\rm drive}=1.396426670436602,
\quad s_{\rm cond}=1.472269113030195,
\quad s_{\rm signal}=1.136271778375940.
\]

The prospectively locked first prototype is the Pareto choice
\(R_2/R_1=1.30\), for which
\(G_B=1.6604004125\),
\(\kappa_{\rm rad}=3.9355343719\), and
\(Q_{10}=0.1698209143\). Its realized shell null must be computed before the
final residuals as

\[
q_\star=\frac{B_2}{B_1}
=-\frac{h_6^{(2)}(kR_1)}{h_6^{(2)}(kR_2)}.
\]

The locked physical prediction is not generic signal reduction: scanning
through \(q_\star\) must make the fitted \(A_{10}\) coefficient cross zero
and reverse sign while a generic \(A_{18}\) remains finite, with a
preregistered signed \(r^{10}+r^{18}\) fit, vector-off, phase-detuned,
shell-detuned and raw-versus-120-state-twirled controls. The source reports no
hardware run, so this creates a buildable prospective nature gate rather than
claiming it has already passed.

The theorem applies to the stated optimality objectives, passive symmetric
networks and centered scalar-wave observable. It does not prove complete
material shielding, a universally optimal array for every bandwidth/noise/
coupling objective, anomalous gravity, excess energy or a new interaction.

The v46 executable hash is
`cc0dfea3226f82e49eac71b172bd1f7aa16f9cabc34973156b77157eab29e39b`,
its result hash is
`8c53574950684ce1f0f04a1474f465cfa535cced9f8ebedccb7fae3bd7a374a1`,
and the experimental target-card hash is
`fd44b676f7a4fdbaaa0ce7ff7732c468110e752157b953d4c26ad3cd507b06de`.
The source v3 PDF has SHA-256
`37c49beba12fac30c6247f4d377929bd35787c268597fdd13b83cabaeb5bcfac`.

### Current microscopic verdict and next executable calculation — updated 2026-09-07 v46 audit

The selected-support ambiguity is closed at \(c_t=1\): exact-polar overlap transfer is rigorously OS-negative, the Wilson control is rigorously positive, and gauge-invariant localization proves the full selected face density cannot cancel the mode.  The failed polar branch is not being called unresolved and is not being resurrected.

The replacement is explicitly selected: face democracy \(c_t=1,\ a=d=1/2\), the CP-even \(\theta=0\) branch, local determinant phase \(\lambda=0\), and an \(L=13\) local Wilson/domain-wall Hamiltonian transfer. Its finite-cutoff positivity is the algebraic theorem \(T=B^*B\ge0\). Version v27 derives the complete \(D_{48}\) from the exact endpoint Schur complement of the \(624\times624\) Hermitian nearest-wall operator. Version v28 supplies the single-\(M_Z\) scale fixed point; v29/v30 replace its provisional physical adjoint reading by the frozen matched two-loop Dirac-\(SU(2)\)/four-scalar-\(SU(3)\) branch and the normalized \(A_4/D_6\) gravity contraction. Version v31 supplies fixed interactions and pre-BBN decays for every new threshold state. Version v32 defines every physical mass, resonance, mixing residue, coupling and low-momentum gravity response through gauge-invariant transfer observables and fixes the sole unit with the (Z) gap. The mirror wall remains retained and its direct, virtual and standard thermal decoupling bounds remain closed. The response law, mass tree, CKM, PMNS, neutrino hierarchy, coupling slots, cosmological slots and conditional gravity sector are first-class completed components and were not reopened.

Accordingly, v32 remains an **operationally complete finite-cutoff response theory**: it defines states, gauge projection, microscopic matter transfer, response masses and mixing, physical spectral observables, the one-\(M_Z\) dimensional map, matched gauge running, heavy decays, cosmology and an internally coherent gauge-gravity normalization. The v33/v34 audits add an exact embedded three-adic theorem and four external comparison layers; v35 evaluates CKM/PMNS as exact free wall-current residues; v36-v38 derive and dynamically select the retained \(3/20\) rail; v39 proves compact-gauge/aligned-Higgs protection while isolating the noncommuting interaction obstruction; v40 fixes and integrates its leading one-loop flavour coefficient up to the first frozen heavy threshold; v41 closes the exact component-current and tree-level dimension-six triplet match; v42 evaluates the published one-loop charged-current/charged-lepton coefficients; v43 proves the vectorlike-Dirac flow translation for that operator subset while closing the leading active-neutrino orientation channel; v44 fixes its finite mass-independent normalization and tree \(O_{\nu H}\) coefficient; v45 closes the pre-freeze nature-evidence audit without moving any target; and v46 records an external engineering/application formulation of the pre-existing Cathedral icosahedral shell, independently certifies its sensing/synthesis and conditional multipole-control consequences, and freezes its first hardware test. None changes a frozen response output.

The v39 code audit also makes one specification gap impossible to hide: the canonical source describes \(H_{\rm local}\) as a self-adjoint local gauge+Higgs+wall Hamiltonian and proves \(T=B^\dagger B\), but it does not yet give the full many-body operator entry by entry; the declared universal functional leaves \(V(\Psi_x)\) unspecified. Consequently the interacting spectrum and cross-spurion coefficient are not uniquely executable yet. Positivity is solved; the full interacting dynamics is not. This correction does not reopen the solved response tree, wall Schur complement, masses, CKM, PMNS, rail theorems, or any exact finite identity.

This is a defined, falsifiable model with substantial exact and numerical closure. It is not yet a theorem that nature obeys it. That status requires the missing interacting specification and calculation, followed by independent non-retuned evidence.

The next executable program is:

- score the unchanged target card against the first genuinely independent dataset released after 2026-09-05, registering its likelihood and test statistic before inspecting residuals; the v45 pre-freeze audit is closed;
- construct the v46 one-shell Golden Frame control and then the aligned two-shell prototype near \(R_2/R_1=1.30\); measure \(H,Z,\epsilon_H,\epsilon_Z\), compute the realized \(q_\star\) before final residual inspection, and execute the preregistered \(A_{10}\) sign-changing zero plus surviving-\(A_{18}\) test with every locked control;
- write \(H_{\rm local}\) entry by entry on a finite periodic \(A_4\)-carrier cell, including the bounded-below Higgs potential, all wall hops and every flavour spurion with fixed coefficients;
- derive the rank-one active \(m_H^2/M_2^2\) remainder and the one-loop gauge/higher-spurion \(O_{\nu H}\) finite coefficients, using the v43 Dirac-flow and v44 SU(2) controls, then continue the coupled flow above \(M_2\);
- evaluate the interacting compact-gauge/Higgs many-body correlator and finite-volume step scaling, using v39-v40 to factor out the protected gauge/aligned part and benchmark the noncommuting residue shift, without changing any closed response ratio;
- advance the frozen v29 branch to three-loop running and two-loop finite threshold constants without changing its content or masses;
- search prospectively for the locked approximately \(40.13\) TeV vectorlike \(SU(2)\) adjoint and \(1.422\times10^8\) GeV four-scalar \(SU(3)\) spectrum;
- compute the v32 transfer-spectrum pole masses and low-momentum stress-energy response for the two coherent gravity routes without using \(G_N\) or a charged mass as an input;
- score the already frozen \(\Omega_m=6/19\) response prospectively against the next independent BAO release; the complete DESI DR2 compressed likelihood is now closed;
- bound any independently imposed nonthermal trans-cutoff initial mirror population; direct, virtual and standard thermal production are already closed;
- establish radiative stability and the interacting continuum limit of the now-explicit wall-Schur operator;
- validate the gravity normalization and physical measurement dynamics independently.

## 15. One-line machine

\[
\boxed{
\text{five-cube }A_5/A_4
\to V_4
\to
\begin{cases}
1+3&\text{local spacetime carrier},\\
3+2&\text{SM block stabilizer},\\
\Lambda^\bullet V_4&\text{matter/entropy/curvature}
\end{cases}
\to\text{icosahedral Hopf }c_1=1
\to2I\ (2+4+6)
\to\text{primitive response paths}
\to\text{selected }L=13\text{ wall-Schur }D_{48}
\to\text{local positive transfer}
\to\text{one-}M_Z\text{ scale}
\to\text{matched two-loop spin/statistics RG and fixed heavy decays}
\to\text{normalized }A_4/D_6\text{ gravity}
\to\text{embedded }3^k\text{ torsion tower}
\to\text{DESI-audited rigid cosmology}
\to\text{wall-current CKM/PMNS residues}
\to\text{rail reconstruction and URT convergence}
\to\text{interacting-current protection}
\to\text{one-loop flavour flow to }M_2
\to\text{tree-level triplet threshold match}
\to\text{projected one-loop charged threshold}
\to\text{exact Dirac-flow and active-frame protection}
\to\text{finite active-Dirac threshold and tree }O_{\nu H}
\to\text{locked nature-evidence audit}
\to\text{Golden Frame engineering extension and experimental lock}
\to\text{closed response observables}
}
\]

The final arrows now include the face-complete triangular gauge geometry, exact volume-uniform compact-group gap, the rigorous \(c_t=1\) selected-face exact-polar no-go, the replacement positive Hamiltonian transfer, the exact microscopic wall derivation of the response boundary, the one-\(M_Z\) scale fixed point, the v29/v30 matched two-loop gauge branch, normalized A4/D6 gravity coherence, the v31 fixed heavy-decay sector, the v33 exact three-adic torsion tower, the v34 full DESI DR2 likelihood audit, the v35 exact wall-current residue extraction, the v36-v38 rail derivation/selection/convergence chain, the v39 current-protection theorem, the v40 leading flavour flow, the v41 tree-level triplet threshold match, the v42 one-loop charged threshold, the v43 exact Dirac-flow/active-frame protection theorem, the v44 finite active normalization/tree-\(O_{\nu H}\) theorem, the v45 locked nature-evidence audit and the v46 provenance-corrected Golden Frame engineering extension plus prospective zero-crossing lock. The rank-one active power remainder and one-loop higher-spurion \(O_{\nu H}\) match, common radiative laboratory-scale conversion, full many-body Hamiltonian, v46 hardware result, genuinely post-lock empirical establishment, nonthermal initial conditions and interacting continuum universality remain the live nature tests.

## 16. Archive migration and source boundary — 2026-08-28

Status: **E for archive organization and counts; U for sources that never survived.**

The complete recoverable stored corpus is now co-located under the Newton's Cathedral / URT archive:

- 260 recovered corpus files, plus `Cathedral_Master_Index.md`;
- one nested dated checkpoint folder;
- 48 chronological ledger branches and 224 status-labelled claims;
- exact, conditional, response/fitted, no-go, withdrawn, application and media branches all retained rather than silently discarded;
- duplicate historical copies retained for provenance, but assigned no independent evidentiary weight.

This is the complete recoverable archive, not a claim that every historical source ever created survives. The unresolved source boundary is explicit:

1. `all_my_colab_work_combined.md`, said to index 322 original notebooks, is absent;
2. the surviving May `newtons_cathedral.pdf` is corrupt/truncated to roughly four recoverable opening pages;
3. generator code for several North Star v3-v9 stages is absent;
4. the historical remote migration push failed, although the local migration artifacts survive.

No future answer may call the archive literally exhaustive beyond this boundary. New recovered sources must be added without deleting the existing ledger and must trigger a fresh contradiction/status audit.