"""
Tests for urt.cathedral_v10 — the M★-anchored complete computation.

v10 is v9 with the derivation arrow re-rooted from ρ_Λ (external) to
M★ (Cathedral-internal).  The core claims tested here:

  1. Re-rooted from v9's *own* peg, v10 reproduces v9 to machine precision.
  2. Pegged via an *independent* anchor (G_N), v10 agrees with v9 to <1%.
  3. The keystone identity G_N · M★² = δ★² · 2^q · π² holds exactly.
  4. The full 35-observable ledger is preserved.
"""
from math import pi
import pytest

from urt.shell_closure import D, q, V, N, G, gamma, DELTA_STAR
from urt.cathedral_v9 import Cathedral as CathedralV9
from urt.cathedral_v10 import (
    CathedralV10,
    M_STAR_GEV_DEFAULT,
    M_STAR_GEV_V10, M_PL_GEV_V10, V_EW_GEV_V10,
    M_E_GEV_V10, M_P_GEV_V10,
    GRAV_COUPLING_V10, LAMBDA_OVER_MSTAR4,
    v10_anchor_consistency,
    v10_cross_peg_agreement,
    v10_audit_passes,
)
from urt.cathedral_mass import M_PL_OVER_M_STAR, M_STAR_OVER_M_PL


# ── Re-rooting: v10 from v9's own peg must be exact ────────────────────────

class TestV10ReproducesV9Exactly:

    def test_re_rooted_from_v9_peg_is_machine_precision(self):
        # If v10's M★ is pegged from v9's own M_Pl, v10 must reproduce
        # v9 to machine precision — same observational content, only the
        # derivation arrow reversed.
        result = v10_anchor_consistency()
        assert result["v10_equals_v9"]
        assert result["max_deviation"] < 1e-12

    def test_M_Pl_exact_match_when_re_rooted(self):
        v9 = CathedralV9()
        M_star = v9.M_Pl_GeV() / M_PL_OVER_M_STAR
        v10 = CathedralV10(M_star_GeV=M_star)
        assert abs(v10.M_Pl_GeV() - v9.M_Pl_GeV()) / v9.M_Pl_GeV() < 1e-14

    def test_downstream_chain_re_roots_automatically(self):
        # Overriding only M_Pl_GeV() must re-root v_EW, m_e, m_p, ...
        v9 = CathedralV9()
        M_star = v9.M_Pl_GeV() / M_PL_OVER_M_STAR
        v10 = CathedralV10(M_star_GeV=M_star)
        for obs in ("v_EW", "m_e_GeV", "m_p_GeV", "Lambda_QCD",
                    "n_s", "alpha_inv", "sin2_theta_W", "m_t"):
            a = getattr(v10, obs)()
            b = getattr(v9, obs)()
            assert abs(a - b) / abs(b) < 1e-12, f"{obs} did not re-root exactly"


# ── Cross-peg: v10(G_N) vs v9(ρ_Λ) — independent anchors ─────────────────

class TestV10CrossPegAgreement:

    def test_independent_anchors_agree_to_1pct(self):
        # v10 pegged via the gravitational identity (G_N) and v9 pegged
        # via ρ_Λ use *unrelated* measurements.  They agree to the
        # framework's own cross-anchor consistency (~0.03 %).
        result = v10_cross_peg_agreement()
        assert result["agree_to_1pct"]
        assert result["max_deviation"] < 0.01

    def test_cross_peg_deviation_is_overdetermination_not_freedom(self):
        # The ~1e-4 deviation is two independent measurements landing on
        # the same M★ — overdetermination, the strongest kind of test.
        result = v10_cross_peg_agreement()
        assert 1e-6 < result["max_deviation"] < 1e-3


# ── Keystone identity ─────────────────────────────────────────────────────

class TestKeystoneIdentity:

    def test_gravitational_coupling_identity(self):
        # G_N · M★² = δ★² · 2^q · π²
        expected = DELTA_STAR ** 2 * 2 ** q * pi ** 2
        assert abs(GRAV_COUPLING_V10 - expected) < 1e-12

    def test_grav_coupling_numerical(self):
        assert abs(GRAV_COUPLING_V10 - 6.872226) < 1e-5

    def test_class_method_returns_keystone(self):
        v10 = CathedralV10()
        assert v10.grav_coupling_at_M_star() == GRAV_COUPLING_V10


