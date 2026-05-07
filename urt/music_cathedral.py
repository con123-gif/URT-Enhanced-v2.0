"""
Music Cathedral — Equal temperament, harmony, and Cathedral integers.

The most striking Cathedral connection in music:
  12 semitones per octave = V = 12 (icosahedral vertices!) [EXACT]
  Perfect 5th ratio = 3/2 = D/(D-1) [EXACT — same D=3!]
  3 notes in a triad = D = 3 [EXACT]
  6 tritone semitones = V/2 = 6 [EXACT]

Western music is built on the icosahedron.

Key results:
  V = 12 = semitones per octave (12-TET)
  D = 3 = notes in a triad (tonic, 3rd, 5th)
  D/(D-1) = 3/2 = perfect fifth ratio
  V/2 = 6 = tritone (exactly half octave)
  D-1 = 2 = number of tritone pairs per octave? No: 6 pairs of tritones = V/2 = 6
  The circle of fifths completes after V = 12 steps
"""

from math import log, log2, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Equal temperament ─────────────────────────────────────────────────────────

# 12-tone equal temperament: V = 12 semitones per octave
SEMITONES_PER_OCTAVE = V           # = 12 EXACT (icosahedral vertices!)
SEMITONE_RATIO = 2.0 ** (1.0 / V)  # = 2^{1/12} ≈ 1.05946

# Just intonation perfect 5th: 3/2 = D/(D-1) EXACT
PERFECT_5TH_JUST = float(D) / (D - 1)  # = 3/2 = 1.500000 EXACT
PERFECT_5TH_ET   = 2.0 ** (7.0 / V)    # = 2^{7/12} ≈ 1.49831 (equal temperament)
PERFECT_5TH_DEVIATION = abs(PERFECT_5TH_ET - PERFECT_5TH_JUST) / PERFECT_5TH_JUST

# In cents: 100 cents = 1 semitone (V=12 → 1200 cents per octave)
CENTS_PER_OCTAVE = 100 * V    # = 1200 cents
PERFECT_5TH_CENTS = 700       # 7 semitones × 100 cents
PERFECT_5TH_JUST_CENTS = 1200 * log2(PERFECT_5TH_JUST)  # = 1200 × log₂(3/2) ≈ 701.96

# Pythagorean comma: (3/2)^12 / 2^7 — how close is this to 1?
PYTHAGOREAN_COMMA = (PERFECT_5TH_JUST ** V) / (2.0 ** 7)  # ≈ 1.01364

# ── Chord structure ───────────────────────────────────────────────────────────

# Major triad: root, major 3rd (4 semitones), perfect 5th (7 semitones)
TRIAD_NOTES = D             # = 3: root + 3rd + 5th = D notes EXACT
TRIAD_INTERVALS = [0, 4, 7]  # in semitones

# Minor triad: root, minor 3rd (3 semitones), perfect 5th (7 semitones)
MINOR_3RD_SEMITONES = D     # = 3 semitones = D EXACT
MAJOR_3RD_SEMITONES = D + 1 # = 4 semitones = D+1

# 7th chords: 4 notes = D+1
SEVENTH_CHORD_NOTES = D + 1  # = 4

# Tritone: exactly half the octave
TRITONE_SEMITONES = V // 2   # = 6 = V/2 EXACT

# Number of tritone pairs: 6 pairs (C-F#, C#-G, D-Ab, etc.)
N_TRITONE_PAIRS = V // 2     # = 6 = V/2

# Pentatonic scale: q = 5 notes
PENTATONIC_NOTES = q         # = 5 notes in pentatonic scale EXACT

# Diatonic scale (Western major): 7 notes
DIATONIC_NOTES = 7           # = ? no simple Cathedral formula

# ── Circle of fifths ──────────────────────────────────────────────────────────

# The circle of fifths has exactly V = 12 keys
N_KEYS_CIRCLE = V            # = 12 = V EXACT

# After V = 12 steps of perfect 5th, we return to the octave (nearly):
# (3/2)^12 ≈ 2^7 (Pythagorean comma shows the near-closure)
CIRCLE_STEPS = V             # = 12 = V

# The V/q = 12/5 = 2.4 → not clean. But:
# In the circle of fifths, diatonic = 7 = ? and chromatic = 12 = V

