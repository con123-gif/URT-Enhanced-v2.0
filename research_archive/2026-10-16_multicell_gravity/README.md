# Newton’s Cathedral — Multi-cell gravity, DEC and three-theorem audit

**Checkpoint:** 16 October 2026. **Program:** Newton’s Cathedral, with original URT as its prior recursive-selection and history principle.

This archive preserves all three user-proposed multi-cell theorems in a complete, corrected derivation with runnable tests. It also preserves the October 16 four-link Hodge/FDT and five-stage tidal reports. Later local counterchecks do **not** constitute a global no-go against the broader Cathedral programme.

## Files

| Research asset | Content |
|---|---|
| [Three-theorem research audit](CATHEDRAL_MULTICELL_THREE_THEOREMS_AUDIT_2026-10-16.md) | Proposed claims, proofs/obstructions, corrected equations and constructive path |
| [Three-theorem executable](cathedral_multicell_three_theorems_2026_10_16.py) | Original icosahedral matrices, true TT projector, corrected transfer spectra, 48³ screened lattice |
| [Three-theorem numeric JSON](cathedral_multicell_three_theorems_results_2026_10_16.json) | Machine-checkable checkpoints |
| [Four-link DEC/FDT audit](NEWTON_CATHEDRAL_FOUR_LINKS_DEC_FDT_AUDIT_2026-10-16.md) | Edge Hodge separation, orientation parity, native curl wave, BKM positivity, energy |
| [Four-link JSON](cathedral_four_links_results.json) | Earlier DEC/FDT calculation results |
| [Five-stage tidal report](cathedral_five_stage_report_2026_10_16.md) | Exact propagator, two different action ratios, Gaussian-bath assumptions |

The executable geometry dependency is [cathedral_operator_audit.py](../2026-10-15_icosahedral_125_DEC_H64/cathedral_operator_audit.py), retained alongside earlier signed-chirality, 10D and complex-BKM checks in that dated folder.

## Audited conclusions

**1. Five-to-two spin-2 claim:** The vertex dipole gradient and fiveplet gradient images have **zero intersection** on the 30 oriented edges, since P3 L_ico P5 = 0; their combined rank is 8. The 5−3=2 count is independently valid for the rank-three map Q_ij -> k^i Q_ij on symmetric trace-free 3x3 tensors after choosing a nonzero spatial wavevector. Derivation of actual propagating Lorentzian graviton polarizations needs the 4D gauge and wave equations.

**2. Multi-cell gravity:** For the specified on-site BKM stiffness chi and nearest-cell J, the equilibrium equation is (chi I+J L_net)q=S. Its 3D continuum response is **screened**: G(r)~exp(-r/ell)/(4 pi J r) (with lattice measure factors), ell~sqrt(J/chi). A protected shift-symmetric massless branch, if derived independently, could yield an unscreened 1/r potential and inverse-square gradient. The supplied icosahedral cell does not by itself determine a space-filling tiling, scalar mass-source map or physical Newtonian normalization.

**3. Four-sector transfer:** For M=(L_ico+11^T)/20, only the uniform singlet sees the +12 rank-one term. Correct values on (1,3,5,3prime) are (0.6,0.138196601,0.3,0.361803399); normalized by the uniform eigenvalue they are (1,0.230327669,0.5,0.603005665). Quadrupolar relative power still drops by exactly 1/4 in the normalized transfer.

## Reproduce

From this folder with NumPy installed, run:

    python cathedral_multicell_three_theorems_2026_10_16.py

The program finds the sibling October 15 geometry module and rewrites the local results JSON. The independent numerical audit passed with dipole/quad edge overlap ~9.10e-16, TT projector residual below 2e-16, four-sector transfer residual 3.32e-16 and 48³ periodic screened-field residual 6.82e-16. The test ratio J/chi=16 is **illustrative**, not derived.

## Research continuity

Retain the original URT algorithm, pi/e spiral and golden phase, 13-cell and 125-simplex Hodge identities, master Gibbs/BKM state, signed face chirality, complex fiveplet response, previous H64 flavour and gauge algebra, and plasma/chaos experiments according to their own evidence ledgers. No physical Einstein equation, absolute G, unique long-range scalar/tensor source coupling, or gravitons have been independently derived from this new multi-cell action.
