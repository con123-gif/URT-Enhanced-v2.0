# Q29 — Fourth twirled chronology trace on the 48 Q28 residual orbits

**2026-11-11 · GPT · Gate A · OBSTRUCTION · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

## Native construction

Use the original Q3 icosahedral geometric A5 action on six signed antipodal axes and the original binary six-bit history adjacency Q2, with Q2[h,2h mod 64]=Q2[h,(2h+1) mod 64]=1. For a signed dictionary D, let X_D = D Q2 D^{-1} and S_D = sum_{g in A5} P_g X_D P_g^T, where P_g is the original Q3 action. The certificate imports Q28's native 96 representatives and eight history-symmetry partners, which in turn import Q3. This is an exact finite operator census, not a model of a photon or an ARF.

## Exact obstruction

Exactly 48 of the 96 eight-partner orbits have one common third trace (the other 48 were already split 4+4 by Q28). For **every one** of those 48 residual orbits, all eight dictionaries also have the same fourth trace: the fourth-trace partition is **48 x (8)**. Thus S breaks **0/48** residual orbits at order four. Reversal R and global inversion I break none. This is not an all-order no-go: higher traces or an additional primitive selector could still distinguish some of these histories.

## Certificate and proof

The signed dictionary enumerator is Q28's exact 46,080/480 = 96 orbit partition under geometric A5 and history I,R,S. For each representative D, enumerate eight partners; compute Tr S_D^2 and Tr S_D^3 to identify the 48 third-trace-constant orbits, then calculate Tr S_D^4 = sum_{i,j} (S_D^2)_{ij}(S_D^2)_{ji}. Every S_D is a nonnegative 64x64 integer matrix with each row and column sum 120. Hence 0 <= Tr S_D^4 <= 64*120^4 = 13,271,040,000 < 2^63, so int64 matrix arithmetic is exact. Assertions verify the Q28 48/48 third-trace split, 32 second-trace values, 53 third-trace values, 48 fourth-trace partitions of (8), and two nontrivial A5 transports for each residual representative.

**Local execution:** Python 3.11, NumPy 2.3.5, NetworkX 3.6.1; exit 0 in 3.20 seconds (2026-11-11 07:15 UTC). Local offline execution used faithful temporary reconstructions of the Q3/Q28 geometric enumeration from the inspected original sources (Q3 blob bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984; Q28 blob 6e22cb7654176c6499ee138737f4f85240619ec7), because GitHub DNS is unavailable in the container. The committed script imports the **actual original Q3 and Q28 files** and requires CI re-execution; local success alone is not CI PASS.

**Next exact question (Q30):** On these same 48 residual eight-orbits, does Tr S_D^5 distinguish alternating-flip partners, or do all remain equal?
