# Q161: Nonzero-curvature locally stable graded Q125/v61 finite vacuum

**Date:** 17 November 2026  |  **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (conditional finite model); physical continuum, unique kinetic scale and Nature gates remain OPEN.

## Priority and provenance
This is a new calculation of the **new original-source Q101/Q125a 444-state, Q96-charged, v61 graded action**. It is NOT the retired/older Q109 ungraded theory and uses NO old Q152/Q153 vacuum as input. It includes the original full five-Platonic 190-cochain source via Q101's 50→8→12 harmonic projection, exactly the native 720 chiral nonzero edges among 1,032 edges, original shortest-path Q96 SU2 transport, three generations/conjugates, actual 11 v61 spacetime links and the frozen conditional KMS scale.

The source-native reproducibility program is `Q161_GRADED_NONZERO_FLUX_NATIVE_CERT.py`, which imports the original Q125a and v61 GitHub files unchanged. Initial full computation was executed locally with independently reconstructed original-formula scripts; source-native GitHub CI is separately required to confirm it.

## Exact proposed stationary configuration (no observed inputs)

For all 48 sites, take the eleven U(1) link angles in the native order (three spatial followed by eight `(1,bits)` temporal diagonals for `bits∈{0,-1}³` in Python product order):

```
A_star = (3π/4, 3π/4, 3π/4,
          −π/4, π/2, π/2, 5π/4, π/2, 5π/4, 5π/4, 2π).
```

In the original v61 triangle boundaries, each of the 12 triangle types per site has oriented angle **3π/2**; there are `48 × 12 = 576` genuinely curved triangles, and all 2,640 commuting squares have vanishing curvature. For minimum Q96 electric charge `q=1/3`, every triangle Wilson distance is `|exp(i q 3π/2)-1| = √2`. This is a nontrivial *local-curvature* background, not a flat toron or a gauge transform of zero.

## Analytic Bloch dispersion and stationary cancellation

For antiperiodic temporal `p_t=(2n+1)π/6` and spatial momenta `p_i∈{0,π}` and each charge `q`, put `u_j=p·d_j+qA_j`. The unmodified v61 Hermitian 4×4 Wilson block has exactly

```
E_q(p;A)^2 = [3r+1−M − r ∑_{j<3} cos u_j − (1/8)∑_{j>=3}cos u_j]^2
           + ∑_{j<3}sin²u_j + [(1/8)∑_{j>=3}sin u_j]^2.
```

The native unmodified 192×192 Wilson matrix squared spectrum equals four copies of these 48 values; tested at three nonzero uniform angle configurations to ≤`5.4e−14` absolute error.

Let the original Q125 left/right 444 chiral eigenvalues be `μ_a`; the Q96 charge multiplicities per left and right are `q=±1` weight3 each, `q=±2/3` weight9 each, `q=±1/3` weight9 each, plus zero charges which are A-independent. The **actual nonlinear conditional graded action** reduces without an 8-million-dimensional determinant to

```
Γ(A) = −2 ∑_{nonzero q} m_q ∑_{p, a∈(μ_left ⊔ μ_right)}
                     ln[E_q(p;A)² + (k_KMS μ_a)²].
```

At `A_star` the 48 squared-energy bands of `q=±1` and `q=±1/3` are isospectral and their derivatives cancel *at every repeated energy* after multiplying by the **original 3:9 charge multiplicities**. The `q=±2/3` energies form six eightfold-degenerate bands, and the sum of gradient vectors within each band vanishes. Hence the background is stationary for every differentiable symmetric spectral weight of `E²`, including the actual finite graded determinant, without choosing any μ-specific tuning. The finite band-by-band identities were checked to `6.3e−15` (charge 1/1/3 pair) and machine precision (2/3). The direct 11-component analytic action gradient has norm `7.65e−11`. An exact group-permutation symbolic proof can be written from the phase relationships; numerical verification does not alone provide an interval-arithmetic theorem.

The native finite action difference relative to A=0 is approximately

```
Γ(A_star) − Γ(0) = −2,950,228.7979
```

in the unnormalised determinant convention (not an observed energy in SI units).

## Full 528-link physical stability at A_star

For each of the 48 bosonic momenta `k∈Z6×Z2³`, form the **actual** 11×11 complex Hermitian gauge Hessian using original v61 4×4 Bloch current, seagull, and the above *graded Q125 444-eigenvalue* sum. This differs fundamentally from Q159's older ungraded resolvent `(h+μ)^{-1}` and from a hand-inserted sign template.

**Local executed full finite-lattice inertia:**

```
positive physical eigenvalues: 481
negative eigenvalues:          0
gauge zero eigenvalues:        47
minimum positive eigenvalue:   0.03335702330714341 (per-site Fourier normalization)
maximum relative Ward residual:5.894943665235845e-16
```

All six temporal slices have zero negative eigenvalues in all eight spatial momentum sectors. The 47 Ward zeros are exact gauge modes, and the zero bosonic momentum block has eleven positive directions. The source-native independent certificate is prepared for GitHub CI; label the finding **numerically verified conditional finite-lattice result**, not rigorous continuum theorem.

**Strong independent crosschecks:** The new 4×4 Bloch Hessian at A=0 agrees with the earlier direct real-space 192×192 Q125 Hessian matrix to relative `3.4e−15` across four momentum sectors. At A_star, FOUR independent direct real-space 192×192 nonlinear determinant finite-difference tests, including temporal mode `(1,0,0,0)`, agree with the Bloch Hessian to relative `5.9e−8` or better. All Ward residuals are below `6e−16`.

## Physical implication and remaining work

This establishes a **constructive finite graded background with real nonzero triangular U(1) curvature and positive 481-mode physical Hessian** for the specified conditional 444/Q96/v61 determinant. It *solves the finite homogeneous-background instability for THIS graded action*; it does NOT derive a physical massless photon, large-volume reflection positivity, c_eff=1, standard Yang–Mills gauge dynamics, absolute α, CKM/PMNS, observed eta_B, Einstein gravity, or the unique primitive 190/H64/24 dynamics.

The earlier diagnosis of `(409+,72−,47 zeros)` at A=0 was correct **only at the trivial graded background**, so it cannot be treated as a no-go for the revised construction. The nonzero-curvature vacuum actually resolves that finite obstacle without adding a regulator or fitted coupling.

## RESUME HERE

1. Source-native CI run on GitHub, with both 48-block and four direct finite-difference checks, and archive the JSON.
2. Repeat the *same original graded action*, and its nonzero-flux stationary branch, at spatial NS=3,4,5,6 using native 11-link displacements (do not impose anisotropy cancellation), compute finite-k photon residue and Ward modes. The 48-site result is not yet a continuum law.
3. Derive the original 24-clock/190/H64 induced causal kinetic normalization before interpreting k_KMS as a uniquely forced physical value; distinguish conditional UV carrier from observed Nature.