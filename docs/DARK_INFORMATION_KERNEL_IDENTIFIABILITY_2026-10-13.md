# Dark-information multiscale identifiability audit — 2026-10-13

## Purpose

Continue the October 13 hidden-history calculation without treating a result for a restricted toy model as a universal no-go. Check specifically whether the previously obtained inverse-square profile follows from the *frozen Cathedral machine*, or from the chosen spatial projection.

## Exact family

Let kappa=pi/e, a=ln(kappa), lambda=6+sqrt(5), ell_n=ell0*kappa^n, and q>0. Define the positive scale ladder

K_q(r)=a*sum_{n in Z} (lambda/ell_n)^q exp(-lambda*r/ell_n).

The logarithmic-scale continuum integral is Gamma(q)*r^(-q). Poisson summation gives a log-periodic series whose zero mode is precisely Gamma(q)/r^q. Thus q=1,2,3 yield mean slopes -1,-2,-3, with the *same* URT scale multiplier and hidden eigenvalue. Changing lambda merely translates the phase of the logarithmic oscillations and shifts the characteristic length. The exponent -2 is fixed by **choosing q=2** (a second-radial-derivative weighting), and has not yet been derived from the actual H64-to-spacetime response operator.

This distinguishes a valid constructive existence result from a parameter-free physical prediction. There is no global no-go for history-dependent dark information here.

## Finite-scale diagnostic

For a separately posited 64-step ladder, lengths ell_n=ell0*kappa^n (n=0..63) cover ell_63/ell_0=kappa^63=9117.79072368429. With r=kappa^j/lambda, the q=2 normalized kernel r^2*K_2,64(r) is:
- j=1: 0.3523670617505424
- j=10: 0.9428254014446155
- j=15: 0.9992037769565109
- j=20: 0.999998251349414
- j=30: 0.9999695291738887
- j=40: 0.9994584293380403
- j=50: 0.9908853180165026
- j=60: 0.8774947105353185

The approximation has significant cutoff effects near the boundaries. **dim(H64)=64 is not proof that H64 contains 64 independent URT logarithmic length scales.** This was deliberately a finite-ladder sensitivity check and not a claim about the model's spectrum.

## Consequence

The October 13 research has now established:
1. exact 13-site A5 hidden-mode spectral response to a central-edge perturbation;
2. a mathematically valid positive infinite-scale kernel with mean r^-2;
3. the fact that the radial power q, an infinite or sufficiently broad set of spatial scales, and the time-to-distance map are not fixed by that graph spectrum alone.

For a physical dark matter derivation, the existing H64 transfer must itself determine (i) its baryon-to-hidden-history operator B(x); (ii) a causal spatial kernel and its spectral measure; (iii) a conserved effective gravitational source including pressure and lensing; (iv) baryonic mass scaling and cosmological perturbations. None of these requirements is established by this scale-ladder identity. Do not use observational halo curves to select q or other coefficients post hoc.

## Verification

Run research_archive/2026-10-13_entropy_gravity/cathedral_scale_ladder_identifiability_2026_10_13.py. It checks q=1,2,3 to relative error below 1e-20 and the finite cutoff figures.
