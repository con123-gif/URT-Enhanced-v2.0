# Compact prime-error normalization: the exact cancellation before bounds

**Date:** 26 November 2026  
**Lane:** MATH / compact lane 2 (prime-window arithmetic–analytic bridge)  
**Status:** SOURCE-MATCHED HUMAN DERIVATION; scalar certificate PREPARED, not kernel-replayed  
**Compact source:** `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, `grh-compact`  
**Toolchain pin:** Lean 4.35.0; Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`

This run makes one contribution: it expands the compact source's `Data.remainder_eq` and isolates the exact normalized identity used by `eventually_primeError_le_rpow`.  It does not prove the compact `star_inequality`, the second-scale polar-window theorem, or RH.  It replaces no source theorem and imports no claimed RH theorem.

## 1. Source declarations and quantifiers

All paths are relative to `grh-compact/src`.

| Declaration | Source path | Blob SHA | Role |
|---|---|---|---|
| `primeError`, `primeError_eq_sum`, `re_logDerivMean_one` | `New/Endgame/PrimeError.lean` | `63eb3d79d95ad815878e623b96f237240058c8e2` | Defines the weighted error and rewrites it as an exact finite sum. |
| `Data.remainder`, `Data.remainder_eq` | `New/Endgame/ShortAndEnough.lean` | `b99eea0689be372d84362c58272b705e104b6a3a` | Cancels the prime-sum main terms against `mainAsk`. |
| `Data`, `primeSum`, `nominalWeight`, `budget` | `New/Data/AdmissibleData.lean` | `04208a5044bb7cf6464ef142a14d939148bed834` | Fixes the same admissible datum and its two scales. |
| `exists_data` | `New/Data/DataExist.lean` | `634c6a1f88791a3bb770326785b70411e8289b41` | For fixed `P, epsilon`, supplies a datum at every sufficiently large `x`. |
| `eventually_primeError_le_rpow` | `New/Main.lean` | `198ed5bf26aa294898931e0649bc2b88f1389f65` | Changes only `logX1`, then combines the exact identity, `star_inequality`, and the polar window. |

Fix parameters `P`.  Write `N0=P.N0`, let `d=P.d`, and fix one admissible `D : Data P`.  Put

\[
  R_M(z)=\operatorname{primeError}(d,M,z),\qquad
  T=\#D.\mathrm{thick},\qquad U=\#D.\mathrm{tops}.
\]

The source's weight is

\[
 \lambda_M(\nu)=\mathbf 1_{\nu\equiv1\pmod M}\,
 \Lambda(\nu)(1-\chi_d(\nu)),
\]

not the old unweighted zeta ramp.  For every natural `A` and every real `z` with `0<z<=A`, `primeError_eq_sum` says

\[
R_M(z)=\frac1A\sum_{1\le\nu\le A}\lambda_M(\nu)
       \left(\frac A\nu-\frac Az\right)_+
       -\frac{\log z}{\varphi(M)}-c_M,
\quad c_M=\Re\operatorname{logDerivMean}(d,M,1).
\tag{1}
\]

At modulus one the source proves exactly

\[
c_1=-1-\operatorname{chowlaSelbergConst}(d).
\tag{2}
\]

## 2. The two exact sums in `remainder_eq`

The local counting identity in the proof is: for every `nu`, as `tau` ranges over the tops, the transformed place `placeOfInt(-nu)*tau` meets every thick place exactly when `nu=1 mod N0`, and otherwise contributes nothing.  In the source notation this is the equality named `A` inside `Data.remainder_eq`:

\[
\#\{\tau\in\mathrm{tops}:-\nu\tau\in\mathrm{thick}\}\,
  \lambda_1(\nu)b
=T\lambda_{N_0}(\nu)b.
\tag{3}
\]

Apply (1) at `z=x` and `z=x1`, use (2), and sum (3).  The source obtains the following equality before any inequality or norm:

\[
\begin{aligned}
\sum_{\tau\in\mathrm{tops}}\operatorname{primeSum}(a,\tau)
=a\Big[&T\{R_{N_0}(x)-R_{N_0}(x_1)\}+UR_1(x_1)\\
&+T\frac{\log x-\log x_1}{\varphi(N_0)}
 +U\{\log x_1-1-\operatorname{CS}(d)\}\Big].
\end{aligned}
\tag{4}
\]

Here `a=D.a`.  Separately, the definition of `mainAsk`, the nominal-weight average, `U=#tops`, and the exact degree relation `f=U phi(N0)` give

\[
U\,\operatorname{mainAsk}
=a\Big[T\frac{\log x-\log x_1}{\varphi(N_0)}
 +U\{\log x_1-1-\operatorname{CS}(d)\}\Big].
\tag{5}
\]

Subtract (5) from (4) **before taking a norm**.  Every logarithmic and Chowla–Selberg main term cancels.  Thus

\[
\operatorname{rem}
=a\Big[T\{R_{N_0}(x)-R_{N_0}(x_1)\}+UR_1(x_1)\Big].
\tag{6}
\]

Equation (6) is precisely `Data.remainder_eq`; (4) and (5) are the actual intermediate equalities `asks` and `main` in its body.

## 3. The one normalized equation

For the datum used in `eventually_primeError_le_rpow`, `a>0`, `m>0`, and `T>0`.  Divide (6) only after the exact cancellation:

\[
\boxed{
R_{N_0}(x)
=\frac{m\,\operatorname{rem}}{m aT}
 +\left(R_{N_0}(x_1)-\frac UT R_1(x_1)\right).}
\tag{7}
\]

This is the source `calc` equality written without Lean record projections.  Keeping `m rem` together is important because `star_inequality` bounds exactly that product.

