# Exact URT selection test with a strict golden coupling cap

Date: 10 November 2026. Original all-five-solid geometry and URT golden recurrence. No experimental observables, historical four-ARF coefficients, or fitted constants used. Executable test: `URT_STRICT_GOLDEN_CAP_AND_INVARIANT_MEASURE_2026_11_10.py`.

## Result 1: primitive URT has more than one invariant phase measure

At the radial fixed circle `r*=9/13`, the original complex URT map is `theta' = 2theta + omega (mod 2pi)` with `omega=2pi/phi^2`. Under `x=(theta+omega)/(2pi) (mod1)`, this is the doubling map `x'=2x(mod1)`.

The Haar/Lebesgue measure is invariant (and is the unique absolutely continuous invariant probability). This supplies uniformly weighted six-bit histories *for Haar-typical initial conditions*. However the Dirac measure at `x=0`, equivalently the exact fixed orbit `theta=-omega (mod2pi)`, is also invariant. There are also numerous other periodic-orbit invariant measures. Thus **the bare deterministic recursion does not select Haar history statistics for every initial condition**. A physical typicality/equilibrium/selection axiom is mathematically substantive.

## Result 2: even a strict golden coupling cap does not select the photon stiffness

Take the original five Platonic graph incidence complexes with 50 vertices, 90 edges and 50 faces. Every incidence pair obeys `b1 b2=0`. Compact unit-charge Wilson link variables `A` have gauge-invariant face flux `b2^T A` and a local positive plaquette action `S_κ(A)=κ Σ_f[1−cos((b2^T A)_f)]`. Its quadratic Hessian on the 90 links is `κ ⊕_s (b2_s b2_s^T)`, with exactly 45 strictly positive eigenvalues and 45 gauge zero modes.

To strengthen the test, *impose an extra cap as strong as* `0<κ≤φ^-2`; the original URT does not itself identify this particular cap with gauge stiffness. Two different entirely unfitted rules satisfy it:

- `κ_A=φ^-2=0.38196601125010515...`
- `κ_B=φ^-4=0.14589803375031546...`

Both are exact functions of the already supplied `φ`, positive, gauge invariant, O(V+E+F) local and under the cap. Nevertheless **each nonzero transverse stiffness differs by the exact ratio** `κ_A/κ_B=φ²≈2.61803398875`. Since the unit Wilson charge is held fixed, this cannot be erased as a field-coordinate change without altering charge normalization.

Consequently the statement "URT O(N) recursion, positive coupling capacity and all-five geometry mathematically force the electromagnetic ARF" does **not** follow from the stated properties alone. Additional fixed microscopic gauge/charged-matter source dynamics could select one response, and this theorem does not rule that out. The other three ARFs also require their own typed physical source dictionary; correct group ranks are not substitutes for source residues.

## Verification

The script loads the **unmodified** 7 November five-solid source, uses its original `b1,b2`, proves the URT fixed orbit, checks the complete exact ranks and golden cap, and passes all assertions. No third-party Yang–Mills work is included.

**Scientific state: complete finite counterexample to the weak 'inevitability from O(N) alone' assertion; the stronger full first-principles four-ARF derivation remains open.**
