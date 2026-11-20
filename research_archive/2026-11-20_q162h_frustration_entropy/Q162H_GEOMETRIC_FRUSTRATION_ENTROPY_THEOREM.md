# Q162h — Platonic mismatch + frustration + symmetry breaking + entropy: exact local selection theorem

Date: 2026-11-20. STATUS: **THEOREM for the explicitly specified native finite state/evolution model, physical identification OPEN.** No experimental targets or fitted parameters. All 5 original Platonic solids, H64 hidden source, 60 genuine original golden-frustration ground states retained. This continues Q101/Q161cw/Q162d–g, not a new ad hoc sector.

## Original inputs and precise dynamic assumption

Recover exactly the original Q101/Q161cw 50-vertex 90-edge all-five source E_raw, its eight linear/quadratic harmonics, the positive definite G=E_raw^T E_raw and K=E_raw^T[d0^T d0]_all-five E_raw. Use the original metric negative Dirichlet gradient G da/dt = −K a. This is **chosen Euclidean model dynamics**, not a physically derived Hamiltonian or temporal clock. Coordinates map through the **original whitened** I_ico, preserving all-five parity coupling: x_s(t)=I_ico exp[−G^(-1/2) K G^(-1/2) t] I_ico^T s.

For every one of the original 60 golden phi-frustration ground configurations (two inverse-related 30-word A5 orbits), use original C (20x12 face incidence), P3/P5 (rank4 each), and frozen Delta:

    f_s(t)=(C x_s(t))² (pointwise)
    u_s(t)=P3 f_s(t)+Delta P5 f_s(t)
    b_s(t)=Uh u_s(t) in the REAL original H64 eight-dimensional hidden subspace.

No synthetic or random matrix and no fitted source weights enter. The unit norm, population interpretation and the choice of time are not implied by the bare URT scalar q. To study selection, **declare** a conditioned population/visibility weight
    w_s(t)=||u_s(t)||², p_s(t)=w_s(t)/sum_j w_j(t).
This is a useful internal model of differential survival. It is NOT a demonstration of the Born rule nor physical particle-number probabilities.

## Exact entropy-curvature identity

Write the calculated instantaneous logarithmic source rates r_s=d ln(w_s)/dt. Differentiating normalized weights gives the exact replicator identity

    p'_s=p_s [r_s − sum_j p_j r_j].

The complete original 60-source ensemble has identical initial ||u_s||², hence p_s(0)=1/60. For Shannon entropy H(t)=−sum_s p_s(t)ln p_s(t), exact differentiation at this uniform point yields

    H'(0)=0,
    H''(0)=−[1/60 sum_s (r_s−rbar)²]=−Var(r_s).

**This is an exact analytical identity even if the rates themselves vary with time.** It establishes LOCAL entropy selection at the equal-weight point, not a globally monotone second law.

Original all-five kinetic and 60 original nonlinear face sources give THREE distinct first-order rates, without a fit:

    class A 12 states : r_A=−12.747669375272...
    class B 24 states : r_B=−12.351761140940...
    class C 24 states : r_C=−11.296778573217...

Their weighted mean rbar=−12.008949760717128, variance=0.3590243108722678. Therefore

    H(0)=ln60=4.094344562222100...
    H'(0)=0,
    H''(0)=−0.3590243108722678  (dimensionless model-time^-2).

The standalone certificate checks the identity by independently exponentiating the eight-mode original kinetic and evaluating H(±0.0001), recovering H''≈−0.35902445. The leading entropy reduction is H(t)=ln60−0.179512155436134 t²+O(t³).

For the EXACT full nonlinear exp(−kin t) evolution at t=1, the class population shares (A,B,C) are (0.0776419711,0.2550147010,0.6673433279); at t=2 they are (0.0604255193,0.0381892549,0.9013852257). These are NOT cosmological relative times: the gradient index t has no conversion to seconds or Planck times. Crucially H(3)>H(2) in this same model, so conditional Shannon H is NOT globally monotone; *do not claim universal thermodynamic entropy production*.

## Exact A5-to-A4 symmetry reduction and the H64 1+3 splitting

