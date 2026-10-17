#!/usr/bin/env python3
"""Conditional photon-dressed chiral 3D / triplet experiment.
A5-symmetric thermal state has zero edge-current; conditioning on a
geometric POVM outcome (and face-orbit average) generates a conserved source.
Source H=abs(W) and orbit preparation are hypotheses, not canonical mass action.
"""
import importlib.util, pathlib, numpy as np, json
from numpy.linalg import norm,eigh,pinv,eigvalsh
source=pathlib.Path(__file__).parent/'native_bulk_peierls_check.py'
spec=importlib.util.spec_from_file_location('bulk',source)
bulk=importlib.util.module_from_spec(spec);spec.loader.exec_module(bulk)
g=bulk
a0=np.eye(20)
Ph=g.P3+g.P5
E=[Ph@np.diag(g.cinc[:,i])@Ph/3 for i in range(12)]

def sqrtPSD(E):
    l,U=eigh((E+E.T)/2)
    return (U*np.sqrt(np.maximum(l,0)))@U.T

def cond(E):
    U=sqrtPSD(E); r=U@g.rho@U
    return r/np.trace(r).real

def current(r):
    return sum((-2*np.imag(r[a,b]))*g.path_vector(a,b) for a,b in g.Wedges)

rho_by_v=[cond(e) for e in E]
Jv=[current(r) for r in rho_by_v]
assert max(norm(g.Adual@j) for j in Jv)<2e-10
assert abs(norm(Jv[0])-norm(Jv[11]))<1e-10
rho_face=sum(rho_by_v[i] for i in g.faces[0])/3
j_face=current(rho_face)
assert norm(g.Adual@j_face)<2e-10

def link_transport_h(A_shell):
    H=np.zeros((20,20),complex)
    for a,b in g.Wedges:
        theta=g.path_vector(a,b)@A_shell
        H[a,b]=np.exp(1j*theta)
        H[b,a]=np.exp(-1j*theta)
    return H

def face_probe(j):
    J=np.r_[j,np.zeros(20)]
    A=g.g2*pinv(g.Kd,hermitian=True)@J
    return A[:30],g.b2d[:,30:].T@A

Aface,fluxface=face_probe(j_face)
Avertex,fluxvertex=face_probe(Jv[0])
U0,U1,U2,U3=g.c.bases(g.v,g.vc,g.faces,g.ds[1],g.ds[2])
ph=link_transport_h(Aface)
zero=link_transport_h(np.zeros(30))
# Full 6D triplet and 2 3D projected Hermitian operators, NO insertion of Koide ansatz.
trips={}
for name,U in [('T1',U3[:,:3]),('T2',U3[:,3:])]:
    H0=U.T@zero@U
    Hd=U.T@ph@U
    # A5-symmetric source has H0 scalar; chosen face current breaks A5 down to C3
    sp0=np.sort(eigvalsh(H0));sp=np.sort(eigvalsh(Hd));
    # imaginary component -> orientation odd
    trips[name]={'undressed_eigenvalues':list(map(float,sp0)), 'dressed_eigenvalues':list(map(float,sp)), 'imaginary_norm':float(norm(Hd.imag)), 'nonuniform_splitting_norm':float(norm(Hd-np.trace(Hd)/3*np.eye(3))), 'reconstruction_commutator_C3_norm':None}
    print(name,trips[name])

# Direct FD Ward current identity for conditioned face state in the Peierls kinetic model.
rng=np.random.default_rng(11)
q=rng.standard_normal(30);q/=norm(q)
h=2e-5
def expect(A,r):return float(np.trace(r@link_transport_h(A)).real)
fd=-(expect(h*q,rho_face)-expect(-h*q,rho_face))/(2*h)

out={
 'native_signed_60_hops_are_dual_distance_2':len(g.Wedges),
 'unique_geodesic_for_each_chiral_hop':len(g.Wedges),
 'A5_symmetric_Gibbs_current_norm':float(norm(g.Jdual)),
 'conditioned_single_vertex_current_norm':float(norm(Jv[0])),
 'conditioned_oriented_face_current_norm':float(norm(j_face)),
 'face_current_divergence_norm':float(norm(g.Adual@j_face)),
 'photon_drive_phase_max_vertex':float(max(abs(fluxvertex))),
 'photon_drive_phase_max_face':float(max(abs(fluxface))),
 'peierls_FD_source_vs_current':{'finite_difference':float(fd),'analytic':float(j_face@q),'residual':float(abs(fd-j_face@q))},
 'projected_generation_blocks':trips,
 'status':'conditional POVM face selection and Hface=abs(W) is not selected canonical H64 lepton mass action'
}
print(json.dumps(out,indent=2))
pathlib.Path(__file__).with_name('chiral_results.json').write_text(json.dumps(out,indent=2))

# Strict gauge covariance: link A -> A + d lambda must only conjugate full hopping H.
lam=np.random.default_rng(21).normal(scale=0.3,size=20)
A_g=Aface+g.Adual.T@lam
G=np.diag(np.exp(-1j*lam))
gauge_matrix_error=norm(link_transport_h(A_g)-G@ph@G.conj().T)
gauge_spectrum_error=norm(eigvalsh(link_transport_h(A_g))-eigvalsh(ph))
assert gauge_matrix_error<1e-10 and gauge_spectrum_error<1e-10

# Every oriented face is symmetry-equivalent; compare all 20 source-induced spectra.
all_eigs=[]; all_current=[]; all_phases=[]
for f in g.faces:
    j=current(sum(rho_by_v[i] for i in f)/3)
    A,phs=face_probe(j)
    all_eigs.append(eigvalsh(link_transport_h(A)))
    all_current.append(norm(j))
    all_phases.append(max(abs(phs)))
all_eigs=np.stack(all_eigs)
symmetry_eigs_error=float(np.max(norm(all_eigs-all_eigs[0],axis=1)))
assert symmetry_eigs_error<1e-9

# Unit-strength photon chart: no empirical/candidate alpha used.
unit_A=Aface/g.g2
unit_flux=fluxface/g.g2
unit_H=link_transport_h(unit_A)
unit_triplets={}
for name,U in [('T1',U3[:,:3]),('T2',U3[:,3:])]:
    unit_triplets[name]=list(map(float,eigvalsh(U.T@unit_H@U)))
more={'gauge_matrix_covariance_error':float(gauge_matrix_error),
 'gauge_invariant_full_spectrum_error':float(gauge_spectrum_error),
 '20_oriented_face_branches_full_spectrum_max_residual':symmetry_eigs_error,
 '20_oriented_face_source_current_norm_spread':float(np.ptp(all_current)),
 'unit_photon_chart_face_flux_phase_max':float(np.max(abs(unit_flux))),
 'unit_photon_chart_triplet_spectra':unit_triplets,
 'unit_photon_chart_full20_spectrum':list(map(float,eigvalsh(unit_H)))}
out.update(more)
pathlib.Path(__file__).with_name('chiral_results.json').write_text(json.dumps(out,indent=2))
print('ADDITIONAL VERIFIED:',json.dumps(more,indent=2))
