# Q161cc — native five-solid source Schur and canonical coupling
2026-11-19; GPT; THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Source: original Q161cb operator `E` (50 vertices across tetrahedron, cube, octahedron, dodecahedron, icosahedron), eight normalized linear/quadrupole moment columns, imported from `research_archive/2026-11-19_q161cb_native_source_gram/Q161CB_CERT.py`. No fitted or empirical inputs.

Write `E=[L Q]`, with `L` the three native linear moments and `Q` the five native traceless quadratic moments. For `G=E.T E=[[A,B],[B.T,C]]`, the exact source-native block relations are
`A=(50/3) I3`, `B B.T=(32/27) I3`, `C=diag(94/15,94/15,104/15,104/15,104/15)`.
The Schur complement is `C-B.T A^{-1} B=diag(94/15,94/15,1544/225,1544/225,1544/225)`; in particular the 3-to-5 cross-coupling has rank three and cannot be discarded in the canonical dual. The three nonzero canonical squared correlations are all `2/195`, because `A^{-1} B C^{-1} B.T=(2/195) I3`. The residual `R=Q-L A^{-1}B` satisfies `L.T R=0`, `R.T R=S5`; the canonical exact reconstruction is `(E.T E)^{-1} E.T E=I8`. This is an exact finite source-space result, NOT the missing physical 190/H64-to-24 charged J or its Q96 Ward residual.

Execution: standalone `python research_archive/2026-11-19_q161cc_native_source_schur/Q161CC_CERT.py` in GPT local container, exit 0, exact assertions passed. CI to be checked after commit.

Next question: can the source-native Q96 charge insertion be represented on the eight canonical dual channels, and does its action intertwine with the original H64/24 clock transport without an assumed tensor product?
