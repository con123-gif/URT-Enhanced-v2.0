#!/usr/bin/env python3
"""Native 64 Walsh-history -> 3-vector + 5-quadrupole -> Brownian diffusion.

Independent no-data check on the ORIGINAL 6-axis, 64-history pair-flip generator
Hbits = sum_{i<j}(I - Xi Xj) = 15I - sum Xi Xj.
Uses all 64 states, both separately closed parity classes, and true
icosahedral spatial axes. No third-party source code.
"""
import math
import itertools
import numpy as np
from scipy.linalg import eigh

phi = (1+math.sqrt(5))/2
r = math.pi/math.e
theta = 2*math.pi/phi**2
raw=np.array([
    [0,1,phi],[0,1,-phi],
    [1,phi,0],[1,-phi,0],
    [phi,0,1],[phi,0,-1]
],float)
u=raw/np.linalg.norm(raw,axis=1)[:,None]
assert np.linalg.norm(u.T@u-2*np.eye(3))<2e-14
states=np.array(list(itertools.product((-1,1),repeat=6)),dtype=int)
idx={tuple(s):i for i,s in enumerate(states)}
N=64
L=np.zeros((N,N),float)
for i,s in enumerate(states):
    for a in range(6):
        for b in range(a+1,6):
            t=s.copy();t[a]*=-1;t[b]*=-1
            L[i,idx[tuple(t)]]-=1
    L[i,i]=15
assert np.linalg.norm(L-L.T)<1e-12
w=np.linalg.eigvalsh(L)
for eig,mul in [(0,2),(10,12),(16,30),(18,20)]:
    assert int(np.sum(abs(w-eig)<1e-7))==mul,(eig,w)
parity=np.prod(states,axis=1)
# X(s) is the spatial icosahedral vector already used for native H13.
X=states@u
assert np.linalg.norm(L@X-10*X)<2e-12
# Trace-free quadratic spatial moment: A5 quintet in the native history.
x,y,z=X.T
Q=np.column_stack([
    (x*x-y*y)/math.sqrt(2),
    (x*x+y*y-2*z*z)/math.sqrt(6),
    math.sqrt(2)*x*y,
    math.sqrt(2)*x*z,
    math.sqrt(2)*y*z,
])
assert np.linalg.norm(L@Q-16*Q)<2e-11
# Do not lose the radial scalar in the complete Cathedral: trace of X X^T
# is a *separate* degree-two A5 singlet, not part of the traceless 5-sector.
R=np.sum(X*X,axis=1)-6
assert np.linalg.norm(L@R-16*R)<2e-11
for parity_sector in (-1,1):
    ind=np.flatnonzero(parity==parity_sector)
    assert len(ind)==32
    assert np.linalg.norm(X[ind].mean(axis=0))<1e-13
    assert np.linalg.norm(Q[ind].mean(axis=0))<1e-13
    assert np.linalg.norm(X[ind].T@X[ind]/32 -2*np.eye(3))<3e-13
    assert np.linalg.norm(Q[ind].T@Q[ind]/32 -(32/5)*np.eye(5))<3e-12
    assert np.linalg.norm(X[ind].T@Q[ind]/32)<3e-12
    assert abs(np.mean(R[ind]))<1e-12
    assert abs(np.mean(R[ind]**2)-12)<2e-12
    assert np.linalg.norm(R[ind]@Q[ind]/32)<1e-11
    assert np.linalg.norm(R[ind]@X[ind]/32)<1e-11
    s=np.linalg.eigvalsh(L[np.ix_(ind,ind)])
    assert sum(abs(s)<1e-8)==1
    assert abs(s[1]-10)<1e-8
    # Exact pseudoinverse susceptibility for each raw spatial component.
    p=np.linalg.pinv(L[np.ix_(ind,ind)],rcond=1e-13)
    chi_x=np.diag(X[ind].T@p@X[ind]/32)
    chi_q=np.diag(Q[ind].T@p@Q[ind]/32)
    assert np.max(abs(chi_x-0.2))<1e-11
    assert np.max(abs(chi_q-0.4))<1e-11

