# Coupled cycle 33 — $T_c(y_{\mathrm{even}})$ and the derived temperature $\eta$

Classification: **PROVED** (H2, H3, H4; H1 for positivity and uniqueness
of $T_c$, with a low-$T$ plateau caveat recorded below).
Advances a physical ARF? No.

## Definition and reproduction

$T_c(y_{\mathrm{even}})$ is the unique $T\ge 0$ at which
$\chi(T_c)=c_{\mathrm{even}}/y_{\mathrm{even}}^2$, equivalently
$y_c(T_c)=y_{\mathrm{even}}$. The origin is linearly stable for
$T>T_c$ and unstable for $T<T_c$. The even-channel stiffness is the
frozen value $c_{\mathrm{even}}=\Delta^2 c_5=1.3555131567782033\times 10^{-6}$.
Primary kinetic: 12-site icosahedral graph Laplacian (the carrier of
$A$ in cycles 23–32). Control: the 13-site H13 Hodge kinetic of
cycle 18.

Cycle 18’s stored susceptibilities are reproduced with the original
Nambu function to relative error $0$ (well below the predeclared
$10^{-8}$):

| channel | $\chi(\eta)$ | $y_c(\eta)$ | $\chi(0)$ | $y_c(0)$ |
|---|---:|---:|---:|---:|
| ico | $0.038415791436818836$ | $0.005940144040707988$ | $0.09166640779767476$ | $0.003845446400083969$ |
| H13 | $0.037511483697016956$ | $0.006011318618427269$ | $0.07737952500974643$ | $0.004185418011108536$ |

$\|\Delta_{\mathrm{unit}}\|_F^2=2$ exactly on both embeddings, so the
predeclared high-$T$ diagnostic is
$\chi_{\mathrm{HT}}(T)=2/(8T)=1/(4T)$ and
\[
T_c^{\mathrm{HT}}(y_e)=\frac{y_e^2}{4\,c_{\mathrm{even}}}.
\]

Large-$T$ values of $\chi$ were evaluated with a numerically stable
rewrite of cycle 18’s $\Omega_f$ (the $nT\log 2$ pieces are cancelled
and $\log\cosh z$ uses its Taylor series for $|z|<0.1$). At $T=\eta$
the rewrite agrees with the original function to relative $1.9\times 10^{-7}$
in $\chi$, which is floating-point cancellation of $\log 2$ and does
not affect any inversion.

## $T_c(y_{\mathrm{even}})$ (primary: ico)

| $y_{\mathrm{even}}$ | $T_c$ | $T_c/\eta$ | $T_c^{\mathrm{HT}}$ | rel. HT error | $\eta>T_c$? |
|---:|---:|---:|---:|---:|---|
| $0.01$ | $18.270445$ | $3.047$ | $18.443200$ | $9.46\times 10^{-3}$ | no |
| $0.1$ | $1.844301\times 10^{3}$ | $307.60$ | $1.844320\times 10^{3}$ | $1.00\times 10^{-5}$ | no |
| $0.5$ | $4.610756\times 10^{4}$ | $7689.98$ | $4.610800\times 10^{4}$ | $9.52\times 10^{-6}$ | no |
| $1$ | $1.844301\times 10^{5}$ | $3.0760\times 10^{4}$ | $1.844320\times 10^{5}$ | $1.03\times 10^{-5}$ | no |
| $2$ | $7.377209\times 10^{5}$ | $1.2304\times 10^{5}$ | $7.377280\times 10^{5}$ | $9.67\times 10^{-6}$ | no |
| $5$ | $4.610756\times 10^{6}$ | $7.6900\times 10^{5}$ | $4.610800\times 10^{6}$ | $9.44\times 10^{-6}$ | no |
| $10$ | $1.844303\times 10^{7}$ | $3.0760\times 10^{6}$ | $1.844320\times 10^{7}$ | $9.45\times 10^{-6}$ | no |

