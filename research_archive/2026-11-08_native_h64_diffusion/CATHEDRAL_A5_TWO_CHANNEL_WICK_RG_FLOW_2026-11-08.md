# Newton's Cathedral — exact two-channel `A5` Wick counterterm flow for the full 50→8→12 source

**8 November 2026.** This theorem uses the **unchanged original** five-Platonic 190-cochain, 50-vertex, native 64-history, 24-clock source implementation and original frozen constants. All character/projection identities are checked exactly over `Q(√5)` by `cathedral_a5_two_covariance_rg_2026_11_08.py`. No empirical fitting and no third-party Yang–Mills code.

## 1. Why one Gaussian variance is not enough

The original all-five source portal `Q=Iico Eglobalᵀ` maps 50 vertex amplitudes to `W=3⊕5` in the native 12-icosahedral vertex carrier. Its two irreducible projectors `P3^v`, `P5^v` are determined by the original vertex Laplacian. Their all-five lifts are `E3E3ᵀ` and `E5E5ᵀ`, with `E3` and `E5` the original three and five columns of `Eglobal`.

For an `A5`-covariant *circular complex Gaussian* vertex reference with separate mode covariance

\[
\Gamma_{50}=a E_3E_3^T+b E_5E_5^T,\quad a,b\ge0,
\]

the face covariance is `S(a,b)=a C P3^v Cᵀ + b C P5^v Cᵀ`. This includes the actual 50-white-vertex reference of the companion theorem as `a=b=σ²`; importantly, its induced 12-vertex covariance is *not* the old 12-white-vertex reference.

The locally gauge-covariant hidden source is still the original `h_s=P_s[(C Q v)²]`, with charge 2 on every clock site. The two hidden quartets are rank-four spectral subspaces of the native dodecahedral dual Laplacian; `P3`, `P5` denote those **face** projectors, distinct from vertex `P3^v`, `P5^v`.

## 2. Exact covariance selection: no free channel coefficients

On the original 20-face dual graph, direct `Q(√5)` calculation gives

\[
\boxed{\begin{aligned}
P_3[S(a,b)\odot S(a,b)]P_3
  &=\left(3+\tfrac{6\sqrt5}{5}\right)abP_3,\\
P_5[S(a,b)\odot S(a,b)]P_5&=b^2P_5,\\
P_3[S(a,b)\odot S(a,b)]P_5&=0.
\end{aligned}}
\]

Hence the true source fluctuation covariance is

\[
\boxed{\operatorname{Cov}(h)
=2\left[\left(3+\tfrac{6\sqrt5}{5}\right)abP_3+b^2P_5\right].}
\]

The first channel requires a `3×5` fluctuation, while the second requires a `5×5` fluctuation. **A pure `3` fluctuation cannot populate the hidden five-sector**. This is a precise consequence of the existing native incidence and representation selection rules.

## 3. Exact mode-resolved gauge-invariant counterterm spectra

Let `M_s(a,b)=QᵀCᵀ[P_s⊙S(a,b)]CQ`. The **full 50×50 matrices** are

\[
\boxed{\begin{aligned}
M_3(a,b)
 &=\left(2+\tfrac{4\sqrt5}{5}\right)b\,E_3E_3^T
 +\left(\tfrac65+\tfrac{12\sqrt5}{25}\right)a\,E_5E_5^T,\\
M_5(a,b)&=\tfrac45 b\,E_5E_5^T.
\end{aligned}}
\]

Thus all other 42 dimensions have zero Wick counterterm, *regardless of `a,b`*. At `a=b=σ²` these formulas reduce exactly to the independently established full-50 white-source result.

For the native static history-eliminated quartic contact `c3 Q3+c5 Q5`, with `c3=2/9`, `c5=(7/32)Δ²`, the correction matrix `M=c3 M3+c5 M5` has only two nonzero eigenvalue families:

\[
\lambda_3(a,b)=c_3\left(2+\frac{4\sqrt5}{5}\right)b,
\quad
\lambda_5(a,b)=c_3\left(\frac65+\frac{12\sqrt5}{25}\right)a
+\frac45c_5b.
\]

