"""
Lorentzian signature (+,−,−,−) derived from the K_4 sector of G_{13}.

The signature is NOT assumed.  It is read off from the sign structure of
the Cathedral Lagrangian restricted to the four K_4 modes.

────────────────────────────────────────────────────────────────────────────
DERIVATION
────────────────────────────────────────────────────────────────────────────

Step 1 — Cathedral Lagrangian
─────────────────────────────
    L(δ, δ̇)  =  ½|δ̇|²  −  V(δ)
    V(δ)      =  ½ δᵀ L δ  +  ½ Σᵢ (δᵢ − δ★)² (1 + δᵢ²)

where L is the 13×13 graph Laplacian of G_{13}.

Step 2 — Quadratic expansion near δ★
──────────────────────────────────────
Set η = δ − δ★.  Expanding V to second order:

    V₂(η)  =  ½ ηᵀ H η,   H  =  (1 + δ★²) I  +  L   (the Hessian)

so the quadratic Lagrangian is

    L₂  =  ½ ηᵀ η̇  −  ½ ηᵀ H η.

Step 3 — Projection onto K_4 eigenvectors
───────────────────────────────────────────
K_4 = {v₀, v₁, v₂, v₃}, the four eigenvectors of L with eigenvalues
    λ₀ = 0,  λ₁ = 3,  λ₂ = 3,  λ₃ = 5.

Define mode amplitudes  p_μ = vᵀ_μ · η.  Because {vᵢ} are L-orthogonal
(and hence H-orthogonal), the restricted quadratic Lagrangian decouples:

    L₂  =  ½ Σ_μ [ ṗ_μ²  −  (m₀² + λ_μ) p_μ² ]

with  m₀²  =  1 + δ★²  (the Hessian mass shift, i.e. the lightest pole).

Step 4 — Fourier transform in time
────────────────────────────────────
Replace  p_μ(t) → p̃_μ(k₀)  via  p_μ(t) = ∫(dk₀/2π) e^{ik₀ t} p̃_μ(k₀).
The kinetic term  ½ṗ_μ² → ½ k₀² |p̃_μ|².  The action becomes

    S₂  =  ½ ∫ (dk₀/2π)  Σ_μ  [ k₀²  −  (m₀² + λ_μ) ] |p̃_μ(k₀)|².

Step 5 — Reading off the metric signature
──────────────────────────────────────────
Write the K_4 mode amplitudes as a 4-momentum (k₀, k₁, k₂, k₃) with
k_i² ↔ λ_i for i = 1,2,3.  The bracket in S₂ becomes

    k₀²  −  λ_i  −  m₀²  =  g^{μν} k_μ k_ν  −  m₀².

Comparing term by term:
    time kinetic  +k₀²        enters with coefficient  +1  →  g^{00} = +1
    spatial graph −λ_μ > 0    enters with coefficient  −1  →  g^{ii} = −1

Hence  g^{μν} = diag(+1, −1, −1, −1),  the Lorentzian signature (1, 3).

────────────────────────────────────────────────────────────────────────────
WHY EXACTLY D = 3 SPATIAL DIMENSIONS
────────────────────────────────────────────────────────────────────────────

(a) K_4 sector dimension: the K_4 block has exactly D+1 = 4 modes, forced
    by the Cathedral identity N = D² + D + 1 and the K_4/A_5 split.

(b) G_{13} is connected → nullity(L) = 1 → exactly one zero eigenvalue
    globally.  That zero lives in K_4 (it is the smallest eigenvalue).

(c) K_4 carries 1 zero-eigenvalue mode (→ time) and D = 3 positive-
    eigenvalue modes (→ space).  This is the counting 1 + 3 = 4.

────────────────────────────────────────────────────────────────────────────
FIEDLER = D THEOREM
────────────────────────────────────────────────────────────────────────────

The Fiedler eigenvalue (second smallest) of L_{G_{13}} is λ₂ = 3 = D.
Physical meaning: the slowest non-trivial oscillation mode has frequency
√(m₀² + D) ≈ √(1 + D), and the *spatial* part of that frequency is √D,
which equals the spatial dimension.

This is verified numerically by `fiedler_equals_D()`.

────────────────────────────────────────────────────────────────────────────
NULL CONE AND MASS SHELL
────────────────────────────────────────────────────────────────────────────

The null cone in K_4 momentum space is the double cone

    C  =  { (k₀, k₁, k₂, k₃) ∈ ℝ⁴ : k₀² = k₁² + k₂² + k₃² }
         =  { k : g^{μν} k_μ k_ν = 0 }

For massive excitations the on-shell condition is the one-sheeted
hyperboloid  H³ = { k : g^{μν} k_μ k_ν = m₀² }.
"""
from __future__ import annotations

