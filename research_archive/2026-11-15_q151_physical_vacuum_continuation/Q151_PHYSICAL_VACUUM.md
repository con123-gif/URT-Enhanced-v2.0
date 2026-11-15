# Q151 — Resume real native Q150 gauge field, test stationary vacuum and 481D stability

Date: 2026-11-15. Track M, physical electromagnetism, not an isolated graph moment.

## Actual completed Q150 data, not a promise

Q150 **did finish its GitHub Actions calculation** (run [43715542715](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43715542715), at 12:48 UTC, state branch persisted result and 528-component candidate). It made a major nontrivial descent in the conditional original v61/Q109 finite Gaussian action:

- Original 2D seed: ΔΓ=−324.0095802681, full gradient 227.0189962.
- Completed 450 full-field L-BFGS iterations: **ΔΓ=−7389.66246102273**, full gradient **0.05694848122190085**; 47-dimensional gauge Ward residual **1.5780961440×10⁻¹²**.
- Original v61 SHA256 `e6bd037ffd706150dd9fe8eeeca8908a7c1a88c71a21f589b7eb05ce93128d75`. Source and result pinned by Q151 immutable state SHA `add2ab4396a1f2c92a590606fb9685052a07cd46` and seed SHA256 `408a918a1e02af8125a2fcde59d0b4f19dc7f79c8e518e731209387f24946d12`.
- **Not converged**, because `0.05695 > 10⁻⁴`. Output code was 0 because this was a successful compute task, not because a stationary vacuum was found. The `sin(c/3)` flux numbers in that Q150 run are **not physically reliable** (see Q150a correction).

## New Q151 direct physics computation

The executable `Q151_NATIVE_VACUUM_CONTINUATION.py` is registered as `q151-resume-native-528-physical-vacuum` in the GitHub compute queue, resuming from **the saved exact Q150 numerical candidate** rather than rebuilding from A=0 or old Q110. It must first reproduce Q150's action and full gradient from the unmodified original Wilson code, then:

1. Continue actual 528-variable conditional microscopic action minimization with native Q109/Q110 complete analytic gradients; do not force or fit photon parameters.
2. Compute all **3,216 original 4D Wilson 2-cell observables** using `|exp(i c/3)-1|=2|sin(c/6)|`, sensitive to nontrivial `-1` holonomy and invariant under correct 6π link period. Verify all 47 Ward directions.
3. Test stationarity of **all 528 derivatives**, not merely action descent or projected gradient; threshold <10⁻⁴.
4. If actually stationary, approximate smallest eigenvalues of the *full 481-dimensional gauge-transverse Hessian*, while explicitly distinguishing numerical negative-mode detection from rigorous proof of full positive definiteness.
5. Keep source/seed hashes, correct flux, numerically reached status and candidate .npy/JSON in durable compute state.

**Physical limits:** This is still Q109's *conditional equal moving/spatial kinetic ratio*, not the full first-principles 190/64/24 positive-transfer selection. A single finite 6×2×2×2 lattice cannot establish the `q→0` continuum Maxwell photon pole; volume extrapolation or an analytic long-wavelength transfer law is necessary. No fine-structure constant or mass is derived by finding a finite stationary point. The full five-Platonic 190/H64 and moving source remain part of the model via Q109/Q106; do not reduce Cathedral to a 13-contact toy, nor reimport older Q77/historical ARFs.

## Exact validation of the corrected observable

For minimum charge 1/3, `U_f=exp(i c/3)`. Gauge-invariant distance from trivial flux:
`d(c)=|U_f-1|=2|sin(c/6)|`. Thus `d(0)=0`, `d(3π)=2` and `d(6π)=0`. The Q150 old monitor `sin(c/3)` falsely gave zero at `c=3π`. The correction is in source, not numerical fitting.

## RESUME HERE

Read Q151_RESULT.json from compute state branch when job finishes. If gradient still large, use the newly saved candidate for warm-start continuation, **not Q110's old seed**. If gradient is small, inspect all 481 transverse Hessian directions plus flux and low-momentum source projection. Next physical gate: primitive URT uniquely fixes the moving/spatial kinetic ratio and a coherent real-time law, then derive the transverse 4D photon pole under lattice refinement, not a chosen synthetic Maxwell ansatz.
