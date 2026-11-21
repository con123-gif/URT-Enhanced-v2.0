#!/usr/bin/env python3
"""Metric/flux response of unchanged native 3D golden-flux oscillator."""
import os
os.environ['OPENBLAS_NUM_THREADS']='2'
os.environ['OMP_NUM_THREADS']='2'
import numpy as np
from scipy.linalg import eigh
from math import pi,sqrt
import sys
THETA=2*pi/((1+sqrt(5))/2)**2
FPLUS=THETA; FMINUS=pi-THETA

def native(n,f):
    L=np.zeros((n**3,n**3),complex); J=np.zeros_like(L)
    for z in range(n):
        for y in range(n):
            for x in range(n):
                i=x+n*(y+n*z)
                for xx,yy,zz,pow in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
                    if max(xx,yy,zz)>=n:continue
                    j=xx+n*(yy+n*zz);p=np.exp(1j*f*pow)
                    L[i,i]+=1;L[j,j]+=1;L[i,j]-=p;L[j,i]=L[i,j].conjugate()
                    J[i,j]-=1j*pow*p;J[j,i]=J[i,j].conjugate()
    return L,J

def energy(n,f):
    L,_=native(n,f);return np.sqrt(eigh(L,eigvals_only=True)).sum()

def response(n,f):
    L,J=native(n,f);v,U=eigh(L)
    assert v[0]>0
    E=np.sqrt(v).sum(); Vi=(U/np.sqrt(v))@U.conj().T
    Ef=.5*np.einsum('ij,ji->',Vi,J).real
    t=1e-4
    dE=(energy(n,f+t)-energy(n,f-t))/(2*t)
    assert abs(Ef-dE)<1e-5*max(abs(Ef),1)
    deriv=(np.exp(-t)*energy(n,f*np.exp(2*t))-np.exp(t)*energy(n,f*np.exp(-2*t)))/(2*t)
    assert abs(deriv-(-E+2*f*Ef))<1e-5*max(E,1)
    return E/n**3,Ef/n**3,2*f*Ef/E

if __name__=='__main__':
    for n in ((2,4,6,8,10,12) if '--full' in sys.argv else (2,4,6,8)):
        ep,dp,tp=response(n,FPLUS); em,dm,tm=response(n,FMINUS)
        assert ep>em
        rel=(2*FPLUS*dp-2*FMINUS*dm)/(ep-em)
        print(f'N={n} E+/site={ep:.12f} E-/site={em:.12f} dE+/df/site={dp:.12f} dE-/df/site={dm:.12f}',flush=True)
        print(f'  Theta/rho (fixed proper B path) +={tp:.12f} -={tm:.12f}; mean w+={(1-tp)/3:.12f} w-={(1-tm)/3:.12f}; relative trace={rel:.12f}',flush=True)
        assert tp<2 and tm<2
    for ep,f in [(1,FPLUS),(-1,FMINUS)]:
        L,_=native(4,f); lam,U=eigh(L)
        for m in (0.,.01,1.,100.):
            q=lam+m*m; trace=np.sum(m*m/np.sqrt(q))/np.sum(np.sqrt(q))
            assert -1e-12<=trace<=1+1e-12
            print(f'mass-test sector={ep} m={m} theta/rho={trace:.12f}',flush=True)
    print('PASS: native metric+flux derivatives, two sector responses, fixed mass trace inequality regression; not a full URT matter theory.')
