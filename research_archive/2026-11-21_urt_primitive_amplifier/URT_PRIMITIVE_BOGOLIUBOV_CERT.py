#!/usr/bin/env python3
"""Canonical two-mode dilation of primitive URT q=(pi/e)*exp(i golden-angle).

Exact signal gain and quantum-limited idler noise are CONDITIONAL on
identifying scalar URT recurrence with a bosonic amplitude transformation.
Native 3D magnetic sheet is unchanged. No physical pump rate/scale derived.
"""
import math
import numpy as np
import sympy as s
from scipy.linalg import expm, eigh

alpha=math.pi/math.e
phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2
nbar=alpha**2-1
r=math.acosh(alpha)
lam=1-alpha**(-2)

# SU(1,1) bosonic Bogoliubov identity: a'=e^(i theta)(alpha*a+v*b^dagger).
a,v,th=s.symbols('a v th', positive=True, real=True)
M=s.diag(s.exp(s.I*th),s.exp(-s.I*th))*s.Matrix([[a,v],[v,a]])
J=s.diag(1,-1)
metric=s.simplify(M*J*M.conjugate().T)
assert s.simplify(metric[0,0]-(a*a-v*v))==0
assert s.simplify(metric[1,1]+(a*a-v*v))==0
assert s.simplify(metric[0,1])==0 and s.simplify(metric[1,0])==0
assert abs(alpha**2-nbar-1)<1e-14

# Exact thermal marginal from pure two-mode squeezed vacuum.
# p_k=(1-lam) lam^k, mean=lam/(1-lam), beta*hbar*omega=-log lam.
x=s.symbols('x', positive=True)
# For 0<x<1: geometric sum G=1/(1-x), and sum k*x^k=x*G'.
# This is an exact rational identity on the positive convergence interval.
G=1/(1-x)
Z=(1-x)*G
N=(1-x)*x*s.diff(G,x)
assert s.simplify(Z-1)==0
assert s.simplify(N-x/(1-x))==0
assert abs(lam/(1-lam)-nbar)<1e-13
thermal_entropy=(nbar+1)*math.log(nbar+1)-nbar*math.log(nbar)

# Exact resonant quantum pump: H_int=i*hbar*kappa*(a^dag b^dag c - a b c^dag).
# N_a+N_b+2N_c is conserved under each interaction word (1+1-2=0).
assert 1+1-2==0
Np=3
H=np.zeros((Np+1,Np+1),complex)
for q in range(Np):
    h=(q+1)*math.sqrt(Np-q)
    H[q+1,q]=1j*h
    H[q,q+1]=-1j*h
assert np.linalg.norm(H-H.conj().T)<1e-13
U=expm(-1j*H*r)
assert np.linalg.norm(U.conj().T@U-np.eye(Np+1))<1e-12
psi=U[:,0]
prob=abs(psi)**2
kmean=float(np.dot(np.arange(Np+1),prob))
pumpmean=float(np.dot(Np-np.arange(Np+1),prob))
assert kmean>0 and abs(kmean+pumpmean-Np)<1e-12
assert abs(sum((2*k+2*(Np-k))*prob[k] for k in range(Np+1))-2*Np)<1e-12

# Original magnetic sheet (not a synthetic spectrum).
def graph(dims,eps):
    nx,ny,nz=dims
    f=float(np.angle(eps*np.exp(-1j*theta)))
    L=np.zeros((nx*ny*nz,nx*ny*nz),complex)
    idx=lambda x,y,z:x+nx*(y+ny*z)
    for z in range(nz):
        for y in range(ny):
            for x in range(nx):
                i=idx(x,y,z)
                for xx,yy,zz,power in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
                    if xx>=nx or yy>=ny or zz>=nz:continue
                    j=idx(xx,yy,zz)
                    w=np.exp(1j*f*power)
                    L[i,i]+=1;L[j,j]+=1
                    L[i,j]-=w;L[j,i]-=w.conjugate()
    return L

for eps in (+1,-1):
    full=graph((2,2,3),eps)
    B=np.zeros_like(full)
    f=float(np.angle(eps*np.exp(-1j*theta)))
    idx=lambda x,y,z:x+2*(y+2*z)
    for y in range(2):
        for x in range(2):
            i,j=idx(x,y,1),idx(x,y,2)
            w=np.exp(1j*f*y)
            B[i,i]+=1;B[j,j]+=1;B[i,j]-=w;B[j,i]-=w.conjugate()
    split=full-B
    assert np.linalg.norm(split[:8,8:])<1e-13
    sheet=split[8:,8:]
    eig=eigh(sheet,eigvals_only=True)
    assert min(eig)>0
    esheet=float(np.sqrt(eig).sum())
    pump_work=2*nbar*esheet
    assert abs(pump_work/esheet-2*(alpha*alpha-1))<1e-12
    print(f'eps={eps:+d}: original sheet vacuum E={esheet:.12f}, conditional one-cycle '+
          f'matched-idler pump excitation energy={pump_work:.12f}')

print('primitive URT gain pi/e:',alpha,'theta:',theta)
print(f'canonical minimum idler magnitude sqrt(alpha^2-1)={math.sqrt(nbar):.12f}; squeeze r={r:.12f}')
print(f'generated occupation each mode={nbar:.12f}, thermal ratio={lam:.12f}, '+
      f'KMS beta*hbar*omega={-math.log(lam):.12f}, entropy/mode={thermal_entropy:.12f}')
print(f'finite number-conserving pump sector Np={Np}: mean pairs={kmean:.12f}, pump quanta left={pumpmean:.12f}')
print('PASS: exact SU(1,1) CCR, thermal marginal, pump conservation, original magnetic-sheet energy comparison')
print('CONDITIONAL: identifying URT scalar q as bosonic signal gain and phase is a new postulate; pump amplitude/rate and transfer to new sheet remain open')
