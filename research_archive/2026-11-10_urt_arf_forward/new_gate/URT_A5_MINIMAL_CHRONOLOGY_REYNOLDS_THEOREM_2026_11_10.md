# Newton's Cathedral / URT — exact minimal A5-compatible ensemble chronology and its cost

**10 November 2026; original no-fit mathematical continuation.** This theorem continues the new exact 64-history A5 decomposition and the archived original all-five-Platonic 190-cochain source, native hidden quartets, and 24-clock Ward/Schur calculation. It derives a *conditional A5-equivariant ensemble transfer*, **not** a replacement for the primitive unaveraged URT recursion or a physical ARF prediction. The additional hypothesis is explicitly stated: select the A5-equivariant Markov operator closest to the primitive six-bit Q in Frobenius norm.

## 1. A uniquely defined no-fit equivariant candidate

Let `Q[h,2h]=Q[h,2h+1]=1/2`, with `h=0,...,63`, and let `P_g` be the exact 64-history permutation representation of the 60 icosahedral rotations, constructed from `A5/C5` antipodal axes. The group Reynolds projection is

```
R(Q) = (1/60) sum_(g in A5) P_g Q P_g^{-1} = M/120,
```

where `M` is a nonnegative integer 64x64 matrix with every row and column sum exactly `120`. The group-average operator is the **unique orthogonal projection in Hilbert-Schmidt/Frobenius norm** of Q onto the linear subspace of A5-equivariant operators. Because R(Q) is itself nonnegative and doubly stochastic, it is also the unique Frobenius-nearest operator among **A5-equivariant Markov matrices**. No target ARF, phenomenological coefficient or free scalar is inserted. This minimal-disturbance principle is an **additional criterion**, not a proven consequence of the original pi/phi/e map.

For the original history pair-flip Hamiltonian `H64=15I-sum_(i<j)X_iX_j`, exact integer multiplication yields

```
[M,H64]=0.
```

Thus this particular equivariant ensemble transfer preserves the full native H64 energy eigenspaces **and** A5. The bare Q does not commute with any nonidentity A5 rotation (proved in the accompanying signed-history theorem).

## 2. Exact cost of restoring A5

All Frobenius squared norms are exact rational numbers:

```
||Q||_F^2       = 32,
||R(Q)||_F^2    = 23/10,
||Q-R(Q)||_F^2  = 297/10,
```

and `32=23/10+297/10` verifies orthogonal projection. Consequently the closest A5-compatible transfer discards exactly

```
(297/10)/32 = 297/320 = 92.8125%
```

of the **squared Frobenius norm** of the original one-step transfer. This is a quantitative, model-specific obstruction: enforcing exact A5 at every step by this least-squares projection changes the primitive dyadic dynamics substantially.

## 3. Exact full 64-state characteristic polynomial

The integer matrix `M=120R(Q)` has characteristic polynomial

```
chi_M(z) = z^9 (z-120) (z-16)^6 (z-8)^6 (z+2)^4 (z+4)^4
           (z+8)^5 (z+16)^5 (z^2-2000)^3 (z^2-80)^9.
```

This factorization was computed using exact integer characteristic-polynomial arithmetic, and independently checked against floating-point diagonalisation. The stationary eigenvalue is `1`; every other eigenvalue has modulus at most `sqrt(5)/6 ≈ 0.37267799625`. The zero eigenvalue has algebraic multiplicity nine; this operator is nonnormal and includes a nilpotent sector. No statement about a physical energy gap follows from these stochastic eigenvalues.

## 4. Exact four-quartet chronology blocks, source typing retained

The native source embeds its `4_5` quartet in the H64 energy-16 eigenspace and its `4_3` quartet in energy 18, each of which contains two A5 quartets. The exact joint A5-quartet and energy projectors have rank eight in each energy sector. Their two-dimensional multiplicity-space transfers have characteristic polynomials

```
E16: (x + 1/30)(x + 1/60),  eigenvalues -1/30, -1/60.
E18: x^2,                  nonzero nilpotent 2x2 transfer, square zero.
```

The E18 claim is **not** that R(Q) vanishes: its restricted operator is nonzero and its square is exactly zero. All identities are verified by integer matrix multiplication using the native Walsh-energy projectors and the A5 quartet central idempotent `P4=(4/60) sum_g chi4(g)P_g`. The source-selected *orientation within each two-quartet multiplicity space* is not inferred from this representation count; it must be calculated from the original nonlinear `Uh` embedding before any source response is assigned to either eigenmode. These are **chronological decay modes**, not the four historical ARFs.

## 5. Six-step exact memory erasure is lost

The primitive dyadic Q obeys `Q^6=J64/64` exactly because six appended fair bits replace the initial six bits. Its Reynolds projection does not obey the same identity:

```
max_(i,j) |[R(Q)^6]_(i,j) - 1/64| = 29461/116640000
                                     ≈ 0.0002525805898491.
```

This is an exact rational comparison of integer sixth powers. Although R(Q) is doubly stochastic and converges to Haar asymptotically, it is **not** the original six-step finite-memory recursion. Thus substituting R(Q) into previously proved native third cumulants without recalculation would be invalid. It is a conditional symmetry-restoring ensemble construction, not a physical derivation.

## 6. What was established and what remains

**Established:** unique Frobenius-nearest A5-equivariant Markov projection of the original Q; exact H64 commutation; exact cost `297/320` in squared transfer norm; complete rational/integer characteristic polynomial; exact E16 and E18 quartet transfer polynomials and E18 nilpotency; exact failure of six-step memory reset. All are no-fit finite statements.

**Ruled out:** the shortcut of declaring the unaveraged dyadic chronology A5-equivariant; the shortcut of using this Reynolds projection as if it preserved the native six-step cumulants; identifying these four source-adjacent quartet modes with four physical ARFs without a source-to-charged-matter/pole theorem.

**Remaining mathematical step:** derive, from the actual pi/phi/e URT dynamics and full gauge-covariant 190-cochain/64-history/24-clock action, whether an A5-compatible **lift of the chronological axis ordering** exists that preserves the primitive Q rather than replacing it with R(Q). Then derive its coupling to charged `H13⊕H51` fermions and pole observables with all source, Wilson, Schur and fermion Ward contacts. The two hidden quartets and the allowed Weyl pairing intertwiners remain explicit; no physical ARF has yet been obtained.

## Reproduction

```
OPENBLAS_NUM_THREADS=1 python URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_A5_REYNOLDS_HISTORY_TRANSFER_2026_11_10.py
```

The latter reads the former's independently verified A5 action and performs its own exact integer transfer, character-polynomial and quartet-projector checks. The previous source files are not modified. No James or third-party Yang–Mills work is used.