The original 60-state equal ensemble source covariance is, by A5 irreducibility/Schur and the original per-state norms,

    C0=sum_s u_s(0)u_s(0)^T = 96P3+32Delta²P5,
    rho0=C0/Tr(C0)=[P3+(Delta²/3)P5]/[4(1+Delta²/3)].

Its normalized original H64 embedding Uh rho0 Uh† is a rank-eight trace-one density matrix, not equal to the separately frozen master state rho_star.

Under the declared WHOLE-FIVE kinetic, derivative

    Cdot=sum_s (udot_s u_s^T+u_s udot_s^T),
    rhodot=(Cdot−rho0 Tr(Cdot))/Tr(C0)

is invariant under the native twelve-element common tetrahedral group A4 but **NOT** under the larger original A5. The certificate explicitly builds native 20-face permutation operators from the actual twelve proper tetrahedral rotations, checks every commutator ||[rhodot,A4]||≤3.3e−15, and finds a genuine extra proper A5 generator with ||[rhodot,g]||≈0.2247844083.

Each original A5 quartet restricts to A4 as 4|A4 = 1⊕3. On the original P3 quartet, the derivative's eigenvalues split EXACTLY by these dimensions:

    A4 singlet (one)   : +0.123121340273318...
    A4 triplet (three) : −0.0410378959779766...

This is a numerical evaluation of an analytically symmetry-forced block split; the decimals are not mathematical constants of Nature. The source ensemble therefore distinguishes ONE from THREE without inserting a separate spacetime time/space variable. It does **not** establish a Lorentzian metric, physical singlet time or gauge forces.

## Quantum/state entropy check (distinct from conditioned Shannon selection)

For the normalized eight-dimensional hidden covariance rho(t)=sum_s u_s(t)u_s(t)^T/sum_s||u_s(t)||², its initial P5 sector probability and derivative are:

    p5(0)=Delta²/(3+Delta²)=2.06535108816513e−6;
    p5'(0)=−7.65233938762317e−6.

The initial density is a fourfold degenerate P3 eigenvalue plus fourfold degenerate P5 eigenvalue. Thus for S_vN=−Tr rho ln rho,

    S_vN'(0)=p5'(0)*ln[(1−p5(0))/p5(0)]
            = −0.000100170716276776  nats/unit model time.

Its negative sign is checked independently by the exact nonlinear source at t=±1e−4. This is **not** the thermodynamic second law: rho(t) is a conditioned normalized source covariance evolved by a NONUNITARY Euclidean gradient, not a closed quantum density matrix under unitary time evolution.

The first-order singlet/triplet split also contributes to mixing/entropy at higher orders; one must not read this first derivative as all future dynamics.

## Assessment and exact unresolved physical bridge

**New usable bridge within the declared model:**
    
    original all-five 50/90/50 incidence
      -> native tetrahedral odd/even mismatch
      -> 60 native phi-frustrated ground histories
      -> original Q101 nonlinear 20-face + H64 hidden source
      -> dimensionless gradient kinetic selection
      -> A5 breaks to A4 and 1⊕3, with strictly negative initial
         conditioned Shannon entropy curvature and native H64 S_vN rate.

**Selection assumptions that STILL need a first-principles derivation:** why the URT primitive selects the input sphere, the number of states, this Euclidean gradient time versus an actual unitary 24-clock, and why w=||u||² should count physical populations. No Q96 local Ward/charged action, actual particle masses, GR or sub-Planckian spacetime identification has been established. The original Q161cz source-to-Q96 active problem remains open and is not silently replaced.

Source/native reproducible certificate: Q162H_GEOMETRIC_FRUSTRATION_ENTROPY_CERT.py (this folder), run via python at repo root. Independently run local reproduction at /mnt/data/Q162H_GEOMETRIC_FRUSTRATION_ENTROPY_CERT.py, exit 0 (using the equivalent original local Q162E reconstruction); registered CI pending verdict. No James Yang–Mills work included.

