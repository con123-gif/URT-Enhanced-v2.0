# Newton’s Cathedral: fixed-volume entropy and the selected joint vacuum

Later combined-source correction: the recovered nonlinear relation A proportional to H2(p)^(-1/2) fixes the diagonal area slope and gives the factor eight with one binary entropy. Free-slope witnesses below have weaker premises. The full-period decoder has rank18 and the photon restriction now has a multi-slice response. See [the combined-source construction](Cathedral_Combined_Source_2026-10-08.md).

8 October 2026. This continues the construction after the three-derivation checkpoint. Later recovered chat corrections govern the physical route: gravity follows the differential entropy/coframe map at fixed volume. The spatial-ball interpretation follows the causal-diamond dictionary and small-ball framework; the bounded chat itself writes fixed \(V\). The standalone exponential trace remains a conditional mathematical calculation. Its unconstrained scale variation is not a no-go theorem for the current entropy route.

## 1. The entropy route gives the Einstein tensor relation

Let \(\zeta_A\) denote the physical area derivative of the ultraviolet entropy in units of \(k_B\). For a small three-dimensional geodesic ball of radius \(\ell\), direct curvature and radius expansion gives
\[
\delta A|_V=-\frac{4\pi\ell^4}{15}\,\delta G_{uu}.
\]
The radius correction is essential: keeping radius fixed gives a different coefficient. For the conformal-vacuum modular/stress identification, integration of the ball weight gives
\[
\delta\langle K\rangle
=2\pi\int_{r<\ell}\frac{\ell^2-r^2}{2\ell}\delta T_{uu}\,d^3x
=\frac{8\pi^2\ell^4}{15}\delta T_{uu}.
\]
Fixed-volume entropy stationarity therefore yields
\[
0=\zeta_A\delta A|_V+\delta\langle K\rangle
\quad\Longrightarrow\quad
\delta G_{uu}=\frac{2\pi}{\zeta_A}\delta T_{uu}.
\]
Defining the resulting gravitational coefficient by \(G_{\rm ent}=1/(4\zeta_A)\) gives the Einstein factor \(8\pi G_{\rm ent}\). Requiring the relation in every timelike direction supplies its tensor form; conservation leaves the cosmological integration constant to its own vacuum/state equation. This derivation uses no exponential-cutoff normalization.

