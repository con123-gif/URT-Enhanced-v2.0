# Newton's Cathedral — First-principles continuation: exact physical-observable gate

Date: 9 November 2026. The two independent executable checks use the **unchanged original 7 November 2026 all-five Platonic, 190/64/24 source** (`cathedral_constructed_joint_dynamics_2026_11_07.py`; SHA-256 `5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`). They use neither measured masses/couplings nor any historical ARF coefficient as an input to the dynamics. No GitHub modifications. These are exact conclusions *about that particular already-constructed source-loaded action*, not no-go theorems for every possible completion of Cathedral/URT.

## Theorem 1 — The native 24-link gauge field has a one-dimensional gauge quotient

For the original charge-one `z` and charge-two `y` clock fields, the original local transformation is

\[
 z_j\mapsto e^{i\alpha_j}z_j,\quad y_j\mapsto e^{2i\alpha_j}y_j,\quad
 \theta_j\mapsto\theta_j+\alpha_{j+1}-\alpha_j.
\]

The forward difference `d: R^24 -> R^24`, `(d alpha)_j=alpha_{j+1}-alpha_j`, has rank 23. Its image is **exactly** the subspace with sum zero. Thus the gauge quotient of the 24 link phases has dimension one, represented by the Wilson holonomy

\[
\Omega=\sum_{j=0}^{23}\theta_j\quad(\mathrm{mod}\ 2\pi).
\]

For *any* gauge-invariant effective phase action `Gamma(theta)`, including integrating/minimizing over its dynamical `z,y` fields, gauge invariance forces `Gamma(theta)=f(Omega)`; hence

\[
\boxed{\frac{\partial^2\Gamma}{\partial\theta_i\partial\theta_j}
=f''(\Omega),\qquad\operatorname{rank} \operatorname{Hess}_{\theta}\Gamma\le1.}
\]

There are 23 Ward-null directions. Therefore the clock-only gauge sector cannot be identified with a four-dimensional spatial/transverse Maxwell field with a local `q^2` photon stiffness: the necessary spatial gauge field and charge/current coupling need to be constructed using the other Cathedral data, not merely renamed from the clock.

**Execution:** The original 24×24 `clock_laplacian(thetas,2)` obeyed the full nonuniform local gauge conjugation with matrix Frobenius residual `1.17e-15`. Concentrating all phases on one link (preserving `Omega`) preserved its complete spectrum with residual `4.60e-15`. The cycle incidence rank is 23.

## Theorem 2 — Source-free history elimination does not select the imported golden holonomy

The exact original `Hbits` eigenvalues are `0(2),10(12),16(30),18(20)`. On the source's declared two-history-zero-mode quotient, Gaussian integration gives, up to constants independent of `Omega`,

\[
\log\det{}'K(\Omega)=
\sum_{(E,d)=(10,12),(16,30),(18,20)}
 d\log\left[\cosh(24t_E)-\cos(2\Omega)\right],
\quad t_E=\operatorname{arcosh}\left(1+\frac{E}{2(\pi/e)^2}\right).
\]

Therefore

\[
\frac{d}{d\Omega}\log\det{}'K
=2\sin(2\Omega)\sum_E\frac{d_E}{\cosh(24t_E)-\cos(2\Omega)}.
\]

Each summand has a strictly positive denominator. Consequently the determinant prefers trivial charge-two holonomy `2 Omega = 0 mod 2pi`. The frozen URT value is `Omega_star=24(2pi/phi^2)`; it does **not** satisfy this stationarity condition. Its phase is an imported URT seed in this action, not dynamically selected by this determinant.

Numerically, at 95-digit precision,

- `logdet'(Omega_star)-logdet'(0) = 1.67908034027388109739488984288075e-22` (positive);
- `d logdet'/dOmega (Omega_star) = 1.92430034289650875731456882137043e-22` (nonzero);
- `d² logdet'/dOmega² (Omega_star) = -2.25549402402922357813238202389220e-22` (nonzero).

These are extremely small but mathematically distinct from zero. The complete clock Hessian is an exactly rank-one outer product; no finite-precision rank test is needed. The exact derivative formulas passed independent high-precision central-difference tests.

**Scope:** Other dynamical parts of the full Cathedral could select the golden phase. This result rules out only the source-free Gaussian clock determinant as that selector.

## Theorem 3 — The original source cannot create tree-level vacuum mass terms via its quartic interaction

The actual hidden source in the original code is

\[
h_s(z)=P_s [(C P_{\rm linear}v(z))\odot (C P_{\rm linear}v(z))],\quad s=3,5.
\]

Therefore `h_s(tz)=t² h_s(z)` exactly. The eliminated Gaussian history energy is quadratic in `h` and hence quartic in `z`; the Gibbs/KMS information cost also begins at quartic order. The original geometric action is a sum of positive semidefinite spatial squares plus positive clock energy. At the frozen golden phase, the original charge-one clock has

\[
\lambda_{1,\min}=0.0019153967537666>0,
\]

and the original charge-two clock has

\[
\lambda_{2,\min}=0.0076579182703442>0.
\]

The history-integrated sector has exact bound (from `A3≥18I, A5≥16I`)

\[
V_{\rm hist}\ge\frac29\|h_3\|^2+\frac7{32}\Delta^2\|h_5\|^2\ge0.
\]

The KMS free energy is a nonnegative variational sum of positive source costs and a KL divergence. Consequently **at this fixed phase** the source-loaded finite model has a unique zero classical vacuum `z=y=0`. Its Hessian there receives no contribution from hidden nonlinear sources; for any fixed test field `v`,

\[
\boxed{S_{\rm eff}(tv)=t^2G(v)+t^4 V_4(v)+O(t^8).}
\]

