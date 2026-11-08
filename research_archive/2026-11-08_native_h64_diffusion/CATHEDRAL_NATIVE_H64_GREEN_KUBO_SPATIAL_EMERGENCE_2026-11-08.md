# Newton's Cathedral — Native 64-history fluctuations generate three-dimensional diffusion and the 3⊕5+radial carriers

**Date:** 8 November 2026. **Status:** Exact finite Markov/history identities, a proved functional central-limit theorem for a specified native observable, and direct regression against the original five-Platonic 190-cochain / 64-history / 24-clock action. No empirical parameters. No external research code. **Primary verifier:** `cathedral_native_history_diffusion_2026_11_08.py`.

## 1. The original history operator itself is a reversible Markov generator

Use the **existing** six-icosahedral-axis, 64-signed-history operator, without reducing it to 13 visible modes:

\[
L=H_{64}=15I_{64}-\sum_{1\le i<j\le6}X_iX_j
  =\sum_{i<j}(I-X_iX_j).
\]

Here `X_i` flips bit/sign `i` in a sign vector `s∈{−1,+1}^6`. Thus `−L` is exactly the continuous-time Markov generator with unit jump rate for every pair-flip. Total rate is 15. The two 32-state parity classes are invariant and each is irreducible, with uniform reversible stationary law `ν_±`. **Condition on one parity component**: only then does the generator have constant functions as its full kernel, as required by the standard energy–dual inequality.

For a Walsh monomial `w_A(s)=∏_(i∈A) s_i` of degree `k=|A|`, precisely `k(6−k)` pairs flip its sign. Therefore

\[
Lw_A=2k(6-k)w_A.
\]

The full spectrum is `0(2),10(12),16(30),18(20)`. Restricted to either parity component it has kernel dimension one and spectral gap **10**. All claims are verified against the exact original `Hbits` matrix of `cathedral_constructed_joint_dynamics_2026_11_07.py`, not a proxy.

## 2. How 3 spatial directions and five quadrupoles arise from the original icosahedral axes

Let `u_1,…,u_6∈R³` be one unit vector from each antipodal vertex pair of the regular icosahedron; the genuine golden-ratio coordinates satisfy

\[
\sum_{i=1}^6 u_i u_i^T=2I_3,
\qquad (u_i\cdot u_j)^2=\tfrac15\quad (i\ne j).
\]

The **original native spatial readout** is

\[
x(s)=\sum_{i=1}^6s_i u_i\in\mathbb R^3.
\]

Each component is a degree-one Walsh observable, so `Lx=10x`. On either parity component,

\[
E_ν x=0,\quad E_ν xx^T=2I_3,\quad E_ν[x(t)x(0)^T]=2e^{-10t}I_3.
\]

Form the *trace-free* quadratic tensor `q(s)=x(s)x(s)^T−|x(s)|² I_3/3`. Its five independent orthonormal Cartesian components constitute a vector `Q(s)∈R⁵`. The constant contribution `∑_iu_iu_i^T=2I` disappears under trace removal, leaving pure **degree-two** Walsh functions. Therefore

\[
LQ=16Q,\quad E_ν Q=0,\quad E_ν QQ^T=\tfrac{32}{5}I_5,\quad E_ν xQ^T=0.
\]

The quintet covariance follows from the icosahedral rotational symmetry and the exact fourth moment `E|x|⁴=48`, giving `E||Q||²=(2/3)·48=32`. Consequently the **same original H64 Markov generator** contains the `3⊕5` spatial tensor readout at relaxation rates **10 and 16**. The rank-eight source modes are computed, not selected by inserting a spherical heat operator.

**Do not erase the radial carrier:** `R(s)=|x(s)|²−6` is a distinct degree-two scalar with

\[
LR=16R,\qquad E_νR=0,\qquad E_νR^2=12,\qquad E_ν[RQ]=E_ν[Rx]=0.
\]

