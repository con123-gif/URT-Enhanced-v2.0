# Q38 — All 48 residual chronology pairs versus primitive Q2

**Date:** 2026-11-11. **Agent:** GPT. **Gate:** A. **Result:** OBSTRUCTION.
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

## Native operator and exact result

Use the original 64-history two-successor Q2 (Q2[h,2h mod 64] = Q2[h,(2h+1) mod 64] = 1), the original Q3 geometric A5 code permutations, and Q28's 96 exhaustive signed-dictionary eight-orbit representatives. For D, let S_D be the sum over A5 of P_g (D Q2 D^{-1}) P_g^T. Let E=alt(D), flipping dictionary positions 1,3,5. Restrict to the 48 Q28 orbits whose eight images have identical third twirled trace.

For 46 of the 48 canonical D/alt(D) representative pairs, d1(D) = Tr[(S_D-S_E)Q2] is nonzero. Only these two pairs survive d1:

| D | Tr(S_D Q2) | Tr(S_E Q2) | d2=Tr[(S_D-S_E)Q2^2] |
|---|---:|---:|---:|
| (0,2,5,6,9,10) | 340 | 340 | **-160** |
| (0,2,5,6,11,8) | 248 | 248 | **-192** |

Hence **all 48/48 pairs are obstructed by a primitive mixed trace of length at most three**. First nonzero witness: D=(0,2,4,6,8,11), E=(0,3,4,7,8,10), with traces 260 and 292, difference -32. The executable prints all 48 first differences.

If invertible X satisfies X S_D = S_E X and X Q2 = Q2 X, it commutes with Q2^j, and trace cyclicity implies Tr(S_D Q2^j) = Tr(S_E Q2^j) for all j. Every pair violates this necessary condition at j=1 or 2. Thus no rational, real, or complex invertible simultaneous (S,Q2) intertwiner exists for these 48 canonical representative pairs. Q36's twirled-only orthogonal similarity remains valid.

## Execution and limitations

Certificate: research_archive/2026-11-11_q38_primitive_q2_allpairs/q38_primitive_q2_allpairs.py, registry check research.q38_primitive_q2_allpairs. It imports the original Q3 and Q28 sources and pins their exact Git blob SHA-1 values bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984 and 6e22cb7654176c6499ee138737f4f85240619ec7. Every trace is integer: Q2 and Q2^2 have row sums 2 and 4, while S has row sum 120, bounding Tr(S Q2^j) by 64*120*2^j for j=1,2, safely inside int64. Assertions enforce the exhaustive census, counts, and exact survivor differences.

Local GPT-container execution: Python 3.13.5, NumPy 2.3.5, NetworkX 3.6.1; exit 0 in 4.11 seconds wall, with byte-identical original Q3 and Q28 local source copies. GitHub CI verdict pending at commit time. No measured values, fitted constants, or historical ARF inputs.

**Scope:** Finite native chronology only, in the fixed canonical-code Q2 basis. This does not select a physical history or derive an ARF; it does not rule out an independently motivated change of physical operator or identification.

**Next (Q39 [compute]):** On all eight images of each of the 96 Q28 orbits, compute exact joint (Tr(S_D Q2), Tr(S_D Q2^2)) signatures and count residual degeneracies including reversal partners, without selecting an orientation.
