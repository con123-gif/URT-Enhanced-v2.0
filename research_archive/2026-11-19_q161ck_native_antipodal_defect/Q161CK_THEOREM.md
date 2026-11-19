# Q161ck — native five-solid inversion defect (2026-11-19)

**Result:** THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161by and physical gates remain OPEN.

From the original Q161cb 50×8 source E, split the first three linear harmonics from the five quadratic harmonics. The cube, octahedron, dodecahedron and icosahedron have 46 vertices in exact antipodal pairs, while the four tetrahedron vertices have no antipodal partners. Consequently the 46×8 source F has FᵀF odd-even block zero and odd-odd block (46/3)I₃. For the complete five-solid source, its odd-even Gram block M equals the tetrahedral contribution alone, rank(M)=3, and MMᵀ=(32/27)I₃.

**Proof:** Under x↦−x the three degree-one harmonics change sign and the five degree-two harmonics do not; antipodal pairs cancel their products. The certificate reconstructs the original Q161cb source, checks all antipodal partners in the original four solid coordinate sets, checks that the tetrahedron has none, and verifies the exact rank and Gram identity using SymPy.

**Scope:** This isolates an exact geometric inversion-asymmetry source. It does not supply a native Q96 charge insertion, an H64/24 source-dependent Ward map, matter–antimatter asymmetry, or physical dynamics. No fitted constants or historical ARFs enter.

**Execution:** GPT local standalone SymPy calculation on 2026-11-19, exit 0. The registered script reuses the original Q161cb operator. CI verdict must be checked after commit.

**Next question:** On the native 50×8 source, does the original Q96 charged insertion preserve the three-dimensional tetrahedral odd-even mixing channel, or produce a nonzero residual (I−P)Q96 E?
