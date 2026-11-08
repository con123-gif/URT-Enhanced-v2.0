#!/usr/bin/env python3
"""Independent finite-cell Hodge gap verification (no Lockwood code).

Uses standard unit-weight cellular incidence on five Platonic sphere complexes.
Not a continuum Yang--Mills calculation.
"""
from collections import Counter
from math import sqrt
import networkx as nx
import numpy as np
import sympy as sp

SOLIDS = [
    ('tetrahedron', nx.tetrahedral_graph()),
    ('cube', nx.cubical_graph()),
    ('octahedron', nx.octahedral_graph()),
    ('dodecahedron', nx.dodecahedral_graph()),
    ('icosahedron', nx.icosahedral_graph()),
]

def cellular_matrices(graph):
    vertices = sorted(graph.nodes())
    edges = sorted(tuple(sorted(e)) for e in graph.edges())
    vertex_index = {v:i for i,v in enumerate(vertices)}
    edge_index = {e:i for i,e in enumerate(edges)}
    planar, embedding = nx.check_planarity(graph)
    assert planar
    seen_half_edges = set()
    faces = []
    for u in vertices:
        for v in embedding.neighbors_cw_order(u):
            if (u,v) in seen_half_edges:
                continue
            face = embedding.traverse_face(u,v, mark_half_edges=seen_half_edges)
            faces.append(face)
    d0 = np.zeros((len(edges),len(vertices)), dtype=int)
    for i,(u,v) in enumerate(edges):
        d0[i, vertex_index[u]] = -1
        d0[i, vertex_index[v]] = +1
    d1 = np.zeros((len(faces),len(edges)), dtype=int)
    for i,face in enumerate(faces):
        for u,v in zip(face, face[1:]+face[:1]):
            j=edge_index[tuple(sorted((u,v)))]
            d1[i,j] = 1 if u < v else -1
    return d0, d1, faces

if __name__ == '__main__':
    total_v=total_e=total_f=0
    global_min=float('inf')
    print('Solid            V  E  F  rank(d0) rank(d1)  coexact gap')
    for label,graph in SOLIDS:
        d0,d1,faces=cellular_matrices(graph)
        v,e=d0.shape[1],d0.shape[0]
        f=d1.shape[0]
        total_v+=v; total_e+=e; total_f+=f
        assert np.array_equal(d1 @ d0, np.zeros((f,v),dtype=int))
        assert np.linalg.matrix_rank(d0) == v-1
        assert np.linalg.matrix_rank(d1) == f-1
        assert v-e+f == 2
        lap_edges=d0 @ d0.T + d1.T @ d1
        eig=np.linalg.eigvalsh(lap_edges)
        assert np.min(eig) > 1e-8
        curvature=np.linalg.eigvalsh(d1 @ d1.T)
        positive=curvature[curvature > 1e-8]
        gap=positive.min()
        assert abs(gap - np.min(eig)) < 1e-8 or np.min(eig) < gap
        global_min=min(global_min,gap)
        print(f'{label:16} {v:2d} {e:2d} {f:2d}     {v-1:2d}       {f-1:2d}     {gap: .12f}')
    print(f'Totals: V={total_v}, E={total_e}, F={total_f}; dim Hodge={total_v+total_e+total_f}')
    print(f'Exact candidate: 3-sqrt(5) = {3-sqrt(5):.12f}')
    print(f'Calculated global curvature gap: {global_min:.12f}')
    print(f'Lockwood cited bound 537/5000 = {537/5000:.12f}')
    print(f'Gap ratio = {global_min/(537/5000):.9f}')
    assert abs(global_min-(3-sqrt(5))) < 1e-8
    # Exact independent certification from characteristic polynomial of
    # unweighted graph Laplacian of the dodecahedron (dual to icosahedron).
    dual = nx.dodecahedral_graph()
    L = nx.laplacian_matrix(dual).toarray().astype(int)
    lam = sp.symbols('lambda')
    cp = sp.factor(sp.Matrix(L).charpoly(lam).as_expr())
    print('Dodecahedral graph Laplacian characteristic polynomial:')
    print(cp)
    assert sp.simplify(cp.subs(lam,3-sp.sqrt(5))) == 0
