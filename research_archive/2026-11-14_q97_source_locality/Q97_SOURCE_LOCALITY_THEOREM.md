# Q97 — Exact all-five local quadratic source classification (14 November 2026)

**Result: THEOREM for finite native operators; local SymPy exact and independent five-solid numerical certificate PASS; CI pending. The physical ARFs are NOT derived.**

## Provenance / nonduplication

This extends, rather than repeats, the original results in:
- `research_archive/2026-11-07_joint_interacting_native/CATHEDRAL_MODULAR_SOURCE_INTERFACE_THEOREM_2026-11-08.md`: unrestricted `Hom_A5(Sym²(3⊕5),4⊕4)` dimension four and unique positive Gibbs square root when source-amplitude matching is imposed.
- `research_archive/2026-11-07_joint_interacting_native/CATHEDRAL_SELECTION_AND_4D_REFINEMENT_THEOREMS_2026-11-08.md`: conditional uniqueness of **unital multiplication of existing face amplitudes**.
- `research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_NATIVE_SOURCE_RESPONSE_AND_4D_GAUSSIAN_2026-11-08.md`: positive semigroup second-response origin for the original face-square source.
- The code reproduces the **original** `cathedral_engine/geometry.py` C, Ph, P3/P5 construction and complete five-solid `cathedral_engine/source.py` degree-1/2 portal. The 24 clock, 64-history H13⊕H51 and D6→H3 are not replaced or claimed derived in this local classification.

## The new classification theorem

Let C be the original unsigned 20×12 icosahedral face-vertex incidence, and let `Ph=I-C(Cᵀ C)⁻¹ Cᵀ=P3+P5`. Consider **all** A5-equivariant homogeneous quadratic source maps `F:C¹²→C²⁰` that are face-local in the three vertex values on each face.

A5 acts transitively on the 20 faces; the stabilizer of a face is C3 and cyclically permutes its three vertices. Under this stabilizer the six degree-two monomials split into two orbits, giving precisely two possible local invariant polynomials:

```
A_f(x) = sum_{v in f} x_v²
B_f(x) = sum_{i<j, i,j in f} x_i x_j.
F(x)=a A(x)+b B(x).
```

But `A(x)=C(x∘x)`, and `Ph C=0` identically. Therefore

```
           Ph F(x) = b Ph B(x)
                   = (b/2) Ph[(Cx)∘(Cx)].
```

**The hidden-projected space of all face-local A5-equivariant quadratic vertex sources is one-dimensional as a space of maps**, although the unrestricted equivariant quadratic map space has dimension four. This is an exact statement for every vertex field x, not a fit on a selected sample. The projected pair coefficients span all eight hidden dimensions, with separate P3 and P5 ranks 4 and 4. In the original source convention, `F=(Cx)²` fixes `b=2` by definition/facewise multiplication; locality alone leaves b unspecified.

## Full five-solid completion

Whitening degree-one and degree-two harmonics on **all 50 vertices of the tetrahedron, cube, octahedron, dodecahedron, icosahedron**, and separately on the 12 icosahedral vertices, gives original `Eglobal(50×8)`, `Iico(12×8)`, `Plinear=Iico Eglobalᵀ`. The 36 symmetric quadratic coefficient vectors formed from `x=Iico u` span hidden projection ranks **P3=4, P5=4, Ph=8** (independently reconstructed and tested).

Together with the **previously conditional** positive hidden modular transfer `B_hid=P3+ΔP5` and actual original H64 partial isometry, this reproduces the unchanged native source:

```
J(v) = Uh (P3+Δ P5) Ph[(C Plinear v)∘(C Plinear v)].
```

That source and its exact 64-history/24-clock Schur response are well-defined internally. This theorem does **not** prove that the scalar π–φ–e URT recursion selects the locality/unital/source-tilt premise or that J is the unique *physical charged current*. It also does not identify the separate v61 Wilson fermionic sector.

## Physical ARF consequence

The missing step is **not** a mathematical four-residue fitting problem. Within face locality the source shape has now been classified exactly. Nonetheless the actual 24-clock connection has a one-dimensional gauge quotient (one holonomy, not the spatial transverse photon), and the original scalar full action has a unique classical zero vacuum without hidden-source quadratic masses. Its **charged v61 Wilson** action lacks a uniquely forced current/kinetic normalization join with H64. Therefore no physical fine-structure constant or nondegenerate charged fermionic mass spectrum can be claimed from Q97; neither four old ARF formulas nor replacements are currently fixed as physical predictions.

**Independently checked:** an A5-invariant quadratic mass operator on one irreducible geometric triplet is scalar by Schur's lemma; a numeric-exact native 72° icosahedral rotation-pair commutant check (local only) gave dimension one. A5-invariant scalar Δ alone cannot split its three masses. A selected oriented background could evade this scoped observation.

## Reproduce and resume

```
python research_archive/2026-11-14_q97_source_locality/Q97_LOCAL_SOURCE_UNIQUENESS.py
python research_archive/2026-11-14_q97_source_locality/Q97_ALL_FIVE_LOCALITY_RANK.py
```

Both scripts were independently run in local Python and exited zero; the first uses exact SymPy algebra for the entire native face projector, second independently reconstructs original five-solid 50-vertex moments. No observed value used; no protected archive edited; no James Yang–Mills material.

**RESUME HERE:** If primitive URT really determines the charged spatial Wilson/192-matter ↔ H64 current map, it must be exhibited as one explicit operator and must satisfy physical both-order Ward identities and a unique Maxwell kinetic coefficient. Its absence is the precise obstruction to calling the existing finite source laws the full physical ARFs. Do not fit the old ARF formula shapes.
