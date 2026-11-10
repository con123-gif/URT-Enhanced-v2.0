# Coupled cycle 08 — distinguished history states

Classification: CONDITIONAL.
Advances an ARF? No.

## What is canonical

Every linear average of portal Hessians that we computed has the same
eigenvalue *ratios* `(0, 0, 0, 1, 1, 1, 1, 1)` (three numerical zeros and
a five-fold positive level):

- counting-measure average over all 64 signed histories,
  raw positive eigenvalue `8.08346317` (multiplicity 5);
- even-weight sector average (32 histories) and odd-weight sector average
  (32 histories), agreeing with each other and with the uniform average
  to `10^{-15}`;
- each of the four A5-orbits (sizes 20, 12, 20, 12, matching the known
  `(12A, 12B, 20A, 20B)` history orbits);
- the same averages with ρ★ channel weights `(1, Δ²)/[4(1+Δ²)]` instead
  of golden-mode `(c3, Δ² c5)` (the overall scale changes,
  `9.09319417` vs `8.08346317`, but the ratios do not).

`Hbits` is the Laplacian of the Hamming-distance-2 graph on `(ℤ₂)⁶`. Its
kernel is two-dimensional, spanned by the even-weight and odd-weight
indicators, and the leading eigenvalue of `exp(−η Hbits)` has multiplicity
2. Those two extreme KMS states nevertheless produce the *same* averaged
Hessian, so the whole ground simplex shares this ratio tuple.

The four A5-orbits share the ratios but **not** the scale
(`2.05840546`, `4.46842854`, `11.69849780`, `14.10852089`). The
counting-measure average is the size-weighted mix of those four.

## What is not forced

Two other distinguished constructions disagree with the Hessian-average
ratios:

1. The Hessian at the mean portal configuration `mean_s α_s` vanishes
   identically (the signed configurations average to zero, and the
   Hessian of a quartic is zero at the origin).
2. The coordinatewise mean of the 64 individual ratio tuples is
   `(0, 0, 0, 0, 3/32, 9/16, 27/32, 1)`, not `(0, 0, 0, 1⁵)`.
   Averaging a nonlinear function of a matrix is not the same as taking
   ratios of the average matrix.

So a unique *linear* canonical response exists — the Hessian-average
ratios `(0³, 1⁵)` — and it is invariant under A5, under even/odd, under
KMS mixing in the ground space, and under swapping ρ★ for `(c3, Δ² c5)`.
It is not forced once one allows the equally natural operation of
averaging the already-computed ratio tuples, and the overall scale is
orbit-dependent. Individual histories (cycle 04) remain direction-dependent;
the canonical object is an average, not a single history.

Verification: `test_canonical_history.py`, `results.json`.
Predeclaration hash: `8c5a5e2b0a456e3e9bb1495dce25163ece6b19a21245bdb82fd3ce04ee63f191`
