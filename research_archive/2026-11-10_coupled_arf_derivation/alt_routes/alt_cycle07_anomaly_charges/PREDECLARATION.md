# Predeclaration — alt_cycle07: anomaly cancellation on the four history orbits

Date: 2026-11-10 (Europe/London)
Route: (7) U(1) anomaly cancellation for geometrically diagonal charges on the four A5-orbits of sizes (12, 12, 20, 20).

## Frozen inputs
Orbits 12A, 12B, 20A, 20B as in cycle 02. Charge lattice Z^4 (one integer per orbit).
If the 64 histories are treated as Weyl fermions with those charges:
  Tr(Q)   = 12 q12A + 12 q12B + 20 q20A + 20 q20B
  Tr(Q^3) = 12 q12A^3 + 12 q12B^3 + 20 q20A^3 + 20 q20B^3
Anomaly cancellation: Tr(Q) = 0 (mixed gravitational U(1)) and Tr(Q^3) = 0 (pure U(1)^3).
Pairing dimension m(q) as in cycle 03: a Sym^2 block on orbit i contributes iff 2 q_i = +2; a cross block i<j contributes iff q_i + q_j = +2. Two hidden quartets give Yukawa real-dimension 2m.
Sign-flip of a history is the involution expected to swap the two 12-orbits and the two 20-orbits (to be checked from the orbit construction if needed; the anomaly computation itself treats general q ∈ Z^4).

## Hypotheses
H1. The integer solutions of Tr(Q) = Tr(Q^3) = 0 form a nonempty lattice-like set. In particular the opposite-charge family (q, −q, r, −r) always solves both equations, and is the unique 2-parameter linear family compatible with a sign involution that swaps 12A↔12B and 20A↔20B and reverses charge.
H2. Inside that opposite-charge family, the pairing dimension 2m is never 1. The possible values will be computed; the minimum positive value is at least 8 (matching previous H13 / single-orbit counts) or will be reported exactly if different.
H3. Among all small-integer charges with |q_i| ≤ 3 that cancel both anomalies, m = 1 never occurs, and uniqueness of the Yukawa ray still fails.
H4. No ARF is derived. No additional nonabelian (Yang-Mills) anomaly is imposed.

## Integrity
Scan bounds |q_i| ≤ 3 are a computational window, not a fit. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
