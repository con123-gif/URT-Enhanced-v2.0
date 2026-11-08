#!/usr/bin/env python3
"""Cathedral response-duality, 24-track, hidden-Schur and KMS tests.

Independent finite-dimensional implementation; the sharp energy-dual
identity was shared as part of James Montgomery Lockwood's Yang--Mills
research programme. No third-party manuscript, proof or code is copied.
Source credit: Deep Bhattacharjee, Ushashi Bhattacharya, James Montgomery
Lockwood, Tristan Romanov, One Cube Estimate Implies the Yang--Mills Mass
Gap, Hexagon 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7.  Requires numpy, scipy, networkx.  Run:
    python cathedral_response_duality_verify.py
"""
from math import pi, sqrt, sin, cos, log
import numpy as np
import scipy.linalg as sla
import networkx as nx

SOLIDS = [('tetrahedron', nx.tetrahedral_graph()),
          ('cube', nx.cubical_graph()),
          ('octahedron', nx.octahedral_graph()),
          ('dodecahedron', nx.dodecahedral_graph()),
          ('icosahedron', nx.icosahedral_graph())]


def coboundary(g):
    vertices=sorted(g.nodes())
    edges=sorted(tuple(sorted(x)) for x in g.edges())
    emap={e:i for i,e in enumerate(edges)}
    vmap={v:i for i,v in enumerate(vertices)}
    planar, emb=nx.check_planarity(g)
    assert planar
    done=set(); faces=[]
    for u in vertices:
        for v in emb.neighbors_cw_order(u):
            if (u,v) not in done:
                faces.append(emb.traverse_face(u,v,mark_half_edges=done))
    d0=np.zeros((len(edges),len(vertices)))
    d1=np.zeros((len(faces),len(edges)))
    for k,(u,v) in enumerate(edges):
        d0[k,vmap[u]]=-1;d0[k,vmap[v]]=1
    for k,f in enumerate(faces):
        for u,v in zip(f,f[1:]+f[:1]):
            d1[k,emap[tuple(sorted((u,v)))]]=1 if u<v else -1
    assert np.linalg.norm(d1@d0)==0
    return d0,d1


