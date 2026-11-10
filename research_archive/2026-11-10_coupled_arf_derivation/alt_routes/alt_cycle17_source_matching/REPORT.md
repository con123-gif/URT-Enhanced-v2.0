# alt_cycle17 — source-matching from Hamming-parity orbit labels

Classification: H1 PROVED; H2 FALSIFIED; H3 PROVED.
Advances a physical ARF? No.

## Result
The 64-history construction of alt_cycle10 was reproduced. Hamming parity is constant on each of the four A5-orbits (sizes 12, 12, 20, 20): one 12-orbit is all odd weight, one is all even weight, and the two 20-orbits are likewise split. Spatial inversion (all-flip) preserves each orbit.

The permutation character of A5 on a 12-orbit is (12, 0, 0, 2, 2) on classes (1A, 2A, 3A, 5A, 5B), which decomposes as 1 ⊕ 3 ⊕ 3' ⊕ 5. Hamming parity, being constant on the orbit, acts as a scalar there and therefore as the same multiple on the 3 and the 3' inside that orbit. Any linear combination of the four orbit projectors has the same property, so it cannot kill Hom(3'⊗5, 4_3) while keeping Hom(3⊗5, 4_3).

The A5-invariant part of Hamming weight itself is the constant function 3 on every history, which is even weaker than parity as an orbit label.

Source-matching (β = 0 with α kept) is therefore not implied by the history / Hamming-parity orbit labelling. It remains an extra assumption. Hamming parity continues to be the canonical label for opposite-charge pairings of orbits, not for the 3 versus 3' Yukawa channel.

## Verification
`/workspace/arf_research/alt_cycle17_source_matching/test_source_matching.py` and `results.json`.
Predeclaration sha256: `1026ea2729128baab1c05562df8c3f3ab4e73edd8fda413b013e1c4a7062f1ec`.

## Next obstruction
Source-matching remains an extra assumption. A different native structure would be needed to set β = 0.
