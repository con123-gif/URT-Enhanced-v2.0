#!/usr/bin/env python3
"""
URT / Newton's Cathedral
Unified IR-response closure candidate

This file implements the single relative-information / Schur-complement law
that the finite-history work converged on:

    Gamma_IR[X]
      = 1/2 <X-X0, K_eff (X-X0)> - Re<J, X-X0>
        - sum_radial log |r|

    K_eff = A - B K_hidden^{-1} B^*

with:
  K_hidden = 3 P3 + 5 P5,
  serial responses multiplying,
  parallel responses adding,
  symmetry-equivalent exits sharing conserved response,
  radial positive modes carrying the -log r Jacobian,
  and the outer/Galois sheet fixing orientation sign.

The script computes the frozen dimensionless response ledger, the effective
IR mixing matrices, recursive mass tree, neutrino predictions, scalar residue,
cosmology slots, hidden entropy, bounded-chaos engine, A4/vortex/resonance
identities, and the recursive gravity candidate.

It does NOT re-use the rejected raw microscopic CKM/PMNS identification.
"""

from __future__ import annotations
import math
import json
import numpy as np
from dataclasses import dataclass

# ---------------------------------------------------------------------------
# 1. FROZEN FINITE DATA
# ---------------------------------------------------------------------------

D = 3
V = 12
N = 13
E = 30
F = 20
q = 5
h = 8
A5_ORDER = 60

phi = (1.0 + math.sqrt(5.0)) / 2.0
gamma = 1.0 / 81.0

d_star = (1.0 - gamma) * math.pi / (N * phi)
d_cl = D / F
Delta = d_cl - d_star
eta_delta = -math.log(Delta)
rail = d_star / d_cl

W_scalar = 9.0 / 5.0

# ---------------------------------------------------------------------------
# 2. UNIVERSAL RESPONSE LAW
# ---------------------------------------------------------------------------

def schur_complement(A: np.ndarray, B: np.ndarray, C: np.ndarray) -> np.ndarray:
    """Integrate out Gaussian hidden variables."""
    return A - B @ np.linalg.solve(C, B.conj().T)

def ordinary_stationary(x0: float, J: float, kappa: float = 1.0) -> float:
    """Gamma = kappa/2 (x-x0)^2 - J (x-x0)."""
    return x0 + J / kappa

def radial_stationary(kappa: float) -> float:
    """Gamma_rad = kappa r^2/2 - log r."""
    if kappa <= 0:
        raise ValueError("radial curvature must be positive")
    return 1.0 / math.sqrt(kappa)

def serial(*xs: float) -> float:
    out = 1.0
    for x in xs:
        out *= x
    return out

def parallel(*xs: float) -> float:
    return sum(xs)

def equal_share(source: float, m: int) -> float:
    return source / m

# Hidden precision operator: 3 I4 + 5 I4
K_hidden = np.diag([3.0]*4 + [5.0]*4)

# Explicit Schur certificate for Cabibbo channel:
# F unit-precision visible routes coupled to one isotropically shared hidden return.
c_hidden = np.full((h, 1), 1.0 / h)
A_q12 = np.array([[float(F)]])
C_q12 = np.eye(h)
K_q12_eff = schur_complement(A_q12, c_hidden.T, C_q12)
kappa_q12 = float(K_q12_eff[0, 0])

# ---------------------------------------------------------------------------
# 3. FLAVOUR AS IR RESPONSE COORDINATES
# ---------------------------------------------------------------------------

# Quark 12: radial face mode after hidden Schur reduction.
sQ12 = radial_stationary(kappa_q12)

# Quark 23: unique odd mixed portal, passive unit removed.
J_Q23 = Delta * (phi**6 - 1.0)
sQ23 = ordinary_stationary(0.0, J_Q23, 1.0)

# Quark 13: D spatial sources, two Galois sheets => precision 2.
J_Q13 = D * Delta
sQ13 = ordinary_stationary(0.0, J_Q13, 2.0)

# CP-even scalar feedback on oriented entropy-gap area.
JQ = gamma * Delta * (1.0 + W_scalar * gamma)

