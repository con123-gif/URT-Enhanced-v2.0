# Q161da constructive alternative: real H64 complex structure to a charge-neutral Q96 chiral vertex

2026-11-21. Parent d677784. User authorizes independent initiative over entire project. THEOREM (conditional source typing) / CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. No empirical inputs, fitted constants, changed ARFs or gate status. Q161da remains open for the original one-particle embedding and physical dynamics.

## Prior-work ledger

- Q101 original 190 cochains/50-vertex source, hidden real 4_3+4_5 projectors and oriented W: research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py.
- Q162d original 64 antipodal-bit histories, 64x20 real U_h with U_h^T U_h=P_h, H8 eigenvalues 18 and 16, global charge-doubling construction and LOCAL projection leakage: research_archive/2026-11-20_q162d_h64_charge_doubling/Q162D_NATIVE_Q4_H64_CLOCK_CERT.py.
- Q161 exact hidden-four Yukawa: oriented circulation T^T T=(3/2)P3; T W P5/sqrt15 supplies second four in SAME real generation channel; 5+4 complete 9D and separate native face-source mass-vertex: research_archive/2026-11-17_q161_exact_hidden4_yukawa_isometry/Q161_EXACT_HIDDEN4_TO_YUKAWA_PHYSICS_CERT.py.
- Q124 original 444 contact states / 1032 links / Q16 charge; Q125 original wedge charged join; Q161 native source three-generation Hopf Ward and full electroweak kinematic covariance. Prior checks archived, latest CI checkpoint298 PASS at f722e56. Q161da still missing actual one-particle B_x after multiple separate spectral-moment calculations; do not repeat them.

## New construction

The second hidden four is already mapped to the same four-dimensional real generation tensor channel as the first. A real sum of these maps loses four source degrees of freedom. Instead use the EXISTING signed oriented W to define J=W/sqrt(15), so J^T=-J, J^2=-P_h, J P3=P5 J. Work on the REAL geometric source (physical complexification of all eight into an eight-complex-dimensional space is NOT an isomorphism below).

Define A=sqrt(2/3) T(P3-i J P5). The exact archived Gram relation and J identities imply A J=i A and A^dagger A=P_h-i J. Thus Re(A^dagger A)=P_h, over the real source A is a norm-preserving isomorphism to the complexification of the real four-channel T image. Complex rank=4, real rank=8. No free relative amplitude or phase angle in this complex-structure-preserving map; choosing this complex-structure interpretation of W is a DECLARED physical premise, not a unique dynamical choice. A U_h^T induces a real isometry on the original H64 hidden span.

For each of the 444 native contact histories, use original Q124 local S_x=n_x dot sigma; original Q161 Hopf unitary V_x with Q_L,x V_x=V_x Q_R,x, matching down/up and charged/neutral leptons. Write R_x as the 16x16 off-diagonal upper-right block V_x. Map h to Y(h)=reshape_3x3(A U_h^T h), then define
M48_x(h)=Y(h) tensor R_x+Y(h)^dagger tensor R_x^dagger,
M96_x(h)=diag(M48_x(h),conj(M48_x(h)))/sqrt(32).
This is a REAL-linear Hermitian charge-NEUTRAL interaction operator, not a charged output vector. The normalization is exact from Tr(V^dagger V)=8, two chirality blocks and conjugate copy: ||M96_x||_HS^2=||Y||_F^2=||h||^2 for real hidden input. [Q96_x,M96_x(h)]=0 for every such input. Thus the induced adjoint electric charge action vanishes on the entire 8-real-dimensional operator subspace, and in that operator representation the charge leakage vanishes. This is NOT the requested original (I-P_E) B_x^dagger Q96 B_x E for a charged one-particle embedding: that is a different representation. Distinguishing source-as-interaction from source-as-fermion is the constructive change in approach. The factor I24 extends the time-local source isometry over all 24 clock sites; no physical kinetic time normalization is derived.

Original Q124 links give V_x^dagger U_L,xy V_y diagonal unitary in the original Hopf frame. The native link frame calculation is reproduced; full transported interacting source must retain those Berry factors. Number of nonidentity D matrices in this chosen eigenvector gauge is NOT a gauge-invariant physical observable. No claim of new CP violation, gauge dynamics, SU3 verification, or physical CKM/masses. No observed data used.

## Executed evidence

Standalone original-formula NumPy/SciPy reconstruction, /mnt/data/cathedral_bridge/cert.py, OPENBLAS_NUM_THREADS=1 python, exit 0:
Native H64 8 real -> 4 complex generation channels: rank 4 real rank 8
444 Q96 Hermitian operator source isometries, Ward max 1.5331738151322304e-16 Gram max 2.6932820693775725e-15
24 clock slices; 1032 native links, Berry offdiag 5.868597978265741e-16 nonidentity frame comparisons 926
PASS conditional neutral chiral vertex, NOT a charged one-particle embedding or derived kinetic dynamics

This numerical certificate reconstructs the native formulas rather than using random/synthetic matrices. The analytic Gram theorem is conditional on the previously certified native T,W and H64 isometry. The certificate's unused comment about SU3 is not a test; no color Ward result is claimed.

RESUME: Determine from primitive dynamics whether the real geometric hidden field is in fact a neutral vertex rather than a one-particle charged state, and derive its joined action using the original H64 kinetic and Q125 links (including Berry transport) plus a physical 24-clock, not an arbitrary new mass term. Retain distinction from the original unresolved Q161da B_x gate. Need kinetic/observable selection, no physical gate closed. New CI pending.
