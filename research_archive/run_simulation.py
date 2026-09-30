"""
URT / icosahedron falsifiable simulation prototype

This script demonstrates two separate claims:

1. Twelve equivalent points on a sphere, under an isotropic repulsive
   interaction, relax from random initial conditions to an icosahedron.

2. Adding one invariant central node and coupling identical resonators along
   the 30 shell edges plus 12 spokes produces the exact centred-icosahedron
   Laplacian spectrum:
       0^(1), (6-sqrt(5))^(3), 7^(5), (6+sqrt(5))^(3), 13^(1).

It does not by itself distinguish URT from ordinary constrained energy
minimisation. A URT-specific test requires a frozen, parameter-complete rule
that maps the measured state to the next physical coupling or displacement.
"""

import numpy as np
from scipy.spatial import ConvexHull

def energy(x):
    d = x[:, None, :] - x[None, :, :]
    r = np.linalg.norm(d, axis=2)
    iu = np.triu_indices(len(x), 1)
    return np.sum(1.0 / r[iu])

def tangent_direction(x):
    d = x[:, None, :] - x[None, :, :]
    r = np.linalg.norm(d, axis=2)
    np.fill_diagonal(r, np.inf)
    f = np.sum(d / r[:, :, None]**3, axis=1)
    return f - np.sum(f*x, axis=1)[:, None]*x

def relax(seed=0, tol=2e-7):
    rng = np.random.default_rng(seed)
    x = rng.normal(size=(12, 3))
    x /= np.linalg.norm(x, axis=1)[:, None]
    e = energy(x)
    step = 0.05

    for _ in range(5000):
        f = tangent_direction(x)
        if np.max(np.linalg.norm(f, axis=1)) < tol:
            break

        trial = step
        for _ in range(35):
            y = x + trial*f
            y /= np.linalg.norm(y, axis=1)[:, None]
            ey = energy(y)
            if ey < e:
                x, e = y, ey
                step = min(1.02*trial, 0.10)
                break
            trial *= 0.5
        else:
            break

    return x

x = relax(0)
hull = ConvexHull(x)

edges = set()
for a, b, c in hull.simplices:
    edges.update({
        tuple(sorted((int(a), int(b)))),
        tuple(sorted((int(b), int(c)))),
        tuple(sorted((int(c), int(a)))),
    })

A = np.zeros((13, 13))
for i, j in edges:
    A[i, j] = A[j, i] = 1
for i in range(12):
    A[i, 12] = A[12, i] = 1

L = np.diag(A.sum(axis=1)) - A

print("Final shell energy:", energy(x))
print("Faces:", len(hull.simplices))
print("Edges:", len(edges))
print("Degrees:", [sum(i in e for e in edges) for i in range(12)])
print("Centred Laplacian eigenvalues:")
print(np.linalg.eigvalsh(L))