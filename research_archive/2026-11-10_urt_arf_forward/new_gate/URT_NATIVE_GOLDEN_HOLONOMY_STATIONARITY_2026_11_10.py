#!/usr/bin/env python3
"""Zero-fit exact Chebyshev test of the native Cathedral charge-two
24-clock log determinant. Its golden phase is NOT stationary for the
positive-history Gaussian determinant alone. This does not exclude a
competing geometric, gauge or matter term selecting golden phase.

H(theta) eigenbranches E=10(12),16(30),18(20), and the E=0 history
modes are omitted from the quotient. With r=pi/e and N=24, the exact
phase-dependent determinant factor for each E is
  2*r**(2N) * (T_N(1+E/(2r*r)) - cos(2*N*theta)).
Derivative of logdet is 2*N*sin(2*N*theta) sum_E d_E / (...).

At theta=2*pi/phi^2, sin(48*theta) != 0 exactly because
48 theta/pi = 96/phi^2 is irrational (phi quadratic irrational).
Every denominator is strictly positive for E>0, so derivative != 0.
"""
import mpmath as m
m.mp.dps=110
phi=(1+m.sqrt(5))/2
r=m.pi/m.e
N=24
th=2*m.pi/phi**2
vals=[(10,12),(16,30),(18,20)]

def logdet(z):
 out=m.mpf(0)
 for E,d in vals:
  xx=1+m.mpf(E)/(2*r*r)
  out+=d*(m.log(2)+2*N*m.log(r)+m.log(m.chebyt(N,xx)-m.cos(2*N*z)))
 return out

def derivative(z):
 out=m.mpf(0)
 for E,d in vals:
  xx=1+m.mpf(E)/(2*r*r)
  out+=d*(2*N*m.sin(2*N*z))/(m.chebyt(N,xx)-m.cos(2*N*z))
 return out

# Independent spectral product of 24 Fourier modes at the same high precision.
def direct(z):
 out=m.mpf(0)
 for E,d in vals:
  for k in range(N):
   gap=2-2*m.cos(2*z-2*m.pi*k/N)
   out+=d*m.log(E+r*r*gap)
 return out

for z in (th,m.mpf('0.0'),m.mpf('.123')):
 assert abs(logdet(z)-direct(z))<m.mpf('1e-80')
assert abs(derivative(th)-m.diff(logdet,th))<m.mpf('1e-80')
assert abs(derivative(th))>m.mpf('1e-100')
E=logdet(th)-logdet(0)
print('theta_golden=',m.nstr(th,48))
print('48*theta mod 2*pi=',m.nstr(m.fmod(2*N*th,2*m.pi),48))
print('sin(48theta)=',m.nstr(m.sin(2*N*th),48))
print('native Gaussian phase action shift Δlogdet=',m.nstr(E,72))
print('exact native Gaussian derivative at golden=',m.nstr(derivative(th),72))
print('direct 24-mode logdet residual=',m.nstr(logdet(th)-direct(th),4))
print('minimum of each positive-E sector at 48theta=2*pi*k, golden not stationary')
print('PASS exact derivative, Chebyshev identity, irrationality nonstationarity proof')
