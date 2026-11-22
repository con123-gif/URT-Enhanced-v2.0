# Minimal URT: physical horizon and clock closure test

22 November 2026. Standalone URT–ZPE, no Cathedral ARFs. **OBSTRUCTION / CONDITIONAL PHYSICAL INTERPRETATION**, narrowly scoped to the primitive recurrence and prior entropy–redshift identification. Supersedes any wording that the future event horizon and absolute Hubble constant were *derived* from pi, phi, e.

## Primitive rule, without a new mathematical superstructure

q = (pi/e) exp(i 2pi/phi^2), phi=(1+sqrt(5))/2.
alpha=|q|=1.1557273497909; theta=2pi/phi^2=137.5077640500 degrees.

Because 1/phi^2 is irrational, n theta cannot be an integer multiple of 2pi for any n>0. Thus the rotation never returns **exactly** to its starting phase: intrinsic *geometric nonclosure*. Interpreting that nonclosure as *physical gauge frustration* requires a separate observable map; mathematical nonclosure is not itself a source of dark energy.

If a radius r_n=r_0 alpha^n is postulated, area and associated horizon entropy scale alpha^(2n), an increase of 33.5705707% per step. With thermodynamic horizon T~1/r, the redshifted product TS~r and mean energy density~r^(-2). This recovers the previously stipulated entropy-redshift scaling **kinematically**, not a Friedmann solution.

## Two inequivalent physical clocks on exactly the same URT trajectory

Set a_n=alpha^n. For an arbitrary physical proper-time parameter tau>0:

1. t_n=n tau: a(t)=exp[(ln alpha)t/tau], H=(ln alpha)/tau, de Sitter. Apparent and event horizon coincide.
2. t_n=tau alpha^(n/p), any p>1: a(t)=(t/tau)^p, H=p/t; R_A=ct/p and R_E=ct/(p-1), hence R_E/R_A=p/(p-1)>1.

Both preserve *every* recurrence value and golden rotation. Neither the clock rule nor tau nor p is selected by q. Changing tau changes H0 but not the dimensionless recurrence, phase, or microscopic entropy per cell. In particular pi, phi and e cannot by themselves determine the physical tick, and so cannot predict an absolute H0 in s^-1. This is a **constructive non-identifiability proof**, not a universal impossibility claim for any future microscopic URT dynamics.

## Test entropy against the simplest horizon mapping

If the growing microscopic sphere radius is identified with *both* cosmological apparent horizon R_A=c/H and scale factor a, then S_H~R_A^2~a^2. The exact whole-system entropy identity from 31148e7 gives deceleration parameter q_dec=(1/2)d ln S_H/d ln a-1=0. This is **coasting**, not acceleration. In that case R_A~a, H~1/a and a(t) is linear, with no finite future event horizon.

Conversely, the future-event-horizon HDE acceleration in d47dff9/6352b09 assumes a nonlocal *future boundary condition*. It is **not selected** by the primitive local recurrence, nor by the area law. If imported, p=c_HDE/(c_HDE-1); that merely closes a conditional phenomenological cosmology. The archived finite coefficients c_HDE=1.0830838 and 1.0239180 are not continuum-certified and do not resolve the physical clock.

## Entropy fixes a cell-to-Planck ratio, not a cosmic epoch

The conditional gravitational entropy law ell^2=4 sigma ell_P^2 can normalize microscopic cell size relative to G if the physical horizon algebra is established. It does not choose R/ell, the recursion index n, a physical clock tau, or a time boundary condition. Since entropy increases as alpha^(2n) with no saturation rule, no finite n is selected by maximizing this monotone function. The previous apparent-horizon finite eta>1 issue in 6352b09 remains; it is not an argument for silently choosing the future event horizon instead.

**Physical verdict:** The last two cosmological requirements cannot be derived uniquely from the existing pi–phi–e recurrence plus entropy/redshift data. The remaining missing *physical law*, stated without more operators, is how one geometric step corresponds to proper time and which causal horizon is the thermodynamic boundary. A genuine dynamical causal rule could resolve both, but assuming it would not be a zero-parameter derivation. Do not describe a choice of p or tau as closure.

**Executed local certificate:** pure standard-library Python at /mnt/data/urt_minimal_core_2026_11_22/cert.py, exit 0. Tests two proper-time embeddings, horizon ratios and the conditional prior c_HDE cases. Remote CI must be checked independently.

**RESUME HERE:** Do not add another mathematical extension to q. Any proposed solution must derive a physical timing/causal rule from the microscopic dynamics and then calculate the same-state entropy response; if that rule is absent, keep the status OPEN rather than fabricate H0 or a future horizon.
