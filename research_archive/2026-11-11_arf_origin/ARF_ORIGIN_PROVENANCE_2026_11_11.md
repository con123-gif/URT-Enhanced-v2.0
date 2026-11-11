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

## Scope correction (2026-11-11, same day)
The conclusion above rests on ONE Drive notebook. Unread: Untitled83–112, 97, 101, 105, 108, 111,
`LYTOLLIS_LAW_COMPLETE_EVIDENCE.ipynb`, `Canonical_Cathedral.ipynb`, `MASTER_Cathedral_Notebook.ipynb`,
`Cathedral_URT_Master_Proof.ipynb` (31 MB). The Drive connector returns notebooks only as base64 into the
chat, so files above ~50 KB cannot be read that way. "Not a well-posed target" is withdrawn until they are read;
"the residues in Untitled96 are fitted" stands.

## Second Drive source: logistic 6-cycle report (Grok, 2026-04-22; file id 1MIhS51Nr1ag54hI3wu1aVsF_Jw9ZJZbO)
Claim: δ★ = 0.14742193616230046 and ≈0.15 are the two lowest branches of the stable 6-cycle of x → r x(1−x)
at r = 3.8417002878419497. Executed 2026-11-11 (Claude sandbox, 400000-step transient):
- Reproduces: branches 0.1474219361622878, 0.1500067276982269; Lyapunov −0.01125.
- r is tuned to the lower branch: one parameter, one target. The second branch is then a prediction: it misses 0.15 by +6.7×10⁻⁶.
- With the current frozen δ⋆ = 80π/(1053φ) = 0.14751081 on the lower branch, the upper branch is 0.14991947: it misses 0.15 by −8.05×10⁻⁵.
  So the current δ⋆ and δ_cl = 3/20 do not lie on one logistic 6-cycle; the report's older δ★ nearly does.
- Untuned canonical points do not give the rails: superstable 6-cycle (r = 3.844568792194) → 0.143586, 0.153667;
  3→6 doubling point → 0.14872.
Status: one-parameter numerical coincidence at the 5×10⁻⁵ relative level for the old δ★; not a parameter-free selection.
