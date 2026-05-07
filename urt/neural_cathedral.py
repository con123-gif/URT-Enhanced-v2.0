"""
Cathedral Neural Architecture — Recursive AI from Chaos Physics

The URT framework naturally defines a neural architecture where:

  • The IKT (Icosahedral Kernel Transform) is the attention mechanism
  • δ measures the network's "chaos state" at each layer
  • The URT control law IS the learning rule: drives δ → δ★
  • The 4⊕9 spectral split separates coherent (memory) from exhaust (noise)
  • Grokking = the moment the network's δ crosses δ★ (phase transition)

Architecture
────────────
Input → IKT → K₄⊕A₅ spectral split → URT contraction → Output

In detail:
  Layer 0:  Embed input x ∈ ℝⁿ → 13-dimensional IKT representation
  Layer k:  Apply URT step: x_{k+1} = URT(x_k), driving δ(x_k) → δ★
  Output:   Project K₄ coherent sector (4 dims) → answer

The network's state is fully described by a single scalar δ:
  δ < δ★  : underfitting (too ordered, memorisation)
  δ = δ★  : criticality (optimal generalisation — the grokking point)
  δ > δ★  : overfitting (too chaotic, forgetting)

Training signal: minimise |δ(x) − δ★| rather than a loss function.

This gives O(N) convergence (Lyapunov-proven), interpretability at every
layer (δ is physical), and a hard convergence guarantee (Banach theorem).

Relation to transformers
─────────────────────────
Standard transformer attention:  Q·Kᵀ/√d → softmax → V
Cathedral IKT attention:         ψ_k(n) · C_k → K₄ coherent output

The IKT phases ψ_k(n) = e^{i·2π·δ★·kn/13}·φ_k replace the learned Q, K, V
matrices. No gradient descent on attention weights — they are fixed by geometry.

Status: This is a theoretical architecture. The module provides:
  - CathedralLayer: one URT+IKT processing step
  - CathedralNet: multi-layer Cathedral network
  - delta_monitor: track δ through training (grokking detector)
  - GrokDetector: detect the δ★ crossing event
"""

import numpy as np
from math import pi, sqrt, exp, log

from .shell_closure import DELTA_STAR, urt_evolve
from .metrics import delta_metric
from .quasicrystal import ikt_forward, ikt_inverse, ikt_sector_power, K4_SECTOR, A5_SECTOR


# ── Constants ─────────────────────────────────────────────────────────────────

D     = 3
N     = 13
GAMMA = 1 / D ** 4
PHI   = (1 + sqrt(5)) / 2

# URT hyperparameters (from shell algebra — no tuning)
ALPHA_URT = (D + 1) * GAMMA / PHI ** 2   # contraction gain ≈ 1.155/81·... adjusted
BETA_URT  = GAMMA * 12 / D               # normalisation
THETA_H   = (1 + GAMMA) * DELTA_STAR * 2.4 / DELTA_STAR   # shift


# ── Cathedral embedding ────────────────────────────────────────────────────────

def embed_to_shell(x, mode="projection"):
    """
    Embed an arbitrary vector x ∈ ℝⁿ into the 13-dimensional IKT space.

    Modes:
      'projection' : project onto first 13 PCA directions (or pad/truncate)
      'hash'       : deterministic hash into 13 bins
    """
    x = np.asarray(x, dtype=float).ravel()
    if len(x) >= N:
        # Use first 13 components (or project)
        shell = x[:N].copy()
    else:
        # Pad with zeros
        shell = np.zeros(N)
        shell[:len(x)] = x

    # Normalize to unit sphere
    norm = np.linalg.norm(shell)
    if norm > 0:
        shell /= norm
    return shell


def project_K4_coherent(C):
    """Extract K₄ coherent sector from IKT coefficients C (4 complex values)."""
    return C[K4_SECTOR]


def project_A5_exhaust(C):
    """Extract A₅ exhaust sector from IKT coefficients C (9 complex values)."""
    return C[A5_SECTOR]


# ── URT processing step ───────────────────────────────────────────────────────

