#!/usr/bin/env python3
"""Source-derived Q101 nonlinear face -> vertex 3-to-3prime chiral bridge.
Original Q101 50->8->12 downstream Pl, true C, hidden P3/P5, actual 30
frustrated ground words. Exact Q(sqrt(5)) singular values; no fitted masses.
Physical H64/24/Q96 Yukawa selection is NOT claimed.
"""
from pathlib import Path
import runpy
import numpy as np
import sympy as sp
root=Path(__file__).resolve().parents[2]
native=root/"research_archive/2026-11-17_q161_source_selected_generation/Q161_SOURCE_SELECTED_GENERATION_CERT.py"
z=runpy.run_path(str(native))
v=z["v"];C=z["C"];P3=z["P3"];P5=z["P5"]
Plo=z["Plo"];Phi=z["Phi"];ground=z["ground"]
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=sp.Matrix(12,12,lambda i,j:int(i==opp[j]))
P3v=v*(v.T*v).inv()*v.T
P5v=(sp.eye(12)+Kv)/2-sp.ones(12,12)/12
Pl=sp.simplify(P3v+P5v)
assert (Pl*Pl-Pl).applyfunc(sp.simplify)==sp.zeros(12)
mask,s=ground[0]
f=C*Pl*sp.Matrix(s)
f=sp.Matrix([sp.expand(q*q) for q in f])
a=sp.simplify(C.T*f)                   # actual 20-face nonlinear source back to 12 contacts
Y=sp.simplify(Plo*sp.diag(*list(a))*Phi)
assert Y.rank()==3
T=sp.simplify(Y.T*Y)
t1=sp.simplify(sp.trace(T))
t2=sp.simplify(sp.trace(T*T))
t3=sp.simplify(sp.trace(T*T*T))
e1=t1
e2=sp.simplify((t1*t1-t2)/2)
e3=sp.simplify((t1**3-3*t1*t2+2*t3)/6)
x=sp.symbols("x")
poly=sp.factor(x**3-e1*x*x+e2*x-e3)
expected=(125*x-169)*(15625*x*x-13375*x+961)/sp.Integer(1953125)
assert sp.simplify(poly-expected)==0
assert t1==sp.Rational(276,125)
l1=sp.Rational(107,250)-sp.Rational(39,250)*sp.sqrt(5)
l2=sp.Rational(107,250)+sp.Rational(39,250)*sp.sqrt(5)
l3=sp.Rational(169,125)
for lam in (l1,l2,l3):
    assert sp.simplify(expected.subs(x,lam))==0
assert sp.simplify((sp.sqrt(l1)+sp.sqrt(l2))**2-l3)==0
# The A5 orbit changes only orientation; check every one of 30 native words.
Cf=np.array(C,float);Pf=np.array(Pl,float)
K=np.array(z["K"],float)
evals,U=np.linalg.eigh(K)
Ul=U[:,(evals>1e-8)&(evals<.1)]
Uh=U[:,evals>.1]
assert Ul.shape==Uh.shape==(12,3)
reference=np.sort(np.sqrt([float(l1),float(l2),float(l3)]))[::-1]
for m,ss in ground:
    face=(Cf@Pf@np.array(ss,float))**2
    vertex=Cf.T@face
    sv=np.linalg.svd(Ul.T@np.diag(vertex)@Uh,compute_uv=False)
    assert np.allclose(sv,reference,atol=2e-12,rtol=0),(m,sv)
print("EXACT Q101 FULL-RANK 3x3 FACE-SOURCE CHIRAL POLYNOMIAL",poly,flush=True)
print("SINGULAR VALUES",reference,flush=True)
print("EXACT SUM RULE smallest+middle=largest; 30/30 ground orbit PASS",flush=True)
print("NOT an identified physical Yukawa; H64/24/Q96 coupling still required",flush=True)
