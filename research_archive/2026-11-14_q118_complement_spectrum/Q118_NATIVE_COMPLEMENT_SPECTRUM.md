# Q118 — Native six-bit complement spectral grading
2026-11-14 — GPT. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (partial Q118).
The original six-bit history operator is Hbits=15I−sum_{0≤i<j<6} X_i X_j on the 64 binary histories. The complement C maps h to 63−h, equivalently X_0...X_5.
Exact theorem: [Hbits,C]=0, C²=I. The C-even restriction has spectrum 0 (multiplicity 2), 16 (multiplicity 30); the C-odd restriction has 10 (multiplicity 12), 18 (multiplicity 20).
Proof: the simultaneous bit-flip eigenvectors have Walsh degree k, Hbits eigenvalue 18−(6−2k)²/2 and complement eigenvalue (−1)^k. Sum binomial multiplicities over k=0,...,6. Independently the attached exact 64×64 SymPy certificate constructs the native double-flip matrix and all four Lagrange spectral projectors, checking ranks, grading, idempotence, and commutator.
Execution: python research_archive/2026-11-14_q118_complement_spectrum/Q118_NATIVE_COMPLEMENT_SPECTRUM.py — locally exit 0 on 2026-11-14. GitHub CI for this new check not yet verified.
This does not establish [Abar,C]=0 or the Q77 four-by-four multiplicity matrices, and cannot explain Q115 residue concentration without that calculation. No fitted or measured inputs; no physical ARF identified; Gate A OPEN.
Next question: does the selected Q77 A5-twirled Abar commute with complement on both original Z3 20-history orbits?
