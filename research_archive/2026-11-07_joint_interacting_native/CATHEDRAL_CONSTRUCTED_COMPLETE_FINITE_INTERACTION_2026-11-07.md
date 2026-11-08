# Newton's Cathedral — a constructed simultaneous geometric/history/clock/entropy interaction

**Date:** 7 November 2026  
**Classification:** New rigorously defined, executed **finite interacting candidate**. This is **not** a uniquely selected first-principles theory of nature, a Standard Model derivation, or a completed gravitational continuum. No observed masses, charges, or coupling constants were used as input. Existing H64/24/190, Δ and π–φ–e conventions are preserved. The construction below explicitly identifies new modeling choices instead of disguising them as theorems.

## 1. The mathematical issue this resolves

The older 190×64×24 quadratic operator has all-five geometric mixing and thermal response but **no intrinsic nonlinear matter vertex**. The October 28 nonlinear field action couples an icosahedral 12-vertex field to the original 64-bit history but omits the 24-clock and, at the chosen nonlinear vertex, the other four polyhedra. An ad hoc source `j_ico=t²` was previously inserted to marry them; it is not forced by the original theory. Moreover, a separately frozen eight-state Gibbs marginal did not survive the older full thermal trace.

Here we explicitly construct an **all-five, gauge-covariant, entropy-responsive interaction** in which the connection from geometric fields to history is an actual multilinear map. It is not a mere sum of partition functions, and it has an exact nonnegative Schur complement. We do *not* claim the result equals the older coupled vertex/face `K64` or the original canonical species-loaded `T★` without a new intertwining theorem: those are different operators.

## 2. Full polyhedral and historical geometry

For every Platonic solid, construct the oriented chain complex `C2 -> C1 -> C0` and its Hodge–Dirac. Together the five solids have `(V,E,F)=(50,90,50)` and dimension `190`. The verifier rebuilds all cell boundaries from actual vertices, checks `∂1∂2=0`, and finds

\[
\operatorname{Tr}D_{190}^2=720,\qquad\operatorname{Tr}D_{190}^4=3456.
\]

The original full-five links `C_top` and `C_bulk` act on the **actual** vertex/face harmonic and spatial dipole modes of each solid, including dual face dipoles. Their sum `C_bridge` has

\[
C_{\rm top} C_{\rm bulk}=0,\quad C_{\rm bridge}\succeq0,\quad
\operatorname{Tr}C_{\rm bridge}=160,\quad \operatorname{Tr}C_{\rm bridge}^2=800,
\quad\operatorname{Tr}(D_{190}^2C_{\rm bridge})=24\sum_s\lambda_s.
\]

The native 64-bit history kinetic is

\[
H_{\rm bits}=15I_{64}-\sum_{i<j}X_iX_j,\qquad
\operatorname{spec}H_{\rm bits}=0^{(2)}\oplus10^{(12)}\oplus16^{(30)}\oplus18^{(20)}.
\]

With the actual icosahedral face–vertex incidence `C` (20×12), construct `P3,P5` (four-dimensional each), and the combinatorial 64×20 face occupancy `M`. Then

\[
U_h=M(P_3+P_5)/\sqrt2,\quad U_h^\dagger U_h=P_3+P_5,\quad
H_{\rm bits}U_hP_3=18U_hP_3,\quad H_{\rm bits}U_hP_5=16U_hP_5,
\]
\[
(21I_{64}-H_{\rm bits})U_h=U_h(3P_3+5P_5).
\]

This is the existing exact hidden-eight bridge, retained rather than replacing the full original H64 by 13 states.

The same icosahedral adjacency gives a binary generator `G=[I12 | J12−Aico] mod 2`. Exhausting all 4096 words gives the **extended Golay [24,12,8] weight enumerator** `1 + 759 z^8 + 2576 z^12 + 759 z^16 + z^24`; the 64 signed histories form the archived distance distribution `1+15z^8+32z^12+15z^16+z^24`. The 759 octads and 128 even sign patterns yield the known **97,152-element octad family** in the norm-four Leech shell. This certifies the code connection, **not** a dynamical Leech-lattice field theory. Golay's 24 *code coordinates* must not be identified with the 24 *clock times* without a map.

