#!/usr/bin/env python3
"""Q157: classify all 84 original v61/Q109 negative gauge-Hessian modes
by exact 4D lattice momenta, not just their total count.

Same original Q101/Q106 all-five moving + original v61 192/528 charged
Gaussian action at uniform A=0 (conditional equal kinetic), unmodified.
No fabricated Maxwell term, historical Q77, fitted ARFs, or fake photon.
"""
import json, math, runpy
from pathlib import Path
from itertools import product
import numpy as np

ROOT=Path(__file__).resolve().parents[2]
out=Path('/tmp/q157_4d_native_physics')
out.mkdir(parents=True,exist_ok=True)
r=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_NATIVE_FULL_HESSIAN.py'))
H=np.asarray(r['Hess'],float)
inc=np.asarray(r['inc'],float)
v61=r['v61']
shape=tuple(v61.LATTICE_SHAPE)
assert shape==(6,2,2,2)
sites=list(v61.SITES);si=v61.SITE_INDEX;D=list(v61.DIRECTIONS)
assert len(sites)==48 and len(D)==11 and H.shape==(528,528)
assert np.linalg.matrix_rank(inc)==47
assert np.linalg.norm(H-H.T,'fro')<1e-7
eall=np.linalg.eigvalsh(H)
tol=float(max(abs(eall))*1e-9)
assert int(sum(eall < -tol))==84
assert int(sum(abs(eall)<=tol))==47
assert int(sum(eall >tol))==397

# Translation symmetry is what permits momentum sector diagonalization.
# Q156 separately checked the unchanged original nonlinear action at all
# 48 translations, including 528-gradient covariance to 4.5e-11.
translate_errors=[]
for axis in range(4):
 d=tuple(int(i==axis) for i in range(4))
 p=[si[v61.periodic_shift(x,d)] for x in sites]
 inds=(11*np.asarray(p)[:,None]+np.arange(11)[None,:]).ravel()
 err=float(np.linalg.norm(H[np.ix_(inds,inds)]-H,'fro')/
           max(1.,np.linalg.norm(H,'fro')))
 translate_errors.append(err)
 assert err<1e-8,('original Hess not translationally covariant',axis,err)
print('Q157 native 4D original action Hessian translation residuals',translate_errors,flush=True)

results=[];blocks=[];neg_total=pos_total=zero_total=0
for n in product(range(6),range(2),range(2),range(2)):
 k=np.asarray([2*np.pi*n[i]/shape[i] for i in range(4)])
 phase=np.exp(1j*np.asarray(sites,float)@k)/np.sqrt(48)
 F=np.zeros((528,11),complex)
 for si0 in range(48):
  F[si0*11:(si0+1)*11,:]=phase[si0]*np.eye(11)
 block=F.conj().T@H@F
 herm=float(np.linalg.norm(block-block.conj().T,'fro'))
 assert herm<1e-7,(n,herm)
 block=(block+block.conj().T)/2
 eigen=np.linalg.eigvalsh(block)
 neg=int(sum(eigen<-tol));pos=int(sum(eigen>tol));zero=int(sum(abs(eigen)<=tol))
 expectedZero=0 if n==(0,0,0,0) else 1
 assert zero==expectedZero,(n,zero,eigen)
 if expectedZero:
  # Exact native 4D link gauge gradient of scalar Fourier phase:
  # (inc phi)_{x,j}=phi(x)[1-exp(i k·d_j)].
  gauge=1-np.exp(1j*np.asarray(D,float)@k)
  gaugeResidual=float(np.linalg.norm(block@gauge)/
       max(1.,np.linalg.norm(block)*np.linalg.norm(gauge)))
  assert gaugeResidual<1e-8,(n,gaugeResidual)
 else:gaugeResidual=0.
 pos_total+=pos;neg_total+=neg;zero_total+=zero
 results.append({'mode_index':list(n),'momentum':[float(v) for v in k],
  'lattice_q2':float(sum((2*np.sin(k/2))**2)),
  'negative_modes':neg,'positive_modes':pos,'gauge_zero_modes':zero,
  'smallest_eigenvalue':float(eigen[0]),
  'most_negative_eigenvalue':float(min([z for z in eigen if z<-tol],default=0.)),
  'gauge_gradient_residual':gaugeResidual,
  'all_eigenvalues':[float(z) for z in eigen]})
 blocks.append(block)
 if neg:print('Q157 genuine unstable momentum',n,'negative',neg,
              'lambda_min',float(eigen[0]),flush=True)
assert (pos_total,neg_total,zero_total)==(397,84,47),(pos_total,neg_total,zero_total)
kzero=results[0]
# Independent full-spectrum consistency: Fourier sectors give exactly
# all 528 original native Hessian eigenvalues, including 47 Ward zeros.
union=np.sort(np.array([v for rec in results for v in rec['all_eigenvalues']]))
spectralError=float(np.max(np.abs(union-eall)))
assert spectralError<1e-6,spectralError
unstable=[x for x in results if x['negative_modes']]
weighted_q2=float(sum(x['lattice_q2']*x['negative_modes'] for x in unstable)/84)
result={
 'source':'original native five-Platonic Q101/Q106 + v61 Q109 charged Gaussian Hessian',
 'physical_status':'conditional finite 4D action, NOT massless observed photon',
 'original_528_Hessian_inertia':{'positive':pos_total,'negative':neg_total,'gauge_zero':zero_total},
 'all_four_original_translation_covariance_errors':translate_errors,
 'max_full_vs_fourier_eigen_difference':spectralError,
 'zero_momentum_inertia':{'positive':kzero['positive_modes'],
     'negative':kzero['negative_modes'],'zero':kzero['gauge_zero_modes'],
     'eleven_eigenvalues':kzero['all_eigenvalues']},
 'nonzero_momentum_negative_mode_count':84-kzero['negative_modes'],
 'number_of_unstable_momentum_sectors':len(unstable),
 'mean_lattice_q_squared_of_84_instabilities':weighted_q2,
 'most_unstable_mode':min(unstable,key=lambda x:x['smallest_eigenvalue'])['mode_index'],
 'most_negative_lambda':float(min(eall)),
 'computed_mode_count':48,
 'full_translationally_invariant_action_confirmed_by_Q156':True,
 'Q152_Q153_48_translation_orbit_of_degenerate_stable_minima':True,
 'vacuum_phase_and_continuum_relevance':'unstable wavevectors determine finite flux ordering; no long-wavelength continuum extrapolation',
 'primitive_full_Cathedral_action_unique':False,
 'physical_photon_derived':False,
 'alpha_derived':False,
 'modes':results,
}
(out/'Q157_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
np.savez_compressed(out/'Q157_ORIGINAL_4D_HESSIAN_FOURIER_BLOCKS.npz',blocks=np.asarray(blocks),
                    full_eigenvalues=eall)
print('Q157 RESULT',json.dumps({k:v for k,v in result.items() if k!='modes'},sort_keys=True),flush=True)
