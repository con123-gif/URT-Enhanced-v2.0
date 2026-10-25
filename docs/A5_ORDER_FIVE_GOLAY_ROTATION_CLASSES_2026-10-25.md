# Newton's Cathedral — 15/24 icosahedral rotation census and exact order-five-to-Golay construction

**Date:** 2026-10-25  
**Scope:** mathematical group-theoretic result; **not** a physical law or a Lean verification certificate.  
**Reproduction:** `cathedral_A5_order5_Golay_exact_2026-10-25.py` (Python standard library, no numerical fits or floating point).

## 1. Distinguish the cyclic partition from a physics claim

`15° × 24 = 360°` gives the regular cyclic subdivision of the plane's rotation circle, hence the natural representation of `Z/24Z` by rotations through multiples of `15°`. It does not establish a preferred physical 24-fold symmetry. A separate proof in Lean would establish the statement it actually encoded, but no such Lean code has been supplied or located in the project's current primary GitHub branch.

**Different mathematical fact:** the proper icosahedral rotation group is `A5` of order `60`, with element-order census `1:1`, `2:15`, `3:20`, `5:24`. Its 24 order-five elements split into two distinct conjugacy classes `C` and `C'` of 12 elements each. These cardinalities are intrinsic to the icosahedron; the 15 here counts half-turns, **not** degrees. In particular `A5` has no element of order 24, so one cannot identify an intrinsic A5 generator with a `15°` planar rotation.

## 2. Construct the 12-vertex icosahedron from the group law

Take `A5` as the 60 even permutations of five symbols. Pick an element `g` of order five and let `C={hgh^{-1}:h∈A5}`. Then `|C|=12`. For `x,y∈C`, let

`A_xy = 1` iff `x != y` and `order(x*y) = 3`, and `0` otherwise.

An exact exhaustive calculation establishes:

- The resulting `12×12` adjacency is symmetric, zero-diagonal, five-regular with `30` unoriented edges.
- It is preserved by **all 60** conjugation permutations of `A5`.
- Its square satisfies `A²=3I+2J−2P`, where `J` is the 12×12 all-ones matrix and `P_xy=1` iff `y=x^{-1}` (the antipodal pairing).
- The graph is the regular icosahedral graph; its adjacency spectrum is `{5 (1), +sqrt(5) (3), −sqrt(5) (3), −1 (5)}`.

This reconstructs the shell using only the intrinsic multiplication and conjugacy structure of `A5`, without first stipulating an icosahedron in Euclidean coordinates.

## 3. Square-map duality and the golden sectors

Let `C'` be the other 12-element conjugacy class of order-five elements. The equivariant power map `s:C→C'`, `s(x)=x²`, is a bijection. Define adjacency on `C'` by precisely the same order-three-product rule; transporting it to `C` via `s` gives

`A' = J − I − P − A = AP`.

Thus the 5 first-neighbour links on one class correspond to 5 second-neighbour links on the other. The two `3`-dimensional eigenspaces with eigenvalues `+sqrt(5)` and `−sqrt(5)` swap under `A→A'`; this is the exact golden doublet/triplet exchange at graph level. It is not yet an identification of the Cathedral's physical hidden chiral dynamics.

## 4. Extended binary Golay code as a group-derived 24-coordinate structure

The 24 order-five rotations provide an `A5`-equivariant coordinate set `C ⊔ C'` of size `12+12`. Use the square map to index the second half by the first. In `GF(2)`, form

`G = [ I_12 | (J_12 − A) mod 2 ]`.

The direct verification proves:

- `G G^T = 0` mod 2, so the code is self-orthogonal;
- rank `G = 12`, because its first 12 columns form `I_12`; hence the code is self-dual;
- enumerating all `2^12=4096` messages yields weight enumerator

`W(z) = 1 + 759 z^8 + 2576 z^12 + 759 z^16 + z^24`;

- minimum distance is 8, identifying the extended binary Golay `[24,12,8]` code.

The icosahedron-to-Golay generator is classical, but its realization via the *two conjugacy classes of order-five rotations* gives a precise, tested `A5`-equivariant bridge for the Cathedral's 12+12 sectors. Different coordinate labellings produce equivalent codes; this is not uniqueness of physical realization.

## 5. Selection/physical limitations

The construction determines a 24-coordinate `A5`-set and a binary error-correcting code. It does **not** imply that the real 3D universe has 24 privileged angular directions, that `15°` is a physical constant, or that the URT angle `2π/φ²` closes after 24 steps: `24/φ²` is irrational.

The positive Golay projector derived in the previous gate is an **engineered parity selector** on 24 binary degrees of freedom. The canonical Cathedral operator `T_* = P_G W_Δ^(1/2) exp(-η_Δ K_*) W_Δ^(1/2) P_G` is built on the species-loaded H64 sector and has not been shown to realize those Golay parity checks. No unique physical information-to-angle identification is proven. The Golay-to-Leech lattice extension requires further integer/coset glue beyond the binary code.

**Classification:** exact finite algebra: closed. Physical transfer identification: open. Finite 24-fold planar rotation as fundamental physical symmetry: unsupported, and not an internal `A5` element.

## References

- UCLA algebra notes on icosahedral group conjugacy classes: https://www.math.ucla.edu/~sharifi/notes/algebra-ch04.html
- Wolfram MathWorld, Icosahedral Graph: https://mathworld.wolfram.com/IcosahedralGraph.html
- Wolfram MathWorld, Golay Code: https://mathworld.wolfram.com/GolayCode.html
- Current project transfer gate: `docs/PLATONIC_TRANSFER_OBSERVABLE_GATE_2026-10-14.md`
- Previous Golay selection gate: `docs/GOLAY_LEECH_SELECTION_GATE_2026-10-25.md`