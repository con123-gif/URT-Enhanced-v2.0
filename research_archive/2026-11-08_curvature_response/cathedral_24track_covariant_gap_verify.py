#!/usr/bin/env python3
"""Standalone independent Cathedral five-Platonic/24-track coercivity audit.

Research comparison motivated by the forest-gauge work of James
Montgomery Lockwood, coauthor with Deep Bhattacharjee, Ushashi
Bhattacharya and Tristan Romanov of One Cube Estimate Implies the
Yang--Mills Mass Gap (Hexagon 2610.00341v7, 2026):
https://hexagonmath.org/2610.00341v7
Contains no Lockwood source code, copied manuscript, or claim that the
finite result proves a 4D Yang--Mills mass gap.

Dependencies: numpy, scipy, sympy, networkx.
"""
from math import sqrt, pi, sin, cos
import numpy as np
import scipy.linalg as la
import sympy as sp
import networkx as nx

SOLIDS = [
    ('tetrahedron', nx.tetrahedral_graph()),
    ('cube', nx.cubical_graph()),
    ('octahedron', nx.octahedral_graph()),
    ('dodecahedron', nx.dodecahedral_graph()),
    ('icosahedron', nx.icosahedral_graph()),
]


def incidence(graph):
    """Construct canonical face/edge/vertex complex from planar embedding."""
    vertices=sorted(graph.nodes())
    edges=sorted(tuple(sorted(e)) for e in graph.edges())
    emap={e:j for j,e in enumerate(edges)}
    vmap={v:j for j,v in enumerate(vertices)}
    planar,embedding=nx.check_planarity(graph)
    assert planar
    seen=set();faces=[]
    for u in vertices:
        for v in embedding.neighbors_cw_order(u):
            if (u,v) not in seen:
                faces.append(embedding.traverse_face(u,v,mark_half_edges=seen))
    d0=np.zeros((len(edges),len(vertices)),dtype=int)
    d1=np.zeros((len(faces),len(edges)),dtype=int)
    for j,(u,v) in enumerate(edges):
        d0[j,vmap[u]]=-1;d0[j,vmap[v]]=1
    for k,face in enumerate(faces):
        for u,v in zip(face,face[1:]+face[:1]):
            d1[k,emap[tuple(sorted((u,v)))]]=1 if u<v else -1
    return d0,d1


def main():
    rng=np.random.default_rng(24082026)
    block=[]; counts=[]; total=0
    for name,G in SOLIDS:
        d0,d1=incidence(G)
        assert not np.any(d1@d0),f'{name}: d1d0 != 0'
        V=d0.shape[1];E=d0.shape[0];F=d1.shape[0]
        assert V-E+F==2
        assert np.linalg.matrix_rank(d0)==V-1
        assert np.linalg.matrix_rank(d1)==F-1
        basis=la.null_space(d0.T)
        assert basis.shape==(E,F-1),f'{name}: bad co-closed dim'
        K=basis.T@d1.T@d1@basis
        spectrum=np.linalg.eigvalsh(K)
        gap=spectrum[0]
        counts.append((name,V,E,F,F-1,gap))
        block.append(K)
        total+=F-1
    K45=la.block_diag(*block)
    assert K45.shape==(45,45)
    evals,evecs=la.eigh(K45)
    mu=3-sqrt(5)
    assert abs(evals[0]-mu)<1e-12
    assert sum(abs(evals-mu)<1e-10)==3
    # Exact characteristic-polynomial certificate for controlling icosahedral block
    lam=sp.symbols('lambda')
    Ld=nx.laplacian_matrix(nx.dodecahedral_graph()).toarray().astype(int)
    cp=sp.factor(sp.Matrix(Ld).charpoly(lam).as_expr())
    cp_expected=lam*(lam-5)**4*(lam-3)**4*(lam-2)**5*(lam**2-6*lam+4)**3
    assert sp.expand(cp-cp_expected)==0
    # Choose two real orthonormal vectors in the 3D minimum-eigenvalue eigenspace.
    a=evecs[:,0];b=evecs[:,1]
    theta=2*pi/((1+sqrt(5))/2)**2
    P=np.outer(a,a)+np.outer(b,b)
    J=np.outer(b,a)-np.outer(a,b)
    U=np.eye(45)+(cos(theta)-1)*P+sin(theta)*J
    assert np.linalg.norm(U.T@U-np.eye(45),ord=2)<1e-12
    assert np.linalg.norm(K45@U-U@K45,ord=2)<1e-11
    # On span(a,b), U acts as R(theta). A Fourier helix with angle alpha=2pi*m/24
    # has covariant link energy per unit norm 4sin^2((alpha-theta)/2).
    kappa=1.0
    rows=[]
    for m in range(24):
        alpha=2*pi*m/24
        vectors=np.stack([cos(k*alpha)*a+sin(k*alpha)*b for k in range(24)])
        curv=sum(x@K45@x for x in vectors)
        diffs=np.roll(vectors,-1,axis=0)-vectors@U.T
        link=kappa*np.sum(diffs**2)
        quotient=(curv+link)/np.sum(vectors**2)
        predicted=mu+4*kappa*sin((alpha-theta)/2)**2
        assert abs(quotient-predicted)<1e-11,(m,quotient,predicted)
        rows.append((m,quotient,predicted))
    m_best=min(rows,key=lambda x:x[1])[0]
    # General arbitrary per-link orthogonal transport: test a fresh randomized example.
    transports=[]
    for k in range(24):
        A=rng.standard_normal((45,45))
        Q,R=np.linalg.qr(A)
        Q=Q@np.diag(np.where(np.diag(R)>=0,1.,-1.))
        transports.append(Q)
    minimum_seen=float('inf')
    for _ in range(25):
        vectors=rng.standard_normal((24,45))
        e0=sum(x@K45@x for x in vectors)
        e1=sum(np.sum(vectors[(k+1)%24]-U_k@vectors[k])**2 for k,U_k in enumerate(transports))
        quotient=(e0+e1)/np.sum(vectors**2)
        minimum_seen=min(minimum_seen,quotient)
        assert quotient+1e-10>=mu
    # A test that the original unconditional inequality fails: take exact df.
    d0,d1=incidence(nx.icosahedral_graph())
    f=np.arange(d0.shape[1],dtype=float)
    x=d0@f
    assert np.linalg.norm(x)>0 and np.linalg.norm(d1@x)==0
    print('Full five-solid topology:')
    for row in counts: print('%-12s V=%2d E=%2d F=%2d co-closed=%2d gap=%.12f'%row)
    print('Total V,E,F =',(sum(z[1] for z in counts),sum(z[2] for z in counts),sum(z[3] for z in counts)))
    print('Co-closed dimension 45; 24-track dimension',24*45)
    print('Exact characteristic polynomial:',cp)
    print('Sharp gap mu = 3-sqrt(5) = %.12f'%mu)
    print('Golden theta=%.12f; 24-theta mod 2pi=%.12f'%(theta,(24*theta)%(2*pi)))
    print('Golden 2D helical branch, kappa=1: m=%d minimum=%.12f'%(m_best,rows[m_best][1]))
    print('Random transport smallest tested Rayleigh quotient: %.12f'%minimum_seen)
    print('Unconstrained exact edge field: ||d1*d0 f||=0 despite ||d0 f||>0')
    print('Independent exact and numerical tests PASS')

if __name__=='__main__':main()
