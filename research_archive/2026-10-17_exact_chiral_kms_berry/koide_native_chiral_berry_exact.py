#!/usr/bin/env python3
"""Exact 20-face chiral Berry and KMS loop certificate; no mass inputs.

Run from repository root:
 python research_archive/2026-10-17_exact_chiral_kms_berry/koide_native_chiral_berry_exact.py
"""
import sys
from pathlib import Path
import numpy as np
import sympy as s

archive=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(archive/"2026-10-15_icosahedral_125_DEC_H64"))
import cathedral_strict_64_closure as c64

v,_,_,faces,ds,c=c64.icosahedron()
L=3*s.eye(20)
for a in range(20):
 for b in range(a+1,20):
  if len(set(faces[a])&set(faces[b]))==2:L[a,b]=L[b,a]=-1
I=s.eye(20);Z=L-3*I
P3=L*(L-2*I)*(L-5*I)*(Z*Z-5*I)/30
P5=-L*(L-2*I)*(L-3*I)*(Z*Z-5*I)/30
P=P3+P5
assert P*P==P and P3*P5==s.zeros(20)
cent=np.array([v[list(f)].sum(axis=0) for f in faces]);W=s.zeros(20)
for a in range(20):
 for b in range(20):
  common=set(faces[a])&set(faces[b])
  dot=sum(v[i]@np.cross(cent[a],cent[b]) for i in common)
  W[a,b]=int(np.sign(dot)) if abs(dot)>1e-8 else 0
assert W.T==-W and W*W==-15*P
J=W/s.sqrt(15);Pi=(P-s.I*J)/2
assert s.simplify(Pi*Pi-Pi)==s.zeros(20)
inc=[[j for j,f in enumerate(faces) if i in f] for i in range(12)]
def barg(i,j,k):
 return s.simplify(sum(Pi[f,g]*Pi[g,h]*Pi[h,f]
   for f in inc[i] for g in inc[j] for h in inc[k])/27)
def trace_XEEE(X,i,j,k):
 return s.simplify(sum(X[f,g]*P[g,h]*P[h,f]
   for f in inc[k] for g in inc[i] for h in inc[j])/27)
expected=s.Rational(743,182250)-13*s.I*s.sqrt(15)/60750
D=s.symbols("Delta",positive=True,real=True)
thermal=(699+655*D**2-54*s.I*s.sqrt(15)*D)/(729000*(1+D**2))
for i,j,k in faces:
 assert s.simplify(barg(i,j,k)-expected)==0
 assert s.simplify(barg(i,k,j)-s.conjugate(expected))==0
 A3=trace_XEEE(P3,i,j,k)
 A5=trace_XEEE(P5,i,j,k)
 AJ=trace_XEEE(J,i,j,k)
 assert A3==s.Rational(233,60750)
 assert A5==s.Rational(131,36450)
 assert s.simplify(AJ-s.sqrt(15)/3375)==0
 assert s.simplify((A3+D**2*A5-s.I*D*AJ)/(4*(1+D**2))-thermal)==0
print("PASS exact W, both chiral projectors, 20 triangle phases and KMS dressing")
print("Bare amplitude:",expected,"phase:",float(s.arg(expected)))
print("KMS amplitude:",thermal)
print("KMS phase at Cathedral Delta:",float(s.arg(thermal.subs(D,c64.DELTA))))
print("STATUS: exact geometric phase, not physical Koide identification")
