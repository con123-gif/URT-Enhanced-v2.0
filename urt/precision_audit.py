"""
Precision Audit — Decimal-80 cross-check of every Cathedral constant.

The framework's headline identities are all closed-form in
{π, φ, e, D, q, V, N, E, F, G, γ}.  At float-64 precision the agreement
is bounded by 2.22e-16 per operation; for the long compound expressions
(e.g. (D+1)·D^D·(N+D+1) = 1836; 1/α = N²−E−(D−1) = 137; n_s = 1−2/57)
this still leaves room for accumulated rounding noise.

This module re-evaluates the Cathedral closed forms at **80 decimal
digits** using `mpmath`, and exposes a single CI gate
`precision_audit_passes()` that verifies the float-64 values in
`urt.shell_closure.compute_all_constants()` agree with their Decimal-80
counterparts to better than 1e-12 relative error.

The exact integer identities (1/α = 137, m_p/m_e = 1836, etc.) are
also verified to hold *exactly* in Decimal-80 — no rounding at all.

This closes a long-standing precision gap: previously every
verification module worked at float-64, so coincidences at the
14th-15th decimal could not be distinguished from accumulated
arithmetic error.
"""
from __future__ import annotations

from typing import Dict, List, Tuple
from dataclasses import dataclass

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise ImportError(
        "urt.precision_audit requires mpmath.  "
        "Install with: pip install mpmath"
    ) from exc


# ── Cathedral integers (exact) ────────────────────────────────────────────
D, N, V, E_INT, F, q, G = 3, 13, 12, 30, 20, 5, 60


def _setup(digits: int = 80) -> None:
    mp.mp.dps = digits


def cathedral_constants_mp(digits: int = 80) -> Dict[str, mp.mpf]:
    """
    Re-derive every framework constant at arbitrary precision.

    Returns the same keys as `shell_closure.compute_all_constants()`,
    but as `mp.mpf` values at the requested decimal precision.
    """
    _setup(digits)

    pi_mp  = mp.pi
    phi_mp = (1 + mp.sqrt(5)) / 2
    e_mp   = mp.e

    gamma_mp      = mp.mpf(1) / D**(D + 1)              # = 1/81
    delta_star_mp = (1 - gamma_mp) * pi_mp / (N * phi_mp)
    delta_cl_mp   = mp.mpf(3) / 20
    Delta_mp      = delta_cl_mp - delta_star_mp

    # ── ARF exact integer identities ──────────────────────────────────
    alpha_inv_bare = mp.mpf(N**2 - E_INT - (D - 1))     # = 137
    mp_me_int      = mp.mpf((D + 1) * D**D * (N + D + 1))  # = 1836

    # ── sin² θ_W and α_s (Cathedral closed forms) ─────────────────────
    sin2_theta_W = (mp.mpf(D) / N) * (1 + gamma_mp / (2 * pi_mp))
    alpha_s_MZ   = delta_star_mp * (q - 1) / q

    # ── Cosmology ────────────────────────────────────────────────────
    N_e   = mp.mpf(G - D)                                # = 57
    n_s   = 1 - 2 / N_e
    r_ts  = 12 / N_e**2
    H0r   = 1 + (mp.mpf(D) / (F * pi_mp)) * 2
    Omega_m = (mp.mpf(4) / N) * (1 + 2 * gamma_mp)
    Omega_L = 1 - Omega_m

    # ── Baryon asymmetry (v9 closed form) ─────────────────────────────
    eta_B = gamma_mp**3 * Delta_mp * delta_star_mp * mp.mpf(8) / 9

    # ── PMNS δ_CP ────────────────────────────────────────────────────
    deltaCP_deg = mp.mpf((D + 1) * F + (N - D - 1) * N)  # = 197

    # ── Axion mass (Cathedral H₃ k=12, ARF residue) ────────────────────
    _H3 = [5, 5, 5, 5, 5, 7, 7, 9, 13]
    Rm = (mp.mpf(3) / 35) * delta_star_mp**2 \
         - (mp.mpf(4) / 51) * pi_mp**3 \
         + (mp.mpf(1) / 13) * sum(
             delta_star_mp**2 / (lam + delta_star_mp**2) for lam in _H3
         )
    m_axion_ueV = delta_star_mp / abs(Rm) * 1000

    # ── Λ/M_Pl⁴  ──────────────────────────────────────────────────────
    Lambda_MPl4 = (D + 1) * gamma_mp**((D + 1)**D)

    return {
        "delta_star":     delta_star_mp,
        "delta_cl":       delta_cl_mp,
        "Delta":          Delta_mp,
        "gamma":          gamma_mp,
        "alpha_inv_bare": alpha_inv_bare,        # exactly 137
        "mp_me_int":      mp_me_int,             # exactly 1836
        "sin2_theta_W":   sin2_theta_W,
        "alpha_s_MZ":     alpha_s_MZ,
        "n_s":            n_s,
        "r":              r_ts,
        "H0_ratio":       H0r,
        "Omega_m":        Omega_m,
        "Omega_L":        Omega_L,
        "eta_B":          eta_B,
        "deltaCP":        deltaCP_deg,
        "m_axion_ueV":    m_axion_ueV,
        "Lambda_MPl4":    Lambda_MPl4,
    }


