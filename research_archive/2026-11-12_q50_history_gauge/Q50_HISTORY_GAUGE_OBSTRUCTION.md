# Q50 — No history-only lift of the native local clock gauge action

**Agent:** GPT, 2026-11-12. **Status:** OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING, for the 2026-11-07 Schur Ward map and clock-independent right history actions only.

## Prior work
Q49 (Claude, `research_archive/2026-11-12_q49_native_ward_history_map/`) established the native charge-two transformation `y* -> D_alpha y*` and rank-eight carrier `im U_h`. This certificate answers the narrower Q50 question whether a single **right-acting** 64-history unitary can replace the clock-left action. It does not challenge Q49's existing gauge covariance.

## Exact witness
Use the original icosahedral vertices, 20 faces, incidence C, face Laplacian L, hidden projectors `P3=Ph(5I-L)/2`, `P5=Ph(L-3I)/2`, and original quadratic source `h_a=P_a(Cx)^{\odot2}`. Take the geometric harmonic `x=X+YZ` on the 12 vertices. This lies in the original degree-one plus degree-two harmonic carrier `im(Iico)`, hence has a 50-vertex preimage under the original all-five `Plinear=Iico Eglobal^T` (choose `v50=Eglobal Iico^T x`, with the corresponding normalized coordinate convention). Exact arithmetic gives
```
||h3||^2 = 288 + 128 sqrt(5)
||h5||^2 = 112/15 + (16/5) sqrt(5)
```
both positive. The original history embedding `Uh=M Ph/sqrt(2)` is isometric on `im Ph`; its defining identity `Ph M^T M Ph=2Ph` is checked exactly.

Repeat the same 50-vertex field at all 24 clock sites, and take constant original link angle theta. The original Schur solve `y*=(G3 h3 + Delta G5 h5)Uh^T`, `Ga=(Ea+r^2 Lclock^(2))^{-1}`, has **identical nonzero rows** `y*_j=w`, since the constant vector is a clock-Laplacian eigenvector and the orthogonal P3/P5 contributions cannot cancel. Under the legitimate integer large gauge `alpha_j=2pi j/24`, Q49's exact covariance yields `y'_j=exp(2i alpha_j)w=exp(4pi i j/24)w`. These rows are not identical.

For any fixed 64x64 matrix U (even nonunitary), the rows of `y* U` remain identical. Thus **no common right-acting history unitary U** can implement this gauge transformation on all native source configurations. The obstruction already holds for this one explicit nonzero uniform configuration. Clock-left gauge covariance is retained; clock-dependent or mixed clock/history actions are not excluded.

## Execution and limitations
`python research_archive/2026-11-12_q50_history_gauge/q50_uniform_history_obstruction.py` executed locally (Python/SymPy), exit 0. It reconstructs the original face and history incidence with exact arithmetic, not synthetic operators. The native all-five preimage is justified by the archived full-rank harmonic isometries, rather than numerically re-running the 190-cochain action. No physical ARF or observable selected; gates remain open.

**Next question (Q52):** Can the original 190-cochain nonlinear source produce a canonical *clock-dependent* history unitary (or a genuinely mixed 24x64 transport) beyond its already-proved left clock gauge action, without introducing an independent choice?
