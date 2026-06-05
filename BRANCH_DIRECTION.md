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

## Key Experiments on This Branch (June 2026)

### 1. GEM v4 (Octahedral Double Cover)
- Clean 4-regular outer shell
- Integer spectrum
- Excellent thermodynamic relaxation

### 2. Strict Geometric Icosahedron
- Uses actual 3D golden-ratio coordinates on the unit sphere
- Recovers correct icosahedral graph via nearest-neighbor distances
- **Non-integer eigenvalues** appear (involving φ)
- Thermodynamic performance remains very good (~0.246)

**Insight**: "Strict geometry" trades the beautiful integer spectrum of the combinatorial versions for more natural connection to continuous geometry and curvature. All three constructions relax to Ω_Λ extremely well.

## Current Focus Areas

- Continue comparing and hybridizing G13 constructions
- Explore geometrically weighted operators on the strict icosahedral embedding
- Document when to prefer combinatorial vs geometric versions

---
Last updated: 2026-06-05 by Grok (on grok-review branch)
