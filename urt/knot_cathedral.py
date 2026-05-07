"""
Knot Cathedral — Jones polynomial, Chern-Simons, braid group B_N.

The deepest connection in Cathedral mathematics:
  Witten (1989): Chern-Simons theory in D=3 computes knot invariants.
  Level k=3 CS theory: Jones polynomial evaluated at t = e^{2πi/(k+2)} = e^{2πi/5}.
  This is EXACTLY our q=5 root of unity — same q as in Cathedral integers!

Chain: D=3 → CS theory in 3D at level k=D → q = e^{2πi/(D+2)} = e^{2πi/5}
     → Fibonacci anyons with 5-fold symmetry and d=φ
     → same φ as in δ★ = (80/81)π/(13φ)
     → same q=5 as Cathedral q

Braid group B_N on N=13 strands has exactly V=12 generators (σ₁…σ_{V}),
where V=12 is the icosahedral vertex count.
"""

import cmath
from math import pi, sqrt, log, cos, sin
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Chern-Simons level ────────────────────────────────────────────────────────

# Chern-Simons level k = D = 3 (spatial dimension forces the CS level!)
CS_LEVEL = D   # = 3

# Jones polynomial variable t = e^{2πi/(k+2)} at CS level k
# With k = D = 3: t = e^{2πi/5} = e^{2πi/q}
T_JONES = cmath.exp(2j * pi / (CS_LEVEL + 2))  # = e^{2πi/5}

# The parameter q in Jones polynomial = k + 2 = D + 2 = 5 = Cathedral q
Q_JONES = CS_LEVEL + 2   # = 5

# Verify: Q_JONES == q (Cathedral)
_Q_MATCH = (Q_JONES == q)   # True — exact match!

# Kauffman bracket variable A = e^{iπ/(2q)} = e^{iπ/10}
A_KAUFFMAN = cmath.exp(1j * pi / (2 * q))   # = e^{iπ/10}


# ── Braid group B_N ───────────────────────────────────────────────────────────

# Braid group B_N on N=13 strands: generators σ₁, σ₂, …, σ_{N-1}
# Number of generators = N - 1 = 12 = V (icosahedral vertex count!)
N_BRAID_GENERATORS = N - 1    # = 12 = V

# Reduced Burau representation: B_N → GL(N-1, Z[t,t⁻¹])
# Dimension of Burau matrices = N - 1 = 12 = V
BURAU_DIM = N - 1   # = V = 12


# ── Jones polynomial evaluations ──────────────────────────────────────────────

def _jones_at_q(poly_fn):
    """Evaluate Jones polynomial function at t = e^{2πi/5}."""
    return poly_fn(T_JONES)


def jones_unknot() -> complex:
    """Jones polynomial of the unknot: V(t) = 1."""
    return complex(1, 0)


def jones_trefoil() -> complex:
    """Jones polynomial of the left-handed trefoil 3_1: V(t) = -t^{-4} + t^{-3} + t^{-1}."""
    t = T_JONES
    return -t**(-4) + t**(-3) + t**(-1)


def jones_hopf() -> complex:
    """Jones polynomial of the Hopf link: V(t) = -(t^{1/2} + t^{5/2})."""
    t = T_JONES
    return -(t**(0.5) + t**(2.5))


def jones_figure8() -> complex:
    """Jones polynomial of the figure-eight knot 4_1: V(t) = t² - t + 1 - t⁻¹ + t⁻²."""
    t = T_JONES
    return t**2 - t + 1 - t**(-1) + t**(-2)


def jones_torus_p2(p: int = 5) -> complex:
    """
    Jones polynomial of the torus knot T(2,p) (closure of σ₁^p in B₂).

    V_{T(2,p)}(t) = t^{(p-1)/2} × (t^{p+1} - t²) / (t² - 1)  for p odd positive.

    At p = q = 5: T(2,5) is the cinquefoil / (2,5) torus knot.
    The (2,5) torus knot is the boundary of the Seifert surface of the Hopf band
    repeated 5 times — natural 5-fold symmetry!
    """
    t = T_JONES
    if p == 1:
        return complex(1, 0)
    # T(2,p) for odd p:
    return t**((p - 1) / 2) * (t**(p + 1) - t**2) / (t**2 - 1)


# ── Fibonacci anyon braiding connection ───────────────────────────────────────

