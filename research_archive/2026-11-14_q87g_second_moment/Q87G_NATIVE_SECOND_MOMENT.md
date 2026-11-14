# Q87G — Second spectral moment of the native Q77 64-history clock bridge

Date: 2026-11-14, GPT. **THEOREM (conditional on Q77's original history support); CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** Gate A remains open.

Define B on the original Q77 URT successor graph: for x=0,…,31, B[x,2x]=t_x, B[x,2x+1]=1−t_x, B[x+32,2x]=1−t_x and B[x+32,2x+1]=t_x. Set A=(I−B)^T(I−B).

**Exact result:**

tr(A²) = 384 + 4t₁₀t₂₁ + 2 Σₓ(8tₓ⁴−16tₓ³+20tₓ²−12tₓ)
−16(t₀³+t₃₁³)+26(t₀²+t₃₁²)−16(t₀+t₃₁).

This polynomial is the exact second spectral moment of the **full 64×64 operator**, not a sum of 32 independent A-blocks. The exceptional 4t₁₀t₂₁ cross term comes from overlaps of the native doubling successor graph. For t_x=1/2 throughout, tr(A²)=218 exactly. The formula is a diagnostic for later rigorous Q77 intervals and catches incorrect blockwise approximations to A.

**Evidence:** Standalone SymPy script Q87G_NATIVE_SECOND_MOMENT.py, executed GPT container on 2026-11-14, exit 0; exact symbolic equality and uniform-bridge regression passed. CI pending this commit. The script reproduces Q77's named original support pattern but does not independently reconstruct its 32 bridge parameters. No fitted values or physical observables used.

**Next question:** Q87 [compute]: feed Q77's certified intervals through the original A5-twirl and compute a rigorously nonzero (or zero) hidden G5 leakage witness. This trace alone does not decide the source weights for all c>0.