# Leptons: dual/Galois response naturally written in probabilities.
xL12 = ordinary_stationary(1.0 / D, -V * Delta, 1.0)
xL23 = ordinary_stationary(0.5, F * Delta + gamma, 1.0)
xL13 = ordinary_stationary(
    0.0,
    2.0 * gamma * rail**2 * (1.0 - F * Delta),
    1.0
)
JL = -N * Delta

def phase_from_J(s12: float, s23: float, s13: float, J: float) -> float:
    c12 = math.sqrt(1.0 - s12*s12)
    c23 = math.sqrt(1.0 - s23*s23)
    c13 = math.sqrt(1.0 - s13*s13)
    Jmax = s12*c12*s23*c23*s13*c13*c13
    return math.asin(max(-1.0, min(1.0, J / Jmax)))

def standard_mixing(s12: float, s23: float, s13: float, delta: float) -> np.ndarray:
    c12 = math.sqrt(1.0 - s12*s12)
    c23 = math.sqrt(1.0 - s23*s23)
    c13 = math.sqrt(1.0 - s13*s13)
    ep = np.exp(1j*delta)
    em = np.exp(-1j*delta)
    return np.array([
        [c12*c13, s12*c13, s13*em],
        [-s12*c23-c12*s23*s13*ep,
         c12*c23-s12*s23*s13*ep,
         s23*c13],
        [s12*s23-c12*c23*s13*ep,
         -c12*s23-s12*c23*s13*ep,
         c23*c13],
    ], dtype=complex)

def jarlskog(U: np.ndarray) -> float:
    return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))

delta_Q = phase_from_J(sQ12, sQ23, sQ13, JQ)
V_CKM = standard_mixing(sQ12, sQ23, sQ13, delta_Q)

sL12 = math.sqrt(xL12)
sL23 = math.sqrt(xL23)
sL13 = math.sqrt(xL13)
delta_L = phase_from_J(sL12, sL23, sL13, JL)
U_PMNS = standard_mixing(sL12, sL23, sL13, delta_L)

# ---------------------------------------------------------------------------
# 4. RECURSIVE MASS RESPONSE TREE
# ---------------------------------------------------------------------------

mass_ratio_to_top = {
    "t": 1.0,
    "b": 2.0*q*Delta,
    "tau": (D+1.0)*Delta,
    "c": D*Delta,
    "s": serial(2.0*q*Delta, 3.0*D*Delta),
    "mu": serial((D+1.0)*Delta, D*h*Delta),
    "u": 2.0*Delta**2,
    "d": serial(2.0*q*Delta, 2.0*D*E*Delta**2),
    "e": serial(
        (D+1.0)*Delta,
        2.0*D*h*Delta**2,
        rail**2
    ),
}

nu3_over_top = D * Delta**q
nu2_over_nu3 = math.sqrt(V * Delta)
nu1_over_nu3 = D * Delta**3
nu_dm21_over_dm31 = (
    nu2_over_nu3**2 - nu1_over_nu3**2
) / (1.0 - nu1_over_nu3**2)

# Optional dimensional display unit. This is a unit choice, not used in
# the dimensionless construction.
TOP_REFERENCE_GEV = 172.6
top_eV = TOP_REFERENCE_GEV * 1e9

m3_eV = nu3_over_top * top_eV
m2_eV = nu2_over_nu3 * m3_eV
m1_eV = nu1_over_nu3 * m3_eV
sum_mnu_eV = m1_eV + m2_eV + m3_eV

Ue1_sq = abs(U_PMNS[0,0])**2
Ue2_sq = abs(U_PMNS[0,1])**2
Ue3_sq = abs(U_PMNS[0,2])**2
m_beta_eV = math.sqrt(
    Ue1_sq*m1_eV**2 + Ue2_sq*m2_eV**2 + Ue3_sq*m3_eV**2
)
Omega_nu_h2 = sum_mnu_eV / 93.12

# ---------------------------------------------------------------------------
# 5. SCALAR RESPONSE / EFFECTIVE COUPLINGS
# ---------------------------------------------------------------------------

