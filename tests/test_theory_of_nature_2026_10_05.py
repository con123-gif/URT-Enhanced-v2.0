import math

import numpy as np


def test_2026_10_05_theory_closure_identities():
    phi = (1.0 + math.sqrt(5.0)) / 2.0

    # Representative signed conference operator for the six icosahedral axes.
    S = np.array(
        [
            [0, 1, -1, -1, -1, -1],
            [1, 0, -1, -1, 1, 1],
            [-1, -1, 0, -1, -1, 1],
            [-1, -1, -1, 0, 1, -1],
            [-1, 1, -1, 1, 0, 1],
            [-1, 1, 1, -1, 1, 0],
        ],
        dtype=float,
    )
    I6 = np.eye(6)

    assert np.allclose(S @ S, 5.0 * I6, atol=1e-14)

    P_plus = 0.5 * (I6 + S / math.sqrt(5.0))
    P_minus = 0.5 * (I6 - S / math.sqrt(5.0))

    assert np.allclose(P_plus @ P_plus, P_plus, atol=1e-14)
    assert np.allclose(P_minus @ P_minus, P_minus, atol=1e-14)
    assert np.allclose(P_plus @ P_minus, np.zeros((6, 6)), atol=1e-14)
    assert np.isclose(np.trace(P_plus), 3.0, atol=1e-14)
    assert np.isclose(np.trace(P_minus), 3.0, atol=1e-14)

    M = 0.5 * (I6 + S)
    assert np.allclose(M @ M, M + I6, atol=1e-14)
    assert np.allclose(M @ P_plus, phi * P_plus, atol=1e-14)
    assert np.allclose(M @ P_minus, -(1.0 / phi) * P_minus, atol=1e-14)

    alpha_urt = (1.0 / phi) / phi
    assert np.isclose(alpha_urt, 1.0 / (phi * phi), atol=1e-15)
    phase = 2.0 * math.pi * alpha_urt
    assert np.isclose(phase, 2.0 * math.pi / (phi * phi), atol=1e-15)

    # Hidden antipodal grading and its affine binary selector.
    P43 = np.diag([1.0] * 4 + [0.0] * 4)
    P45 = np.diag([0.0] * 4 + [1.0] * 4)
    I8 = np.eye(8)
    Gamma = -P43 + P45
    L_hid = 3.0 * P43 + 5.0 * P45
    Q = 0.5 * (L_hid - 3.0 * I8)

    assert np.allclose(Gamma @ Gamma, I8, atol=1e-14)
    assert np.allclose(L_hid, 4.0 * I8 + Gamma, atol=1e-14)
    assert np.allclose(Q, P45, atol=1e-14)
    assert np.allclose(Q @ Q, Q, atol=1e-14)

    # Rail factorization.
    d_cl = 3.0 / 20.0
    d_star = math.pi * (1.0 / phi) * (1.0 / 13.0) * (80.0 / 81.0)
    d_star_closed = 80.0 * math.pi / (1053.0 * phi)
    assert np.isclose(d_star, d_star_closed, atol=1e-16)

    Delta = d_cl - d_star
    assert Delta > 0.0
    assert np.isclose(Delta, 0.002489189840420375, atol=5e-17)

    eta_delta = -math.log(Delta)
    R = P43 + math.exp(-eta_delta) * P45
    gram = R.T @ R
    rho = gram / np.trace(gram)

    rho_expected = (P43 + (Delta * Delta) * P45) / (4.0 * (1.0 + Delta * Delta))
    assert np.allclose(R, P43 + Delta * P45, atol=1e-14)
    assert np.allclose(rho, rho_expected, atol=1e-14)
    assert np.isclose(np.trace(rho), 1.0, atol=1e-14)

    # Hopf shell: full c1=1 flux and antipodal scalar quotient.
    face_phase = math.pi / 10.0
    assert np.isclose(20.0 * face_phase, 2.0 * math.pi, atol=1e-15)
    projective_scalar_flux = 10.0 * face_phase
    assert np.isclose(projective_scalar_flux, math.pi, atol=1e-15)

    # Candidate reconstructed primitive URT multiplier.
    kappa = projective_scalar_flux * math.exp(-1.0)
    assert np.isclose(kappa, math.pi / math.e, atol=1e-15)

    q_urt = kappa * np.exp(1j * phase)
    q_expected = (math.pi / math.e) * np.exp(1j * 2.0 * math.pi / (phi * phi))
    assert abs(q_urt - q_expected) < 1e-14
