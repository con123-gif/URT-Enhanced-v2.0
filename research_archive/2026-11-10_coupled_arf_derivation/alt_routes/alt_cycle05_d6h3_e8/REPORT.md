# alt_cycle05 — D6→H3, inversion, and optional E8/600-cell constraints

Classification: H1–H3 and H5 PROVED; H4 CONDITIONAL (extra Galois/H4 assumption).
Advances a physical ARF? No.

## Result
Inversion x ↦ −x, central in H3 ≅ A5 × ℤ₂, acts as −1 on 3 and 3' and as +1 on both singlets and on the 5. The four Weyl channels that contain a 4 therefore have definite parity, and each hidden quartet may couple only to channels of its own parity:
- odd 4₃ couples only to 3 ⊗ 5 and 3' ⊗ 5;
- even 4₅ couples only to 3 ⊗ 3' and Sym²(5).

This cuts the H13 Weyl–Yukawa space from 8 real parameters (cycle 01) to 4. Four is still larger than a ray. Combined with the Hodge kinetic ray of alt_cycle02, one fermion-wavefunction scale remains free.

The A5-action on the six icosahedral diameters (the outer embedding A5 ⊂ S6 relevant to D6) is the permutation module 1 ⊕ 5, character (6, 2, 0, 1, 1). It contains neither a 3 nor a 4, so it does not host the hidden quartets and does not forbid any of the four surviving channels.

H3 itself does not swap 3 with 3', because inversion is central. Imposing an extra Galois / left-right H4 (600-cell) identification of 3 with 3' would force the two odd couplings to be equal and reduce the count from 4 to 3, still not a ray. That step is an additional assumption, not a consequence of D6→H3 or of inversion.

## Verification
`/workspace/arf_research/alt_cycle05_d6h3_e8/test_d6h3_e8.py` and `results.json`.
Predeclaration sha256: `fc3c7b4bb6068f42bc7d937258f3c49d1f5483713ef574779d286a57b3f63982`.

## Next obstruction
Inversion is a genuine cut (8 → 4) but uniqueness still fails. D6-via-diameters does not cut further; optional H4/Galois would reach only 3.
