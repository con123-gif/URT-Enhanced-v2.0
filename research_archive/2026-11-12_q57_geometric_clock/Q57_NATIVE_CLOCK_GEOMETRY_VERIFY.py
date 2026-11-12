#!/usr/bin/env python3
"""Q57 native all-five geometric energy shells and conditional two-mode clock.
No fitted parameters; real-time Hamiltonian law is OPTIONAL, not derived.
"""
from pathlib import Path
import contextlib,io,runpy,os
from math import pi,sqrt
import numpy as np
root=Path(__file__).resolve().parents[2]
path=Path(os.environ['Q57_LOCAL_NATIVE']) if 'Q57_LOCAL_NATIVE' in os.environ else root/'research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py'
with contextlib.redirect_stdout(io.StringIO()): m=runpy.run_path(str(path))
assert m['D'].shape==(190,190) and m['Hbits'].shape==(64,64)
assert len(m['names'])==5 and m['Eglobal'].shape==(50,8)
H=m['D']@m['D']+m['Cbridge']; spec=np.linalg.eigvalsh(H)
assert np.max(abs(spec[:2]))<1e-10 and spec[2]>.7
N=24; ns=np.arange(N); theta=m['theta']; r=m['r']
ell=2-2*np.cos(theta-2*pi*ns/N); inds=np.argsort(ell)
assert (int(inds[0]),int(inds[1]))==(9,10)
L=m['clock_laplacian'](np.full(N,theta),1)
gap=r*r*ell[9]; o10=r*r*ell[10]; beat=o10-gap
u0=np.zeros(190,complex);u2=np.zeros(190,complex)
for name in m['names']:
 g=m['geom'][name];o,V,E,F=g['offset'],g['V'],g['E'],g['F']
 u0[o:o+V]=g['h0']/sqrt(5)
 u2[o+V+E:o+V+E+F]=g['hf']/sqrt(5)
assert np.linalg.norm(H@u0)+np.linalg.norm(H@u2)<1e-10
assert abs(np.vdot(u0,u0)-1)+abs(np.vdot(u2,u2)-1)<1e-12
for u in (u0,u2,(u0+1j*u2)/sqrt(2)):
 z=np.exp(2j*pi*9*ns/N)[:,None]*u[None,:]/sqrt(N)
 S,y,V,h3,h5=m['reduced_action'](z,np.full(N,theta))
 assert abs(S-gap/2)<1e-9
 assert np.linalg.norm(y)+np.linalg.norm(h3)+np.linalg.norm(h5)+abs(V)<1e-9
 assert np.linalg.norm(z@H.T+r*r*L@z-gap*z)<1e-10
 j=r*r*np.imag(np.sum(np.conj(np.roll(z,-1,axis=0))*np.exp(1j*theta)*z,axis=1))
 assert np.max(abs(j-r*r*np.sin(theta-2*pi*9/N)/N))<1e-11
 assert abs(np.sum(j)-r*r*np.sin(theta-2*pi*9/N))<1e-11
 assert abs(S-m['full_action'](z,y,np.full(N,theta)))<1e-9
E=np.exp(2j*pi*9*ns/N);F=np.exp(2j*pi*10*ns/N)
for t in (0.,1.,13.7,44.):
 z=(np.exp(-1j*gap*t)*E[:,None]+np.exp(-1j*o10*t)*F[:,None])*u0[None,:]/sqrt(2*N)
 assert abs(np.linalg.norm(z)**2-1)<1e-12
 assert abs(m['reduced_action'](z,np.full(N,theta))[0]-(gap+o10)/4)<1e-9
 density=np.sum(abs(z)**2,axis=1)
 expected=(1+np.cos(-2*pi*ns/N+beat*t))/N
 assert np.max(abs(density-expected))<1e-11
print('Q57_PASS','Hodge_bridge_nullity',2,'lowest_windings',9,10,
      'Emin_R2=1',repr(gap/2),'Jtotal_R2=1',repr(r*r*np.sin(theta-2*pi*9/N)),
      'beat',repr(beat),'period',repr(2*pi/beat))
print('STATUS: Q56 strict radial monotonicity implies smooth compact star-shaped action levels; real-time Hamiltonian postulate NOT derived.')