def main():
    rng=np.random.default_rng(11082026)
    blocks=[]; desc=[]
    for name,g in SOLIDS:
        d0,d1=coboundary(g)
        W=sla.null_space(d0.T)
        assert W.shape[1]==d1.shape[0]-1
        A=W.T@d1.T@d1@W
        eig=np.linalg.eigvalsh(A)
        desc.append((name,d0.shape[1],d0.shape[0],d1.shape[0],W.shape[1],eig[0]))
        blocks.append(A)
    A=sla.block_diag(*blocks)
    eig,V=sla.eigh(A)
    mu=3-sqrt(5)
    assert A.shape==(45,45)
    assert abs(eig[0]-mu)<1e-12
    assert np.count_nonzero(abs(eig-mu)<1e-10)==3
    g=V[:,0];h=V[:,1]
    assert abs(np.dot(g,A@g)-mu)<1e-11
    # Energy-dual inequality; sharp at F=A^{-1} J and at J=g.
    for _ in range(100):
        J=rng.normal(size=45);F=rng.normal(size=45)
        chi=J@sla.solve(A,J,assume_a='pos')
        lhs=(J@F)**2
        rhs=chi*(F@A@F)
        assert lhs<=rhs+1e-9*max(lhs,rhs,1)
        assert chi<=((J@J)/mu)*(1+1e-12)
    chi0=g@sla.solve(A,g,assume_a='pos')
    assert abs(chi0-1/mu)<1e-12
    F=sla.solve(A,g,assume_a='pos')
    assert abs((g@F)**2-chi0*(F@A@F))<1e-12
    # Golden holonomy, on a 2D invariant low-curvature eigenspace.
    phi=(1+sqrt(5))/2
    theta=2*pi/(phi*phi)
    n=24; tau=1.
    P=np.outer(g,g)+np.outer(h,h)
    Jrot=np.outer(h,g)-np.outer(g,h)
    U=np.eye(45)+(cos(theta)-1)*P+sin(theta)*Jrot
    assert np.linalg.norm(U.T@U-np.eye(45))<1e-12
    assert np.linalg.norm(A@U-U@A)<1e-11
    vals=np.array([mu+4*tau*sin((2*pi*m/n-theta)/2)**2 for m in range(n)])
    best=int(np.argmin(vals));helical=vals[best];response=1/helical
    xs=np.array([cos(2*pi*best*k/n)*g+sin(2*pi*best*k/n)*h for k in range(n)])
    energy=sum(x@A@x for x in xs)+tau*sum(np.linalg.norm(xs[(k+1)%n]-U@xs[k])**2 for k in range(n))
    assert abs(energy/sum(x@x for x in xs)-helical)<1e-11
    # Hidden response Schur complement, H=3 P_3 + 5 P_5.
    H=np.diag([3.]*4+[5.]*4)
    t=np.zeros(8);t[0]=1
    crit=sqrt(3*mu)
    sampled=[]
    for b in (0., 1., 1.4, 1.5):
        B=b*np.outer(g,t)
        M=np.block([[A,B],[B.T,H]])
        assert np.linalg.eigvalsh(M)[0]>0
        Jbig=np.r_[g, np.zeros(8)]
        exact=Jbig@sla.solve(M,Jbig,assume_a='pos')
        bound=1/(mu-b*b/3)
        assert abs(exact-bound)<2e-9
        sampled.append((b,mu-b*b/3,exact))
    # Two-sector KMS stationary probabilities do NOT fix dynamical rate.
    delta=3/20-80*pi/(1053*phi)
    p5=delta*delta/(1+delta*delta);p3=1-p5
    k=np.array([-p5,p3])
    assert abs(p3*k[0]+p5*k[1])<1e-15
    k_norm2=p3*p5
    rates=[]
    for c in (1.,.001,.000001):
        L=np.array([[c*p5,-c*p5],[-c*p3,c*p3]])
        assert np.linalg.norm(L@k-c*k)<1e-15
        rates.append((c,k_norm2/c))
    # Source-selective uniform H^-1 without uniform spectral gap.
    overlap=[]
    for eps in (1e-2,1e-4,1e-8):
        L=np.diag([eps,1.]);Js=np.array([sqrt(eps),1.]);Jbad=np.array([1.,1.])
        good=Js@np.linalg.solve(L,Js)
        bad=Jbad@np.linalg.solve(L,Jbad)
        assert abs(good-2)<1e-8
        overlap.append((eps,good,bad))
    print('Five-solid co-closed curvature operator')
    for row in desc:print(' %-12s V=%2d E=%2d F=%2d rank=%2d gap=%.12f'%row)
    print('A dimension=%d; mu=%.12f (mult=%d); sharp unit response=%.12f'% (len(A),mu,3,chi0))
    print('100 random energy-dual checks + exact equality PASS')
    print('Golden 24-track theta=%.12f, best m=%d, energy eigenvalue=%.12f, unit response=%.12f'%(theta,best,helical,response))
    print('Hidden coupling threshold b_critical=sqrt(3mu)=%.12f'%crit)
    for b,x,y in sampled:print(' b=%.2f, Schur gap lower=%.12f, geometry response=%.12f'%(b,x,y))
    print('Frozen equilibrium p5=%.12g, p3*p5=%.12g; variable dynamics:'%(p5,k_norm2))
    for c,x in rates:print(' rate c=%g, susceptibility=%.12g'%(c,x))
    print('Source overlap with closing spectral gap:')
    for eps,good,bad in overlap:print(' eps=%g: adaptive-source chi^2=%g; fixed-source chi^2=%g'%(eps,good,bad))
    print('ALL CHECKS PASSED')

if __name__=='__main__':main()
