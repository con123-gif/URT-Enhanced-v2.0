#!/usr/bin/env python3
"""Q156: does ORIGINAL charged Q109 action respect 48 lattice translations?

The Q152 vacuum breaks translation at Wilson-loop level (Q155b). To call this
spontaneous rather than explicit symmetry breaking, the microscopic action
must be invariant under translations of the full 528-link field. Test all 48.
Unchanged original all-five Q101/Q106 plus original v61 192-spinor/528-link
Wilson; no fitted value, no invented dynamics.
"""
from pathlib import Path
from io import BytesIO
import argparse, hashlib, json, math, runpy, urllib.request
import numpy as np

ROOT=Path(__file__).resolve().parents[2]
parser=argparse.ArgumentParser()
parser.add_argument('--output-dir',default='/tmp/q156_native_translation')
parser.add_argument('--seed',default='',help='Exact Q152 original saved field')
args=parser.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
PIN='8941bd77ef73d7962fb540b9f753cad427548fdc'
BLOB='ad746e6f14a5332e8d3b84fb8a2cd46eff65e258'
url=('https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+PIN+
 '/compute/q152-native-physical-hessian-and-newton/outputs/Q152_best_native_gauge_angles.npy')
if args.seed:raw=Path(args.seed).read_bytes()
else:
 with urllib.request.urlopen(url,timeout=45) as f:raw=f.read()
sha=hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()
assert sha==BLOB,('Q152 native seed mismatch',sha)
A=np.load(BytesIO(raw),allow_pickle=False)
assert A.shape==(528,) and A.dtype==np.float64 and np.isfinite(A).all()

q109=ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'
q149=ROOT/'research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py'
r=runpy.run_path(str(q109))
w=runpy.run_path(str(q149))
assert w['mod2rank']==477 and len(w['rows'])==3216
v61=r['v61'];action_grad=r['action_grad'];inc=np.asarray(r['inc'],float)
assert tuple(v61.LATTICE_SHAPE)==(6,2,2,2)
sites=list(v61.SITES);si=v61.SITE_INDEX;step=v61.periodic_shift
assert sites==w['sites'] and len(sites)==48
assert len(v61.DIRECTIONS)==11 and np.linalg.matrix_rank(inc)==47

# Exact geometry: native Q149 enumerates 2640 squares first and 576
# triangles second. DO NOT reshape the interleaved sequence as 48x67.
def wilson(x):
 c=np.array([sum(x[j]*z for j,z in row.items()) for row in w['rows']])
 block=np.concatenate((c[:2640].reshape(48,55),c[2640:].reshape(48,12)),axis=1)
 return np.exp(1j*block/3)
baseU=wilson(A)
flux=float(np.linalg.norm(baseU-1)/np.sqrt(baseU.size))
assert abs(flux-0.5533427872139777)<1e-9,flux

baseValue,baseGrad=action_grad(A)
baseGrad=np.asarray(baseGrad,float)
assert abs((baseValue-r['gamma0'])+7389.662520594167)<1e-3
assert np.linalg.norm(baseGrad)<1e-4
assert np.linalg.norm(inc.T@baseGrad)<1e-6

records=[];A2=A.reshape(48,11);G2=baseGrad.reshape(48,11)
for n,s in enumerate(sites):
 p=np.array([si[step(x,s)] for x in sites])
 shifted=A2[p].ravel()
 # The 48 original translation operations must also act on all 3216
 # correctly typed Wilson plaquettes/triangles by site permutation.
 U2=wilson(shifted);Uexpected=baseU[p]
 flux_equiv=float(np.max(np.abs(U2-Uexpected)))
 assert flux_equiv<1e-11,(s,flux_equiv)
 value,g=action_grad(shifted);g=np.asarray(g,float)
 relative_gamma=float(value-baseValue)
 grad_equiv=float(np.linalg.norm(g-G2[p].ravel()))
 ward=float(np.linalg.norm(inc.T@g))
 flux_change=float(np.linalg.norm(Uexpected-baseU)/np.sqrt(Uexpected.size))
 records.append({'shift':list(s),'action_difference':relative_gamma,
    'gradient_covariance_norm':grad_equiv,'ward_residual':ward,
    'wilson_covariance_residual':flux_equiv,
    'gauge_invariant_flux_difference_rms':flux_change})
 if (n+1)%8==0:
  print('Q156 native translations',n+1,'/48; diff',relative_gamma,
    'grad covariance',grad_equiv,'Wilson flux delta',flux_change,flush=True)

action_err=max(abs(v['action_difference']) for v in records)
grad_err=max(v['gradient_covariance_norm'] for v in records)
maxward=max(v['ward_residual'] for v in records)
flux_nonid=[v['gauge_invariant_flux_difference_rms'] for v in records if any(v['shift'])]
assert len(flux_nonid)==47 and min(flux_nonid)>.1
result={
 'source':'native ORIGINAL Q101/Q106 all-five moving + original v61 Q109 528-link Gaussian action',
 'conditional_model':'equal relative moving/spatial kinetic weights, not primitive-selected',
 'seed_state_commit':PIN,'seed_blob_git_sha1':BLOB,
 'configuration_count':48,'native_4d_shape':[6,2,2,2],
 'original_stationary_gradient_norm':float(np.linalg.norm(baseGrad)),
 'original_base_action_change':float(baseValue-r['gamma0']),
 'max_translation_action_residual':action_err,
 'max_translation_gradient_covariance_residual':grad_err,
 'max_translated_gauge_ward_residual':maxward,
 'min_nontrivial_gauge_invariant_flux_orbit_distance':min(flux_nonid),
 'max_nontrivial_flux_orbit_distance':max(flux_nonid),
 'physical_translation_symmetry_of_original_conditional_action_verified_numerically':bool(action_err<1e-5 and grad_err<1e-5),
 'flux_orbit_gauge_inequivalent_count':48,
 'full_orbit_local_numerical_stability_conditional_on_q153_positive_hessian':bool(action_err<1e-5 and grad_err<1e-5),
 'finite_classical_discrete_degenerate_backgrounds':bool(action_err<1e-5 and grad_err<1e-5),
 'thermodynamic_spontaneous_symmetry_breaking_proven':False,
 'continuum_Lorentz_or_translation_restoration_derived':False,
 'massless_physical_photon_derived':False,
 'records':records}
(out/'Q156_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q156 RESULT',json.dumps({k:v for k,v in result.items() if k!='records'},sort_keys=True),flush=True)
