# Coupled cycle 03 — map F : Sym²(3 ⊕ 5) → 4_3 ⊕ 4_5 and the hidden Hessian

Classification: PROVED.
Advances an ARF? No.

## Definitions

Portal basis: the eight orthonormal columns of `Iico`, first three = 3, last five = 5.
Hidden frames: real eigendecompositions of `P3` and `P5` (eigenvalue > 1/2),
columns sign-fixed by positive coordinate-sum and ordered by decreasing
|coordinate-sum|.

Quadratic source `q(x) = (P3[(C x) ⊙ (C x)], P5[(C x) ⊙ (C x)])`.
Polarization `B(u, v) = q(u+v) − q(u) − q(v) = 2 (P3[(Cu)⊙(Cv)], P5[(Cu)⊙(Cv)])`.
The brief's `h3 = 2 P3[(C t) ⊙ (C f)]` is exactly the `3 ⊗ 5 → 4_3` block of `B`.
The brief's `h5 = P5[(C f) ⊙ (C f)]` is half the diagonal of the `5 ⊙ 5 → 4_5` block of `B`.

`F` is the linear map `Sym²(ℝ⁸) → ℝ⁴ ⊕ ℝ⁴` with `F(α ⊙ α) = q(Iico α)`,
represented in the orthonormal Frobenius basis of symmetric 8 × 8 matrices
(dimension 36).

Hidden Hessian of `V = c3 ||h3||² + Δ² c5 ||h5||²` (golden charge-2 mode):
`H_hid = 2 c3 I_4 ⊕ 2 Δ² c5 I_4`.
Quartic operator on Sym²: `K = F* G F` with `G = c3 I_4 ⊕ Δ² c5 I_4`.

## Component tensors (selection rule)

| block | rank | ‖B‖_F |
|---|---|---|
| 3 ⊙ 3 → 4_3 | 0 | 2.89e-15 |
| 3 ⊙ 3 → 4_5 | 0 | 1.27e-15 |
| 3 ⊗ 5 → 4_3 | 4 | 6.7428667926927 |
| 3 ⊗ 5 → 4_5 | 0 | 1.11e-15 |
| 5 ⊙ 5 → 4_3 | 0 | 3.55e-15 |
| 5 ⊙ 5 → 4_5 | 4 | 4.0000000000000 |

Only two channels are nonzero, and each is surjective onto its hidden quartet:
`3 ⊗ 5` sources `4_3` and `Sym² 5` sources `4_5`. That is exactly the pair of
maps written in the brief. The other four blocks vanish to machine precision
(A5 selection: `3 ⊗ 3 = 1 ⊕ 3 ⊕ 5` contains no 4; `3 ⊗ 5 = 3 ⊕ 3' ⊕ 4 ⊕ 5`
contains a single 4, which lands in `4_3`; `Sym² 5 = 1 ⊕ 4 ⊕ 5 ⊕ 5` contains
a 4, which lands in `4_5`).

The 3 × 5 × 4 and 5 × 5 × 4 component arrays are stored in `results.json`
and as `B3.npy`, `B5.npy`.

## Full map F

- Domain dimension 36, codomain dimension 8.
- Rank 8 (surjective onto `4_3 ⊕ 4_5`), kernel dimension 28.
- Singular values: `2.383963416875298` (multiplicity 4) and `1` (multiplicity 4).
  The larger quartet is the `3 ⊗ 5 → 4_3` channel; the unit quartet is `Sym² 5 → 4_5`.

## Hidden 8-amplitude Hessian

Eigenvalues, golden mode `c3 = 0.2222379983269106`, `c5 = 0.21876996521511627`,
`Δ² = 6.19606606165215e-6`:

- `2 c3 = 0.4444759966538212` with multiplicity 4 (the `4_3` block)
- `2 Δ² c5 = 2.7110263135564066e-6` with multiplicity 4 (the `4_5` block)

Null space: empty. Eigenvectors: the hidden-frame basis itself (H_hid is
already diagonal there). Ratio `c3 / (Δ² c5) = 163951.19236992727`.

Symmetry-protected degeneracies: each 4-fold block is an A5-irrep 4, and
`H_hid` is an A5 scalar on that block. The two blocks cannot mix because
they are distinguished by `Hbits` eigenvalues 18 versus 16.

## Quartic operator K on Sym²

Rank 8, nullity 28 (same kernel as F). Positive eigenvalues:

- `1.263041120711679` (multiplicity 4) = `c3 × (2.383963416875298)²`
- `1.3555131568e-6` (multiplicity 4) = `Δ² c5 × 1²`

These eight numbers, and their ratio `c3 / (Δ² c5)` coinciding with the
hidden-Hessian ratio, are invariants of `F` and `G`. They do not depend on
a choice of source direction. Direction dependence of *portal* Hessians is
cycle 04.

Verification: `test_map_F.py`, `results.json`, `B3.npy`, `B5.npy`, `Fmat.npy`, `K.npy`.
Predeclaration hash: `495ea43c5ab244ac5fae6539a8fbcaba65b64e4ea0809b619c8a9f47db43c6a6`
