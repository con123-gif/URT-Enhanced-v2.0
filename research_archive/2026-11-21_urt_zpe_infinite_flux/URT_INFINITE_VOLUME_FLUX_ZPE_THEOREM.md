# URT prime magnetic vacuum — exact strict infinite-volume ZPE sector ordering

**Date:** 2026-11-21. **Research track:** standalone prime/URT magnetic ZPE, explicitly **not** the separate Cathedral-ARF or Riemann-Hypothesis tracks.  
**Result:** THEOREM for a previously declared uniform-flux graph Laplacian and an explicitly assumed canonical complex Gaussian oscillator; **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. No fitted constants, cosmological target, cutoff or infinite-size extrapolation enters the sign proof.

## 1. Frozen model and continuity

The earlier finite-loop and connected-lattice constructions are preserved *unaltered*:

- `research_archive/2026-11-21_urt_zpe_gaussian_joint/URT_JOINT_ZPE_ENTROPY_THEOREM.md` gives a common four-site oscillator vacuum and gauge-invariant site entanglement.
- `research_archive/2026-11-21_urt_zpe_lattice_area_law/URT_ZPE_AREA_LAW_THEOREM.md` extends it to uniform-flux finite square lattices and proves a uniform gap, a two-dimensional Gaussian entanglement area bound, and a finite bulk ZPE density.

Use precisely the existing golden angle and quadratic-reciprocity sector distinction:

\[
\phi=(1+\sqrt5)/2,\quad \theta=2\pi/\phi^2,
\quad z_+=e^{-i\theta},\quad z_-=-e^{-i\theta}.
\]

Their gauge-invariant flux magnitudes are \(F_+=\theta\) and \(F_-=\pi-\theta\).  Let \(A_F\) be the uniform magnetic adjacency on \(\ell^2(\mathbb Z^2)\), with horizontal links 1, vertical links \(e^{ixF}\), and conjugate reverse links; define \(L_F=4I-A_F\).  These are the **bulk limits** of the true-degree connected magnetic graph Laplacians, not the separately discussed finite-grid compression \(4I-A_4\).  The lattice action is assumed canonically quantised into one complex harmonic oscillator per physical site with common \(\omega_0\); hence the dimensionless zero-point energy per site is the normalized local trace

\[
 u(F)=\tau_0(\sqrt{L_F})=\langle\delta_0,\sqrt{L_F}\,\delta_0\rangle.
\]

Prior work proved that \(N^{-2}\operatorname{Tr}\sqrt{L_N}\to u(F)\); the present work establishes the previously open **strict sign** of the limit difference.

## 2. The theorem

**THEOREM.** The two golden magnetic reciprocity sectors obey

\[
 \boxed{u(F_+)-u(F_-)>0.0022111312451>0.}
\]

The strict positive inequality is backed by an *exact rational arithmetic* certificate, using Gauss-Radau and Gauss quadrature of their intrinsic spectral measures. Neither a floating-point evaluation nor a choice of a dark-energy value is needed to prove the sign.

An independent n=12 local infinite-Krylov quadrature yields the tighter **numerical**, rather than rational-certified, interval

\[
 0.008277852862396\lesssim u(F_+)-u(F_-)\lesssim0.008277852880200,
\]

and a numerical estimate \(u_+-u_-=0.00827785286373\ldots\).  All results concern a **relative** oscillator ZPE *in units of* \(\hbar\omega_0\) per complex lattice site. Neither \(\omega_0\), physical lattice spacing, gravity nor actual dark energy is derived.

## 3. Proof — magnetic spectral measure and a rigorous positive gap

On the infinite square lattice, every elementary edge belongs to two plaquettes and every vertex to four.  The four-site magnetic cycle with flux \(F\) has bottom eigenvalue

\[
 \lambda_{\rm loop}(F)=2-2\cos(F/4)>0.
\]

Summing the local energy inequality over all plaquettes and taking closure from finitely supported states gives

\[
 L_F\succeq 2\lambda_{\rm loop}(F)I
 =4[1-\cos(F/4)]I.
\]

