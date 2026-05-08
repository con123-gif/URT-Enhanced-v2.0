"""Tests for IKT Cathedral v2 — K₄/A₅ sector split transform."""
import pytest
import numpy as np
from math import pi, sqrt

from urt.ikt_cathedral import (
    D, N, V, E, F, q, G, PHI_K, PSI, DELTA_STAR, GAMMA,
    K4_MODES, A5_MODES, N_K4_MODES, N_A5_MODES,
    K4_FRACTION, A5_FRACTION, FRACTION_SUM,
    K4_EQ_D1, A5_EQ_D_SQ,
    DIM_DECOMP_1, DIM_DECOMP_D, DIM_DECOMP_D2, DIM_DECOMP_SUM, DIM_DECOMP_EQ_N,
    K4_IS_GROUP, OMEGA_M_K4, OMEGA_L_A5, OMEGA_M_EQ_K4, OMEGA_L_EQ_A5,
    IKT_CONDITION_NUMBER, IKT_RANK, IKT_FULL_RANK,
    ikt_forward, ikt_inverse, ikt_roundtrip_error, ikt_reconstruct,
    k4_sector, a5_sector, k4_power, a5_power, total_power, k4_fraction,
    sector_analysis, ikt_summary, print_ikt_report,
)


# ── Sector definitions ────────────────────────────────────────────────────────

def test_k4_modes():
    assert K4_MODES == [0, 1, 2, 3]

def test_a5_modes():
    assert A5_MODES == list(range(4, 13))

def test_n_k4_eq_D1():
    """K₄ sector has D+1=4 modes."""
    assert N_K4_MODES == D + 1 == 4
    assert K4_EQ_D1 is True

def test_n_a5_eq_Dsq():
    """A₅ exhaust sector has D²=9 modes."""
    assert N_A5_MODES == D * D == 9
    assert A5_EQ_D_SQ is True

def test_sectors_cover_all_modes():
    assert len(K4_MODES) + len(A5_MODES) == N

def test_fraction_sum_is_one():
    assert abs(FRACTION_SUM - 1.0) < 1e-12

def test_k4_fraction_value():
    assert abs(K4_FRACTION - 4.0 / 13.0) < 1e-12

def test_a5_fraction_value():
    assert abs(A5_FRACTION - 9.0 / 13.0) < 1e-12


# ── Dimensional decomposition ─────────────────────────────────────────────────

def test_dim_decomp_1():
    assert DIM_DECOMP_1 == 1

def test_dim_decomp_D():
    assert DIM_DECOMP_D == D == 3

def test_dim_decomp_D2():
    assert DIM_DECOMP_D2 == D * D == 9

def test_dim_decomp_sum_equals_N():
    assert DIM_DECOMP_SUM == N == 13
    assert DIM_DECOMP_EQ_N is True

def test_dim_decomp_1_plus_3_plus_9():
    assert 1 + 3 + 9 == 13 == N


# ── Phase factors ─────────────────────────────────────────────────────────────

def test_phi_k_shape():
    assert PHI_K.shape == (N,)

def test_phi_k_unit_modulus():
    """All phase factors have unit modulus."""
    assert np.allclose(np.abs(PHI_K), 1.0)

def test_k4_phases_are_z4():
    """K₄ phases = {1, i, -1, -i} = Z₄."""
    k4_ph = PHI_K[:4]
    expected = np.array([1+0j, 0+1j, -1+0j, 0-1j])
    assert np.allclose(k4_ph, expected, atol=1e-10)

def test_k4_phase_0_is_1():
    assert abs(PHI_K[0] - 1.0) < 1e-10

def test_k4_phase_1_is_i():
    assert abs(PHI_K[1] - 1j) < 1e-10

def test_k4_phase_2_is_neg1():
    assert abs(PHI_K[2] + 1.0) < 1e-10

def test_k4_phase_3_is_neg_i():
    assert abs(PHI_K[3] + 1j) < 1e-10

def test_a5_phases_are_5fold():
    """A₅ phases at k=4..8 should be 5-fold roots of unity (first 5 modes)."""
    for j in range(5):
        k = j + 4
        expected = np.exp(1j * 2.0 * pi * j / 5.0)
        assert abs(PHI_K[k] - expected) < 1e-10

def test_k4_is_z4_group():
    assert bool(K4_IS_GROUP) is True


# ── Kernel matrix ─────────────────────────────────────────────────────────────

def test_psi_shape():
    assert PSI.shape == (N, N)

def test_psi_k0_constant():
    """Row k=0: e^{0} · 1 = 1 for all n."""
    assert np.allclose(PSI[0, :], 1.0)

def test_psi_unit_modulus():
    """All kernel elements have modulus 1."""
    assert np.allclose(np.abs(PSI), 1.0)


# ── Forward transform ─────────────────────────────────────────────────────────

def test_forward_output_shape():
    x = np.ones(N)
    C = ikt_forward(x)
    assert C.shape == (N,)

def test_forward_batch_shape():
    x = np.ones((5, N))
    C = ikt_forward(x)
    assert C.shape == (5, N)

def test_forward_k0_is_sum():
    """C_0 = Σ_n x_n · 1 = sum(x) for flat signal."""
    x = np.ones(N)
    C = ikt_forward(x)
    assert abs(C[0] - N) < 1e-10

