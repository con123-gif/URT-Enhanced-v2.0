"""
URT Cathedral Framework — pure-math branch
==========================================

This is the **pure-math** view of the framework, containing only the
mathematical content: foundational integers, structural identities,
tour modules across mathematics, and meta-audit tooling.

For the full theory (physics applications, predictions registry,
v9 anchor-free chain, dark-matter candidates, electroweak sector,
cosmology), check out the `main` branch.

WHAT'S HERE
-----------

  Foundational
    urt.shell_closure           — Cathedral integers + δ★
    urt.iron_proof              — D=3 → A_5 → N=13 → δ★ chain
    urt.first_principles        — π, φ, e are forced
    urt.cathedral_engine        — π-φ-e flow on G_{13}
    urt.pi_phi_e_flow           — uniqueness of η, η_L, μ

  Tour modules (every Cathedral integer appearance in pure math)
    urt.cathedral_connections
    urt.cathedral_grand_tour
    urt.cathedral_deep_tour
    urt.cathedral_modular_tour
    urt.cathedral_quantum_lie_tour
    urt.cathedral_geometric_tour
    urt.cathedral_classical_tour
    urt.cathedral_advanced_tour
    urt.cathedral_topological_tour
    urt.cathedral_codes_tour

  Algebra / Lie / number theory  (~30 modules; see urt/ directory)

  Sectors / frustration / dynamics
    urt.sector_ratio            — (D+1)/(D!+D) = 4/9 fingerprint
    urt.exhaust_dimensions      — 4 + 9 = 13 dimensional split
    urt.cathedral_sectors       — K_4 ⊕ A_5 sector decomposition
    urt.icosahedral_frustration — q = 5 forbidden + six facets
    urt.matter_direction        — D·N·φ vs F·(1−γ)·π
    urt.six_cycle_cathedral     — δ★ and δ_cl on logistic 6-cycle
    urt.chaos_and_flow          — 2^q·π² dynamical normalisation

  Music geometry (pure)
    urt.music_geometry_cathedral — just-intonation as Cathedral ratios
    urt.spectral_music_cathedral — G_{13} spectrum as music intervals

  Lytollis & synthesis
    urt.lytollis_bounded_chaos  — δ = (D_KY−1)(τ−2) universal law
    urt.cathedral_lytollis_synthesis — same theory, two views

  Meta / audit
    urt.cathedral_compression   — quantifying numerology vs significance
    urt.skeptics_audit          — provenance + cross-module map
    urt.failed_attempts_study   — analysis of disclosed failures
    urt.null_hypothesis_test    — RETRACTED test (kept for transparency)
    urt.urt_algorithm_analysis  — empirical iteration properties

USAGE
-----

  >>> from urt.shell_closure import D, q, V, N, E, F, G
  >>> from urt.iron_proof import iron_proof_chain
  >>> from urt.cathedral_grand_tour import all_grand_tour_verify
  >>> assert all_grand_tour_verify()

  >>> from urt.sector_ratio import sector_ratio_audit_passes
  >>> assert sector_ratio_audit_passes()

  >>> # The four foundational facts at D=3
  >>> from urt.shell_closure import D, N, q, gamma
  >>> assert D == 3
  >>> assert N == D**2 + D + 1 == 13      # icosahedral closure
  >>> assert q == D + 2 == 5               # forbidden crystallographic n-fold
  >>> assert gamma == 1 / D**(D+1) == 1/81 # γ-ladder exponent

WHAT'S DEPRECATED HERE
----------------------

  This branch deliberately omits ~105 physics-application modules:
  * cathedral_v8 / v9 (anchor-free physics chain)
  * predictions_registry (PDG-tied predictions)
  * electroweak, ckm_pmns, dark_matter, baryon_asymmetry
  * cosmology, gravity, holography, vacuum_instability
  * 60+ domain-specific *_cathedral modules (climate, EEG, music,
    psychology, linguistics, materials, …)

  These remain on the `main` branch.  The pure-math view is for
  readers and researchers interested only in the mathematical
  structure: the Cathedral integers' canonical appearances across
  algebra, Lie theory, modular forms, number theory, geometry, and
  combinatorics.
"""

__version__ = "pure-math (snapshot of main v2.9.76)"
__author__ = "Cornelius Lytollis"

# Re-export only the seven Cathedral integers and δ★ at the top level for
# convenience.  Everything else is `from urt.<module> import <thing>`.
from .shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR

__all__ = ["D", "q", "V", "N", "E", "F", "G", "gamma", "phi", "DELTA_STAR"]
