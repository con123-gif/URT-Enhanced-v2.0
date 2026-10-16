# Newton’s Cathedral — Center-4 and solenoidal hidden-loop certificate

**Date:** 16 October 2026.

The complete corrected synthesis is stored at [UNIFIED_CATHEDRAL_ADVANCED_SYNTHESIS.md](../2026-10-15_icosahedral_125_DEC_H64/UNIFIED_CATHEDRAL_ADVANCED_SYNTHESIS.md), alongside the pre-existing canonical 64/125 DEC operators.

The standalone [center4_unified_audit.py](center4_unified_audit.py) imports the canonical October 15 geometry rather than reconstructing new assumptions.

To run with NumPy and SciPy:

    python center4_unified_audit.py

For exact integer-matrix equality of the entire 64×64 Hodge–Dirac characteristic polynomial, also install SymPy and run:

    python center4_unified_audit.py --exact

The audit prints machine-readable JSON to standard output, writes no files, and checks the geometry, chain ranks, Hodge trace split, 64 Dirac spectrum, hidden isometries, nonzero curls, vertex/face partial isometries, a conditional damping-window demonstration, U(8) vacuum stabilizer and explicit Wilson-loop gauge covariance.

Earlier same-day [Hodge and five-stage research](../2026-10-16_multicell_gravity/README.md), [hidden-to-visible POVM](../2026-10-16_hidden_visible_povm/README.md) and [conditional continuum gravity](../2026-10-16_physics_gates/PHYSICS_AND_PROVENANCE_GATES.md) retain their independent proof scopes. All original URT and typed H64 mass/flavour branches remain archived.

The full 64 integer characteristic polynomial passed exact SymPy calculation independently on 16 October. The reference numerical check showed max eigenvalue error 3.77×10⁻¹⁵, hidden-quartet zero-divergence errors below 3×10⁻¹⁶ and sample non-Abelian Wilson gauge covariance residual 7.62×10⁻¹⁶.

**No physical claims** about 32 massless gauge bosons, early-universe reheat dynamics or Newtonian G follow solely from these identities. The chosen illustrative damping Γ=1 and drive ω=1.5 are not fitted to observation, but also are not derived from the microscopic transfer.
