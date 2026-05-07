"""
Quantum Optics Cathedral — Quantum light-matter interactions and Cathedral integers.

Cathedral connections to quantum optics:

1. Bloch sphere — S² requires D=3 dimensions  [EXACT]:
   A qubit state lives on the Bloch sphere S² embedded in R^D=R^3.
   The Bloch sphere is only definable because D=3.

2. SU(2) generators — σ_x, σ_y, σ_z form D=3 Pauli matrices  [EXACT]:
   The Lie algebra su(2) has exactly D=3 generators.

3. Two-mode squeezing — requires D-1=2 modes  [EXACT]:
   Two-mode squeezed states involve exactly D-1=2 modes.

4. Jaynes-Cummings coupling — g = δ★  [Cathedral assignment]:
   The light-matter coupling constant in the Jaynes-Cummings model is set
   to g = δ★ in the Cathedral framework.

5. Icosahedral photon number truncation — N=13  [EXACT structure]:
   The truncated Fock space for the icosahedral coherent state has N=13
   photon number states |0⟩, |1⟩, ..., |N-1⟩.

6. Lamb-Dicke parameter — η = δ★  [Cathedral assignment]:
   The Lamb-Dicke parameter for trapped ion quantum optics is set to η = δ★.

7. Wigner function phase space — D-1=2 dimensional  [EXACT]:
   The Wigner quasi-probability distribution lives in 2D phase space (x, p).

Key Cathedral facts:
  FOCK_VACUUM_N            = 0           [ground state: no photons]
  N_QUBIT_BLOCH_DIMS       = D = 3       [EXACT: Bloch sphere lives in R^3]
  N_SU2_GENERATORS         = D = 3       [EXACT: σ_x, σ_y, σ_z]
  N_MODES_SQUEEZED         = D - 1 = 2   [EXACT: two-mode squeezing]
  BEAM_SPLITTER_MODES      = D - 1 = 2   [EXACT: beam splitter mixes 2 modes]
  WIGNER_FUNCTION_PHASE_DIM= D - 1 = 2   [EXACT: Wigner on 2D phase space]
  JAYNES_CUMMINGS_COUPLING = δ★          [Cathedral: g = δ★]
  N_PHOTON_NUMBER_STATES_ICOS = N = 13   [icosahedral truncated Fock space]
  LAMB_DICKE_PARAM         = δ★          [Cathedral: η = δ★]
  HONG_OU_MANDEL_DIP       = 1.0         [perfect HOM dip, indistinguishable photons]
  COHERENT_STATE_POISSON_MEAN = N = 13   [icosahedral coherent state |α|²=N]
"""

from math import pi, sqrt, exp, factorial
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Fock space ground state ───────────────────────────────────────────────────
# The vacuum state |0⟩: zero photons
FOCK_VACUUM_N = 0

# ── Bloch sphere geometry ─────────────────────────────────────────────────────
# A qubit |ψ⟩ = cos(θ/2)|0⟩ + e^{iφ}sin(θ/2)|1⟩ lives on S² ⊂ R^D  [EXACT]
N_QUBIT_BLOCH_DIMS = D  # = 3

# ── SU(2) generators ──────────────────────────────────────────────────────────
# su(2) Lie algebra: {σ_x, σ_y, σ_z} — exactly D=3 Pauli matrices  [EXACT]
N_SU2_GENERATORS = D  # = 3

# ── Coherent state ────────────────────────────────────────────────────────────
# Icosahedral coherent state: Poisson distribution with mean |α|² = N = 13
COHERENT_STATE_POISSON_MEAN = N  # = 13

# ── Mode counting ─────────────────────────────────────────────────────────────
# Two-mode squeezing: involves exactly D-1=2 modes  [EXACT]
N_MODES_SQUEEZED = D - 1  # = 2

# Beam splitter: mixes exactly D-1=2 input modes  [EXACT]
BEAM_SPLITTER_MODES = D - 1  # = 2

# Wigner function: quasi-probability on 2D phase space (x, p)  [EXACT]
WIGNER_FUNCTION_PHASE_DIM = D - 1  # = 2

# ── Jaynes-Cummings model ─────────────────────────────────────────────────────
# H_JC = ℏω_c a†a + ℏω_a σ_z/2 + ℏg(a†σ_- + aσ_+)
# Cathedral: coupling constant g = δ★
JAYNES_CUMMINGS_COUPLING = DELTA_STAR  # = δ★ ≈ 0.14751

