#!/usr/bin/env python3
"""Conditional prime-URT ZPE/cosmological-term: exact symbolic and numerical certificate.
Requires SymPy and mpmath. No physical scale fitting; RH and actual dark energy unproved.
"""
import mpmath as mp
import sympy as sp
mp.mp.dps=60

def symbolic():
    z,x=sp.symbols('z',nonzero=True),sp.Symbol('x')
    A=sp.zeros(4)
    for i,j,w in ((0,1,1),(0,2,1),(1,3,z),(2,3,1)):
        A[i,j]=sp.sympify(w);A[j,i]=1/sp.sympify(w)
    L=2*sp.eye(4)-A
    charpoly=x**4-8*x**3+20*x**2-16*x+2-z-1/z
    assert sp.simplify(L.charpoly(x).as_expr()-charpoly)==0
    for r,target in ((0,4),(1,8),(2,24),(3,80),(4,280+4*(z+1/z))):
        assert sp.simplify(sp.trace(L**r)-target)==0
    assert sp.simplify(L.det()-(2-z-1/z))==0
    print("PASS: exact magnetic-plaquette characteristic polynomial and traces 0..4")

def spectrum(eps):
    phi=(1+mp.sqrt(5))/2
    theta=2*mp.pi/phi**2
    flux=theta if eps==1 else mp.pi-theta
    assert flux>0 and flux<mp.pi
    return sorted([2-2*mp.cos(flux/4),2+2*mp.cos(flux/4),
                   2-2*mp.sin(flux/4),2+2*mp.sin(flux/4)])

def primitive(K,vals):
    return sum((K*mp.sqrt(K*K+x)*(2*K*K+x)-x*x*mp.asinh(K/mp.sqrt(x)))
               /(16*mp.pi**2) for x in vals)

def main():
    symbolic()
    plus,minus=spectrum(1),spectrum(-1)
    assert min(plus)>0 and min(minus)>0
    for r in range(4):
        assert abs(sum(x**r for x in plus)-sum(x**r for x in minus))<mp.mpf('1e-52')
    theta=2*mp.pi/((1+mp.sqrt(5))/2)**2
    moment4=sum(x**4 for x in plus)-sum(x**4 for x in minus)
    assert abs(moment4-16*mp.cos(theta))<mp.mpf('1e-50')
    logmom=sum(x*x*mp.log(x) for x in plus)-sum(x*x*mp.log(x) for x in minus)
    C=logmom/(32*mp.pi**2)
    assert mp.mpf('.0012418277635745') < C < mp.mpf('.0012418277635747')
    print("Delta Tr[L^4] =",mp.nstr(moment4,18))
    print("Delta Tr[L^2 ln L] =",mp.nstr(logmom,23))
    print("Delta u/(hbar c mu^4) =",mp.nstr(C,26))
    print("Delta Lambda/(ellP^2 mu^4) =",mp.nstr(8*mp.pi*C,24))
    for n in (2,5,10,20,50,100):
        K=mp.mpf(n)
        finite=primitive(K,plus)-primitive(K,minus)
        assert finite>0 and finite<C
        leading=-5*moment4/(1024*mp.pi**2*K**4)
        if n>=50: assert abs((C-finite)/leading-1)<mp.mpf('.01')
        print(f"Cutoff {n:3d}, difference {mp.nstr(finite,17)}")
    for n in (5,20):
        integrand=lambda k:k*k/(2*mp.pi**2)*(
            sum(mp.sqrt(k*k+v) for v in plus)-sum(mp.sqrt(k*k+v) for v in minus))
        q=mp.quad(integrand,[0,1,n])
        exact=primitive(mp.mpf(n),plus)-primitive(mp.mpf(n),minus)
        assert abs(q-exact)<mp.mpf('1e-48')
    a=(mp.e/mp.pi)**4
    print("URT conditional shell ratio =",mp.nstr(a,22))
    assert 0<a<1
    print("PASS: finite relative ZPE, UV cancellations, integration, scale covariance")
    print("CONDITIONAL: Lorentz complex field, canonical quantization, inverse length mu, gravity")
    print("If mu fixed: zeroth-derivative T_munu=-Delta u g_munu, w=-1")
    print("If mu follows cosmic scale^-1: rho ~ a^-4, w=+1/3")
    print("NOT derived: actual vacuum, absolute dark energy, mass scale or unique prime flux")

if __name__=="__main__":main()