The unique smallest **uniform scalar mass restoring the original quadratic lower bound** is consequently

\[
\boxed{m_{\rm ct}^2(a,b)=8\max\{\lambda_3(a,b),\lambda_5(a,b)\}.}
\]

**An exact channel switch occurs at**

\[
\boxed{\frac ab=
\frac{(2+4\sqrt5/5)-(c_5/c_3)(4/5)}{6/5+12\sqrt5/25}
=1.6666645202825923\ldots .}
\]

For smaller `a/b` the triplet sets the bound; for larger `a/b` the five-carrier sets it. This running-direction dependence is deduced from the original geometry and contact coefficients, not introduced through an experimental matching rule.

## 4. Wick composition across Gaussian covariance scales

For any local circular complex covariance `Γ`, normal ordering the original charged quartic is exactly

\[
:Q_s(v):_{\Gamma}=Q_s(v)-4v^\dagger M_s(\Gamma)v
+2\operatorname{Tr}[P_s(S_\Gamma\odot S_\Gamma)],
\quad S_\Gamma=CQ\Gamma Q^TC^T.
\]

Since `S_{Γ+Γ' }=S_Γ+S_{Γ' }`, the quadratic counterterm is **additive** in covariance increments:

\[
\boxed{M_s(\Gamma+\Gamma')=M_s(\Gamma)+M_s(\Gamma').}
\]

The vacuum term has the exact cross-contraction required for sequential Wick ordering:

\[
2\operatorname{Tr}P_s[(S+T)\odot(S+T)]
=2\operatorname{Tr}P_s[S\odot S]+2\operatorname{Tr}P_s[T\odot T]
+4\operatorname{Tr}P_s[S\odot T].
\]

Thus the local Wick normal-ordering operators form an exact *Gaussian covariance-addition semigroup*. The tensor counterterm cancels the induced quadratic Wick subtraction at each finite scale and is `U(1)` invariant on each of the original 24 clock sites. **This is an exact local source renormalisation identity**, not a claim that arbitrary interacting loop corrections are exhausted by normal ordering.

## 5. Direct original-model tests

The original source `cathedral_constructed_joint_dynamics_2026_11_07.py` was imported unchanged. Exact symbolic `A5` projectors were built from the integer icosahedral vertex and dodecahedral dual Laplacians. Each of the six independent coefficient identities in §§2–3 was checked over `Q(√5)`; numerical 50×50 original-portal spectra then matched for five independent covariance pairs:

| `(a,b)` | Exact minimal uniform restoring mass `m_ct²` | Dominant carrier |
|---|---:|---|
| `(1,1)` | `6.735741123555` | 3 |
| `(1,0.1)` | `4.041445541582` | 5 |
| `(0.1,1)` | `6.735741123555` | 3 |
| `(100,0.1)` | `404.144468280765` | 5 |
| `(0.3,2.3)` | `15.492204584177` | 3 |

The covariance-addition check also passed, including the quartic vacuum cross-contractions. At `a=b=0.5`, the mass coefficient is `3.367870561777628` as in the full-50 corrected source calculation.

**Executable source:** `cathedral_a5_two_covariance_rg_2026_11_08.py`; **PASS log and source SHA256**: `cathedral_a5_two_covariance_rg_2026_11_08.verify.log`. Run with NumPy, SciPy and SymPy, alongside the unchanged November 7 original model:

```bash
OPENBLAS_NUM_THREADS=1 python cathedral_a5_two_covariance_rg_2026_11_08.py
```

**Scope:** Finite geometry and exact Gaussian normal-ordering flow for the original all-five nonlinear source, with no invented source map. To turn this into the full interacting quantum continuum one must determine the actual scale-dependent covariance from the coupled transfer and control non-Gaussian vertex feedback. The theorem identifies precisely the required two-channel counterterm structure; it does not equate it with an observed particle mass.

**Attribution:** The separate forest-gauge and energy–dual Yang–Mills research of James Montgomery Lockwood, with Deep Bhattacharjee, Ushashi Bhattacharya and Tristan Romanov, remains properly cited in `research_archive/2026-11-08_curvature_response/`. No outside manuscript or source code is reproduced here.