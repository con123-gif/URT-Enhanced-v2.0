#!/usr/bin/env python3
"""Source-exact H64 -> active 14 -> active 4 plus 10 spectators.
Uses unmodified original golden_species_operators.npz. No masses/Koide input.
"""
import json, hashlib
from pathlib import Path
import numpy as np
root=Path(__file__).resolve().parent
original=root/'golden_species_operators.npz'
z=np.load(original)
G=z['generation6_frame'];H=z['hidden8_frame'];N=np.column_stack((G,H))
assert np.linalg.norm(N.conj().T@N-np.eye(14))<1e-12
Delta=3/20-80*np.pi/(1053*((1+np.sqrt(5))/2))
result={'original_sha256':hashlib.sha256(original.read_bytes()).hexdigest(), 'Delta':float(Delta),'species':{}}
for typ in ('u','d','e','nu'):
 K0=z[f'{typ}_K64_base_conditional'];K=z[f'{typ}_K64_cross_variant_conditional']
 P=N@N.conj().T
 invariant=np.linalg.norm((np.eye(64)-P)@K@N)
 assert invariant<1e-11
 deltaK=K-K0; l,V=np.linalg.eigh(deltaK)
 w=V[:,-1]*np.sqrt(l[-1]);assert np.linalg.norm(deltaK-np.outer(w,w.conj()))<1e-11
 A6=G.conj().T@K0@G;D8=H.conj().T@K0@H
 e6,U6=np.linalg.eigh(A6);ev8,U8=np.linalg.eigh(D8)
 wt6=np.abs(U6.conj().T@G.conj().T@w)**2
 wt8=np.abs(U8.conj().T@H.conj().T@w)**2
 # electron-type compact 4x4 block has exactly two active generation eigvectors
 active=np.where(wt6>1e-8)[0]
 hidden3=wt8[:4].sum();hidden5=wt8[4:].sum()
 ws=np.sqrt(np.r_[wt6[active],hidden3,hidden5])
 d4=np.r_[e6[active],3.,5.]
 K4=np.diag(d4)+np.outer(ws,ws)
 # Spectator eigenvalues are remaining 4 gen plus 3 hidden at each 3 and5
 spectators=np.r_[e6[np.setdiff1d(np.arange(6),active)],np.repeat(3.,3),np.repeat(5.,3)]
 ev14=np.linalg.eigvalsh(N.conj().T@K@N)
 specerr=np.linalg.norm(np.sort(ev14)-np.sort(np.r_[np.linalg.eigvalsh(K4),spectators]))
 assert specerr<1e-10
 # Full K64 spectrum has 14 active state eigenvalues, and 50 other spectators
 rest=np.linalg.eigvalsh((np.eye(64)-P)@K0@(np.eye(64)-P))
 # No need to identify the nonphysical 50 zero pad; invariance is exact
 pole_e=np.sort(np.linalg.eigvalsh(K4))
 out={'K64_to_H14_leakage':float(invariant), 'rankone_residual':float(np.linalg.norm(deltaK-np.outer(w,w.conj()))),'H14_spectrum_factorization_error':float(specerr),'generation_base_spectrum6':e6.tolist(), 'generation_source_weights':wt6.tolist(),'hidden_spectrum8':ev8.tolist(),'hidden_quartet_3_coupling_norm2':float(hidden3),'hidden_quartet_5_coupling_norm2':float(hidden5),'active_dimension':int(len(ws)),'active_baseline':d4.tolist(),'active_rankone_vector':ws.tolist(),'active_eigenvalues':pole_e.tolist(),'active_characteristic_monic_coefficients':np.poly(K4).tolist()}
 if typ=='e':
  E=G@z['e_lower_frame']
  vals,V=np.linalg.eigh(K)
  overlap=np.linalg.norm(E.conj().T@V,axis=0)**2
  selected=np.argsort(overlap)[::-1][:3];selected=selected[np.argsort(vals[selected])]
  charged=vals[selected]
  reduced3=np.sort(np.linalg.eigvalsh(K4))[:1] # only one active middle
  # no excited quartet5 coupling: remove rankone coordinate 4 and compare
  w_no5=ws.copy();w_no5[3]=0;K4_no5=np.diag(d4)+np.outer(w_no5,w_no5)
  pole_no5=np.linalg.eigvalsh(K4_no5)
  e,mu,tau=charged
  center=sum(charged)/3;cosamp=tau/center-1;sinamp=(mu-e)/(np.sqrt(3)*center)
  out.update({'charged_lower3_poles':charged.tolist(),'retained_weights':overlap[selected].tolist(),'conditional_root_Koide_Q':float(sum(charged**2)/sum(charged)**2), 'conditional_generalized_cosine_r':float(np.hypot(cosamp,sinamp)),'conditional_generalized_cosine_delta':float(np.arctan2(sinamp,cosamp)),'charged_mu_e_ratio_if_mass_is_pole_squared':float((mu/e)**2),'charged_tau_e_ratio_if_mass_is_pole_squared':float((tau/e)**2),'active_no_excited_quartet_coupling_eigenvalues':pole_no5.tolist(),'light_active_pole_change_from_excited_quartet':float(pole_e[0]-pole_no5[0])})
 result['species'][typ]=out
(root/'native_h64_14_to4_results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))