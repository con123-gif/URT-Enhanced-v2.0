#!/usr/bin/env python3
"""Q153: numerical certificate for ALL 481 physical Hessian eigenvalues at Q152.

Native unchanged v61 / Q109 Gaussian determinant. Full dense 481x481
gauge-transverse Hessian from central differences of the same analytic gradient.
No new action, fitted constants, synthetic matrices, or Q77 history law.
Numerical finite-vacuum stability is NOT a continuum photon or physical alpha.
"""
from pathlib import Path
from io import BytesIO
from hashlib import sha1,sha256
import argparse, json, math, runpy, urllib.request
import numpy as np
from scipy.linalg import null_space, cholesky
ROOT=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser()
p.add_argument('--output-dir',default='/tmp/q153_full_physics')
p.add_argument('--seed',default='',help='local exact Q152 .npy file override')
p.add_argument('--eps',type=float,default=1.e-4)
args=p.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
assert 0 < args.eps < 0.001
PIN='8941bd77ef73d7962fb540b9f753cad427548fdc'
BLOB='ad746e6f14a5332e8d3b84fb8a2cd46eff65e258'
url='https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+PIN+'/compute/q152-native-physical-hessian-and-newton/outputs/Q152_best_native_gauge_angles.npy'
if args.seed:raw=Path(args.seed).read_bytes()
else:
 with urllib.request.urlopen(url,timeout=45) as f:raw=f.read()
git_sha=sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()
assert git_sha==BLOB,('Q152 input changed',git_sha)
x=np.load(BytesIO(raw),allow_pickle=False)
assert x.shape==(528,) and x.dtype==np.float64 and np.isfinite(x).all()
q109=ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'
v61=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert q109.is_file() and v61.is_file()
sha=sha256(v61.read_bytes()).hexdigest()
assert sha=='e6bd037ffd706150dd9fe8eeeca8908a7c1a88c71a21f589b7eb05ce93128d75'
r=runpy.run_path(str(q109))
inc=np.asarray(r['inc'],float); action_grad=r['action_grad'];g0=float(r['gamma0'])
assert inc.shape==(528,48) and np.linalg.matrix_rank(inc)==47
N=null_space(inc.T,rcond=1e-11)
assert N.shape==(528,481)
a,g=action_grad(x);g=np.asarray(g,float)
ward=float(np.linalg.norm(inc.T@g));grad=float(np.linalg.norm(g))
assert ward<1e-6 and grad<1e-4,(ward,grad)
assert abs((a-g0)-(-7389.662520594167))<1e-3
print('Q153 original 528 native candidate, action',a-g0,'gradient',grad,'Ward',ward,'input SHA1',git_sha,flush=True)

# Dimension 481 = physical coexact curvature (477) + four flat Wilson directions,
# not a projection that drops unstable torons.
D=481; eps=args.eps
H=np.empty((D,D),float)
for k in range(D):
 v=N[:,k]
 gp=action_grad(x+eps*v)[1]
 gm=action_grad(x-eps*v)[1]
 H[:,k]=N.T@((np.asarray(gp)-np.asarray(gm))/(2*eps))
 if (k+1)%25==0 or k==0:
  np.savez_compressed(out/'Q153_PROGRESS_HESSIAN.npz',columns_completed=k+1,
                      first_columns=H[:,:k+1])
  print('Q153 direct native gradient Hessian columns',k+1,'/',D,flush=True)
assert np.isfinite(H).all()
Hs=(H+H.T)/2
antisym=float(np.linalg.norm(H-H.T,'fro')/max(1.,np.linalg.norm(Hs,'fro')))
# Vary numerical differentiation step for selected directions to expose
# truncation and roundoff; this is a convergence check, not a rigorous error bound.
idx=[0,1,2,3,7,15,31,63,127,255,383,480]
err=[]
for j in idx:
 v=N[:,j];half=eps/2
 gp=action_grad(x+half*v)[1]
 gm=action_grad(x-half*v)[1]
 c=N.T@((np.asarray(gp)-np.asarray(gm))/(2*half))
 err.append(float(np.linalg.norm(c-H[:,j])/max(1.,np.linalg.norm(c))))
eigs=np.linalg.eigvalsh(Hs)
minval=float(eigs[0]); positive=int(np.sum(eigs>0));negative=int(np.sum(eigs<0))
chol=False
try:
 cholesky(Hs,lower=True,check_finite=True);chol=True
except np.linalg.LinAlgError:pass
result={
 'source':'native original Q109 Gaussian charged v61/Q106 moving Wilson; unchanged',
 'model_status':'conditional equal-moving/spatial kinetic input, not URT-selected physical theory',
 'q152_state_commit':PIN,'q152_npy_blob_git_sha1':BLOB,
 'native_v61_sha256':sha,
 'action_change':float(a-g0),'full_gradient_norm':grad,'ward_gradient_residual':ward,
 'physical_projector_dimensions':{'link':528,'gauge':47,'transverse':481,'local_curvature':477,'flat_wilson':4},
 'Hessian_derivative_step':eps,
 'hessian_antisym_fro_relative':antisym,
 'half_step_selected_column_relative_errors':err,
 'max_half_step_selected_column_rel_error':max(err),
 'hessian_symmetric_eigen_min':minval,
 'hessian_eigen_first_12':[float(y) for y in eigs[:12]],
 'hessian_eigen_last_6':[float(y) for y in eigs[-6:]],
 'hessian_positive_count':positive,'hessian_negative_count':negative,
 'cholesky_positive':chol,
 'all_481_numerically_positive':bool(chol and minval>0),
 'stability_verified_numerically':bool(chol and minval>1.e-2 and antisym<1e-3 and max(err)<1e-3),
 'rigorous_hessian_interval_certificate':False,
 'continuum_photon_pole_derived':False,
 'physical_alpha_derived':False,
 'primitive_URT_relative_kinetic_normalization_derived':False,
}
(out/'Q153_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
np.save(out/'Q153_full_physical_hessian.npy',Hs)
print('Q153 all 481 projected finite-volume native eigenvalues',positive,'positive',negative,'negative; min',minval,flush=True)
print('Q153 RESULT',json.dumps(result,sort_keys=True),flush=True)
print('Q153 NO physical photon/alpha unless 4D continuum pole and normalization are separately derived.',flush=True)
