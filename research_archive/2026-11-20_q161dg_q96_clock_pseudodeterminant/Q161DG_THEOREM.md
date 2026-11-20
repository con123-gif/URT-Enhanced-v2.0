# Q161dg — declared native Q96/24 charge-clock pseudodeterminant

Status: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q161da and physical gates remain OPEN.

The Q96 charge registry has squared-charge multiplicities (4/9:36, 1/9:36, 1:12, 0:12), as in Q161dc. The 24-cycle Laplacian L24 is the original clock geometry. For the *declared conditional tensor* K=diag(q²)⊗L24, each nonzero-charge block has rank 23. The reduced 23x23 integer cofactor of L24 equals 24, certified by exact Bareiss elimination; the matrix-tree theorem then gives pdet(L24)=24×24=576. Consequently pdet(K)=576^84(4/9)^(23×36)(1/9)^(23×36)=2^2160/3^3144, rank(K)=1932 and nullity(K)=372. This does not identify a physical clock Hamiltonian or construct the missing H64/Q125-to-Q96 map B_x.

Execution: python research_archive/2026-11-20_q161dg_q96_clock_pseudodeterminant/Q161DG_CERT.py; locally exit 0 on 2026-11-20. Next question: construct native B_x and evaluate (I-P_E)B_x†Q96B_xE exactly.
