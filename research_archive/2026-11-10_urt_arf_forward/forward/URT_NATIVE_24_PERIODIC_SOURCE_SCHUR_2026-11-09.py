#!/usr/bin/env python3
"""Forward 24-periodic binary URT symbolic source through original all-five
nonlinear source and exact 64-history+24-clock Gaussian Schur complement.
The 24-bit periodic ensemble is a declared condition; it is not assumed to
be the physical vacuum or an ARF normalization. No historical ARF input.
"""
import numpy as np,contextlib,io,runpy
from math import pi,e,sqrt
from pathlib import Path
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    src=runpy.run_path(str(HERE/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
    md=runpy.run_path(str(HERE/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
R3=src['R3'];R5=src['R5'];Delta=src['Delta'];omega=md['theta'];r=pi/e
Q=np.zeros((64,64))
for h in range(64):Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
powers=[np.eye(64)]
for k in range(1,6):powers.append(powers[-1]@Q)
cs={}
for label,R in [('3',R3),('5',R5)]:
    co=np.array([np.trace(R.T@p@R)/64 for p in powers])
    assert abs(co[5])<1e-11
    cs[label]=co[:5]
    print('hidden',label,'first 5 chronological norm autocorrelations',co[:5])
N=24;ms=np.arange(N)
def eigen_phase(q,angle):return 2-2*np.cos(q*angle-2*pi*ms/N)
def fraw(angle):
    vals=[]
    for label,E,amp in [('3',18,1),('5',16,Delta*Delta)]:
        cc=cs[label]
        spec=cc[0]+2*sum(cc[k]*np.cos(2*pi*ms*k/N) for k in range(1,5))
        assert np.min(spec)>-1e-10
        denom=E+r*r*eigen_phase(2,angle)
        V=6*cc[0]-0.5*np.sum(spec/denom)
        vals.append((label,amp,cc[0],np.sum(spec/denom),V,amp*V,spec))
    return vals
out=fraw(omega)
print('native URT 24-period source expectation:')
for x in out:print(x[:6], 'spectral power range',np.min(x[-1]),np.max(x[-1]))
V=sum(x[5] for x in out)
# Independent-within-each-clock-cell source is a DIFFERENT model:
Vind=0
for lab,E,amp in [('3',18,1),('5',16,Delta*Delta)]:
    c=cs[lab]
    Vind+=amp*(6*c[0]-0.5*c[0]*np.sum(1/(E+r*r*eigen_phase(2,omega))))
print('same original action 24-period URT source V',V)
print('same original action decorrelated track source V',Vind)
print('URT chronology induced difference',V-Vind)
# Global phase current for the declared periodic source statistics.
def orientation_derivative(angle):
    J=0
    for label,E,amp in [('3',18,1),('5',16,Delta*Delta)]:
        cc=cs[label]
        spec=cc[0]+2*sum(cc[k]*np.cos(2*pi*ms*k/N) for k in range(1,5))
        aa=E+r*r*eigen_phase(2,angle)
        # a'(angle)=4 r^2 sin(2angle-2pi m/24)
        J+=0.5*amp*np.sum(spec*4*r*r*np.sin(2*angle-2*pi*ms/N)/aa**2)
    return J
h=1e-5
finite_diff=(sum(x[5] for x in fraw(omega+h))-sum(x[5] for x in fraw(omega-h)))/(2*h)
J=orientation_derivative(omega)
print('source clock orientation response',J,'finite-difference',finite_diff,'error',abs(J-finite_diff))
assert abs(J-finite_diff)<1e-7
# Explicit random 24-bit periodic traces for sanity check with direct 24x24 solves.
rng=np.random.default_rng(1)
L2=md['clock_laplacian'](np.full(24,omega),2)
A3=18*np.eye(24)+r*r*L2
A5=16*np.eye(24)+r*r*L2
sam=[]
for _ in range(1000):
    bits=rng.integers(0,2,size=24)
    windows=[]
    for j in range(24):
        w=0
        for i in range(6): w=(w<<1)|int(bits[(j+i)%24])
        windows.append(w)
    rs3=R3[windows];rs5=R5[windows]
    v=.25*(np.linalg.norm(rs3)**2+Delta*Delta*np.linalg.norm(rs5)**2)
    v-=.5*(np.trace(rs3.T@np.linalg.solve(A3,rs3)).real+Delta*Delta*np.trace(rs5.T@np.linalg.solve(A5,rs5)).real)
    sam.append(v)
print('1000 periodic binary histories MC mean',np.mean(sam),'standard error',np.std(sam)/sqrt(len(sam)),'theory',V)
assert abs(np.mean(sam)-V) < 6*np.std(sam)/sqrt(len(sam))
print('PASS all-five + actual hidden + 24-period URT correlation + Gaussian Schur')
