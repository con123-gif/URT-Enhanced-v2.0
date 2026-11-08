#!/usr/bin/env python3
"""Extract original all-five complex Gaussian covariance FROM 190×24 kinetic.

No freely specified mode variances: uses unchanged D190, Cbridge, pi/e, eta,
golden clock, original 50→8→12 and hidden 4+4 source.
"""
from pathlib import Path
import runpy,hashlib
import numpy as np
from math import pi

path=Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')
z=runpy.run_path(str(path))
N=z['N']; D=z['D']; Cbridge=z['Cbridge'];r=z['r'];theta=z['theta'];eta=z['eta']
assert N==24 and D.shape==(190,190)
# The zero-source, positive charged free-geometric Hessian is explicitly
# 1/2 Σ_j [ z_j†(D²+Cbridge) z_j + r² |z_(j+1)-exp(iθ)z_j|² ]
K=D@D+Cbridge
vindices=[]
for name in z['names']:
    g=z['geom'][name]
    vindices.extend(range(g['offset'],g['offset']+g['V']))
R=np.eye(190)[vindices,:]
assert R.shape==(50,190)
# Circular complex Gibbs measure exp(-eta*S) has covariance 2*K^{-1}/eta.
local=np.zeros((50,50),float)
I=np.eye(190)
for m in range(N):
    ell=2-2*np.cos(theta-2*pi*m/N)
    assert ell>0
    G=np.linalg.solve(K+r*r*ell*I,R.T)
    local+=(2/(eta*N))*(R@G)
local=(local+local.T)/2
assert np.linalg.eigvalsh(local).min()>0

Q=z['Plinear'];C=z['C'];P3=z['P3'];P5=z['P5'];Delta=z['Delta'];
Gam12=Q@local@Q.T
G8=z['Iico'].T@Gam12@z['Iico']
spec=np.linalg.eigvalsh(G8)
a=float(np.trace(G8[:3,:3])/3)
b=float(np.trace(G8[3:,3:])/5)
measured_mixing=np.linalg.norm(G8[:3,3:])
five_splitting=np.linalg.norm(G8[3:,3:]-b*np.eye(5))
assert measured_mixing>1e-5 and five_splitting>1e-5
assert np.linalg.norm(Gam12-Gam12.T)<1e-12

# The *actual* local face covariance and full gauge-invariant Wick tensor:
S=C@Gam12@C.T
assert np.linalg.eigvalsh(S).min()>-1e-11
assert (np.diag(S).max()-np.diag(S).min())>1e-4
S2=S*S
mix=P3@S2@P5
assert np.linalg.norm(mix)>1e-5
M3=Q.T@C.T@(P3*S)@C@Q
M5=Q.T@C.T@(P5*S)@C@Q
c3=2/9;c5=7*Delta**2/32
M=c3*M3+c5*M5
vals=np.linalg.eigvalsh(M)
assert vals.min()>-1e-10
assert sum(vals>1e-9)<=8
mct2=8*vals.max()
assert np.linalg.eigvalsh(.5*mct2*np.eye(50)-4*M).min()>-1e-10
# Trace through Lface pseudoinverse and the unique Gibbs sqrt amplitude.
Bh=P3+Delta*P5
Lhidden=P3/3+P5/5
Vh=2*(P3+P5)@S2@(P3+P5)
chi=float(np.trace(Lhidden@Bh@Vh@Bh))
assert chi>0
# Complex circular covariance implies E[h]=0, while real Gaussian
# with the same non-A5-symmetric S has nonzero hidden mean.
realmean3=np.linalg.norm(P3@np.diag(S))
realmean5=np.linalg.norm(P5@np.diag(S))
assert realmean3>1e-5 and realmean5>1e-5
# Wick quartic itself and its tensor correction preserve charged U(1) phase.
const3=2*np.trace(P3@S2); const5=2*np.trace(P5@S2)
rng=np.random.default_rng(20261108)
for _ in range(25):
    v=rng.normal(size=50)+1j*rng.normal(size=50)
    face=C@Q@v
    q=(P3@(face*face),P5@(face*face))
    raw=c3*np.vdot(q[0],q[0]).real+c5*np.vdot(q[1],q[1]).real
    Wick=raw-4*np.vdot(v,M@v).real+c3*const3+c5*const5
    angle=rng.uniform(-pi,pi)
    phase=np.exp(1j*angle)
    fv=C@Q@(phase*v)
    qq=(P3@(fv*fv),P5@(fv*fv))
    rawg=c3*np.vdot(qq[0],qq[0]).real+c5*np.vdot(qq[1],qq[1]).real
    Wickg=rawg-4*np.vdot(phase*v,M@(phase*v)).real+c3*const3+c5*const5
    assert abs(raw-rawg)<1e-9 and abs(Wick-Wickg)<1e-9
    back=Wick+4*np.vdot(v,M@v).real-c3*const3-c5*const5
    assert abs(back-raw)<1e-9

print('PASS exact 190×24 positive charged Hessian -> local 50-vertex complex Gibbs covariance')
print('native covariance a3 trace-average:',f'{a:.15f}','b5 trace-average:',f'{b:.15f}')
print('native G8 3x5 off-block norm:',f'{measured_mixing:.15f}')
print('native G8 five-carrier splitting norm:',f'{five_splitting:.15f}')
print('native 8-channel eigenvalues:',*(f'{e:.12f}' for e in spec))
print('face covariance diagonal min/max:',f'{np.diag(S).min():.15f}',f'{np.diag(S).max():.15f}')
print('hidden P3 (S◦S) P5 off-block norm:',f'{np.linalg.norm(mix):.15f}')
print('hidden real Gaussian un-centred means 3/5:',f'{realmean3:.15f}',f'{realmean5:.15f}')
print('native source modular susceptibility:',f'{chi:.15f}')
print('PASS 50-vertex complex local Wick tensor and 24-clock U1 covariance; restoring mass coefficient:',f'{mct2:.15f}')
print('SOURCE SHA256:',hashlib.sha256(path.read_bytes()).hexdigest())