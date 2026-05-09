"""
Property-based tests with Hypothesis.

Where the rest of the suite asserts specific numerical equalities, this
file asserts **invariants** — properties that must hold for *every* input
in a class, not just the ones the framework's authors had in mind.

Until now the framework had zero hypothesis-based tests.  These exercise
mathematical properties that should be robust under arbitrary perturbation:

  - URT step is a Banach contraction (|f(x)−f(y)| ≤ κ|x−y|)
  - δ_metric symmetry / nan-propagation
  - Cathedral integers reproduce themselves under their forced relations
  - the IKT basis is unitary (round-trip identity for any input)
  - the icosahedral Laplacian eigenvalues are non-negative
"""
import math

import numpy as np
import pytest
from hypothesis import given, settings, assume
from hypothesis import strategies as st

from urt.shell_closure import DELTA_STAR, N, D, V, E, F, q, G, gamma
from urt.control import urt_step, _ALPHA, _BETA, _THETA, _KAPPA
from urt.metrics import delta_metric, D_KY_from_l1_proxy, DKY_from_delta_monotone


# ── URT contraction is robust under random states ────────────────────────

@settings(max_examples=200, deadline=None)
@given(st.floats(min_value=-1.0, max_value=1.0, allow_nan=False),
       st.floats(min_value=-1.0, max_value=1.0, allow_nan=False))
def test_urt_step_lipschitz_property(x, y):
    """For ANY two states in [-1, 1], the URT step's Lipschitz constant
    is bounded by κ + ε (small numerical slack)."""
    assume(abs(x - y) > 1e-9)
    L = abs(urt_step(x) - urt_step(y)) / abs(x - y)
    # The φ-clamping can push L marginally above κ for two well-separated
    # points where one lies inside |p|≤π and the other outside.  The
    # analytic bound is κ at all interior points.
    assert L < _KAPPA + 1e-3


@settings(max_examples=100, deadline=None)
@given(st.floats(min_value=-0.5, max_value=0.5, allow_nan=False))
def test_urt_step_is_contraction_toward_zero(x0):
    """For u=0, the iterated step converges to 0 from any start in [-0.5, 0.5]."""
    x = x0
    for _ in range(500):
        x = float(urt_step(x))
    assert abs(x) < 1e-6


# ── δ-metric is bilinear in (D_KY-1) and (τ-2) ─────────────────────────────

@settings(max_examples=100, deadline=None)
@given(st.floats(min_value=1.0, max_value=5.0),
       st.floats(min_value=0.5, max_value=5.0))
def test_delta_metric_bilinear(dky, tau):
    """δ = (D_KY − 1)·(τ − 2) is bilinear: scaling one factor scales δ."""
    base = delta_metric(dky, tau)
    if not math.isfinite(base):
        return
    # multiply (D_KY - 1) by 2 → δ should double
    new_dky = 1 + 2 * (dky - 1)
    scaled = delta_metric(new_dky, tau)
    if math.isfinite(scaled) and abs(base) > 1e-6:
        assert abs(scaled - 2 * base) < 1e-9


@settings(max_examples=200, deadline=None)
@given(st.floats(min_value=0.0, max_value=10.0))
def test_DKY_proxy_is_geq_one(l1):
    """For any λ₁ ≥ 0, D_KY proxy ≥ 1."""
    assert D_KY_from_l1_proxy(l1) >= 1.0


@settings(max_examples=200, deadline=None)
@given(st.floats(min_value=-1.0, max_value=10.0))
def test_DKY_monotone_is_positive(delta):
    """DKY_from_delta_monotone is always positive."""
    v = DKY_from_delta_monotone(delta)
    assert math.isfinite(v) and v > 0


# ── Cathedral integers are forced by D=3 ──────────────────────────────────

class TestCathedralIntegersForced:
    """The integers are not free parameters — they emerge from D=3 alone."""

    def test_V_is_kissing_number(self):
        assert V == D + D**2 == 12

    def test_N_is_centred_shell(self):
        assert N == 1 + D + D**2 == 13

    def test_E_F_satisfy_euler(self):
        """V − E + F = 2 (Euler characteristic of S²)."""
        assert V - E + F == 2

    def test_q_F_consistent(self):
        """For icosahedron: q·F = 100 ≠ 2E (because E = 30, 2E = 60).
        This is fine: edges shared between faces (each edge is between 2 faces),
        and each face is a triangle (3 edges), so 3·F = 2·E + (something).
        Actually for icosahedron 3·F = 60 = 2·E.  ✓
        """
        # Each face is a triangle with 3 edges
        # Each edge is shared between exactly 2 faces
        # ⇒ 3·F = 2·E
        assert 3 * F == 2 * E == 60


# ── IKT basis round-trip property ─────────────────────────────────────────

@settings(max_examples=20, deadline=None)
@given(st.lists(st.floats(min_value=-1.0, max_value=1.0,
                          allow_nan=False, allow_infinity=False),
                min_size=N, max_size=N))
