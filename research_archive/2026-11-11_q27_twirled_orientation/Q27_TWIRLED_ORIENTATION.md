# Q27 — Twirled chronology does not distinguish the Q24 history-symmetry partners

**Result:** OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

**Native inputs.** Use Q3's 64-state primitive six-bit adjacency Q(h,2h)=Q(h,2h+1)=1, the proper icosahedral A5 action on six antipodal axes reconstructed by the archived Q3 script, and Q24's history transformations: I (all signs), R (bit-order reversal), S (alternating-position sign flip). For a signed dictionary D, form X_D = P_D Q P_D^{-1}, T_D = sum_{a in A5} P_a X_D P_a^{-1}, and M2(D)=Tr(T_D^2). This is the Q3 **unnormalised twirled second moment**, not the native hidden-source K2.

**Exact finite theorem.** All 46,080 signed dictionaries partition into 96 free A5 x <I,R,S> orbits of size 480. On each orbit, all eight proper-A5 classes have the **same** M2. In particular M2(RD)=M2(SD)=M2(D) for every D. Q3's twirled second moment removes **none** of the factor-eight history-sum ambiguity established by Q24. Globally exactly 32 distinct M2 values remain; the counts of the 768 proper-A5 classes per value reproduce the Q3 46,080-dictionary census after multiplying by 60.

**Reversal proof.** Six-bit reversal conjugates the directed shift Q to Q^T. Consequently X_{RD}=X_D^T and T_{RD}=T_D^T, so Tr(T_{RD}^2)=Tr(T_D^2) identically. The alternating flip S equality is certified by exhaustive integer enumeration of all 96 x 8 history-symmetry partners, with A5 covariance following from the complete group twirl. No claim of unrestricted S operator conjugacy is made.

**Execution and provenance.** Certificate: q27_twirled_orientation.py, check research.q27_twirled_orientation. It imports the archived Q3 icosahedral A5 action, builds the original integer Q2 shift, partitions the full signed dictionary set, computes each of 768 orbit-partner moments, and compares its 32-value multiplicities to Q3's independently committed full census JSON. A failed equality exits nonzero. Local Python 3.11 / NumPy 2.3.5 / NetworkX 3.6.1: exit 0 in 2.39 seconds, using a locally reconstructed equivalent of Q3's geometric action because network cloning was unavailable; the committed certificate uses the original Q3 module. GitHub CI status is separate.

**Scope:** finite chronology statistic only. No physical ARF, observable identification or gate closure.

**Next question:** Q28 [compute] — calculate the exact third trace Tr(T_D^3) on the 96 x 8 partners. Reversal is isospectral by transpose; does alternating S preserve the third trace, or does this higher native twirled moment separate S partners?
