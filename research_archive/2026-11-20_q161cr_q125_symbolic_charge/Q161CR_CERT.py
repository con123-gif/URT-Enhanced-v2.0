#!/usr/bin/env python3
"""Exact symbolic original Q125 Hopf/Q96 charged vertex Ward certificate.
Source: research_archive/2026-11-17_q161_q96_three_generation_hopf_source/
Q161_Q96_SOURCE_THREE_GENERATION_WARD_CERT.py.
"""
import sympy as s
u,v,ub,vb=s.symbols('u v ub vb',commutative=True)
p=s.Matrix([u,v]); n=s.Matrix([-vb,ub])
V=s.zeros(8)
for c in range(3):
    V[2*c:2*c+2,c]=p
    V[2*c:2*c+2,3+c]=n
V[6:8,6]=n
V[6:8,7]=p
R=s.diag(*([s.Rational(2,3)]*3+[-s.Rational(1,3)]*3+[-1,0]))
P=p*s.Matrix([[ub,vb]])
N=n*s.Matrix([[-v,u]])
QL=s.zeros(8)
for c,block in enumerate([s.Rational(2,3)*P-s.Rational(1,3)*N]*3+[-N]):
    QL[2*c:2*c+2,2*c:2*c+2]=block
norm=u*ub+v*vb
Vdag=V.T.xreplace({u:ub,v:vb,ub:u,vb:v})
assert all(s.expand(x)==0 for x in QL*V-norm*V*R)
assert all(s.expand(x)==0 for x in Vdag*V-norm*s.eye(8))
Q=s.zeros(16); Q[:8,:8]=QL;Q[8:,8:]=R
M=s.zeros(16); M[:8,8:]=V;M[8:,:8]=Vdag
for x in Q*M-M*Q:
    assert s.expand(s.expand(x).subs(ub,(1-v*vb)/u))==0
print("Q161CR EXACT PASS: original Q125 8x8 Hopf vertex, Q96 charges; symbolic norm-1 Ward")
