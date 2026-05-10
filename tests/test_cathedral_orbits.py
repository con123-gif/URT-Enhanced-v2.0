"""Tests for the Cathedral orbits module."""
from urt.shell_closure import D, q, V, N, E, F, G
from urt.cathedral_orbits import (
    euler_phi,
    sigma_divisor_sum,
    pisano_period,
    is_cathedral,
    orbit,
    sigma_chain_from_D,
    phi_orbit_from_V_F,
    pisano_attractor_at_2V,
    orbit_table,
    cathedral_orbits_audit,
    cathedral_orbits_audit_passes,
)


class TestArithmeticPrimitives:
    def test_phi_small_values(self):
        assert euler_phi(1) == 1
        assert euler_phi(D) == D - 1 == 2
        assert euler_phi(q) == D + 1 == 4
        assert euler_phi(N) == V == 12       # φ(13) = 12 self-reference

    def test_sigma_small_values(self):
        assert sigma_divisor_sum(D) == D + 1 == 4
        assert sigma_divisor_sum(D * q) == 2 * V == 24       # σ(15) = 24
        assert sigma_divisor_sum(2 * V) == G == 60           # σ(24) = 60
        assert sigma_divisor_sum(G) == 168                   # σ(60) = 168

    def test_pisano_2V_self_reference(self):
        """π_Pisano(24) = 24 — already-known self-reference."""
        assert pisano_period(2 * V) == 2 * V == 24


class TestCathedralMembership:
    def test_primary_integers_in_set(self):
        for n in (D, q, V, N, E, F, G):
            assert is_cathedral(n)

    def test_compounds_in_set(self):
        assert is_cathedral(2 * V)             # 24
        assert is_cathedral(V * F)             # 240
        assert is_cathedral(168)               # |PSL_2(7)|
        assert is_cathedral(480)
        assert is_cathedral(1512)

    def test_random_non_cathedral(self):
        for n in (11, 17, 19, 23, 29):
            assert not is_cathedral(n)


class TestSigmaChainFromD:
    def test_chain_starts_at_D(self):
        chain = sigma_chain_from_D()
        assert chain[0][0] == D == 3

    def test_chain_step_1_is_D_plus_1(self):
        """σ(3) = 4 = D+1."""
        chain = sigma_chain_from_D()
        assert chain[1][0] == D + 1 == 4

    def test_chain_step_2_is_DF_plus_1(self):
        """σ(4) = 7 = D!+1."""
        chain = sigma_chain_from_D()
        assert chain[2][0] == 7

    def test_chain_step_3_is_2D(self):
        """σ(7) = 8 = 2^D."""
        chain = sigma_chain_from_D()
        assert chain[3][0] == 2 ** D == 8

    def test_chain_step_5_is_2V(self):
        """σ(15) = 24 = 2V."""
        chain = sigma_chain_from_D()
        assert chain[5][0] == 2 * V == 24

    def test_chain_step_6_is_G(self):
        """σ(24) = 60 = G = |A_5|."""
        chain = sigma_chain_from_D()
        assert chain[6][0] == G == 60

    def test_chain_step_7_is_PSL27(self):
        """σ(60) = 168 = |PSL_2(7)|."""
        chain = sigma_chain_from_D()
        assert chain[7][0] == 168

    def test_chain_reaches_depth_10(self):
        """The σ-chain stays Cathedral for 10 iterations starting from D."""
        chain = sigma_chain_from_D()
        assert len(chain) >= 10


class TestPhiOrbitFromVF:
    def test_orbit_starts_at_V_times_F(self):
        orbit_ = phi_orbit_from_V_F()
        assert orbit_[0][0] == V * F == 240

    def test_orbit_step_1_is_64(self):
        """φ(240) = 64 = (D+1)^D."""
        orbit_ = phi_orbit_from_V_F()
        assert orbit_[1][0] == (D + 1) ** D == 64

    def test_orbit_terminates_at_1(self):
        """φ-orbit always terminates at 1; from V·F it gets there in 7 steps."""
        orbit_ = phi_orbit_from_V_F()
        assert orbit_[-1][0] == 1

    def test_orbit_reaches_depth_8(self):
        orbit_ = phi_orbit_from_V_F()
        assert len(orbit_) >= 8

    def test_every_step_cathedral(self):
        orbit_ = phi_orbit_from_V_F()
        for v, _ in orbit_:
            assert is_cathedral(v)


class TestPisanoAttractor:
    def test_2V_is_attractor(self):
        attractors = pisano_attractor_at_2V()
        assert 2 * V in attractors

    def test_at_least_three_starts_reach_2V(self):
        attractors = pisano_attractor_at_2V()
        assert len(attractors) >= 3


class TestOrbitTable:
    def test_table_nonempty(self):
        table = orbit_table(min_depth=4)
        assert len(table) >= 1

    def test_each_row_has_required_keys(self):
        for row in orbit_table(min_depth=4):
            for key in ("fn", "start", "depth", "orbit"):
                assert key in row

    def test_depth_filter_respected(self):
        table = orbit_table(min_depth=5)
        for row in table:
            assert row["depth"] >= 5

    def test_orbit_entries_are_cathedral(self):
        for row in orbit_table(min_depth=4):
            for v in row["orbit"]:
                assert is_cathedral(v)


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert cathedral_orbits_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = cathedral_orbits_audit()
        for key in ("sigma_chain_from_D", "phi_orbit_from_V_F",
                    "pisano_to_2V", "orbit_table"):
            assert key in a

    def test_sigma_chain_depth_at_least_10(self):
        a = cathedral_orbits_audit()
        assert len(a["sigma_chain_from_D"]) >= 10

    def test_phi_orbit_depth_at_least_8(self):
        a = cathedral_orbits_audit()
        assert len(a["phi_orbit_from_V_F"]) >= 8
