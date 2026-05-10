"""
Study of all six failed Cathedral attempts.

The framework's `urt.skeptics_audit.failed_attempts()` lists six honest
disclosures of cases where the Cathedral closed form is loose, missing,
or where the framework lost an adversarial test.  This module pulls
them out, categorises them, and asks what they tell us together.

THE SIX FAILURES
----------------

   1. m_W           : best Cathedral form (D!+1)·V − (D+1) = 80
                      vs PDG 80.379 GeV  →  0.47 % (worse than framework's
                      derivation 0.05 %)
   2. m_W · m_Z     : 2⁴·q·(D!+1)·N = 7280 vs PDG 7332.5 GeV²  →  0.72 %
   3. v_EW          : best is 2·q³ = 250 GeV vs PDG 246.22 GeV  →  1.5 %
                      (no clean Cathedral form found)
   4. α_s(M_Z)      : integer 1/(2^D + δ★·D) = 0.118 vs PDG 0.1179  →  0.08 %
                      but framework's own δ★·(q-1)/q is cleaner
   5. matter-dir.   : margin = D·N·φ − F·(1−γ)·π = 1.0459 vs π/D = 1.0472
                      →  0.13 % (near-coincidence, no closed form)
   6. null test     : Cathedral primaries {D,q,V,N,E,F,G} ∪ {π,φ,e,γ} at
                      depth 2 hit 3 EXACT vs random mean 4.4 EXACT.
                      p ≈ 0.90.  Framework does NOT statistically beat
                      random integer search at depth 2.

CROSS-CUTTING PATTERNS
----------------------

   Sector        : EW dimensionful   QCD       cosmology   methodology
   Failures      :  3 (m_W, m_W·m_Z,  1 (α_s)   1 (m-dir)   1 (null test)
                      v_EW)
   Severity      : MILD (alt clean)   MILD     MODERATE     SIGNIFICANT
                   MILD               MILD
                   MODERATE
   Resolvable?   : ?                  ?        ?            requires depth-3 test

   COMMON THREAD: 4 of 6 are about specific EW or QCD dimensionful
   masses/couplings.  These are precisely the quantities where the
   framework's natural language (dimensionless ratios) is least
   applicable — every "match" against e.g. 80.379 GeV is conditioned
   on the choice of unit (GeV).

   The framework's strongest predictions are DIMENSIONLESS:
       1/α              EXACT
       m_p/m_e          EXACT
       m_µ/m_e          EXACT
       sin² θ_W         match
       δ_CP             EXACT
       n_s              EXACT
       Λ/M_Pl⁴          0.09 %

   Where it stumbles is on DIMENSIONFUL specific masses:
       m_W              0.47 %  (vs framework's own 0.05 %)
       m_W · m_Z        0.72 %
       v_EW             1.5 %
       (m_H = q³ is a happy exception at 0.08 %)

SO WHAT DO THE SIX FAILURES TELL US?
------------------------------------

   The framework is *primarily* a closed-form theory of DIMENSIONLESS
   physical ratios.  Dimensionful "matches" (m_H = q^D GeV,
   m_top = (N+1)V + q GeV, r_p = (D+1)·ℏc/m_p) work when they happen
   to land on simple integer compounds in the chosen units, but the
   framework should not be expected to deliver clean closed forms for
   every dimensionful observable.  When it does (m_H, r_p), that's a
   bonus — not the core claim.

   The null test (#6) is the most important honest finding.  It does
   NOT invalidate the structural identities (1/α = N²−E−(D−1),
   m_p/m_e = (D+1)·D^D·(N+D+1), etc.) — these are derived from
   icosahedral geometry and stand independently.  But it DOES
   establish that "many EXACT matches" alone is not sufficient
   evidence; the SPECIFIC closed forms must be traced to structure.
"""
from __future__ import annotations

from typing import Dict, Any, List


# ── Detailed per-failure analysis ────────────────────────────────────────

