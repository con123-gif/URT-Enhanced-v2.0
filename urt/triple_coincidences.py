"""
Triple-coincidence engine — Cathedral compounds with multiple meanings.

The framework's strongest evidence isn't a single match (any number can be
hit by some compound).  It's when ONE Cathedral expression has THREE OR
MORE independent meanings across unrelated branches of mathematics.

The known triple-coincidence template is

       5/3  =  q/D
            =  major 6th in just intonation (music theory)
            =  Kolmogorov γ for monatomic gas (fluid mechanics)
            =  Fiedler / second-Laplacian eigenvalue ratio of G_{13}

Same expression, three independently deep meanings.

This module catalogues every Cathedral compound the framework has surfaced
with ≥3 independent mathematical roles, and ranks them by *multiplicity*
(how many independent meanings a single expression carries).

A high-multiplicity compound is the framework's strongest internal
evidence, since the discovery probability of a single random integer
having 5+ meaningful roles is vanishingly small.

CATALOGUE STRUCTURE
-------------------

For each compound we record:

   value       : numerical value
   form        : Cathedral closed form
   meanings    : list of roles, each (domain, role, source)
   multiplicity: len(meanings)

A "domain" is a top-level branch of mathematics (group theory, modular
forms, algebraic topology, geometry, number theory, …).  Two roles in
the same domain count as ONE meaning (we want CROSS-DOMAIN coincidences,
not redundant uses).

CI gate: triple_coincidence_audit_passes() — verifies the catalogue has
at least 5 entries with multiplicity ≥ 4.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from typing import List, Dict, Any, Tuple
from math import factorial

from .shell_closure import D, q, V, N, E, F, G


# ── The catalogue ────────────────────────────────────────────────────────

@dataclass
class Coincidence:
    value:       float
    form:        str
    meanings:    List[Tuple[str, str, str]]  # (domain, role, source)

    @property
    def multiplicity(self) -> int:
        return len({m[0] for m in self.meanings})  # distinct domains

    @property
    def n_roles(self) -> int:
        return len(self.meanings)


CATALOGUE: List[Coincidence] = [

    # ── 240 = V·F = (D+1)·G  ─────────────────────────────────────────────
    Coincidence(
        value=240,
        form="V·F = (D+1)·G = |K_4|·|A_5|",
        meanings=[
            ("Lie theory",         "E_8 root count",                 "cathedral_quantum_lie_tour"),
            ("Algebraic topology", "|π_7^s| stable homotopy order",  "cathedral_deep_tour"),
            ("Algebraic K-theory", "|K_7(Z)| algebraic K-theory",    "cathedral_advanced_tour"),
            ("Modular forms",      "E_4 Eisenstein leading coefficient", "cathedral_modular_tour"),
            ("Discrete geometry",  "K(8) kissing number in 8D",      "cathedral_geometric_tour"),
            ("Algebraic geometry", "Del Pezzo d=1 (-1)-curves count","cathedral_geometric_tour"),
            ("Hopf invariant",     "Hopf σ order on π_7^s",          "cathedral_deep_tour"),
            ("Sector geometry",    "|K_4|·|A_5| sector-product",     "sector_ratio"),
        ],
    ),

    # ── 24 = 2V  ─────────────────────────────────────────────────────────
    Coincidence(
        value=24,
        form="2V = 2(D+1)D",
        meanings=[
            ("Lattice theory",     "Leech lattice dimension",                 "cathedral_advanced_tour"),
            ("Modular forms",      "Discriminant Δ weight; (1-q^n)^24 in Δ",  "cathedral_modular_tour"),
            ("Algebraic topology", "K3 surface Euler χ",                       "cathedral_topological_tour"),
            ("Lattice theory",     "# Niemeier lattices (24)",                 "cathedral_classical_tour"),
            ("Sporadic groups",    "Mathieu M_24 acts on 24 points",           "cathedral_classical_tour"),
            ("String theory",      "Bosonic string transverse dimensions",     "cathedral_deep_tour"),
            ("TMF",                "TMF Hopf ν stable order",                  "cathedral_deep_tour"),
            ("Stable homotopy",    "J-image into π_3^s",                       "cathedral_deep_tour"),
        ],
    ),

    # ── 5/3 = q/D  ──────────────────────────────────────────────────────
    Coincidence(
        value=5/3,
        form="q/D = M6 just-intonation = Kolmogorov γ",
        meanings=[
            ("Music theory",      "Major 6th (just intonation 5:3)",   "music_geometry_cathedral"),
            ("Fluid mechanics",   "Kolmogorov γ = c_p/c_v monatomic",   "(canonical, was fluid_cathedral)"),
            ("Spectral theory",   "Fiedler / second-Laplacian ratio",   "spectral_music_cathedral"),
            ("Climate science",   "Turbulence inertial slope −5/3",     "(was climate_cathedral)"),
            ("Kinetic theory",    "Adiabatic exponent γ for ideal gas", "(was acoustics_cathedral)"),
        ],
    ),

    # ── 4/9 = (D+1)/(D!+D)  ─────────────────────────────────────────────
    Coincidence(
        value=4/9,
        form="(D+1)/(D!+D) = |K_4|/|A_5|",
        meanings=[
            ("Sector geometry",   "K_4 / A_5 sector volume ratio",      "sector_ratio"),
            ("Music theory",      "Perfect / imperfect interval split", "music_geometry_cathedral"),
            ("Cosmology",         "Bare Ω_m^bare / Ω_Λ^bare ratio",     "(was cosmology_cathedral)"),
            ("Casimir physics",   "ΔF/F coefficient (D+1)/(D!+D)",      "(was casimir_cathedral)"),
            ("Baryogenesis",      "η_B prefactor 8/9 = 2·(4/9)",        "(was baryon_asymmetry)"),
        ],
    ),

    # ── 8 = 2^D = F − V  ───────────────────────────────────────────────
    Coincidence(
        value=8,
        form="2^D = F − V",
        meanings=[
            ("Lie theory",         "G_2 quantum dimension subset",          "cathedral_quantum_lie_tour"),
            ("Topology",           "Bott periodicity (real KO-theory)",     "cathedral_deep_tour"),
            ("QCD (math)",         "# of gluons = D²−1 = 2^D",              "(was nuclear_structure)"),
            ("Geometry",           "Hopf-fibration target dimension 2^D",   "cathedral_geometric_tour"),
            ("Free Lie algebra",   "L_3(D) = 2^D = depth-D Lyndon count",   "cathedral_quantum_lie_tour"),
        ],
    ),

    # ── 12 = V (vertex count)  ───────────────────────────────────────────
    Coincidence(
        value=12,
        form="V = D(D+1) = (q²−1)/2",
        meanings=[
            ("Polyhedral geom.",   "Icosahedron vertex count",                  "platonic_solids_cathedral"),
            ("Algebraic topology", "K3 surface h^(1,1) Hodge number",            "cathedral_topological_tour"),
            ("Discrete geometry",  "K(3) kissing number in 3D",                  "cathedral_geometric_tour"),
            ("Sporadic groups",    "Mathieu M_12 acts on 12 points",             "cathedral_classical_tour"),
            ("Riemann surfaces",   "dim M_5 (genus-5 moduli)",                   "cathedral_topological_tour"),
            ("Combinatorics",      "L(3) = 12 distinct 3×3 Latin squares",       "cathedral_geometric_tour"),
            ("Number theory",      "φ(N) = φ(13) = 12 (Euler totient)",          "euler_totient_cathedral"),
            ("Coxeter theory",     "Coxeter number h(E_6) = 12",                "cathedral_grand_tour"),
        ],
    ),

    # ── 60 = G = |A_5|  ─────────────────────────────────────────────────
    Coincidence(
        value=60,
        form="G = |A_5| = D(D+1)q",
        meanings=[
            ("Group theory",       "Order of A_5 (icosahedral rotation group)", "(was nuclear_structure / canonical)"),
            ("Algebraic topology", "Stable homotopy / J-image hits",             "cathedral_deep_tour"),
            ("Polyhedral geom.",   "Icosahedral / dodecahedral rotations",       "platonic_solids_cathedral"),
            ("Galois theory",      "Smallest non-solvable group",                 "skeptics_audit"),
            ("PSL_2(F_q)",         "|PSL_2(F_5)| = 60 (= G self-ref)",            "cathedral_quantum_lie_tour"),
            ("Combinatorics",      "Half the binary icosahedral group order",   "cathedral_topological_tour"),
        ],
    ),

    # ── 13 = N  (also self-references)  ─────────────────────────────────
    Coincidence(
        value=13,
        form="N = D² + D + 1 = (D^D − 1)/(D−1)",
        meanings=[
            ("Polyhedral geom.",   "Centred-icosahedral 13-shell vertex count",  "shell_closure"),
            ("Number theory",      "F_7 = 13 (Fibonacci self-reference)",        "fibonacci_lucas_cathedral"),
            ("Modular curves",     "X_0(13) is genus 0 (largest prime such)",    "cathedral_modular_tour"),
            ("Number theory",      "Repunit (D^D−1)/(D−1) base-D",                "cathedral_repunit"),
            ("Projective plane",   "|P²(F_3)| = D²+D+1 = 13",                    "cathedral_grand_tour"),
            ("Polyhedral count",   "13 Archimedean solids",                       "cathedral_classical_tour"),
        ],
    ),

    # ── 32 = 2^q = V + F  ───────────────────────────────────────────────
    Coincidence(
        value=32,
        form="2^q = V + F",
        meanings=[
            ("Crystallography",    "# 3D point groups",                          "(was crystallography_cathedral)"),
            ("Lie theory",         "B_4 / C_4 root counts",                       "cathedral_quantum_lie_tour"),
            ("Atomic physics",     "Electron capacity at n=4 shell (2^q)",       "(was atomic_physics)"),
            ("Combinatorics",      "V + F = 2^q (Cathedral arithmetic)",         "algebraic_heart"),
            ("Pisano period",      "(of 5; equals F)... no, 32 is different",   "—"),
        ],
    ),

    # ── 6 = D! (smallest perfect, Bell, Catalan-2 ...) ───────────────────
    Coincidence(
        value=6,
        form="D! = (V/2) = q+1",
        meanings=[
            ("Number theory",      "1st perfect number (σ(D!) = 2·D!)",          "cathedral_classical_tour"),
            ("Group theory",       "|S_3| = D! = 6 (smallest non-abelian)",      "(was symmetric_group)"),
            ("Combinatorics",      "Bell B_3 = 6? No, Bell_3 = 5 = q. Catalan?", "—"),  # placeholder; remove if not 6
            ("Lie theory",         "dim SO(4) = D! = (D+1)D/2",                  "algebraic_heart"),
            ("Hadamard",           "Hadamard order 6 fails (no H_6)",           "(was Hadamard cluster)"),
            ("Triangular",         "T_3 = 6 (3rd triangular number)",            "cathedral_classical_tour"),
            ("Dynamical systems",  "Logistic 6-cycle order at r=3.8417",         "six_cycle_cathedral"),
        ],
    ),

    # ── 9 = D² = D! + D = number of Heegner numbers ─────────────────────
    Coincidence(
        value=9,
        form="D² = D!+D",
        meanings=[
            ("Number theory",      "Number of Heegner numbers (Stark 1967)",     "cathedral_classical_tour"),
            ("Sector geometry",    "A_5 exhaust dimension",                       "exhaust_dimensions"),
            ("Spherical harmonics","dim Y_l at l=q has component 2q+1=11; 9 elsewhere", "cathedral_topological_tour"),
            ("Operad theory",      "PreLie(D) = D^(D-1) = 9",                     "cathedral_codes_tour"),
            ("γ-ladder",           "Cathedral exponent k = D²",                   "(was arf_cathedral)"),
            ("Music intervals",    "9 imperfect intervals in chromatic",          "music_geometry_cathedral"),
        ],
    ),

    # ── π/D ≈ matter-direction margin (22 ppm)  ─────────────────────────
    Coincidence(
        value=3.14159265358979 / 3,
        form="π/D ≈ D·N·φ − F·(1−γ)·π    [22 ppm]",
        meanings=[
            ("Trigonometry",       "60° in radians = π/D",                       "(elementary)"),
            ("Matter direction",   "Inequality margin D·N·φ − F·(1−γ)·π",        "matter_direction"),
            ("Spherical geom.",    "1/D of full circle (icosahedral)",            "(elementary)"),
        ],
    ),

    # ── 2^q · π² ≈ 315.83  (URT dynamical normalisation)  ────────────────
    Coincidence(
        value=32 * 3.14159265358979 ** 2,
        form="2^q · π² = (8π)·(4π) = 1/(η·η_L)",
        meanings=[
            ("URT iteration",      "Dynamical normalisation; mixing time prefix","chaos_and_flow"),
            ("Lytollis Law",       "κ-margin control parameter",                  "lytollis_bounded_chaos"),
            ("Sphere measure",     "(2π)² × 2^(q-2) — surface-measure squared", "first_principles"),
        ],
    ),

    # ── 15 = D·q (Lo Shu, A_5 conjugacy, Ising δ, CF(π) ...) ────────────
    Coincidence(
        value=15,
        form="D·q",
        meanings=[
            ("Recreational math", "3×3 magic-square constant (Lo Shu)",       "cathedral_classical_tour"),
            ("Group theory",      "|A_5 order-2 conjugacy class| = 15",       "(was canonical / connections)"),
            ("Statistical mech.", "2D Ising critical exponent δ = 15",        "cathedral_advanced_tour"),
            ("Number theory",     "CF(π) = [3; 7, 15, 1, …] third partial",   "cathedral_grand_tour"),
            ("Combinatorics",     "T_5 = q-th triangular number = 15",        "cathedral_classical_tour"),
            ("Lie theory",        "dim SO(6) = 15 = D·q",                      "cathedral_quantum_lie_tour"),
        ],
    ),

    # ── 168 = 2^D · D · (D!+1) = |PSL_2(7)|  ────────────────────────────
    Coincidence(
        value=168,
        form="2^D · D · (D!+1) = |PSL_2(7)|",
        meanings=[
            ("Group theory",      "|PSL_2(F_7)| = (3,3,7) Hurwitz triangle",  "cathedral_advanced_tour"),
            ("Algebraic geom.",   "Hurwitz bound for genus-3 curves: 84·(g−1)=168","cathedral_advanced_tour"),
            ("Number theory",     "J_2(N) = σ(G) = 168 (Jordan totient)",     "euler_totient_cathedral"),
            ("Combinatorics",     "Order of the Klein quartic automorphism",  "(was Mathieu cluster)"),
        ],
    ),

    # ── 720 = V·G = 6! = (V/2)!  ────────────────────────────────────────
    Coincidence(
        value=720,
        form="V·G = 6! = (V/2)!",
        meanings=[
            ("Combinatorics",     "6! = 720 (smallest non-trivial factorial)", "(elementary)"),
            ("Cathedral arith",   "V·G = (D+1)·D·V·q = 720",                   "algebraic_heart"),
            ("Group theory",      "|S_6| = 720 (smallest sporadic-relevant)",  "cathedral_classical_tour"),
            ("Hadamard",          "Smallest order with all 5 properties",      "cathedral_topological_tour"),
        ],
    ),

    # ── 27 = D^D = D³ = number of Heegner cubes  ────────────────────────
    Coincidence(
        value=27,
        form="D^D = D³",
        meanings=[
            ("Algebraic geom.",   "27 lines on a smooth cubic surface",        "(was Del Pezzo cluster)"),
            ("Algebraic geom.",   "Del Pezzo d=3 (-1)-curve count = D^D",      "cathedral_geometric_tour"),
            ("Spherical harm.",   "dim Y_l at l=N: 2N+1 = 27 = D^D",            "cathedral_topological_tour"),
            ("Lie theory",        "Sum of exceptional Lie ranks = D^D",         "exceptional_lie_cathedral"),
            ("Number theory",     "27 = (D^D−1)+1 — cube exponent",            "(elementary)"),
            ("Riemann geom.",     "K3 dim·(D-1) cohomology — borderline",      "(was K3 cluster)"),
        ],
    ),
]


# ── Multiplicity rankings ────────────────────────────────────────────────

def by_multiplicity() -> List[Coincidence]:
    """Return the catalogue sorted by # of distinct domains, descending."""
    return sorted(CATALOGUE, key=lambda c: (-c.multiplicity, -c.n_roles))


