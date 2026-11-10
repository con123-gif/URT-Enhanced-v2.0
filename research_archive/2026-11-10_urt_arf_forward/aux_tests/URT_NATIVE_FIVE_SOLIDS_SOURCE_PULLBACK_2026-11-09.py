#!/usr/bin/env python3
"""Conditional URT binary partition -> exact source averages of ORIGINAL Nov 7 Cathedral.
The six bits are coded as original LSB->six antipodal vertex-pair selections.
All five Platonic solids enter through the original Eglobal and Plinear.
This calculation derives the averaging weights from Haar coding, but
identifying URT's temporal phase cylinder with six original sign choices is
an additional *dictionary* not proven uniquely from the primitive dynamics.
"""
import io,contextlib,runpy
import numpy as np
from math import sqrt
P='/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py'
with contextlib.redirect_stdout(io.StringIO()): m=runpy.run_path(P)
geom=m['geom'];ico=geom['icosahedron']; pairs=m['pairs']
axes=np.array([ico['points'][a]/np.linalg.norm(ico['points'][a]) for a,b in pairs])
R3=[];R5=[]
for index in range(64):
    signs=np.array([1 if index & (1<<i) else -1 for i in range(6)])
    X,Y,Z=signs@axes
    q=np.array([(X*X-Y*Y)/sqrt(2),(X*X+Y*Y-2*Z*Z)/sqrt(6),sqrt(2)*X*Y,sqrt(2)*X*Z,sqrt(2)*Y*Z])
    a=np.r_[np.array([X,Y,Z])/sqrt(2),q/sqrt(32/5)]
    v=m['Eglobal']@a
    h3,h5=m['hidden_source'](v)
    R3.append(h3);R5.append(h5)
R3=np.array(R3).real;R5=np.array(R5).real
P3=m['P3'];P5=m['P5']; Delta=m['Delta']
Cg=(R3.T@R3+R5.T@R5)/64
coef3=9+18*sqrt(5)/5;coef5=7/4
error=np.linalg.norm(Cg-coef3*P3-coef5*P5)
print('all-five/64-state native hidden covariance error',error)
assert error<3e-12
print('native covariance eigenvalue 3 quartet',coef3,'energy5 quartet',coef5)
print('raw common normalized response at A4 singlet',coef5/(8*5),'not 1/40')
print('history mean h3 norm',np.linalg.norm(np.mean(R3,axis=0)),'h5',np.linalg.norm(np.mean(R5,axis=0)))
print('PASS')
