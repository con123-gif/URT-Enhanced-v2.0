#!/usr/bin/env python3
"""
Resonant Modes & Energy Configurations Demo
============================================

Playground script on the grok-review branch.

Demonstrates how the G_{13} Laplacian eigenvalues define resonant frequencies,
and how superpositions of these modes produce different energy configurations
(illustrative of coherent resonant states vs. localized energy packets).

Run:
    python resonant_modes_demo.py

This stays firmly in the pure mathematical / geometric framework.
"""

from newtons_cathedral.qft import (
    resonant_energy_spectrum,
    mode_superposition_energy,
    pole_masses,
)

import numpy as np


def main():
    print("=" * 70)
    print("GROK-REVIEW: RESONANT MODES & ENERGY CONFIGURATIONS DEMO")
    print("G_{13} Laplacian eigenvalues = resonant frequencies of the geometric scaffold")
    print("=" * 70)

    spec = resonant_energy_spectrum()
    print("\nResonant Energy Spectrum (first 6 modes):")
    print(f"  Frequencies (λ_k): {spec['frequencies'][:6]}")
    print(f"  Pole masses (m_k): {spec['masses'][:6]}")
    print(f"  Ground-state resonant energy (lowest non-zero): {spec['ground_state_energy']:.6f}")

    print("\nMode superposition energy examples (toy model):")
    e_single = mode_superposition_energy(modes=[1])
    e_low = mode_superposition_energy(modes=[1, 2, 3])
    e_higher = mode_superposition_energy(modes=[4, 5, 6])
    print(f"  Single low mode (k=1):     {e_single:.6f}")
    print(f"  Coherent low modes (1+2+3): {e_low:.6f}")
    print(f"  Higher modes (4+5+6):      {e_higher:.6f}")

    print("\nInterpretation (pure math):")
    print("  - Laplacian eigenvalues λ_k are the natural resonant frequencies.")
    print("  - Pole masses m_k set the energy scale of each resonant mode.")
    print("  - Superpositions illustrate how exciting multiple resonant modes")
    print("    can produce extended (coherent) or more localized energy distributions.")
    print("  - URT contraction + Lytollis margin keeps these configurations bounded.")

    print("\n" + "=" * 70)
    print("This is mathematical structure — any physical mapping is downstream.")
    print("=" * 70)


if __name__ == "__main__":
    main()
