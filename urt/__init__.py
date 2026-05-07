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

__version__ = "2.2.0"
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
]
