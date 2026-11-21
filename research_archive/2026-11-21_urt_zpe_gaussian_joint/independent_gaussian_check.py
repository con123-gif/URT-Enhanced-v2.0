#!/usr/bin/env python3
"""Independent SciPy covariance check for the standalone four-site URT magnetic oscillator."""
import math
import numpy as np
from scipy.linalg import eigh
phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2

def laplace(sign):
    z=sign*np.exp(-1j*theta)
    A=np.zeros((4,4),complex)
    for i,j,w in [(0,1,1),(0,2,1),(1,3,z),(2,3,1)]:
        A[i,j]=w;A[j,i]=np.conj(w)
    return 2*np.eye(4)-A

def realify(x):
    n=x.shape[0]
    z=np.block([[x.real,-x.imag],[x.imag,x.real]])
    ix=[q for i in range(n) for q in (i,i+n)]
    return z[np.ix_(ix,ix)]

def entropy(nu):
    ans=0.
    for x in nu:
        d=x-0.5
        if d>1e-13:
            ans+=(d+1)*np.log(d+1)-d*np.log(d)
    return ans

def calc(sign,gauge=False):
    L=laplace(sign)
    if gauge:
        D=np.diag(np.exp(1j*np.array([0,theta/7,theta/3,theta/2])))
        L=D@L@D.conj().T
    eigen,u=eigh(L)
    assert np.min(eigen)>0
    W=(u*np.sqrt(eigen))@u.conj().T
    V=(u*(1/np.sqrt(eigen)))@u.conj().T
    ids=[0,1]
    covQ=realify(V[np.ix_(ids,ids)])/2
    covP=realify(W[np.ix_(ids,ids)])/2
    nus=np.sqrt(np.linalg.eigvals(covQ@covP).real)
    assert np.min(nus)>=0.5-1e-11
    return float(np.sqrt(eigen).sum()),float(entropy(nus)),sorted(nus)

for sign,E,S in [(1,5.203810807053426,0.542933527495885),
                 (-1,4.992836201484007,1.438786007428436)]:
    a=calc(sign);b=calc(sign,True)
    assert abs(a[0]-E)<1e-12 and abs(a[1]-S)<1e-12
    assert abs(a[0]-b[0])<1e-12 and abs(a[1]-b[1])<1e-12
    assert np.allclose(a[2],b[2],rtol=0,atol=1e-11)
    print('eps',sign,'E0',a[0],'entropy',a[1])
print('PASS: independent numerical Gaussian/gauge check')
