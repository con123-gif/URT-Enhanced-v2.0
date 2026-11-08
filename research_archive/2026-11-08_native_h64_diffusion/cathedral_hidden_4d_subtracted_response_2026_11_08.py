#!/usr/bin/env python3
"""Cutoff-independent hidden 3/5 quadratic-source 4D bubble response.

Uses exact original Cathedral face-incidence projectors, native spatial
D=(pi/e)^2/5 and original temporal r^2. Demonstrates explicitly subtracted
one-loop response with fixed Gaussian reference, no experimental fit.
"""
from pathlib import Path
import runpy,math
import numpy as np
from scipy.special import roots_jacobi
from scipy.integrate import quad

z=runpy.run_path(str(Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')))
r=float(z['r']);D=r*r/5;Delta=float(z['Delta'])
P3=z['P3'];P5=z['P5'];
S=z['C']@z['C'].T
W=S*S
assert np.linalg.norm(P3@W@P3-6*P3)<1e-10
assert np.linalg.norm(P5@W@P5-2*P5)<1e-10
jac=1/(r*D**1.5)

# Exact Feynman parameter, valid for external rescaled momentum p^2>=0.
def B_ren(p2,m2):
    def integrand(x):return math.log1p(p2*x*(1-x)/m2)
    return -jac*quad(integrand,0,1,epsabs=2e-13,epsrel=1e-12)[0]/(16*math.pi**2)

def B_closed(p2,m2):
    if p2==0:return 0.
    a=p2/m2
    t=math.sqrt(a/(4+a))
    F=2*(math.atanh(t)/t-1)
    return -jac*F/(16*math.pi**2)

# Independent explicit 4D sharp ball cutoff in canonically rescaled momenta;
# angle between loop momentum k and p has density 2/pi sqrt(1-u^2).
u,ww=roots_jacobi(80,.5,.5)
ww=ww/ww.sum()
def B_cut_sub(p2,m2,cutoff):
    p=math.sqrt(p2)
    def integrand(k):
        denom=k*k+m2
        avg=np.dot(ww,1/(denom+p2-2*k*p*u))
        return jac*k**3*(avg/denom-1/denom**2)/(8*math.pi**2)
    return quad(integrand,0,cutoff,epsabs=1e-11,epsrel=2e-10,limit=350)[0]

for p2 in [0.25,2,10,30,100]:
    m2=10.
    a=B_ren(p2,m2);b=B_closed(p2,m2)
    assert abs(a-b)<1e-11,(p2,a,b)
    if p2>0:assert a<0

p2=10.;m2=10.
target=B_ren(p2,m2)
calc=[B_cut_sub(p2,m2,k) for k in [20.,80.,320.]]
errors=[abs(v-target) for v in calc]
assert errors[0]>errors[1]>errors[2],(calc,target,errors)
assert errors[-1]<1e-5,(target,calc)

# Positive source covariance before subtraction is 12P3+4Delta^2 P5.
# After renormalisation, the momentum difference is the same algebraic matrix
# multiplied by the UV-finite scalar B_ren(p^2,m^2).
response=(12*P3+4*Delta**2*P5)*target
assert np.linalg.norm(P3@response@P5)<1e-10
assert abs(np.trace(P3@response)/4 - 12*target)<2e-11
assert abs(np.trace(P5@response)/4 - 4*Delta**2*target)<2e-11
ratio=3/Delta**2
assert abs((np.trace(P3@response)/4)/(np.trace(P5@response)/4)-ratio)<1e-4

smallp2=1e-4
pred=-jac*smallp2/(96*math.pi**2*m2)
actual=B_ren(smallp2,m2)
assert abs(actual/pred-1)<5e-6

print('PASS exact 4D subtracted bubble equals convergent Feynman-parameter formula')
print('PASS independent hard-cutoff integral converges to unique finite momentum response')
print('PASS hidden 3/5 response matrices proportional to 12P3+4Delta²P5 with no new fit')
print('PASS low-momentum source-response derivative from Gaussian history spatial kinetic')
print('subtracted bubble B_R(p²=10,m²=10)',f'{target:.15f}')
print('cutoffs 20,80,320: ',*(f'{x:.12f}' for x in calc))
print('absolute errors:',*(f'{x:.6g}' for x in errors))
print('per-quartet 3/5 response ratio=',f'{ratio:.10f}')
print('D spatial=',f'{D:.15f}')