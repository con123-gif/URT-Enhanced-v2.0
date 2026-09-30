#!/usr/bin/env python3
from __future__ import annotations
import itertools, json, math, sys
from pathlib import Path
import numpy as np
from scipy.linalg import null_space
sys.path.insert(0,'/mnt/data')
import active_core as ac
OUT=Path('/mnt/data')
F=ac.face_normals/np.linalg.norm(ac.face_normals,axis=1,keepdims=True)
D=F@F.T
cubes=[]
for sub in itertools.combinations(range(20),8):
    M=D[np.ix_(sub,sub)]
    ok=True
    for i in range(8):
        vals=np.delete(M[i],i)
        counts=[int(np.sum(np.isclose(vals,x,atol=1e-8))) for x in (-1,-1/3,1/3)]
        if counts != [1,3,3]: ok=False; break
    if ok:cubes.append(tuple(sub))

Qs=[];stab_orders=[];eqerrs=[]
for cube in cubes:
    S=set(cube); H=[]
    for g,P in enumerate(ac.Pf):
        perm=np.argmax(P,axis=0)
        if {int(perm[i]) for i in S}==S:H.append(g)
    stab_orders.append(len(H))
    blocks=[]
    for g in H:
        # vec(Q) column-major: vec(rho3p Q - Q rho3)=0
        blocks.append(np.kron(np.eye(3),ac.rho3p[g])-np.kron(ac.rho3[g].T,np.eye(3)))
    ns=null_space(np.vstack(blocks),rcond=1e-10)
    if ns.shape[1]!=1: raise RuntimeError(ns.shape)
    M=ns[:,0].reshape(3,3,order='F')
    U,s,Vh=np.linalg.svd(M);Q=U@Vh
    if np.linalg.det(Q)>0:Q=-Q
    Qs.append(Q)
    eqerrs.append(max(np.linalg.norm(ac.rho3p[g]@Q-Q@ac.rho3[g]) for g in H))

traces=np.array([[np.trace(Qs[i].T@Qs[j]) for j in range(5)] for i in range(5)])
axes=[]
for i in range(5):
    for j in range(i+1,5):
        R=Qs[i].T@Qs[j]
        w,v=np.linalg.eig(R);axis=np.real(v[:,np.argmin(np.abs(w-1))]);axis/=np.linalg.norm(axis)
        if axis[np.argmax(np.abs(axis))]<0:axis=-axis
        angle=math.acos(np.clip((np.trace(R)-1)/2,-1,1))
        axes.append({'pair':[i,j],'axis':axis.tolist(),'angle':angle})

nQ=np.array([1.,-1.,1.])/math.sqrt(3)
nL=np.array([1.,1.,-1.])/math.sqrt(3)
def match(n):
    rows=[]
    for a in axes:rows.append((abs(np.dot(n,np.asarray(a['axis']))),a))
    return max(rows,key=lambda x:x[0])
result={
 'cube_count':len(cubes),'cube_stabilizer_orders':stab_orders,'equivariance_errors':eqerrs,
 'Q_determinants':[float(np.linalg.det(Q)) for Q in Qs],
 'pairwise_traces':traces.tolist(),'expected_off_diagonal':-3/4,
 'relative_axes':axes,
 'selected':{
   'quark':{'axis':nQ.tolist(),'match':match(nQ)[1],'absolute_overlap':float(match(nQ)[0])},
   'lepton':{'axis':nL.tolist(),'match':match(nL)[1],'absolute_overlap':float(match(nL)[0])}},
}
(OUT/'urt_platonic_axis_audit_results.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result,indent=2))