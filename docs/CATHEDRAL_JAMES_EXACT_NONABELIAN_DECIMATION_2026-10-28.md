# Cathedral × Bhattacharjee–Bhattacharya–Lockwood: an exact non-Abelian entropy-to-Wilson and one-step RG calculation

**28 October 2026. Status:** Mathematical identities and tested exact compact-group decimation, **conditional** on complexifying the two hidden quartets and choosing the balanced exchange embedding and the plaquette-relative-entropy action. This advances the gauge interface beyond its previous Gaussian comparison without asserting a continuum mass-gap proof. No frozen Cathedral number is changed, and no measured coupling is used.

## 1. Frozen 4+4 state and a representation-sensitive group action

Keep the complete Cathedral programme (five Platonic cell complexes, H64 history, D6/H3 and four-sheet calculus) as the underlying source. For this gauge interface, the finite 8-channel master state is

\[\rho_*=(p I_4)\oplus(r I_4),\quad p=[4(1+\Delta^2)]^{-1},\quad r=\Delta^2p,\]

\[\Delta=3/20-80\pi/(1053\varphi),\qquad \kappa=-\ln\Delta\,(1-\Delta^2)/(1+\Delta^2)=5.995723686480836\ldots\]

Use the **complexification** of the 4+4 carrier; a complex SU(3) triplet cannot be represented nontrivially on an uncomplexified real 4-vector. For a specified unitary \(U_4:G\to U(4)\), define the balanced exchange

\[S=2^{-1/2}\begin{pmatrix}I&I\\-I&I\end{pmatrix},\qquad R(g)=S\operatorname{diag}(U_4(g),I_4)S^\dagger.\]

A direct block-trace calculation proves the **exact** identity (no small-field approximation)

\[\boxed{D(\rho_*\Vert R(g)\rho_*R(g)^\dagger)=\frac\kappa4[4-\Re\operatorname{Tr}U_4(g)].}\]

This is a nonnegative conjugacy-invariant class function. Its sum over plaquette holonomies is a gauge-invariant, non-Abelian Wilson-type action **provided** this relative entropy is stipulated to be the Gibbs action per plaquette. That stipulation and balanced embedding remain microscopic selection questions.

## 2. A representation-index equality that removes the previous SU(2)/SU(3) normalization mismatch

The four-complex-dimensional carrier permits the two block-preserving representations

\[U_{4,2}(u)={\bf1}\oplus u_{\mathbf2}\oplus{\bf1}\quad(u\in SU(2)),\]
\[U_{4,3}(v)={\bf1}\oplus v_{\mathbf3}\quad(v\in SU(3)).\]

Their entropy actions are **exactly Wilson actions at every group element**, with

\[\boxed{\beta_W^{(2)}=\kappa/2=2.997861843240418\ldots,\quad\beta_W^{(3)}=3\kappa/4=4.4967927648606265\ldots.}\]

Using conventional Wilson normalizations \(\beta_W^{(N)}=2N/g_N^2\), these give

\[\boxed{g_2^2=g_3^2=8/\kappa=1.3342843030005551\ldots}.\]

The earlier \(g_3^2=2g_2^2\) mismatch in the **two-doublet** SU(2) representation was caused by using two copies of the fundamental on the complex four-carrier. The unique nontrivial four-dimensional SU(2) representation of total fundamental Dynkin index \(1/2\) is \({\bf2}\oplus{\bf1}\oplus{\bf1}\). The possible SU(2) decompositions \(4,3+1,2+2,2+1+1,1+1+1+1\) have total indices \(5,2,1,1/2,0\), respectively. The \({\bf3}\oplus{\bf1}\) SU(3) representation has index \(1/2\). Therefore **requiring the already-retained parent equality** \(g_2=g_3\) and a nontrivial four-complex-dimensional SU(2) representation selects the one-doublet/two-singlet option uniquely *within this chosen representation class*.