Let `L=log b`.  Since `budget=f a L^3`, the compact star inequality gives

\[
\frac{m\,\operatorname{rem}}{m aT}
\le \frac{fL^5}{mT}.
\tag{8}
\]

The unchanged datum has

\[
 f=\varphi(N_0)U,\qquad \frac UT\le L,
\tag{9}
\]

so (8) becomes

\[
\frac{m\,\operatorname{rem}}{m aT}
\le\frac{\varphi(N_0)L^6}{m}.
\tag{10}
\]

The division-free certificate records the same implication as

\[
m aT\{R_{N_0}(x)-e\}
\le \varphi(N_0)aT L^6,
\tag{11}
\]

assuming the second-scale correction satisfies
`T R_N0(x1)-U R_1(x1) <= T e`.  This form exposes every positivity premise and avoids field normalization inside the proof.

## 4. Exact two-scale scope

Fix `P` and `epsilon` with `0<epsilon/6` and `epsilon<1/100`.  The quantifiers are:

1. For every sufficiently large `x`, `exists_data P` supplies one `D` with `D.x=x`, `log D.x1=x^(epsilon/6)`, `(10^6 log x)^2 <= log D.x1`, `log(log D.b)=epsilon log x`, and `U/log D.b <= T`.
2. At that same `x`, put `t=10^6 log x` and `X=U/T`.  The native polar-window theorem supplies `u in [t,t^2]` with
   \[
   R_{N_0}(e^u)-X R_1(e^u)\le e^{-t}=x^{-10^6}.
   \]
3. Form `D'` by changing only `logX1` to `u`.  Because `t<=u<=t^2<=` the old `logX1`, the source reconstructs the `scale` field.  All of `m,a,T,U,f,L,x` are unchanged; the `x1`-dependent weight is deliberately recomputed.
4. Apply (7) to `D'`, then (10), the window inequality, `m>=sqrt(x)`, and `L=x^epsilon`:
   \[
   R_{N_0}(x)
   \le \varphi(N_0)x^{6\epsilon-1/2}+x^{-10^6}
   \le x^{8\epsilon-1/2}
   \quad\text{eventually}.
   \tag{12}
   \]

The last absorption may depend on the fixed `P` and `epsilon`.  It is not uniform in the auxiliary prime `d`, which is selected before this eventual estimate is invoked.  No sparse-window intersection and no old outer-shell `G(x)` statement is used.

## 5. Reduction-engine and obligation ledger

Root-reachable source graph, restricted to this step:

`Main.riemannHypothesis -> New.zeta_zeros_on_line -> New.grh -> eventually_primeError_le_rpow -> {exists_data, exists_window_sub_mul_le, star_inequality, Data.remainder_eq, magnitude facts}`.

The reduced human graph introduces (7) as a named adapter:

`{primeError_eq_sum, place count (3), mainAsk average} -> remainder_eq -> normalized identity (7) -> {star, density, polar window} -> (12)`.

This is exact cancellation and premise weakening at the scalar caller; it does **not** prune any of the five upstream suppliers.  The original and reduced graphs are both retained here.  Context keys include the compact source/toolchain pins, the same `P`, the same `D'`, and the same `x`; no theorem is cached merely by declaration name.

Native `rh_scan`, `rh_prune`, `rh_reduce`, `rh_auto`, and `rh_auto_frontier` were not executable: this workspace has no `lean`, `lake`, or `elan`, and the existing compact shared runner is resource-blocked.  The companion Lean file is therefore PREPARED only.  The old-pin CI runs `45577239749` and `45576756833` do not certify this compact-pin file.  No PASS or new axiom claim is made.

The pure-Python exact-rational certificate checks (7), (11), and negative controls; it is evidence only for the scalar algebra, not the source combinatorics, asymptotic quantifiers, or RH.

## Failed attempts / corrections

- Reusing the previous lane's outer-shell terminal criteria was rejected because the latest mission migrates the primary proof to the compact `primeError` route.
- Taking absolute values in (4) before subtracting (5) was rejected: it destroys the exact main-term cancellation and cannot yield (7) with the native constants.
- Treating `D'` as a wholly new independently chosen datum was rejected.  The source changes only `logX1`; the star inequality and remainder identity must be applied to this same updated record.
- The exponent is `8 epsilon - 1/2`, since the Lean expression is `8*epsilon + 2^-1 - 1`; it is not `8 epsilon + 1/2`.

## RESULT

The compact arithmetic–analytic interface is now reduced to the exact equation (7), with its source proof's two main-term equalities and all positivity/quantifier guards exposed.  Conditional on the already root-reachable `star_inequality` and polar second-scale window, the division-free inequality (11) yields the native one-sided exponent (12).

No unconditional root obligation was discharged: the deep star inequality, the polar window, `exists_data`, and the Landau/nonvanishing endpoint remain required.  External machine certification of the compact repository is distinct from this human reconstruction.

## RESUME HERE

In a pinned compact Lean 4.35.0 workspace, compile `2026-11-26_COMPACT_REMAINDER_NORMALIZATION.lean`; then run `rh_scan` on `Data.remainder_eq` and `eventually_primeError_le_rpow`, `rh_prune` the new scalar adapter, and apply `rh_reduce`/`rh_auto_frontier` at the actual caller.  Record the elaborated dependency/axiom output and confirm that the adapter uses the same updated `D'`.  If kernel replay remains blocked, the next mathematical task is a line-by-line human derivation of the scale-field reconstruction for `D'`, not another alternative prime criterion.

**HANDOFF TO:** formal audit, kernel extractor, integration, human editor, prime-window lane.
