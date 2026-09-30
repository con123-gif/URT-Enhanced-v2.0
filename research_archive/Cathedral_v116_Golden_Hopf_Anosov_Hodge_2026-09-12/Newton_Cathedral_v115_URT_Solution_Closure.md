# Newton's Cathedral / URT v115 — URT Solution Closure

Standing selection premise: URT is the physical selection principle.

## Fundamental URT kernel
alpha = sqrt(4/3)
theta_H = 12/5
beta_URT = 1/4

## Microscopic chiral transport
For shell edge e with Hopf link U_e, let
J_e = J R(arg U_e)
on the real charge plane.  The finite Dirac edge amplitude is

T_f,e =
C5(H_e)
+ C43(Xi3_e + J_e q_f/3)
+ i chi C45(Xi5_e + J_e Delta g(q_f)/5).

The 60-state nonbacktracking Ruelle history uses the two inverse outer returns
C and C^-1 on its two branches.  The physical observable is the URT
fixed-response / Schur-reduced output, not a raw one-step passive eigenframe.

## Gauge closure
The 19 physical shell-cycle variables are relaxed jointly with the finite
Dirac determinant.  URT minimax selection chooses the Wilson stiffness that
minimizes the condition number of the fully relaxed physical Hessian:

beta_gauge* = 3.6410791945495

At the selected point:
condition number = 7.16910593614579
||x_gauge|| = 0.457928185853575
total lifted Chern flux / 2pi = 1.

## Gravity closure
After the breathing mode is lifted, the unique massless common 13-channel mode
has projector diagonal 1/13.  Combined with the canonical 3D Green residue
1/(4 pi r),

G_geom = 1/(4 pi 13) = 0.0061213439650729.

## Infrared response
alpha_root^(-1) = 137.035999178195.

Mass ratios to top:
{
  "t": 1.0,
  "b": 0.024891898404204027,
  "tau": 0.00995675936168161,
  "c": 0.007467569521261208,
  "s": 0.0005576459455486934,
  "mu": 0.0005948223419186063,
  "u": 1.23921321233043e-05,
  "d": 2.7761732444228736e-05,
  "e": 2.863785371579562e-06
}

|CKM| =
[[0.974511311 0.224307298 0.003733785]
 [0.224171784 0.973636531 0.042177215]
 [0.008643867 0.041450479 0.999103169]]

J_CKM = 3.14136440766361e-05
delta_CKM = 65.9746190097 deg

|PMNS| =
[[0.825065204 0.544589303 0.150631671]
 [0.400138697 0.5389937   0.741198229]
 [0.398944146 0.642579398 0.654167628]]

J_PMNS = -0.0323594679254652
delta_PMNS = 285.487555087 deg

No CKM, PMNS, fermion-mass, alpha_EM or G_N observation was used to choose
these dimensionless outputs in this closure.