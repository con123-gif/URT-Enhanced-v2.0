#!/usr/bin/env python3
"""alt_cycle13: dodecahedral 4-split vs hidden 4_3/4_5 via Hbits."""
from __future__ import annotations

import json
from itertools import combinations, product
from pathlib import Path

import numpy as np

phi = (1.0 + np.sqrt(5.0)) / 2.0
pts = np.array(
    [(0, a, b * phi) for a, b in product((-1, 1), repeat=2)]
    + [(a, b * phi, 0) for a, b in product((-1, 1), repeat=2)]
    + [(a * phi, 0, b) for a, b in product((-1, 1), repeat=2)],
    float,
)
assert pts.shape == (12, 3)

# Icosahedral edges and triangular faces (3-cliques)
d = np.sqrt(((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1))
np.fill_diagonal(d, np.inf)
mind = d.min()
edges = {
    frozenset((i, j))
    for i in range(12)
    for j in range(i + 1, 12)
    if abs(d[i, j] - mind) < 1e-8
}
assert len(edges) == 30
faces = []
for a, b, c in combinations(range(12), 3):
    if frozenset((a, b)) in edges and frozenset((b, c)) in edges and frozenset((c, a)) in edges:
        faces.append((a, b, c))
assert len(faces) == 20

C = np.zeros((20, 12))
for k, f in enumerate(faces):
    C[k, list(f)] = 1
face_adj = np.zeros((20, 20))
for k, f in enumerate(faces):
    for j in range(k):
        if len(set(f).intersection(faces[j])) == 2:
            face_adj[k, j] = face_adj[j, k] = 1
Lface = 3 * np.eye(20) - face_adj
# Each face adjacent to 3 others
assert np.allclose(np.diag(face_adj), 0)
assert np.allclose(face_adj.sum(1), 3)

Ph = np.eye(20) - C @ np.linalg.inv(C.T @ C) @ C.T
P3 = Ph @ (5 * np.eye(20) - Lface) / 2
P5 = Ph @ (Lface - 3 * np.eye(20)) / 2
# Symmetrise numerical noise
P3 = 0.5 * (P3 + P3.T)
P5 = 0.5 * (P5 + P5.T)
assert np.linalg.norm(P3 @ P3 - P3) < 1e-10
assert np.linalg.norm(P5 @ P5 - P5) < 1e-10
assert abs(np.trace(P3) - 4) < 1e-10
assert abs(np.trace(P5) - 4) < 1e-10
assert np.linalg.norm(P3 @ P5) < 1e-10

# H1: 12-vertex module has no 4, so both 4s lie in im Ph
# Equivalent numerical test: Ph acts as identity on im P3 and im P5
assert np.linalg.norm(Ph @ P3 - P3) < 1e-10
assert np.linalg.norm(Ph @ P5 - P5) < 1e-10

# H2: Lface eigenvalues on im P3 and im P5
# For a projector P of rank 4, the compressed operator P Lface P should be λ P
LP3 = P3 @ Lface @ P3
LP5 = P5 @ Lface @ P5
# On im P3, (5I - L)/2 = I so L = 3 I; on im P5, (L - 3I)/2 = I so L = 5 I
assert np.linalg.norm(LP3 - 3 * P3) < 1e-8
assert np.linalg.norm(LP5 - 5 * P5) < 1e-8

# Antipodal pairs and Hbits / Uh (archived construction)
remaining = set(range(12))
pairs = []
while remaining:
    i = min(remaining)
    j = min(remaining - {i}, key=lambda k: np.linalg.norm(pts[i] + pts[k]))
    assert np.linalg.norm(pts[i] + pts[j]) < 1e-12
    pairs.append((i, j))
    remaining.remove(i)
    remaining.remove(j)
assert len(pairs) == 6

M = np.zeros((64, 20))
Hbits = 15 * np.eye(64)
for s in range(64):
    chosen = {pairs[i][(s >> i) & 1] for i in range(6)}
    for k, f in enumerate(faces):
        if set(f).issubset(chosen):
            M[s, k] = 1
    for i, j in combinations(range(6), 2):
        Hbits[s, s ^ (1 << i) ^ (1 << j)] = -1

Uh = M @ Ph / np.sqrt(2)
assert np.linalg.norm(Uh.T @ Uh - Ph) < 1e-10
assert np.linalg.norm(Hbits @ Uh @ P3 - 18 * Uh @ P3) < 1e-8
assert np.linalg.norm(Hbits @ Uh @ P5 - 16 * Uh @ P5) < 1e-8
assert np.linalg.norm((21 * np.eye(64) - Hbits) @ Uh - Uh @ (3 * P3 + 5 * P5)) < 1e-8

result = {
    "H1_both_fours_in_Ph": {
        "trace_P3": float(np.trace(P3)),
        "trace_P5": float(np.trace(P5)),
        "Ph_fixes_im_P3": True,
        "Ph_fixes_im_P5": True,
    },
    "H2_Lface_on_hidden": {
        "Lface_on_im_P3": 3,
        "Lface_on_im_P5": 5,
        "P3_is_lambda3_four": True,
        "P5_is_lambda5_four": True,
    },
    "H3_history_embedding": {
        "Hbits_on_Uh_P3": 18,
        "Hbits_on_Uh_P5": 16,
        "twenty_one_minus_Hbits_recovers_3_and_5": True,
        "intertwiner_error": float(
            np.linalg.norm((21 * np.eye(64) - Hbits) @ Uh - Uh @ (3 * P3 + 5 * P5))
        ),
        "labels_hidden_quartets": True,
        "picks_fermion_3_versus_3p": False,
    },
    "classification": {
        "H1": "PROVED",
        "H2": "PROVED",
        "H3": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "The dodecahedral split (3, 5) is exactly (4_3, 4_5) via face/vertex "
        "duality and the history embedding (Hbits 18 and 16, with 21−Hbits "
        "reproducing 3 and 5). This labels the hidden quartets; it does not "
        "select a fermion Yukawa ratio."
    ),
}

Path("/workspace/arf_research/alt_cycle13_dodeca_hbits/results.json").write_text(
    json.dumps(result, indent=2) + "\n"
)
print(json.dumps(result, indent=2))
print("PASS: alt_cycle13")
