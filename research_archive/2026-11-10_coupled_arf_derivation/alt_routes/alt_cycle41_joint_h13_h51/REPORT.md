# Report — alt_cycle41: joint H13 + H51 vacuum

Date: 10 November 2026 (Europe/London)
Classification: **PROVED**
Predeclaration sha256: `b7af64ab104d209945ef9a94ea52254aaa7527bd4f631a64310b640dc0a6163f`

## Shared field
Both pairings couple to the same hidden 4_5 (even frames) and the same hidden 4_3 (odd frames). V_hist is a single quadratic on that one copy. There is no extra relative-orientation modulus: a single h ∈ ℝ⁴ enters Δ_ico(h) and Δ_dodeca(h). F and V ∘ F do not add an independent dodeca orientation and were not re-introduced.

The A5-covariant joint fermion space is the 32-vertex union of the icosahedron and the dual dodecahedron. Tetra/cube/octa are not A5-sets and are excluded.

## Two landscapes, one minimiser
Nuclear norms of the even pairing:
- at the H13 / A4 maximiser ĥ_ico: ||Δ_ico||_* = 4.640380, ||Δ_d||_* = 5.098778, sum = 9.739158;
- at the dodeca / D3 maximiser ĥ_d: ||Δ_ico||_* = 4.086997, ||Δ_d||_* = 5.337632, sum = 9.424628.

Icosahedral variation when leaving the A4 ray (drop 0.553) exceeds the dodecahedral gain of sitting at its D3 maximiser (gain 0.239). The joint sum is therefore maximised on the A4 ray: ĥ_joint = ĥ_ico to overlap 1 − 2×10^{-16}. Overlap of ĥ_ico with ĥ_d is 0.612372 = √6 / 4, the exact inner product of the A4-type vector (1,1,1,1,−4) and the 3+2-type vector (2,2,2,−3,−3) in the deleted-permutation 4.

Stabilisers:
- ĥ_ico: A4 (order 12), matching alt_cycle25 (overlap 1.000);
- ĥ_d: D3 (order 6), matching alt_cycle40 (overlap 1.000);
- ĥ_joint: A4, simultaneously on Δ_ico and on Δ_d (an A4-invariant h produces A4-invariant pairings by equivariance). Combined joint stabiliser A4.

Competing directions at the joint r_* all have higher Ω (the D3 ray sits at −4.091×10^6 versus −4.373×10^6 on the A4 ray). The five A4 directions remain degenerate by A5.

## Radial vacuum and Cbridge
Even channel, y = 1, T = η: χ = 0.078833, y_c = 0.004147, so the joint even channel condenses. The odd joint channel does not (y_c = 1.670).
r_* = 1.797640×10^6 on both K0 = L_ico ⊕ L_dodeca and KC = K0 + Cbridge|_{32}, matching (α_ico + α_d) / (4 c_even) = 1.796214×10^6 to 0.08%. Cbridge, being A5-invariant and independent of h, does not change the ray or the stabiliser.

## Conclusion
The two condensates cannot point independently: they share 4_5. The joint vacuum aligns with the H13 A4 direction, because that direction maximises the summed nuclear norm. The true joint stabiliser is A4, not D3, not C3, not C2, and not 1. No ARF target was inserted. No repository files were modified, committed, or pushed.
