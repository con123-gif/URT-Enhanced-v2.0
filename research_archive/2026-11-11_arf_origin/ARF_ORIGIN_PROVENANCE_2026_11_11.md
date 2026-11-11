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

## Third Drive source: "Lytollis's Law" paper, 25 Nov 2025 (read 2026-11-11, later the same day)
Source: `LYTOLLIS_LAW_COMPLETE_EVIDENCE.ipynb` (file id `1h9E4RbE4A5ijn2kZetxZx67OdYPC5CWk`, 273 KB). Read in full by
downloading through the Drive connector to disk (the size limit noted above no longer applies: oversized connector
results are written to a file and decoded locally). Also read: the cell extracts in `MASTER_Cathedral_Notebook.ipynb`
(`1e7BAWy-qiTtHGsdZK4bC3WbbBlfvUsh6`), which reproduce the 13-shell, ARF and PMNS cells of the 31 MB
`Cathedral_URT_Master_Proof.ipynb`.

What it states:
- Law 1: δ = (D_KY − 1)(τ − 2) "converges under recursive tuning" to δ★ = 0.1475 ± 0.0005; 20,000 logistic/tent/Hénon
  systems give δ_chaos = 0.1523 ± 0.0005, CV 0.33 %.
- Law 4: the "5D fixed point" X★ = (δ★, Δδ★, R_α★, C_mass★, R_mass★) is the tuple of the four residues and δ★;
  no code for its PCA (PC1 = 99.9984 %) or the 5,400-system test is in the notebook.
- Law 6: the original ARF is Δδ = −(1/2π)(δ★/π)², C_mass = 3π²δ★, R_α = δ★²φ(1 − δ★/4), R_mass = −π²φδ★,
  "fitted numerical values converge to exact mathematical constants 2π, 3π², π²φ, 4", average error 1.90 %.
  The later integer closed forms (v101) replaced these.
- None of the notebook's code cells executes the listings; every code cell writes the same LaTeX paper. No stored outputs.

Executed audit (`CHAOS_INVARIANT_REFINEMENT_AUDIT_2026_11_11.py`, the listing's `compute_delta_from_trajectory`
verbatim; Claude sandbox 2026-11-11, then CI):
- The listing's "URTF refinement", δ ← δ − 0.5 e^(−i/8)(δ − 0.15)(1 + δ²/(1+δ²)) for 30 steps, is a fixed map of the raw
  value. Its image over every admissible raw value δ₀ ∈ [0.01, 1] is [0.14905, 0.15245]; dR/dδ₀ = 0.0064 at 0.15.
- Raw estimator over 1,200 maps: mean 0.271, CV 23.3 %. Refined: mean 0.1507, CV 0.24 %.
- White noise (no dynamics) gives 0.15132.
- Replacing the hard-coded 0.15 by 0.10 / 0.30 / 0.40 gives "invariants" 0.1010 / 0.2998 / 0.3995.
- The URTF listing's documented example urt(10.0) = 4.2e-12 is false: it returns 25.6; the map escapes for |x| > 3.64.
- Law 6 errors reproduce the paper's table: 2.43 %, 1.79 %, 0.29 %, 3.07 %.

Consequence, at exactly this strength: the 2025 chaos survey is not evidence for δ★. Its ~0.15 is the hard-coded
refinement setpoint (equal to δ_cl = 3/20), reached from any input. The frozen Cathedral inputs δ⋆ = 80π/(1053φ) and
δ_cl = 3/20 are definitions and are unchanged; any support for them has to come from the geometry and the native
dynamics, not from that survey. Status: REVIEW of historical evidence (executed); no gate affected.

## Fourth and fifth Drive sources: how the rational closures were obtained (read 2026-11-11)
- `MASTER_Cathedral_Notebook.ipynb` (`1e7BAWy-qiTtHGsdZK4bC3WbbBlfvUsh6`, downloaded in full) reproduces cells of the 31 MB
  `Cathedral_URT_Master_Proof.ipynb` (`1tm9k5COcySqKovOVqOrWAlb9sE7NnWpp`; over the connector's 10 MB download cap, not read
  directly). Master Proof cell 1670, in its strict mode: "ARF residues: NOT DERIVED HERE"; it treats the four rational laws
  as axioms. Cell 1672 ("URT-forced derivation") minimises 10·|δ_eff − δ★| plus range penalties by a seeded random search,
  snaps the result to fractions with denominators ≤ 2000, and then prints the hard-coded canonical laws in its second mode.
  The score does not constrain R_α beyond 50 < α⁻¹ < 300, so it cannot select 3/64 and 1/79. (Read, not executed.)
- `Canonical_Cathedral.ipynb` (`1sHlxgovSosR0d_xwQXsCyU_AKncD3_Y_`, downloaded in full): `closure_search_64` and
  `scan_64_candidates` scan 64 and 256 rational combinations, two choices per coefficient with the canonical value always
  one of the two, and keep those within 2e-6 or 5e-7 of the frozen residue TARGETS. Its "URT attractor" cell calls
  `simulate_attractor` and `cluster_centers`, which are not defined anywhere in the notebook. (Read, not executed.)
Consequence: confirms Con's account that the closures were found by algebra matching against measured targets.
