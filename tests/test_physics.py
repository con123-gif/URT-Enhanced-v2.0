"""Standard Model + cosmology + dark sector + gravity."""
from newtons_cathedral.baryogenesis import ETA_B, baryogenesis_audit
from newtons_cathedral.chain import (
    M_E_MEV, M_P_GEV, M_P_MEV, V_EW_GEV, chain_audit,
)
from newtons_cathedral.cosmology import (
    A_S, H0_RATIO_CANONICAL, LAMBDA_OVER_MPL4, OMEGA_B, OMEGA_LAMBDA,
    OMEGA_M, SIGMA_8, cosmology_audit,
)
from newtons_cathedral.dark import (
    CASIMIR_AT_100NM, CATHEDRAL_SPECTRAL_LINE_GHZ, D_35, D_51,
    M_AXION_UEV, R_MASS, dark_audit, m_sterile_keV, m_WIMP_GeV,
)
from newtons_cathedral.electroweak import (
    A_MU_LEADING, M_H_GEV, M_TOP_GEV, SIN2_THETA_W,
    SM_GAUGE_BOSON_COUNT, electroweak_audit, m_W_GeV, m_Z_GeV,
)
from newtons_cathedral.fermions import (
    M_TOP_INTEGER_GEV, MU_E_RATIO, fermions_audit,
    quark_masses_GeV, r_proton_fm,
)
from newtons_cathedral.foundations import D, F, G, N, V, q
from newtons_cathedral.gravity import (
    AUT_G13_ORDER, G_NEWTON, PHYSICAL_EFE_COMPS,
    RIEMANN_COMPS, SPACETIME_DIM, gravity_audit,
)
from newtons_cathedral.inflation import N_E, N_S, R_TS, inflation_audit
from newtons_cathedral.mixing import (
    A_CKM, DELTA_CP_A5_PART, DELTA_CP_DEG, DELTA_CP_K4_PART,
    SIN_THETA_C, THETA_12_DEG, THETA_13_DEG, mixing_audit,
)
from newtons_cathedral.qcd import (
    ALPHA_S_MZ, N_GLUONS, f_pi_GeV, m_pi0_GeV, qcd_audit,
)
from newtons_cathedral.nuclear import (
    OBSERVED_MAGIC, magic_numbers, nuclear_audit,
)
from newtons_cathedral.periodic_table import (
    KNOWN_NOBLE_GASES, noble_gas_atomic_numbers, periodic_table_audit,
)


# ── Anchor-free scale chain ─────────────────────────────────────────────
def test_chain_m_e_codata():
    assert abs(M_E_MEV - 0.5109989) / 0.5109989 < 1e-3

def test_chain_m_p_codata():
    assert abs(M_P_MEV - 938.272) / 938.272 < 1e-3

def test_chain_v_EW_PDG():
    assert abs(V_EW_GEV - 246.22) / 246.22 < 1e-3

def test_chain_audit():
    assert chain_audit()


# ── Electroweak ─────────────────────────────────────────────────────────
def test_weinberg_angle_matches_pdg():
    assert abs(SIN2_THETA_W - 0.23122) < 1e-4

def test_higgs_mass_is_q_cubed():
    assert M_H_GEV == q ** D == 125

def test_top_mass_is_n_plus_1_v_plus_q():
    assert M_TOP_GEV == (N + 1) * V + q == 173

def test_a_mu_leading_matches_schwinger():
    assert abs(A_MU_LEADING - 1.1614e-3) < 1e-6

def test_sm_gauge_boson_count_is_V():
    assert SM_GAUGE_BOSON_COUNT == V == 12

def test_chain_m_W_PDG():
    assert abs(m_W_GeV(V_EW_GEV) - 80.379) / 80.379 < 5e-3

def test_chain_m_Z_PDG():
    assert abs(m_Z_GeV(V_EW_GEV) - 91.188) / 91.188 < 5e-3

def test_electroweak_audit():
    assert electroweak_audit()


# ── QCD ─────────────────────────────────────────────────────────────────
def test_alpha_s_closed_form():
    from newtons_cathedral.foundations import DELTA_STAR
    assert ALPHA_S_MZ == DELTA_STAR * (q - 1) / q

def test_gluon_count_eight():
    assert N_GLUONS == D * D - 1 == 8

def test_f_pi_PDG():
    assert abs(f_pi_GeV(M_P_GEV) * 1e3 - 92.4) / 92.4 < 1e-2

def test_m_pi0_PDG():
    assert abs(m_pi0_GeV(M_P_GEV) * 1e3 - 134.977) / 134.977 < 1e-3

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
    assert abs(THETA_12_DEG - 33.41) < 0.5
    assert abs(THETA_13_DEG - 8.54) < 0.2

def test_cabibbo_angle_pdg():
    assert abs(SIN_THETA_C - 0.22500) < 1e-3

def test_ckm_A_PDG():
    assert abs(A_CKM - 0.836) / 0.836 < 1e-2

