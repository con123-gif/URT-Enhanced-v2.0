# Newton’s Cathedral: three derivations and the vacuum equation

Later recovered correction: the current physical gravity route is fixed-volume entropy/coframe response. Sections 4–5 below retain exact conditional exponential-trace mathematics; their normalization is superseded for current physical gravity. See [the joint-vacuum continuation](Cathedral_Joint_Vacuum_2026-10-08.md).

8 October 2026. This continues the species-first, signed64, positive-transfer construction. All new numerical calculations use recovered finite geometry and stated action/source choices; none fits measured masses, electromagnetic coupling or Newton’s constant. The results below separate exact consequences from conditional action completions. Their scripts and full operators are in the accompanying continuation package.

## 1. Derive the golden species block

The recovered normalized intertwiner $S:3\to3'$ obeys $S^\dagger S=SS^\dagger=I$. Define
\[
M_S=\begin{pmatrix}I&S^\dagger\\S&0\end{pmatrix}.
\]
Multiplication gives $M_S^2-M_S-I=0$, hence
\[
\operatorname{spec}M_S=\{\phi,-\phi^{-1}\},\qquad
M_S^2=\begin{pmatrix}2I&S^\dagger\\S&I\end{pmatrix},\qquad
\operatorname{spec}M_S^2=\{\phi^2,\phi^{-2}\}.
\]
Each eigenvalue has triplet multiplicity. The contraction ratio follows algebraically:
\[
\alpha_{\rm URT}=\frac{|{-\phi^{-1}}|}{\phi}=\phi^{-2}.
\]
This reconstructs the golden block and its ratio. It does not identify that six-dimensional block with every entry of the full64 nonlinear history.

Insert the recovered species amplitude before eliminating history coordinates:
\[
\mathcal A_{f,k}=C_5(H_k)+C_{43}(\Xi_{3,k}+J_{43}q_f/3)
+i(-1)^kC_{45}(\Xi_{5,k}+\Delta J_{45}g(q_f)/5).
\]
The primitive $q_f$ are the recovered up, down, electron and neutrino words; $g_i=q_i^2-\|q\|^2/3$. The real affine amplitude decoder has rank13, with real kernel dimension51. Its thirteen decoded coordinates are a fiveplet and two quartets. Its restriction to the retained $\mathscr H_{13}=2\mathbf1+\mathbf3+\mathbf3'+\mathbf5$ has rank5: the two charged quartets lie in the hidden history carrier. These are different thirteen-dimensional subspaces. The complex-linear extension of the decoder has rank9/kernel55; the real decoder’s kernel51 is not an identification of the quantum Feshbach hidden block.

Two natural source extensions of the same golden block are
\[
A_{\rm dir}(\mathcal A)=\begin{pmatrix}2I&\mathcal A^\dagger\\\mathcal A&I\end{pmatrix},
\qquad
A_{\rm sq}(\mathcal A)=\begin{pmatrix}I&\mathcal A^\dagger\\\mathcal A&0\end{pmatrix}^{\!2}.
\]
For singular values $\sigma_i\$ of $\mathcal A$, their spectra are respectively
\[
\lambda_{\rm dir}^{\pm}=\frac32\pm\sqrt{\frac14+\sigma_i^2},\qquad
\lambda_{\rm sq}^{\pm}=\left(\frac{1\pm\sqrt{1+4\sigma_i^2}}2\right)^2.
\]
They agree whenever $\mathcal A$ is unitary. Set $t=\sigma^2$. At the golden point $t=1$, both lower branches equal $\phi^{-2}$, but
\[
\frac{d\lambda_{\rm dir}^{-}}{dt}=-\frac1{\sqrt5},\qquad
\frac{d\lambda_{\rm sq}^{-}}{dt}=1-\frac1{\sqrt5}.
\]
Their responses have opposite signs. For the squared extension, affine history/source derivatives also give a compulsory mixed contact
\[
(M^2)_{,ij}=M_{,i}M_{,j}+M_{,j}M_{,i}
\]
when $M_{,ij}=0$. Ignoring it fails the executed source-Hessian checks.