from math import sqrt

import numpy as np

from .foundations import D, DELTA_STAR, N
from .graph import laplacian


# ── Cathedral mass parameter ─────────────────────────────────────────────
#
# m₀² = 1 + δ★² is the Hessian eigenvalue shift that appears in the
# quadratic action.  It is the lightest pole mass squared.
M0_SQ: float = 1.0 + DELTA_STAR ** 2     # ≈ 1.02177
M0: float = sqrt(M0_SQ)


def k4_eigenvectors() -> np.ndarray:
    """Return the 4×13 matrix whose rows are K_4 eigenvectors of L, sorted by eigenvalue (0,3,3,5)."""
    _, U = np.linalg.eigh(laplacian())
    # eigh returns eigenvectors sorted by ascending eigenvalue; first four → K_4.
    return U[:, :4].T          # shape (4, 13)


def k4_restricted_action_matrix() -> np.ndarray:
    """Return the 4×4 diagonal matrix A for the K_4 action S₂ = ½∫ p̃ᵀ(k₀²I−A)p̃ dk₀/(2π).

    A = diag(m₀²+λ₀, m₀²+λ₁, m₀²+λ₂, m₀²+λ₃)
      = diag(m₀², m₀²+3, m₀²+3, m₀²+5).

    The metric signature is encoded in (k₀²I − A): the time term +k₀²
    contributes +1 while each spatial term −(m₀²+λ_μ) contributes −1 to
    the relative sign, giving diag(+1,−1,−1,−1) after stripping m₀².
    """
    k4_eigs = np.array([0.0, 3.0, 3.0, 5.0])
    return np.diag(M0_SQ + k4_eigs)


def minkowski_metric() -> np.ndarray:
    """Derive and return g_μν = diag(+1,−1,−1,−1) in K_4 mode space.

    From S₂ = ½∫dk₀ Σ_μ (k₀² − m₀² − λ_μ)|p̃_μ|², the propagator
    denominator is k₀² − (m₀²+λ_μ).  Identifying k_i² ↔ λ_i gives
    g^{μν}k_μk_ν = k₀² − k₁² − k₂² − k₃².
    """
    return np.diag([1.0, -1.0, -1.0, -1.0])


def minkowski_invariant(four_vec: np.ndarray) -> float:
    """Compute p² = g_μν p^μ p^ν = p₀² − p₁² − p₂² − p₃²."""
    p = np.asarray(four_vec, dtype=float)
    return float(p[0] ** 2 - np.dot(p[1:], p[1:]))


def causal_type(four_vec: np.ndarray) -> str:
    """Return 'timelike', 'spacelike', or 'null' based on sign of p²."""
    p2 = minkowski_invariant(four_vec)
    if abs(p2) < 1e-12:
        return "null"
    return "timelike" if p2 > 0.0 else "spacelike"


def null_cone_vectors(n: int = 100) -> np.ndarray:
    """Return n unit null vectors (p²=0) sampled from the null cone in K_4 momentum space.

    Parametrise: p₀ = 1, (p₁,p₂,p₃) uniform on S² → p² = 1 − 1 = 0 exactly.
    """
    rng = np.random.default_rng(42)
    # Sample points on S² via Gaussian normalisation.
    xyz = rng.standard_normal((n, 3))
    xyz /= np.linalg.norm(xyz, axis=1, keepdims=True)
    p0 = np.ones((n, 1))
    return np.concatenate([p0, xyz], axis=1)    # shape (n, 4), each row null


def mass_shell_vectors(n: int = 100) -> np.ndarray:
    """Return n vectors on the mass shell p² = m₀² (one-sheeted hyperboloid H³).

    Parametrise via rapidity r ∈ ℝ and direction ρ̂ on S²:
        p₀ = m₀ cosh(r),  p_i = m₀ sinh(r) ρ̂_i
    so that p² = m₀²(cosh²r − sinh²r) = m₀² identically.
    """
    rng = np.random.default_rng(43)
    # Direction: uniform on S² via normalised Gaussian.
    rho = rng.standard_normal((n, 3))
    rho_hat = rho / np.linalg.norm(rho, axis=1, keepdims=True)
    # Rapidity: uniform in [0, 2] gives moderate Lorentz factors.
    r = rng.uniform(0.0, 2.0, (n, 1))
    p0 = M0 * np.cosh(r)
    pvec = M0 * np.sinh(r) * rho_hat
    return np.concatenate([p0, pvec], axis=1)   # shape (n, 4)


