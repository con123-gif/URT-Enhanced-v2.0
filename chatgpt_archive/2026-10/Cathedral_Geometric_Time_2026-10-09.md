# Newton’s Cathedral geometric time and joint source selection

9 October 2026. The complete A4 root actions yield a common geometric infrared cone for scalar, gauge and fermion fields. Their exact finite-lattice transfers require more than that common cone: crossing interactions, source residues, spin reflection and boundary holonomy all remain in the same action. A lattice-preserving root-normal reflection supplies an explicit positive two-height scalar reconstruction. The phase-aware joint selector is derived on the literal signed history carrier, with its source contacts and common-species correlations retained.

## 1. Phase aware selection of one charged history

The recovered hard selection law and joint trace-log candidate are

\[
\mathcal J(\Pi)=\mathbb E\|X-\Pi X\|^2+2\eta_\Delta\operatorname{rank}\Pi,
\qquad
\Pi_* =\mathbf1_{(2\eta_\Delta,\infty)}(C),\quad C=\mathbb E[XX^\dagger],
\]

\[
\mathscr F=V_{\rm URT}+\tfrac12\operatorname{Tr}\log Q,
\qquad Q=\bar\chi+\mathscr D_{\mathbb A}^2.
\]

The corrected species amplitudes, \(\alpha_{\rm URT}=\phi^{-2}\), species-before-vacuum ordering and raw links \(\mathcal A_{f,k+1}^{-1}\mathcal A_{f,k}\) are retained. The target-independent source law enters before minimizing either functional. Raw links telescope chronologically; polar or positive-factor products need not telescope.

On the actual \(U_{64}\) and oriented retained projector P, write \(P=P_8+P_5\), \(R=UPU^\dagger=P_8+R_5\). Exact arithmetic over \(\mathbb Q(\sqrt5)\) proves

\[
U^{12}=I,\quad U^2PU^{-2}=P,\qquad P_5R_5P_5=\frac1{16}P_5.
\]

The projector orbit has period two. Its equal-phase unit-variance diagnostic average is

\[
\bar C=\tfrac12(P+R),\qquad
\operatorname{spec}\bar C=
\{0^{\times46},(3/8)^{\times5},(5/8)^{\times5},1^{\times8}\}.
\]

An invariant rank13 selection exists, but its fiveplet is the bisector, with \(\|P_{\rm inv}-P\|_F=\sqrt{15}/2\). Phase-aware spectral calculus instead gives

\[
C_{k+1}=UC_kU^\dagger\ \Longrightarrow\
\Pi_{k+1}=U\Pi_kU^\dagger.
\]

Averaging first and conditioning on phase are therefore distinct vacuum-selection operations. No raw covariance amplitude is adjusted to force rank13 in this calculation. The retained orbit span and full-period amplitude decoder both have rank18, but are different spaces: their projectors commute, intersect in ten dimensions and have Frobenius distance four. Equal ranks identify neither carrier nor its physical source.

For a gapped hard selector, the optimized distortion cost obeys

\[
j_i=\operatorname{Tr}[(I-\Pi)C_i],\qquad
j_{ij}=\operatorname{Tr}[(I-\Pi)C_{ij}]-\operatorname{Tr}(\Pi_jC_i).
\]

The moving projector contributes a real source contact. On the actual two-phase fiveplet pair, a diagnostic affine source \(C(s)=\bar C+s(P-R)\) gives

\[
\Pi'(0)=4(P-R),\qquad \Pi''(0)=-30(P_+-P_-),\qquad j''(0)=-75/2
\]

at the algebraic threshold 1/2. That threshold is a proof witness, not a replacement for the physical \(2\eta_\Delta\). The hard selector loses differentiability at a threshold crossing.

For one common random history, the primitive loaded histories \(Y_f=D_fX+j_f\) have exact joint moments

\[
\mathbb E[Y_fY_g^\dagger]=D_fCD_g^\dagger
+D_fmj_g^\dagger+j_fm^\dagger D_g^\dagger+j_fj_g^\dagger.
\]

The actual four primitive charge shifts in the retained-unit-covariance diagnostic give centered joint rank13 and uncentered joint rank14; replacing them by independent blocks gives rank56. The mixed species contacts remain in the one common vacuum equation. These diagnostic ranks do not assign masses or generations.

