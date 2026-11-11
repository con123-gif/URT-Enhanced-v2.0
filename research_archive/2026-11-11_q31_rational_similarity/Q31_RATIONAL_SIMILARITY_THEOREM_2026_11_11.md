# Q31 — Rational similarity of the native A5-twirled chronology pairs

**Status:** THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. No physical chronology, coupling, or ARF is selected.

## Operators and scope

Use the original Q3 geometric proper-A5 action on the six antipodal axes of the icosahedron, Q28's 96 signed eight-orbit representatives, and the primitive six-bit chronology Q2 with transitions h -> 2h, 2h+1 modulo 64. For a signed dictionary D define the integral 64x64 matrix

S_D = sum_{a in A5} P_a (D Q2 D^{-1}) P_a^{-1}.

Every row and column sums to 120. The Q28/Q29 residual set consists of 48 representatives D for which the third trace agrees between D and the alternating-bit-flipped dictionary alt(D). Q30 already certified their common characteristic polynomials at all orders, and classified 4 permutation-conjugate, 18 transpose-permutation-conjugate-only, and 26 non-permutation-conjugate D/alt(D) pairs.

## Theorem

**For each of the 48 residual representatives D, the two native matrices S_D and S_alt(D) are similar over Q. In particular, all 26 Q30 cospectral non-permutation-conjugate pairs are rationally similar.**

For each pair A=S_D and B=S_alt(D), the certificate constructs the common characteristic polynomial chi(x) over Q and factors it into irreducibles chi=product_g g(x)^{e_g}. For each factor g of degree d, it computes the exact rational ranks r_1(A)=rank_Q g(A), r_1(B), r_2(A)=rank_Q g(A)^2 and r_2(B), using fraction-free exact rational row reduction over ZZ. The certificate asserts for every factor and every pair:

1. chi_A = chi_B;
2. r_1(A)=r_1(B), r_2(A)=r_2(B);
3. r_2(A)=r_2(B)=64-d e_g.

The third identity means the g-primary Jordan blocks all have lengths at most two. Let n_1=64-r_1(A), the nullity of g(A). The number of g-primary blocks of size two is e_g-n_1/d and the number of size-one blocks is 2n_1/d-e_g. These integers are identical for A and B. Thus the elementary divisors for every irreducible g agree, so the rational canonical forms agree and A and B are similar over Q.

This is an **existence theorem for rational conjugators**, not a claim of permutation, orthogonal, positive, Markov, or physically preferred conjugators. A rational similarity need not preserve the chronology observable Tr(S^2 S^T), which Q30 found can differ.

## Exact witness and limitations

For the nonsemisimple representative D=(0,2,4,6,11,9), the characteristic polynomial contains x^9, with rank_Q(A)=59 and rank_Q(A^2)=55. Thus the zero-primary component has four blocks of size two and one of size one. The same exact ranks hold for B=S_alt(D). This illustrates why equality of characteristic polynomials alone was insufficient and why the rank test is substantive.

The certificate reuses the original Q3 geometry and Q28 dictionary construction verbatim; the arithmetic of the 64x64 twirls, characteristic polynomials, irreducible factors, and ranks is exact. No measured input or historical ARF value is used. The finite conclusion does not extend to arbitrary Cathedral operators or settle any physical gate.

## Certificate

`research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`

Local independently assembled standalone reconstruction: Python 3.13.5, NumPy 2.3.5, SymPy 1.14.0, NetworkX 3.6.1; exact rank test on all 48 pairs. The committed script includes the original Q3/Q28 source routines and is registered for GitHub CI. Consult the research log for the recorded local exit code and the latest CI verdict.
