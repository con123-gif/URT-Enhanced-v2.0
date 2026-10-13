# Dark information / URT halo dynamical audit — 2026-10-13

**Scope / precedence.** This is a *local no-go* for a minimal, static, covariant scalar-gradient realization of the proposed dark-information halo. It does not supersede the frozen finite URT, rail, BKM, or 13-site results and does not rule out all nonlocal or history-dependent Cathedral completions. It corrects the previous interpretation of a positive scalar-gradient energy density as automatically equivalent to cold gravitating matter. The core theoretical discussion in prior conversations remains primary provenance.

## Canonical input and conditional physical mapping

Delta = 3/20 - 80 pi/(1053 phi) = 0.00248918984042...
eta = -ln Delta; p_star = Delta^2/(1+Delta^2).
The October candidate took p(s)=[1+exp(8 Delta s)]^{-1} and r(s)=r0 (pi/e)^s.
Eliminating s gives

p(r) = 1/[1+(r/r0)^nu],
nu = 8 Delta/ln(pi/e) = 0.1375909239926...

The identification of the algorithmic spiral radius with a *spherically symmetric physical galaxy radius* is a physical hypothesis, not an output of the finite machine. At reference Rstar where p(Rstar)=p_star, r0/Rstar=Delta^(2/nu)=1.41094312e-38. No absolute galactic Rstar has been derived.

The commuting rail BKM metric is ds_I^2=dp^2/[p(1-p)]=du^2 with u=2 asin sqrt(p). Thus u'=-nu sqrt[p(1-p)]/r.

## Minimal covariant local completion: test and failure

For a conventional canonical kinetic term S_I=-K/2 int sqrt(-g) (partial u)^2, static spherical vacuum EOM is Laplacian(u)=0. Substitution of the URT-mapped population gives

Laplacian(u) = nu sqrt[p(1-p)] / r^2 * { (nu/2)(1-2p) - 1 }.

Since 0<nu<2 and 0<p<1, the expression is strictly negative for all finite r. At r=Rstar=1 it is -0.000318926493053, not zero. The conserved exterior flux r^2 u' increases in magnitude by factor 8.53503426 from Rstar to 10 Rstar. So the assumed profile cannot be sustained by the source-free canonical gradient action outside a localized baryonic source.

In a local orthonormal frame, its relativistic stress tensor is

T_(ab) = epsilon_I diag(1,1,-1,-1),
epsilon_I=K(u')^2/2.

The local active weak-field gravitational source epsilon_I + P_r + 2 P_t is zero (to linear order about Minkowski space). Thus the previous Newtonian exercise in which epsilon_I/c^2 was directly inserted as pressureless halo mass is **not** a self-consistent derivation of gravitational attraction. External sources or additional interactions have their own stresses and may change this conclusion.

A free homogeneous canonical scalar has equation-of-state w=1 and rho proportional to a^(-6), unlike cold matter w approximately 0 and rho proportional to a^(-3). Its scalar fluctuations also cannot be treated as pressureless cold matter without extra dynamics.

## Further conditional inverse-action calculations

A static *shift-symmetric* kinetic-only power L=-A X^n with X=(partial u)^2/2 could sustain the asymptotic u~r^(-nu/2) only with

n=1/2+1/(1+nu/2)=1.435632715... .

But then the energy falls as X^n ~ r^[-(3+nu/2)] = r^(-3.068795462), too steep to produce an isothermal halo as ordinary positive energy. This is an inverse-engineered action, not a microscopic derivation.

For a canonical scalar with a local potential V(u), the required equation would be V'(u)=K Laplacian(u). As u->0, the required potential behaves as V(u) proportional to -u^(2+4/nu), with exponent 31.07168499... . Its coefficient depends on the physical length anchor r0. Reconstructing V from the desired profile would be post hoc fitting unless the Cathedral transfer dynamics independently gives that potential.

## Conditional rotation curve and observational identifiability

If epsilon_I were naively inserted into a Newtonian mass integral, the exact *shape-only* orbital speed ratios are
v(10Rstar)/v(Rstar)=0.8535036985;
v(100Rstar)/v(Rstar)=0.7284681673.
These values remain valid **only as mathematical results of that nonrelativistic proxy**, not as GR predictions.

The existing finite rail constants supply neither the energy coupling K nor the baryonic-source boundary law. At the canonical reference location Rstar, the proxy velocity normalization is independent of the baryonic mass and of Rstar for universal K. A galaxy-by-galaxy baryonic Tully-Fisher relation is therefore not predicted. At a fixed physical radius in a low-population regime, recovering v^4 proportional to baryonic mass by varying the core length alone requires r0 proportional to M_b^(1/(2nu)) = M_b^3.63396; this dependence is **not** a result of the original URT/transfer machine.

Observed constraints: SPARC rotation curves and the baryonic relation (https://astroweb.case.edu/SPARC/; https://arxiv.org/abs/1901.05966); empirical radial acceleration relation (https://arxiv.org/abs/1609.05917); Planck CMB densities Omega_c h^2=0.120 and Omega_b h^2=0.0224 in standard Lambda-CDM interpretation (https://www.aanda.org/articles/aa/abs/2020/09/aa33910-18/aa33910-18.html). These constraints have not been fitted or predicted by this mechanism.

## Exact identifiability obstruction in the frozen finite state alone

Let B_star=(P3+Delta P5)/[2 sqrt(1+Delta^2)]. For *any* smooth dimensionless f(x) with f(xstar)=0, define
B_f(x)=[P3+Delta exp(f(x)/2) P5]/[2 sqrt(1+Delta^2)].
Then T_f=B_f^dagger B_f is positive and its normalized state has
p_f(x)=Delta^2 exp(f(x))/[1+Delta^2 exp(f(x))].
Every f agrees exactly with rho_star at xstar; f=0 gives no halo, while different f generate different profiles. Hence fixed rail spectrum, positivity and local BKM metric alone do not select a unique physical halo. This is a statement of underdetermination by **those inputs**, not a claim that a fully specified, nonlocal URT machine could not fix f.

## Result / next logically necessary derivation

- CLOSED MATHEMATICALLY: rail profile algebra, BKM population coordinate, explicit EOM residual, relativistic stress tensor, shift-symmetric inverse-action exponents, and local identifiability counterexample.
- NOT CLOSED PHYSICALLY: nonlocal URT/history action, conserved stress T_mu_nu with cold-matter limit, baryon-to-history coupling, lensing metric potentials, universal BTFR/RAR relation, cosmic perturbation evolution.
- CONDITIONAL NO-GO: the static, canonical, locally covariant, gradient-only information field cannot explain dark matter in the claimed way.

One must derive an **independently specified** microscopic response equation and stress tensor which survives these checks before comparing its predictions with observations. Do not add a potential or radial source chosen solely to enforce the desired halo. Do not present agreement of one radial exponent as evidence that nature implements the whole mechanism.
