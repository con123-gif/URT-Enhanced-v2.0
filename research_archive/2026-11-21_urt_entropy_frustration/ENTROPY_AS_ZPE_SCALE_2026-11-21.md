# Entropy as the ZPE scale: exact conditional URT–horizon calculation

**Date:** 21 November 2026  
**Status:** THEOREM for explicitly stated horizon/carrier hypotheses; **NOT** a first-principles derivation of physical ZPE or observed dark energy; no fitting and no RH assertion.  
**Focus:** Joint mathematics and physics, connecting the previously derived arithmetic holonomy vacuum-response module to the original 8-carrier master-state entropy, not claiming that this small module replaces the full Cathedral.

## Input from earlier work

1. A four-state magnetic prime-loop stiffness matrix has two reciprocal sectors `eps = +1, -1` with loop phase `eps exp(-i theta)` where `theta=2*pi/phi^2`. In a **canonically quantised complex oscillator embedding**, their difference in ground-state energy is `d hbar omega0`:
   `d = sum_j sqrt(lambda_{+,j}) - sum_j sqrt(lambda_{-,j}) = 0.2109746055694190823233372376...`.
   The field quantisation is an extra assumption, not derived from primitive URT. The relative energy has no independent absolute reference.
2. The earlier relativistic **bulk** field embedding gives a *different quantity*: `Delta rho_bulk = C hbar c mu^4`, with `C=0.001241827763574598909824915505...` for two chosen flux sectors. This is the density **per full spacetime field copy**. Do not conflate it with the four-state oscillator energy per horizon carrier.
3. Original URT master-state entropy of the specified 8-carrier subsystem:
   `p = delta^2/(1+delta^2)`, `delta = 3/20 - 80*pi/(1053*phi)` and `s_*=S_*/kB = ln 4 + H2(p) = 1.386374857427223750270538573...`.
   This is an established *internal candidate* from the broader research state, not a proof that one physical horizon cell has this entropy.
4. Primitive URT radial step `a=pi/e`.

## Hypotheses for an entropy-controlled physical length

H1. A physical (approximately de Sitter) horizon of radius `R` obeys the usual gravitational entropy-area law

    s_H := S_H/kB = A/(4 lP^2) = pi R^2/lP^2,

with `lP^2 = G hbar / c^3`. This is standard horizon thermodynamics **imported from general relativity**, not derived from URT.

H2. Every independent arithmetic-loop carrier occupies `s_*` dimensionless units of horizon entropy, so its effective count is `N_H=s_H/s_*`. This is the **missing microscopic-to-horizon map**; a real noninteger `N_H` is a thermodynamic coarse-grained count.

H3. Each carrier contributes the previously calculated **relative** ground-state energy `Delta E_cell=d hbar omega0`, and the horizon-controlled mode frequency is `omega0=kappa c/R` with a dimensionless positive coefficient `kappa`. Declaring `kappa=1` is a natural convention for the simplest test, **not an independent deduction from URT**.

H4. Cell energies are additive and there is no other gravitational vacuum contribution, interaction correction, backreaction, or subtraction that changes their total. This is not automatic in a gauge or gravitational theory.

## Theorem 1: Entropy-controlled ZPE scaling

The total relative energy and its density within the horizon volume `V=4*pi*R^3/3` are

    Delta E_H = N_H d hbar kappa c/R
              = (pi kappa d/s_*) (hbar c/lP^2) R,

    Delta rho_H = Delta E_H / V
                = (3 kappa d/(4 s_*)) (hbar c/(lP^2 R^2))
                = (3*pi*kappa*d/(4*s_*)) (hbar c/lP^4)/(s_H).

The associated effective cosmological term, **if** the model is coupled to Einstein gravity as a vacuum stress, is

    Delta Lambda_H = (8*pi*G/c^4) Delta rho_H
                    = (6*pi*kappa*d/s_*) / R^2
                    = (6*pi^2*kappa*d/s_*)/(s_H*lP^2).

**Proof:** Substitute H1 into H2 and H2/H3 into the density. Use `lP^2=G hbar/c^3` for the gravitational conversion. No adjustable numerical target appears upstream. QED conditional on H1–H4.

The entropy-to-length map `R=lP sqrt(s_H/pi)` is exact under H1. Entropy alone, however, is dimensionless and needs a physical length unit (here `lP` obtained from assumed gravity).

## Theorem 2: exact de Sitter closure coefficient

A pure 4D de Sitter solution of radius `R` satisfies `Lambda_dS=3/R^2`. Its corresponding total vacuum energy within the horizon volume is

    E_dS = (3 c^4/(8*pi*G*R^2)) (4*pi*R^3/3) = c^4 R/(2G).

