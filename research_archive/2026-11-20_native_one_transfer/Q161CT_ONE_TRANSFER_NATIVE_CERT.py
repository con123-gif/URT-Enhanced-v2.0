#!/usr/bin/env python3
"""Q161ct: one positive-transfer test on ORIGINAL Q101/Q124/Q125 currents.

2026-11-20. Independently derived and executed with exact Q(sqrt5) arithmetic
in a standalone reconstruction before this native-source re-execution.

PHYSICAL STATUS: CONDITIONAL MODEL, not a physical fermion-mass derivation.
The proposed edge energy E[psi]=sum_(x,y) J_xy^2 |psi_y-psi_x|^2
uses the actual native Q125 current J_xy=f_x.T W f_y/2, but CHOOSING
a squared-current scalar Laplacian is a modelling step. It does NOT fix
the kinetic clock, H64/24->Q96 source B_x, physical masses, or gravity.
Do not identify the 24 isolated graph vertices with the 24 URT clock tracks
without an independently derived intertwiner.

Original Q125 source script executes ORIGINAL all-five 190-cochain/50->8->12
Q101, original 444 genuine Q124 states/1032 links and Q96 Ward check.
No measured masses, fitted fractions, surrogate matrices, or altered
original source operators.

EXACT FINITE STATEMENT: among 1032 links, 720 nonzero currents form
TWO 210-vertex connected components plus 24 isolated vertices. The
conditional scalar positive Laplacian B.T B has nullity 26 and rank 418.
The 24 isolated vertices are exactly twelve E_outer=-10, M_outer=0 saddle
states per centre orientation. All coefficients are in Q(sqrt5).
For any original link-unitary Q96-covariant gradient B_U with these
source weights, its kernel contains at least 24*96=2304 decoupled
charge-fibre states, regardless of its nontrivial holonomies.

NEXT TEST / RESUME HERE: apply the actual native Q96 U_xy and primitive
H64/24 source-to-clock dynamics to see whether the scalar components and
24 saddle isolates persist when the declared model assumptions are lifted.
The missing native 50->96 source embedding Q161cl remains OPEN.
"""
from pathlib import Path
from collections import Counter, deque
from fractions import Fraction
import runpy

root = Path(__file__).resolve().parents[2]
source = root / "research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py"
ns = runpy.run_path(str(source))
masks = list(map(int, ns["masks"]))
links = ns["links"]
field = ns["jfield"]
assert len(masks) == 444 and len(links) == 1032

counts = Counter()
neighbors = [set() for _ in masks]
for i, j, bit in links:
    a, b = field[i, j]  # exact Fraction pair a + b*sqrt(5)
    counts[a, b] += 1
    if a != 0 or b != 0:
        neighbors[i].add(j)
        neighbors[j].add(i)
assert counts == Counter({
    (Fraction(0), Fraction(-8, 5)): 240,
    (Fraction(0), Fraction(8, 5)): 240,
    (Fraction(4), Fraction(12, 5)): 120,
    (Fraction(-4), Fraction(-12, 5)): 120,
    (Fraction(0), Fraction(0)): 312,
}), counts

components = []
visited = set()
for x in range(444):
    if x in visited:
        continue
    visited.add(x)
    component = []
    queue = deque([x])
    while queue:
        v = queue.popleft()
        component.append(v)
        for w in neighbors[v]:
            if w not in visited:
                visited.add(w)
                queue.append(w)
    components.append(component)
sizes = sorted((len(c) for c in components), reverse=True)
assert sizes == [210, 210] + [1] * 24, sizes

# Prove the isolated vertices are 12 saddle configurations on each centre sheet.
edges = ns["charge"]["edges"]
saddles = Counter()
for component in components:
    if len(component) != 1:
        continue
    mask = masks[component[0]]
    spins = [1 - 2 * ((mask >> i) & 1) for i in range(12)]
    e_outer = sum(spins[i] * spins[j] for i, j in edges)
    m_outer = sum(spins)
    center = 1 - 2 * ((mask >> 12) & 1)
    saddles[e_outer, m_outer, center] += 1
assert saddles == Counter({(-10, 0, 1): 12, (-10, 0, -1): 12}), saddles

# For L=B^T B with positive edge weights J^2, energy vanishes exactly
# iff each component has constant psi. No numerical eigenvalue tolerance needed.
assert 444 - len(components) == 418
assert 24 * 96 == 2304
print("Q161ct EXACT NATIVE one-transfer PASS: 720 links, 210+210+24 isolates")
print("Conditional scalar L nullity 26 / rank 418; Q96 covariant kernel lower bound 2304")
print("No physical fermion mass, 24-track identification or kinetic clock claimed")
