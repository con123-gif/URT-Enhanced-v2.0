# alt_cycle04 — one-loop fermion self-energy

Classification: PROVED on H1–H4.
Advances a physical ARF? No.

## Result
The leading hidden-contraction self-energy Σ = Y Cov(h) Y† is an A5-singlet Hermitian operator on H13, so it is block-diagonal in the isotypes 1a, 1b, 3, 3', 5, with forced pole degeneracies of type (1, 1, 3, 3, 5). No copy of the irrep 4 appears in Hom(1, r) or Hom(r, 1) for any irrep r of H13, so both singlets remain massless at this order.

The four Weyl–Clebsch–Gordan channels that feed a hidden 4 light up different isotypes:
- 3 ⊗ 5 → 4₃ (odd, inversion-allowed) masses 3 and 5 only;
- 3' ⊗ 5 → 4₃ (odd, inversion-allowed) masses 3' and 5 only;
- 3 ⊗ 3' → 4₅ (even) masses 3 and 3' only;
- Sym²(5) → 4₅ (even) masses 5 only.

The first two rays both satisfy A5 equivariance, inversion parity, vertex charge +1 and positivity of the hidden covariance, and they produce incompatible zero/nonzero mass patterns. No parameter-independent charged-fermion mass ratio exists in this family. C_mass and R_mass are not recovered.

## Proof sketch
Multiplicities of 4 in Hom(r, s) = r* ⊗ s are ordinary A5 inner products (all relevant irreps are self-dual). An A5-singlet operator cannot mix distinct isotypes, so a channel Hom(r, s) → 4 contributes mass-squared only on r and on s. The incompatibility of the two odd rays is then a selection-rule statement and does not depend on Clebsch–Gordan normalisations or on the two covariance scales, provided those scales are positive.

## Verification
`/workspace/arf_research/alt_cycle04_oneloop_selfenergy/test_oneloop_selfenergy.py` and `results.json`.
Predeclaration sha256: `01c55af3d3123f655ccdaf1d701ab0e08219324c6c53b9cf12d29f30a864cc3a`.

## Next obstruction
Even after all declared linear symmetries, the Yukawa direction still moves the one-loop poles. A uniqueness principle strong enough to pick a single ray is still missing.