## 3. A truly all-five nonlinear source

Let `v` be the complete **50-component** vector of vertex-field amplitudes (complex values are permitted). For a unit vertex position `r` on *any* of the five solids, form the eight real spatial moments

\[
m(r)=\left(r_x,r_y,r_z,\frac{r_x^2-r_y^2}{\sqrt2},
\frac{r_x^2+r_y^2-2r_z^2}{\sqrt6},
\sqrt2r_xr_y,\sqrt2r_xr_z,\sqrt2r_yr_z\right).
\]

Stack all 50 rows into the 50×8 matrix `E_raw`, whiten it by its actual Gram matrix `E=E_raw(E_rawᵀE_raw)^(-1/2)`, and build the corresponding whitened 12×8 matrix `I_ico` from the icosahedral positions. Thus `EᵀE=I8=I_icoᵀI_ico`. The linear geometry portal is

\[
\boxed{x=Qv,\qquad Q=I_{\rm ico}E^\dagger:\mathbb C^{50}\to\mathbb C^{12},
\quad\operatorname{rank}Q=8.}
\]

**This portal combines all five solids; their original 190 cochain degrees remain present.** Using the original projectors and *pointwise multiplication* on the 20 icosahedral faces gives the quadratic hidden sources

\[
\boxed{h_3(v)=P_3[(Cx)\odot(Cx)],\qquad
h_5(v)=P_5[(Cx)\odot(Cx)].}
\]

For a generic field, the Jacobians of **both** hidden sources with respect to **each** solid's vertex degrees have nonzero rank, including the tetrahedron, cube, octahedron, dodecahedron, and icosahedron. Explicit nonlinear quartic interference was nonzero for **all ten pairs of different solids** in the numerical regression. The actual cross-source strength can have either sign, but the full energy remains nonnegative. This directly eliminates the previous hand-inserted `j_ico=t²` source mapping.

**New premise made explicit:** choosing the shared degree-one/two spatial moments and their normalized 50→8→12 map as *the* physical source is not a theorem of the original URT selector. It is a natural symmetry-compatible constructed coupling to be tested, not a proved unique law of nature.

## 4. Single 24-clock, matter, history and geometry action

Let `z_j∈C^190` contain every vertex, edge and face cochain on clock site `j∈Z/24Z`, and `y_j∈C^64` be the native six-bit history amplitude. Let `θ_j` be a compact U(1) clock link, with the historical URT background `θ_j=θ=2π/φ²`, `r=π/e`, and `Δ=3/20−80π/(1053φ)`.

The **chosen** full action is

\[
\begin{aligned}
\mathcal S(z,y,\theta)=\sum_{j=0}^{23}\bigg[&
\tfrac12(\|d_1^\dagger\phi_j\|^2+\|d_2^\dagger a_j\|^2+\|d_2 b_j\|^2)
+\tfrac12\langle z_j,C_{\rm bridge}z_j\rangle\\
&+\tfrac12\langle y_j,H_{\rm bits}y_j\rangle
+\tfrac14(\|h_{3,j}\|^2+\Delta^2\|h_{5,j}\|^2)
-\operatorname{Re}\langle y_j,U_h(h_{3,j}+\Delta h_{5,j})\rangle\\
&+\tfrac{r^2}{2}\|z_{j+1}-e^{i\theta_j}z_j\|^2
+\tfrac{r^2}{2}\|y_{j+1}-e^{2i\theta_j}y_j\|^2
+F_{\rm KMS}(h_{3,j},h_{5,j})\bigg].
\end{aligned}
\]

The KMS term, defined below, is the **minimized actual information-state response** to those same hidden-source fields; it is not an external fitted source or an independently frozen entropy probability. `H_bits` and the preexisting `K64` vertex/face model are different 64D operators; only their exact hidden-eight bridge is shared.

### Genuine clock gauge covariance and a derived current

For arbitrary angles `α_j`, the simultaneous transformation

\[
z_j\mapsto e^{i\alpha_j}z_j,\quad
 y_j\mapsto e^{2i\alpha_j}y_j,\quad
\theta_j\mapsto\theta_j+\alpha_{j+1}-\alpha_j
\]

