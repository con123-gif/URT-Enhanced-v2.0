#!/usr/bin/env python3
"""No-fit 13^4 A4 Wilson photon beta^4/H4 Ward test, October 24, 2026.

Reimplements the leading beta^4 terms in the original October 17
continued_physics_work/photon/free_fock_photon.py. This is a finite
free-Fock source calculation, NOT the selected physical alpha(0).
"""
import itertools
import json
import math
from fractions import Fraction
import numpy as np

N=13
r=float(Fraction(355508034923519,10**15))
M=float(Fraction(790940592107124,10**15))
C=208   # 26 root-wall levels * sum_species (Q_e-normalized charge^2 * color)=26*8
B=np.vstack((np.eye(4),-np.ones((1,4))))
Q,_=np.linalg.qr(B)
E=Q.T@B
roots=[]
for i in range(5):
    for j in range(i+1,5):
        x=np.zeros(4)
        if i<4: x[i]+=1
        if j<4: x[j]-=1
        if next(v for v in x if v)<0: x*=-1
        roots.append(x)
roots=np.asarray(roots)
rootphys=roots@E.T
unitroots=rootphys/math.sqrt(2)
p=np.asarray(list(itertools.product(range(N),repeat=4)))*(2*math.pi/N)
ang=p@roots.T
sinp,cosp=np.sin(ang),np.cos(ang)
b=np.column_stack((-M+r*np.sum(1-cosp,axis=1),sinp@unitroots))
bsq=np.einsum('pa,pa->p',b,b)
assert len(p)==13**4 and len(roots)==10
assert abs(abs(np.linalg.det(E))-math.sqrt(5))<1e-13

def test_mode(n):
    q=np.array(n)*(2*math.pi/N)
    qroot=q@roots.T
    qphys=np.linalg.solve(E.T,q)
    shifted=(p+q)@roots.T
    bp=np.column_stack((-M+r*np.sum(1-np.cos(shifted),axis=1),
                         np.sin(shifted)@unitroots))
    mid=ang+qroot[None,:]/2
    vertex=np.concatenate((r*np.sin(mid)[:,:,None],
                           np.cos(mid)[:,:,None]*unitroots[None,:,:]),axis=2)
    sea=np.concatenate((r*cosp[:,:,None],
                        -sinp[:,:,None]*unitroots[None,:,:]),axis=2)
    a=np.einsum('pra,pa->pr',vertex,b)
    ap=np.einsum('pra,pa->pr',vertex,bp)
    c=C/(12*len(p))
    contact=c*np.sum(bsq[:,None]*
                np.einsum('pa,pra->pr',b,sea),axis=0)
    bubble=c*np.einsum('p,pra,psa->rs',
                       bsq+np.einsum('pa,pa->p',bp,bp)
                       -np.einsum('pa,pa->p',b,bp),
                       vertex,vertex,optimize=True)
    quart=c*(a.T@ap+ap.T@a)
    H=bubble+quart+np.diag(contact)
    ward=2*np.sin(qroot/2)
    residual=float(np.linalg.norm(H@ward))
    broken=float(np.linalg.norm((bubble+quart)@ward))
    J=rootphys*np.sinc(qroot/(2*math.pi))[:,None]
    Pi=J.T@H@J/math.sqrt(5)
    un=qphys/np.linalg.norm(qphys)
    U=np.linalg.svd(un[None,:])[2][1:].T
    lam=np.linalg.eigvalsh(U.T@Pi@U/(qphys@qphys))
    assert residual<1e-8 and float(np.linalg.norm(Pi@qphys))<1e-8
    assert broken>1
    return dict(mode=n,leading_beta4_transverse_eigenvalues=lam.tolist(),
                Ward_residual=residual,bubble_only_Ward_residual=broken)

if __name__=='__main__':
    rows=[test_mode(x) for x in ((1,0,0,0),(2,0,0,0),(1,1,0,0),(1,1,1,1))]
    print(json.dumps({'input_measured_alpha':False,'charge_wall_trace':C,
                      'physical_alpha_derived':False,'rows':rows},indent=2))