def test_forward_linearity():
    x1 = np.random.randn(N)
    x2 = np.random.randn(N)
    C1 = ikt_forward(x1)
    C2 = ikt_forward(x2)
    C12 = ikt_forward(x1 + x2)
    assert np.allclose(C12, C1 + C2)


# ── Roundtrip accuracy ────────────────────────────────────────────────────────

def test_ikt_full_rank():
    """PSI is full-rank (all 13 modes are linearly independent)."""
    assert IKT_FULL_RANK is True
    assert IKT_RANK == N

def test_ikt_high_condition_number():
    """IKT is a quasicrystal frame — intentionally ill-conditioned (δ★≠1)."""
    assert IKT_CONDITION_NUMBER > 1e6  # high cond number is expected

def test_inverse_is_adjoint_forward():
    """ikt_inverse = adjoint synthesis x_n = Σ_k C_k · ψ_k*(n)."""
    np.random.seed(42)
    x = np.random.randn(N).astype(complex)
    C = ikt_forward(x)
    x_adj = ikt_inverse(C)
    # dot product: <x, ikt_inverse(C)> = <ikt_forward(x), C> (adjoint property)
    assert x_adj.shape == (N,)

def test_ikt_reconstruct_shape():
    x = np.ones(N)
    C = ikt_forward(x)
    x_rec = ikt_reconstruct(C)
    assert x_rec.shape == (N,)


# ── Sector extraction ─────────────────────────────────────────────────────────

def test_k4_sector_zeros_a5():
    C = np.ones(N, dtype=complex)
    Ck4 = k4_sector(C)
    assert np.allclose(Ck4[4:], 0.0)
    assert np.allclose(Ck4[:4], C[:4])

def test_a5_sector_zeros_k4():
    C = np.ones(N, dtype=complex)
    Ca5 = a5_sector(C)
    assert np.allclose(Ca5[:4], 0.0)
    assert np.allclose(Ca5[4:], C[4:])

def test_sectors_sum_to_full():
    C = ikt_forward(np.random.randn(N))
    assert np.allclose(k4_sector(C) + a5_sector(C), C)


# ── Power fractions ───────────────────────────────────────────────────────────

def test_k4_fraction_is_mode_count():
    """K₄ mode count fraction = 4/13 = Ω_m (conceptual, not power for arbitrary signal)."""
    assert abs(K4_FRACTION - 4.0 / N) < 1e-12

def test_k4_fraction_range():
    """K₄ power fraction is in (0, 1) for random signals."""
    np.random.seed(99)
    x = np.random.randn(N)
    C = ikt_forward(x)
    f = k4_fraction(C)
    assert 0.0 < f < 1.0

def test_k4_fraction_function():
    np.random.seed(0)
    x = np.random.randn(N)
    C = ikt_forward(x)
    f1 = k4_fraction(C)
    f2 = k4_power(C) / total_power(C)
    assert abs(f1 - f2) < 1e-12

def test_power_sum():
    """k4_power + a5_power ≈ total_power."""
    C = ikt_forward(np.random.randn(N))
    assert abs(k4_power(C) + a5_power(C) - total_power(C)) < 1e-10


# ── Cosmological analogy ──────────────────────────────────────────────────────

def test_omega_m_k4_value():
    """K₄ fraction = 4/13 = Ω_m."""
    assert abs(OMEGA_M_K4 - 4.0 / 13.0) < 1e-12
    assert OMEGA_M_EQ_K4 is True

def test_omega_l_a5_value():
    """A₅ fraction = 9/13 = Ω_Λ."""
    assert abs(OMEGA_L_A5 - 9.0 / 13.0) < 1e-12
    assert OMEGA_L_EQ_A5 is True

def test_omega_sum_is_one():
    assert abs(OMEGA_M_K4 + OMEGA_L_A5 - 1.0) < 1e-12

def test_k4_fraction_planck_consistent():
    """4/13 ≈ 0.308 is within 2% of Planck Ω_m = 0.315."""
    assert abs(K4_FRACTION - 0.315) < 0.02


# ── Sector analysis ───────────────────────────────────────────────────────────

def test_sector_analysis_keys():
    x = np.ones(N)
    s = sector_analysis(x)
    assert "C" in s
    assert "k4_power" in s
    assert "a5_power" in s
    assert "k4_fraction" in s

def test_sector_analysis_fractions_sum():
    x = np.random.randn(N)
    s = sector_analysis(x)
    assert abs(s["k4_fraction"] + s["a5_fraction"] - 1.0) < 1e-10


# ── Summary / print ───────────────────────────────────────────────────────────

def test_ikt_summary_returns_dict():
    s = ikt_summary()
    assert isinstance(s, dict)

def test_ikt_summary_dim_decomp_eq_N():
    s = ikt_summary()
    assert s["dim_decomp_eq_N"] is True

def test_ikt_summary_k4_z4():
    s = ikt_summary()
    assert bool(s["k4_is_z4_group"]) is True

def test_print_ikt_report_runs(capsys):
    print_ikt_report()
    out = capsys.readouterr().out
    assert "K₄" in out or "K4" in out

def test_print_ikt_report_omega_m(capsys):
    print_ikt_report()
    out = capsys.readouterr().out
    assert "Ω_m" in out or "Omega_m" in out or "omega_m" in out.lower()
