# URT–ZPE: constructive three-layer vacuum refinement with an exact energy ledger

**Date:** 21 November 2026. **Scope:** standalone prime-flux URT zero-point-energy model, extending commit `9e3fc93` and **not** RH or Cathedral physics. **Classification:** THEOREM for the declared gapped magnetic Gaussian Hamiltonian; conditional gap-floor refinement principle. **Physical status:** complete constructive lattice growth and energy bookkeeping; primitive emergence, energy reservoir, metric coupling still open.

## Original operator, preserved verbatim

Let \(\varphi=(1+\sqrt5)/2\), \(\theta=2\pi/\varphi^2\), \(f=\operatorname{Arg}(\epsilon e^{-i\theta})\), \(\epsilon=\pm1\), and \(F=|f|\). On any rectangular box \(\Lambda_{a,b,c}=\{0,\dots,a-1\}\times\{0,\dots,b-1\}\times\{0,\dots,c-1\}\), \(a,b,c\ge2\), preserve the original links

\[
U_x(x,y,z)=e^{ifz},\qquad U_y(x,y,z)=e^{ifx},\qquad U_z(x,y,z)=e^{ify}.
\]

Each positive edge contributes its original rank-one magnetic square to \(L_{a,b,c}\). The *same* canonically quantised complex Gaussian vacuum has ground energy \(E_{a,b,c}(\ell)=(\hbar c/\ell)\operatorname{Tr}\sqrt{L_{a,b,c}}\). The prior manuscript proves that every 2D rectangular flux sheet obeys \(L_{2D}\succeq g_2I\), \(g_2=1-\cos(F/4)>0\), while full 3D boxes satisfy \(L_{3D}\succeq \tfrac32g_2 I\) and \(L_{3D}\preceq12I\).

## Theorem 1 — exact three-stage layer growth, no hidden bonds

Enlarge a cube through the following native box sequence:

\[
(n,n,n)\to(n,n,n+1)\to(n,n+1,n+1)\to(n+1,n+1,n+1).
\]

The respective new sheets contain \(n^2\), \(n(n+1)\), and \((n+1)^2\) sites. Each new site is joined to precisely one old site across the newly added face, by **the original magnetic link of the full enlarged graph**. Therefore the total number of new sites and seam edges is exactly

\[
\Delta M=n^2+n(n+1)+(n+1)^2=(n+1)^3-n^3.
\]

For each stage write \(L_{\rm joined}=L_0+B\), with \(L_0=L_{\rm old}\oplus L_{\rm sheet}\) (in native site order) and \(B=\sum_{\text{seam links}}bb^\dagger\succeq0\). The seam edges are vertex-disjoint, giving **exactly**

\[
B^2=2B,\qquad \operatorname{Tr}B=2A,
\]

where \(A\) is the number of new sites in the particular sheet. The old volume and new 2D sheet both contain nontrivial original flux plaquettes, and their true-degree Laplacians have minimum eigenvalue at least \(g_2\). Hence for the full joining path \(L_t=L_0+tB\), \(0\le t\le1\),

\[
\boxed{g_2I\preceq L_t\preceq12I.}
\]

The upper bound uses the graph maximum-degree inequality; reducing seam weights never increases the upper spectral bound. The joining operation can therefore be made adiabatic at sufficiently slow physical switching *once the sheet has been prepared*; this does not derive its energy source or the rate of preparation.

**Exact energy ledger:** Write \(\mathcal E(L)=\operatorname{Tr}\sqrt L\), in units of \(\hbar c/\ell\). For each step,

\[
\boxed{\mathcal E(L_{\rm joined})-\mathcal E(L_{\rm old})
=\mathcal E(L_{\rm sheet})+w_{\rm seam},}
\]

where the *positive* joining work is

\[
w_{\rm seam}=\tfrac12\int_0^1\!\operatorname{Tr}(B L_t^{-1/2})\,dt,
\qquad \boxed{\frac{A}{\sqrt{12}}\le w_{\rm seam}\le\frac{A}{\sqrt{g_2}}.}
\]

Proof: differentiability of the trace square root on positive operators gives the integral. The operator-monotonic inverse square root satisfies \(12^{-1/2}I\preceq L_t^{-1/2}\preceq g_2^{-1/2}I\); multiply by \(B\succeq0\), trace, and use \(\operatorname{Tr}B=2A\). Sum three steps to obtain

\[
\boxed{\frac{\Delta M}{\sqrt{12}}\le W_{\rm seams}/(\hbar c/\ell)
\le\frac{\Delta M}{\sqrt{g_2}},}
\]

with strictly positive and independently prepared sheet energies. The energy increment is not “free vacuum creation.” It is strictly positive; by induction \(\mathcal E(L_{n+1})>\mathcal E(L_n)\).

## Theorem 2 — explicit surface error and bulk cost per carrier

The original manuscript establishes \(\mathcal E(L_n)=n^3u_3(F)+O_F(n^2)\), where \(u_3(F)=\langle\delta_0,\sqrt{L_\infty}\delta_0\rangle>0\) is the exact native infinite-volume local spectral trace. Here is a **new fully explicit bound**.

Set \(g_3=\frac32g_2\), \(q=1-g_3/12\in(0,1)\), and

\[
\boxed{C_F=12\sqrt{12}\frac{q}{(1-q)^2}.}
\]

Then for every integer \(n\ge2\),

\[
\boxed{|\mathcal E(L_n)-n^3u_3(F)|\le C_F n^2.}
\]

