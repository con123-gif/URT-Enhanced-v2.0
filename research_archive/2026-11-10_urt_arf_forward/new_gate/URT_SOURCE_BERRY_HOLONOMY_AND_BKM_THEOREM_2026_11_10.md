# Newton's Cathedral / URT: exact polar-source Berry current, A5-invariant Wilson holonomy, and KMS entropy stiffness

**10 November 2026. Independent mathematical continuation.** Full original five-Platonic nonlinear source; six signed icosahedral history axes; Haar-64 signed histories; 24 phase-clock bins; original hidden `4_3+4_5` and frozen KMS state. No measured physics numbers, historical ARF coefficients, adjustable couplings, or third-party Yang–Mills material have been used. **Status: exact finite algebraic identities plus independently reproduced numerical holonomy; physical four-ARF derivation remains OPEN.**

## A. Why the earlier polar-to-KMS recovery does not determine the physical law

For **any** full-rank 24x8 matrix `S(a)`, the polar partial isometry `U(a)=S(a)[S(a)^* S(a)]^(-1/2)` obeys `U^*U=I8`. Consequently the recovered KMS state after the separately fixed rail amplitude `F=P3+Delta P5` is `(P3+Delta^2 P5)/[4(1+Delta^2)]` **regardless of the phase `a`**. In the original URT/Haar readout, phase shifts `a=0, 1/7, phi^-2, sqrt(2)-1, 0.495` have substantially different unconditioned eight-state spectra and raw `p5` values (from 0.5076 to 0.5478), but identical post-polar KMS states (matrix residual `<2e-10`). The minimum-disturbance isometry is unique *for a fixed source matrix*, not proof that the original dynamics selects a physical isometric measurement. The polar method alone cannot derive the golden phase or the frozen energy cost. This corrects any overly strong reading of the preceding conditional recovery theorem.

## B. Exact source derivative and interquartet geometric current

Let `C(a)` be the exact overlap of the 24 equal phase bins `[j/24+a,(j+1)/24+a)` with the 64 Haar six-bit cylinders, and `B(a)=sqrt(1536) C(a)`. Let `H` be the **original, covariance-normalized five-Platonic hidden source**, 64x8 on `4_3+4_5`, with `H^*H=I8`. Define `S(a)=B(a) H`, `R(a)=[S(a)^*S(a)]^(1/2)`, and its unique polar isometry `U(a)=S(a)R(a)^(-1)`.

The source matrix is piecewise linear in the relative phase offset a. At the primitive golden phase `a=phi^-2`, no clock/history interval endpoints coincide, so its derivative `S'(a)` exists and is calculated exactly by the active interval branches, with **no fitted current strength**.

Set `A(a)=U(a)^*U'(a)` (real skew-adjoint on the hidden eight-space). Differentiating `S=UR` and using `U^*U=I8` gives the **exact Sylvester equation**

```
R A + A R = U^* S' - S'^* U.
```

Since R is strictly positive, the equation has a **unique skew-adjoint solution**. Independent central differences of the original polar factors confirm it (Frobenius residual `1.06e-6` at phase step `1e-6`). At the golden phase:

```
||A||_F                 = 103.8529607671056
||P3 A P5||_F           = 62.20899114217872
||P3 A P5||_F^2         = 3869.9585789276703
||P3 A P3||_F           = 40.09251320390745
||P5 A P5||_F           = 37.92242986984267.
```

The **off-quartet** block is nonzero, so the URT source-readout geometry supplies a concrete `4_3 <-> 4_5` phase-response vertex. Under unitary changes of hidden frame that preserve each `P3` and `P5`, its norm is invariant. However a one-dimensional connection is locally gauge-removable, so these local matrix norms alone do **not** establish a physical gauge-field strength or a particle mass.

## C. A nontrivial closed-loop source holonomy

For a complete relative offset cycle `a:0 ->1`, `U(1)=U(0)` exactly. On a fine partition `a_k=k/N`, the canonical parallel-transport links are the orthogonal polar factors of `U(a_k)^*U(a_{k+1})`. Their ordered product has the gauge-conjugacy invariant eigenphases of an element of `SO(8)`. An independently repeated calculation converges as follows:

| N | Four positive eigenphases, radians |
|---:|---|
| 1536 | `1.575287, 1.775524, 1.920999, 2.222802` |
| 3072 | `1.589216, 1.772024, 1.925407, 2.206870` |
| 6144 | `1.592698, 1.771149, 1.926509, 2.202889` |

At N=6144 the Wilson matrix has `det=1+O(1e-13)` and `||W-I||_F=4.5431299454`, unequivocally nontrivial at these resolutions. The numerical values are convergent approximations, **not** exact analytic angle formulas. There are four pairs because an eight-dimensional real orthogonal rotation has four Cartan rotation angles, **not** because these have been shown to be the four historical physical ARFs.

### Icosahedral symmetry (exact finite representation)