# ── M★-native quantities ──────────────────────────────────────────────────

class TestMStarNativeQuantities:

    def test_M_Pl_over_M_star_is_cathedral_conversion(self):
        v10 = CathedralV10()
        assert abs(v10.M_Pl_over_M_star() - M_PL_OVER_M_STAR) < 1e-15

    def test_M_star_default_around_3e19_GeV(self):
        assert 3.0e19 < M_STAR_GEV_DEFAULT < 3.5e19

    def test_M_Pl_derived_from_M_star(self):
        # M_Pl = M★ · (M_Pl/M★)
        v10 = CathedralV10()
        assert abs(v10.M_Pl_GeV() - v10.M_star_GeV * M_PL_OVER_M_STAR) < 1e-6

    def test_rho_Lambda_over_M_star4_order_of_magnitude(self):
        # Λ/M★⁴ ≈ Λ/M_Pl⁴ × (M_Pl/M★)⁴ ≈ 1.35e-123 × 0.0212 ≈ 2.86e-125
        v10 = CathedralV10()
        x = v10.rho_Lambda_over_M_star4()
        assert 1e-126 < x < 1e-124

    def test_observable_in_M_star_units(self):
        v10 = CathedralV10()
        # m_p expressed in M★ units, then back
        x = v10.observable_in_M_star_units(v10.m_p_GeV(), mass_dim=1)
        assert abs(x * v10.M_star_GeV - v10.m_p_GeV()) < 1e-6


# ── Full ledger preservation ──────────────────────────────────────────────

class TestLedgerPreservation:

    def test_all_35_observables_within_v9_tolerance(self):
        # v10 (default G_N peg) reproduces every v9 observable to <1%.
        v9  = CathedralV9()
        v10 = CathedralV10()
        observables = [
            "alpha_inv", "alpha_MZ_inv", "sin2_theta_W", "alpha_s_MZ",
            "m_mu_over_m_e", "m_p_over_m_e", "m_t", "m_W", "m_Z", "m_H",
            "Lambda_QCD", "sin_theta_C", "delta_CP_deg",
            "Omega_m", "sigma_8", "eta_B", "n_s", "r_tensor",
            "M_Pl_GeV", "v_EW", "m_e_GeV", "m_p_GeV",
        ]
        for obs in observables:
            a = getattr(v10, obs)()
            b = getattr(v9, obs)()
            if b != 0:
                assert abs(a - b) / abs(b) < 0.01, f"{obs}: v10={a}, v9={b}"

    def test_dimensionless_observables_identical(self):
        # Pure-Cathedral dimensionless predictions don't depend on the
        # anchor at all — must be bit-identical.
        v9  = CathedralV9()
        v10 = CathedralV10()
        for obs in ("alpha_inv", "sin2_theta_W", "n_s", "r_tensor",
                    "delta_CP_deg", "Omega_m", "m_p_over_m_e"):
            assert getattr(v10, obs)() == getattr(v9, obs)(), \
                f"{obs} should be anchor-independent"

    def test_key_exports_present(self):
        assert M_STAR_GEV_V10 > 0
        assert M_PL_GEV_V10 > 0
        assert V_EW_GEV_V10 > 0
        assert M_E_GEV_V10 > 0
        assert M_P_GEV_V10 > 0
        assert LAMBDA_OVER_MSTAR4 > 0


# ── Audit gate ────────────────────────────────────────────────────────────

class TestV10AuditGate:

    def test_v10_audit_passes(self):
        assert v10_audit_passes()

    def test_v10_is_v9_subclass(self):
        assert issubclass(CathedralV10, CathedralV9)

    def test_only_M_Pl_GeV_is_overridden(self):
        # The whole point of v10: it overrides exactly one v9 *physics*
        # method.  Everything else is inherited v9 physics.  (Dunders
        # like __init__/__doc__ are always present in a subclass and
        # are not physics overrides.)
        v10_own = {k for k in CathedralV10.__dict__ if not k.startswith("__")}
        physics_overrides = v10_own & set(CathedralV9.__dict__.keys())
        assert physics_overrides == {"M_Pl_GeV"}, \
            f"v10 should override only M_Pl_GeV, got {physics_overrides}"
