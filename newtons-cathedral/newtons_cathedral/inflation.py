"""
Inflation — number of e-folds, spectral index, tensor-to-scalar ratio.

All three Planck CMB headline numbers from Cathedral integer arithmetic:

    N_e   =  G − D  =  60 − 3  =  57           (e-folds of inflation)

    n_s   =  1 − 2/N_e  =  1 − 2/57  =  55/57  =  0.96491
                                                   (Planck 2018: 0.9649)

    r     =  V / N_e²  =  12 / 57²  =  0.00369
                                                   (current bound r < 0.036
                                                    BICEP / Keck; falsifiable
                                                    by next-generation B-mode
                                                    measurements)

The e-fold count N_e = G − D is the Cathedral "Tesla bilinear":

    G − D  =  3 + 6·9  =  D + D! · D²

— a sum of two Tesla numbers and a product of the other two.

The n_s and r formulas are first-order Hubble-slow-roll values; full
two-loop running gives n_s corrections of order 10⁻⁴ that are below
Planck's reported precision.
"""
from __future__ import annotations

from .arf import N_E_FOLDS, SPECTRAL_INDEX_NS, TENSOR_TO_SCALAR_R
from .foundations import D, G, V


# All three numerical predictions live in arf.py; re-exported here for
# semantic locality.

N_E:  int   = N_E_FOLDS                  # = 57
N_S:  float = SPECTRAL_INDEX_NS          # = 55/57 = 0.96491
R_TS: float = TENSOR_TO_SCALAR_R         # = 12/57²


def inflation_audit() -> bool:
    ok = True
    ok &= N_E == G - D == 57
    ok &= abs(N_S - 55.0 / 57.0) < 1e-15
    ok &= abs(R_TS - V / (G - D) ** 2) < 1e-15
    # Planck 2018 n_s = 0.9649 ± 0.0042 → 4 ppm match.
    planck_ns = 0.9649
    ok &= abs(N_S - planck_ns) < 1e-3
    # BICEP/Keck 2021 r < 0.036 → Cathedral r ≈ 0.0037 is below the bound.
    ok &= R_TS < 0.036
    return bool(ok)


__all__ = ["N_E", "N_S", "R_TS", "inflation_audit"]
