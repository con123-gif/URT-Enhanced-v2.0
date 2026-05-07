"""
URT — Universal Recursive Tuning
δ★ = (80/81)·π/(13φ) ≈ 0.14751

A unified chaos-physics framework connecting icosahedral geometry to
fundamental constants, critical transitions, and real-world prediction.

Modules
-------
metrics              — Lyapunov exponent, tau_avalanche, D_KY, δ metric
shell_closure        — 13-site icosahedral shell, δ★, compute_all_constants
control              — URT control operator (O(N), κ < 1)
cathedral_v8         — Full Standard Model derivation (Cathedral Framework)
cathedral_v9         — Anchor-free Cathedral: all scales from ρ_Λ alone
rg_flow              — RG running δ(μ), crossover μ_c ≈ 197 GeV
qbls                 — Quantum Bounded Ladder of Scales (δ_rung ≈ 61.32)
logistic_verification — δ★ on stable 6-cycle at r=3.8417002878419497
periodic_table       — Cathedral Madelung: noble gas numbers from δ★
holography           — AdS/CFT: G_N=δ★², RT entropy, BH thermodynamics
consciousness        — Kuramoto on icosahedral graph, IIT Φ, EEG bands
prime_spectral        — Icosahedral Laplacian ↔ Riemann zeros, Ramanujan
metamaterials        — Photonic/phononic crystal design, drug binding sites
swarm_intelligence   — 13-agent icosahedral swarm, consensus, satellite LEO
gravitational_waves  — IKT-based GW detection, QNM ringdown, Cathedral SNR
"""

from .metrics import (
    lyapunov_rosenstein,
    tau_avalanche,
    D_KY_from_l1_proxy,
    DKY_from_delta_monotone,
    delta_metric,
)
from .shell_closure import (
    DELTA_STAR,
    C_MASS,
    compute_all_constants,
    urt_evolve,
)
from .control import urt_step, urt_operator, is_critical
from .cathedral_v8 import Cathedral
from .cathedral_v9 import Cathedral as CathedralV9
from .rg_flow import rg_flow, crossover_scale, running_alpha_inv, running_alpha_s
from .qbls import (
    rung_spacing,
    scale_quantity,
    rung_of,
    physical_ladder,
    simulate_meta_universes,
    DELTA_RUNG,
    LAMBDA_S,
)
from .logistic_verification import (
    verify_delta_star_logistic,
    LogisticVerificationResult,
)
from .gravity_deficit import (
    GRAVITATIONAL_DEFICIT_DEG,
    GRAVITATIONAL_DEFICIT_RAD,
    HOLONOMY_VORTEX_DEG,
    schwarzschild_area,
    cathedral_bh_entropy,
    hawking_temperature,
    newton_G_from_deficit,
    deficit_summary,
)
from .arf_closure import (
    ARFFixedPoint,
    ARFPredictions,
    prove_uniqueness,
    scan_D,
    gamma_power_ladder,
)
from .quasicrystal import (
    ikt_forward,
    ikt_inverse,
    ikt_matrix,
    ikt_sector_power,
    phi_scaled_radii,
)
from .casimir_cathedral import (
    casimir_force_per_area,
    casimir_fractional_deviation,
    critical_field_Vm,
    topological_coupling,
)
from .neural_cathedral import (
    CathedralLayer,
    CathedralNet,
    GrokDetector,
    embed_to_shell,
)
from .navier_stokes import (
    cascade_downward_fraction,
    cascade_upward_fraction,
    net_cascade_flux,
    kolmogorov_constant,
    bkm_bound,
    regularity_check,
    kolmogorov_spectrum,
    intermittency_exponents,
)
from .nuclear_magic import (
    closure_functional,
    find_magic_numbers,
    magic_number_prediction,
    nuclear_stability_index,
    binding_energy_cathedral,
)
from .axion_cathedral import (
    axion_mass_GeV,
    axion_mass_ueV,
    peccei_quinn_scale,
    photon_coupling,
    secondary_spectral_line_GHz,
    detection_status,
)
from .qft_cathedral import (
    cathedral_propagator,
    coupling_g_star,
    coupling_alpha_star,
    beta_function,
    running_coupling,
    anomalous_dimension,
    effective_potential,
    feynman_rules,
    higgs_mass_from_potential,
)
from .periodic_table import (
    madelung_energy,
    madelung_order,
    madelung_constant,
    electron_configuration,
    cumulative_fill_sequence,
    cathedral_noble_gas_prediction,
    h3_irrep,
    sector_orbital_table,
    period_lengths,
    periodic_table_summary,
)
from .holography import (
    newton_constant,
    ads_radius,
    central_charge,
    s_rt_k4_a5,
    entanglement_entropy_k4,
    holographic_bound_satisfied,
    bekenstein_hawking,
    hawking_temperature as holographic_hawking_temperature,
    page_time,
    schwarzschild_radius as holographic_schwarzschild_radius,
    scrambling_time,
    c_function,
    cathedral_bh_from_mass,
    holographic_entanglement_spectrum,
)
from .consciousness import (
    graph_spectrum,
    spectral_gap,
    critical_coupling,
    kuramoto_evolve,
    sync_order_parameter,
    iit_phi_approx,
    peak_phi,
    eeg_frequencies,
    consciousness_phase_diagram,
)
from .prime_spectral import (
    laplacian_spectrum,
    adjacency_spectrum,
    distinct_eigenvalues,
    ramanujan_bound,
    riemann_scaling_constant,
    cathedral_kappa_formula,
    riemann_zero_matches,
    ihara_determinant,
    RIEMANN_ZEROS,
)
from .metamaterials import (
    photonic_band_gap_frequency,
    photonic_gap_width,
    gap_to_midgap_ratio,
    fill_fraction,
    effective_refractive_index,
    negative_index_condition,
    z2_topological_invariant,
    edge_state_frequency,
    topological_protection_length,
    capsid_binding_sites,
    phononic_dispersion,
    sound_velocity_ratio,
    metamaterial_summary,
)
from .swarm_intelligence import (
    formation_positions,
    coverage_solid_angle,
    agent_separation,
    command_radius,
    consensus_time,
    critical_coupling_swarm,
    delta_field_consensus,
    fault_tolerance_analysis,
    urt_swarm_update,
    swarm_sync_fraction,
    earth_coverage_constellation,
)
from .gravitational_waves import (
    qnm_frequency,
    ringdown_damping_time,
    isco_frequency,
    cathedral_ringdown_shift,
    chirp_mass,
    peak_strain,
    gw_memory_effect,
    ikt_matrix_simple,
    cathedral_snr,
    detection_threshold,
    is_gw_detected,
    gw_power_spectrum,
    gw_event_summary,
)

