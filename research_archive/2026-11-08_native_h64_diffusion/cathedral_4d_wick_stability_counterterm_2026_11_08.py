#!/usr/bin/env python3
"""Native Cathedral 4D Wick quartic: exact rational/surd counterterms + stability.

Imports the original 190/64/24 action.  Exact P3/P5 and 12-vertex
counterterm spectrum obtained using sympy arithmetic. No external sources.
"""
from pathlib import Path
import runpy
import math
import numpy as np
import sympy as sp

z=runpy.run_path(str(Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')))
C=sp.Matrix(z['C'].astype(int));L=sp.Matrix(np.rint(z['Lface']).astype(int));
S=C*C.T
P=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=P*(5*sp.eye(20)-L)/2
P5=P*(L-3*sp.eye(20))/2
W=S.multiply_elementwise(S)
M3=C.T*(P3.multiply_elementwise(S))*C
M5=C.T*(P5.multiply_elementwise(S))*C

m3_expected={sp.Rational(12,5):5,
             2-4*sp.sqrt(5)/5:3,
             2+4*sp.sqrt(5)/5:3,
             sp.Integer(0):1}
m5_expected={sp.Rational(4,5):5,sp.Rational(2,3):6,sp.Integer(0):1}
assert M3.eigenvals()==m3_expected,(M3.eigenvals(),m3_expected)
assert M5.eigenvals()==m5_expected,(M5.eigenvals(),m5_expected)
assert sp.trace(P3*W)==24
assert sp.trace(P5*W)==8
assert sp.trace(M3)==24 and sp.trace(M5)==8
assert sp.simplify(M3*M5-M5*M3)==sp.zeros(12)

Delta=float(z['Delta'])
c3=2/9
c5=(7/32)*Delta**2
R=np.array(M3,dtype=float)*c3 + np.array(M5,dtype=float)*c5
assert np.linalg.eigvalsh(R).min()>-2e-12
maxR=c3*(2+4*math.sqrt(5)/5)+c5*(2/3)
assert abs(np.linalg.eigvalsh(R).max()-maxR)<1e-12

# A pure ordinary icosahedral 3-irrep vertex field cannot excite either hidden
# quartic source; Wick-normal-ordering nonetheless subtracts a quadratic term.
Lvertex=5*np.eye(12)-z['Aico']
wl,vv=np.linalg.eigh(Lvertex)
choice=np.argmin(abs(wl-(5-math.sqrt(5))))
x=vv[:,choice]
lam=float(wl[choice]);assert abs(lam-(5-math.sqrt(5)))<2e-12
Cnum=np.array(C,dtype=float);h3=z['P3']@((Cnum@x)**2);h5=z['P5']@((Cnum@x)**2)
assert np.linalg.norm(h3)<1e-10 and np.linalg.norm(h5)<1e-10
m3=float(x@np.asarray(M3,dtype=float)@x)
m5=float(x@np.asarray(M5,dtype=float)@x)
assert abs(m3-(2+4*math.sqrt(5)/5))<2e-12
assert abs(m5-2/3)<2e-12
sigma2_crit=lam/(8*maxR)
assert abs(sigma2_crit-0.4103377795515251)<1e-12
sigma2=.5
negative_quadratic=(lam/2)-4*sigma2*(c3*m3+c5*m5)
assert negative_quadratic<0

# Wick quartics Q_s=:||P_s(z^2)||^2: for x~N(0,sigma^2 I12):
# :Q_s:=Q_s -4sigma^2 x^T M_s x +2sigma^4 Tr(P_s W).
# On the pure triplet ray Q_s=0, leaving a negative quadratic coefficient.
T3=float(sp.trace(P3*W));T5=float(sp.trace(P5*W))
constant=2*sigma2*sigma2*(c3*T3+c5*T5)
for amplitude in [10.,100.,1000.]:
    v=amplitude*x
    Q3=np.linalg.norm(z['P3']@((Cnum@v)**2))**2
    Q5=np.linalg.norm(z['P5']@((Cnum@v)**2))**2
    full=.5*lam*amplitude**2+c3*(Q3-4*sigma2*amplitude**2*m3+2*sigma2*sigma2*T3)+c5*(Q5-4*sigma2*amplitude**2*m5+2*sigma2*sigma2*T5)
    reference=negative_quadratic*amplitude**2+constant
    assert abs(full-reference)<1e-6*max(1,abs(reference)),(amplitude,full,reference)
assert negative_quadratic<0

# Minimal uniform scalar extra-mass term sufficient to restore the ORIGINAL
# quadratic coercivity after Wick-ordering (not a new physical mass fit):
# add +(m_ct^2/2)|x|^2 with m_ct^2=8sigma^2 lambda_max(c3 M3+c5 M5).
mct2=8*sigma2*maxR
assert np.linalg.eigvalsh(0.5*mct2*np.eye(12)-4*sigma2*R).min()>-1e-11
rng=np.random.default_rng(20261108)
for _ in range(100):
    v=rng.normal(size=12)
    assert .5*mct2*np.dot(v,v)-4*sigma2*v@R@v>-1e-10

# Canonical 4D scalar bubble at p=0 (ellipsoidal momentum cutoff after
# whitening native positive kinetic r^2 omega^2 + D |k|^2):
r=float(z['r']);D=r*r/5
mass2=10.
def bubble(cut):
    return (math.log1p(cut**2/mass2)-cut**2/(cut**2+mass2))/(16*math.pi**2*r*D**1.5)
bb=[bubble(c) for c in (100.,1000.,10000.)]
assert bb[0]<bb[1]<bb[2]
# Leading large-cutoff slope with log Lambda = 1/(8pi^2 r D^(3/2)).
slope=1/(8*math.pi**2*r*D**1.5)
ratio=(bb[2]-bb[1])/math.log(10)
assert abs(ratio/slope-1)<1e-4

print('PASS exact rational/surd counterterm M3 eigenvalues',m3_expected)
print('PASS exact rational counterterm M5 eigenvalues',m5_expected)
print('PASS Wick source quartic normal-ordering formula and pure 3-triplet zero-source ray')
print('PASS explicit instability: Wick-ordered original action unbounded below above sigma^2 threshold')
print('critical sigma^2:',f'{sigma2_crit:.15f}')
print('Wick quadratic coefficient at sigma^2=0.5:',f'{negative_quadratic:.15f}')
print('PASS minimal stability-preserving uniform mass counterterm m_ct^2:',f'{mct2:.15f}')
print('PASS 4D Gaussian bubble grows logarithmically; leading coefficient:',f'{slope:.15f}')
print('bubble at Lambda=100,1000,10000:',*(f'{b:.12f}' for b in bb))