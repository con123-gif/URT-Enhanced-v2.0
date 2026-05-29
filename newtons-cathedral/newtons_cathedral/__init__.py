"""
Newton's Cathedral — a derivation of physics from D = 3 alone.

The iron chain:

    D = 3                  spatial dimension (input)
    A_5 unique             Jordan 1870 (non-cyclic simple subgroup of SO(3))
    q = D + 2 = 5          5-fold rotation axes
    V, E, F = 12, 30, 20   icosahedral counts (orbit-stabiliser)
    G = (D+1)·D·q = 60     |A_5|
    N = D² + D + 1 = 13    centred-icosahedral closure
    γ = D^{-(D+1)} = 1/81  self-referential entropy
    φ = (1 + √5) / 2       golden ratio (A_5 character table)
    δ★ = (1 − γ)·π/(N·φ)   vacuum fixed point

The full anchor-free chain from a single observed input ρ_Λ to every
Standard-Model mass, gauge boson, mixing angle, neutrino mass, dark-
sector candidate, and CMB observable.

CI top-level gate:

    from newtons_cathedral import all_audits_pass
    assert all_audits_pass()
"""
from __future__ import annotations

# ── Foundations ──────────────────────────────────────────────────────────
from .foundations import (
    D, q, V, E, F, G, N,
    PHI, GAMMA,
    DELTA_STAR, DELTA_CL, DELTA,
    cathedral_integers, iron_chain, foundations_audit,
)

# ── Graph + sectors + dynamics ──────────────────────────────────────────
from .graph import (
    adjacency, laplacian, spectrum, cathedral_eigenvalues, graph_audit,
)
from .sectors import (
    K4_SIZE, A5_SIZE, SECTOR_RATIO, ETA_B_PREFACTOR,
    K4_EIGENVALUES, A5_EIGENVALUES,
    TR_L_K4, TR_L_A5, TR_L_TOTAL,
    OMEGA_M_BARE, OMEGA_L_BARE,
    sector_decomposition, sector_power, sector_ratio_at,
    sectors_audit,
)
from .dynamics import (
    ETA, ETA_L, MU,
    DYNAMICAL_NORMALISATION,
    urt_step, urt_evolve,
    per_mode_contraction, mixing_time,
    cathedral_potential, cathedral_gradient,
    dynamics_audit,
)
from .vacuum import (
    vacuum_potential_at_rail,
    matter_direction_margin, matter_direction_target,
    vacuum_audit,
)

# ── ARF arithmetic ──────────────────────────────────────────────────────
from .arf import (
    D63, D64, D79, D80, R_ALPHA,
    ALPHA_INV_BARE, ALPHA_INV_FULL,
    MP_ME_BARE, MP_ME_FULL,
    MU_E_BARE,
    N_E_FOLDS, SPECTRAL_INDEX_NS, TENSOR_TO_SCALAR_R,
    alpha_inv, mp_over_me, arf_audit,
)

# ── Anchor-free scale chain ─────────────────────────────────────────────
from .chain import (
    RHO_LAMBDA_MEV, RHO_LAMBDA_GEV4, LAMBDA_OVER_MPL4,
    M_PL_GEV, V_EW_GEV,
    Y_E, M_E_GEV, M_E_MEV, M_E_EV,
    M_P_GEV, M_P_MEV,
    LAMBDA_QCD_GEV, LAMBDA_QCD_MEV,
    R_PROTON_FM, HBAR_C_GEV_FM,
    chain_audit,
)

# ── Standard Model ───────────────────────────────────────────────────────
from .electroweak import (
    SIN2_THETA_W, ALPHA_INV_MZ,
    M_H_GEV, M_TOP_GEV, LAMBDA_H, A_MU_LEADING,
    SM_GAUGE_BOSON_COUNT, GRAVITON_PLUS_GAUGE,
    GLUON_COUNT, EW_BOSON_COUNT,
    gauge_couplings, m_W_GeV, m_Z_GeV, m_H_chain_GeV,
    electroweak_audit,
)
from .qcd import (
    ALPHA_S_MZ, ETA_QCD,
    N_GLUONS, N_TRACE_SINGLET, A5_COUNT_CHECK,
    f_pi_GeV, m_pi0_GeV, qcd_audit,
)
from .fermions import (
    ETA_LEPTON,
    MU_E_BARE as MU_E_BARE_FERMIONS,
    MU_E_RATIO, TAU_MU_BARE, TAU_MU_RATIO,
    m_u_over_mp, m_d_over_mp, m_s_over_mp,
    m_c_over_mp, m_b_over_mp, m_t_over_mp,
    quark_masses_GeV, M_TOP_INTEGER_GEV,
    r_proton_fm, QUARK_DOUBLETS_BY_EIGENVALUE,
    fermions_audit,
)
from .mixing import (
    SIN_THETA_C, THETA_C_DEG,
    A_CKM, RHO_BAR, ETA_BAR, J_CKM,
    THETA_12_DEG, THETA_13_DEG, THETA_23_DEG,
    DELTA_CP_DEG, DELTA_CP_K4_PART, DELTA_CP_A5_PART,
    m_nu_2_eV, m_nu_3_eV, sum_mnu_meV,
    mixing_audit,
)