Thus the full degree≤2 *geometric tensor observables* include a **3-vector, 5-quadrupole, and 1 radial scalar**. The existing selected eight-harmonic portal uses the trace-free `3⊕5`; it does **not** make the radial scalar mathematically nonexistent. The history also contains further degree-one `3′` directions. No identification of `R` with a physical graviton, nor with the separate 13-cell radial eigenvalue 13, is claimed by these identities.

## 3. Exact energy–dual response and three-dimensional diffusion: a full proof

Fix either parity class and define `L†` to be the inverse on centred observables. The native vector solves the Poisson equation exactly:

\[
L^\dagger x_a=x_a/10.
\]

Consequently, for every Cartesian component,

\[
\boxed{\chi_L(x_a)^2=\langle x_a,L^\dagger x_a\rangle_{ν}
=\frac{2}{10}=\frac15.}
\]

The energy–dual Cauchy–Schwarz inequality is sharp for the source `x_a`:

\[
|\langle x_a,F\rangle_ν|^2\le\frac15\langle F,LF\rangle_ν,
\]

with equality for `F` proportional to `x_a/10`. Similarly, `χ_L(Q_b)^2=(32/5)/16=2/5` and `χ_L(R)^2=12/16=3/4`. This applies the standard energy–dual identity emphasised in the external Yang–Mills programme, **not** an adoption of that programme's proof or model.

Use the **frozen primitive radial factor** `r=π/e` as the readout velocity and define, for the native continuous-time Markov history `S_t`,

\[
Y_t=r\int_0^t x(S_u)\,du.
\]

The exact two-time covariance gives, for all `t≥0`,

\[
\boxed{E_ν[Y_a(t)Y_b(t)]
=\delta_{ab}\left[\frac{2r^2}{5}t-\frac{r^2}{25}(1-e^{-10t})\right].}
\]

**Functional central-limit theorem.** On either irreducible parity class, with stationary start,

\[
\boxed{\varepsilon Y_{t/\varepsilon^2}
\;\Rightarrow\; \sqrt{2D}\,B_t
\quad\text{in }C([0,T],\mathbb R^3),\quad
D=\frac{r^2}{5}=\frac{\pi^2}{5e^2}
=0.267141141410950\ldots .}
\]

**Proof (finite-state martingale method).** Set `u_a=x_a/10`, hence `Lu_a=x_a`. Dynkin's formula makes `M_a(t)=u_a(S_t)−u_a(S_0)+∫_0^t x_a(S_v)dv` a square-integrable martingale. The corrector `u_a(S_t)−u_a(S_0)` is bounded uniformly in `t` because the chain is finite. By reversibility, its ergodic quadratic-variation rate satisfies

\[
\lim_{t\to\infty}t^{-1}\langle M_a,M_b\rangle_t
=2\langle u_a,Lu_b\rangle_ν
=\tfrac25\delta_{ab}.
\]

Bounded jumps, ergodicity and the martingale functional CLT give convergence to a Brownian vector with covariance `(2/5)t I`; multiply by `r` to obtain `2D t I`. The corrector vanishes under diffusive scaling. This yields a **positive isotropic spatial heat semigroup** on `R³`, `T_t=exp(tD Δ_R³)`, with the canonical positive factorisation `T_t=B_t†B_t`, `B_t=exp[(tD/2)Δ_R³]`. Nothing here assumes an independent continuum spatial Laplacian: it is the universal homogenised generator of the original finite native history readout. **The definition of spatial displacement as the time-integrated native icosahedral vector remains a specified observable/readout**, not an assertion that the universe is already identified with this stochastic model.

## 4. Golden phase and 24-clock give a calculable frequency-resolved response

Retain the original URT golden per-link angle `θ=2π/φ²` and the historical 24-fold mode `m=9`. Its residual is

\[
\delta_\mathrm{gold}=\theta-\frac{2\pi(9)}{24}
=0.043768739536308\ldots.
\]