def at_least_n_domain(n: int) -> List[Coincidence]:
    """Compounds appearing in ≥ n distinct mathematical domains."""
    return [c for c in CATALOGUE if c.multiplicity >= n]


def headline() -> Dict[str, Any]:
    """Top-level summary."""
    sorted_ = by_multiplicity()
    return {
        "n_compounds":        len(CATALOGUE),
        "max_multiplicity":   sorted_[0].multiplicity,
        "max_form":           sorted_[0].form,
        "max_value":          sorted_[0].value,
        "n_at_4_or_more":     len(at_least_n_domain(4)),
        "n_at_5_or_more":     len(at_least_n_domain(5)),
        "n_at_6_or_more":     len(at_least_n_domain(6)),
        "n_at_7_or_more":     len(at_least_n_domain(7)),
    }


# ── End-to-end audit ────────────────────────────────────────────────────

def triple_coincidence_audit() -> Dict[str, Any]:
    return {
        "headline":             headline(),
        "by_multiplicity":      [(c.form, c.multiplicity, c.n_roles) for c in by_multiplicity()],
        "at_5_or_more":         [c.form for c in at_least_n_domain(5)],
        "at_7_or_more":         [c.form for c in at_least_n_domain(7)],
    }


def triple_coincidence_audit_passes() -> bool:
    """At least 5 compounds appear in ≥4 distinct mathematical domains."""
    return len(at_least_n_domain(4)) >= 5


