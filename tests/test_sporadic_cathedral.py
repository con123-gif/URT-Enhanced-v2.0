"""Tests for urt/sporadic_cathedral.py — Cathedral sporadic groups via CFSG."""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import without error."""
    from urt.sporadic_cathedral import (
        N_SPORADIC, N_HAPPY_FAMILY, N_PARIAH, N_INFINITE_FAMILIES,
        IDENTITY_SPORADIC_IS_2N, IDENTITY_HAPPY_IS_F,
        IDENTITY_PARIAH_IS_DFACT, IDENTITY_INFINITE_FAMILIES,
        J1_ORDER, IDENTITY_J1,
        J2_ORDER, IDENTITY_J2,
        TITS_ORDER, IDENTITY_TITS,
        MCL_ORDER, IDENTITY_MCL,
        HS_ORDER, IDENTITY_HS,
        BM_ORDER,
        BM_2_EXP, BM_3_EXP, BM_5_EXP,
        PRIME_11, PRIME_13, PRIME_17, PRIME_19, PRIME_23, PRIME_31, PRIME_47,
        IDENTITY_BM_2, IDENTITY_BM_3, IDENTITY_BM_5,
        IDENTITY_PRIME_11, IDENTITY_PRIME_13, IDENTITY_PRIME_17,
        IDENTITY_PRIME_19, IDENTITY_PRIME_23, IDENTITY_PRIME_31,
        IDENTITY_PRIME_47,
        CATHEDRAL_SPORADIC_PRIMES,
        verify_j1, verify_j2, verify_tits, verify_mcl, verify_hs,
        verify_baby_monster_exponents, verify_cfsg_structure,
        cathedral_sporadic_primes_check,
        sporadic_summary, print_sporadic_report,
    )


# ── Cathedral integers used in sporadic_cathedral ─────────────────────────────

def test_cathedral_integers_available():
    """D=3, N=13, V=12, F=20, q=5, G=60 are accessible via shell_closure."""
    from urt.shell_closure import D, N, V, F, q, G
    assert D == 3
    assert N == 13
    assert V == 12
    assert F == 20
    assert q == 5
    assert G == 60


# ── CFSG Classification Counts ────────────────────────────────────────────────

def test_n_sporadic_value():
    """There are exactly 26 sporadic groups."""
    from urt.sporadic_cathedral import N_SPORADIC
    assert N_SPORADIC == 26


def test_n_happy_family_value():
    """There are exactly 20 Happy Family groups."""
    from urt.sporadic_cathedral import N_HAPPY_FAMILY
    assert N_HAPPY_FAMILY == 20


def test_n_pariah_value():
    """There are exactly 6 Pariah groups."""
    from urt.sporadic_cathedral import N_PARIAH
    assert N_PARIAH == 6


def test_n_infinite_families_value():
    """There are exactly 18 infinite families of simple groups."""
    from urt.sporadic_cathedral import N_INFINITE_FAMILIES
    assert N_INFINITE_FAMILIES == 18


def test_sporadic_partition():
    """Happy Family + Pariah = total sporadic groups."""
    from urt.sporadic_cathedral import N_SPORADIC, N_HAPPY_FAMILY, N_PARIAH
    assert N_HAPPY_FAMILY + N_PARIAH == N_SPORADIC


# ── CFSG Identity Booleans ────────────────────────────────────────────────────

def test_identity_sporadic_is_2n():
    """26 sporadic groups = 2N = 2×13 EXACT."""
    from urt.sporadic_cathedral import IDENTITY_SPORADIC_IS_2N
    assert IDENTITY_SPORADIC_IS_2N is True


def test_identity_happy_is_f():
    """20 Happy Family groups = F = icosahedron faces EXACT."""
    from urt.sporadic_cathedral import IDENTITY_HAPPY_IS_F
    assert IDENTITY_HAPPY_IS_F is True


def test_identity_pariah_is_dfact():
    """6 Pariah groups = D! = 3! = 6 EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PARIAH_IS_DFACT
    assert IDENTITY_PARIAH_IS_DFACT is True


