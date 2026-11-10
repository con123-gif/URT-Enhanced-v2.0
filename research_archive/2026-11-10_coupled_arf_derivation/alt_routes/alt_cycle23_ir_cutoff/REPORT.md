# alt_cycle23 — IR regulators from inside the system

Classification: H1 PROVED; H2 CONDITIONAL; H3 PROVED.
Advances a physical ARF? No. None of the predeclared ratios equals R_α.

## Result
The three named cutoffs are positive and parameter-free:
η = −ln Δ ≈ 5.995798, λ_min(L2) ≈ 0.007657918, 2 Δ² c5 ≈ 2.711026×10^{-6}.
Each makes Π_T finite. The two predeclared product-sum completions of the clock
option are likewise finite. The five recorded ratios (written before any
comparison) are

| cutoff | ε | R_EM | |R_EM − R_α|/|R_α| |
|---|---|---|---|
| KMS η | 5.995798 | 0.00333736 | 0.901 |
| clock gap | 0.00765792 | 28.3116 | 836 |
| hidden Hessian | 2.711×10^{-6} | 80474.7 | 2.38×10^6 |
| Σ_k Π(λ_k) | — | 39.5095 | 1168 |
| Σ_k Π(r² λ_k) | — | 29.2613 | 865 |

R_α ≈ 0.03380536. None of the five lies within relative 10^{-4} of R_α (H3).
Using η or 2 Δ² c5 as a spatial Laplacian mass is an extra identification
(neither is a fermion kinetic term). The product sums assume that H13 fermions
carry the 24-clock, which is not forced (H2 CONDITIONAL).

Look-elsewhere, T1 grammar on G_strict (550725 pairs, 79 not admitted): R_α
again has the known rival 1/(51 φ²) + 5/190 at relative 1.09×10^{-6} (3 rivals
within 10^{-4}). The closest T1 writing to R_EM^{KMS} is 2/(90 φ²) − 1/(120 φ)
at relative 1.45×10^{-4}; the other four R_EM values have no 10^{-3} hit in this
grammar (nearest listed writing 7+8 = 15). A numerical near-hit would not have
been a derivation; in fact there is no near-hit to R_α.

## Verification
`/workspace/arf_research/alt_cycle23_ir_cutoff/test_ir_cutoff.py` and `results.json`.
Predeclaration sha256: `2d37695519814751a5b5fabf81b06e21eb871ebf9c5b72199deaae55b0078b1a`.

## Next obstruction
An internal IR cutoff can make R_EM finite, but the identification of that cutoff
with a spatial fermion mass is extra (or conditional on clocked fermions), and
the resulting numbers do not equal R_α.
