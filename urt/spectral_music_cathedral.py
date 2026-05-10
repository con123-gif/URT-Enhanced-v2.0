"""
Hearing the icosahedron — the URT spectrum is musical.

The G_{13} centred-icosahedral Laplacian's eigenvalues are

        λ ∈ {0, 3, 5, 7, 9, 13}.

Every non-zero eigenvalue is a Cathedral integer.  This module shows
that those eigenvalues are not just "spectral data" — they encode the
**musical intervals** of the icosahedron treated as a resonant cavity.

Two independent musical readings of the spectrum:

(A) AS HARMONIC-SERIES INDICES.  Treating each eigenvalue as the
    overtone number of a fundamental, the ratios λ_i / λ_j are just-
    intonation interval ratios.  In particular:

        5 / 3  =  q / D      =  major 6th (M6 = 5/3 in just intonation)
        9 / 3  =  3          =  octave + perfect 5th
        9 / 5  =  D² / q     =  5-limit minor 7th
        7 / 5  =  D!+1 / q   =  septimal tritone
        9 / 7  =  D² / (D!+1) =  septimal minor 3rd

    The standout is the smallest non-trivial ratio:
        5 / 3  =  q / D
    This is *simultaneously* the consonant major 6th in music, the
    Kolmogorov γ (= q/D) from fluid-mechanics, and the second-to-
    first Cathedral spectral ratio.  A triple-coincidence.

(B) AS SEMITONE INTERVALS (mod V = 12).  Reducing each eigenvalue
    modulo the chromatic V = 12 semitones gives intervals mod octave:

        λ =  3  →   3 semitones  =  minor 3rd       (consonant)
        λ =  5  →   5 semitones  =  perfect 4th     (consonant, perfect)
        λ =  7  →   7 semitones  =  perfect 5th     (consonant, perfect)
        λ =  9  →   9 semitones  =  major 6th       (consonant)
        λ = 13  →   1 semitone   =  minor 2nd       (DISSONANT)

    Four of five are consonant.  The one dissonance is the maximum
    eigenvalue λ = N — i.e. it comes from the icosahedral *exhaust*
    (the same A_5-sector eigenvalue that gives the fastest URT
    contraction).

Read together, the icosahedral cavity *resonates on consonance*: its
spectrum mod-octave is dominated by the K_4 sector intervals (the
perfect ones — octave, P4, P5), with the lone dissonance coming from
the A_5 sector exhaust.  The K_4 ⊕ A_5 split shows up *again*, this
time as "consonant interior + dissonant edge."

Connections to other modules
----------------------------

   urt.spectrum_cathedral             : provides the raw spectrum
   urt.music_geometry_cathedral       : provides the just-intonation table
   urt.chaos_and_flow                 : same eigenvalues drive mixing times
   urt.fluid_cathedral                : 5/3 = q/D as adiabatic γ
   urt.cathedral_sectors              : K_4 ⊕ A_5 sector assignment

CI gate:  ``spectral_music_audit_passes()``.
"""
from __future__ import annotations

from math import factorial
from typing import Dict, Any, List, Tuple
from fractions import Fraction

import numpy as np

from .shell_closure import D, q, V, N, E, F, G
from .cathedral_engine import cathedral_laplacian


# ── The G_{13} Laplacian spectrum ────────────────────────────────────────

def cathedral_spectrum() -> List[int]:
    """Return the unique Laplacian eigenvalues of G_{13} as integers.

    The spectrum is {0, 3, 5, 7, 9, 13} — every Cathedral integer.
    """
    L = cathedral_laplacian()
    eigs = sorted(set(np.linalg.eigvalsh(L).round(6).tolist()))
    return [int(round(max(0.0, e))) for e in eigs]


def nonzero_spectrum() -> List[int]:
    """Non-zero Laplacian eigenvalues = {3, 5, 7, 9, 13}."""
    return [e for e in cathedral_spectrum() if e > 0]


# ── Reading (A) — eigenvalue ratios as just-intonation intervals ────────

