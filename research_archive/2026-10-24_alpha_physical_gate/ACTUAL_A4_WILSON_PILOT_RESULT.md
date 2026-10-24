# Actual A4 Wilson photon calculation, no fitted alpha — 24 October 2026

## Objective and scope
Derive the fine-structure constant from microscopic Cathedral/URT data without inserting the historical candidate or measured alpha. This report re-evaluates the original 13^4 A4 Wilson photon expansion in `research_archive/2026-10-17_original_oct08_source/continued_physics_work/photon/free_fock_photon.py`, plus the fixed charged-sector representations in `combined_source_work/gauge/charged_gauge_join.py`. A source-first selected H64 electromagnetic kinetic action remains unconstructed: **physical alpha is NOT derived**.

## Exact charged generator
In the original 16-particle one-generation basis (Q_L, L_L, u_R, d_R, e_R, nu_R), the physical electromagnetic generator is Q = Y + T3 and the electron has Q_e=-1. Counting colour and isospin yields
Tr_16(Q²) = 3[(2/3)²+(-1/3)²] + 1 + 3(2/3)² + 3(-1/3)² + 1 = 16/3.
For three generations and their conjugates Tr_96(Q²)=32. This fixes the **relative** charge trace, not the photon kinetic residue.

## Leading fourth-order Wilson photon Hessian
Reconstruct the original A4 roots e_i-e_j (10 positive roots) in a 4D chart with cell volume sqrt(5), and integrate the archived Wilson spectrum over all 13^4=28561 momenta. Microscopic constants are r=0.355508034923519 and M=0.790940592107124; charge-wall trace C=208 (26 wall levels per charged species, charge-squared-times-colour sum 8). All are original fixed values; neither measured alpha nor the alpha scalar candidate enters.

The exact high-temperature expansion of the original stated free Fock functional begins at order beta^4 in the Hessian. The matrix has both the bubble and the Peierls second-derivative (seagull) contribution; omitting the latter spoils Ward transversality. The verified dimensionless leading transverse eigenvalues of Pi_beta4(q)/q² are:

| integer torus momentum (13-grid) | eigenvalues |
| --- | --- |
| (1,0,0,0) | (27.0371813985764, 27.0371813985770, 27.0371813985791) |
| (2,0,0,0) | (25.3982119220235, 25.3982119220240, 25.3982119220244) |
| (1,1,0,0) | (26.8131025907132, 26.9251419946386, 26.9251419946400) |
| (1,1,1,1) | (27.0371813985758, 27.0371813985770, 27.0371813985793) |

First-mode link Ward residual ||H 2sin(q·root/2)|| = 3.21e-12; coframe Ward residual ||Pi q|| =3.13e-12. The finite momentum dependence and absence of an independent zero-momentum q→0 limit on a fixed 13^4 torus prohibit equating a single listed coefficient with the low-energy alpha.

## Master state / entropy identification test
rho* = diag(a I4,b I4), a=1/[4(1+Delta²)], b=Delta²a.
For Y=[0 I4;I4 0]/sqrt8 and V=d rho*/dp5=diag(-I4,I4)/4:
g_BKM(Y,Y)=chi35=47.9669783033801; g_BKM(Y,V)=0; g_BKM(V,V)=161394.727270527.
Further ||[Y,rho*]||_F=0.24999690198616467, so this particular off-quartet operator cannot simply be identified with a symmetry generator leaving the chosen vacuum invariant. This is a local test of that particular embedding, not a no-go for the true charge generator Q_16.

The old polynomial 137+(17572/1215)Delta-(9/65)Delta²=137.035999178195 is intentionally absent from the photon operator; if inserted POSTHOC into the former convention alpha^{-1}=4 pi chi35 ||J||², it *requires* ||J||²=0.22734344982921045. That value is a diagnostic, not a derived norm.

## Exact Maxwell scale-family test
On the 12/30/20 oriented icosahedral incidence complex let D be the 30x20 face-to-edge map. Exact projector D^T(DD^T)^+D=I20-11^T/20 was reproduced with 7.77e-16 maximum residual.

For electron-unit holonomies the family S_lambda[A]=(lambda/2) A^T DD^T A + i j^T A, lambda>0, has the same face projector, gauge Ward structure, geometric spectra and charge generator, but its source interaction is (1/lambda)j^T(DD^T)^+j/2. Thus the currently specified finite Maxwell geometry by itself does not fix the physical coupling. This is a **conditional non-identifiability result only for the specified finite action family**, not a global Cathedral no-go.

## Status and exact physical condition
Computational finite identities: CHECKED in independently executed Python, no observed alpha as an input. Physical alpha: OPEN.

A first-principles closure requires the *original source-loaded* gauge-covariant selected H64 history D64[A], a fixed photon action coefficient and physical clock, Gauss projection and a continuum limit. The full photon Hessian is Tr(G D_e G D_f) - Tr(G D_ef), with G=D64[0]^{-1} and both hidden-51 and dressed-13 Schur determinant parts included. An exact same-action current/current residue must then yield alpha(0) and its running; this cannot be replaced by the historical scalar candidate. No coefficients may be fitted to the measured value.
