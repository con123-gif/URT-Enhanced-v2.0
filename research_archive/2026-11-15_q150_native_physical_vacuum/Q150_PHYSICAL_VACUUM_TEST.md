# Q150 — Direct 528-link physical gauge vacuum search, not another graph moment

**2026-11-15; Track M; status: ACTIVE, OPEN.** Native execution has not yet returned a result at the time this code/job is committed.

## Physics target

The aim is to establish how original five-Platonic 190/H64/24 URT asymmetry and its charged matter give an actual 4D Maxwell response, matter source normalization and ultimately measurable electromagnetism and gravity without fitting. Q109–Q111 did more physical work than recently repeated graph spectral moments: they used the original unchanged v61 48-site/528-link charged Wilson action and derived 84 negative physical gauge Hessian modes around A=0; Q110 established a nonzero minimizer exists in its stated Gaussian action but did not locate it; Q111 fixed the fractional-charge link torus period at 6π. Q149 further proved that ≥80 of those negative directions carry *local* 4D curvature, so global toron adjustment alone cannot restore stability.

## New native algorithm and strict tests

The executable **imports Q109 and Q110's original full native 528-link calculations**, without transcribing or replacing their matrices. It uses Q110's *already lower-action 2D downhill physical field* as the deterministic seed for a much longer full-dimensional L-BFGS variational search. This algorithm does not alter the action, charge spectrum, relative unit kinetic normalization or experimental comparison targets. It imports Q109's analytic first derivative; its gradient exactly respects the 47-dimensional original Wilson gauge redundancy.

For every candidate:
- Verify **all 528 gradient components**, full norm, and the 47 gradient Ward residual. A smaller action alone is NOT convergence.
- Measure **3216 actual native closed 2-cell Wilson loops** (2640 parallelograms and 576 temporal-spatial triangles from Q149), using the minimally charged q=1/3 phase to respect the **6π** global link period.
- Save every 10 optimizer iterations (numeric candidate *.npy and JSON), and final gauge field, action drop, physical flux norm, gradient norm, and optimizer status as separate compute artifacts.
- Mark a candidate **numerically stationary** only when ||grad Γ|| < 10⁻⁴ and Ward residual < 10⁻⁶. This is a numerical stopping criterion, not a new fitted physical coefficient.
- Do NOT claim a stable vacuum, physical photon, or α from convergence alone: one must establish full 481D transverse Hessian positivity and 4D photon dispersion at that SAME stationary field.

No old Q77, no legacy four-ARF target shapes, no fitted constants, no synthetic Wilson. The model is **conditional** on Q109's pre-existing equal kinetic ratio and Grassmann determinant, neither uniquely derived from URT.

## Run and provenance

\`\`\`
python -u research_archive/2026-11-15_q150_native_physical_vacuum/Q150_FULL_NATIVE_GAUGE_VACUUM_SEARCH.py --output-dir /tmp/q150_physical --maxiter 450
\`\`\`

Registered as long-running compute-queue job \`q150-native-full-528-physical-vacuum\` with outputs on \`cathedral-research-state/compute/q150-native-full-528-physical-vacuum/\`. This file can be run on GitHub Actions's full original native source tree; its source was independently syntax-checked locally, but **the optimization itself has NOT been run locally** because the isolated sandbox cannot clone original v61 due Git DNS.

## Next physical criterion

Use returned candidate only if its gradient is genuinely small. Then re-evaluate native full 481D transverse stability, compute 4D long-wavelength Wilson/plaquette correlator and source-normalized photon pole on the same candidate, and test its independence from finite-lattice boundaries. Finally derive (or falsify) the kinetic normalisation and 24-time law from primitive π, φ, e full-Cathedral dynamics. All unresolved premises must remain explicit.

## Q150a physics correction — holonomy monitor (2026-11-15)

**Found and corrected a physically material error in Q150's diagnostic.** Its original local-flux monitor used `sin(c/3)` for the minimal charge `q=1/3`, where `c` is the oriented 2-cell link sum. This is **not** a faithful test for trivial Wilson holonomy: at `c=3π`, `exp(i c/3)=-1` is nontrivial while `sin(c/3)=0` incorrectly reports zero flux. The correct compact, gauge-invariant, `6π`-periodic distance from identity is

```
U_face = exp(i c/3)
d_face = |U_face - 1| = 2 |sin(c/6)|.
flux_rms = sqrt(mean(d_face**2)).
nonzero_flux_faces = count(d_face > 1e-6).
```

For exact test cases: `c=0` gives `d=0`, `c=3π` gives `d=2`, `c=6π` gives `d=0`. The formula is invariant under `c→c+6πk` and under face-orientation reversal `c→−c`. This is an **exact algebraic physical-observable correction**, not an optimizer convergence claim. Q150 objective/gradient and the underlying action are unchanged. Any earlier Q150 flux reports from the sine monitor are not reliable evidence of trivial Wilson flux; recompute them with the corrected monitor. No photon or physical alpha derived.
