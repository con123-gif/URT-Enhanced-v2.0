#!/usr/bin/env python3
"""Q110 exploratory FULL 528-variable original-v61 descent, no claimed convergence.

Replays the registered Q109 original-source 528 Hessian, both Ward orders,
and the two-dimensional downhill construction. Then follows the complete
gauge-invariant joined Gaussian determinant's exact analytic gradient.
"""
from pathlib import Path
import runpy
import numpy as np
from scipy.optimize import minimize
r=runpy.run_path(str(Path(__file__).resolve().parents[1]/
    '2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py'))
v=r['v'];w=r['w'];inc=r['inc'];fit2=r['fit']
action_grad=r['action_grad'];g0=r['gamma0']
initial=fit2.x[0]*v+fit2.x[1]*w
f0,grad0=action_grad(initial)
assert np.linalg.norm(inc.T@grad0)<1e-7
def obj(x):
    value,grad=action_grad(x)
    return value-g0,grad
fit=minimize(obj,initial,jac=True,method='L-BFGS-B',
             options={'maxiter':35,'maxfun':130,'ftol':1e-12,
                      'gtol':1e-5,'maxls':20})
value,grad=obj(fit.x)
assert value<f0-g0-1
assert np.linalg.norm(inc.T@grad)<1e-7
print('Original full 528 nonlinear descent iterations',fit.nit,
      'DeltaGamma',value,'gradient norm',np.linalg.norm(grad),
      'Ward residual',np.linalg.norm(inc.T@grad),
      'optimizer converged',fit.success,flush=True)
print('Q110 EXPLORATORY NONZERO SPATIAL DESCENT: PASS')
print('NOT a converged/global vacuum or physical Maxwell/pole claim.')
