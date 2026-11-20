# Q161cq — native five-solid vertex leverage

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161cl/Q161by and all physical gates remain OPEN.

Let E be the original Q161ca/Q161cb 50×8 normalized degree-one and traceless degree-two source matrix for tetrahedron, cube, octahedron, dodecahedron and icosahedron. Let P=E(EᵀE)⁻¹Eᵀ.

Exact diagonal values P_vv, with multiplicities:
- Tetrahedron: 549/3860 (4).
- Cube: 549/3860 (4), 669/3860 (4).
- Octahedron: 15149/90710 (6).
- Dodecahedron: 549/3860 (4), 89219/544260 (12), 669/3860 (4).
- Icosahedron: 29293/181420 (12).

All 50 entries are strictly between 0 and 1; their sum is exactly 8. In particular cube and dodecahedron leverage is not vertex-uniform. This refines Q161cd's solid-level trace without modifying it.

**Certificate/proof:** Reconstruct E from the original five-solid vertex coordinates and Q161cb harmonic columns. Compute G=EᵀE and its exact inverse over Q(√5), evaluate each e_v G⁻¹ e_vᵀ, compare each multiset with the exact rational values above, and assert positivity and trace. Script Q161CQ_CERT.py executed locally 2026-11-20, exit 0. No measured data or fitted parameters.

**Limit:** This is geometric source leverage, not the original Q96 charge action, H64/24 Ward residual, or a physical observable.

**Next question:** Recover the original Q101/Q125 source-to-Q96 embedding B_x and calculate (I−P)B_x†Q96B_xE.