This is not a global no-go for physical masses from the *whole* Cathedral. It establishes that identifying the four historical ARFs' mass coefficients with vacuum **quadratic** masses of this specific November scalar construction is incorrect. A charged fermionic source and/or a dynamically justified nonzero background is needed to have physical fermion masses.

**Independent original-source test** used a nonzero all-five-solids geometric field. It gave

\[
G=39.152622235282216,\quad V_{4,\rm hist}=7.873527024380161,\quad
V_{4,\rm KMS}=8.857031535096223,\quad V_4=16.730558559476385.
\]

For amplitudes `t = 0.30, 0.20, 0.12, 0.08`, the measured `(S(tv)-t²G)/t⁴` converges respectively to `16.73055806473`, `16.73055846222`, `16.73055854688`, `16.730558556996`. No fit is involved; the coefficient is calculated independently from the original action.

## The frozen five-pole residue does not equal the source-derived residue

From the exact original 64-history source covariance, the tetrahedral hidden-five singlet's unweighted variance is `7/4`; the original history transfer attenuates its amplitude by `Delta`. Thus its *raw scalar-source* energy-five resolvent residue is

\[
\boxed{\frac74\Delta^2
=0.00001084311560789117760715658760\ldots,}
\]

whereas the historical scalar ARF's 5-pole residue is `gamma/8=1/648=0.0015432098765...`. The latter is about `142.321629` times larger. This is a comparison in the declared raw source chart, **not** a universal physical disproof since the historical observable/source map has not been established to coincide with that chart. Covariance whitening can produce historical **trace** factors but cannot change a physical susceptibility if the kinetic operator is simultaneously transformed: `h'^dagger (K')^-1 h' = h^dagger K^-1 h`.

## Exact status of the four historical ARFs

The four archive formulas were *not* used in the source-action derivations:

\[
\begin{aligned}
\Delta\delta&=-\delta_*^3/63-\gamma/40,\\
R_\alpha&=3/(64\phi)+1/(79\phi^2),\\
C_{\rm mass}&=-5\delta_*^3/16+7\pi\phi/8,\\
R_{\rm mass}&=3\delta_*^2/35-4\pi^3/51.
\end{aligned}
\]

Earlier exact carrier calculations explain the individual rational factors, but **do not derive a single physical source-to-observable law selecting these four linear combinations**. The original 24-clock action supplies one global gauge holonomy, not the physical 4D photon stiffness; the original November action contains no charged 16/48-state fermionic source and its unique classical vacuum has no hidden-generated quadratic masses.

**Mathematical endpoint for this specified November action:** no theorem identifying all four historical ARF expressions as its uniquely fixed physical gauge/matter/rail observables follows without supplying a new, independently derived physical source-to-observable map. Merely selecting it to match four expressions would violate the no-fitting rule. These theorems do not rule out a richer, first-principles complete Cathedral action.

## Reproducibility

Run the two unchanged-source executable checks:

1. `arf_original_clock_exact_observable_gate_2026_11_09.py` (gauge quotient, exact Chebyshev determinant, residue comparison);
2. `arf_native_vacuum_hessian_no_fit_2026_11_09.py` (unique vacuum, finite differences, source homogeneity and quartic action).

Both save JSON audit results. Neither script modifies the original source or the user's repository. The original SHA-256 is asserted before execution.

## Theorem 4 — The genuine charged hypercharge source is not a 79-dimensional generation current

The existing charged 16-state matter carrier fixes, without fitting, the physical particle charges

\[
Y=\operatorname{diag}\left((1/6)^{\times6},(-1/2)^{\times2},(2/3)^{\times3},(-1/3)^{\times3},-1,0\right),
\]

with weak `T3` acting on three quark and one lepton doublets. Direct exact arithmetic yields

\[
\boxed{\operatorname{Tr}_{16}Y^2=10/3,\quad
\operatorname{Tr}_{16}T_3^2=2,\quad
\operatorname{Tr}_{16}(Y+T_3)^2=16/3.}
\]

The primitive electron charge is `Q_e=-1`. The alternative *all-left-handed exterior 16* charge convention has `Tr Y^3=0` (anomaly trace); the particle-basis unsigned cube sum is `-4/9`, so those two trace conventions must not be conflated. Both have the same quadratic gauge trace `10/3`.

The historical `79` exhaust carrier instead arises from endomorphisms of the generation-bilinear representation `H9=End(3')=1+3'+5`. Physical hypercharge restricted to any **fixed species** commutes with the generation representation, `Y_f=q_f I3`, and hence its adjoint action on `End(3')` is **zero**. That is a representation-type obstruction to replacing the physical charge current by an arbitrary unit current in the 79-dimensional exhaust complement.

Even the purely abstract traceless `End(H9)` sector has two independent invariant current lines; choosing one by `A5` and unit Hilbert-Schmidt norm cannot distinguish them. Their overlaps with the original fiveplet are respectively `0` and `-5/sqrt(30)`, confirmed by exact rational/surd arithmetic.

**Physical coefficient implication:** the true one-family electroweak charge trace fixes relative current normalization, but the electromagnetic infrared stiffness still depends on the (uncomputed) complete gauge-covariant selected-transfer transverse Hessian. In the common-coefficient convention `S=(C/4)[(10/3)F_Y²+2 F_W²+...]`, the necessary infrared relation is `alpha(0)^(-1)=(64pi/3) C_IR`; the original 24-clock source does not determine `C_IR`.

Reproduce with `arf_physical_charge_vs_79_exact_type_test_2026_11_09.py`, which verifies both left-handed and particle-basis conventions independently.
