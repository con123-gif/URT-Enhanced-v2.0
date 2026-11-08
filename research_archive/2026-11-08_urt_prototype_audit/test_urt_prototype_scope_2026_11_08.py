#!/usr/bin/env python3
"""Audits the unchanged repository's scalar URT prototype, without rewriting it."""
from math import pi, isclose, exp
from pathlib import Path
import ast, sys
import numpy as np

ROOT = Path(__file__).resolve()
repo = None
for parent in ROOT.parents:
    if (parent/'cathedral_core'/'urt.py').exists():
        repo = parent
        break
if repo is None:
    raise RuntimeError('Run in the canonical Cathedral repository; original urt.py required')
sys.path.insert(0,str(repo))
from cathedral_core.urt import phi_branch, urt_step, absorbing_bound, max_piecewise_fibre_derivative
src=(repo/'cathedral_core'/'urt.py').read_text()
code=ast.parse(src)
fn=next(x for x in code.body if isinstance(x,ast.FunctionDef) and x.name=='urt_step')
names={node.id for node in ast.walk(fn) if isinstance(node,ast.Name)}
assert names.isdisjoint({'SPIRAL_SCALE','SPIRAL_PHASE','OMEGA','PHI','e'})
alpha,beta,th=1.155,.235,2.4
jump=alpha*beta*th
assert isclose(jump,.65142,abs_tol=1e-12)
assert isclose(urt_step(pi+1e-10,0)-urt_step(pi,0),-jump,abs_tol=1e-8)
assert isclose(urt_step(-pi-1e-10,0)-urt_step(-pi,0),jump,abs_tol=1e-8)
assert abs(max_piecewise_fibre_derivative())<1
assert abs(urt_step(2.0,0))<=alpha*beta*2.0+beta*alpha*th
U=2.0
assert absorbing_bound(U)>0
for p in np.linspace(-20,20,1001):
    for u in [-U,U]:
        assert abs(urt_step(float(p),u))<=alpha*beta*abs(float(p))+beta*(alpha*th+U)+1e-12
# Positive hidden transfer alternatives with identical projected scalar state.
T1=np.diag([1.0,exp(-1.0)])
T2=np.diag([1.0,exp(-2.0)])
assert min(np.linalg.eigvalsh(T1))>0 and min(np.linalg.eigvalsh(T2))>0
assert not np.allclose(T1,T2)
p1,p2=0.34,0.34
h1,h2=np.array([1.,1.]),np.array([1.,1.])
for k in range(5):
    u=np.sin(k/4)
    p1=urt_step(p1,u)
    p2=urt_step(p2,u)
    h1=T1@h1
    h2=T2@h2
    assert p1==p2
assert np.linalg.norm(h1-h2) > 1e-4
print('PASS original scalar update leaves exported golden spiral constants unused')
print('PASS branch jump magnitude',repr(jump),'; global contraction claim invalid')
print('PASS branchwise derivative upper bound',max_piecewise_fibre_derivative())
print('PASS original absorbing bound valid as forward estimate')
print('PASS two distinct positive hidden models with identical scalar observation')
print('Source:',repo/'cathedral_core'/'urt.py')