This conditional representation selection is algebraically exact, but **not** a proof that the original source-loaded URT transfer forces the chosen complexification, the relative-entropy-to-action rule, or the underlying four-dimensional unitary representations. It also does not settle U(1) hypercharge normalization or scale running.

## 3. Actual compact SU(2) integration, not a Gaussian substitution

Consider **the genuine SU(2) Wilson measure** at the index-matched coefficient \(\beta=\kappa/2\):

\[S_W(U)=\beta\sum_p(1-\Re Q_p),\qquad U_e\in SU(2)=S^3.\]

For any link \(e\), its six plaquettes contribute

\[S_{\mathrm{six}}=6\beta-\beta\,\Re(U_e B_e),\qquad B_e=\sum_{p\ni e}s_{ep}\in\mathbb H\]

where each staple \(s_{ep}\) is a unit quaternion built from the other three links of the oriented plaquette. The two orientations are accounted for by quaternion conjugation. Haar invariance gives the **exact, nonperturbative** integral

\[\boxed{\int_{SU(2)}e^{-S_{\mathrm{six}}}\,dU_e=e^{-6\beta}\frac{2I_1(\beta|B_e|)}{\beta|B_e|}.}\]

The integral is smooth at zero, where the Bessel quotient is 1.

Let \(E_0=\{(x,0):x\in(2\mathbb Z)^4\}\) on a periodic even four-dimensional lattice of side divisible by four. **No plaquette contains two selected links**, because the only pairs of direction-0 links in a plaquette have bases differing by one unit of a transverse coordinate. Thus the full Haar integration over \(E_0\) factorizes exactly:

\[\boxed{S_{\rm eff}(U_{E\setminus E_0})=\beta\!\sum_{p:\partial p\cap E_0=\varnothing}\!(1-\Re Q_p)+\sum_{e\in E_0}\left[6\beta-\log\left(\frac{2I_1(\beta|B_e|)}{\beta|B_e|}\right)\right].}\]

The new local term is gauge invariant because \(B_e\mapsto g_{y}B_e g_x^{-1}\) under a gauge transformation \(U_e\mapsto g_xU_eg_y^{-1}\). The norm is invariant. This establishes one exact **gauge-covariant RG/marginalization step at the Cathedral-derived coupling**, without setting the non-Abelian group to a Gaussian field.

## 4. The new interactions forced by this exact step

Writing \(Z(t)=2I_1(t)/t\), its convergent local expansion is

\[\log Z(t)=\frac{t^2}{8}-\frac{t^4}{384}+\frac{t^6}{9216}+O(t^8).\]

Thus each integrated link generates

\[-\log Z(\beta|B_e|)=-\frac{\beta^2}{8}|\sum_{p\ni e}s_{ep}|^2+\frac{\beta^4}{384}|\sum_{p\ni e}s_{ep}|^4+\cdots.\]

Because \(|\sum s_p|^2=6+2\sum_{p<q}\Re(s_p\bar s_q)\), the **cross-staple coupling** at quadratic order is

\[\boxed{-\frac{\beta^2}{4}\sum_{p<q}\Re(s_p\bar s_q)}\]

with no inserted coefficient. At the selected SU(2) coefficient this is \(-2.246793907789209\ldots\) per staple pair in the local formal expansion. It is a series coefficient; its truncation is **not** a valid weak-coupling approximation at the selected \(\beta\simeq3\). The exact Bessel expression must be retained.

