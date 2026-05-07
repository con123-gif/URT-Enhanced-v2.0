"""
URT — Universal Recursive Tuning
δ★ = (80/81)·π/(13φ) ≈ 0.14751

A unified chaos-physics framework connecting icosahedral geometry to
fundamental constants, critical transitions, and real-world prediction.
"""

from .metrics import (
    lyapunov_rosenstein,
    tau_avalanche,
    D_KY_from_l1_proxy,
    DKY_from_delta_monotone,
    delta_metric,
)
from .shell_closure import (
    DELTA_STAR,
    compute_all_constants,
    urt_evolve,
)

__version__ = "2.0.0"
__author__ = "Cornelius Lytollis"
__all__ = [
    "lyapunov_rosenstein",
    "tau_avalanche",
    "D_KY_from_l1_proxy",
    "DKY_from_delta_monotone",
    "delta_metric",
    "DELTA_STAR",
    "compute_all_constants",
    "urt_evolve",
]