The standard de Sitter temperature and entropy also give the identity

    T_GH S_H = [hbar c/(2*pi*kB R)] [kB*pi*R^2/lP^2]
             = c^4 R/(2G) = E_dS.

This identity depends on GR's de Sitter horizon relations and is **not** an independent proof of a thermodynamic first law without horizon work terms.

Consequently, for all `R>0`,

    Delta E_H/E_dS = Delta Lambda_H/Lambda_dS = 2*pi*kappa*d/s_*.

Using the existing URT values and choosing the unproved `kappa=1`:

    2*pi*d/s_* = 0.9561573731665629838389979164...
    1 - ratio = 0.0438426268334370161610020836...

Thus the provisional entropy-counting model comes within 4.384% of the de Sitter normalisation but **does not satisfy the exact self-consistency equation**. A pure de Sitter spacetime sourced only by this component cannot satisfy both sides of Einstein's equation for any radius with `kappa=1` and H1–H4. Forcing agreement would require choosing

    kappa_fit = s_*/(2*pi*d) = 1.045852940178917193401185603...

That is fitting and is **not** done. The internal degree-of-freedom assignment is also unproved, so the near-agreement is not empirical evidence of a dark-energy law.

For a **different, also plausible** binary entropy assignment `s_cell=ln 2`, the ratio instead becomes `1.91242578644...`. Hence the ~95.6% value is sensitive to a microscopic identification and is not a universal consequence of horizon entropy.

## Theorem 3: URT scale ratio and cosmological equation of state

Under `R_next=a R`, with `a=pi/e`, and H1–H4 held at each scale,

    s_H,next/s_H = a^2,
    N_next/N=a^2,
    Delta E_cell,next/Delta E_cell=a^-1,
    Delta E_H,next/Delta E_H=a,
    V_next/V=a^3,
    Delta rho_next/Delta rho = a^-2 = (e/pi)^2
                                      = 0.7486679099432883436431253293...

Compare: a **fixed-number** 3+1D relativistic bulk-field model with `mu~1/R` instead has `Delta rho~R^-4`, ratio `(e/pi)^4 = 0.5605036393788517055285370642...`.

For a separately conserved FRW component `rho~R(a_FRW)^-2`,

    w = -1 + (2/3) (d ln R / d ln a_FRW).

`w=-1` in exact de Sitter because its horizon radius is constant. `R~a_FRW` would instead give `w=-1/3`, not accelerating dark energy. **Entropy determines scale dependence but does not automatically select a cosmological constant.**

## Important alternative: bulk relativistic ZPE plus N entropy-counted species

A separate model, treating each horizon entropy carrier as an *entire 3+1D field species*, gives

    Delta rho_bulk,N = (s_H/s_*) C hbar c kappa^4/R^4
                      = (pi C kappa^4/s_*) hbar c/(lP^2 R^2),

and hence

    Delta Lambda_bulk,N/Lambda_dS
        = (8*pi^2*C*kappa^4)/(3*s_*)
        = 0.0235748625418969956805903241... (at kappa=1).

The bound-state cell and full-field species models share the `1/R^2` *scaling* because `N~R^2`, but **their coefficients differ by a factor >40**. Multiplying the full-field density by a huge number of horizon bits also makes a physically strong, unproven species-counting assumption. This disallows treating the near-unity result above as a unique prediction of URT.

## Exact status and the next mathematical gate

**THEOREM (conditional):** Under explicit H1–H4, entropy supplies `R` and a state count, yielding a `1/R^2` relative energy density and the exact coefficient `2*pi*kappa*d/s_*` in the de Sitter Einstein equation.

**NO COMPLETE PHYSICS DERIVATION:** Neither the horizon entropy-area law, carrier-to-horizon map, quantum commutators, phase-space measure, frequency coefficient, nor ZPE reference state are yet derived from primitive URT. A physically meaningful absolute dark-energy term would also require a covariant effective action with conserved stress and no double counting.

**Next decisive derivation:** Obtain an explicit URT boundary-to-bulk Hilbert-space embedding whose entropy capacity is exactly `s_*` *per independent arithmetic loop*, and derive the mode frequency and gravitational stress from that embedding. Then recompute the coefficient without selecting `kappa` or an entropy-per-cell value to match de Sitter. If the coefficient is not exactly 1 after true first-principles selection, the simple pure-de-Sitter closure is falsified.

**References:** Gibbons–Hawking horizon entropy and temperature; GR de Sitter Einstein equations; original URT master state; existing audited four-state prime magnetic flux and conditional oscillator calculation. Related entropy/UV–IR work in published holographic dark energy does not prove the URT-specific carrier identification.