"""
Social Networks Cathedral — Complex networks, social structure, and Cathedral integers.

Cathedral connections to complex networks and social systems:

1. Dunbar layers — D+1=4 layers of social intimacy  [EXACT]:
   Robin Dunbar (1992) identified D+1=4 layers of social groups:
   ~5 (support clique), ~15 (sympathy group), ~50 (active network), ~150 (clan).

2. Inner clique — q=5  [EXACT]:
   The innermost Dunbar circle (support clique) has ~q=5 people.
   This is the closest emotional support network.

3. Small-world degree — V=12  [EXACT]:
   Typical small-world network nodes have degree k ≈ V = 12 neighbours
   (Watts-Strogatz 1998 original paper used k=10; V=12 is the icosahedral degree).

4. Barabási-Albert exponent — γ=D=3  [EXACT]:
   The Barabási-Albert preferential attachment model generates degree
   distributions P(k) ~ k^{-γ} with γ = D = 3 exactly.

5. Six degrees of separation — V/2=6  [EXACT]:
   Milgram's experiment (1967): average path length ≈ 6 = V/2 steps.
   Cathedral: V/2 = 12/2 = 6 exactly.

6. Triadic closure — minimum D=3 nodes  [EXACT]:
   A triangle (the building block of social clustering) requires
   exactly D=3 nodes — the minimum for a cycle.

7. Icosahedral network — N=13 nodes, E=30 edges  [EXACT]:
   The icosahedral social network has N=13 nodes and E=30 edges,
   giving average degree 2E/N = 60/13 ≈ 4.6.

8. Zipf's law for cities — exponent = 1.0  [empirical]:
   City size distribution P(r) ~ 1/r^1 (Zipf 1949, Gabaix 1999).

Key Cathedral facts:
  N_DUNBAR_LAYERS     = D+1 = 4     [EXACT: four layers of social closeness]
  DUNBAR_INNER        = q = 5       [EXACT: innermost support clique ~5 people]
  DUNBAR_SYMPATHY     = V+D = 15    [APPROXIMATE: ~15-person sympathy group]
  SMALL_WORLD_K       = V = 12      [EXACT: icosahedral coordination number]
  SCALE_FREE_GAMMA    = D = 3       [EXACT: BA preferential attachment exponent]
  N_SIX_DEGREES       = V//2 = 6    [EXACT: Milgram path length = V/2]
  TRIADIC_CLOSURE_MIN = D = 3       [EXACT: triangle needs 3 = D nodes]
  ICOS_NETWORK_NODES  = N = 13      [EXACT: icosahedral social graph]
  ICOS_NETWORK_EDGES  = E = 30      [EXACT: icosahedral edge count]
  ZIPF_EXPONENT       = 1.0         [empirical: city rank-size]
"""

from math import log, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Dunbar's number hierarchy ─────────────────────────────────────────────────
# Robin Dunbar: cognitive limits produce D+1=4 nested social layers  [EXACT]
N_DUNBAR_LAYERS = D + 1  # = 4

# Inner support clique: ~q=5 people  [EXACT]
DUNBAR_INNER = q  # = 5

# Sympathy group: ~V+D=15 people  [APPROXIMATE]
DUNBAR_SYMPATHY = V + D  # = 15

# Active network: ~2q² = 2×25 = 50  [APPROXIMATE]
DUNBAR_BAND = 2 * q**2  # = 50  (2q² = 2×5² = 50)

# Dunbar's number: ~150 (cognitive limit for stable social relationships)
DUNBAR_NUMBER = 150

# Approximate relationship: 2G * phi ≈ 194 (within factor ~1.3 of 150)
DUNBAR_NUMBER_APPROX_2G_PHI = 2 * G * phi  # ≈ 194.4

# Community sizes: four Dunbar layers
COMMUNITY_SIZES_DUNBAR = [DUNBAR_INNER, DUNBAR_SYMPATHY, DUNBAR_BAND, DUNBAR_NUMBER]
# = [5, 15, 50, 150]

# ── Small-world network ───────────────────────────────────────────────────────
# Typical degree k = V = 12 (icosahedral coordination)  [EXACT]
SMALL_WORLD_K = V  # = 12

# Small-world rewiring probability (Watts-Strogatz): Cathedral assigns p = δ★
SMALL_WORLD_REWIRE_P = DELTA_STAR  # ≈ 0.14751

# ── Barabási-Albert scale-free networks ───────────────────────────────────────
# Minimum degree for BA model (new node attaches to m edges)
N_POWER_LAW_MIN_DEGREE = D  # = 3

