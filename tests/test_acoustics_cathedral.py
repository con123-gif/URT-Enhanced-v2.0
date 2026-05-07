"""Tests for urt/acoustics_cathedral.py — Wave equation, phonons, multipoles, Cathedral integers."""

import pytest
from math import pi, sqrt, isclose, isfinite, log2


# ── Import test ────────────────────────────────────────────────────────────────

def test_imports():
    from urt.acoustics_cathedral import (
        ACOUSTIC_WAVE_DIM, ACOUSTIC_WAVE_DIM_EQ_D,
        HUYGENS_PRINCIPLE_ODD_D, D_IS_ODD,
        SOUND_GAMMA_MONATOMIC, SOUND_GAMMA_EQ_Q_D,
        N_ACOUSTIC_BRANCHES, N_ACOUSTIC_EQ_D,
        N_LONGITUDINAL_BRANCHES, N_TRANSVERSE_BRANCHES, N_TRANSVERSE_EQ_D1,
        N_CAVITY_QUANTUM_NUMBERS, N_CAVITY_EQ_D,
        N_EQUAL_TEMP_SEMITONES, N_SEMITONES_EQ_V, SEMITONE_RATIO,
        N_MONOPOLE_COMPONENTS, N_DIPOLE_COMPONENTS, N_DIPOLE_EQ_D,
        N_QUADRUPOLE_COMPONENTS, N_QUAD_EQ_V2,
        SPHERICAL_WAVE_POWER, SPHERICAL_POWER_EQ_D1,
        WALL_PRESSURE_FACTOR, WALL_FACTOR_EQ_D1,
        INTENSITY_FACTOR, INTENSITY_EQ_D1,
        N_PHONON_ACOUSTIC, N_PHONON_ACOUSTIC_EQ_D,
        N_PHONON_OPTICAL, N_PHONON_TOTAL_DIATOMIC, N_PHONON_EQ_V2,
        N_TRANSVERSE_OPTICAL,
        wave_properties, acoustic_multipoles, phonon_modes,
        acoustics_summary, print_acoustics_report,
    )


# ── Wave equation ──────────────────────────────────────────────────────────────

def test_acoustic_wave_dim_eq_D():
    """Wave equation is in D = 3 spatial dimensions."""
    from urt.acoustics_cathedral import ACOUSTIC_WAVE_DIM, ACOUSTIC_WAVE_DIM_EQ_D
    from urt.shell_closure import D
    assert ACOUSTIC_WAVE_DIM == D
    assert ACOUSTIC_WAVE_DIM == 3
    assert ACOUSTIC_WAVE_DIM_EQ_D is True


def test_huygens_principle_odd_D():
    """Huygens principle is exact only in odd D; D=3 is odd."""
    from urt.acoustics_cathedral import HUYGENS_PRINCIPLE_ODD_D, D_IS_ODD
    from urt.shell_closure import D
    assert HUYGENS_PRINCIPLE_ODD_D is True
    assert D_IS_ODD is True
    assert D % 2 == 1


# ── Sound speed / adiabatic index ─────────────────────────────────────────────

def test_sound_gamma_eq_q_over_D():
    """Monatomic γ = q/D = 5/3 EXACT."""
    from urt.acoustics_cathedral import SOUND_GAMMA_MONATOMIC, SOUND_GAMMA_EQ_Q_D
    from urt.shell_closure import D, q
    assert abs(SOUND_GAMMA_MONATOMIC - float(q) / D) < 1e-12
    assert abs(SOUND_GAMMA_MONATOMIC - 5.0 / 3.0) < 1e-10
    assert SOUND_GAMMA_EQ_Q_D is True


def test_sound_gamma_value():
    """γ for monatomic gas is approximately 1.6667."""
    from urt.acoustics_cathedral import SOUND_GAMMA_MONATOMIC
    assert abs(SOUND_GAMMA_MONATOMIC - 1.6666666666666667) < 1e-10


