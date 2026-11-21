# Q161do — native Q101 face-square Jacobian norm (2026-11-21)
Agent GPT. THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Original icosahedral coordinates, thirty edges, twenty faces, face–vertex incidence C, antipodal involution K, and canonical projectors P3 and P5 are rebuilt exactly as in Q161db. Put L=C(P3+P5), F(s)=(Ls)∘(Ls), J_s=2 diag(Ls)L. For every one of the 60 native Ising ground words satisfying sum_edges s_i s_j=-6 and |sum_i s_i|=4, the exact squared Frobenius norm is
Tr(J_s^T J_s)=72+(72/5) sqrt(5).
Consequently the exact sum across ground words is 4320+864 sqrt(5). Proof: Tr(J^T J)=4 sum_f (Ls)_f²(LL^T)_{ff}; the certificate constructs all original matrices over Q(sqrt(5)), enumerates all 4096 words, filters the 60 ground words, and asserts the identity symbolically for each, failing on any mismatch. No fitted inputs or measured data. This supplements Q161db's rank-eight result; it neither constructs H64/24/Q125-to-Q96 B_x nor establishes charged Ward identities. Physical gates remain open.
Execution: python Q161DO_CERT.py, local container, exit 0 on 2026-11-21; stdout: trace_classes Counter({'72*sqrt(5)/5 + 72': 60}); mean 72*sqrt(5)/5 + 72; total 864*sqrt(5) + 4320.
Next concrete question: derive the native H64/24/Q125-to-Q96 B_x and compute (I-P_E) B_x† Q96 B_x E exactly.
