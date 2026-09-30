#!/usr/bin/env python3
"""URT / Newton's Cathedral — full reconstructed framework core.

This module intentionally keeps three layers distinct:
  E/N: exact finite algebra or numerical consequence of stated definitions;
  C/P: conditional/physical response constructions;
  F/W: falsified or withdrawn routes retained in the archive as constraints.

It is reconstructed from the 3–24 August 2026 project ledger and late gap audit.
No failed historical branch is silently deleted: see STATUS and DO_NOT_RESURRECT,
and the source_archive/ directory in the package.
"""
from __future__ import annotations

import json
import math
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Any

import numpy as np

# -----------------------------------------------------------------------------
# 0. STATUS / PROVENANCE
# -----------------------------------------------------------------------------
STATUS = {
    "E": "exact finite/algebraic statement independently checked",
    "N": "numerical consequence of explicit definitions",
    "C": "conditional theorem/construction after extra axiom/ansatz/route",
    "P": "physical interpretation/proposed bridge",
    "F": "falsified by direct test or no-go",
    "W": "withdrawn/superseded",
    "U": "unresolved or conversation-only without recovered certificate",
}

DO_NOT_RESURRECT = [
    "early flavour closure as a unique prediction",
    "endpoint/source filtering as the physical CKM/PMNS operator",
    "terminal/codomain placement alone as a repair",
    "14-control active machine as an identifiable theory",
    "static transfer machine as an orientation selector",
    "reduced oriented-charge calculation as a verdict on the declared full operator",
    "observational branch selection as a substitute for a blind action principle",
    "correctly typed blind real Wilson/KL history as physical flavour selector",
    "real Wilson free energy as selector of CP sign",
    "old Dirac ansatz",
    "3/13 as already-derived physical weak coupling",
    "electron-calibrated G as a gravity derivation",
    "0.129115 as the standard 96-state Higgs trace",
    "old logistic delta identified with later geometric d_star",
    "old pi-phi-e centred spectrum and uniqueness proof",
    "plain scalar-gradient derivation of magnetic Lorentz force",
    "rank-five spin-2 projector as Newtonian 1/r source",
    "global URT contraction without invariant domain/Lipschitz replacement",
    "unrestricted feedback as a universe-selection principle",
    "A4 roots and icosahedral face centres as the same Euclidean shell",
    "17 as a fundamental new-particle count",
    "mod-9 cycles as a Mersenne-prime theorem",
    "old 100-microsecond North Star net-gain claim",
    "SU(5)/Weyl insertion as a justified shortcut",
    "claim that finite core already derives Born/Einstein/Newton/Navier-Stokes",
    "state-only URT description that omits history/two-sheet recursion",
]

# -----------------------------------------------------------------------------
# 1. FROZEN DISCRETE DATA / CONSTANTS
# -----------------------------------------------------------------------------
D = 3
V = 12
N = 13
E = 30
F = 20
q = 5
A5_ORDER = 60
h = 8
L = D + 1
phi = (1.0 + math.sqrt(5.0)) / 2.0
gamma = 1.0 / 81.0

d_star = (1.0 - gamma) * math.pi / (N * phi)
d_cl = D / F
Delta = d_cl - d_star
eta_Delta = -math.log(Delta)
eta_conf = 9.8601129428
eta_IR = 15.6972029190

# exact/N numerical invariants
W_scalar = 9.0 / 5.0
S_ent = (1.0 + gamma) / D
S_exh = (N - D - 1.0) / (q * N)


def frozen_constants() -> dict[str, float | int]:
    return {
        "D": D, "V": V, "N": N, "E": E, "F": F, "q": q,
        "A5_order": A5_ORDER, "hidden_dimension": h,
        "phi": phi, "gamma": gamma, "d_star": d_star,
        "d_cl": d_cl, "Delta": Delta, "eta_Delta": eta_Delta,
        "eta_conf": eta_conf, "eta_IR": eta_IR,
    }

# -----------------------------------------------------------------------------
# 2. ICOSAHEDRAL SEED / SPECTRA / REPRESENTATIONS
# -----------------------------------------------------------------------------
def icosahedron_vertices() -> np.ndarray:
    p = phi
    verts = []
    for a in (-1.0, 1.0):
        for b in (-p, p):
            verts.append((0.0, a, b))
            verts.append((a, b, 0.0))
            verts.append((b, 0.0, a))
    # construction above produces exactly 12 unique vertices
    arr = np.unique(np.asarray(verts, float), axis=0)
    return arr


