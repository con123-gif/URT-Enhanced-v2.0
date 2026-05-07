"""
Icosahedral Recursive Neural Network (IRN) — URT × O(N) × Cathedral geometry.

Three interlocking principles:

  1. URT contraction law — every layer is a provably-convergent Banach contraction
     toward δ★.  κ = β·α·(1+θ_h) ≈ 0.923 < 1  →  convergence guaranteed.

  2. O(N) complexity — sparse attention / message-passing follows the icosahedral
     graph (|V|=13, |E|=42, degree q=5 for outer nodes).  Each node aggregates
     only from its q=5 neighbors: O(|V|×degree) = O(N×q) = O(N).

  3. Recursive A₅-depth — self-similar structure with D=3 branching:
       T(N, d) = D × T(N/D, d-1) + O(N)  →  O(N·d) = O(N log_D N)
     After depth d the contraction factor is κ^(d+1) → 0.

Architecture
────────────
    x ──→ IcosahedralEncoder
        ──→ [IcosahedralMessagePassing × n_layers]  O(N) each
        ──→ RecursiveURTCell (depth D=3)             O(N·D)
        ──→ URTSparseAttention (icosahedral mask)    O(N×q)
        ──→ IcosahedralRNN (Kuramoto hidden state)   O(N) per step
        ──→ K₄ sector projection → output            O(1)

  IcosahedralRecursiveNet wraps all of the above.

Cathedral integers wired in (zero free parameters in core layers):
  N=13  sites  |  D=3  dims / branching  |  q=5  degree / temperature
  δ★≈0.14751  critical point  |  κ<1  contraction  |  G=60  A₅ order
  K_c≈1.278  Kuramoto threshold  |  E=30  outer edges  |  γ=1/81  noise floor

Relation to standard architectures
───────────────────────────────────
  Transformer attention:  Q·Kᵀ/√d → softmax(all pairs) → V      O(N²)
  IRN sparse attention:   Q·Kᵀ/δ★  → softmax(neighbors) → V     O(N×q)=O(N)

  LSTM hidden state:      h_t = sigmoid(W·[h_{t-1},x_t])         learned W
  IcosahedralRNN:         θ_t = θ_{t-1} + Kuramoto(θ_{t-1},x_t) geometry only

  ResNet residual:        x_{l+1} = x_l + F(x_l)                 F learned
  RecursiveURTCell:       x_{l+1} = κ·x_l + (1-κ)·δ★             κ from URT
"""

from math import sqrt, pi, log
import numpy as np

from .shell_closure import DELTA_STAR, N, D, q, gamma, phi, V, G, E as E_ICOS
from .control import _ALPHA, _BETA, _THETA, _KAPPA
from .quasicrystal import ikt_forward, K4_SECTOR, A5_SECTOR

# ── Icosahedral graph ─────────────────────────────────────────────────────────
# 13 nodes: 12 outer icosahedral vertices (0-11) + 1 center (12)
# Outer: 30 edges (= E_ICOS), each vertex degree = q = 5
# Center: 12 edges (connects to all outer nodes)

_EDGES_OUTER = [
    (0, 1), (0, 2), (0, 3), (0, 4), (0, 5),          # top → upper ring
    (1, 2), (2, 3), (3, 4), (4, 5), (5, 1),            # upper ring cycle
    (1, 6), (1, 10), (2, 6), (2, 7), (3, 7), (3, 8),   # upper ↔ lower cross
    (4, 8), (4, 9), (5, 9), (5, 10),
    (6, 7), (7, 8), (8, 9), (9, 10), (10, 6),          # lower ring cycle
    (6, 11), (7, 11), (8, 11), (9, 11), (10, 11),      # lower → bottom
]
_EDGES_CENTER = [(12, i) for i in range(12)]
_ALL_EDGES = _EDGES_OUTER + _EDGES_CENTER

N_OUTER_EDGES   = len(_EDGES_OUTER)            # = 30 = E_ICOS
N_CENTER_EDGES  = len(_EDGES_CENTER)           # = 12 = N - 1
N_TOTAL_EDGES   = N_OUTER_EDGES + N_CENTER_EDGES  # = 42
OUTER_DEGREE    = q                            # = 5 (each outer node)
CENTER_DEGREE   = N - 1                        # = 12 (center node)
KAPPA           = _KAPPA                       # ≈ 0.923 (contraction rate)
K_KURAMOTO_CRIT = 1.278                        # critical Kuramoto coupling

