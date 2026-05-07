"""
Atomic Physics Cathedral — Hydrogen atom, orbitals, and Cathedral integers.

Key Cathedral connections:

  QUANTUM NUMBERS: (n, l, m, s) = D+1 = 4 quantum numbers  [EXACT]

  ORBITAL TYPES up to l=D-1=2: s (l=0), p (l=1), d (l=2) = D orbital types
  Total orbital types in noble gas shells: {s,p,d,f,g,...} index = {0,1,...}

  ANGULAR MOMENTUM QUANTUM NUMBER l:
    l=0 (s): 1 = 1 state
    l=1 (p): 3 = D states  [EXACT]
    l=2 (d): 5 = q states  [EXACT]
    l=3 (f): 7 states
    l=N-D-1=9 (not physical, but N-D-1 = 9 = H₃ dimension)

  MAGNETIC QUANTUM NUMBERS for l:
    m = -l, ..., +l → 2l+1 states
    For l=1: 2l+1 = 3 = D  [EXACT]
    For l=2: 2l+1 = 5 = q  [EXACT]

  RYDBERG ENERGY: E_1 ≈ -13.6 eV ≈ -N/1 = -13 (N=13)  [APPROXIMATE, 5% off]
    More precisely: E_1 = -13.606 eV → N = 13

  SHELL POPULATIONS:
    n=1: 2 = D-1 electrons (max)
    n=2: 8 = ? electrons = 2^D  [EXACT: 2n² = 2×4 = 8 = 2^D for n=2]
    n=3: 18 = ? = 2×9 = 2×(N-D-1) = 2×(N-D-1) = 18 when N-D-1=9  [EXACT]
    n=4: 32 = 2×16 = 2^5 = 2^q  [EXACT: 2^q = 32]

  PERIODIC TABLE PERIODS:
    Period 1: 2 = D-1 elements
    Period 2: 8 = 2^D elements
    Period 3: 8 = 2^D elements
    Period 4: 18 = 2(N-D-1) elements  [EXACT]
    Period 5: 18 elements
    Period 6: 32 = 2^q elements  [EXACT]
    → Noble gases at {2, 10, 18, 36, 54, 86, 118} = {2, 2+8, 2+8+8, ...}

  ZEEMAN SPLITTING for l=q-1=4: 2l+1 = 9 = N-D-1 = H₃ dimension  [EXACT]
"""

from math import pi, sqrt
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Quantum numbers ───────────────────────────────────────────────────────────

# (n, l, m_l, m_s) = D+1 = 4 quantum numbers for an electron
N_QUANTUM_NUMBERS = D + 1    # = 4  [EXACT]
_QN_EQ_D1 = (N_QUANTUM_NUMBERS == D + 1)   # True

# ── Angular momentum states ───────────────────────────────────────────────────

# 2l+1 magnetic substates per l:
# l=0: 1, l=1: 3=D, l=2: 5=q, l=3: 7, l=4: 9=N-D-1
STATES_PER_L = {l: 2 * l + 1 for l in range(N)}   # indexed l=0..N-1

L_P_STATES = STATES_PER_L[1]    # = 3 = D  [EXACT: p orbital]
L_D_STATES = STATES_PER_L[2]    # = 5 = q  [EXACT: d orbital]
L_9_STATES = STATES_PER_L[4]    # = 9 = N - D - 1  [EXACT: h orbital]

_LP_EQ_D = (L_P_STATES == D)    # True
_LD_EQ_Q = (L_D_STATES == q)    # True
_L9_EQ_H3 = (L_9_STATES == N - D - 1)   # True: 9 = H₃ sector dimension

# ── Shell populations ─────────────────────────────────────────────────────────

# Maximum electrons in shell n: 2n²
MAX_ELECTRONS_SHELL = {n: 2 * n**2 for n in range(1, 6)}

# n=1: 2 = D-1
# n=2: 8 = 2^D  (if D=3: 2^D = 8!)
# n=3: 18 = 2×(N-D-1)² = 2×9 = 18
# n=4: 32 = 2^q (if q=5: 2^q = 32!)

SHELL_1_MAX = MAX_ELECTRONS_SHELL[1]   # = 2 = D-1
SHELL_2_MAX = MAX_ELECTRONS_SHELL[2]   # = 8 = 2^D  [EXACT: 2^D = 8 for D=3]
SHELL_3_MAX = MAX_ELECTRONS_SHELL[3]   # = 18 = 2×(N-D-1)² ?
SHELL_4_MAX = MAX_ELECTRONS_SHELL[4]   # = 32 = 2^q  [EXACT: 2^q = 32 for q=5]

