# Coupled cycle 32 predeclaration — dichotomy of supercritical and subcritical branches

Date: 2026-11-10 (Europe/London)

The even channel condenses for y_even > y_c(T) (cycle 18, alt 25).
On the supercritical branch the 4_5 condensate has charge 2, the
geometric U(1) is Higgsed to ℤ2, and the derived fermion-only
vacuum is all-π flux with an isotropic London mass
m² = 1/12 (T = 0) or tanh(10/(2T))/12 (T = η) (cycles 25, 28, 29).
This cycle proves the dichotomy and fully analyses the complementary
subcritical branch y_even < y_c(T), whose vacuum sits at the origin
r = 0 (Δ = 0).

Frozen ingredients, used as named inputs, not fitted:

    φ = (1+√5)/2,   δ★ = 80π/(1053 φ),   Δ = 3/20 − δ★,   η = −ln Δ
    graph magnetic Laplacian K[A] and Nambu Ω of cycles 18 and 25
    cycle-space projector and Δ1 = d0 d0^T + d1^T d1 of alt 34 / cycle 25
    even unit pairing of cycle 18 (only used to confirm that r = 0
    is the subcritical vacuum; the kernel itself is computed at Δ = 0)
    primary kinetic: 12-site icosahedral graph Laplacian
    (the carrier of A in cycles 23–29)

No tree-level |D_A Δ|² and no external Maxwell term (κ_ext = 0).
No historical ARF is inserted into Ω. The alt line’s joint 4_5
potential (Z3 mixed minima, A4/D3 transitions) is not duplicated.

## Dichotomy (supercritical side: already proved, cited not recomputed)

S. For y_even > y_c(T) the origin is unstable, the even channel
   condenses along the A4 ray, Q_geo(Δ) = 2, and the geometric U(1)
   is Higgsed to ℤ2. The derived fermion-only vacuum is A_e ≡ π.
   About that vacuum the GI transverse kernel is positive definite
   and identity-like, not Maxwell-like:
       Π_T(T = 0) = +(1/12) I_19
       Π_T(T = η) = +[tanh(10/(2η))/12] I_19
   Frobenius projection (cycle 29): m² takes those values and κ, β
   are consistent with 0. Citations: cycles 18, 23, 25, 28, 29 and
   alt 25, 29, 31–35.

## Subcritical observables, in this order

1. Exact T = 0 identity (to be verified numerically to 10^{-12}):
   K[A] ⪰ 0 and Tr K[A] = 60 for every real connection A, hence
   the T = 0 Nambu free energy Ω_f[A] = −½ Σ_i λ_i(K[A]) + const
   is independent of A. Consequently the T = 0 Hessian vanishes
   identically (Π = 0, both longitudinal and transverse). There is
   no preferred flux at T = 0, r = 0: the vacuum is the entire
   connection torus.

2. Spectrum of K at A = 0 and at A_π = π·1_30 (exact closed forms):
   A = 0:  0 ⊕ (5−√5)^{⊕3} ⊕ 6^{⊕5} ⊕ (5+√5)^{⊕3}
   A = π:  10 ⊕ (5+√5)^{⊕3} ⊕ 4^{⊕5} ⊕ (5−√5)^{⊕3}
   The constant / unpaired mode sits at E = 0 (A = 0) and E = 10
   (A = π). At r = 0 every kinetic eigenvalue is unpaired.

3. Finite-temperature flux vacuum at the derived temperature T = η:
   compute Ω_f(A) − Ω_f(0) at A = 0, A = π, and at N = 40 random
   connections (seed 32, i.i.d. uniform on [0, 2π)^{30}), plus the
   control that a pure gradient A = −d0 λ has ΔΩ = 0. The derived
   vacuum is the minimiser. Report also ΔΩ(π) − ΔΩ(0) and
   Tr(K^4) at both points (the first A-dependent high-T invariant,
   since Tr K and Tr(K²) are A-independent).

4. Gauge invariance at r = 0 is automatic (the fermion determinant
   depends on A only through the Peierls-covariant K[A]; there is
   no charged condensate and no Goldstone to compensate). Verify
   Ω(A − d0 λ) = Ω(A) and that the directional Hessian along every
   tested gradient vanishes.

5. Unitary-gauge / transverse Hessian Π_T (19×19) of Ω(A_bg + a)
   at T = 0 and T = η, about A_bg ∈ {0, π}, with finite-difference
   steps ε = 0.02 and a control ε = 0.05 at (A = 0, T = η). At
   T = 0 the predicted kernel is the zero matrix (item 1).