preserves every term. The quadratic geometric source has charge 2 **because it is a product of two charge-1 fields**, not because its charge was separately assigned to match a particle. Differentiating the action with respect to the clock link yields the exact U(1) current

\[
\boxed{J_j=r^2\operatorname{Im}\bigl[
 z_{j+1}^\dagger e^{i\theta_j}z_j+
 2y_{j+1}^\dagger e^{2i\theta_j}y_j\bigr].}
\]

When the matter/history Euler–Lagrange equations hold, local gauge covariance gives the discrete conservation law `J_j=J_(j-1)`. In the full nonlinear action, numerical differentiation agreed with this direct-current formula to `1.11×10^-9`. Independent random gauge rephasings preserve the complete action to about `10^-14`.

This is **one genuine constructed U(1) interaction**, not a derivation of observed electromagnetic charges, SU(2), SU(3), or a photon.

## 5. Exact full-24 history elimination (no arbitrary matter-source coefficient)

Let `L_24^(2)(θ)` be the 24×24 positive covariant cycle Laplacian acting on charge-2 fields; write

\[
A_{18}=18I_{24}+r^2L_{24}^{(2)},\qquad
A_{16}=16I_{24}+r^2L_{24}^{(2)}.
\]

Denote by `h3` and `h5` the complete 24×20 arrays of sources. Gaussian history minimization gives the **actual 64×24 minimizer**

\[
y_j^{\mathrm{opt}}=U_h\Bigl[(A_{18}^{-1}h_3)_j+\Delta (A_{16}^{-1}h_5)_j\Bigr]
\]

and the exact effective nonlinear potential

\[
\boxed{\begin{aligned}
V_{\rm eff}(h_3,h_5)=&\tfrac14(\|h_3\|^2+\Delta^2\|h_5\|^2)
-\tfrac12\langle h_3,A_{18}^{-1}h_3\rangle\\
&-\tfrac{\Delta^2}{2}\langle h_5,A_{16}^{-1}h_5\rangle .
\end{aligned}}
\]

Since both clock Laplacians are nonnegative,

\[
\boxed{V_{\rm eff}\ \ge\ \frac29\|h_3\|^2
+\frac7{32}\Delta^2\|h_5\|^2\ \ge\ 0.}
\]

This **includes all five solids through `h3,h5`**, the original 64-state history, 24 clock steps, and the π/e coefficient. No experimental number and no ad hoc `j=t²` map appear. A direct evaluation of the original full 64×24 history action at the minimizer matched the Schur complement **exactly in the execution run**; an independently chosen history fluctuation produced the predicted positive quadratic excess with `7.1×10^-15` residual. Eight further randomized fields and variable clock-link configurations passed to `3.6×10^-15` maximum residual.

### A new exact charge-doubling/clock selection constraint

With clock Fourier convention `e^(+2π i m j/24)`, the lowest charge-1 clock mode is `m=9` and its quadratic source is exactly charge-2 mode `2m=18 mod 24`, *which is also the lowest charge-2 clock mode*. In the opposite Fourier convention these same modes are labelled 15 and 6; there is no physical discrepancy.

Their exact residual/gaps are

\[
\delta=\frac{2\pi}{\phi^2}-\frac{3\pi}4=0.0437687395363\ldots,
\quad\ell_1=2-2\cos\delta=0.00191539675377\ldots,
\quad\ell_2=2-2\cos(2\delta)=0.00765791827034\ldots.
\]

Hence on the selected Fourier mode the effective quartic coefficients (before the extra KMS term) are exactly

\[
c_3=\frac14-\frac{1}{2(18+r^2\ell_2)}
=0.22223799832691\ldots,
\quad
c_5=\Delta^2\Big[\frac14-\frac1{2(16+r^2\ell_2)}\Big].
\]

The source doubling and history propagation are thus **kinematically compatible with the full 24-track golden twist**, though it leaves nonzero finite clock frustration.

## 6. Entropy is now a dynamical state, not a separately frozen label

The preexisting eight-state master density and rail are

\[
\rho_*=(P_3+\Delta^2P_5)/[4(1+\Delta^2)],\quad
\eta=-\ln\Delta\approx5.995798,\quad
p_5^*=\Delta^2/(1+\Delta^2)\approx6.1960\times10^{-6}.
\]

