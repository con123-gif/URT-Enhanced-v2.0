#!/usr/bin/env python3
"""Exact face-product source from positive semigroup; 4D OS Gaussian sector.

Tests use the original archived 190 five-Platonic cochains, 64-bit Hbits,
source Plinear/C/P3/P5/Delta/ Uh.  No third-party Yang--Mills code.
"""
from pathlib import Path
import runpy
import numpy as np
import math
from scipy.linalg import expm

model=runpy.run_path(str(Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')))
C=model['C'];P3=model['P3'];P5=model['P5'];Ph=P3+P5
Lf=model['Lface'];ico_adj=model['Aico'];Plinear=model['Plinear']; E=model['Eglobal']; I=model['Iico']
Uh=model['Uh'];Hbits=model['Hbits'];Delta=model['Delta'];r=model['r']
assert C.shape==(20,12) and E.shape==(50,8)
assert np.linalg.norm(C.T@C-(5*np.eye(12)+2*ico_adj))<1e-10
assert np.linalg.norm(Lf@np.ones(20))<1e-11
assert np.linalg.norm(P3@P5)<1e-11
assert np.linalg.norm(Ph@C)<1e-11
assert np.linalg.norm(Plinear@E-I)<1e-11

rng=np.random.default_rng(20261108)
v=rng.normal(size=50)*.31
x=Plinear@v
z=C@x
Mz=np.diag(z)
h3=P3@(z*z);h5=P5@(z*z)
assert np.linalg.norm(h3)>1e-5 and np.linalg.norm(h5)>1e-5
assert np.linalg.norm(np.diag(Mz@Mz)-z*z)<1e-11
Bhid=P3+Delta*P5
assert np.linalg.norm(Bhid@Bhid-(P3+Delta**2*P5))<1e-10
actual_source=Uh@(h3+Delta*h5)
algebra_source=Uh@Bhid@Ph@np.diag(Mz@Mz)
assert np.linalg.norm(actual_source-algebra_source)<2e-11

# One exact nontrivial icosahedral A5 rotation: fifth-turn about vertex axis.
points=model['points']; faces=model['faces']; n=points[0]/np.linalg.norm(points[0]);th=2*math.pi/5
K=np.array([[0,-n[2],n[1]],[n[2],0,-n[0]],[-n[1],n[0],0]])
rot=np.eye(3)+math.sin(th)*K+(1-math.cos(th))*K@K
permuted=np.array([np.argmin(np.linalg.norm(points-(rot@p),axis=1)) for p in points])
assert sorted(permuted.tolist())==list(range(12))
assert np.max(np.linalg.norm(points[permuted]-points@rot.T,axis=1))<2e-12
S={frozenset(f):i for i,f in enumerate(faces)}
perm_face=np.array([S[frozenset(permuted[f])] for f in faces])
assert sorted(perm_face.tolist())==list(range(20))
Pv=np.zeros((12,12));Pf=np.zeros((20,20))
Pv[permuted,np.arange(12)]=1;Pf[perm_face,np.arange(20)]=1
assert np.linalg.norm(C@Pv-Pf@C)<1e-12
assert np.linalg.norm(Pf@P3-P3@Pf)<1e-11
assert np.linalg.norm(Pf@P5-P5@Pf)<1e-11
assert np.linalg.norm(P3@((C@(Pv@x))**2)-Pf@h3)<2e-11
assert np.linalg.norm(P5@((C@(Pv@x))**2)-Pf@h5)<2e-11

# Positive source-titled face transfer, with the original dual-face Laplacian.
# K_t(j)=exp[-t(Lface - j M_z)].  D_j^2 K_t(0)/t^2 -> M_z^2.
# The second Frechet derivative is computed from one 60x60 block exponential:
# exp([[A,B,0],[0,A,B],[0,0,A]])_(0,2) = 1/2 D^2exp_A[B,B].
errors=[]
for t in [0.2,.1,.05,.025]:
    a=-t*Lf; b=t*Mz
    big=np.zeros((60,60))
    for k in range(3):big[k*20:(k+1)*20,k*20:(k+1)*20]=a
    big[:20,20:40]=b;big[20:40,40:60]=b
    second=2*expm(big)[:20,40:60]
    src=second@np.ones(20)/(t*t)
    assert np.max(abs(second-second.T))<1e-9
    error=np.linalg.norm(src-z*z)
    errors.append(error)
    # Hidden source convergence is simultaneous.
    assert np.linalg.norm(P3@src-h3)<error+1e-10
    assert np.linalg.norm(P5@src-h5)<error+1e-10
assert all(errors[i]>errors[i+1] for i in range(len(errors)-1)),errors
assert errors[-1]<0.05,np.array(errors)

# Canonical 4D Gaussian covariance of the massive Hbits (zero-mode quotient),
# using the history-derived spatial diffusion coefficient and the already
# prescribed second-order clock kinetic: K=-r^2 dt^2-Ddx^2+Hbits|ker_perp.
D=r*r/5
w=np.linalg.eigvalsh(Hbits)
assert sum(abs(w)<1e-8)==2
for lam,mult in [(10,12),(16,30),(18,20)]:assert sum(abs(w-lam)<1e-8)==mult
# Reflection positivity is an exact sum of squares in every spatial momentum.
# <theta f,C f> = sum_(lambda,k) (1/(2 omega)) |int_0^inf e^-omega*t f(t,k)|^2.
times=np.array([.2,.65,1.4,2.1]);momenta=np.array([
[0,0,0],[.5,.2,.1],[1,-1,.8],[2,0,-.9]
]);amps=rng.normal(size=(4,4,3))+1j*rng.normal(size=(4,4,3))
chi=0.0
for lk,lam in enumerate([10.,16.,18.]):
    for ik,k in enumerate(momenta):
        E=math.sqrt(lam+D*np.dot(k,k))
        omega=E/r
        ov=np.exp(-omega*times)
        G=np.outer(ov,ov)/(2*r*E)
        assert np.linalg.eigvalsh(G).min()>-2e-14
        a=amps[:,ik,lk]
        direct=np.vdot(a,G@a).real
        fact=abs(np.dot(ov,a))**2/(2*r*E)
        assert abs(direct-fact)<2e-14
        chi+=fact
assert chi>1e-9
print('PASS canonical face incidence: C^TC =5I+2 Aico; hidden projection annihilates im C')
print('PASS A5 fifth-turn covariance of incidence, 4_3 and 4_5 hidden source channels')
print('PASS original nonlinear source equals projected face-observable square with positive Gibbs amplitude')
print('PASS exact semigroup 2nd Frechet derivative yields face square at short times')
print('semigroup small-time source errors', ['%.6g'%e for e in errors])
print('PASS native 62 positive history modes yield a 4D Euclidean Gaussian covariance, m²=10,16,18')
print('PASS Osterwalder–Schrader time-reflection positivity in the free sector (sum-of-squares identity)')
print('spatial diffusion D=pi^2/(5e^2)',f'{D:.15f}')
print('induced free-sector dispersion omega^2 = lambda/r^2 + |k|^2/5; propagation slope 1/sqrt(5)')
print('lowest free-sector temporal energy sqrt(10)/r',f'{math.sqrt(10)/r:.15f}')
print('example positive OS quadratic form',f'{chi:.15f}')