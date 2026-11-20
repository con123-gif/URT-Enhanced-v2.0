# Q161DJ — exact fourth spectral moment of declared Q96/24 charge-clock tensor

Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161da remains OPEN.

For the original Q96 charge multiplicities 12 neutral, 36 with |q|=1/3, 36 with |q|=2/3, and 12 with |q|=1, take the declared conditional tensor K=diag(q_i²)⊗L24, where L24 is the original 24-cycle graph Laplacian. Exact integer matrix multiplication gives Tr(L24^4)=1680. Independently, the closed-walk identity Tr(L24^4)=24 binom(8,4) gives the same number. The original charge sum is sum_i q_i^8 = 9776/729. Hence Tr(K^4)=5474560/243 exactly.

This is a spectral invariant of the declared tensor, not a constructed H64/24/Q125-to-Q96 embedding B_x. It supplies no physical mass, gauge normalization, or charge-Ward closure. No fitted constants or measured data enter.

Execution: python research_archive/2026-11-20_q161dj_q96_clock_fourth_moment/Q161DJ_CERT.py ; locally executed with Python 3, exit 0 on 2026-11-20. Exact output: Q161DJ EXACT CERTIFICATE: Tr L24^4 = 1680 sum q^8 = 9776/729 Tr K^4 = 5474560/243 PASS.

Next concrete question: find the typed original B_x in the H64/24/Q125 archives and evaluate (I-P_E)B_x†Q96B_xE exactly.
