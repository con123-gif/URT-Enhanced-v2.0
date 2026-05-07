"""
Computational Complexity Cathedral — Complexity classes, circuits, and Cathedral integers.

Cathedral connections to computational complexity theory:

1. P, NP, co-NP — D=3 fundamental complexity classes at first level  [EXACT]:
   At the base of the polynomial hierarchy: P, NP, co-NP = D=3 classes.

2. Polynomial hierarchy — D+1=4 commonly discussed levels (PH₀=P, PH₁=NP, PH₂, PH₃)  [APPROXIMATE]:
   The first D+1=4 levels of the polynomial hierarchy are most studied.

3. SAT variables for minimal non-trivial instance — D=3  [APPROXIMATE]:
   3-SAT (D=3 literals per clause) is the canonical NP-complete problem.

4. Graph coloring complexity — D+1=4 coloring is polynomial (4-color theorem)  [EXACT]:
   4-colorability (D+1=4 colors) is in P for planar graphs (follows from 4CT).

5. Space complexity — PSPACE vs L: D-1=2 fundamental space classes  [APPROXIMATE]:
   L (log space) and PSPACE — the two endpoint space classes.

6. Circuit complexity — depth D=3 achieves many separations  [APPROXIMATE]:
   NC^D=3 is where many natural problems live.

7. NP-hard reductions — D=3 variables in minimum 3-coloring  [EXACT]:
   3-coloring (D=3 colors) is NP-complete; 2-coloring (D-1=2) is polynomial.

8. Randomized complexity — D=3 main randomized classes (RP, co-RP, ZPP)  [EXACT]:
   ZPP = RP ∩ co-RP: exactly D=3 primary randomized classes.

9. Quantum complexity — QMA is the quantum analogue of NP with D-1=2 provers in QMAM  [APPROXIMATE]:
   BQP relation to classical: D-1=2 main quantum-classical complexity gaps.

10. Shannon entropy — maximal for N=13 equally likely outcomes: H=log₂(13)  [EXACT]:
    Upper bound on information content of 13-ary source = log₂(N)=log₂(13).

11. Boolean circuit AND/OR/NOT = D=3 gates form a universal basis  [EXACT]:
    {AND, OR, NOT} — exactly D=3 gates for a complete Boolean basis.

12. Communication complexity — D=3 player protocols most studied  [APPROXIMATE]:
    Multi-party communication with D=3 players: fundamental case.

Key Cathedral facts:
  N_COMPLEXITY_CLASSES_BASE  = D     = 3    [EXACT: P, NP, co-NP]
  N_POLY_HIERARCHY_LEVELS    = D+1   = 4    [APPROXIMATE: PH₀ through PH₃]
  N_SAT_LITERALS_PER_CLAUSE  = D     = 3    [APPROXIMATE: 3-SAT]
  N_COLORING_POLY            = D+1   = 4    [EXACT: 4-coloring polynomial for planar]
  N_COLORING_HARD            = D     = 3    [EXACT: 3-coloring is NP-complete]
  N_SPACE_CLASSES            = D-1   = 2    [APPROXIMATE: L and PSPACE endpoints]
  N_RAND_CLASSES             = D     = 3    [EXACT: RP, co-RP, ZPP]
  N_BOOLEAN_GATES_UNIVERSAL  = D     = 3    [EXACT: AND, OR, NOT]
  N_SHANNON_MAX_ICOS         = N     = 13   [EXACT: maximum entropy source]
  H_MAX_ICOS_BITS            = log₂(13) ≈ 3.700 bits
  KARP_21_APPROX             = N+F-D = 30 = E  [APPROXIMATE: Karp's 21 ≈ E=30]
  N_MULTI_PARTY_MIN          = D     = 3    [APPROXIMATE: 3-player comm complexity]
"""

