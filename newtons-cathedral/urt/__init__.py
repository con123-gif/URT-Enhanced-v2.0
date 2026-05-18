"""
Newton's Cathedral — a fresh derivation of physics from D = 3.

The iron chain:

    D = 3                  spatial dimension (input)
    A_5 unique             Jordan 1870 (only non-cyclic simple subgroup of SO(3))
    q = D + 2 = 5          5-fold rotations
    V, E, F = 12, 30, 20   icosahedral counts
    G = (D+1)·D·q = 60     |A_5|
    N = D² + D + 1 = 13    centred-icosahedral closure
    γ = D^{-(D+1)} = 1/81  self-referential entropy
    φ = (1 + √5)/2          golden ratio (A_5 character-table)
    δ★ = (1−γ)π/(N·φ)      vacuum fixed point

Every prediction in this framework is a closed form in these quantities.

CI top-level gate:

    from urt import all_audits_pass
    assert all_audits_pass()

The 27 predictions in `predictions.all_predictions()` reproduce CODATA,
PDG, and Planck 2018 to median 0.08 % relative error.
"""
from __future__ import annotations

# ── Foundations ──────────────────────────────────────────────────────────
from .foundations import (
    D, q, V, E, F, G, N,
    PHI, GAMMA,
    DELTA_STAR, DELTA_CL, DELTA,
    cathedral_integers, iron_chain, foundations_audit,
)

# ── Graph + dynamics ─────────────────────────────────────────────────────
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

# ── Standard Model ───────────────────────────────────────────────────────
from .arf import (
    D63, D64, D79, D80, R_ALPHA,
    ALPHA_INV_BARE, ALPHA_INV_FULL,
    MP_ME_BARE, MP_ME_FULL,
    MU_E_BARE,
    N_E_FOLDS, SPECTRAL_INDEX_NS, TENSOR_TO_SCALAR_R,
    alpha_inv, mp_over_me, arf_audit,
)
from .electroweak import (
    SIN2_THETA_W, M_H_GEV, M_TOP_GEV, A_MU_LEADING,
    SM_GAUGE_BOSON_COUNT, GRAVITON_PLUS_GAUGE,
    GLUON_COUNT, EW_BOSON_COUNT,
    electroweak_audit,
)
from .qcd import (
    ALPHA_S_MZ, N_GLUONS, N_TRACE_SINGLET, A5_COUNT_CHECK, qcd_audit,
)
from .fermions import (
    ETA_MIX,
    MU_E_RATIO, TAU_MU_BARE, TAU_MU_RATIO,
    R_PROTON_FM, HBAR_C_GEV_FM, M_PROTON_GEV,
    QUARK_DOUBLETS_BY_EIGENVALUE, fermions_audit,
)
from .mixing import (
    SIN_THETA_C, THETA_C_DEG,
    THETA_12_DEG, THETA_13_DEG, THETA_23_DEG,
    DELTA_CP_DEG, DELTA_CP_K4_PART, DELTA_CP_A5_PART,
    mixing_audit,
)

# ── Cosmology / inflation / baryogenesis / dark ─────────────────────────
from .baryogenesis import ETA_B, baryogenesis_audit
from .dark import (
    M_AXION_UEV, M_STERILE_KEV, M_STERILE_HALF_KEV, M_WIMP_GEV,
    AXION_FREQ_GHZ, CATHEDRAL_SPECTRAL_LINE_GHZ,
    casimir_fractional_force, CASIMIR_AT_100NM,
    dark_audit,
)
from .cosmology import (
    OMEGA_M, OMEGA_LAMBDA, LAMBDA_OVER_MPL4, A_S, H0_RATIO,
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

# ── Predictions registry ────────────────────────────────────────────────
from .predictions import (
    Prediction, all_predictions, summary,
    print_table, predictions_audit,
)


def all_audits_pass() -> bool:
    """Single top-level CI gate — every module's audit passes."""
    audits = [
        foundations_audit,
        graph_audit,
        sectors_audit,
        dynamics_audit,
        vacuum_audit,
        arf_audit,
        electroweak_audit,
        qcd_audit,
        fermions_audit,
        mixing_audit,
        baryogenesis_audit,
        dark_audit,
        cosmology_audit,
        inflation_audit,
        gravity_audit,
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


__version__ = "0.1.0"

__all__ = [
    # foundations
    "D", "q", "V", "E", "F", "G", "N",
    "PHI", "GAMMA",
    "DELTA_STAR", "DELTA_CL", "DELTA",
    "cathedral_integers", "iron_chain",
    # graph & sectors
    "adjacency", "laplacian", "spectrum", "cathedral_eigenvalues",
    "K4_SIZE", "A5_SIZE", "SECTOR_RATIO", "ETA_B_PREFACTOR",
    "K4_EIGENVALUES", "A5_EIGENVALUES",
    "TR_L_K4", "TR_L_A5", "TR_L_TOTAL",
    "OMEGA_M_BARE", "OMEGA_L_BARE",
    "sector_decomposition", "sector_power", "sector_ratio_at",
    # dynamics
    "ETA", "ETA_L", "MU",
    "DYNAMICAL_NORMALISATION",
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
    # SM
    "SIN2_THETA_W", "M_H_GEV", "M_TOP_GEV", "A_MU_LEADING",
    "SM_GAUGE_BOSON_COUNT", "GRAVITON_PLUS_GAUGE",
    "GLUON_COUNT", "EW_BOSON_COUNT",
    "ALPHA_S_MZ", "N_GLUONS",
    "ETA_MIX", "MU_E_RATIO", "TAU_MU_BARE", "TAU_MU_RATIO",
    "R_PROTON_FM", "HBAR_C_GEV_FM", "M_PROTON_GEV",
    "QUARK_DOUBLETS_BY_EIGENVALUE",
    "SIN_THETA_C", "THETA_C_DEG",
    "THETA_12_DEG", "THETA_13_DEG", "THETA_23_DEG",
    "DELTA_CP_DEG", "DELTA_CP_K4_PART", "DELTA_CP_A5_PART",
    # dark sector
    "ETA_B",
    "M_AXION_UEV", "M_STERILE_KEV", "M_STERILE_HALF_KEV", "M_WIMP_GEV",
    "AXION_FREQ_GHZ", "CATHEDRAL_SPECTRAL_LINE_GHZ",
    "casimir_fractional_force", "CASIMIR_AT_100NM",
    # cosmology + inflation + gravity
    "OMEGA_M", "OMEGA_LAMBDA", "LAMBDA_OVER_MPL4", "A_S", "H0_RATIO",
    "N_E", "N_S", "R_TS",
    "G_NEWTON", "AUT_G13_ORDER", "K4_CUBE_VERTICES",
    "SPACETIME_DIM", "RIEMANN_COMPS", "RICCI_COMPS",
    "BIANCHI_CONSTRAINTS", "PHYSICAL_EFE_COMPS",
    "EH_PREFACTOR", "LAMBDA_PLANCK4",
    "schwarzschild_radius", "hawking_temperature",
    "bekenstein_hawking_entropy", "first_law_black_hole",
    # registry
    "Prediction", "all_predictions", "summary",
    "print_table",
    # top-level gate
    "all_audits_pass",
    "__version__",
]
