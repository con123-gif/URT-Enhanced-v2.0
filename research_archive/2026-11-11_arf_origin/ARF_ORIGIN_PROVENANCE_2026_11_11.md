# Origin of the four ARF residues (Drive provenance, read 2026-11-11)

Source: Google Drive, `Colab Notebooks/Untitled96.ipynb` (file id `1RUpVbHqhkHo4ECZb5O7guPD4Zuglxq_s`,
created 2025-11-24), titled in its docstring "Lytollis Law - ARF Closure from First Principles".
The Drive folder `URT_Cathedral_ARF_Proof` is empty.

What the notebook states, in its own words:
- ARF = "Analytical Residue Function".
- The four residues are "empirically measured residues at the 5D fixed point" X* = (δ★, Δδ*, R_α*, C_mass*, R_mass*),
  "the ONLY empirical inputs": Δδ = −0.00035959, C_mass = 4.4468, R_α = 0.03380537, R_mass = −2.43, with δ★ = 0.1475.
- Assembly: α⁻¹ = 137 + δ_eff²/π² + R_α; m_p/m_e = 6π²/δ★ + π√(4π²/δ★) + C_mass/δ★³ + R_mass.
- The ansatz coefficients A ≈ 1/6, B ≈ 30, C ≈ 1, D ≈ 33/2 are solved from those four numbers.

Arithmetic check (executed 2026-11-11): 137.035999 − 137 − δ_eff²/π² = 0.03380537 to all eight printed digits,
so R_α is the measured α⁻¹ minus the other terms. The mass assembly returns 1836.15 with one equation fixing
two residues (C_mass, R_mass).

Consequence: the later closed forms (δ⋆³/63 + γ/40, 3/(64φ) + 1/(79φ²), 30δ⋆ + 3/140, (3/35)δ⋆² − (4/51)π³)
are fits to these four fitted numbers. Status: NOT A DERIVATION. The 2026-11-09 four-channel reconciliation
targets are therefore measured inputs, not predictions.