For the golden \(+\) sector the **exact interval certificate** establishes \(4[1-\cos(\theta/4)]>1/2\); therefore \(L_+\succeq\frac12 I\).  Both sectors are strictly positive. We use the rational number \(a=1/2\) *only as a rigorously proven auxiliary spectral lower bound*, not a physical normalization or model constant.

Let \(\mu_F\) denote the normalized spectral probability measure of \(L_F\) at \(\delta_0\). By bipartiteness all odd centered adjacency moments vanish. Direct counting of the complete set of 4-step closed magnetic lattice walks gives

\[
\tau_0(A_F^2)=4,\qquad
\tau_0(A_F^4)=28+8\cos F.
\]

There are precisely 28 zero-area returns, four returns of signed area +1 and four of signed area -1. Thus the first three Lanczos diagonal coefficients for the spectral measure are exactly 4, with squared off-diagonals

\[
 b_1^2=4,\qquad b_2^2=3+2\cos F.
\]

These are the only magnetic moment inputs used in the strict sign proof.

## 4. Three-node Gaussian *upper* bound for the minus sector

Write \(c=\cos\theta<0\). The minus-sector flux satisfies \(\cos F_-=-c\).  Its three-node Gauss-Jacobi matrix is

\[
 J_{-,3}=\begin{pmatrix}4&2&0\\2&4&\sqrt{3-2c}\\0&\sqrt{3-2c}&4\end{pmatrix}.
\]

For \(f(x)=\sqrt x\), the sixth derivative is negative everywhere on \(x>0\), so three-node Gauss quadrature **overestimates** \(\int f\,d\mu_-\).  Its first-vector square-root matrix element can be reduced to the exact elementary expression

\[
 \boxed{u_-\le U_-(c):=
 \frac{2\bigl[\sqrt{4-\sqrt{7-2c}}+\sqrt{4+\sqrt{7-2c}}\bigr]
          +2(3-2c)}{7-2c}.}
\]

The exact Fraction+integer-root certificate proves \(U_-<1.923\); no floating-point inequality is used for this fact.

## 5. Three-node Gauss-Radau *lower* bound for the plus sector

Fix the rigorously permitted left endpoint \(a=1/2\). The plus-sector squared off-diagonal is \(b^2=3+2c\). The Radau-modified Jacobi matrix

\[
 J^R_{+,3}=\begin{pmatrix}
 4&2&0\\ 2&4&\sqrt{b^2}\\0&\sqrt{b^2}&a+\frac{14}{33}b^2
 \end{pmatrix}
\]

has one exact eigenvalue \(a\). Its other eigenvalues are

\[
 r_\pm=\frac{51}{11}+\frac{14c}{33}
 \pm \frac{\sqrt{196c^2-468c+3213}}{33}.
\]

The spectral weight of the \(a\) eigenvalue is

\[
 w_a=\frac{64(3+2c)}{1869+520c}.
\]

