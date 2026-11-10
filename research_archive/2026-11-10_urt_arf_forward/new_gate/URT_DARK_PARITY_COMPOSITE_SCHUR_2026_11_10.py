#!/usr/bin/env python3
"""Exact dark-history composite and Schur residual from the original native source.
Run from new_gate/ beside URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py.
No ARF targets, fitting, or third-party Yang--Mills inputs.
"""
from pathlib import Path
from fractions import Fraction as F
from collections import Counter
import contextlib, io, runpy
import sympy as S

src=Path(__file__).resolve().parent/'URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py'
assert src.exists(), 'Original exact 190-cochain pullback source is required in new_gate/'
with contextlib.redirect_stdout(io.StringIO()):
    old=runpy.run_path(str(src))
Q5=old['Q5']; n5=old['n']; n3=old['n3']; Z=Q5()
assert len(n5)==len(n3)==64
w=[(-1)**h.bit_count() for h in range(64)]
d=[Q5(-w[h]) if n5[h]==Z else Z for h in range(64)]
assert d[1]==Q5(1) and d[12]==Q5(-1)
assert Counter(w[h] for h in range(64) if n5[h]==Z)=={1:12,-1:12}
for h,x in enumerate(n5):
    projector=Q5(1)-Q5(F(35,16))*x+Q5(F(25,256))*x*x
    assert d[h]==Q5(-w[h])*projector
    assert Q5(w[h])*x==Q5(0,F(1,120))*(Q5(5)*x*x-Q5(56)*x)

def mean(v):return sum(v,Z)/64
def dot(u,v):return mean([a*b for a,b in zip(u,v)])
def Q(v):return [(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
def center(v):return [x-mean(v) for x in v]
assert all(x==Z for x in Q([Q5(v) for v in w])) # Walsh degree six killed in one step
assert any(x!=Z for x in Q(d)) # dark composite nevertheless propagates
obs=[d,center(n3),center(n5)]
assert all(mean(x)==Z for x in obs)
assert dot(d,obs[1])==dot(d,obs[2])==Z
qobs=[[v] for v in obs]
for j in range(3):
    for _ in range(6):qobs[j].append(Q(qobs[j][-1]))
    assert all(x==Z for x in qobs[j][6])
C=[[[dot(obs[a],qobs[b][k]) for b in range(3)] for a in range(3)] for k in range(6)]
K=[[C[0][a][b]+sum((C[k][a][b]+C[k][b][a] for k in range(1,6)),Z)
    for b in range(3)] for a in range(3)]
def sym(x):return S.Rational(x.a.numerator,x.a.denominator)+S.Rational(x.b.numerator,x.b.denominator)*S.sqrt(5)
M=S.Matrix([[sym(x) for x in row] for row in K]);r=S.sqrt(5)
assert M==S.Matrix([
 [S.Rational(5,16),-(72+36*r)/25,-3*r/10],
 [-(72+36*r)/25,(2554416+1135296*r)/625,(57780+23112*r)/125],
 [-3*r/10,(57780+23112*r)/125,S.Rational(471,5)]])
B=M[1:3,1:3];b=M[1:3,0]
c=(B.inv()*b).applyfunc(S.simplify)
assert S.simplify(c[0]-175*(r-2)/2592)==0
assert S.simplify(c[1]+5*r/72)==0
assert S.simplify((b.T*B.inv()*b)[0])==S.Rational(1,144)
assert S.simplify(M[0,0]-(b.T*B.inv()*b)[0])==S.Rational(11,36)
assert S.simplify(M.det())==(384912+171072*r)/3125
# Independently enumerate all ordered time pairs at T=12 and T=24.
def finite(T):
    out=[[Z for _ in range(3)] for _ in range(3)]
    for i in range(T):
        for j in range(T):
            k=abs(i-j)
            if k>=6:continue
            for a in range(3):
                for b0 in range(3):out[a][b0]+=C[k][a][b0] if i<=j else C[k][b0][a]
    return [[x/T for x in row] for row in out]
T12=finite(12);T24=finite(24)
assert all(2*T24[a][b0]-T12[a][b0]==K[a][b0] for a in range(3) for b0 in range(3))
print('PASS exact Q(sqrt5) source: d=-Walsh6*(1-35*n5/16+25*n5^2/256)')
print('PASS bright orbit identity: Walsh6*n5=sqrt(5)*(5*n5^2-56*n5)/120')
print('PASS Q Walsh6=0 but Q d !=0: composite couples through chronology')
print('PASS exact K-orthogonal residual: c3=',c[0],'c5=',c[1])
print('PASS Kdd=5/16, bright-mediated=1/144, residual=11/36, fraction bright=1/45')
print('PASS independent T12/T24 pair enumeration, all 64 histories')
print('Four physical ARFs OPEN: neutral history composite is not a charged-matter vertex')
