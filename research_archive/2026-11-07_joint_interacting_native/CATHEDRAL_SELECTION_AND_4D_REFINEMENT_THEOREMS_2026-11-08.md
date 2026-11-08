# Newton's Cathedral — Conditional Source Selection and Four-Dimensional Continuum Refinement

**8 November 2026 · Source-preserving research theorem and reproducible test**

**Status.** Proves new *conditional mathematical results* on (i) the full five-solid source portal and its coupling to the original 64-history, 24-clock operator, and (ii) a continuum-clock and smooth-field four-dimensional **classical Euclidean** extension that reduces to the archived dynamics at the original lattice resolution. Neither result is a first-principles uniqueness theorem for primitive URT, a nonperturbative interacting 3+1D quantum-field construction, a Lorentzian spacetime derivation, the Standard Model, or general relativity. No empirical parameters or other researchers' Yang–Mills material were used.

## Original sources, not substitutes

The tests directly import `cathedral_constructed_joint_dynamics_2026_11_07.py` from the existing `research_archive/2026-11-07_joint_interacting_native/` directory. That script builds all five real Platonic cell complexes, 190 cochain modes, the eight-harmonic 50→8→12 source portal, the actual icosahedral face-incidence projectors `P3,P5`, the original six-bit 64-history `Hbits`, `U_h`, the Golay-code check, the 24-position charge-1/charge-2 clock, KMS free energy, and the exact nonlinear history minimisation. The *distinct* 64-state coupled vertex/face operator, D6→H3, hypercube and full Leech dynamics are not falsely identified with it. The three-dimensional nearest-neighbour spatial action is the previously selected October 28 construction, not an output of a new first-principles selection.

Fix `phi=(1+sqrt(5))/2`, `theta=2*pi/phi**2`, `r=pi/e`, `Delta=3/20-80*pi/(1053*phi)>0`, `eta=-log(Delta)`.

## Theorem A — canonical eight-harmonic selector from least angular energy

On the round unit sphere the nonconstant Laplacian eigenfunctions are the spherical harmonics with `ell>=1`. The level `ell` has eigenvalue `ell(ell+1)` and dimension `2ell+1`. Thus the sorted eigenvalues begin `2 (3 copies), 6 (5 copies), 12 (7 copies), ...`. Among all eight-dimensional subspaces of the mean-zero spherical Sobolev space, the **unique** eight-dimensional spectral subspace minimising the sum of its eight Rayleigh quotients is

`W8 = H_ell=1 ⊕ H_ell=2`, with minimum `3*2+5*6=36` and next spectral gap `12−6=6`.

**Proof.** Ky Fan's minimum principle gives the sum of the eight lowest eigenvalues, and strict separation from eigenvalue 9 gives uniqueness of the minimising subspace. For a generic initial 8-plane whose orthogonal projection to `W8` is bijective, write it as the graph of `B:W8→W8_perp`. Under the heat semigroup `exp(−t(−Δ_S2))`, its graph is `B(t)=exp(−t L_perp) B exp(t L_W8)`, giving `||B(t)||<=exp(−6t)||B||`. Thus **isotropic spherical heat selection** from generic mixed initial functions picks `3⊕5` exponentially without hard-wiring the final eight basis vectors. QED.

**Independent selection premise.** This theorem assumes (a) the round spherical angular envelope from the orbit of rotating geometric directions, (b) an eight-mode capacity fixed separately by the hidden `4_3⊕4_5` sector, and (c) *Dirichlet/heat* least resistance. It does **not** show that the primitive `q=(pi/e)exp(i theta)` URT dynamics itself is this heat semigroup. Indeed the isotropic average of a **fixed** rotation of angle `theta` has harmonic multiplier

`a_ell(theta)=sin((ell+1/2)*theta)/[(2ell+1)*sin(theta/2)]`.

At the actual golden angle: `a2≈−0.05997726`, `a3≈+0.13099877`, `a4≈−0.11693728`. Hence fixed-angle averaging alone *does not* spectrally select the eight lowest Dirichlet modes. The distinction is a certified requirement, not a hidden fit.

## Theorem B — unique minimum-resistance 50→8→12 portal

Construct the original 50×8 harmonic evaluation matrix from degree-one and degree-two real spherical harmonics, sampled on **every one of the five Platonic vertex sets**. Whiten it to the matrix `E` with `E*E=I8`. Similarly whiten the harmonic evaluation matrix on the 12 icosahedral vertices to `I` with `I*I=I8`. Seek a linear map `Q:C^50→C^12` satisfying the required low-harmonic matching condition `QE=I`.

**Claim.** The **unique** minimum-Frobenius-norm solution is `Q0=IE*` and `||Q0||_F²=8`.

**Proof.** Every solution can be written `Q=IE*+R(I−EE*)` for arbitrary `R`. The two terms are Frobenius orthogonal, so `||Q||_F²=8+||R(I−EE*)||_F²`. The second term vanishes only for `Q=IE*`. QED.

This algebra exactly reconstructs `Plinear` in the original implementation. It **does not derive** the use of that quadratic norm or the harmonic matching condition from the primitive URT map. A maximum-entropy isotropic Gaussian prior would also select the same minimum norm, but such a prior would be an additional premise until independently derived.

