#!/usr/bin/env python3
"""Q20: exact fourth cumulants for a surviving native Q6 signed-dictionary collision.
Loads the original Q11 icosahedral hidden-5 source and the original Q6
Poisson/tilted-transfer cumulant recursion. No measured or fitted inputs.
"""
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
from fractions import Fraction as F
import json,runpy

root=Path(__file__).resolve().parents[1]
with redirect_stdout(StringIO()):
    src=runpy.run_path(str(root/'2026-11-10_signed_a5_covariance'/'signed_a5_covariance.py'))
    calc=runpy.run_path(str(root/'2026-11-10_urt_arf_forward'/'new_gate'/'URT_NATIVE_Q6_TILTED_TRANSFER_ALL_CUMULANTS_2026_11_10.py'))
K=src['K']
vacua=src['vacua']
D=(0,2,4,6,8,10)
E=(0,2,8,10,7,4)
def history_index(h,d):
    out=0
    for i,x in enumerate(d):
        out|=(((h>>i)&1)^(x&1))<<(x//2)
    return out
def signature(d):
    ix=[history_index(h,d) for h in range(64)]
    rows=[]
    for _,r2,line,_ in vacua:
        g=[line[j] for j in ix]
        k1,k2,k3,k4=calc['cumulants'](g,4)
        assert k1==K(0)
        # Scale- and sign-independent invariants, preserving the joint vacuum.
        i2=k2/r2
        i3=k3*k3/(r2*r2*r2)
        i4=k4/(r2*r2)
        assert calc['finite_cumulants'](g,25,4)[3]-calc['finite_cumulants'](g,24,4)[3]==k4
        rows.append((i2,i3,i4))
    return tuple(sorted(rows,key=lambda x:(x[0].a,x[0].b,x[1].a,x[1].b,x[2].a,x[2].b)))
a,b=signature(D),signature(E)
assert len(a)==len(b)==5
prior=lambda s: sorted((x[0].a,x[0].b,x[1].a,x[1].b) for x in s)
assert prior(a)==prior(b), 'Q20 witness no longer collides at K2-I3'
k4a=sorted((x[0].a,x[0].b,x[1].a,x[1].b,x[2].a,x[2].b) for x in a)
k4b=sorted((x[0].a,x[0].b,x[1].a,x[1].b,x[2].a,x[2].b) for x in b)
separated=k4a!=k4b
print(json.dumps({'task':'Q20','status':'THEOREM' if separated else 'OBSTRUCTION',
 'D':list(D),'E':list(E),'joint_K2_I3_collision':True,
 'K4_separates':separated,'D_signature':[[str(v) for v in row] for row in a],
 'E_signature':[[str(v) for v in row] for row in b],
 'independent_finite_time_K4_25_minus_24':'exact 10/10',
 'physical_ARFs':'not derived'},indent=2))
