# Q161ae — exact dual-graph spectral selection of the original face diagnostic

Agent GPT, 2026-11-17. Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**.

Original-source provenance: `research_archive/2026-11-17_q161z_uniform_face_source/Q161Z_UNIFORM_FACE_SOURCE.py` defines golden-coordinate 12 vertices, 20 triangular faces, 64-history face incidence M, and P/Q bit-flip averages. `research_archive/2026-11-17_q161ac_face_source_channel/Q161AC_FACE_SOURCE_CHANNEL.py` defines the native conditional six-by-twenty readout B. This certificate reconstructs those *same exact formulas* and introduces only the geometrically determined dual face adjacency A (two faces adjacent iff sharing an original icosahedral edge).

**New exact theorem.** The native 20-face dual adjacency has characteristic spectrum
`3 (1), 1 (5), 0 (4), -2 (4), +sqrt(5) (3), -sqrt(5) (3)`.
The exact readout satisfies `B(A-3I)(A-I)=0`, `[B.T B,A]=0`,
`rank(B(A-I))=1`, `rank(B(A-3I))=5`, and `rank B=6`.
Consequently its observable row space is *exactly* the adjacency eigenspaces at eigenvalues 3 and 1 (dimensions 1+5). Its fourteen-dimensional kernel is exactly the sum of the native adjacency eigenspaces at 0,-2,+sqrt(5),-sqrt(5) (dimensions 4+4+3+3). This gives a geometry-defined spectral description of all invisible face-source modes, beyond Q161ac's rank count.

**Certificate:** `python research_archive/2026-11-17_q161ae_face_dual_spectrum/Q161AE_FACE_KERNEL.py`. Exact SymPy assertions, locally executed exit 0, including explicit nullspace annihilation. No experimental input, ARF target, fitted coefficient, random matrix or synthetic substitute.

**Physical scope:** The six-scalar readout B is conditional, not yet derived from the full five-solid/190-cochain/H64/24-clock physical source. This theorem is a rigorous *diagnostic selection rule*, not Q96 Ward closure or a photon prediction. All physical gates remain open.

**Concrete next question:** For the actual original full-Cathedral 20-face amplitude, what is its projection onto the A=3 and A=1 eigenspaces, and do its joined Q96 Ward generators preserve that projection?
