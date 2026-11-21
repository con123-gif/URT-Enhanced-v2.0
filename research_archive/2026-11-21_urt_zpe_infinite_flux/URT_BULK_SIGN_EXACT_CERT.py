#!/usr/bin/env python3
"""Rigorous rational interval certificate: positive infinite-volume URT flux ZPE difference.

All enclosures use Fraction and integer square roots; pi from Machin alternating series,
cos from Taylor plus Lagrange remainder. No floating-point arithmetic determines PASS.
The sign theorem is conditional on the stated magnetic oscillator quantisation.
"""
from fractions import Fraction as Q
from math import isqrt, factorial
from collections import Counter

SCALE=10**34

class Interval:
    def __init__(self, lo, hi=None):
        self.lo = Q(lo)
        self.hi = Q(lo if hi is None else hi)
        assert self.lo<=self.hi
    def __add__(self,b):
        b=interval(b)
        return Interval(self.lo+b.lo,self.hi+b.hi)
    __radd__=__add__
    def __neg__(self):return Interval(-self.hi,-self.lo)
    def __sub__(self,b):return self+-interval(b)
    def __rsub__(self,b):return interval(b)+-self
    def __mul__(self,b):
        b=interval(b)
        xs=[a*c for a in (self.lo,self.hi) for c in (b.lo,b.hi)]
        return Interval(min(xs),max(xs))
    __rmul__=__mul__
    def reciprocal(self):
        assert self.lo*self.hi>0, (self.lo,self.hi)
        return Interval(1/self.hi,1/self.lo)
    def __truediv__(self,b):return self*interval(b).reciprocal()
    def __rtruediv__(self,b):return interval(b)*self.reciprocal()
    def __pow__(self,n):
        assert isinstance(n,int) and n>=0
        if n==0:return Interval(1)
        if n%2==0:
            if self.lo>=0:return Interval(self.lo**n,self.hi**n)
            if self.hi<=0:return Interval(self.hi**n,self.lo**n)
            return Interval(0,max(self.lo**n,self.hi**n))
        return Interval(self.lo**n,self.hi**n)
    def sqrt(self):
        assert self.lo>=0
        def floor_sqrt(z):
            return isqrt((z.numerator*SCALE*SCALE)//z.denominator)
        lo=floor_sqrt(self.lo)
        hi=floor_sqrt(self.hi)+1
        return Interval(Q(lo,SCALE),Q(hi,SCALE))
    def __repr__(self):
        return '[%.15f, %.15f]'%(float(self.lo),float(self.hi))

def interval(x):return x if isinstance(x,Interval) else Interval(x)

def arctan_rational_01(q,n):
    """Alternating arctan series: n terms, next term bounds remainder."""
    x=Q(1,q)
    s=Q(0)
    for k in range(n):s+=(-1)**k*x**(2*k+1)/Q(2*k+1)
    rem=x**(2*n+1)/Q(2*n+1)
    return Interval(s,s+rem) if n%2==0 else Interval(s-rem,s)

def cos_interval(x,terms=25):
    """Taylor degree 2*terms; next Taylor remainder |R|<=X^(2*terms+2)/(2*terms+2)!."""
    assert x.lo>0 and x.hi<Q(3)
    y=Interval(0)
    for k in range(terms+1):
        y+=Q((-1)**k,factorial(2*k))*(x**(2*k))
    rem=x.hi**(2*terms+2)/Q(factorial(2*terms+2))
    return y+Interval(-rem,rem)

def upper_gauss_3(c):
    """Three-node Gauss formula from tau(A²)=4, tau(A⁴)=28+8c."""
    S=(7+2*c).sqrt()
    w=2/(7+2*c)
    w0=(3+2*c)/(7+2*c)
    return w*((4-S).sqrt()+(4+S).sqrt()) +2*w0

def lower_radau_3(c):
    """Three-node left Radau bound at a=1/2 for plus sector.

    J3^R = [[4,2,0],[2,4,sqrt(b²)],[0,sqrt(b²),gamma]],
    b²=3+2c, gamma=1/2+(14/33)b². One eigenvalue is exactly 1/2.
    The remaining two eigenvalues and all spectral weights are analytic in c.
    """
    a=Interval(Q(1,2))
    b2=3+2*c
    gamma=a+Q(14,33)*b2
    d=(196*c*c-468*c+3213).sqrt()
    rlo=Q(51,11)+Q(14,33)*c-d/33
    rhi=Q(51,11)+Q(14,33)*c+d/33
    assert rlo.lo>a.hi and rhi.lo>rlo.hi
    wa=64*b2/(520*c+1869)
    def weight(lam,other):
        return ((lam-4)*(lam-gamma)-b2)/((lam-a)*(lam-other))
    wl=weight(rlo,rhi)
    wh=weight(rhi,rlo)
    assert min(wa.lo,wl.lo,wh.lo)>0
    assert (wa+wl+wh).lo<Q(1)<(wa+wl+wh).hi
    return wa*a.sqrt()+wl*rlo.sqrt()+wh*rhi.sqrt()

def fourth_moment_walk_certificate():
    """Exact magnetic Wilson-loop fourth moment from all 4^4 lattice paths."""
    walks=Counter()
    def visit(x,y,area,k):
        if k==4:
            if x==y==0:walks[area]+=1
            return
        visit(x+1,y,area,k+1)
        visit(x-1,y,area,k+1)
        visit(x,y+1,area+x,k+1)
        visit(x,y-1,area-x,k+1)
    visit(0,0,0,0)
    assert walks==Counter({0:28,1:4,-1:4})
    # τ(A²)=4 and τ(A⁴)=28+8cos F; therefore the three-point
    # Lanczos Jacobi coefficients for L=4I-A are b1²=4, b2²=3+2cos F.
    return walks

def main():
    fourth_moment_walk_certificate()
    pi=16*arctan_rational_01(5,28)-4*arctan_rational_01(239,14)
    sqrt5=Interval(Q(isqrt(5*SCALE*SCALE),SCALE),
                   Q(isqrt(5*SCALE*SCALE)+1,SCALE))
    phi=(1+sqrt5)/2
    theta=2*pi/(phi*phi)
    assert theta.lo>Q(23,10) and theta.hi<Q(5,2)
    c=cos_interval(theta,24)
    assert Q(-738,1000)<c.lo<c.hi<Q(-737,1000)
    # Infinite square lattice: each edge is in exactly 2 plaquettes and each vertex
    # in exactly 4, so L_inf >= 4(1-cos(theta/4))I on plus flux.
    gplus=4*(1-cos_interval(theta/4,24))
    assert gplus.lo>Q(1,2)
    # Gauss3 is an upper bound on tau(sqrt L_minus): f^(6)(x)<0.
    # Radau3(a=1/2) is a lower bound on tau(sqrt L_plus): f^(5)(x)>0.
    lower_plus=lower_radau_3(c)
    upper_minus=upper_gauss_3(-c)
    assert lower_plus.lo>Q(1924,1000)
    assert upper_minus.hi<Q(1923,1000)
    assert lower_plus.lo>upper_minus.hi
    print('pi interval',pi)
    print('golden angle interval',theta)
    print('cos theta interval',c)
    print('proved plus infinite magnetic gap >=',gplus)
    print('Radau lower: tau(sqrt L_plus) >=',lower_plus)
    print('Gauss upper: tau(sqrt L_minus) <=',upper_minus)
    print('CERTIFIED DELTA E/(hbar omega0*site) >',float(lower_plus.lo-upper_minus.hi))
    print('PASS: exact rational interval + Gauss-Radau sign proof; NO fitted constants')
    print('STATUS: positive *relative* Gaussian oscillator ZPE, not cosmological dark energy')
if __name__=='__main__':main()