The [recovered action and exact selector proof](geometric_time_work/recovery/canonical_action_recovery_report.md) preserves the successful earlier conversation excerpts. Fresh targeted conversation retrieval returned unavailable; that access failure is not evidence that a full formula never existed and is not a claim to have read 100 complete transcripts.

## 2. Exact scalar transfer along the A3 slice normal

For the full ten-root scalar action, use the adapted A4 height \(h=n_4\) and

\[
S_4(q)=1+\sum_{j=0}^2e^{iq_j}=R e^{i\beta},\qquad
A(q)=24-R^2+m^2.
\]

The actual inverse is

\[
K(q,\omega)=25-|S_4+e^{i\omega}|^2+m^2
=A-2R\cos(\omega-\beta).
\]

All six spatial and four crossing roots remain. For \(m^2>0\), \(A>2R\). On the thirteen-site spatial grid, all 2197 values of R are nonzero. The massless constant mode retains its explicit infrared prescription.

The co-moving field \(\phi_h=e^{ih\beta}\psi_h\) removes the cross-height phase on an open or infinite height. Its real oscillator kernel is

\[
\mathcal T_+(y,x)=C\exp[-\lambda A(x^2+y^2)/4+\lambda Rxy],\qquad C>0.
\]

Expanding \(e^{\lambda Rxy}\) gives a sum of positive rank-one kernels, proving positivity. With

\[
\cosh E=\frac{A}{2R},\quad B=\lambda R\sinh E,
\quad C_M=\sqrt{\lambda R/(2\pi)},
\]

the Mehler kernel has oscillator eigenvalues \(e^{-E(n+1/2)}\). A different specified positive measure prefactor changes its vacuum scalar and partition contacts; it cannot be dropped from a source-dependent full trace. The exact original-field covariance is

\[
C_\infty(q,h)=\frac{e^{ih\beta}e^{-E|h|}}{2\lambda R\sinh E}.
\]

The geometric normal separation is \(d_n=\sqrt5/2\). Writing q in its inherited orthonormal spatial frame k,

\[
R=4-|k|^2/2+O(|k|^4),\quad
E^2=5|k|^2/4+O(|k|^4),\quad
(E/d_n)^2=|k|^2+O(|k|^4)
\]

at the massless pole. This is unit propagation speed in one geometric metric, without a measured speed or a separate scalar clock.

On the original thirteen-height circle, the same transformation leaves \(\psi_{h+13}=e^{-13i\beta}\psi_h\). Its partition factor is a twisted trace containing \(\mathcal R_\beta^{13}\mathcal T_+^{13}\). Its full covariance and determinant retain that seam. The exact polar square \(\mathcal T_{\rm raw}^\dagger\mathcal T_{\rm raw}=\mathcal T_+^2\) is a two-height step of distance \(2d_n\); calling it one height would change its cone. The positive open scalar transfer is not automatically the literal finite periodic density operator.

The [scalar derivation](geometric_time_work/scalar/a4_height_scalar_transfer_report.md) verifies all 28561 root denominators and covariance entries. Its polar transport has spatial support on every finite spatial site; it is not a local primitive translation.

## 3. Full gauge poles with crossing links and contacts

The complete twenty-translated-face Gaussian action has a spatial six-link block, a four-link crossing block and the exact crossing Schur kernel. Put \(u=(e^{iq_0/2},e^{iq_1/2},e^{iq_2/2},1)\), and let \(L_u v=u\wedge v\). Then

\[
C=K_{cc}=8I_4-uu^\dagger-\bar u u^T,
\quad \operatorname{spec}C=\{4-R,4+R,8,8\},
\]

\[
K_{sc}=z^{-1/2}L_u+z^{1/2}L_{\bar u},\qquad
Q(z)=K_0-zD-z^{-1}D^\dagger.
\]

At every nonzero spatial mode the hidden crossing inverse exists; its low band becomes gapless as q tends to zero. Thus its elimination retains its inverse, determinant and source terms rather than treating it as a uniformly fast block.

For the actual eight spatial-face observations, the complete covariance is

