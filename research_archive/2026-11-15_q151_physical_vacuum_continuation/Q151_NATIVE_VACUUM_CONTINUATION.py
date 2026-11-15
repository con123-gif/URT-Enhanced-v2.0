#!/usr/bin/env python3
"""Q151: resume original 528-link v61/Q109 gauge vacuum from Q150 actual CI field.

Physics gates: (1) same native conditional Gaussian determinant, (2) complete
528-gradient and Ward residual, (3) corrected compact q=1/3 2-cell Wilson flux,
(4) stationary convergence, (5) conditional transverse Hessian eigencheck.
DOES NOT derive primitive moving/spatial normalization or a physical photon.
No synthetic matrices, no old Q77/historical-ARF fits.
"""
from pathlib import Path
from io import BytesIO
import argparse, hashlib, json, math, runpy, urllib.request
import numpy as np
from scipy.optimize import minimize

ROOT=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser()
p.add_argument('--output-dir',default='/tmp/q151_native_physics')
p.add_argument('--maxiter',type=int,default=1350)
p.add_argument('--seed',default='',help='Optional exact Q150 native .npy seed, for offline rerun')
args=p.parse_args()
assert args.maxiter>0
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)

SEED_SHA256='408a918a1e02af8125a2fcde59d0b4f19dc7f79c8e518e731209387f24946d12'
SEED_COMMIT='add2ab4396a1f2c92a590606fb9685052a07cd46'
SEED_URL=('https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'
          +SEED_COMMIT+'/compute/q150-native-full-528-physical-vacuum/outputs/'
          +'Q150_best_native_gauge_angles.npy')
if args.seed:
    data=Path(args.seed).read_bytes()
    origin=args.seed
else:
    with urllib.request.urlopen(SEED_URL,timeout=45) as f:
        data=f.read()
    origin=SEED_URL
seed_sha=hashlib.sha256(data).hexdigest()
assert seed_sha==SEED_SHA256, ('Q150 immutable seed SHA mismatch',seed_sha)
theta=np.load(BytesIO(data),allow_pickle=False)
assert theta.shape==(528,) and theta.dtype==np.float64 and np.isfinite(theta).all()

# Re-run original Q109/Q110 operators; do NOT re-fit or change action.
q109=ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'
q149=ROOT/'research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py'
v61_path=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert q109.is_file() and q149.is_file() and v61_path.is_file()
v61_sha=hashlib.sha256(v61_path.read_bytes()).hexdigest()
assert v61_sha=='e6bd037ffd706150dd9fe8eeeca8908a7c1a88c71a21f589b7eb05ce93128d75'
native=runpy.run_path(str(q109))
flux=runpy.run_path(str(q149))
assert tuple(native['v61'].LATTICE_SHAPE)==(6,2,2,2)
assert flux['mod2rank']==477 and len(flux['rows'])==3216
inc=np.asarray(native['inc'],float)
assert inc.shape==(528,48) and np.linalg.matrix_rank(inc)==47
action_grad=native['action_grad'];g0=float(native['gamma0'])

# Fixed original oriented 2-cell incidence, exact gauge-invariant flux.
# The previously used sin(c/3) monitor misses U=-1 at c=3*pi.
from scipy.sparse import csr_matrix
ridx=[];cidx=[];vals=[]
for i,row in enumerate(flux['rows']):
    for j,a in row.items():
        ridx.append(i);cidx.append(j);vals.append(a)
curl=csr_matrix((vals,(ridx,cidx)),shape=(3216,528))
assert curl.nnz>0 and np.max(abs(curl@inc))<1e-12
def wrap(x):return (x+3*math.pi)%(6*math.pi)-3*math.pi
def diag(x):
    action,grad=action_grad(x)
    phases=curl@x
    # For minimum native charge q=1/3: U_face=exp(i*phases/3).
    # |U_face-1|=2|sin(phases/6)|, 6pi-periodic, zero iff U_face=1.
    hol=2*np.abs(np.sin(phases/6.))
    return {
        'delta_gamma':float(action-g0),
        'full_gradient_norm':float(np.linalg.norm(grad)),
        'ward_residual':float(np.linalg.norm(inc.T@grad)),
        'corrected_flux_rms':float(np.linalg.norm(hol)/math.sqrt(len(hol))),
        'corrected_flux_nonzero':int(np.count_nonzero(hol>1e-6)),
        'stationary_numeric':bool(np.linalg.norm(grad)<1e-4
            and np.linalg.norm(inc.T@grad)<1e-6),
    }
