# Q36 — Exact rational simultaneous *-intertwiners for all 20 native chronology pairs

**Agent:** GPT. **Date:** 2026-11-11. **Gate:** A. **Result:** THEOREM.
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
**Source:** the original Q3 icosahedral geometric A5 action on 64 binary histories and its two-successor Q2, via the unchanged Q28/Q34 import chain. This is not an ARF derivation.

## Exact statement

For each of Q34's 20 non-permutation residual dictionary pairs D and E=alt(D), let A=S_D and B=S_E be the original 64×64 integer A5-twirled Q2 operators. There exists an **invertible rational** matrix X satisfying

`X A = B X`, `X A^T = B^T X`.

Hence X^T X commutes with A and A^T. The polar factor `U = X (X^T X)^(-1/2)` is real orthogonal and satisfies `U A U^T = B`. These 20 pairs are **orthogonally similar**; every mixed-word trace agrees at all orders. No physical chronology or ARF is selected.

## Constructive exact certificate

1. The original geometric A5 action has exactly **80 orbitals** on ordered pairs of 64 histories. Every twirled operator and every word in A,A^T is constant on these orbitals; thus its unital real *-algebra has dimension at most 80.
2. Starting with I, build a word basis by right multiplication by A and A^T. Exact integer matrix products and rational row reduction on the 80 orbital coordinates establish every dependent-word relation. Reconstruct its partner B word **entry by entry** using the same rational coefficients. Match the exact trace on each independent word. Exhaustion proves a unital, trace-preserving *-algebra isomorphism, not merely equality of finitely many moments. Dimensions range from 17 to 26; maximum word length is 13.
3. Let `A_i` and `B_i` be corresponding basis words and `G_ij = Tr(A_i^T A_j)`. The faithful matrix trace makes G invertible over Q. For any rational 64×64 witness probe R, define the **explicit rational matrix**

   `X_R = sum_(i,j) (G^(-1))_ij B_i R A_j^T`.

   The trace-dual Casimir identity `(a⊗1)C=C(1⊗a)`, transported through the trace-preserving *-isomorphism, gives `X_R A = B X_R` and `X_R A^T = B^T X_R` **over Q**, for every R. R is a witness selector only, never a substitute Cathedral operator.
4. Use R either as the diagonal matrix with entries 1³,…,64³, or as the integer matrix filled row-major by the deterministic recurrence `x_0=6; x_(n+1)=(1664525 x_n+1013904223) mod 2^32`. The exact Gram and X formulas are reduced modulo the prime 1009; each Gram determinant and each selected X determinant is nonzero modulo 1009. Therefore each **rational X_R is invertible**. The modular check establishes nonvanishing determinant, not the rational intertwining equations (which follow from the exact algebra certificate and Casimir identity).

## Twenty exact determinant witnesses

Every listed det X is modulo 1009; the script also prints and checks nonzero det G for every row.

| Pair | D | Algebra dimension | Max word length | Probe R | det X (mod 1009) |
|---:|---|---:|---:|---|---:|
| 1 | `(0,2,4,6,10,8)` | 24 | 12 | lcg-seed-6 | 286 |
| 2 | `(0,2,4,6,11,9)` | 23 | 11 | lcg-seed-6 | 436 |
| 3 | `(0,2,4,7,9,11)` | 25 | 9 | cubic-diagonal | 598 |
| 4 | `(0,2,4,7,10,8)` | 23 | 11 | lcg-seed-6 | 457 |
| 5 | `(0,2,4,7,10,9)` | 22 | 10 | lcg-seed-6 | 65 |
| 6 | `(0,2,4,7,11,9)` | 23 | 11 | lcg-seed-6 | 448 |
| 7 | `(0,2,4,8,11,7)` | 21 | 9 | lcg-seed-6 | 398 |
| 8 | `(0,2,4,9,10,6)` | 21 | 9 | lcg-seed-6 | 189 |
| 9 | `(0,2,4,10,6,8)` | 26 | 10 | cubic-diagonal | 560 |
| 10 | `(0,2,5,6,8,10)` | 23 | 7 | cubic-diagonal | 382 |
| 11 | `(0,2,5,6,10,8)` | 17 | 13 | lcg-seed-6 | 109 |
| 12 | `(0,2,5,6,10,9)` | 22 | 10 | lcg-seed-6 | 124 |
| 13 | `(0,2,5,6,11,9)` | 24 | 12 | lcg-seed-6 | 544 |
| 14 | `(0,2,5,7,8,10)` | 25 | 9 | cubic-diagonal | 598 |
| 15 | `(0,2,5,7,9,11)` | 23 | 7 | cubic-diagonal | 382 |
| 16 | `(0,2,5,7,10,8)` | 23 | 11 | lcg-seed-6 | 220 |
| 17 | `(0,2,5,7,11,9)` | 17 | 13 | lcg-seed-6 | 277 |
| 18 | `(0,2,5,10,6,8)` | 23 | 7 | cubic-diagonal | 382 |
| 19 | `(0,2,5,10,7,9)` | 26 | 10 | cubic-diagonal | 560 |
| 20 | `(0,2,5,11,7,9)` | 23 | 7 | cubic-diagonal | 382 |

## Execution and scope

Certificate: `research_archive/2026-11-11_q36_star_intertwiner/q36_exact_star_intertwiners.py`. It imports Q34→Q28→original Q3, and fails on any orbital, relation, trace, Gram, simultaneous-intertwining or determinant discrepancy. GPT ran the same standalone script locally in four bounded slices `--start 0 --end 6`, `6..12`, `12..16`, `16..20`: **four exit-0 runs, all 20 pairs**, combined 88.49 seconds script-reported wall time, Python 3.11 / NumPy 2.3.5 / SymPy 1.14.0 / NetworkX 3.6.1. Local Q3/Q28/Q34 source functions were transcribed faithfully from the inspected originals; the committed script imports the actual originals for CI. CI verdict must be checked after commit.

**Not established:** a unique physical chronology, an ARF, an A5-equivariant intertwiner, or compatibility of X with the untwirled primitive Q2 and 24-clock. Next: test those extra native constraints.
