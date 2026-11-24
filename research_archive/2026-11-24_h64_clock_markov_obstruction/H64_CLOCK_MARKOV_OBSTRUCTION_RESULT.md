# H64 history is Markov; the golden charge-two clock is not

## Status and scope

**THEOREM plus scoped thermodynamic obstruction — CLOSED INTERNALLY / PHYSICAL
IDENTIFICATION PENDING.**

This certificate uses the original six-bit `Hbits`, the original golden
24-clock phase, the original charge-two covariant Laplacian, and the declared
H64 relaxation. It introduces no transition rates, fitted constants, scalar
metric, stochastic completion, or replacement matrix.

## Positive result: a genuine native probability H-theorem

The original history operator is exactly

\[
H_{64}=\sum_{1\le i<j\le6}(I-X_iX_j).
\]

Therefore `-H64` is a continuous-time Markov generator: each of the 15
pair-flips has unit rate, off-diagonal rates are nonnegative, and every row and
column sums to zero. Bit parity divides the 64 histories into two irreducible
32-state components. Each component has the uniform reversible stationary law
and spectral gap 10; the full spectrum is

\[
0^{\times2},\quad10^{\times12},\quad16^{\times30},\quad18^{\times20}.
\]

For any positive distribution `p` in one component, its relative entropy to
the component-uniform law obeys

\[
\frac{d}{dt}D(p_t\|u)
=-\frac12\sum_{i,j}q_{ij}(p_i-p_j)(\log p_i-\log p_j)\le0.
\]

A deterministic 32-state witness falls from `D=0.17854515666291654` at `t=0`
to `3.2270141894746835e-10` at `t=1`, while preserving positivity and total
probability. This is a real finite-history H-theorem.

## Obstruction: the full H64/24 relaxation is an amplitude semigroup

The charge-two clock link is `u=exp(2 i theta)` with
`theta=2 pi/phi^2`. Its gauge-invariant 24-cycle holonomy is

\[
u^{24}=\exp(2\pi i\,48/\phi^2).
\]

It cannot equal one: `phi^2` is irrational, so `48/phi^2` cannot be an
integer. Numerically the holonomy is

`-0.5056223551374929 + 0.8627549095688846 i`, at distance
`1.7352938397501978` from one. A diagonal gauge can redistribute the edge
phases but cannot change this product. Consequently it cannot turn every
off-diagonal clock rate into a nonnegative real number.

The direct native clock evolution of a basis delta at `t=0.1` confirms the
obstruction:

- imaginary norm: `0.1453588213772218`;
- minimum real component: `-0.006764946647180479`;
- component sum: `0.7836552139234408`, not one.

Tensoring this column with the valid H64 Markov column does not repair it. The
full `Hbits + r^2 L24^(2)` semigroup is a positive-energy contraction on
complex covariant amplitudes, but it is not a stochastic evolution of 1536
probabilities.

## Physical conclusion

The native construction contains two distinct facts:

1. `Hbits` alone supplies genuine history mixing and entropy increase toward
   parity-uniform equilibrium.
2. The full golden H64/24 relaxation supplies the quadratic energy Lyapunov
   law proved in the preceding certificate, but not probability or KMS
   entropy production.

The eight-state KMS occupation probabilities depend on the geometric source
`z`; they are not the stationary law of the 64-history pair-flip chain, and no
native probability-preserving charge-two clock generator has been declared.
Thus neither H64 theorem may be promoted to a horizon temperature, area
entropy, redshift, or Lorentzian spin-2 law.

## Next decisive test

Audit the original hidden transfer `T=P3+Delta^2 P5` and its positive square
root `B=P3+Delta P5` for a **declared** trace-preserving quantum or classical
channel. If the archive supplies such a normalization dynamically, test KMS
relative-entropy contractivity. If it supplies only a positive amplitude
operator, record that as the remaining thermodynamic obstruction rather than
applying an invented reset/Doob normalization.