The direct extension is positive definite only when every $\sigma_i^2<2$. The squared extension is nonnegative for all amplitudes and positive definite for nonsingular amplitudes; its continued lower branch is contractive only when $\sigma_i^2<2$. At the chart origin $P=0$, the primitive electron load gives $\sigma_{\max}=1.9683926376$: the direct extension has eigenvalue $-0.5309036353$, while the squared lower branch reaches $2.3436659405$. These are source-chart probes, not selected electron vacuum or mass values.

Even positivity at every amplitude does not select a unique continuation:
\[
A_{\rm alt}=A_{\rm sq}
+\alpha_{\rm URT}\operatorname{diag}
[(\mathcal A^\dagger\mathcal A-I)^2,(\mathcal A\mathcal A^\dagger-I)^2].
\]
This alternative is positive definite even at singular amplitudes, agrees with the golden block, and has the same triplet covariance and branch projector. Its first radial vertex addition vanishes at the unitary point, but its second radial contact differs by \(2\alpha_{\rm URT}I\). Thus even fixing the base operator and first vertex does not fix the response contact.

Explicit full64 positive witnesses additionally preserve the generation compression and known hidden8 rails while changing the hidden51 determinant or retained–hidden coupling. Their extra projectors are amplitude-blind and commute with the recovered finite symmetry/outer action. Thus the carrier, decoder, golden ratio and positivity alone do not select one full source action. This proves nonuniqueness under those hypotheses; it introduces no freedom into an already specified complete action. The exact nonlinear species-loaded law must supply the missing selection premise.

## 2. Derive what the recovered vacuum principles select

For raw-history second moment $C=\mathbb E[XX^\dagger]$, the recovered hard quadratic rate-distortion cost is
\[
\mathcal J(\Pi)=\mathbb E\|X-\Pi X\|^2+2\eta\operatorname{rank}\Pi
=\operatorname{Tr}C+\operatorname{Tr}\Pi(2\eta I-C).
\]
Global minimization over orthogonal projectors gives
\[
\Pi_* =\mathbf1_{(2\eta,\infty)}(C).
\]
Only an eigenvalue exactly at $2\eta$ creates a tie. The recovered threshold is $2\eta=11.9915959735$; calculating $C$ requires the primitive joint history distribution and distortion units. Selecting thirteen modes cannot be inferred from the threshold alone.

The separate exact hidden minimax gives
\[
\min_\beta\|I-\beta(3P_3+5P_5)\|=\frac14,
\qquad\beta_* =\frac14,
\qquad[I-\beta_*L_{\rm hid}]^6=I_8/4096.
\]
It determines the hidden linear relaxation, not every coefficient of the nonlinear full64 selector.

For the recovered candidate $\mathscr F=V_{\rm URT}+\tfrac12\operatorname{Tr}\log Q$, $Q=\bar\chi+\mathscr D_{\mathbb A}^2>0$, the joint vacuum and source equations are
\[
\delta\mathscr F=\delta V+\frac12\operatorname{Tr}(Q^{-1}\delta Q)=0,
\]
\[
\mathscr F_{,ij}=V_{,ij}+\frac12\operatorname{Tr}
[Q^{-1}Q_{,ij}-Q^{-1}Q_{,j}Q^{-1}Q_{,i}].
\]
These include the contact and loop terms. The primitive spiral term $-\Re(\bar\Omega w)$ supplies history drift $w\mapsto w+\Omega$, not an unconstrained stationary minimum. Its admissible history constraint must therefore precede vacuum minimization. None of these equations licenses importing the retired scalar recurrence or response-fed wall into the current branch.

## 3. Derive a photon coefficient on the entire A4 torus

On all $13^4=28{,}561$ momenta, take ten root links and both translated triangular halves for every root-plane type:
\[
F^1_{ijk}(x)=a_{ij}(x)+a_{jk}(x+r_{ij})-a_{ik}(x),
\]
\[
F^2_{ijk}(x)=a_{jk}(x)+a_{ij}(x+r_{jk})-a_{ik}(x),\qquad
S_c=\frac c2\sum_{x,i<j<k}[(F^1)^2+(F^2)^2].
\]
The links have fixed electron Wilson-phase normalization. This is a declared Gaussian local action, with its gauge zero modes and flat holonomies treated explicitly.

Its complete Fourier incidence has rank9 at every nonzero momentum, leaving exactly the lattice gauge direction. One triangular half alone has rank6 at every momentum; integrating the six extra link bands then removes its entire apparent coframe Maxwell kernel. The translated face registry therefore matters. Independent algebra proves these ranks; enumeration verifies every torus mode.