S_ent = (1.0 + gamma) / D
S_exh = (N - D - 1.0) / (q*N)

alpha_inv = (
    137.0
    + (17572.0/1215.0)*Delta
    - (9.0/65.0)*Delta**2
)
alpha_root = 1.0 / alpha_inv

sin2W_response = D / N
alpha_s_response = F / (N*N)
lambda_H_response = 1.0/h + gamma/D
yt_response = 1.0 - Delta

# Bare finite trace boundary
aY = 16.0*(100.0 + 183.0*Delta**2)/75.0
bY = (
    976.0/27.0
    + (384.0/5.0)*Delta
    + (99584.0/225.0)*Delta**2
    + (1728.0/5.0)*Delta**3
    + (420592.0/1875.0)*Delta**4
)
b_over_a2 = bY/(aY*aY)
sin2W_bare = 3.0/8.0

# ---------------------------------------------------------------------------
# 6. HIDDEN GIBBS / ENTROPY
# ---------------------------------------------------------------------------

p3 = 1.0/(1.0 + Delta**2)
p5 = Delta**2/(1.0 + Delta**2)

def binary_entropy(p: float) -> float:
    return -p*math.log(p) - (1-p)*math.log(1-p)

S_hidden_over_kB = math.log(4.0) + binary_entropy(p5)
dS_dp_ex_over_kB = 2.0*eta_delta

# ---------------------------------------------------------------------------
# 7. PORTAL / OUTER RETURN / VORTEX
# ---------------------------------------------------------------------------

portal_sigma2_plus = (20.0 + 8.0*math.sqrt(5.0))/15.0
portal_sigma2_minus = (20.0 - 8.0*math.sqrt(5.0))/15.0
portal_amp_ratio = math.sqrt(portal_sigma2_plus/portal_sigma2_minus)
portal_power_ratio = portal_sigma2_plus/portal_sigma2_minus

epsilon = eta_delta / 30.0

# The exact matrix identity is verified in the archived gap verifier.
F6_scalar = -Delta
F12_scalar = Delta**2

vortex_cycle = []
x = 1
for _ in range(6):
    vortex_cycle.append(x)
    x = (2*x) % 9
vortex_cycle_closed = vortex_cycle + [vortex_cycle[0]]

# ---------------------------------------------------------------------------
# 8. BOUNDED-CHAOS ENGINE
# ---------------------------------------------------------------------------

r_star = 9.0/13.0
theta_H = math.pi*(3.0-math.sqrt(5.0))  # = 2pi/phi^2
radial_multiplier = 5.0 - 4.0*math.pi/math.e
lambda_plus = math.log(2.0)
lambda_minus = math.log(abs(radial_multiplier))
lambda_sum = lambda_plus + lambda_minus

# ---------------------------------------------------------------------------
# 9. A4 / REPRESENTATION / CURVATURE LEDGER
# ---------------------------------------------------------------------------

representation = {
    "shell_12": "1 + 3 + 3' + 5",
    "faces_20": "1 + 3 + 3' + 4 + 4 + 5",
    "edges_30": "1 + 3 + 3' + 4 + 4 + 5 + 5 + 5",
    "hidden_8": "4 + 4",
    "Lambda2_V4": "3 + 3'",
    "Hom_3_3p": "4 + 5",
    "Sym2_Lambda2_preBianchi": "21",
    "Riemann_after_Bianchi": "20",
    "Spin7_stabilizers": "14 -> 8 -> 3 -> 0",
    "matter_count": "16 per generation; 48 particles; 96 with conjugates",
    "A4_root_face_A5_set": "A5/C3, 20 roots <-> 20 oriented faces",
    "A4_dual_quotient": "A4*/A4 = Z5",
}

# Hidden source -> traceless Ricci carrier:
# Sigma = [3 x x^T + 5 y y^T]_0
# 2B is an isometric map Sym^2_0(V4) -> Hom(Lambda2_+, Lambda2_-)

# ---------------------------------------------------------------------------
# 10. RESPONSE COSMOLOGY
# ---------------------------------------------------------------------------

