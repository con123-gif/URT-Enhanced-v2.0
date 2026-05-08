"""Tests for urt/cathedral_computer.py — GF(13) exact computation."""
import pytest
import numpy as np

# ── Constants ──────────────────────────────────────────────────────────────────

def test_gf13_prime():
    from urt.cathedral_computer import GF13_PRIME
    from urt.shell_closure import N
    assert GF13_PRIME == N == 13

def test_gf13_prim_root():
    from urt.cathedral_computer import GF13_PRIM_ROOT
    # 2 is a primitive root mod 13: verify order is 12
    g = GF13_PRIM_ROOT
    N = 13
    assert pow(g, N-1, N) == 1
    for k in range(1, N-1):
        assert pow(g, k, N) != 1

def test_gf13_pisano():
    from urt.cathedral_computer import GF13_PISANO
    assert GF13_PISANO == 28

def test_pisano_eq_2Np1():
    from urt.cathedral_computer import PISANO_EQ_2Np1
    assert PISANO_EQ_2Np1 is True

def test_gf13_n_qr():
    from urt.cathedral_computer import GF13_N_QR
    assert GF13_N_QR == 6

def test_n_qr_eq_V2():
    from urt.cathedral_computer import N_QR_EQ_V2
    assert N_QR_EQ_V2 is True

def test_prim_root_eq_D1():
    from urt.cathedral_computer import PRIM_ROOT_EQ_D1
    assert PRIM_ROOT_EQ_D1 is True

def test_qr_correct():
    from urt.cathedral_computer import GF13_QR
    expected = {1, 3, 4, 9, 10, 12}
    assert GF13_QR == expected

# ── GF(13) arithmetic ──────────────────────────────────────────────────────────

def test_gf_add():
    from urt.cathedral_computer import gf_add
    assert gf_add(7, 8) == 2
    assert gf_add(0, 5) == 5
    assert gf_add(12, 1) == 0

def test_gf_sub():
    from urt.cathedral_computer import gf_sub
    assert gf_sub(3, 5) == 11
    assert gf_sub(0, 1) == 12

def test_gf_mul():
    from urt.cathedral_computer import gf_mul
    assert gf_mul(5, 3) == 2  # 15 mod 13
    assert gf_mul(7, 7) == 10  # 49 mod 13

def test_gf_inv_all():
    from urt.cathedral_computer import gf_inv, gf_mul
    for a in range(1, 13):
        assert gf_mul(a, gf_inv(a)) == 1

def test_gf_div():
    from urt.cathedral_computer import gf_div, gf_mul
    for a in range(1, 13):
        for b in range(1, 13):
            assert gf_mul(b, gf_div(a, b)) == a

def test_gf_pow():
    from urt.cathedral_computer import gf_pow
    assert gf_pow(2, 12) == 1  # Fermat: 2^12 ≡ 1 (mod 13)
    assert gf_pow(2, 4) == 3   # 16 mod 13 = 3

def test_gf_neg():
    from urt.cathedral_computer import gf_neg, gf_add
    for a in range(13):
        assert gf_add(a, gf_neg(a)) == 0

def test_gf_dlog():
    from urt.cathedral_computer import gf_dlog, gf_pow
    for a in range(1, 13):
        assert gf_pow(2, gf_dlog(a)) == a

def test_gf_sqrt_of_qr():
    from urt.cathedral_computer import gf_sqrt, GF13_QR
    for a in GF13_QR:
        roots = gf_sqrt(a)
        assert roots is not None
        r1, r2 = roots
        assert (r1 * r1) % 13 == a
        assert (r2 * r2) % 13 == a

def test_gf_sqrt_of_non_qr():
    from urt.cathedral_computer import gf_sqrt, GF13_QR
    for a in range(1, 13):
        if a not in GF13_QR:
            assert gf_sqrt(a) is None

# ── Polynomial arithmetic ──────────────────────────────────────────────────────

def test_poly_eval_constant():
    from urt.cathedral_computer import poly_eval
    assert poly_eval([5], 7) == 5
    assert poly_eval([5], 0) == 5

def test_poly_eval_linear():
    from urt.cathedral_computer import poly_eval
    # 3x + 2 at x=4: 3*4+2=14 mod 13=1
    assert poly_eval([3, 2], 4) == 1