# ── Acoustic branches ─────────────────────────────────────────────────────────

def test_n_acoustic_branches_eq_D():
    """Acoustic branches in crystal = D = 3 EXACT."""
    from urt.acoustics_cathedral import N_ACOUSTIC_BRANCHES, N_ACOUSTIC_EQ_D
    from urt.shell_closure import D
    assert N_ACOUSTIC_BRANCHES == D
    assert N_ACOUSTIC_BRANCHES == 3
    assert N_ACOUSTIC_EQ_D is True


def test_n_longitudinal_branches():
    """Exactly 1 longitudinal acoustic branch."""
    from urt.acoustics_cathedral import N_LONGITUDINAL_BRANCHES
    assert N_LONGITUDINAL_BRANCHES == 1


def test_n_transverse_branches_eq_D1():
    """Transverse acoustic branches = D-1 = 2 EXACT."""
    from urt.acoustics_cathedral import N_TRANSVERSE_BRANCHES, N_TRANSVERSE_EQ_D1
    from urt.shell_closure import D
    assert N_TRANSVERSE_BRANCHES == D - 1
    assert N_TRANSVERSE_BRANCHES == 2
    assert N_TRANSVERSE_EQ_D1 is True


def test_branches_add_up():
    """Longitudinal + transverse = total acoustic branches."""
    from urt.acoustics_cathedral import N_LONGITUDINAL_BRANCHES, N_TRANSVERSE_BRANCHES, N_ACOUSTIC_BRANCHES
    assert N_LONGITUDINAL_BRANCHES + N_TRANSVERSE_BRANCHES == N_ACOUSTIC_BRANCHES


# ── Cavity quantum numbers ────────────────────────────────────────────────────

def test_n_cavity_quantum_numbers_eq_D():
    """3D cavity has D = 3 quantum numbers (n_x, n_y, n_z)."""
    from urt.acoustics_cathedral import N_CAVITY_QUANTUM_NUMBERS, N_CAVITY_EQ_D
    from urt.shell_closure import D
    assert N_CAVITY_QUANTUM_NUMBERS == D
    assert N_CAVITY_QUANTUM_NUMBERS == 3
    assert N_CAVITY_EQ_D is True


# ── Equal temperament ─────────────────────────────────────────────────────────

def test_n_semitones_eq_V():
    """Equal temperament: V = 12 semitones per octave EXACT."""
    from urt.acoustics_cathedral import N_EQUAL_TEMP_SEMITONES, N_SEMITONES_EQ_V
    from urt.shell_closure import V
    assert N_EQUAL_TEMP_SEMITONES == V
    assert N_EQUAL_TEMP_SEMITONES == 12
    assert N_SEMITONES_EQ_V is True


def test_semitone_ratio():
    """Semitone ratio = 2^{1/12}."""
    from urt.acoustics_cathedral import SEMITONE_RATIO, N_EQUAL_TEMP_SEMITONES
    expected = 2.0 ** (1.0 / N_EQUAL_TEMP_SEMITONES)
    assert abs(SEMITONE_RATIO - expected) < 1e-12
    assert 1.05 < SEMITONE_RATIO < 1.06


# ── Dipole ────────────────────────────────────────────────────────────────────

def test_n_dipole_components_eq_D():
    """Acoustic dipole has D = 3 components EXACT."""
    from urt.acoustics_cathedral import N_DIPOLE_COMPONENTS, N_DIPOLE_EQ_D
    from urt.shell_closure import D
    assert N_DIPOLE_COMPONENTS == D
    assert N_DIPOLE_COMPONENTS == 3
    assert N_DIPOLE_EQ_D is True


def test_n_monopole_components():
    """Acoustic monopole has 1 component (scalar)."""
    from urt.acoustics_cathedral import N_MONOPOLE_COMPONENTS
    assert N_MONOPOLE_COMPONENTS == 1


# ── Quadrupole ────────────────────────────────────────────────────────────────

