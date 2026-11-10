# Coupled cycle 32 — dichotomy of supercritical and subcritical branches

Classification: **PROVED** (H2, H3, H4; H1 as an exact identity with a
$10^{-10}$ finite-difference residual; H5 for the spectral predictions
and the absence of a unique $\alpha_{\mathrm{eff}}$).
Advances a physical ARF? No.

## Dichotomy

**Supercritical** ($y_{\mathrm{even}} > y_c(T)$), cited from cycles 18,
23, 25, 28, 29 and alt 25, 29, 31–35, not recomputed: the origin is
unstable, the even $4_5$ channel condenses along the $A_4$ ray with
$Q_{\mathrm{geo}}(\Delta)=2$, the geometric $U(1)$ is Higgsed to
$\mathbb{Z}_2$, and the derived fermion-only vacuum is $A_e\equiv\pi$.
About that vacuum the GI transverse kernel is a positive isotropic
London mass, not a Maxwell term,
\[
\Pi_T(T=0)=\tfrac1{12}I_{19},\qquad
\Pi_T(T=\eta)=\frac{\tanh\bigl(10/(2\eta)\bigr)}{12}\,I_{19}.
\]
Cycle 29’s Frobenius projection confirms $m^2$ equal to those values
and $\kappa,\beta$ consistent with 0.

**Subcritical** ($y_{\mathrm{even}} < y_c(T)$): the vacuum is the origin
$r=0$ ($\Delta=0$). The geometric $U(1)$ is unbroken. Every observable
below is independent of the free parameter $y_{\mathrm{even}}$.

## Subcritical analysis

### T = 0 identity (H1)

The magnetic Laplacian satisfies $K[A]\succeq 0$ and
$\operatorname{Tr} K[A]=60$ for every real connection (verified on the
30 probes: $\min\lambda\ge -1.51\times 10^{-15}$,
$\max|\operatorname{Tr} K-60|=2.84\times 10^{-14}$). The $T=0$ Nambu
function is therefore
$\Omega_f[A]=-\frac12\operatorname{Tr} K[A]+\mathrm{const}$, exactly
independent of $A$. Numerically $\max|\Omega_f|=2.13\times 10^{-14}$
on those probes. The transverse Hessian is consistent with the zero
matrix: $\max|\Pi_T|=1.07\times 10^{-10}$ at $A=0$ and
$3.55\times 10^{-11}$ at $A=\pi$, which is finite-difference roundoff
in $(\Delta_\varepsilon\Omega)/\varepsilon^2$ rather than a physical
quadratic term (the same matrices have no Maxwell or identity
structure; their Frobenius residuals to both are $O(1)$ because the
norm itself is $10^{-10}$). There is no preferred flux at $T=0$: the
vacuum is the entire connection torus, and $1/\kappa$ is undefined.

### Spectra and the unpaired mode (item 2; H3)

Exact, and matched numerically to $10^{-15}$:
\[
\begin{aligned}
A=0&\colon& 0&\oplus(5-\sqrt5)^{\oplus 3}\oplus 6^{\oplus 5}\oplus(5+\sqrt5)^{\oplus 3},\\
A=\pi&\colon& 10&\oplus(5+\sqrt5)^{\oplus 3}\oplus 4^{\oplus 5}\oplus(5-\sqrt5)^{\oplus 3}.
\end{aligned}
\]
The constant / unpaired mode sits at $E=0$ ($A=0$) and $E=10$
($A=\pi$). At $r=0$ every kinetic eigenvalue is unpaired.

### Derived flux vacuum at $T=\eta$ (H2)

$\operatorname{Tr} K$ and $\operatorname{Tr}(K^2)$ are $A$-independent
($60$ and $360$). The first distinguishing invariant is
$\operatorname{Tr}(K^4)$: $14880$ at $A=0$ and $19680$ at $A=\pi$.
The high-$T$ expansion of $-T\log(2\cosh(\lambda/2T))$ then predicts
$\Delta\Omega(\pi)-\Delta\Omega(0)\approx 25/\eta^3=0.115984$ to leading
order. The exact evaluation at $T=\eta$ is
\[
\Omega_f(\pi)-\Omega_f(0)=0.08773582709207517>0.
\]
Forty random connections (seed 32, uniform on $[0,2\pi)^{30}$) all lie
strictly above $A=0$, with
$\Delta\Omega\in[0.028442,\,0.057059]$ and mean $0.041952$. Pure
gradients satisfy $\Delta\Omega=0$ to $2.13\times 10^{-14}$. The
derived $T=\eta$ vacuum among the tested points is therefore $A=0$.
This is the opposite of the supercritical (condensed) vacuum $A\equiv\pi$.

### Gauge invariance

