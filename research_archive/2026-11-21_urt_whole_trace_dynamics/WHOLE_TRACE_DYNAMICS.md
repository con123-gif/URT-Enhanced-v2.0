# Whole-system URT entropy frontier: trace dynamics and self-consistent curvature test

2026-11-21. Parent 31148e7. Standalone URT-ZPE. Conditional macroscopic review and exact result for the specified covariant anomaly model; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. User requests the sum of the whole interacting system. This is not a derivation of the actual interacting URT matter-gravity effective action. No fitted cosmological parameter, no further magnetic boundary changes.

## Exact target in standard flat FLRW

Let rho,p denote TOTAL effective energy density and isotropic pressure with all interacting sectors and any cosmological source included, after collecting the measured Einstein coefficient on the geometric side. In units c=hbar=k_B=1, define Theta=rho-3p=-T^mu_mu, signature -+++. Total conservation dot rho+3H(rho+p)=0 gives d rho/d ln a+4rho=Theta. Friedmann gives rho=3H²/(8pi G); S_H=pi/(G H²) (as in 31148e7). Thus
g=d ln S_H/d ln a=4-Theta/rho.
Acceleration iff g<2 iff Theta>2rho. This is the trace of the whole stress tensor, not an assumption of additive independent vacuum energies. An independently derived Theta(a) fixes the evolution up to an initial condition:
rho(a)=a^-4 [a_i^4 rho(a_i)+integral_(a_i)^a u^3 Theta(u) du].
For a constant Theta the particular solution is Theta/4; its value must be derived, not fitted. A constant density term is not determined by the horizon entropy identity. No new physical closure follows from these identities alone.

## Self-consistent anomaly calculation, rather than a fixed-H estimate

Consider free conformal fields in 4D, taking ONLY the Euler trace anomaly plus standard dust and radiation; omit the scheme-dependent box R term and additional curvature terms by explicit restriction. This is a diagnostic theory, not the full Standard Model, whose masses, coupling beta functions, condensates and vacuum constant are not described by the free conformal anomaly. The total Euler contribution has coefficient A>0. In spatially flat FLRW, Weyl curvature vanishes, E4=24(H^4+H² dot H), and Theta_anom=A E4/(16pi²). Conservation implies rho_anom=3A H^4/(8pi²)+C a^-4; absorb the state-dependent radiation integration constant into radiation. Let y=H², beta=A G/pi, and m,r,L denote Friedmann-normalized dust (proportional to a^-3), radiation (a^-4), and constant vacuum density. Then
y-beta y²=m+r+L.
Differentiate, giving g=(3m+4r)/[y(1-2beta y)].
This computes the backreaction of the anomaly on BOTH H and S rather than adding energy at fixed curvature. A positive G and A are assumed.

If L=0 and nonnegative dust/radiation, on the GR-connected lower branch 0<beta y<1/2,
g >= 3(1-beta y)/(1-2beta y) > 3.
Thus this branch is always decelerating. In exact empty vacuum the formal branches are H=0 and H²=pi/(A G). The nonzero solution is at a curvature outside the reliable low-curvature approximation for the field census considered, not a predicted early-universe model. Omitted box R and nonconformal response can alter transient dynamics; this no-acceleration bound is scoped to the explicit Euler-only equations, not all quantum gravity.

The combined FREE minimal-SM conformal census uses 4 real scalars, 45 Weyl fermions, 12 vectors, A=4/360+45*11/720+12*31/180=1991/720. The free photon alone has A=31/180. The full census is an illustrative high-energy free-field coefficient, not today's physical low-energy content, nor a bound on the unknown interacting vacuum. In SI beta H²=(A/pi)(H t_P)². At reference H0=67.4 km/s/Mpc:
photon beta H0²=7.602149194099e-124; formal vacuum H tP=4.2710075779.
free SM census beta H0²=1.220635406891e-122; formal vacuum H tP=1.06587322939 (1.977044158403e43 s^-1).
With present expansion H0 supplied only as a benchmark, these values do not independently predict H0. No mathematical uncertainty about the many orders of magnitude, but physical matching is not established.

## Physical continuation

The genuinely combined trace must include all nonconformal interaction, condensate, mass, vacuum-normalization and gravitational response terms of a single joint microscopic state. A constant gravitationally relevant trace is not fixed by the conformal anomaly, and the observed tiny positive residual cannot be inferred from the free-field census. Do not tune A or re-identify the 95.6% historic coefficient as a measured deficit. Next derive the nonconformal trace from the full native action via a metric/Weyl response, rather than another independent force energy sum. No claim that the actual URT theory or vacuum has been calculated.

Sources: standard 4D Weyl anomaly conventions and free-field coefficients, https://qft.org/cft/weyl-anomalies/ ; preceding force-vacuum accounting 43289d7 and whole GR entropy 31148e7. SymPy/Python cert.py executed locally exit 0; exact trace identity, Friedmann quadratic, inequality and field census, numerical SI benchmarks. Latest completed remote report seen still checkpoint296 (old launcher failures repaired by 52da374); no claim that new CI is green.