def test_n_quadrupole_components_eq_V2():
    """Acoustic quadrupole: D(D+1)/2 = 6 = V//2 components EXACT."""
    from urt.acoustics_cathedral import N_QUADRUPOLE_COMPONENTS, N_QUAD_EQ_V2
    from urt.shell_closure import D, V
    assert N_QUADRUPOLE_COMPONENTS == D * (D + 1) // 2
    assert N_QUADRUPOLE_COMPONENTS == V // 2
    assert N_QUADRUPOLE_COMPONENTS == 6
    assert N_QUAD_EQ_V2 is True


def test_quadrupole_formula():
    """Quadrupole formula D(D+1)/2 evaluated for D=3."""
    from urt.shell_closure import D
    assert D * (D + 1) // 2 == 6


# ── Spherical wave ────────────────────────────────────────────────────────────

def test_spherical_wave_power_eq_D1():
    """Spherical wave intensity ∝ 1/r^{D-1} = 1/r² EXACT."""
    from urt.acoustics_cathedral import SPHERICAL_WAVE_POWER, SPHERICAL_POWER_EQ_D1
    from urt.shell_closure import D
    assert SPHERICAL_WAVE_POWER == D - 1
    assert SPHERICAL_WAVE_POWER == 2
    assert SPHERICAL_POWER_EQ_D1 is True


# ── Wall pressure ─────────────────────────────────────────────────────────────

def test_wall_pressure_factor_eq_D1():
    """Pressure doubles at rigid wall: factor = D-1 = 2 EXACT."""
    from urt.acoustics_cathedral import WALL_PRESSURE_FACTOR, WALL_FACTOR_EQ_D1
    from urt.shell_closure import D
    assert WALL_PRESSURE_FACTOR == D - 1
    assert WALL_PRESSURE_FACTOR == 2
    assert WALL_FACTOR_EQ_D1 is True


# ── Acoustic intensity ────────────────────────────────────────────────────────

def test_intensity_factor_eq_D1():
    """Acoustic intensity denominator = D-1 = 2 EXACT (I = p²/2ρc)."""
    from urt.acoustics_cathedral import INTENSITY_FACTOR, INTENSITY_EQ_D1
    from urt.shell_closure import D
    assert INTENSITY_FACTOR == D - 1
    assert INTENSITY_FACTOR == 2
    assert INTENSITY_EQ_D1 is True


def test_wall_intensity_factor_same():
    """Wall pressure factor and intensity factor are the same: D-1 = 2."""
    from urt.acoustics_cathedral import WALL_PRESSURE_FACTOR, INTENSITY_FACTOR
    assert WALL_PRESSURE_FACTOR == INTENSITY_FACTOR


def test_spherical_power_eq_wall_factor():
    """Spherical wave power exponent = wall pressure factor = D-1 = 2."""
    from urt.acoustics_cathedral import SPHERICAL_WAVE_POWER, WALL_PRESSURE_FACTOR
    assert SPHERICAL_WAVE_POWER == WALL_PRESSURE_FACTOR


# ── Phonon modes ──────────────────────────────────────────────────────────────

def test_n_phonon_acoustic_eq_D():
    """Crystal acoustic phonon branches = D = 3 EXACT."""
    from urt.acoustics_cathedral import N_PHONON_ACOUSTIC, N_PHONON_ACOUSTIC_EQ_D
    from urt.shell_closure import D
    assert N_PHONON_ACOUSTIC == D
    assert N_PHONON_ACOUSTIC == 3
    assert N_PHONON_ACOUSTIC_EQ_D is True


def test_n_phonon_optical_eq_D():
    """Crystal optical phonon branches (diatomic basis) = D = 3 EXACT."""
    from urt.acoustics_cathedral import N_PHONON_OPTICAL
    from urt.shell_closure import D
    assert N_PHONON_OPTICAL == D
    assert N_PHONON_OPTICAL == 3


