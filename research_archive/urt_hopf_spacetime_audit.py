#!/usr/bin/env python3
from __future__ import annotations
import json, math
from pathlib import Path
import numpy as np

OUT=Path('/mnt/data')
A4=json.loads((OUT/'a4_colour_lepton_results.json').read_text())
t=np.array(A4['chosen_t'],float)
t/=np.linalg.norm(t)
# Complete t to an oriented orthonormal basis B=[t,e1,e2,e3]
# deterministic QR from standard basis
cols=[t]
for e in np.eye(4):
    v=e.copy()
    for c in cols: v-=c*(c@v)
    n=np.linalg.norm(v)
    if n>1e-10: cols.append(v/n)
    if len(cols)==4: break
B=np.column_stack(cols)
if np.linalg.det(B)<0: B[:,-1]*=-1

# quaternion represented as [a,x,y,z]
def qconj(q): return np.array([q[0],-q[1],-q[2],-q[3]])
def qmul(p,q):
    a,u=p[0],p[1:]; b,v=q[0],q[1:]
    return np.r_[a*b-u@v, a*v+b*u+np.cross(u,v)]
def qnorm2(q): return float(q@q)
def qinv(q): return qconj(q)/qnorm2(q)

def hopf(q1,q2):
    x0=qnorm2(q1)-qnorm2(q2)
    x=qmul(2*q1,qconj(q2))
    return np.r_[x0,x]

def chart(q1,q2):
    return qmul(q1,qinv(q2))

rng=np.random.default_rng(20260806)
sphere_err=[]; fibre_err=[]; chart_err=[]; metric_err=[]
for _ in range(100):
    z=rng.normal(size=8); z/=np.linalg.norm(z)
    q1=z[:4]; q2=z[4:]
    X=hopf(q1,q2)
    sphere_err.append(abs(X@X-1))
    u=rng.normal(size=4);u/=np.linalg.norm(u)
    q1u=qmul(q1,u);q2u=qmul(q2,u)
    fibre_err.append(np.linalg.norm(hopf(q1u,q2u)-X))
    if qnorm2(q2)>1e-8:
        chart_err.append(np.linalg.norm(chart(q1u,q2u)-chart(q1,q2)))
        y=chart(q1,q2)
        # reconstruct normalized representative (y,1)/sqrt(1+|y|^2)
        den=math.sqrt(1+qnorm2(y)); r1=y/den;r2=np.array([1.,0,0,0])/den
        metric_err.append(np.linalg.norm(hopf(r1,r2)-X))

# Check A4 fixed-line block form in quaternion basis using reps from audit fields.
# restriction_audits stores traces etc, not matrices. Reconstruct from active_core 4D reps.
import sys
sys.path.insert(0,'/mnt/data')
import active_core as ac
# find rotations fixing chosen t in the exact 4D rep from a4 audit setup
# a4 audit uses its own generated reps; use runpy to retrieve them.
import runpy
ns=runpy.run_path('/mnt/data/a4_colour_lepton_audit.py')
reps=ns['reps']; subs=ns['subs']; index=ns['index']
# choose subgroup whose fixed vector matches t line
best=None
for H in subs:
    errs=[]
    for p in H: errs.append(np.linalg.norm(reps[index[p]]@t-t))
    e=max(errs)
    if best is None or e<best[0]: best=(e,H)
H=best[1]
block_off=[]; scalar_err=[]; spatial_orth=[]; spatial_det=[]
for p in H:
    Rq=B.T@reps[index[p]]@B
    block_off.append(np.linalg.norm(Rq[0,1:])+np.linalg.norm(Rq[1:,0]))
    scalar_err.append(abs(Rq[0,0]-1))
    R3=Rq[1:,1:]
    spatial_orth.append(np.linalg.norm(R3.T@R3-np.eye(3)))
    spatial_det.append(abs(np.linalg.det(R3)-1))

out={
 'basis_B':B.tolist(),
 'hopf':{
  'sphere_identity_max_error':float(max(sphere_err)),
  'right_SU2_fibre_invariance_max_error':float(max(fibre_err)),
  'stereographic_chart_fibre_invariance_max_error':float(max(chart_err)),
  'chart_reconstruction_max_error':float(max(metric_err)),
  'base_dimension':4,
  'fibre_dimension':3,
  'total_dimension':7,
 },
 'A4_quaternion_split':{
  'fixed_scalar_max_error':float(max(scalar_err)),
  'block_offdiag_max_error':float(max(block_off)),
  'spatial_SO3_orthogonality_max_error':float(max(spatial_orth)),
  'spatial_SO3_det_max_error':float(max(spatial_det)),
  'interpretation':'After selecting t, the A5 quartet is canonically R + R^3; choosing orientation supplies a quaternion algebra H=R+Im H.'
 },
 'conclusion':'The two hidden quartets can be organized as H^2 after A4-vacuum selection. Unit states form S7, common right unit-quaternion phase is an SU2 fibre, and the gauge-invariant local state space is HP1=S4. A stereographic patch is one quaternion y=tau+x i+y j+z k, giving one scalar and one spatial triplet.'
}
(OUT/'urt_hopf_spacetime_audit_results.json').write_text(json.dumps(out,indent=2))
report=f'''URT QUATERNIONIC HOPF-SPACETIME AUDIT
=====================================

A selected tetrahedral vacuum gives the exact split V4 = 1 + 3.  In an
oriented orthonormal basis B=(t,e1,e2,e3), every element of the selected A4
subgroup is block diagonal 1 + SO(3):

  scalar fixed error       {max(scalar_err):.3e}
  scalar/vector mixing     {max(block_off):.3e}
  spatial orthogonality    {max(spatial_orth):.3e}
  spatial determinant      {max(spatial_det):.3e}

This makes each hidden quartet a quaternion q=a+x i+y j+z k once the A4
vacuum and orientation are selected.  The hidden 4+4 sector is therefore H^2.

For normalized (q1,q2) in H^2, define the quaternionic Hopf map

  X0 = |q1|^2-|q2|^2,
  X  = 2 q1 conjugate(q2).

Then (X0,X) lies on S4 and is invariant under common right multiplication
(q1,q2)->(q1 u,q2 u), |u|=1. Numerical certificates over 100 random tests:

  S4 identity error             {max(sphere_err):.3e}
  right-SU(2) fibre invariance  {max(fibre_err):.3e}
  chart fibre invariance        {max(chart_err):.3e}
  chart reconstruction error    {max(metric_err):.3e}

On q2 != 0, the gauge-invariant coordinate is

  y = q1 q2^(-1) = tau + x i + y j + z k in H ~= R4.

Thus the local four-dimensional base is not appended to the 8-real hidden
state: it is the quotient

  S7 / SU(2) = HP1 = S4,

with a local R4 chart.  The selected A4 singlet is the scalar coordinate and
the A4 triplet is the spatial 3-vector.  Entropy orientation can distinguish
the scalar coordinate as causal time; this last Lorentzian identification is
a physical postulate, not a consequence of the Riemannian Hopf quotient alone.
'''
(OUT/'urt_hopf_spacetime_audit_report.txt').write_text(report)
print(report)