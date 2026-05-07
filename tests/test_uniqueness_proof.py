"""Tests for urt/uniqueness_proof.py — 4 lemmas + Conjecture 12.1."""

import pytest
from math import pi, log
from urt.uniqueness_proof import (
    LAPLACIAN_EIGENVALUES, K4_EIGENVALUES, H3_EIGENVALUES,
    ETA_EXACT, ETA_L_EXACT, MU_EXACT, TAU_EXACT,
    mode_contraction, all_contractions,
    lemma_1_gradient_flow, lemma_2_representation_theory,
    lemma_3_annealing, lemma_4_contraction, conjecture_121,
    uniqueness_theorem_full, print_uniqueness_report,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, V, gamma, phi


class TestProofConstants:
    def test_eta_exact(self):
        assert abs(ETA_EXACT - 1 / (8 * pi)) < 1e-14

    def test_eta_l_exact(self):
        assert abs(ETA_L_EXACT - 1 / (4 * pi)) < 1e-14

    def test_mu_exact(self):
        assert abs(MU_EXACT - (phi - 1)) < 1e-14

    def test_tau_exact(self):
        assert TAU_EXACT == 10.0

    def test_laplacian_has_13_evals(self):
        assert len(LAPLACIAN_EIGENVALUES) == 13

    def test_k4_has_4(self):
        assert len(K4_EIGENVALUES) == 4

    def test_h3_has_9(self):
        assert len(H3_EIGENVALUES) == 9

    def test_k4_plus_h3_equals_full(self):
        assert sorted(K4_EIGENVALUES + H3_EIGENVALUES) == sorted(LAPLACIAN_EIGENVALUES)

    def test_zero_mode_present(self):
        assert 0 in LAPLACIAN_EIGENVALUES


class TestModeContraction:
    def test_zero_mode_kappa_one(self):
        assert abs(mode_contraction(0) - 1.0) < 1e-14

    def test_kappa_decreases_with_lambda(self):
        k3 = mode_contraction(3)
        k5 = mode_contraction(5)
        k13 = mode_contraction(13)
        assert k3 > k5 > k13

    def test_kappa_max_lt_1(self):
        contractions = all_contractions()
        for c in contractions:
            if c["lambda"] > 0:
                assert abs(c["kappa"]) < 1.0


class TestLemma1:
    def setup_method(self):
        self.L = lemma_1_gradient_flow()

    def test_status_proved(self):
        assert self.L["status"] == "PROVED"

    def test_potential_K_positive(self):
        assert self.L["potential_K"] > 0

    def test_gradient_form_forced(self):
        assert self.L["gradient_form_forced"] is True

    def test_required_keys(self):
        for k in ["lemma", "statement", "potential_K", "status"]:
            assert k in self.L


class TestLemma2:
    def setup_method(self):
        self.L = lemma_2_representation_theory()

    def test_status_proved(self):
        assert self.L["status"] == "PROVED"

    def test_delta_check_matches_delta_star(self):
        assert self.L["matches"] is True

    def test_k4_cardinality(self):
        assert self.L["K4_cardinality"] == G + F + 1   # = 81

    def test_h3_dimension(self):
        assert self.L["H3_dimension"] == G   # = 60

    def test_gamma_correct(self):
        assert abs(self.L["gamma"] - gamma) < 1e-14


class TestLemma3:
    def setup_method(self):
        self.L = lemma_3_annealing()

    def test_status_proved(self):
        assert self.L["status"] == "PROVED"

    def test_tau_matches(self):
        assert self.L["tau_matches"] is True   # τ = F/2 = 10

    def test_tau_above_adiabatic_min(self):
        assert self.L["tau"] > self.L["tau_min_adiabatic"]

    def test_annealing_decays(self):
        sched = self.L["annealing_schedule"]
        vals = [s["exp"] for s in sched]
        assert vals[0] == 1.0
        assert all(vals[i] >= vals[i+1] for i in range(len(vals)-1))


class TestLemma4:
    def setup_method(self):
        self.L = lemma_4_contraction()

    def test_status_proved(self):
        assert self.L["status"] == "PROVED"

    def test_eta_in_range(self):
        assert self.L["eta_in_range"] is True

    def test_all_stable(self):
        assert self.L["all_stable"] is True

    def test_kappa_max_lt_1(self):
        assert self.L["kappa_max"] < 1.0


class TestConjecture121:
    def setup_method(self):
        self.C = conjecture_121()

    def test_euler_char_2(self):
        assert self.C["euler_char"] == 2

    def test_spectral_gap_equals_D(self):
        assert self.C["spectral_gap_eq_D"] is True

    def test_n_scan_contains_N(self):
        ns = [x[0] for x in self.C["evidence_N_scan"]]
        assert N in ns


class TestFullTheorem:
    def setup_method(self):
        self.T = uniqueness_theorem_full()

    def test_all_proved(self):
        assert self.T["all_proved"] is True

    def test_delta_star(self):
        assert abs(self.T["delta_star"] - DELTA_STAR) < 1e-14

    def test_four_lemmas(self):
        for k in ["lemma_1", "lemma_2", "lemma_3", "lemma_4"]:
            assert k in self.T

    def test_conjecture_present(self):
        assert "conjecture" in self.T


def test_print_uniqueness_report_runs(capsys):
    print_uniqueness_report()
    out = capsys.readouterr().out
    assert "UNIQUENESS" in out
    assert "QED" in out or "PROVED" in out
