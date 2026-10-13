"""Exact A5 H64 isotypic and conditional BKM dark-information audit.

No observational parameters fit. A numerical H64 matrix below is an explicit
mathematical witness, NOT the physical history operator: its A,B,D blocks have
not been uniquely recovered from the Cathedral microscopic dynamics.
"""
import math
import numpy as np
import mpmath as mp
mp.mp.dps=60
phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
eta=-math.log(Delta)
p=Delta**2/(1+Delta**2)
chi=8*eta*(1+Delta**2)/(1-Delta**2)
a=(1-p)/4
b=p/4
assert abs(chi*(a-b)/(math.log(a)-math.log(b))-1)<1e-13

# All five irreps have multiplicity four in full H64.
d=[1,3,3,4,5]; v=[2,1,1,0,1]; h=[2,3,3,4,3]
assert sum(x*y for x,y in zip(d,v))==13
assert sum(x*y for x,y in zip(d,h))==51
assert all(x+y==4 for x,y in zip(v,h))
assert sum(x*y for x,y in zip(v,h))==13
assert sum(x*(x+1)//2 for x in h)==31
# Character identity of A5: Sym^2(4)=1+4+5 (dimension 10).
sizes=np.array([1,15,20,12,12])
sym4=np.array([10,2,1,0,0])
chars=np.array([[1,1,1,1,1],[3,-1,0,phi,1-phi],
 [3,-1,0,1-phi,phi],[4,0,1,-1,-1],[5,1,-1,0,0]])
mult=sizes@(sym4*chars).T/60
assert np.allclose(mult,[1,0,0,1,1])

# 64x64 concrete A5-equivariant POSITIVE witness, explicitly not physical.
blocks=[];vi=[];hi=[]; offset=0
for dd,nv,nh in zip(d,v,h):
    A=np.diag(13+np.arange(nv,dtype=float))
    D=np.diag(3+np.arange(nh,dtype=float))
    B=Delta*np.fromfunction(lambda i,j:1/(1+i+j),(nv,nh))
    block=np.kron(np.block([[A,B],[B.T,D]]),np.eye(dd))
    blocks.append(block)
    vi.extend(range(offset,offset+nv*dd))
    hi.extend(range(offset+nv*dd,offset+(nv+nh)*dd))
    offset+=block.shape[0]
K=np.zeros((64,64)); pos=0
for block in blocks:
    n=block.shape[0];K[pos:pos+n,pos:pos+n]=block;pos+=n
assert np.linalg.eigvalsh(K).min()>0
V=K[np.ix_(vi,vi)];D=K[np.ix_(hi,hi)];B=K[np.ix_(vi,hi)]
Keff=V-B@np.linalg.solve(D,B.T)
error=np.linalg.norm(np.linalg.inv(Keff)-np.linalg.inv(K)[np.ix_(vi,vi)])
assert error<1e-11
# 16 four-representation H51 dimensions have identically zero B columns.
start=sum(dim*nm for dim,nm in zip(d[:3],h[:3]))
assert np.linalg.norm(B[:,start:start+16])<1e-13

# If one integrates a Gaussian hidden-four mode D4 (not a new entropy axiom),
# an A5-singlet log determinant can arise, even though its linear B is zero.
D4=np.diag([3.,5.,3.,5.]) # Witness values, not recovered physical entries
q1=2*np.trace(np.linalg.inv(D4))
q2=-2*np.trace(np.linalg.inv(D4)@np.linalg.inv(D4))
assert np.isclose(q1,32/15) and np.isclose(q2,-136/225)

# Conditional scale-ladder test: squared gradient of the first-order
# radial exponential times a BKM quadratic stiffness naturally selects q=2.
scale=mp.pi/mp.e;step=mp.log(scale)
lam=6+mp.sqrt(5)
def Kgrad(r):
    r=mp.mpf(r); n0=int(mp.floor(mp.log(2*lam*r)/step))
    return step*mp.fsum((lam*mp.exp(-n*step))**2
        *mp.exp(-2*lam*r*mp.exp(-n*step))
        for n in range(n0-350,n0+351))
for r in ['0.0001','1','10','1000000']:
    assert abs(4*mp.mpf(r)**2*Kgrad(r)-1)<mp.mpf('1e-24')
amp=2*abs(mp.gamma(2+2j*mp.pi/step))
print('Delta',Delta,'eta',eta,'BKM stiffness chi',chi)
print('H64 = 4 copies of irreps 1,3,3prime,4,5')
print('visible/history equivariant couplings',13,'hidden symmetric entries',31)
print('hidden four-irrep dimensions without linear visible bridge',16)
print('Sym^2(4) scalar multiplicity',1)
print('Schur inverse error (witness ONLY)',error)
print('Hidden determinant witness derivatives',q1,q2)
print('BKM squared-gradient coefficient chi/8',chi/8)
print('first log-periodic harmonic',mp.nstr(amp,16))
print('Required for physical dark matter: baryon coupling, H51 matrix, stress, lensing.')
print('PASS: exact finite identities and explicitly conditional scale result')
