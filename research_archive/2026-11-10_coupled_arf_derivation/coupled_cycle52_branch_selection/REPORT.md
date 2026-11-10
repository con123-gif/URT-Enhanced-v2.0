# Coupled cycle 52 — does any derived principle select the
# y_even branch?

Classification: **PROVED** (the selection question). No derived
principle tested here — free-energy minimisation over the full
coupled machine at T = η including the gauge sector, stability
of the origin, or the pole structure of
R(z) = (I − z T_coupled)^{-1} — selects the subcritical or the
supercritical branch of y_even, or a unique finite y, without
an extra postulate on y_even and without wanting a Maxwell
photon. Advances a physical ARF? No.

The `newtons-cathedral` tip remains read-only at `6bad7b3`.
Historical ARFs, R_α, 1/137.036 and any comparison of either
branch’s kernel to a Maxwell κ were not used. The frozen
y-sample was not adjusted after seeing Ω.

A refinement of the near-threshold vacuum, not used to select a
branch, is recorded below: the cycle-32 assignment A ≡ π for
every y > y_c(η) fails at the first supercritical sample point.

## Functional and sample (as predeclared)

Arena: 12-vertex icosahedron, 30-edge gauge field (cycles 25–32).
V_hist = c_even ||h5||², Δ = y_even M(h5), y_odd = 0, T = η,
c_even = 1.3555131567782033×10^{-6}, nuclear norm
N = 4.640379972803843, y_c(η) = 0.005940144040707988 (ico).
Ω is referred to the unpaired spectrum of K[A=0], so
Ω(y=0, r=0, A=0) = 0 and Ω(y=0, r=0, A=π) = 0.08773582709207517
(cycle 32 identity, reproduced). Both A = 0 and A = π were
minimised in r at every sample point; ω(y) is the actual minimum
over that pair. Frozen sample:

Y = {0, ½ y_c, 0.99 y_c, 1.01 y_c, 0.01, 0.1, 1.0, 2.0}.

## P1. Free-energy minimisation over y

Cycle 22 treats y_even as a Yukawa, not as a dynamical field.
Minimising Ω with respect to y is therefore an extra postulate.
Even if that postulate is granted, the sample has no interior
minimum:

- On every subcritical point, ω(y) = 0 at numerical
  10^{-14} (r is a scan artefact ≲ 10^{-5}, not a condensate).
- On the supercritical sample, ω is strictly monotone decreasing,
  from ω(1.01 y_c) = −0.018750 (A = 0, r = 1177.31) through
  ω(0.01) = −50.11995 (A = π, r = 8391.67),
  ω(0.1) = −9876.742,
  ω(1) = −992709.969 (relative error 1.404×10^{-4} to the
  large-vev formula −N² y²/(16 c_even)), to
  ω(2) = −3971199.010 (relative error 5.00×10^{-5}).
- The unique sample minimiser is the right endpoint y = 2. This
  is a runaway to large y, not a derived finite Yukawa.

P1 does not select a unique finite y and does not, by itself,
select a branch independently of a choice of y.

## Near-threshold vacuum (not a branch selector)

The predeclared dichotomy assignment (A = 0, r = 0 for y < y_c;
A = π, r = r_*(y) for y > y_c) holds on every sample point
except y = 1.01 y_c. There the actual minimum is A = 0,
r = 1177.31, ω = −0.018750, while A = π gives ω = +0.007708
(the unpaired π-flux cost 0.0877 is not yet repaid by the
small pairing gain). At y = 0.01 and beyond, A = π is preferred,
by a margin of order one against a large negative pairing
energy. Thus there is a window y_c < y < y_π with
y_π ∈ (0.0059995, 0.01) in which a small even condensate
forms on the unbroken A = 0 background. Locating y_π is not
needed for the selection question and was not added to Y.
The window still depends on a choice of y; it does not occupy
one historical branch without that choice.

## P2. Stability

The analytic curvature of Ω at r = 0, A = 0 is
2 c_even − 2 y² χ with the cycle-18 ico susceptibility
χ = 0.038415791436818836. It is negative if and only if
y > y_c(η), on every sample point. This names the dichotomy.
It selects a branch only if a derived principle already places
y on one side of y_c. P2 alone does not.

## P3. Resolvent poles

(i) The uncoupled T0 poles z1 ≈ 1.015458, z2 ≈ 1.063249 of
cycles 05/13/16 are independent of y and of r, and cannot
select a branch.
(ii) The cycle-13 bubble-chain transfer uses the Dirac pairing
kernel that cycle 18 falsified as the coupled measure; cycle 13
already found that it does not fix r. It was not recomputed as
a new principle and is not a derived selector.
(iii) Linearisation of the Nambu functional at the origin is P2
again.

No matching of an even resolvent pole to z1 or z2, and no demand
that a photon pole be massless, was used.

## Conclusion

H1, as predeclared, is only partly true: the runaway / no
interior minimum holds, but A = π is not the vacuum at every
supercritical sample point. H2 and the selection half of H3
hold: P1 (even as an extra postulate), P2 and P3(i)–(iii) do
not select a unique finite y or a branch independently of a
choice of y_even. The dichotomy of cycles 32–37 stands, with
the near-threshold window recorded above. y_even remains free.
No ARF comparison was performed.

Predeclaration sha256
`0179844439f2dfdad768433323942df02208087748b71aa657e746c262a96797`.
Test sha256
`514aa646b656a1a1d04b6c5a1eb8aeb5916f1c0c4c85c92bafddab09b382f20d`.
