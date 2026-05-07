"""Tests for urt/computational_complexity_cathedral.py — Complexity classes, circuits, Cathedral integers."""

import pytest
from math import isfinite, log


def test_imports():
    from urt.computational_complexity_cathedral import (
        N_COMPLEXITY_CLASSES_BASE, N_COMPLEXITY_EQ_D,
        N_POLY_HIERARCHY_LEVELS, N_POLY_HIER_EQ_D1,
        N_SAT_LITERALS_PER_CLAUSE, N_SAT_EQ_D,
        N_COLORING_POLY, N_COLORING_POLY_EQ_D1,
        N_COLORING_HARD, N_COLORING_HARD_EQ_D,
        N_COLORING_POLY_2,
        N_SPACE_CLASSES, N_SPACE_EQ_D1,
        N_CIRCUIT_DEPTH, N_CIRCUIT_EQ_D,
        N_RAND_CLASSES, N_RAND_EQ_D,
        N_QUANTUM_CLASS_GAPS, N_QUANTUM_EQ_D1,
        N_SHANNON_MAX_ICOS, H_MAX_ICOS_BITS, H_MAX_EQ_LOG2_N,
        N_BOOLEAN_GATES_UNIVERSAL, N_BOOLEAN_EQ_D,
        N_MULTI_PARTY_MIN, N_MULTI_PARTY_EQ_D,
        KARP_21_APPROX, KARP_21_EQ_E,
        KOLMOGOROV_INCOMPRESSIBILITY_RATE,
        CHANNEL_CAPACITY_ICOS,
        complexity_classes, boolean_complexity,
        computational_complexity_summary,
        print_computational_complexity_report,
    )


# ── Base complexity classes ────────────────────────────────────────────────────

def test_base_classes_eq_D():
    """P, NP, co-NP = D = 3 [EXACT]."""
    from urt.computational_complexity_cathedral import N_COMPLEXITY_CLASSES_BASE, N_COMPLEXITY_EQ_D
    from urt.shell_closure import D
    assert N_COMPLEXITY_CLASSES_BASE == D
    assert N_COMPLEXITY_CLASSES_BASE == 3
    assert N_COMPLEXITY_EQ_D is True


def test_base_classes_is_int():
    from urt.computational_complexity_cathedral import N_COMPLEXITY_CLASSES_BASE
    assert isinstance(N_COMPLEXITY_CLASSES_BASE, int)


# ── Polynomial hierarchy ───────────────────────────────────────────────────────

