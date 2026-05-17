"""Tests for urt/iron_proof.py — Bulletproof uniqueness of the Cathedral framework."""

import pytest
from math import pi
from urt.iron_proof import (
    spectral_uniqueness_proof,
    gamma_from_dimension_proof,
    free_parameter_audit,
    genuine_predictions,
    inter_observable_correlations,
    prediction_statistics,
    honest_assessment,
    a5_uniqueness_argument,
    iron_proof_full,
    print_iron_proof_report,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, V, E, q, gamma, phi


class TestSpectralUniqueness:
    def setup_method(self):
        self.sp = spectral_uniqueness_proof()

    def test_exactly_one_winner(self):
        assert self.sp["is_unique"] is True
        assert len(self.sp["unique"]) == 1

    def test_winner_is_icosahedron(self):
        assert self.sp["winner"]["N"] == N  # N=13

    def test_winner_has_simple_group(self):
        assert self.sp["winner"]["simple"] is True

    def test_winner_lambda2_equals_D(self):
        assert self.sp["winner"]["l2_eq_D"] is True

    def test_cube_fails(self):
        cube = next(r for r in self.sp["candidates"] if "Cube" in r["graph"])
        assert cube["passes"] is False
        assert cube["simple"] is False  # S4 not simple

    def test_dodecahedron_fails(self):
        dodeca = next(r for r in self.sp["candidates"] if "Dodecahedron" in r["graph"])
        assert dodeca["passes"] is False
        assert dodeca["l2_eq_D"] is False  # lambda2 != 3

    def test_all_five_platonic_solids_checked(self):
        assert len(self.sp["candidates"]) == 5


class TestGammaFromDimension:
    def setup_method(self):
        self.gd = gamma_from_dimension_proof()

    def test_gamma_dim_equals_gamma_icos(self):
        assert self.gd["match"] is True

    def test_gamma_dim_value(self):
        assert abs(self.gd["gamma_from_dimension"] - 1/81) < 1e-14

    def test_gamma_icos_value(self):
        assert abs(self.gd["gamma_from_icosahedron"] - 1/81) < 1e-14

    def test_identity_holds(self):
        assert self.gd["identity_holds"] is True

    def test_identity_value(self):
        # G + F + 1 = D^{D+1} = 81
        assert G + F + 1 == D**(D+1) == 81

    def test_delta_star_matches(self):
        assert self.gd["delta_star_matches"] is True

    def test_delta_star_pure_D_value(self):
        expected = (1 - D**(-(D+1))) * pi / (N * phi)
        assert abs(self.gd["delta_star_pure_D"] - expected) < 1e-14
        assert abs(self.gd["delta_star_pure_D"] - DELTA_STAR) < 1e-14


class TestFreeParameterAudit:
    def setup_method(self):
        self.fp = free_parameter_audit()

    def test_zero_continuous_params(self):
        assert self.fp["free_continuous_parameters"] == 0

    def test_one_discrete_choice(self):
        assert self.fp["free_discrete_choices"] == 1

    def test_all_verified(self):
        assert self.fp["all_verified"] is True

    def test_individual_verifications(self):
        v = self.fp["verifications"]
        assert v["V = N-1"]          is True
        assert v["E = q*V/2"]        is True
        assert v["F = 2+E-V"]        is True
        assert v["G = unique A5"]    is True
        assert v["gamma = D^{-D-1}"] is True
        assert v["G+F+1 = D^{D+1}"]  is True

    def test_n_observables(self):
        assert self.fp["n_observables_predicted"] >= 10


class TestGenuinePredictions:
    def setup_method(self):
        self.preds = genuine_predictions()

    def test_returns_eight_predictions(self):
        assert len(self.preds) == 8

    def test_required_keys(self):
        for p in self.preds:
            for k in ["observable", "formula", "prediction", "observed", "status"]:
                assert k in p

    def test_ns_value(self):
        ns = next(p for p in self.preds if "n_s" in p["observable"])
        expected = 1 - 2 / (G - D)
        assert abs(ns["prediction"] - expected) < 1e-14
        assert abs(ns["prediction"] - 0.9649) < 0.001

    def test_sin2w_value(self):
        sw = next(p for p in self.preds if "sin²" in p["observable"])
        expected = (D / N) * (1 + gamma / (2 * pi))
        assert abs(sw["prediction"] - expected) < 1e-14
        assert abs(sw["prediction"] - 0.23122) < 0.001

    def test_r_value(self):
        r = next(p for p in self.preds if p["observable"] == "r (tensor-to-scalar ratio)")
        expected = 12 / (G - D)**2
        assert abs(r["prediction"] - expected) < 1e-14
        assert r["prediction"] < 0.01  # well below current bound

    def test_alpha_s_value(self):
        a = next(p for p in self.preds if "α_s" in p["observable"])
        expected = DELTA_STAR * (q - 1) / q
        assert abs(a["prediction"] - expected) < 1e-14

    def test_all_have_status(self):
        statuses = {p["status"] for p in self.preds}
        assert statuses <= {"exact", "confirmed", "prediction"}


class TestInterObservableCorrelations:
    def setup_method(self):
        self.corrs = inter_observable_correlations()

    def test_returns_four_correlations(self):
        assert len(self.corrs) == 4

    def test_r_times_Ne_squared(self):
        r_corr = next(c for c in self.corrs if "r × N²" in c["name"])
        assert abs(r_corr["predicted"] - 12.0) < 1e-10

    def test_alpha_s_ratio(self):
        a_corr = next(c for c in self.corrs if "α_s" in c["name"])
        assert abs(a_corr["predicted"] - (q-1)/q) < 1e-14

    def test_sin2w_times_N_over_D(self):
        sw_corr = next(c for c in self.corrs if "sin²θ_W × N/D" in c["name"])
        expected = 1 + gamma / (2 * pi)
        assert abs(sw_corr["predicted"] - expected) < 1e-14


class TestPredictionStatistics:
    def setup_method(self):
        self.st = prediction_statistics()

    def test_all_within_2sigma(self):
        assert self.st["all_within_2sigma"] is True

    def test_zero_free_parameters(self):
        assert self.st["free_parameters"] == 0

    def test_z_scores_reasonable(self):
        for z in self.st["z_scores"]:
            assert z["z_score"] < 3.0  # no prediction worse than 3σ

    def test_log10_p_very_small(self):
        assert self.st["log10_p"] < -5  # astronomically unlikely by chance


class TestHonestAssessment:
    def setup_method(self):
        self.ha = honest_assessment()

    def test_required_keys(self):
        for k in ["rigorously_proved", "well_motivated", "speculative_honest", "what_would_falsify"]:
            assert k in self.ha

    def test_rigorously_proved_nonempty(self):
        assert len(self.ha["rigorously_proved"]) >= 5

    def test_speculative_honest_empty(self):
        # As of v2.9.88, all three prior speculative_honest items
        # (SU(3) per-generator action, K_4-cube CC mechanism, quark
        # Yukawas as eigenmode overlaps) are now `rigorously_proved`.
        # No derivational gaps remain; the only residual labelling
        # freedom is up/down ordering within each degenerate doublet
        # — a basis convention, not a derivational gap, recorded in
        # `well_motivated` for transparency.
        assert len(self.ha["speculative_honest"]) == 0

    def test_falsifiable_conditions_exist(self):
        assert len(self.ha["what_would_falsify"]) >= 4


class TestA5Uniqueness:
    def setup_method(self):
        self.a5 = a5_uniqueness_argument()

    def test_theorem_present(self):
        assert "A₅" in self.a5["theorem"]

    def test_a5_is_simple(self):
        a5_entry = next(sg for sg in self.a5["so3_subgroups"] if sg["group"] == "A₅")
        assert a5_entry["simple"] is True

    def test_others_not_simple(self):
        for sg in self.a5["so3_subgroups"]:
            if sg["group"] != "A₅":
                # cyclic and dihedral: simple is False
                if sg["group"] in ("A₄", "S₄"):
                    assert sg["simple"] is False

    def test_a5_order(self):
        a5_entry = next(sg for sg in self.a5["so3_subgroups"] if sg["group"] == "A₅")
        assert a5_entry["order"] == G  # = 60

    def test_no_free_parameter(self):
        assert self.a5["no_free_parameter"] is True


class TestIronProofFull:
    def test_returns_dict(self):
        result = iron_proof_full()
        assert isinstance(result, dict)

    def test_required_sections(self):
        result = iron_proof_full()
        for k in ["spectral_uniqueness", "gamma_from_dimension", "free_parameter_audit",
                  "genuine_predictions", "statistics", "honest_assessment", "a5_uniqueness",
                  "executive_summary"]:
            assert k in result

    def test_executive_summary_nonempty(self):
        result = iron_proof_full()
        assert len(result["executive_summary"]) > 50


def test_print_iron_proof_report_runs(capsys):
    print_iron_proof_report()
    out = capsys.readouterr().out
    assert "IRON PROOF" in out
    assert "Jordan" in out
    assert "A₅" in out
    assert "0" in out  # free parameters = 0


class TestFibonacciPower3UniquenessWitness:
    """Independent uniqueness witness for {N=13, m=81} via Fibonacci × 3^k."""

    def test_witness_picks_framework(self):
        from urt.iron_proof import fibonacci_power3_uniqueness
        f = fibonacci_power3_uniqueness()
        assert f["framework_pick"]
        assert f["best"]["N"] == 13
        assert f["best"]["m"] == 81

    def test_best_hits_delta_star_at_machine_precision(self):
        from urt.iron_proof import fibonacci_power3_uniqueness
        f = fibonacci_power3_uniqueness()
        assert f["best"]["abs_err"] < 1e-12

    def test_runner_up_is_far_worse(self):
        """Margin between best and second-best must be huge."""
        from urt.iron_proof import fibonacci_power3_uniqueness
        f = fibonacci_power3_uniqueness()
        assert f["margin_over_runner_up"] > 1e6  # several orders of magnitude

    def test_includes_all_candidates(self):
        from urt.iron_proof import fibonacci_power3_uniqueness
        f = fibonacci_power3_uniqueness()
        assert f["n_candidates"] >= 5
        assert isinstance(f["all_candidates"], list)

    def test_appears_in_iron_proof_full(self):
        from urt.iron_proof import iron_proof_full
        full = iron_proof_full()
        assert "fibonacci_power3_witness" in full
        assert full["fibonacci_power3_witness"]["framework_pick"]
