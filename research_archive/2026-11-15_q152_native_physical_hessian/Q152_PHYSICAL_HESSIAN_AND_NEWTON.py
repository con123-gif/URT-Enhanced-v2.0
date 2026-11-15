#!/usr/bin/env python3
"""Q152 native physical test: true transverse Hessian at saved Q151 gauge field.

Same Q109 original v61/Q110 conditional Gaussian action, no change of action,
no fitted coefficients.  Matrix-free physical 481D Hessian; smallest eigenmodes,
then one controlled Newton correction (if positive) or verified physical
negative-curvature descent (if saddle). No false Maxwell/alpha claim.
"""
import argparse,hashlib,json,math,runpy,urllib.request
from io import BytesIO
from pathlib import Path
import numpy as np
from scipy.linalg import null_space
from scipy.sparse.linalg import LinearOperator,eigsh,cg,ArpackNoConvergence
from scipy.optimize import minimize_scalar

ROOT=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser()
p.add_argument('--output-dir',default='/tmp/q152_physics')
p.add_argument('--seed',default='')
args=p.parse_args()
out=Path(args.output_dir);out.mkdir(parents=True,exist_ok=True)
PIN='a3a841d06116c14e17cbe2c4cf4f3519fba35878'
SHA='7a78f4651ee7a1942138152a8bc64a279eed994538d0d5eb2cf221d3d30ee95c'
url=('https://raw.githubusercontent.com/con123-gif/URT-Enhanced-v2.0/'+PIN+
     '/compute/q151-resume-native-528-physical-vacuum/outputs/Q151_best_native_gauge_angles.npy')
if args.seed:raw=Path(args.seed).read_bytes()
else:
    with urllib.request.urlopen(url,timeout=45) as f:raw=f.read()
assert hashlib.sha256(raw).hexdigest()==SHA
x=np.load(BytesIO(raw),allow_pickle=False)
assert x.shape==(528,) and x.dtype==np.float64

q109=ROOT/'research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'
q149=ROOT/'research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py'
r=runpy.run_path(str(q109))
w=runpy.run_path(str(q149))
assert w['mod2rank']==477 and len(w['rows'])==3216
inc=np.asarray(r['inc'],float)
N=null_space(inc.T,rcond=1e-10)
assert N.shape==(528,481)
action_grad=r['action_grad'];g0=float(r['gamma0'])
def info(z):
    a,g=action_grad(z)
    loops=np.array([sum(v*z[j] for j,v in row.items()) for row in w['rows']])
    corrected=2*np.abs(np.sin(loops/6))
    return {
        'delta_gamma':float(a-g0),
        'gradient_norm':float(np.linalg.norm(g)),
        'ward_residual':float(np.linalg.norm(inc.T@g)),
        'transverse_gradient_norm':float(np.linalg.norm(N.T@g)),
        'corrected_flux_rms':float(np.linalg.norm(corrected)/math.sqrt(len(corrected))),
        'nontrivial_wilson_faces':int(sum(corrected>1e-6)),
        'stationary_numeric':bool(np.linalg.norm(g)<1e-4
            and np.linalg.norm(inc.T@g)<1e-6)
    }

start=info(x)
assert abs(start['delta_gamma']+7389.662520593294)<0.02,start
assert start['ward_residual']<1e-6
assert abs(start['gradient_norm']-0.000517246721460616)<0.0001,start
print('Q152 reproducible true original Q151 seed',start,flush=True)

# The exact transverse Hessian is the directional derivative of the original
# 528-link analytic Ward-preserving gradient, projected to the 481D quotient.
# The central-difference step is numerical precision control, NOT a fit.
eps=1e-4
def matvec(y):
    z=N@np.asarray(y,float)
    gp=action_grad(x+eps*z)[1]
    gm=action_grad(x-eps*z)[1]
    return N.T@((gp-gm)/(2*eps))