The small-ball geometry and modular assumptions are the first-order entanglement-equilibrium framework of [Jacobson](https://arxiv.org/html/1505.04753v4). Conformal fields have the displayed ball modular Hamiltonian; a nonconformal sector requires its scalar modular correction. The Cathedral must establish that identification for the physical selected-transfer stress. Its exact hidden entropy law supplies
\[
\delta S_{\rm IR}/k_B=2\eta_\Delta\,\delta p_5,
\qquad
\zeta_A=-2\eta_\Delta\left(\frac{\partial p_5}{\partial A}\right)_V,
\]
and hence
\[
G_{\rm ent}
=-\frac{1}{8\eta_\Delta(\partial p_5/\partial A)_V}.
\]
This identifies precisely the coframe/state derivative which determines the coefficient. That distinction has an exact witness. In the same area chart \(u=A/A_0\), consider the supplied extensions
\[
K_b(u)=\eta_\Delta[3P_3+(5+2b(u-1))P_5],\qquad 0<b\le1.
\]
Every extension has the same full reference state at \(u=1\), affine degree one, and positive gap for \(u>0\). Yet
\[
\left.\frac{\partial p_5}{\partial A}\right|_{A_0}
=-\frac{2\eta_\Delta b}{A_0}p(1-p),\quad
\zeta_A=\frac{4\eta_\Delta^2b}{A_0}p(1-p),\quad
\frac{G_{\rm ent}}{A_0}=\frac1{16\eta_\Delta^2bp(1-p)}.
\]
The fixed labels \(b=1/2\) and \(b=1\) therefore give a factor-of-two difference despite identical reference data. Neither is chosen as the canonical source or fitted to \(G\). This proves that reference data and an area coordinate do not determine the physical area-to-modular source embedding; that law must be derived from the selected action.

The local fixed three-volume premise does not imply that the entire universe has fixed four-volume. A homothetic variation changing the ball volume is outside this entropy-stationarity condition. Consequently the preceding unconstrained exponential-trace theorem cannot exclude this constrained route.

## 2. Derive the actual hidden population source

At the recovered reference,
\[
K_0=\eta_\Delta(3P_3+5P_5),\qquad
\rho_0=e^{-K_0}/Z,\qquad p=p_5.
\]
For a general modular source \(V=\delta K\), Gibbs differentiation gives
\[
\delta p=-p(1-p)\left[
\frac{\operatorname{Tr}(P_5V)}4-\frac{\operatorname{Tr}(P_3V)}4
\right].
\]
A source proportional to the identity has zero population response. A purely cross-rail source also has zero first-order population response. The mean diagonal rail-gap source, including any derived coframe dependence of \(L_{\rm hid}\) or \(\eta_\Delta\), supplies the linear response required by the area law.

For \(K(x)=K_0+x\begin{pmatrix}0&I_4\\I_4&0\end{pmatrix}\), put \(r=\sqrt{\eta_\Delta^2+x^2}\). Exact diagonalization gives
\[
p_5(x)=\frac12\left(1-\frac{\eta_\Delta}{r}\tanh r\right).
\]
Its first derivative vanishes. Coherent states also require the finite relative-entropy term:
\[
S(\rho_x)-S(\rho_0)
=2\eta_\Delta[p_5(x)-p]-D(\rho_x\Vert\rho_0).
\]
Thus the response entropy cannot be replaced by \(H_2(p_5(x))\) once cross-rail coherences are present. In the dimensionless \(x\) chart,
\[
p_5''(0)=\frac{\tanh\eta_\Delta-\eta_\Delta\operatorname{sech}^2\eta_\Delta}{2\eta_\Delta^2},
\quad
D''(0)=\frac{\tanh\eta_\Delta}{\eta_\Delta},
\quad
S''(0)=-\operatorname{sech}^2\eta_\Delta.
\]
Sixteen exact-coefficient and finite-matrix checks pass in joint_vacuum_work/entropy_diamond.py. These identify the needed source channel and verify the area-response counterexample; they do not replace the full coframe-loaded Hamiltonian by an eight-state toy.

## 3. Joint vacuum selection changes the response calculation

For a fully specified action \(\mathcal F(P,s)\), the same shared species-loaded unconstrained vacuum obeys \(\mathcal F_{,P}=0\). If its field Hessian is invertible, eliminating the vacuum displacement gives
\[
\Gamma_{,ss}
=\mathcal F_{,ss}
-\mathcal F_{,sP}\mathcal F_{,PP}^{-1}\mathcal F_{,Ps}.
\]
For actual constraints \(g(P,s)=0\), use \(L=\mathcal F+\lambda^Tg\) and the bordered Hessian
\[
B=\begin{pmatrix}L_{PP}&g_P^T\\g_P&0\end{pmatrix},\qquad
\widehat{\mathcal F}_{ss}
=L_{ss}-\begin{pmatrix}L_{sP}&g_s^T\end{pmatrix}
B^{-1}\begin{pmatrix}L_{Ps}\\g_s\end{pmatrix}.
\]
This retains the multiplier contact \(\lambda^Tg_{ss}\). The vacuum displacement must therefore be included in a photon or stress response.

The action choice is different from the variables varied inside that action. A coefficient labelling two compatible action completions does not become a dynamical field merely because one solves the joint vacuum equation. The new species calculation tests this distinction on the actual decoded64 source operators, with one shared finite probe vacuum and primitive species multiplicities. The finite probe potential is explicitly conditional.

Polynomial minimality alone does not select the squared golden extension. Even at quadratic degree there is the nonnegative family
\[
G_\epsilon(A)=
\begin{pmatrix}
I+A^\dagger A&A^\dagger\\
A&(1-\epsilon)I+\epsilon AA^\dagger
\end{pmatrix},
\qquad 0\le\epsilon\le1.
\]
Every member agrees at unitary \(A\); its scalar singular-channel determinant is \(1-\epsilon+\epsilon\sigma^4\). Even affine Hermitian roots can differ:
\[
D_+(A)=\frac1{\sqrt5}\begin{pmatrix}3I&A^\dagger\\A&2I\end{pmatrix},
\qquad D_+(S)^2=M(S)^2
\]
at unitary \(S\), whereas their squares differ away from it. Fixing the underlying signed affine Hermitian block and dependence solely on \(A\), with no extra bridge or history spurions, can select a particular square within that block class. That is a stronger premise than the shared trace-log functional or lowest polynomial degree. If the recovered bridge \(S\) itself is allowed as a coefficient spurion, affine diagonal terms such as \(S^\dagger A+A^\dagger S-2I\) vanish at \(A=S\) while changing the source law; even signed zero-source agreement then does not establish uniqueness.

In the declared actual64 probe, a stable common branch has field-Hessian minimum \(0.859203\). Relaxing that one shared vacuum changes its radial source curvature from \(-0.385079\) to \(-4.695233\). An admissible decoder-blind hidden completion leaves the same common vacuum exactly unchanged while changing that response to \(-0.693514\) at its declared action label \(0.1\). These are conditional external-source action curvatures, not particle masses or photon residues. They prove that agreement on a stationary vacuum does not identify the complete determinant/source action.

## 4. The literal hat has a computable correlated response

On the closed five-vertex, ten-edge K5 local graph, Gauss reduction leaves six cycle angles. For a free electric Hamiltonian, the physical quotient heat-kernel diagonal is constant. Therefore the one-slice transfer response is exactly
\[
\frac{\operatorname{Tr}(X_iX_jT)}{\operatorname{Tr}T}
=\frac{\int X_iX_j W_\delta\,d\mu}{\int W_\delta\,d\mu}
\]
for every positive transfer step, without fitting a clock or coupling. All shared-edge triangle constraints remain in \(W_\delta\).

The exact covariance tensor has the form
\[
C_F=\delta^2t_mP_{\rm cycle},\qquad
\Gamma_F^{(2)}=\frac{1}{\delta^2t_m}P_{\rm cycle},
\]
where \(P_{\rm cycle}\) has rank6 and diagonal \(3/5\). Eight independent scrambled Sobol integrations, refined through \(2^{21}\) points each, give:

| Local selector | \(t_m\) | \(\delta^2\Gamma_F\) on its image | Independent-face comparison |
|---|---:|---:|---:|
| Ten shared faces, \(\prod w_\delta\) | \(0.18998510\pm0.00000208\) | \(5.2635706\pm0.0000576\) | 6 |
| Same faces weighted twice, \(\prod w_\delta^2\) | \(0.09829582\pm0.00000186\) | \(10.1733723\pm0.0001927\) | 10 |

Errors are replicate standard errors with refinement drift recorded; they are not rigorous intervals. The first local stiffness is about 12.27% below the independent-face result. Tree coordinates have a nontrivial metric and cannot be treated as six identical independent fluxes.

The geometric bivectors obey \(B_2^TB_2=5I_6\) and \(B_2B_2^T/5=P_{\rm cycle}\). Pulling back through the actual triangle areas \(B_2/2\) gives the local curvature Hessian \(5I_6/(4\delta^2t_m)\). A duplicate observable list has rank six; its pseudoinverse gives the same pullback without double counting.

The doubled local selector is not a two-step transfer, and coincident local faces are not the distinct translated faces of the full torus. These are actual correlated one-slice selected-transfer results in their declared free-electric sector. A massless long-cylinder photon residue still uses the interacting spectral response and physical current/field map.

## 5. The full action needs a typed constrained variation

Retain \(T=P_GW_\delta^{1/2}e^{-aH_{\rm local}}W_\delta^{1/2}P_G\) and \(Z_n=\operatorname{Tr}T^n\). For a source \(s\), the joint stationarity term is
\[
\partial_s(-\log Z_n)
=-\frac{n\,\operatorname{Tr}(T^{n-1}T_{,s})}{Z_n}.
\]
Its second derivative retains every ordered two-insertion separation and \(T_{,ss}\). The selected Hamiltonian, selector, Gauss projector, coframe measure/support and clock variations belong inside this derivative. On a constant-rank positive-support stratum, the equivalent modular formula includes its source contact and Kubo–Mori covariance. Across moving hat thresholds, the complete trace has boundary/shape contacts. In the executed scale probe, the support boundary contributes \(+8Z\), the interior contributes \(-4Z\), and the complete second derivative is \(+4Z\). Dropping that boundary reverses the sign. Replacing the selected trace by a spectral trace or dropping its contacts changes the action.

The recovered interface also contains its Einstein, rail-potential, cosmological and state terms. Their variations must be combined with this transfer response on the specified constrained manifold:
\[
\Omega_{n,i}+k_{\rm Cat}(\mathrm{EH})_{,i}
-(\mathrm{potential\ density})_{,i}
+\ell_{\rm Cat}(\mathrm{volume})_{,i}
+(\Gamma_{\rm state})_{,i}+\lambda^ag_{a,i}=0.
\]
Every term denotes its full source dependence; a source-dependent coefficient belongs inside the derivative. The cosmological symbol ambiguity is resolved by the earlier recovered v61 dictionary. In its inverse-metric Lorentz convention,
\[
k_{\rm Cat}=\frac1{16\pi G},\qquad
\ell_{\rm Cat}=B=-\frac{\Lambda_{\rm cc}}{8\pi G},
\qquad \Lambda_{\rm cc}=-8\pi G\ell_{\rm Cat}.
\]
The density has units \(L^{-4}\), while curvature has units \(L^{-2}\). The statistical stress and Lorentz stress still require their continuation/sign dictionary. A derived transfer Einstein term and an explicit interface Einstein term require a matching prescription: \(k_{\rm total}=k_{\rm local}+k_{\rm induced}\), counting each contribution once.

Reference-subtracted entropy and the absolute action have different source content. \(H[g]\mapsto H[g]+C[g]I\) leaves every normalized selected state and its relative entropy unchanged, but shifts \(-\log Z_n\) by \(naC[g]\). A volume constraint removes that variation only in its allowed directions; it does not determine an absolute vacuum pressure by itself. The actual fixed action must supply that source dependence.

## 6. Precedence-ordered closure ledger

| Component | Status | Scope |
|---|---|---|
| Finite carriers, rails, hidden reference state, entropy first law, positive-transfer factorization | Closed and frozen | Retained exact identities. |
| Fixed-volume entropy tensor derivation, golden source/selector algebra, conditional whole-A4 Gaussian and local correlated-hat responses | Closed mathematically; physical identification pending | Actual modular/stress, coframe/area, current and interacting-transfer identifications remain explicit. |
| Applying the standalone unconstrained scale obstruction to the current entropy route | Reopened and rejected on scope | The recovered fixed-volume premise excludes that variation; no full-Cathedral no-go follows. |
| Exponential-trace ratio as the normalization of current physical gravity | Retired/superseded physical route | Its conditional heat coefficients remain correct branch mathematics. Later entropy/coframe corrections control the current route. |

Detailed proofs are [joint selected-transfer variation](joint_vacuum_work/gravity/joint_selected_vacuum_report.md), [shared species vacuum](joint_vacuum_work/species/shared_species_vacuum_report.md), [correlated hats](joint_vacuum_work/photon/correlated_hat_k5_report.md), and [independent action review](joint_vacuum_work/review/total_vacuum_review.md). The exact hidden and diamond checks, original QMC replicate data and source recovery are preserved. The finite selected-transfer variation test is explicitly supplemental, with a declared coupling witness; it is not a computation of the full interacting vacuum. A complete interacting theory-of-nature claim still requires the full selected source action and its physical limits; none is replaced by a fitted coefficient in this continuation.