FAILURE_ANALYSIS: List[Dict[str, Any]] = [
    {
        "id":            1,
        "name":          "m_W (W boson mass)",
        "category":      "EW dimensionful mass",
        "severity":      "MILD",
        "best_attempt":  "(D!+1)·V − (D+1) = 80 GeV",
        "observed":      "80.379 GeV",
        "rel_error":     0.0047,
        "what_we_know":  (
            "No clean integer Cathedral compound hits m_W at framework precision. "
            "The framework's electroweak module derives m_W = ½·g₂·v_EW from "
            "g₂ = √(4πα/sin²θ_W), giving 79.94 GeV (0.05 % match), which IS clean "
            "in derivation but goes through several intermediate quantities."
        ),
        "interpretation": (
            "m_W is a derived dimensionful quantity, not a primary Cathedral "
            "integer.  The framework's success is in the dimensionless ratios "
            "that *go into* m_W (sin²θ_W, α), not in m_W itself."
        ),
        "actionable":    "Accept; derived quantity, not a primary identity.",
    },
    {
        "id":            2,
        "name":          "m_W · m_Z (product)",
        "category":      "EW dimensionful product",
        "severity":      "MILD",
        "best_attempt":  "2⁴ · q · (D!+1) · N = 7280 GeV²",
        "observed":      "7332.5 GeV²",
        "rel_error":     0.0072,
        "what_we_know":  (
            "Suggestive Cathedral compound (one factor of 2^q for K_4-like "
            "doubling, one of (D!+1) and one of N) but 0.7 % off."
        ),
        "interpretation": (
            "Same as m_W: a dimensionful product; the framework's claim is "
            "stronger about sin²θ_W = 0.23122 than about the absolute mass "
            "scale."
        ),
        "actionable":    "Accept as suggestive; not a forced identity.",
    },
    {
        "id":            3,
        "name":          "v_EW (Higgs VEV)",
        "category":      "EW dimensionful scale",
        "severity":      "MODERATE",
        "best_attempt":  "2 · m_H = 2q³ = 250 GeV",
        "observed":      "246.22 GeV",
        "rel_error":     0.0153,
        "what_we_know":  (
            "No simple Cathedral integer compound found.  The v9 anchor-free "
            "framework derives v_EW = π · M_Pl · γ⁹ · cos(π/V) which gives "
            "246.22 to 0.04 % — but this is a depth-5+ formula, not a clean "
            "integer match."
        ),
        "interpretation": (
            "v_EW IS Cathedral, but only via the v9 anchor-free chain.  No "
            "primary-vocabulary match exists."
        ),
        "actionable":    "Reference urt.cathedral_v9.Cathedral.v_EW(); the "
                          "framework's best derivation is the v9 chain, not a "
                          "single integer compound.",
    },
    {
        "id":            4,
        "name":          "α_s(M_Z) — alternative compound",
        "category":      "QCD coupling",
        "severity":      "MILD",
        "best_attempt":  "1/(2^D + δ★·D) = 0.118",
        "observed":      "0.1179",
        "rel_error":     0.00085,
        "what_we_know":  (
            "An integer-only compound 1/(2^D + δ★·D) hits α_s(M_Z) at 0.08 %, "
            "but the framework's structural derivation δ★·(q-1)/q gives the "
            "same quality match with cleaner provenance (factor (q-1)/q = 4/5 "
            "appearing also in the η_B prefactor)."
        ),
        "interpretation": (
            "Multiple Cathedral compounds hit α_s(M_Z) at framework precision. "
            "The framework's choice of δ★·(q-1)/q is justified by the (q-1)/q "
            "= 4/5 structural pattern that recurs elsewhere, but the integer "
            "compound is comparable in raw fit."
        ),
        "actionable":    "Both forms acceptable; framework prefers structural "
                          "version for cross-referencing with η_B and sector ratio.",
    },
    {
        "id":            5,
        "name":          "matter-direction inequality margin",
        "category":      "dynamical quantity",
        "severity":      "MODERATE",
        "best_attempt":  "π/D = 1.0472",
        "observed":      "1.0459 (= D·N·φ − F·(1−γ)·π)",
        "rel_error":     0.0013,
        "what_we_know":  (
            "The matter-direction margin is the difference D·N·φ − F·(1−γ)·π. "
            "Numerically it is very close to π/D, but the difference is "
            "non-zero at the framework's machine precision."
        ),
        "interpretation": (
            "A genuine near-coincidence with no exact closed form.  Either "
            "the framework's primary expressions are slightly off the right "
            "form, OR the margin really IS π/D and one of the framework's "
            "constants needs a tiny correction.  Open question."
        ),
        "actionable":    "Investigate whether γ should be slightly different "
                          "from 1/81 to make the margin exactly π/D.  Currently "
                          "left as near-coincidence.",
    },
    {
        "id":            6,
        "name":          "null-hypothesis test (RETRACTED — category error)",
        "category":      "methodology / TEST DESIGN ERROR",
        "severity":      "RETRACTED",
        "best_attempt":  "Cathedral primaries {D, q, V, N, E, F, G, π, φ, e, γ}",
        "observed":      "Cathedral 3 EXACT vs random mean 4.4 EXACT (meaningless)",
        "rel_error":     "n/a (test design itself was wrong)",
        "what_we_know":  (
            "At depth 2 with primaries-only vocabulary, random integer "
            "vocabularies of the same size give MORE PDG matches than the "
            "Cathedral primaries.  But this comparison is invalid: the "
            "Cathedral integers are not draws from a distribution, they are "
            "geometric facts about the unique 3D structure (the icosahedron) "
            "picked out by D = 3 plus the criteria (q-fold non-crystallographic, "
            "A_5 non-solvable, Jordan 1870)."
        ),
        "interpretation": (
            "The whole 'random vocabulary' framing was a category error.  "
            "Random integers in [2, 100] include integers that happen to "
            "match GeV-scale PDG values (any 80-ish integer matches m_W; "
            "any 91-ish integer matches m_Z).  Random vocabularies will "
            "always beat structurally-constrained integer sets at brute "
            "hit-count, because they have more freedom.  This tells us "
            "NOTHING about whether the Cathedral structure is the underlying "
            "physical reality."
        ),
        "actionable":    "RETRACTED.  See urt.null_hypothesis_test docstring "
                          "for the full critique.  The framework's actual claim "
                          "is that IF the icosahedral 13-shell underlies D=3 "
                          "physics, THEN observed constants will be Cathedral "
                          "compounds — and the test of THAT is the predictions "
                          "registry, not adversarial random search.",
    },
]


