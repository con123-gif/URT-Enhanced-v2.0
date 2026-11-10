# Coupled cycle 17 predeclaration — clock periodicity / modular invariance of Z

Principle: form the 24-clock partition function over the 64 histories
at the KMS parameter η = −ln Δ, and ask whether clock-periodicity or
modular invariance of Z constrains r = y_even / y_odd.

Definitions, declared before numerical evaluation:

    Z_hist(β) := Tr exp(−β Hbits)
        Hbits = Laplacian of the Hamming-distance-2 graph on (ℤ₂)⁶
        (64 vertices, degree C(6,2) = 15). Cycle 08 records that
        ker Hbits is two-dimensional (even- and odd-weight indicators).

    Z_clock(β) := Tr exp(−β H_clock)
        H_clock = (π/e)² L2, L2 the gold-phased 24-clock Laplacian
        with eigenvalues λ_k = 4 sin²(π k/24 − 2π/φ²), k = 0,…,23,
        the same convention whose k = 18 entry is the cycle-14
        λ_18 = 4 sin²(π(9−4√5)/4).

    Modular parameter: τ so that the physical KMS state is
        τ_* = i η / (2π),    Z(τ) := Tr exp(2π i τ H).
        Then Z(τ_*) = Tr e^{−η H}.
    T-invariance: Z(τ+1) = Z(τ) iff every eigenvalue of H is an
        integer (because e^{2π i E} = 1).
    S-invariance: Z(−1/τ) = Z(τ), or the free-boson automorphy
        Z(−1/τ) = (τ/i)^{n/2} Z(τ) with n = 64 (histories) or
        n = 24 (clock). Evaluated at τ_* and reported as ratios.

    Coupled hidden Gaussian, from the cycle-13 one-loop potential
    (the unique derived r-dependent partition function at the
    V_hist origin, where fermion Yukawa masses vanish):
        μ3 = H3 + y_o² π_o,   μ5 = H5 + y_e² π_e
        Z_hid(β; y_o, y_e) = [2π/(β μ3)]² [2π/(β μ5)]²
        with H3, H5, π_o, π_e the cycle-13 values, used as named
        inputs and not refitted.
    Clock-periodicity of Z_hid means Z_hid(β+24) = Z_hid(β).
    Its modular ratio Z_hid(β)/Z_hid(1/β) will be computed; any
    residual r-dependence of that ratio is the only way this
    principle can constrain r.

Will check:

M1. Build Hbits (64×64) and confirm the closed spectrum
    0 (×2), 10 (×12), 16 (×30), 18 (×20), hence
    Z_hist(β) = 2 + 12 e^{−10β} + 30 e^{−16β} + 20 e^{−18β}.
    Integer spectrum implies T-invariance of Z_hist. Evaluate
    S-invariance at τ_*.

M2. Confirm λ_18 of the gold clock matches cycle 14 / E2.
    Record whether the 24 clock energies are integers (T) and
    evaluate S at τ_*.

M3. Free Z_hist and Z_clock do not depend on r, so their modular
    or periodicity properties cannot select r.

M4. For Z_hid: clock-periodicity Z_hid(β+24)=Z_hid(β) holds for
    no positive β (it is a pure power of 1/β). The ratio
    Z_hid(β)/Z_hid(1/β) equals β^{−8} and is independent of
    (μ3, μ5), hence independent of r. S-invariance would require
    β = 1; the physical η = −ln Δ is not 1. No condition on r
    appears.

Look-elsewhere: 24 is both the clock length and the weight of the
discriminant modular form η(τ)^{24}. The cycle will record that
Z_clock is a finite sum of 24 exponentials of gold-phased sines
and is not the Ramanujan discriminant (no coefficient matching is
attempted; the observation is only that the shared integer 24 does
not identify the two objects).

Classification: PROVED for the spectra and the r-independence
statements. The claim “modular invariance or clock-periodicity
selects r” will be marked PROVED or FALSIFIED by M3–M4.
No ARF target is inserted.
