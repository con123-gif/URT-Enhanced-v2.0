# Cathedral hidden-to-visible icosahedral spectral bridge

**Date:** 2026-11-11  
**Status:** Exact finite-dimensional representation and graph-spectral result; no gravitational/orbital interpretation established.  
**Verification:** `python cathedral_hidden_icosahedral_bridge.py` (SymPy), all assertions pass.

## Input: actual combinatorial hidden sector

Take the regular icosahedron, 12 vertices, 20 triangular faces. Let `B` be the unsigned 20-by-12 face–vertex incidence matrix. Build the dual dodecahedral face graph Laplacian `L_D`. Direct exact calculation gives:

- `rank(B) = 12`, hence `dim ker(B^T) = 8`.
- `ker(B^T) = H_3^- ⊕ H_5^+`, with `(L_D|H_3^-) = 3 I_4` and `(L_D|H_5^+) = 5 I_4`.
- The superscripts indicate antipodal parity on the 20 faces: the eigenvalue-3 four-dimensional eigenspace is odd, and eigenvalue-5 four-dimensional eigenspace is even.
- Each summand carries the four-dimensional irreducible representation of the rotational icosahedral group `A5`.

This is verified on actual icosahedron vertices/faces, not assumed from dimensional coincidences.

## Exact hidden-channel selection rule

For `A5`, `4 ⊗ 4 = 1 ⊕ 3 ⊕ 3' ⊕ 4 ⊕ 5`. With opposite antipodal parities, `4^- ⊗ 4^+ = 1^- ⊕ 3^- ⊕ 3'^- ⊕ 4^- ⊕ 5^-`.

The 12-dimensional visible vertex space decomposes as `V_12 = 1^+ ⊕ 3^- ⊕ 3'^- ⊕ 5^+`. Therefore, the only hidden cross-bilinear representations appearing in the visible odd sector are `3^-` and `3'^-`, each with multiplicity one. There are **two independent symmetry-allowed coupling constants**, not a uniquely determined physical interaction. Restricting the cross tensor to its antisymmetric part yields `Λ² 4 = 3 ⊕ 3'`.

## Golden class-sum theorem

Let `ρ_4` be the standard real four-dimensional representation of `A5` on the zero-sum subspace of `R^5`. Let `5A` denote either selected 12-element conjugacy class of 5-cycles. On `Λ² 4`, define:

`C = (1/4) Σ_{g∈5A} Λ²ρ_4(g)`.

Exact symbolic calculation gives:

- `C² − C − I_6 = 0`;
- `det(xI_6 − C) = (x²−x−1)^3`;
- eigenvalues `φ` and `−φ⁻¹`, each triple;
- the two rank-3 projectors are `P_3 = (C+φ⁻¹ I)/√5`, and `P_3'=(φ I−C)/√5`.

Define `L_hid→vis = 6 I_6 − 2 C`. Its eigenvalues are `5−√5` (triple) and `5+√5` (triple), **exactly** the two nontrivial 3D branches of the icosahedral vertex Laplacian. Because both are multiplicity-free copies of `3 ⊕ 3'`, there exists an `A5`-equivariant isomorphism intertwining their operators. This establishes exact *spectral* equivalence, not an independently specified dynamical coupling.

## Cubic versus icosahedral spectral transition

The 12-vertex cuboctahedron graph has Laplacian spectrum `0(1), 2(3), 4(3), 6(5)`.
The 12-vertex icosahedron graph has spectrum `0(1), (5−√5)(3), 6(5), (5+√5)(3)`.

Pairing the corresponding abstract three-dimensional spectral branches:

- `(5−√5) − 2 = 2 φ⁻²`;
- `(5+√5) − 4 = 2 φ`.

These are exact eigenvalue identities. The pairing between **different symmetry groups** `O_h` and `A5` is an abstract spectral comparison, **not** a canonical map from one polyhedron's vertex geometry to the other. An explicit interpolating dynamics has not been derived.

## Boundaries and next mathematical requirement

- Hidden–visible **linear** coupling respecting A5 symmetry is forbidden by irreducible-representation mismatch. Mixed **quadratic** coupling is permitted and selected by parity.
- Nonzero coupling amplitudes and their relative magnitudes are **not fixed** by the selection rule. A zero-parameter physical interaction remains unproven.
- This theorem is a substructure only. It does **not** replace the five-Platonic-solids Hodge complex, the 24-track construction, D6→H3, H13⊕H51, the transfer/Gibbs state, or other Cathedral furniture.
- A precise next task is to build the bilinear vertex map from the actual face incidence matrices and evaluate its adjoint/transfer against the full Cathedral positive operator. Test whether the couplings are uniquely fixed or vanish under additional constraints.
- No orbit catalogue has been audited by this calculation. No inference is made that the Solar System is a quantum crystal or that Planet Nine is ruled out.

## Relevant external precedents

Six-dimensional cut-and-project descriptions of icosahedral quasicrystals: Phys. Rev. B 43, 929 (1991), DOI 10.1103/PhysRevB.43.929; Phys. Rev. B 46, 6091 (1992), DOI 10.1103/PhysRevB.46.6091. These support the general projection geometry, not the Solar System claims.
