"""Exact moment-based discrete-scale bounds; actual native phase sequence diagnostics."""
from fractions import Fraction as F
from math import factorial, sqrt, pi, e, log
from itertools import product
import numpy as np

# Rational enclosures of pi/e, independent of float arithmetic.
def atan_bounds(q,n):
    t=F(1,q)
    s=sum((-1)**k*t**(2*k+1)/F(2*k+1) for k in range(n))
    u=s+(-1)**n*t**(2*n+1)/F(2*n+1)
    return min(s,u),max(s,u)
a,b=atan_bounds(5,24); c,d=atan_bounds(239,12)
p_lo,p_hi=16*a-4*d,16*b-4*c
e_lo=sum(F(1,factorial(k)) for k in range(19));e_hi=e_lo+F(20,19*factorial(19))
alpha_lo,alpha_hi=p_lo/e_hi,p_hi/e_lo
assert alpha_lo>1 and alpha_lo**2>F(4,3) # alpha > sqrt(4/3), strict positive averaged w
# finite cubic N>=2: m1=6(1-1/N), m2=m1^2+m1+variance.
# v=6/N*(1-2/N). In x=1/N, (4/3)m1²-m2=6(1-2x)^2>=0.
# Check exact coefficients.
for n in range(2,200):
    x=F(1,n);m=6*(1-x);v=6*x*(1-2*x);m2=m*m+m+v
    assert F(4,3)*m*m-m2==6*(1-2*x)**2
# bound from spectral moments is E/M>=m1^1.5/sqrt(m2).
# Therefore e_next/e_prev lies in [sqrt(m1²/m2),sqrt(m2/m1²)].
alpha=pi/e;theta=2*pi/((1+sqrt(5))/2)**2
B=sqrt(4/3);B_inf=sqrt(7/6)
print('alpha enclosure',float(alpha_lo),float(alpha_hi));print('all N>=2 exact ratio bound squared 4/3; bulk ratio squared 7/6')
for lab,bound in [('finite',B),('bulk',B_inf)]:
    print(lab,'density step ratio range',alpha**-4/bound,alpha**-4*bound,'averaged w range',1/3-log(bound)/(3*log(alpha)),1/3+log(bound)/(3*log(alpha)))

def lap(n,f):
    L=np.zeros((n**3,n**3),complex)
    for x,y,z in product(range(n),repeat=3):
        i=x+n*(y+n*z)
        for X,Y,Z,p in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
            if max(X,Y,Z)>=n:continue
            j=X+n*(Y+n*Z);u=np.exp(1j*f*p)
            L[i,i]+=1;L[j,j]+=1;L[i,j]-=u;L[j,i]-=u.conjugate()
    return L
for n in (2,4,6,8):
    m=6*(1-1/n);v=6/n*(1-2/n);m2=m*m+m+v;bound=sqrt(m2)/m
    for s in (0,1):
        energies=[]
        for k in range(25):
            f=pi*s-(k+1)*theta
            L=lap(n,f);lam=np.linalg.eigvalsh(L)
            assert abs(lam.mean()-m)<1e-11 and abs((lam**2).mean()-m2)<1e-10
            assert lam.min()>-1e-10
            u=np.sqrt(np.maximum(lam,0)).mean()
            assert m**1.5/sqrt(m2)-1e-10<=u<=sqrt(m)+1e-10
            energies.append(u)
        r=np.asarray(energies[1:])/energies[:-1];w=1/3-np.log(r)/(3*log(alpha))
        assert np.max(r)<=bound+1e-10 and np.min(r)>=1/bound-1e-10
        assert np.all(w>0)
        print(f'N={n} sector={s} 24 steps: u=[{min(energies):.10f},{max(energies):.10f}] w_avg=[{min(w):.10f},{max(w):.10f}]')
print('PASS native recurrence diagnostics and exact all-phase, all-size moment bound')
