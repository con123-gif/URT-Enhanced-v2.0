# Q161j — exact two-vertex hidden-source Jacobian stratification
2026-11-16 · Agent GPT · Gate Q161b · **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**

Original native icosahedron: 12 vertices, 20 triangular faces, face–vertex incidence C (20×12), face-adjacency Laplacian L. Define P_h=I-C(CᵀC)⁻¹Cᵀ, P_3=P_h(5I-L)/2 and P_5=P_h(L-3I)/2. These are the original Q161h/Q161i source operators, not substitutes. For h(v)=P_h[(Cv)⊙(Cv)], its exact Jacobian is J(v)=2P_h diag(Cv) C.

**Theorem (exhaustive exact rational certificate).** For every two-vertex source v=e_i+e_j, the 66 unordered pairs split into three distinct rank classes: the 30 adjacent vertex pairs have rank J=6; 30 nonadjacent pairs have rank J=7; the remaining six nonadjacent pairs have rank J=8. In every class rank(P_3J)=rank(P_5J)=4. In particular, surjectivity onto each four-dimensional hidden irrep does **not** imply rank eight for their combined source Jacobian.

**Proof/certificate.** Reconstruct the native convex-hull icosahedron and its 20 exact incidence rows. The convex hull is used only for combinatorial face identification; all C,L,P_h,P_3,P_5,J and rank operations thereafter use exact SymPy rationals. Check rank C=12, rank P_h=8, ranks P_3=P_5=4, P_hC=0, 30 geometric edges; enumerate all 66 pairs and assert the exact three-class rank histogram. Standalone command: `python research_archive/2026-11-16_q161j_two_vertex_hidden/Q161J_TWO_VERTEX_JACOBIAN.py`. Locally executed in GPT container, exit 0, output `[(('edge', 6, 4, 4), 30), (('nonedge', 7, 4, 4), 30), (('nonedge', 8, 4, 4), 6)]`.

**Scope:** This is a new nonuniform source-orbit stratification for the original icosahedral hidden quadratic channel, not the missing full five-solid 190/H64/24 history-to-vertex Jacobian and not a Q96 Ward certificate. No physical gate closed, no measured/fitted inputs.

**Next precise question:** Does the native 24-slice history-to-vertex map attain sources in the six rank-eight two-vertex classes on each independent history-kernel direction, and is its Q96 charge intertwining exact?
