# Coupled cycle 03 predeclaration

Compute the full linear map
F : Sym²(3 ⊕ 5) → 4_3 ⊕ 4_5
from the original Iico 3⊕5 portal, face incidence C, and hidden projectors
P3, P5 of the 7 November construction (no toy model).

Definitions, fixed before any numerical diagonalisation:

- Portal basis: the eight orthonormal Iico columns, first three = 3, last five = 5.
- Hidden frames: real eigendecomposition of P3 and P5 (eigenvalue > 1/2),
  columns ordered by decreasing coordinate-sum so the frame is unique up to signs.
- Quadratic source q(x) = (P3[(C x) ⊙ (C x)], P5[(C x) ⊙ (C x)]).
- Polarization B(u, v) = q(u+v) − q(u) − q(v) = 2 (P3[(Cu)⊙(Cv)], P5[(Cu)⊙(Cv)]).
  This matches the brief's h3 = 2 P3[(C t) ⊙ (C f)] on the 3⊗5 → 4_3 block,
  and twice the brief's h5 = P5[(C f) ⊙ (C f)] on the diagonal 5⊙5 → 4_5 block.
- F is the unique linear map Sym²(ℝ⁸) → ℝ⁴ ⊕ ℝ⁴ with F(u ⊙ v) = q-polarization
  consistent with F(α ⊙ α) = q(Iico α).
- Six component tensors: (3⊙3, 3⊗5, 5⊙5) × (4_3, 4_5).
- Hidden 8-amplitude Hessian of V_hist = c3 ||h3||² + Δ² c5 ||h5||²
  at the golden charge-2 mode (c3, c5 from cycle 02):
  H_hid = 2 c3 I_4 ⊕ 2 Δ² c5 I_4.
- Quartic operator K = F* G F on the 36-dimensional space Sym²(ℝ⁸),
  G = c3 I_4 ⊕ Δ² c5 I_4 (so V(α) = <q(α), G q(α)>).
- Portal Hessian of V ∘ q at a nonzero background is deferred to cycle 04;
  at the origin it vanishes because q is quadratic and q(0) = 0.

Will report: exact (float64) component tensors, ranks, Frobenius norms,
eigenvalues/vectors of H_hid, nulls, symmetry-protected degeneracies,
and the 36 eigenvalues of K.

Classification: PROVED if the tensors, ranks and the two Hessians are obtained
from the original operators with the identities above; no ARF target is used.