\[
C_F(z)=\frac{N_{-1}z^{-1}+N_0+N_1z}{\mathcal D(z)},\qquad
\mathcal D(z)=24-R^2-\bar S_4z-S_4z^{-1},
\]

\[
\operatorname{Tr}C_F(z)=\frac{12}{5}+\frac{2(16-R^2)}{\mathcal D(z)}.
\]

Its height poles are \(z_\pm=e^{i\beta\pm E}\), with \(\cosh E=(24-R^2)/(2R)\). The forward residue has rank two and obeys

\[
R_+^2=\lambda_F R_+,\qquad
\lambda_F=\frac{16-R^2}{2R\sinh E}>0.
\]

This is an oblique projection identity. Generic finite-lattice residues are not Hermitian positive weights for the fixed Hermitian source. Both temporal poles and the instantaneous contact are retained in the exact thirteen-period image sum.

The physical normal spacing again gives \(E/d_n=|k|+O(|k|^3)\). For the two normalized transverse magnetic coframe observations, the actual limiting residue is

\[
R_{+,\rm mag}=\frac{|k|}{\sqrt5}I_2+O(|k|^3)
\]

at unit Gaussian coefficient, divided by that coefficient in the declared action. The scalar and photon infrared cones therefore agree. Finite-cutoff pole eigenvalues alone do not establish the reflected source state.

The actual fundamental-weight normal reflection maps odd-height sites to half-integral points. Even Fourier interpolation of that reflection gives a negative full Gaussian spatial-face witness at mode (1,2,3), where scalar polar and geometric drift agree. This explicitly defeats that particular reconstruction. It does not contradict the already positive selected Hamiltonian \(B^\dagger B\), its compact nonlinear action or a different admitted time reflection.

The literal hat has \(\widehat w_\delta(n)\ge0\); multiplying it by a positive Wilson cosine weight convolves nonnegative Fourier sequences. Its square root remains a nonnegative multiplication operator, although its central convolution Fourier coefficients need not all be nonnegative. These are different operator statements. The [full gauge proof](geometric_time_work/gauge/a4_height_transfer_report.md) keeps the repaired selector and the old staggered reflection registry intact.

## 4. Geometric Wilson matter and physical endpoint residues

Each upward root decomposes as \(d_i=d_n n+t_i\), with \(\sum_i t_i=0\), \(t_i\cdot t_j=\delta_{ij}-1/4\). Its actual unit Clifford direction contains a tangential spin part,

\[
\Gamma_i=\sqrt{5/8}\,\gamma_n+\gamma\cdot t_i/\sqrt2,
\qquad\sum_i\Gamma_i=\sqrt{10}\,\gamma_n.
\]

The complete height inverse is the Laurent Dirac kernel

\[
D(k,z)=A(k)+zH_+(k)+z^{-1}H_-(k),
\quad H_+=\tfrac12\sum_i e^{ik\cdot t_i}(\Gamma_i-rI),
\quad H_-=\tfrac12\sum_i e^{-ik\cdot t_i}(-\Gamma_i-rI).
\]

Its scalar/vector form \(D=wI+i\gamma\cdot v\) gives \(D^{-1}=(wI-i\gamma\cdot v)/(w^2+v\cdot v)\), with the bilinear square at complex z. The determinant is the square of a reciprocal-conjugate quartic. All 2197 symbolic spatial polynomials retain the Wilson parameter and mass loading; no physical species mass is inserted to choose their roots.

The full root dyad gives

\[
D(q)=m_0I+i\frac5{\sqrt2}\gamma\cdot q
+\frac{5r}{2}|q|^2I+O(|q|^3).
\]

Its geometric massless principal cone is \(E^2=|k|^2\). Scalar, gauge and matter principal cones now agree in the same geometric metric. This result is for the four-dimensional Euclidean root actions, rather than the earlier four-coordinate Hamiltonian graph with an extra clock.

With \(c_D=5/\sqrt2\), \(V_4=\sqrt5\), and root length unit \(\ell\), the action fixes

\[
\psi_{\rm can}=\sqrt{\frac{c_D}{V_4\ell^3}}\psi_{\rm lattice}.
\]

