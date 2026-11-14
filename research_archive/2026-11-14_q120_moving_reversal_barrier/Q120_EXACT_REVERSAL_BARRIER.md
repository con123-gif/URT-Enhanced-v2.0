# Q120 — Exact reversal barrier, NEW moving-asymmetry track only

Date: 14 November 2026. **Exact finite-contact theorem; physical kinetic law and ARFs OPEN.** This calculation does not use Q77, the history-selection clock, Q112/Q115 four-pole residues, fitted data or any historical ARF expression.

## Actual 12+centre local source
Use original golden icosahedron vertices (0,±1,±phi), (±1,±phi,0), (±phi,0,±1), its 30 nearest-neighbour edges, 12 outer Ising contacts s_i and an **active, separately flippable central contact c**. The source energy is
    H(s,c) = sum_edges s_i s_j + phi c sum_i s_i.
The centre is NOT eliminated during a path. This is a scoped local subsystem inside the full five-Platonic/190-cochain/50-to-8-to-12/H64 geometry checked by Q101. Nothing here reduces or replaces that full geometry, or inserts the old Q77 kinetic law.

## Exact theorem (rigorously enumerated, no fitting)
Among all 4096 outer spin states, min edge energy at outer |M|=0,2,4,6,8,10,12 is respectively -10,-8,-6,0,10,20,30. The full 8192-state energy has exactly **60** minima, in two opposite 30-state sectors:
    Eg = -6 - 4phi = -8 - 2sqrt(5).
Q119 separately determined the local first excitation gap sqrt(5)-1.

Any sequence of individual outer-spin flips from M=+4 to M=-4 must cross M=0, where E>=-10 and centre field is exactly zero. Thus every legitimate single-spin route has maximal energy at least -10.

The executable constructs an explicit **shortest five-spin-flip route** whose successive (E,M,c) values are
    (-6,+4,-1) -> (-8,+2,-1) -> (-10,0,-1)
       -> (-10,0,+1) -> (-8,-2,+1) -> (-6,-4,+1).
The corresponding energies are Eg,-9-sqrt(5),-10,-10,-9-sqrt(5),Eg. Four outer flips are necessary to change M by eight; one central flip is additionally necessary. Thus path length five and peak energy -10 are BOTH optimal.

Consequently the exact minimal orientation-reversal barrier is
    **B = -10-Eg = 2(sqrt(5)-1), exactly twice the first gap.**

The entire sublevel at or below the barrier has precisely **444** real 13-spin states: 60 minima, 240 M=±2 intermediate configurations, and 144 M=0 configurations (both centre orientations). Its single-spin-flip graph is connected. Below the barrier the opposite 30-minimum sectors cannot interconvert by single-contact flips.

Global inversion (s,c)->(-s,-c) is an exact energy symmetry; therefore unbiased equilibrium orientation vanishes for all finite positive temperatures, even though frustrated long-lived sectors can exist. Golden frustration selects a degenerate pair of orientations but **does not select a preferred global handedness, attempt frequency, time unit, or physical mass/coupling**. A conditional thermally activated stochastic process would use B as its activation exponent times a separately derived inverse temperature. No rate or 24-clock was inserted.

## Evidence and next physical step
The standalone original-coordinate certificate exhaustively classifies all 8192 states using SymPy exact comparisons, exhibits the five individual flips and checks 444-state graph connectivity and inversion. Local execution: PASS. New native GitHub CI check is registered and must pass independently.

Next on **Track M only:** derive a locally positive source-normalized transition from the 13-spin mismatch including the full 190/H64 source and determine whether that system fixes the time/kinetic prefactor. Do not borrow the old selected-history clock. This result is the exact local activation barrier, NOT a physical ARF.
