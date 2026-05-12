"""Tests for the Tesla 3-6-9 Cathedral module."""
from fractions import Fraction
from math import factorial

from urt.shell_closure import D, q, V, N, G
from urt.tesla_369_cathedral import (
    GAMMA, TESLA_3, TESLA_6, TESLA_9,
    tesla_triplet_cathedral,
    pairwise_compounds,
    higher_power_sums,
    bilinear_compounds,
    triangular_extension,
    pentagonal_extension,
    d_power_tower,
    spectral_reading,
    gamma_ladder_intersection,
    digital_root_closure,
    ap_uniqueness_table,
    ap_uniqueness_holds,
    n_s_from_tesla_bilinear,
    all_tesla_369_identities,
    tesla_369_audit_passes,
)


# ── 1. Triplet ─────────────────────────────────────────────────────────


class TestTesla369Triplet:
    def test_three_is_D(self):
        assert TESLA_3 == D == 3
        triplet = tesla_triplet_cathedral()
        assert triplet["three_is_D"][2]

    def test_six_is_Dfact(self):
        assert TESLA_6 == factorial(D) == 6
        assert tesla_triplet_cathedral()["six_is_Dfact"][2]

    def test_nine_is_Dsquared_and_DfactPlusD(self):
        assert TESLA_9 == D * D == 9
        assert TESLA_9 == factorial(D) + D    # A_5 sector size
        assert tesla_triplet_cathedral()["nine_is_Dsq"][2]


# ── 2. Pairwise compounds ──────────────────────────────────────────────


class TestPairwiseCompounds:
    def test_3_plus_6_is_Dsq(self):
        v, t, ok = pairwise_compounds()["3_plus_6"]
        assert v == 9 == D * D and ok

    def test_3_plus_9_is_V(self):
        v, t, ok = pairwise_compounds()["3_plus_9"]
        assert v == 12 == V and ok

    def test_6_plus_9_is_magic_square_constant(self):
        v, t, ok = pairwise_compounds()["6_plus_9"]
        assert v == 15 == D * q and ok

    def test_sum_3_6_9_is_2_Dsq(self):
        v, t, ok = pairwise_compounds()["sum_3_6_9"]
        assert v == 18 == 2 * D * D and ok

    def test_3_times_9_is_DpowerD(self):
        v, t, ok = pairwise_compounds()["3_times_9"]
        assert v == 27 == D ** D and ok

    def test_6_times_9_is_2_DpowerD(self):
        v, t, ok = pairwise_compounds()["6_times_9"]
        assert v == 54 == 2 * D ** D and ok

    def test_product_is_two_over_gamma(self):
        v, t, ok = pairwise_compounds()["prod_3_6_9"]
        assert v == 162 and ok
        # γ · (3·6·9) = D − 1
        assert Fraction(v) * GAMMA == D - 1


# ── 3. Higher-power sums ───────────────────────────────────────────────


class TestHigherPowerSums:
    def test_sum_of_squares_is_Dsq_times_Nplus1(self):
        v, t, ok = higher_power_sums()["sum_squares"]
        assert v == 126
        assert v == D * D * (N + 1)          # = 9 · 14 = 126
        assert ok

    def test_sum_of_cubes_is_V_over_gamma(self):
        v, t, ok = higher_power_sums()["sum_cubes"]
        assert v == 972
        # γ · sum_cubes = V
        assert Fraction(v) * GAMMA == V
        assert ok

    def test_sum_of_fourths(self):
        v, t, ok = higher_power_sums()["sum_fourths"]
        assert v == 7938
        # γ · sum_fourths = 2 · (D!+1)²
        assert Fraction(v) * GAMMA == 2 * (factorial(D) + 1) ** 2
        assert ok


# ── 4. Bilinear Tesla compounds (the new ones) ─────────────────────────


class TestBilinearCompounds:
    def test_three_plus_six_times_nine_is_efolds(self):
        v, t, ok, meaning = bilinear_compounds()["three_plus_six_times_nine"]
        assert v == 57 == G - D
        assert ok

    def test_n_s_from_tesla_bilinear(self):
        """n_s = 1 − 2/(3 + 6·9) = 55/57 ≈ 0.9649 — Planck 2018."""
        ns = n_s_from_tesla_bilinear()
        assert ns == Fraction(55, 57)
        assert abs(float(ns) - 0.9649) < 1e-3

    def test_three_times_six_plus_nine_is_DpowerD(self):
        v, t, ok, _ = bilinear_compounds()["three_times_six_plus_nine"]
        assert v == 27 == D ** D and ok

    def test_three_plus_nine_times_six_is_Laplacian_trace(self):
        v, t, ok, _ = bilinear_compounds()["three_plus_nine_times_six"]
        assert v == 72 == factorial(D) * V and ok


# ── 5. Triangular / pentagonal extensions ──────────────────────────────