def shell_adjacency() -> np.ndarray:
    X = icosahedron_vertices()
    d2 = np.sum((X[:, None, :] - X[None, :, :]) ** 2, axis=-1)
    positive = d2[d2 > 1e-12]
    edge2 = positive.min()
    A = ((np.abs(d2 - edge2) < 1e-10)).astype(float)
    np.fill_diagonal(A, 0.0)
    return A


def graph_laplacian(A: np.ndarray) -> np.ndarray:
    return np.diag(A.sum(axis=1)) - A


def centred_laplacian() -> np.ndarray:
    A12 = shell_adjacency()
    A13 = np.zeros((13, 13), float)
    A13[:12, :12] = A12
    A13[:12, 12] = 1.0
    A13[12, :12] = 1.0
    return graph_laplacian(A13)


def seed_spectra() -> dict[str, list[float]]:
    sh = np.linalg.eigvalsh(graph_laplacian(shell_adjacency()))
    ce = np.linalg.eigvalsh(centred_laplacian())
    return {"shell": sh.tolist(), "centred": ce.tolist()}

REPRESENTATIONS = {
    "shell_12": "1 + 3 + 3' + 5",
    "faces_20": "1 + 3 + 3' + 4 + 4 + 5",
    "edges_30": "1 + 3 + 3' + 4 + 4 + 5 + 5 + 5",
    "hidden_8": "4_3 + 4_5",
    "H21_state": "2*1 + 3 + 3' + 2*4 + 5",
    "pre_Bianchi_curvature_21": "2*1 + 4 + 3*5",
    "Bianchi_curvature_20": "1 + 4 + 3*5",
    "Hom_3_3prime": "4 + 5",
}

# -----------------------------------------------------------------------------
# 3. HEAT KERNEL / HIDDEN GIBBS / ENTROPY
# -----------------------------------------------------------------------------
def golden_heat_rates() -> dict[str, float]:
    lo = 3.0 - math.sqrt(5.0)
    hi = 3.0 + math.sqrt(5.0)
    return {"lambda_parallel": lo, "lambda_perp": hi, "ratio": hi / lo}


def hidden_gibbs(eta: float = eta_Delta) -> dict[str, float]:
    z3 = 4.0 * math.exp(-3.0 * eta)
    z5 = 4.0 * math.exp(-5.0 * eta)
    Z = z3 + z5
    p3 = z3 / Z
    p5 = z5 / Z
    H2 = -(p3 * math.log(p3) + p5 * math.log(p5))
    return {
        "Z": Z,
        "p3": p3,
        "p5": p5,
        "S_over_kB": math.log(4.0) + H2,
        "dS_dp5_over_kB": math.log(p3 / p5),
        "expected_dS_dp5_over_kB_at_eta_Delta": 2.0 * eta,
    }


def metric_entropy_projection(eta: float) -> dict[str, float]:
    sigma = ((N - D) / N) * eta
    return {"eta": eta, "sigma": sigma, "mu_over_muC": math.exp(-sigma)}

# -----------------------------------------------------------------------------
# 4. SCALAR RESIDUE / RESPONSE COUPLING
# -----------------------------------------------------------------------------
def scalar_residue_inverse() -> float:
    return 137.0 + (17572.0 / 1215.0) * Delta - (9.0 / 65.0) * Delta**2


def scalar_response_decomposition() -> dict[str, float]:
    return {
        "W_scalar": W_scalar,
        "S_ent": S_ent,
        "S_exh": S_exh,
        "alpha_root_inverse": scalar_residue_inverse(),
        "alpha_root": 1.0 / scalar_residue_inverse(),
    }

# -----------------------------------------------------------------------------
# 5. EXTERIOR ALGEBRA / DEPTH / PORTAL
# -----------------------------------------------------------------------------
def generation_depth_operator() -> np.ndarray:
    return np.diag([Delta**2, Delta, 1.0])


def portal_invariants() -> dict[str, float]:
    s2_plus = (20.0 + 8.0 * math.sqrt(5.0)) / 15.0
    s2_minus = (20.0 - 8.0 * math.sqrt(5.0)) / 15.0
    return {
        "sigma2_plus": s2_plus,
        "sigma2_minus": s2_minus,
        "amplitude_ratio": math.sqrt(s2_plus / s2_minus),
        "power_ratio": s2_plus / s2_minus,
        "phi3": phi**3,
        "phi6": phi**6,
    }

EXTERIOR = {
    "Lambda_bullet_V4": [1, 4, 6, 4, 1],
    "Lambda2_V4": "3 + 3'",
    "Sym2_V4": "1 + 4 + 5",
    "End_V4": "1 + 3 + 3' + 4 + 5",
    "H21_regroup": "V7 + M6 + S8",
}