**Proof.** Define \(Y_n=I-L_n/12\), \(Y_\infty=I-L_\infty/12\), so \(0\preceq Y\preceq qI\). The uniformly convergent binomial series is \(\sqrt L=\sqrt{12}\sum_{j\ge0}(-1)^j\binom{1/2}{j}Y^j\). For \(j\ge1\), the diagonal entries of \(Y_n^j\) agree with the infinite-volume local entries at sites more than \(j\) graph steps from the physical boundary: the native magnetic links coincide there. At most \(6jn^2\) sites are within \(j\) steps of any cube face (this overcounts corners, which is harmless). Every diagonal difference is at most \(2q^j\), and \(|\binom{1/2}{j}|\le1\). Thus the absolute trace difference is at most \(\sqrt{12}\sum_{j\ge1}(6jn^2)(2q^j)=C_F n^2\). QED.

For any integers \(m>n\ge2\), subtraction gives the rigorously bounded **bulk energy cost of a newly added carrier**:

\[
\boxed{\left|\frac{\mathcal E(L_m)-\mathcal E(L_n)}{m^3-n^3}-u_3(F)\right|
\le C_F\frac{m^2+n^2}{m^3-n^3}.}
\]

In particular, for every fixed dilation factor \(\alpha>1\), with \(m=\lceil\alpha n\rceil\), the mean energy cost per added physical site converges **rigorously** to \((\hbar c/\ell)u_3(F)\), with explicit \(O_F(1/n)\) control. This is a derivation from the same graph Hamiltonian, not an independent vacuum-energy or “chemical potential” insertion. \(C_F\) is deliberately conservative; it is an analytic bound, not a fitted number.

## Theorem 3 — minimal gap-floor-preserving URT refinement

The primitive URT radius update is \(R_{k+1}=\alpha R_k\), \(\alpha=\pi/e>1\). Suppose the **additional, precisely stated operational requirement** is that the guaranteed *physical* magnetic oscillator gap floor does not fall as the space expands. The uniform bound is \(\omega_{\rm floor}=c\sqrt{g_3}/\ell\), with physical spacing \(\ell=R/N\); hence this requirement is equivalent to \(\ell_{k+1}\le\ell_k\) and therefore

\[
N_{k+1}\ge\alpha N_k.
\]

Since adding sites and native links requires strictly positive energy by Theorem 1, the **minimum-carrier**, hence minimum incremental lattice energy at the new physical size, satisfying this requirement is the uniquely specified integer map

\[
\boxed{N_{k+1}=\lceil\alpha N_k\rceil.}
\]

For fixed *cosmological* scale step \(R_{k+1}/R_k=\alpha\), define finite-step rates \(H_k=\ln\alpha/\Delta t_k\), \(\Gamma_k=3\ln(N_{k+1}/N_k)/\Delta t_k\). From \(\alpha N_k\le N_{k+1}<\alpha N_k+1\), without numerical fitting,

\[
\boxed{3\le\frac{\Gamma_k}{H_k}< 3+\frac{3}{\alpha N_k\ln\alpha},
\qquad\lim_{k\to\infty}\Gamma_k/H_k=3.}
\]

The mathematical prescription is constructive and integer-valued; it also preserves the original golden flux on every sheet and supplies the full joining-work ledger. With the **already derived** coarse-grained source equation \(w_{\rm eff}=1/3-4\Gamma/(9H)\), this predicts \(w_{\rm eff}\to-1\) from below in the discrete minimal-gap-floor refinement model. The effective pressure is still a source-corrected fluid quantity, **not** a covariant stress tensor from primitive URT.

**Critical distinction.** The *requirement of a nonsoftening physical frequency floor is an additional stability postulate*. The source of physical action/length, the external energy needed to prepare each layer, the dynamical reason that URT enforces the postulate, and the curved-space gravitational action are **not** derived. This is a new exact *conditional selection mechanism*, not a completed zero-parameter cosmological theory. In particular it does not manufacture a value for \(G\), \(\ell\), or observed dark energy.

## Local executed certificate and numerical evidence

Run `python research_archive/2026-11-21_urt_zpe_three_layer_refinement/URT_ZPE_REFINEMENT_CERT.py` (NumPy). For each sector it constructs **all** original magnetic links, forms native old/sheet/seam blocks for each of three distinct face orientations, verifies \(B^2=2B\), correct block identity and work accounting, and checks spectra along the gapped joining path.

| cube growth | new | \(\epsilon=+\) prepared sheet energy | \(\epsilon=+\) seam work | \(\epsilon=-\) prepared sheet energy | \(\epsilon=-\) seam work |
|:--|--:|--:|--:|--:|--:|
| \(2^3\to3^3\) | 19 | 27.482314436123 | 11.160540180516 | 26.899167406949 | 11.692479446682 |
| \(3^3\to4^3\) | 37 | 58.888225997184 | 20.191543544636 | 58.302510150067 | 20.536715673522 |
| \(4^3\to5^3\) | 61 | 101.812219659042 | 32.097163386780 | 101.031453268652 | 32.490081703372 |

Every energy in this table is divided by \(\hbar c/\ell\). The sum of sheet preparation and seam work equals the direct energy difference of complete native cubes. The explicit surface constant is approximately \(85306.5\) in the plus sector, \(9.04\times10^6\) in the minus sector; these are weak but valid and independent of system size. The URT integer rate bound was checked over seven successive steps starting at \(N_0=12\). The **theorems** above use exact inequalities; the finite computation is a regression, not a proof substitute.

**RESUME HERE:** Derive the physical fixed-gap selection rule and energy reservoir from primitive URT (not a new fitted pressure source). A physically complete result additionally requires a covariant field action and conservation of *total* stress energy, with actual cosmological observables and a selected absolute length scale. Never confuse the conditional minimal-refinement theorem with having derived these physical inputs.