For either \(r\in\{r_-,r_+\}\), with \(r'\) the other root, the corresponding weight is

\[
 w_r=\frac{(r-4)\left(r-a-\frac{14}{33}(3+2c)\right)-(3+2c)}{(r-a)(r-r')}.
\]

All weights are positive and sum to one.  Since the fifth derivative of \(\sqrt x\) is positive on \([a,8]\), three-node Gauss-Radau quadrature with fixed left endpoint **underestimates** the local spectral trace. Hence

\[
 \boxed{u_+\ge R_+(c):=w_a\sqrt{1/2}+w_{r_-}\sqrt{r_-}+w_{r_+}\sqrt{r_+}.}
\]

The exact Fraction+integer-root certificate proves \(R_+>1.924\). Combining yields the conservative elementary theorem \(u_+-u_->0.001\). The same interval computation gives the stronger explicitly certified bound \(u_+-u_->0.0022111312451\).

**Why this is a proof rather than a fit:** \(c\) is obtained from the original \(2\pi/\phi^2\). The certificate encloses \(\pi\) by Machin's arctan formula and alternating rational series, \(\sqrt5\) and all algebraic radicals by exact integer-square-root intervals, and \(\cos\theta\) by rational Taylor polynomials with rigorous Lagrange error bounds. Its PASS assertions are exact comparisons between positive rational numbers. No numerical data, arbitrary target or external coefficient appears anywhere upstream.

## 6. Heat-trace form — microscopic frustration generates the macroscopic difference

The same difference can be expressed as a convergent continuum of return-walk traces, with no change of Hamiltonian:

\[
 \sqrt{x}=\frac{1}{2\sqrt\pi}\int_0^\infty
 \left(1-e^{-tx}\right)t^{-3/2}\,dt,
\]

so

\[
 \boxed{u_+-u_- =\frac{1}{2\sqrt\pi}\int_0^\infty
 \left[\tau_0(e^{-tL_-})-\tau_0(e^{-tL_+})\right]t^{-3/2}\,dt.}
\]

The flux enters the heat trace through closed magnetic walks:

\[
 \tau_0(e^{-tL_F})=e^{-4t}\sum_{n=0}^{\infty}
 \frac{t^n}{n!}\tau_0(A_F^n).
\]

The first **difference** is at fourth order, exactly

\[
\tau_0(A_-^4)-\tau_0(A_+^4)=-16\cos\theta>0.
\]

This establishes the microscopic provenance of the heat-trace effect. The *global sign of the integrated square-root trace* is established independently by the Radau/Gauss bounds above; **we do not presume each heat-time contribution is positive**.

## 7. Independent numerical check (not the proof of the sign)

`URT_BULK_LANCZOS_INDEPENDENT.py` applies the infinite Harper operator directly to \(\delta_0\). After \(n\) iterations all its Krylov vectors have support within distance \(n\), so finite working arrays recover the **exact infinite-volume moments for those iterations**; this is not extrapolation from finite square lattices. The script computes Gauss upper and Radau lower bounds at the actual proven flux gaps for increasing Krylov dimension.

| Krylov size | Lower bound \(u_+-u_-\) | Upper bound \(u_+-u_-\) |
|---:|---:|---:|
| 3 | 0.003288822744336 | 0.027205104035582 |
| 4 | 0.007804426624186 | 0.013946832685438 |
| 6 | 0.008275253124274 | 0.008543848865191 |
| 8 | 0.008277834094573 | 0.008278425792177 |
| 10 | 0.008277852808182 | 0.008277853028838 |
| 12 | 0.008277852862396 | 0.008277852880200 |

The table is double-precision numerical quadrature; tiny rounding errors are possible, and its apparent intervals are **not** substituted for the exact rational certificate. The recorded 3-point certificate uses the more conservative rational endpoint \(a=1/2\), which yields the strict lower difference 0.00221113… without assuming the actual magnetic gap value as a numeric constant.

## 8. Physical interpretation and exact next step

**Closed internal mathematical result:** A declared URT golden-angle, noncommuting flux twist produces a strictly positive **bulk** difference of Gaussian oscillator zero-point energies between the \(\epsilon=+1\) and \(\epsilon=-1\) sectors. The proof uses the same infinite lattice for which the area law and bulk thermodynamic limit were previously established, and the first flux fingerprint is the four-step Wilson loop. All previously valid four-site calculations remain intact; no modified stiffness or horizon entropy is mixed into this proof.

**Still open:** the arithmetic twist is a candidate extension of primitive URT, not uniquely implied; canonical quantisation and the physical frequency \(\omega_0\) are explicit assumptions. This result is a **relative** energy density, not an absolute renormalized vacuum contribution and not a derivation of gravity, dark energy, an equation of state, or a cosmological scale. The physical reference state and backreaction must be established from the same dynamics.

**RESUME HERE:** Derive the boundary-energy response \(E_0(N)-N^2u(F)\) and its dependence on a physical length/area deformation, from this *unchanged* Hamiltonian, then compare its entropy/pressure response with the already derived Gaussian area bound. Never insert \(\omega_0\), an independent cosmological entropy, or a 4.38% target to force closure.