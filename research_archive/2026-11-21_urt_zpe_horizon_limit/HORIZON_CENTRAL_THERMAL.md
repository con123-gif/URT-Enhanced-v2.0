# Horizon entropy and redshift — central strip convergence and thermal-reference diagnostic

2026-11-21. Standalone ZPE entropy track. Parent bbfb2d50. Preserve the original irrational golden flux, complex Gaussian field, same-state entropy, gauge-equivalent Fourier strip and midpoint-lapse energy reference. No fitted correction or parameter. This is a finite numerical convergence study and exact thermal accounting, not physical closure.

## Geometry and numerical method

The original strip gauge after Fourier transform in y has onsite 2-2cos(k+f(x-z)), x links exp(if z), z links 1. The strip has nx sites across the cut, nz transverse layers, and m uniform momentum quadrature points. f=Arg(epsilon exp(-2pi i/phi²)). The reduced covariance matrices in A are Q=(L^-1/2)_A and P=(L^1/2)_A. Define d_i=nx/2-1/2-x_i, D=diag(d_i), and M the previously defined midpoint-weighted isolated-half stiffness (including the weighted Fourier onsite term). The dimensionless redshifted excitation above the weighted ground is X=Tr(D P+M Q)/2-Tr sqrt(D^1/2 M D^1/2). The entropy is S=Tr h(Q^1/2 P Q^1/2), h(lambda)=2[(1+n)ln(1+n)-n ln n], n=(sqrt(lambda)-1)/2.

To distinguish artificial transverse boundaries from finite depth, take diagonal contributions of each exact matrix trace, sum across A in x, then average central 4 or 2 z layers after Fourier quadrature. These central diagnostics are a fixed trace decomposition, not independent local energies, entropies or relative entropies. Their infinite limit is not certified. Full-strip traces obey the exact identities below. The 12->24 momentum check at nx=40,nz=16 changes central ratios by less than 2e-9. Varying nz together with nx can still introduce systematic error; no monotonicity theorem follows from these data.

## Local executed finite results, core4

nx nz m | ratio+ | ratio-
12 16 12 | 1.235557375579 | 1.126514845042
16 24 12 | 1.206050321824 | 1.097420321088
24 20 16 | 1.182172683031 | 1.072059573962
40 16 12 | 1.170017794953 | 1.055739462234
64 14 12 | 1.169123573558 | 1.049622582135
96 12 12 | 1.173070645737 | 1.048413912922

At nx=96, nz=12, core2:
+ S=.030556428769, X=.005704884685, logZ=.002527342518, Drel=.007815761383, ratio=1.173070580512.
- S=.039432894513, X=.006579746423, logZ=.003718380132, Drel=.005627251665, ratio=1.048408100827.
The plus sequence is not monotonic across these geometries. There is no demonstrated convergence to 1. The earlier 95.6157% historical ratio uses a different energy reference and an independent entropy; these numbers are not its corrected digits.

## Exact thermodynamic distinction

Set beta=2pi in units hbar c/R, let Hexc=H_R-E_R,ground, and tau=exp(-beta Hexc)/Z. The reference excitation spectrum consists of two real polarizations per original complex oscillator. With positive eigenfrequencies omega_j,
logZ=-2 sum ln(1-exp(-beta omega_j))>0,
Xtau=2 sum omega_j/[exp(beta omega_j)-1].
S_tau=beta X_tau+logZ. For the actual reduced state rho, relative entropy Drel(rho||tau)=beta Xrho+logZ-Srho. Hence
beta Xrho/Srho-1=(Drel-logZ)/Srho,
beta (Xrho-Xtau)-(Srho-S_tau)=Drel>=0.
Exact Gibbs matching Drel=0 is not enough to get an absolute Eexc=TS, since logZ remains positive in every finite nonempty system. At beta fixed, the reference free energy F_tau=-logZ/beta. A first law for infinitesimal variations is not an absolute equality of energy and entropy.

At depth96 core4, the + excess 0.17307065 decomposes into +Drel/S=.25578142 and -logZ/S=.08271078; the - excess .04841391 decomposes into +.14271140 and -.09429749. The actual Gibbs-reference ratios beta Xtau/S_tau are .86043175 and .84407964 respectively. These are central trace diagnostics, not two new physical horizon entropies. Neither mismatch nor logZ is a fitted term.

In exact de Sitter GR, E_MS=T_H S_H follows from E_MS=c^4 R/(2G), T_H=hbar c/(2pi k_B R), S_H=k_B pi R²/lP². Varying R along de Sitter solutions gives T_H dS_H=2 dE_MS and rho dV=3 dE_MS, hence T_H dS_H=-dE_MS+rho dV. This already distinguishes geometric Misner-Sharp energy from matter oscillator thermal excitation. A physical identification must account for gravitational work and the energy reference, rather than force Eexc=TS or append logZ by hand.

Established local relativistic QFT: the Bisognano-Wichmann theorem identifies vacuum wedge modular flow with Lorentz boosts under its relativistic assumptions (see https://academic.oup.com/ptep/article/2013/8/083E03/1592897 and Bisognano/Wichmann, J Math Phys 16 (1975), 985). No proof of those assumptions for the microscopic magnetic lattice is present. In particular, if its three plane fluxes were interpreted as a fixed physical magnetic background, a boost normal to x would mix the nonzero transverse magnetic components with electric fields; one cannot invoke boost invariance merely from inserting a lapse. This conditional observation is not a claim that URT arithmetic flux is physical electromagnetism.

## Verification and continuation

central_thermal.py was executed locally for every size listed, including 96x12, in both native flux sectors. Stable exp(-beta omega) formula introduced after the depth96 run avoids harmless overflow in the earlier expm1 form; rebuilt quick regression ran successfully at 12x16 and 16x24 and verifies both thermal identities. Default CI is bounded quick regression; --full reproduces deeper cases and quadrature check.
NEXT: derive physical gravitational energy/entropy reference including work and covariant stress, and a controlled boundary-limit calculation, without assuming the observed finite ratios approach one. Do not retrofit old 95.6% arithmetic with a numerical correction.