For any matter-history source define the positive **source energy on the same eight-state hidden carrier**

\[
Q(h)=E_3P_3+E_5P_5,\quad
E_3=\tfrac14\|h_3\|^2,\qquad
E_5=\tfrac{\Delta^2}{4}\|h_5\|^2.
\]

The unique density `σ` minimizing `Tr(σQ)+η^-1 D(σ||ρ*)` is

\[
\boxed{\sigma_h=\frac{e^{\log\rho_*-\eta Q(h)}}{\operatorname{Tr}e^{\log\rho_*-\eta Q(h)}}}
\]

and its on-shell free energy is

\[
\boxed{F_{\rm KMS}(h)=-\frac1\eta\log\frac{e^{-\eta E_3}+\Delta^2e^{-\eta E_5}}{1+\Delta^2}\ \ge0.}
\]

The excited-sector odds and entropy respond exactly:

\[
\frac{p_5(h)}{p_3(h)}=\Delta^2e^{-\eta(E_5-E_3)},
\quad S_8(h)/k_B=\ln4+H_2(p_5(h)).
\]

At zero field this recovers the original `ρ*` and `S8/kB=1.38637485743`. At a small generic five-solid field, the calculated `p5` changes from `6.19602767×10^-6` to `6.20160194×10^-6` while preserving positivity and normalization. As an *illustration*, multiplying that field's source amplitudes by 100 gives `p5=0.04746845` and `S8/kB=1.57728704`, **not** a physical particle-abundance prediction. All 24 density-state minimizers passed the exact entropy/energy variational identity to machine precision.

**New modeling premise made explicit:** the `Q(h)` response couples the pre-existing hidden Gibbs state to the new all-five nonlinear source with the *same* 1/4 coefficients as the established finite matter-history potential. This fixes the completion algebraically and avoids new fitted continuous coefficients, but it is not yet uniquely forced by the original microscopic `T★`. It is a semiclassical history-amplitude + density-state description; a fully quantum non-double-counted microscopic action remains to be constructed.

With the physical field variables all governed by the **same** positive `S(z,y,θ)`, define the equilibrium measure `p*∝exp(-η S)`. A concrete directed dissipative real-time realization is

\[
 dq_t=[-\nabla S(q_t)+\Omega J\nabla S(q_t)]dt
+\sqrt{2/\eta}\,dW_t,
\]

where `J` is the **constant skew-symmetric 24-cycle circulation** acting on all field coordinates, and Ω is the chosen clock circulation scale. The skew drift preserves this equilibrium measure because `Tr(J Hess S)=0` and `(J grad S)·grad S=0`. Its relative entropy has the exact H-theorem

\[
\boxed{\frac{d}{dt}D(p_t\|p_*)=-\frac1\eta
\int p_t\left\|\nabla\log\frac{p_t}{p_*}\right\|^2dq\le0.}
\]

For the deterministic drift, `dS/dt=-||grad S||²`. Thus the constructed system rigorously has stable self-organising relaxation under the specified dynamics, **not** a proof that this new Langevin completion is URT's historically unique map.

## 7. The entropic history determinant and its precise limit

Integrating (rather than merely minimizing) Gaussian 64-history fluctuations on the original **62-dimensional nonzero-energy history quotient** gives an exact functional determinant

\[
\det A_{\rm hist}=\prod_{E\in\{10,16,18\}}
\prod_{m=0}^{23}\big[E+r^2(2-2\cos(2\theta-2\pi m/24))\big]^{d_E},
\quad (d_{10},d_{16},d_{18})=(12,30,20).
\]

By the Chebyshev product identity each `E` factor is exactly

\[
\prod_m [E+r^2\ell_m]
=2(r^2)^{24}\big[T_{24}(1+E/(2r^2))-\cos(48\theta)\big].
\]

This derives the true thermal clock dependence **from the same native history field action**. At the historical golden per-link phase, the difference in `log det` relative to zero phase is **positive but extraordinarily small**, computed with 90-digit arithmetic:

\[
\boxed{\log\det A_{\rm hist}(\theta_\mathrm{URT})-
\log\det A_{\rm hist}(0)=1.6790803402738811\times10^{-22}.}
\]

