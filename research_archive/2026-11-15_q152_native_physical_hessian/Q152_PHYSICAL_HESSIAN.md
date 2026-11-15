# Q152 native 4D physical gauge Hessian after Q151 near-stationary field

**2026-11-15.** This computes the physically decisive finite-volume transverse stability of the actual original v61/Q109 conditional gauge vacuum, rather than another abstract 444-state graph moment. It does not fit historical ARF shapes or change the Gaussian action.

## Verified incoming research
- Q150 native GitHub Actions [run 43715542715](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43715542715): ΔΓ=−7389.66246102273, ||grad||=0.05694848, 450 iterations, not stationary.
- Q151 native GitHub Actions [run 43717134682](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43717134682) completed with return code 0 in 34.87s: started from pinned Q150 numeric field, reached ΔΓ=−7389.662520593294, ||grad||=0.000517246721460616, gauge Ward residual=1.69576e−12, on iteration 114. Its optimizer reported **relative objective convergence**, but **NOT** the strict stationarity threshold ||grad||<1e−4. Corrected minimal-charge U1 Wilson `|e^{i c/3}−1|` flux RMS=0.553342789379101; all 3216 2-cell holonomies nontrivial to 1e−6.
- Q151 candidate is persisted on `cathedral-research-state` pinned at `a3a841d06116c14e17cbe2c4cf4f3519fba35878`, seed SHA256 `7a78f4651ee7a1942138152a8bc64a279eed994538d0d5eb2cf221d3d30ee95c`.

## Direct physical gate Q152

The numerical objective is nearly flat at Q151. A further blind first-order minimization does not establish whether this is a local minimum or an **unstable saddle**. Q152 therefore imports the original v61 Q109/Q110 action gradient, native Q149 original closed-loop geometry and exact gauge incidence, removes 47 pure-gauge directions (physical quotient dim 481), constructs the Hessian-vector derivative **of the unchanged original nonlinear action**:

```
H_phys u ≈ N^T [ grad Γ(A+ε N u)−grad Γ(A−ε N u) ]/(2 ε)
N in R^{528×481}, N^T incidence=0, ε=10^{-4}.
```

The six smallest Ritz eigenvalues and residuals test for a genuine negative **physical** curvature direction. If the lowest Ritz eigenvalue is negative, follow that actual mode downhill in the same action, demonstrating the candidate is not a stable vacuum. If it is strongly positive, attempt a projected Newton correction of the remaining 528-field stationarity residual. No massless photon is claimed from longitudinal Ward zeros; a real 4D propagating photon also requires source-normalized transverse long-wavelength dispersion and consistent finite-volume/continuum control.

## Results/provenance
Registered `q152-native-physical-hessian-and-newton` compute job. Output `Q152_RESULT.json`, `Q152_best_native_gauge_angles.npy`; GitHub Actions native CI, not an unsupported local finite 190 code substitution. Strict source reference: original full five-Platonic moving Q101/Q106 and original 192/528 Wilson Q109. The action's equal kinetic ratio is still a declared premise; primitive URT does not yet force it. Historical four ARFs and Q77 selected-history action remain excluded.

**RESUME HERE:** Read Q152 result. If negative physical Hessian, pursue true lower-action flux background, not a fake photon. If positive and stationarity achieved, test complete spectrum, field correlator and source-normalized Maxwell residue under increasing 4D spatial sizes; separately derive real kinetic time/normalization from π, φ, e.
