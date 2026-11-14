#!/usr/bin/env python3
"""Q108: Born Fisher gauge response from actual Q106 unit SU2 moving charged band.

Q107 re-executes native Q101 whole-five/H64 and Q106 exact Berry topological
certificate. This computes a canonical response of a DECLARED one-step projective
measurement, not a physical 4D Maxwell inverse coupling.
"""
from pathlib import Path
import math,runpy
import numpy as np
import sympy as sp
from scipy.linalg import expm,expm_frechet
ROOT=Path(__file__).resolve().parents[2]
x=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q107_berry_topological_photon/Q107_BERRY_CHERN_AND_MAXWELL.py'))
n=x['n'];links=sorted(x['links']);D=x['D'];a3=x['a3']
assert n.shape==(30,3) and D.shape==(60,32)
sigma=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]])
S=np.einsum('aj,jkl->akl',n,sigma)
spin=np.array([np.linalg.eigh(y)[1][:,-1] for y in S])
I=np.zeros((60,30),int)
for k,(a,b) in enumerate(links):I[k,a]=1;I[k,b]=-1
assert np.linalg.matrix_rank(I)==29
h_unit=np.zeros((30,30),complex)
h_overlap=np.zeros((30,30),complex)
for a,b in links:
    u=(np.eye(2)+S[a]@S[b])/math.sqrt(2*(1+n[a]@n[b]))
    h_unit[a,b]=np.vdot(spin[a],u@spin[b])
    h_unit[b,a]=h_unit[a,b].conjugate()
    h_overlap[a,b]=np.vdot(spin[a],spin[b])
    h_overlap[b,a]=h_overlap[a,b].conjugate()
assert np.linalg.norm(h_unit-h_unit.conj().T)<1e-12
assert np.linalg.norm(h_overlap-h_overlap.conj().T)<1e-12
assert max(abs(abs(h_unit[a,b])-1) for a,b in links)<1e-12
amp2=(5-math.sqrt(5))/8
assert max(abs(abs(h_overlap[a,b])**2-amp2) for a,b in links)<1e-12
for f in x['faces']:
    v1=1+0j;v2=1+0j
    for k in range(len(f)):
        a,b=f[k],f[(k+1)%len(f)]
        v1*=h_unit[a,b];v2*=h_overlap[a,b]
    assert abs(np.angle(v1)-np.angle(v2))<1e-12
co_unit=sp.Rational(1,10)-sp.Rational(11,250)*sp.sqrt(5)
co_overlap=sp.Rational(13,160)-sp.Rational(29,800)*sp.sqrt(5)
for h,c in ((h_unit,co_unit),(h_overlap,co_overlap)):
    t=abs(h[links[0][0],links[0][1]])
    assert abs(float(c)-(t**4*math.cos(a3)**2/5))<1e-12
assert float(co_unit)>float(co_overlap)>0
L3=D[:,:20]@D[:,:20].T
assert np.linalg.matrix_rank(L3,tol=1e-10)==20

def fisher(h,tau):
    U=expm(-1j*tau*h)
    P=abs(U)**2
    assert np.linalg.norm(P.sum(axis=0)-1)<1e-10
    assert np.linalg.norm(P.sum(axis=1)-1)<1e-10
    derivatives=[]
    for a,b in links:
        dh=np.zeros_like(h)
        dh[a,b]=1j*h[a,b];dh[b,a]=-1j*h[b,a]
        dU=expm_frechet(-1j*tau*h,-1j*tau*dh,compute_expm=False)
        derivatives.append((2*(U.conj()*dU).real).ravel())
    dT=np.stack(derivatives,axis=1)
    assert np.linalg.norm(dT@I)<5e-12
    assert np.min(P)>1e-60
    F=(dT.T/P.ravel()[None,:])@dT/30
    F=(F+F.T)/2
    assert np.linalg.norm(F@I)<2e-11
    return F

for label,h,c in (('Q106 unit SU2',h_unit,float(co_unit)),
                  ('raw overlap',h_overlap,float(co_overlap))):
    # Every edge belongs to exactly one triangle. Every nonedge pair has
    # at most one two-step path: no 4-cycles. Thus first phase-sensitive
    # Born edge interference is the tau^3 triangle term; Fisher is tau^4.
    graph=(abs(h)>1e-12).astype(int)
    walks2=graph@graph
    assert all(walks2[a,b]==1 for a,b in links)
    assert all(walks2[a,b]<=1 for a in range(30) for b in range(30)
               if a!=b and not graph[a,b])
    for tau,limit in ((.05,.10),(.025,.03)):
        F=fisher(h,tau)
        relative=np.linalg.norm(F/tau**4-c*L3)/np.linalg.norm(c*L3)
        assert relative<limit,(label,tau,relative)
        spec=np.linalg.eigvalsh(F)
        assert sum(spec> (1e-12 if tau==.05 else 1e-13))==31
        assert abs(spec[28])<1e-9 and spec[29]>0
        print(label,'tau',tau,'leading analytic regression',relative,
              '11 subleading',spec[29],spec[39],
              '20 leading',spec[40],spec[-1])
    F=fisher(h,2*math.pi/24)
    w=np.linalg.eigvalsh(F)
    assert sum(w>1e-8)==31 and sum(abs(w)<1e-8)==29
    print(label,'24-clock phase Fisher min/max positive',w[29],w[-1],
          'trace',w.sum())
print('EXACT Q106 unit coefficient',co_unit,float(co_unit))
print('EXACT alternative overlap coefficient',co_overlap,float(co_overlap))
print('Same Chern +7; measured alpha and unique physical kinetic selection OPEN.')
print('Q108 NATIVE BORN FISHER STIFFNESS: PASS')