The spatial Fourier endpoint factor at fixed height is \(c_D/d_n=\sqrt{10}\). At zero spatial momentum and the algebraic critical r value \(\sqrt{5/8}\), the normalized forward propagator has \(G_n=z_0^{n+1}P_+\). Its discrete endpoint factor is retained; it is not fitted away.

The scalar phase transport does not remove a matrix-valued spin hopping polar. At finite spatial momentum, the critical zero-mode r choice still has non-Hermitian reflected residues and an extra negative reflected weight. This rejects that fixed normal-spin one-height candidate, while preserving the canonical positive Hamiltonian transfer. The species, Higgs and wall operators must enter the full matrix before the inverse and its physical endpoint projection.

The actual full ten-root spin4 operator on \(3^4\) sites also has a contact-complete pure-gauge loop identity: its current bubble and seagull both equal 87.3867116020, with residual \(1.42\times10^{-14}\). The [matter proof](geometric_time_work/matter/geometric_height_matter_report.md) supplies the full polynomial, poles, source vertices and residue conversion.

## 5. A lattice preserving root normal and a two height scalar transfer

Take the actual root-normal height \(h=n_4-n_3\). Reflection is the Weyl swap \(n_3\leftrightarrow n_4\), an exact lattice involution. Purely spatial roots form A2 among indices 0,1,2; rank-three slice lattices alternate between integral and half-integral transverse cosets. The root joining 3 and 4 is temporal with height jump two; six inclined roots have jump one. These are different slice and action data from the A3 fundamental-weight height, rather than deletion of a crossing interaction.

In the actual spatial chart, put

\[
B(q)=2\sum_{i=0}^2\cos(q_2/2-q_i),\quad (q_i)=(q_0,q_1,0),
\]

\[
a(q)=m^2+20-2[\cos q_0+\cos q_1+\cos(q_0-q_1)].
\]

The full scalar symbol is

\[
K(q,\omega)=a(q)-2\cos2\omega-2B(q)\cos\omega.
\]

Its covariance has two positive spectral coefficients, with one positive and one negative one-height transfer eigenvalue. Site reflection gives their positive covariance Gram; Gaussian Wick reconstruction retains both branches. The two-height transfer squares their eigenvalues and is positive, with normal distance \(\sqrt2\). Its massless infrared speed is one. The source includes both parity cosets and both branches; no generation or temporal branch filter is inserted.

The original odd thirteen-height quotient and an explicit even26 cover have different seams. The latter gives a reflection-positive finite scalar boundary prescription. At zero spatial momentum, the original quotient's four-source site form is an invertible Vandermonde congruence of a diagonal form with signs (+,+,+,−), for every positive scalar mass and loading. Its negative direction is therefore an exact obstruction, beyond the numerical witness. The cover is an additional boundary choice, not a claim that the original finite state was already that cover. The [root-normal scalar proof](geometric_time_work/root_time/root_normal_scalar_transfer_report.md) derives the full two-slab inverse, clock and reflected source.

For the same root-normal direction, the full Wilson stencil at zero spatial momentum is

\[
D(\omega)=[m_0+r(7-\cos2\omega-6\cos\omega)]I
+i\gamma_n[\sin2\omega+3\sin\omega].
\]

At r=1, the \(\gamma_n=+1\) denominator is

\[
d_+(z)=m_0+7-\tfrac32z-\tfrac92z^{-1}-z^{-2}.
\]

For every \(m_0>0\), the rest cubic has one root in each of (−1,0), (0,1) and (1,∞). The reciprocal of the last root is a positive inside pole in the minus-spin inverse, with strictly negative Dirac-reflected source weight at every positive separation, including all even-height samples. A positive scalar two-height reconstruction therefore does not alone provide a positive CAR transfer for this r=1 action.

The free continuum limit is nevertheless derived without deleting a branch. At zero mass, the cubic factors as \((z-1)(-3z^2+11z+2)/2\). With \(m_0=(5/\sqrt2)\ell m_{\rm phys}\), \(t=N\ell/\sqrt2>0\), and the cell-derived endpoint factor five,

\[
5S_N(0)=e^{-m_{\rm phys}t}[P_++O(\ell)]
+O(e^{-ct/\ell}),\qquad c>0.
\]

