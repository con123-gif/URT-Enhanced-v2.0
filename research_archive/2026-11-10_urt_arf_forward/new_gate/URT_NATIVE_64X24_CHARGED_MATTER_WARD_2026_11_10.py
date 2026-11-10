#!/usr/bin/env python3
"""Exact type-correct U(1)^5 Wilson coupling of original 64-history K64
and native 24-clock with original charge q=2 and r=pi/e. Tests full
finite gauge covariance, charged-current Ward identity, and 2nd-order
Wilson contact. No physical ARF values used; the collective five-solid
clock action is an extension, not the full 190-cochain physical action.
"""
import numpy as np
from itertools import combinations
from math import pi,e,sqrt

N=5; T=24; H=64; q=2; r=pi/e; phi=(1+sqrt(5))/2
pairs=list(combinations(range(6),2))
K=15*np.eye(H,dtype=float)
for i,j in pairs:
    for h in range(H): K[h,h^(1<<i)^(1<<j)]-=1
assert np.max(np.abs(K-K.T))==0
E=np.linalg.eigvalsh(K)
assert np.max(np.abs(E-np.repeat([0.,10.,16.,18.],[2,12,30,20])))<1e-12
# Unfitted history K, 24-clock q=2 and original golden phase.
rng=np.random.default_rng(20261110)
psi=(rng.normal(size=(N,T,H))+1j*rng.normal(size=(N,T,H)))/sqrt(2*H)
A=np.full((N,T),2*pi/phi**2)+rng.normal(scale=.08,size=(N,T))
lam=rng.normal(scale=.25,size=(N,T))

def shift(x):return np.roll(x,-1,axis=1)
def unshift(x):return np.roll(x,1,axis=1)
def action(A,psi):
    u=np.exp(1j*q*A)
    d=u[:,:,None]*shift(psi)-psi
    hist=np.einsum('sth,hk,stk->',psi.conj(),K,psi,optimize=True).real
    return hist+r*r*np.vdot(d,d).real

def current_and_EL(A,psi):
    u=np.exp(1j*q*A)
    z=np.sum(psi.conj()*(u[:,:,None]*shift(psi)),axis=2)
    J=2*q*r*r*np.imag(z)
    E=np.einsum('hk,stk->sth',K,psi,optimize=True)
    E+=r*r*(2*psi-u[:,:,None]*shift(psi)-np.conj(unshift(u))[:,:,None]*unshift(psi))
    return J,E,z

S0=action(A,psi)
A2=A+shift(lam)-lam
psi2=np.exp(-1j*q*lam)[:,:,None]*psi
assert abs(action(A2,psi2)-S0)<2e-11
J,E,z=current_and_EL(A,psi)
# Ward: D^T J + 2q Im(E^* psi) = 0, pointwise for every solid and time.
ward=unshift(J)-J+2*q*np.imag(np.sum(E.conj()*psi,axis=2))
assert np.max(np.abs(ward))<1e-11
# Link current is first derivative; Wilson contact is second derivative.
s=2;t=7;h=1e-4
AA=A.copy();AA[s,t]+=h
BB=A.copy();BB[s,t]-=h
def local_link(a):
    d=np.exp(1j*q*a)*psi[s,(t+1)%T]-psi[s,t]
    return r*r*np.vdot(d,d).real
jfd=(local_link(A[s,t]+h)-local_link(A[s,t]-h))/(2*h)
contactfd=(local_link(A[s,t]+h)-2*local_link(A[s,t])+local_link(A[s,t]-h))/(h*h)
contact=2*q*q*r*r*np.real(z[s,t])
assert abs(jfd-J[s,t])<1e-7
assert abs(contactfd-contact)<2e-6
# A fixed nonzero charged-linear source fails the gauge Ward identity.
# It must transform as charged matter or be dressed with a Wilson path.
source=np.zeros_like(psi);source[0,0,0]=1
linear=lambda v:-2*np.vdot(source,v).real
assert abs(linear(psi2)-linear(psi))>1e-6
# Gauge covariance restored if the external source is a charged section.
source2=np.exp(-1j*q*lam)[:,:,None]*source
assert abs(np.vdot(source2,psi2)-np.vdot(source,psi))<1e-12
print('native six-bit history K spectrum:',[(0,2),(10,12),(16,30),(18,20)])
print('all five collective Platonic clock channels; original q=2, Nclock=24, r=pi/e, golden theta')
print('full 5x24x64 charged-matter Wilson action gauge variation',action(A2,psi2)-S0)
print('exact charged-current local Ward max residual',np.max(np.abs(ward)))
print('Wilson current analytic/finite diff',J[s,t],jfd)
print('Wilson contact analytic/finite diff',contact,contactfd)
print('fixed neutral history source is NOT a gauge-covariant charged-linear source')
print('a transforming charged source section restores the Ward identity; charge embedding remains unproved')
print('PASS typed native 64x24 Wilson action with all five collective solid channels')