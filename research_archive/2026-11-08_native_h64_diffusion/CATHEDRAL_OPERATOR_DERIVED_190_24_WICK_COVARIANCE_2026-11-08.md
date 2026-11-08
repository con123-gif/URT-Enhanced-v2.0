# Newton's Cathedral — 190×24 operator-derived Gaussian source covariance and exact gauge-compatible Wick tensor

**8 November 2026.** This calculation removes the two externally specified Gaussian variances from the exact two-channel source/Wick theorem. Instead it derives the *zero-source Gaussian reference covariance* from the **original November seven full-five-geometry, 190-cochain and 24-clock action**, keeping all 64 histories (which decouple at quadratic order) and the original 50→8→12 nonlinear portal. This is a finite-cutoff operator calculation, not a fitted particle mass.

## 1. Native positive Hessian determines the Gaussian reference uniquely

Use exactly the archived geometric quadratic energy for charged complex fields `z_j∈C^190` with `j∈Z/24Z`,

\[
\boxed{S_{\rm free}(z)=\frac12\sum_{j=0}^{23}
\big(\langle z_j,(D_{190}^2+C_{\rm bridge})z_j\rangle
+r^2\|z_{j+1}-e^{i\theta}z_j\|^2\big),}\quad
r=\pi/e,\ \theta=2\pi/\phi^2.
\]

Here `D190` is the genuine oriented Hodge–Dirac of all five Platonic solids, `Cbridge=Ctop+Cbulk` the **previously specified** positive five-solid mixing (not newly invented here), and the clock has charge one. The source/historical 64-field contact starts at order three, and the KMS-source contact starts at quartic order, so this is the **actual Hessian at the zero-source configuration** of the existing joint action.

For each Fourier mode `m`, define

\[
\ell_m=2-2\cos(\theta-2\pi m/24),\quad
K_m=D_{190}^2+C_{\rm bridge}+r^2\ell_m I_{190}.
\]

The irrational golden link phase makes all `\ell_m>0`; because `D190²` and `Cbridge` are positive semidefinite, all `K_m` are strictly positive. The original model's complex Gibbs reference `p(z)∝exp(-ηΔ Sfree)` has **uniquely determined** local cochain covariance

\[
\operatorname{Cov}(z_j)=\frac{2}{24\eta_\Delta}\sum_{m=0}^{23}K_m^{-1}
\]