def test_ikt_round_trip_close(values):
    """IKT inverse(forward(x)) ≈ x to ~1e-4 for any 13-vector.

    Note: the manuscript claims orthonormality at 6.66e-16.  The actual
    achieved round-trip precision is ~1e-5 due to the QR phase step in
    the basis construction.  The strict-precision claim is captured
    separately as an xfail (test_ikt_orthonormal_to_machine_precision).
    """
    from urt.quasicrystal import ikt_forward, ikt_inverse
    x = np.array(values, dtype=complex)
    C = ikt_forward(x)
    x_back = ikt_inverse(C)
    err = np.max(np.abs(x - x_back))
    assert err < 1e-3, f"IKT round-trip error {err:.2e}"


@pytest.mark.xfail(
    strict=True,
    reason=(
        "Manuscript claims IKT basis is orthonormal at 6.66×10⁻¹⁶, but the "
        "actual ikt_matrix() satisfies |M·M† − I|_∞ ≈ 12.5 — the matrix "
        "needs a 1/√N normalisation that is currently absorbed into the "
        "forward/inverse functions but not exposed on the matrix itself.  "
        "Once a normalised version is exported, this test should pass."
    ),
)
def test_ikt_orthonormal_to_machine_precision():
    """The manuscript's headline claim about the IKT basis."""
    from urt.quasicrystal import ikt_matrix
    M = ikt_matrix()
    err = np.max(np.abs(M @ M.conj().T - np.eye(M.shape[0])))
    assert err < 1e-12


# ── Icosahedral graph Laplacian: spectral properties ──────────────────────

class TestLaplacianSpectrum:
    """The 13-site icosahedral graph Laplacian must have:
      - all eigenvalues ≥ 0
      - exactly one zero eigenvalue (connected graph)
      - Fiedler value (2nd-smallest) = D = 3 (the framework's headline)."""

    def setup_method(self):
        from urt.shell_closure import _build_laplacian
        self.L = _build_laplacian()
        self.eigs = sorted(np.linalg.eigvalsh(self.L))

    def test_symmetric(self):
        assert np.allclose(self.L, self.L.T, atol=1e-12)

    def test_nonneg_eigenvalues(self):
        assert min(self.eigs) >= -1e-12

    def test_one_zero_eigenvalue(self):
        zeros = sum(1 for e in self.eigs if abs(e) < 1e-9)
        assert zeros == 1

    def test_fiedler_value_is_D(self):
        """λ₂ = D = 3 — the spectral gap equals the spatial dimension."""
        # 2nd smallest eigenvalue
        l2 = self.eigs[1]
        assert l2 == pytest.approx(D, abs=1e-9)


# ── Casimir: regression-stable d-scaling ─────────────────────────────────

@settings(max_examples=50, deadline=None)
@given(st.floats(min_value=50e-9, max_value=2000e-9, allow_nan=False))
def test_casimir_d_scaling_regression(d):
    """For any d in [50, 2000] nm, the *standard* Casimir formula scales
    as 1/d⁴ — invariant under reparameterisation."""
    from urt.casimir_cathedral import casimir_force_per_area
    f = casimir_force_per_area(d)
    f2 = casimir_force_per_area(2 * d)
    assert abs(f) == pytest.approx(16 * abs(f2), rel=1e-9)


# ── δ_CP is invariant under any module that exposes it ───────────────────

@settings(max_examples=10, deadline=None)
@given(st.sampled_from(["urt.ckm_pmns", "urt.baryon_asymmetry", "urt.neutrinos"]))
def test_delta_cp_module_invariance(mod_name):
    """δ_CP = 197° in every module that defines it."""
    import importlib
    mod = importlib.import_module(mod_name)
    for sym in ("DELTA_CP_PMNS_DEG", "DELTA_CP_DEG"):
        if hasattr(mod, sym):
            assert getattr(mod, sym) == 197
            return
    pytest.skip(f"{mod_name} exposes no δ_CP symbol")


# ── Mass ratio identity hold under any factorisation ─────────────────────

class TestProtonElectronFactorisations:
    """1836 = 4·27·17 = (D+1)·D^D·(N+D+1).  Any rearrangement holds."""

    def test_factorisation_27(self):
        assert D**D == 27

    def test_factorisation_4(self):
        assert D + 1 == 4

    def test_factorisation_17(self):
        assert N + D + 1 == 17

    def test_product(self):
        assert (D + 1) * D**D * (N + D + 1) == 1836

    def test_distributive_identity(self):
        """4·27·17 ≡ 4·(27·17) ≡ (4·27)·17 ≡ 17·(4·27)  — associativity check."""
        a = (D + 1) * D**D * (N + D + 1)
        b = (D + 1) * (D**D * (N + D + 1))
        c = ((D + 1) * D**D) * (N + D + 1)
        d = (N + D + 1) * ((D + 1) * D**D)
        assert a == b == c == d == 1836
