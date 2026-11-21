#!/usr/bin/env python3
"""Independent symbolic/numeric audit: original URT 95.6157% ZPE ratio.
Checks consistency of 4-site magnetic oscillator vs 8-state URT KMS entropy.
No physical ZPE/dark energy proof or fitted constants.
"""
import sympy as sp
import mpmath as mp
mp.mp.dps=65
phi=(1+mp.sqrt(5))/2
theta=2*mp.pi/phi**2
delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
p=delta**2/(1+delta**2)
s=-p*mp.log(p)-(1-p)*mp.log(1-p)+mp.log(4)
beta=-2*mp.log(delta)
x=sp.Symbol("x")
z=sp.Symbol("z",nonzero=True)
A=sp.Matrix([[0,1,1,0],[1,0,0,z],[1,0,0,1],[0,1/z,1,0]])
L=2*sp.eye(4)-A
assert sp.simplify(A.charpoly(x).as_expr()-(x**4-4*x**2+2-z-1/z))==0
for k,v in ((0,4),(1,8),(2,24),(3,80)):
    assert sp.simplify(sp.trace(L**k)-v)==0
assert sp.simplify(sp.trace(L**4)-(280+4*(z+1/z)))==0
r=sp.Symbol("r",positive=True)
rho8=sp.diag(*([1/(4*(1+r))]*4),*([r/(4*(1+r))]*4))
H8=sp.diag(L,L.subs(z,-z))
assert rho8*H8==H8*rho8

def eig(eps):
    f=theta if eps==1 else mp.pi-theta
    return sorted((2-2*mp.cos(f/4),2+2*mp.cos(f/4),
                   2-2*mp.sin(f/4),2+2*mp.sin(f/4)))
plus,minus=eig(1),eig(-1)
d=sum(mp.sqrt(v) for v in plus)-sum(mp.sqrt(v) for v in minus)
ratio=2*mp.pi*d/s
assert abs(ratio-mp.mpf("0.9561573731665629838389979164"))<mp.mpf("1e-27")
assert s>mp.log(4)
levels=sorted(plus+minus)
assert min(levels[i+1]-levels[i] for i in range(7))>mp.mpf(".1")
boltz=[mp.exp(-beta*(v-levels[0])) for v in levels]
weights=[v/sum(boltz) for v in boltz]
s_gibbs=-sum(w*mp.log(w) for w in weights)
assert mp.mpf(".10755")<s_gibbs<mp.mpf(".10757")
for k,v in ((1,2),(2,6),(3,20)):
    moment=((1-p)*sum(t**k for t in plus)+p*sum(t**k for t in minus))/4
    assert abs(moment-v)<mp.mpf("1e-55")
moment4=((1-p)*sum(t**4 for t in plus)+p*sum(t**4 for t in minus))/4
assert abs(moment4-(70+2*(1-2*p)*mp.cos(theta)))<mp.mpf("1e-55")
print("PASS symbolic flux polynomial, L moments 0..4, [rho*,H8]=0")
print("PASS ratio =",mp.nstr(ratio,28))
print("URT master entropy =",mp.nstr(s,24))
print("magnetic Gibbs entropy at original beta =",mp.nstr(s_gibbs,24))
print("horizon kappa needed for a fitted 100% =",mp.nstr(1/ratio,24))
print("joint fourth moment =",mp.nstr(moment4,24))
print("NO PHYSICAL CLOSURE: two unrelated state/energy assignments were divided")
