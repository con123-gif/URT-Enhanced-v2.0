# Native URT Q⁶ cumulant recursion and exact A5-vacuum mixing theorem

**Date:** 2026-11-10. **Status:** new exact source-level theorems; not a physical four-ARF derivation. No historical ARF values, measured constants, or fitted parameters enter.

## Theorem 1 — all-order finite-history cumulant recursion

Let Q be the original 64-history URT de Bruijn Markov operator,

`(Q f)(h)=[f(2h mod 64)+f((2h+1) mod 64)]/2`,

and P the Haar average over 64 histories. The native identity `Q^6=P` implies for every centered 64-vector b:

`(I-Q)^(-1)b=(I+Q+Q²+Q³+Q⁴+Q⁵)b`.

This is an exact finite inverse, not an asymptotic truncation.

For any real six-bit source g, set `T(t)=diag(exp(tg))Q`. Let λ(t) be the simple analytic eigenvalue near λ(0)=1. Normalize the right eigenvector r(t) by `P r(t)=1`, and write `λ_n=λ^(n)(0)`, `r_n=r^(n)(0)`, `r_0=1`, `P r_n=0` for n≥1.

For each n≥1 define

`A_n = Σ_{k=1}^n binom(n,k) diag(g^k) Q r_(n-k)`.

Then exactly

`λ_n=P A_n`,

`r_n=(I+Q+Q²+Q³+Q⁴+Q⁵)[A_n−Σ_{k=1}^n binom(n,k)λ_k r_(n-k)]`.

The stationary additive-source cumulant rate `K_n=(d^n/dt^n)log λ(t)|_(t=0)` is

`K_n=λ_n−Σ_{j=1}^{n−1}binom(n−1,j−1)K_j λ_(n−j)`.

**Proof.** Differentiate `T(t)r(t)=λ(t)r(t)` n times at zero. Separate the k=0 term Qr_n and apply Haar P; `PQ=P` and `Pr_n=0` give λ_n. The remaining right-hand side is centered and is inverted by the finite six-step polynomial. The last identity is the moment-to-cumulant recurrence. Because `Q^6=P`, the eigenvalue 1 is simple and all other eigenvalues are zero; λ(t) is analytic near zero.

This is an all-order exact source-cumulant engine using only the original 64-history recurrence. It makes the previously uncomputed fourth native source cumulant directly accessible without numerical eigenvalue differentiation.

## Theorem 2 — A5 fixed-vacuum mixing is not an ergodic cumulant-rate process

The archived A5 source theorem reports five distinct unit-normalized hidden-4_5 singlet fixed-frame quadratic cumulant rates:

`v=(67/48,33/16,25/24,33/16,5/6)`.

Their equal average is `μ=71/48`; their exact population variance is

`Var_5(v)=(1/5)Σ_i v_i²−μ²=1493/5760>0`.

Choose one of the five tetrahedral vacua uniformly *once*, keep that vacuum fixed, and run the unchanged six-bit URT chronology for n steps. For vacuum i let S_(n,i) be the centered additive source. As each g_i is a bounded function of six consecutive iid Haar digits, its fixed-vacuum cumulants of any fixed order are O(n), and

`Var(S_(n,i))=n v_i+O(1)`.

The law of total fourth cumulance for centered mixtures gives

`κ4_mix(S_n)=(1/5)Σ_i κ4(S_(n,i))+3 Var_5(Var(S_(n,i)))`.

Therefore, **exactly at leading order**,

`κ4_mix(S_n)=(1493/1920)n²+O(n)`.

Hence `κ4_mix(S_n)/n` diverges. This does not invalidate the separately averaged fixed-vacuum K2 and K3 rates: they are *quenched averages of rates*, not cumulant rates of one ergodic vacuum-mixed history.

For analytic fixed-vacuum log-eigenvalues `f_i(t)=log λ_i(t)`, the quenched average `f_q(t)=mean_i f_i(t)` has `f_q''(0)=71/48`. The annealed frozen-vacuum limit `f_a(t)=lim_(n→∞) n^(-1)log[(1/5)Σ_i E(exp(t S_(n,i)))]` equals `max_i f_i(t)` for real t near zero, so `f_a''(0)=max_i v_i=33/16`. Differentiation at zero and the n→∞ limit do not commute. The positive n² coefficient certifies the nonuniformity.

The result is independent of the unresolved global sign orientation of the A5 cubic source: all terms in this obstruction depend only on K2.

**Scope qualification:** the coefficient 1493/1920 is exact conditional on the five previously archived native K2 values. This run did not re-execute the complete original five-solid source construction locally.


## New theorem 3 — exact native fourth cumulant of all five A4 singlets

