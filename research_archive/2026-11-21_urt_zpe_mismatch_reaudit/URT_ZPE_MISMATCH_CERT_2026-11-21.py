#!/usr/bin/env python3
"""Exact-first audit: finite prime-loop ZPE vs original master-state entropy.
No fitted constants or claim that the physical vacuum is derived.
"""
import sympy as sp
import mpmath as mp
mp.mp.dps=60
z=sp.symbols('z',nonzero=True);x=sp.symbols('x')
A=sp.zeros(4)
for i,j,w in ((0,1,1),(0,2,1),(1,3,z),(2,3,1)):
    A[i,j]=sp.sympify(w);A[j,i]=1/sp.sympify(w)
L=2*sp.eye(4)-A
assert sp.cancel(sp.expand(A.charpoly(x).as_expr()-(x**4-4*x**2+2-z-1/z)))==0
for r,t in ((0,4),(1,8),(2,24),(3,80),(4,280+4*(z+1/z))):
    assert sp.simplify(sp.trace(L**r)-t)==0
phi=(1+mp.sqrt(5))/2
Delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
p=Delta**2/(1+Delta**2)
s=mp.log(4)-p*mp.log(p)-(1-p)*mp.log(1-p)
theta=2*mp.pi/phi**2
def eig(f):
    return sorted([2+2*mp.cos(f/4),2-2*mp.cos(f/4),
                   2+2*mp.sin(f/4),2-2*mp.sin(f/4)])
lp=eig(theta);lm=eig(mp.pi-theta)
d=mp.fsum(mp.sqrt(v) for v in lp)-mp.fsum(mp.sqrt(v) for v in lm)
ratio=2*mp.pi*d/s
assert abs(ratio-mp.mpf('0.9561573731665629838389979164'))<mp.mpf('1e-27')
assert s>mp.log(4)
u,v=sp.symbols('u v')
rho=sp.diag(*([u]*4+[v]*4))
H=sp.diag(L,L.subs(z,-z))
assert rho*H==H*rho
wplus=(1-p)/4;wminus=p/4
for r,target in ((1,2),(2,6),(3,20)):
    moment=wplus*sp.trace(L**r).subs(z,mp.e**(-1j*theta))+wminus*sp.trace(L**r).subs(z,-mp.e**(-1j*theta))
    assert abs(complex(sp.N(moment,35)).real-target)<1e-12
moment4=70+2*(1-Delta**2)/(1+Delta**2)*mp.cos(theta)
assert abs(moment4-(wplus*(280+8*mp.cos(theta))+wminus*(280-8*mp.cos(theta))))<mp.mpf('1e-54')
beta=-2*mp.log(Delta)
weights=[mp.exp(-beta*v) for v in lp+lm]; Z=mp.fsum(weights)
Sg=-mp.fsum((w/Z)*mp.log(w/Z) for w in weights)
assert abs(Sg-mp.mpf('0.10756033221053473434'))<mp.mpf('1e-19')
assert s-Sg>1
levels=lp+lm
assert min(abs(levels[i]-levels[j]) for i in range(8) for j in range(i))>mp.mpf('1e-30')
print('PASS: finite-magnetic polynomial, exact moments, stationarity, and KMS entropy obstruction')
for label,num in [('Delta',Delta),('s_master',s),('ZPE_relative_d',d),('horizon_ratio',ratio),
 ('horizon_deficit',1-ratio),('original_beta',beta),('magnetic_Gibbs_entropy',Sg),
 ('joint_fourth_moment',moment4)]:
    print(label,mp.nstr(num,30))
print('IMPORTANT: stationarity follows trivially from block-scalar rho; no physical ZPE/dark-energy claim.')
