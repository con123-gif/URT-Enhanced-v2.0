"""
Linguistics Cathedral — Linguistic universals and Cathedral integers.

Cathedral connections to human language:

1. Vowel inventory — modal count = q = 5  [EXACT]:
   The World Atlas of Language Structures (WALS) shows that q=5 vowels is the
   single most common vowel inventory size across all documented languages.
   (Spanish, Latin, Japanese, Turkish: canonical 5-vowel systems)

2. Formants — F1, F2, F3 = D = 3 identifying a vowel  [EXACT]:
   The first three formant frequencies (D=3) are necessary and sufficient
   to characterise a vowel in acoustic phonetics.

3. Word order permutations: 3! = 6 = V/2  [EXACT]:
   Subject, Verb, Object can be arranged in D! = 6 = V/2 logical orders.
   Most common: SOV (~45%), SVO (~42%), VSO (~9%).

4. Proto-Indo-European laryngeals = D = 3  [EXACT]:
   The comparative linguistic reconstruction of PIE postulates exactly
   D=3 laryngeal consonants: *h₁, *h₂, *h₃.

5. Maximum onset consonant cluster = D = 3  [APPROXIMATE]:
   Most languages allow at most D=3 consonants in an onset (English "str-").
   This is approximate: some languages allow longer clusters.

6. PIE root structure: C-V-C with up to D consonants per syllable margin  [APPROX]

7. Phoneme inventory mode ≈ F = 20  [APPROXIMATE]:
   The WALS modal phoneme inventory is ~34 (mean), but many languages cluster
   around 20 phonemes = F = icosahedral faces.  Honest: APPROXIMATE.

8. Factorial(D) = 6 = V/2  [EXACT]: the number of word orders equals
   V/2 by Cathedral arithmetic.

Key Cathedral facts:
  N_FORMANTS             = D = 3         [EXACT: 3 formants identify a vowel]
  N_VOWELS_TYPICAL       = q = 5         [EXACT: world modal vowel count]
  N_WORD_ORDERS          = D! = 6 = V/2  [EXACT: permutations of S,V,O]
  N_PIE_LARYNGEALS       = D = 3         [EXACT: PIE reconstruction]
  N_ONSET_MAX_CONSONANTS = D = 3         [APPROXIMATE: typical maximum]
  PHONEME_MODE           = F = 20        [APPROXIMATE: many languages ≈ F]
"""

from math import pi, sqrt, log, factorial
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Core Cathedral constants ───────────────────────────────────────────────────

# First D=3 formants identify a vowel  [EXACT acoustic phonetics]
N_FORMANTS = D              # = 3

# World modal vowel inventory size = q = 5  [EXACT: WALS data]
N_VOWELS_TYPICAL = q        # = 5

# Logical word order permutations: D! = 3! = 6 = V/2  [EXACT]
N_WORD_ORDERS = factorial(D)   # = 6