def fibonacci_braiding() -> dict:
    """
    Connection between Jones polynomial and Fibonacci anyon braiding.

    At CS level k=3, the Jones polynomial evaluated at t = e^{2πi/5}
    reproduces Fibonacci anyon amplitudes (Freedman-Kitaev-Wang 2002).

    The phase e^{2πi/5} = e^{2πi/q} appears in BOTH:
    - Cathedral: q=5 is the pentagonal fold of the icosahedron
    - Jones theory: q = k+2 = D+2 = 5 at CS level k=3=D
    """
    return {
        "CS_level":          CS_LEVEL,
        "CS_level_equals_D": CS_LEVEL == D,
        "t_jones":           T_JONES,
        "t_phase_deg":       72.0,    # 2π/5 = 72°
        "Q_jones":           Q_JONES,
        "Q_equals_q":        _Q_MATCH,
        "fibonacci_phase":   cmath.phase(T_JONES),
        "golden_ratio":      phi,
        "d_fibonacci":       phi,
        "connection":        (
            "CS in D=3 at level k=D=3 → t=e^{2πi/5}=e^{2πi/q} "
            "→ Fibonacci anyons with d=φ and q=5-fold symmetry"
        ),
        "V_trefoil_at_q":   jones_trefoil(),
        "V_unknot":         jones_unknot(),
        "chain":            "D=3 → k=D=3 → q=k+2=5 → t=e^{2πi/5} → d=φ → δ★∝1/φ",
    }


# ── Braid group B_13 ──────────────────────────────────────────────────────────

def braid_group_B13() -> dict:
    """
    Braid group B_13 on N=13 strands.

    Generators: σ₁, …, σ_{12}   (12 = V = icosahedral vertex count)
    Relations: σᵢσⱼ = σⱼσᵢ  for |i−j| ≥ 2   (far generators commute)
               σᵢσᵢ₊₁σᵢ = σᵢ₊₁σᵢσᵢ₊₁   (braid relation)

    Reduced Burau representation: B_{13} → GL(12, Z[t,t^{-1}])
    12 = V — the Burau dimension equals the icosahedral vertex count.

    Jones polynomial from Markov trace of Burau representation.
    """
    n_strands = N
    n_generators = N - 1   # = 12 = V
    return {
        "n_strands":        n_strands,
        "n_generators":     n_generators,
        "n_generators_eq_V": (n_generators == V),
        "burau_dim":        BURAU_DIM,
        "burau_dim_eq_V":   (BURAU_DIM == V),
        "braid_relation":   "σᵢσᵢ₊₁σᵢ = σᵢ₊₁σᵢσᵢ₊₁ (Yang-Baxter!)",
        "yang_baxter_dim":  D,
        "generators":       [f"σ_{i}" for i in range(1, n_generators + 1)],
        "markov_closure":   "Every link is closure of some braid in B_N (Alexander 1923)",
        "note":             "B_13: 12=V generators; Burau rep is 12×12=V×V matrices",
    }


# ── Writhe and linking number ─────────────────────────────────────────────────

def writhe_torus(p: int = q, r: int = D + 2) -> dict:
    """
    Writhe and self-linking of torus knot T(p, r) = T(q, D+2) = T(5, 5).

    T(p, r): wraps p times in one direction, r times in other.
    Writhe w = p(r²−1)/r  (for T(p,r) as braid closure of σ₁^{p(r-1)} in B_r).

    Cathedral choice T(q, D+2) = T(5, 5): writhe = p(r²−1)/r = 5×24/5 = 24 = 2V.
    """
    w = p * (r**2 - 1) / r
    return {
        "p": p,
        "r": r,
        "writhe": w,
        "writhe_formula": "w = p(r²−1)/r",
        "cathedral_T55": {"p": q, "r": D + 2, "writhe": q * ((D + 2)**2 - 1) / (D + 2)},
        "writhe_eq_2V": abs(q * ((D + 2)**2 - 1) / (D + 2) - 2 * V) < 1e-10,
        "note": "T(q, D+2) = T(5,5): writhe = 24 = 2V (twice icosahedral vertex count)",
    }


# ── Alexander polynomial ─────────────────────────────────────────────────────

def alexander_trefoil_at_q() -> dict:
    """
    Alexander polynomial of trefoil Δ(t) = t - 1 + t^{-1}, evaluated at t = e^{2πi/5}.

    The Alexander polynomial is the determinant of the Seifert matrix.
    For the trefoil: |Δ(-1)| = 3  (knot determinant = 3 = D!).
    """
    t = T_JONES
    delta = t - 1 + t**(-1)
    # At t = -1 (Alexander determinant):
    delta_det = (-1) - 1 + (-1)**(-1)   # = -1 - 1 - 1 = -3
    return {
        "t_used":       T_JONES,
        "Delta_at_q":   delta,
        "Delta_abs":    abs(delta),
        "Delta_at_neg1": delta_det,
        "determinant":  abs(delta_det),
        "determinant_eq_D": (abs(delta_det) == D),
        "formula":      "Δ(t) = t - 1 + t^{-1}",
        "note":         "|Δ(-1)| = 3 = D: trefoil determinant = spatial dimension!",
    }


# ── Reidemeister moves and invariance ─────────────────────────────────────────

