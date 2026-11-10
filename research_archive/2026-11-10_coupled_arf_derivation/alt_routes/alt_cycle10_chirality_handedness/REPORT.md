# alt_cycle10 — chirality / handedness for 3 versus 3'

Classification: H1 PROVED (refined); H2 PROVED (refined); H3 PROVED; H4 CONDITIONAL.
Advances a physical ARF? No.

## Result
The native 64-history signature and the 24-clock orientation do not set either odd Yukawa coupling to zero. They do, however, provide cleaner labels than expected.

History all-flip (XOR of all six pair-bits, i.e. spatial inversion on the six diameters) preserves each of the four A5-orbits rather than swapping the two 12-orbits or the two 20-orbits. Hamming parity is constant on each orbit and distinguishes them: one 12-orbit is entirely odd-weight, the other entirely even-weight; likewise the two 20-orbits. That canonically labels the anomaly-free charge pair (q versus −q), but inversion acts as −1 on both 3 and 3' and cannot swap them, so the signature does not pick a 3⊗5 versus 3'⊗5 Yukawa.

Clock reversal θ → −θ is Galois dual to the golden angle: 2π/φ̄² = 2π φ² ≡ 2π/φ ≡ −2π/φ² (mod 2π), because 1 − 1/φ² = 1/φ. The predeclared claim that these angles differ is therefore false. The archived choice θ = +2π/φ² is the φ-orientation associated with the spatial 3. The spectra of the charge-2 clock Laplacian at ±θ nevertheless coincide, so the clock spectrum does not pick a Yukawa ray.

Round 102’s 3 ↔ 3' swap is the outer automorphism coming from S5 \ A5. It is not realised by A5, by inversion, by history all-flip, or by clock reversal.

The extra principle that Yukawas must factor through the archived source t ∈ 3_odd would set the 3'⊗5 coupling to zero. That is not implied by the history signature or by the clock spectrum.

## Verification
`/workspace/arf_research/alt_cycle10_chirality_handedness/test_chirality_handedness.py` and `results.json`.
Predeclaration sha256: `91292d13eb6d9856c7eef5ee8be063dee124835c2cc115b455ab543a81ac6a28`.

## Next obstruction
A genuine handedness rule that sets one of the two odd Yukawas to zero is still missing, unless an extra source-matching principle is adopted.
