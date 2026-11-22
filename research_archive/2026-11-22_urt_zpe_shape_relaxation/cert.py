#!/usr/bin/env python3
"""Exact carrier-preserving cut/rejoin path in the native cyclic flux lattice.
All numerical tests below are finite diagnostics; analytic bounds in report.
"""
from itertools import product
from math import pi,sqrt,cos
import numpy as np
from scipy.linalg import eigvalsh, block_diag

def graph(shape,f,spacing=(1,1,1),b=None):
    nx,ny,nz=shape; M=nx*ny*nz
    coords=list(product(range(nx),range(ny),range(nz)))
    ix={v:i for i,v in enumerate(coords)}
    L=np.zeros((M,M),complex); S=np.zeros_like(L); seams=0
    for v in coords:
        x,y,z=v; i=ix[v]
        for a,(w,k) in enumerate((((x+1,y,z),z),((x,y+1,z),x),((x,y,z+1),y))):
            if w not in ix:continue
            j=ix[w];p=np.exp(1j*f*k);weight=spacing[a]**-2
            for A in ([L,S] if b is not None and w[a]%b==0 else [L]):
                A[i,i]+=weight;A[j,j]+=weight;A[i,j]-=weight*p;A[j,i]-=weight*p.conjugate()
            if b is not None and w[a]%b==0:seams+=1
    return L,S,seams,coords,ix

def common(A,shape,b,f,ix):
    order=[];ph=[]
    for o in product(*(range(0,s,b) for s in shape)):
        for u in product(range(b),repeat=3):
            order.append(ix[tuple(o[i]+u[i] for i in range(3))])
            ph.append(np.exp(1j*f*(o[2]*u[0]+o[0]*u[1]+o[1]*u[2])))
    z=np.asarray(ph)
    return z[:,None]*A[np.ix_(order,order)]*z.conj()[None,:]

def E(L):
    vals=eigvalsh(L,check_finite=False);assert vals[0]>0
    return np.sqrt(vals).sum(),vals[0]

def test(N,f):
    b=N//2; shape0=(N,)*3;shape1=(N//2,N,2*N);M=N**3
    assert np.prod(shape1)==M and b>=2
    Lb=graph((b,)*3,f)[0]; Eb,_=E(Lb); Ecut=8*Eb
    g=1.5*(1-cos(abs(f)/4)); B=[]; ends=[]; nlinks=[]
    target=block_diag(*([Lb]*8))
    for shape in (shape0,shape1):
        L,S,c,_,ix=graph(shape,f,b=b); Lc=common(L-S,shape,b,f,ix); Sc=common(S,shape,b,f,ix)
        assert np.max(abs(Lc-target))<2e-12
        assert abs(np.trace(Sc).real-2*c)<1e-10
        assert min(eigvalsh(Sc,check_finite=False))>-1e-10
        e,gap=E(L);assert gap>=g-1e-10
        J=e-Ecut;assert c/sqrt(12)-1e-9<=J<=c/sqrt(g)+1e-9
        if N<=8:
            for t in (0.,.25,.5,.75,1.):
                en,gg=E(target+t*Sc); assert gg>=g-1e-10
                assert Ecut-1e-9<=en<=e+1e-9
        B.append(Sc);ends.append(e);nlinks.append(c)
    Ls,Ss,cs,_,ixs=graph(shape0,f,spacing=(.5,1.,2.),b=b)
    stretched,_=E(Ls);cut_stretched=common(Ls-Ss,shape0,b,f,ixs)
    beta=np.log([.5,1.,2.]);Lsblock=graph((b,)*3,f,spacing=(.5,1.,2.))[0]
    assert np.max(abs(cut_stretched-block_diag(*([Lsblock]*8))))<3e-12
    old=E(Lsblock)[0]
    for t in (.75,.5,.25,0.):
        eb,gb=E(graph((b,)*3,f,spacing=np.exp(t*beta))[0])
        assert gb>=g/4-1e-10 and eb<=old+1e-9
        old=eb
    assert abs(old-Eb)<1e-9
    assert E(Lsblock)[0]*8<=stretched+1e-9;
    assert stretched>=ends[0]*(2+1+.5)/3-1e-9
    assert stretched>ends[1]
    print(f'N={N} sites={M} flux={f:+.9f} E_cube/M={ends[0]/M:.10f} E_relaxed/M={ends[1]/M:.10f} E_frozen/M={stretched/M:.10f} Ecut/M={Ecut/M:.10f} seams={nlinks} relaxation_gain/M={(stretched-ends[1])/M:.10f} shape_residual/M={(ends[1]-ends[0])/M:+.10f}',flush=True)
    return ends

if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for f in (-theta,pi-theta):
        for N in (4,8,12):test(N,f)
    print('PASS: same carrier number, exact common block gauge, positive seam interpolation, monotone block strain relaxation, reversible work bounds, lower relaxed energy')