def test_identity_infinite_families():
    """18 infinite families = D × D! = 3 × 6 EXACT."""
    from urt.sporadic_cathedral import IDENTITY_INFINITE_FAMILIES
    assert IDENTITY_INFINITE_FAMILIES is True


def test_sporadic_is_2n_arithmetic():
    """Verify 26 = 2 × 13 directly."""
    from urt.shell_closure import N
    from urt.sporadic_cathedral import N_SPORADIC
    assert N_SPORADIC == 2 * N


def test_happy_is_f_arithmetic():
    """Verify 20 = F directly."""
    from urt.shell_closure import F
    from urt.sporadic_cathedral import N_HAPPY_FAMILY
    assert N_HAPPY_FAMILY == F


def test_pariah_is_dfact_arithmetic():
    """Verify 6 = factorial(D) = factorial(3) directly."""
    from urt.shell_closure import D
    from urt.sporadic_cathedral import N_PARIAH
    assert N_PARIAH == factorial(D)


def test_infinite_families_arithmetic():
    """Verify 18 = D × D! = 3 × 6 directly."""
    from urt.shell_closure import D
    from urt.sporadic_cathedral import N_INFINITE_FAMILIES
    assert N_INFINITE_FAMILIES == D * factorial(D)


def test_pariah_equals_v_over_2():
    """Pariah count = V/2 = 12/2 = 6."""
    from urt.shell_closure import V
    from urt.sporadic_cathedral import N_PARIAH
    assert N_PARIAH == V // 2


# ── Janko Group J₁ ───────────────────────────────────────────────────────────

def test_j1_order_value():
    """J₁ has order 175560."""
    from urt.sporadic_cathedral import J1_ORDER
    assert J1_ORDER == 175560


def test_j1_identity():
    """J₁ order identity boolean is True."""
    from urt.sporadic_cathedral import IDENTITY_J1
    assert IDENTITY_J1 is True


def test_j1_cathedral_formula():
    """J₁ = 2^D × D × q × (D!+1) × (2D+q) × (N+D!) = 175560."""
    from urt.shell_closure import D, N, q
    result = 2**D * D * q * (factorial(D) + 1) * (2*D + q) * (N + factorial(D))
    assert result == 175560


def test_j1_factor_2_to_d():
    """2^D = 8 divides J₁ order."""
    from urt.sporadic_cathedral import J1_ORDER
    from urt.shell_closure import D
    assert J1_ORDER % (2**D) == 0


def test_j1_verify_dict():
    """verify_j1() returns match=True."""
    from urt.sporadic_cathedral import verify_j1
    result = verify_j1()
    assert result["match"] is True
    assert result["order"] == 175560
    assert result["group"] == "J₁"


# ── Janko Group J₂ ───────────────────────────────────────────────────────────

def test_j2_order_value():
    """J₂ has order 604800."""
    from urt.sporadic_cathedral import J2_ORDER
    assert J2_ORDER == 604800


def test_j2_identity():
    """J₂ order identity boolean is True."""
    from urt.sporadic_cathedral import IDENTITY_J2
    assert IDENTITY_J2 is True


def test_j2_cathedral_formula():
    """J₂ = 2^(D!+1) × D^D × q^2 × (D!+1) = 604800."""
    from urt.shell_closure import D, q
    result = 2**(factorial(D) + 1) * D**D * q**2 * (factorial(D) + 1)
    assert result == 604800


def test_j2_factor_2_exp_7():
    """2^7 = 128 divides J₂ order (since D!+1 = 7)."""
    from urt.sporadic_cathedral import J2_ORDER
    from urt.shell_closure import D
    exp = factorial(D) + 1   # = 7
    assert J2_ORDER % (2**exp) == 0


def test_j2_verify_dict():
    """verify_j2() returns match=True."""
    from urt.sporadic_cathedral import verify_j2
    result = verify_j2()
    assert result["match"] is True
    assert result["order"] == 604800


# ── Tits Group ────────────────────────────────────────────────────────────────

