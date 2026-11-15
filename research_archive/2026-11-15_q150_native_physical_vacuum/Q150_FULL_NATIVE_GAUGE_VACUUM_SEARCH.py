#!/usr/bin/env python3
"""Q150 native original-v61 Q109/Q110 528-link physical gauge-vacuum search.

The action is Q109's SPECIFIED equal-unit-moving/spatial Gaussian model;
this is not yet a uniquely URT-selected physical theory.
Never label an unconverged descent a stable photon or vacuum.
"""
from pathlib import Path
import argparse,json,runpy,math,hashlib
from itertools import combinations
import numpy as np
from scipy.optimize import minimize

ROOT=Path(__file__).resolve().parents[2]
parser=argparse.ArgumentParser()
parser.add_argument('--output-dir',default='/tmp/q150_physical_vacuum')
parser.add_argument('--maxiter',type=int,default=350)
args=parser.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
assert args.maxiter>0
src=ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'
orig=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert src.is_file() and orig.is_file()
sha=hashlib.sha256(orig.read_bytes()).hexdigest()
r=runpy.run_path(str(src))
A=np.asarray(r['fit'].x[0]*r['v']+r['fit'].x[1]*r['w'],float)
action_grad=r['action_grad'];gamma0=float(r['gamma0']);inc=np.asarray(r['inc'])
v61=r['v61']
assert A.shape==(528,) and inc.shape==(528,48)
assert np.linalg.matrix_rank(inc)==47
assert tuple(v61.LATTICE_SHAPE)==(6,2,2,2)
assert len(v61.SITES)==48 and len(v61.DIRECTIONS)==11
sites=v61.SITES;directions=v61.DIRECTIONS;site_index=v61.SITE_INDEX
edge=lambda x,j:11*site_index[x]+j
step=lambda x,d:v61.periodic_shift(x,d)
faces=[]
def face(parts):
    row={}
    for x,j,sign in parts:
        index=edge(x,j)
        row[index]=row.get(index,0)+sign
    row={k:n for k,n in row.items() if n}
    assert row and all(abs(n)==1 for n in row.values())
    faces.append(row)
for x in sites:
    for j,k in combinations(range(11),2):
        dj,dk=directions[j],directions[k]
        face([(x,j,1),(step(x,dj),k,1),(step(x,dk),j,-1),(x,k,-1)])
    for j,k in combinations(range(3,11),2):
        dj,dk=directions[j],directions[k]
        d=[a for a in range(1,4) if dj[a]!=dk[a]]
        if len(d)!=1:continue
        d=d[0];axis=d-1
        if dk[d]-dj[d]==-1:
            face([(x,k,1),(step(x,dk),axis,1),(x,j,-1)])
        else:
            face([(x,j,1),(step(x,dj),axis,1),(x,k,-1)])
assert len(faces)==3216

def curvature(x):
    return np.array([sum(n*x[k] for k,n in row.items()) for row in faces])
def wrap(x):
    return (x+3*math.pi)%(6*math.pi)-3*math.pi
def diagnostics(x):
    val,grad=action_grad(x)
    c=curvature(x)
    # q_min=1/3. The physical compact plaquette holonomy is exp(i*c/3).
    # sin(c/3) is WRONG as a vacuum monitor: it vanishes at c=3*pi,
    # although the holonomy there is -1, not the trivial +1.
    # |exp(i*c/3)-1| = 2*|sin(c/6)| is exactly 6*pi periodic.
    holonomy_distance=2*np.abs(np.sin(c/6))
    return dict(delta_gamma=float(val-gamma0),
                gradient_norm=float(np.linalg.norm(grad)),
                ward_residual=float(np.linalg.norm(inc.T@grad)),
                local_flux_rms=float(np.linalg.norm(holonomy_distance)/math.sqrt(len(c))),
                local_flux_nonzero=int(np.sum(holonomy_distance>1e-6)),
                stationary_numeric=bool(np.linalg.norm(grad)<1e-4 and
                                        np.linalg.norm(inc.T@grad)<1e-6))
initial=diagnostics(A)
assert initial['ward_residual']<1e-6 and initial['delta_gamma']<0
print('NATIVE Q109/Q110 original 2D seed:',initial,flush=True)
calls=0;iterations=0
def objective(x):
    global calls
    calls+=1
    value,gradient=action_grad(x)
    if not np.isfinite(value) or not np.isfinite(gradient).all():
        raise FloatingPointError('Nonfinite native gauge determinant')
    return float(value-gamma0),np.asarray(gradient,float)
def checkpoint(x):
    global iterations
    iterations+=1
    if iterations%10==1:
        data=diagnostics(x)
        data.update(iteration=iterations,evaluations=calls)
        np.save(out/'Q150_checkpoint.npy',wrap(x))
        (out/'Q150_checkpoint.json').write_text(json.dumps(data,indent=2,sort_keys=True)+'\n')
        print('Q150 iteration',iterations,'action',data['delta_gamma'],
              'gradient',data['gradient_norm'],'flux',data['local_flux_rms'],
              flush=True)
fit=minimize(objective,A,jac=True,method='L-BFGS-B',callback=checkpoint,
             options=dict(maxiter=args.maxiter,maxfun=max(3*args.maxiter,100),
                          maxls=40,maxcor=25,ftol=1e-13,gtol=1e-5))
final=diagnostics(fit.x)
assert final['ward_residual']<1e-6
assert final['delta_gamma']<initial['delta_gamma']-1e-7
np.save(out/'Q150_best_native_gauge_angles.npy',wrap(fit.x))
result={'native_v61_sha256':sha,
        'action':'Q109 original equal-unit-moving/spatial Gaussian determinant (conditional)',
        'domain':'native 48-site,528-link,6pi-periodic Wilson lattice',
        'initial':initial,'final':final,'iterations':int(fit.nit),
        'evaluations':int(fit.nfev),'optimizer_success':bool(fit.success),
        'optimizer_message':str(fit.message),
        'stationary_candidate':final['stationary_numeric'],
        'stable_transverse_hessian_verified':False,
        'continuum_photon_verified':False,'physical_alpha_derived':False}
(out/'Q150_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q150 RESULT',json.dumps(result,sort_keys=True),flush=True)
if final['stationary_numeric']:
    print('NUMERIC STATIONARY CANDIDATE ONLY: transverse Hessian/4D photon test OPEN')
else:
    print('NOT CONVERGED: saved the best native candidate; no stable vacuum claimed')