For both halves, the exact triangle area frame is $\sum b_{\triangle}b_{\triangle}^{T}=5I_6/2$, and the primitive cell volume is $\sqrt5$. Schur integration of the six noncoframe link bands preserves this leading curvature tangent. Consequently
\[
K_A(q)=Z_\gamma(q^2I-qq^T)+O(q^4),\qquad
Z_\gamma=\frac{\sqrt5}{2}c.
\]
This is an analytic derivative of the symbol, without a fitted infrared intercept. The six link bands are not the fifty-one hidden histories. Both determinants and the coframe Jacobian remain in their appropriate vacuum/stress responses.

The exact hidden8 information Hessian fixes $c$ once its curvature-to-generator embedding is declared:

| Declared source at fixed physical curvature | $c$ | $Z_\gamma$ | Formal $4\pi Z_\gamma$ |
|---|---:|---:|---:|
| Unit Hilbert–Schmidt cross-rail generator | $\eta^2/\chi_{35}=0.749465460810$ | 0.837927858580 | 10.5297120190 |
| Algebra-unital cross-rail generator | $\eta\tanh\eta=5.995723686481$ | 6.703422868638 | 84.2376961521 |

These hold the same physical curvature fixed and are different source embeddings. Rescaling a generator basis and its coordinate together changes neither physical action nor coupling. No source norm was inferred from a desired alpha value.

The canonical repaired hat has $-\log w_\delta(F)=|F|/\delta+\cdots$, so it has no quadratic Taylor Hessian at zero. Its exact selected transfer cannot be replaced by this Gaussian action without a derivation. The full interacting photon computation instead uses the Gauss-compatible bounded curvature source in
\[
T=P_GW_\delta^{1/2}e^{-aH_{\rm local}}W_\delta^{1/2}P_G.
\]
For a reflection-symmetric channel and nondegenerate vacuum, subtract the curvature means and sum over excited physical transfer states:
\[
C_F(q,\omega)=\sum_{r>0} R_r(q)\frac{1-r_r^2}{1-2r_r\cos\omega+r_r^2},
\quad r_r=\lambda_r/\lambda_0,
\quad\Gamma_A^{(2)}=D^\dagger C_F^{+}D,
\]
with the inverse restricted to the physical Bianchi/transverse image. Its full eigenvectors, hidden51 determinant, source contacts, mean-field chart and physical clock must be retained. An unrestricted all-link translation is a different observable and can have zero Hessian.

## 4. Derive the retained Einstein coefficient and exchange

The scalar-free common exponential trace has internal particle/conjugate dimension96, Dirac rank384 and unified generator index12. For
\[
S_{\rm sp}=A_0\operatorname{Tr}e^{-\eta D[g,U]^2/\Lambda_{\rm grav}^2},
\]
the heat coefficients give
\[
S_{\rm sp}=\int\sqrt g\left[
\frac{24A_0\Lambda_{\rm grav}^4}{\eta^2\pi^2}
-\frac{2A_0\Lambda_{\rm grav}^2}{\eta\pi^2}R
+\frac{A_0}{2\pi^2}F_{\mu\nu}^aF^{a\mu\nu}+\cdots\right].
\]
Gauge normalization $F^2/(4g_U^2)$ fixes $A_0=\pi^2/(2g_U^2)$, hence
\[
\frac1{16\pi G}=\frac{\Lambda_{\rm grav}^2}{\eta g_U^2},\qquad
\frac{G\Lambda_{\rm grav}^2}{g_U^2}
=\frac\eta{16\pi}=0.119282610921289.
\]
There is no independent fitted Newton amplitude. The later normalized cutoff relation is $\Lambda_{\rm grav}^2/\mu_U^2=5/\sqrt6$.

Around a stationary flat background, in the low-curvature regime, the extracted leading Einstein Hessian and inverse are
\[
K_{\rm EH}=\frac{\Lambda_{\rm grav}^2}{2\eta g_U^2}p^2(P_2-2P_{0s}),\qquad
D_{\rm EH}=\frac{2\eta g_U^2}{\Lambda_{\rm grav}^2p^2}
(P_2-\tfrac12P_{0s}).
\]
The common coframe couples each matter sector through its stress vertex $T^{\mu\nu}/2$. Conserved-source exchange has numerator $T_1:T_2-T_1T_2/2$ and gives $-Gm_1m_2/r$. Tensor factors, gauge null directions and the unique infrared zero of a concrete A4 gradient are checked. This derives the conditional universal Einstein exchange; it is not the exact inverse of the whole unexpanded trace.

