# Q37 — Primitive-Q2 mixed-trace obstruction to Q36's twirled intertwiners

**Date:** 2026-11-11. **Agent:** GPT. **Gate:** A. **Result:** OBSTRUCTION.
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
**Sources:** Original Q3 geometric A5 code permutations and primitive 64-history two-successor Q2, and the 20 exact Q36 residual dictionaries. This is finite internal mathematics, not a physical-history or ARF selection.

## Exact certificate and proof

In the original canonical six-bit history coordinates, Q2[h,2h mod 64] = Q2[h,(2h+1) mod 64] = 1. For each of Q36's 20 signed dictionaries D, form the original Q3 A5 twirl S_D = sum_{g in A5} P_g (D Q2 D^{-1}) P_g^T, with E=alt(D) flipping the odd-indexed dictionary signs. The source function `geometric_a5_on_codes` is imported from the unchanged Q3 file, Git blob `bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984`.

Suppose X is invertible and satisfies X S_D = S_E X and X Q2 = Q2 X. Then S_E = X S_D X^{-1}, and trace cyclicity gives

`Tr(S_E Q2) = Tr(X S_D X^{-1} Q2) = Tr(S_D X^{-1} Q2 X) = Tr(S_D Q2).`

Thus **one nonzero exact integer mixed-trace difference** d_D = Tr[(S_D-S_E)Q2] excludes *every* invertible simultaneous intertwiner, rational, real or complex. The extra transpose equation from Q36 cannot restore existence.

## Exact result: all 20 obstructed

In Q36's published pair order, the twenty integer differences are

`[48, 64, 48, -64, 48, 16, 56, -56, 48, 64, -32, 48, -48, -48, -64, -16, 32, -32, -48, 32]`.

All 20 are nonzero, so **0/20 pairs admit an invertible Q2-compatible intertwiner**. For the first pair D=(0,2,4,6,10,8), E=(0,3,4,7,10,9), the exact traces are **272 and 224**. The last pair has traces 220 and 188. This is a strict refinement of Q36, not a contradiction: Q36 intertwiners were never required to commute with untwirled Q2.

## Execution and limits

Certificate: `research_archive/2026-11-11_q37_primitive_chronology/q37_primitive_q2_trace.py`, registered as `research.q37_primitive_q2_trace`. The script imports original Q3, checks its Git blob hash, constructs original Q2 exactly, and compares the 20 dictionaries against Q36's published table when present. Each twirl has integer row/column sums 120; every mixed trace is bounded by 64*2*120=15360, so int64 is exact without overflow. All assertions fail closed.

Executed locally: Python 3.13.5, NumPy 2.3.5, NetworkX 3.6.1; **exit 0, 2.31 seconds**, with an exact-byte copy of the Q3 source and the 20 Q36 table rows. GitHub CI verdict pending at commit time. No measured constants, fitted inputs, synthetic operators, or physical ARF targets were used.

**Next executable question:** Q38 — apply the same native mixed-trace test to all 48 Q28 third-trace-constant pairs; for any first-order survivors, test one higher mixed word. Do not infer physical selection.
