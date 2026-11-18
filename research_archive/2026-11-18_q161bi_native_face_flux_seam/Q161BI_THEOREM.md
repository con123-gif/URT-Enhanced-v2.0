# Q161bi — native Q101 scalar face flux cannot select a history-dependent clock seam

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. **Agent:** GPT. **Date:** 2026-11-18.

Construct the original 12 golden icosahedral vertices, 30 edges, 20 faces and face-vertex incidence C. Let K_v be the antipodal vertex permutation, V the 12×3 coordinate matrix and P_l=V(VᵀV)⁻¹Vᵀ+(I+K_v)/2−J/12. Enumerate all 4096 ±1 words, retaining sum x=4 and Σ_edges x_i x_j=−6 (30 words).

**Exact certificate:** CᵀC=5I+2A_ico and ||C P_l x||²=12 for every one of the 30 original frustrated Q101 ground words. Therefore any proposed 24-clock seam h_x=F(||C P_l x||²), for any scalar function F, is history-independent. The total scalar face flux cannot distinguish histories or determine a unique seam.

**Scope:** This is a bounded scalar-only obstruction, not a no-go for the oriented face-source vector, hidden 4₃/4₅, H64 source transport, or full Q96 charged Ward intertwining. All physical gates remain OPEN. The named native geometry is the original Q101 face-source sector, not a synthetic stand-in.

**Execution:** Python 3 + SymPy, `python research_archive/2026-11-18_q161bi_native_face_flux_seam/Q161BI_CERT.py`, local exit 0, 2026-11-18. CI verdict must be checked after commit.

**Next question:** Does the oriented face-source vector through the original H64 coupling induce a nonconstant 24-clock link satisfying all Q96 Ward generators?


## 2026-11-18 CI repair
The CI failure arose at `assert Pl*Pl==Pl`: unsimplified SymPy radical expressions are structurally unequal despite being algebraically identical. The corrected certificate asserts exact entrywise reduction `(Pl*Pl-Pl).applyfunc(s.simplify)==s.zeros(12)`. Locally executed with exit 0; no theorem hypothesis or face-source operator changed.