from .gravity_cathedral import (
    G_NEWTON,
    AREA_QUANTUM,
    graviton_mode,
    force_hierarchy,
    why_gravity_is_weak,
    schwarzschild_radius as cat_schwarzschild_radius,
    horizon_area,
    bh_entropy as cat_bh_entropy,
    hawking_temperature as cat_hawking_temperature,
    bh_lifetime,
    area_quantum,
    bekenstein_mukhanov_spectrum,
    scrambling_time as cat_scrambling_time,
    page_time as cat_page_time,
    bh_information_summary,
    gr_test_summary,
    effective_lagrangian as gravity_lagrangian,
    print_gravity_cathedral_report,
)
from .neutrinos import (
    SIN2_THETA12,
    SIN2_THETA13,
    SIN2_THETA23,
    THETA12_DEG,
    THETA13_DEG,
    THETA23_DEG,
    DELTA_CP_DEG,
    M1_MEV,
    neutrino_masses_eV,
    sum_neutrino_masses_eV,
    sum_neutrino_masses_meV,
    effective_majorana_mass,
    pmns_matrix,
    jarlskog_invariant,
    cosmological_mass_bound,
    neutrino_mixing_summary,
    print_neutrino_report,
)
from .vacuum_instability import (
    V as vacuum_potential,
    V_array as vacuum_potential_array,
    dV as vacuum_dV,
    d2V as vacuum_d2V,
    vacuum_curvature_at_zero,
    vacuum_curvature_at_delta_star,
    potential_barrier_height,
    tunneling_exponent,
    false_vacuum_decay_rate,
    delta_field_evolution,
    why_something_not_nothing,
    stability_analysis,
    mexican_hat_parameters,
    print_vacuum_report,
)
from .cathedral_topology import (
    HOLONOMY_VORTEX_DEG,
    PHYSICAL_RAIL_DEG,
    K5_ENTROPY_DEFICIT_DEG,
    GRAVITATIONAL_DEFICIT_DEG as TOPOLOGY_DEFICIT_DEG,
    holonomy_vortex,
    rg_damping_factor,
    rg_mode_table,
    gravitational_deficit_triangle,
    uv_to_ir_transition,
    topology_summary,
    print_topology_report,
)
from .pi_phi_e_flow import (
    ETA,
    ETA_L,
    MU,
    continuous_flow,
    urt_evolve_exact,
    urt_evolve_continuous,
    lyapunov_value,
    contraction_factor,
    discretization_errors,
    uniqueness_theorem,
    flow_coefficient_table,
    print_pi_phi_e_report,
)
from .force_structure import (
    k4_mode,
    h3_mode,
    all_modes,
    coupling_hierarchy,
    unification_scale_gev,
    cathedral_grand_unified_coupling,
    force_unification_summary,
    effective_lagrangian_terms,
    print_force_structure_report,
)
from .electroweak import (
    SIN2_THETA_W,
    COS2_THETA_W,
    M_W_GEV,
    M_Z_GEV,
    G_FERMI,
    LAMBDA_HIGGS,
    M_HIGGS_GEV,
    C_MASS_V6,
    ALPHA_GUT,
    weinberg_angle,
    w_boson,
    z_boson,
    higgs_boson,
    ew_precision_tests,
    electroweak_summary,
    print_electroweak_report,
)
from .cosmology_cathedral import (
    N_E,
    N_S,
    R_TENSOR,
    A_S,
    OMEGA_M as COSMO_OMEGA_M,
    OMEGA_LAMBDA,
    OMEGA_B,
    CC_RATIO,
    SIGMA_8,
    M_GUT_GEV,
    cmb_power_spectrum,
    density_parameters,
    large_scale_structure,
    inflation_parameters,
    cosmological_constant_problem,
    cosmology_summary,
    print_cosmology_report,
)
from .uniqueness_proof import (
    ETA_EXACT,
    ETA_L_EXACT,
    MU_EXACT,
    TAU_EXACT,
    mode_contraction,
    all_contractions,
    lemma_1_gradient_flow,
    lemma_2_representation_theory,
    lemma_3_annealing,
    lemma_4_contraction,
    conjecture_121,
    uniqueness_theorem_full,
    print_uniqueness_report,
)
from .prime181 import (
    P181,
    is_prime,
    legendre_symbol,
    golden_ratio_residue_test,
    k4_compatibility_test,
    closure_representation_test,
    scan_primes_for_prime181,
    prime181_properties,
    corollary_111_statement,
    print_prime181_report,
)
from .ckm_pmns import (
    LAMBDA_C,
    A_CKM,
    RHO_BAR,
    ETA_BAR,
    J_CKM,
    DELTA_CP_PMNS_DEG,
    SIN2_THETA12_PMNS,
    SIN2_THETA13_PMNS,
    SIN2_THETA23_PMNS,
    ckm_matrix,
    ckm_summary,
    pmns_matrix,
    pmns_summary,
    jarlskog_pmns,
    quark_lepton_complementarity,
    print_ckm_pmns_report,
)
from .canonical_v4gem import (
    OMEGA_GEM,
    TAU_STAB,
    EPS_GEM,
    T_K4,
    DELTA_TA,
    resonance_shells,
    gem_flow,
    ta_urt_average,
    gem_contraction_factor,
    compression_ratio,
    canonical_v4gem_summary,
    print_canonical_v4gem_report,
)
from .qbls_fractal import (
    N_RUNGS,
    EPS_RUNG,
    delta_star_rung,
    g_newton_rung,
    fractal_ratio,
    rung_table,
    MetaUniverse,
    simulate_meta_universes_fractal,
    planck_foam,
    anthropic_bounds,
    qbls_fractal_summary,
    print_qbls_fractal_report,
)
from .iron_proof import (
    spectral_uniqueness_proof,
    gamma_from_dimension_proof,
    free_parameter_audit,
    genuine_predictions,
    inter_observable_correlations,
    prediction_statistics,
    honest_assessment,
    a5_uniqueness_argument,
    iron_proof_full,
    print_iron_proof_report,
)
from .cathedral_lagrangian import (
    cathedral_action_summary,
    gauge_couplings,
    h3_spectrum,
    yukawa_coupling,
    h3_mode_mass,
    h3_mode_mass_gev,
    ward_identities,
    rg_fixed_points,
    cathedral_potential,
    cathedral_dV,
    cathedral_d2V,
    effective_potential_1loop,
    coleman_weinberg_correction,
    higgs_sector,
    coupling_table,
    G_NEWTON_CAT,
    ALPHA_S as ALPHA_S_CAT,
    SIN2_THETA_W as SIN2_THETA_W_CAT,
    LAMBDA_HIGGS as LAMBDA_HIGGS_CAT,
    K_POTENTIAL,
    N_GENERATIONS,
    N_F,
    B0_SU3 as B0_SU3_CAT,
    KAPPA_GRAV,
    LAMBDA_SHELL,
    print_lagrangian_report,
)
from .dark_matter import (
    axion_dm,
    sterile_neutrino_dm,
    wimp_dm,
    dm_budget,
    dark_matter_summary,
    M_AXION_UEV,
    M_STERILE_KEV,
    M_WIMP_GEV,
    SIN2_2THETA_DW,
    SIGMA_SI_CM2,
    OMEGA_WIMP_H2,
    OMEGA_AXION_H2,
    AXION_EN_RATIO,
    print_dm_report,
)
from .baryon_asymmetry import (
    eta_b_miracle,
    leptogenesis_mechanism,
    sakharov_conditions,
    baryon_asymmetry_summary,
    ETA_B_OBSERVED,
    DELTA_CP_DEG as DELTA_CP_LEPTO_DEG,
    DELTA_CP_RAD,
    EPSILON_1,
    KAPPA as KAPPA_LEPTO,
    ETA_B_LEPTO,
    M1_HEAVY_GEV,
    print_baryon_report,
)
from .cathedral_gut import (
    gut_scale,
    unification_check,
    proton_lifetime,
    gut_multiplets,
    cathedral_gut_summary,
    ALPHA_GUT as ALPHA_GUT_CAT,
    ALPHA_GUT_INV,
    MU_GUT_GEV,
    M_X_GEV,
    TAU_PROTON_YR,
    print_gut_report,
)