# Standard semitone intervals (just-intonation reference)
_INTERVAL_TABLE = {
    "M6_just":            Fraction(5, 3),       # = q/D    = Kolmogorov γ
    "octave_plus_P5":     Fraction(3, 1),       # = 9/3
    "5_limit_m7":         Fraction(9, 5),       # = D²/q
    "septimal_tritone":   Fraction(7, 5),       # = (D!+1)/q
    "septimal_m3":        Fraction(9, 7),       # = D²/(D!+1)
}


def spectrum_ratios_as_intervals() -> Dict[str, Any]:
    """Compute every λ_i / λ_j ratio for the non-zero spectrum and tag
    those that match standard just-intonation interval ratios.

    Notably, 5/3 (= q/D) appears as the smallest non-trivial ratio
    AND the consonant major 6th AND the Kolmogorov γ.
    """
    spec = nonzero_spectrum()
    results = []
    for i, a in enumerate(spec):
        for b in spec[i + 1:]:
            ratio = Fraction(b, a)
            match = None
            for name, ji_ratio in _INTERVAL_TABLE.items():
                if ratio == ji_ratio:
                    match = name
                    break
            results.append({
                "ratio":         ratio,
                "value":         float(ratio),
                "interval_name": match,
            })
    matched = [r for r in results if r["interval_name"]]
    return {
        "all_ratios":     results,
        "matches":        matched,
        "n_matches":      len(matched),
        "M6_q_over_D":    Fraction(q, D) == Fraction(5, 3),
    }


def m6_triple_coincidence() -> Dict[str, Any]:
    """The smallest non-trivial spectral ratio 5/3 = q/D is *the same
    Cathedral expression* as

        - the just-intonation major 6th
        - the Kolmogorov γ from fluid mechanics
        - the monatomic-gas adiabatic index c_p/c_v
        - the second-eigenvalue / Fiedler-eigenvalue ratio of G_{13}

    Four independently-deep mathematical / physical objects converge on
    the single Cathedral expression q/D.  This is a *triple* (in fact
    quadruple) coincidence on a single Cathedral ratio.
    """
    return {
        "cathedral_form":    "q / D",
        "value":             Fraction(q, D),
        "musical":           "major 6th (just intonation, 5/3)",
        "fluid_mechanics":   "Kolmogorov γ = c_p/c_v for monatomic gas",
        "spectrum_ratio":    "λ_2/λ_Fiedler = 5/3 (G_{13} Laplacian)",
        "is_5_over_3":       Fraction(q, D) == Fraction(5, 3),
    }


# ── Reading (B) — eigenvalues mod V as semitone intervals ───────────────

_SEMITONE_NAMES = {
    0:  "unison",
    1:  "m2",      # minor 2nd — dissonant
    2:  "M2",      # major 2nd — dissonant
    3:  "m3",      # minor 3rd — consonant (imperfect)
    4:  "M3",      # major 3rd — consonant (imperfect)
    5:  "P4",      # perfect 4th — consonant (perfect)
    6:  "tritone", # tritone — dissonant
    7:  "P5",      # perfect 5th — consonant (perfect)
    8:  "m6",      # minor 6th — consonant (imperfect)
    9:  "M6",      # major 6th — consonant (imperfect)
    10: "m7",      # minor 7th — dissonant
    11: "M7",      # major 7th — dissonant
}


_CONSONANT_SEMITONES = {0, 3, 4, 5, 7, 8, 9}   # m3, M3, P4, P5, m6, M6 (+ unison)


def spectrum_mod_V_intervals() -> List[Dict[str, Any]]:
    """For each non-zero eigenvalue λ, reduce λ mod V semitones and name
    the resulting musical interval.

       λ =  3  →   3 semitones  →  m3   (consonant)
       λ =  5  →   5 semitones  →  P4   (consonant, perfect)
       λ =  7  →   7 semitones  →  P5   (consonant, perfect)
       λ =  9  →   9 semitones  →  M6   (consonant)
       λ = 13  →   1 semitone   →  m2   (DISSONANT)
    """
    rows = []
    for lam in nonzero_spectrum():
        sem = lam % V
        rows.append({
            "lambda":      lam,
            "semitones":   sem,
            "interval":    _SEMITONE_NAMES[sem],
            "consonant":   sem in _CONSONANT_SEMITONES,
        })
    return rows


