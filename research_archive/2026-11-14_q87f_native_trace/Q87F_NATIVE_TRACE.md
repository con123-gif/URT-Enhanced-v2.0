# Q87F — Native Q77 bridge Dirichlet trace and Gram determinant

Date: 2026-11-14, GPT. Gate A, first open Q87 [compute]. **THEOREM (conditional on Q77's native 64-history support and strict interval bounds), CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** Not a derivation of c, quartet weights, or any ARF.

Use precisely Q77's original history support: for x=0,...,31, rows x,x+32 feed columns 2x,2x+1, with row probabilities (t_x,1−t_x) and (1−t_x,t_x). No fitted values or invented matrices. Let A=(I−B)^T(I−B).

**Exact results:** Tr A = 64−2(t_0+t_31)+2 Σ_x[t_x²+(1−t_x)²]. The only diagonal bridge entries are B_{0,0}=t_0 and B_{63,63}=t_31. B^TB is a direct sum of 32 exact 2×2 Gram blocks with determinants (2t_x−1)². Therefore det(B^TB)=∏_x(2t_x−1)², and Q77's 0<t_x<1/2 implies 94<Tr A<128 and full rank.

**Execution:** standalone SymPy certificate locally in GPT container, 2026-11-14, exit 0, exact assertions. CI verdict pending. This is an independent global invariant of the native clock bridge, but does **not** establish A5-twirled hidden-source leakage or fix the chronology coefficient. Q87 stays open.

**RESUME HERE:** use Q77 certified intervals for t_x and original A5 twirl and G5 projector to certify a strictly positive entry/norm of (I−G5) Abar_{B^J} G5. Only then combine with Q87A to conclude the all-c obstruction.