from .muon_g2 import (
    qed_contribution,
    ew_contribution,
    np_h3_constraint,
    g2_summary,
    A_MU_1LOOP,
    A_MU_2LOOP,
    A_MU_QED_SM,
    A_MU_EW_1L,
    A_MU_EW,
    A_MU_EXP,
    A_MU_EXP_ERR,
    A_MU_DISCREPANCY,
    M_MU_GEV,
    C2_QED,
    print_g2_report,
)

from .topological_qc import (
    fibonacci_anyon,
    f_matrix,
    r_matrix,
    icosahedral_qec,
    braiding_gate,
    topological_qc_summary,
    D_FIBONACCI,
    F_MATRIX_11,
    F_MATRIX_12,
    P_TH_ICOSAHEDRAL,
    R_PHASE_1,
    R_PHASE_TAU,
    print_tqc_report,
)

from .string_landscape import (
    critical_dimensions,
    exceptional_groups,
    heterotic_string,
    moonshine_connection,
    string_landscape_summary,
    D_BOSONIC,
    D_SUPER,
    D_LEECH,
    E8_ROOTS,
    E8_DIM,
    E6_27PLET,
    E6_78_ADJ,
    J_COEFF_1,
    MONSTER_LOWEST_REP,
    print_string_report,
)

from .quantum_chaos import (
    icosahedral_spectrum,
    level_spacing_distribution,
    spectral_rigidity,
    mss_bound,
    logistic_chaos_connection,
    quantum_chaos_summary,
    ICOS_EIGENVALUES,
    DISTINCT_EIGENVALUES,
    MULTIPLICITIES,
    MSS_BOUND_M1,
    LOGISTIC_R_STAR,
    LOGISTIC_CYCLE_LEN,
    IS_EDGE_OF_CHAOS,
    print_chaos_report,
)

