# Q163 — five-solid native face-incidence Hodge spectrum checkpoint (2026-11-23)

Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for finite unweighted incidence spectral checks only. **OPEN** for twisted transport, physical torus, H64/Q96 identification.

Source: original Q161cu Platonic vertices and outward-oriented convex-hull face reconstruction, as reused by `Q163_FACE_TORUS_CHAIN_CERT.py` in the earlier isolated Q163 checkpoint. The calculation uses b1: C1→C0 and b2: C2→C1 built from those original faces, with b1 b2=0. No surrogate transfer matrix.

Local executable: `/mnt/data/q163/Q163_FACE_TORUS_SPECTRAL_CERT.py` (not yet committed; this GitHub note is NOT a CI certificate). Ran in the GPT Python container on 2026-11-23, exit code 0.

Computed Hodge operators: L0=b1 b1^T, L1=b1^T b1+b2 b2^T, L2=b2^T b2. For each solid, nullities (L0,L1,L2)=(1,0,1), and Tr(L0)+Tr(L1)+Tr(L2)=8E. The five-solid total is 720, with 190 cochains and 10 Hodge zero modes.

| Solid | V,E,F | Tr(D²) | Native L0 nonzero spectrum |
|---|---|---|---|
| Tetrahedron | 4,6,4 | 48 | 4 (×3) |
| Cube | 8,12,6 | 96 | 2 (×3), 4 (×3), 6 (×1) |
| Octahedron | 6,12,8 | 96 | 4 (×3), 6 (×2) |
| Dodecahedron | 20,30,12 | 240 | (3−√5) (×3), 2 (×5), 3 (×4), 5 (×4), (3+√5) (×3) |
| Icosahedron | 12,30,20 | 240 | (5−√5) (×3), 6 (×5), (5+√5) (×3) |

**Correction:** The dodecahedron spectrum above includes 3 (×4), 5 (×4) but these multiplicities should be independently checked against the full numerical output before treating the table as a certificate. The numerical output actually gives 2 (×5), 3 (×4), 5 (×4), with the three golden eigenvalues at each end. Count 3+5+4+4+3=19.

Prior Q163 face torus chain projection: all 50 face loops, C_n×C3 projection; H1 torus generators both die in H1 sphere. This new checkpoint adds native untwisted spectral invariants, **not** a torus magnetic spectrum or new physical prediction.

Next: register and commit the full executable after independently auditing its source-native Q161cu constructor, then calculate twisted incidence operators with the existing native projective Hopf link connection. Do not equate C4³ with H64.