_SHELL_1_EQ_D1 = (SHELL_1_MAX == D - 1)   # True: 2 = D-1
_SHELL_2_EQ_2D = (SHELL_2_MAX == 2**D)    # True: 8 = 2^D = 2^3
_SHELL_4_EQ_2Q = (SHELL_4_MAX == 2**q)    # True: 32 = 2^5 = 2^q

# n=3: 18 = 2 × 9 = 2 × (N-D-1)
_SHELL_3_EQ_2_H3SQ = abs(SHELL_3_MAX - 2 * (N - D - 1)) < 0.01  # 18 = 2×9? YES

# ── Rydberg energy ────────────────────────────────────────────────────────────

# Rydberg energy: E_1 = -13.606 eV ≈ -N = -13 (APPROXIMATE, 4.5%)
RYDBERG_EV = 13.6057           # eV
_RYDBERG_APPROX_N = abs(RYDBERG_EV - N) / N   # ≈ 0.045 (4.5% off)

# More precisely: E_n = -13.6057/n² eV → n=13: E_{13} = -13.6/169 = -0.0805 eV
RYDBERG_N13 = RYDBERG_EV / N**2   # = 13.606/169 ≈ 0.0805 eV = E for n=N shell

# Bohr radius: a₀ = ℏ²/(m_e e²) = 0.529 Å
BOHR_RADIUS_ANGSTROM = 0.529177  # Å

# ── Orbital notation ──────────────────────────────────────────────────────────

# Orbital names: s, p, d, f, g, h, ...
# First D = 3 orbital types: s, p, d (l=0,1,2)
ORBITAL_NAMES = ['s', 'p', 'd', 'f', 'g', 'h', 'i', 'j', 'k']
FIRST_D_ORBITALS = ORBITAL_NAMES[:D]   # = ['s', 'p', 'd']

# l for which 2l+1 = N: l = (N-1)/2 = 6
L_FOR_N_STATES = (N - 1) // 2    # = 6
_2L1_EQ_N = (2 * L_FOR_N_STATES + 1 == N)   # True: 2×6+1 = 13 = N

# ── Total states for n=1..N ───────────────────────────────────────────────────

# Sum of (2l+1) for l=0..n-1 = n² (spherical harmonics per n-shell)
# For n=N=13: total = N² = 169
TOTAL_ORBITALS_TO_N = N**2       # = 169  [EXACT]

# Noble gas electron counts (cumulative shells):
NOBLE_GAS_ELECTRONS = [2, 10, 18, 36, 54, 86, 118]
# 2 = D-1, 10 = 2+8 = 2+2^D, 18 = 2+8+8 = 2+2×2^D...
# First noble gas: 2 = D-1 = 2  [EXACT]
_NG_1_EQ_D1 = (NOBLE_GAS_ELECTRONS[0] == D - 1)   # True

# ── Fine structure ────────────────────────────────────────────────────────────

# Spin-orbit coupling: l·s = first perturbation in H
# Spin quantum number s = 1/2 → 2s+1 = 2 = D-1 spin projections [EXACT]
N_SPIN_PROJECTIONS = D - 1   # = 2  [EXACT: spin up and down]
_SPIN_EQ_D1 = (N_SPIN_PROJECTIONS == D - 1)   # True

# ── Summary functions ─────────────────────────────────────────────────────────

def quantum_numbers() -> dict:
    """Hydrogen atom quantum numbers."""
    return {
        "n_quantum_numbers":    N_QUANTUM_NUMBERS,
        "n_qn_eq_D1":          _QN_EQ_D1,
        "n_spin_projections":   N_SPIN_PROJECTIONS,
        "spin_eq_D1":          _SPIN_EQ_D1,
    }


def angular_momentum_states() -> dict:
    """Magnetic sublevel counts and Cathedral integers."""
    return {
        "p_states":        L_P_STATES,
        "p_states_eq_D":   _LP_EQ_D,
        "d_states":        L_D_STATES,
        "d_states_eq_q":   _LD_EQ_Q,
        "l4_states":       L_9_STATES,
        "l4_states_eq_H3": _L9_EQ_H3,
        "l_for_N_states":  L_FOR_N_STATES,
        "2l1_eq_N":        _2L1_EQ_N,
    }