def test_n_phonon_total_diatomic_eq_V2():
    """Total diatomic phonon modes = 2D = V//2 = 6 EXACT."""
    from urt.acoustics_cathedral import N_PHONON_TOTAL_DIATOMIC, N_PHONON_EQ_V2
    from urt.shell_closure import D, V
    assert N_PHONON_TOTAL_DIATOMIC == 2 * D
    assert N_PHONON_TOTAL_DIATOMIC == V // 2
    assert N_PHONON_TOTAL_DIATOMIC == 6
    assert N_PHONON_EQ_V2 is True


def test_phonon_modes_add_up():
    """Acoustic + optical phonon branches = total."""
    from urt.acoustics_cathedral import N_PHONON_ACOUSTIC, N_PHONON_OPTICAL, N_PHONON_TOTAL_DIATOMIC
    assert N_PHONON_ACOUSTIC + N_PHONON_OPTICAL == N_PHONON_TOTAL_DIATOMIC


def test_n_transverse_optical_eq_D1():
    """Transverse optical phonon modes = D-1 = 2 EXACT."""
    from urt.acoustics_cathedral import N_TRANSVERSE_OPTICAL
    from urt.shell_closure import D
    assert N_TRANSVERSE_OPTICAL == D - 1
    assert N_TRANSVERSE_OPTICAL == 2


# ── Sabine ────────────────────────────────────────────────────────────────────

def test_sabine_dim_eq_D():
    """Sabine reverberation formula uses D=3 dimensional volume."""
    from urt.acoustics_cathedral import SABINE_DIM
    from urt.shell_closure import D
    assert SABINE_DIM == D
    assert SABINE_DIM == 3


# ── Function tests ─────────────────────────────────────────────────────────────

def test_wave_properties_function():
    """wave_properties() returns correct dict with all equalities True."""
    from urt.acoustics_cathedral import wave_properties
    from urt.shell_closure import D, q
    r = wave_properties()
    assert r["wave_dim"] == D
    assert r["wave_dim_eq_D"] is True
    assert r["huygens_odd"] is True
    assert r["D_is_odd"] is True
    assert r["n_acoustic_branches"] == D
    assert r["acoustic_eq_D"] is True
    assert r["n_cavity_qn"] == D
    assert r["cavity_eq_D"] is True
    assert abs(r["gamma_monatomic"] - float(q) / D) < 1e-12
    assert r["gamma_eq_q_D"] is True


def test_acoustic_multipoles_function():
    """acoustic_multipoles() returns correct dict with all equalities True."""
    from urt.acoustics_cathedral import acoustic_multipoles
    from urt.shell_closure import D, V
    r = acoustic_multipoles()
    assert r["n_dipole"] == D
    assert r["dipole_eq_D"] is True
    assert r["n_quadrupole"] == V // 2
    assert r["n_quadrupole"] == 6
    assert r["quad_eq_V2"] is True
    assert r["spherical_power"] == D - 1
    assert r["spherical_eq_D1"] is True
    assert r["wall_factor"] == D - 1
    assert r["wall_eq_D1"] is True
    assert r["intensity_factor"] == D - 1
    assert r["intensity_eq_D1"] is True


def test_phonon_modes_function():
    """phonon_modes() returns correct dict with all equalities True."""
    from urt.acoustics_cathedral import phonon_modes
    from urt.shell_closure import D, V
    r = phonon_modes()
    assert r["n_acoustic"] == D
    assert r["acoustic_eq_D"] is True
    assert r["n_optical"] == D
    assert r["optical_eq_D"] is True
    assert r["n_total_diatomic"] == 2 * D
    assert r["n_total_diatomic"] == V // 2
    assert r["total_eq_V2"] is True
    assert r["n_semitones"] == V
    assert r["semitones_eq_V"] is True


def test_acoustics_summary_structure():
    """acoustics_summary() contains expected top-level keys."""
    from urt.acoustics_cathedral import acoustics_summary
    r = acoustics_summary()
    assert "waves" in r
    assert "multipoles" in r
    assert "phonons" in r
    assert "KEY_EXACT_RESULTS" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 10


