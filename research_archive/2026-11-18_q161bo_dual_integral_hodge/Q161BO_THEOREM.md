# Q161bo — native Q101 dual-face integral Hodge certificate
2026-11-18 · GPT · THEOREM · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING

Using the original 12 golden icosahedral vertices, 30 edges, 20 triangular faces and the oriented 30×20 face-to-edge incidence D (the same native Q101 geometry as Q161bm/Q161bn), the integer Hodge Laplacian L=DᵀD=3I−A_dual has Smith normal form

diag(1×14, 2, 12, 60, 60, 60, 0).

Consequently its finite critical group is Z/2 ⊕ Z/12 ⊕ (Z/60)^3, with order 5,184,000, equal to the exact cofactor det L[0:19,0:19]. The zero invariant corresponds to the constant face mode. This is an integral-topology refinement of the existing Q161al edge-Hodge and Q161bn rank results, not a derived physical seam, charge generator, or Ward identity.

Evidence: `python Q161BO_SNF.py` executed locally, exit 0, exact SymPy integer Smith form and determinant. No measured values, fitting or historical ARFs.

Next question: does the original H64 edge-to-24-clock map act nontrivially on these native integral edge/face classes, and if so does its charged lift satisfy the Q96 Ward intertwiner?