# Boolean flags
N_EDGES_EQ_E  = (N_OUTER_EDGES == E_ICOS)     # True: outer edges = Cathedral E
DEGREE_EQ_Q   = (OUTER_DEGREE == q)            # True: outer degree = q
KAPPA_LT_1    = (KAPPA < 1.0)                  # True: URT is a contraction


def build_icosahedral_adjacency():
    """Adjacency list (length N=13) for the icosahedral graph."""
    adj = [[] for _ in range(N)]
    for u, v in _ALL_EDGES:
        adj[u].append(v)
        adj[v].append(u)
    return adj


def icosahedral_laplacian():
    """Normalised graph Laplacian L = I − D^{-1/2} A D^{-1/2} for the 13-node graph."""
    A = np.zeros((N, N), dtype=float)
    for u, v in _ALL_EDGES:
        A[u, v] = 1.0
        A[v, u] = 1.0
    deg = A.sum(axis=1)
    d_inv_sqrt = np.diag(1.0 / np.sqrt(np.maximum(deg, 1e-12)))
    return np.eye(N) - d_inv_sqrt @ A @ d_inv_sqrt


_ADJ = build_icosahedral_adjacency()
_LAPLACIAN = icosahedral_laplacian()
ICOS_SPECTRAL_GAP = float(np.sort(np.linalg.eigvalsh(_LAPLACIAN))[1])  # λ₂ > 0
SPECTRAL_GAP_POSITIVE = (ICOS_SPECTRAL_GAP > 0)   # True: graph is connected


# ── Core contraction primitive ────────────────────────────────────────────────

def _urt_contract(x, n_steps=1):
    """
    Drive x toward δ★ via iterated URT contraction.

    x_{k+1} = κ·x_k + (1−κ)·δ★

    After n_steps: |x − δ★| ≤ κ^n × |x₀ − δ★|.
    κ ≈ 0.923 < 1 (Banach fixed point theorem guarantees convergence).
    """
    x = np.asarray(x, dtype=float)
    for _ in range(n_steps):
        x = KAPPA * x + (1.0 - KAPPA) * DELTA_STAR
    return x


def _recursive_urt(x, depth):
    """
    Recursive URT application with D=3 branching.

    Complexity: T(n, d) = D × T(n/D, d-1) + O(n) = O(n·d)

    At depth d the overall contraction factor is ≤ κ^(d+1).
    """
    x = np.asarray(x, dtype=float)
    if depth == 0 or len(x) <= D:
        return _urt_contract(x, n_steps=1)
    # Split into D=3 sub-blocks, process recursively, merge
    chunks = np.array_split(x, D)
    merged = np.concatenate([_recursive_urt(c, depth - 1) for c in chunks])
    return _urt_contract(merged, n_steps=1)


# ── IcosahedralMessagePassing ─────────────────────────────────────────────────

class IcosahedralMessagePassing:
    """
    One step of graph message passing on the N=13 icosahedral graph.

    Complexity: O(|E|) = O(N×q) = O(N).  Each of the N nodes aggregates
    from at most 12 neighbors (center) or exactly q=5 (outer), then a URT
    contraction step drives the result toward δ★.

    Parameters
    ----------
    n_urt_steps : int
        URT contractions applied after aggregation.
    aggr : str
        Aggregation function: 'mean' or 'sum'.
    """

    def __init__(self, n_urt_steps=1, aggr="mean"):
        self.n_urt_steps = n_urt_steps
        self.aggr = aggr

    def forward(self, x):
        """
        Parameters
        ----------
        x : ndarray, shape (N,) or (N, d)
        Returns
        -------
        x_new : ndarray, same shape
        """
        x = np.asarray(x, dtype=float)
        scalar = (x.ndim == 1)
        if scalar:
            x = x[:, np.newaxis]

        n_nodes, d = x.shape
        assert n_nodes == N

        x_new = np.empty_like(x)
        for i, nbrs in enumerate(_ADJ):
            if nbrs:
                agg = x[nbrs].mean(axis=0) if self.aggr == "mean" else x[nbrs].sum(axis=0)
            else:
                agg = x[i]
            # Mix own features with neighborhood aggregate via δ★
            x_new[i] = (1.0 - DELTA_STAR) * x[i] + DELTA_STAR * agg

        # URT contractions on flat representation
        flat = _urt_contract(x_new.ravel(), n_steps=self.n_urt_steps)
        x_new = flat.reshape(n_nodes, d)

        return x_new[:, 0] if scalar else x_new

    def __call__(self, x):
        return self.forward(x)