def test_tits_order_value():
    """Tits group has order 17971200."""
    from urt.sporadic_cathedral import TITS_ORDER
    assert TITS_ORDER == 17971200


def test_tits_identity():
    """Tits order identity boolean is True."""
    from urt.sporadic_cathedral import IDENTITY_TITS
    assert IDENTITY_TITS is True


def test_tits_cathedral_formula():
    """Tits = 2^(2D+q) × D^D × q^2 × N = 17971200."""
    from urt.shell_closure import D, q, N
    result = 2**(2*D + q) * D**D * q**2 * N
    assert result == 17971200


def test_tits_factor_n():
    """N = 13 divides Tits order."""
    from urt.sporadic_cathedral import TITS_ORDER
    from urt.shell_closure import N
    assert TITS_ORDER % N == 0


def test_tits_verify_dict():
    """verify_tits() returns match=True."""
    from urt.sporadic_cathedral import verify_tits
    result = verify_tits()
    assert result["match"] is True
    assert result["order"] == 17971200


# ── McLaughlin Group McL ──────────────────────────────────────────────────────

def test_mcl_order_value():
    """McL has order 898128000."""
    from urt.sporadic_cathedral import MCL_ORDER
    assert MCL_ORDER == 898128000


def test_mcl_identity():
    """McL order identity boolean is True."""
    from urt.sporadic_cathedral import IDENTITY_MCL
    assert IDENTITY_MCL is True


def test_mcl_cathedral_formula():
    """McL = 2^(D!+1) × D^(D!) × q^D × (D!+1) × (2D+q) = 898128000."""
    from urt.shell_closure import D, q
    result = (
        2**(factorial(D) + 1) * D**factorial(D) * q**D
        * (factorial(D) + 1) * (2*D + q)
    )
    assert result == 898128000


def test_mcl_verify_dict():
    """verify_mcl() returns match=True."""
    from urt.sporadic_cathedral import verify_mcl
    result = verify_mcl()
    assert result["match"] is True
    assert result["order"] == 898128000


# ── Higman-Sims Group HS ──────────────────────────────────────────────────────

def test_hs_order_value():
    """HS has order 44352000."""
    from urt.sporadic_cathedral import HS_ORDER
    assert HS_ORDER == 44352000


def test_hs_identity():
    """HS order identity boolean is True."""
    from urt.sporadic_cathedral import IDENTITY_HS
    assert IDENTITY_HS is True


def test_hs_cathedral_formula():
    """HS = 2^(D²) × D^2 × q^D × (D!+1) × (2D+q) = 44352000."""
    from urt.shell_closure import D, q
    result = 2**(D**2) * D**2 * q**D * (factorial(D) + 1) * (2*D + q)
    assert result == 44352000


def test_hs_factor_2_exp_9():
    """2^(D²) = 2^9 = 512 divides HS order."""
    from urt.sporadic_cathedral import HS_ORDER
    from urt.shell_closure import D
    assert HS_ORDER % (2**(D**2)) == 0


def test_hs_verify_dict():
    """verify_hs() returns match=True."""
    from urt.sporadic_cathedral import verify_hs
    result = verify_hs()
    assert result["match"] is True
    assert result["order"] == 44352000


# ── Baby Monster exponents ────────────────────────────────────────────────────

def test_bm_2_exp_value():
    """Baby Monster 2-exponent = 41."""
    from urt.sporadic_cathedral import BM_2_EXP
    assert BM_2_EXP == 41


def test_bm_3_exp_value():
    """Baby Monster 3-exponent = 13 = N."""
    from urt.sporadic_cathedral import BM_3_EXP
    assert BM_3_EXP == 13


def test_bm_5_exp_value():
    """Baby Monster 5-exponent = 6 = D!."""
    from urt.sporadic_cathedral import BM_5_EXP
    assert BM_5_EXP == 6


def test_identity_bm_2():
    """BM 2-exponent 41 = G − D! − N EXACT."""
    from urt.sporadic_cathedral import IDENTITY_BM_2
    assert IDENTITY_BM_2 is True