# -----------------------------------------------------------------------------
# 6. OUTER LIFT / CLIFFORD / SPIN(7) / GENERATION FLAG
# -----------------------------------------------------------------------------
OUTER_SPIN = {
    "Hphi_square": "+I_6",
    "C_conjugates_Hphi": "-Hphi",
    "C6": "-I_6",
    "C12": "+I_6",
    "signed_generated_group_order": 240,
    "quotient_order": 120,
    "vector_lift_order": 12,
    "spin_lift_order": 24,
    "Clifford_scale_a": 2,
    "Clifford_scale_b": 2,
    "relative_phase": math.pi / 2.0,
    "spin7_bivectors": 21,
    "stabilizer_dimensions": [14, 8, 3, 0],
    "stabilizer_algebras": ["g2", "su3", "su2", "0"],
    "two_spinor_setwise_stabilizer": "u3",
}

# -----------------------------------------------------------------------------
# 7. KO-6 / MATTER / CONDITIONAL GAUGE-HYPERCHARGE
# -----------------------------------------------------------------------------
def matter_counts() -> dict[str, int]:
    return {"per_generation_complex": 16, "three_generations": 48, "with_conjugates": 96}


def hypercharge_assignment(higgs_hypercharge: float = 0.5) -> dict[str, float]:
    hh = higgs_hypercharge
    ell = -hh
    qL = hh / 3.0
    return {
        "q": qL,
        "u": qL + hh,
        "d": qL - hh,
        "ell": ell,
        "e": ell - hh,
        "nu": ell + hh,
    }


def anomaly_residuals() -> dict[str, float]:
    y = hypercharge_assignment()
    qq, uu, dd, ll, ee, nn = y["q"], y["u"], y["d"], y["ell"], y["e"], y["nu"]
    return {
        "SU3sqU1": 2 * qq - uu - dd,
        "grav2U1": 6 * qq - 3 * uu - 3 * dd + 2 * ll - ee - nn,
        "U1cube": 6 * qq**3 - 3 * uu**3 - 3 * dd**3 + 2 * ll**3 - ee**3 - nn**3,
        "SU2sqU1": 3 * qq + ll,
    }

GAUGE = {
    "finite_algebra_candidate": "C + H + M3(C)",
    "candidate_lie_algebra": "u(1) + su(2) + su(3)",
    "candidate_global_group": "(SU(3)xSU(2)xU(1))/Z6",
    "bare_trace_factors": {"kY": 10/3, "k2": 2, "k3": 2},
    "sin2thetaW_bare": 3/8,
    "sin2thetaW_response": 3/13,
    "product_obstruction": "recursive g2>su3>su2 is nested; SM algebra is commuting direct sum",
}

# -----------------------------------------------------------------------------
# 8. YUKAWA GEOMETRY / FULL MATTER OPERATOR DEFINITION
# -----------------------------------------------------------------------------
def hodge_coefficients() -> dict[str, float]:
    c72 = math.sqrt((5.0 - 2.0 * math.sqrt(5.0)) / 3.0)
    c144 = math.sqrt((5.0 + 2.0 * math.sqrt(5.0)) / 3.0)
    return {"c72": c72, "c144": c144, "ratio": c144 / c72}

YUKAWA_AUDITED_SHAPE = {
    "carrier": "Hom_A5(3,3') = 4 + 5",
    "fiveplet_tight_frame": "(1/15) sum X_a tensor X_a = (1/5) I5",
    "edge_inner_products": {"self": 1.0, "eight_neighbours": 0.25, "six_neighbours": -0.5},
    "nearest_neighbour_split": [30, 30],
    "T": "M5 + i M4",
    "singular_values": [1.22425545, 0.67219435, 0.22215614],
    "frobenius_squared": 2.0,
    "abs_det": 0.182821,
}

CHARGE_WORDS = {
    "u": np.array([1.0, 3.0, -4.0]),
    "d": np.array([1.0, -3.0, 2.0]),
    "e": np.array([-3.0, -3.0, 6.0]),
    "nu": np.array([-3.0, 3.0, 0.0]),
}


def quadratic_charge_covariant(qv: np.ndarray) -> np.ndarray:
    a, b, c = map(float, qv)
    raw = np.array([b*c, c*a, a*b], float)
    return raw - raw.mean()


