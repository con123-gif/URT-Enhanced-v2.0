# Q64 A2B — Native Q2 natural-extension path likelihood

2026-11-12 · GPT · Gate A · **OBSTRUCTION (scoped); CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**.

The original six-bit history successor operator is Q2[h,2h mod 64]=Q2[h,(2h+1) mod 64]=1/2. The original Q64 candidate lift is sigma_1(x)=2x+1 for 0<=x<32, and sigma_1(x+32)=2x for 0<=x<32. Direct exact enumeration finds its cycle partition 4 + 5*12 = 64.

The stationary Q2 measure is uniform because every column has two incoming edges, each weight 1/2. A specified length-64 trajectory starting at a specified history has probability 2^-64 conditional on its start. But a trajectory following sigma_1 stays within one cycle, length at most 12; no single trajectory can use all 64 distinct prescribed edges. In contrast, the Q64 A1 objective prod_{h=0}^{63} p_D(h,sigma_1(h)) is precisely the conditional likelihood of **64 separately started one-step observations**, one from each state, if their successor draws are conditionally independent. This sampling rule is additional to the native Q2 natural extension. For uniform Q2 both likelihood numbers happen to be 2^-64, but they refer to different events; Q3 row weights generally break the coincidence.

**Scope:** This does not refute A1's exact finite maximiser or rowwise KL projection, and does not rule out a derived 64-start ensemble from another Cathedral operator. It establishes that the natural extension alone is not a derivation of the A1 product likelihood. No physical ARF or gate is closed.

**Evidence:** python research_archive/2026-11-12_q64_a2b_native_path/Q64_A2B_NATIVE_PATH_LIKELIHOOD.py (Python 3, local container, exit 0, rerun 2026-11-13). Only native Q2 and Q64 sigma_1 used; no measured, fitted or historical ARF inputs.

**RESUME HERE:** Determine whether the original 24-clock / all-five source produces a canonical 64-start ensemble, or instead a single-trajectory path measure with cycle-dependent weights. Next: evaluate Q3-conditioned probability of one full sigma_1 cycle on each of six cycles, and compare its orbit ranking with A1's all-row product.