(the factor `2/η` is due to the model's `1/2` coefficient for *complex* Gaussian amplitudes). Let `R:C^190→C^50` extract exactly the 50 original vertex cochains, and let `Q=Iico Eglobalᵀ` be the **unchanged rank-eight all-five portal**. Thus

\[
\boxed{\Gamma_{50}=\frac{2}{24\eta_\Delta}\sum_m R K_m^{-1}R^T,
\quad\Gamma_{12}=Q\Gamma_{50}Q^T,
\quad S=C\Gamma_{12}C^T.}
\]

These matrices follow only from the **already specified** source and clock action, with no independently chosen Gaussian `a,b`.

## 2. What the original operators actually produce

Project `Γ12` to the ordered original eight-moment `3⊕5` basis. The original full `190×190` operator gives:

- Mean variance in the three-dimensional carrier: `0.077044310262195`.
- Mean variance in the five-dimensional carrier: `0.060768469064209`.
- Off-diagonal `3↔5` block Frobenius norm: **`0.002475096471260`** (nonzero).
- Five-carrier anisotropy Frobenius norm: **`0.000914007458797`** (nonzero).
- Exact numerically computed eigenvalues of the eight-dimensional covariance: **`0.060267846561` (2), `0.060975139641` (3), `0.077171388021` (3)**.

Because the original five-solid mixing is not globally equivariant under the icosahedral `A5` action, the native Gaussian covariance **is not** `aP3^v+bP5^v`. Accordingly the preceding two-channel `A5` formula is a rigorous special case but cannot be inserted unchanged as the actual full-coupled Gaussian reference.

The native face covariance has **nonconstant diagonal** from `0.152342520533653` to `0.158243059974375`. Consequently, the real-Gaussian mean `P_s diag(S)` no longer vanishes automatically: its norms are `0.008344622902386` and `0.000914007458797` in the two sectors. For the actual circular *complex* charged fields, however, `E[z_f^2]=0` by their phase symmetry, so the charged hidden quadratic source has zero mean even in this anisotropic case. This is a necessary precision correction to the previous symmetry-based centring language.

## 3. Exact general-covariance local complex Wick matrix

With **the original** `h3=P3[(C Q v)^2]`, `h5=P5[(C Qv)^2]`, and all-five source `v∈C^50`, Gaussian Wick's theorem says for **any** circular complex covariance `Γ50`

\[
\boxed{\operatorname{Cov}(h_s,h_t)=2P_s[(S\odot S)]P_t.}
\]

In the operator-derived source, even the mixed covariance is nonzero:

\[
\|P_3(S\odot S)P_5\|_F=0.000215350054976.
\]

This is a concrete five-solid interaction effect in the source fluctuations, not a claim that the *quadratic* native H64 hidden generator has mixed eigenspaces.

The correct **50×50 gauge-invariant Hermitian** local Wick counterterm is

\[
M_s=Q^T C^T [P_s\odot S] C Q,\quad
M=c_3M_3+c_5M_5,
\quad(c_3,c_5)=(2/9,7\Delta^2/32).
\]

By the Schur product theorem, `P_s ⊙ S` is positive semidefinite, hence `M_s` and `M` are positive semidefinite. They have rank at most eight on the original 50-vertex source. No hidden fit coefficient is needed. The local source quartic's exact complex Wick form is

\[
\sum_sc_s:Q_s: = \sum_s c_s Q_s-4v^\dagger Mv
+2\sum_s c_s\operatorname{Tr}[P_s(S\odot S)].
\]

The *smallest uniform scalar coefficient restoring the original quadratic lower bound* is the spectral value

\[
\boxed{m_{\rm ct,\,native}^2=8\lambda_{\max}(M)
=\mathbf{0.409436408060270}.}
\]

Here `S` is the **specific 24-clock/190-Hodge zero-source Gibbs covariance** just derived. This is a derived model-specific finite-cutoff value, **not** an observed particle mass. The full tensor source correction `+4v† Mv`, with the corresponding scalar vacuum subtraction, restores the original positive local quartic exactly. The local correction is invariant under the original `v_j→e^{iα_j}v_j` gauge rotation, and the same positive Schur-complement transfer mechanism still applies to the original unmodified action.

The exact source-modular/energy–dual quadratic response, using `Bhid=P3+ΔP5` and `Lface^†=P3/3+P5/5` on the hidden carrier, is computed from the same covariance to be **`0.070966483989940`** in model units; no `a,b` were chosen to obtain it.

## 4. Verification and source boundary

The code `cathedral_native_190_24clock_wick_covariance_2026_11_08.py` imports the **original** all-five 190/64/24 Python model unchanged. It sums the 24 exact Fourier-sector inverses (each 190×190) rather than replacing the original bridge with a toy operator. It checks the positive Hessian, all eight projected eigenvalues, failure of 3/5 Gaussian block reduction, nonconstant face variance, nonzero hidden-source mixed covariance, the general 50×50 Wick tensor's positive spectrum, exact counterterm cancellation and `U(1)` invariance on random charged fields. `cathedral_native_190_24clock_wick_covariance_2026_11_08.verify.log` records all numerical checks and the original-source SHA256.

\[
\text{Reproduce: }\quad
\texttt{OPENBLAS\_NUM\_THREADS=1 python cathedral\_native\_190\_24clock\_wick\_covariance\_2026\_11\_08.py}
\]

**Research consequence:** The geometry and clock now fix a *particular finite-cutoff Gaussian source counterterm* from the original coupled operator. The exact two-channel `A5` covariance flow remains useful as a symmetry-controlled limit, but the **actual** five-solid bridge creates cross-carrier Gaussian correlations and demands the general-covariance Wick formula. A full interacting quantum continuum requires using the source-coupled, scale-dependent covariance rather than silently replacing it by its zero-source Gaussian Hessian. The source-loaded H64 operator, D6→H3, Golay/Leech and other Cathedral layers are not removed or rewritten by this computation.

**Attribution:** The separately shared forest-gauge and energy–dual work of James Montgomery Lockwood and colleagues is cited in the Cathedral curvature-response bibliography. No external manuscript or code was copied into these results.