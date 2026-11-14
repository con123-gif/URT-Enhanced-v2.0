#!/usr/bin/env python3
"""Q96: original 7 November all-five source response with Hbits+r²L24, not assumed Markov residual.

S3/S5 are exact original nonlinear source history averages, already proven and
checked in Nov 9 all-five source archives; we independently verify Chebyshev
resummation vs direct 24-mode inversion with high precision.
"""
import mpmath as mp
mp.mp.dps=80
phi=(1+mp.sqrt(5))/2
r=mp.pi/mp.e
delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
theta=2*mp.pi/phi**2
S3=36+72*mp.sqrt(5)/5
S5=7
n=24
def formula(z,t):
    ans=mp.mpf('0')
    for a,S in ((18,S3),(16,delta**2*S5)):
        x=1+(a-z)/(2*r**2)
        ans+=S*mp.chebyu(n-1,x)/(2*r**2*(mp.chebyt(n,x)-mp.cos(2*n*t)))
    return ans
def direct(z,t):
    return sum(S3/(18+r*r*(2-2*mp.cos(2*t-2*mp.pi*m/n))-z)
               +delta**2*S5/(16+r*r*(2-2*mp.cos(2*t-2*mp.pi*m/n))-z)
               for m in range(n))/n
for z in (mp.mpf('0'),mp.mpf('1'),mp.mpf('7'),mp.mpf('14'),mp.mpc('4','2')):
    err=abs(formula(z,theta)-direct(z,theta))
    assert err<mp.mpf('1e-68'),(z,err)
    print('z',z,'response',mp.nstr(formula(z,theta),25),'error',mp.nstr(err,5))
print('Q96 ORIGINAL SOURCE CHEBYSHEV TRACE: PASS')
print('z=0',mp.nstr(formula(mp.mpf('0'),theta),38))
