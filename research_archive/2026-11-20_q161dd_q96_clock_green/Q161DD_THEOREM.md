# Q161dd — original Q96/24-clock Green trace (2026-11-20)
Status: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Native sources: original Q96 charge registry and 24-cycle Laplacian, as in Q161dc (research_archive/2026-11-20_q161dc_q96_clock_spectrum/Q161DC_CERT.py). This is the *same declared tensor operator*, not a reconstructed H64/Q125 embedding.
Let K=diag(q_i^2) tensor L_24, with q_i the original 96 charge entries. Its Moore–Penrose inverse has exact trace
Tr K^+ = (sum_{q_i != 0} 1/q_i^2) (sum_{lambda in spec(L24),lambda != 0} 1/lambda) = 417*(575/12)=79925/4.
Proof: The original q8=(2/3 x3,-1/3 x3,-1,0), repeated as Q96=(q8 x 6, -q8 x6), yields reciprocal squared charge sum 417. The original 24-cycle has characteristic polynomial p(x), and -p''(0)/(2p'(0))=575/12. Each charged block contributes q_i^-2 L24^+, neutral blocks contribute zero. The script also checks the 24-cycle cofactor equals 24. All operations are exact SymPy rational arithmetic.
Execution: local standalone script exit 0, 2026-11-20. CI awaits GitHub execution.
This is an internal spectral Green-function invariant; it does not construct B_x, select a physical kinetic term, or close any gate.
Next: recover native H64/24/Q125-to-Q96 B_x and compute (I-P_E)B_x†Q96B_xE.