A direct double-precision subtraction rounds to zero; high precision is necessary. This demonstrates an important obstruction: **unconditioned Gaussian history entropy alone does not provide a strong golden-phase selector**. The exact determinant favours zero total charge-2 Wilson flux. This is not a failure of the unified finite action (the prescribed golden background is valid); it means primordial selection of the background is still a nontrivial physical question. The 24 clock and the 24 code coordinates are distinct.

The D6→H3 conjugate rates `φ` and `−φ^-1`, interpreted chronologically, yield a *whole-fast-cycle* relative return `exp(i2π/φ²)` by `√5/φ=1+φ^-2`. The original URT primitive imposes that same angle **per clock link**, so the 24-link total holonomy is `1.05044974887...` radians, not the H3 whole-loop `2.39996322973...` radians. The execution verifies both without identifying them prematurely.

## 8. Stability and finite positive transfer

At fixed irrational golden clock phase, the charge-1 and charge-2 clock Laplacians have strictly positive minimum eigenvalues `ℓ1` and `ℓ2` above. Completing the square in the full **native 64-field** Hamiltonian gives a sum of nonnegative terms and exactly the positive quartic lower bounds in section 5; the all-five bridge and `F_KMS` are nonnegative as well. Therefore

\[
\boxed{\mathcal S(z,y;\theta_{\rm golden})\ge
\frac{r^2}{2}(\ell_1\|z\|^2+\ell_2\|y\|^2).}
\]

The finite Gibbs integral exists over the complex `24×(190+64)` field space (12,192 real coordinates), despite the original untransported history kernel, for this *fixed nontrivial holonomy*. A transfer kernel of the form `K_a(q,q')=exp[-aS(q)/2] exp[-||q-q'||²/(2a)] exp[-aS(q')/2]` is positive, compact/trace class and positivity improving, hence has a unique finite-volume vacuum and a strictly positive finite-volume transfer gap by the same standard Hilbert–Schmidt/Jentzsch argument used in the older October 28 construction. **This does not establish a continuum/volume-uniform Yang–Mills mass gap.** If all gauge phases are integrated freely, zero-holonomy configurations must be treated with gauge/zero-mode quotients; one cannot simply reuse this fixed-background coercive bound uniformly over that integral.

## 9. Independent execution and exact scope

The package contains a self-contained Python implementation of all five oriented complexes, direct 190D Hodge/bridge checks, exact original 64-history incidence and the complete 4096-word Golay code, the new common 50→8→12 nonlinear portal, 24 charged clock transport, exact 64×24 history elimination, 8-state relative-entropy minimization, and the high-precision Chebyshev determinant comparison. All zero-observation tests passed. A second independent random regression tested eight unrelated five-solid source configurations, nonuniform clock-link phases and local gauge transformations; maximum energy/gauge residual `3.55×10^-15`.

**What is now constructed:** a stable, explicitly nonlinear, whole-five-solid finite action in which *all five geometries* generate mixed matter-to-hidden-history sources, a 24-clock transport carries their charges, an exact 64-history nonlocal response feeds back, a unique adaptive KMS density responds to the same sources, and an entropy-dissipating dynamical realization exists. This replaces the previous hand-chosen matter-to-entropy probe map in this **candidate** with explicit field equations and an analytic response.

**What is not derived:** uniqueness of this source portal or gauge normalization from the original full URT selector; a dynamical Leech lattice/Golay projection rather than a verified code embedding; a microscopic non-double-counted completion of the KMS response; full charged Standard Model representations and `SU(3)×SU(2)` gauge interactions, anomaly dynamics and current residues; a physical 4D Lorentzian coframe, universal gravitation and a scale-independent continuum; measured couplings/masses. None can truthfully be claimed from the present theorems. This distinguishes a finished **finite constructed interaction** from the unfinished theory-of-nature claim.

**Reproduce:** `python cathedral_constructed_joint_dynamics_2026_11_07.py`; then `python test_cathedral_constructed_joint_2026_11_07.py`. Requirements `numpy`, `scipy`, `mpmath`. Source repository was **read only**; no GitHub changes were made.
