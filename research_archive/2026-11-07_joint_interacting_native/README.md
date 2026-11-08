# Original November 7 full 190×64×24 interaction and November 8 modular-source theorem

This folder preserves the **original** saved November 7 source, full report, execution results and original randomized test logs, plus the **new** exact modular-source matching theorem of November 8. These are Newton's Cathedral project materials; no external Yang–Mills research source/code is copied.

## Evidence

- `CATHEDRAL_CONSTRUCTED_COMPLETE_FINITE_INTERACTION_2026-11-07.md` — original report, original assumptions.
- `cathedral_constructed_joint_dynamics_2026_11_07.py` — source-loaded actual five-Platonic 190 cochains, native 64 Walsh histories, 24 charged clock, Golay coding, nonlinear source portal, KMS adaptation.
- `cathedral_constructed_joint_dynamics_2026_11_07.results.json` — original outputs, *not* an independently observed data set.
- `test_cathedral_constructed_joint_2026_11_07.py` — original randomized checks.
- `CATHEDRAL_MODULAR_SOURCE_INTERFACE_THEOREM_2026-11-08.md` — proof: unique positive modular square root selects Δ hidden amplitude, exact 24-history Schur elimination, A5 source-map multiplicity, and two distinct non-fitted models.
- `cathedral_modular_joint_interface_verify.py` — independent test against the complete original operator, **not a reduced toy**.

## Rerun

Requires Python 3.10+ and numpy/scipy/sympy/mpmath.

```bash
python research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py
python research_archive/2026-11-07_joint_interacting_native/test_cathedral_constructed_joint_2026_11_07.py
python research_archive/2026-11-07_joint_interacting_native/cathedral_modular_joint_interface_verify.py
```

**Run status, 8 November 2026:** original main script PASS; original randomized test PASS (8 independent samples, maximum error 3.55e-15); new interface verifier PASS (all projector, representation, energy, Schur and gauge checks). These are model-defined mathematical checks, not a full continuum physical derivation.

**What is forced:** given the frozen hidden Gibbs operator and the *explicit* positive-amplitude source-transport rule, hidden coupling ratio Δ is the unique nonnegative square-root amplitude; on the chosen nonlinear source, 64×24 Gaussian elimination and a quartic lower bound are exact.

**What remains not forced:** the original 50→8→12 portal, choice among four A5-equivariant quadratic source maps, microscopic source-transport rule, unique physical gauge/clock/continuum identification, Standard Model / GR.

**Provenance:** this is the user's original Cathedral research, not James Montgomery Lockwood's separate Yang–Mills work. His credited research appears only in the other independently written `2026-11-08_curvature_response` folder, not here.
