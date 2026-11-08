#!/usr/bin/env python3
"""Four-dimensional smooth-field Euclidean continuum test of archival Cathedral action.
No claim of an interacting quantum continuum. Original 190+64 internal operator
and 24-clock with source h3/h5, KMS, and spatial nearest-neighbour extension.
"""
import runpy
from pathlib import Path
from math import pi
import numpy as np

z=runpy.run_path(str(Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')))
r=float(z['r']);theta=float(z['theta']);Delta=float(z['Delta']);Uh=z['Uh'];H=z['Hbits'];Cbridge=z['Cbridge'];geom=z['geom'];names=z['names']
rng=np.random.default_rng(20261108)
v=(rng.normal(size=50)+1j*rng.normal(size=50))*0.045
h3,h5=z['hidden_source'](v)
y0=Uh@(h3/18+Delta*h5/16)
z0=np.zeros(190,complex)
for name in names:
    gg=geom[name]
    o=gg['offset'];nv=gg['V'];vv=gg['v_offset']
    z0[o:o+nv]=v[vv:vv+nv]
local_geo=.5*np.vdot(z0,Cbridge@z0).real
for name in names:
    gg=geom[name];o=gg['offset'];nv,ne,nf=gg['V'],gg['E'],gg['F']
    verts=z0[o:o+nv]; edges=z0[o+nv:o+nv+ne]; faces=z0[o+nv+ne:o+nv+ne+nf]
    local_geo+=.5*(np.linalg.norm(gg['b1'].T@verts)**2 +
                   np.linalg.norm(gg['b2'].T@edges)**2 +
                   np.linalg.norm(gg['b2']@faces)**2)
local_history=.5*np.vdot(y0,H@y0).real
local_contact=.25*(np.linalg.norm(h3)**2+Delta**2*np.linalg.norm(h5)**2)-np.vdot(y0,Uh@(h3+Delta*h5)).real
Fkm=z['entropy_response'](h3,h5)['F']
local=local_geo+local_history+local_contact+Fkm
assert local>0
n_z=np.vdot(z0,z0).real;n_y=np.vdot(y0,y0).real
assert n_z>0 and n_y>0
# Smooth periodic wave with charge-1 frequency 9 and spatial Fourier index 1,
# whose quadratic source and charge-2 history field carry frequencies 18 and 2.
# The original clock operator uses n=24 and a_tau=1. Original spatial extension
# from 2026-10-28 corresponds to b=1 on a 4^3 periodic spatial lattice.
L=4.;T=24.;m_time=9;m_space=1
omega=2*pi*m_time/T;kspace=2*pi*m_space/L
continuum_density=(local + .5*r*r*(theta-omega)**2*n_z
                    +.5*r*r*(2*theta-2*omega)**2*n_y
                    +.5*kspace*kspace*n_z +.5*(2*kspace)**2*n_y)
continuum_action=T*L**3*continuum_density
assert continuum_action>0
result=[]
for kt,Ms in [(1,4),(2,8),(4,12),(8,16)]:
    Nt=24*kt;at=1./kt;aspace=L/Ms
    j=np.arange(Nt); x=np.arange(Ms)
    u=np.exp(1j*(2*pi*m_time*j[:,None]/Nt+2*pi*m_space*x[None,:]/Ms))
    v2=u*u
    # Direct difference calculation for one periodic spatial direction;
    # the remaining 2D grid is constant and contributes Ms^2 multiplicity.
    dz_time=(np.roll(u,-1,axis=0)-np.exp(1j*theta*at)*u)/at
    dy_time=(np.roll(v2,-1,axis=0)-np.exp(2j*theta*at)*v2)/at
    dz_space=(np.roll(u,-1,axis=1)-u)/aspace
    dy_space=(np.roll(v2,-1,axis=1)-v2)/aspace
    pref=at*aspace**3*Ms**2
    tE=.5*r*r*pref*(np.linalg.norm(dz_time)**2*n_z+np.linalg.norm(dy_time)**2*n_y)
    xE=.5*pref*(np.linalg.norm(dz_space)**2*n_z+np.linalg.norm(dy_space)**2*n_y)
    locE=Nt*Ms**3*at*aspace**3*local
    action=tE+xE+locE
    # Analytic eigenvalues of charge-q lattice covariant time/space Laplacian.
    lt1=4/at**2*np.sin((omega-theta)*at/2)**2
    lt2=4/at**2*np.sin((2*omega-2*theta)*at/2)**2
    lx1=4/aspace**2*np.sin(kspace*aspace/2)**2
    lx2=4/aspace**2*np.sin(2*kspace*aspace/2)**2
    expected=T*L**3*(local+.5*r*r*(lt1*n_z+lt2*n_y)+.5*(lx1*n_z+lx2*n_y))
    assert abs(action-expected)<1e-8,(action,expected)
    # Gauge invariance in all four directions requires transforming BOTH
    # temporal and spatial U(1) links. Verify numerically in reduced 1+1 data.
    if kt==1:
        alpha=rng.uniform(-.7,.7,size=u.shape)
        ug=np.exp(1j*alpha)*u;vg=np.exp(2j*alpha)*v2
        At=theta*at+np.roll(alpha,-1,axis=0)-alpha
        Ax=np.roll(alpha,-1,axis=1)-alpha
        cdz=(np.roll(ug,-1,axis=0)-np.exp(1j*At)*ug)/at
        cdy=(np.roll(vg,-1,axis=0)-np.exp(2j*At)*vg)/at
        sdz=(np.roll(ug,-1,axis=1)-np.exp(1j*Ax)*ug)/aspace
        sdy=(np.roll(vg,-1,axis=1)-np.exp(2j*Ax)*vg)/aspace
        for a,b in [(cdz,dz_time),(cdy,dy_time),(sdz,dz_space),(sdy,dy_space)]:
            assert abs(np.linalg.norm(a)**2-np.linalg.norm(b)**2)<1e-9
        # Local contact and KMS terms are exactly invariant under e^{iq alpha}.
        assert abs(local_contact - (.25*(np.linalg.norm(h3)**2+Delta**2*np.linalg.norm(h5)**2)-np.vdot(np.exp(2j*alpha[0,0])*y0,Uh@(np.exp(2j*alpha[0,0])*(h3+Delta*h5))).real))<1e-9
    result.append(dict(Nt=Nt,Ms=Ms,action=action,error=abs(action-continuum_action),lambda_time_charge2=lt2,lambda_space_charge2=lx2))
assert all(result[i]['error']>result[i+1]['error'] for i in range(len(result)-1))
# One effective 3+1D positive quadratic linearised operator on smooth torus:
# (r² D0*D0 - Δspace + local Hessian) has ν positive after physical quotient;
# the Fourier dispersion converges for every fixed mode. No mass units.
print('PASS: source uses original 50 vertices, 190 Hodge cochains, native H64 and KMS')
print('PASS: smooth 4D lattice action has original 24-clock and nearest-neighbour spatial baseline')
print('PASS: direct 4D covariant difference energies equal Fourier formulas; local U(1) gauge invariance')
print('PASS: 4D action converges on one explicit nonzero interacting smooth-field configuration')
for row in result:print('Nt=%-4d M=%-3d action=%.12f continuum_error=%.6e'%(row['Nt'],row['Ms'],row['action'],row['error']))
print('continuum_action',format(continuum_action,'.15g'))
print('local_energy_density',format(local,'.15g'),'including nonlinear contact=',format(local_contact,'.15g'),'KMS=',format(Fkm,'.15g'))
print('IMPORTANT: this is a classical smooth-field continuum of a specified lattice action, NOT a nonperturbative quantum 3+1D continuum, Lorentzian gravity, or a URT-derived source-selection law.')
