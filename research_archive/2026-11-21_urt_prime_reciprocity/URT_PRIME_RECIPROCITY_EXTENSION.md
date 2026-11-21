# Prime-Lattice URT: a non-gaugeable arithmetic feedback extension

Date: 2026-11-21  
Status: **THEOREM for the declared finite/infinite operator; selected URT physics and RH mapping OPEN**.  
Scope: prime-lattice research branch only; **no Cathedral geometry**, no physical ARF, no claimed proof of RH.

## Provenance and limitation

The original URT scale/phase data are `a = pi/e > 1` and `theta = 2*pi/phi^2`. The earlier prime-lattice operator audit established that a uniform prime phase is removed by diagonal unitary conjugation, leaving spectral invariants unchanged. It also established the intrinsic prime-multiplication shifts, the Möbius sieve boundary algebra, and natural Hilbert-space summability thresholds. Current main project `AGENTS.md`, `docs/CONTINUITY_PROTOCOL.md`, `docs/RESEARCH_STATE.md` and `research_archive/cathedral_arf_runner/RESEARCH_LOG.md` were inspected. No RH/prime-lattice entry was located in the current `RESEARCH_STATE.md` and `RESEARCH_LOG.md` scans, though the current conversation contains relevant prior work.

This extension solves **one precisely scoped missing ingredient:** a concrete, arithmetic, state-dependent cross-prime feedback that has nontrivial gauge-invariant holonomy and demonstrably changes a finite spectral characteristic polynomial. It does **not** derive this particular lift uniquely from the two primitive URT constants, prove the Weil positivity criterion, recover the completed Riemann zeta function as a determinant, or solve RH.

## Exact construction (no fitted constants)

Let `P` be the primes and `N = product_{p} p^{e_p}`, with only finitely many `e_p` nonzero. Work in `H = ell^2(N_{>=1})` with orthonormal basis `|N>`. Set

- `a = pi/e` and `theta = 2*pi/phi^2`, `phi=(1+sqrt(5))/2`;
- `m_p(N)=sum_{q<p} e_q(N)`;
- for distinct odd primes `p,q`, `chi_p(q)=(p/q)` (Legendre symbol);
- for a pair involving 2, `chi_p(q)=1`. This last rule is an explicit extension convention, not a quadratic-reciprocity theorem for 2.
- `chi_p(N)=product_{q != p} chi_p(q)^{e_q(N)}`.

Define the normalized prime transport by

```
V_p |N> = chi_p(N) exp(i theta m_p(N)) |pN>
U_p = a V_p.
```

Each `V_p` is an isometry because it sends distinct basis states to distinct basis states and its coefficient has absolute value one. Thus `V_p^* V_p=I`; `U_p^*U_p=a^2 I` and `||U_p^k |N>||=a^k`. **This mechanism by itself is expansive, not a proof of dynamical boundedness.**

The `m_p` term is a **new ordered-history URT ansatz**, encoding a phase when a new higher prime direction is traversed after an occupied lower prime direction. The `chi_p` term is the unique nontrivial quadratic multiplicative character at each odd prime. The use of nontrivial characters and the ordered-history term **are selections**, not conclusions of the primitive URT recursion. They should not be called zero-assumption URT laws.

## Theorem 1: exact arithmetic plaquette holonomy

For `p<q` distinct primes, the operators satisfy

```
U_p U_q = eps(p,q) exp(-i theta) U_q U_p,
```

where `eps(p,q)=(-1)^(((p-1)/2)((q-1)/2))` for odd primes (thus `eps=-1` exactly when `p=q=3 mod 4`), and `eps(2,q)=1` by convention. To prove this, apply both products to `|N>`: the golden-history exponent differs by one, and the character quotient is `chi_p(q)/chi_q(p)=eps(p,q)` by quadratic reciprocity. This holds on **all** lattice basis states.

The scalar is a gauge-invariant discrete Wilson-loop phase: a diagonal unitary change of basis changes path amplitudes but not their ratio. Since `theta/(2*pi)=phi^{-2}` is irrational, this phase is nontrivial for every distinct pair. A uniform phase `a*exp(i theta)*S_p` instead gives ratio 1, so it cannot produce this result.

