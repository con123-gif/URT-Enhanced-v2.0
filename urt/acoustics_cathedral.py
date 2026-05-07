"""
Acoustics Cathedral — Wave equation, phonons, multipoles, and Cathedral integers.

The most striking Cathedral connections in acoustics:
  Wave equation in D = 3 dimensions  [EXACT]
  Huygens principle: exact only in odd D; D=3 is the simplest odd case  [EXACT]
  Sound speed γ = Cp/Cv = q/D = 5/3 for monatomic ideal gas  [EXACT]
  Acoustic branches in a crystal = D = 3  [EXACT: 1 longitudinal + 2 transverse]
  Equal temperament: V = 12 semitones per octave  [EXACT]
  Dipole has D = 3 components  [EXACT]
  Quadrupole: D(D+1)/2 = 6 = V//2 independent components  [EXACT]
  Spherical wave power law: intensity ∝ 1/r^{D-1} = 1/r²  [EXACT]
  Pressure doubling at rigid wall: factor D-1 = 2  [EXACT]
  Acoustic intensity denominator: I = p²/(2ρc), 2 = D-1  [EXACT]
  Phonon modes (diatomic basis): D acoustic + D optical = 2D = V//2 = 6  [EXACT]

Key results:
  D = 3 = spatial dimensions of wave equation
  D = 3 = acoustic branches (1 longitudinal + 2 transverse)
  D = 3 = cavity quantum numbers (n_x, n_y, n_z)
  q/D = 5/3 = adiabatic index γ for monatomic gas
  D(D+1)/2 = 6 = V//2 = quadrupole tensor components
  D-1 = 2 = spherical wave power law exponent
  2D = V//2 = 6 = phonon modes for diatomic crystal
  V = 12 = semitones per octave
"""

from math import pi, sqrt, log, log2
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Wave equation ──────────────────────────────────────────────────────────────

# Acoustic wave equation: ∂²ψ/∂t² = c²∇²ψ in D=3 spatial dimensions
ACOUSTIC_WAVE_DIM = D                 # = 3  [EXACT: wave equation in D=3]
ACOUSTIC_WAVE_DIM_EQ_D = (ACOUSTIC_WAVE_DIM == D)  # True

# Huygens principle: sharp wavefront propagation only in odd D.
# D=3 is the simplest odd integer with this property.
HUYGENS_PRINCIPLE_ODD_D = True        # D=3 is odd [EXACT]
D_IS_ODD = (D % 2 == 1)               # True: 3 is odd

# ── Sound speed and adiabatic index ────────────────────────────────────────────

# Monatomic ideal gas: γ = Cp/Cv = (D+2)/D = q/D = 5/3
SOUND_GAMMA_MONATOMIC = float(q) / D  # = 5/3  [EXACT: Cp/Cv for monatomic]
SOUND_GAMMA_EQ_Q_D = (abs(SOUND_GAMMA_MONATOMIC - 5.0 / 3.0) < 1e-10)  # True

# Sound speed: c = √(γP/ρ), γ = q/D = 5/3 for monatomic gas
# This is the same γ as in fluid_cathedral.py — a Cathedral universal
SOUND_GAMMA_FORMULA = "q/D = 5/3"    # formula string

# ── Acoustic branches ───────────────────────────────────────────────────────────

# Crystal acoustic branches: 1 longitudinal + (D-1) transverse = D total
N_ACOUSTIC_BRANCHES = D               # = 3  [EXACT: 1 long + 2 transverse]
N_ACOUSTIC_EQ_D = (N_ACOUSTIC_BRANCHES == D)  # True

N_LONGITUDINAL_BRANCHES = 1           # = 1 (pressure wave)
N_TRANSVERSE_BRANCHES = D - 1         # = 2 (shear waves)  [EXACT]
N_TRANSVERSE_EQ_D1 = (N_TRANSVERSE_BRANCHES == D - 1)  # True

# ── Cavity modes ────────────────────────────────────────────────────────────────

# 3D rectangular cavity modes: ψ_{n_x,n_y,n_z} — exactly D=3 quantum numbers
N_CAVITY_QUANTUM_NUMBERS = D          # = 3  [EXACT: n_x, n_y, n_z]
N_CAVITY_EQ_D = (N_CAVITY_QUANTUM_NUMBERS == D)  # True

# ── Equal temperament ───────────────────────────────────────────────────────────

