# Q49: Native Haar support graph and diagonal transport obstruction

**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING, restricted to the archived 2026-11-09 shifted Haar dictionary. Q49 and all physical ARF gates remain open.

The original 24-by-64 Haar overlap operator is the overlap of 24 intervals of length 1/24, shifted by the native golden angle α=φ⁻²=(3-√5)/2 modulo 1, with the 64 unshifted history cells of length 1/64. This is exactly the dictionary reconstructed in `research_archive/2026-11-12_q49_fixed_source_gauge/q49_fixed_source_gauge_obstruction.py`; it is conditional, not a derived physical source.

For each j=0,...,23, the shifted clock boundary b_j=(α+j/24) mod 1 is irrational, so lies strictly inside one history cell h_j=floor(64 b_j). Since adjacent boundaries are 1/24 apart, and 1/24>1/64, the 24 h_j are distinct. The column h_j has strictly positive entries in both clock rows adjacent to b_j, forming a connected cycle of bridge columns.

Each shifted clock interval has length 1/24>2/64 and hence contains at least one whole history cell, namely h=ceil(64(α+j/24)) modulo 64. This column has a strictly positive entry in exactly that row and zeros elsewhere. The 24 selected columns are distinct, giving a nonsingular diagonal 24-by-24 submatrix. Therefore **rank(C)=24 and dim ker(C)=40**.

Suppose D=diag(d_j) is a 24-clock unitary and U=diag(u_h) is a 64-history unitary with DC=CU. On bridge column h_j, positivity of the two entries forces d_j=u_{h_j}=d_{j-1}. Connectivity forces all d_j equal. The charge-two Wilson large-gauge transformation d_j=exp(iπj/12) is not scalar. Hence no diagonal history-unitary rephasing can implement it on this C.

**Scope:** This does not exclude a non-diagonal unitary U, an independently transported clock source, or a nonlinear 190/64/24 Ward map. It establishes a precise restriction on one archived conditional source.

**Execution:** `python research_archive/2026-11-12_q49_haar_diagonal_transport/q49_haar_diagonal_transport.py`, local exit 0, SymPy exact algebraic inequalities. No measured or fitted inputs.

**Next question:** Does the original nonlinear five-solid/64-history source admit a non-diagonal unitary history action implementing the Wilson charge-two clock D on its actual image?