theta_QCD = (JQ/math.pi)**2
eta_B = 6.0*theta_QCD
A_s = 21.0*theta_QCD
ln_1e10_As = math.log(1e10*A_s)

Omega_m = 6.0/19.0
Omega_Lambda = 13.0/19.0
Omega_b = Omega_m*(2.0/N)
Omega_c = Omega_m*((N-2.0)/N)

n_s = 1.0 - 3.0*gamma + Delta
running_ns = -Delta**2
tensor_r = 16.0*gamma*Delta
tensor_tilt = -tensor_r/8.0
tau_reio = 1.0/19.0 + Delta/math.pi
sigma8_response = math.cos(math.pi/5.0)

# ---------------------------------------------------------------------------
# 11. RECURSIVE GRAVITY RESPONSE CANDIDATE
# ---------------------------------------------------------------------------

G_Lambda2_over_gU2 = eta_delta/(16.0*math.pi)
A_G = ((D+1.0)/D)*rail*(1.0-gamma/h)
alphaG_e_response = alpha_root**(N+h) * A_G

# Regular-core metric response branch, dimensionless horizon roots are archived.
black_hole = {
    "f(r)": "1 - r_s r^2/(r^2+a^2)^(3/2), a=d_star*r_s",
    "r_minus_over_rs": 0.06462981756549308,
    "r_plus_over_rs": 0.9660164266449951,
}

# ---------------------------------------------------------------------------
# 12. FLUID MOMENTS
# ---------------------------------------------------------------------------

# 12 normalized icosahedral directions + rest.
# The archived verifier proves the exact moment identities:
fluid = {
    "w0": 2.0/5.0,
    "wa": 1.0/20.0,
    "cs2_over_c2": 1.0/5.0,
    "pressure": "p = rho c^2/5",
    "kinematic_viscosity": "nu = c^2 tau/5",
}

# ---------------------------------------------------------------------------
# 13. EFFECTIVE IR DIRAC OPERATOR
# ---------------------------------------------------------------------------

# This is explicitly an IR response operator, not the rejected microscopic
# passive transfer kernel. The left frames are V_CKM and U_PMNS.

Du = np.diag([
    mass_ratio_to_top["u"],
    mass_ratio_to_top["c"],
    mass_ratio_to_top["t"],
])
Dd = V_CKM @ np.diag([
    mass_ratio_to_top["d"],
    mass_ratio_to_top["s"],
    mass_ratio_to_top["b"],
])
De = np.diag([
    mass_ratio_to_top["e"],
    mass_ratio_to_top["mu"],
    mass_ratio_to_top["tau"],
])
Dnu = U_PMNS @ np.diag([
    nu3_over_top*nu1_over_nu3,
    nu3_over_top*nu2_over_nu3,
    nu3_over_top,
])

# colour triples for u,d; leptons colourless
Y24 = np.block([
    [np.kron(Du, np.eye(3)),                  np.zeros((9,9)),  np.zeros((9,3)), np.zeros((9,3))],
    [np.zeros((9,9)), np.kron(Dd, np.eye(3)),                  np.zeros((9,3)), np.zeros((9,3))],
    [np.zeros((3,9)),                  np.zeros((3,9)),                 De, np.zeros((3,3))],
    [np.zeros((3,9)),                  np.zeros((3,9)), np.zeros((3,3)), Dnu],
]).astype(complex)

D48 = np.block([
    [np.zeros((24,24), dtype=complex), Y24.conj().T],
    [Y24, np.zeros((24,24), dtype=complex)],
])

# ---------------------------------------------------------------------------
# 14. INTERNAL CHECKS
# ---------------------------------------------------------------------------

assert abs(kappa_q12 - (F - 1.0/h)) < 1e-14
assert abs(sQ12 - 1.0/math.sqrt(F - 1.0/h)) < 1e-14
assert abs(portal_amp_ratio - phi**3) < 1e-12
assert abs(portal_power_ratio - phi**6) < 1e-11
assert vortex_cycle == [1,2,4,8,7,5]
assert lambda_plus > 0 and lambda_sum < 0
assert abs(jarlskog(V_CKM) - JQ) < 1e-12
assert abs(jarlskog(U_PMNS) - JL) < 1e-12
assert D48.shape == (48,48)