def test_identity_bm_3():
    """BM 3-exponent 13 = N EXACT."""
    from urt.sporadic_cathedral import IDENTITY_BM_3
    assert IDENTITY_BM_3 is True


def test_identity_bm_5():
    """BM 5-exponent 6 = D! EXACT."""
    from urt.sporadic_cathedral import IDENTITY_BM_5
    assert IDENTITY_BM_5 is True


def test_bm_2_exp_arithmetic():
    """41 = G − D! − N = 60 − 6 − 13 directly."""
    from urt.shell_closure import D, N, G
    assert G - factorial(D) - N == 41


def test_bm_order_divisibility():
    """Baby Monster order is divisible by 2^41."""
    from urt.sporadic_cathedral import BM_ORDER, BM_2_EXP
    assert BM_ORDER % (2**BM_2_EXP) == 0


# ── Cathedral Primes ──────────────────────────────────────────────────────────

def test_prime_11_identity():
    """11 = 2D + q EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_11
    assert IDENTITY_PRIME_11 is True


def test_prime_13_identity():
    """13 = N EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_13
    assert IDENTITY_PRIME_13 is True


def test_prime_17_identity():
    """17 = V + q EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_17
    assert IDENTITY_PRIME_17 is True


def test_prime_19_identity():
    """19 = N + D! EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_19
    assert IDENTITY_PRIME_19 is True


def test_prime_23_identity():
    """23 = 2N − 3 EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_23
    assert IDENTITY_PRIME_23 is True


def test_prime_31_identity():
    """31 = 2^q − 1 EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_31
    assert IDENTITY_PRIME_31 is True


def test_prime_47_identity():
    """47 = D*N + 2^D EXACT."""
    from urt.sporadic_cathedral import IDENTITY_PRIME_47
    assert IDENTITY_PRIME_47 is True


def test_prime_11_arithmetic():
    """2D + q = 2×3 + 5 = 11 directly."""
    from urt.shell_closure import D, q
    assert 2*D + q == 11


def test_prime_17_arithmetic():
    """V + q = 12 + 5 = 17 directly."""
    from urt.shell_closure import V, q
    assert V + q == 17


def test_prime_19_arithmetic():
    """N + D! = 13 + 6 = 19 directly."""
    from urt.shell_closure import D, N
    assert N + factorial(D) == 19


def test_prime_23_arithmetic():
    """2N − 3 = 2×13 − 3 = 23 directly."""
    from urt.shell_closure import N
    assert 2*N - 3 == 23


def test_prime_31_arithmetic():
    """2^q − 1 = 2^5 − 1 = 31 directly."""
    from urt.shell_closure import q
    assert 2**q - 1 == 31


def test_prime_47_arithmetic():
    """D*N + 2^D = 3×13 + 8 = 47 directly."""
    from urt.shell_closure import D, N
    assert D*N + 2**D == 47


def test_cathedral_sporadic_primes_dict_keys():
    """Dictionary covers exactly 10 Cathedral primes."""
    from urt.sporadic_cathedral import CATHEDRAL_SPORADIC_PRIMES
    expected_primes = {3, 5, 7, 11, 13, 17, 19, 23, 31, 47}
    assert set(CATHEDRAL_SPORADIC_PRIMES.keys()) == expected_primes


def test_cathedral_primes_all_prime():
    """Every key in CATHEDRAL_SPORADIC_PRIMES is actually prime."""
    from urt.sporadic_cathedral import CATHEDRAL_SPORADIC_PRIMES, _is_prime
    for p in CATHEDRAL_SPORADIC_PRIMES:
        assert _is_prime(p), f"{p} should be prime"


def test_cathedral_primes_check_all_match():
    """cathedral_sporadic_primes_check() returns match=True for all entries."""
    from urt.sporadic_cathedral import cathedral_sporadic_primes_check
    checks = cathedral_sporadic_primes_check()
    for prime, data in checks.items():
        assert data["match"] is True, f"Prime {prime} mismatch"
        assert data["is_prime"] is True, f"{prime} should be prime"