class TestTriangularExtension:
    def test_T_3_eq_Dfact(self):
        assert triangular_extension()["T_3_eq_Dfact"][2]

    def test_T_6_eq_D_Dfact_plus_1(self):
        v, t, ok = triangular_extension()["T_6_eq_D_Dfact_p1"]
        assert v == 21 == D * (factorial(D) + 1) and ok

    def test_T_9_eq_Dsq_q(self):
        v, t, ok = triangular_extension()["T_9_eq_Dsq_q"]
        assert v == 45 == D * D * q and ok

    def test_sum_T369_is_Laplacian_trace(self):
        v, t, ok = triangular_extension()["sum_T_eq_Dfact_V"]
        assert v == 72 == factorial(D) * V and ok


class TestPentagonalExtension:
    def test_P_3_eq_V(self):
        assert pentagonal_extension()["P_3_eq_V"][2]

    def test_P_6_is_pentagonal_quartet_d51(self):
        v, t, ok = pentagonal_extension()["P_6_eq_ARFd51"]
        assert v == 51 and ok

    def test_P_9_eq_Dsq_N(self):
        v, t, ok = pentagonal_extension()["P_9_eq_Dsq_N"]
        assert v == 117 == D * D * N and ok

    def test_sum_P369_is_VDq(self):
        v, t, ok = pentagonal_extension()["sum_P_eq_V_Dq"]
        assert v == 180 == V * D * q and ok

    def test_sum_P369_equals_DG(self):
        v, t, ok = pentagonal_extension()["sum_P_eq_DG"]
        assert v == 180 == D * G and ok


# ── 6. D-power tower ───────────────────────────────────────────────────


class TestDPowerTower:
    def test_tower_is_3_9_27_81(self):
        pt = d_power_tower()
        assert pt["tower"] == [3, 9, 27, 81]
        assert pt["expected"] == [D, D * D, D ** D, D ** (D + 1)]
        assert pt["matches"]

    def test_Dfact_is_inserted_non_power(self):
        """6 = D! is not a power of D in {1..6}."""
        powers = {D ** k for k in range(0, 7)}
        assert factorial(D) not in powers


# ── 7. Spectral reading ────────────────────────────────────────────────


class TestSpectralReading:
    def test_three_is_Fiedler(self):
        assert spectral_reading()["three_is_Fiedler_eigenvalue"]

    def test_six_is_mult_of_q(self):
        assert spectral_reading()["six_is_mult_of_q"]

    def test_nine_is_rank_one_eigenvalue(self):
        assert spectral_reading()["nine_is_rank_1_eigenvalue"]

    def test_spectrum_sums_to_trace(self):
        sp = spectral_reading()
        assert sum(sp["spectrum"]) == factorial(D) * V == 72


# ── 8. γ-ladder intersection ───────────────────────────────────────────


class TestGammaLadderIntersection:
    def test_intersection_is_D_and_Dsq(self):
        gl = gamma_ladder_intersection()
        assert gl["intersection_with_trio"] == [D, D * D] == [3, 9]
        assert gl["matches"]


# ── 9. Digital-root closure ────────────────────────────────────────────


class TestDigitalRootClosure:
    def test_all_powers_collapse_to_nine(self):
        assert digital_root_closure()["holds"]

    def test_each_base(self):
        dr = digital_root_closure()
        # base 9 collapses from k=1
        assert all(x == 9 for x in dr["base_9"])
        # bases 3 and 6 collapse from k=2
        assert dr["base_3"][0] == 3
        assert all(x == 9 for x in dr["base_3"][1:])
        assert dr["base_6"][0] == 6
        assert all(x == 9 for x in dr["base_6"][1:])


# ── 10. AP-uniqueness theorem ──────────────────────────────────────────


class TestAPUniqueness:
    def test_D_eq_3_is_AP(self):
        row = next(r for r in ap_uniqueness_table(8) if r["D"] == 3)
        assert row["is_AP"]
        assert row["T_eq_fact"]

    def test_D_eq_2_is_not_AP(self):
        row = next(r for r in ap_uniqueness_table(8) if r["D"] == 2)
        assert not row["is_AP"]
        assert not row["T_eq_fact"]

    def test_T_eq_fact_only_at_1_and_3(self):
        where = [r["D"] for r in ap_uniqueness_table(8) if r["T_eq_fact"]]
        assert where == [1, 3]

    def test_ap_uniqueness_holds_function(self):
        assert ap_uniqueness_holds()


# ── 11. Aggregate audit ────────────────────────────────────────────────


class TestAggregate:
    def test_audit_passes(self):
        assert tesla_369_audit_passes()

    def test_all_identities_structure(self):
        d = all_tesla_369_identities()
        for key in ("triplet", "pairwise", "higher_powers", "bilinear",
                    "triangular", "pentagonal", "d_power_tower",
                    "spectral", "gamma_ladder", "digital_root",
                    "ap_uniqueness", "headline"):
            assert key in d

    def test_headline_n_s_value(self):
        d = all_tesla_369_identities()
        assert abs(d["headline"]["value"] - 0.9649122807017544) < 1e-12