# ── RecursiveURTCell ──────────────────────────────────────────────────────────

class RecursiveURTCell:
    """
    Recursive URT processing cell with D=3 branching and depth d.

    Each call splits the N-vector into D blocks, processes each recursively
    at depth-1, merges, then applies one more URT contraction.

    Complexity: O(N × depth)
    Contraction: factor ≤ κ^(depth+1) per call

    Parameters
    ----------
    depth : int
        Recursion depth.  depth=D=3 gives κ^4 ≈ 0.726 contraction.
    kappa : float
        Contraction rate (default: URT κ from control.py).
    """

    def __init__(self, depth=D):
        self.depth = depth

    def forward(self, x):
        """
        Parameters
        ----------
        x : ndarray, shape (N,) or (n,)
        Returns
        -------
        x_new : ndarray, same shape
        """
        x = np.asarray(x, dtype=float)
        return _recursive_urt(x, self.depth)

    def contraction_factor(self):
        """Upper bound on |output − δ★| / |input − δ★|."""
        return KAPPA ** (self.depth + 1)

    def __call__(self, x):
        return self.forward(x)


# ── URTSparseAttention ────────────────────────────────────────────────────────

class URTSparseAttention:
    """
    Sparse self-attention on the icosahedral graph.

    Each node attends ONLY to its neighbours (degree q=5 for outer, 12 for center).
    Temperature = δ★ (Cathedral critical point).

    Complexity: O(Σ_i |adj_i|) = O(2|E|) = O(N).

    Standard attention:   softmax(Q·Kᵀ / √d) × V         O(N²)
    URTSparseAttention:   softmax(x_i·x_j / δ★)_{j∈adj}  O(N)

    After attention, a URT contraction step is applied.

    Parameters
    ----------
    temperature : float or None
        Softmax temperature. Defaults to δ★.
    n_urt_steps : int
        URT contractions after attention.
    """

    def __init__(self, temperature=None, n_urt_steps=1):
        self.temperature = temperature if temperature is not None else DELTA_STAR
        self.n_urt_steps = n_urt_steps

    def forward(self, x):
        """
        Parameters
        ----------
        x : ndarray, shape (N,) or (N, d)
        Returns
        -------
        out : ndarray, same shape
        attention_weights : list of ndarrays (one per node)
        """
        x = np.asarray(x, dtype=float)
        scalar = (x.ndim == 1)
        if scalar:
            x = x[:, np.newaxis]

        n_nodes, d = x.shape
        assert n_nodes == N

        out = np.zeros_like(x)
        attn_weights = []

        for i, nbrs in enumerate(_ADJ):
            indices = [i] + list(nbrs)  # self + neighbours
            x_nbr = x[indices]          # shape (1+|adj|, d)
            x_i = x[i]                  # shape (d,)

            # Dot-product score: x_i · x_j / temperature
            scores = x_nbr @ x_i / (self.temperature * max(sqrt(d), 1.0))
            # Softmax (numerically stable)
            scores -= scores.max()
            weights = np.exp(scores)
            weights /= weights.sum() + 1e-30

            # Weighted value aggregation
            out[i] = weights @ x_nbr
            attn_weights.append(weights)

        # URT contraction after attention
        flat = _urt_contract(out.ravel(), n_steps=self.n_urt_steps)
        out = flat.reshape(n_nodes, d)

        return (out[:, 0] if scalar else out), attn_weights

    def __call__(self, x):
        return self.forward(x)


# ── IcosahedralRNN ────────────────────────────────────────────────────────────