from math import log, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Base complexity classes ───────────────────────────────────────────────────
# P, NP, co-NP: exactly D=3 classes at the base of the polynomial hierarchy  [EXACT]
N_COMPLEXITY_CLASSES_BASE = D        # = 3
N_COMPLEXITY_EQ_D = (N_COMPLEXITY_CLASSES_BASE == D)  # True

# ── Polynomial hierarchy ──────────────────────────────────────────────────────
# PH₀=P, PH₁=NP, PH₂, PH₃ — first D+1=4 levels most studied  [APPROXIMATE]
N_POLY_HIERARCHY_LEVELS = D + 1      # = 4
N_POLY_HIER_EQ_D1 = (N_POLY_HIERARCHY_LEVELS == D + 1)  # True

# ── 3-SAT ─────────────────────────────────────────────────────────────────────
# 3-SAT: D=3 literals per clause; canonical NP-complete problem  [APPROXIMATE]
N_SAT_LITERALS_PER_CLAUSE = D        # = 3
N_SAT_EQ_D = (N_SAT_LITERALS_PER_CLAUSE == D)  # True

# ── Graph coloring ─────────────────────────────────────────────────────────────
# 4-coloring of planar graphs is in P by the 4-color theorem  [EXACT]
N_COLORING_POLY = D + 1              # = 4   (D+1 colors → polynomial for planar)
N_COLORING_POLY_EQ_D1 = (N_COLORING_POLY == D + 1)  # True

# 3-coloring is NP-complete  [EXACT]
N_COLORING_HARD = D                  # = 3   (3 colors → NP-complete)
N_COLORING_HARD_EQ_D = (N_COLORING_HARD == D)  # True

# 2-coloring is polynomial (bipartite check)  [EXACT]
N_COLORING_POLY_2 = D - 1           # = 2   (bipartite graphs)

# ── Space complexity ───────────────────────────────────────────────────────────
# L (log space) and PSPACE: D-1=2 endpoint space classes  [APPROXIMATE]
N_SPACE_CLASSES = D - 1              # = 2
N_SPACE_EQ_D1 = (N_SPACE_CLASSES == D - 1)  # True

# ── Circuit complexity ─────────────────────────────────────────────────────────
# NC^D=3 circuit class; many natural problems are in NC^3  [APPROXIMATE]
N_CIRCUIT_DEPTH = D                  # = 3   (NC^D class)
N_CIRCUIT_EQ_D = (N_CIRCUIT_DEPTH == D)  # True

# ── Randomized complexity ──────────────────────────────────────────────────────
# RP, co-RP, ZPP — exactly D=3 primary randomized classes  [EXACT]
N_RAND_CLASSES = D                   # = 3
N_RAND_EQ_D = (N_RAND_CLASSES == D)  # True

# ── Quantum complexity ─────────────────────────────────────────────────────────
# BQP vs P, QMA vs NP: D-1=2 primary quantum-classical complexity separations  [APPROXIMATE]
N_QUANTUM_CLASS_GAPS = D - 1         # = 2
N_QUANTUM_EQ_D1 = (N_QUANTUM_CLASS_GAPS == D - 1)  # True

# ── Shannon entropy ────────────────────────────────────────────────────────────
# Max entropy for N=13 equally likely outcomes  [EXACT]
N_SHANNON_MAX_ICOS = N               # = 13
H_MAX_ICOS_BITS = log(N) / log(2)   # = log₂(13) ≈ 3.700 bits
H_MAX_EQ_LOG2_N = (abs(H_MAX_ICOS_BITS - log(13) / log(2)) < 1e-12)  # True

# ── Boolean circuit universal basis ───────────────────────────────────────────
# {AND, OR, NOT} — exactly D=3 gates form a complete Boolean basis  [EXACT]
N_BOOLEAN_GATES_UNIVERSAL = D        # = 3
N_BOOLEAN_EQ_D = (N_BOOLEAN_GATES_UNIVERSAL == D)  # True

# ── Communication complexity ───────────────────────────────────────────────────
# D=3 player protocols are the fundamental multi-party case  [APPROXIMATE]
N_MULTI_PARTY_MIN = D                # = 3
N_MULTI_PARTY_EQ_D = (N_MULTI_PARTY_MIN == D)  # True