def oriented_charge_forms() -> dict[str, Any]:
    names = list(CHARGE_WORDS)
    n = np.ones(3) / math.sqrt(3.0)
    Gm = np.zeros((4, 4))
    Om = np.zeros((4, 4))
    for i, a in enumerate(names):
        for j, b in enumerate(names):
            qa, qb = CHARGE_WORDS[a], CHARGE_WORDS[b]
            Gm[i, j] = float(qa @ qb)
            Om[i, j] = float(n @ np.cross(qa, qb))
    Hm = Gm + 1j * Om
    ew = np.linalg.eigvalsh(Hm)
    return {
        "names": names,
        "g": Gm.tolist(),
        "omega": Om.tolist(),
        "H_rank": int(np.linalg.matrix_rank(Hm, tol=1e-10)),
        "H_eigenvalues": ew.tolist(),
    }

FULL_MATTER_OPERATOR = r"""
T_tilde[f,e] = C5(H_e)
             + C43(Xi3_e + J q_f / 3)
             + i C45(Xi5_e + J Delta g(q_f) / 5)
K[f,e] = T_tilde[f,e]^* T_tilde[f,e]
       = A_e^*A_e + B_f^*B_f + A_e^*B_f + B_f^*A_e
R[f,e] = K0[f]^(-1/2) K[f,e] K0[f]^(-1/2)
""".strip()

# -----------------------------------------------------------------------------
# 9. RESPONSE LAYER: MIXING / MASSES / COSMOLOGY
# -----------------------------------------------------------------------------
def _phase_from_J(s12: float, s23: float, s13: float, J: float) -> float:
    c12 = math.sqrt(1 - s12*s12)
    c23 = math.sqrt(1 - s23*s23)
    c13 = math.sqrt(1 - s13*s13)
    Jmax = s12*c12*s23*c23*s13*c13*c13
    return math.asin(max(-1.0, min(1.0, J / Jmax)))


def standard_mixing(s12: float, s23: float, s13: float, delta: float) -> np.ndarray:
    c12, c23, c13 = [math.sqrt(1-x*x) for x in (s12, s23, s13)]
    ep, em = np.exp(1j*delta), np.exp(-1j*delta)
    return np.array([
        [c12*c13, s12*c13, s13*em],
        [-s12*c23-c12*s23*s13*ep, c12*c23-s12*s23*s13*ep, s23*c13],
        [s12*s23-c12*c23*s13*ep, -c12*s23-s12*c23*s13*ep, c23*c13],
    ], complex)


def jarlskog(U: np.ndarray) -> float:
    return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))


def response_flavour() -> dict[str, Any]:
    sQ12 = 1.0 / math.sqrt(F - 1.0/h)
    sQ23 = Delta * (phi**6 - 1.0)
    sQ13 = D * Delta / 2.0
    JQ = gamma * Delta * (1.0 + W_scalar * gamma)
    dQ = _phase_from_J(sQ12, sQ23, sQ13, JQ)
    VQ = standard_mixing(sQ12, sQ23, sQ13, dQ)

    x12 = 1.0/D - V*Delta
    x23 = 0.5 + F*Delta + gamma
    x13 = 2.0*gamma*(d_star/d_cl)**2*(1.0-F*Delta)
    sL12, sL23, sL13 = map(math.sqrt, (x12, x23, x13))
    JL = -N*Delta
    dL = _phase_from_J(sL12, sL23, sL13, JL)
    UL = standard_mixing(sL12, sL23, sL13, dL)
    return {
        "quark": {"s12": sQ12, "s23": sQ23, "s13": sQ13, "J": JQ,
                  "delta_deg": math.degrees(dQ)%360, "abs": np.abs(VQ).tolist()},
        "lepton": {"s12sq": x12, "s23sq": x23, "s13sq": x13, "J": JL,
                    "delta_deg": math.degrees(dL)%360, "abs": np.abs(UL).tolist()},
    }


def mass_tree() -> dict[str, float]:
    rail = d_star / d_cl
    return {
        "t": 1.0,
        "b": 2.0*q*Delta,
        "tau": (D+1.0)*Delta,
        "c": D*Delta,
        "s": (2.0*q*Delta)*(3.0*D*Delta),
        "mu": ((D+1.0)*Delta)*(D*h*Delta),
        "u": 2.0*Delta**2,
        "d": (2.0*q*Delta)*(2.0*D*E*Delta**2),
        "e": ((D+1.0)*Delta)*(2.0*D*h*Delta**2*rail**2),
    }


def neutrino_tree(top_mass_GeV: float = 172.6) -> dict[str, float]:
    mt_eV = top_mass_GeV * 1e9
    m3 = D * Delta**q * mt_eV
    m2 = m3 * math.sqrt(V*Delta)
    m1 = m3 * D*Delta**3
    return {
        "m1_eV": m1, "m2_eV": m2, "m3_eV": m3,
        "sum_eV": m1+m2+m3,
        "dm21_eV2": m2*m2-m1*m1,
        "dm31_eV2": m3*m3-m1*m1,
    }


