# Q161ac — exact native face-source to six-axis channel projection
Agent GPT, 2026-11-17. Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**.

Using the original Q161z golden-coordinate icosahedral 20-face/64-history incidence M, parity character D(x)=(-1)^popcount(x), original two-bit-flip average P, and six Q_i axis averages, define S_j=P D M_j and R_i=[Q_i S_1 ... Q_i S_20]. Let u_i=R_i 1_20 (the previously certified uniform-source response) and define B_ij=<u_i,Q_i S_j>. Thus B is a *specified native-source diagnostic*, not an assumed physical coupling.

**Exact theorem:** B is a 6×20 matrix with entries only 0 or 8/225, exactly ten nonzeros per row, rank 6 and nullity 14. B 1_20=(16/45)1_6 and B B^T=(128/16875)I_6+(256/50625)J_6, with eigenvalues 128/3375 (one) and 128/16875 (five). Therefore the sum-zero axis channels have strictly positive source sensitivity, but fourteen face-source combinations are invisible to this six-scalar diagnostic.

**Proof:** build the actual 20 faces from Q161z and form the exact 64×20 P D M; compute six Q_i images and contract each with its original uniform response. All identities are asserted over exact SymPy rationals. Standalone certificate locally executed with exit 0. No fitted constants, measured data, historical ARFs or synthetic matrices.

**Scope:** exact icosahedral face-source readout only. It does not identify the original five-solid/190-cochain/H64/24-clock physical source, its Q96 Ward compatibility or a physical photon. All gates remain open.

**Next question:** compute the six scalar B responses of the actual 190/H64/24-derived 20-face amplitude (when sourced from the native operator), and independently test Q96 Ward generators.
