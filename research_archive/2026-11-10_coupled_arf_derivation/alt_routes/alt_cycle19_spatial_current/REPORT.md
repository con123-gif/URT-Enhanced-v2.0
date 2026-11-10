# alt_cycle19 — vertex-to-spatial-edge charged current

Classification: PROVED on H1–H3.
Advances a physical ARF? No. No comparison with R_α was performed.

## Result
The five Platonic solids rebuild as 50 vertices and 90 spatial edges. Minimal coupling of the Hodge kinetic, (d_A ψ)_e = ψ_j − exp(i q A_e) ψ_i with q = 1, produces the unique Noether current
j_e = −2 q Im(ψ_i* ψ_j) = ∂S/∂A_e at A = 0.
On every solid this current matches a finite-difference derivative of S (max error < 10^{-6}), S is exactly gauge invariant, and the local first Ward identity holds (residuals < 10^{-6}). The five-solid current is the disjoint union of the five and inherits Ward.

The icosahedral block of Cbridge = 4 P_1 + 4 P_3 is nonzero on 36 of the 36 off-edge vertex pairs (66 pairs minus 30 edges). The Hodge current does not satisfy Ward for Hodge plus ungauged Cbridge (residual ≈ 26.6 on a generic test spinor). Gauging Cbridge would require a Wilson line on each of those 36 pairs, which is a path choice not supplied by the spatial edges.

The predeclared one-loop ratio R_EM = λ_min(Π_T)/λ_min(Δ1_T) was studied on the 19-dimensional transverse edge space of the icosahedron, where λ_min(Δ1_T) = 3−√5 ≈ 0.763932.

A locally gauge-invariant regulator ε||φ||² produces a transverse Π_ε, but λ_min(Π_T) scales as 1/ε:
ε = 10^{-1}, 10^{-2}, 10^{-3}, 10^{-4} gives λ_min(Π_T) ≈ 1.54, 16.53, 166.53, 1666.53
and ε λ_min(Π_T) → 1/6 = 2/n, matching the constant-mode seagull coefficient 2/(ε n) with n = 12. The regulated ratios 2.01, 21.64, 217.99, 2181.52 depend on ε. The massless limit is infrared-singular. No unique Yukawa mass is available to replace ε.

Therefore no finite parameter-free R_EM exists, and no comparison with R_α (or the other historical ARFs) was performed, as predeclared.

## Verification
`/workspace/arf_research/alt_cycle19_spatial_current/test_spatial_current.py` and `results.json`.
Predeclaration sha256: `45c12b5daa735c331d270d90497acab6387c48b8220112bded4373b1afdc8800`.

## Next obstruction
A unique local spatial-edge current exists for the Hodge kinetic and satisfies Ward, but the one-loop electromagnetic response is infrared-singular without a derived fermion mass, and Cbridge cannot be gauged along spatial edges alone.