def neutrino_prospective_predictions(top_mass_GeV: float = 172.6) -> dict[str, float | str]:
    nu = neutrino_tree(top_mass_GeV)
    fl = response_flavour()["lepton"]
    s12sq, s13sq = fl["s12sq"], fl["s13sq"]
    Ue1sq = (1-s12sq)*(1-s13sq)
    Ue2sq = s12sq*(1-s13sq)
    Ue3sq = s13sq
    m1, m2, m3 = nu["m1_eV"], nu["m2_eV"], nu["m3_eV"]
    mbeta = math.sqrt(Ue1sq*m1*m1 + Ue2sq*m2*m2 + Ue3sq*m3*m3)
    return {
        **nu,
        "ordering": "normal",
        "m_beta_eV": mbeta,
        "Omega_nu_h2": nu["sum_eV"] / 93.12,
        "minimal_neutrino_type": "Dirac",
        "standard_light_Majorana_0nubb": "absent in minimal completion",
    }


def response_cosmology() -> dict[str, float]:
    JQ = response_flavour()["quark"]["J"]
    theta_qcd = (JQ / math.pi)**2
    return {
        "Theta_QCD": theta_qcd,
        "eta_B": 6.0*theta_qcd,
        "A_s": 21.0*theta_qcd,
        "Omega_m": 6.0/19.0,
        "Omega_Lambda": 13.0/19.0,
        "Omega_b": (6.0/19.0)*(2.0/13.0),
        "Omega_c": (6.0/19.0)*(11.0/13.0),
        "Omega_c_over_Omega_b": 11.0/2.0,
        "n_s": 1.0-3.0*gamma+Delta,
        "running": -Delta**2,
        "r": 16.0*gamma*Delta,
        "n_t": -(16.0*gamma*Delta)/8.0,
    }

# -----------------------------------------------------------------------------
# 10. HIGGS / SPECTRAL BOUNDARY
# -----------------------------------------------------------------------------
def higgs_trace() -> dict[str, float]:
    aY = 16.0*(100.0 + 183.0*Delta**2)/75.0
    bY = (976.0/27.0 + (384.0/5.0)*Delta + (99584.0/225.0)*Delta**2
          + (1728.0/5.0)*Delta**3 + (420592.0/1875.0)*Delta**4)
    ratio = bY/(aY*aY)
    target = 1/8 + gamma/3
    return {
        "aY": aY, "bY": bY, "bY_over_aY2": ratio,
        "target_old_slot": target,
        "Cnorm_required_for_old_slot": target/ratio,
        "lambda_if_Cnorm4": 4*ratio,
        "relative_shortfall_Cnorm4": (target-4*ratio)/target,
        "G_Lambda2_over_gU2_exponential_kernel": eta_Delta/(16*math.pi),
    }

# -----------------------------------------------------------------------------
# 11. RICCI CARRIER / THERMODYNAMIC GRAVITY
# -----------------------------------------------------------------------------
def tracefree_symmetric_basis4() -> list[np.ndarray]:
    basis = []
    for i in range(4):
        for j in range(i+1,4):
            M = np.zeros((4,4)); M[i,j]=M[j,i]=1/math.sqrt(2)
            basis.append(M)
    basis += [
        np.diag([1,-1,0,0])/math.sqrt(2),
        np.diag([1,1,-2,0])/math.sqrt(6),
        np.diag([1,1,1,-3])/math.sqrt(12),
    ]
    return basis


def hidden_ricci_source(x: np.ndarray, y: np.ndarray) -> np.ndarray:
    x = np.asarray(x, float).reshape(4)
    y = np.asarray(y, float).reshape(4)
    S = 3*np.outer(x,x) + 5*np.outer(y,y)
    return S - np.trace(S)*np.eye(4)/4.0


def gravity_candidates() -> dict[str, float | str]:
    alpha = 1/scalar_residue_inverse()
    alphaG1 = alpha**21 * ((D+1)/D)*(d_star/d_cl)*(1-gamma/h)
    # stored second candidate, retained because it differs and neither is selected
    alphaG2 = 1.7518093166537004e-45
    return {
        "spectral_dimensionless_combination": eta_Delta/(16*math.pi),
        "alphaG_candidate_1": alphaG1,
        "alphaG_candidate_2": alphaG2,
        "relative_difference": abs(alphaG2-alphaG1)/alphaG2,
        "status": "conditional; neither uniquely selected",
    }

