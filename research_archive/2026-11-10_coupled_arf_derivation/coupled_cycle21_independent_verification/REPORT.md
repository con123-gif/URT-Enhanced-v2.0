# Coupled cycle 21 — standalone verification of condensation

Classification: **PROVED**. Every predeclared pass criterion holds.
Advances a physical ARF? No.

A single numpy-only script, `test_verify_condensation.py`, with no
imports from other cycles and no scipy / networkx, recomputes the
condensation results of cycles 18 and 19 from the frozen constants and
the two shipped cycle-11 residual frames. Geometry (icosahedral
vertices in the archived order, nearest-neighbour edges, H13 Hodge and
ico Laplacians, the 60 icosahedral rotations) is reconstructed in the
script. The nuclear-norm maximiser is a projected gradient ascent on
S³. Run:

    python3 test_verify_condensation.py

from this directory.

## Checks (all passed)

| quantity | this script | cycle 18/19 target | relative error |
|---|---|---|---|
| χ_even(η), H13 | 0.037511483697016956 | 0.037511483697016956 | 0 |
| y_c,even(η), H13 | 0.006011318618427269 | 0.006011318618427269 | 0 |
| χ_odd(η), H13 | 0.03843307183615252 | 0.03843307183615252 | 0 |
| y_c,odd(η), H13 | 2.404676225071091 | 2.404676225071091 | 0 |
| y_c,even(η), ico | 0.005940144040707988 | 0.005940144 | 6.9×10^{-9} |
| r_* (ye=1, T=η) | 8.558345504799723×10^5 | cycle 19: 8.54983×10^5 | 9.96×10^{-4} |
| r_* vs N/(4 c_even) | same 8.558345504799722×10^5 | analytic | 1.4×10^{-16} |

The 0.100% difference from cycle 19’s published r_* is cycle 19’s scan
resolution (cycle 19 already reported a 0.100% offset from the same
analytic value). The present script sits on the analytic minimum.
Both lie inside the predeclared 1% window.

Further signs, all as required: pairing attractive and Dirac control
stiffening on both channels at T = η and T = 0; H13 spectrum
0, 13, 6±√5, 7; ico spectrum 0, 5−√5, 6, 5+√5; frame sha256 matches
the cycle-11 archives.

Stabilizer of the even pairing matrix: **A4** (order 12, with
order-counts 1, 2, 3 equal to 1, 3, 8).

Positive singular values of the unit even pairing, multiplicities
3, 6, 2, match √(2/15), √(1/6), √(3/10) with max relative error
< 10^{-7}, i.e. ratios **2 : √5 : 3**.

Closed-form constants used: c3 = 0.2222379983269106,
c5 = 0.21876996521511627, c_even = 1.3555131567782033×10^{-6},
η = 5.9957979867413025 (identical to cycle 18).

## Integrity
Predeclaration sha256:
`708ff8444b3a011f141f7f3483f0962ea104dcdc45027d5d768c184dbff1ad9c`.
Frame sha256: odd
`85eb54de4cc4269c957b99c62b32875bb491b868b3fd87ea79cc35a0830f192c`,
even
`d349c2b51bbe9112fc083ad78ef0129530e78965b1dcef649ccdc0348382e059`.
Test-script hashes (original and singular-value matcher patch) are in
HASHES.txt. No ARF target was used.
