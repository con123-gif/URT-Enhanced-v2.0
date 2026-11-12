# Newton's Cathedral — Native clock-rate obstruction and golden-flux quadrature

**Date:** 2026-11-12. **Status:** an exact theorem for the *existing Gaussian H64×24 history block*; executed numerical conditional source-clock readout; **no physical Lorentz/proper-time claim**.

## Provenance and scope

Continuation of the 12 November `research_archive/2026-11-12_native_emergent_time/RESULT.md`. The original native November 7 all-five 190-cochain/H64/24 action and November 9 six-bit source/clock dictionary remain unchanged. The full Cathedral keeps all five Platonic solids, the 50→8→12 source interface, hidden 4₃⊕4₅, D6→H3 phase, 64 histories, 24 clock tracks, and Golay/Leech sector. The present calculation focuses on the **original Gaussian history block** and a **conditional source-readout**, not the full nonlinear action or 192-state charged Wilson matter.

## Theorem 1: no velocity-dependent internal clock rate from the existing additive Gaussian block

Let `Hbits` be the original 64×64 symmetric history generator, `Uh` the native hidden partial isometry, with

`Hbits Uh P3 = 18 Uh P3`, `Hbits Uh P5 = 16 Uh P5`.

Let `L24^(2)(θ)=2I - exp(2iθ)S - exp(-2iθ)S†` be the original charge-two Wilson clock Laplacian on the 24-cycle, `r=π/e`, `θ=2π/φ²`, and `G=Hbits⊗I24 + r² I64⊗L24^(2)` on the original positive Gaussian sector. For every Fourier track `m`, the two energies are

`E3(m)=18+r²ℓ_m`, `E5(m)=16+r²ℓ_m`, `ℓ_m=2−2cos(2θ−2πm/24)`.

**Exact consequence:** `E3(m)−E5(m)=2` at *every* one of the 24 modes. A coherent hidden 3↔5 superposition evolves in the additive unitary model with the same internal beat frequency 2 for every m. Thus this specific native Gaussian tensor-sum generator does **not** supply a kinetic-excitation-dependent clock slowdown. Calling m a physical velocity would be unjustified. This is not a no-go for interactions, a non-additive effective generator, or the separately constructed relativistic field embedding.

The original Schur source response **is** mode-dependent: `G5(m)/G3(m)=(18+r²ℓ_m)/(16+r²ℓ_m)` ranges from `1.0937532486830157` to `1.124920139139535`. These are response ratios, not time-dilation factors.

## Theorem 2: native history-bin readout cannot determine the phase direction

For the existing conditional Haar history/clock dictionary `B∈R^(24×64)` and all-five 64-history hidden-source isometry `H∈R^(64×20)`, define `A0=BH`, `T=A0ᵀ A0`. Take the previously computed real principal singular vectors `u∈im P3`, `v∈im P5`, selected from `P3 T P5`, and `ψ(t)=(u+exp(2it)v)/√2`.

Each of the **24 track outcomes** `p_j(t)=|(A0 ψ(t))_j|²` has the exact form `a_j+b_j cos(2t)` with real `a_j,b_j`. Add the positive null outcome `E_null=I−T` to obtain a 25-outcome measurement on the hidden carrier. Every probability then satisfies `p_j(t)=p_j(−t)`; the forward/backwards ambiguity survives even with all 24 track readouts, not only with the earlier 2-outcome coarse graining.

For this specified coherent state and measurement, the **classical Fisher information** maximized over t is `0.3264301477404643` for the binary outcome, and `0.7303592989515282` for the 24-track-plus-null readout. The **quantum Fisher information** is exactly `4` in the chosen t normalization, giving phase-information fractions `8.1607536935%` and `18.2589824738%`. Resolving the tracks recovers a factor `~2.24` more information but cannot determine time direction from the real dictionary alone. These values are conditional; no laboratory readout or physical time unit is inferred.

## Theorem 3: golden Wilson flux supplies an odd phase quadrature in a *conditional* dressed instrument

Use the original hidden-sector Schur inverses at the original charge-two Wilson clock:

`G3 = (18I24 + r² L24^(2)(θ))⁻¹`, `G5=(16I24 + r² L24^(2)(θ))⁻¹`.

Define, without introducing fitted constants, the *candidate* charged source-to-clock amplitude

`Aflux = G3 B H P3 + Δ G5 B H P5`.

This is a conditional composition of two **already defined** mappings; it is **not** claimed to be a current, POVM, or preparation derived from the original nonlinear/v61 matter action. It is a contraction (`||Aflux||op≈0.03327`) and can define a mathematical 25-outcome positive instrument with null `I−Aflux†Aflux`. With `z3=Aflux u`, `z5=Aflux v`, its per-track readout satisfies

`p_j(t)−p_j(−t)=−2 Im(conj(z3_j) z5_j) sin(2t)`.

**Executed native-source values:** `||Im(conj(z3)⊙z5)||₂ = 4.349486435260279e−8`, signed sum `−1.2552328569073273e−8`. This odd quadrature is *exactly zero* at zero Wilson flux (both resolvents real), and it flips under `θ→−θ` by complex conjugation. The values use the original frozen Δ; no artificial phase shift was supplied to generate the sine channel.

Under the large gauge shift `θ→θ+2π/(2·24)` and the **simultaneous charged source-frame rotation** `B→D B` with `D_jj=exp(2ij·2π/(2·24))`, the dressed amplitude transforms as `Aflux→D Aflux`, so every track probability is unchanged. This certifies *formal covariance* of the proposed charged embedding, **not** that the original Haar dictionary has already been physically made gauge-covariant or that an experimental observable is selected.

**Caution:** The odd signal is very small, and its sign requires a reference convention. This is a limited phase-orientation construction, not an arrow-of-time theorem. The positive/negative time hypotheses are still globally periodic, and the 24-fibre cannot supply absolute seconds or a global monotonically increasing physical clock by itself.

## Connection to relativistic time dilation: the necessary missing term

For a composite relativistic system with rest energy `mc²+ε`, one would require

`E(p,ε)=sqrt((mc²+ε)²+p²c²)`.

At fixed momentum, `dE/dε=(mc²+ε)/E=1/γ`, which yields the familiar internal-clock slowdown. In the weak-velocity expansion,

`E≈mc²+ε+p²/(2m)−p² ε/(2m² c²)+…`.

The **negative internal/external cross term** is necessary; it is absent from the native additive history/clock Gaussian block. This relativistic square-root law is presented only as a *benchmark of what must be derived*, **not** inserted as an assumed Cathedral Hamiltonian. The full interacting native action may generate cross-sector terms but they have not been shown to produce this coefficient or Lorentz covariance.

## Execution, limitations, RESUME HERE

Local executable: `OPENBLAS_NUM_THREADS=1 python NATIVE_CLOCK_RATE_AND_FLUX_QUADRATURE_VERIFY.py --reconstruction /mnt/data/cathedral_native_clock_certificate.py` (exit 0). CI mode loads the original named all-five Nov 7 and Nov 9 sources. All checks fail on violation; no synthetic matrices or fitted experimental constants. The 24-track interval, source-Schur ratio, Fisher optima, zero-flux odd-channel disappearance, flux reversal, and large-gauge covariance were checked numerically.

**Next executable task:** derive the conditional `B` charged source-frame assignment directly from the native nonlinear 190/64/24 action and its Ward contacts, or provide a native counterexample; only then investigate which non-additive effective kinetic/internal term is produced. The separate v61 charged matter map and a dimensional time calibration remain open. No physical ARF gate is closed.