# -----------------------------------------------------------------------------
# 12. REGULAR-CORE BLACK-HOLE ANSATZ
# -----------------------------------------------------------------------------
def bh_f(x: float) -> float:
    # dimensionless x=r/rs, a=d_star*rs
    return 1.0 - x*x / ((x*x + d_star*d_star)**1.5)


def _bisect(fun, a: float, b: float, n: int = 100) -> float:
    fa, fb = fun(a), fun(b)
    if fa*fb > 0: raise ValueError("root not bracketed")
    for _ in range(n):
        m = (a+b)/2; fm = fun(m)
        if fa*fm <= 0: b, fb = m, fm
        else: a, fa = m, fm
    return (a+b)/2


def black_hole_ansatz() -> dict[str, float]:
    rminus = _bisect(bh_f, 1e-8, 0.2)
    rplus = _bisect(bh_f, 0.2, 1.5)
    return {
        "a_over_rs": d_star,
        "rminus_over_rs": rminus,
        "rplus_over_rs": rplus,
        "two_horizon_threshold_a_over_rs": 2/(3*math.sqrt(3)),
    }

# -----------------------------------------------------------------------------
# 13. BOUNDED CHAOS / LOGISTIC / TANH
# -----------------------------------------------------------------------------
def engine_step(z: complex) -> complex:
    rstar = 9.0/13.0
    if abs(z) == 0: return 0j
    factor = math.pi/math.e - (math.pi/math.e - 1.0)*(abs(z)/rstar)**4
    return factor * (z*z/abs(z)) * np.exp(1j*math.pi*(3-math.sqrt(5)))


def engine_invariants() -> dict[str, float]:
    mr = 5.0 - 4.0*math.pi/math.e
    return {
        "r_star": 9.0/13.0,
        "theta": math.pi*(3-math.sqrt(5)),
        "lambda_plus": math.log(2.0),
        "radial_multiplier": mr,
        "lambda_minus": math.log(abs(mr)),
        "lyapunov_sum": math.log(2.0)+math.log(abs(mr)),
        "logistic_embedding_r": 3.84167378699470935954,
        "old_logistic_delta": 0.1474219361623,
        "old_logistic_r": 3.8417002878419497,
    }


def tanh_map(x: float, delta: float = Delta) -> float:
    return (x-delta*math.tanh(x/delta))*(1+math.pi*phi*delta*delta)

# -----------------------------------------------------------------------------
# 14. RESONANT OUTER RETURN / VORTEX-MOD9
# -----------------------------------------------------------------------------
def resonance_invariants() -> dict[str, float]:
    eps = -math.log(Delta)/30.0
    Tgeo = math.log(2.0) - 9.0/13.0
    return {
        "epsilon": eps,
        "F6_scalar": -Delta,
        "F12_scalar": Delta**2,
        "two_step_det_per_3D_Hodge_sector": Delta,
        "two_step_det_full_6D": Delta**2,
        "golden_frequency_ratio": math.sqrt((5+math.sqrt(5))/(5-math.sqrt(5))),
        "T_geo": Tgeo,
        "f_res": Tgeo/math.log(2.0),
    }


def vortex_mod9() -> dict[str, Any]:
    cycle=[]; x=1
    for _ in range(6):
        cycle.append(x); x=(2*x)%9
    return {
        "partition": [[0],[3,6],[1,2,4,8,7,5]],
        "doubling_cycle": cycle+[cycle[0]],
        "inverse_of_2": 5,
        "square_subgroup": sorted({(u*u)%9 for u in cycle}),
        "order_of_2": 6,
    }

# -----------------------------------------------------------------------------
# 15. A4 ROOT LATTICE / A5-SET BRIDGE / LORENTZ SIGNATURE
# -----------------------------------------------------------------------------
def a4_roots() -> np.ndarray:
    roots=[]
    for i in range(5):
        for j in range(5):
            if i==j: continue
            v=np.zeros(5); v[i]=1; v[j]=-1
            roots.append(v/math.sqrt(2))
    return np.asarray(roots)


def a4_invariants() -> dict[str, Any]:
    R=a4_roots()
    gram=R@R.T
    vals=np.unique(np.round(gram,12))
    return {
        "root_count": len(R),
        "span_rank": int(np.linalg.matrix_rank(R)),
        "root_inner_products": vals.tolist(),
        "A5_set_type": "A5/C3",
        "face_A5_set_type": "A5/C3",
        "permutation_module": "1 + 3 + 3' + 2*4 + 5",
        "visible_12": "1 + 3 + 3' + 5",
        "hidden_difference_8": "4 + 4",
        "identity_20_equals_12_plus_8": True,
        "Cartan_determinant": 5,
        "dual_quotient": "A4*/A4 ~= Z5",
        "metric_correction": "A4 roots and icosahedral face centres are equivariantly isomorphic, not Euclidean-isometric",
    }