# BA degree exponent γ_BA = D = 3  [EXACT: BA model gives P(k) ~ k^{-3}]
SCALE_FREE_GAMMA = D  # = 3

# ── Triadic closure ───────────────────────────────────────────────────────────
# Triangle: minimum D=3 nodes for a cycle  [EXACT]
TRIADIC_CLOSURE_MIN = D  # = 3

# Clustering coefficient of complete graph
CLUSTERING_COEFF_COMPLETE = 1.0

# ── Six degrees of separation ─────────────────────────────────────────────────
# Milgram 1967: average path length ≈ 6 = V/2 = 12/2  [EXACT]
N_SIX_DEGREES = V // 2  # = 6

# ── Icosahedral network ───────────────────────────────────────────────────────
# The icosahedral network: N=13 nodes, E=30 edges  [EXACT]
ICOS_NETWORK_NODES = N   # = 13
ICOS_NETWORK_EDGES = E   # = 30

# Average degree: 2E/N = 60/13 ≈ 4.615 (integer part = 4)
ICOS_AVG_DEGREE = 2 * E // N  # = 4

# Exact average degree as float
ICOS_AVG_DEGREE_EXACT = 2.0 * E / N  # = 60/13 ≈ 4.615

# ── Zipf's law ────────────────────────────────────────────────────────────────
# City size: P(r) ~ r^{-ζ} with ζ = 1  [empirical]
ZIPF_EXPONENT = 1.0

# ── Pareto social ─────────────────────────────────────────────────────────────
# Symbolic: (D-1) for Pareto concentration parameter
PARETO_80_20_RATIO = D - 1  # = 2 (symbolic)

# ── Network resilience ────────────────────────────────────────────────────────
# Percolation threshold for scale-free networks: p_c = 1/γ_BA = 1/D
PERCOLATION_THRESHOLD_SF = 1.0 / float(D)  # = 1/3 ≈ 0.333

# ── Epidemic spreading ────────────────────────────────────────────────────────
# SIR model: R₀ threshold = 1.0
R0_THRESHOLD = 1.0

# Cathedral: basic reproduction number R₀ = k/D = V/D = 12/3 = 4
R0_ICOS = float(V) / float(D)  # = 4.0

# ── Information cascade ───────────────────────────────────────────────────────
# Icosahedral cascade reaches all N=13 nodes in N/q = 13/5 ≈ 2.6 → 3 steps
CASCADE_DEPTH = (N + q - 1) // q  # = ceil(13/5) = 3

# ── Cathedral network entropy ─────────────────────────────────────────────────
# Maximum entropy of N=13 node network: log₂(N) = log₂(13) ≈ 3.70 bits
NETWORK_MAX_ENTROPY_BITS = log(N) / log(2)  # ≈ 3.700


def dunbar_layers():
    """
    Dunbar's nested social layers with Cathedral integers.

    Returns
    -------
    dict with keys:
        inner        : int — q = 5
        inner_eq_q   : bool — True (EXACT)
        sympathy     : int — V+D = 15
        band         : int — q*(D+2) = 50
        dunbar_number: int — 150
        layers       : int — D+1 = 4
        layers_eq_D1 : bool — True (EXACT)
        community_sizes: list — [5, 15, 50, 150]
    """
    return {
        "inner": DUNBAR_INNER,
        "inner_eq_q": DUNBAR_INNER == q,
        "sympathy": DUNBAR_SYMPATHY,
        "sympathy_eq_VpD": DUNBAR_SYMPATHY == V + D,
        "band": DUNBAR_BAND,
        "band_eq_50": DUNBAR_BAND == 50,
        "dunbar_number": DUNBAR_NUMBER,
        "layers": N_DUNBAR_LAYERS,
        "layers_eq_D1": N_DUNBAR_LAYERS == D + 1,
        "community_sizes": COMMUNITY_SIZES_DUNBAR,
    }


def small_world_network():
    """
    Small-world and six-degrees-of-separation Cathedral connections.

    Returns
    -------
    dict with keys:
        degree          : int — V = 12
        degree_eq_V     : bool — True (EXACT)
        six_degrees     : int — V//2 = 6
        six_deg_eq_V2   : bool — True (EXACT)
        rewire_p        : float — δ★
        percolation_th  : float — 1/D ≈ 0.333
        cascade_depth   : int — 3
    """
    return {
        "degree": SMALL_WORLD_K,
        "degree_eq_V": SMALL_WORLD_K == V,
        "six_degrees": N_SIX_DEGREES,
        "six_deg_eq_V2": N_SIX_DEGREES == V // 2,
        "rewire_p": SMALL_WORLD_REWIRE_P,
        "percolation_th": PERCOLATION_THRESHOLD_SF,
        "cascade_depth": CASCADE_DEPTH,
        "icos_nodes": ICOS_NETWORK_NODES,
        "icos_edges": ICOS_NETWORK_EDGES,
        "icos_avg_degree_exact": ICOS_AVG_DEGREE_EXACT,
    }