Automatic at $r=0$ (Peierls covariance of $K[A]$, no charged
condensate). Verified: maximum residual $0$ at $T=\eta$ and
$<2\times 10^{-14}$ at $T=0$; directional Hessians along gradients
at most $2.4\times 10^{-9}$.

### GI transverse kernel at the derived $T=\eta$ vacuum (H3, H4)

About $A=0$, $T=\eta$, $\varepsilon=0.02$ (control $\varepsilon=0.05$
agrees to relative $1.5\times 10^{-4}$ in $c_I$ and
$2.5\times 10^{-4}$ in $\kappa_{\mathrm{iso}}$):

- positive definite: $\lambda(\Pi_T)\in[0.00118870,\,0.01118414]$;
- not identity-like: residual to $c_I I$ is $0.507$,
  $c_I=0.00632770$;
- Maxwell-like by the predeclared Frobenius test: residual to
  $\kappa_{\mathrm{iso}}\Delta 1_T$ is $0.06012<0.10$, with
  $\kappa_{\mathrm{iso}}=0.002061847$;
- not unique: generalised eigenvalues of
  $\Pi_T v=\kappa\,\Delta 1_T v$ lie in
  $[0.00155602,\,0.00213598]$, relative spread $0.305>0.05$.
  All nineteen values are positive and finite.
- $\kappa_{\mathrm{REM}}=\lambda_{\min}(\Pi_T)/\lambda_{\min}(\Delta 1_T)=0.001556023$.

Cycle 29’s complementary projection,
$\Pi_T=m^2 I+\kappa\Delta 1_T+\beta\Delta 1_T^2+R$, gives
\[
m^2=-1.709\times 10^{-4},\quad
\kappa=1.684\times 10^{-3},\quad
\beta=9.336\times 10^{-5},
\]
with $\rho_3=0.003475$, $w_m=0.0233$, $w_\kappa=0.815$,
$w_\beta=0.210$. The London piece is consistent with zero (the
geometric $U(1)$ is unbroken); the kernel is dominated by a Maxwell
term plus a substantial $\Delta 1_T^2$ correction, which is why the
generalised $\kappa_i$ are not unique. The three-parameter residual
is tiny, but $w_\beta>0.10$ so the cycle-29 uniqueness gate also
fails.

The unpaired mode at $E=0$ does not enter the quadratic Hessian
(its energy is $O(A^2)$, so its thermal free energy starts at
$O(A^4)$), matching H3. The kernel is the vacuum polarisation of
the gapped kinetic levels $5-\sqrt5$, $6$ and $5+\sqrt5$.

About the unstable point $A=\pi$ at $T=\eta$, $\Pi_T$ is negative
definite ($\lambda\in[-0.011872,\,-0.001876]$) and again
Maxwell-like with a negative coefficient, consistent with $A=\pi$
being a local maximum of a Maxwell-like functional.

### Massless photon and $\alpha_{\mathrm{eff}}$ (H4, H5)

A massless Maxwell photon with a unique positive $\kappa$ does
**not** exist on the subcritical branch:

- at $T=0$ the kernel vanishes identically (flat modulus, not Maxwell);
- at the derived temperature $T=\eta$ the kernel is positive and
  Maxwell-like, with a near-zero London mass, but $\kappa$ is not
  unique (spread $0.305$).

By the predeclared gate, $\alpha_{\mathrm{eff}}:=1/\kappa_{\mathrm{iso}}$
and $\alpha_{\mathrm{REM}}:=1/\kappa_{\mathrm{REM}}$ were **not**
compared to
$R_\alpha=3/(64\varphi)+1/(79\varphi^2)$. Look-elsewhere was not run.
No rewriting of $\kappa_{\mathrm{iso}}$, of $1/48$, or of the
projection coefficient $\kappa$ was promoted as an electromagnetic
coupling.

### Parameter-free subcritical predictions

Independent of $y_{\mathrm{even}}$:

- the two closed-form spectra above;
- the $T=0$ flatness identity $\Omega_f[A]\equiv\mathrm{const}$,
  $\Pi_T=0$;
- $\Omega_f(\pi)-\Omega_f(0)=0.08773582709207517$ at $T=\eta$;
- $\operatorname{Tr}(K_0^4)=14880$, $\operatorname{Tr}(K_\pi^4)=19680$;
- the $T=\eta$ kernel diagnostics recorded above.

None of these is an ARF identification.

## Integrity

Predeclaration sha256:
`68b447af0592a220013dd9029b1b0cb11a13f45a93f86e203d3c85cf016ffb8d`.
No ARF target entered $\Omega$ or $\Pi$. The joint $4_5$ potential
of the alt line (Z3 mixed minima, $A_4/D_3$ transitions) was not
duplicated.