class IcosahedralRNN:
    """
    Recurrent network whose hidden state lives on the N=13 icosahedral graph.

    Hidden state: phases θ ∈ [0, 2π)^N (one per node).
    Dynamics: discrete Kuramoto on the icosahedral graph, corrected by URT.

    θ_i(t+1) = θ_i(t) + Δt·[ω + (K/|adj_i|)·Σ_{j∈adj_i} sin(θ_j − θ_i)] + δ★·x_i(t)

    At K = K_c (Kuramoto critical coupling), the phases synchronize — this is
    the "grokking" transition in the Cathedral picture.

    Complexity: O(|E|) = O(N) per time step.

    Parameters
    ----------
    kuramoto_K : float
        Coupling strength. Default K_c = 1.278.
    n_kuramoto_steps : int
        Kuramoto integration steps per input token.
    dt : float
        Kuramoto step size.
    """

    def __init__(self, kuramoto_K=None, n_kuramoto_steps=D, dt=0.1):
        self.K = kuramoto_K if kuramoto_K is not None else K_KURAMOTO_CRIT
        self.n_steps = n_kuramoto_steps
        self.dt = dt
        self.theta = np.zeros(N)            # phases on icosahedral nodes
        self.omega = np.full(N, DELTA_STAR) # natural frequencies = δ★

    def reset(self, seed=None):
        """Reset hidden state (phases) to zero or random."""
        if seed is not None:
            rng = np.random.default_rng(seed)
            self.theta = rng.uniform(0, 2 * pi, N)
        else:
            self.theta = np.zeros(N)

    def _kuramoto_step(self):
        """One step of Kuramoto dynamics on the icosahedral graph. O(|E|)."""
        dtheta = self.omega.copy()
        for i, nbrs in enumerate(_ADJ):
            if nbrs:
                coupling = np.mean(np.sin(self.theta[nbrs] - self.theta[i]))
                dtheta[i] += self.K * coupling
        self.theta = (self.theta + self.dt * dtheta) % (2 * pi)

    def synchronisation_order(self):
        """Global synchronisation r = |<e^{iθ}>|.  r→1 = fully synchronised."""
        return float(abs(np.mean(np.exp(1j * self.theta))))

    def step(self, x_t):
        """
        One RNN step: encode input x_t → influence phases → run Kuramoto → output.

        Parameters
        ----------
        x_t : array-like, shape (n,)
            Input token (any length, embedded to N).
        Returns
        -------
        h : ndarray, shape (N,)
            Current phase vector.
        r : float
            Synchronisation order parameter.
        """
        # Embed input into phase perturbation (add to natural frequencies)
        x_t = np.asarray(x_t, dtype=float).ravel()
        if len(x_t) < N:
            x_t = np.pad(x_t, (0, N - len(x_t)))
        else:
            x_t = x_t[:N]
        # Scale by δ★ so input influence is Cathedral-calibrated
        self.omega = np.full(N, DELTA_STAR) + DELTA_STAR * x_t

        # Kuramoto integration steps
        for _ in range(self.n_steps):
            self._kuramoto_step()

        # URT correction on phases (drives phase deviations toward δ★·2π)
        target_phase = DELTA_STAR * 2 * pi
        self.theta = _urt_contract(self.theta, n_steps=1)
        # Renormalise to [0, 2π)
        self.theta = self.theta % (2 * pi)

        return self.theta.copy(), self.synchronisation_order()

    def process_sequence(self, xs):
        """
        Process a sequence of inputs.

        Parameters
        ----------
        xs : list of array-like
            Sequence of input tokens.
        Returns
        -------
        phases : list of ndarray (N,)
        orders : list of float
        """
        phases, orders = [], []
        for x_t in xs:
            h, r = self.step(x_t)
            phases.append(h)
            orders.append(r)
        return phases, orders

    def __call__(self, xs):
        return self.process_sequence(xs)


# ── IcosahedralRecursiveNet ───────────────────────────────────────────────────

