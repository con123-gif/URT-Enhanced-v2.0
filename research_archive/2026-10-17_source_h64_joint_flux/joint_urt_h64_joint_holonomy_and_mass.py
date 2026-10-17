#!/usr/bin/env python3
"""Unfitted charged U(1) holonomy of recovered signed H64 twelve-history source.

SOURCE is a byte-for-byte subset of the October 8 archived NPZ, not an invented
Koide mass operator. Conditional dynamical completion: physical one-particle
Hamiltonian H_f=D_f† D_f, three-generation Fock determinant at eta=-log(Delta).
Colour multiplicities and charges use recovered physical primitive 3Q chart.

Outputs exact source matrices' 3x3 low-flux harmonic response, selected compact
holonomy, equilibrium currents, and direct pole spectra. No lepton data used.
"""
from pathlib import Path
import json, numpy as np
from scipy.optimize import minimize_scalar
from numpy.linalg import norm, inv, eigvalsh, eigh

root=Path(__file__).resolve().parent
z=np.load(root/'original_h64_species_link_source.npz')
PHI=(1+np.sqrt(5))/2
DELTA=3/20-80*np.pi/(1053*PHI)
ETA=-np.log(DELTA)
N=12
names=['u','d','e','nu'];charges={'u':2,'d':-1,'e':-3,'nu':0}
mult={'u':3,'d':3,'e':1,'nu':1}

def D_and_Dprime(f,theta,derivative=True,site_gauge=None):
    amp=z[f+'_amplitudes']; U=z[f+'_polar_links']
    D=np.zeros((36,36),complex); Dp=np.zeros_like(D)
    if site_gauge is None:site_gauge=np.zeros(12)
    for k in range(N):
        j=(k+1)%N
        factor=np.exp(1j*(charges[f]*theta/N+site_gauge[j]-site_gauge[k]))
        w=amp[j]
        D[3*k:3*k+3,3*k:3*k+3]=-w@U[k]*factor
        D[3*k:3*k+3,3*j:3*j+3]=w
        Dp[3*k:3*k+3,3*k:3*k+3]=(-1j*charges[f]/N)*w@U[k]*factor
    return D,Dp

def energy_and_slope(f,theta):
    D,Dp=D_and_Dprime(f,theta)
    h=D.conj().T@D
    val,V=eigh(h)
    ff=-np.sum(np.logaddexp(0.,-ETA*val))
    hp=Dp.conj().T@D+D.conj().T@Dp
    fermi=1/(1+np.exp(ETA*val))
    slope=ETA*np.sum(fermi*np.einsum('ij,ji->i',V.conj().T@hp@V,np.eye(36)).real)
    return ff,float(slope),val

def total(x):
    r=[energy_and_slope(f,x) for f in names]
    return float(sum(mult[f]*t[0] for f,t in zip(names,r)))

def total_slope(x):
    return float(sum(mult[f]*energy_and_slope(f,x)[1] for f in names))

# Deterministic global numeric scan and refinement of compact primitive phase.
xs=np.linspace(-np.pi,np.pi,361)
fvals=np.array([total(x) for x in xs]);im=int(np.argmin(fvals))
assert 0<im<len(xs)-1
zmin=minimize_scalar(total,bounds=(xs[im-1],xs[im+1]),method='bounded',options={'xatol':1e-13})
chi=float(zmin.x)
assert zmin.success
assert abs(total_slope(chi))<3e-7
assert abs(total(chi)-total(-chi))<1e-10

# Unit gauge (site rephasing) covariance, full 36x36 spectrum.
rng=np.random.default_rng(8811)
theta=rng.normal(size=12)
for f in names:
    D,_=D_and_Dprime(f,chi)
    Dnew,_=D_and_Dprime(f,chi,site_gauge=theta)
    h=D.conj().T@D;hnew=Dnew.conj().T@Dnew
    gauge=np.diag(np.repeat(np.exp(1j*theta),3))
    assert norm(hnew-gauge@h@gauge.conj().T)<2e-12
    assert norm(eigvalsh(h)-eigvalsh(hnew))<1e-12