def test_poly_hierarchy_eq_D1():
    """Polynomial hierarchy levels = D+1 = 4 [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import N_POLY_HIERARCHY_LEVELS, N_POLY_HIER_EQ_D1
    from urt.shell_closure import D
    assert N_POLY_HIERARCHY_LEVELS == D + 1
    assert N_POLY_HIERARCHY_LEVELS == 4
    assert N_POLY_HIER_EQ_D1 is True


# ── 3-SAT ──────────────────────────────────────────────────────────────────────

def test_sat_literals_eq_D():
    """3-SAT literals per clause = D = 3 [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import N_SAT_LITERALS_PER_CLAUSE, N_SAT_EQ_D
    from urt.shell_closure import D
    assert N_SAT_LITERALS_PER_CLAUSE == D
    assert N_SAT_LITERALS_PER_CLAUSE == 3
    assert N_SAT_EQ_D is True


# ── Graph coloring ─────────────────────────────────────────────────────────────

def test_coloring_poly_eq_D1():
    """4-coloring polynomial for planar graphs = D+1 = 4 [EXACT]."""
    from urt.computational_complexity_cathedral import N_COLORING_POLY, N_COLORING_POLY_EQ_D1
    from urt.shell_closure import D
    assert N_COLORING_POLY == D + 1
    assert N_COLORING_POLY == 4
    assert N_COLORING_POLY_EQ_D1 is True


def test_coloring_hard_eq_D():
    """3-coloring is NP-complete = D = 3 [EXACT]."""
    from urt.computational_complexity_cathedral import N_COLORING_HARD, N_COLORING_HARD_EQ_D
    from urt.shell_closure import D
    assert N_COLORING_HARD == D
    assert N_COLORING_HARD == 3
    assert N_COLORING_HARD_EQ_D is True


def test_coloring_poly_2_eq_D_minus_1():
    """2-coloring is polynomial = D-1 = 2 [EXACT]."""
    from urt.computational_complexity_cathedral import N_COLORING_POLY_2
    from urt.shell_closure import D
    assert N_COLORING_POLY_2 == D - 1
    assert N_COLORING_POLY_2 == 2


def test_coloring_threshold_ordering():
    """Hard coloring threshold < poly coloring threshold."""
    from urt.computational_complexity_cathedral import N_COLORING_HARD, N_COLORING_POLY, N_COLORING_POLY_2
    assert N_COLORING_POLY_2 < N_COLORING_HARD < N_COLORING_POLY


# ── Space complexity ───────────────────────────────────────────────────────────

def test_space_classes_eq_D1():
    """Space endpoint classes = D-1 = 2 [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import N_SPACE_CLASSES, N_SPACE_EQ_D1
    from urt.shell_closure import D
    assert N_SPACE_CLASSES == D - 1
    assert N_SPACE_CLASSES == 2
    assert N_SPACE_EQ_D1 is True


# ── Circuit complexity ─────────────────────────────────────────────────────────

def test_circuit_depth_eq_D():
    """NC^D=3 circuit depth = D = 3 [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import N_CIRCUIT_DEPTH, N_CIRCUIT_EQ_D
    from urt.shell_closure import D
    assert N_CIRCUIT_DEPTH == D
    assert N_CIRCUIT_DEPTH == 3
    assert N_CIRCUIT_EQ_D is True


# ── Randomized complexity ──────────────────────────────────────────────────────

def test_rand_classes_eq_D():
    """RP, co-RP, ZPP = D = 3 randomized classes [EXACT]."""
    from urt.computational_complexity_cathedral import N_RAND_CLASSES, N_RAND_EQ_D
    from urt.shell_closure import D
    assert N_RAND_CLASSES == D
    assert N_RAND_CLASSES == 3
    assert N_RAND_EQ_D is True


# ── Quantum complexity ─────────────────────────────────────────────────────────

def test_quantum_gaps_eq_D1():
    """Quantum-classical gaps = D-1 = 2 [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import N_QUANTUM_CLASS_GAPS, N_QUANTUM_EQ_D1
    from urt.shell_closure import D
    assert N_QUANTUM_CLASS_GAPS == D - 1
    assert N_QUANTUM_CLASS_GAPS == 2
    assert N_QUANTUM_EQ_D1 is True


# ── Shannon entropy ────────────────────────────────────────────────────────────

def test_shannon_max_icos_eq_N():
    """Shannon max source = N = 13 [EXACT]."""
    from urt.computational_complexity_cathedral import N_SHANNON_MAX_ICOS
    from urt.shell_closure import N
    assert N_SHANNON_MAX_ICOS == N
    assert N_SHANNON_MAX_ICOS == 13


def test_h_max_icos_bits_value():
    """H_max = log₂(13) ≈ 3.700 bits [EXACT]."""
    from urt.computational_complexity_cathedral import H_MAX_ICOS_BITS, H_MAX_EQ_LOG2_N
    from urt.shell_closure import N
    assert abs(H_MAX_ICOS_BITS - log(N) / log(2)) < 1e-12
    assert abs(H_MAX_ICOS_BITS - log(13) / log(2)) < 1e-12
    assert 3.6 < H_MAX_ICOS_BITS < 3.8
    assert H_MAX_EQ_LOG2_N is True


def test_h_max_is_finite():
    from urt.computational_complexity_cathedral import H_MAX_ICOS_BITS
    assert isfinite(H_MAX_ICOS_BITS)


# ── Boolean gates ──────────────────────────────────────────────────────────────

def test_boolean_gates_eq_D():
    """AND, OR, NOT — D=3 universal gates [EXACT]."""
    from urt.computational_complexity_cathedral import N_BOOLEAN_GATES_UNIVERSAL, N_BOOLEAN_EQ_D
    from urt.shell_closure import D
    assert N_BOOLEAN_GATES_UNIVERSAL == D
    assert N_BOOLEAN_GATES_UNIVERSAL == 3
    assert N_BOOLEAN_EQ_D is True


# ── Communication complexity ───────────────────────────────────────────────────

def test_multi_party_eq_D():
    """Multi-party communication min players = D = 3 [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import N_MULTI_PARTY_MIN, N_MULTI_PARTY_EQ_D
    from urt.shell_closure import D
    assert N_MULTI_PARTY_MIN == D
    assert N_MULTI_PARTY_MIN == 3
    assert N_MULTI_PARTY_EQ_D is True


# ── Karp's 21 NP-complete problems ────────────────────────────────────────────

def test_karp_21_approx_eq_E():
    """Karp approx N+F-D = 30 = E [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import KARP_21_APPROX, KARP_21_EQ_E
    from urt.shell_closure import N, F, D, E
    assert KARP_21_APPROX == N + F - D
    assert KARP_21_APPROX == 30
    assert KARP_21_APPROX == E
    assert KARP_21_EQ_E is True


# ── Kolmogorov & channel capacity ─────────────────────────────────────────────

def test_kolmogorov_rate():
    """Kolmogorov incompressibility rate = δ★ [APPROXIMATE]."""
    from urt.computational_complexity_cathedral import KOLMOGOROV_INCOMPRESSIBILITY_RATE
    from urt.shell_closure import DELTA_STAR
    assert abs(KOLMOGOROV_INCOMPRESSIBILITY_RATE - DELTA_STAR) < 1e-12
    assert 0.14 < KOLMOGOROV_INCOMPRESSIBILITY_RATE < 0.16


def test_channel_capacity_icos():
    """Channel capacity for N-ary icos source = H_MAX [EXACT]."""
    from urt.computational_complexity_cathedral import CHANNEL_CAPACITY_ICOS, H_MAX_ICOS_BITS
    assert abs(CHANNEL_CAPACITY_ICOS - H_MAX_ICOS_BITS) < 1e-12


# ── Function: complexity_classes ───────────────────────────────────────────────

def test_complexity_classes_returns_dict():
    from urt.computational_complexity_cathedral import complexity_classes
    r = complexity_classes()
    assert isinstance(r, dict)


def test_complexity_classes_required_keys():
    from urt.computational_complexity_cathedral import complexity_classes
    r = complexity_classes()
    for key in ["n_base_classes", "base_eq_D", "n_poly_hierarchy", "poly_hier_eq_D1",
                "n_sat_literals", "sat_eq_D", "n_coloring_poly", "coloring_poly_eq_D1",
                "n_coloring_hard", "coloring_hard_eq_D", "n_rand_classes", "rand_eq_D",
                "n_space_classes", "space_eq_D1", "n_quantum_gaps", "quantum_eq_D1"]:
        assert key in r, f"Missing key: {key}"


def test_complexity_classes_values():
    from urt.computational_complexity_cathedral import complexity_classes
    r = complexity_classes()
    assert r["n_base_classes"] == 3
    assert r["base_eq_D"] is True
    assert r["n_poly_hierarchy"] == 4
    assert r["poly_hier_eq_D1"] is True
    assert r["n_sat_literals"] == 3
    assert r["sat_eq_D"] is True
    assert r["n_coloring_poly"] == 4
    assert r["coloring_poly_eq_D1"] is True
    assert r["n_coloring_hard"] == 3
    assert r["coloring_hard_eq_D"] is True
    assert r["n_rand_classes"] == 3
    assert r["rand_eq_D"] is True
    assert r["n_space_classes"] == 2
    assert r["space_eq_D1"] is True
    assert r["n_quantum_gaps"] == 2
    assert r["quantum_eq_D1"] is True


# ── Function: boolean_complexity ───────────────────────────────────────────────

def test_boolean_complexity_returns_dict():
    from urt.computational_complexity_cathedral import boolean_complexity
    r = boolean_complexity()
    assert isinstance(r, dict)


def test_boolean_complexity_required_keys():
    from urt.computational_complexity_cathedral import boolean_complexity
    r = boolean_complexity()
    for key in ["n_boolean_gates", "boolean_eq_D", "h_max_icos_bits", "h_max_eq_log2_N",
                "n_shannon_icos", "shannon_eq_N", "karp_21_approx", "karp_21_eq_E",
                "n_multi_party", "multi_party_eq_D", "circuit_depth", "circuit_eq_D",
                "kolmogorov_rate", "channel_capacity"]:
        assert key in r, f"Missing key: {key}"


def test_boolean_complexity_values():
    from urt.computational_complexity_cathedral import boolean_complexity
    r = boolean_complexity()
    assert r["n_boolean_gates"] == 3
    assert r["boolean_eq_D"] is True
    assert abs(r["h_max_icos_bits"] - log(13) / log(2)) < 1e-12
    assert r["h_max_eq_log2_N"] is True
    assert r["n_shannon_icos"] == 13
    assert r["shannon_eq_N"] is True
    assert r["karp_21_approx"] == 30
    assert r["karp_21_eq_E"] is True
    assert r["n_multi_party"] == 3
    assert r["multi_party_eq_D"] is True
    assert r["circuit_depth"] == 3
    assert r["circuit_eq_D"] is True


# ── Function: computational_complexity_summary ────────────────────────────────

def test_summary_returns_dict():
    from urt.computational_complexity_cathedral import computational_complexity_summary
    r = computational_complexity_summary()
    assert isinstance(r, dict)


def test_summary_required_keys():
    from urt.computational_complexity_cathedral import computational_complexity_summary
    r = computational_complexity_summary()
    assert "complexity_classes" in r
    assert "boolean_complexity" in r
    assert "KEY_EXACT_RESULTS" in r
    assert "delta_star" in r
    assert "N" in r
    assert "D" in r
    assert "E" in r


def test_summary_key_exact_results_count():
    from urt.computational_complexity_cathedral import computational_complexity_summary
    r = computational_complexity_summary()
    assert len(r["KEY_EXACT_RESULTS"]) >= 8


def test_summary_key_exact_results_type():
    from urt.computational_complexity_cathedral import computational_complexity_summary
    r = computational_complexity_summary()
    assert all(isinstance(s, str) for s in r["KEY_EXACT_RESULTS"])


def test_summary_scalar_fields():
    from urt.computational_complexity_cathedral import computational_complexity_summary
    from urt.shell_closure import DELTA_STAR, N, D, E
    r = computational_complexity_summary()
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-12
    assert r["N"] == N
    assert r["D"] == D
    assert r["E"] == E


def test_summary_sub_dicts_are_dicts():
    from urt.computational_complexity_cathedral import computational_complexity_summary
    r = computational_complexity_summary()
    assert isinstance(r["complexity_classes"], dict)
    assert isinstance(r["boolean_complexity"], dict)


# ── Cross-module consistency ───────────────────────────────────────────────────

def test_coloring_equals_sat():
    """3-SAT and 3-coloring are both D=3."""
    from urt.computational_complexity_cathedral import N_SAT_LITERALS_PER_CLAUSE, N_COLORING_HARD
    assert N_SAT_LITERALS_PER_CLAUSE == N_COLORING_HARD


def test_base_rand_boolean_all_equal_D():
    """Base classes, randomized classes, and Boolean gates are all D=3."""
    from urt.computational_complexity_cathedral import (
        N_COMPLEXITY_CLASSES_BASE, N_RAND_CLASSES, N_BOOLEAN_GATES_UNIVERSAL
    )
    assert N_COMPLEXITY_CLASSES_BASE == N_RAND_CLASSES == N_BOOLEAN_GATES_UNIVERSAL == 3


def test_poly_hierarchy_coloring_poly_match():
    """Polynomial hierarchy levels = coloring polynomial threshold = D+1 = 4."""
    from urt.computational_complexity_cathedral import N_POLY_HIERARCHY_LEVELS, N_COLORING_POLY
    assert N_POLY_HIERARCHY_LEVELS == N_COLORING_POLY


def test_space_quantum_match():
    """Space endpoint classes = quantum-classical gaps = D-1 = 2."""
    from urt.computational_complexity_cathedral import N_SPACE_CLASSES, N_QUANTUM_CLASS_GAPS
    assert N_SPACE_CLASSES == N_QUANTUM_CLASS_GAPS == 2


def test_shannon_entropy_ordering():
    """H_MAX_ICOS_BITS > 0 and finite."""
    from urt.computational_complexity_cathedral import H_MAX_ICOS_BITS
    assert H_MAX_ICOS_BITS > 0
    assert isfinite(H_MAX_ICOS_BITS)


# ── Print function ─────────────────────────────────────────────────────────────

def test_print_report(capsys):
    from urt.computational_complexity_cathedral import print_computational_complexity_report
    print_computational_complexity_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "EXACT" in out
    assert "D" in out
    assert "3" in out


def test_print_report_contains_complexity(capsys):
    from urt.computational_complexity_cathedral import print_computational_complexity_report
    print_computational_complexity_report()
    out = capsys.readouterr().out
    assert "NP" in out or "complexity" in out.lower() or "COMPLEXITY" in out


def test_print_report_contains_entropy(capsys):
    from urt.computational_complexity_cathedral import print_computational_complexity_report
    print_computational_complexity_report()
    out = capsys.readouterr().out
    assert "entropy" in out.lower() or "bits" in out.lower() or "Shannon" in out or "log" in out.lower()
