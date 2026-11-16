# Q161n — original Q/P parity-source selection (2026-11-16)

Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Result: THEOREM for the explicitly defined upstream character, NOT a derivation of the physical five-solid/H64/24-clock source.

Original source: research_archive/2026-11-16_q161l_axis_orbit/Q161L_AXIS_ORBIT.py, Q161a Q and P. Let w_63(x)=(-1)^popcount(x), and let D_j be diagonal multiplication by (-1)^{bit_j(x)}. The native even-two-bit flip P has P w_63=w_63 and QP w_63=0. For each j=0,...,5, D_j w_63=w_(63 xor 2^j), of Walsh weight 5, so P D_j w_63=(1/3)D_j w_63. Q averages over adjacent source positions (2x,2x+1), and therefore annihilates all j>0 characters but preserves the j=0 character. Hence ||QP D_0 w_63||²=64/9, whereas ||QP D_j w_63||²=0 for j=1,...,5. This is an exact escape from the Q161m obstruction only if a physically derived upstream source implements D_0 (or a component with equivalent parity mixing); downstream-only maps still cannot rescue the parity.

A character D_0 is a specified diagnostic operator, not an independently selected Cathedral coupling. Its action on Q96 is scalar in charge space and would commute with Q96 when tensored with identity, but this alone does NOT verify the original full Q96 Ward identity or establish a five-solid incidence map. No fitted values, historical ARFs or physical inputs were used.

Evidence: standalone Python Fraction certificate Q161N_PARITY_SOURCE.py executed locally, exit 0, on 2026-11-16. CI for this check is pending until GitHub orchestrator runs.

Next question: does the ORIGINAL five-solid/24-clock H64-to-vertex incidence have a nonzero bit-0 Walsh-character component before Q, and does its actual charged extension preserve Q96 Ward?
