# Prime-lattice URT arithmetic holonomy: coercivity without an imposed tax

Date: 2026-11-21. Scope: **only prime-lattice URT, not Cathedral**. Status: **THEOREM for a declared connection and canonical Dirichlet form; RH remains OPEN**. Working source `research_archive/2026-11-21_urt_prime_reciprocity/`, committed as `81cb6a8576cb744df48b65298b67a11669e2ce7a` (previous session). This report extends that construction; does not replace the original URT.

## Provenance and scope

The primitive URT has `a=pi/e`, `theta=2*pi/phi^2`, `phi=(1+sqrt(5))/2`; applying a common scalar phase independently in all prime directions is spectrally gauge-removable. The *declared* extension in the earlier checkpoint chooses a Legendre-character transport and history phase on `ell^2(N)`:

`V_p |n> = chi_p(n) exp(i theta sum_{q<p} v_q(n)) |pn>`.

`V_p` is an isometry. For `p<q`, `V_p V_q = c_{pq} V_q V_p`, `c_{pq}=eps(p,q) exp(-i theta)`, where `eps=-1` iff both primes are `3 mod 4` (and plus for prime 2 by a stated convention). These are **chosen lifts**, not a derivation of that choice from the original URT alone. The present calculation asks whether non-removable holonomy provides genuine mathematical stability, not whether a stable operator's spectrum is a Riemann-zero spectrum.

## Theorem 1 (uniform arithmetic magnetic Poincare inequality)

Let `V,W` be isometries on a complex Hilbert space, with `VW = c WV` for a fixed `|c|=1`, `c != 1`. Define

`Q(f) = ||(I-V)f||^2 + ||(I-W)f||^2`.

For every `f`, without a finite-volume cutoff,

`Q(f) >= |1-c|^2/8 ||f||^2`.

**Proof.** By the commutator law and isometry, `||(VW-WV)f|| = |1-c| ||f||`. Write `VW-WV=(V-I)(W-I)-(W-I)(V-I)`. Since `||I-V||, ||I-W|| <=2`, the triangle inequality yields `|1-c|||f|| <= 2( ||(W-I)f||+||(V-I)f|| ) <= 2 sqrt(2 Q(f))`. Square and rearrange. QED.

Apply to the prime pair in the preceding checkpoint. With `theta=2*pi/phi^2`,

`g_eps = |1-eps e^(-i theta)|^2/8 = (1-eps cos(theta))/4`.

This is strictly positive because the golden angle is an irrational multiple of `2*pi`; neither `e^(-i theta)` nor `-e^(-i theta)` can equal 1. Numerically,

- `eps=+1`: `g=0.434342219520...`.
- `eps=-1`: `g=0.065657780480...`.

The natural nonnegative operator `L=(I-V)^*(I-V)+(I-W)^*(I-W)` is bounded self-adjoint and satisfies `L>=g_eps I` on the **full infinite prime lattice**. Consequently the **declared dissipative dynamics** `f(t)=exp(-tL)f(0)` obeys `||f(t)||<=exp(-g_eps t)||f(0)||`. These dynamics are a standard choice associated to the Dirichlet form, **not** forced by primitive URT and **not** a proof of RH. The full prime transfers `U_p=(pi/e)V_p` are expansive; do not confuse them with this heat semigroup.

## Theorem 2 (comparison with untwisted shifts)

If `V=S_p`, `W=S_q` are ordinary commuting unilateral prime shifts, the corresponding form has **no uniform positive gap**. Let `f_L` be the unit vector with equal amplitudes on the `(L+1)^2` states `{p^i q^j:0<=i,j<=L}`. Then `Q(f_L)=4/(L+1) -> 0`. Hence the positive lower bound in Theorem 1 truly comes from the nontrivial loop phase of the explicitly constructed interaction, not merely the Hilbert-space choice.

## Theorem 3 (arithmetic boundary topology is unchanged)

For every prime p, the twist is multiplication by a unit modulus phase before the ordinary shift: `V_p=S_p M_p`. Consequently `V_p V_p^* = S_p S_p^*`, precisely the projection onto the subspace of integers divisible by p. Therefore for every finite set `F` of primes,

`prod_{p in F}(I-V_p V_p^*) = sum_{d | prod_{p in F}p} mu(d) S_d S_d^*`.

Thus **the Möbius sieve boundary algebra remains exactly the same** even though the magnetic hopping spectrum changes. Distinct observables carry distinct information; no RH constraint can be inferred from the existence of a magnetic gap alone.

## Executed finite independent checks

Run from the root: `python research_archive/2026-11-21_urt_prime_magnetic_gap/urt_prime_magnetic_gap_2026_11_21.py` (numpy/scipy), equivalent to `python /mnt/data/urt_prime_magnetic_gap_2026_11_21.py` locally. The checker compares finite 2D quadrant compressions to the rigorous bound and to the untwisted analytic eigenvalue, then checks five projection identities through `n<=120`.

```
theta radians: 2.399963229728653
strict gap bound eps=+1 0.434342219520
strict gap bound eps=-1 0.065657780480
quadrant  5x 5: flux+ 1.5884351111, flux- 0.7776280929, untwisted 0.5358983849
quadrant  9x 9: flux+ 1.4596736720, flux- 0.6753241272, untwisted 0.1957739348
quadrant 15x15: flux+ 1.4213187183, flux- 0.6745181576, untwisted 0.0768588784
quadrant 25x25: flux+ 1.4083708179, flux- 0.6743084663, untwisted 0.0291645036
PASS: 5 finite prime-divisibility projector identities; Möbius algebra unchanged
PASS: uniform nonzero magnetic gap lower bound; certificate is finite only
RH NOT PROVED: no zeta determinant or Weil form identity
```

The **infinite** inequality is proved by Hilbert-space algebra above; the finite computations are checks, not replacements for the proof. Finite square Dirichlet conditions mean the numerical gaps can be much larger than the universal bound.

## RH limitation and precise remaining step

1. The self-adjoint positive `L` is not the completed-zeta Hilbert-Pólya operator. Its spectral gap is a genuine stability theorem but does **not** constrain the locations of zeros of `xi(s)`.
2. The diagonal Hamiltonian `A|n>=(log n)|n>` has `Tr exp(-s A)=zeta(s)` for `Re s>1`, **independently of the twisted transfer**. The constructed magnetic Dirichlet energy has not been identified with the entire completed-zeta determinant, and adding it to `A` changes that partition function.
3. The quadratic reciprocity rule and ordered history phase are separately motivated but are **not uniquely fixed by original URT**; no first-principles arithmetic selection theorem is asserted.
4. The Weil explicit formula includes a prime-power term, poles, and an archimedean Gamma factor. The present `L` lacks an identity with that **specific signed functional**. Generic positivity of `L` is not Weil positivity.
5. **Next exact task:** compare an explicitly written test function `f`'s `Q_L(f)` with the properly normalised Weil prime-power/archimedean explicit-formula functional, and prove an exact identity or exhibit the first nonzero difference. Do not identify two forms just because both are called positivity.

References: Weil positivity criterion (Lagarias survey, https://www.math.lsa.umich.edu/~lagarias/doc/mt-holyoke-rev.pdf); magnetic graph laplacians and flux (https://www.sciencedirect.com/science/article/pii/S0024379523002914). No outside paper is claimed to establish the new RH implication.

RESUME HERE: Theorems 1–3 proved for declared prime connection; finite checker passed locally, no classical RH positivity identity. Investigate explicit formula, especially archimedean and prime-power terms, before claiming RH progress.