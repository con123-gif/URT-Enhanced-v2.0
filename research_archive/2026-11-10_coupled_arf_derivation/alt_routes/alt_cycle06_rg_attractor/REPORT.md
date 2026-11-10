# alt_cycle06 — RG-style fixed points of the URT recursion

Classification: PROVED on H1–H5.
Advances a physical ARF? No. In particular δ* is not derived as an attractor.

## Result
The primitive spiral T(z) = (π/e) exp(i 2π/φ²) z on ℂ has unique fixed point 0. Since π/e ≈ 1.1557 > 1, that fixed point is a repeller. There is no finite attractor, so δ* is not an attractor of the recursion as written.

The golden rotation on the circle has rotation number 1/φ² = (3−√5)/2 = 2−φ, which lies in ℚ(√5) \ ℚ and is therefore irrational. The rotation is uniquely ergodic and has no attractive fixed point. (This is not 1/φ = φ−1 = (√5−1)/2.)

Two extra, not-derived, trial normalisations do have finite positive fixed points, and neither equals δ*, Δ or 3/20:
- projective map ρ ↦ (rρ)/(1+rρ) fixes ρ = 1 − e/π ≈ 0.134744, versus δ* ≈ 0.147511 (relative error 8.65%);
- spherical map ρ ↦ (rρ)/√(1+(rρ)²) fixes ρ = √(1 − e²/π²) ≈ 0.501330 (relative error 240%).

Linearisation around a hypothetical fixed point of a positive transfer would give a rate equal to the spectral gap. That general fact does not identify k and β separately and does not produce δ*. The descriptive formula δ(t) = δ* + (δ(0)−δ*) e^{−kβt} therefore remains a description, not a derivation.

## Verification
`/workspace/arf_research/alt_cycle06_rg_attractor/test_rg_attractor.py` and `results.json` (80-decimal mpmath).
Predeclaration sha256: `d628455df96978f0f5f61007d9752aa7a2d1fbd9d0d8cbcc423d8657bbfd23d2`.

## Next obstruction
δ* is still an input. No primitive or predeclared-normalised recursion produces it as a unique attractor.