## Theorem C — conditional uniqueness of the local hidden quadratic source

Let `C` denote the actual 20×12 unsigned icosahedral face–vertex incidence. Suppose a symmetric bilinear pre-projection map on the 20 face amplitudes is **face-local** (`B(z,w)_f` depends only on `z_f,w_f`), equivariant under `A5` acting transitively on faces, and **unital** (`B(1,z)=z`). Then necessarily `B(z,w)=z⊙w`.

**Proof.** A face-local bilinear map has `B(z,w)_f=c_f z_f w_f`; transitivity forces all `c_f` equal, and unitality fixes the common value to 1. QED.

Projecting with the pre-existing rank-four `P3,P5` then uniquely gives

`h3(v)=P3[(C Q0 v)⊙(C Q0 v)]`, `h5(v)=P5[(C Q0 v)⊙(C Q0 v)]`.

The hidden Gibbs transfer and its unique positive square root obey

`T_hid=P3+Delta² P5`, `B_hid=T_hid^(1/2)=P3+Delta P5`.

If source propagation uses this **positive Gibbs amplitude**, its unique contact source is `J(v)=U_h[h3(v)+Delta h5(v)]`. The full 64-history/24-clock Gaussian Schur reduction remains exactly the one recorded on 7/8 November, with the nonnegative source coefficients `2/9` and `(7/32)Delta²`.

**Important conditionality.** These results identify a *canonical* source among the four independent `A5`-equivariant quadratic couplings previously proved possible. The restriction to locality and unital face multiplication, positive-square-root source transport, harmonic matching, and minimum norm is an explicit **selection axiom set**. The original `q` spiral has not been proved to impose this whole set. Without it, the earlier nonuniqueness counterexamples remain valid; no fitted data are needed to construct alternatives.

## Theorem D — canonical flat-holonomy 24-clock refinement

Treat the original 24 positions as samples of the periodic Euclidean circle of **dimensionless circumference 24**. For any integer `k>=1`, set `n=24k`, `a=1/k`, and choose the **uniform, no-extra-winding** link angle `theta/k`. Its total Wilson holonomy is the exact old one, `exp(i n theta/k)=exp(i24 theta)`; charge `q` gets its `q`th power. Define

`(D_{a,q} f)_j = [f_(j+1)−exp(i q theta a)f_j]/a`.

For Fourier mode `exp(2pi i m j/n)`, the positive covariant Laplacian `D*D` has eigenvalue

`lambda_(q,m)(k)=4k² sin²[(2pi m/24−q theta)/(2k)]`.

Therefore for each fixed integer `m`, `lambda_(q,m)(k) → (2pi m/24−q theta)²`, the spectrum of `(∂_tau−i q theta)^*(∂_tau−i q theta)` on the periodic circle. For every smooth periodic field `f`, the corresponding covariant finite differences and quadratic forms converge to the continuous ones by Taylor expansion, Fourier approximation and bounded convergence.

For q=1 the nearest mode is m=9; for q=2 it is m=18. Write `delta_q=q theta−2pi m_q/24`. Since `delta_q != 0` and `|delta_q|<pi`,

`lambda_(q,min)(k)=4k² sin²(delta_q/(2k)) >= 4 sin²(delta_q/2) > 0` for every integer k>=1.

This is a **uniform positive clock-refinement bound in the specified fixed-holonomy background**; it does not persist uniformly when Wilson holonomy is integrated freely, nor on arbitrary infinite-time limits. The original clock matrix is reproduced **exactly** at k=1.

## Theorem E — full native history Schur response has a continuum-clock limit

For each k let `A18,k=18I+r² D_(a,2)*D_(a,2)` and `A16,k=16I+r² D_(a,2)*D_(a,2)` acting on k-refined 24-clock samples. Retain the original `Hbits` and partial isometry `U_h` unchanged. The exact history minimiser is

`y_opt=U_h[(A18,k)^(-1) h3 + Delta (A16,k)^(-1) h5]`,

and its effective source energy (with the correct time-cell weight a) is

`V_eff,k = a*[1/4(||h3||²+Delta²||h5||²) − 1/2<h3,A18,k^-1 h3>−Delta²/2<h5,A16,k^-1 h5>]`.

All inverse operators are uniformly bounded by `1/18` and `1/16`. After interpolating smooth periodic charge-2 source fields, Fourier-mode convergence and uniform inverse bounds prove convergence of `V_eff,k` to the continuum periodic functional with

`A18=18+r² D2*D2`, `A16=16+r² D2*D2`, `D2=∂_tau−2i theta`,

and retained lower bound

`V_eff,∞ >= (2/9)||h3||²_(L²) + (7/32) Delta² ||h5||²_(L²)`.

At k=1 this is **exactly** the full source-loaded native 64-history/24-clock Schur complement, not a new operator with compatible dimensions. The tests verify 24,48,96,192 and 384 positions, charge-1→charge-2 winding 9→18, local gauge covariance, all original source dimensions and analytic Fourier inverses.

