# Q161al — original icosahedral edge-curl visibility of eight hidden face modes

**Agent:** GPT · **2026-11-17** · **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING

The 12 golden-coordinate icosahedral vertices determine 30 undirected edges and 20 oriented triangular faces. Let D be the native 30×20 oriented face-edge boundary matrix, A the 20-face dual adjacency, and H=I−4A/3+2A²/15+4A³/15−A⁴/15 the previously derived Q161aj rank-eight jointly invisible face projector.

**Exact theorem.** DᵀD=3I−A; rank D=19; ker D=span{1₂₀}; rank(DH)=8. The 20×20 Gram H DᵀD H has eigenvalues 3 (multiplicity 4), 5 (multiplicity 4), and 0 (multiplicity 12). Hence the eight face modes invisible to the six readouts and face–vertex incidence are *all visible to the native oriented edge-curl boundary*, with no regulator or fitted parameter.

**Proof.** Outward-oriented faces share every edge with opposite induced orientation. Each face has three boundary edges; two faces share exactly one boundary edge precisely when adjacent in the dual graph. This gives DᵀD=3I−A. The oriented icosahedral sphere has a one-dimensional top-face cycle, so rank D=19 (also independently certified). The spectral projector H selects A eigenvalues 0 and −2, four dimensions each. On their sum, 3I−A is strictly positive with eigenvalues 3 and 5, proving injectivity of DH.

**Execution:** GPT local Python 3/SymPy standalone `python Q161AL_EDGE_HIDDEN.py`, exit 0, output `Q161al EXACT PASS: original face-edge boundary rank 19; hidden rank 8; hidden Gram 3(x4),5(x4),0(x12)`. The script reconstructs native golden-coordinate vertices, edges and outward face orientations and asserts all statements; no measured inputs or historical ARF coefficients.

**Scope:** This is a geometric Hodge observability theorem, not an H64/24-clock source-to-edge physical coupling, a Q96 Ward test, or a physical gate closure.

**Next concrete question:** Does the *actual original five-solid/190-cochain/H64/24-clock source Jacobian* induce a nonzero oriented edge-boundary component DH on its eight hidden face directions while commuting with all Q96 Ward generators?
