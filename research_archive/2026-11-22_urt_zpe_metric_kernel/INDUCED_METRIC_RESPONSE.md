# URT–ZPE: induced homogeneous metric response and real-time absorption
2026-11-22. THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Standalone URT–ZPE, parent 467e8dc. This calculation integrates out the *existing* finite comoving Gaussian lattice in the already declared homogeneous FLRW coupling. It is not a new derivation of the primitive metric coupling, induced Einstein gravity, or physical dark energy. No fitted parameters or empirical data.

## Provenance and convention
Use original cyclic cube, signed flux f=-theta or pi-theta, theta=2pi/phi², true degree, same two real polarizations per complex eigenmode as 9e3fc93 and 467e8dc. Let omega_j=sqrt(lambda_j)/ell0, natural units. Previous c345fc1 supplies gap/locality and cocycle details, d677784 static trace, 467e8dc exact evolving Gaussian matter and homogeneous Einstein constraint; previous 43289d7 distinguishes cosmological and curvature terms, f722e56 studies conformal anomaly. None of these computed the nonlocal frequency-dependent determinant of the finite lattice after conformal rescaling. No extra force, reservoir or carrier creation.

For a(t)>0 define conformal time d eta=n dt/a, and chi_j=a Q_j for each real mode. Removing the endpoint derivative gives the Lorentzian action
S_j=(1/2) integral d eta [chi_j'^2-(omega_j²-b a''/a)chi_j²],
b=1-6xi. The original minimal action has b=1; b=0 (xi=1/6 in the convention of equation (12), hep-ph/9810361) is a conformal negative control only, not a fitted parameter. Endpoint effects are absent for periodic or asymptotically flat metric probes used here. Canonical finite-spatial-cutoff conformal-time oscillator measure is assumed, not a generally covariant four-dimensional continuum measure; possible continuum measure/anomaly and counterterm contributions are not fixed by this result.

For Euclidean conformal time tau and sigma=ln a, the complex mode determinant relative to flat is Tr log(1+G_j b (sigma''+sigma'^2)), G_j=(-partial_tau²+omega_j²)^-1. One complex mode means two real oscillators, so the factor is one rather than one half. Use a decaying or periodic perturbation, zero-temperature reference. The finite number of spatial modes and gapped time propagator make these metric-dependent terms well-defined perturbatively for smooth bounded sufficiently small probes.

## Exact quadratic response around a static reference
At order sigma² the first log term contributes b/(2 omega_j) integral sigma'^2 since G_j(t,t)=1/(2 omega_j) and integral sigma''=0. The second log term uses only b sigma'' and equals -(b²/2) Tr(G_j sigma'' G_j sigma''). The squared Green function is exp(-2 omega_j |t|)/(4 omega_j²), Fourier transform 1/[omega_j(nu²+4 omega_j²)] with sigma~(nu)=integral exp(-i nu t) sigma(t) dt. Consequently
Gamma_E^(2) = integral d nu/(2pi) K_b(nu) |sigma~(nu)|²,
K_b(nu)=(1/2) sum_j [b nu²/omega_j - b² nu^4/(omega_j(nu²+4 omega_j²))].
In the original minimal coupling:
K(nu)=2 sum_j omega_j nu²/(nu²+4 omega_j²).
For every nonzero real Euclidean nu this is positive, bounded above by min(kappa nu²,2 E0), E0=sum omega_j, kappa=(1/2)sum 1/omega_j. K(0)=0. At small nu the expansion is K=kappa nu²+O(nu^4), with error at most nu^4 sum 1/(8 omega³). At large nu the limit is 2 E0. The zero of the response here is a statement about a constant conformal factor in the *relative conformal-time determinant*. It does not imply that the physical proper-time ground energy E0/a is zero, or renormalize the cosmological term. b=0 cancels this finite oscillator determinant exactly; a covariantly regulated 4D field may still have an anomaly.

This is an exact second-order action for homogeneous perturbations, not an all-amplitude nonlocal solution or a full local tensor Ward identity. The convention for K has no extra half in front of the quadratic integral.

## Leading adiabatic induced action
The first term of the derivative expansion for minimal coupling in Lorentzian conformal time is
Gamma_L = integral d eta [-E0 + kappa (a'/a)^2] + higher derivative/boundary terms.
It follows directly by expanding -sum_j sqrt(omega_j²-a''/a) to first order in the second-derivative potential; at this order integral a''/a=integral (a'/a)². It also follows from the low-frequency kernel. Requires slow variation relative to the comoving gap, e.g. |a''/a|<<omega_min² and higher derivatives suppressed, and adiabatic vacuum boundary conditions. No near-resonance or nonadiabatic inference from this truncated action. It is not the in-in action for arbitrary nonequilibrium initial data.

In proper time with lapse, Gamma_L=integral n dt[-E0/a+kappa a H²], H=adot/(n a). Combined with the pre-existing Einstein term -A a³ H², A=3 V0/(8 pi G), the lapse constraint of the two-derivative truncation is
(A a³-kappa a)H²=E0/a.
On the positive-A, positive-denominator branch (A a²>kappa),
H²=E0/[a²(A a²-kappa)], q_dec= -1-dln H/dln a=1+kappa/(A a²-kappa)>1.
At large a this approaches radiation-like evolution. The term has the opposite sign to the Einstein minisuperspace kinetic term and scales differently in a because the number of comoving modes is fixed. It is not a finite constant renormalization of physical G; this truncation cannot in itself be used to claim induced Einstein gravity or acceleration. In particular a formal pole at A a²=kappa is outside controlled adiabatic evolution. If the bare Einstein term is removed, the leading minimal finite-oscillator action alone has no positive-real-H vacuum branch. The earlier exact all-state minimal-source theorem remains stronger for arbitrary dynamic states. The new result is the calculable response and its spectral content, not another fit to an expansion history.

## Independent physical response: real-time excitation by a weak prescribed deformation
The Lorentzian perturbation of the squared mode frequency at first order is -b sigma''. Integrating the forced oscillator with an incoming vacuum gives
|beta_j|²=4 b² omega_j² |sigma~(2 omega_j)|² + higher orders in sigma.
This follows by substituting the free mode into the retarded Green function sin(omega_j(eta-eta'))/omega_j; the negative-frequency coefficient has magnitude |integral delta Omega² exp(-2i omega_j eta) d eta|/(2 omega_j). Twice integrating by parts gives the stated formula. Each complex mode absorbs 2 omega_j |beta_j|² in the asymptotically flat final geometry. Thus the linear response has pair resonances at 2 omega_j; no on-shell particle absorption at smaller driving frequency for an infinitely long monochromatic weak perturbation. Finite pulses have frequency tails. In the finite spatial model this is a discrete spectral response. A homogeneous metric pulse is an external probe, not self-sustaining gravitational evolution.

For sigma=amp exp(-eta²/(2 tau²)),
Delta E/amp² = 16 pi b² tau² sum_j omega_j³ exp(-4 omega_j² tau²) + O(amp).
This is a falsifiable response of the specified oscillator system (given its physical scale and a mechanism to drive this action), not a verified experiment or prediction of the observed cosmological constant.

## Executed checks
Local container /mnt/data/urt_metric_kernel/cert.py, OPENBLAS_NUM_THREADS=2 python (with pipefail), exit 0. Eight native N=2,4,8,12 spectrum cases (both golden-flux signs). Independent periodic-time monodromy determinant at N=2,4, both fluxes and frequencies .5,2 with amplitude .003, Euclidean time period 2pi times integer/nu, duration >=24/omega_min. Divide determinant difference by amp²/2 to compare K; finite amplitude and finite periodic-time effects rather than a symbolic proof. Maximum relative discrepancy 1.059e-6. Real-time pulse at N4, both fluxes, widths .25,.5,1, amp=.001, computed actual negative-frequency coefficients via independent Lorentzian integration to +/-10 tau; Wronskian error <1e-9. All six absorption tests agree with weak-pulse formula within 9.632e-7 relative; conformal b=0 negative controls also pass. See LOCAL_TEST_OUTPUT.txt. Analytic determinant expansion and first-order scattering give the universal statements; the finite numerical results check them. The deformation probes are not empirical inputs or fitted coefficients.

## Scope and RESUME HERE
This completes the induced *homogeneous response* of the pre-existing minimal Gaussian action at quadratic metric order, with a computed spectral absorption observable. It does not select the physical metric action, continuum covariance, renormalization, Planck scale, or dark-energy normalization from primitive URT. Do not claim dark-energy completion. The nonzero frequency dependence indicates where geometry couples to the full lattice, whereas the static conformal-time response cannot supply a new cosmological constant. A concrete next attempt is to determine an invariant physical cutoff/metric degree of freedom by a variational principle of the actual primitive phase dynamics, rather than varying a static curvature counterterm to fit cosmology. Do not repeat the same minimal oscillator pressure, determinant or pulse tests. Preserve separate URT–ZPE scope; no external James material committed and no Cathedral gate closed.

Standard scalar-mode convention reference: https://cds.cern.ch/record/368061/files/arXiv%3Ahep-ph_9810361.pdf?version=1 equation (12); scalar particle production review: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8C6D7E585852342B43C9C9EF778EDA74/9781009289986AR.pdf/Nonequilibrium_Quantum_Field_Theory.pdf?event-type=FTLA section 4.6.
