# alt_cycle08 — adversarial counterexamples and look-elsewhere

Classification: PROVED on H1–H5.
Advances a physical ARF? No.

## Result

### Explicit counterexamples (H1, H2)
The two inversion-allowed Weyl rays “pure 3 ⊗ 5 → 4₃” and “pure 3' ⊗ 5 → 4₃” both satisfy A5 equivariance, inversion parity, vertex charge +1 and positivity of the hidden covariance. Their one-loop mass patterns are incompatible: (massive 3 and 5) versus (massive 3' and 5). This is an explicit counterexample to uniqueness of the charged response, independent of Clebsch–Gordan normalisations.

The two-amplitude test polynomial V(t,f) = a t² f² + b f⁴, using the archived shape coefficients only as a sample homogeneous quartic, has a Hessian whose eigenvalue ratio depends on the source direction t:f. Representative ratios (lower over higher eigenvalue):
- (t,f) = (0,1): +5.09×10⁻⁶
- (t,f) = (1,0): 0
- (t,f) = (1,1): −0.333
- (t,f) = (2,1): −0.262
Direction-independent response already fails on this two-plane.

### Look-elsewhere (H3, H4, H5)
Targets (comparison only): Δ_δ ≈ −3.596×10⁻⁴, R_α ≈ 0.033805, C_mass ≈ 4.44680, R_mass ≈ −2.43000.

Strict geometric alphabet G_strict has 25 integers and does not contain 35, 63 or 79. Wide alphabet G_wide adds {7, 9, 35, 36, 63, 79, 105, 137, 1053}.

Template T1 (a/(n φᵏ) + b/(m φˡ)), unordered pairs:
- Strict, 550725 pairs. R_α has no exact hit (79 is absent) and 0 / 3 / 40 hits at relative 10⁻⁶ / 10⁻⁴ / 10⁻³. Nearest rival: 1/(51 φ²) + 5/190, relative error 1.09×10⁻⁶. Δ_δ has no hit even at 10⁻³ (nearest 0.51%). C_mass has 21 hits at 10⁻³ (nearest 2.64×10⁻⁴). R_mass has 6 hits at 10⁻⁴ (nearest 1.27×10⁻⁵, namely 8/190 − 4/φ).
- Wide, the defining writing of R_α appears exactly once. After discarding it, the nearest rival is 1/(8 φ²) − 5/(137 φ²) at relative 8.88×10⁻⁷, and there are 6 hits within 10⁻⁶.

Template T2 ((a/n) πᵖ φᵍ + (b/m) πʳ φˢ) makes C_mass and R_mass easy to approximate, because they are O(1) combinations of π and φ:
- Strict: C_mass has 1 / 260 / 3300 hits at 10⁻⁶ / 10⁻⁴ / 10⁻³ (nearest 5.58×10⁻⁷); R_mass has 1 / 299 / 2748 (nearest 8.60×10⁻⁷). R_α has 0 / 10 / 84. Δ_δ has none at 10⁻³.
- Wide: C_mass 5 / 530 / 6208; R_mass 10 / 569 / 5454; nearest R_mass rival at relative 3.2×10⁻⁸.

A numerical coincidence inside these grammars is not a derivation. R_α’s exact writing is distinctive only once 79 is admitted by hand; without 79 a different Cathedral-looking pair already agrees to about one part in a million. C_mass and R_mass are not numerically rigid once π and φ are freely combined with small structure integers.

## Verification
`/workspace/arf_research/alt_cycle08_adversarial/test_adversarial.py` and `results.json`.
Predeclaration sha256: `59900ec6f80052ae56ede2f80f48c25eee47345ad2bab88c1d10f2adc4d63dcf`.

## Next obstruction
Uniqueness of the charged response is falsified inside the declared premises, and the four ARF writings are not isolated enough in a fair Cathedral grammar to count as derivations.