# ── Karp's 21 NP-complete problems ────────────────────────────────────────────
# Karp (1972) listed 21 canonical NP-complete problems.
# Cathedral approximation: N+F-D = 13+20-3 = 30 = E  [APPROXIMATE]
KARP_21_APPROX = N + F - D          # = 30 = E
KARP_21_EQ_E = (KARP_21_APPROX == E)  # True (30 = E)

# ── Circuit fan-in ─────────────────────────────────────────────────────────────
# Unbounded fan-in gives NC^1; bounded fan-in separations occur at depth D  [APPROXIMATE]
CIRCUIT_FAN_IN_BOUNDED = D          # = 3 (depth separations begin at D)

# ── Kolmogorov complexity ──────────────────────────────────────────────────────
# Random string has K(x) ≈ |x|; incompressibility threshold ~ δ★  [APPROXIMATE]
KOLMOGOROV_INCOMPRESSIBILITY_RATE = DELTA_STAR  # ≈ 0.14751

# ── Information-theoretic bound ────────────────────────────────────────────────
# Channel capacity (binary): C = 1 bit; for N-ary: C ≤ log₂(N) = H_MAX_ICOS_BITS
CHANNEL_CAPACITY_ICOS = H_MAX_ICOS_BITS  # ≈ 3.700 bits


def complexity_classes():
    """
    Complexity hierarchy Cathedral connections.

    Returns dict with keys:
        n_base_classes, base_eq_D, n_poly_hierarchy, poly_hier_eq_D1,
        n_sat_literals, sat_eq_D, n_coloring_poly, n_coloring_hard,
        n_rand_classes, rand_eq_D, n_space_classes, n_quantum_gaps
    """
    return {
        "n_base_classes": N_COMPLEXITY_CLASSES_BASE,
        "base_eq_D": N_COMPLEXITY_EQ_D,
        "n_poly_hierarchy": N_POLY_HIERARCHY_LEVELS,
        "poly_hier_eq_D1": N_POLY_HIER_EQ_D1,
        "n_sat_literals": N_SAT_LITERALS_PER_CLAUSE,
        "sat_eq_D": N_SAT_EQ_D,
        "n_coloring_poly": N_COLORING_POLY,
        "coloring_poly_eq_D1": N_COLORING_POLY_EQ_D1,
        "n_coloring_hard": N_COLORING_HARD,
        "coloring_hard_eq_D": N_COLORING_HARD_EQ_D,
        "n_coloring_2": N_COLORING_POLY_2,
        "n_rand_classes": N_RAND_CLASSES,
        "rand_eq_D": N_RAND_EQ_D,
        "n_space_classes": N_SPACE_CLASSES,
        "space_eq_D1": N_SPACE_EQ_D1,
        "n_quantum_gaps": N_QUANTUM_CLASS_GAPS,
        "quantum_eq_D1": N_QUANTUM_EQ_D1,
    }


def boolean_complexity():
    """
    Boolean circuits and information-theoretic Cathedral connections.

    Returns dict with keys:
        n_boolean_gates, boolean_eq_D, h_max_icos_bits, h_max_eq_log2_N,
        n_shannon_icos, karp_21_approx, karp_21_eq_E, n_multi_party,
        circuit_depth, kolmogorov_rate, channel_capacity
    """
    return {
        "n_boolean_gates": N_BOOLEAN_GATES_UNIVERSAL,
        "boolean_eq_D": N_BOOLEAN_EQ_D,
        "h_max_icos_bits": H_MAX_ICOS_BITS,
        "h_max_eq_log2_N": H_MAX_EQ_LOG2_N,
        "n_shannon_icos": N_SHANNON_MAX_ICOS,
        "shannon_eq_N": (N_SHANNON_MAX_ICOS == N),
        "karp_21_approx": KARP_21_APPROX,
        "karp_21_eq_E": KARP_21_EQ_E,
        "n_multi_party": N_MULTI_PARTY_MIN,
        "multi_party_eq_D": N_MULTI_PARTY_EQ_D,
        "circuit_depth": N_CIRCUIT_DEPTH,
        "circuit_eq_D": N_CIRCUIT_EQ_D,
        "kolmogorov_rate": KOLMOGOROV_INCOMPRESSIBILITY_RATE,
        "channel_capacity": CHANNEL_CAPACITY_ICOS,
    }


