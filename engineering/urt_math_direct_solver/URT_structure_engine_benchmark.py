"""Reproduce cross-domain finite-structure benchmarks; output JSON."""
import json,time,os
import numpy as np
from URT_structure_engine import (harmonic_solver,phase_features,DiagonalLowRank,
 BlockTridiagonal,radial_quartic_solve,oscillator_response,URT_ANGLE,URT_SCALE,
 urt_boundary,solve_problem)

rng=np.random.default_rng(20261015)
report={'scope':'structurally characterized finite linear / special nonlinear systems',
        'claims':{'universal_exact_solver':False,'physical_force_laws_derived':False},
        'constants':{'urt_scale':URT_SCALE,'urt_angle_rad':URT_ANGLE},
        'benchmarks':{}}

for n in [64,2048,16384,32768]:
    b=np.cos(np.arange(n)*URT_ANGLE)+.04*np.sin(3*np.arange(n)*URT_ANGLE)
    t0=time.perf_counter()
    operator=harmonic_solver(n,harmonics=3,weights=[2.,.3,.01])
    x,c=operator.solve(b)
    dt=time.perf_counter()-t0
    assert c.relative_residual<1e-12
    report['benchmarks'][f'harmonic_{n}']={'n':n,'reduced_dimension':c.reduced_dimension,
      'relative_residual':c.relative_residual,'seconds_local':dt,'method':c.method}

n=24000
t0=time.perf_counter()
diagonal=np.tile(np.array([[[2.25]]]),(n,1,1))
lower=np.tile(np.array([[[-1.]]]),(n-1,1,1))
op=BlockTridiagonal(diagonal,lower)
b=rng.normal(size=n)
x,c=op.solve(b)
assert c.relative_residual<1e-11
report['benchmarks']['screened_poisson_1d_24000']={'n':n,'reduced_dimension':1,
 'relative_residual':c.relative_residual,'seconds_local':time.perf_counter()-t0,'method':c.method}

n=2048
b=rng.normal(size=n)
x,c=oscillator_response(n,b,omega=1.1,harmonics=2,weights=[.8,.2])
assert c.relative_residual<1e-11
report['benchmarks']['oscillator_2048']={'n':n,'reduced_dimension':4,'relative_residual':c.relative_residual}

n=256
op=harmonic_solver(n,harmonics=2,weights=[1.,.25],diagonal=2.0)
b=rng.normal(size=n)/np.sqrt(n)
x,tau,c=radial_quartic_solve(op,b,g=.7)
assert c.relative_residual<1e-10
report['benchmarks']['quartic_256']={'n':n,'scalar_tau':tau,'relative_residual':c.relative_residual}

for n in (13,64,125):
    xminus,res,sensitivity=urt_boundary(n)
    report['benchmarks'][f'urt_boundary_{n}']={'n':n,'terminal_residual':abs(res),
       'backward_sensitivity_unit_target':sensitivity}

for n in [32,128]:
    A=np.eye(n)*4+rng.normal(size=(n,n))/np.sqrt(n)
    b=rng.normal(size=n)
    x,c=solve_problem({'kind':'dense','matrix':A,'b':b})
    assert c.relative_residual<1e-12
    report['benchmarks'][f'dense_fallback_{n}']={'n':n,'relative_residual':c.relative_residual,'method':c.method}

report['environment']={'openblas_num_threads':os.environ.get('OPENBLAS_NUM_THREADS'),
                       'test_command':'OPENBLAS_NUM_THREADS=1 python -m unittest -v test_URT_structure_engine.py'}
with open('URT_structure_engine_benchmark_results.json','w') as f:
    json.dump(report,f,indent=2)
print(json.dumps(report,indent=2))