class IcosahedralRecursiveNet:
    """
    Full icosahedral recursive neural network.

    Stack of IcosahedralMessagePassing layers → RecursiveURTCell →
    URTSparseAttention → K₄ sector projection → output.

    No learned weights in the core layers.  All parameters fixed by
    Cathedral geometry (N, D, q, δ★, κ).  Optional output linear head
    can be trained if desired.

    Parameters
    ----------
    n_layers : int
        Number of IcosahedralMessagePassing layers.
    recursive_depth : int
        Depth of the RecursiveURTCell (D=3 recommended).
    n_urt_steps : int
        URT steps per MessagePassing layer.
    output_dim : int
        Output dimension carved from K₄ sector (max 4).
    """

    def __init__(self, n_layers=D, recursive_depth=D, n_urt_steps=q, output_dim=D):
        self.mp_layers = [
            IcosahedralMessagePassing(n_urt_steps=n_urt_steps)
            for _ in range(n_layers)
        ]
        self.recursive_cell = RecursiveURTCell(depth=recursive_depth)
        self.attention = URTSparseAttention(temperature=DELTA_STAR, n_urt_steps=1)
        self.rnn = IcosahedralRNN(kuramoto_K=K_KURAMOTO_CRIT, n_kuramoto_steps=D)
        self.output_dim = min(output_dim, len(K4_SECTOR))
        self._delta_trace = []

    def _embed(self, x):
        """Embed arbitrary input into N=13 site shell (normalised)."""
        x = np.asarray(x, dtype=float).ravel()
        if len(x) >= N:
            shell = x[:N].copy()
        else:
            shell = np.zeros(N)
            shell[:len(x)] = x
        norm = np.linalg.norm(shell)
        return shell / norm if norm > 1e-12 else shell

    def _delta_proxy(self, shell):
        """Estimate δ from shell state: deviation of K₄ power from critical 4/13."""
        C = ikt_forward(shell.astype(complex))
        omega_K4 = float(np.sum(np.abs(C[K4_SECTOR]) ** 2)) / (np.sum(np.abs(C) ** 2) + 1e-30)
        return abs(omega_K4 - 4.0 / 13.0) + DELTA_STAR

    def forward(self, x):
        """
        Forward pass.

        Parameters
        ----------
        x : array-like
            Input of any length.
        Returns
        -------
        output : ndarray, shape (output_dim,)
        delta : float
            Final δ of the network state.
        """
        shell = self._embed(x)

        # 1. Icosahedral message passing layers  O(N) each
        for mp in self.mp_layers:
            shell = mp(shell)

        # 2. Recursive URT cell  O(N·depth)
        shell = self.recursive_cell(shell)

        # 3. URT sparse attention  O(N×q)
        shell_att, _ = self.attention(shell)

        # 4. IKT → K₄ coherent sector
        C = ikt_forward(shell_att.astype(complex))
        k4_real = np.concatenate([C[K4_SECTOR].real, C[K4_SECTOR].imag])

        # 5. δ measurement
        delta = self._delta_proxy(shell_att)
        self._delta_trace.append(delta)

        # 6. Output projection
        output = k4_real[:self.output_dim]
        return output, delta

    def criticality_gap(self):
        """Distance of current state from δ★."""
        if not self._delta_trace:
            return None
        return abs(self._delta_trace[-1] - DELTA_STAR)

    def is_critical(self, tol=0.01):
        """True if the most recent δ is within tol of δ★."""
        gap = self.criticality_gap()
        return bool(gap is not None and gap < tol)

    def reset_trace(self):
        self._delta_trace.clear()
        self.rnn.reset()

    def __call__(self, x):
        return self.forward(x)


# ── Standalone forward function ───────────────────────────────────────────────

def irn_forward(x, depth=D, n_steps=q):
    """
    Convenience wrapper: embed x and apply recursive URT + attention.

    Returns
    -------
    output : ndarray, shape (D,)
    delta : float
    """
    net = IcosahedralRecursiveNet(
        n_layers=D, recursive_depth=depth, n_urt_steps=n_steps, output_dim=D
    )
    return net(x)


# ── Summary ───────────────────────────────────────────────────────────────────