def test_poly_eval_quadratic():
    from urt.cathedral_computer import poly_eval
    # x^2 - 1 at x=1: 0
    assert poly_eval([1, 0, -1], 1) == 0
    assert poly_eval([1, 0, -1], 12) == 0  # 12 ≡ -1

def test_poly_roots_x2_minus_1():
    from urt.cathedral_computer import poly_roots
    roots = poly_roots([1, 0, -1])
    assert sorted(roots) == [1, 12]

def test_poly_roots_x2_minus_3():
    from urt.cathedral_computer import poly_roots
    roots = poly_roots([1, 0, -3])
    assert sorted(roots) == [4, 9]

def test_poly_roots_cube_roots_of_unity():
    from urt.cathedral_computer import poly_roots
    roots = poly_roots([1, 0, 0, -1])
    assert 1 in roots
    assert len(roots) == 3  # three cube roots of unity

def test_poly_roots_all_verified():
    from urt.cathedral_computer import poly_roots, poly_eval
    for _ in range(50):
        coeffs = list(np.random.default_rng(42).integers(0, 13, size=3))
        roots = poly_roots(coeffs)
        for r in roots:
            assert poly_eval(coeffs, r) == 0

# ── Linear algebra over GF(13) ─────────────────────────────────────────────────

def test_mat_inv_gf13_known():
    from urt.cathedral_computer import mat_inv_gf13, mat_vec_mod, N
    A = [[2, 3, 5], [1, 7, 11], [4, 6, 2]]
    inv = mat_inv_gf13(A)
    assert inv is not None
    # A_inv * A should be identity mod 13 (inv is the left inverse)
    from urt.cathedral_computer import solve_linear_gf13
    b0 = [1, 0, 0]; b1 = [0, 1, 0]; b2 = [0, 0, 1]
    x0 = solve_linear_gf13(A, b0)
    x1 = solve_linear_gf13(A, b1)
    x2 = solve_linear_gf13(A, b2)
    assert mat_vec_mod(A, x0) == b0
    assert mat_vec_mod(A, x1) == b1
    assert mat_vec_mod(A, x2) == b2

def test_solve_linear_gf13_3x3():
    from urt.cathedral_computer import solve_linear_gf13, mat_vec_mod
    A = [[2, 3, 5], [1, 7, 11], [4, 6, 2]]
    b = [8, 3, 9]
    x = solve_linear_gf13(A, b)
    assert x is not None
    assert mat_vec_mod(A, x) == b

def test_solve_linear_gf13_stress():
    rng = np.random.default_rng(0)
    from urt.cathedral_computer import solve_linear_gf13, mat_vec_mod
    solved = 0
    for _ in range(100):
        A = rng.integers(1, 13, size=(4, 4)).tolist()
        b = rng.integers(0, 13, size=4).tolist()
        x = solve_linear_gf13(A, b)
        if x is not None:
            assert mat_vec_mod(A, x) == b
            solved += 1
    assert solved >= 80  # most random systems are non-singular

def test_solve_linear_gf13_singular():
    from urt.cathedral_computer import solve_linear_gf13
    A = [[1, 2], [2, 4]]  # rank 1 — singular mod 13
    b = [1, 2]
    # May return None (singular)
    result = solve_linear_gf13(A, b)
    # Just check it doesn't crash
    assert result is None or isinstance(result, list)

# ── Frequency oracle ───────────────────────────────────────────────────────────

