# Newton's Cathedral — hidden-history response and URT multiscale continuation (2026-10-13)

## Scope correction

The earlier static, canonical scalar-gradient calculation is a test of one selected effective action. It is **not** a no-go for the full URT history-selection machine, and treating it as such was incorrect. The historical H64 Feshbach construction and positive transfer mechanisms were not included in that test.

## Finite A5 response

Use the 13-vertex graph: a central site linked to all 12 icosahedral vertices, with edge weight w; shell graph has standard icosahedral adjacency A_ico. The exact Laplacian is

L13(w) = [[12 w, -w 1^T],[-w 1, (5+w)I12-A_ico]].

The eigenvalues are {0, (5+w-sqrt(5))^3, (6+w)^5, (5+w+sqrt(5))^3, 13 w}. The canonical spectrum is reproduced at w=1.

Let P_3prime denote the three-dimensional A5 shell eigenspace. P_3prime e_centre=0. Nevertheless, the existing positive heat-transfer kernel T_t(w)=exp(-t L13(w)) obeys

P_3prime T_t(w) P_3prime = exp[-t (5+w+sqrt(5))] P_3prime,

d/dw Tr[P_3prime T_t(w)] = -3 t exp[-t(5+w+sqrt(5))] != 0.

This is an explicit hidden-sector **history response** to isotropic changes in the centre-to-shell coupling even though the mean 3prime amplitude cannot be sourced directly from the centre. The semigroup result requires no noise or added scalar action.

Under a conditional unit-temperature Gaussian equilibrium interpretation, the hidden variance is 3/(5+w+sqrt(5)), which is 0.364251486048 at w=1; its derivative is -3/(6+sqrt(5))^2 = -0.0442263816962. That interpretation adds an equilibrium assumption, not a fitted coupling.

Note that the 3prime shell eigenspace and the hidden 4_3+4_5 entropy rail are different representations. An identification of their physical gravitational roles requires a map not established here.

## General history elimination

For a Hermitian H64 block generator H = [[A,B],[B†,D]], the history-eliminated visible operator is H_eff(z)=A+B(zI-D)^(-1)B†, or A-B D^(-1)B† at static z=0 when D is invertible. If D>=0, the imaginary-time history kernel is B exp(-tD) B†. These formulas establish how history can modify visible response, but the exact baryon-to-history B and physical stress-energy are not supplied by graph symmetry alone.

## URT logarithmic-scale ladder (conditional constructive result)

Set kappa=pi/e and a=ln(kappa)=0.1447298858494. Let lambda=6+sqrt(5) be the exactly derived shell 3prime eigenvalue, and ell_n=ell_0 kappa^n. Define the *hypothetical physical radial projection* of exponential transfer as

K(r)=a sum_{n in Z} (lambda/ell_n)^2 exp(-lambda r/ell_n).

This is positive. Poisson summation gives the exact identity

K(r)=r^-2 sum_{m in Z} Gamma(2+i m omega) exp[-i m omega ln(lambda r/ell_0)],

where omega=2pi/a=43.4131849846. Its average is exactly 1/r^2; the first relative log-periodic harmonic is 2|Gamma(2+i omega)|=3.4730102816868e-27. Numerical results reproduce r²K(r)=1 within 4e-27 for radii spanning eleven orders of magnitude.

This supplies a **mathematical existence mechanism** linking the URT scale ratio, a positive transfer eigenvalue and an inverse-square radial response without selecting a halo exponent from observational data. It does **not** derive the radial projection, spectrum across scales, absolute amplitude, baryon-mass coupling, a conserved stress tensor, gravitational lensing or cosmological clustering from the frozen microscopic machine.

The earlier p(r)∝r^-0.13759 scalar-gradient toy was not mandatory; this construction illustrates why dismissing nonlocal/history models on that basis was unjustified.

## Interpretation

Exact: 13-site spectrum, nonzero hidden transfer response, positive transfer kernel, scale-ladder identity and tiny modulation. Conditional: physical radial transfer interpretation, gravitational sourcing, baryonic Tully–Fisher scaling and spacetime geometry.

Reproduce with the two Python scripts accompanying this document. Do not declare either a whole-Cathedral no-go or dark matter solved from these findings.
