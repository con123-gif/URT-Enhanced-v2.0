# Q161dc — native Q96 charge-squared / 24-clock exact spectral certificate
Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Substep of open Q161da, not a charged source embedding.

Use the original Q96 eight-species electric-charge registry (three up, three down, charged lepton, neutrino), doubled into 16 chiral entries, three generations and conjugates, giving 96 charges. Their squared-charge multiplicities are 36 at 4/9, 36 at 1/9, 12 at 1 and 12 at 0. Use the original 24-track cyclic nearest-neighbour Laplacian L24 with diagonal 2 and two adjacent entries -1.

The characteristic polynomial of L24 is exactly

P24(x)=x(x-4)(x-3)^2(x-2)^2(x-1)^2(x^2-4x+1)^2(x^2-4x+2)^2(x^4-8x^3+20x^2-16x+1)^2.

Consequently the exact characteristic polynomial of the conditional Q96 charge-squared clock K=diag(q_i^2) tensor L24 is

chi_K(x)=x^288 [ (4/9)^24 P24(9x/4) ]^36 [ (1/9)^24 P24(9x) ]^36 [P24(x)]^12.

This is an identity of the ORIGINAL named charge registry and 24-cycle, not an invented source-to-charge embedding. It gives rank 1932, nullity 372, Tr K=1536, Tr K²=2816. The spectrum alone does not select the H64/24/Q125-to-Q96 source map B_x or determine (I-P_E) B_x† Q96 B_x E. No physical gate closes.

Execution: standalone python research_archive/2026-11-20_q161dc_q96_clock_spectrum/Q161DC_CERT.py (local SymPy exact assertions, exit 0 on 2026-11-20).
Next concrete question: identify from original Q125 source files a dimensionally typed B_x on H64 tensor clock and test charge-Ward leakage without postulating a new coupling.