# 3x3 homogenized/integrated quadratic holonomy stiffness.
effective={}
for f in names:
    amp=z[f+'_amplitudes']; U=z[f+'_polar_links']
    R=np.eye(3,dtype=complex);G=np.zeros((3,3),dtype=complex)
    for k in range(N):
        R=U[k]@R
        B=R.conj().T@amp[(k+1)%N].conj().T@amp[(k+1)%N]@R
        G+=inv(B)
    assert norm(R-np.eye(3))<2e-13
    K=(inv(G))/N
    spectrum=eigvalsh(K)
    # Cross-check actual finite phi2 (q phi) history eigenvalues against analytic O(phi²)
    probe=1e-3
    e_actual=eigvalsh(D_and_Dprime(f,probe)[0].conj().T@D_and_Dprime(f,probe)[0])[:3]
    if charges[f]:
        e_expected=(charges[f]*probe)**2*spectrum
        rel=float(norm(e_actual-e_expected)/norm(e_expected))
        assert rel<5e-7, (f,rel)
    else:rel=None
    effective[f]={'eigenvalues':spectrum.tolist(),
                  'leading_flux_energy_per_primitive_phase_squared':(charges[f]**2*spectrum).tolist(),
                  'full_matrix_real':K.real.tolist(),
                  'full_matrix_imag':K.imag.tolist(),
                  'small_flux_relative_error':rel}

report={'source':'Original Oct 8 signed64 loaded amplitudes and twelve chronological polar links',
  'dynamical_hypothesis':'Archived positive Fock H=D†D at beta/a=eta; primitive charges 3Q and color multiplicity',
  'constants':{'phi':PHI,'delta':DELTA,'eta':ETA},
  'selected_primitive_flux_rad':chi,
  'opposite_stationary_flux_rad':-chi,
  'free_energy_at_stationary':total(chi),
  'free_energy_at_zero':total(0.),
  'free_energy_at_2pi_over3':total(2*np.pi/3),
  'free_energy_at_pi':total(np.pi),
  'total_source_current_at_stationary':-total_slope(chi),
  'curvature_at_stationary':(total(chi+.001)-2*total(chi)+total(chi-.001))/1e-6,
  'source_sector_contributions':{},'small_flux_effective_3x3':effective,
  'spectrum':{},'grid_minimum_rad':float(xs[im])}
for f in names:
    F,dF,ev=energy_and_slope(f,chi)
    report['source_sector_contributions'][f]={'charge_3Q':charges[f], 'multiplicity':mult[f],
      'dimensionless_free_energy':float(F),
      'primitive_current_contribution':float(-mult[f]*dF),
      'smallest_eigenvalues':ev[:6].tolist()}
    if charges[f]:
        m=np.clip(ev[:3],0,None)
        report['spectrum'][f]={'three_positive_low_energy_eigenvalues':m.tolist(),
          'energy_ratios_2_over_1':float(m[1]/m[0]),'energy_ratios_3_over_2':float(m[2]/m[1]),
          'Koide_Q_if_energies_are_masses':float(m.sum()/np.sqrt(m).sum()**2),
          'Koide_Q_if_energies_are_sqrt_masses':float((m@m)/m.sum()**2)}
assert abs(sum(v['primitive_current_contribution'] for v in report['source_sector_contributions'].values()))<3e-7
(root/'numerical_result.json').write_text(json.dumps(report,indent=2))
print('selected primitive flux',chi,'free energy',total(chi),'F(0)',total(0))
print('global current contributions', {n:round(s['primitive_current_contribution'],9) for n,s in report['source_sector_contributions'].items()})
print('net current',report['total_source_current_at_stationary'],'curvature',report['curvature_at_stationary'])
print('e true 3x3 stiffness eigs',effective['e']['eigenvalues'])
print('e selected three lowest',report['spectrum']['e'])
print('All direct matrix, gauge, current, and quadratic-Hodge checks pass.')