def lorentz_metric_from_unit_t(t: np.ndarray) -> np.ndarray:
    t=np.asarray(t,float).reshape(4); t=t/np.linalg.norm(t)
    return np.eye(4)-2*np.outer(t,t)

# -----------------------------------------------------------------------------
# 16. FLUID MOMENTS / CONDITIONAL BGK LIMIT
# -----------------------------------------------------------------------------
def fluid_moments() -> dict[str, Any]:
    X=icosahedron_vertices()
    X=X/np.linalg.norm(X[0])  # unit shell directions
    w=1/20
    M2=sum(w*np.outer(u,u) for u in X)
    M3=np.zeros((3,3,3)); M4=np.zeros((3,3,3,3))
    for u in X:
        M3 += w*np.einsum('i,j,k->ijk',u,u,u)
        M4 += w*np.einsum('i,j,k,l->ijkl',u,u,u,u)
    target2=np.eye(3)/5
    target4=np.zeros_like(M4)
    I=np.eye(3)
    for i in range(3):
      for j in range(3):
       for k in range(3):
        for l in range(3):
         target4[i,j,k,l]=(I[i,j]*I[k,l]+I[i,k]*I[j,l]+I[i,l]*I[j,k])/25
    return {
        "rest_weight": 2/5,
        "moving_weight_each": 1/20,
        "M2_error": float(np.linalg.norm(M2-target2)),
        "M3_norm": float(np.linalg.norm(M3)),
        "M4_error": float(np.linalg.norm(M4-target4)),
        "conditional_BGK": {"cs2_over_c2":1/5,"p_over_rho_c2":1/5,"nu_over_c2_tau":1/5},
    }

# -----------------------------------------------------------------------------
# 17. ELECTROMAGNETIC / LORENTZ STRUCTURAL CORRECTION
# -----------------------------------------------------------------------------
EM = {
    "carrier": "exterior/Hodge scalar, 1-form, 2-form, dual-form sectors",
    "gradient_no_go": "v dot (v cross B)=0, so pure scalar dissipation cannot yield magnetic deflection",
    "candidate_force": "F = q * (i_v d theta_2) = q v x B* after supplying physical two-form and skew mobility",
    "status": "carrier exact; Maxwell propagation/charge normalization/Lorentz dynamics conditional",
}

# -----------------------------------------------------------------------------
# 18. ARBITRARY-CONTROL NO-GO / URT RESTRICTION
# -----------------------------------------------------------------------------
def unrestricted_feedback_for_target(P: float, target_F: float, beta: float, alpha: float, theta_H: float, phiP: float) -> float:
    """u_F(P)=beta^{-1}F(P)-alpha(P-theta_H phi(P)); proves unrestricted feedback can encode any recurrence."""
    return target_F/beta - alpha*(P-theta_H*phiP)

URT_RESTRICTION = {
    "no_go": "unrestricted feedback can realize arbitrary recurrence; universe selection requires restricted admissible dynamics",
    "bounded_contraction": "earlier kappa claim valid only on an invariant bounded domain (e.g. |P|<=pi) or after global Lipschitz replacement",
    "history_requirement": "live URT is history-dependent and two-sheet recursive, not state-only",
}

# -----------------------------------------------------------------------------
# 19. ENGINEERING / APPLICATION LEDGER (NOT EXPERIMENTAL EVIDENCE)
# -----------------------------------------------------------------------------
APPLICATIONS = {
    "North_Star_small_cone": {
        "volume_m3": 0.0020106193,
        "fusion_power_kW": 463.238,
        "bremsstrahlung_kW": 46.622,
        "Paux_tau1s_kW": 124.494,
        "Paux_tau100us_GW": 3.558,
        "optimistic_alpha_confinement_threshold_s": 1.53819,
    },
    "North_Star_optimized_large": {
        "radius_m":0.4,"height_m":1.2,"volume_m3":0.2923,
        "density_m-3":1.8973e21,"Ti_keV":170,"Te_keV":30.6,
        "fusion_power_MW":32.265,"aux_power_MW":10.199,"plasma_Q":3.16366,
        "surface_load_MW_m2":10.019,
    },
    "North_Star_vortex_only": {
        "radius_m":0.008,"length_m":1.0,"density_m-3":1.5686e23,
        "self_B_T":86.74,"fusion_power_MW":101.10,"external_power_MW":46.90,
        "plasma_Q":2.1554,"confinement_s":0.00824,"full_startup_pulse_gain":0.491,
    },
    "EEG": "no recovered new run/certificate in audited window; do not cite success",
    "music": "structural phase-lock analogy only; no audio-analysis certificate",
}

