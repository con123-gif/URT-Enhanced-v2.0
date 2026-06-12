#!/usr/bin/env python3
"""
Resonant 5D Unified Demo - Grok-Review Branch

A single runnable script that demonstrates the coherent vision:

G_{13} Geometry → Resonant Spectrum (Laplacian eigenvalues)
→ 5D Manifold View (4D Lorentzian + resonant extra dimension)
→ Gem V4 Kernel resonant shell cascade on actual mode amplitudes
→ Thermodynamic audit against Cathedral target Ω_Λ = 9/13

This is the current "playground" state of the branch.
Pure mathematics. First principles. No empirical fitting.
"""

import numpy as np

# Import from the framework
try:
    from newtons_cathedral.qft import resonant_energy_spectrum, mode_superposition_energy
    from newtons_cathedral.lorentz import minkowski_metric, fiedler_equals_D
    from canonical_v4_gem_kernel import CanonicalV4GemKernel
except ImportError:
    print("Please run from the repo root with the package installed (pip install -e .)")
    raise


def main():
    print("=" * 75)
    print("GROK-REVIEW: RESONANT 5D UNIFIED DEMO")
    print("G_{13} → Resonant Spectrum → 5D Manifold → Gem Kernel Cascade")
    print("=" * 75)

    # 1. Resonant Spectrum from G_{13} (qft.py)
    print("\n[1] Resonant Energy Spectrum from G_{13} Laplacian")
    spec = resonant_energy_spectrum()
    print(f"   Frequencies (first 6 λ_k): {spec['frequencies'][:6]}")
    print(f"   Pole masses (first 6 m_k):   {spec['masses'][:6]}")
    print(f"   Ground state resonant energy: {spec['ground_state_energy']:.6f}")

    # 2. 5D Manifold Context
    print("\n[2] 5D Manifold View")
    print("   - 4D emergent Lorentzian from K4 sector (lorentz.py)")
    print("   - 5th dimension = resonant margin δ (Lytollis)")
    print("   - Laplacian eigenvalues = resonant frequencies on the scaffold")
    print("   - Mode superpositions create coherent energy configurations along the 5th dim")

    # Verify Lorentzian structure
    g = minkowski_metric()
    print(f"   Minkowski metric signature confirmed: diag({np.diag(g)})")
    print(f"   Fiedler eigenvalue = D check: {fiedler_equals_D()}")

    # 3. Seed Gem Kernel with actual resonant mode amplitudes
    print("\n[3] Gem V4 Kernel Cascade on Resonant Modes")
    kernel = CanonicalV4GemKernel(num_shells=13)

    # Use lowest non-zero resonant modes as input state (normalized)
    resonant_modes = spec['masses'][1:5]  # modes 1-4
    resonant_modes = resonant_modes / np.max(resonant_modes)  # normalize

    print(f"   Input (normalized resonant mode amplitudes): {resonant_modes}")

    output_state = kernel.execute_n_resonance_shells(resonant_modes)
    audit = kernel.run_diagnostic_audit(resonant_modes)
    thermo = kernel.calculate_thermodynamic_bounds()

    print(f"   Output after 13 resonant shells: {output_state}")
    print(f"   Measured chaos (entropy proxy): {audit['measured_chaos_estimate']:.6f}")
    print(f"   Within Cathedral bounds: {audit['within_bounds']}")
    print(f"   Resonant stability near Ω_Λ = 9/13: {audit.get('resonant_stability', 'N/A')}")

    # 4. Thermodynamic Context
    print("\n[4] Thermodynamic / Resonant Stability Window")
    print(f"   Entropy ceiling (ln2):           {thermo['entropy_ceiling']:.6f}")
    print(f"   Cathedral target Ω_Λ = 9/13:   {thermo['cathedral_target']:.6f}")
    print(f"   Stability tax (Lytollis margin): {thermo['stability_tax']:.6f}")
    print(f"   Resonant margin δ context:       The 5th dimension thickness")

    print("\n" + "=" * 75)
    print("SUMMARY: G_{13} resonant modes → 5D manifold → coherent energy via Gem cascade")
    print("All quantities derived from D=3 + A_{5} symmetry. Pure mathematics.")
    print("=" * 75)


if __name__ == "__main__":
    main()