# ── Summary and reporting functions ───────────────────────────────────────────

def test_sporadic_summary_all_verified():
    """sporadic_summary() reports all_identities_verified=True."""
    from urt.sporadic_cathedral import sporadic_summary
    summary = sporadic_summary()
    assert summary["all_identities_verified"] is True


def test_sporadic_summary_structure():
    """sporadic_summary() has the expected top-level keys."""
    from urt.sporadic_cathedral import sporadic_summary
    summary = sporadic_summary()
    expected_keys = {
        "cathedral_integers", "cfsg_structure", "group_orders",
        "cathedral_primes", "all_identities_verified",
    }
    assert set(summary.keys()) == expected_keys


def test_sporadic_summary_group_orders_keys():
    """group_orders section covers all six groups."""
    from urt.sporadic_cathedral import sporadic_summary
    summary = sporadic_summary()
    group_keys = set(summary["group_orders"].keys())
    assert "J1" in group_keys
    assert "J2" in group_keys
    assert "Tits" in group_keys
    assert "McL" in group_keys
    assert "HS" in group_keys
    assert "Baby_Monster" in group_keys


def test_cfsg_structure_all_verified():
    """verify_cfsg_structure() returns all_verified=True."""
    from urt.sporadic_cathedral import verify_cfsg_structure
    result = verify_cfsg_structure()
    assert result["all_verified"] is True


def test_baby_monster_all_verified():
    """verify_baby_monster_exponents() returns all_verified=True."""
    from urt.sporadic_cathedral import verify_baby_monster_exponents
    result = verify_baby_monster_exponents()
    assert result["all_verified"] is True


def test_print_sporadic_report_runs(capsys):
    """print_sporadic_report() runs without error and outputs text."""
    from urt.sporadic_cathedral import print_sporadic_report
    print_sporadic_report()
    captured = capsys.readouterr()
    assert "CATHEDRAL SPORADIC GROUPS" in captured.out
    assert "OK" in captured.out
    assert "FAIL" not in captured.out


# ── Aggregate identity check ──────────────────────────────────────────────────

def test_all_identity_booleans_true():
    """Every IDENTITY_* constant in the module is True."""
    import urt.sporadic_cathedral as sc
    identities = {
        "IDENTITY_SPORADIC_IS_2N": sc.IDENTITY_SPORADIC_IS_2N,
        "IDENTITY_HAPPY_IS_F": sc.IDENTITY_HAPPY_IS_F,
        "IDENTITY_PARIAH_IS_DFACT": sc.IDENTITY_PARIAH_IS_DFACT,
        "IDENTITY_INFINITE_FAMILIES": sc.IDENTITY_INFINITE_FAMILIES,
        "IDENTITY_J1": sc.IDENTITY_J1,
        "IDENTITY_J2": sc.IDENTITY_J2,
        "IDENTITY_TITS": sc.IDENTITY_TITS,
        "IDENTITY_MCL": sc.IDENTITY_MCL,
        "IDENTITY_HS": sc.IDENTITY_HS,
        "IDENTITY_BM_2": sc.IDENTITY_BM_2,
        "IDENTITY_BM_3": sc.IDENTITY_BM_3,
        "IDENTITY_BM_5": sc.IDENTITY_BM_5,
        "IDENTITY_PRIME_11": sc.IDENTITY_PRIME_11,
        "IDENTITY_PRIME_13": sc.IDENTITY_PRIME_13,
        "IDENTITY_PRIME_17": sc.IDENTITY_PRIME_17,
        "IDENTITY_PRIME_19": sc.IDENTITY_PRIME_19,
        "IDENTITY_PRIME_23": sc.IDENTITY_PRIME_23,
        "IDENTITY_PRIME_31": sc.IDENTITY_PRIME_31,
        "IDENTITY_PRIME_47": sc.IDENTITY_PRIME_47,
    }
    failed = [name for name, val in identities.items() if not val]
    assert not failed, f"Failed identities: {failed}"