This is a valid nontrivial arithmetic **connection** on the lattice. It is not a representation of the *commutative* multiplicative semigroup: the endpoints `pqN` coincide while parallel transport depends on the prime ordering. Consequently, a standard Euler product or zeta determinant cannot be inferred from these operators.

## Theorem 2: the flux changes the exact four-site spectrum

Restrict the normalized symmetric hopping `H_{pq}=V_p+V_p^*+V_q+V_q^*` to the four occupancy states `|1>,|p>,|q>,|pq>` (with the finite compression). Let `E` be the spectral variable and `z=exp(i theta)`.

The characteristic polynomial is exactly

```
det(E I - H_{pq}) = E^4 - 4 E^2 + 2 - eps(p,q) (z+z^{-1})
                   = E^4 - 4 E^2 + 2 - 2 eps(p,q) cos(theta).
```

It has eigenvalues `±sqrt(2 + sqrt(2+2 eps cos theta))` and `±sqrt(2 - sqrt(2+2 eps cos theta))`. For the unphased commuting square, the polynomial is `E^4-4E^2` and eigenvalues are `{2,0,0,-2}`. **The new interaction demonstrably changes the finite spectrum without fitting.** For transfer amplitude `a` rather than 1, replace `E^4-4E^2+...` by `E^4-4a^2 E^2+a^4(2-2eps cos theta)`.

The exact Legendre pairing distinguishes `(3,5)` with `eps=+1` from `(3,7)` with `eps=-1`. The resulting positive absolute spectral levels (normalized `H`) are respectively `(1.650681610778, 1.129269772835)` and `(1.965722474722, 0.368693846400)`.

## Reproducible audit

Run `python urt_prime_reciprocity_coupling.py`. It is standard-library only and fails on any assertion. Executed locally 2026-11-21:

```
EXACT ARITHMETIC CHECK PASS: 15 prime pairs x 729 states = 10935 plaquettes
EXACT LAURENT DETERMINANTS PASS: 6 four-site spectra
GOLDEN THETA 2.399963229729 a=pi/e 1.155727349791
```

The first check exhaustively evaluates all `3^6=729` exponent configurations for the first six primes and all 15 pairs, with exact integer Legendre checks and numerical evaluation of the universal golden phase. The second check calculates the Laurent polynomial determinants by integer-coefficient Leibniz expansion, **exactly** in the formal variable `z` (and its inverse). The analytic proofs extend beyond the finite certificate.

## RH gate (open)

1. The diagonal arithmetic Hamiltonian `A|N>=log(N)|N>` has a zeta partition function for `Re(s)>1`, but that is **not** the Fredholm determinant of the twisted transport operator, nor the completed `xi` function.
2. Self-adjointness of a finite compressed hopping operator does not identify its eigenvalues with Riemann-zero ordinates.
3. A nontrivial plaquette holonomy does not imply positive Weil quadratic form or exclude off-critical-line zeros.
4. The phase `theta` and algebraic character rule are built into the declared model; no original URT theorem singles out this particular prime-dependent ansatz.
5. The norm of the unnormalized transfers grows like `(pi/e)^k`; a true Lytollis-style *bound* is still missing, as is a proof that it is intrinsic to the same arithmetic dynamics.

**Precise next calculation**: derive the correct arithmetic explicit-formula quadratic form on compactly supported test functions, then test whether the declared prime connection induces that exact form (including prime powers, archimedean Gamma factor, and all signs) rather than a generic positive operator. If it fails, record which terms are missing. An identity `det(1-K_s) ∝ xi(s)` or unconditional Weil positivity must not be asserted before being proved.

## References

- Quadratic reciprocity: https://dlmf.nist.gov/27.9 ; https://www.math.gordon.edu/ntic/ntic2023/section-quadratic-reciprocity.html
- Weil positivity / explicit formula context: https://www.bdim.eu/item?fmt=pdf&id=RLIN_2000_9_11_3_183_0
- Internal continuity: `AGENTS.md`, `docs/CONTINUITY_PROTOCOL.md`, `docs/RESEARCH_STATE.md` and prime-lattice RH notes previously generated in this conversation (not assumed already committed).