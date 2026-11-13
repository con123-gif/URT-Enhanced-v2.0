# Q68 — Native Q2 uniform-marginal chronology polytope

Date: 2026-11-13. Agent: GPT. Gate A, active attempt A2b.
Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** (scoped exact obstruction).

Let Q2 have 64 histories h and native successors 2h,2h+1 modulo 64. A stochastic kernel supported on these edges preserves the uniform history measure exactly when it is doubly stochastic. For x=0,...,31, rows x and x+32 share the two columns 2x,2x+1. All columns belong to precisely one such block. Therefore each admissible 2×2 block is exactly

    [[t_x, 1-t_x], [1-t_x, t_x]], 0 <= t_x <= 1.

The full feasible polytope is [0,1]^32, with 2^32 deterministic vertices (the reversible Q2 lifts). The original normalized Q2 transfer is the centre t_x=1/2. Every kernel extends to a 24-track uniform-marginal kernel by tensoring with the native identity clock operator I_24. Thus preservation of the uniform history measure and compatibility with the passive 24-track clock **do not uniquely select** the Q65 Q3-weighted KL/Sinkhorn bridge. That bridge is a particular point in this polytope, selected only after choosing its Q3-weighted relative-entropy objective. The theorem does not test stronger, dynamically coupled clock holonomies or additional U_h constraints; nor does it show that Q3's A5 covariance is insufficient.

Certificate: `python research_archive/2026-11-13_q68_native_bridge/Q68_NATIVE_BRIDGE_POLYTOPE.py`, locally executed exit 0 on 2026-11-13. No measured or fitted input.

Next question: does requiring covariance under the actual Q3 A5 action **and** native U_h carrier compatibility constrain the 32-dimensional Q2 uniform-marginal polytope to a unique kernel, and does that kernel equal Q65's bridge?