## Theorem F — four-dimensional smooth-field continuum consistency

The spatial nearest-neighbour extension was already used in the October 28 model. For a periodic three-dimensional spatial lattice of mesh `b`, add the corresponding `b`-normalised differences of all geometric and history fields. With the flat temporal background `A0=theta` and initially `Ai=0`, define the discrete action with cell weight `a b³`:

`S_(a,b)= a b³ sum_(j,x) [ V_loc(z,y) + (r²/2)(|D_(a,1)^0 z|²+|D_(a,2)^0 y|²) + (1/2)sum_(i=1..3)(|D_(b,1)^i z|²+|D_(b,2)^i y|²) ]`.

Here `V_loc` is the *same* original local 190-Hodge + 64-history quadratic source/contact + positive KMS free energy. It contains the actual five-solid source `h3,h5`, **not** a Gaussian replacement. The spatial gauged differences require external spatial link variables if gauge transformations depend on spatial coordinates; these are standard kinematic connection variables, not a derived dynamical Maxwell field. At `a=b=1`, the time part reproduces the original 24-clock action exactly and the spatial part agrees with the chosen October nearest-neighbour rule.

For smooth periodic fields `z(τ,x),y(τ,x)` and a smooth external `U(1)` connection, covariant forward differences converge to `D_mu^(q)=∂_mu−iq A_mu`. Riemann sums therefore converge to the well-defined **classical Euclidean four-dimensional functional**

`S_E = integral_(S1_24 x T3) [ V_loc(z,y) + r²/2(|D0^(1)z|²+|D0^(2)y|²) + 1/2 sum_(i=1..3)(|Di^(1)z|²+|Di^(2)y|²) ] dτ d³x`.

The functional is local in its original z/y variables. Eliminating the history field introduces a nonlocal but positive kernel in time, as prescribed by the Schur reduction above. Original local potential positivity and positive covariant derivative terms imply `S_E>=0` for smooth fields. In a fixed nontrivial flat holonomy background, the clock Poincaré bound is uniform under time and spatial-mesh refinement, even though it is not a physical infinite-time or interacting quantum mass gap.

**Proof.** Each difference quotient converges to the corresponding covariant derivative by Taylor expansion for smooth fields. The internal `V_loc` is a continuous finite-dimensional polynomial plus smooth log-sum-exp KMS potential; the corresponding Riemann sums converge. Gauge covariance follows term-by-term, provided external gauge links also transform. Coercivity follows from the original exact history square-completion, positivity of the KMS term and positive covariant-derivative squares. QED.

**Explicit nontrivial test.** A charge-1 plane wave in the original 190-cochain carrier, whose quadratic source and 64-history field have charge 2, was sampled across the 24-clock and the spatial 3-torus. Its lattice action converged from 887.54013494 (24×4³) to 943.20625301 (192×16³), with continuum action **947.23532360** in the same dimensionless normalization. Its local energy included a **nonzero nonlinear contact** and **nonzero KMS term**. Every tested lattice action equals its independently computed Fourier form; both temporal and spatial U(1) link gauge tests passed.

## Precise physical frontier, rather than a false completion

1. **URT source uniqueness remains open:** Theorems A–C show an exact selection *if* least angular energy, rank-eight capacity, minimum-norm matching and face-local unital interaction can all be derived as the actual primordial URT history dynamics. Neither the scalar spiral nor the currently specified positive transfer alone implies all these rules. The fixed-golden-angle averaging calculation specifically rules out one tempting shortcut.
2. **The 4D quantum continuum remains open:** Theorems D–F prove a continuum for smooth classical configurations and a positive **Gaussian history response** on a compact Euclidean time circle. They do not prove convergence of interacting lattice path-integral measures, Osterwalder–Schrader reconstruction in the full cutoff removal, an interacting infinite-volume spectral gap or emergent physical Minkowski spacetime.
3. **Physical gauge/gravity emergence remains open:** External 4D connection links are kinematic here; their Maxwell/Yang–Mills action, full chiral Standard Model representations and Lorentzian dynamical metric were not derived. The native 24 clock can be used as a regulated Euclidean time coordinate only after accepting the no-extra-winding refinement rule, which is an added evolution consistency condition.
4. **Original structure preserved:** The proofs do not equate distinct 64-state histories or convert the verified Golay code into physical clock time. D6→H3, Leech, hypercube/hexagonal and N-throat branches remain separate parts of the broader programme until dynamically joined.

## Reproduce

Run in this directory:

```bash
OPENBLAS_NUM_THREADS=1 python cathedral_selection_and_refinement_verify_2026_11_08.py
OPENBLAS_NUM_THREADS=1 python cathedral_4d_euclidean_consistency_verify_2026_11_08.py
```

Both scripts import the **unmodified original** `cathedral_constructed_joint_dynamics_2026_11_07.py` beside them. Requires `numpy`, `scipy`, `mpmath`; no experimental constants or third-party research code. Exact/algebraic results are independently explained above, while the numerical checks confirm implementation of the premises and convergence examples. The proof and test do **not** constitute a complete solution to deriving the observed physical universe from URT.
