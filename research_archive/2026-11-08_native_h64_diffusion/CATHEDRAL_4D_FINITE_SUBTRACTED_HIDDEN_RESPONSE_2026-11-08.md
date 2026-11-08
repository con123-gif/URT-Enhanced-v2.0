# Newton's Cathedral — a UV-finite 4D momentum-response difference for the native hidden quartets

**Date:** 8 November 2026. **Classification:** exact one-loop / Gaussian-reference response theorem for the *existing* native icosahedral hidden source with the independently derived H64 spatial diffusion coefficient and the original clock kinetic normalisation. **Verification:** `cathedral_hidden_4d_subtracted_response_2026_11_08.py` importing the unmodified 190-cochain/64-history/24-clock original model. No experimental data and no other researcher's code.

## 1. Existing operators and exact finite hidden-source weights

Retain the actual `20×12` icosahedron face–vertex incidence `C`, `Ph=P3+P5` (rank four each), original frozen rail `Δ=3/20−80π/(1053φ)`, and the quadratic hidden source `h=Ph[(Cx)⊙(Cx)]`. From the proved combinatorial identity

\[
Ph[(CC^T)\odot(CC^T)]Ph=6P_3+2P_5,
\]

a mean-zero, isotropic real Gaussian vertex reference with scalar two-point propagator `G` gives, after automatic hidden Wick-centring,

\[
\boxed{\operatorname{Cov}(h(x),h(y))
=(12P_3+4P_5)G(x-y)^2.}
\]

Transport through the original unique positive hidden Gibbs amplitude `Bhid=P3+ΔP5` gives

\[
\boxed{\operatorname{Cov}(B_{\rm hid}h(x),B_{\rm hid}h(y))
=(12P_3+4\Delta^2P_5)G(x-y)^2.}
\]

This is an **exact Gaussian moment identity** for the specified vertex covariance. It is not a claim that every source in the full nonlinear theory has the same equal-mass propagator.

## 2. Unique zero-momentum-subtracted one-loop kernel

From the separately proved original H64 Green–Kubo continuum, spatial diffusion is `D=r²/5`, where `r=π/e`. The existing quadratic clock kinetic provides temporal coefficient `r²`. For a Gaussian reference scalar mass-squared `m²>0`, take the canonical free denominator

\[
r^2\omega^2+D|\mathbf k|^2+m^2.
\]

Rescale the four momentum components as `(k_0,\mathbf k')=(r\omega,\sqrt D\mathbf k)`, so the integration Jacobian is exactly `1/(rD^{3/2})`. Define the zero-external-momentum-subtracted bubble

\[
B_R(P^2;m^2)=\lim_{\Lambda\to\infty}
\big[B_\Lambda(P^2;m^2)-B_\Lambda(0;m^2)\big],
\quad P^2=r^2p_0^2+D|\mathbf p|^2,
\]

where each `B_Λ` uses an identical spherically symmetric cutoff `|k|≤Λ` in the **rescaled canonical four-momentum**. The difference is ultraviolet convergent (the leading asymptotic term cancels). Feynman parametrisation `1/(AB)=∫_0^1 [xA+(1−x)B]^{−2}dx` yields the exact regulator-independent result

\[
\boxed{
B_R(P^2;m^2)
=-\frac1{16\pi^2 rD^{3/2}}
\int_0^1\ln\left(1+\frac{x(1-x)P^2}{m^2}\right)dx.
}
\]

For `a=P²/m²>0`, the integral can also be written in closed form:

\[
\int_0^1\ln[1+a x(1-x)]dx
=2\left[
\sqrt{\frac{4+a}{a}}\operatorname{artanh}\sqrt{\frac{a}{4+a}}-1
\right].
\]

At small momentum,

\[
B_R(P^2;m^2)=-\frac{P^2}{96\pi^2 rD^{3/2}m^2}+O(P^4),
\]

and at large `P²`,

\[
B_R(P^2;m^2)=-\frac{\ln(P^2/m^2)-2+o(1)}{16\pi^2rD^{3/2}}.
\]

This is a finite **difference of momentum responses**, not a claim that the unsubtracted positive covariance is finite at coincident spacetime points. The subtraction removes a local, momentum-independent contact ambiguity. It supplies a clear scheme, not an observational fit.

## 3. Exact 3/5 channel response and fixed ratio in the equal-mass reference

The two hidden eigensectors keep their original projectors, so their zero-momentum-subtracted connected two-point response is

\[
\boxed{\Delta\Pi(P)=(12P_3+4\Delta^2P_5)\,B_R(P^2;m^2).}
\]

Since each projector has rank four, the **per-hidden-mode** ratio of their response differences at any `P²>0` is

\[
\boxed{\frac{\Delta\Pi_3/4}{\Delta\Pi_5/4}
=\frac{3}{\Delta^2}=484178.1817929916\ldots .}
\]

This ratio is exact for the stated common Gaussian reference propagator and modular amplitude. Different propagator masses or physical source maps would change the momentum response ratio; this number is **not** an identified experimental mass ratio or measured gauge coupling.

## 4. Independent integral verification, not a fitted extrapolation

The verifier uses two independent computations:

1. exact one-dimensional Feynman-parameter integral and its closed analytical hyperbolic-arctangent expression;
2. independent four-dimensional **hard-ball cutoff** integration, reducing the angular integral with the exact `S³` weight proportional to `sqrt(1−u²)` and then numerical radial quadrature.

For `P²=m²=10` in the native dimensionless kinetic units,

| Canonical cutoff `Λ` | Subtracted bubble | Error to exact UV-finite value |
|---:|---:|---:|
| 20 | −0.006021921675 | `1.17964e−5` |
| 80 | −0.006033669800 | `4.8291e−8` |
| 320 | −0.006033717902 | `1.8919e−10` |
| `∞` | **−0.006033718091108** | exact scheme value |

The same script checks small-momentum asymptotics, original hidden-projector coefficients, and absence of mixed `3↔5` covariance. The independent numerical integral converges to the exact analytic expression without adjusting parameters.

## 5. Relation to the ongoing full Cathedral construction

- The **native** 64-history pair-flip Markov mixing fixes `D=(π/e)²/5` once the original geometric displacement observable is used, while the 24-clock action supplies `r²` temporal kinetic.
- The actual **all-five** geometric source portal and original face incidence determine which eight hidden modes receive the nonlinear source; no 13-state truncation is substituted.
- The face projection automatically removes the equal-face Gaussian mean; a separate one-loop response subtraction gives a finite momentum-dependent composite observable.
- The exact static Wick counterterms and positivity repair are documented in `CATHEDRAL_4D_WICK_STABILITY_COUNTERTERM_2026-11-08.md`. This new two-point subtraction does **not** by itself establish interacting multiloop renormalisation, cutoff-independent finite-volume measures or all physical field identifications; those require source-loaded dynamical consistency across every scale.

## Provenance and credit

Run with the **unmodified** original 7 November source alongside the verifier:

```bash
OPENBLAS_NUM_THREADS=1 python cathedral_hidden_4d_subtracted_response_2026_11_08.py
```

The test log records SHA256 checksums. The separate forest-gauge and energy–dual result communicated from **James Montgomery Lockwood** and colleagues is credited in the project's curvature-response bibliography: Deep Bhattacharjee, Ushashi Bhattacharya, James Montgomery Lockwood and Tristan Romanov, *One Cube Estimate Implies the Yang–Mills Mass Gap*, Hexagon preprint 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7. No external research manuscript or code has been imported here.