This exact result shows why renormalization cannot generally be represented by replacing one \(\beta\) with another \(\beta'\): integration produces linked multi-plaquette operators and therefore the whole effective interaction must flow. It suggests a role for Cathedral's 64-history operator as a structured carrier for those generated couplings, but an identification with the original \(T_*\) is **not yet derived**.

## 5. Reproduction and scope of checks

Runnable Python: `research_archive/2026-10-28_cathedral_james_yangmills/cathedral_exact_su2_decimation_2026_10_28.py`.

On a periodic 4D side-four lattice the code uses **1,024 quaternion links, 1,536 plaquettes, 16 exactly integrable selected links, and 96 touched plaquettes**, all disjoint as required. It verifies for randomized configurations:

- local action/staple identity residual \(\le 7.11\times10^{-15}\);
- independent Haar integral by one-dimensional quadrature versus Bessel at \(0\le t\le6\beta\), residual \(\le7.22\times10^{-16}\);
- gauge invariance of all selected staple norms, residual \(\le1.78\times10^{-15}\), and total Wilson action, residual \(\le1.82\times10^{-12}\);
- SU(2)/SU(3) entropy identities under 200 random examples, residual \(\le3.55\times10^{-15}\);
- exact common coupling \(g^2=8/\kappa\) from the selected representation indices.

The script is reproducible without experimental input; numerical tests support the analytically derived identities, not a continuum theorem.

## 6. Relation to James's averaged-cube mass-gap criterion

James's actual condition is on *conditional compact-group block laws*, not the Gaussian reference model:

\[D(n,\alpha):\quad K_c=\sum_{j\in c\setminus V}C_{V,j}\le\alpha(n/2)^4\qquad(\alpha<1).\]

This exact decimation now places genuine SU(2) conditional dynamics in the Cathedral bridge. However the single-link forest influence row sum equals \(3\beta\approx8.99358553>1\), and **the exact induced Bessel action alone does not bound the influence of an arbitrarily large non-Abelian cube**. In particular it does not prove the uniform \(D(n(a),\alpha)\) inequality as \(\beta_W(a)\to\infty\), nor the nontrivial Osterwalder–Schrader continuum limit. The present entropy coefficient is scale-independent; physically meaningful continuum tuning also remains to be derived from URT.

**Verified advancement:** conditional parent SU(2)/SU(3) coupling equality (fixing the earlier index mismatch), plus a fully exact, gauge-invariant non-Abelian first coarse-graining step rather than an unrelated Gaussian comparison. **Not claimed:** nonperturbative 4D SU(2)/SU(3) continuum mass gap.

## 7. A non-fitted *perturbative* scale trajectory from the resulting pure Yang–Mills actions

The constant entropy-derived \(\kappa\) can be used as an initial condition at a **reference lattice spacing** \(a_0\); it must not be interpreted as constant at every refinement. For **pure** SU(N) Yang–Mills, the standard one-loop ultraviolet beta function is

\[\mu\frac{dg_N}{d\mu}=-\frac{11N}{48\pi^2}g_N^3+O(g_N^5).\]

Combining this with \(\beta_W^{(N)}=2N/g_N^2\) gives the leading-log trajectory

\[\boxed{\beta_W^{(N)}(a)=\beta_W^{(N)}(a_0)+\frac{11N^2}{12\pi^2}\log\frac{a_0}{a}+\text{higher-loop corrections}.}\]

For dyadic refinement \(a=a_0/2^k\), the SU(2) initial value \(\kappa/2\) increases by \(\frac{11}{3\pi^2}\ln2=0.2575118068\ldots\) per level, while the SU(3) initial value \(3\kappa/4\) increases by \(\frac{33}{4\pi^2}\ln2=0.5794015654\ldots\). At levels \(k=0,4,8,16\), the leading-log values are respectively SU(2) \((2.99786,4.02791,5.05796,7.11805)\) and SU(3) \((4.49679,6.81440,9.13201,13.76722)\).

**Scope:** This supplies a concrete **perturbative** increasing-coupling trajectory with no empirical fit, conditional on selecting pure SU(2)/SU(3) Yang–Mills as the ultraviolet gauge action. It is not a nonperturbative derivation of the Cathedral-selected RG flow, does not fix the physical reference scale \(a_0\), and does not prove James's averaged-cube Dobrushin–Shlosman condition. A credible constructive strategy must now analyze the exact Bessel-generated multi-plaquette interactions along this running rather than repeatedly replacing them with a single effective Wilson coefficient.