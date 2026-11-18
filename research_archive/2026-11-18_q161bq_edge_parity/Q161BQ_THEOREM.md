# Q161bq — native Q101 edge antipodal intertwiner (2026-11-18)
Status: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Let D be the original 30-edge by 20-face oriented Q101 incidence, with each row +1/-1 on its two incident faces. Let P be the native antipodal permutation of the 20 faces. Define the 30-edge signed antipodal permutation E uniquely by matching the orientation of each row of D. Then **ED=DP**, **E²=I**, **Eᵀ=E**, and tr(E)=0. Consequently the edge ± parity subspaces both have dimension 15, the image of D splits as **9 even + 10 odd**, and the 11-dimensional edge-cycle kernel of Dᵀ splits as **6 even + 5 odd**. Proof: each edge is mapped to its antipodal edge, and the sign is fixed by the oriented incidence; the standalone certificate constructs both from the original golden icosahedral vertices and checks the matrix identities and exact ranks.

This is an exact native Q101 parity selection rule, NOT a construction of the H64-to-24-clock coupling, NOT a Q96 charged Ward identity, and NOT a physical gate closure. The original full five-solid/190/H64/24 upstream remains required. Next question: extract the archived original H64 edge-to-clock map J and compute EJ-JP_clock and the Q96 charged Ward residual without inserting an artificial transport.
Run: `python research_archive/2026-11-18_q161bq_edge_parity/Q161BQ_CERT.py`.
Local execution: Python/SymPy, exit 0, output `Q161bq exact PASS: edge parity dims 15 15 image ranks 9 10 cycle dimensions 6 5 edge involution trace 0`.
