# Native source spectral weights for the conditional A5 chronology operator

Date: 2026-11-10. Independent local NumPy/SciPy execution; **source-level result, not physical ARFs**.

## Calculation
Retain the original five-Platonic 190-cochain source construction and its native icosahedral face hidden projectors P3,P5, the original 64 signed histories, and the 24-clock Ward-complete response. For the existing *conditional* chronology penalty define
Q[h,2h mod 64]=Q[h,(2h+1) mod 64]=1/2,
A=(I-Q)^T(I-Q), H=15I-sum_{i<j}X_i X_j,
Abar=(1/60)sum_{g in A5}R_g A R_g^T, Kbar=H+Abar.

Reconstruct the 12 icosahedral vertices as A5/C5, their six antipodal pairs, the 20 triangular faces, face-vertex incidence C, Lface, Ph=I-C(C^TC)^(-1)C^T, P3=Ph(5I-Lface)/2, P5=Ph(Lface-3I)/2. Let M[h,f]=1 when all three vertices of face f occur in the six-bit history h. The archived native source isometry is Uh=M Ph/sqrt(2).

The numerical calculation checks ||Uh^T Uh-Ph||<2e-15, ||H Uh P3-18 Uh P3||<8e-15, ||H Uh P5-16 Uh P5||<8e-15. Construct all 60 A5 history permutations and Kbar. Diagonalize Kbar separately in six-bit Walsh-weight blocks, and calculate the **actual source spectral weights** tr(P_lambda Uh Ps Uh^T), where Ps=P3 or P5 and P_lambda is the Kbar spectral projector.

| Walsh weight | Kbar quartet eigenvalue | Native source spectral weight |
|---|---|---|
| 2 | 266/15 | 4 |
| 3 | 389/20 | 2 |
| 3 | 391/20 | 2 |
| 4 | 521/30 | 0 |

Both A5-orbit choices for the 30-edge icosahedral graph give the same table. In both, the source lies entirely in Walsh weight 2 for P5 and Walsh weight 3 for P3. The P3 source trace splits equally between the two weight-3 quartet eigenprojectors. Sum of weights is 8, as required by rank(P3+P5)=8.

**New constraint:** the fourth conditional quartet branch (521/30) is dark to the original native hidden source; four A5 quartet eigenbranches do not yield four source-visible poles. The previously unspecified conditional source weights are fixed by the native embedding, rather than fitted.

**Scope:** the conditional Abar coefficient and Reynolds choice are still not derived uniquely from pi/phi/e. The table is a finite source-to-history spectral result, not a charged H13+H51 fermion pole, a physical residue, or any of the four historical ARFs. The original all-five-solid nonlinear source, 24-clock, and Ward contacts are not replaced. No third-party Yang-Mills material used.

Reproduction algorithm: enumerate A5 as the 60 even permutations of five letters; represent vertices by its 12 C5 cosets; derive the 30-edge orbit and 20 triangular faces; use the six antipodal vertex pairs to index 64 histories; build M, C, Lface, Uh; average the 60 permutations of A; use normalized Walsh characters W[h,m]=(-1)^popcount(h&m)/8; compute the Kbar eigenspace projector in each Walsh weight; take traces with Uh P3 Uh^T and Uh P5 Uh^T. Numerical check executed twice, for both 30-edge orbits.
