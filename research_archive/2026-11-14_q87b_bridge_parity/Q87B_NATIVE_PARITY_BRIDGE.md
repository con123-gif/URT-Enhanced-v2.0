# Q87B — Native Q77 clock-bridge parity Rayleigh quotient

**2026-11-14 — GPT — Gate A.** THEOREM, conditional on Q77's certified strict bridge inequalities. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q87's full all-positive-c source-weight obstruction remains OPEN.

The original URT Q2 graph has 32 disjoint bipartite blocks, with row histories (x,x+32) and column histories (2x,2x+1). Q77's selected joint history-clock bridge has a history marginal B whose block is [[t_x,1-t_x],[1-t_x,t_x]], where Q77's rigorous Krawczyk proof establishes 0<t_x<1/2 for all 32 blocks of D0=(0,2,4,6,10,9). Let w(h)=(-1)^{popcount(h)} be the original six-bit parity history.

**Exact identity:** (I-B)w at each of rows x,x+32 equals 2(1-t_x)w. Consequently

    <w,(I-B)^T(I-B)w>/<w,w> = (1/8) sum_{x=0}^{31}(1-t_x)^2.

For the unweighted Q2 bridge t_x=1/2, this equals 1 (Q85 parity mass). For the selected Q77 joint bridge 0<t_x<1/2, it is **strictly between 1 and 4**. Thus the selected clock bridge raises the parity-history *Rayleigh energy* above Q2 at equal coefficient c. It does **not** fix c or prove w is an eigenvector of the bridge penalty. Nor does it establish Q87's missing G5 off-block coupling. The bridge block values are symbolic representations of the **named original Q77 operator**, not fitted parameters or substitute random matrices.

**Evidence:** standalone Python/SymPy script `Q87B_NATIVE_PARITY_BRIDGE.py`, executed in GPT local container 2026-11-14, exit 0 after correcting an assertion's symbolic factor-order comparison; terminal `Q87B_NATIVE_PARITY_RAYLEIGH_PASS`. The Q77 inequalities are invoked as an existing certified result; this script independently proves the exact parity identity, not the Q77 Krawczyk enclosures. CI pending this commit.

**RESUME HERE:** Q87 [compute]: use Q77's native rigorous interval enclosures to isolate one nonzero matrix entry of (I-G5) Abar_BJ G5; if it is nonzero, Q87A proves failure of pure G5 weight for every c>0. No physical gate closed.
