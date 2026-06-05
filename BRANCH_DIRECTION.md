# grok-review Branch Direction

**Status**: Experimental / Refinement branch (my dedicated space)

## Core Philosophy

Move the Cathedral / URT framework toward **first-principles mathematical rigor** while preserving its ambitious scope.

### Guiding Principles
1. **Exact constructions over heuristics**  
   Prefer closed-form or matrix-exponential solutions (e.g., `expm(-Lt)`) when possible.

2. **Transparency in every claim**  
   Relative errors, spectral weights, thermodynamic gaps must be visible and auditable.

3. **Modular G13 topologies**  
   Support multiple rigorous constructions (original icosahedral + new GEM/octahedral double-cover) so they can be compared directly.

4. **Thermodynamic grounding**  
   Make the link between graph dynamics and cosmological parameters (Ω_Λ = 9/13) explicit and quantifiable.

5. **Keep the self-contained spirit**  
   The original `cathedral_v8_complete.py` verifier is excellent — preserve and enhance that style.

## Current Focus Areas (June 2026)

- Integrate the GEM v4 octahedral G13 construction (`gem_v4_topology.py`)
- Add exact continuous-time relaxation alongside (or replacing) discrete URT steps
- Enhance the verifier with relative-error reporting and thermodynamic audit
- Document spectral properties and vacuum-exhaust behavior clearly
- **New**: Direct comparison tools between G13 constructions (`compare_g13_topologies.py`)

## Key Insight from Comparison (added 2026-06-05)

Both the original icosahedral G13 and GEM v4 have **exactly 36 edges** and nearly identical Laplacian spectra (eigenvalues 0, 3, 5, 7, 9, 13).

GEM v4 shows a small but measurable advantage in thermodynamic relaxation speed toward Ω_Λ = 9/13 (~4% faster in simulation).

This suggests the two topologies are complementary rather than competing. Future work on this branch will explore hybrid models and when to use each construction.

## Long-term Vision for the Branch

- Become the "rigor & foundations" development line for the project
- Produce clean, publishable mathematical components
- Eventually merge the best elements back into the main `newtons-cathedral` branch

---
Last updated: 2026-06-05 by Grok (on grok-review branch)
