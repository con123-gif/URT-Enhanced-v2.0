# Joint URT/H64 quark common-vacuum calculation — 18 October 2026

Source: original October 8 `golden_species_operators.npz` SHA256 `9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b`. No measured quark masses or CKM parameters enter. This is the existing **conditional** determinant completion from `original_oct08/joint_vacuum_work/species/shared_species_vacuum.py`, restricted to u,d; not the unique microscopic physical mass action or a proof of maximum-entropy selection.

The common (not independent) 13-real-dimensional history field x enters A_f(x,s_f)=S_f(1+s_f)+sum_i x_i C_i for f=u,d, where C_i is the original affine decoder on the 13D source chart. Set M_f=[[I,A_f†],[A_f,0]], Q_f=phi^-2 I_6+M_f², phi=(1+sqrt5)/2. The existing conditional colour-weighted action is

`Gamma(x,su,sd)=phi^-2 ||x||²/2+(3/2)logdet Q_u+(3/2)logdet Q_d`.

Its exact analytic stationary equations are `0=phi^-2 x_i+(3/2) sum_f tr(Q_f^-1 Q_f,i)`. The analytic Hessian contains `(3/2) sum_f tr(Q_f^-1 Q_f,ij - Q_f^-1 Q_f,i Q_f^-1 Q_f,j)`.

## Direct numerical results

Joint 13D stationary field norm 0.37453126145617877; gradient residual 1.85e-15; Hessian min/max 0.6406310991662394 / 9.069611849403996. Eight deterministic initial conditions return the same local minimum. Mixed 13x2 history-source matrix rank 2, singular values (2.35982400135, 0.20237067640).

At fixed x, H_{su,sd}=0. Relax x by exact Schur elimination: `(∂²Gamma_eff)/(∂su∂sd)=H_su,sd-H_su,x H_xx^-1 H_x,sd=-0.867190411068071`. Independent four-point finite difference at ±2e-4 returns -0.867190869113799 (difference 4.58e-7). Thus one original common history variable **does induce** genuine up/down coupling without an imposed cross coefficient.

Define the explicit conditional common-left positive Yukawa-root dictionary X_f=(A_f†A_f)^(1/2). At the shared stationary x, Q_u=Tr X_u²/(Tr X_u)²=0.496428830937649, Q_d=0.496222685139725, Q_ud=Tr(X_u X_d)/(TrX_u TrX_d)=0.491656194946865, normalized commutator norm 0.00441742215261, and Q_{u+d}=0.494014835860. Root singular spectra: u (0.01212119524,1.01392452478,1.14991044980), d (0.01210277201,0.85014892917,0.98613107599). The two **separately** minimized history fields give Q_u=0.415503837376606, Q_d=0.399652970169015, respectively.

## Interpretation

The native conditional shared-history action has a computable nonzero cross response. It does not select the empirical quark Koide Q's (near 0.849 and 0.731) under this specified positive-source dictionary. The mass-pole dictionary and uniquely SU(2)_L-covariant selected-history entropy action remain to be derived. **Do not** call this local discrepancy a no-go for URT, all-Platonic sectors, or other native H64 constructions; also do not label a Gaussian log determinant as proved physical maximum entropy. Reproducible standalone Python and machine-readable results are in conversation artifact `JOINT_URT_H64_QUARK_DOUBLEt_2026-10-18.zip` (the pre-existing binary was not altered).
