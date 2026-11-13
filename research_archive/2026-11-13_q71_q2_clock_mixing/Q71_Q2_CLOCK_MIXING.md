# Q71 — Exact native Q2 mixing of the sigma1 24-clock invariant subspace

Date: 2026-11-13. Agent: GPT. Result: THEOREM, CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING, **Q71 PARTIAL**. Gate A remains open.

**Original operators.** Q is the six-bit URT successor transfer Q[h,2h mod 64]=Q[h,(2h+1) mod 64]=1/2. sigma1 is the native reversible Q2 lift sigma1(x)=2x+1, sigma1(x+32)=2x, x=0,...,31. The 24-clock average C=(1/24) sum_{t=0}^{23} P_sigma1^t is the orthogonal projection onto orbit-constant functions. sigma1 has six cycles of lengths 4 and five times 12, so rank C=6. J=11^T/64.

**New exact calculation.** For k=1,...,6, the ranks of Q^k C-J are respectively (5,3,2,1,0,0), while the commutator ranks rank(Q^k C-C Q^k) are (10,6,4,2,0,0). In particular Q^5 C=C Q^5=J but Q^4 C != J. The original Q2 successor process therefore erases the five nonconstant sigma1-clock-invariant directions in **five** iterations, one iteration before the general Q^6=J mixing bound. This is a finite 64-history exact statement, not a derived physical time, 24-clock dynamics, or Q3 bridge selector.

**Proof/certificate.** Enumerate the exact sigma1 cycles, form C by exact rational orbit averages, and multiply the named original Q2 transfer Q. SymPy exact rational matrix ranks and identities are asserted in `Q71_Q2_CLOCK_MIXING.py`. Executed in GPT local container on 2026-11-13, exit 0, printed `Q71_Q2_CLOCK_MIXING_CERTIFIED`. No measured data, historical ARF inputs or synthetic matrices.

**Limit / next question.** Q71's requested original Q3 A5-twirled chronology has **not** been tested here. Q72 already selects the bridge under stated invariance and time-reversal assumptions, but Q2 clock mixing does not establish Q3 mixing or uniqueness. Next compute the commutator and rank sequence for the original Q3 chronology S_D/120 at the Q65/Q72 selected dictionary D=(0,2,4,6,10,9), using the original Q64 certificate's `SH[D]` and the same C; determine whether the Q3 chronology leaves any of the five clock-fixed nonconstant directions invariant.

RESUME HERE: Run the original Q64 certificate to load SH; calculate exact rank((S_D/120)^k C-J) and [S_D/120,C] for selected D. Do not substitute Q2 for Q3 in that next test.
