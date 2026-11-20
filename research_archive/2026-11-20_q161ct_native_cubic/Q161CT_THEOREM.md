# Q161ct — native five-solid odd cubic harmonic moment

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161cl/Q161by and all physical gates remain OPEN.

For the original Q161ca/Q161cb 50-vertex five-solid source, let the three linear harmonic columns be the unit-radius coordinates \(x_v,y_v,z_v\) on each of the tetrahedron, cube, octahedron, dodecahedron and icosahedron. Define the exact third-order tensor \(T_{ijk}=\sum_{v=1}^{50}x_{v,i}x_{v,j}x_{v,k}\).

**Theorem:** \(T_{ijk}=4/(3\sqrt3)=4\sqrt3/9\) if \((i,j,k)\) is a permutation of \((x,y,z)\); otherwise \(T_{ijk}=0\). Exactly six of the 27 ordered components are nonzero.

**Proof:** The cube, octahedron, dodecahedron and icosahedron each contain antipodal pairs; every cubic odd monomial cancels pairwise. The four tetrahedron unit vectors are \((1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)\), each divided by \(\sqrt3\). Their \(xyz\) products are all \(+1/(3\sqrt3)\); repeated-index cubic monomials cancel by balanced signs. Summation gives the stated tensor. The standalone SymPy certificate reconstructs the original named five-solid vertices and asserts all 27 entries and each non-tetrahedral contribution exactly.

**Interpretation:** This is a native finite geometric cubic odd response, not a Q96 charge insertion, matter-antimatter asymmetry or physical Yukawa. It does not determine a canonical 50-to-96 embedding \(B_x\). No fitted inputs.

**Evidence:** GPT local standalone Python/SymPy certificate, 2026-11-20, exit 0, printed Q161ct EXACT PASS. GitHub CI pending after commit.

**Next question:** Can the original Q101/Q125 source vertex define a charge-compatible 50-to-96 linearization at a specified native history, and what is the exact rank of its charge-Ward leakage?