from .plasma_cathedral import (
    reconnection,
    alfven_modes,
    fusion_parameters,
    plasma_turbulence,
    plasma_summary,
    M_A_RECONNECTION,
    BETA_PLASMA,
    Q_SAFETY_FACTOR,
    DEBYE_LENGTH,
    LUNDQUIST_S,
    print_plasma_report,
)

from .megaswarm import (
    swarm_level,
    optimal_k_for_target,
    plasma_coil_formation,
    drone_fleet,
    megaswarm_summary,
    KAPPA as KAPPA_SWARM,
    LAMBDA_2 as LAMBDA_2_SWARM,
    SWARM_SIZES,
    K_MAX_PRACTICAL,
    print_megaswarm_report,
)

from .protein_cathedral import (
    capsid_geometry,
    helix_prediction,
    c60_buckyball,
    drug_binding,
    protein_summary,
    T_CAPSID,
    C60_ATOMS,
    C60_HEXAGONS,
    C60_PENTAGONS,
    C60_SYMMETRY_ORDER,
    HELIX_PITCH_ANGLE_DEG,
    N_BINDING_SITES_ICOS,
    PHYLLOTAXIS_ANGLE_DEG,
    print_protein_report,
)

from .superconductor_cathedral import (
    bcs_parameters,
    c60_symmetry,
    icosahedral_phonon,
    k3c60_superconductor,
    superconductor_summary,
    BCS_GAP_RATIO,
    G_CATHEDRAL as G_BCS,
    TC_K3C60_PRED_K,
    TC_K3C60_OBS_K,
    PHONON_H_DIM,
    C60_GROUP_ORDER,
    print_superconductor_report,
)

from .information_cathedral import (
    shannon_entropy,
    channel_capacity,
    qec_rate,
    bekenstein_hawking,
    holographic_bound,
    page_time,
    von_neumann_entropy,
    holevo_bound,
    information_summary,
    H_MAX_BITS,
    H_MAX_NATS,
    C_CHANNEL_BITS,
    R_QEC,
    I_K4_H3_BITS,
    S_QUANTUM_BITS,
    AREA_QUANTUM,
    SNR_CATHEDRAL,
    print_info_report,
)

from .knot_cathedral import (
    jones_unknot,
    jones_trefoil,
    jones_hopf,
    jones_figure8,
    jones_torus_p2,
    fibonacci_braiding,
    braid_group_B13,
    writhe_torus,
    alexander_trefoil_at_q,
    reidemeister_moves,
    knot_summary,
    CS_LEVEL,
    T_JONES,
    Q_JONES,
    N_BRAID_GENERATORS,
    print_knot_report,
)

from .ising_cathedral import (
    magnetisation,
    critical_exponents,
    icosahedral_ising,
    delta_star_on_spin_curve,
    ising_summary,
    N_ISING,
    Z_COORD,
    K_C_MF,
    K_C_BETHE,
    K_DELTA_STAR,
    print_ising_report,
)

from .climate_cathedral import (
    lorenz_attractor,
    milankovitch,
    turbulence_summary,
    climate_sensitivity_summary,
    climate_summary,
    kolmogorov_scaling_exponents,
    milankovitch_forcing,
    KOLMOGOROV_EXPONENT,
    LORENZ_DKY,
    LORENZ_LAMBDA1,
    N_MILANKOVITCH,
    ECS_CELSIUS,
    FEEDBACK_RATIO,
    print_climate_report,
)

from .wave_equations_cathedral import (
    dispersion,
    group_velocity,
    phase_velocity,
    greens_function_D3,
    greens_function_D3_approx,
    spherical_harmonic_count,
    cathedral_propagator,
    cross_product_uniqueness,
    solid_angle_and_information,
    wave_summary,
    D_HUYGENS_HOLDS,
    GREENS_POWER,
    GREENS_COEFF,
    CROSS_PRODUCT_UNIQUE,
    M_CATHEDRAL,
    COMPTON_WAVELENGTH,
    CORRELATION_LENGTH,
    print_wave_report,
)