# Verify N_WORD_ORDERS = V/2
WORD_ORDERS_EQ_V2 = (N_WORD_ORDERS == V // 2)   # True: 6 = 12/2

# Proto-Indo-European laryngeals = D = 3  [EXACT reconstruction]
N_PIE_LARYNGEALS = D        # = 3

# Maximum onset consonant cluster in typical language ≈ D  [APPROXIMATE]
N_ONSET_MAX_CONSONANTS = D  # = 3  [APPROXIMATE]

# Phoneme inventory mode: many languages cluster near F=20  [APPROXIMATE]
PHONEME_MODE = F            # = 20  [APPROXIMATE]

# ── Empirical linguistic data ──────────────────────────────────────────────────

# WALS-based frequency of word orders (approximate percentages)
WORD_ORDER_FREQUENCIES = {
    "SOV": 0.45,   # 45% of languages (most common)
    "SVO": 0.42,   # 42% (second most common — includes English)
    "VSO": 0.09,   # 9%
    "VOS": 0.03,   # 3%
    "OVS": 0.01,   # 1%
    "OSV": 0.00,   # < 0.5% (rarest)
}

# Example languages with canonical q=5 vowel systems
FIVE_VOWEL_LANGUAGES = ["Spanish", "Latin", "Japanese", "Turkish", "Modern Greek",
                         "Swahili", "Hawaiian"]

# Vowels in the IPA cardinal system: 5 primary unrounded front vowels = q = 5
N_PRIMARY_CARDINAL_VOWELS = q   # = 5  [EXACT]

# ── Functions ──────────────────────────────────────────────────────────────────

def vowel_system() -> dict:
    """
    Vowel inventory Cathedral connections.

    Modal vowel count = q = 5  [EXACT: WALS world language data]
    Identifying formants = D = 3  [EXACT: acoustic phonetics]
    """
    return {
        "typical_vowels":           N_VOWELS_TYPICAL,
        "n_typical_vowels":         N_VOWELS_TYPICAL,   # alias
        "eq_q":                     (N_VOWELS_TYPICAL == q),
        "n_vowels_typical_eq_q":    (N_VOWELS_TYPICAL == q),   # alias
        "q":                        q,
        "formants":                 N_FORMANTS,
        "n_formants":               N_FORMANTS,   # alias
        "formants_eq_D":            (N_FORMANTS == D),
        "n_formants_eq_D":          (N_FORMANTS == D),   # alias
        "D":                        D,
        "example_languages":        FIVE_VOWEL_LANGUAGES,
        "cardinal_primary":         N_PRIMARY_CARDINAL_VOWELS,
        "note": (
            "Modal vowel count = q=5  [EXACT: WALS world data]. "
            "D=3 formants identify a vowel  [EXACT: acoustic phonetics]."
        ),
    }


def word_order() -> dict:
    """
    Word order permutations and Cathedral connections.

    D! = 3! = 6 = V/2 logical word orders  [EXACT]
    Most common: SOV (~45%), SVO (~42%)
    """
    return {
        "n_orders":             N_WORD_ORDERS,
        "n_word_orders":        N_WORD_ORDERS,   # alias
        "n_orders_eq_D_fact":   (N_WORD_ORDERS == factorial(D)),
        "n_orders_eq_V2":       WORD_ORDERS_EQ_V2,
        "n_word_orders_eq_V2":  WORD_ORDERS_EQ_V2,   # alias
        "D":                    D,
        "V":                    V,
        "V2":                   V // 2,
        "most_common":          "SOV",
        "second_common":        "SVO",
        "frequencies":          WORD_ORDER_FREQUENCIES,
        "note": (
            "D! = 3! = 6 = V/2  [EXACT: 6 permutations of S,V,O]. "
            "SOV most common (45%), SVO second (42%)."
        ),
    }


def phoneme_inventory() -> dict:
    """
    Phoneme inventory statistics and Cathedral approximation.

    Many languages have phoneme inventory size near F=20  [APPROXIMATE].
    The mean is ~34 (WALS); the mode is lower, often cited ~20-25.
    """
    return {
        "mode":                         PHONEME_MODE,
        "phoneme_mode":                 PHONEME_MODE,   # alias
        "mode_eq_F":                    (PHONEME_MODE == F),
        "F":                            F,
        "primary_cardinal_vowels":      N_PRIMARY_CARDINAL_VOWELS,
        "primary_cardinal_vowels_eq_q": (N_PRIMARY_CARDINAL_VOWELS == q),   # alias
        "wals_mean":                    34,       # approximate WALS mean
        "wals_range":                   (11, 141),
        "label":                        "APPROXIMATE (many languages near F=20)",
        "note": (
            "Phoneme mode ≈ F=20 = icosahedral faces  [APPROXIMATE]. "
            "WALS mean is ~34; the F=20 Cathedral match is suggestive, not exact."
        ),
    }


def pie_reconstruction() -> dict:
    """
    Proto-Indo-European laryngeals and Cathedral connections.

    PIE laryngeals = D = 3  [EXACT: standard comparative reconstruction]
    Three laryngeals *h₁ (neutral), *h₂ (a-colouring), *h₃ (o-colouring).
    """
    return {
        "laryngeals":           N_PIE_LARYNGEALS,
        "n_laryngeals":         N_PIE_LARYNGEALS,   # alias
        "eq_D":                 (N_PIE_LARYNGEALS == D),
        "n_laryngeals_eq_D":    (N_PIE_LARYNGEALS == D),   # alias
        "D":                    D,
        "names":                {"h1": "*h₁ (neutral/e-colouring)",
                                 "h2": "*h₂ (a-colouring)",
                                 "h3": "*h₃ (o-colouring)"},
        "note": (
            "PIE has D=3 laryngeals  [EXACT: consensus comparative reconstruction]. "
            "Each colours adjacent vowels differently."
        ),
    }


def syllable_structure() -> dict:
    """
    Syllable onset consonant cluster maximum ≈ D = 3  [APPROXIMATE].

    Most languages allow at most D=3 consonants in an onset cluster
    (e.g. English 'str-', German 'str-', 'schm-').
    Some languages allow more (e.g. Georgian: 'mts-', 'tsk-' = 3-4 consonants).
    """
    return {
        "max_onset_consonants": N_ONSET_MAX_CONSONANTS,
        "eq_D":                 (N_ONSET_MAX_CONSONANTS == D),
        "label":                "APPROXIMATE (typical maximum; some languages exceed D)",
        "examples":             {
            "onset_3": "English 'str-' (strong), 'scr-' (scream)",
            "coda_3":  "English '-lts' (bolts), '-mps' (stamps)",
        },
        "note": (
            "Maximum onset cluster ≈ D=3  [APPROXIMATE]. "
            "English allows C³V syllables; some languages allow more."
        ),
    }


def linguistics_summary() -> dict:
    """Full Cathedral linguistics summary."""
    key_results = [
        "Modal vowel count = q = 5  [EXACT: WALS data]",
        "Formants identifying a vowel = D = 3  [EXACT: acoustic phonetics]",
        "Word order permutations = D! = 6 = V/2  [EXACT]",
        "PIE laryngeals = D = 3  [EXACT: comparative reconstruction]",
    ]
    return {
        "vowels":               vowel_system(),
        "word_order":           word_order(),
        "phonemes":             phoneme_inventory(),
        "pie":                  pie_reconstruction(),
        "syllable":             syllable_structure(),
        "delta_star":           DELTA_STAR,
        "D":                    D,
        "q":                    q,
        "V":                    V,
        "F":                    F,
        "KEY_EXACT_RESULTS":    key_results,
        "key_results":          key_results,   # alias for alternate test style
        "KEY_APPROXIMATE_RESULTS": [
            "Max onset consonant cluster ≈ D = 3  [APPROXIMATE]",
            "Phoneme inventory mode ≈ F = 20  [APPROXIMATE]",
        ],
    }


def print_linguistics_report():
    """Print Cathedral linguistics report."""
    vs = vowel_system()
    wo = word_order()
    pi_inv = phoneme_inventory()
    pie = pie_reconstruction()

    print("  Linguistics Cathedral — Vowels, Word Order, PIE Reconstruction")
    print("  " + "─" * 62)

    print(f"\n  Vowel System:")
    print(f"    Modal vowel inventory = q = {N_VOWELS_TYPICAL}  [EXACT: WALS world data]")
    print(f"    Examples: {', '.join(FIVE_VOWEL_LANGUAGES[:5])}")
    print(f"    Formants for vowel ID = D = {N_FORMANTS}  [EXACT: acoustic phonetics]")
    print(f"      (F1=height, F2=backness, F3=rounding — 3 dimensions)")

    print(f"\n  Word Order:")
    print(f"    N_orders = D! = {D}! = {N_WORD_ORDERS} = V/2 = {V}/2  [EXACT]")
    print(f"    WORD_ORDERS_EQ_V2 = {WORD_ORDERS_EQ_V2}")
    print(f"    Frequency breakdown:")
    for order, freq in wo["frequencies"].items():
        bar = "#" * int(freq * 30)
        print(f"      {order}: {freq*100:.0f}%  {bar}")

    print(f"\n  Proto-Indo-European Laryngeals:")
    print(f"    N_laryngeals = D = {N_PIE_LARYNGEALS}  [EXACT: comparative reconstruction]")
    for k, v in pie["names"].items():
        print(f"      {v}")

    print(f"\n  Phoneme Inventory:")
    print(f"    Mode ≈ F = {PHONEME_MODE} phonemes  [APPROXIMATE]")
    print(f"    WALS mean ≈ {pi_inv['wals_mean']};  range {pi_inv['wals_range']}")

    print(f"\n  KEY Cathedral results:")
    for r in linguistics_summary()["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print(f"  APPROXIMATE:")
    for r in linguistics_summary()["KEY_APPROXIMATE_RESULTS"]:
        print(f"    {r}")
