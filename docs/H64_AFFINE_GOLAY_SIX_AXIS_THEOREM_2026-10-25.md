# Cathedral H64 ↪ Golay G24: exact six-axis theorem

Date: 2026-10-25. **Status:** proved finite mathematics (integer-exhaustive computation plus explicit linear algebra), not a derivation of the physical H64 transfer dynamics.

## 0. Historical source: actually six icosahedral axes

The recovered `research_archive/2026-10-14_recovered_H64/Cathedral_Rederivation_2026-10-08.py` explicitly constructs six unoriented icosahedral axes, a 6x6 conference matrix, `bits=list(itertools.product([-1,1], repeat=6))`, 64 history states, and a 64x13 Walsh carrier. This is the original six-axis *history carrier*, not a new 64-state system invented for Golay. This fact was absent in the previous Golay gate.

Classical independently published mathematical fact: the binary extended Golay code arises from the icosahedral graph via `G = [I12 | (J12 - A)]`; see A.E. Brouwer, *Golay and HiS*, https://aeb.win.tue.nl/2WF02/Golay-HiS.pdf. The code itself is not a new discovery.

## 1. Construct the six signed history bits from A5

Take A5 as all even permutations of five letters. Its 24 elements of order five split into conjugacy classes C and C' of 12. On C, set `A(x,y)=1` if `x != y` and `order(xy)=3`. Exact group enumeration gives the icosahedral adjacency graph: 12 vertices, 30 edges, degree five. The antipodal involution is `x ↦ x^-1`; its six unordered orbits `a ↔ ā` are the six axes of the existing H64 Walsh history.

An **oriented six-axis history** chooses exactly one vertex from each antipodal pair, so the 12-bit selector x satisfies `x_a + x_ā = 1 (mod 2)`, for all six axes. There are 2^6=64 such x. The A5 rotation action on the 12 vertices induces **signed permutations** of these six choices, not just ordinary permutations. That distinction is essential for compatibility with the recovered ±1 Walsh basis.

## 2. Exact A5-equivariant embedding into Golay

Set `D=J12-A (mod 2)`. The standard Golay generator maps a 12-bit x to `E(x)=(x,Dx)` in 24 bits. This is injective since the first half is x. Moreover `DP=PD` (A commutes with antipodal exchange) and `D 1 = 1 (mod 2)` (D has row sum seven). For a signed history `P x = x + 1 (mod 2)`; therefore

```
P(Dx) = D(Px) = D(x+1) = Dx+1,
```

so Dx is *also* a six-axis transversal. Hence **every one of the 64 signed histories maps to a weight-12 Golay codeword**, 6 chosen coordinates in each half. The map commutes with all A5 rotations because D is A5-equivariant; direct verification exhausts all 60 rotations and all 64 histories (3,840 cases).

**Theorem:** An A5-invariant *affine* 64-element subset of the extended Golay code consists of 64 dodecads and is naturally indexed by the six signed icosahedral-axis choices used by the recovered H64 history seed. It is not the separately constructed 64-word **linear** antipodally-equal code (which has weight enumerator 1+15 z^8+32 z^12+15 z^16+z^24).

## 3. Orbit and representation theorem

Exhaustively applying all 60 A5 rotations to the 64 signed histories partitions them into four orbits, of sizes **12, 12, 20, 20**. The size-12 orbits have C5 stabilizers, isomorphic as transitive A5-sets to the 12 icosahedral vertices; size-20 orbits have C3 stabilizers, isomorphic as transitive A5-sets to the 20 dodecahedral vertices. Thus the 64 historical carriers decompose as two icosahedral-vertex A5-sets and two dodecahedral-vertex A5-sets.

The permutation character on the 64 histories is `(64,0,4,4,4)` at element orders `(1,2,3,5,5)`, respectively. Its inner product with *each* of the five real irreducible characters of A5 is four, giving

```
C^64 ≅ 4 (1 ⊕ 3 ⊕ 3′ ⊕ 4 ⊕ 5).
```

