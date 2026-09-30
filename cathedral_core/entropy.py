from math import log
from .constants import DELTA, ETA_DELTA

P5 = DELTA * DELTA / (1.0 + DELTA * DELTA)
A_WEIGHT = 1.0 / (4.0 * (1.0 + DELTA * DELTA))
B_WEIGHT = DELTA * DELTA / (4.0 * (1.0 + DELTA * DELTA))

def binary_entropy(p: float) -> float:
    if p <= 0.0 or p >= 1.0:
        return 0.0
    return -p * log(p) - (1.0 - p) * log(1.0 - p)

def responsive_entropy_over_kb() -> float:
    return binary_entropy(P5)

def entropy_variation_over_kb(dp5: float) -> float:
    return 2.0 * ETA_DELTA * dp5

def bkm_stiffness_over_kb() -> float:
    d2 = DELTA * DELTA
    return 8.0 * ETA_DELTA * (1.0 + d2) / (1.0 - d2)

def rho_star_diagonal():
    """Eight eigenvalues of rho_* = a I4 direct-sum b I4."""
    return (A_WEIGHT,) * 4 + (B_WEIGHT,) * 4
