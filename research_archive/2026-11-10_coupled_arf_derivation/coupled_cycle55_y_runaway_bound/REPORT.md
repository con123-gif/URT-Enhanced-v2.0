# Coupled cycle 55 — does any derived term already in the
# coupled machine bound the y-runaway?

Classification: **PROVED** (H1, H2, H3). No term already derived
in the coupled machine bounds the cycle-52 runaway of ω(y) to
large y_even. No new Maxwell term and no new tree |D_A Δ|² were
introduced. No coframe was invented and the cycle-47 spread was
not hunted. y_even remains free. Advances a physical ARF? No.

The `newtons-cathedral` tip remains read-only at `6bad7b3`.
No new y-sample was introduced; large-vev remainders are read
from the existing cycle-52 supercritical points {0.1, 1.0, 2.0}.
Historical ARFs were not used.

## B1. The existing functional does not bound y

The cycle-52 free energy
Ω = V_hist + Ω_f(K[A], Δ(y,r), T=η),
minimised over r and A ∈ {0, π}, has leading large-vev form
−N² y²/(16 c_even) with N = 4.640379972803843 and
c_even = 1.3555131567782033×10^{-6}, so the prefactor is
N²/(16 c_even) = 992849.3770202099. Remainders
Ω − (−N² y²/(16 c_even)) on the existing sample are

- y = 0.1, A = π: Ω = −9876.742, remainder +51.752
- y = 1.0, A = π: Ω = −992709.969, remainder +139.408
  (relative 1.404×10^{-4})
- y = 2.0, A = π: Ω = −3971199.010, remainder +198.498
  (relative 5.00×10^{-5})

The remainder is positive and slowly growing, but it does not
grow as +y² and does not turn ω upward: ω itself is strictly
monotone decreasing on that sample (cycle 52). A bound would
have required a remainder at least of order +N² y²/(16 c_even).
The leading term remains −y².

## B2. Tree Maxwell and tree |D_A Δ|² are absent

The archived one-loop action has no tree-level |D_A Δ|² and no
tree Maxwell term (cycles 28–29; SYNTHESIS obstruction 4).
Introducing either is excluded by the predeclaration and would
be a new postulate, not a derived bound.

## B3–B8. No other derived potential or compact domain

- B3. Cycles 17 and 22 already found that Z_hist is independent
  of y, that unit-norm history matching is incompatible with
  condensation, that ρ★ is independent of y, and that the
  charge-2 Ward identity is homogeneous in y. Those tests do
  not supply a potential that bounds a variational runaway,
  and they do not fix y > y_c.
- B4. T0 poles z1 ≈ 1.015458, z2 ≈ 1.063249 are independent of
  y (cycles 13, 52). A demand that a pole lie in a fixed disk,
  or that a photon be massless, is not a derived bound and was
  not used. The cycle-13 Dirac bubble chain is not a derived
  pairing potential (cycle 18).
- B5. Induced Π_T is a quadratic form on A. At large vev it is
  a London mass 1/12, independent of further increase of y
  once the system is condensed, and is not a potential for y.
- B6. The 12-site graph does not cap the pairing amplitude:
  BdG energies remain real and grow with s = y r, so Ω_f
  becomes more negative as y grows (already visible in B1).
- B7. The hidden stiffness is already inside V_hist. y_odd = 0
  is the derived O(1) choice; it does not add a +y_even⁴ term.
- B8. Z_hist, ρ★ and the history complex are y-independent.
  No new clock–Yukawa coupling was invented.

## Obstruction

No derived term already in the coupled machine bounds the
y-runaway. The obstruction is the conjunction of (i) the
existing Nambu-plus-gauge functional’s leading −y² behaviour,
with a remainder that does not turn ω upward, and (ii) the
absence, in the archived coupled action, of any further
derived potential or compact domain for y (in particular, no
tree Maxwell term and no tree |D_A Δ|²). Minimising Ω with
respect to y remains an extra postulate, and even if granted
it has no finite minimiser. y_even remains free. No ARF was
compared.

Predeclaration sha256
`206b7742081ffa65ef005a17c8fbbe1a2b04e15925f51a9dc9142230e25e2b5e`.