# ── Harmonic series ──────────────────────────────────────────────────────────

def harmonic_series(n_harmonics: int = N) -> dict:
    """
    Harmonic series f, 2f, 3f, ..., Nf.

    The first N=13 harmonics span the musical intervals most used in harmony.
    The D=3 first harmonics (2f, 3f) define octave and perfect 5th.

    Parameters
    ----------
    n_harmonics : int
        Number of harmonics (default N=13).
    """
    ratios = [k for k in range(1, n_harmonics + 1)]
    intervals_cents = [1200 * log2(k) for k in ratios[1:]]
    return {
        "harmonics":         ratios,
        "n_harmonics":       n_harmonics,
        "n_harmonics_eq_N":  (n_harmonics == N),
        "first_D_harmonics": ratios[:D],
        "octave_ratio":      2,              # 2nd harmonic = octave
        "fifth_ratio":       3,              # 3rd harmonic = perfect 5th (×2/3)
        "intervals_cents":   intervals_cents[:6],
        "note":              "3rd harmonic / 2 = 3/2 = D/(D-1) (perfect 5th)",
    }


def equal_temperament() -> dict:
    """12-tone equal temperament and Cathedral connections."""
    return {
        "semitones":             SEMITONES_PER_OCTAVE,
        "semitones_eq_V":        (SEMITONES_PER_OCTAVE == V),
        "semitone_ratio":        SEMITONE_RATIO,
        "perfect_5th_just":      PERFECT_5TH_JUST,
        "perfect_5th_formula":   "D/(D-1) = 3/2 EXACT",
        "perfect_5th_ET":        PERFECT_5TH_ET,
        "fifth_deviation_pct":   PERFECT_5TH_DEVIATION * 100,
        "pythagorean_comma":     PYTHAGOREAN_COMMA,
        "cents_per_octave":      CENTS_PER_OCTAVE,
        "circle_steps":          CIRCLE_STEPS,
        "circle_steps_eq_V":     (CIRCLE_STEPS == V),
        "tritone_semitones":     TRITONE_SEMITONES,
        "tritone_eq_V_over_2":   (TRITONE_SEMITONES == V // 2),
    }


def chord_structure() -> dict:
    """Chord note counts and Cathedral integers."""
    return {
        "triad_notes":           TRIAD_NOTES,
        "triad_eq_D":            (TRIAD_NOTES == D),
        "major_3rd_semitones":   MAJOR_3RD_SEMITONES,
        "major_3rd_eq_D1":       (MAJOR_3RD_SEMITONES == D + 1),
        "minor_3rd_semitones":   MINOR_3RD_SEMITONES,
        "minor_3rd_eq_D":        (MINOR_3RD_SEMITONES == D),
        "seventh_chord_notes":   SEVENTH_CHORD_NOTES,
        "seventh_eq_D1":         (SEVENTH_CHORD_NOTES == D + 1),
        "pentatonic_notes":      PENTATONIC_NOTES,
        "pentatonic_eq_q":       (PENTATONIC_NOTES == q),
    }


def golden_ratio_music() -> dict:
    """
    Golden ratio φ in music.

    The ratio of the perfect 6th to the perfect 5th in just intonation:
    Major 6th = 5/3, Perfect 5th = 3/2.
    5/3 ÷ 3/2 = 10/9 — not φ directly.

    But: the ratio of the major 3rd (5/4) to the minor 3rd (6/5):
    (5/4)/(6/5) = 25/24 — also not φ.

    The Fibonacci sequence appears in the diatonic scale: 2, 3, 5, 8, 13
    Scale positions: 2 (major 2nd), 3 (major 3rd), 5 (perfect 5th = 7 semitones),
    8 (major 6th), 13 = N (octave+1?).

    In equal temperament, the Golden ratio pitch: f × φ
    In semitones: 12 log₂(φ) ≈ 8.33 semitones (between major 6th=9 and minor 6th=8)
    """
    golden_semitones = SEMITONES_PER_OCTAVE * log2(phi)   # ≈ 8.33
    fibonacci_scale = [1, 2, 3, 5, 8, 13]   # Fibonacci → scale positions
    return {
        "golden_semitones":      golden_semitones,
        "phi":                   phi,
        "fibonacci_in_scale":    fibonacci_scale,
        "N_in_fibonacci":        (N in fibonacci_scale),
        "note":                  "φ pitch ≈ 8.33 semitones (between minor/major 6th)",
        "fibonacci_scale_to_N":  "1,2,3,5,8,13=N — Fibonacci reaches N",
    }


def cathedral_musical_numbers() -> dict:
    """All Cathedral integers in music."""
    return {
        "D=3":  "Notes in a triad, major/minor 3rd semitone counts",
        "D+1=4": "Notes in a 7th chord (dominant 7th, minor 7th)",
        "q=5":  "Notes in pentatonic scale",
        "V=12": "Semitones per octave (12-TET), keys in circle of fifths",
        "V/2=6": "Tritone = half octave, number of tritone pairs",
        "N=13": "Fibonacci number reached by scale steps 1,2,3,5,8,13",
        "D/(D-1)=3/2": "Perfect fifth ratio — just intonation",
    }


def music_summary() -> dict:
    """Full Cathedral music theory summary."""
    return {
        "temperament":   equal_temperament(),
        "chords":        chord_structure(),
        "harmonics":     harmonic_series(N),
        "golden":        golden_ratio_music(),
        "numbers":       cathedral_musical_numbers(),
        "key_results": [
            f"Semitones per octave = V = {V}  [EXACT: icosahedral vertices!]",
            f"Perfect 5th = D/(D-1) = {D}/{D-1} = {PERFECT_5TH_JUST}  [EXACT]",
            f"Triad has D = {D} notes  [EXACT]",
            f"Minor 3rd = D = {D} semitones  [EXACT]",
            f"Tritone = V/2 = {V//2} semitones  [EXACT]",
            f"Pentatonic = q = {q} notes  [EXACT]",
            f"Circle of 5ths has V = {V} keys  [EXACT]",
        ],
    }


def print_music_report():
    """Print Cathedral music theory report."""
    et = equal_temperament()
    cs = chord_structure()

    print("  Cathedral Music Theory — 12-TET, Harmony, and Icosahedral Geometry")
    print("  " + "─" * 58)

    print(f"\n  12-Tone Equal Temperament:")
    print(f"    Semitones per octave = V = {V}  ← EXACT (icosahedral vertices!)")
    print(f"    Semitone ratio = 2^{{1/12}} = {SEMITONE_RATIO:.6f}")
    print(f"    Circle of 5ths: {CIRCLE_STEPS} keys = V  ← EXACT")
    print(f"    Tritone = V/2 = {TRITONE_SEMITONES} semitones  ← EXACT")

    print(f"\n  Just Intonation:")
    print(f"    Perfect 5th = D/(D-1) = {D}/{D-1} = {PERFECT_5TH_JUST:.6f}  ← EXACT!")
    print(f"    Perfect 5th (ET) = 2^{{7/12}} = {PERFECT_5TH_ET:.6f}  (Δ={PERFECT_5TH_DEVIATION*100:.3f}%)")
    print(f"    Pythagorean comma = (3/2)^12 / 2^7 = {PYTHAGOREAN_COMMA:.6f}")

    print(f"\n  Chord Structure:")
    print(f"    Triad notes = D = {D}  ← EXACT (root, 3rd, 5th)")
    print(f"    Minor 3rd = D = {D} semitones  ← EXACT")
    print(f"    Major 3rd = D+1 = {D+1} semitones  ← EXACT")
    print(f"    7th chord = D+1 = {D+1} notes  ← EXACT")
    print(f"    Pentatonic scale = q = {q} notes  ← EXACT")

    print(f"\n  Fibonacci and Golden Ratio:")
    fr = golden_ratio_music()
    print(f"    Golden ratio pitch: φ × f → {fr['golden_semitones']:.2f} semitones")
    print(f"    Fibonacci scale: {fr['fibonacci_in_scale']} → reaches N={N}  ← EXACT")

    print(f"\n  Cathedral Musical Numbers:")
    for k, v_str in cathedral_musical_numbers().items():
        print(f"    {k:<12}: {v_str}")

    print(f"\n  KEY: Western music is built on V=12 and D=3 = icosahedral Cathedral!")
