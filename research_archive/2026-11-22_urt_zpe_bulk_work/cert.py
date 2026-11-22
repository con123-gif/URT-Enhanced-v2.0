#!/usr/bin/env python3
"""3D native golden magnetic vacuum: rigorous bulk sign, plus finite work diagnostics."""
from fractions import Fraction as Q
from math import isqrt, factorial, pi, sqrt
from collections import Counter
from itertools import product
S=10**32
class I:
    def __init__(self,l,h=None):
        l=Q(l);h=l if h is None else Q(h)
        self.lo=Q(l.numerator*S//l.denominator,S)
        self.hi=Q(-((-h.numerator*S)//h.denominator),S)
        assert self.lo<=self.hi
    def __add__(a,b):
        b=it(b);return I(a.lo+b.lo,a.hi+b.hi)
    __radd__=__add__
    def __neg__(a): return I(-a.hi,-a.lo)
    def __sub__(a,b): return a+-it(b)
    def __rsub__(a,b): return it(b)+-a
    def __mul__(a,b):
        b=it(b);v=[x*y for x in (a.lo,a.hi) for y in (b.lo,b.hi)];return I(min(v),max(v))
    __rmul__=__mul__
    def __truediv__(a,b):
        b=it(b);assert b.lo*b.hi>0;return a*I(1/b.hi,1/b.lo)
    def __rtruediv__(a,b):return it(b)/a
    def __pow__(a,n):
        assert n>=0 and isinstance(n,int)
        out=I(1)
        for j in range(n):out=out*a
        return out
    def sqrt(a):
        assert a.lo>=0
        def floor(x):return isqrt(x.numerator*S*S//x.denominator)
        return I(Q(floor(a.lo),S),Q(floor(a.hi)+1,S))
    def __repr__(a):return f'[{float(a.lo):.15f},{float(a.hi):.15f}]'
def it(x):return x if isinstance(x,I) else I(x)
def arctan(q,n):
    z=Q(1,q);s=sum((-1)**k*z**(2*k+1)/Q(2*k+1) for k in range(n));r=z**(2*n+1)/Q(2*n+1)
    return I(s,s+r) if n%2==0 else I(s-r,s)
def cosi(x,n=24):
    assert x.lo>=0 and x.hi<3
    s=sum((Q((-1)**k,factorial(2*k))*x**(2*k) for k in range(n+1)),I(0))
    r=x.hi**(2*n+2)/Q(factorial(2*n+2));return s+I(-r,r)

def moments():
    # Ux=e^(if z), Uy=e^(if x), Uz=e^(if y); track oriented Wilson exponent.
    steps=((1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1))
    for length,expected in ((2,{0:6}),(4,{0:66,1:12,-1:12})):
        c=Counter()
        for walk in product(steps,repeat=length):
            x=y=z=a=0
            for dx,dy,dz in walk:
                a+=dx*z+dy*x+dz*y;x+=dx;y+=dy;z+=dz
            if (x,y,z)==(0,0,0):c[a]+=1
        assert c==expected,(c,expected)

def gauss(c):
    b=5+4*c;s=(6+b).sqrt();w=3/(6+b)
    return w*((6-s).sqrt()+(6+s).sqrt())+b/(6+b)*I(6).sqrt()
def radau(c,a):
    a=it(a);b=5+4*c;d=a+b*(6-a)/((6-a)**2-6)
    sm=12+d-a;prod=(30*d-6*b)/a
    r=(sm*sm-4*prod).sqrt();l=(sm-r)/2;h=(sm+r)/2
    assert a.hi<l.lo and l.hi<h.lo and h.hi<12
    def wt(x,y,z):return ((x-6)*(x-d)-b)/((x-y)*(x-z))
    wa,wl,wh=wt(a,l,h),wt(l,a,h),wt(h,a,l)
    assert min(wa.lo,wl.lo,wh.lo)>0 and (wa+wl+wh).lo<=1<=(wa+wl+wh).hi
    return wa*a.sqrt()+wl*l.sqrt()+wh*h.sqrt()
def rigorous():
    moments();p=16*arctan(5,28)-4*arctan(239,14);phi=(1+I(5).sqrt())/2;theta=2*p/(phi*phi);c=cosi(theta)
    gp=6*(1-cosi(theta/4));gm=6*(1-cosi((p-theta)/4));assert gp.lo>1 and gm.lo>Q(1,10)
    lp,up=radau(c,1),gauss(c);lm,um=radau(-c,Q(1,10)),gauss(-c)
    lower=lp.lo-um.hi;upper=up.hi-lm.lo
    assert lower>Q(2076,10**6) and upper<Q(181,10**4)
    print('exact enclosed bulk gaps:',gp,gm)
    print('plus Radau',lp,'Gauss',up,'minus Radau',lm,'Gauss',um)
    print('CERTIFIED 3D bulk ZPE difference:',float(lower),'< delta <',float(upper))
    print('PASS exact rational bounds; no numerical approximation determines proof')
def finite():
    import numpy as np
    theta=2*pi/((1+sqrt(5))/2)**2
    def native(n,f):
        L=np.zeros((n**3,n**3),complex)
        for x,y,z in product(range(n),repeat=3):
            i=x+n*(y+n*z)
            for X,Y,Z,k in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
                if max(X,Y,Z)>=n:continue
                j=X+n*(Y+n*Z);p=np.exp(1j*f*k)
                L[i,i]+=1;L[j,j]+=1;L[i,j]-=p;L[j,i]-=p.conjugate()
        return L
    for n in (2,4,6,8):
        plus=native(n,-theta);minus=native(n,pi-theta)
        ep,em=(np.sqrt(np.linalg.eigvalsh(l)).sum() for l in (plus,minus));assert ep>em
        # Gauge-fixed instantaneous change of the spring matrix, no extra scalar potential.
        w,U=np.linalg.eigh(plus);V=(U/np.sqrt(w))@U.conj().T
        ef=(ep+np.trace(minus@V).real)/2
        assert ef>=em-1e-10
        print(f'N={n} Eplus={ep:.12f} Eminus={em:.12f} reversible release={ep-em:.12f} release/site={(ep-em)/n**3:.12f} sudden work={ef-ep:.12f} excess above final ground={ef-em:.12f}')
    # Test continuous, nonzero-flux route from -theta to -theta-pi = pi-theta mod 2pi.
    for f in np.linspace(-theta,-theta-pi,31):
        g=1.5*(1-np.cos(abs(np.angle(np.exp(1j*f)))/4))
        assert np.linalg.eigvalsh(native(2,f))[0]>=g-1e-11 and g>0
    print('PASS native finite diagnostics: reversible energy difference and gapped phase path')
if __name__=='__main__':
    rigorous();finite()
