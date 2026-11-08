from math import pi, sin, copysign, log, e
from .constants import PHI

SPIRAL_SCALE = pi / e
SPIRAL_PHASE = 2.0 * pi / (PHI * PHI)
OMEGA = complex(log(SPIRAL_SCALE), SPIRAL_PHASE)

def phi_branch(p: float) -> float:
    if abs(p) <= pi:
        return sin(p)
    return copysign(1.0, p)

def urt_step(p: float, u: float, alpha=1.155, beta=0.235, theta_h=2.4) -> float:
    """Historical scalar URT prototype; unchanged for reproducibility."""
    return beta * (alpha * (p - theta_h * phi_branch(p)) + u)

def absorbing_bound(U: float, alpha=1.155, beta=0.235, theta_h=2.4) -> float:
    lam = alpha * beta
    if lam >= 1.0:
        raise ValueError("No contraction bound when alpha*beta >= 1")
    return beta * (alpha * theta_h + U) / (1.0 - lam)

def max_piecewise_fibre_derivative(alpha=1.155, beta=0.235, theta_h=2.4) -> float:
    """Maximum derivative on a smooth branch; not a global Lipschitz bound."""
    return alpha * beta * (1.0 + theta_h)

def native_urt_engine():
    """Active full-state algorithm: original 190 geometry × 64 history × 24 clock.

    Requires the native archived Cathedral source plus scipy and mpmath.
    Legacy `urt_step` remains a separately callable prototype.
    """
    from .native_urt import NativeURTEngine
    return NativeURTEngine.from_archive()


def native_urt_full_dynamics(source_path=None):
    """Construct the coupled canonical 190-geometry/64-history/24-clock URT.

    Unlike `native_urt_engine()`, both geometry and history are dynamical.
    The original scalar controller is retained for historical comparison.
    """
    from .full_dynamics import NativeURTFullDynamics
    return NativeURTFullDynamics.from_archive(source_path)

def native_urt_spatial_transport(source_path=None):
    """Native full-64-history spatial Fourier propagator; original model intact.

    Gives the exact finite-time tilted Markov operator and its 3D low-k
    transport spectrum, with D=(pi/e)^2/5. No inserted spatial Laplacian.
    """
    from .spatial_transport import NativeURTSpatialTransport
    return NativeURTSpatialTransport.from_archive(source_path)


def native_urt_spatial_dynamics(source_path=None, spacing=(1.,1.,1.)):
    """Full original 190+64×24 nonlinear dynamics with native 3D history transport.

    Keeps native source, live 64 histories and charge-one/two 24-clock.
    Spatial advection acts through the existing six icosahedral history axes.
    See docs/NATIVE_URT_UNIFIED_SPATIAL_INTERACTION_2026_11_08.md.
    """
    from .spatial_dynamics import NativeURTSpatialDynamics
    return NativeURTSpatialDynamics.from_archive(source_path,spacing=spacing)