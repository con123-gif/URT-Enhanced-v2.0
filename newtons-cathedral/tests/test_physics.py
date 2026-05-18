"""Standard Model + cosmology + dark sector + gravity."""
from urt.baryogenesis import ETA_B, baryogenesis_audit
from urt.cosmology import (
    A_S, H0_RATIO, LAMBDA_OVER_MPL4, OMEGA_LAMBDA, OMEGA_M, cosmology_audit,
)
from urt.dark import (
    CASIMIR_AT_100NM, CATHEDRAL_SPECTRAL_LINE_GHZ, D_35, D_51,
    M_AXION_UEV, M_STERILE_KEV, M_WIMP_GEV, R_MASS, dark_audit,
)
from urt.electroweak import (
    A_MU_LEADING, M_H_GEV, M_TOP_GEV, SIN2_THETA_W,
    SM_GAUGE_BOSON_COUNT, electroweak_audit,
)
from urt.fermions import (
    M_TOP_GEV as M_TOP_FERMIONS, MU_E_RATIO, R_PROTON_FM, fermions_audit,
)
from urt.foundations import D, F, G, N, V, q
from urt.gravity import (
    AUT_G13_ORDER, BIANCHI_CONSTRAINTS, G_NEWTON, PHYSICAL_EFE_COMPS,
    RIEMANN_COMPS, SPACETIME_DIM, gravity_audit,
)
from urt.inflation import N_E, N_S, R_TS, inflation_audit
from urt.mixing import (
    DELTA_CP_DEG, DELTA_CP_K4_PART, DELTA_CP_A5_PART,
    SIN_THETA_C, THETA_12_DEG, THETA_13_DEG, mixing_audit,
)
from urt.qcd import ALPHA_S_MZ, N_GLUONS, qcd_audit


# ── Electroweak ─────────────────────────────────────────────────────────
def test_weinberg_angle_matches_pdg():
    assert abs(SIN2_THETA_W - 0.23122) < 1e-4

def test_higgs_mass_is_q_cubed():
    assert M_H_GEV == q ** D == 125

def test_top_mass_is_n_plus_1_v_plus_q():
    assert M_TOP_GEV == (N + 1) * V + q == 173

def test_a_mu_leading_matches_schwinger():
    # a_µ ≈ 1.1614e-3 to leading order in α.
    assert abs(A_MU_LEADING - 1.1614e-3) < 1e-6

def test_sm_gauge_boson_count_is_V():
    assert SM_GAUGE_BOSON_COUNT == V == 12

def test_electroweak_audit():
    assert electroweak_audit()


# ── QCD ─────────────────────────────────────────────────────────────────
def test_alpha_s_closed_form():
    from urt.foundations import DELTA_STAR
    assert ALPHA_S_MZ == DELTA_STAR * (q - 1) / q

def test_gluon_count_eight():
    assert N_GLUONS == D * D - 1 == 8

def test_qcd_audit():
    assert qcd_audit()


# ── Mixing ──────────────────────────────────────────────────────────────
def test_delta_cp_is_197():
    assert DELTA_CP_DEG == 197
    assert DELTA_CP_K4_PART + DELTA_CP_A5_PART == DELTA_CP_DEG

def test_cathedral_bridge_alpha_a5_delta_cp():
    # 137 + 60 = 197 — bridge between QED, |A_5|, and leptonic CP.
    assert 137 + 60 == DELTA_CP_DEG

def test_pmns_angles_match_nufit():
    assert abs(THETA_12_DEG - 33.44) < 0.5
    assert abs(THETA_13_DEG - 8.57) < 0.2

def test_cabibbo_angle_pdg():
    assert abs(SIN_THETA_C - 0.22500) < 1e-3

def test_mixing_audit():
    assert mixing_audit()


# ── Fermions ────────────────────────────────────────────────────────────
def test_mu_e_ratio_codata():
    assert abs(MU_E_RATIO - 206.7682830) < 1e-3

def test_proton_radius_codata():
    assert abs(R_PROTON_FM - 0.8409) < 1e-3

def test_top_mass_consistent_across_modules():
    assert M_TOP_FERMIONS == M_TOP_GEV

