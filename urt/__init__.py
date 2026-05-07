"""
URT — Universal Recursive Tuning
δ★ = (80/81)·π/(13φ) ≈ 0.14751

A unified chaos-physics framework connecting icosahedral geometry to
fundamental constants, critical transitions, and real-world prediction.

Modules
-------
metrics          — Lyapunov exponent, tau_avalanche, D_KY, δ metric
shell_closure    — 13-site icosahedral shell, δ★, compute_all_constants
control          — URT control operator (O(N), κ < 1)
cathedral_v8     — Full Standard Model derivation (Cathedral Framework)
cathedral_v9     — Anchor-free Cathedral: all scales from ρ_Λ alone
rg_flow          — RG running δ(μ), crossover μ_c ≈ 197 GeV
qbls             — Quantum Bounded Ladder of Scales (δ_rung ≈ 61.32)
logistic_verification — δ★ on stable 6-cycle at r=3.8417002878419497
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
from .control import urt_step, urt_operator, is_critical
from .cathedral_v8 import Cathedral
from .cathedral_v9 import Cathedral as CathedralV9
from .rg_flow import rg_flow, crossover_scale, running_alpha_inv, running_alpha_s
from .qbls import (
    rung_spacing,
    scale_quantity,
    rung_of,
    physical_ladder,
    simulate_meta_universes,
    DELTA_RUNG,
    LAMBDA_S,
)
from .logistic_verification import (
    verify_delta_star_logistic,
    LogisticVerificationResult,
)
from .gravity_deficit import (
    GRAVITATIONAL_DEFICIT_DEG,
    GRAVITATIONAL_DEFICIT_RAD,
    HOLONOMY_VORTEX_DEG,
    schwarzschild_area,
    cathedral_bh_entropy,
    hawking_temperature,
    newton_G_from_deficit,
    deficit_summary,
)
from .arf_closure import (
    ARFFixedPoint,
    ARFPredictions,
    prove_uniqueness,
    scan_D,
    gamma_power_ladder,
)
from .quasicrystal import (
    ikt_forward,
    ikt_inverse,
    ikt_matrix,
    ikt_sector_power,
    phi_scaled_radii,
)
from .casimir_cathedral import (
    casimir_force_per_area,
    casimir_fractional_deviation,
    critical_field_Vm,
    topological_coupling,
)
from .neural_cathedral import (
    CathedralLayer,
    CathedralNet,
    GrokDetector,
    embed_to_shell,
)

__version__ = "2.0.0"
__author__ = "Cornelius Lytollis"
__all__ = [
    # chaos metrics
    "lyapunov_rosenstein",
    "tau_avalanche",
    "D_KY_from_l1_proxy",
    "DKY_from_delta_monotone",
    "delta_metric",
    # core constant + shell
    "DELTA_STAR",
    "compute_all_constants",
    "urt_evolve",
    # control
    "urt_step",
    "urt_operator",
    "is_critical",
    # Cathedral framework
    "Cathedral",
    "CathedralV9",
    # RG flow
    "rg_flow",
    "crossover_scale",
    "running_alpha_inv",
    "running_alpha_s",
    # QBLS
    "rung_spacing",
    "scale_quantity",
    "rung_of",
    "physical_ladder",
    "simulate_meta_universes",
    "DELTA_RUNG",
    "LAMBDA_S",
    # logistic verification
    "verify_delta_star_logistic",
    "LogisticVerificationResult",
    # gravity deficit
    "GRAVITATIONAL_DEFICIT_DEG",
    "GRAVITATIONAL_DEFICIT_RAD",
    "HOLONOMY_VORTEX_DEG",
    "schwarzschild_area",
    "cathedral_bh_entropy",
    "hawking_temperature",
    "newton_G_from_deficit",
    "deficit_summary",
    # ARF closure
    "ARFFixedPoint",
    "ARFPredictions",
    "prove_uniqueness",
    "scan_D",
    "gamma_power_ladder",
    # quasicrystal / IKT
    "ikt_forward",
    "ikt_inverse",
    "ikt_matrix",
    "ikt_sector_power",
    "phi_scaled_radii",
    # Casimir
    "casimir_force_per_area",
    "casimir_fractional_deviation",
    "critical_field_Vm",
    "topological_coupling",
    # Cathedral neural
    "CathedralLayer",
    "CathedralNet",
    "GrokDetector",
    "embed_to_shell",
]
