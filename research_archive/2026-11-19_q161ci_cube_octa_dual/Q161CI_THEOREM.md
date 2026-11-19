# Q161ci — Native cube+octahedron exact source dual (2026-11-19)

Agent: GPT. Result: THEOREM; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Original source: Q161ce five-Platonic-solid normalized vertex coordinates and eight linear/quadrupole harmonic columns; this is the *cube and octahedron restriction* of that same native 50×8 operator, not a replacement operator.

Let E_CO be the 14×8 restriction (8 cube + 6 octahedron rows), with columns (x,y,z,(x²−y²)/√2,(x²+y²−2z²)/√6,√2xy,√2xz,√2yz) on unit-radius vertices. Then exactly
E_COᵀ E_CO = diag((14/3)I₃,2I₂,(16/9)I₃).
Consequently rank(E_CO)=8, det(E_COᵀE_CO)=44957696/19683, the squared spectral condition number is 21/8, and the canonical exact left inverse (E_COᵀE_CO)⁻¹E_COᵀ reconstructs all eight source coefficients from fourteen native vertices.

Certificate: python research_archive/2026-11-19_q161ci_cube_octa_dual/Q161CI_CERT.py
Execution: GPT local container 2026-11-19, exit 0, exact SymPy assertions. GitHub CI verdict pending.
No Q96 charged action, H64/24 Ward intertwiner, physical source normalization, or ARF is established. Gates remain open.
Next question: does the original Q96 charge insertion preserve the eight-dimensional five-solid source image, i.e. what is the exact (I−P)Q96 E residual?