# ---------------------------------------------------------------------------
# 15. OUTPUT
# ---------------------------------------------------------------------------

results = {
    "primitives": {
        "D":D, "V":V, "N":N, "E":E, "F":F, "q":q, "h":h,
        "phi":phi, "gamma":gamma,
        "d_star":d_star, "d_cl":d_cl,
        "Delta":Delta, "eta_Delta":eta_delta,
    },
    "response_action": {
        "K_hidden_eigenvalues": [3]*4 + [5]*4,
        "kappa_Q12_schur": kappa_q12,
        "law": "Gamma_IR=1/2<X-X0,K_eff(X-X0)>-Re<J,X-X0>-sum log|r|",
        "K_eff": "A-B K_hidden^{-1} B^*",
    },
    "quark": {
        "s12":sQ12, "s23":sQ23, "s13":sQ13,
        "J":JQ, "delta_deg":math.degrees(delta_Q),
        "CKM_abs":np.abs(V_CKM).tolist(),
    },
    "lepton": {
        "sin2_theta12":xL12, "sin2_theta23":xL23, "sin2_theta13":xL13,
        "J":JL, "delta_deg":math.degrees(delta_L)%360.0,
        "PMNS_abs":np.abs(U_PMNS).tolist(),
    },
    "mass_ratio_to_top":mass_ratio_to_top,
    "neutrinos": {
        "ordering":"normal",
        "m1_eV":m1_eV, "m2_eV":m2_eV, "m3_eV":m3_eV,
        "sum_mnu_eV":sum_mnu_eV,
        "m_beta_eV":m_beta_eV,
        "Omega_nu_h2":Omega_nu_h2,
        "dm21_over_dm31":nu_dm21_over_dm31,
    },
    "scalar_response": {
        "alpha_inverse":alpha_inv,
        "sin2_thetaW_response":sin2W_response,
        "alpha_s_response":alpha_s_response,
        "lambda_H_response":lambda_H_response,
        "yt_response":yt_response,
        "sin2_thetaW_bare":sin2W_bare,
        "aY":aY, "bY":bY, "b_over_a2":b_over_a2,
    },
    "hidden": {
        "p3":p3, "p5":p5,
        "S_hidden_over_kB":S_hidden_over_kB,
        "dS_dp_ex_over_kB":dS_dp_ex_over_kB,
    },
    "portal": {
        "amplitude_ratio":portal_amp_ratio,
        "power_ratio":portal_power_ratio,
    },
    "outer_return": {
        "epsilon":epsilon,
        "F6":"-Delta I6",
        "F12":"Delta^2 I6",
    },
    "bounded_chaos": {
        "radius":r_star,
        "theta":theta_H,
        "lambda_plus":lambda_plus,
        "lambda_minus":lambda_minus,
        "sum":lambda_sum,
    },
    "vortex": {
        "mod9_doubling_cycle":vortex_cycle_closed,
    },
    "representation":representation,
    "cosmology_response": {
        "theta_QCD":theta_QCD,
        "eta_B":eta_B,
        "A_s":A_s,
        "ln_1e10_As":ln_1e10_As,
        "Omega_m":Omega_m,
        "Omega_Lambda":Omega_Lambda,
        "Omega_b":Omega_b,
        "Omega_c":Omega_c,
        "Omega_c_over_Omega_b":Omega_c/Omega_b,
        "n_s":n_s,
        "running":running_ns,
        "r":tensor_r,
        "n_t":tensor_tilt,
        "tau_reio":tau_reio,
        "sigma8":sigma8_response,
    },
    "gravity_response": {
        "G_Lambda2_over_gU2":G_Lambda2_over_gU2,
        "alphaG_e":alphaG_e_response,
        "black_hole":black_hole,
    },
    "fluid":fluid,
    "effective_IR_Dirac_shape":list(D48.shape),
}

if __name__ == "__main__":
    print(json.dumps(results, indent=2))