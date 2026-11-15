#!/usr/bin/env python3
"""Q155: gauge-invariant translation audit of actual original Q152 Wilson vacuum.
This is FINITE model physics, not proof of Lorentz invariance or photon mass.
"""
import argparse,hashlib,json,math,runpy,urllib.request
from pathlib import Path
from io import BytesIO
import numpy as np

ap=argparse.ArgumentParser()
ap.add_argument('--output-dir',default='/tmp/q155_flux_translation')
ap.add_argument('--seed',default='')
args=ap.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
ROOT=Path(__file__).resolve().parents[2]
PIN='8941bd77ef73d7962fb540b9f753cad427548fdc'
BLOB='ad746e6f14a5332e8d3b84fb8a2cd46eff65e258'
url=('https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+PIN+
 '/compute/q152-native-physical-hessian-and-newton/outputs/Q152_best_native_gauge_angles.npy')
if args.seed:raw=Path(args.seed).read_bytes()
else:
 with urllib.request.urlopen(url,timeout=45) as h:raw=h.read()
assert hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()==BLOB
A=np.load(BytesIO(raw),allow_pickle=False)
assert A.shape==(528,) and A.dtype==np.float64
native=ROOT/'research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py'
w=runpy.run_path(str(native))
assert w['mod2rank']==477 and len(w['rows'])==3216
sites=w['sites'];si=w['si'];D=w['D'];step=w['step']
assert tuple(w['shape'])==(6,2,2,2) and len(sites)==48
# Q149 source constructs 67 original face types per site, in site-major order.
phases=np.asarray([sum(A[l]*sign for l,sign in row.items()) for row in w['rows']])
assert phases.size==48*67
U=np.exp(1j*phases.reshape(48,67)/3)
flux=float(np.sqrt(np.mean(np.abs(U-1)**2)))
assert abs(flux-0.5533427872139778)<1e-9,flux
records={}
for a,name in enumerate(('time','x','y','z')):
 d=tuple(int(k==a) for k in range(4))
 shifted=U[[si[step(site,d)] for site in sites],:]
 diff=np.abs(U-shifted)
 data={'mean_distance':float(np.mean(diff)),
       'rms_distance':float(np.sqrt(np.mean(diff**2))),
       'max_distance':float(np.max(diff)),
       'fraction_changed_over_1e-6':float(np.mean(diff>1e-6))}
 records[name]=data
 assert data['rms_distance']>1e-3
 print('Q155 gauge-invariant primitive translation',name,data,flush=True)
result={'source':'original native Q149 3216 Wilson 2-cell loops at Q152 numeric stable field',
 'native_q152_state_commit':PIN,'native_q152_git_blob':BLOB,
 'corrected_q_min_one_third_flux_rms':flux,
 'flux_per_site_shape':[48,67],
 'translation_distances':records,
 'all_four_primitive_lattice_translations_broken_in_local_Wilson_flux':True,
 'gauge_independent':True,
 'global_or_combined_symmetries_not_tested':True,
 'model_premise':'conditional equal kinetic Q109 Gaussian determinant',
 'continuum_translation_or_Lorentz_restoration_untested':True,
 'physical_massless_photon_derived':False}
(out/'Q155_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q155 RESULT',json.dumps(result,sort_keys=True),flush=True)
