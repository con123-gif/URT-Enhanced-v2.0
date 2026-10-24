# First-principles alpha: independent gravity-gauge fixed-point test (24 Oct 2026)

**Status:** Exact source-charge and one-loop RG calculation; physical alpha NOT derived. Target alpha NOT supplied to model. This is additive to the exact Wilson beta^4 result in this directory.

## Source-derived chiral charge indices

The archived physical 16-state charged source has, per generation, Weyl hypercharge squared trace
Tr Y² = 6(1/6)²+3(2/3)²+3(-1/3)²+2(-1/2)²+(-1)²=10/3.
For 3 generations + one complex Higgs SU(2) doublet of Y=1/2:
b_Y = (2/3)*3*(10/3)+(1/3)*2*(1/2)² = 41/6.
The standard-form matter content has b_2=-19/6; b_Y+b_2=11/3.

## Independent gravity-induced UV fixed point

In the asymptotic-safety-motivated flow beta(gY)=(41/6)gY³/(16pi²)-fG*gY, the interacting root is

  gY,*² = (96pi²/41) fG.

Using the Cathedral charged parent trace relation gY²=(3/5)g2², one obtains e²=(5/8)gY². Therefore at the parent M_U:

  alphaEM^-1(M_U)=41/(15pi fG)

and at one-loop above the EW threshold:

  alphaEM^-1(M_Z) = 41/(15pi fG)+(11/(6pi)) ln(M_U/M_Z).

This exact conditional formula does not insert observed alpha. It still needs an *independently derived* physical gravity anomalous dimension fG, boundary M_U, selected interacting trajectory, full thresholds, and correctly matched source-loaded H64 photon determinant.

### Exact selection caveat

For x=gY² and x*=16pi² fG/(41/6), the RG solution is

  1/x(t) = 1/x* + (1/x(t0)-1/x*) exp(2fG(t-t0)).

Every 0<x(t0)<x* is also asymptotically free/UV complete in this truncated flow. Merely requiring ultraviolet completeness does NOT uniquely select the interacting root. A true microscopic critical-history selection law is needed; assuming the interacting root is not itself first-principles closure.

## Two no-fitting concrete tests

1. Historical entropy spectral action *one copy*, F0=ln2, implies gU²=pi²/(2 ln2) and alphaU^-1=8ln2/pi. The parent electromagnetic inverse is 64ln2/(3pi)=4.70689280326; one-loop running from an **illustrative** M_U=1.8e18 GeV gives alphaEM^-1(M_Z)=26.60318549538, not the physical ~128. The parent coupling is strong, so perturbative numerical extrapolation is uncontrolled.

2. The separate geometrical invariant eta_Delta/(16pi)=0.1192826109 is NOT known to equal the gravity beta-function coefficient fG. Testing that additional identification *only as a hypothesis* gives gY,*²=2.756539743, parent alphaEM^-1=7.2939971343, and alphaEM^-1(M_Z)=29.19028982646 at the same illustrative scale. It also does not reproduce physical alpha.

3. Direct identification of the native Berry/BKM curvature coefficient C=(2 eta_Delta/5)tanh(eta_Delta)=2.39828947459 as the electromagnetic source stiffness in the declared trace convention gives alpha^-1=160.7349033506; it is likewise not a physical derivation.

Neither measured alpha nor its historical scalar candidate was used to generate these numbers. The underlying original source-derived A4 Wilson photon beta4 coefficient K4=27.6055221182567 is **not** alpha and cannot replace the renormalised 4D source/kinetic ratio.

References:
- A. Eichhorn, F. Versteegen, JHEP 01 (2018) 030, https://doi.org/10.1007/JHEP01(2018)030 .
- M. Riabokon, M. Schiffer, F. Wagner, PRD 112 (2025) 106003, https://doi.org/10.1103/gxm2-trn6 .
- Original charged source: research_archive/2026-10-17_original_oct08_source/combined_source_work/gauge/charged_gauge_join.py .

**Scientific boundary:** Parameter-free *numerical* alpha not obtained. This fixed-point calculation provides the exact dynamical equation an independent gravity completion would need to close, rather than patching the historical formula.