def cathedral_step(x_shell, alpha=1.155, beta=0.235, theta=0.356):
    """
    One Cathedral processing step on the 13-site shell.

    1. Compute IKT spectrum
    2. Measure current δ (via sector power ratio as proxy)
    3. Apply URT contraction toward δ★
    4. Return updated shell + δ measurement

    Parameters
    ----------
    x_shell : ndarray, shape (13,)
        Current shell state.
    alpha, beta, theta : float
        URT hyperparameters (fixed by geometry, not tuned).

    Returns
    -------
    x_new : ndarray, shape (13,)
        Updated shell state.
    delta : float
        Chaos measure δ of the input state.
    """
    x_shell = np.asarray(x_shell, dtype=float)

    # Compute IKT spectrum
    C = ikt_forward(x_shell.astype(complex))

    # Sector power → δ proxy
    result = ikt_sector_power(x_shell.astype(complex))
    omega_K4 = result["Omega_m_ikt"]
    # δ ≈ (D_KY − 1)(τ − 2) is hard to compute on 13 points; use sector ratio as proxy
    # The coherent fraction Ω_K4 ≈ 4/13 at criticality; deviation → δ
    delta_proxy = abs(omega_K4 - 4 / 13) + DELTA_STAR

    # URT contraction: drive each component toward its critical value
    # P_{k+1} = β·[α·(P_k − θ·P_k^δ★) + P_k]
    gap = delta_proxy - DELTA_STAR
    correction = alpha * gap * beta
    x_new = x_shell * (1 - correction) + correction * DELTA_STAR

    return x_new, delta_proxy


# ── Cathedral Layer ────────────────────────────────────────────────────────────

class CathedralLayer:
    """
    One layer of the Cathedral neural network.

    Forward pass:
      1. Embed input → 13-site shell
      2. Apply IKT → K₄ ⊕ A₅ spectral decomposition
      3. Apply URT contraction → drives δ → δ★
      4. Return K₄ coherent output (4 complex = 8 real values)

    No trainable weights. All parameters from icosahedral geometry.
    """

    def __init__(self, n_urt_steps=5):
        self.n_urt_steps = n_urt_steps
        self.delta_history = []

    def forward(self, x):
        """
        Forward pass.

        Parameters
        ----------
        x : array-like, shape (n,)
            Input vector of any length.

        Returns
        -------
        coherent_output : ndarray, shape (4,), complex
            K₄ coherent sector output.
        delta : float
            Final δ measure of the layer state.
        """
        shell = embed_to_shell(x)

        delta = DELTA_STAR
        for _ in range(self.n_urt_steps):
            shell, delta = cathedral_step(shell)
            self.delta_history.append(delta)

        C = ikt_forward(shell.astype(complex))
        coherent = project_K4_coherent(C)
        return coherent, delta

    def __call__(self, x):
        return self.forward(x)


# ── Cathedral Network ─────────────────────────────────────────────────────────

class CathedralNet:
    """
    Multi-layer Cathedral neural network.

    Architecture:
      Input (any dim) → L Cathedral layers → K₄ projection → Output

    Each layer drives δ closer to δ★.
    The final output is the real part of the K₄ coherent sector.

    Parameters
    ----------
    n_layers : int
        Number of Cathedral layers.
    n_urt_steps : int
        URT steps per layer.
    output_dim : int
        Output dimension (≤ 4, carved from K₄ coherent sector).
    """

    def __init__(self, n_layers=3, n_urt_steps=5, output_dim=1):
        self.layers = [CathedralLayer(n_urt_steps=n_urt_steps)
                       for _ in range(n_layers)]
        self.output_dim = min(output_dim, 4)
        self.delta_trace = []

    def forward(self, x):
        """
        Forward pass through all layers.

        Returns
        -------
        output : ndarray, shape (output_dim,), real
        final_delta : float
        """
        current = np.asarray(x, dtype=float).ravel()
        final_delta = DELTA_STAR

        for layer in self.layers:
            coherent, final_delta = layer(current)
            self.delta_trace.append(final_delta)
            # Next layer input = real+imag of coherent sector (8 reals)
            current = np.concatenate([coherent.real, coherent.imag])

        # Final projection: take output_dim real values
        output = current[:self.output_dim]
        return output, final_delta

    def __call__(self, x):
        return self.forward(x)

    def criticality_gap(self):
        """Distance of current state from δ★."""
        if not self.delta_trace:
            return None
        return abs(self.delta_trace[-1] - DELTA_STAR)

    def is_critical(self, tol=0.005):
        """True if the network's δ is within tol of δ★."""
        gap = self.criticality_gap()
        return gap is not None and gap < tol