The frequency-filtered native vector susceptibility is a direct resolvent/Green–Kubo calculation:

\[
D(\delta)=r^2\operatorname{Re}\langle x_a,(L-i\delta)^{-1}x_a\rangle_{ν}
=\frac{20r^2}{100+\delta^2}.
\]

At the golden residual `D(δ_gold)=0.267136023879300…`, ratio to zero-frequency `D(0)=π²/(5e²)` equals `100/(100+δ_gold²)=0.999980843341379…`. This is a **linear-response measurement** of the primitive golden phase acting on the native mixing history. It is not a claim that a chosen oscillatory source must redefine the unmodulated macroscopic spatial diffusion or that the 24-clock and Golay's 24 code coordinates are equivalent.

## 5. Direct compatibility with all five Platonic solids and the nonlinear hidden modes

The original 7 November construction has a real orthonormal `50×8` collective harmonic matrix `Eglobal`, the matching icosahedral `12×8` matrix `Iico`, and an original `12×50` portal `Plinear=Iico Eglobal^T`. Normalise the eight original history observables into `a(s)=(x(s)/sqrt(2), Q(s)/sqrt(32/5))` and define the history-generated *whole-five-solid* vertex field `v(s)=Eglobal a(s)` and the matching 12-vertex field `z(s)=Iico a(s)`.

Then for **all 64 histories**, exactly,

\[
\boxed{Plinear\,v(s)=z(s).}
\]

Moreover, for every other linear portal `P` obeying `P Eglobal=Iico`, the equality `Pv(s)=z(s)` is identical. Thus **the earlier off-subspace minimum-norm ambiguity disappears on the genuine history-generated eight-mode support**; the value of the source is fixed there even though the portal remains non-unique on orthogonal geometric degrees of freedom. The whole 190-cochain carrier and all 50 vertex directions are retained, not removed.

With the **original face–vertex incidence** `C` and hidden projectors `P3,P5`, the previously constructed quadratic sources `h3=P3[(Cz)^2]`, `h5=P5[(Cz)^2]` are both **nonzero and rank four** across these 64 history-generated inputs (verified against the archived code). The exact positive hidden Gibbs factor `Bhid=P3+ΔP5` from the previous modular theorem then transports them as `U_h(h3+Δh5)` and the original full 24-clock Schur complement remains positive.

**Boundaries of the present theorem, not a restart:** (i) this provides a uniquely determined, finite-history *observable* and spatial stochastic scaling; it does not prove that the primitive scalar spiral by itself forces the six-bit jump rates or the velocity readout, (ii) alternative A5-equivariant quadratic *maps* may still be chosen off the specified face-local incidence construction, and (iii) a stochastic spatial scaling plus an extant periodic 24-clock is not by itself a fully interacting Lorentzian/quantum gravitational theory. These qualifications locate the remaining mechanisms, while the formulas, carrier ranks, response constants and spatial diffusion statement above are now proved.

## Source provenance and reproduction

- The only algorithmic source imported is the **original Cathedral-generated** `cathedral_constructed_joint_dynamics_2026_11_07.py` beside this verifier. No Lockwood manuscript or source code was copied.
- The standard energy–dual Cauchy–Schwarz inequality was highlighted in material shared from the research programme involving **James Montgomery Lockwood**, with **Deep Bhattacharjee, Ushashi Bhattacharya and Tristan Romanov**. Cite: *One Cube Estimate Implies the Yang–Mills Mass Gap*, Hexagon preprint 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7. The independent Markov/Green–Kubo proof here is not their claimed forest-gauge result and carries no endorsement.
- Run from this directory: `OPENBLAS_NUM_THREADS=1 python cathedral_native_history_diffusion_2026_11_08.py`. It verifies original 64 `Hbits`, all-five geometry/portal, hidden `4+4` source ranks, parity-restricted spectral identities and exact numerical constants. Requires NumPy, SciPy, and the already committed original joint model script.