# ── Cosmology + inflation + baryogenesis + dark + gravity ───────────────
from .baryogenesis import ETA_B, baryogenesis_audit
from .dark import (
    M_AXION_UEV, AXION_FREQ_GHZ, CATHEDRAL_SPECTRAL_LINE_GHZ,
    m_sterile_keV, m_WIMP_GeV,
    BOHR_RADIUS_M, casimir_fractional_force, CASIMIR_AT_100NM,
    R_MASS, D_35, D_51, EV_TO_HZ,
    dark_audit,
)
from .cosmology import (
    OMEGA_M, OMEGA_LAMBDA, OMEGA_B, OMEGA_DM, SIGMA_8,
    A_S, H0_RATIO_CANONICAL, H0_RATIO_PI_FORM,
    cosmology_audit,
)
from .inflation import N_E, N_S, R_TS, inflation_audit
from .gravity import (
    G_NEWTON, AUT_G13_ORDER, K4_CUBE_VERTICES,
    SPACETIME_DIM, RIEMANN_COMPS, RICCI_COMPS,
    BIANCHI_CONSTRAINTS, PHYSICAL_EFE_COMPS,
    EH_PREFACTOR, LAMBDA_PLANCK4,
    schwarzschild_radius, hawking_temperature,
    bekenstein_hawking_entropy, first_law_black_hole,
    gravity_audit,
)

# ── Periodic table + nuclear shell model + QFT ─────────────────────────
from .periodic_table import (
    ORBITAL_LETTERS, madelung_order, noble_gas_atomic_numbers,
    KNOWN_NOBLE_GASES, periodic_table_audit,
)
from .nuclear import (
    magic_numbers, OBSERVED_MAGIC, nuclear_audit,
)
from .qft import (
    hessian, pole_masses, propagator,
    cubic_coupling_tensor, functional_determinant,
    LAMBDA_SQ_MATCH_OVER_MPL_SQ, qft_audit,
)

# ── Predictions registry ────────────────────────────────────────────────
from .predictions import (
    Prediction, all_predictions, summary,
    print_table, predictions_audit,
)


def all_audits_pass() -> bool:
    """Top-level CI gate — every module's audit passes."""
    audits = [
        foundations_audit,
        graph_audit,
        sectors_audit,
        dynamics_audit,
        vacuum_audit,
        arf_audit,
        chain_audit,
        electroweak_audit,
        qcd_audit,
        fermions_audit,
        mixing_audit,
        baryogenesis_audit,
        dark_audit,
        cosmology_audit,
        inflation_audit,
        gravity_audit,
        periodic_table_audit,
        nuclear_audit,
        qft_audit,
        predictions_audit,
    ]
    failures: list[str] = []
    for a in audits:
        try:
            if not a():
                failures.append(a.__module__ + "." + a.__name__)
        except Exception as ex:
            failures.append(f"{a.__module__}.{a.__name__}: {ex}")
    if failures:
        for f in failures:
            print("FAIL:", f)
        return False
    return True


__version__ = "0.2.0"

