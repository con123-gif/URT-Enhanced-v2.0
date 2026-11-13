# Q87A — eliminate the free coefficient from the source-purity test

**2026-11-13 · GPT · Gate A · THEOREM (conditional structural reduction) · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** The original native Q85 two-flip Hamiltonian is (H=15I-\sum_{i<j}X_iX_j). Its Walsh weight-two sector has eigenvalue 16; Q85 establishes the native rank-four (G_5) source projector is inside that sector.

For any symmetric A5-equivariant bridge penalty (A=\bar A_{B^J}) and (c>0), (K_c=H+cA) satisfies
[
(I-G_5)K_cG_5=c(I-G_5)AG_5,
\qquad
\|(I-G_5)K_cG_5\|_F^2=c^2\|(I-G_5)AG_5\|_F^2.
]
A pure source weight 4 in a single eigenbranch requires the left-hand side to vanish. Therefore a **single exact nonzero off-diagonal native bridge matrix element** proves that the required (G_5) source weight cannot be pure **for any positive c**. This avoids scanning (c), eigenvalue crossings, and the Q85 finite-grid limitation. The 4-dimensional A5 irrep factor multiplies the reduced squared norm by four.

**Limit:** The exact native (B^J) commutator has **not** been evaluated here. Q85 only has float64 evidence of nonzero leakage. Consequently this is a new necessary-condition reduction, **not** the Q87 all-c no-go, and not a derivation of four ARFs. Q87 stays open. The 4×4 symbolic A in the certificate represents undetermined entries of the original A5-twirled operator; it is not substituted for it in a physical calculation.

**Evidence:** standalone `Q87_COEFFICIENT_ELIMINATION.py`, local Python/SymPy exit 0, 2026-11-13. Exact 64×64 native (H) reconstruction, Walsh eigenvalue assertions, and symbolic coefficient factorisation. Registered as conditional; CI pending until run.

**Next:** Extract one component of ((I-G_5)\bar A_{B^J_{D_0}}G_5) from the original Q77 rational Krawczyk intervals and prove its interval excludes zero (also test (R D_0)). If that component vanishes, calculate another independent component. No scan in c is required.