def test_fermions_audit():
    assert fermions_audit()


# ── Baryogenesis ────────────────────────────────────────────────────────
def test_eta_b_matches_planck():
    assert abs(ETA_B - 6.12e-10) / 6.12e-10 < 5e-3

def test_eta_b_decomposition_into_sector_ratio():
    from urt.foundations import DELTA, DELTA_STAR, GAMMA
    from urt.sectors import ETA_B_PREFACTOR
    expected = GAMMA ** 3 * DELTA * DELTA_STAR * ETA_B_PREFACTOR
    assert abs(ETA_B - expected) < 1e-25

def test_baryogenesis_audit():
    assert baryogenesis_audit()


# ── Dark sector ─────────────────────────────────────────────────────────
def test_axion_mass_from_a5_residue():
    # Derived from R_mass; not hardcoded.
    assert 50.0 < M_AXION_UEV < 100.0

def test_sterile_neutrino_mass_from_gamma_squared():
    from urt.dark import M_PROTON_KEV
    from urt.foundations import GAMMA
    assert M_STERILE_KEV == GAMMA ** 2 * M_PROTON_KEV

def test_wimp_mass_from_delta_star_mz():
    from urt.dark import M_Z_GEV
    from urt.foundations import DELTA_STAR
    assert M_WIMP_GEV == DELTA_STAR * M_Z_GEV

def test_casimir_uses_sector_ratio_exactly():
    from urt.dark import BOHR_RADIUS_M
    from urt.sectors import SECTOR_RATIO
    expected = (BOHR_RADIUS_M / 1e-7) ** 2 * SECTOR_RATIO
    assert abs(CASIMIR_AT_100NM - expected) < 1e-15

def test_d35_d51_are_pentagonal():
    # P_q = 35, P_{q+1} = 51.
    assert D_35 == q * (3 * q - 1) // 2 == 35
    assert D_51 == (q + 1) * (3 * (q + 1) - 1) // 2 == 51

def test_r_mass_is_in_a5_range():
    # R_mass is the A_5 phase residue; magnitude ~ 2.4.
    assert -3.0 < R_MASS < -2.0

def test_dark_audit():
    assert dark_audit()


# ── Cosmology ───────────────────────────────────────────────────────────
def test_omega_m_planck_match():
    assert abs(OMEGA_M - 0.3158) < 0.005

def test_omegas_sum_to_one():
    assert abs(OMEGA_M + OMEGA_LAMBDA - 1.0) < 1e-15

def test_lambda_planck_units():
    assert abs(LAMBDA_OVER_MPL4 - 1.35e-123) / 1.35e-123 < 1e-2

def test_scalar_amplitude_planck_match():
    assert abs(A_S - 2.10e-9) / 2.10e-9 < 2e-2

def test_h0_ratio_hubble_tension():
    # Cathedral prediction within 1.1 % of observed tension.
    observed = 73.04 / 67.36
    assert abs(H0_RATIO - observed) / observed < 1.2e-2

def test_cosmology_audit():
    assert cosmology_audit()


# ── Inflation ───────────────────────────────────────────────────────────
def test_n_e_folds_57():
    assert N_E == G - D == 57

def test_spectral_index_planck_match():
    assert abs(N_S - 0.9649) < 1e-3

def test_tensor_to_scalar_below_bound():
    assert R_TS == 12 / N_E ** 2
    assert R_TS < 0.036

def test_inflation_audit():
    assert inflation_audit()


# ── Gravity ─────────────────────────────────────────────────────────────
def test_g_newton_is_delta_star_squared():
    from urt.foundations import DELTA_STAR
    assert G_NEWTON == DELTA_STAR ** 2

def test_aut_g13_order_768():
    assert AUT_G13_ORDER == V * (D + 1) ** D == 768

def test_riemann_components_are_F():
    assert RIEMANN_COMPS == F == 20

def test_spacetime_dim_is_D_plus_1():
    assert SPACETIME_DIM == D + 1 == 4

def test_physical_efe_components_is_V_over_2():
    assert PHYSICAL_EFE_COMPS == V // 2 == 6

def test_gravity_audit():
    assert gravity_audit()
