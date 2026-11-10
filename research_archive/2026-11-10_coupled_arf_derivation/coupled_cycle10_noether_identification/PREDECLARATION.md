# Coupled cycle 10 predeclaration — Noether identification of currents and Yukawas

Require the 4-dimensional Ward-surviving current space of cycle 06 to arise
as the variational (Noether) derivative of a single H13 hopping action
whose kinetic term is the unique Hodge ray of alt_cycle02, together with
the four inversion-allowed Yukawas of alt_cycle05.

Definitions, fixed before computing:

- Hodge hopping action: S_K = ||d φ||² on the geometric graph with one
  centre, 12 icosahedral vertices, 12 spokes and 30 surface edges, all
  of unit weight. This is the unique A5-invariant ray of alt_cycle02
  (eigenvalues 0, 13, 6±√5, 7; overall scale free). Its U(1) Noether
  current j_K lives in the charge-0 sector (vector current ψ̄ U ψ) and
  is unique up to that scale.
- Inversion-allowed Weyl Yukawas: the four CG channels in Sym²(C^{12}),
  C^{12} = 1 ⊕ 3 ⊕ 3' ⊕ 5,
    3⊗5 → 4 (odd, to 4_3),  3'⊗5 → 4 (odd, to 4_3),
    3⊗3' → 4 (even, to 4_5), Sym²(5) → 4 (even, to 4_5).
  Each channel is one real parameter (real representations).
- Wilson-dressed pairing S_Y = Σ_{edges ij} T_{ij}(h) ψ_i U_{ij} ψ_j.
  Its variational derivative with respect to the link phase is the
  edge-supported pairing T itself. Thus a Yukawa produces a spatial
  pairing-current if and only if its CG 4-space lies in the adjacent
  subspace A = span{e_i ∨ e_j : {i,j} an icosahedral edge}.
- A is A5-invariant of type 1 ⊕ 3 ⊕ 3' ⊕ 2·4 ⊕ 3·5 (cycle 06). Each CG
  4 is irreducible, so it is either entirely in A or disjoint from A.
  At most two channels can lie in A.

Will compute, from the 60 archived icosahedral rotations, the containment
of each of the four channels in A, the rank of the resulting map
Φ : {inversion-allowed Yukawas} → {adjacent pairing-currents},
and whether j_K imposes any further linear condition on that image.
The surviving dimension is rank(Φ) (and separately the free scale of j_K).

Classification: PROVED with the computed dimension. If that dimension is
1, the pairing-current is a ray. If not, the identification reduces but
does not fix a ray. No ARF target is used.