Using the original 60 proper rotations of the icosahedron, including the induced signed permutations of all six antipodal axes, the source `H` obeys `H[g*h]=H[h] R_g` for an orthogonal `R_g` on the eight-dimensional hidden source, preserving the `4_3+4_5` decomposition. The original numerical full-matrix errors over **all 60 group elements** were below `1e-14` (source equivariance), `9e-15` (orthogonality) and `2e-15` (quartet preservation). Therefore the Wilson-loop conjugacy class—and its eigenphases—are invariant under all icosahedral changes of frame. Four independent nontrivial rotations were explicitly rerun through the full Wilson product with angular changes less than `2e-13` at N=384.

### Local clock gauge covariance requires a connection, not merely a source phase

For arbitrary clock-site unitary phases `D(a)` and periodic hidden-frame transformations `V(a)`, use the transported link

```
M_k = [D_k U_k V_k]^* [D_k D_(k+1)^*] [D_(k+1) U_(k+1) V_(k+1)]
    = V_k^* U_k^* U_(k+1) V_(k+1).
```

Its orthogonal/unitary polar factor transforms by endpoint conjugation, so the closed Wilson product transforms by conjugation and retains the eigenphases. The independent test found gauge-transformed versus original Wilson matrices differing by `1.12e-13`. Omitting the clock parallel link altered the result by `0.6025`, proving the Ward/gauge contact is not optional. This establishes mathematical gauge covariance *of the source-information transport*, not that this relative bin-shift holonomy is already the physical electromagnetic gauge holonomy.

## D. Exact non-fitted KMS relative-entropy cost of the source Berry portal

Use the frozen hidden KMS density `rho_*=a0 P3+b0 P5`, where `a0=[4(1+Delta^2)]^-1`, `b0=a0 Delta^2`, `eta=-ln Delta`, and `ln(a0/b0)=2eta`. Consider the phase-current-induced **unitary orbit** `rho(t)=exp(tA) rho_* exp(-tA)`, with A the original skew source connection. An elementary trace calculation yields **for every real t**:

```
D( rho(t) || rho_* )
    = 2 eta (a0-b0) || P5 exp(tA) P3 ||_F^2.
```

This is an exact identity, not a low-order model. In particular the quadratic information stiffness is

```
D(rho(t)||rho_*) = K_Berry t^2 + O(t^4),
K_Berry = 2 eta (a0-b0) ||P3 A P5||_F^2
        = [eta(1-Delta^2)/(2(1+Delta^2))] ||P3 A P5||_F^2
        = 11601.601158688176 in this fixed phase coordinate.
```

The **independent BKM metric** gives precisely the same coefficient:

```
chi_35 = 8 eta (1+Delta^2)/(1-Delta^2)
K_Berry = (chi_35/2) ||[A,rho_*]||_F^2.
```

The two stiffness calculations agreed to `7e-12` in absolute units. Exact unitary-orbit relative entropy calculated at t=`1e-3,1e-4,1e-5` approaches the quadratic prediction with relative residuals `6.43e-4, 6.43e-6, 6.43e-8`. This supplies a zero-fit **source-to-KMS information-curvature candidate** from the same eight-dimensional geometry. Its units depend on which physical source coordinate corresponds to the mathematical relative bin shift; no physical particle mass or ARF is being asserted.

## E. What remains unproved

The 64-word coding/24-bin **relative phase readout** is an explicit candidate dictionary, not yet a theorem identifying it with the actual temporal and spatial charged-matter gauge links of the complete Cathedral. The genuine physical electromagnetic current must be read from the 16/48-state matter and 190-cochain spatial gauge action, with Wilson source and seagull contacts. The physical rail and fermion mass pole likewise require their particular source-to-observable maps. Unitary Berry-orbit relative entropy is not automatically a dynamical mass; neither the four Wilson angles nor their KMS stiffness are the four historical ARF coefficients. The full four-ARF, no-free-parameter physical theorem remains open.

The result is stronger than a projector count: URT history coding + full original nonlinear source + exact 24-clock *can* produce a nonzero phase Berry current, nontrivial A5-invariant closed-loop holonomy and an exact KMS information curvature. The **physical selection and charged-current identification** is still the mathematical task.

## Reproduce

From `research_archive/2026-11-10_urt_arf_forward/new_gate`, with unchanged original source in `../forward`:

```bash
OPENBLAS_NUM_THREADS=1 python URT_POLAR_GOLDEN_PHASE_SPECIFICITY_TEST_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_NATIVE_POLAR_BERRY_CURRENT_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_POLAR_PHASE_WILSON_HOLONOMY_2026_11_10.py --high
OPENBLAS_NUM_THREADS=1 python URT_POLAR_WILSON_GAUGE_COVARIANCE_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_BERRY_A5_FRAME_SENSITIVITY_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_BERRY_KMS_ENTROPIC_STIFFNESS_2026_11_10.py
```