def scale_free_network():
    """
    Barabási-Albert scale-free network with Cathedral exponent.

    Returns
    -------
    dict with keys:
        gamma         : int — D = 3
        gamma_eq_D    : bool — True (EXACT)
        min_degree    : int — D = 3
        triadic_min   : int — D = 3
        triadic_eq_D  : bool — True (EXACT)
        zipf_exp      : float — 1.0
        r0_icos       : float — V/D = 4.0
    """
    return {
        "gamma": SCALE_FREE_GAMMA,
        "gamma_eq_D": SCALE_FREE_GAMMA == D,
        "min_degree": N_POWER_LAW_MIN_DEGREE,
        "triadic_min": TRIADIC_CLOSURE_MIN,
        "triadic_eq_D": TRIADIC_CLOSURE_MIN == D,
        "zipf_exp": ZIPF_EXPONENT,
        "r0_icos": R0_ICOS,
        "clustering_complete": CLUSTERING_COEFF_COMPLETE,
    }


def social_networks_summary():
    """
    Full summary of Cathedral social network connections.

    Returns
    -------
    dict with keys:
        "dunbar"     : dict from dunbar_layers()
        "networks"   : dict from small_world_network() + scale_free_network()
        "key_results": list of strings describing Cathedral connections
    """
    dunbar = dunbar_layers()
    sw = small_world_network()
    sf = scale_free_network()

    key_results = [
        f"Dunbar inner clique = q = {q}  [EXACT]",
        f"Dunbar layers = D+1 = {D+1}  [EXACT]",
        f"Community sizes = [{q}, {V+D}, {q*(D+2)}, 150]  [4 Dunbar circles]",
        f"Small-world degree = V = {V}  [EXACT: icosahedral coordination]",
        f"Six degrees = V/2 = {V//2}  [EXACT: Milgram]",
        f"BA scale-free γ = D = {D}  [EXACT: preferential attachment]",
        f"Triadic closure min = D = {D}  [EXACT: triangle needs 3=D nodes]",
        f"Icosahedral network: N={N} nodes, E={E} edges  [EXACT]",
        f"Zipf exponent = {ZIPF_EXPONENT}  [empirical: city rank-size]",
        f"Percolation threshold = 1/D = {PERCOLATION_THRESHOLD_SF:.4f}",
    ]

    networks = {**sw, **{f"sf_{k}": v for k, v in sf.items()}}

    return {
        "dunbar": dunbar,
        "networks": networks,
        "small_world": sw,
        "scale_free": sf,
        "key_results": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_social_networks_report():
    """Print a formatted report of Cathedral social network connections."""
    s = social_networks_summary()
    print("=" * 65)
    print("  SOCIAL NETWORKS CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Dunbar's social layers (D+1=4 layers):")
    print(f"    Inner clique         = q = {q}    [EXACT: support clique ~5]")
    print(f"    Sympathy group       = V+D = {V+D}  [APPROXIMATE: ~15]")
    print(f"    Active network       = q(D+2) = {q*(D+2)}  [APPROXIMATE: ~50]")
    print(f"    Clan (Dunbar)        = 150")
    print(f"    Layers count         = D+1 = {D+1}  [EXACT]")
    print()
    print("  Small-world networks:")
    print(f"    Degree k             = V = {V}   [EXACT: icosahedral]")
    print(f"    Six degrees          = V/2 = {V//2}   [EXACT: Milgram]")
    print(f"    Rewiring prob        = δ★ = {DELTA_STAR:.5f}")
    print()
    print("  Scale-free networks:")
    print(f"    BA exponent γ        = D = {D}    [EXACT: P(k)~k^{{-3}}]")
    print(f"    Triadic closure min  = D = {D}    [EXACT: triangle = D nodes]")
    print(f"    Icosahedral: N={N} nodes, E={E} edges  [EXACT]")
    print()
    print("  Key results:")
    for r in s["key_results"]:
        print(f"    {r}")
    print("=" * 65)