# ── Icosahedral photon number truncation ──────────────────────────────────────
# Truncated Fock space: {|0⟩, |1⟩, ..., |N-1⟩} with N=13 states
N_PHOTON_NUMBER_STATES_ICOS = N  # = 13

# ── Lamb-Dicke parameter ──────────────────────────────────────────────────────
# η = k·x_zpf = x_zpf·√(mω/ℏ) — Cathedral assignment: η = δ★
LAMB_DICKE_PARAM = DELTA_STAR  # = δ★ ≈ 0.14751

# ── Hong-Ou-Mandel effect ─────────────────────────────────────────────────────
# Perfect two-photon interference: indistinguishable photons → dip = 1.0
HONG_OU_MANDEL_DIP = 1.0

# ── Squeezing parameter ───────────────────────────────────────────────────────
# Cathedral squeezing: r = δ★ → quadrature variance below shot noise
SQUEEZING_PARAM = DELTA_STAR  # r = δ★

# ── Cavity QED ────────────────────────────────────────────────────────────────
# Rabi frequency: Ω_R = 2g = 2δ★ (resonant driving)
RABI_FREQ_NORMALIZED = 2.0 * DELTA_STAR

# Purcell factor: F_P = (3/4π²)(λ/n)³(Q/V_mode) — cavity enhancement
# Cathedral: dominant factor = N = 13 (icosahedral cavity)
PURCELL_ICOS_MODES = N  # = 13

# ── Photon statistics ─────────────────────────────────────────────────────────
# Mandel Q parameter: Q = 0 → Poissonian (coherent), Q < 0 → sub-Poissonian
# Cathedral coherent state has Q = 0, <n> = N = 13
MANDEL_Q_COHERENT = 0.0
COHERENT_MEAN_PHOTON_N = float(N)  # = 13.0

# ── Quantum efficiency ────────────────────────────────────────────────────────
# Cathedral detector efficiency: η_det = 1 - δ★ ≈ 0.8525
QUANTUM_EFFICIENCY = 1.0 - DELTA_STAR  # ≈ 0.8525


def bloch_sphere():
    """
    Bloch sphere geometry for a qubit.

    Returns
    -------
    dict with keys:
        bloch_dims       : int — dimension of embedding space = D = 3
        bloch_dims_eq_D  : bool — True (D=3 is EXACT)
        su2_generators   : int — number of Pauli matrices = D = 3
        su2_eq_D         : bool — True (EXACT)
        sphere_dim       : int — S² has dim = D-1 = 2
        modes_squeezed   : int — two-mode squeezing = D-1 = 2
    """
    return {
        "bloch_dims": N_QUBIT_BLOCH_DIMS,
        "bloch_dims_eq_D": N_QUBIT_BLOCH_DIMS == D,
        "su2_generators": N_SU2_GENERATORS,
        "su2_eq_D": N_SU2_GENERATORS == D,
        "sphere_dim": D - 1,
        "modes_squeezed": N_MODES_SQUEEZED,
        "modes_squeezed_eq_D1": N_MODES_SQUEEZED == D - 1,
        "wigner_phase_dim": WIGNER_FUNCTION_PHASE_DIM,
        "beam_splitter_modes": BEAM_SPLITTER_MODES,
    }


def jaynes_cummings():
    """
    Jaynes-Cummings model with Cathedral coupling.

    Returns
    -------
    dict with keys:
        coupling         : float — g = δ★
        modes            : int — D-1 = 2
        rabi_freq        : float — 2g = 2δ★
        lamb_dicke       : float — η = δ★
        fock_truncation  : int — N = 13
        photon_mean      : float — |α|² = N = 13
        hom_dip          : float — 1.0 (perfect)
        coupling_eq_delta: bool — True
    """
    return {
        "coupling": JAYNES_CUMMINGS_COUPLING,
        "coupling_eq_delta": abs(JAYNES_CUMMINGS_COUPLING - DELTA_STAR) < 1e-12,
        "modes": N_MODES_SQUEEZED,
        "rabi_freq": RABI_FREQ_NORMALIZED,
        "lamb_dicke": LAMB_DICKE_PARAM,
        "lamb_dicke_eq_delta": abs(LAMB_DICKE_PARAM - DELTA_STAR) < 1e-12,
        "fock_truncation": N_PHOTON_NUMBER_STATES_ICOS,
        "fock_eq_N": N_PHOTON_NUMBER_STATES_ICOS == N,
        "photon_mean": COHERENT_MEAN_PHOTON_N,
        "hom_dip": HONG_OU_MANDEL_DIP,
        "squeezing_param": SQUEEZING_PARAM,
    }


