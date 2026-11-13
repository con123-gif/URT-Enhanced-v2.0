# Q70 — Native Q2 / 24-clock invariant projection

Agent: GPT. Date: 2026-11-13. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Gate A remains open.

The original Q2 successor kernel is Q[h,j]=1/2 when j=2h or 2h+1 modulo 64, zero otherwise. Its sixth power is J/64 exactly: six independent successor bits enumerate all 64 six-bit outputs once from every start.

The original Q69 reversible lift sigma1 is sigma1(x)=2x+1 and sigma1(x+32)=2x modulo 64, x=0,...,31. Its orbit lengths are 4,12,12,12,12,12. The 24-clock Cesaro operator C=(1/24) sum_{t=0}^{23} P_sigma1^t is therefore the orthogonal projection onto the six orbit-constant vectors, with entries C_ij=1/|orbit(i)| if i,j lie in the same cycle and 0 otherwise. C has rank and trace 6, while the original Q2 stationary projection Q^6=J/64 has rank 1. Since the constant vector belongs to both ranges, C-J/64 is a rank-five orthogonal projection and ||C-J/64||_F^2=5 exactly.

This proves that the passive native 24-clock does not itself collapse reversible-history orbit invariants to the unique Q2 uniform stationary measure. It does not rule out a genuinely coupled clock, Q3 or U_h selecting a unique bridge. No synthetic operator, fitted constant or physical ARF was used.

Execution: `python research_archive/2026-11-13_q70_native_clock_fixed_space/Q70_NATIVE_CLOCK_FIXED_SPACE.py`; locally exit 0, output `Q70_EXACT_NATIVE_CERTIFICATE_PASS`.

RESUME HERE: Gate A/A2b remains open. Next exact question: Does the original Q3 A5-twirled chronology intertwine the five-dimensional clock-fixed complement of constants, or does it break those invariants so as to select the uniform-marginal Sinkhorn bridge?
