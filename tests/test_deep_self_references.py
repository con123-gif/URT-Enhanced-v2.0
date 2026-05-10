"""Tests for the deep self-reference search."""
from math import factorial

from urt.shell_closure import D, q, V, N, E, F, G
from urt.deep_self_references import (
    sigma_chain_from_2_to_D,
    sigma_chain_lands_on_cathedral_at_every_step,
    new_phi_identities,
    new_sigma_identities,
    new_partition_identities,
    new_pisano_self_ref_2V,
    deep_self_references_audit,
    deep_self_references_audit_passes,
)


class TestSigmaChain:
    def test_chain_starts_at_2_to_D(self):
        chain = sigma_chain_from_2_to_D(steps=0)
        assert chain[0][0] == 2 ** D == 8

    def test_chain_step_1_is_15(self):
        """σ(8) = 15 = D·q (Lo Shu constant)."""
        chain = sigma_chain_from_2_to_D(steps=1)
        assert chain[1][0] == D * q == 15

    def test_chain_step_2_is_2V(self):
        """σ(15) = 24 = 2V."""
        chain = sigma_chain_from_2_to_D(steps=2)
        assert chain[2][0] == 2 * V == 24

    def test_chain_step_3_is_G(self):
        """σ(24) = 60 = G = |A_5|."""
        chain = sigma_chain_from_2_to_D(steps=3)
        assert chain[3][0] == G == 60

    def test_chain_step_4_is_PSL27(self):
        """σ(60) = 168 = |PSL_2(F_7)|."""
        chain = sigma_chain_from_2_to_D(steps=4)
        assert chain[4][0] == 168

    def test_chain_consistent_6_steps(self):
        """The chain lands on Cathedral at every step for 6 iterations."""
        assert sigma_chain_lands_on_cathedral_at_every_step()


class TestPhiIdentities:
    def test_phi_q_eq_D_plus_1(self):
        ids = new_phi_identities()
        lhs, rhs, _ = ids["phi_q_eq_Dp1"]
        assert lhs == rhs == D + 1

    def test_phi_DFp1_eq_DF(self):
        """φ(D!+1) = D!  i.e. φ(7) = 6."""
        ids = new_phi_identities()
        lhs, rhs, _ = ids["phi_DFp1_eq_DF"]
        assert lhs == rhs == factorial(D)

    def test_phi_qsq_eq_F(self):
        """φ(q²) = F  i.e. φ(25) = 20."""
        ids = new_phi_identities()
        lhs, rhs, _ = ids["phi_qsq_eq_F"]
        assert lhs == rhs == F

    def test_phi_Dq_eq_2D(self):
        """φ(D·q) = 2^D  i.e. φ(15) = 8."""
        ids = new_phi_identities()
        lhs, rhs, _ = ids["phi_Dq_eq_2D"]
        assert lhs == rhs == 2 ** D


class TestSigmaIdentities:
    def test_sigma_G_eq_PSL27(self):
        """σ(G) = 168 = |PSL_2(F_7)|."""
        ids = new_sigma_identities()
        lhs, rhs, _ = ids["sigma_G_eq_PSL27"]
        assert lhs == rhs == 168
        assert lhs == 2 ** D * D * (factorial(D) + 1)

    def test_sigma_2V_eq_G(self):
        """σ(2V) = G."""
        ids = new_sigma_identities()
        lhs, rhs, _ = ids["sigma_2V_eq_G"]
        assert lhs == rhs == G


class TestPartitionIdentities:
    def test_part_DFp1_eq_Dq(self):
        """p(7) = 15 = D·q (NEW)."""
        ids = new_partition_identities()
        lhs, rhs, _ = ids["part_DFp1_eq_Dq"]
        assert lhs == rhs == D * q == 15

    def test_part_Dsq_eq_E(self):
        """p(9) = 30 = E (NEW)."""
        ids = new_partition_identities()
        lhs, rhs, _ = ids["part_Dsq_eq_E"]
        assert lhs == rhs == E == 30


class TestPisanoSelfReference:
    def test_pisano_2V_is_self_reference(self):
        """π_Pisano(24) = 24 — Pisano period of 2V is itself 2V."""
        pis = new_pisano_self_ref_2V()
        assert pis["is_self_ref"]
        assert pis["period"] == 2 * V


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert deep_self_references_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = deep_self_references_audit()
        for key in ("sigma_chain", "phi_identities", "sigma_identities",
                    "partition_identities", "pisano_2V_self_ref",
                    "all_new", "count"):
            assert key in a

    def test_no_failed_identities(self):
        a = deep_self_references_audit()
        assert a["count"]["fails"] == 0
        assert a["count"]["holds"] >= 16
