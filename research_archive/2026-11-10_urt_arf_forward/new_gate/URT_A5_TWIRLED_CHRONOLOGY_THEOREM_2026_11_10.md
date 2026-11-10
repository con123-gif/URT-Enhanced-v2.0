# Newton's Cathedral / URT — A5-covariant chronology lift and exact coupled-response obstruction

**10 November 2026.** New original finite algebraic theorem, independently executed in NumPy/SymPy. **PROVED for the specified 64-history operators; CONDITIONAL as a physical chronological lift; four physical ARFs OPEN.** No historical ARF coefficient, experimental fit or third-party Yang–Mills material enters the calculation.

## Original mathematical context

The existing all-five-Platonic **190-cochain** source, 50-vertex harmonic bridge, native hidden quartets `4_3⊕4_5`, `H64=H13⊕H51` charged-matter carrier and 24-clock Wilson/Schur gauge action remain **unchanged**. This result resolves a specific operator-level question in their 64-history chronology; it does not replace the full source or supply a charged physical observable. The existing `URT_A5_SYMMETRIC_THIRD_CUMULANT_THEOREM_2026_11_10.md` and its exact code `URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py` and `URT_A5_SYMMETRIC_CUBIC_SOURCE_2026_11_10.py` were read. Their exact finite-lag third cumulant applies to the *original unaveraged Q*, not the new averaged transition.

Define `Q[h,2h mod64]=Q[h,(2h+1) mod64]=1/2`, `A=Σ_(i<j) X_i X_j`, `Hbits=15I-A`. The existing exact `A5/C5` signed-history representation provides 60 permutation matrices `rho(g)` on all 64 histories.

## Theorem 1: an exact A5-equivariant, nonnegative chronological lift

For one fixed ordering of the six antipodal icosahedral axes, take the A5 Reynolds/Frobenius projection

`Qbar=(1/60)Σ_g rho(g) Q rho(g)^(-1)=S/120`, with integer `S`.

Direct integer verification proves `Qbar` is doubly stochastic, A5-equivariant, and commutes with the native `Hbits`. The exact characteristic polynomials of `S=120Qbar` in the four original energy blocks are:

| Hbits energy | dimension | exact characteristic polynomial |
| --- | ---: | --- |
| 0 | 2 | `x(x-120)` |
| 10 | 12 | `(x²-2000)^3(x²-80)^3` |
| 16 | 30 | `(x-16)^6(x-8)^6(x+2)^4(x+4)^4(x+8)^5(x+16)^5` |
| 18 | 20 | `x^8(x²-80)^6` |

The nonstationary spectral radius of `Qbar` is exactly `sqrt(5)/6`. An exact polynomial-annihilator calculation shows that nonzero eigenvalues are semisimple and the zero eigenvalue has Jordan index two.

**The primitive six-step memory identity is not preserved:** `Qbar^6[0,0]-1/64=522497/2073600000 ≠ 0`. Thus the original finite-lag cumulant certificate cannot be reused after this averaging. For the new transition, the infinite correlation series is summable by a finite resolvent.

## Theorem 2: coupled geometric/chronological transfer

Under the **additional explicit rule** of exactly one uniformly selected minimal parity-preserving two-bit flip per step, `P=A/15` and

`Bbar=P Qbar=A S/1800`.

It is doubly stochastic, nonnegative, A5-equivariant and commutes with Hbits. The Gram transfer `Tbar=Bbar^T Bbar` is positive semidefinite, with **exact** `Tr(Tbar)=7457/6750`. The coupled nonstationary spectral radius is

`rho(Bbar|centered)=sqrt(5)/18 = 0.12422599874998831...`.

For a centered *history scalar* `g`, the two-sided Green–Kubo susceptibility is

`K2(g)=<g,(I+Bbar)(I-Bbar+Pi)^(-1)g>_Haar`, `Pi=J64/64`.

The exact **basis-independent traces** of this response operator, by Hbits energy, are:

`E=0: 1`; `E=10: 6298500/516461`; `E=16: 7758658260986595/258602797781776`; `E=18: 90004/4499`.

These are no-fit **history-sector** responses, **not** KMS occupation factors, electromagnetic residues or fermion mass poles. The original 24-clock Wilson contacts and matter Ward identities are not altered.

## Theorem 3: explicit axis-ordering obstruction

A5 acts transitively on the six antipodal axes; its symmetry does not distinguish a first bit or select a total order. Holding the primitive Q fixed, merely changing the ordering of the same six geometric axes changes the exact spectrum of the A5-twirled operator. With `S=120Qbar`:

| axis labeling | exact `Tr(S²)` |
| --- | ---: |
| original coset labeling | **31440** |
| exchange bit axes 0 and 1 | **42480** |
| exchange bit axes 0 and 3 | **27120** |

All three obey the same A5 covariance, Haar stationarity and native Hbits commutation. **FALSIFIED:** the bare primitive Q and A5 symmetry alone uniquely determine a physical coupled chronological spectrum without an axis-order/clock dictionary.

A second exact check shows that averaging Q over all 64 independent bit-sign flips produces **one-step Haar**: `(1/64)Σ_t X_t Q X_t=Pi`. This follows because `t→t XOR shift(t)` is invertible over `F2^6`; indiscriminate sign averaging erases the very correlations being studied.

## Status and next theorem

**PROVED:** full 64-history exact twirl, energy-resolved characteristic polynomials, coupled positive Gram transfer, exact relaxation and Green–Kubo traces, explicit non-preservation of six-step mixing, and two independent axis-ordering counterexamples.

**CONDITIONAL:** replacing native Q by its A5 twirl; one pair-flip per step; any interpretation of these scalar susceptibilities as physical charged observables.

**OPEN:** Derive from the original pi/phi/e recursion, the **complete 190-cochain source and 24-clock** a unique *equivariant axis-ordering lift*, then a Ward-complete charge-two hidden-source → charged `H13⊕H51` vertex → physical transverse current/fermion-pole map. No one may identify these history responses with the four historical ARFs without that proof.

**Reproduce:** `OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_A5_TWIRLED_CHRONOLOGY_SPECTRUM_2026_11_10.py`. This imports only the pre-existing verified `URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py` and standard NumPy/SymPy; no prior files are changed.