6. Diagnostics of Π_T, copied from cycle 25 / alt 34 and not
   adjusted afterwards:
   - positive-definite iff λ_min(Π_T) > 10^{-10}
   - identity-like iff ||Π_T − c_I I||_F / ||Π_T||_F < 0.10,
     c_I = Tr(Π_T)/19
   - Maxwell-like iff ||Π_T − κ_iso Δ1_T||_F / ||Π_T||_F < 0.10,
     κ_iso = ⟨Π_T, Δ1_T⟩_F / ||Δ1_T||_F²
   - unique iff the relative spread of generalised eigenvalues of
     Π_T v = κ Δ1_T v is < 0.05
   - κ_REM = λ_min(Π_T) / λ_min(Δ1_T)
   A derived Maxwell coefficient exists only if, at the derived
   T = η vacuum (the minimiser of item 3), Π_T is positive
   definite, Maxwell-like, unique, finite (|κ_i| < 10^{10}) and
   every κ_i > 0.

7. Canonical Frobenius projection of cycle 29, reported as a
   diagnostic and not used to rewrite the gate of item 6:
       Π_T = m² I + κ Δ1_T + β Δ1_T² + R,   R ⊥ span{I, Δ1_T, Δ1_T²}.

8. y_even independence: at r = 0 the pairing amplitude is identically
   zero, so Ω_f and Π_T do not depend on y_even. This is the
   entire subcritical phase (any ye < y_c(T)).

A massless Maxwell photon exists on the subcritical branch only if
item 6 succeeds at the derived T = η vacuum: that means no London
piece (the geometric U(1) is unbroken at r = 0) together with a
unique positive Maxwell coefficient. A vanishing kernel (the T = 0
identity of item 1) is not a Maxwell photon; it is a flat
connection modulus, and 1/κ is undefined.

## Predeclared α_eff comparison (recorded before any number is computed)

R_α = 3/(64 φ) + 1/(79 φ²) is the comparison target named by the user.

    α_eff := 1 / κ_iso
    α_REM := 1 / κ_REM

These are compared to R_α only when the tests of item 6 all succeed
at the derived T = η vacuum. If they fail (flat, negative,
non-unique, not Maxwell-like, or not positive definite), 1/κ is not
an electromagnetic coupling and is not compared. No alternative
algebraic rewriting of Π_T (for example a ratio of traces, a
high-T coefficient of Tr(K^4), or 1/48) is promoted after the fact.

When a comparison is performed:

- relative error |α_eff − R_α| / R_α, and the same for α_REM;
- a numerical match is declared only if that error is below 10^{-4}
  (the threshold of cycles 05, 15, 25, 29 and alt 23 / 35);
- look-elsewhere ensemble, also predeclared, independent of the
  measured κ:
      S = {1,2,3,4,5,6,7,8,9,12,13,14,15,16,18,20,24,30,32,35,40,
           50,51,63,64,79,80,81,90,105,190}
      E = { n / (m φ^k) : n, m ∈ S, m ≠ 0, k ∈ {0,1,2} }
  Report (i) how many elements of E satisfy |x − R_α| / R_α < 10^{-4}
  and (ii) how many satisfy |x − α_eff| / |α_eff| < 10^{-4}. A match
  at 10^{-4} is a coincidence unless it is an identity.

## Hypotheses

H1. At T = 0 and r = 0, Ω_f is exactly flat in A and Π_T = 0.
    There is no preferred flux and no derived κ.
H2. At T = η and r = 0 the first A-dependent invariant is Tr(K^4),
    with Tr(K_π^4) > Tr(K_0^4). Combined with the high-T expansion
    of −T log(2 cosh(λ/2T)), this favours A = 0 over A = π. The
    derived T = η vacuum is therefore A = 0 (to be confirmed by
    the random-connection scan, which is allowed to falsify this).
H3. About that T = η vacuum the geometric U(1) is unbroken, the
    unpaired mode sits at E = 0 and drops out of the quadratic
    Hessian (its energy is O(A²), so its thermal free energy starts
    at O(A^4)), and Π_T is the vacuum polarisation of the gapped
    kinetic modes.
H4. Π_T at the derived T = η vacuum is not a unique positive
    Maxwell coefficient (higher-cycle operators compete with Δ1_T
    on a finite complex of girth 3), so α_eff is not compared to R_α.
    If item 6 unexpectedly succeeds, the predeclared comparison
    of the previous section is performed and this hypothesis is
    marked FALSIFIED.
H5. The subcritical branch has parameter-free spectral predictions
    (the two closed-form spectra of item 2, and the T = 0 flatness
    identity) and no parameter-free positive Maxwell κ or α_eff.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
hypotheses and the predeclared tests. No ARF target enters Ω or Π.
