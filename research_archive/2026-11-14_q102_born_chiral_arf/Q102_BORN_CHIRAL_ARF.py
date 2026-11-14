#!/usr/bin/env python3
"""Q102: a single Q101 Peierls action generates positive Born transition chirality.

This rebuilds the original all-five/190-cochain/50-vertex/hidden/64-history
moving source from Q101. It does NOT introduce a real Markov affinity.
Peierls hopping, Born measurement, and the golden comparison chart remain
declared model premises; physical photon/mass ARFs are not claimed.
"""
from collections import defaultdict
from pathlib import Path
import math,runpy
import numpy as np
import sympy as sy
from scipy.linalg import expm

base=Path(__file__).resolve().parents[1]/'2026-11-14_q101_moving_arf'/'MOVING_ARF_DERIVATION.py'
r=runpy.run_path(str(base))
ids=r['parts'][0];G=r['G'];Bb=r['B']
B=np.array(Bb.extract(ids,ids),dtype=np.int64)
A=np.array([[int(G.has_edge(ids[i],ids[j])) for j in range(30)] for i in range(30)],dtype=np.int64)
assert np.array_equal(A,abs(B))
assert np.all(A.sum(axis=1)==4) and np.all(B.sum(axis=1)==0)
assert np.count_nonzero(B==1)==60 and np.count_nonzero(B==-1)==60
assert np.array_equal(B,-B.T)
N=30
neighbors={i:[(j,int(B[i,j])) for j in range(N) if B[i,j]] for i in range(N)}

def path_phases(source,dest,max_length=4):
    dp={source:{0:1}}
    out=[]
    for length in range(1,max_length+1):
        new={}
        for v,counts in dp.items():
            for w,sgn in neighbors[v]:
                if w not in new:new[w]={}
                for winding,ways in counts.items():
                    key=winding+sgn
                    new[w][key]=new[w].get(key,0)+ways
        dp=new
        out.append(dp.get(dest,{}))
    return out

for i in range(N):
    for j,sgn in neighbors[i]:
        assert path_phases(i,j)==[
            {sgn:1},{-2*sgn:1},{sgn:7},
            {-2*sgn:12,-4*sgn:1,4*sgn:3}]
print('120/120 native oriented edges: exact length-1..4 winding counts PASS')

# Symbolic Laurent expansion: z=exp(i alpha), conjugation z->z^-1.
z=sy.Symbol('z',nonzero=True)
i,j=next((i,j) for i in range(N) for j in range(N) if B[i,j]==1)
h=[sum(n*z**w for w,n in d.items()) for d in path_phases(i,j)]
bar=lambda v:sy.expand(v.subs(z,1/z))
def coeff(k):
    return sy.expand(sum(((-sy.I)**a *sy.I**(k-a)
       *h[a-1]*bar(h[k-a-1])/(sy.factorial(a)*sy.factorial(k-a)))
       for a in range(1,k)))
C2,C3,C4,C5=[coeff(k) for k in (2,3,4,5)]
assert sy.simplify(C2-1)==0
assert sy.simplify(C3+(z**3-z**(-3))/(2*sy.I))==0
assert sy.simplify(C4+sy.Rational(25,12))==0
assert sy.simplify(C5-((z**5-z**(-5))+23*(z**3-z**(-3)))/(24*sy.I))==0
print('Exact positive-edge Born coefficients through fifth order: PASS')

# The Q101 real tilt can be analytically continued but is NOT assumed:
# det(zI-(A+uB)) has an exact new four-factor polynomial.
l=sy.Symbol('lambda')
for t in (sy.Rational(1,7),sy.Rational(2,5)):
    M=sy.Matrix(A)+t*sy.Matrix(B)
    polynomial=(l-4)*(l*l-2*l-4)**3*(l*l-1+5*t*t)**4*\
      (l**3+2*l*l+(8*t*t-4)*l-8*(1+t*t))**5
    assert sy.expand(M.charpoly(l).as_expr()-polynomial)==0
u=sy.symbols('u',real=True)
cubic=l**3+2*l*l+(8*u*u-4)*l-8*(1+u*u)
assert sy.factor(sy.discriminant(cubic,l))==-64*u*u*(32*u**4+11*u*u+96)
print('Independent real-tilt charpoly and nonreal modes: exact PASS')

phi=(1+math.sqrt(5))/2
epsilon=math.pi/(3*phi**12)
for alpha in (0.3,0.1,epsilon/24):
    H=math.cos(alpha)*A+1j*math.sin(alpha)*B
    assert np.linalg.norm(H-H.conj().T)<1e-12
    phase=np.imag(np.conj(H)*(H@H))
    assert np.max(abs((phase+B*math.sin(3*alpha))*A))<1e-12
    for tau in (0.01,0.03,0.05):
        U=expm(-1j*tau*H)
        T=abs(U)**2
        assert np.max(abs(T.sum(axis=0)-1))<1e-11
        assert np.max(abs(T.sum(axis=1)-1))<1e-11
        j=float(np.sum(B*T)/30)
        fifth=(-4*math.sin(3*alpha)*tau**3
              +(23*math.sin(3*alpha)+math.sin(5*alpha))*tau**5/3)
        assert abs(j-fifth)<20*tau**7,(alpha,tau,j,fifth)
        assert abs(j)>1e-15
        if tau==0.03:print('alpha',alpha,'tau',tau,'Born current',j,'fifth series',fifth)
print('RESULT: J(tau,a)=-4 sin(3a)tau^3+[23 sin(3a)+sin(5a)]tau^5/3+O(tau^7)')
print('24-clock: 24J=-96 sin(epsilon/8)tau^3')
print('  +8[23 sin(epsilon/8)+sin(5epsilon/24)]tau^5+O(tau^7)')
print('Golden exact J third derivative = -24 sin(epsilon/8)')
print('Peierls/Born are declared physics premises. Physical mass/alpha ARFs OPEN.')
print('Q102 BORN CHIRAL RESPONSE CERTIFICATE: PASS')