H13 inversions agree with the same high-$T$ formula (identical
$\|\Delta\|_F^2$) once $T_c\gg\eta$. For every $y_e\le y_c(0)$ the
flag `never_condenses` would apply; no such value occurs in the
scanned list (the smallest scanned $y_e=0.01$ already exceeds
$y_c(0)\approx 0.00385$).

## Hypotheses

H1 (positivity and unique $T_c$). $\chi(T)>0$ on the whole grid.
For $T\gtrsim 1$ (the scale of the kinetic gaps $5-\sqrt5$, $6$,
$5+\sqrt5$) $\chi$ is strictly decreasing toward $0$. For
$T\ll 1$, $\chi(T)$ sits on a plateau at $\chi(0)$ to
$O(10^{-7})$; apparent ascents of at most $1.8\times 10^{-7}$ on
that plateau are floating-point (the $T=0$ formula
$-\frac12\sum(E_i-|\xi_i|)$ is recovered from
$-T\sum[\log\cosh(E_i/2T)-\log\cosh(|\xi_i|/2T)]$ by cancellation of
$O(1)$ terms to give an $O(s^2)$ difference). Because every
$y_e>y_c(0)$ has its target $\chi$ at or below $\chi(0)$, and
because $\chi(T)\to 0$ monotonically once $T$ is comparable to the
gaps, $T_c(y_e)$ exists and is unique for every such coupling, and
is strictly increasing in $y_e$. The predeclared wording “strictly
decreasing from $\chi(0)$” therefore holds physically on the
range that determines $T_c$, with a numerically flat plateau at
$T\ll 1$.

H2 (O(1) couplings sit far below $T_c$ at $\eta$). **PROVED.** For
every $y_e\in\{0.1,0.5,1,2,5,10\}$ one has $T_c\gg\eta$, from
$T_c(0.1)=307.6\,\eta$ to $T_c(10)=3.076\times 10^6\,\eta$. At the
normalisation $y_e=1$ used throughout alt 25 and cycles 19–29,
\[
T_c(1)=1.844301\times 10^5=3.075989\times 10^4\,\eta.
\]
Equivalently, $\eta$ lies below $T_c$ whenever
$y_e>y_c(\eta)\approx 0.005940$ (ico) or $0.006011$ (H13), which
includes the entire O(1) window. At the KMS temperature the even
channel is deep in the condensed phase for all O(1) Yukawas.

H3 (no derived temperature inverts this). **PROVED.** The only
derived temperature of the frozen programme is
$\eta=-\ln\Delta\approx 5.9957979867413025$. The modular state
$\rho^\star$ is not a temperature. A temperature
$T>T_c(y_e=10)\approx 1.84\times 10^7$ would be required to place
every O(1) coupling above $T_c$; nothing of that magnitude is
derived.

H4 (high-$T$ formula). **PROVED.** Relative error of
$\chi_{\mathrm{HT}}=1/(4T)$ against the computed $\chi$ (ico):
$8.54\%$ at $T=\eta$, $3.13\%$ at $T=10$, $0.033\%$ at $T=100$,
$0.0014\%$ at $T=1000$. For every O(1) coupling the inverted $T_c$
agrees with $T_c^{\mathrm{HT}}=y_e^2/(4c_{\mathrm{even}})$ to
relative $10^{-5}$. The comparison $T_c\gg\eta$ does not depend on
small-$T$ pairing details.

## Conclusion

There is no derived temperature that places the system above $T_c$
for all O(1) couplings. The unique derived temperature $\eta$ places
every O(1) even Yukawa deep in the supercritical (condensed,
London-massive) branch of the cycle-32 dichotomy.

No ARF comparison was performed. $T_c$ is not an ARF.

## Integrity

Predeclaration sha256:
`e1d03572834931ef0ffd9c1966d86f00bf9add575a1209aeb00720fe68197cfd`.
No ARF target was used. The overall $y_{\mathrm{even}}$ scale remains
free (cycle 22); this cycle does not fix it.
