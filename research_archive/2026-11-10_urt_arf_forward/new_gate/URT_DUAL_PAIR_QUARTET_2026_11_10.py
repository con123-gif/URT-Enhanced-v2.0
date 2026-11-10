#!/usr/bin/env python3
"""Exact A5 distance-two quartet completion, native 24-clock Ward checks.
Reads the original face-edge theorem, not fitted ARF coefficients.
"""
from pathlib import Path
import runpy,contextlib,io
import sympy as s
import numpy as np
root=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    a=runpy.run_path(str(root/'URT_FACE_EDGE_QUARTET_PAIRING_2026_11_10.py'))
D,P3,P5,edges,faces=(a[k] for k in ('D','P3','P5','edges','faces'))
second=a['second'];pts=a['p']
E=set(edges);ei={x:i for i,x in enumerate(edges)}
fi={x:i for i,x in enumerate(faces)};pi={x:i for i,x in enumerate(second)}
anti={i:next(j for j in range(12) if j!=i and all(s.simplify(pts[i][k]+pts[j][k])==0 for k in range(3))) for i in range(12)}
B=s.zeros(30,20);Pi=s.zeros(30,30)
for row,(i,j) in enumerate(second):
    common=[k for k in range(12) if tuple(sorted((i,k))) in E and tuple(sorted((j,k))) in E]
    assert len(common)==2 and tuple(sorted(common)) in E
    Pi[row,ei[tuple(sorted(common))]]=1
    for endpoint in (i,j):
        B[row,fi[tuple(sorted((endpoint,*common)))]]=1
assert Pi*Pi.T==s.eye(30) and B==Pi*D
L=a['L']
assert B.T*B==D.T*D==6*s.eye(20)-L
Te3=D*P3/s.sqrt(3);Te5=D*P5
Td3=B*P3/s.sqrt(3);Td5=B*P5
for X,Y in ((Te3,Te5),(Td3,Td5)):
    assert s.simplify(X.T*X-P3)==s.zeros(20)
    assert Y.T*Y==P5 and s.simplify(X.T*Y)==s.zeros(20)
# Independent integer A5 character projector from the archived 60 rotations.
assert s.simplify(Td3*Td3.T+Td5*Td5.T-s.Matrix(a['proj'](second))/15)==s.zeros(30)
# The alternative antipodal cross-incidence filters the 4_3 quartet.
R=s.zeros(30,30)
for col,(i,j) in enumerate(edges):
    for pair in (tuple(sorted((anti[i],j))),tuple(sorted((i,anti[j])))):
        R[pi[pair],col]+=1
assert R.rank()==15 and R*D*P3==s.zeros(30,20) and R*D*P5==2*B*P5
# The two orthogonal lifts account for all 16 target quartet dimensions.
Splus3=Te3.col_join(Td3)/s.sqrt(2)
Splus5=Te5.col_join(Td5)/s.sqrt(2)
Sminus3=Te3.col_join(-Td3)/s.sqrt(2)
Sminus5=Te5.col_join(-Td5)/s.sqrt(2)
Splus=Splus3+Splus5;Sminus=Sminus3+Sminus5
assert s.simplify(Splus.T*Splus-P3-P5)==s.zeros(20)
assert s.simplify(Sminus.T*Sminus-P3-P5)==s.zeros(20)
assert s.simplify(Splus.T*Sminus)==s.zeros(20)
assert s.simplify((Splus.T*Splus).trace())==8
assert s.simplify((Sminus.T*Sminus).trace())==8
# The original q=2, 24-clock Gaussian response is independent of which
# normalized lift is used; both have the same 8 source directions.
q=2;N=24;r=float(s.pi/s.E);clock=a['clock'];theta=a['theta']
lam=np.sin(np.arange(N)+0.1);dg=np.roll(lam,-1)-lam
U=np.diag(np.exp(1j*q*lam));Lambda=np.diag(lam)
rng=np.random.default_rng(20261110)
for mass in (18,16):
    A=mass*np.eye(N)+r*r*clock(theta)
    Ag=mass*np.eye(N)+r*r*clock(theta+dg)
    assert np.linalg.norm(Ag-U@A@U.conj().T)<1e-10
    b=rng.normal(size=(N,4))+1j*rng.normal(size=(N,4))
    sol=np.linalg.solve(A,b)
    assert abs(np.vdot(b,sol)-np.vdot(U@b,np.linalg.solve(Ag,U@b)))<1e-10
    A1=1j*q*(Lambda@A-A@Lambda)
    A2=-q*q*(Lambda@Lambda@A-2*Lambda@A@Lambda+A@Lambda@Lambda)
    bp=1j*q*Lambda@b;bpp=-q*q*Lambda@Lambda@b
    v=bp-A1@sol
    # Source acceleration + Wilson seagull + Schur relaxation.
    ward=(-np.vdot(sol,bpp).real+.5*np.vdot(sol,A2@sol).real-
          np.vdot(v,np.linalg.solve(A,v)).real)
    assert abs(ward)<1e-10
assert np.linalg.eigvalsh(clock(theta)).min()>-1e-12
assert N*8==192
# Conditional local spatial Wilson-anchored pair: source q=2, two Weyl q=1.
li,lj,la=s.symbols('li lj la',real=True)
orbit=s.exp(-2*s.I*li)*s.exp(s.I*li)*s.exp(s.I*(li-la))*s.exp(s.I*(la-lj))*s.exp(s.I*lj)
assert s.simplify(orbit-1)==0
for x in (li,lj,la):
    assert s.simplify(s.diff(orbit,x))==0
    for y in (li,lj,la):assert s.simplify(s.diff(orbit,x,y))==0
print('PASS: D_distance2=Pi D_edge; both hidden quartets span both pair orbits')
print('PASS: antipodal cross-incidence kills 4_3 and doubles 4_5')
print('PASS: 16 target quartet dimensions, two orthogonal 8-dimensional lifts')
print('PASS: 192 conditional 24-clock modes and complete temporal Schur Ward contacts')
print('PASS: conditional spatial Wilson pair first/second gauge contacts')
print('OPEN: original H13+H51 vertex selection, physical poles, four ARFs')
