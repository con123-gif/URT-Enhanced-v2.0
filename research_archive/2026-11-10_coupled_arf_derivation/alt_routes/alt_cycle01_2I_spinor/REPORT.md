# alt_cycle01 — 2I binary-icosahedral double cover

Classification: PROVED on H1–H5.
Advances a physical ARF? No.

## Result
The existing carriers H13, H51 and H64 admit no spinorial 2I-module structure compatible with their A5 action: they are pullbacks through 2I → A5, so the central element −I already acts as +Id. Independently, every spinorial irrep of 2I has even dimension (2, 2, 4, 6), so the odd-dimensional spaces H13 and H51 cannot themselves be fermionic 2I-modules.

The natural lifts F = H13 ⊗ 2 and F' = H13 ⊗ 2' are well-defined 26-dimensional spinorial modules,
F ≅ 3·2 ⊕ 2·4' ⊕ 2·6 (and likewise F' with 2 ↔ 2'). Their invariant kinetic algebras have complex dimension 17 (up from 7 on H13). The Weyl–Yukawa space Hom(Sym² F, 4 ⊕ 4) has dimension 42; the Dirac-type space Hom(4 ⊕ 4, End(F)) has dimension 80. Neither is a ray. The double cover contributes only the central ℤ₂ = {±I}, which distinguishes bosons from fermions but does not quantise a U(1) coupling or fix its normalisation.

A structural identity, not a uniqueness theorem: the hidden vectorial 4 is 2 ⊗ 2' as 2I-modules, and 2 ⊗ 2 = 1 ⊕ 3, 2 ⊗ 3 = 2 ⊕ 4', 2 ⊗ 3' = 6.

## Proof sketch
The character table of 2I = SL(2,5) (order 120, nine classes) was assembled from the A5 pullbacks together with the SU(2) characters 2 cos(α/2) of the binary icosahedral cover, and checked by orthogonality and the sum-of-squares identity 1+4+4+9+9+16+16+25+36 = 120. Module decompositions are inner products of characters. End-dimension is Σ mᵢ². Yukawa dimensions are the multiplicity of the vectorial 4 in Sym²(F) and in F ⊗ F.

## Verification
`/workspace/arf_research/alt_cycle01_2I_spinor/test_2I_spinor.py` and `results.json`.
Predeclaration sha256: `450ba95f1e3a01ad1dabd35877e5141ff83e28b0c66aaca9d2b7e71f410e2a30`.
Key numbers: kinetic cone 17; Sym² Yukawa to two hidden quartets 42; End Yukawa 80.

## Next obstruction
A fermionic carrier has to be a new module such as H13 ⊗ 2. That change enlarges, rather than shrinks, both the kinetic cone and the Yukawa space.