The first-degree signed Walsh functions have character `(6,-2,0,1,1)` and hence decompose as `3⊕3′`. The constant and the product of six bits are two invariant singlets (the number of flips under each rotation is even). A traceless symmetric quadratic construction on either golden triplet yields a fiveplet, so the recovered **13-dimensional visible Walsh carrier** has the expected character

```
H13 ≅ 2·1 ⊕ 3 ⊕ 3′ ⊕ 5,
```

with an invariant 51-dimensional complement. This is a representation-theoretic compatibility statement; it does not equate the full operator with any Golay Hamiltonian.

## 4. Exact 15-to-24 group count (not a 15° physical law)

A5 has precisely 15 elements of order 2, 20 of order 3, 24 of order 5, and the identity. Under its signed six-axis action, each order-two element fixes exactly two *unoriented* axes; these 15 fixed-axis pairs are all different and exhaust the 15 unordered pairs of six axes. The 15 weight-eight words of the **other, linear** 64-word subcode are indexed by these same two-axis subsets, giving an A5-equivariant correspondence after the natural identification of axes.

`15 × 24 = 360` remains a true cardinal/arithmetic identity, while `15° × 24 = 360°` is a 24-way planar subdivision. Neither proves that the universe has a 24-fold rotation symmetry, and A5 has no element of order 24.

## 5. Exact positive symmetry-invariant selection Hamiltonian for the physical-history AFFINE carrier

Form the 12 binary Golay syndrome rows `H=[D|I12]` and six pair rows `R_a=e_a+e_ā` acting on the FIRST 12 coordinates. Their combined 18x24 binary matrix has rank **18**; the affine syndrome constraint is `H w=0`, `R_a w=1` for every a. Rank-nullity forces exactly `2^(24-18)=64` solutions; these are precisely the signed-history Golay dodecads.

Let `S_i=product_j Z_j^{H_ij}` be the 12 commuting Golay-check operators and `U_a=Z_a Z_ā` the six pair operators. Then the **geometric witness Hamiltonian**

```
H_geom = Σ_{i=1}^{12} (I-S_i)/2 + Σ_{a=1}^{6} (I+U_a)/2
```

is positive, A5-invariant, and has exactly those 64 computational-basis states as its kernel. Every syndrome is realized equally often, so the full spectrum is `E_k=k` of multiplicity `64*C(18,k)` for `k=0,…,18` (total `2^24`). The rank-64 groundspace projector is the product of the 18 +1/+/- stabilizer projectors. No physical constants or fitting are used in this finite construction. The 18-body Hamiltonian is **constructed from the code**, not derived from the previously frozen H64 physics.

A conditional Gibbs weight with the pre-existing Cathedral rail `beta=2*(-ln Δ)` would make the selected-groundspace probability `(1+Δ²)^(-18) ≈ 0.9998884773755219`, but equating these syndrome costs to real H64 energies remains an extra hypothesis, not an established prediction.

## 6. What the proof does and does not show

**Proved:** exact H64 *six-axis basis* ↪ a 64-dodecad affine sector of G24; full A5 equivariance; `12+12+20+20` orbit decomposition; all A5 irreps fourfold in 64 histories; correct possible H13 character; explicit rank-64, positive, A5-equivariant **geometric** selector; involution-to-axis-pair bijection.

**Not proved:** the actual physical selected transfer `T_* = P_G W_Δ^(1/2) exp(-η_Δ K_*) W_Δ^(1/2) P_G` equals the constructed positive selector, or that its species-loaded currents/photon/geometry reproduce physical observations. An A5-invariant selector is not unique: the 64-dimensional real A5 representation contains four copies of each irrep, so its real equivariant endomorphism algebra has dimension `5*4^2=80`. In particular equivariance and positivity alone cannot single out the physical H64 transfer. The next physical statement requires its actual matrix elements or an independent dynamical selection axiom, not numerical identification by dimension alone.

**Reproduce:** `python cathedral_H64_affine_Golay_proof_2026-10-25.py` using only the Python standard library; results written to `cathedral_H64_affine_Golay_proof_2026-10-25_results.json`.