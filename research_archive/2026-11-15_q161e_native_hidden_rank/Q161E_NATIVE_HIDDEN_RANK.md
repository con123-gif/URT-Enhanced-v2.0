# Q161e — original five-solid hidden-source rank bottleneck (15 November 2026)

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **Result:** OBSTRUCTION limited to one temporal hidden-source slice; Q161b and physical gates stay open.

**Original provenance:** `research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py` defines all five Platonic solids and 190 cochains, the 50-vertex `Plinear`, original icosahedral face incidence `C`, face Laplacian `Lface`, hidden projectors `P3,P5`, and `hidden_source(v)=(P3@(C@Plinear@v)**2,P5@(C@Plinear@v)**2)`. This certificate independently reconstructs the *same original icosahedral vertices, triangular faces, C and projector formulas*, with exact SymPy arithmetic after native ConvexHull face enumeration. It does not replace the original 190-cochain-to-H64 coupling.

**Exact result.** `rank C=12`, `rank P3=rank P5=4`, `P3 P5=0`, and `rank(P3+P5)=8`. Put `A=C Plinear`. The derivative of the original quadratic source at any vertex field `v` is
`Dh(v)[u]=2(P3 diag(Av) Au, P5 diag(Av) Au)`.
Its image is contained in `im P3 ⊕ im P5`, dimension 8. Thus for **any** linear map from the 32-dimensional Q161a kernel into one original source slice, the composed derivative has rank at most 8, hence nullity at least 24. At least four *independent* source slices are necessary for rank 32; four are not sufficient without a concrete incidence map and Ward test. The 24-clock alone (Q161b/Q161c) does not establish independence.

**Execution:** `python research_archive/2026-11-15_q161e_native_hidden_rank/Q161E_NATIVE_HIDDEN_RANK.py`; local container on 2026-11-15, exit 0; exact rational ranks and identities. No experimental values, fitted constants, or historical ARF targets. GitHub CI verdict must be checked separately.

**Boundary:** This is a rank bottleneck, **not** a no-go for the actual 24-clock, nonlinear source at finite background, or physical transfer. The original 190→H64 map on the 32 kernel directions and its Q96 Ward covariance have **not** been computed here.

**Next executable question:** Form the original 24-slice source-to-H64 Jacobian from the archived full action and calculate its exact/controlled rank on the Q161a 32-vector difference basis, with Q96 Ward residual.
