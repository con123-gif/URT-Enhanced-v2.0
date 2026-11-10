# Newton's Cathedral / URT — exact fourth neutral source cumulant and complete two-quartet quartic tensor

**Date:** 10 November 2026. **Status:** independently executed, exact source-level mathematical result; four physical ARFs **not** derived. No target ARF coefficients, measured particle data, adjustable parameters, or third-party Yang–Mills material enter this calculation. Only new original files are added.

## 1. Original input and scope

Use the unchanged archived all-five-Platonic 190-cochain source and its specified 50-vertex -> 12-axis -> 20-icosahedral-face pullback, the rank-four hidden projectors `P3,P5`, and all 64 signed six-bit histories. Define the **gauge-neutral** scalars

`n3(h)=2 ||P3 O(h)||²`, `n5(h)=||P5 E(h)||²`

using precisely the original archived face-source vectors `O,E`. Their centered versions are `g3=n3-(36+72sqrt(5)/5)` and `g5=n5-7`. The exact primitive chronology is `Q[h,2h]=Q[h,2h+1]=1/2`, with `Q^6=J64/64`. Its stationary law is uniform Haar. These scalar norms are invariant under the existing diagonal charge-two temporal U(1); they do not replace the 24-clock Wilson/Schur/fermion action or its Ward contacts. The original five-solid pullback is an existing model premise, not rederived here from pi/phi/e.

## 2. New all-orders finite-resolvent theorem

For any real scalar `g` on the 64 histories, consider the tilted Markov operator

`A(t)=Q diag(exp(t g))`.

The analytic dominant eigenvalue `lambda(t)`, with `lambda(0)=1`, gives the stationary long-time cumulant rate `kappa_m(g)=d^m/dt^m log(lambda(t))|_(t=0)`. Write

`A(t)=sum_(k>=0) A_k t^k`, `A_k=Q diag(g^k/k!)`,
`lambda(t)=sum_(k>=0) lambda_k t^k`,
`r(t)=sum_(k>=0) r_k t^k`, with `r_0=1`, `mean(r_k)=0` for `k>=1`.

At every order `n>=1`, put

`b_n=sum_(k=1..n) A_k r_(n-k) - sum_(k=1..n-1) lambda_k r_(n-k)`.

Then **exactly**

`lambda_n=mean(b_n)`,
`r_n=(I+Q+Q²+Q³+Q⁴+Q⁵)(b_n-lambda_n*1)`.

**Proof:** Match coefficients in `A(t)r(t)=lambda(t)r(t)`. The centered part obeys `(I-Q)r_n=b_n-lambda_n*1`. Since `Q^6=Pi=J64/64`, `Q^6=0` on centered vectors and the six-term polynomial is the exact inverse of `I-Q` there. Taking Haar means gives `lambda_n`. The formal logarithm of the eigenvalue then yields all cumulant rates. For fixed cumulant order `m`, the recursion requires only finitely many 64-state rational-field operations; it does **not** require an infinite-lag cutoff, simulation, fitted closure, or inversion of a singular 64x64 matrix. The construction applies at any order, not just fourth.

## 3. New exact fourth cumulant of the original hidden-5 norm

The native source gives `n5(h)` with values `0` (24 histories) and `(56 ± 24sqrt(5))/5` (20 histories each). The exact cumulant rates of its centered chronological process are

`kappa_1(g5)=0`,
`kappa_2(g5)=471/5`,
`kappa_3(g5)=(152754+6912sqrt(5))/125`,
`kappa_4(g5)=(13072602+1749888sqrt(5))/625`.

**New:** `kappa_4(g5)=27176.752833617844...`, with `kappa_4/kappa_2²=3.0626386503867455...`. The nonzero fourth connected rate demonstrates that the exact neutral source process is not Gaussian at fourth order. These are not electromagnetic coupling constants or particle pole masses.

## 4. Complete exact fourth cumulant tensor for the two neutral hidden quartets

Let `K_{ijkl}` be the symmetric long-time connected fourth cumulant of the two real neutral scalars `g3,g5`. Exact polarization of `kappa_4(g3+t*g5)` yields all five independent components:

| Component | Exact value in Q(sqrt(5)) | Decimal |
| --- | --- | ---: |
| K3333 | 7439788528128/78125 + (16635696205824/390625) sqrt(5) | 190457574.93733835 |
| K3335 | 813690251136/78125 + (72764884224/15625) sqrt(5) | 20828497.77452583 |
| K3355 | 17818058592/15625 + (7941587328/15625) sqrt(5) | 2276863.213226171 |
| K3555 | 400479336/3125 + (168605712/3125) sqrt(5) | 248797.81421656066 |
| K5555 | 13072602/625 + (1749888/625) sqrt(5) | 27176.752833617844 |

This is a **five-component fourth-order neutral scalar response tensor**, not five new forces, five physical ARFs, or five independent gauge charges. The original 24-clock and its Wilson/source/Schur Ward contacts remain unchanged; no unverified factor of 24 is inserted.

## 5. Independent verification

Two mathematically distinct routes agree **exactly** for `K5555`:

1. Fourth derivative of the tilted 64-history Perron eigenvalue using the finite six-step Poisson inverse.
2. Connected four-time enumeration `sum_(a,b,c=0..5) m(a,b,c) cum[g(0),g(a),g(a+b),g(a+b+c)]`, where `m=4! / product factorial(time multiplicities)`. Any gap >=6 disconnects two independent six-bit windows, so all omitted connected cumulants vanish.

The tensor components were obtained from `t=0,±1,±2` by exact polynomial polarization, and independently checked by reconstructing the polynomial at all sampled points. The original archived exact values `K2_33=(2554416+1135296sqrt5)/625`, `K2_35=11556/25+(23112/125)sqrt5`, `K3_333=(8470303488+3786974208sqrt5)/15625` were reproduced as regression checks. The new script uses the **unchanged original source script**, rather than importing the historical ARF target ledger. An independent reconstruction of the original icosahedral face pullback from exact golden vertices, rational face projectors and 64 bit histories reproduced all fourth tensor entries and the earlier cumulants.

Run from this directory:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python URT_EXACT_NEUTRAL_FOURTH_CUMULANT_2026_11_10.py
```

## 6. Physical status and next proof obligation

**Proved for the specified archived source:** an exact all-orders finite chronology-cumulant algorithm; an independently checked new fourth cumulant of the native hidden-5 norm; and the complete mixed neutral quartic response of the 4_3/4_5 norm observables.

**Not proved:** that the bare pi/phi/e map uniquely selects the existing all-five-solid-to-face pullback, the A5-covariant physical frame lift, the source-to-charged-H13⊕H51 matter vertex, or any of the four historical physical ARFs. Neutral scalar norm cumulants cannot simply be identified with charge-two Yukawa coefficients or transverse Maxwell pole residues.

**Next precise step:** compute the **charged**, frame-covariant 24-clock four-point connected source vertex, including temporal Wilson link seagulls, Schur relaxation and charged-fermion contact terms, and determine whether its physical transverse/pole projection selects one normalized H13⊕H51 intertwiner without a new fitted or stipulated coupling. The present neutral fourth tensor supplies a fixed no-fit higher-order source benchmark for that test.
