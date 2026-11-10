# alt_cycle21 — vacuum alignment of V_hist

Classification: PROVED on H1–H4.
Advances a physical ARF? No. There is no derived C5/D5 axis selection.

## Result
The golden-mode coupled potential is the positive-definite quadratic
V_hist = c3 ||h3||² + Δ² c5 ||h5||², with c3 ≈ 0.222238, c5 ≈ 0.218770,
Δ² ≈ 6.196×10^{-6}, and hidden Hessian eigenvalues 2 c3 ≈ 0.444476 (multiplicity 4)
and 2 Δ² c5 ≈ 2.711×10^{-6} (multiplicity 4), matching coupled cycle 03.
Nineteen analytic-gradient multi-starts all reach the origin (max |h| ≈ 2.7×10^{-14}).
The unique minimum is therefore h3 = h5 = 0, whose stabiliser in A5 is the whole of A5.

The 4 of A5 is the deleted permutation representation on five letters. A 5-cycle
cycles all five coordinates, so a C5-invariant vector is constant and hence zero
in the 4. Every D5 contains a C5, and the same applies to 4_3 ⊕ 4_5. No nonzero
hidden vector has stabiliser C5 or D5. Nonzero vectors in the 4 can have
stabilisers A4, C3, C2 or 1, but the minimum is not one of those vectors.

Composing with the archived map F (tensors B3, B5 of coupled cycle 03), both the
truncated sources (h3 = 2 P3[(Ct)⊙(Cf)], h5 = P5[(Cf)⊙(Cf)]) and the untruncated
source q(α) give a nonnegative quartic that vanishes identically on the 3-plane
f = 0, for every t. An A5-invariant function that vanishes for all t at f = 0
does not select an axis in the 3. Selecting the most symmetric points of that
S² (the six undirected five-fold axes, stabiliser D5) would be an extra
residual-symmetry principle. Even then an A5-equivariant self-energy would not
split, and the hidden vev remains zero, so mean-field fermion masses still vanish.

Therefore this vacuum does not provide a derived C5/D5 axis selection, and three
distinct charged masses do not arise without new parameters.

## Verification
`/workspace/arf_research/alt_cycle21_vacuum_alignment/test_vacuum_alignment.py` and `results.json`.
Predeclaration sha256: `52f544dc54dd85235a4c15b2f618b28c010a4edeaa98700c0eec95f675b4c702`.

## Next obstruction
Vacuum alignment of V_hist does not break A5. Three nondegenerate charged masses
still require an A5-breaking structure that these potentials do not supply.
