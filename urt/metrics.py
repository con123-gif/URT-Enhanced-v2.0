# ===================== core/metrics.py =====================
# Stable helpers for Lyapunov (Rosenstein), tau (CCDF), D_KY, and δ
import numpy as np
from scipy.spatial import cKDTree
from scipy.stats import linregress

# ---- Delay embedding ----
def _embed(ts, m=3, delay=3):
    ts = np.asarray(ts, float).ravel()
    N = len(ts) - (m - 1) * delay
    if N <= 10:
        return None
    X = np.empty((N, m), float)
    for i in range(m):
        X[:, i] = ts[i*delay : i*delay + N]
    return X

# ---- Rosenstein LLE (λ1) ----
def lyapunov_rosenstein(ts, m=3, delay=20, evolve=200, exclude=100):
    """
    Robust λ1 estimator. Assumes ts is already on-attractor and reasonably downsampled.
    - m: embedding dimension
    - delay: embedding lag
    - evolve: horizon for divergence curve
    - exclude: temporal neighbors to exclude when finding nearest neighbors
    Returns nonnegative λ1 or np.nan if insufficient structure.
    """
    X = _embed(ts, m=m, delay=delay)
    if X is None or len(X) < 200:
        return np.nan

    tree = cKDTree(X)
    nnei = []
    for i in range(len(X)):
        dists, idxs = tree.query(X[i], k=10)
        ok = [j for j in (idxs if np.ndim(idxs) else [idxs]) if abs(int(j) - i) >= exclude]
        if ok:
            nnei.append((i, ok[0]))

    if len(nnei) < 100:
        return np.nan

    L = min(evolve, len(X) - 1)
    div = []
    for h in range(1, L):
        vals = []
        for i, j in nnei:
            ii, jj = i + h, j + h
            if ii < len(X) and jj < len(X):
                d0 = np.linalg.norm(X[i] - X[j]) + 1e-12
                d1 = np.linalg.norm(X[ii] - X[jj]) + 1e-12
                vals.append(np.log(d1 / d0))
        if len(vals) >= 50:
            div.append(np.mean(vals))

    if len(div) < 20:
        return np.nan

    slope, _, r, _, _ = linregress(np.arange(len(div)), div)
    return float(max(slope, 0.0))

# ---- τ from CCDF of burst run-lengths above a high percentile ----
def tau_avalanche(series, pct=90, xmin_quantile=0.6, min_bursts=30):
    x = np.asarray(series, float).ravel()
    thr = np.percentile(x, pct)
    runs, c = [], 0
    for v in x:
        if v > thr:
            c += 1
        elif c > 0:
            runs.append(c); c = 0
    if c > 0:
        runs.append(c)

    runs = np.asarray(runs, float)
    if runs.size < min_bursts:
        return np.nan

    xmin = np.quantile(runs, xmin_quantile)
    tail = runs[runs >= max(1.0, xmin)]
    if tail.size < min_bursts:
        return np.nan

    tail.sort()
    ccdf = 1.0 - (np.arange(1, tail.size + 1) / (tail.size + 1))
    X = np.log(tail + 1e-12)
    Y = np.log(ccdf + 1e-12)

    # CCDF ~ s^{-(tau-1)}  -> slope = -(tau-1)  -> tau = 1 - slope
    slope, _ = np.polyfit(X, Y, 1)
    tau = 1.0 - slope
    return float(tau)

# ---- D_KY helpers ----
def D_KY_from_l1_proxy(l1, lam3=-1.0):
    # proxy spectrum [l1, 0, lam3] with lam3<0
    lams = np.array(sorted([float(l1), 0.0, float(lam3)], reverse=True), float)
    s12 = lams[0] + lams[1]
    DKY = 2.0 + s12 / (abs(lams[2]) + 1e-12)
    return float(max(1.0, DKY))

def DKY_from_delta_monotone(delta, a=1.48, DKY0=2.01):
    # bounded, monotone map: D_KY >= 1
    return 1.0 + (DKY0 - 1.0) / (1.0 + a * max(0.0, float(delta)))

# ---- δ metric ----
def delta_metric(DKY, tau):
    if not (np.isfinite(DKY) and np.isfinite(tau)):
        return np.nan
    return float((DKY - 1.0) * (tau - 2.0))