**RESUME:** Incorporate the actual original H64 24-clock transfer and native Q96 charged Wilson transport into the source amplitude evolution, test its CP/inversion selection and whether physical entropy production (including environment) obeys a fluctuation/second-law identity; retain source probability selection as a declared test, never a fitted observable.


## Controlled native-solid ablation: which mismatch is responsible?

To avoid conflating the *tetrahedral inversion defect* with the *entire cause of entropy selection*, a direct ablation repeats the ORIGINAL calculation after recomputing BOTH the vertex Gram G_subset and edge Dirichlet K_subset of each native subcollection, whitening them afresh, while holding fixed the genuine original frustrated 60-word input ensemble and Q101 hidden face source.

All tests run with actual original unit-radius vertices and actual graph edges. The instantaneous conditioned survival-rate variance is:

| Native solid collection | Var(r_s) |
| --- | ---: |
| Icosahedron + dodecahedron only | 2.5e−29 (zero to numerical precision) |
| Cube + octahedron + dodecahedron + icosahedron (NO tetrahedron) | 0.15248159401299013 |
| **All five Platonic solids** | **0.3590243108722678** |

The icosa+dodeca pair is A5-symmetric on the original source harmonics, so it cannot split the original 60 A5-related ground-word response rates. Their numerical zero is consistent with this representation argument. The cube+octa addition breaks this large symmetry to the common A4 and already produces an entropy-selection rate variance. Therefore **the tetrahedron is not the only possible source of asymmetry in rates**. The tetrahedron's special and mathematically separate role is introducing ORIGINAL odd/even harmonic parity mixing, absent from the other 46 antipodally paired vertices. All five together change the magnitude and pattern of the selection.

The total rate variance is NOT a sum of each individual variances: the Gram whitening, source evolution and interference among solid contributions are coupled. These numbers cannot be treated as physical entropy production constants. The three response classes are A4-orbit geometry, not empirical generations.

The exact native companion script Q162H_GEOMETRIC_FRUSTRATION_ENTROPY_CERT.py now includes these genuine ablation checks. Independent local original-formula ablation: /mnt/data/q162h_solid_ablation.py, exit 0, including the 2.5e−29 zero and two nonzero variances.


## Native inversion-odd cubic channel Q162i: real asymmetry, no selected sign yet

The actual original tetrahedron's four unit-radius directions t_v have the only nonzero full-five cubic third moment T_xyz=4/(3sqrt3), six permutations. The original 60 golden frustration ground states s have native source axes

    m_s = (sum_i s_i v_i) / ||sum_i s_i v_i||,
    ||sum_i s_i v_i|| = 4/phi.

The purely original cubic odd observable is

    O_s = sum_(v in tetra) (t_v dot m_s)^3
        = (8/sqrt3) m_x m_y m_z.

Direct enumeration of the actual 60 original ground words gives ONLY three exact levels:

    O_s=−1/sqrt3 (24 histories); O_s=0 (12); O_s=+1/sqrt3 (24).

Under original complete spin inversion s->-s, O changes sign. In contrast, the existing Q101 hidden face-square source u_s(t)=P3 (Cx_s(t))² + Delta P5 (Cx_s(t))² is even because the native source kinetic is linear x_-s(t)=−x_s(t). Hence w_-s(t)=w_s(t) for every model time t, and the exact full equal-prior conditioned ensemble has

    <O>_t = sum_s p_s(t) O_s = 0 for all t.

This is a *constructive separation*: original tetrahedral geometry really has an intrinsic signed parity-odd channel, while the original symmetric frustration source and its presently chosen entropy weighting **cannot select the sign**. Even the visible 1⊕3 splitting and three-class rate hierarchy do not amount to a matter/antimatter population preference. Derive actual charge/CP-sensitive URT transport or dynamical spontaneous orientation selection from original H64/24/Q96, rather than inserting an unproved asymmetry source coefficient.

Original face/vertex local finite enumeration and exact inversion-cancellation theorem: Q162I_NATIVE_ODD_TETRA_SELECTION_CERT.py, independently executed via /mnt/data/Q162I_NATIVE_ODD_TETRA_SELECTION_CERT.py exit 0. New CI registered separately; physical interpretation remains OPEN.
