#!/usr/bin/env python3
"""Read-only, independently executable physical-stability audit of the
existing Cathedral 190-geometry / 64-history / 24-clock spatial action.

Source equations reviewed (no repository modification):
  cathedral_core/full_dynamics.py (2026-11-08)
  cathedral_core/spatial_dynamics.py (2026-11-08)
  cathedral_core/history_propagation.py (2026-11-08)
  docs/NATIVE_URT_UNIFIED_SPATIAL_INTERACTION_2026_11_08.md

This computes an exact invariant slice of the FULL nonlinear action:
all five Platonic geometric amplitudes z_j=0, so h3=h5=0 and the
KMS term is 0; independent history fields y_{j,s} remain dynamic.
It does not claim to execute the original project source in this container.
"""
import json
from math import sqrt, pi, e, cos
from pathlib import Path
import numpy as np
from scipy.optimize import brentq

PHI=(1+sqrt(5))/2
R=pi/e
THETA=2*pi/PHI**2
N=24
M=18
AXES=np.array([[0,1,PHI],[0,1,-PHI],[1,PHI,0],
               [1,-PHI,0],[PHI,0,1],[PHI,0,-1]],float)
AXES/=np.linalg.norm(AXES,axis=1)[:,None]
SIGNS=np.array([[1-2*((s>>i)&1) for i in range(6)] for s in range(64)])
VELOCITIES=R*SIGNS@AXES
H=15*np.eye(64)
for s in range(64):
    for a in range(6):
        for b in range(a+1,6):
            H[s,s^(1<<a)^(1<<b)]-=1

assert np.allclose(AXES.T@AXES,2*np.eye(3),atol=1.e-13)
assert np.allclose(H,H.T)
spec, mult = np.unique(np.round(np.linalg.eigvalsh(H),8),return_counts=True)
assert np.array_equal(spec,np.array([0.,10.,16.,18.]))
assert np.array_equal(mult,np.array([2,12,30,20]))

CLOCK=R**2*(2-2*cos(2*THETA-2*pi*M/N))
CERT_K=sqrt((10*CLOCK+CLOCK*CLOCK)/(2*R*R))
PARITY=np.prod(SIGNS,axis=1)
DIRECTIONS={
    'coordinate-x': np.array([1.,0,0]),
    '3fold': np.array([1.,1.,1.]),
    '5fold': AXES[0],
    'generic': np.array([.17,.51,.84]),
}
CROSSINGS={}
for pname in [-1,1]:
    ids=np.flatnonzero(PARITY==pname)
    hh=H[np.ix_(ids,ids)]
    z=np.ones(32)/sqrt(32)
    assert np.linalg.norm(hh@z)<1e-12
    for label,d in DIRECTIONS.items():
        d=d/np.linalg.norm(d)
        vel=VELOCITIES[ids]@d
        w=vel*z
        assert abs(w@w-2*R**2)<1e-12
        assert np.linalg.norm(hh@w-10*w)<1e-11
        assert abs(w@(vel*w))<1e-12
        def lo(k): return float(np.linalg.eigvalsh(hh+np.diag(k*vel))[0]+CLOCK)
        root=brentq(lo,.001,.5,xtol=1.e-13)
        assert root<CERT_K
        assert lo(CERT_K)<1e-9
        CROSSINGS[f'parity_{pname}_{label}']=root

# Physical-mode certificate: geometry is ZERO in the FULL nonlinear action,
# with y occupying a single native signed history and m=18 clock Fourier mode.
# Charge Q=||z||²+2||y||² is exactly 1 for the normalized field.
S=int(np.argmax(VELOCITIES[:,0]))
VX=float(VELOCITIES[S,0])
j=np.arange(N)
y=np.zeros((N,64),complex)
y[:,S]=np.exp(1j*2*pi*M*j/N)/sqrt(2*N)
charge=2*float(np.vdot(y,y).real)
clockdiff=np.roll(y,-1,axis=0)-np.exp(2j*THETA)*y
base_energy=(np.vdot(y,y@H.T).real +R*R*np.vdot(clockdiff,clockdiff).real)/2
assert abs(charge-1)<1e-12
assert abs(base_energy-(15+CLOCK)/4)<1e-12
energies={}
for n in [0,1,2,3,4,5,10,20,100]:
    # Periodic spatial plane wave exp(-i n x) on a 2pi torus;
    # normalized spatial integral of |wave|²=1.
    kx=-n
    kinetic=.5*np.vdot(y,y@np.diag(VELOCITIES[:,0]*kx)).real
    E=base_energy+kinetic
    assert abs(E-(15+CLOCK-n*VX)/4)<1e-11
    energies[str(n)]=float(E)
assert energies['5']<0 and energies['100']<energies['5']

results={
  'branch':'newtons-cathedral',
  'scope':'exact z=0 invariant field slice of existing 190x64x24 nonlinear spatial Hamiltonian',
  'independent_numerical_reconstruction':True,
  'original_project_source_executed_here':False,
  'provenance':'No third-party research code or source imported; no GitHub changes',
  'native_H64_spectrum': {str(int(a)):int(b) for a,b in zip(spec,mult)},
  'r_pi_over_e':R,
  'clock_sector_m':M,
  'clock_offset':CLOCK,
  'certified_all_direction_negative_branch_for_k_gt':CERT_K,
  'actual_numeric_zero_crossings':CROSSINGS,
  'max_speed':float(np.max(np.linalg.norm(VELOCITIES,axis=1))),
  'normalized_charge':charge,
  'plane_wave_selected_history':S,
  'plane_wave_velocity_x':VX,
  'mode_energy_formula':'E_n=(15 + clock_offset - n*velocity_x)/4, Q=1, Lx=2pi',
  'mode_energies':energies,
  'conclusion':'Spatial continuum Hamiltonian unbounded below at FIXED U(1) charge Q=1 even with all original nonlinear terms present (they vanish when z=0).'
}
Path('/mnt/data/cathedral_native_spatial_vacuum_audit_2026-11-09.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results,indent=2))