def test_mixing_audit():
    assert mixing_audit()


# ── Fermions ────────────────────────────────────────────────────────────
def test_mu_e_ratio_codata():
    assert abs(MU_E_RATIO - 206.7682830) < 1e-3

def test_top_mass_integer_consistent():
    assert M_TOP_INTEGER_GEV == M_TOP_GEV == 173

def test_chain_proton_radius_codata():
    assert abs(r_proton_fm(M_P_GEV) - 0.8409) / 0.8409 < 1e-3

def test_chain_six_quarks_under_3pct():
    qm = quark_masses_GeV(M_P_GEV)
    targets = {"u": 2.16e-3, "d": 4.67e-3, "s": 93.4e-3,
               "c": 1.27, "b": 4.18, "t": 172.69}
    for sym, pdg_gev in targets.items():
        rel = abs(qm[sym] - pdg_gev) / pdg_gev
        # u/d at PDG ~25 % uncertainty, others sub-1 %.
        tol = 0.03 if sym in ("u", "d") else 0.01
        assert rel < tol, f"{sym}: rel={rel}"

def test_fermions_audit():
    assert fermions_audit()


# ── Baryogenesis ────────────────────────────────────────────────────────
def test_eta_b_matches_planck():
    assert abs(ETA_B - 6.10e-10) / 6.10e-10 < 1e-3

def test_eta_b_uses_sector_ratio():
    from math import pi
    from newtons_cathedral.foundations import DELTA, DELTA_STAR, GAMMA
    from newtons_cathedral.sectors import ETA_B_PREFACTOR
    expected = (GAMMA ** 3 * DELTA * DELTA_STAR * ETA_B_PREFACTOR
                * (1.0 - DELTA_STAR ** 2 / pi))
    assert abs(ETA_B - expected) < 1e-25

def test_baryogenesis_audit():
    assert baryogenesis_audit()


# ── Dark sector ─────────────────────────────────────────────────────────
def test_axion_mass_from_a5_residue():
    assert 50.0 < M_AXION_UEV < 100.0

def test_sterile_neutrino_chain():
    from newtons_cathedral.foundations import GAMMA
    assert m_sterile_keV(M_P_GEV) == GAMMA ** 2 * M_P_GEV * 1e6

def test_wimp_chain():
    from newtons_cathedral.foundations import DELTA_STAR
    mZ = m_Z_GeV(V_EW_GEV)
    assert m_WIMP_GeV(mZ) == DELTA_STAR * mZ

def test_casimir_uses_sector_ratio_exactly():
    from newtons_cathedral.dark import BOHR_RADIUS_M
    from newtons_cathedral.sectors import SECTOR_RATIO
    expected = (BOHR_RADIUS_M / 1e-7) ** 2 * SECTOR_RATIO
    assert abs(CASIMIR_AT_100NM - expected) < 1e-15

def test_d35_d51_are_pentagonal():
    assert D_35 == q * (3 * q - 1) // 2 == 35
    assert D_51 == (q + 1) * (3 * (q + 1) - 1) // 2 == 51

def test_r_mass_is_in_a5_range():
    assert -3.0 < R_MASS < -2.0

def test_dark_audit():
    assert dark_audit()


# ── Cosmology ───────────────────────────────────────────────────────────
def test_omega_m_planck_match():
    assert abs(OMEGA_M - 0.3158) < 0.005

def test_omega_b_planck_match():
    assert abs(OMEGA_B - 0.0493) / 0.0493 < 5e-3

def test_sigma_8_planck_match():
    assert abs(SIGMA_8 - 0.8111) / 0.8111 < 1e-3

def test_omegas_sum_to_one():
    assert abs(OMEGA_M + OMEGA_LAMBDA - 1.0) < 1e-15

def test_lambda_planck_units():
    assert abs(LAMBDA_OVER_MPL4 - 1.35e-123) / 1.35e-123 < 1e-2

def test_scalar_amplitude_planck_match():
    assert abs(A_S - 2.10e-9) / 2.10e-9 < 2e-2

def test_h0_ratio_hubble_tension():
    observed = 73.04 / 67.36
    assert abs(H0_RATIO_CANONICAL - observed) / observed < 5e-3

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
    from newtons_cathedral.foundations import DELTA_STAR
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


# ── Periodic table + nuclear ────────────────────────────────────────────
def test_periodic_table_reproduces_seven_noble_gases():
    predicted = noble_gas_atomic_numbers()
    for z in KNOWN_NOBLE_GASES:
        assert z in predicted, f"noble gas {z} missing"
    # Next prediction: Z = 168.
    assert 168 in predicted

def test_nuclear_reproduces_seven_magic_numbers():
    predicted = magic_numbers()
    for m in OBSERVED_MAGIC:
        assert m in predicted, f"magic number {m} missing"
    # Next prediction: 184 (island of stability).
    assert 184 in predicted

def test_periodic_table_audit():
    assert periodic_table_audit()

def test_nuclear_audit():
    assert nuclear_audit()