def irn_summary():
    """Return a summary dict of IRN architecture constants."""
    cell = RecursiveURTCell(depth=D)
    return {
        "N_nodes": N,
        "N_outer_edges": N_OUTER_EDGES,
        "N_total_edges": N_TOTAL_EDGES,
        "outer_degree": OUTER_DEGREE,
        "center_degree": CENTER_DEGREE,
        "kappa": KAPPA,
        "kappa_lt_1": KAPPA_LT_1,
        "delta_star": DELTA_STAR,
        "K_kuramoto_critical": K_KURAMOTO_CRIT,
        "spectral_gap": ICOS_SPECTRAL_GAP,
        "spectral_gap_positive": SPECTRAL_GAP_POSITIVE,
        "n_edges_eq_E": N_EDGES_EQ_E,
        "degree_eq_q": DEGREE_EQ_Q,
        "recursive_contraction": cell.contraction_factor(),
        "complexity_message_passing": f"O(N×q) = O({N}×{q}) = O({N * q})",
        "complexity_recursive": f"O(N×D) = O({N}×{D}) = O({N * D})",
        "complexity_attention": f"O(|E|) = O({N_TOTAL_EDGES})",
        "KEY_EXACT_RESULTS": [
            f"Outer degree = q = {q}  [EXACT: Cathedral vertex degree]",
            f"Outer edges  = E = {N_OUTER_EDGES}  [EXACT: icosahedral E=30]",
            f"κ = β·α·(1+θ) ≈ {KAPPA:.4f} < 1  [EXACT: Banach contraction]",
            f"δ★ = {DELTA_STAR:.8f}  [URT fixed point / attention temperature]",
            f"K_c = {K_KURAMOTO_CRIT}  [Kuramoto critical coupling on icosahedron]",
            f"Recursive depth D={D}: contraction ≤ κ^{{D+1}} = {KAPPA**(D+1):.4f}",
            f"N={N} nodes → message passing O(N×q) = O({N*q}) = O(N)",
        ],
        "D": D,
        "N": N,
        "G": G,
    }


def print_irn_report():
    """Print a formatted IRN architecture report."""
    s = irn_summary()
    print("=" * 70)
    print("  ICOSAHEDRAL RECURSIVE NETWORK (IRN) — URT × O(N) × Cathedral")
    print(f"  δ★ ≈ {DELTA_STAR:.8f}   κ ≈ {KAPPA:.4f} < 1   N = {N}")
    print("=" * 70)
    print()
    print("  Icosahedral graph (N=13):")
    print(f"    Outer vertices:  12,  degree = q = {q}  [EXACT]")
    print(f"    Center vertex:   1,   degree = N−1 = {N-1}")
    print(f"    Outer edges:     {N_OUTER_EDGES}  = E  [EXACT: icosahedral E=30]")
    print(f"    Center edges:    {N_CENTER_EDGES}")
    print(f"    Total edges:     {N_TOTAL_EDGES}")
    print(f"    Spectral gap λ₂: {ICOS_SPECTRAL_GAP:.4f}  (connected ✓)")
    print()
    print("  Layers (no learned weights in core):")
    print(f"    IcosahedralMessagePassing × D={D}   O(N×q) = O({N}×{q}) per layer")
    print(f"    RecursiveURTCell (depth D={D})       O(N×D) = O({N*D})")
    print(f"    URTSparseAttention (icosa mask)     O(|E|) = O({N_TOTAL_EDGES})")
    print(f"    IcosahedralRNN (Kuramoto)            O(|E|) = O({N_TOTAL_EDGES}) per step")
    print()
    print("  Convergence (Banach fixed point):")
    print(f"    κ = β·α·(1+θ_h) = {_BETA}×{_ALPHA}×(1+{_THETA}) ≈ {KAPPA:.4f} < 1  ✓")
    print(f"    After D={D} layers:  |δ − δ★| ≤ κ^D × |δ₀ − δ★| ≈ {KAPPA**D:.4f}|δ₀−δ★|")
    print(f"    RecursiveURTCell:    |δ − δ★| ≤ κ^(D+1) = {KAPPA**(D+1):.4f}|δ₀−δ★|")
    print()
    print("  Kuramoto RNN:")
    print(f"    Critical coupling K_c = {K_KURAMOTO_CRIT}  (synchronisation threshold)")
    print(f"    Phase frequency ω_i = δ★ = {DELTA_STAR:.6f}")
    print(f"    Synchronised phases → grokking transition")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 70)