H=LinearOperator((481,481),matvec=matvec,dtype=float)
hess={'completed':False}
direction=None;mineig=None
try:
    eig,vec=eigsh(H,k=6,which='SA',ncv=32,tol=3e-4,
                  maxiter=500,return_eigenvectors=True)
    order=np.argsort(eig);eig=eig[order];vec=vec[:,order]
    mineig=float(eig[0])
    residuals=[float(np.linalg.norm(H@vec[:,j]-eig[j]*vec[:,j]))
               for j in range(6)]
    hess={'completed':True,'lowest_six_eigenvalues_approx':[float(v) for v in eig],
          'eigen_residuals':residuals,'negative_physical_mode_found':bool(mineig<-1e-2),
          'all_481_positive_certified':False,
          'warning':'finite-difference Ritz diagnostics only; no continuum photon'}
    if mineig<-1e-2:direction=N@vec[:,0]
    print('Q152 true native 481D lowest Ritz eigenvalues',eig,
          'residuals',residuals,flush=True)
except ArpackNoConvergence as exc:
    hess={'completed':False,'error':'ARPACK did not converge',
          'partial_eigenvalues':[float(v) for v in exc.eigenvalues] if exc.eigenvalues is not None else []}
    print('Q152 incomplete lowest-eigen search',hess,flush=True)

# Determine whether this alleged stable vacuum is actually a saddle;
# if not, solve the gauge-quotient Newton equation with damping only for
# solver robustness, while ALWAYS evaluating the unchanged physical action.
outcome='hessian_inconclusive';xnew=x.copy()
if direction is not None:
    # A genuine negative Rayleigh curvature is a decisive physical instability
    # of this conditional action. Verify that the original gamma decreases.
    rayleigh=float(vec[:,0]@(H@vec[:,0]))
    if rayleigh<-1e-2:
        def line(t):return action_grad(x+t*direction)[0]-g0
        trial=minimize_scalar(line,bounds=(-.15,.15),method='bounded',
                         options={'xatol':1e-7,'maxiter':100})
        if trial.success and trial.fun<start['delta_gamma']-1e-7:
            xnew=x+float(trial.x)*direction
            outcome='verified_physical_negative_mode_and_descent'
        else:outcome='negative_rayleigh_direction_without_verified_downhill'
elif hess.get('completed') and mineig is not None and mineig>1e-3:
    g=action_grad(x)[1]
    # Unregularized positive Hessian on all 481 physical directions is
    # consistent with local stability but NOT fully proven by six Ritz values.
    dx,code=cg(H,-N.T@g,rtol=1e-2,atol=0,maxiter=350)
    if code==0 and np.isfinite(dx).all():
        d=N@dx
        for k in range(20):
            t=2.**(-k)
            z=x+t*d
            val=action_grad(z)[0]-g0
            if val<start['delta_gamma']-1e-11:
                xnew=z;outcome='verified_projected_newton_decrease'
                break
        if outcome=='hessian_inconclusive':
            outcome='newton_step_no_strict_action_decrease'
    else:outcome='newton_linear_solver_did_not_converge'

final=info(xnew)
assert final['ward_residual']<1e-6
assert final['delta_gamma']<=start['delta_gamma']+1e-7
def wrap(z):return (z+3*math.pi)%(6*math.pi)-3*math.pi
np.save(out/'Q152_best_native_gauge_angles.npy',wrap(xnew))
result={
    'source':'native Q109/Q110/Q149 conditional original 528-link 4D Wilson',
    'seed_sha256':SHA,'seed_state_commit':PIN,
    'initial':start,'hessian':hess,'result_type':outcome,'final':final,
    'physical_action_changed':False,
    'stationary_candidate':bool(final['stationary_numeric']),
    'stable_transverse_vacuum_proved':False,
    'physical_photon_pole_derived':False,
    'physical_alpha_derived':False,
    'primitive_URT_kinetic_normalization_derived':False,
}
(out/'Q152_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print('Q152 RESULT',json.dumps(result,sort_keys=True),flush=True)