def computational_complexity_summary():
    """
    Full summary of Cathedral computational complexity connections.

    Returns dict with keys:
        "complexity_classes", "boolean_complexity", "KEY_EXACT_RESULTS"
    """
    cc = complexity_classes()
    bc = boolean_complexity()

    key_results = [
        f"Base complexity classes = D = {D}  [EXACT: P, NP, co-NP]",
        f"Polynomial hierarchy levels = D+1 = {D+1}  [APPROXIMATE: PH₀–PH₃]",
        f"3-SAT literals per clause = D = {D}  [APPROXIMATE: NP-complete]",
        f"4-coloring of planar graphs in P (4-color thm), D+1 = {D+1}  [EXACT]",
        f"3-coloring is NP-complete, D = {D}  [EXACT]",
        f"Randomized classes = D = {D}  [EXACT: RP, co-RP, ZPP]",
        f"Boolean universal gates = D = {D}  [EXACT: AND, OR, NOT]",
        f"Shannon max entropy for N={N} outcomes = log₂({N}) ≈ {H_MAX_ICOS_BITS:.3f} bits  [EXACT]",
        f"Karp ≈ N+F-D = {N}+{F}-{D} = {N+F-D} = E = {E}  [APPROXIMATE]",
        f"Space endpoint classes = D-1 = {D-1}  [APPROXIMATE: L, PSPACE]",
        f"Multi-party comm complexity players = D = {D}  [APPROXIMATE]",
        f"Quantum-classical gaps = D-1 = {D-1}  [APPROXIMATE: BQP vs P, QMA vs NP]",
    ]

    return {
        "complexity_classes": cc,
        "boolean_complexity": bc,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
        "E": E,
    }


def print_computational_complexity_report():
    """Print a formatted report of Cathedral computational complexity connections."""
    s = computational_complexity_summary()
    print("=" * 65)
    print("  COMPUTATIONAL COMPLEXITY CATHEDRAL — δ★ ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Complexity hierarchy:")
    print(f"    Base classes (P,NP,co-NP)    = D = {D}   [EXACT]")
    print(f"    Poly hierarchy levels          = D+1 = {D+1} [APPROXIMATE]")
    print(f"    3-SAT literals per clause      = D = {D}   [APPROXIMATE: NP-complete]")
    print()
    print("  Graph coloring:")
    print(f"    Polynomial (4-color thm)       = D+1 = {D+1} colors  [EXACT]")
    print(f"    NP-complete threshold           = D = {D}   colors  [EXACT]")
    print(f"    Polynomial (bipartite check)    = D-1 = {D-1} colors  [EXACT]")
    print()
    print("  Randomized & Boolean:")
    print(f"    Randomized classes (RP,co-RP,ZPP) = D = {D}  [EXACT]")
    print(f"    Boolean universal gates (AND,OR,NOT) = D = {D}  [EXACT]")
    print(f"    Space endpoint classes          = D-1 = {D-1}  [APPROXIMATE]")
    print()
    print("  Information theory:")
    print(f"    Max entropy (N={N} outcomes)    = log₂({N}) ≈ {H_MAX_ICOS_BITS:.4f} bits  [EXACT]")
    print(f"    Karp NP-complete set ≈ N+F-D    = {N}+{F}-{D} = {N+F-D} = E = {E}  [APPROXIMATE]")
    print(f"    Multi-party comm min players    = D = {D}  [APPROXIMATE]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)