The cutoff source branches vanish exponentially at fixed positive time, while their determinants and loop contacts remain in the full action. This is a free source limit, rather than an interacting continuum theorem. The [root-normal matter calculation](geometric_time_work/matter/root_normal_matter_report.md) retains the complete pole and source classification.

## 6. Exact normal holonomy and common source contacts

On the original A3 height circle, a unit-charge normal phase j gives the actual scalar kernel

\[
K_N(j)=dI-b e^{i(\theta+j)}L-b e^{-i(\theta+j)}L^\dagger,
\quad d=24-b^2+m^2,\ b=|S_4|,\ \theta=-\arg S_4.
\]

The exact complex-scalar determinant and response are

\[
\det K_N=2b^N[\cosh(NE)-\cos N(\theta+j)],\qquad
\Gamma=\log\det K_N,
\]

\[
\Gamma_{jj}=N^2\frac{\cosh(NE)\cos N(\theta+j)-1}
{[\cosh(NE)-\cos N(\theta+j)]^2}.
\]

Every one of the 2197 spatial determinants agrees with its complete thirteen-mode Fourier product. This finite scalar-loop holonomy curvature is not a stand-alone photon coupling. Current and seagull terms together preserve the exact pure-gauge and mixed gauge/holonomy zero responses.

The source-dependent polar frame \(V_{nn}=e^{-in(\theta+j)}\) moves the entire source to the periodic seam. Its connection \(\Omega=V^\dagger V_j=-i\operatorname{diag}(n)\) gives

\[
\widetilde K_j=V^\dagger K_jV+[\widetilde K,\Omega],
\]

\[
\widetilde K_{jj}=V^\dagger K_{jj}V
+2[V^\dagger K_jV,\Omega]+[[\widetilde K,\Omega],\Omega].
\]

The transformed bulk current cancels and the retained seam has derivatives iN and −N² times its forward hopping. Dropping these frame contacts would compute a different source. Physical conversion \(j=d_n Q A_n\) gives \(\Gamma_{A_nA_n}=(d_nQ)^2\Gamma_{jj}\) at fixed normal metric; varying the coframe differentiates that map too. The [height source proof](geometric_time_work/source/height_source_transport_report.md) supplies the exact matrices and independent Ward checks.

## 7. The derived common cone and the remaining action identity

The following conditional theorem is derived from the literal complete A4 Euclidean root actions: with a shared orthonormal coframe, all roots retained, and the stated massless/continuum principal limits, scalar, gauge and fermion fields have one unit geometric propagation cone. Their coefficients arise from the root tight frame and face frame; no measured speed or independent sector clock is used. Their physical sources retain their own canonical field, cell-volume and endpoint conversions.

This theorem is distinct from claiming that the existing selected Hamiltonian transfer has been reconstructed along one graph coordinate. At finite cutoff, the choice of time reflection, boundary prescription, spin transport and source observations is part of that operator identity. The explicit open scalar construction, two-height root-normal reconstruction, gauge residues and fermion tests make those conditions calculable. Finite reflection counterexamples apply to their specified action, state and source; they do not reopen positivity of the canonical \(T_b=B_b^\dagger B_b\).

The original conserved four-dimensional boundary leaf and compatible external symplectic chart remain closed. The all-timelike entropy/coframe Einstein interface, electron-normalized compact charge, species-first ordering and hidden-memory contacts are preserved. A different time prescription does not introduce an extra entropy normalization or replace a physical charged correlator by a history stability rate.

The complete same-action equality still requires the target-independent nonlinear charged history, admitted joint source map, selected common vacuum and positive physical time representation. Neither a diagnostic covariance nor the bare common cone selects those entries. The recovered state and selector laws constrain them explicitly; the unavailable conversation access cannot be treated as proof that prior derivations did not exist.

The [independent reflection audit](geometric_time_work/review/geometric_reflection_audit.md) and [source audit](geometric_time_work/review/geometric_source_audit.md) review the operator scopes and exact contacts. Validate the local records with:

```sh
python3 run_geometric_time.py
```

The source snapshots, executable proofs, strict finite records and finite arrays are included in the complete package. These seven components extend the continued derivations as 74–80. They prove the stated geometric-time and joint-source results; they do not establish the Cathedral as an empirically confirmed or complete theorem of nature.