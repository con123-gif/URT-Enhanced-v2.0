#!/usr/bin/env python3
"""Compute native signed-H64 64->3 Feshbach self-energy, pole residues, cyclicity.
No Koide inputs, no constructed mass parameters. Uses untouched October 8 NPZ.
"""
import json
from pathlib import Path
import numpy as np
from scipy.linalg import null_space
r=Path(__file__).resolve().parent
z=np.load(r/'golden_species_operators.npz')
G=z['generation6_frame'].astype(complex)
E=G@z['e_lower_frame']
assert np.linalg.norm(E.conj().T@E-np.eye(3))<1e-12
F=null_space(E.conj().T)
assert F.shape==(64,61)
K=z['e_K64_cross_variant_conditional']
A=E.conj().T@K@E;B=E.conj().T@K@F;D=F.conj().T@K@F
C=np.roll(np.eye(3),1,axis=0)
Pcyc=lambda X: sum(np.linalg.matrix_power(C,k)@X@np.linalg.matrix_power(C.T,k) for k in range(3))/3

res={'source':'golden_species_operators.npz','coupling':{'B_frobenius':float(np.linalg.norm(B)),'A_eigenvalues':np.linalg.eigvalsh(A).tolist()},'spectral_poles':[], 'dyson_checks':[]}
for w in [complex(-.1,.05),complex(0,.1),complex(.2,.05),complex(1.4,.05), complex(3,.05)]:
    H_eff=A+B@np.linalg.solve(w*np.eye(61)-D,B.conj().T)
    K_eff=w*np.eye(3)-H_eff
    K_from_full=np.linalg.inv(E.conj().T@np.linalg.inv(w*np.eye(64)-K)@E)
    res['dyson_checks'].append({'z':str(w),'difference':float(np.linalg.norm(K_eff-K_from_full)),'H_eff_eigs_real':np.linalg.eigvalsh((H_eff+H_eff.conj().T)/2).tolist(),'H_eff_noncyclic_norm':float(np.linalg.norm(H_eff-Pcyc(H_eff))), 'H_eff_full_norm':float(np.linalg.norm(H_eff))})

fullvals,fullvec=np.linalg.eigh(K)
weights=np.linalg.norm(E.conj().T@fullvec,axis=0)**2
chosen=np.argsort(weights)[::-1][:3]; chosen=chosen[np.argsort(fullvals[chosen])]
for idx in chosen:
    m=fullvals[idx]
    u=fullvec[:,idx]
    e=E.conj().T@u
    # Feshbach physical derivative, positive pole norm
    normQ=1+np.real(np.vdot(e, B@np.linalg.solve((m*np.eye(61)-D)@(m*np.eye(61)-D),B.conj().T@e)))/np.real(np.vdot(e,e))
    # dK/dz = I+B(z-D)^(-2) B† (sign verified)
    pole_mat=np.eye(3)+B@np.linalg.solve(m*np.eye(61)-D,np.linalg.solve(m*np.eye(61)-D,B.conj().T))
    deriv_norm=np.real(np.vdot(e,pole_mat@e))/np.real(np.vdot(e,e))
    from_overlap=1/weights[idx]
    meff=A+B@np.linalg.solve(m*np.eye(61)-D,B.conj().T)
    lamzero=float(np.linalg.norm((meff-m*np.eye(3))@e))
    res['spectral_poles'].append({'pole':float(m),'retained_residue':float(weights[idx]),'derivative_norm':float(deriv_norm),'inverse_residue':float(from_overlap),'zero_mode_residual':lamzero,'Keff_noncyclic':float(np.linalg.norm(meff-Pcyc(meff))),'Keff_full_norm':float(np.linalg.norm(meff))})

# baseline original and all 4 species, a compact summary
for species in ('u','d','e','nu'):
    Ks=z[f'{species}_K64_cross_variant_conditional']; Es=G@z[f'{species}_lower_frame']; Esp=np.linalg.eigh(Ks)
    ev=Esp[0];w=np.linalg.norm(Es.conj().T@Esp[1],axis=0)**2;ind=np.argsort(w)[::-1][:3];ind=ind[np.argsort(ev[ind])]
    vals=ev[ind]; res[species]={'poles':vals.tolist(),'residues':w[ind].tolist(),'Q_as_root':float(np.sum(vals**2)/np.sum(vals)**2),'Q_as_mass':float(np.sum(vals)/np.sum(np.sqrt(vals))**2)}
(r/'exact_full64_to3_output.json').write_text(json.dumps(res,indent=2))
print(json.dumps(res,indent=2))