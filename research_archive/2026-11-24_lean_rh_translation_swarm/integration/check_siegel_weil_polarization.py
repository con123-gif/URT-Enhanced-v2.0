#!/usr/bin/env python3
"""Exact sign/half-factor regressions for the human mixed-model bridge.

Uses free symbolic entries, not sampled matrices. This is a bounded
algebra certificate, not a Lean replay or a proof of convergence/RH.
The general-rank proofs are in the companion mathematical appendix.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

import sympy as s

PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
BLOBS = {
    "Lib/Weil/Construction/AdelicHeisenberg.lean":
        "6d56fe0aa1762a56778d40f9086f69e721f91b14",
    "Lib/Weil/Construction/FiniteHeisenberg.lean":
        "be448ff4db1da9bfa0fe7bd637272be079be2285",
    "Lib/Weil/Periods/BesselIntegral.lean":
        "b7eb71106debb76e1b97526f7c540b7d4d28bed8",
    "Lib/Weil/DualPair/PairSplitting.lean":
        "7060d2715dc64318e5f657357bce32c32bf11772",
    "Lib/SiegelWeil/Formula/ZeroTermHeight.lean":
        "0a910704dae028b30156fc8ab362d3425e50ada8",
    "Lib/SiegelWeil/RallisInner/SharpData.lean":
        "ea9f665a9a89411f1353d098ff2e0a4e59a719f5",
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source-root", type=Path, required=True,
                    help="Pinned grh-lean repository root")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    root = args.source_root.resolve()
    actual_pin = subprocess.check_output(
        ["git", "-C", str(root), "rev-parse", "HEAD"], text=True).strip()
    assert actual_pin == PIN, actual_pin
    manifest = []
    for rel, expected in BLOBS.items():
        data = (root / "grh-compact/src" / rel).read_bytes()
        actual = hashlib.sha1(
            b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        assert actual == expected, rel
        manifest.append({"path": rel, "blob": actual})

    good, negative = [], []

    def zero(name, value):
        entries = list(value) if isinstance(value, s.MatrixBase) else [value]
        residual = [s.simplify(s.expand(x)) for x in entries]
        assert all(x == 0 for x in residual), (name, residual)
        good.append(name)

    def nonzero(name, value):
        entries = list(value) if isinstance(value, s.MatrixBase) else [value]
        residual = [s.simplify(s.expand(x)) for x in entries]
        assert any(x != 0 for x in residual), name
        negative.append(name)

    t = s.symbols("t", real=True, nonzero=True)
    j = s.I * t
    one, nil = s.eye(2), s.zeros(2)
    h0 = s.BlockMatrix([[nil, one], [one, nil]]).as_explicit()
    skew = s.BlockMatrix([[nil, one], [-one, nil]]).as_explicit()
    basis = s.diag(1, 1, -j, -j)
    zero("skew_form_basis", basis.H * (-h0 / j) * basis - skew)
    b1, b2, bu, bv = s.symbols("b1 b2 bu bv", real=True)
    b = s.Matrix([[b1, bu + s.I*bv], [bu - s.I*bv, b2]])
    rad = s.BlockMatrix([[one, -b/j], [nil, one]]).as_explicit()
    std_rad = s.BlockMatrix([[one, b], [nil, one]]).as_explicit()
    zero("radical_basis", basis.inv() * rad * basis - std_rad)
    native_w = basis * skew * basis.inv()
    zero("weyl_basis", native_w - s.BlockMatrix(
        [[nil, -one/j], [j*one, nil]]).as_explicit())
    nonzero("wrong_basis_sign_detected",
            s.diag(1, 1, j, j).inv() * rad * s.diag(1, 1, j, j)
            - std_rad)

    def mat(prefix):
        real = s.symbols(prefix + "r0:4", real=True)
        imag = s.symbols(prefix + "i0:4", real=True)
        return s.Matrix(2, 2, [x + s.I*y for x, y in zip(real, imag)])

    a, c, ap_, cp, x = [mat(p) for p in ("a", "c", "d", "e", "x")]
    gram = s.diag(1, -1)

    def phase(xx, aa, cc):
        return s.trace(cc.H * gram * (2*xx + aa)) / 2

    cocycle = s.trace(cp.H * gram * a - c.H * gram * ap_) / 2
    zero("heisenberg_cocycle",
         phase(x, a, c) + phase(x+a, ap_, cp)
         - phase(x, a+ap_, c+cp) - cocycle)
    # Actual trace character sees the real part. Do not equate the
    # unsymmetrized complex exponents as complex polynomials.
    bx, by = -c/j, -cp/j
    native_beta = j*s.trace(ap_.H*gram*bx + by.H*gram*a)/2
    zero("hom_bicharacter_real_trace", s.re(s.expand(native_beta-cocycle)))
    nonzero("wrong_frequency_sign_detected",
            s.re(s.expand(native_beta+cocycle)))

    qa = s.trace(b * x.H * gram * x) / 2
    qxa = s.trace(b * (x+a).H * gram * (x+a)) / 2
    zero("unipotent_heisenberg_covariance", s.re(s.expand(
        qa - qxa + phase(x, a, c) - phase(x, a, c-a*b))))
    nonzero("missing_unipotent_half_detected", s.re(s.expand(
        2*qa - 2*qxa + phase(x, a, c) - phase(x, a, c-a*b))))
    row = s.BlockMatrix([[a, bx]]).as_explicit()
    transformed = row * native_w.inv()
    zero("weyl_translation_part", transformed[:, :2] - c)
    zero("weyl_frequency_part", -j * transformed[:, 2:] + a)

    real_z, imag_z = s.symbols("real_z imag_z", real=True)
    z = real_z + s.I*imag_z
    # psi_F=psi_E restricted to F: the real trace exponent is 2*x.
    zero("base_character_half_trace", 2*((z+s.conjugate(z))/2)-2*real_z)
    nonzero("missing_base_trace_half_detected",
            2*(z+s.conjugate(z))-2*real_z)
    pos, neg = s.symbols("positive_sum negative_sum", real=True)
    zero("isotropic_finite_vacuum_half", ((pos+neg)/2-neg).subs(pos, neg))
    nonzero("missing_signed_positive_factor_two_detected",
            (pos/2-neg).subs(pos, neg))

    result = {
        "scope": "exact symbolic normalization regressions only",
        "source_commit": actual_pin,
        "source_blobs_authenticated": manifest,
        "symbolic_dimensions": {"target": 2, "lagrangian": 2},
        "positive_identities": good,
        "negative_controls_detected": negative,
        "all_algebra_checks_ok": True,
        "convergence_proved_by_this_script": False,
        "independent_mathematical_audit": False,
        "new_Lean_execution": False,
        "full_RH_replay": False,
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"positive_identities": len(good),
                      "negative_controls": len(negative),
                      "all_algebra_checks_ok": True,
                      "new_Lean_execution": False}))


if __name__ == "__main__":
    main()
