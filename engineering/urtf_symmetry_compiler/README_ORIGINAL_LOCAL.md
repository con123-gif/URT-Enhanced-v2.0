# URTF / Newton's Cathedral Symmetry Compiler — local mathematical tool

Local-only research pack, 15 October 2026. Nothing has been uploaded to GitHub.

## Run

Python 3.10+, NumPy and SciPy. From the extracted directory:

```bash
python -m pip install -r requirements.txt
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URTF_Cathedral_symmetry_compiler_LOCAL.py
```

The script prints direct-solve residuals and writes `URTF_Cathedral_symmetry_compiler_results_LOCAL.json` in the directory containing the script.

## Important result

For the 64-dimensional augmented icosahedral carrier, under proper A5 rotational symmetry, every invertible commuting operator has an inverse given by **five cubic Cayley–Hamilton expressions**, computed from traces on the five representation projectors; no eigenvalue calculation is needed to apply this inverse. A general rank-`r` perturbation can be handled by an `r×r` Woodbury correction. Repeated *nearest-stage* coupling of fixed-size cells admits O(stage count) direct Thomas recurrences after fixed-size preprocessing. These are standard symmetry and linear-algebra theorems specialized to the Cathedral complex.

## Reusable Python functions

```python
from cathedral_operator_audit import geometry
from URTF_Cathedral_symmetry_compiler_LOCAL import (
    group_64, a5_projectors, ch_inverse_coefficients, compile_inverse)

vertices, edges, faces, boundaries, incidence = geometry()
actions, traces, orders = group_64(vertices, edges, faces)
projectors = a5_projectors(actions, traces, orders)

# The caller supplies their own 64x64 *invertible* operator K and RHS b.
# Required: ||U_g K-K U_g|| small for all 60 rotations.
coefficients, invariants = ch_inverse_coefficients(K, projectors)
x = compile_inverse(K, projectors, coefficients)(b)
```

The demonstration also includes `layered_solve`, `urtf_boundary`, `h64_species_woodbury` and complete unit-like matrix assertions.

## Scope

The operator used in the numerical demonstration is a *chosen*, positive Hermitian combination of the previously audited cellular Dirac square, vertex-face incidence and i times signed-face orientation matrix. Its coefficients use the existing Cathedral `Delta` and `eta`, but their **placement does not follow uniquely from a microscopic physical action**. Likewise, setting a nearest-stage coupling to the existing selector value 1/4 is a model assumption, not a predicted universal interaction strength.

The golden angle and pi/e generate the optional URTF forcing/boundary history. They are not what proves the Cayley–Hamilton inverse. The proven structural accelerator is A5 representation multiplicity and locality. For broken symmetry without known finite-rank or local structure, an O(N) direct method is not guaranteed.

All physical-sector warnings and complete derivations appear in `URTF_Cathedral_Symmetry_Compiler_REPORT_LOCAL.md`.

## Files

- `URTF_Cathedral_symmetry_compiler_LOCAL.py` — compiler plus verification suite.
- `cathedral_operator_audit.py` — original exact 64-state geometry dependency.
- `cathedral_strict_64_closure.py` — species-loaded 64-state dependency.
- `URTF_Cathedral_symmetry_compiler_results_LOCAL.json` — captured full numerical results.
- `URTF_Cathedral_Symmetry_Compiler_REPORT_LOCAL.md` — exact theorem, algorithm, empirical results, caveats.
- `requirements.txt` — NumPy and SciPy.