## 5. Derive the vacuum condition before calling that pole physical

The same trace has volume coefficient
\[
C_0=\frac{12\Lambda_{\rm grav}^4}{\eta^2g_U^2},\qquad
C_R=\frac{\Lambda_{\rm grav}^2}{\eta g_U^2}.
\]
It therefore has a nonzero flat-space tadpole. The truncated action $\int\sqrt g(C_0-C_RR)$ would imply
\[
\Lambda_{\rm cc}=\frac{C_0}{2C_R}=\frac{6\Lambda_{\rm grav}^2}{\eta},
\qquad R=\frac{24\Lambda_{\rm grav}^2}{\eta}.
\]
Its curvature expansion parameter is $\eta R/\Lambda_{\rm grav}^2=24$, outside a small-curvature truncation. That apparent stationary solution cannot justify the flat-space pole or the derivative expansion.

There is an exact stronger result for the standalone massless exponential trace with fixed $A_0,\eta,\Lambda_{\rm grav}$. Under uniform coframe scaling $g\mapsto s^2g$, $D\mapsto s^{-1}D$, and on a compact carrier
\[
\frac{dS_{\rm sp}}{d\log s}
=\frac{2A_0\eta}{\Lambda_{\rm grav}^2s^2}
\operatorname{Tr}\left[D^2e^{-\eta D^2/(\Lambda_{\rm grav}^2s^2)}\right]>0
\]
whenever there is a nonzero Dirac mode. The unsubtracted standalone trace has no unconstrained homothetic stationary vacuum. Its Einstein coefficient remains well defined, but a physical stationary-background pole requires a vacuum/volume mechanism.

The recovered full Cathedral interface already includes its cosmological/state terms, breathing potential, Higgs and heavy sectors. Their joint scale/source equation can alter this conclusion. The exact monotonicity theorem does not apply to that full interacting action without checking those terms. A fixed-volume condition, explicit vacuum subtraction or derived sector cancellation must be part of the selected model; none is added here merely to force flat space.

The recovered four-sheet calculus belongs inside the weighted Hamiltonian/transfer and does not establish $\operatorname{Tr}f(D/\Lambda)=-\log\operatorname{Tr}T[g]^n$. Proving that physical action identification and its joint vacuum equation remains necessary before transporting the conditional Einstein residue into the selected theory. The cutoff $\Lambda_{\rm grav}$ and cosmological curvature $\Lambda_{\rm cc}$ are different quantities.

## 6. Result and reproducibility

| Object | Derived result | Exact boundary |
|---|---|---|
| Canonical species construction | Golden block/ratio, typed affine loads, decoder ranks, source derivatives and full64 completion witnesses | The supplied block/entropy/symmetry data admit inequivalent source actions; a unique nonlinear selected law does not follow from them. |
| Photon | Complete whole-torus Gaussian incidence, hidden-band integration and unfitted $Z_\gamma=\sqrt5c/2$ | The literal hat and joint charged-history source are not proved equivalent to that Gaussian action. |
| Gravity | Common-trace Einstein coefficient, tensor exchange and exact volume/scale condition | A physical pole requires the full selected action and a stationary vacuum; the standalone trace cannot supply that vacuum. |

The proofs resolve concrete algebraic questions rather than naming unspecified objects “unresolved.” They also establish why the recovered constraints do not yet entail one predictive theory of nature. Choosing one source/vacuum completion and presenting its outputs as forced predictions would add an assumption. No such assumption or observational fit has been concealed.

Detailed proofs and source provenance are in `derive_three_work/species/`, `derive_three_work/photon/`, `derive_three_work/gravity/`, `derive_three_work/recovery/`, and `derive_three_work/operator_dictionary/`. Use `python3 run_three_derivations.py` from the package root to reproduce the new calculations with the bundled prerequisite arrays. The earlier selected-cell and full-current calculations remain available through the preceding runners. Bounded chat retrieval and the named full recovered sources do not constitute access to one hundred complete conversations.