initial=diag(theta)
assert abs(initial['delta_gamma']-(-7389.66246102273))<0.02,initial
assert abs(initial['full_gradient_norm']-0.05694848122190085)<0.03,initial
assert initial['ward_residual']<1e-6
print('Q151 PINNED Q150 native seed',SEED_COMMIT,SEED_SHA256,flush=True)
print('Q151 ORIGINAL Q150 gradient/action reproduced',initial,flush=True)
assert initial['corrected_flux_nonzero']>0

calls=0;iteration=0
def objective(x):
    global calls
    calls+=1
    value,g=action_grad(x)
    assert np.isfinite(value) and np.isfinite(g).all()
    return float(value-g0),np.asarray(g,float)
def checkpoint(x):
    global iteration
    iteration+=1
    if iteration%25==1:
        d=diag(x)
        d.update(iteration=iteration,evaluations=calls)
        np.save(out/'Q151_checkpoint.npy',wrap(x))
        (out/'Q151_checkpoint.json').write_text(json.dumps(d,indent=2)+'\n')
        print('Q151 iteration',iteration,'action',d['delta_gamma'],
            'gradient',d['full_gradient_norm'],'corrected flux',d['corrected_flux_rms'],
            flush=True)

fit=minimize(objective,theta,jac=True,method='L-BFGS-B',callback=checkpoint,
    options=dict(maxiter=args.maxiter,maxfun=max(3*args.maxiter,100),
       maxls=50,maxcor=30,ftol=1e-15,gtol=1e-6))
final=diag(fit.x)
assert final['ward_residual']<1e-6,final
assert final['delta_gamma']<=initial['delta_gamma']+1e-6,final
np.save(out/'Q151_best_native_gauge_angles.npy',wrap(fit.x))
print('Q151 FULL 528-LINK NATIVE CONTINUATION',final,flush=True)

# Conditional physical stability test, only *after* numerical stationarity.
# Gauge directions are protected by Ward identities; the remaining 481
# eigenvalues are physical within this specified finite determinant.
hessian_result={'performed':False,'positive_transverse_verified':False}
if final['stationary_numeric']:
    from scipy.linalg import null_space
    from scipy.sparse.linalg import LinearOperator,eigsh
    N=null_space(inc.T,rcond=1e-10)
    assert N.shape==(528,481)
    eps=2e-4
    def hvp(y):
        v=N@y
        _,gplus=action_grad(fit.x+eps*v)
        _,gminus=action_grad(fit.x-eps*v)
        return N.T@((gplus-gminus)/(2*eps))
    linear=LinearOperator((481,481),matvec=hvp,dtype=float)
    try:
        lowest=eigsh(linear,k=6,which='SA',tol=2e-4,maxiter=600,
              ncv=28,return_eigenvectors=False)
        lowest=sorted(float(q) for q in lowest)
        hessian_result={'performed':True,'lowest_six_approx':lowest,
            'negative_transverse_detected':bool(lowest[0]<-1e-2),
            'positive_transverse_verified':False,
            'note':'Lanczos finite-difference approximation cannot certify all 481 positive modes'}
        print('Q151 481D TRANSVERSE HESSIAN (approx lowest six)',lowest,flush=True)
    except Exception as err:
        hessian_result={'performed':True,'error':repr(err),
            'positive_transverse_verified':False}
        print('Q151 Hessian eigsh inconclusive:',repr(err),flush=True)

result={
    'source':'original native Q109/Q110 v61, 48-sites,528-links,6pi U1',
    'model_premise':'conditional equal-unit moving/spatial Gaussian determinant',
    'seed_commit':SEED_COMMIT,'seed_sha256':SEED_SHA256,
    'v61_sha256':v61_sha,'initial':initial,'final':final,
    'iterations':int(fit.nit),'evaluations':int(fit.nfev),
    'optimizer_success':bool(fit.success),'optimizer_message':str(fit.message),
    'stationary_candidate':bool(final['stationary_numeric']),
    'transverse_hessian':hessian_result,
    'physical_maxwell_photon_derived':False,
    'continuum_limit_derived':False,
    'primitive_URT_relative_kinetic_scale_derived':False,
    'physical_alpha_derived':False,
    'note':'6x2x2x2 finite-volume geometry alone cannot provide a q->0 continuum photon pole',
}
(out/'Q151_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q151 RESULT',json.dumps(result,sort_keys=True),flush=True)
print('Q151 model-only result: photon and URT time/kinetic normalization OPEN',flush=True)