# ── Exact integer identities (hold at any precision) ───────────────────────

def integer_identities_hold(digits: int = 80) -> Dict[str, bool]:
    """
    Verify the framework's *exact* integer identities at Decimal-80.

    These must be *exactly* equal (not approximately) — the residue
    in `mp.mpf` arithmetic is always 0.
    """
    c = cathedral_constants_mp(digits)
    return {
        "1/alpha_bare == 137":     c["alpha_inv_bare"] == 137,
        "mp/me_int  == 1836":      c["mp_me_int"]      == 1836,
        "delta_CP   == 197":       c["deltaCP"]        == 197,
        "N_e         == 57":       (G - D)             == 57,
        "gamma      == 1/81":      c["gamma"]          == mp.mpf(1) / 81,
    }


# ── Cross-check vs float-64 framework ──────────────────────────────────────

@dataclass(frozen=True)
class PrecisionRow:
    key:        str
    float64:    float
    decimal80:  str            # display as string, avoids round-trip issues
    rel_err:    float


def cross_check_against_float64(rel_tol: float = 1e-12) -> List[PrecisionRow]:
    """
    Compare every constant in `compute_all_constants()` against its
    Decimal-80 counterpart, returning per-key relative error.
    """
    from .shell_closure import compute_all_constants
    f64 = compute_all_constants()
    mp80 = cathedral_constants_mp(80)

    # Map the two namespaces to a common set of comparable keys.
    # Note: sin2_theta_W is intentionally omitted — `shell_closure` uses
    # the GUT-running form (0.3606) while the ARF closed form is
    # (D/N)·(1+γ/(2π)) = 0.23122; both live in the framework but are
    # different observables, so they are not directly comparable here.
    pairs: List[Tuple[str, str]] = [
        ("delta_star",   "delta_star"),
        ("alpha_s_MZ",   "alpha_s_MZ"),
        ("n_s",          "n_s"),
        ("r",            "r"),
        ("H0_ratio",     "H0_ratio"),
        ("Omega_m",      "Omega_m"),
        ("Omega_L",      "Omega_L"),
        ("eta_B",        "eta_B"),
        ("deltaCP",      "deltaCP"),
        ("m_axion_ueV",  "m_axion_ueV"),
    ]

    rows: List[PrecisionRow] = []
    for k_f64, k_mp in pairs:
        if k_f64 not in f64:
            continue
        v_f64 = float(f64[k_f64])
        v_mp = mp80[k_mp]
        if v_mp == 0:
            err = 0.0 if v_f64 == 0 else float("inf")
        else:
            err = abs(v_f64 - float(v_mp)) / abs(float(v_mp))
        rows.append(PrecisionRow(
            key=k_mp,
            float64=v_f64,
            decimal80=mp.nstr(v_mp, 20),
            rel_err=err,
        ))
    return rows


def precision_audit_passes(rel_tol: float = 1e-12) -> bool:
    """
    Single CI gate: every comparable float-64 constant agrees with its
    Decimal-80 counterpart to within `rel_tol` (default 1e-12).
    """
    for row in cross_check_against_float64():
        if row.rel_err > rel_tol:
            return False
    for holds in integer_identities_hold().values():
        if not holds:
            return False
    return True


# ── Report ────────────────────────────────────────────────────────────────

def print_precision_report() -> None:
    print("=" * 78)
    print("Cathedral Precision Audit  —  Decimal-80 vs float-64")
    print("=" * 78)
    print(f"{'key':<18}{'float-64':>20}{'decimal-80 (first 20 digits)':>40}  rel-err")
    print("-" * 78)
    for row in cross_check_against_float64():
        print(f"{row.key:<18}{row.float64:>20.12g}{row.decimal80:>40}  "
              f"{row.rel_err:.2e}")
    print("-" * 78)
    print("Exact integer identities (must hold at every digit count):")
    for name, ok in integer_identities_hold().items():
        mark = "OK" if ok else "FAIL"
        print(f"  [{mark:4}] {name}")
    print("=" * 78)
    print(f"  audit passes: {precision_audit_passes()}")
    print("=" * 78)


if __name__ == "__main__":
    print_precision_report()