# -----------------------------------------------------------------------------
# 20. COMPLETE SNAPSHOT
# -----------------------------------------------------------------------------
def snapshot() -> dict[str, Any]:
    return {
        "status_key": STATUS,
        "frozen": frozen_constants(),
        "seed": {
            "vertices": 13, "shell_vertices":12, "shell_edges":30, "spokes":12,
            "centred_edges":42, "faces":20, "A5_rotations":60,
            "cochain_rank_d0":12, "cochain_rank_d1":19, "Betti":[1,11,1],
            "face_vertex_incidence_rank":12, "hidden_kernel_dimension":8,
            "spectra": seed_spectra(), "representations": REPRESENTATIONS,
        },
        "heat": golden_heat_rates(),
        "hidden_gibbs": hidden_gibbs(),
        "metric_entropy": metric_entropy_projection(eta_Delta),
        "scalar_residue": scalar_response_decomposition(),
        "exterior": EXTERIOR,
        "depth_operator": generation_depth_operator().tolist(),
        "portal": portal_invariants(),
        "outer_spin": OUTER_SPIN,
        "matter_counts": matter_counts(),
        "gauge": GAUGE,
        "hypercharge": hypercharge_assignment(),
        "anomaly_residuals": anomaly_residuals(),
        "hodge_coefficients": hodge_coefficients(),
        "yukawa_shape": YUKAWA_AUDITED_SHAPE,
        "oriented_charge_forms": oriented_charge_forms(),
        "full_matter_operator_definition": FULL_MATTER_OPERATOR,
        "response_flavour": response_flavour(),
        "mass_tree": mass_tree(),
        "neutrino_predictions": neutrino_prospective_predictions(),
        "response_cosmology": response_cosmology(),
        "higgs": higgs_trace(),
        "gravity": gravity_candidates(),
        "black_hole_ansatz": black_hole_ansatz(),
        "engine": engine_invariants(),
        "resonance": resonance_invariants(),
        "vortex": vortex_mod9(),
        "A4": a4_invariants(),
        "fluid": fluid_moments(),
        "electromagnetic": EM,
        "urt_restriction": URT_RESTRICTION,
        "applications": APPLICATIONS,
        "do_not_resurrect": DO_NOT_RESURRECT,
    }


def verify() -> dict[str, Any]:
    s=snapshot()
    checks={}
    checks["icosahedron_vertex_count"] = len(icosahedron_vertices()) == 12
    checks["shell_degree_5"] = np.allclose(shell_adjacency().sum(axis=1),5)
    checks["centred_spectrum"] = np.allclose(
        np.sort(seed_spectra()["centred"]),
        np.sort([0]+[6-math.sqrt(5)]*3+[7]*5+[6+math.sqrt(5)]*3+[13]), atol=1e-10)
    checks["shell_spectrum"] = np.allclose(
        np.sort(seed_spectra()["shell"]),
        np.sort([0]+[5-math.sqrt(5)]*3+[6]*5+[5+math.sqrt(5)]*3), atol=1e-10)
    checks["hidden_p5_equals_Delta2_ratio"] = abs(hidden_gibbs()["p5"] - Delta**2/(1+Delta**2)) < 1e-15
    checks["portal_phi3"] = abs(portal_invariants()["amplitude_ratio"]-phi**3) < 1e-12
    checks["portal_phi6"] = abs(portal_invariants()["power_ratio"]-phi**6) < 1e-12
    checks["hypercharge_anomalies"] = max(abs(v) for v in anomaly_residuals().values()) < 1e-15
    checks["A4_root_count"] = a4_invariants()["root_count"] == 20
    checks["A4_rank"] = a4_invariants()["span_rank"] == 4
    checks["engine_net_dissipation"] = engine_invariants()["lyapunov_sum"] < 0 < engine_invariants()["lambda_plus"]
    checks["vortex_C6"] = vortex_mod9()["doubling_cycle"] == [1,2,4,8,7,5,1]
    checks["fluid_M2"] = fluid_moments()["M2_error"] < 1e-12
    checks["fluid_M3"] = fluid_moments()["M3_norm"] < 1e-12
    checks["fluid_M4"] = fluid_moments()["M4_error"] < 1e-12
    return {"all_pass": all(checks.values()), "checks": checks}


def main() -> None:
    out=snapshot()
    out["verification"] = verify()
    print(json.dumps(out, indent=2, default=lambda x: x.tolist() if isinstance(x,np.ndarray) else str(x)))


if __name__ == "__main__":
    main()