__all__ = [
    # foundations
    "D", "q", "V", "E", "F", "G", "N",
    "PHI", "GAMMA",
    "DELTA_STAR", "DELTA_CL", "DELTA",
    "cathedral_integers", "iron_chain",
    # graph & sectors & dynamics
    "adjacency", "laplacian", "spectrum", "cathedral_eigenvalues",
    "K4_SIZE", "A5_SIZE", "SECTOR_RATIO", "ETA_B_PREFACTOR",
    "K4_EIGENVALUES", "A5_EIGENVALUES",
    "TR_L_K4", "TR_L_A5", "TR_L_TOTAL",
    "OMEGA_M_BARE", "OMEGA_L_BARE",
    "sector_decomposition", "sector_power", "sector_ratio_at",
    "ETA", "ETA_L", "MU", "DYNAMICAL_NORMALISATION",
    "urt_step", "urt_evolve",
    "per_mode_contraction", "mixing_time",
    "cathedral_potential", "cathedral_gradient",
    "vacuum_potential_at_rail",
    "matter_direction_margin", "matter_direction_target",
    # ARF
    "D63", "D64", "D79", "D80", "R_ALPHA",
    "ALPHA_INV_BARE", "ALPHA_INV_FULL",
    "MP_ME_BARE", "MP_ME_FULL", "MU_E_BARE",
    "N_E_FOLDS", "SPECTRAL_INDEX_NS", "TENSOR_TO_SCALAR_R",
    "alpha_inv", "mp_over_me",
    # Chain
    "RHO_LAMBDA_MEV", "RHO_LAMBDA_GEV4", "LAMBDA_OVER_MPL4",
    "M_PL_GEV", "V_EW_GEV",
    "Y_E", "M_E_GEV", "M_E_MEV", "M_E_EV",
    "M_P_GEV", "M_P_MEV",
    "LAMBDA_QCD_GEV", "LAMBDA_QCD_MEV",
    "R_PROTON_FM", "HBAR_C_GEV_FM",
    # EW + QCD + fermions + mixing
    "SIN2_THETA_W", "ALPHA_INV_MZ",
    "M_H_GEV", "M_TOP_GEV", "LAMBDA_H", "A_MU_LEADING",
    "SM_GAUGE_BOSON_COUNT", "GRAVITON_PLUS_GAUGE",
    "GLUON_COUNT", "EW_BOSON_COUNT",
    "gauge_couplings", "m_W_GeV", "m_Z_GeV", "m_H_chain_GeV",
    "ALPHA_S_MZ", "ETA_QCD",
    "N_GLUONS", "N_TRACE_SINGLET", "A5_COUNT_CHECK",
    "f_pi_GeV", "m_pi0_GeV",
    "ETA_LEPTON", "MU_E_RATIO", "TAU_MU_BARE", "TAU_MU_RATIO",
    "m_u_over_mp", "m_d_over_mp", "m_s_over_mp",
    "m_c_over_mp", "m_b_over_mp", "m_t_over_mp",
    "quark_masses_GeV", "M_TOP_INTEGER_GEV",
    "r_proton_fm", "QUARK_DOUBLETS_BY_EIGENVALUE",
    "SIN_THETA_C", "THETA_C_DEG",
    "A_CKM", "RHO_BAR", "ETA_BAR", "J_CKM",
    "THETA_12_DEG", "THETA_13_DEG", "THETA_23_DEG",
    "DELTA_CP_DEG", "DELTA_CP_K4_PART", "DELTA_CP_A5_PART",
    "m_nu_2_eV", "m_nu_3_eV", "sum_mnu_meV",
    # dark / cosmology / inflation / gravity
    "ETA_B",
    "M_AXION_UEV", "AXION_FREQ_GHZ", "CATHEDRAL_SPECTRAL_LINE_GHZ",
    "m_sterile_keV", "m_WIMP_GeV",
    "BOHR_RADIUS_M", "casimir_fractional_force", "CASIMIR_AT_100NM",
    "R_MASS", "D_35", "D_51", "EV_TO_HZ",
    "OMEGA_M", "OMEGA_LAMBDA", "OMEGA_B", "OMEGA_DM", "SIGMA_8",
    "A_S", "H0_RATIO_CANONICAL", "H0_RATIO_PI_FORM",
    "N_E", "N_S", "R_TS",
    "G_NEWTON", "AUT_G13_ORDER", "K4_CUBE_VERTICES",
    "SPACETIME_DIM", "RIEMANN_COMPS", "RICCI_COMPS",
    "BIANCHI_CONSTRAINTS", "PHYSICAL_EFE_COMPS",
    "EH_PREFACTOR", "LAMBDA_PLANCK4",
    "schwarzschild_radius", "hawking_temperature",
    "bekenstein_hawking_entropy", "first_law_black_hole",
    # periodic table + nuclear + QFT
    "ORBITAL_LETTERS", "madelung_order", "noble_gas_atomic_numbers",
    "KNOWN_NOBLE_GASES",
    "magic_numbers", "OBSERVED_MAGIC",
    "hessian", "pole_masses", "propagator",
    "cubic_coupling_tensor", "functional_determinant",
    "LAMBDA_SQ_MATCH_OVER_MPL_SQ",
    # registry
    "Prediction", "all_predictions", "summary",
    "print_table",
    # top-level gate
    "all_audits_pass",
    "__version__",
]
