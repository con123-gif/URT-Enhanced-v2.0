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
    return beta * (alpha * (p - theta_h * phi_branch(p)) + u)

def absorbing_bound(U: float, alpha=1.155, beta=0.235, theta_h=2.4) -> float:
    lam = alpha * beta
    if lam >= 1.0:
        raise ValueError("No contraction bound when alpha*beta >= 1")
    return beta * (alpha * theta_h + U) / (1.0 - lam)

def max_piecewise_fibre_derivative(alpha=1.155, beta=0.235, theta_h=2.4) -> float:
    return alpha * beta * (1.0 + theta_h)