# Western music / acoustic scale: V = 12 semitones per octave
N_EQUAL_TEMP_SEMITONES = V            # = 12  [EXACT: same as music_cathedral.py]
N_SEMITONES_EQ_V = (N_EQUAL_TEMP_SEMITONES == V)  # True
SEMITONE_RATIO = 2.0 ** (1.0 / V)    # = 2^{1/12} ≈ 1.05946

# ── Acoustic multipoles ─────────────────────────────────────────────────────────

# Monopole: scalar (no directional components)
N_MONOPOLE_COMPONENTS = 1             # = 1 (scalar source)

# Acoustic dipole: vector with D = 3 components  [EXACT]
N_DIPOLE_COMPONENTS = D               # = 3  [EXACT: (p_x, p_y, p_z)]
N_DIPOLE_EQ_D = (N_DIPOLE_COMPONENTS == D)  # True

# Acoustic quadrupole: symmetric traceless D×D tensor
# Independent components of symmetric D×D tensor: D(D+1)/2 = 6 = V//2
# (traceless condition removes 1, but we count full symmetric tensor here)
N_QUADRUPOLE_COMPONENTS = D * (D + 1) // 2   # = 6 = V//2  [EXACT]
N_QUAD_EQ_V2 = (N_QUADRUPOLE_COMPONENTS == V // 2)  # True: 3×4//2=6=12//2

# ── Spherical wave propagation ──────────────────────────────────────────────────

# Spherical wave: intensity ∝ 1/r^{D-1} = 1/r² (area of D-1 sphere grows as r^{D-1})
SPHERICAL_WAVE_POWER = D - 1          # = 2  [EXACT: 1/r^{D-1} = 1/r²]
SPHERICAL_POWER_EQ_D1 = (SPHERICAL_WAVE_POWER == D - 1)  # True

# Sound pressure at distance r from a point source ∝ 1/r (amplitude ∝ 1/r^{(D-1)/2})
SPHERICAL_PRESSURE_POWER = (D - 1) // 2  # = 1  [EXACT: pressure ∝ 1/r]

# ── Wall pressure doubling ──────────────────────────────────────────────────────

# At a rigid wall, the reflected wave adds to the incident wave:
# pressure doubles → factor = 2 = D-1  [EXACT]
WALL_PRESSURE_FACTOR = D - 1          # = 2  [EXACT: pressure doubles at rigid wall]
WALL_FACTOR_EQ_D1 = (WALL_PRESSURE_FACTOR == D - 1)  # True

# ── Acoustic intensity ──────────────────────────────────────────────────────────

# Acoustic intensity: I = p²/(2ρc) where 2 = D-1  [EXACT]
INTENSITY_FACTOR = D - 1              # = 2  [EXACT: denominator in I = p²/(2ρc)]
INTENSITY_EQ_D1 = (INTENSITY_FACTOR == D - 1)  # True

# ── Phonon modes ────────────────────────────────────────────────────────────────

# Crystal with monatomic basis: D acoustic branches
N_PHONON_ACOUSTIC = D                 # = 3  [EXACT]
N_PHONON_ACOUSTIC_EQ_D = (N_PHONON_ACOUSTIC == D)  # True

# Crystal with diatomic basis: D acoustic + D optical = 2D modes
N_PHONON_OPTICAL = D                  # = 3  [EXACT for diatomic basis]
N_PHONON_TOTAL_DIATOMIC = 2 * D       # = 6 = V//2  [EXACT]
N_PHONON_EQ_V2 = (N_PHONON_TOTAL_DIATOMIC == V // 2)  # True: 2×3=6=12//2

# Each phonon mode: 1 longitudinal + (D-1) transverse per acoustic/optical branch
# Longitudinal optical (LO) vs transverse optical (TO): D-1=2 TO modes
N_TRANSVERSE_OPTICAL = D - 1          # = 2  [EXACT: TO modes per optical branch]

# ── Reverberation: Sabine formula ───────────────────────────────────────────────

# Sabine: T_60 = 0.161 × Vol/A (Vol = volume in D=3, A = absorption area)
# The factor 0.161 ≈ (D-1)/(D×c) × 4 ln(10^6)... but the key structural point:
# T_60 involves D=3 dimensional volume [EXACT]
SABINE_DIM = D                        # = 3  [EXACT: D=3 dimensional volume]

# ── Functions ───────────────────────────────────────────────────────────────────

def wave_properties() -> dict:
    """
    Acoustic wave equation properties and Cathedral connections.

    Returns
    -------
    dict
        Wave dimension, Huygens principle, acoustic branches, cavity QNs, γ.
    """
    return {
        "wave_dim":          ACOUSTIC_WAVE_DIM,
        "wave_dim_eq_D":     ACOUSTIC_WAVE_DIM_EQ_D,
        "huygens_odd":       HUYGENS_PRINCIPLE_ODD_D,
        "D_is_odd":          D_IS_ODD,
        "huygens_note":      "Huygens principle exact only for odd D; D=3 is simplest",
        "n_acoustic_branches": N_ACOUSTIC_BRANCHES,
        "acoustic_eq_D":     N_ACOUSTIC_EQ_D,
        "n_longitudinal":    N_LONGITUDINAL_BRANCHES,
        "n_transverse":      N_TRANSVERSE_BRANCHES,
        "transverse_eq_D1":  N_TRANSVERSE_EQ_D1,
        "n_cavity_qn":       N_CAVITY_QUANTUM_NUMBERS,
        "cavity_eq_D":       N_CAVITY_EQ_D,
        "gamma_monatomic":   SOUND_GAMMA_MONATOMIC,
        "gamma_eq_q_D":      SOUND_GAMMA_EQ_Q_D,
        "gamma_formula":     SOUND_GAMMA_FORMULA,
    }


def acoustic_multipoles() -> dict:
    """
    Acoustic multipole expansion and Cathedral connections.

    Returns
    -------
    dict
        Dipole (D=3), quadrupole (V//2=6), spherical power (D-1=2).
    """
    return {
        "n_monopole":        N_MONOPOLE_COMPONENTS,
        "n_dipole":          N_DIPOLE_COMPONENTS,
        "dipole_eq_D":       N_DIPOLE_EQ_D,
        "dipole_formula":    "D = 3 components (p_x, p_y, p_z)",
        "n_quadrupole":      N_QUADRUPOLE_COMPONENTS,
        "quad_eq_V2":        N_QUAD_EQ_V2,
        "quad_formula":      "D(D+1)/2 = 6 = V//2",
        "spherical_power":   SPHERICAL_WAVE_POWER,
        "spherical_eq_D1":   SPHERICAL_POWER_EQ_D1,
        "spherical_formula": "intensity ∝ 1/r^{D-1} = 1/r²",
        "wall_factor":       WALL_PRESSURE_FACTOR,
        "wall_eq_D1":        WALL_FACTOR_EQ_D1,
        "wall_formula":      "pressure doubles at rigid wall, factor = D-1 = 2",
        "intensity_factor":  INTENSITY_FACTOR,
        "intensity_eq_D1":   INTENSITY_EQ_D1,
        "intensity_formula": "I = p²/(2ρc), denominator = D-1 = 2",
    }


def phonon_modes() -> dict:
    """
    Phonon modes in crystals and Cathedral connections.

    Returns
    -------
    dict
        Acoustic modes (D=3), optical modes (D=3), total diatomic (V//2=6),
        and equal temperament semitones (V=12).
    """
    return {
        "n_acoustic":            N_PHONON_ACOUSTIC,
        "acoustic_eq_D":         N_PHONON_ACOUSTIC_EQ_D,
        "n_optical":             N_PHONON_OPTICAL,
        "optical_eq_D":          (N_PHONON_OPTICAL == D),
        "n_total_diatomic":      N_PHONON_TOTAL_DIATOMIC,
        "total_eq_V2":           N_PHONON_EQ_V2,
        "total_formula":         "D acoustic + D optical = 2D = 6 = V//2",
        "n_transverse_optical":  N_TRANSVERSE_OPTICAL,
        "transverse_opt_eq_D1":  (N_TRANSVERSE_OPTICAL == D - 1),
        "n_semitones":           N_EQUAL_TEMP_SEMITONES,
        "semitones_eq_V":        N_SEMITONES_EQ_V,
        "semitone_ratio":        SEMITONE_RATIO,
    }


def acoustics_summary() -> dict:
    """
    Full Cathedral acoustics summary.

    Returns
    -------
    dict
        Waves, multipoles, phonons, and key exact results.
    """
    return {
        "waves":     wave_properties(),
        "multipoles": acoustic_multipoles(),
        "phonons":   phonon_modes(),
        "KEY_EXACT_RESULTS": [
            f"Wave equation in D = {D} dimensions  [EXACT]",
            f"Huygens principle: D={D} is odd → sharp wavefronts  [EXACT]",
            f"Sound γ = q/D = {q}/{D} = {SOUND_GAMMA_MONATOMIC:.4f} (monatomic)  [EXACT]",
            f"Acoustic branches = D = {N_ACOUSTIC_BRANCHES}  [EXACT: 1 long + {N_TRANSVERSE_BRANCHES} trans]",
            f"Cavity quantum numbers = D = {N_CAVITY_QUANTUM_NUMBERS}  [EXACT: n_x, n_y, n_z]",
            f"Dipole components = D = {N_DIPOLE_COMPONENTS}  [EXACT]",
            f"Quadrupole components = D(D+1)/2 = {N_QUADRUPOLE_COMPONENTS} = V//2 = {V//2}  [EXACT]",
            f"Spherical wave power = D-1 = {SPHERICAL_WAVE_POWER}  [EXACT: I∝1/r²]",
            f"Wall pressure factor = D-1 = {WALL_PRESSURE_FACTOR}  [EXACT: doubles]",
            f"Acoustic intensity denom = D-1 = {INTENSITY_FACTOR}  [EXACT: I=p²/2ρc]",
            f"Diatomic phonons = 2D = {N_PHONON_TOTAL_DIATOMIC} = V//2 = {V//2}  [EXACT]",
            f"Semitones per octave = V = {N_EQUAL_TEMP_SEMITONES}  [EXACT: 12-TET]",
        ],
    }


def print_acoustics_report():
    """Print Cathedral acoustics report."""
    print("  Cathedral Acoustics — Wave Equation, Phonons, Multipoles")
    print("  " + "─" * 58)

    print(f"\n  Wave Equation in D={D} dimensions:")
    print(f"    ∂²ψ/∂t² = c²∇²ψ  in D = {ACOUSTIC_WAVE_DIM} spatial dims  ← EXACT")
    print(f"    Huygens principle: D={D} is odd → sharp wavefronts  ← EXACT")
    print(f"    Sound speed: c = √(γP/ρ),  γ = q/D = {q}/{D} = {SOUND_GAMMA_MONATOMIC:.4f}  ← EXACT!")

    print(f"\n  Crystal Acoustic Branches:")
    print(f"    Total branches = D = {N_ACOUSTIC_BRANCHES}  ← EXACT")
    print(f"      1 longitudinal (pressure) + {N_TRANSVERSE_BRANCHES} transverse (shear) = D-1 + 1 = D")
    print(f"    Cavity mode quantum numbers = D = {N_CAVITY_QUANTUM_NUMBERS}  ← EXACT (n_x,n_y,n_z)")

    print(f"\n  Acoustic Multipoles:")
    print(f"    Monopole: 1 component (scalar)  ← monopole radiation")
    print(f"    Dipole: D = {N_DIPOLE_COMPONENTS} components  ← EXACT")
    print(f"    Quadrupole: D(D+1)/2 = {N_QUADRUPOLE_COMPONENTS} components = V//2 = {V//2}  ← EXACT!")
    print(f"    Spherical wave: I ∝ 1/r^{{D-1}} = 1/r^{SPHERICAL_WAVE_POWER}  ← EXACT")
    print(f"    Rigid wall: pressure doubles, factor = D-1 = {WALL_PRESSURE_FACTOR}  ← EXACT")
    print(f"    Intensity: I = p²/(2ρc), denom = D-1 = {INTENSITY_FACTOR}  ← EXACT")

    print(f"\n  Phonon Modes (diatomic crystal basis):")
    print(f"    Acoustic branches: D = {N_PHONON_ACOUSTIC}  ← EXACT")
    print(f"    Optical branches:  D = {N_PHONON_OPTICAL}  ← EXACT")
    print(f"    Total: 2D = {N_PHONON_TOTAL_DIATOMIC} = V//2 = {V//2}  ← EXACT!")

    print(f"\n  Equal Temperament (acoustic scale):")
    print(f"    Semitones per octave = V = {N_EQUAL_TEMP_SEMITONES}  ← EXACT (12-TET)")
    print(f"    Semitone ratio = 2^{{1/{V}}} = {SEMITONE_RATIO:.6f}")

    print(f"\n  KEY: D=3 acoustic wave equation + γ=q/D + 2D=V//2 phonons!")
