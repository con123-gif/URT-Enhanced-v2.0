# Full C3-resolved six-triplet photon and self-energy extraction (17 October 2026)

**Executed finite-matrix construction, no measured lepton masses fitted; not yet a physical H64 Koide solution.** Complete code, original native source modules and numerical JSON are provided in the conversation archive `cathedral_6x6_conditioned_photon_cumulant_2026-10-17.zip`.

## Definition of tested operator
For original icosahedral 20-face Peierls hopping H[A] supported on all 60 native W chirality pairs (unique two-edge dual geodesics), choose geometric face (0,2,1). Twelve complete 20-face POVM effects are E_i=diag(c_inc[:,i])/3. Set E_face=(E_0+E_2+E_1)/3 and S=sqrt(E_face). This **conditional Lüders sandwich is a model choice** not identified with the physical H64 history selector.

Using original U3=[T1|T2] (20x6), test M6=U3^T S H[A] S U3. A true 120-degree face rotation R20 is projected into R6; `R6^3=I6`, and [R6,M6]=0 to <1e-13. The full six-band problem decomposes into three *coupled* C3 sectors, each two-dimensional.

### Finite coupling and generation coefficients
With Lz=i(R3-R3.T)/sqrt3 and Q3=2I-3Lz², M3=aI+bQ3+cLz. The face-conditioned matter, before photon dressing, has:
- T1 (a,b,c)=(0.103250319332,0.102357396810,0)
- T2 (a,b,c)=(0.103250319332,0.032084559918,0).
The offtriplet Frobenius norm is **0.031652309205**. Its bare three singular values are 0.019526214588, 0.019526214588, 0.015470053838.

With the actual previously constructed conditioned chiral photon current, **unit dimensionless coupling**, the coefficients become:
- T1 (0.103250318309,0.102357396227,-0.0000261941216896)
- T2 (0.103250318309,0.032084560910,+0.0000146678610139).

The six dressed eigenvalues are [-0.004194605536,-0.004141763101,0.076211968842,0.076241758757,0.165736775793,0.309647775098]. The proper C3 phase convention is `s=b+i c/sqrt3`, hence atan2(c,sqrt3 b): -0.0001477488062 rad (T1) or +0.0002639429392 rad (T2). The 3x3 coefficients are actual matrix traces and reconstruct the calculated projected blocks.

### Full Schur and chiral test
All six exact spectral poles satisfy det[zI3-A-B(zI3-D)^(-1) B†]=0 to <2.49e-17. The z=0 static reduction has eigenvalues [-0.004492865872,-0.004436361023,0.306535631925], not a positive mass operator. Treating B as a hypothetical chiral T1-to-T2 mass map gives singular values [0.019531978092,0.019520451831,0.015470053224] and Q=0.337023029842 if they are root masses, **not** 2/3. T1/T2 are not independently demonstrated to be physical L/R fermion chiralities.

### Gaussian averaging and genuine photon JGJ term
With full dual 3D-cone Maxwell link covariance C=[(b2d b2d.T)^+]_(shell,shell), all 60 native two-step paths have the same variance 0.3240704595176736 (<7e-16 spread). Thus source-free Gaussian averaging of this *linear hopping operator* only multiplies it by exp(-g²*0.3240704595/2); it does **not** change normalized masses or spectral phases. At the prior **conditional** α-based coupling that scalar is 0.985251016708292.

However the photon-induced fermion resolvent self energy includes a genuine current-current contraction **and** its Peierls second-derivative contact:
```
Sigma2(z)/g² = (1/2) Σ_e,f C_ef H_ef + Σ_e,f C_ef H_e (z-H0)^(-1) H_f .
```
At the purely diagnostic z=8, the 20-state current-current norm is **0.016162777620**, seagull norm **0.170800129076**. Current-current gives a nonzero T1/T2 coupling of **0.000172684035**, even quadrupole b values 0.000550630674 (T1), 0.000718831350 (T2), and c=0. The conditioned oriented mean current separately supplies c≠0. This is a **static Gaussian 3D photon model**, not a retarded QED correction or derived charged-lepton pole action.

No measured lepton masses were inserted. The calculation demonstrates that conditioned matter yields an even axial quadrupole and inter-triplet coupling, while the chiral photon current produces orientation-odd splitting. It is a constructive finite result; the physical H64-typed mass identification and actual Koide ratio remain open.