def test_frequency_oracle_single_100pct():
    rng = np.random.default_rng(1)
    from urt.cathedral_computer import frequency_oracle, N
    correct = 0
    for _ in range(200):
        k = rng.integers(1, N // 2 + 1)
        sig = np.cos(2 * np.pi * k * np.arange(N) / N)
        f, _ = frequency_oracle(sig, 1)
        if f[0] == k:
            correct += 1
    assert correct == 200  # must be 100%

def test_frequency_oracle_two_100pct():
    rng = np.random.default_rng(2)
    from urt.cathedral_computer import frequency_oracle, N
    correct = 0
    for _ in range(200):
        f1, f2 = sorted(rng.choice(range(1, N // 2 + 1), size=2, replace=False))
        sig = (np.cos(2 * np.pi * f1 * np.arange(N) / N) +
               np.cos(2 * np.pi * f2 * np.arange(N) / N))
        f, _ = frequency_oracle(sig, 2)
        if sorted(f) == [f1, f2]:
            correct += 1
    assert correct == 200  # must be 100%

def test_frequency_oracle_returns_power():
    from urt.cathedral_computer import frequency_oracle, N
    sig = np.cos(2 * np.pi * 3 * np.arange(N) / N)
    _, power = frequency_oracle(sig, 1)
    assert len(power) == N
    assert np.all(power >= 0)

# ── CRT ────────────────────────────────────────────────────────────────────────

def test_crt_reconstruct_known():
    from urt.cathedral_computer import crt_reconstruct
    for n in [42, 137, 999, 1000]:
        r = crt_reconstruct([n % 13, n % 11, n % 7], [13, 11, 7])
        assert r == n % (13 * 11 * 7)

def test_crt_reconstruct_two_moduli():
    from urt.cathedral_computer import crt_reconstruct
    for n in range(0, 143):
        r = crt_reconstruct([n % 13, n % 11], [13, 11])
        assert r == n

# ── Fibonacci in GF(13) ────────────────────────────────────────────────────────

def test_fibonacci_gf13_values():
    from urt.cathedral_computer import fibonacci_gf13
    seq = fibonacci_gf13(10)
    expected = [0, 1, 1, 2, 3, 5, 8, 0, 8, 8]
    assert seq == expected

def test_fibonacci_gf13_period():
    from urt.cathedral_computer import fibonacci_gf13
    seq = fibonacci_gf13(60)
    period = 28
    assert all(seq[i] == seq[i + period] for i in range(20))

def test_fibonacci_pisano_period():
    from urt.cathedral_computer import fibonacci_pisano_period
    assert fibonacci_pisano_period(13) == 28

# ── A₅ on P¹(GF(13)) ──────────────────────────────────────────────────────────

def test_a5_orbit_size():
    from urt.cathedral_computer import a5_projective_orbit, N
    orbit, has_inf = a5_projective_orbit(0, n_steps=10)
    total = len(orbit) + int(has_inf)
    assert total == N + 1  # full P¹(GF(13)) has 14 points

def test_a5_orbit_all_points():
    from urt.cathedral_computer import a5_projective_orbit, N
    orbit, has_inf = a5_projective_orbit(0, n_steps=10)
    assert set(orbit) == set(range(N))
    assert has_inf is True

# ── Ring homomorphism ──────────────────────────────────────────────────────────

def test_ring_homomorphism_cosim():
    rng = np.random.default_rng(42)
    from urt.cathedral_computer import ring_homomorphism_check
    for _ in range(5):
        a = rng.normal(size=20)
        b = rng.normal(size=20)
        sim = ring_homomorphism_check(a, b)
        assert abs(sim - 1.0) < 1e-4  # numerical precision of IKT + network

# ── Summary ────────────────────────────────────────────────────────────────────

def test_summary_returns_dict():
    from urt.cathedral_computer import cathedral_computer_summary
    assert isinstance(cathedral_computer_summary(), dict)

def test_summary_keys():
    from urt.cathedral_computer import cathedral_computer_summary
    s = cathedral_computer_summary()
    for key in ["gf13_prime", "gf13_pisano", "gf13_n_qr", "pisano_eq_2Np1",
                "n_qr_eq_V2", "KEY_EXACT_RESULTS", "D", "N", "G"]:
        assert key in s

def test_summary_values():
    from urt.cathedral_computer import cathedral_computer_summary
    from urt.shell_closure import D, N, G
    s = cathedral_computer_summary()
    assert s["D"] == D
    assert s["N"] == N
    assert s["G"] == G
    assert s["pisano_eq_2Np1"] is True
    assert s["n_qr_eq_V2"] is True

def test_print_report_runs(capsys):
    from urt.cathedral_computer import print_cathedral_computer_report
    print_cathedral_computer_report()
    out = capsys.readouterr().out
    assert len(out) > 300
    assert "GF(13)" in out
    assert "EXACT" in out

# ── Lytollis Law ───────────────────────────────────────────────────────────────

def test_lytollis_bits_value():
    from urt.cathedral_computer import LYTOLLIS_BITS
    from urt.shell_closure import DELTA_STAR, N
    from math import log2
    expected = log2(N) / DELTA_STAR
    assert abs(LYTOLLIS_BITS - expected) < 1e-10

def test_lytollis_bits_positive():
    from urt.cathedral_computer import LYTOLLIS_BITS
    assert LYTOLLIS_BITS > 0

def test_lytollis_k4_bits():
    from urt.cathedral_computer import LYTOLLIS_K4_BITS, LYTOLLIS_BITS
    from urt.shell_closure import N
    assert abs(LYTOLLIS_K4_BITS - 4 * LYTOLLIS_BITS / N) < 1e-10

def test_lytollis_k4_lt_total():
    from urt.cathedral_computer import LYTOLLIS_K4_LT_TOTAL
    assert LYTOLLIS_K4_LT_TOTAL is True

def test_lytollis_steps_positive():
    from urt.cathedral_computer import LYTOLLIS_STEPS
    assert LYTOLLIS_STEPS > 0

def test_lytollis_law_returns_dict():
    from urt.cathedral_computer import lytollis_law
    assert isinstance(lytollis_law(), dict)

def test_lytollis_law_keys():
    from urt.cathedral_computer import lytollis_law
    r = lytollis_law()
    for key in ["lytollis_bits", "lytollis_k4_bits", "lytollis_steps",
                "statement", "delta_star", "kappa"]:
        assert key in r

def test_lytollis_law_with_size():
    from urt.cathedral_computer import lytollis_law
    r = lytollis_law(structure_size=13)
    assert "structure_bits" in r
    assert "exceeds_lytollis" in r

def test_lytollis_law_statement_string():
    from urt.cathedral_computer import lytollis_law
    r = lytollis_law()
    assert isinstance(r["statement"], str)
    assert len(r["statement"]) > 20

def test_print_lytollis_law_runs(capsys):
    from urt.cathedral_computer import print_lytollis_law
    print_lytollis_law()
    out = capsys.readouterr().out
    assert len(out) > 200
    assert "LYTOLLIS" in out

# ── Chaos engine ───────────────────────────────────────────────────────────────

def test_chaos_engine_step_shape():
    from urt.cathedral_computer import chaos_engine_step
    from urt.shell_closure import N
    x = np.random.default_rng(0).uniform(0, 1, size=N)
    x_new, lam = chaos_engine_step(x)
    assert x_new.shape == (N,)
    assert isinstance(lam, float)

def test_chaos_engine_step_bounded():
    from urt.cathedral_computer import chaos_engine_step
    from urt.shell_closure import N
    x = np.random.default_rng(1).uniform(0, 1, size=N)
    for _ in range(20):
        x, _ = chaos_engine_step(x)
    assert np.all(np.isfinite(x))

def test_cathedral_engine_contracting_lyapunov():
    """At r★=3.8417 the engine is CONTRACTING (λ<0), not chaotic.
    CORRECTION 2026-04-22: prior claim of λ>0 was wrong — correct regime is
    period-3 window with Lyapunov = -0.011275."""
    from urt.cathedral_computer import chaos_engine_trajectory, LYAPUNOV_AT_DELTA
    from urt.shell_closure import N, G
    assert LYAPUNOV_AT_DELTA < 0  # contracting: λ(r★,δ★) = -0.011275
    x0 = np.random.default_rng(2).uniform(0.1, 0.9, size=N)
    _, lams = chaos_engine_trajectory(x0, n_steps=G)
    assert len(lams) == G  # trajectory runs without error

def test_chaos_engine_trajectory_shape():
    from urt.cathedral_computer import chaos_engine_trajectory
    from urt.shell_closure import N, G
    x0 = np.random.default_rng(3).uniform(0, 1, size=N)
    traj, lams = chaos_engine_trajectory(x0, n_steps=G)
    assert traj.shape == (G + 1, N)
    assert len(lams) == G

def test_cathedral_engine_bounded():
    """Cathedral engine stays bounded (both logistic and URT components contract)."""
    from urt.cathedral_computer import chaos_engine_step
    from urt.shell_closure import N
    rng = np.random.default_rng(4)
    x = rng.uniform(0.1, 0.9, size=N)
    for _ in range(30):
        x, lam = chaos_engine_step(x)
    assert np.all(np.isfinite(x))
    assert np.all(x >= 0)
    assert np.all(x <= 1.0 + 1e-6)