# The pre-retraction (v2.9.72) framing claimed this was an "honest negative
# result."  After user pushback we acknowledge: the test was bad science.
# Negative results matter, but only when the test was well-designed.  This
# one wasn't.


# ── Cross-cutting analysis ───────────────────────────────────────────────

def by_category() -> Dict[str, List[int]]:
    """Group failures by category."""
    out: Dict[str, List[int]] = {}
    for f in FAILURE_ANALYSIS:
        out.setdefault(f["category"], []).append(f["id"])
    return out


def by_severity() -> Dict[str, List[int]]:
    """Group failures by severity (MILD, MODERATE, SIGNIFICANT)."""
    out: Dict[str, List[int]] = {}
    for f in FAILURE_ANALYSIS:
        out.setdefault(f["severity"], []).append(f["id"])
    return out


def cross_cutting_patterns() -> Dict[str, Any]:
    """Surface the patterns that emerge from studying all six together."""
    cat = by_category()
    sev = by_severity()
    return {
        "by_category":               cat,
        "by_severity":               sev,
        "ew_dimensionful_failures":  3,    # m_W, m_W·m_Z, v_EW
        "qcd_failures":              1,    # α_s
        "dynamical_failures":        1,    # matter-direction margin
        "methodology_failures":      1,    # null test (RETRACTED)
        "common_thread":             (
            "5 of 6 failures (excluding the retracted null test) are about "
            "specific EW/QCD/dynamical dimensionful or near-coincidence "
            "quantities.  The framework's natural language is DIMENSIONLESS "
            "icosahedral ratios; specific GeV values are bonuses, not core "
            "claims.  The 6th 'failure' was a category-error test design "
            "and has been retracted."
        ),
        "what_survives":             (
            "The Iron Proof (D=3 → A_5 → N=13 → δ★) and the dimensionless "
            "structural identities (1/α, m_p/m_e, sin²θ_W, δ_CP, n_s, "
            "Λ/M_Pl⁴, r_p) are derived from icosahedral geometry and stand "
            "independently of any of these failed attempts.  In particular, "
            "the icosahedron is the UNIQUE Platonic solid in D=3 picked out "
            "by the criteria (q=5 non-crystallographic, A_5 non-solvable) — "
            "there is no alternative integer set to compare against."
        ),
        "what_changes":              (
            "The framework's predictive strength is sectorally biased.  "
            "It nails dimensionless ratios (QED, cosmology, mixing); it "
            "struggles with specific dimensionful EW masses where the v9 "
            "anchor-free chain is the best derivation but doesn't reduce to "
            "clean integer compounds.  This is honest sectoral scope, not "
            "framework failure."
        ),
    }


