# Q161h — original icosahedral hidden quadratic source: exact shift symmetry

2026-11-15 · GPT · **THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**

Source: Q161e native 20-face by 12-vertex incidence C, hidden projectors P3 and P5 (ranks 4 each), with P_h=P3+P5=I-C(C^T C)^{-1}C^T. This is a bounded native **icosahedral source channel**, not a substitute for the full five-solid/H64/24 physical map.

Define h(v)=P_h[(Cv)⊙(Cv)]. Each triangular face contains three vertices, hence C1_12=3 1_20. Because P_h C=0, P_h 1_20=0. For every v in R^12 and scalar c,

h(v+c1)=P_h[(Cv+3c1)⊙(Cv+3c1)]
=h(v)+6c P_h Cv+9c² P_h 1=h(v).

Thus the uniform vertex-shift is an **exact nonlinear invisible direction**, not merely a vanishing linear response at symmetric input. The Jacobian J_h(v)=2 P_h diag(Cv) C satisfies J_h(v)1=0 for all v. The exact rational certificate using the original incidence/projectors reports rank 8 for v=(1,2,...,12), rank 0 for v=1, rank 4 for v=e_0. Rank is source-dependent; one nonuniform slice can excite all eight hidden dimensions, but cannot resolve the uniform-shift direction.

**Scope:** Does not establish the rank of the actual 24-slice source-to-H64 Jacobian on the Q161a 32-dimensional history kernel; that requires the original premap from history to vertex sources. Nor does it establish Q96 Ward preservation, lift the Gram kernel, or fix a physical kinetic normalization. No empirical or historical ARF input.

**Execution:** `python research_archive/2026-11-15_q161h_hidden_shift/Q161H_HIDDEN_SHIFT_CERTIFICATE.py` in local container, exit 0 on 2026-11-15. Certificate is fail-on-error, with exact SymPy arithmetic after the original convex-hull face enumeration.

**Next question:** For the original 24-slice history-to-vertex premap V_t, does its restriction to the 32 pair-difference vectors contain a nonzero component in the uniform-shift kernel of every slice, and what is the exact rank of the stacked J_h(V_t) V_t D under Q96 Ward constraints?
