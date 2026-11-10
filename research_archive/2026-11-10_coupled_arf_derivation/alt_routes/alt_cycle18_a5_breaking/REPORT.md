# alt_cycle18 — minimal A5 breaking for three distinct charged masses

Classification: PROVED on H1–H4.
Overall: FALSIFIED that any of {24-clock, ρ*, 2I lift, five-solid bridge} breaks A5 minimally to give three distinct nondegenerate charged masses without new parameters.
Advances a physical ARF? No.

## Result
The icosahedral Hodge Laplacian has multiplicities (1, 3, 5, 3) at eigenvalues (0, 5−√5, 6, 5+√5). Adding the five-solid bridge restriction Cbridge = 4 P_1 + 4 P_3 shifts those to (4, 9−√5, 6, 5+√5) with the same multiplicities (1, 3, 5, 3). The two spatial triplets remain irreducible.

The 24-clock Laplacian with constant gold-angle charge-2 holonomy is positive definite (λ_min ≈ 0.007658, as in alt_cycle03) and does not act on spatial indices. The product operator K ⊗ I + I ⊗ L_clock copies the same clock spectrum onto every spatial partner, so the spatial degeneracies persist. The same holds after replacing K by Δ + Cbridge.

The KMS / hidden weight ρ* = (I_4 ⊕ Δ² I_4)/[4(1+Δ²)] is a multiple of the identity on each hidden quartet, hence A5-invariant. It can make the three numbers m3, m3', m5 different, but they still come with multiplicities 3, 3 and 5, and both singlets stay massless.

The 2I lift reproduces alt_cycle01: H13 ⊗ 2 ≅ 3·2 ⊕ 2·4' ⊕ 2·6. There is no singlet; the smallest irrep is two-dimensional. The lift enlarges degeneracies rather than splitting them.

A residual C5 about one of the six icosahedral vertex axes would restrict the spatial 3 as 1 ⊕ 2 over ℝ, but selecting one of those six axes is an extra discrete choice that none of the four structures makes.

## Verification
`/workspace/arf_research/alt_cycle18_a5_breaking/test_a5_breaking.py` and `results.json`.
Predeclaration sha256: `51c5d6e3b70f732fe9d8f3ed320df578a2443f623f99358cb78d545e0942a6d8`.

## Next obstruction
Three nondegenerate charged masses require an A5-breaking identification that these four structures do not supply.