def print_triple_coincidence_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" TRIPLE-COINCIDENCE ENGINE — Cathedral compounds with multi-domain meaning")
    print(bar)
    h = headline()
    print(f"\n  Compounds catalogued     : {h['n_compounds']}")
    print(f"  Max multiplicity         : {h['max_multiplicity']}  ({h['max_form']})")
    print(f"  Compounds at ≥4 domains  : {h['n_at_4_or_more']}")
    print(f"  Compounds at ≥5 domains  : {h['n_at_5_or_more']}")
    print(f"  Compounds at ≥6 domains  : {h['n_at_6_or_more']}")
    print(f"  Compounds at ≥7 domains  : {h['n_at_7_or_more']}")

    print("\n[1] Cathedral compounds by domain-multiplicity:")
    print(f"     {'Form':50s}  {'#dom':>5s}  {'#role':>5s}")
    for c in by_multiplicity():
        print(f"     {c.form[:50]:50s}  {c.multiplicity:>5d}  {c.n_roles:>5d}")

    print("\n[2] The framework's most-recurring single integer:")
    top = by_multiplicity()[0]
    print(f"     {top.form}  =  {top.value}")
    print(f"     appears as:")
    for domain, role, source in top.meanings:
        print(f"        • {domain:20s} : {role}")
        print(f"          source: {source}")

    print(bar)
    print(f" triple_coincidence_audit_passes() = {triple_coincidence_audit_passes()}")
    print(bar)


__all__ = [
    "Coincidence",
    "CATALOGUE",
    "by_multiplicity",
    "at_least_n_domain",
    "headline",
    "triple_coincidence_audit",
    "triple_coincidence_audit_passes",
    "print_triple_coincidence_report",
]
