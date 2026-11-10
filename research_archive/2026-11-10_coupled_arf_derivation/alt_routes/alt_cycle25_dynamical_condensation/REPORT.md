# alt_cycle25 — dynamical condensation from the soft 4_5

Classification: PROVED for the main claims (even-channel condensation at any O(1) Yukawa, odd-channel critical coupling of O(1), A4-stabilised vacuum, residual ratio not uniquely fixed). The predeclared T=0 linear infrared singularity is FALSIFIED.
Advances a physical ARF? No.

## Result

The residual pairing theory is the Nambu / BdG measure
Ω = V_hist − T Σ_α log(2 cosh(E_α / 2T)) + (Δ=0 subtraction), with
V_hist = c3 ||h3||² + Δ² c5 ||h5||², T = η ≈ 5.9958 the hidden KMS temperature,
and Δ(h, y) built from the orthonormal adjacent pairing-current frames of coupled cycle 11.

Linearised critical Yukawas at T = η, along the nuclear-norm maximiser:

- even / 4_5: y_c = 0.005940 (stiffness c_even = Δ² c5 = 1.356×10^{-6}, χ = 0.03842)
- odd / 4_3: y_c = 2.380 (stiffness c_odd = c3 = 0.22224, χ = 0.03923)

So any O(1) even Yukawa produces a nonzero 4_5 condensate: the vacuum is not the origin. At the natural frame point y_even = 1 the minimiser is
||h5||_* ≈ 8.613×10^5, Ω_* ≈ −9.928×10^5, matching the large-vev balance r_* ≈ (nuclear norm) / (4 c_even) to 0.7%. The odd channel does not condense at y_odd = 1 (the scan returns r = 0).

The quadratic susceptibility χ is essentially isotropic on S³. Direction selection comes from the large-vev fermion piece, equivalently from maximising the nuclear norm Σ σ_α(M(ĥ)). The maximiser has nuclear norm 4.64038 and stabiliser A4 inside A5 (order 12: one identity, eight order-3 elements, three order-2 elements). The ray stabiliser is the same A4. C5 and D5 do not occur, as required for a nonzero vector in a 4 of A5.

The ratio r = y_even / y_odd is not fixed to a unique number. Because y_c,even ≪ 1 < y_c,odd, a generic O(1) pair (y_odd, y_even) produces only an even condensate, so the ratio is qualitatively irrelevant except in a neighbourhood of the pure-odd axis y_even < y_c,even, where the even vev switches off.

## Controls and the T = 0 claim

K has a zero mode (the constant vector), but the residual frames are exactly orthogonal to the all-ones edge vector (||F 1_edges|| < 10^{-15}), so v0^T Δ v0 = 0. The zero mode is not paired at linear order. At T = 0 the small-s expansion of Ω_f is quadratic (Ω(s1)/Ω(s2) = 3.99997 versus 4 for a quadratic and 2 for a linear law), and y_c(T=0) is finite: 0.003845 (even) and 1.408 (odd). The predeclared linear attraction −½|Δ_0| and the claim y_c(T=0) = 0 are therefore false for these frames. The even channel still condenses at any O(1) Yukawa at T = 0.

The cycle-16 Dirac-like control, using the reduced log-det over the gapped Laplacian eigenvalues (the full det is singular at the origin because of the kernel), has positive curvature at h = 0 (even: +0.078, odd: +0.561). Condensation is a property of the pairing measure, not of every fermion determinant.

## Verification
`/workspace/arf_research/alt_cycle25_dynamical_condensation/test_dynamical_condensation.py` and `results.json`.
Predeclaration sha256: `af7c008ce85973517f5ae1c65699a5863c82c2a46e56d5cf6651f4c3eea4b8a2`.

## Next obstruction
The even condensate breaks A5 to A4 and leaves y_even : y_odd unfixed. Whether the A4 vacuum produces three nondegenerate charged masses is the question of route 26. The constant mode remains unpaired, so a massless charged fermion may survive.