def coherent_state_distribution(n_max=None):
    """
    Poisson photon number distribution for the icosahedral coherent state |α⟩
    with |α|² = N = 13.

    Parameters
    ----------
    n_max : int, optional
        Maximum photon number. Defaults to N_PHOTON_NUMBER_STATES_ICOS = 13.

    Returns
    -------
    list of floats — P(n) = e^{-N} N^n / n! for n = 0, ..., n_max
    """
    if n_max is None:
        n_max = N_PHOTON_NUMBER_STATES_ICOS
    lam = float(N)
    probs = []
    for n in range(n_max + 1):
        p = exp(-lam) * (lam ** n) / factorial(n)
        probs.append(p)
    return probs


def quantum_optics_summary():
    """
    Full summary of Cathedral quantum optics connections.

    Returns
    -------
    dict with keys:
        "bloch"       : dict from bloch_sphere()
        "jc"          : dict from jaynes_cummings()
        "key_results" : list of strings describing exact connections
    """
    bloch = bloch_sphere()
    jc = jaynes_cummings()

    key_results = [
        f"Bloch sphere dims = D = {D}  [EXACT: qubit lives on S² in R^D=R^3]",
        f"SU(2) generators = D = {D}  [EXACT: Pauli matrices σ_x,σ_y,σ_z]",
        f"Two-mode squeezing = D-1 = {D-1}  [EXACT]",
        f"Wigner phase space dim = D-1 = {D-1}  [EXACT: (x,p) plane]",
        f"Beam splitter modes = D-1 = {D-1}  [EXACT]",
        f"JC coupling g = δ★ = {DELTA_STAR:.6f}  [Cathedral]",
        f"Lamb-Dicke η = δ★ = {DELTA_STAR:.6f}  [Cathedral]",
        f"Fock truncation = N = {N}  [icosahedral photon states]",
        f"Coherent state mean = N = {N}  [icosahedral |α|²=N]",
        f"HOM dip = {HONG_OU_MANDEL_DIP}  [perfect bunching]",
    ]

    return {
        "bloch": bloch,
        "jc": jc,
        "key_results": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_quantum_optics_report():
    """Print a formatted report of Cathedral quantum optics connections."""
    s = quantum_optics_summary()
    print("=" * 65)
    print("  QUANTUM OPTICS CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Bloch sphere / SU(2):")
    print(f"    Bloch sphere dims    = D = {D}     [EXACT]")
    print(f"    SU(2) generators     = D = {D}     [EXACT: Pauli σ_x,σ_y,σ_z]")
    print(f"    Two-mode squeezing   = D-1 = {D-1}   [EXACT]")
    print(f"    Wigner phase dim     = D-1 = {D-1}   [EXACT]")
    print(f"    Beam splitter modes  = D-1 = {D-1}   [EXACT]")
    print()
    print("  Jaynes-Cummings / Cavity QED:")
    print(f"    JC coupling g        = δ★ = {DELTA_STAR:.6f}")
    print(f"    Lamb-Dicke param η   = δ★ = {DELTA_STAR:.6f}")
    print(f"    Rabi frequency Ω_R   = 2δ★ = {RABI_FREQ_NORMALIZED:.6f}")
    print(f"    Fock truncation      = N = {N}    [icosahedral]")
    print()
    print("  Photon statistics:")
    print(f"    Coherent state mean  = N = {N}    [Poissonian |α|²=N]")
    print(f"    HOM dip              = {HONG_OU_MANDEL_DIP}  [perfect indistinguishability]")
    print(f"    Detector efficiency  = 1-δ★ = {QUANTUM_EFFICIENCY:.6f}")
    print()
    print("  Key results:")
    for r in s["key_results"]:
        print(f"    {r}")
    print("=" * 65)