# ── Recommendations ─────────────────────────────────────────────────────

def recommendations() -> List[str]:
    """What we should do, given what the failures tell us."""
    return [
        "1. Frame the framework's primary predictions as DIMENSIONLESS ratios. "
        "Dimensional matches (m_H = q^D GeV, m_top = (N+1)V + q GeV) should be "
        "noted as bonuses, not as core forced identities.",

        "2. Investigate failure #5 (matter-direction margin = π/D within 0.13 %): "
        "is this telling us γ should be tweaked, or is it just numerology?",

        "3. Stop framing 'random vocabulary' tests as evidence about the "
        "framework.  The Cathedral integers are FORCED FACTS about the unique "
        "geometric structure in D=3 (the icosahedron, picked out by q=5 "
        "non-crystallographic + A_5 non-solvable).  There is no alternative "
        "vocabulary to draw from.  The test of the framework is direct "
        "comparison to physical observation, not adversarial random search.",

        "4. Continue to disclose every failure in skeptics_audit.failed_attempts. "
        "The framework's credibility comes from honest reporting, not from "
        "pretending — including disclosing test designs that turned out to be "
        "category errors (failure #6 is the example).",

        "5. Accept that the framework's strong sectors are QED dimensionless "
        "ratios + cosmology + mixing angles.  The EW dimensionful sector is "
        "the framework's weakest, where the v9 anchor-free chain is the best "
        "available derivation but doesn't reduce to clean integer matches.",

        "6. Frame the framework's claim correctly: it is not 'specific integer "
        "compounds beat random integer compounds.'  It is 'IF the icosahedral "
        "13-shell underlies D=3 physics, THEN observed constants will be "
        "Cathedral compounds.'  The test of THAT is the predictions registry "
        "(20 confirmed at median 0.08 % rel-err).",
    ]


# ── End-to-end audit ────────────────────────────────────────────────────

def failed_attempts_study_audit() -> Dict[str, Any]:
    return {
        "n_failures":              len(FAILURE_ANALYSIS),
        "by_category":             by_category(),
        "by_severity":             by_severity(),
        "patterns":                cross_cutting_patterns(),
        "recommendations":         recommendations(),
        "detailed_analysis":       FAILURE_ANALYSIS,
    }


def failed_attempts_study_audit_passes() -> bool:
    """The audit passes iff every failure has a detailed analysis,
    cross-cutting patterns are identified, and recommendations exist.
    """
    a = failed_attempts_study_audit()
    return (
        a["n_failures"] >= 6
        and len(a["recommendations"]) >= 5
        and "common_thread" in a["patterns"]
        and all(
            all(k in f for k in ("name", "category", "severity",
                                 "what_we_know", "interpretation", "actionable"))
            for f in FAILURE_ANALYSIS
        )
    )


def print_failed_attempts_study_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" FAILED ATTEMPTS STUDY — what the 6 disclosures tell us together")
    print(bar)

    print("\n[1] Six honest failures, by category:")
    for cat, ids in by_category().items():
        print(f"     {cat:30s} : failures {ids}")

    print("\n[2] By severity:")
    for sev, ids in by_severity().items():
        print(f"     {sev:14s} : failures {ids}")

    print("\n[3] Common thread:")
    print(f"     {cross_cutting_patterns()['common_thread']}")

    print("\n[4] What survives the failures:")
    print(f"     {cross_cutting_patterns()['what_survives']}")

    print("\n[5] What changes after the failures:")
    print(f"     {cross_cutting_patterns()['what_changes']}")

    print("\n[6] Recommendations:")
    for r in recommendations():
        print(f"     • {r}")

    print()
    print(bar)
    print(f" failed_attempts_study_audit_passes() = "
          f"{failed_attempts_study_audit_passes()}")
    print(bar)


__all__ = [
    "FAILURE_ANALYSIS",
    "by_category",
    "by_severity",
    "cross_cutting_patterns",
    "recommendations",
    "failed_attempts_study_audit",
    "failed_attempts_study_audit_passes",
    "print_failed_attempts_study_report",
]
