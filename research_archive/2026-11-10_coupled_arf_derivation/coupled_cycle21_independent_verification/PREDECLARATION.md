# Coupled cycle 21 predeclaration — standalone verification of condensation

A single numpy-only script, with no imports from other cycles and no
scipy / networkx / repository loaders, recomputes the condensation
results of cycles 18 and 19 from the archived residual pairing frames
and the frozen constants. It is intended to be runnable by a third
party from this directory alone.

## Inputs (named, not fitted)
- Frozen constants, closed form:
    φ = (1+√5)/2,  δ★ = 80π/(1053 φ),  Δ = 3/20 − δ★,  η = −ln Δ,
    λ_18 = 4 sin²(π(9−4√5)/4),  ρ = (π/e)² λ_18,
    c3 = 1/4 − 1/(2(18+ρ)),  c5 = 1/4 − 1/(2(16+ρ)),
    c_odd = c3,  c_even = Δ² c5.
- Icosahedral vertices, in the order used by cycles 10–19:
    cyclic even permutations of (0, ±1, ±φ), listed as
    (0, ±1, ±φ), (±1, ±φ, 0), (±φ, 0, ±1) with the sign order
    (−,−), (−,+), (+,−), (+,+) inside each cycle.
- Edges: the 30 nearest-neighbour pairs (distance-squared 4 in these
  coordinates), sorted lexicographically.
- Residual frames: the cycle-11 files
    odd_adjacent_current_frame.npy, even_adjacent_current_frame.npy
  shipped next to this script (sha256 recorded at run time and checked
  against the values written below, which are the hashes of the
  cycle-11 archives):
    odd  85eb54de4cc4269c957b99c62b32875bb491b868b3fd87ea79cc35a0830f192c
    even d349c2b51bbe9112fc083ad78ef0129530e78965b1dcef649ccdc0348382e059
  The script does not import cycle-11 code.

## What the script reconstructs itself (numpy only)
Geometric H13 Hodge Laplacian (centre + 12 vertices; spectrum must be
0, 13, 6±√5, 7) and the 12-vertex icosahedral Laplacian (spectrum
0, 5−√5, 6, 5+√5). Pairing matrices on the 30 surface edges. Nambu /
BdG operator H = [[K, Δ], [Δ, −K]] and the cycle-18 fermion potential
    Ω_f(T) = −T Σ log(2 cosh(E/2T)) + T Σ log(2 cosh(|ξ|/2T)),
    Ω_f(0) = −½ Σ E + ½ Σ |ξ|.
Nuclear-norm maximiser of the even frame by projected gradient ascent
on S³ (no scipy). Icosahedral rotation group and the stabilizer of
the even pairing matrix. Positive BdG spectrum and large-vev singular
values of the unit even pairing.

## Will report, and the pass criteria (written before the run)
Against cycle 18 / 19 published numbers, primary kinetic H13:
- χ_even(η) and y_c,even(η) to relative 5×10^{-3}
  (cycle 18: χ = 0.037511483697016956, y_c = 0.006011318618427269).
- χ_odd(η) and y_c,odd(η) to relative 5×10^{-3}
  (cycle 18: χ = 0.03843307183615252, y_c = 2.404676225071091).
- Pairing attractive and Dirac control stiffening (sign only) on both
  channels at T = η and T = 0.
- Finite even vev at y_even = 1, T = η: r_* within 1% of cycle 19’s
  refined value 8.54983×10^5, and within 1% of the analytic
  N/(4 c_even).
- Stabilizer of the even pairing matrix is A4 (order 12, with the
  A5-class counts of A4: identity 1, order-2 3, order-3 8).
- Positive singular values of the unit even pairing match
  √(2/15) (×3), √(1/6) (×6), √(3/10) (×2) to relative 10^{-8},
  i.e. ratios 2 : √5 : 3.
Control: on the ico Laplacian, y_c,even(η) within 5×10^{-3} relative
of cycle 18’s 0.005940144.

Classification: PROVED if every pass criterion holds; otherwise
FALSIFIED (or CONDITIONAL if a single numerical tolerance is missed
by less than a factor of three, with the miss named). No ARF is used.