from .a5_representations import (
    verify_orthogonality,
    irrep_dimensions,
    conjugacy_analysis,
    a5_summary,
    IRREP_DIMS,
    SUM_SQUARES as A5_SUM_SQUARES,
    N_IRREPS,
    CONJUGACY_CLASSES,
    CHARACTER_TABLE,
    GOLDEN_IN_CHARACTER,
    print_a5_report,
)

from .solar_system import (
    orbital_resonances,
    titius_bode,
    venus_earth_phi,
    lagrange_geometry,
    solar_summary,
    VENUS_RESONANCE_DEVIATION,
    LAPLACE_RATIO_MIDDLE,
    print_solar_report,
)

from .number_theory_cathedral import (
    prime_properties,
    mersenne_check,
    fibonacci_N,
    ramanujan_tau,
    quadratic_residues_13,
    catalan_connection,
    number_theory_summary,
    MERSENNE_N,
    MERSENNE_N_IS_PRIME,
    FIBONACCI,
    CATALAN_D,
    T_N as TRIANGULAR_N,
    print_number_theory_report,
)

from .eeg_cathedral import (
    eeg_bands,
    frequency_ratios,
    neural_avalanche,
    schumann_resonance,
    kuramoto_eeg,
    eeg_summary,
    ALPHA_BETA_BOUNDARY_HZ,
    AVALANCHE_EXPONENT,
    K_C_KURAMOTO,
    print_eeg_report,
)

from .economics_cathedral import (
    pareto_analysis,
    hurst_analysis,
    market_microstructure,
    kelly_criterion,
    tail_distribution,
    economics_summary,
    H_CATHEDRAL,
    TAIL_EXPONENT,
    SIGMA_CATHEDRAL,
    SPREAD_RELATIVE,
    print_economics_report,
)

from .music_cathedral import (
    SEMITONES_PER_OCTAVE, PERFECT_5TH_JUST, PENTATONIC_NOTES,
    TRIAD_NOTES, TRITONE_SEMITONES, PYTHAGOREAN_COMMA, N_KEYS_CIRCLE,
    chord_structure, equal_temperament, golden_ratio_music,
    harmonic_series, cathedral_musical_numbers, music_summary,
    print_music_report,
)

from .genetics_cathedral import (
    N_DNA_BASES, CODON_LENGTH, N_CODONS, N_AMINO_ACIDS, N_STOP_CODONS,
    A_DNA_BP_PER_TURN, Z_DNA_BP_PER_TURN, INFO_PER_CODON_BITS,
    N_RIBOSOME_SITES, N_SECONDARY_STRUCTURES,
    dna_geometry, codon_table, genetics_summary,
    information_genetics, protein_structure, print_genetics_report,
)

from .combinatorics_cathedral import (
    N_PLATONIC_SOLIDS_D3, N_POLYTOPES_D4, N_POLYTOPES_D5,
    BELL_D, CATALAN_D, P_D, R_33, R_34, ROTATION_ORDERS,
    bell_catalan, platonic_polytopes, ramsey_numbers, partition_numbers,
    stirling_numbers, burnside_icosahedral_colorings,
    combinatorics_summary, print_combinatorics_report,
)

from .stat_mech_cathedral import (
    D_UPPER_CRITICAL, D_LOWER_CRITICAL, EPS_EXPANSION,
    DELTA_MF, NU_ISING_D3, ETA_ISING_D3, ETA_CATHEDRAL_APPROX,
    HYPERSCALING_CHECK,
    critical_exponents_D3, critical_dimensions, rg_flow_wilson,
    scaling_relations, stat_mech_summary, print_stat_mech_report,
)

from .fluid_cathedral import (
    KOLMOGOROV_EXPONENT, GAMMA_MONATOMIC, GAMMA_DIATOMIC,
    DOF_MONATOMIC, DOF_DIATOMIC, DOF_LINEAR_MOLECULE, DOF_POLYATOMIC,
    STOKES_COEFF, POISEUILLE_DENOM, VORTEX_STRETCHING_D3,
    degrees_of_freedom, turbulence_cascade, adiabatic_exponents,
    stokes_poiseuille, fluid_summary, print_fluid_report,
)

from .crystallography_cathedral import (
    N_BRAVAIS, N_POINT_GROUPS, N_SPACE_GROUPS,
    Z_FCC, Z_HCP, Z_BCC, Z_SC, Z_ICOS,
    ETA_FCC, ETA_BCC, ETA_SC, ETA_FCC_OVER_SC,
    QCRYSTAL_FOLD, ALLOWED_FOLD_ORDERS, ICOS_CHIRAL_GROUP_ORDER,
    bravais_lattices, point_groups, coordination_numbers,
    quasicrystal_connection, packing_fractions, space_group_analysis,
    crystallography_summary, print_crystallography_report,
)

from .color_vision_cathedral import (
    N_CONE_TYPES, N_COLOR_PRIMARIES, N_OPPONENT_CHANNELS,
    N_COLOR_DIMS, LAMBDA_LM_SEP,
    trichromacy, opponent_channels, maxwell_triangle,
    color_space_dimensions, color_summary, print_color_report,
)