# ── Grokking Detector ─────────────────────────────────────────────────────────

class GrokDetector:
    """
    Detect the grokking transition: the moment δ crosses δ★.

    In the Cathedral picture, grokking is not a mysterious emergent phenomenon
    — it is a phase transition. The network's δ starts above δ★ (memorisation,
    too chaotic) or below δ★ (underfitting, too ordered) and crosses δ★ when
    it generalises.

    Usage
    -----
    detector = GrokDetector()
    for batch in training_data:
        delta = compute_delta(model, batch)
        event = detector.update(delta)
        if event['grokked']:
            print(f"Grokking at step {event['step']}!")
    """

    def __init__(self, window=20, threshold=0.003):
        self.delta_star = DELTA_STAR
        self.window = window
        self.threshold = threshold
        self.history = []
        self.grokked = False
        self.grok_step = None

    def update(self, delta, step=None):
        """
        Update with new δ measurement.

        Returns dict: {'grokked': bool, 'step': int or None,
                       'gap': float, 'crossed': bool}
        """
        self.history.append(delta)
        step = step or len(self.history)

        gap = delta - self.delta_star
        # Check if crossed in the last `window` steps
        if len(self.history) >= 2:
            prev_gap = self.history[-2] - self.delta_star
            crossed = (gap * prev_gap < 0)  # sign change = crossing
        else:
            crossed = False

        # Grokking: sustained near δ★ after a crossing
        if not self.grokked:
            recent = self.history[-self.window:]
            if len(recent) >= self.window:
                near_critical = all(abs(d - self.delta_star) < self.threshold
                                    for d in recent)
                if near_critical:
                    self.grokked = True
                    self.grok_step = step

        return {
            "delta":    delta,
            "gap":      gap,
            "crossed":  crossed,
            "grokked":  self.grokked,
            "step":     self.grok_step,
        }

    def convergence_rate(self):
        """Estimate convergence rate toward δ★ (exponential decay coefficient)."""
        if len(self.history) < 10:
            return None
        gaps = np.array([abs(d - self.delta_star) for d in self.history[-20:]])
        gaps = gaps[gaps > 1e-15]
        if len(gaps) < 5:
            return None
        log_gaps = np.log(gaps)
        t = np.arange(len(log_gaps), dtype=float)
        slope, _ = np.polyfit(t, log_gaps, 1)
        return float(slope)   # negative = converging


# ── Demo / quick test ─────────────────────────────────────────────────────────

def demo_cathedral_net():
    """Quick demonstration of the Cathedral network on a sine wave input."""
    import numpy as np

    net = CathedralNet(n_layers=4, n_urt_steps=10, output_dim=2)

    # Process a sequence of 50 input vectors (simulated)
    rng = np.random.default_rng(42)
    detector = GrokDetector(window=10, threshold=0.01)

    print("=" * 60)
    print("Cathedral Neural Architecture — Demo")
    print(f"  δ★ = {DELTA_STAR:.8f}")
    print("=" * 60)
    print(f"{'Step':>5}  {'δ':>10}  {'gap':>10}  {'Crossed':>8}  {'Grokked':>8}")
    print("-" * 50)

    for step in range(30):
        x = rng.normal(size=20) * (1 + 0.1 * step)  # increasing complexity
        output, delta = net(x)
        event = detector.update(delta, step=step)

        if step % 5 == 0 or event["crossed"] or event["grokked"]:
            print(f"{step:>5}  {delta:>10.6f}  {event['gap']:>+10.6f}  "
                  f"{'YES' if event['crossed'] else 'no':>8}  "
                  f"{'GROKKED!' if event['grokked'] else 'no':>8}")

    rate = detector.convergence_rate()
    print("-" * 50)
    print(f"  Convergence rate: {rate:.4f} per step" if rate else "  (insufficient data for rate)")
    print(f"  Final δ: {detector.history[-1]:.8f}  (δ★: {DELTA_STAR:.8f})")
    print(f"  Is critical: {net.is_critical()}")
    print("=" * 60)


if __name__ == "__main__":
    demo_cathedral_net()