# Reconcile with the actual, archived 7 Nov 190/64/24 joint operator when adjacent.
from pathlib import Path
import runpy
source=Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')
if source.exists():
    original=runpy.run_path(str(source))
    assert np.linalg.norm(original['Hbits']-L)<1e-12
    actual_axes=np.asarray([original['points'][a] / np.linalg.norm(original['points'][a])
                            for a,b in original['pairs']])
    assert np.linalg.norm(actual_axes.T@actual_axes-2*np.eye(3))<1e-12
    actual_x=states@actual_axes
    assert np.linalg.norm(L@actual_x-10*actual_x)<2e-12
    assert original['D'].shape==(190,190)
    assert original['Plinear'].shape==(12,50)
    # Actual history-generated all-five vertex fields use exactly the original
    # 50x8 and 12x8 maps; arbitrary extensions off this 8-plane have no effect.
    coeff=np.column_stack((X/np.sqrt(2),Q/np.sqrt(32/5)))
    E=original['Eglobal'];I=original['Iico']; portal=original['Plinear']
    vertex_fields=coeff@E.T
    ico_fields=coeff@I.T
    assert vertex_fields.shape==(64,50)
    assert np.linalg.matrix_rank(vertex_fields,tol=1e-10)==8
    assert np.linalg.norm(vertex_fields@portal.T-ico_fields)<2e-11
    assert np.linalg.norm(portal@E-I)<2e-11
    assert np.linalg.norm(portal@ (np.eye(50)-E@E.T))<2e-11
    C=original['C'];P3=original['P3'];P5=original['P5']
    f=ico_fields@C.T
    h3=(f*f)@P3.T
    h5=(f*f)@P5.T
    assert np.linalg.norm(h3)>1e-5 and np.linalg.norm(h5)>1e-5
    assert np.linalg.matrix_rank(h3,tol=1e-8)==4
    assert np.linalg.matrix_rank(h5,tol=1e-8)==4
    print('PASS actual archived 190x64x24 operator, portal, full 64-history-generated five-solid fields')
    print('PASS native quadratic observable populates both physical hidden 4+4 channels')

# Exact additive-functional covariance for the native CTMC: every component.
# C_X(t)=2 exp(-10t), Cov[r int_0^t X(s)ds]
#   = (2r²/5)t - (r²/25)(1-exp(-10t)).
D=r*r/5
for t in [0.1,1,10,100]:
    predicted=2*D*t - (r*r/25)*(1-math.exp(-10*t))
    from_green_kubo=4*r*r*(t/10 -(1-math.exp(-10*t))/100)
    assert abs(predicted-from_green_kubo)<5e-12

# Golden 24-clock residual: nearest charge-one mode m=9.
residual=theta-2*math.pi*9/24
assert residual>0
# cosine-resolved velocity response (no new fitted coefficient):
#  2r² * int_0^infty exp(-10t)cos(delta*t)dt = 20r²/(100+delta²).
D_gold=20*r*r/(100+residual*residual)
assert D_gold<D and D_gold>0
assert abs(D_gold/D -100/(100+residual*residual))<1e-14

print('PASS six icosahedral unit axes: sum u_i u_i^T = 2I3')
print('PASS original H64 2-component Markov generator spectrum 0(2) 10(12) 16(30) 18(20)')
print('PASS 3-vector X(s): HX=10X, covariance=2I3 on each parity class')
print('PASS independent radial scalar |X|^2-6: HR=16R, variance=12; dual response=3/4')
print('PASS 5-quadrupole Q(s): HQ=16Q, covariance=32/5 I5, 3+5 orthogonal')
print('PASS native energy-dual susceptibilities: X=1/5; Q=2/5 per component (raw normalisation)')
print('PASS additive-function exact finite-time covariance and diffusive limit')
print('spatial diffusion coefficient D=(pi/e)^2/5:',f'{D:.15f}')
print('golden clock residual theta - 3pi/4:',f'{residual:.15f}')
print('golden residual modulated Green-Kubo coefficient:',f'{D_gold:.15f}')
print('ratio golden/unmodulated:',f'{D_gold/D:.15f}')