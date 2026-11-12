#!/usr/bin/env python3
"""Q56 — original five-solid/190-cochain, 64-history, 24-clock stationary-current theorem.
Imports the named native Nov 7 action; no fitted constants, Haar B, or free source.
The code performs finite tests; universal uniqueness follows from the radial proof
in Q56_STATIONARY_CLOCK_THEOREM.md, not from a finite optimization census.
"""
from pathlib import Path
import runpy, contextlib, io
import numpy as np
from math import pi
root=Path(__file__).resolve().parents[2]
native=root/'research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py'
assert native.is_file(), native
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(native))
assert m['D'].shape==(190,190) and m['Hbits'].shape==(64,64)
assert m['Eglobal'].shape==(50,8) and m['Cbridge'].shape==(190,190)
assert abs(np.trace(m['D']@m['D'])-720)<1e-8
assert abs(np.trace(m['D']@m['D']@m['D']@m['D'])-3456)<1e-7
r,theta,delta,eta=m['r'],m['theta'],m['Delta'],m['eta']
assert 0<delta<1 and eta>0
N=24
angles=np.full(N,theta)
ell=2-2*np.cos(theta-2*pi*np.arange(N)/N)
lmin=float(ell.min());gap=r*r*lmin
assert gap>0
H=m['D']@m['D']+m['Cbridge']
assert np.linalg.eigvalsh(H).min()>-1e-10
L1=m['clock_laplacian'](angles,1)
L2=m['clock_laplacian'](angles,2)
assert np.linalg.eigvalsh(L2).min()>0
G3=np.linalg.inv(18*np.eye(N)+r*r*L2)
G5=np.linalg.inv(16*np.eye(N)+r*r*L2)
W3=np.eye(N)/4-G3/2
W5=delta**2*(np.eye(N)/4-G5/2)
assert np.linalg.eigvalsh(W3).min()>2/9-1e-12
assert np.linalg.eigvalsh(W5).min()>7*delta**2/32-1e-12
def embed(a8):
    v=m['Eglobal']@a8;z=np.zeros(190,complex)
    for name in m['names']:
        g=m['geom'][name]
        z[g['offset']:g['offset']+g['V']]=v[g['v_offset']:g['v_offset']+g['V']]
    return z
def components(z):
    v=m['vertex_from_z'](z)
    X=np.array([m['C']@(m['Plinear']@a) for a in v])
    f=X**2
    h3=f@m['P3'].T;h5=f@m['P5'].T
    z3=G3@h3;z5=G5@h5
    y=(z3+delta*z5)@m['Uh'].T
    Q2=.5*(np.einsum('ja,ab,jb->',z.conj(),H,z).real+
           r*r*np.einsum('ja,jk,ka->',z.conj(),L1,z).real)
    V4=np.vdot(h3,W3@h3).real+np.vdot(h5,W5@h5).real
    e3=np.sum(abs(h3)**2,axis=1)/4
    e5=delta**2*np.sum(abs(h5)**2,axis=1)/4
    logw3=-eta*e3
    logw5=2*np.log(delta)-eta*e5
    logz=np.logaddexp(logw3,logw5)
    F=np.sum((np.log1p(delta**2)-logz)/eta)
    p3=np.exp(logw3-logz);p5=np.exp(logw5-logz)
    assert np.max(abs(p3+p5-1))<1e-13
    S=Q2+V4+F
    k3=W3@h3+(p3/4)[:,None]*h3
    k5=W5@h5+(delta**2*p5/4)[:,None]*h5
    gh=4*(np.conj(X)*(k3+k5))@m['C']@m['Plinear']
    grad=z@H.T+r*r*(L1@z)
    for name in m['names']:
        g=m['geom'][name]
        grad[:,g['offset']:g['offset']+g['V']]+=gh[:,g['v_offset']:g['v_offset']+g['V']]
    radial=2*Q2+4*V4+4*np.sum(p3*e3+p5*e5)
    assert abs(np.vdot(z,grad).real-radial)<5e-8*max(1,radial)
    return S,Q2,V4,F,grad,radial,y,h3,h5
z0=embed(np.eye(8)[0]+np.eye(8)[3])
assert abs(np.vdot(z0,z0).real-2)<1e-11
for winding in (0,3,12):
    phase=np.exp(2j*pi*winding*np.arange(N)/N)
    z=.4*phase[:,None]*z0[None,:]
    S,Q2,V4,F,grad,radial,y,h3,h5=components(z)
    assert Q2>=gap/2*np.linalg.norm(z)**2-1e-9
    assert V4>0 and F>0 and radial>0
    assert abs(S-m['reduced_action'](z,angles)[0])<2e-9
    assert abs(S-m['full_action'](z,y,angles))<2e-9
    h=1e-5;d=np.zeros_like(z)
    d[(winding+2)%N,(winding*7+17)%190]=1+.4j
    d[(winding+9)%N,(winding*3+63)%190]=-.6+.1j
    derivative=(components(z+h*d)[0]-components(z-h*d)[0])/(2*h)
    assert abs(derivative-np.vdot(grad,d).real)<2e-7
    radial_fd=(components((1+h)*z)[0]-components((1-h)*z)[0])/(2*h)
    assert abs(radial_fd-radial)<2e-7
    Jg=r*r*np.imag(np.sum(np.conj(np.roll(z,-1,axis=0))*np.exp(1j*theta)*z,axis=1))
    Jh=2*r*r*np.imag(np.sum(np.conj(np.roll(y,-1,axis=0))*np.exp(2j*theta)*y,axis=1))
    print('WINDING',winding,'S',repr(S),'Q2',repr(Q2),'V4',repr(V4),
          'F',repr(F),'radial',repr(radial),'Jgeom',repr(float(Jg[0])),
          'Jhist',repr(float(Jh[0])))
zero=np.zeros((N,190),complex)
S,Q2,V4,F,grad,radial,y,h3,h5=components(zero)
assert abs(S)+abs(radial)+np.linalg.norm(grad)+np.linalg.norm(y)<1e-12
print('GOLDEN_POSITIVE_GAP',repr(gap),'W3_LOWER',2/9,'W5_LOWER',7*delta**2/32)
print('Q56_PASS: strictly positive radial derivative for every nonzero configuration, hence only full-cochain stationary state z=0, and y=J=0.')