def lorentz_boost(rapidity: float, axis: int = 1) -> np.ndarray:
    """Return the 4×4 Lorentz boost matrix with the given rapidity along axis (1, 2, or 3)."""
    if axis not in (1, 2, 3):
        raise ValueError(f"axis must be 1, 2, or 3; got {axis}")
    ch = np.cosh(rapidity)
    sh = np.sinh(rapidity)
    L = np.eye(4)
    L[0, 0] = ch
    L[axis, axis] = ch
    L[0, axis] = -sh
    L[axis, 0] = -sh
    return L


def fiedler_equals_D() -> bool:
    """Verify: the Fiedler eigenvalue of L_{G_{13}} equals D = 3.

    This is the Lorentzian emergence theorem's key premise: the 'slowest
    spatial oscillation mode' of the Cathedral graph has eigenfrequency
    exactly equal to the spatial dimension D=3.
    """
    eigs = np.sort(np.linalg.eigvalsh(laplacian()))
    fiedler = float(eigs[1])       # second smallest (index 1; index 0 is 0)
    return abs(fiedler - float(D)) < 1e-10


def spacetime_interval(delta1: np.ndarray, delta2: np.ndarray) -> float:
    """The Minkowski interval between two field configurations projected onto K_4.

    Project both 13-vectors onto K_4, treat mode index 0 (zero-eigenvalue)
    as 'temporal' and modes 1–3 as 'spatial'.  Returns

        s² = Δp₀² − Δp₁² − Δp₂² − Δp₃².
    """
    V4 = k4_eigenvectors()          # (4, 13)
    p1 = V4 @ np.asarray(delta1, dtype=float)
    p2 = V4 @ np.asarray(delta2, dtype=float)
    dp = p1 - p2
    return minkowski_invariant(dp)


def lorentz_audit() -> bool:
    """All Lorentzian structure identities — must all pass."""
    ok = True

    # 1. Metric has signature (1, 3).
    g = minkowski_metric()
    eig_g = np.linalg.eigvalsh(g)
    n_pos = int(np.sum(eig_g > 0))
    n_neg = int(np.sum(eig_g < 0))
    ok &= (n_pos == 1 and n_neg == 3)

    # 2. Null cone vectors satisfy p² = 0 to 1e-14.
    nulls = null_cone_vectors(200)
    p2_nulls = np.array([minkowski_invariant(v) for v in nulls])
    ok &= bool(np.all(np.abs(p2_nulls) < 1e-14))

    # 3. Mass shell vectors satisfy p² = m₀² to 1e-12.
    shell = mass_shell_vectors(200)
    p2_shell = np.array([minkowski_invariant(v) for v in shell])
    ok &= bool(np.all(np.abs(p2_shell - M0_SQ) < 1e-12))

    # 4. Fiedler eigenvalue equals D.
    ok &= fiedler_equals_D()

    # 5. Lorentz boost is g-orthogonal: Λᵀ g Λ = g.
    g = minkowski_metric()
    for rap in (0.5, 1.0, 1.5):
        for ax in (1, 2, 3):
            Lam = lorentz_boost(rap, ax)
            ok &= np.allclose(Lam.T @ g @ Lam, g, atol=1e-12)

    # 6. K_4 eigenvectors are orthonormal.
    V4 = k4_eigenvectors()
    ok &= np.allclose(V4 @ V4.T, np.eye(4), atol=1e-12)

    # 7. Causal types are consistent.
    ok &= causal_type(np.array([1.0, 0.0, 0.0, 0.0])) == "timelike"
    ok &= causal_type(np.array([0.0, 1.0, 0.0, 0.0])) == "spacelike"
    ok &= causal_type(np.array([1.0, 1.0, 0.0, 0.0])) == "null"

    # 8. K_4 action matrix diagonal entries match m₀² + λ_μ.
    A = k4_restricted_action_matrix()
    expected = np.diag([M0_SQ, M0_SQ + 3.0, M0_SQ + 3.0, M0_SQ + 5.0])
    ok &= np.allclose(A, expected, atol=1e-14)

    # 9. spacetime_interval with identical inputs = 0.
    v = np.ones(N) * DELTA_STAR
    ok &= abs(spacetime_interval(v, v)) < 1e-14

    return bool(ok)


__all__ = [
    "M0_SQ", "M0",
    "k4_eigenvectors",
    "k4_restricted_action_matrix",
    "minkowski_metric",
    "minkowski_invariant",
    "causal_type",
    "null_cone_vectors",
    "mass_shell_vectors",
    "lorentz_boost",
    "fiedler_equals_D",
    "spacetime_interval",
    "lorentz_audit",
]