from .game_theory_cathedral import (
    N_RPS_STRATEGIES, RPS_NASH_PROB, COOP_THRESHOLD_D,
    ESS_RPS_PROB, DELTA_MIN_COOP_GRIM, SHAPLEY_UNIFORM_N13,
    rock_paper_scissors, prisoners_dilemma, evolutionary_dynamics,
    shapley_n13, game_theory_summary, print_game_theory_report,
)

from .topological_spaces import (
    EULER_CHI_ICOSAHEDRON, HOPF_BASE_DIM, HOPF_FIBER_DIM,
    HOPF_TOTAL_DIM, BETTI_ICOS, DE_RHAM_S2_NONZERO_DIMS,
    euler_icosahedron, hopf_fibration, sphere_topology,
    defect_classification, topological_summary, print_topology_report,
)

from .relativity_cathedral import (
    N_SPACETIME_DIMS, N_4VECTOR, N_ANTISYM_2TENSOR,
    N_LORENTZ_GENERATORS, N_ROTATIONS, N_BOOSTS,
    N_RIEMANN_COMPONENTS, N_RICCI_COMPONENTS, N_WEYL_COMPONENTS,
    N_EINSTEIN_EQNS, N_PHYSICAL_EFE,
    N_DIRAC_COMPONENTS, N_WEYL_SPINOR_COMPONENTS,
    schwarzschild_radius, hawking_temperature, bh_entropy,
    spacetime_structure, lorentz_group_structure,
    riemann_tensor_structure, spinor_structure,
    relativity_summary, print_relativity_report,
)

from .atomic_physics_cathedral import (
    N_QUANTUM_NUMBERS, N_SPIN_PROJECTIONS,
    L_P_STATES, L_D_STATES, L_9_STATES, L_FOR_N_STATES,
    SHELL_1_MAX, SHELL_2_MAX, SHELL_3_MAX, SHELL_4_MAX,
    TOTAL_ORBITALS_TO_N, RYDBERG_EV,
    quantum_numbers, angular_momentum_states, shell_structure,
    rydberg_analysis, atomic_summary, print_atomic_report,
)

from .electromagnetism_cathedral import (
    N_MAXWELL_EQUATIONS, N_EM_FIELD_COMPONENTS, N_EM_TENSOR_COMPONENTS,
    N_PHOTON_POLARIZATIONS, RADIATION_POWER_LAW,
    EM_DUALITY_DIMENSION, EM_COMPONENTS_EQ_V2,
    C_LIGHT_MS, Z0_IMPEDANCE, ALPHA_QED,
    coulomb_law, radiation_field_scaling,
    maxwell_equations, em_field_tensor, photon_properties,
    em_summary, print_em_report,
)

from .optics_cathedral import (
    N_MINIMA_N_SLIT, N_SECONDARY_MAXIMA, N_DIFFRACTION_ORDERS,
    THETA_C_DELTA_STAR_DEG, BREWSTER_PHI_DEG, N_REFRACTIVE_DELTA_STAR,
    n_slit_diffraction, critical_and_brewster_angles,
    diffraction_orders, optics_summary, print_optics_report,
)

from .geophysics_cathedral import (
    N_SEISMIC_BODY, N_SEISMIC_SURFACE, N_SEISMIC_TOTAL,
    EARTH_LAYERS, N_TECTONIC_PLATES, VP_VS_POISSON, N_NORMAL_MODES_SUM,
    seismic_waves, earth_structure, wave_velocities,
    normal_modes, gutenberg_richter,
    geophysics_summary, print_geophysics_report,
)

from .linguistics_cathedral import (
    N_FORMANTS, N_VOWELS_TYPICAL, N_WORD_ORDERS, N_PIE_LARYNGEALS,
    PHONEME_MODE, N_PRIMARY_CARDINAL_VOWELS, WORD_ORDERS_EQ_V2,
    vowel_system, word_order, phoneme_inventory,
    pie_reconstruction, syllable_structure,
    linguistics_summary, print_linguistics_report,
)

from .nuclear_structure_cathedral import (
    N_NUCLEON_SPIN_PROJECTIONS, N_ISOSPIN_STATES,
    MAGIC_NUMBERS, MAGIC_1, MAGIC_2, MAGIC_3, Z_LEAD,
    N_QCD_COLORS, N_QUARK_FLAVORS_TOTAL, ALPHA_Z, ALPHA_A,
    magic_numbers_analysis, nucleon_quantum_numbers, qcd_structure,
    nuclear_summary, print_nuclear_report,
)

from .graph_theory_cathedral import (
    ICOS_VERTEX_DEGREE, FOUR_COLOR_THEOREM_BOUND,
    K_D_EDGES, K_D1_EDGES,
    N_PETERSEN_VERTICES, N_PETERSEN_EDGES, PETERSEN_GIRTH,
    R_33, R_34, ICOS_SPECTRAL_GAP,
    icosahedral_graph, graph_colorings, petersen_properties,
    ramsey_theory, spectral_theory,
    graph_theory_summary, print_graph_theory_report,
)

