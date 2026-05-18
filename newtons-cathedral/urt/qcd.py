"""
QCD sector — SU(3) lives in the A_5 dark exhaust.

Strong coupling closed form:

    α_s(M_Z)  =  δ★ · (q − 1) / q  =  δ★ · 4/5  =  0.11801    (PDG: 0.1179)

SU(3) emerges from the 9-dimensional A_5 sector as follows.  The A_5
sector has 9 = D² eigenmodes.  The unique λ = N = 13 mode is the
"trace singlet" — central amplitude  −√(V/N) ≈ −0.961, all 12 surface
amplitudes equal at +1/√(V·N) ≈ +0.080 (the centre-vs-shell mode).

Removing this trace singlet leaves 9 − 1 = 8 = D² − 1 = dim su(3) modes —
the 8 SU(3) gluons.  So

    A_5 sector  =  u(3)  =  su(3) ⊕ u(1)
                =  8 gluons  +  1 photon-like trace singlet

Cartan classification: among the connected simple Lie algebras of
dimension exactly 8, only A_2 = sl(3, ℂ) exists; its compact real form
is su(3).  The choice is forced, not made.

This module provides the SU(3) generator construction at the count
level; the explicit 13×13 Hermitian embedding is provided by
A_5 eigenmode projection (see fermions.py for the parallel Yukawa
construction).
"""
from __future__ import annotations

from .foundations import D, N, q
from .foundations import DELTA_STAR


# ── Headline QCD prediction ─────────────────────────────────────────────
ALPHA_S_MZ: float = DELTA_STAR * (q - 1) / q       # = 0.11801…


# ── SU(3) count-level decomposition of the A_5 sector ───────────────────
N_GLUONS:       int = D * D - 1                      # = 8 = dim su(3)
N_TRACE_SINGLET: int = 1                              # = 1 = dim u(1)
A5_COUNT_CHECK: int = N_GLUONS + N_TRACE_SINGLET    # = 9 = |A_5|


def qcd_audit() -> bool:
    ok = True
    # PDG α_s(M_Z) = 0.1179 ± 0.0009 → Cathedral 0.11801 agrees 0.1 %.
    pdg = 0.1179
    ok &= abs(ALPHA_S_MZ - pdg) / pdg < 1e-2
    ok &= N_GLUONS == 8 == D * D - 1
    ok &= A5_COUNT_CHECK == 9
    return bool(ok)


__all__ = [
    "ALPHA_S_MZ", "N_GLUONS", "N_TRACE_SINGLET", "A5_COUNT_CHECK",
    "qcd_audit",
]
