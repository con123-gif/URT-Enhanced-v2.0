# Report — alt_cycle39: Gaussian fluctuations of 4_5 and 4_3

Date: 10 November 2026 (Europe/London)
Classification: **PROVED**
Predeclaration sha256: `c64442acb624642fcd3ca34ef814be7659dd49f6a5fad10a7fe4b61c09ac3a5c`

## Question
Do one-loop (static, Gaussian) fluctuations of the hidden 4_5 condensate and the 4_3 modes split the fermion 3 and 6, or select among the five degenerate A4 condensate directions (order by disorder)? If three nondegenerate charged singlets appear, compare C_mass and R_mass with look-elsewhere.

No Higgs kinetic |D_A Δ|² is introduced (that is the coupled line and was not duplicated). The covariance is the inverse Hessian of the static effective potential
Ω(h) = c_3 ||h_3||² + c_even ||h_5||² + F_BdG(Δ(h))
at h = (0, r_* ĥ), with r_* = 8.61261×10^5 and ĥ the A4 nuclear-norm maximiser.

## Hessian
A raw 8×8 finite-difference Hessian at step 0.02 mixes the O(10^{-6}) 4_5 block with cancellation noise and produces two apparent negative eigenvalues of size ~10^{-6}. Those eigenvalues are entirely in the even (4_5) subspace, with the radial direction spread across all four noisy modes; the 4_3 block is clean at λ ≈ 0.44447 = 2 c_3. The raw Hessian still commutes with ρ_4(A4) to residual 8.97×10^{-6} (A4-invariant).

Directional second derivatives resolve the true curvatures, stably across step sizes:
- 4_5 radial (along ĥ): κ_rad = 2.711024×10^{-6} = 2 c_even, for δh ∈ {50, 200, 1000, 3000};
- 4_5 angular (the 3 of A4 orthogonal to ĥ): κ_ang = 1.626079×10^{-6}, threefold degenerate;
- 4_3 (all four directions): κ_odd = 0.444475 = 2 c_3.

The sanitized Hessian is positive definite, with A4 content 1 ⊕ 3 on 4_5 (distinct radial and angular masses) and an unsplit 4 on 4_3 (the 1 and 3 of 4_3 share the tree mass 2 c_3; fermion back-reaction at h_3 = 0 is negligible at this scale). Even and odd sectors do not mix.

Gaussian control: δh_rad ~ 1/√κ_rad ≈ 607 versus r_* ≈ 8.61×10^5, relative amplitude ≈ 7.1×10^{-4}. Angular: 1/√κ_ang ≈ 784, the same order. The expansion is parametrically controlled.

## Order by disorder
The A5-orbit of ĥ, identified up to sign, has size 5, matching |A5/A4| = 5. All five points have the same Hessian pattern (4_3 block at 2 c_3, 4_5 block O(10^{-6})). Equality of (1/2) Tr log ∇²Ω is required by A5 and is observed; the raw (1/2) Tr log could not be evaluated at the noisy Hessians (some eigenvalues slightly negative), but that is a finite-difference artefact, not a selection. Fluctuations do not pick a preferred A4 direction.

## Fermion self-energy
Inverting the raw noisy 4_5 block produces a huge, directionally meaningless D and an apparent O(1) relative split of every multiplet. That split is an artefact of regularizing eigenvalues of size 10^{-6} that have the wrong sign and the wrong eigenvectors.

With the sanitized (A4-invariant, positive-definite) covariance, the static second-order W is a scalar on every multiplet (relative spreads ~ 10^{-14}):
- unpaired near-zero (E ≈ 1.7×10^{-10}, multiplicity 1): skipped;
- 3 at E = 314487.937: W = 0.260702 (no split);
- 3 at E = 351605.967: W = 0.072889 (no split);
- 3 at E = 351610.439: W = 0.072889 (no split; this pair is the known finite-r Laplacian split of the 6, relative 1.27×10^{-5});
- 2 at E = 471731.906: W = 0.391108 (no split).

The one-loop shifts are O(10^{-1}) on masses O(10^5), a relative 10^{-6}, and they do not split any A4 multiplet. This is the representation-theoretic no-go: an A4-invariant self-energy cannot break a 3 of A4 into singlets.

## Mass ARFs
No spectrum of three nondegenerate charged singlets appears. C_mass and R_mass were not compared, and the T1/G_strict look-elsewhere test was not run.

No ARF target was inserted into Ω or W. No repository files were modified, committed, or pushed.