from .information_theory_cathedral import (
    H_MAX_N, H_MAX_Q, BINARY_ALPHABET, CATHEDRAL_SNR, C_CATHEDRAL,
    HAMMING_N, HAMMING_K, HAMMING_D, HAMMING_RATE,
    N_QUBIT_DIMS, TOFFOLI_QUBITS, N_PHYS_PER_LOGICAL_ICOS,
    entropy_analysis, hamming_code_analysis, quantum_information_analysis,
    information_theory_summary, print_information_theory_report,
)

from .algebra_cathedral import (
    ORDER_A5, ORDER_IH, ORDER_SD, ORDER_SD1, ORDER_AD,
    GF2_ORDER, GF4_ORDER, GF5_ORDER, GF13_ORDER, GF2D_ORDER, GF2Q_ORDER,
    DEGREE_Q_PHI, GALOIS_Z13_ORDER, GALOIS_Z5_ORDER,
    EULER_TOTIENT_V, EULER_TOTIENT_N,
    DIM_SU2, DIM_SUD, DIM_SOD, DIM_SOD1,
    group_theory_analysis, field_theory_analysis,
    galois_theory_analysis, lie_algebra_analysis,
    algebra_summary, print_algebra_report,
)

__version__ = "2.9.2"
__author__ = "Cornelius Lytollis"
__all__ = [
    # chaos metrics
    "lyapunov_rosenstein",
    "tau_avalanche",
    "D_KY_from_l1_proxy",
    "DKY_from_delta_monotone",
    "delta_metric",
    # core constant + shell
    "DELTA_STAR",
    "C_MASS",
    "compute_all_constants",
    "urt_evolve",
    # control
    "urt_step",
    "urt_operator",
    "is_critical",
    # Cathedral framework
    "Cathedral",
    "CathedralV9",
    # RG flow
    "rg_flow",
    "crossover_scale",
    "running_alpha_inv",
    "running_alpha_s",
    # QBLS
    "rung_spacing",
    "scale_quantity",
    "rung_of",
    "physical_ladder",
    "simulate_meta_universes",
    "DELTA_RUNG",
    "LAMBDA_S",
    # logistic verification
    "verify_delta_star_logistic",
    "LogisticVerificationResult",
    # gravity deficit
    "GRAVITATIONAL_DEFICIT_DEG",
    "GRAVITATIONAL_DEFICIT_RAD",
    "HOLONOMY_VORTEX_DEG",
    "schwarzschild_area",
    "cathedral_bh_entropy",
    "hawking_temperature",
    "newton_G_from_deficit",
    "deficit_summary",
    # ARF closure
    "ARFFixedPoint",
    "ARFPredictions",
    "prove_uniqueness",
    "scan_D",
    "gamma_power_ladder",
    # quasicrystal / IKT
    "ikt_forward",
    "ikt_inverse",
    "ikt_matrix",
    "ikt_sector_power",
    "phi_scaled_radii",
    # Casimir
    "casimir_force_per_area",
    "casimir_fractional_deviation",
    "critical_field_Vm",
    "topological_coupling",
    # Cathedral neural
    "CathedralLayer",
    "CathedralNet",
    "GrokDetector",
    "embed_to_shell",
    # periodic table
    "madelung_energy",
    "madelung_order",
    "madelung_constant",
    "electron_configuration",
    "cumulative_fill_sequence",
    "cathedral_noble_gas_prediction",
    "h3_irrep",
    "sector_orbital_table",
    "period_lengths",
    "periodic_table_summary",
    # holography / AdS-CFT
    "newton_constant",
    "ads_radius",
    "central_charge",
    "s_rt_k4_a5",
    "entanglement_entropy_k4",
    "holographic_bound_satisfied",
    "bekenstein_hawking",
    "holographic_hawking_temperature",
    "page_time",
    "holographic_schwarzschild_radius",
    "scrambling_time",
    "c_function",
    "cathedral_bh_from_mass",
    "holographic_entanglement_spectrum",
    # consciousness / Kuramoto
    "graph_spectrum",
    "spectral_gap",
    "critical_coupling",
    "kuramoto_evolve",
    "sync_order_parameter",
    "iit_phi_approx",
    "peak_phi",
    "eeg_frequencies",
    "consciousness_phase_diagram",
    # prime spectral / Riemann
    "laplacian_spectrum",
    "adjacency_spectrum",
    "distinct_eigenvalues",
    "ramanujan_bound",
    "riemann_scaling_constant",
    "cathedral_kappa_formula",
    "riemann_zero_matches",
    "ihara_determinant",
    "RIEMANN_ZEROS",
    # metamaterials
    "photonic_band_gap_frequency",
    "photonic_gap_width",
    "gap_to_midgap_ratio",
    "fill_fraction",
    "effective_refractive_index",
    "negative_index_condition",
    "z2_topological_invariant",
    "edge_state_frequency",
    "topological_protection_length",
    "capsid_binding_sites",
    "phononic_dispersion",
    "sound_velocity_ratio",
    "metamaterial_summary",
    # swarm intelligence
    "formation_positions",
    "coverage_solid_angle",
    "agent_separation",
    "command_radius",
    "consensus_time",
    "critical_coupling_swarm",
    "delta_field_consensus",
    "fault_tolerance_analysis",
    "urt_swarm_update",
    "swarm_sync_fraction",
    "earth_coverage_constellation",
    # gravitational waves
    "qnm_frequency",
    "ringdown_damping_time",
    "isco_frequency",
    "cathedral_ringdown_shift",
    "chirp_mass",
    "peak_strain",
    "gw_memory_effect",
    "ikt_matrix_simple",
    "cathedral_snr",
    "detection_threshold",
    "is_gw_detected",
    "gw_power_spectrum",
    "gw_event_summary",
    # Cathedral gravity (K4 gapless mode)
    "G_NEWTON",
    "AREA_QUANTUM",
    "graviton_mode",
    "force_hierarchy",
    "why_gravity_is_weak",
    "cat_schwarzschild_radius",
    "horizon_area",
    "cat_bh_entropy",
    "cat_hawking_temperature",
    "bh_lifetime",
    "area_quantum",
    "bekenstein_mukhanov_spectrum",
    "cat_scrambling_time",
    "cat_page_time",
    "bh_information_summary",
    "gr_test_summary",
    "gravity_lagrangian",
    "print_gravity_cathedral_report",
    # neutrinos
    "SIN2_THETA12",
    "SIN2_THETA13",
    "SIN2_THETA23",
    "THETA12_DEG",
    "THETA13_DEG",
    "THETA23_DEG",
    "DELTA_CP_DEG",
    "M1_MEV",
    "neutrino_masses_eV",
    "sum_neutrino_masses_eV",
    "sum_neutrino_masses_meV",
    "effective_majorana_mass",
    "pmns_matrix",
    "jarlskog_invariant",
    "cosmological_mass_bound",
    "neutrino_mixing_summary",
    "print_neutrino_report",
    # vacuum instability
    "vacuum_potential",
    "vacuum_potential_array",
    "vacuum_dV",
    "vacuum_d2V",
    "vacuum_curvature_at_zero",
    "vacuum_curvature_at_delta_star",
    "potential_barrier_height",
    "tunneling_exponent",
    "false_vacuum_decay_rate",
    "delta_field_evolution",
    "why_something_not_nothing",
    "stability_analysis",
    "mexican_hat_parameters",
    "print_vacuum_report",
    # force structure
    "k4_mode",
    "h3_mode",
    "all_modes",
    "coupling_hierarchy",
    "unification_scale_gev",
    "cathedral_grand_unified_coupling",
    "force_unification_summary",
    "effective_lagrangian_terms",
    "print_force_structure_report",
    # π–φ–e flow
    "ETA",
    "ETA_L",
    "MU",
    "continuous_flow",
    "urt_evolve_exact",
    "urt_evolve_continuous",
    "lyapunov_value",
    "contraction_factor",
    "discretization_errors",
    "uniqueness_theorem",
    "flow_coefficient_table",
    "print_pi_phi_e_report",
    # wave equations cathedral
    "dispersion",
    "group_velocity",
    "phase_velocity",
    "greens_function_D3",
    "greens_function_D3_approx",
    "spherical_harmonic_count",
    "cathedral_propagator",
    "cross_product_uniqueness",
    "solid_angle_and_information",
    "wave_summary",
    "D_HUYGENS_HOLDS",
    "GREENS_POWER",
    "GREENS_COEFF",
    "CROSS_PRODUCT_UNIQUE",
    "M_CATHEDRAL",
    "COMPTON_WAVELENGTH",
    "CORRELATION_LENGTH",
    "print_wave_report",
    # A₅ representations
    "verify_orthogonality",
    "irrep_dimensions",
    "conjugacy_analysis",
    "a5_summary",
    "IRREP_DIMS",
    "A5_SUM_SQUARES",
    "N_IRREPS",
    "CONJUGACY_CLASSES",
    "CHARACTER_TABLE",
    "GOLDEN_IN_CHARACTER",
    "print_a5_report",
    # solar system
    "orbital_resonances",
    "titius_bode",
    "venus_earth_phi",
    "lagrange_geometry",
    "solar_summary",
    "VENUS_RESONANCE_DEVIATION",
    "LAPLACE_RATIO_MIDDLE",
    "print_solar_report",
    # number theory
    "prime_properties",
    "mersenne_check",
    "fibonacci_N",
    "ramanujan_tau",
    "quadratic_residues_13",
    "catalan_connection",
    "number_theory_summary",
    "MERSENNE_N",
    "MERSENNE_N_IS_PRIME",
    "FIBONACCI",
    "CATALAN_D",
    "TRIANGULAR_N",
    "print_number_theory_report",
    # EEG / neuroscience
    "eeg_bands",
    "frequency_ratios",
    "neural_avalanche",
    "schumann_resonance",
    "kuramoto_eeg",
    "eeg_summary",
    "ALPHA_BETA_BOUNDARY_HZ",
    "AVALANCHE_EXPONENT",
    "K_C_KURAMOTO",
    "print_eeg_report",
    # economics
    "pareto_analysis",
    "hurst_analysis",
    "market_microstructure",
    "kelly_criterion",
    "tail_distribution",
    "economics_summary",
    "H_CATHEDRAL",
    "TAIL_EXPONENT",
    "SIGMA_CATHEDRAL",
    "SPREAD_RELATIVE",
    "print_economics_report",
]
