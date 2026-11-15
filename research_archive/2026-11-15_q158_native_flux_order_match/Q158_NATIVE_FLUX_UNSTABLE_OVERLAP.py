#!/usr/bin/env python3
"""Q158: compare real Q152 nonlinear gauge-invariant Wilson flux order with
native Q157b full 4D linear unstable gauge momentum sectors.

No fitted parameters, no fixed ARF shape, no invented source. Full five
Platonic Q101/Q106 moving + v61/Q109 gauge model remains conditional.
"""
from pathlib import Path
from io import BytesIO
from itertools import product
from hashlib import sha1
import argparse,json,math,urllib.request
import numpy as np
import runpy

p=argparse.ArgumentParser()
p.add_argument('--output-dir',default='/tmp/q158_native_physics')
args=p.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
ROOT=Path(__file__).resolve().parents[2]

q152PIN='8941bd77ef73d7962fb540b9f753cad427548fdc'
q152BLOB='ad746e6f14a5332e8d3b84fb8a2cd46eff65e258'
q152URL='https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+q152PIN+'/compute/q152-native-physical-hessian-and-newton/outputs/Q152_best_native_gauge_angles.npy'
with urllib.request.urlopen(q152URL,timeout=45) as h:raw=h.read()
assert sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()==q152BLOB
A=np.load(BytesIO(raw),allow_pickle=False)
assert A.shape==(528,) and A.dtype==np.float64

q157PIN='e76948b0f885e195ae05aa46b12f0ffce6b7473b'
q157BLOB='791a249c51791f54968d461400180e6c73956936'
q157URL='https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+q157PIN+'/compute/q157b-native-4d-photon-instability-persist/outputs/Q157_RESULT.json'
with urllib.request.urlopen(q157URL,timeout=45) as h:raw=h.read()
assert sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()==q157BLOB
q157=json.loads(raw)
assert q157['original_528_Hessian_inertia']=={'positive':397,'negative':84,'gauge_zero':47}
assert len(q157['modes'])==48 and q157['zero_momentum_inertia']['negative']==0
bad={tuple(x['mode_index']):x['negative_modes'] for x in q157['modes']}
assert sum(bad.values())==84
assert sum(v>0 for v in bad.values())==24

w=runpy.run_path(str(ROOT/'research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py'))
assert w['mod2rank']==477 and len(w['rows'])==3216
sites=w['sites'];shape=tuple(w['shape'])
assert shape==(6,2,2,2) and len(sites)==48
angles=np.array([sum(A[j]*v for j,v in row.items()) for row in w['rows']])
# Q149 first ALL 55 per-site squares, THEN ALL 12 per-site triangles.
faces=np.concatenate((angles[:2640].reshape(48,55),
                      angles[2640:].reshape(48,12)),axis=1)
assert faces.shape==(48,67)
U=np.exp(1j*faces/3)
flux=float(np.sqrt(np.mean(np.abs(U-1)**2)))
assert abs(flux-0.5533427872139777)<1e-9

qpower=[]
max_error_spatial_nonzero=0.
max_error_spatial_zero=0.
for n in product(range(6),range(2),range(2),range(2)):
 k=2*np.pi*np.asarray(n,float)/np.asarray(shape,float)
 phase=np.exp(-1j*np.asarray(sites,float)@k)/np.sqrt(48)
 pow=float(np.linalg.norm(phase@U)**2)
 qpower.append({'momentum_index':list(n),
                'q_squared_lattice':float(sum((2*np.sin(k/2))**2)),
                'flux_power':pow,
                'unstable_negative_mode_count':bad[n]})
# Parseval verifies exact complete spatial 4D Fourier decomposition.
total=float(sum(x['flux_power'] for x in qpower))
assert abs(total-3216)<1e-8,total
zero=next(x['flux_power'] for x in qpower if x['momentum_index']==[0,0,0,0])
nonuniform=total-zero
unstablepower=float(sum(x['flux_power'] for x in qpower
                      if x['unstable_negative_mode_count']>0))
fraction=unstablepower/nonuniform
assert abs(fraction-0.6305510903002274)<1e-8,(fraction,unstablepower,nonuniform)

modes={tuple(x['mode_index']):x for x in q157['modes']}
for sp in product((0,1),repeat=3):
 root=np.asarray(modes[(0,*sp)]['all_eigenvalues'])
 maxdiff=max(float(np.max(np.abs(np.asarray(modes[(t,*sp)]['all_eigenvalues'])-root)))
             for t in range(1,6))
 if sp==(0,0,0):max_error_spatial_zero=max(max_error_spatial_zero,maxdiff)
 else:max_error_spatial_nonzero=max(max_error_spatial_nonzero,maxdiff)
assert max_error_spatial_nonzero<1e-7,max_error_spatial_nonzero

result={
 'source':'original unmodified native Q149/Q152 Wilson holonomies, Q157b original-v61 48-block charged Hessian',
 'q152_original_gauge_blob':q152BLOB,
 'q157b_original_spectrum_blob':q157BLOB,
 'native_q_min_one_third_flux_rms':flux,
 'parseval_total_4d_flux_power':total,
 'zero_momentum_flux_power':zero,
 'nonuniform_flux_power':nonuniform,
 'unstable_sector_flux_power':unstablepower,
 'fraction_of_nonuniform_nonlinear_flux_order_in_linear_unstable_momenta':fraction,
 'linear_negative_modes':84,'linear_unstable_momentum_sectors':24,
 'max_temporal_eigenvalue_change_at_fixed_nonzero_spatial_momentum':max_error_spatial_nonzero,
 'max_temporal_eigenvalue_change_at_zero_spatial_momentum':max_error_spatial_zero,
 'all_original_nonzero_spatial_momenta_are_pi_nyquist':True,
 'interpretation':'finite-lattice linear instability sectors carry majority of nonlinear gauge-invariant ordered flux power; no continuum photon derived',
 'model_choice':'conditional equal moving/spatial Q109 Gaussian determinant',
 'continuum_photon_derived':False,'primitive_urt_kinetics_derived':False,
 'modes':qpower}
(out/'Q158_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q158 RESULT',json.dumps({k:v for k,v in result.items() if k!='modes'},sort_keys=True),flush=True)