def shell_structure() -> dict:
    """Electron shell populations and Cathedral integers."""
    return {
        "shell_1":        SHELL_1_MAX,
        "shell_1_eq_D1":  _SHELL_1_EQ_D1,
        "shell_2":        SHELL_2_MAX,
        "shell_2_eq_2D":  _SHELL_2_EQ_2D,
        "shell_2_formula": "2^D = 8",
        "shell_3":        SHELL_3_MAX,
        "shell_4":        SHELL_4_MAX,
        "shell_4_eq_2q":  _SHELL_4_EQ_2Q,
        "shell_4_formula": "2^q = 32",
        "total_orbitals_to_N": TOTAL_ORBITALS_TO_N,
        "total_eq_N2":    (TOTAL_ORBITALS_TO_N == N**2),
    }


def rydberg_analysis() -> dict:
    """Rydberg energy and Cathedral connection."""
    return {
        "rydberg_eV":           RYDBERG_EV,
        "N_cathedral":          N,
        "deviation_pct":        _RYDBERG_APPROX_N * 100,
        "rydberg_at_n13":       RYDBERG_N13,
        "note":                 f"E_1 = 13.606 eV ≈ N = {N} (Δ={_RYDBERG_APPROX_N*100:.1f}%, APPROXIMATE)",
    }


def atomic_summary() -> dict:
    """Full Cathedral atomic physics summary."""
    return {
        "quantum_numbers":   quantum_numbers(),
        "angular_momentum":  angular_momentum_states(),
        "shells":            shell_structure(),
        "rydberg":           rydberg_analysis(),
        "key_results": [
            f"Quantum numbers per electron = D+1 = {D+1}  [EXACT]",
            f"p-orbital states (l=1): 2l+1 = D = {D}  [EXACT]",
            f"d-orbital states (l=2): 2l+1 = q = {q}  [EXACT]",
            f"Shell n=2 max electrons = 2^D = {2**D}  [EXACT]",
            f"Shell n=4 max electrons = 2^q = {2**q}  [EXACT]",
            f"l=6 gives 2l+1 = N = {N} states  [EXACT]",
            f"Spin projections = D-1 = {D-1}  [EXACT]",
            f"Total orbitals to n=N: N² = {N**2}  [EXACT]",
            f"E_1 ≈ -N = -{N} eV (Rydberg ≈ N, Δ=4.5%)  [APPROXIMATE]",
        ],
    }


def print_atomic_report():
    """Print Cathedral atomic physics report."""
    print("  Cathedral Atomic Physics — Hydrogen, Orbitals, and Quantum Numbers")
    print("  " + "─" * 58)

    print(f"\n  Quantum Numbers:")
    print(f"    (n, l, m, s) = D+1 = {D+1} quantum numbers for an electron  ← EXACT")
    print(f"    Spin projections = D-1 = {D-1} (up, down)  ← EXACT")

    print(f"\n  Angular Momentum Substates (2l+1):")
    print(f"    l=1 (p): 2l+1 = D = {D}  ← EXACT")
    print(f"    l=2 (d): 2l+1 = q = {q}  ← EXACT")
    print(f"    l=4 (g): 2l+1 = N-D-1 = {N-D-1} = H₃ dim  ← EXACT")
    print(f"    l=6:     2l+1 = N = {N}  ← EXACT")
    print(f"    Total to n=N: Σ(2l+1) = N² = {N**2}  ← EXACT")

    print(f"\n  Shell Electron Populations 2n²:")
    print(f"    n=1: {SHELL_1_MAX} = D-1 = {D-1}  ← EXACT")
    print(f"    n=2: {SHELL_2_MAX} = 2^D = {2**D}  ← EXACT")
    print(f"    n=3: {SHELL_3_MAX} = 2×(N-D-1) = 2×{N-D-1}  ← EXACT")
    print(f"    n=4: {SHELL_4_MAX} = 2^q = {2**q}  ← EXACT")

    print(f"\n  Rydberg Energy:")
    print(f"    E_1 = {RYDBERG_EV} eV ≈ N = {N} eV  (Δ={_RYDBERG_APPROX_N*100:.1f}%)  [APPROXIMATE]")
    print(f"    E at n=N=13: {RYDBERG_N13:.4f} eV")

    print(f"\n  KEY: Shell populations {SHELL_2_MAX}=2^D, {SHELL_4_MAX}=2^q encode D and q!")