An independent local reconstruction was executed using the **original exact Q(√5) nonlinear face-source formula** from the archived five-solid pullback, the original six antipodal-bit ordering, the exact rank-four hidden P5 projector, the 60 proper icosahedral A5 rotations, and the five A4 normalizer singlet projectors. The 50→8→12 five-solid pullback equivalence is established in the archived source; this independent check starts at its exactly equivalent icosahedral output and does not replace the full 190-cochain model.

For each of the five branches, the fourth long-time cumulant was evaluated **two independent ways**: (i) the new Q⁶ finite Poisson/eigenvalue recursion and (ii) exact finite-time moment propagation, with `K4=κ4(S_25)−κ4(S_24)`. The equality is exact because six-bit observables are 5-dependent and connected four-point clusters have time span at most 15. All five equalities passed in Q(√5), with no floating-point approximations in the comparisons.

The reconstruction also reproduced the **previously archived** normalized K2 multiset `{67/48,33/16,25/24,33/16,5/6}` and the **previously archived** A5-simplex-oriented cubic mean `4/375+sqrt(5)/16000` exactly. These independent crosschecks validate the source normalization and orientation used for the new K4.

The newly derived unit-normalized individual fourth cumulant rates, listed alongside their K2 rates, are:

| Native K2 | Exact native K4 |
| --- | --- |
| 67/48 | 19163/57600 + (103/50)√5 |
| 33/16 (first branch) | 552571/19200 + (15201/1600)√5 |
| 25/24 | 280439/28800 + (1503/800)√5 |
| 33/16 (second branch) | 502531/19200 + (17631/1600)√5 |
| 5/6 | 7547/900 + (447/200)√5 |

Therefore the **exact equal-branch quenched fourth cumulant rate** is

`K4_A5,quenched = 845671/57600 + (4271/800)√5 ≈ 26.619596109321446`.

The dimensionless source kurtosis-rate ratio is

`K4_A5,quenched / (K2_A5,quenched)^2 = (845671+307512√5)/126025 ≈ 12.166544224534142`.

These are **new exact source-level results**, not measured ARFs, physical photon couplings, or physical fermion pole observables. Their sign is invariant under global A5-simplex orientation reversal. They must **not** be confused with the frozen-vacuum **mixture** fourth cumulant, which grows as `(1493/1920)n²+O(n)`.

**Execution status:** independent reconstruction plus exact finite-time crosscheck **PASS locally** for all five branches; archived-script `--native` execution in the GitHub environment **not yet confirmed**. The committed native engine now performs both methods and asserts the exact mean when run on the original archive.

## Executable no-fit verification

1. `python URT_NATIVE_Q6_TILTED_TRANSFER_ALL_CUMULANTS_2026_11_10.py` — **PASS locally**: 64 exact tests of Q⁶=P; two independent Rademacher sources through K6 (K2=1, K4=−2, K6=16); constant-source cumulants.
2. `python URT_A5_QUENCHED_ANNEALED_CUMULANT_THEOREM_2026_11_10.py` — **PASS locally**: exact rational μ, Var and n² coefficient; all 64 six-step history transitions; exact finite-n Rademacher-mixture fourth cumulants independently enumerated for n=1,…,6.
3. `python URT_NATIVE_Q6_TILTED_TRANSFER_ALL_CUMULANTS_2026_11_10.py --native` — **NOT YET RUN against GitHub archive; independently reconstructed and crosschecked locally**: loads existing `URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py` and its original archived source, then computes five individual *native* K4 values, cross-checks each K2/K3 against the archived exact results, and verifies each K4 independently by exact finite-time cumulant differences at n=24,25. This mode must fail rather than silently substitute a synthetic source if the archive is missing.

## Honest research status and next unsolved step

**Proved:** a finite exact all-order cumulant recursion for the original URT 64-history transfer; the exact five native fourth cumulants and their quenched A5 mean from independent Q(√5) reconstruction and finite-time crosschecks; a precise nonergodic fourth-cumulant obstruction for mixing the five A5-related fixed vacua; independent exact executable tests.

**Previously archived and independently reproduced locally this run:** the five native K2 rates, the A5 singlet simplex orientation, and the A5-averaged native K3 rate. The original GitHub archive entry point was not executed locally; its exact source formulas were independently reconstructed.

**Still unproved:** a uniquely URT-selected ergodic A5-compatible vacuum/chronology law; a Ward-complete H13⊕H51 physical charged source-to-photon pole map; identification of any of these source cumulants with the four historical physical ARFs.

**Precise next gate:** execute the new `--native` fourth-cumulant calculation on the complete original source. Then use the full 190-cochain, 64-history, 24-clock and H13⊕H51 charged action to derive which vacuum ensemble is physically selected (quenched, annealed or dynamically mixing), including all Ward contacts. A5 averaging cannot be silently identified with a single ergodic physical response.

No unrelated files were modified; no James/third-party Yang–Mills work was included.
