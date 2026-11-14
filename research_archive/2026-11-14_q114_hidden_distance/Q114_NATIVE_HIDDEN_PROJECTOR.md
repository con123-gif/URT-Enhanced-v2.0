# Q114 — exact distance kernel of original icosahedral hidden G5 projector

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Exact finite combinatorial theorem, not a physical ARF.

Construct the original 12-vertex icosahedron, its 20 triangular faces and 30-edge dual dodecahedral adjacency. Let C be the original 20x12 face-vertex incidence, L=3I-adjacency(dual), P_h=I-C(C^TC)^(-1)C^T and P5=P_h(L-3I)/2. Direct exact arithmetic verifies P5^2=P5, P5^T=P5, rank(P5)=4, LP5=5P5.

**New exact kernel formula.** For faces f,g and dual graph distance d(f,g),

P5(f,g) = 1/5 if d=0 or 5; -2/15 if d=1 or 4; 1/30 if d=2 or 3.

The 20x20 hidden projector is thus completely determined by the icosahedral dual distance, and face intersection size alone is insufficient: disjoint faces at distances 3,4,5 have different entries. This gives an exact rational, orientation-free regression target for Q112's G5=U_h P5 U_h^T, avoiding floating-point projectors.

**Evidence:** python research_archive/2026-11-14_q114_hidden_distance/Q114_NATIVE_HIDDEN_PROJECTOR.py, executed locally with SymPy/networkx, exit 0. No empirical inputs, fitted constants or historical ARF values.

**Scope:** This independently constructs the original icosahedral face Laplacian and projector, not the full A5-twirled history transfer. It does not close Gate A.

**Next question:** Does replacing Q112's symbolic P5 matrix by this exact dual-distance kernel yield an identical rational G5 and the same certified offblock witness on the Q77 selected dictionary?