def test_acoustics_summary_key_results_content():
    """KEY_EXACT_RESULTS lists EXACT connections."""
    from urt.acoustics_cathedral import acoustics_summary
    r = acoustics_summary()
    full_text = " ".join(r["KEY_EXACT_RESULTS"])
    assert "EXACT" in full_text
    assert "D" in full_text
    assert "V" in full_text


def test_print_acoustics_report(capsys):
    """print_acoustics_report() produces substantial output with key numbers."""
    from urt.acoustics_cathedral import print_acoustics_report
    print_acoustics_report()
    out = capsys.readouterr().out
    assert "3" in out
    assert "EXACT" in out
    assert len(out) > 300


# ── Cross-checks ───────────────────────────────────────────────────────────────

def test_acoustic_branches_eq_cavity_qn():
    """Acoustic branches = cavity quantum numbers = D."""
    from urt.acoustics_cathedral import N_ACOUSTIC_BRANCHES, N_CAVITY_QUANTUM_NUMBERS
    assert N_ACOUSTIC_BRANCHES == N_CAVITY_QUANTUM_NUMBERS


def test_phonon_total_eq_quadrupole():
    """Total diatomic phonons = quadrupole components = 6 = V//2."""
    from urt.acoustics_cathedral import N_PHONON_TOTAL_DIATOMIC, N_QUADRUPOLE_COMPONENTS
    assert N_PHONON_TOTAL_DIATOMIC == N_QUADRUPOLE_COMPONENTS


def test_wave_dim_eq_acoustic_branches_eq_cavity_qn():
    """Wave dim = acoustic branches = cavity quantum numbers = D = 3."""
    from urt.acoustics_cathedral import ACOUSTIC_WAVE_DIM, N_ACOUSTIC_BRANCHES, N_CAVITY_QUANTUM_NUMBERS
    assert ACOUSTIC_WAVE_DIM == N_ACOUSTIC_BRANCHES == N_CAVITY_QUANTUM_NUMBERS == 3


def test_d_minus_1_consistency():
    """D-1 = 2 appears consistently as spherical power, wall factor, and intensity factor."""
    from urt.acoustics_cathedral import SPHERICAL_WAVE_POWER, WALL_PRESSURE_FACTOR, INTENSITY_FACTOR
    from urt.shell_closure import D
    assert SPHERICAL_WAVE_POWER == D - 1
    assert WALL_PRESSURE_FACTOR == D - 1
    assert INTENSITY_FACTOR == D - 1
    assert SPHERICAL_WAVE_POWER == WALL_PRESSURE_FACTOR == INTENSITY_FACTOR


def test_phonon_acoustic_eq_dipole_eq_wave_dim():
    """Phonon acoustic branches = dipole components = wave dim = D = 3."""
    from urt.acoustics_cathedral import N_PHONON_ACOUSTIC, N_DIPOLE_COMPONENTS, ACOUSTIC_WAVE_DIM
    assert N_PHONON_ACOUSTIC == N_DIPOLE_COMPONENTS == ACOUSTIC_WAVE_DIM == 3


def test_gamma_matches_fluid_cathedral():
    """γ in acoustics = γ_monatomic in fluid_cathedral = q/D = 5/3."""
    from urt.acoustics_cathedral import SOUND_GAMMA_MONATOMIC
    from urt.fluid_cathedral import GAMMA_MONATOMIC
    assert abs(SOUND_GAMMA_MONATOMIC - GAMMA_MONATOMIC) < 1e-12


def test_semitones_matches_music_cathedral():
    """Semitones per octave in acoustics = V = 12 (same as music_cathedral)."""
    from urt.acoustics_cathedral import N_EQUAL_TEMP_SEMITONES
    from urt.music_cathedral import SEMITONES_PER_OCTAVE
    assert N_EQUAL_TEMP_SEMITONES == SEMITONES_PER_OCTAVE