def reidemeister_moves() -> dict:
    """
    Three Reidemeister moves and their Cathedral counting.

    R1: one strand (local — 1 strand)
    R2: two strands (D-1 = 2)
    R3: three strands (D = 3)

    The three moves correspond exactly to D = 3 spatial dimensions.
    """
    return {
        "R1_strands": 1,
        "R2_strands": D - 1,
        "R3_strands": D,
        "n_moves":    D,
        "n_moves_eq_D": True,
        "note": "3 Reidemeister moves ↔ D=3 spatial dimensions",
        "connection": "The completeness of {R1,R2,R3} for knot equivalence in R³ uses D=3 crucially",
    }


# ── Summary ──────────────────────────────────────────────────────────────────

def knot_summary() -> dict:
    """Full Cathedral knot theory summary."""
    vt = jones_trefoil()
    vhopf = jones_hopf()
    v48 = jones_figure8()
    vtor = jones_torus_p2(p=q)
    return {
        "chern_simons": {
            "level": CS_LEVEL,
            "t_jones": T_JONES,
            "q_jones": Q_JONES,
            "q_matches_cathedral": _Q_MATCH,
        },
        "jones_at_e2pi5": {
            "unknot":    jones_unknot(),
            "trefoil":   vt,
            "trefoil_abs": abs(vt),
            "hopf":      vhopf,
            "figure8":   v48,
            "torus_25":  vtor,   # T(2,5)
        },
        "fibonacci_braiding":   fibonacci_braiding(),
        "braid_group_B13":      braid_group_B13(),
        "writhe_T55":           writhe_torus(),
        "alexander_trefoil":    alexander_trefoil_at_q(),
        "reidemeister":         reidemeister_moves(),
        "delta_star":           DELTA_STAR,
        "q":                    q,
        "D":                    D,
        "V":                    V,
        "key_chain": (
            "D=3 → CS level k=3 → Jones at t=e^{2πi/5}=e^{2πi/q} → "
            "Fibonacci anyons d=φ → δ★=(80/81)π/(13φ)"
        ),
    }


def print_knot_report():
    """Print Cathedral knot theory report."""
    vt  = jones_trefoil()
    v48 = jones_figure8()
    vt5 = jones_torus_p2(p=q)
    al  = alexander_trefoil_at_q()
    w   = writhe_torus()
    rr  = reidemeister_moves()

    print("  Cathedral Knot Theory — Jones Polynomial & Chern-Simons")
    print("  " + "─" * 56)

    print(f"\n  Chern-Simons in D=3 at level k=D=3:")
    print(f"    Jones variable  t = e^{{2πi/(k+2)}} = e^{{2πi/5}} = e^{{2πi/q}}")
    print(f"    t = {T_JONES:.6f}")
    print(f"    Q_jones = k+2 = D+2 = {Q_JONES} = q  ← EXACT MATCH!")
    print(f"    A (Kauffman) = e^{{iπ/10}} = {A_KAUFFMAN:.6f}")

    print(f"\n  Jones polynomial at t = e^{{2πi/5}}:")
    print(f"    Unknot:       V = {jones_unknot()}")
    print(f"    Trefoil 3₁:   V = {vt.real:.6f} + {vt.imag:.6f}i  |V| = {abs(vt):.6f}")
    print(f"    Figure-8 4₁:  V = {v48.real:.6f} + {v48.imag:.6f}i  |V| = {abs(v48):.6f}")
    print(f"    Torus T(2,5): V = {vt5.real:.6f} + {vt5.imag:.6f}i  |V| = {abs(vt5):.6f}")

    print(f"\n  Alexander polynomial (trefoil):")
    print(f"    Δ(t) = t - 1 + t⁻¹ at t=e^{{2πi/5}}: {al['Delta_at_q'].real:.4f}+{al['Delta_at_q'].imag:.4f}i")
    print(f"    |Δ(-1)| = {al['determinant']} = D = 3  ← knot determinant = spatial dim!")

    print(f"\n  Braid group B_{{13}}:")
    print(f"    Strands:    N = {N}")
    print(f"    Generators: σ₁…σ_{{12}},  12 = V (icosahedral vertex count!)")
    print(f"    Burau rep:  12×12 = V×V matrices over Z[t, t⁻¹]")
    print(f"    Closure theorem: every link = closure of braid in B_{{13}}")

    print(f"\n  Writhe of T(q, D+2) = T(5,5):")
    print(f"    w = q(r²-1)/r = 5×24/5 = {w['cathedral_T55']['writhe']:.1f} = 2V = 2×{V}")
    print(f"    writhe = 2V: {w['writhe_eq_2V']}")

    print(f"\n  Reidemeister moves: {rr['n_moves']} moves ↔ D={D} spatial dimensions")
    print(f"    R1 (1 strand), R2 (D-1=2 strands), R3 (D=3 strands)")

    print(f"\n  The Fundamental Chain:")
    print(f"    D=3 → CS level k=3 → t=e^{{2πi/5}} → Fibonacci anyons → d=φ")
    print(f"    same φ as δ★=(80/81)π/(13φ),  same q=5 as Cathedral")
    print(f"    → Knot invariants, topological QC, and δ★ all from D=3")