def consonance_count_mod_V() -> Dict[str, Any]:
    """Count consonant vs dissonant intervals among λ mod V.

    4 of 5 non-zero eigenvalues map to consonant intervals (m3, P4,
    P5, M6).  The single dissonance is from λ = N (the maximum
    eigenvalue, A_5 exhaust).
    """
    rows = spectrum_mod_V_intervals()
    n_cons = sum(1 for r in rows if r["consonant"])
    n_diss = len(rows) - n_cons
    diss_lambdas = [r["lambda"] for r in rows if not r["consonant"]]
    return {
        "n_consonant":           n_cons,
        "n_dissonant":           n_diss,
        "total":                 len(rows),
        "fraction_consonant":    n_cons / len(rows),
        "dissonant_eigenvalues": diss_lambdas,
        "dissonance_at_N":       diss_lambdas == [N],
    }


# ── End-to-end audit ─────────────────────────────────────────────────────

def spectral_music_audit() -> Dict[str, Any]:
    """Full audit of the spectrum-music bridge."""
    return {
        "spectrum":              cathedral_spectrum(),
        "nonzero":               nonzero_spectrum(),
        "ratios":                spectrum_ratios_as_intervals(),
        "m6_coincidence":        m6_triple_coincidence(),
        "mod_V_intervals":       spectrum_mod_V_intervals(),
        "consonance_count":      consonance_count_mod_V(),
    }


def spectral_music_audit_passes() -> bool:
    a = spectral_music_audit()
    return (
        a["nonzero"] == [3, 5, 7, 9, 13]
        and a["m6_coincidence"]["is_5_over_3"]
        and a["consonance_count"]["n_consonant"] == 4
        and a["consonance_count"]["n_dissonant"] == 1
        and a["consonance_count"]["dissonance_at_N"]
        and a["ratios"]["M6_q_over_D"]
    )


def print_spectral_music_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" HEARING THE ICOSAHEDRON — THE URT SPECTRUM IS MUSICAL")
    print(bar)

    print("\n[1] G_{13} Laplacian non-zero eigenvalues (all Cathedral)")
    print(f"     λ ∈ {nonzero_spectrum()}")

    print("\n[2] Reading A: eigenvalue ratios as just-intonation intervals")
    r = spectrum_ratios_as_intervals()
    for entry in r["matches"]:
        print(f"     {entry['ratio'].numerator}/{entry['ratio'].denominator}"
              f"  =  {entry['value']:.4f}   →   {entry['interval_name']}")

    print("\n[3] The triple-coincidence on 5/3 = q/D")
    m = m6_triple_coincidence()
    print(f"     5/3 = q/D  is simultaneously:")
    print(f"       musical         : {m['musical']}")
    print(f"       fluid mechanics : {m['fluid_mechanics']}")
    print(f"       spectrum ratio  : {m['spectrum_ratio']}")

    print("\n[4] Reading B: eigenvalues mod V semitones")
    print(f"     {'λ':>4s}  {'mod V':>6s}  interval     consonance")
    for row in spectrum_mod_V_intervals():
        c = "CONSONANT" if row["consonant"] else "dissonant"
        print(f"     {row['lambda']:>4d}  {row['semitones']:>6d}  "
              f"{row['interval']:9s}    {c}")

    c = consonance_count_mod_V()
    print(f"\n     {c['n_consonant']} of {c['total']} eigenvalues map to consonant intervals.")
    print(f"     The single dissonance is at λ = N (= {c['dissonant_eigenvalues'][0]}, "
          f"the A_5 exhaust eigenvalue).")
    print(f"     ⇒ The icosahedral cavity *resonates on consonance*.")

    print()
    print(bar)
    print(f" spectral_music_audit_passes() = {spectral_music_audit_passes()}")
    print(bar)


__all__ = [
    "cathedral_spectrum",
    "nonzero_spectrum",
    "spectrum_ratios_as_intervals",
    "m6_triple_coincidence",
    "spectrum_mod_V_intervals",
    "consonance_count_mod_V",
    "spectral_music_audit",
    "spectral_music_audit_passes",
    "print_spectral_music_report",
]
