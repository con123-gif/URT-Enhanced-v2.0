# Q94 — Native H64 hidden 4_3 / 4_5 projected 24-clock response

**2026-11-14. Status: exact theorem for the original finite H64/icosahedral hidden carrier, conditional on Q93's declared Gaussian clock action; local executable certificate PASS, CI pending. Physical identification pending; no ARF established.**

## Provenance and scope

Uses the original `cathedral_engine/geometry.py` construction: icosahedral vertices `(0,±1,±phi)` and cyclic placements, exact 20 triangular faces, face-vertex incidence `C` (20x12), face Laplacian `L`, and hidden projectors
```
Ph = I20-C(C^T C)^-1 C^T;
P3=Ph(5I20-L)/2; P5=Ph(L-3I20)/2.
```
Uses the **original** `cathedral_engine/histories.py` six antipodal axis pairing, `M[h,f]=1` iff history h's chosen vertices contain face f, and the H64 hidden embedding `P8=M Ph M^T/2`, `H3=M P3 M^T/2`, `H5=M P5 M^T/2`. All matrices are computed symbolically with exact `sqrt(5)` geometry and rational subsequent algebra, not random arrays. The 64-history Q remains the original two-successor Q with `Q^6=J/64`.

This calculation extends Q93's native 64-history trace to the *actual* hidden carriers. It does not claim that the 190-cochain coupled system or its original nonlinear all-five source has been eliminated, nor that Q93's Gaussian clock residual is a uniquely derived dynamical law.

## New exact theorem — native hidden-sector trace response

Let `R_j=Q^j-P` for j=0,...,5 and `P=J/64`. Let `A(z)=zI-Q`, `K(z)=A(z)^* A(z)`, `z=e^(i omega)`, and let `H3, H5, P8` be the **native** H64 projectors above.

For `z != 1`, their projected inverse traces are the following exact trigonometric polynomials:

```
R3(omega) = Tr(H3 K(z)^-1)
          = 34/5 + (4/5) cos(omega).

R5(omega) = Tr(H5 K(z)^-1)
          = 28/3 + (2/3) cos(omega)
                 + (2/15) cos(2omega) - (8/15) cos(4omega).

R8(omega) = R3 + R5
          = [242 + 22 cos(omega) + 2 cos(2omega) - 8 cos(4omega)]/15.
```

**Proof.** From `Q^6=P`, the exact finite inverse is `A(z)^-1=P/(z-1)+sum_j z^(-j-1) R_j`. The native `H3 P=H5 P=0` removes the stationary pole from the *projected trace*. Define the rational Gram entries
```
B^s_ij = Tr(Hs R_i R_j^T)
       = 1/2 Tr(Ps (R_i^T M)^T (R_j^T M)), s=3,5.
```
Exact symbolic `C`, `L`, `M` and `Q` calculations yield for frequency lag d the sums `a^s_d=sum_{i=0}^{5-d} B^s_{i,i+d}`:
```
d           0       1      2      3       4      5
P3        34/5     2/5     0      0       0      0
P5        28/3     1/3    1/15    0     -4/15    0
P8       242/15   11/15   1/15    0     -4/15    0
```
Then `R_s(omega)=a^s_0+2 sum_{d>=1} a^s_d cos(d omega)`; the above equations follow. All projector ranks, idempotences, orthogonality, and 6x6 Gram identities are asserted exactly.

## 24-clock sum — unconditional algebraic cancellation given Q93 action

At the 24 Fourier frequencies `omega_k=theta+2pi k/24`, the sums of `cos(d omega_k)` vanish for every d=1,...,5, regardless of theta. Consequently, under the Q93 clock action,
```
sum_k R3(omega_k) = 24*(34/5) = 816/5 = 163.2
sum_k R5(omega_k) = 24*(28/3) = 224
sum_k R8(omega_k) = 24*(242/15) = 1936/5 = 387.2.
```
With Q93's additional normalisation `r=pi/e`, the total projected trace is `(e/pi)^2 * 1936/5 ≈ 289.884214730041` in internal units. **The complete 24-track hidden-carrier trace cannot distinguish golden phase, charge-1 and charge-2 twists, or any other uniform twist in this conditional Gaussian model.** Its *individual Fourier bins* remain phase-dependent. At a zero-frequency singularity, these projected traces are the finite continuous/pseudoinverse sector values because the hidden projectors annihilate the constant mode.

This is a scoped structural constraint, not a general no-go for nonlinear clocks, Wilson-gauge matter, unequal track weights, a charged source, or the full all-five interaction.

## Evidence and next attempt

`python research_archive/2026-11-14_q94_hidden_clock/Q94_NATIVE_HIDDEN_PROJECTED_CLOCK.py`

Local SymPy exact arithmetic: 30 icosahedral edges, 20 faces, rank-8 Ph; native H3/H5 rank 4+4; exact projector identities and all rational 6x6 Gram coefficients; exact 24-track response 816/5, 224, 1936/5. Four direct full 64x64 complex inverse tests for each of three hidden projectors (12 numerical cross-checks) passed. **GitHub CI check registered, verdict pending.**

**RESUME HERE:** Pull the existing *all-five nonlinear source* `cathedral_engine.source.exact_source(v50=e0+e3)` through `U_h`; calculate the source-specific `s^* K(z)^-1 s` rather than the projector trace, with both 4_3 and 4_5 weights computed from the native source. After that test charge-two Wilson transport and both Ward orders. Do not impose historical ARF formulas or weights.
