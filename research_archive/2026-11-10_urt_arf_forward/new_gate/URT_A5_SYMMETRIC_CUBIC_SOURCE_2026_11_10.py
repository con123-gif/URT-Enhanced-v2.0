#!/usr/bin/env python3
"""A5-equivariant tetrahedral-vacuum simplex and its time-integrated cubic response.

Unique relative signs are fixed by the five simplex vectors in the hidden A5 quartet;
remaining global sign ambiguity is explicitly retained. No ARF targets or tuning.
"""
import runpy, contextlib, io
from pathlib import Path
from fractions import Fraction as F
import sympy as sp
with contextlib.redirect_stdout(io.StringIO()):
    r=runpy.run_path(str(Path(__file__).parent/'URT_EXACT_A4_THIRD_CUMULANT_RATE_2026_11_10.py'))
Q5=r['Q5'];rows=r['res'];assert len(rows)==5
# Each line's raw rational vector has norm squared 1/30 or 3/40.
# Rescale each vector to common norm squared 1/30.
vs=[];fs=[]
for row in rows:
    r2=row[5]
    factor=sp.Rational(2,3) if r2==sp.Rational(3,40) else sp.Integer(1)
    assert r2*factor**2==sp.Rational(1,30)
    vs.append(row[7]*factor)
    fs.append(factor)
# The unique five-way regular simplex fixes all relative signs.
signs=[sp.Integer(1)]
for j in range(1,5):
    inner=(vs[0].T*vs[j])[0]
    assert abs(inner)==sp.Rational(1,120),inner
    signs.append(-sp.sign(inner))
vv=[signs[j]*vs[j] for j in range(5)]
for i in range(5):
    for j in range(5):
        want=sp.Rational(1,30) if i==j else -sp.Rational(1,120)
        assert (vv[i].T*vv[j])[0]==want,(i,j,(vv[i].T*vv[j])[0],want)
assert sum(vv,sp.zeros(20,1))==sp.zeros(20,1)
# All five one-time cubic amplitudes are equal with these A5-equivariant signs.
normalized_one_time=[];normalized_time=[];normalized_variances=[]
for j,row in enumerate(rows):
    f=Q5(F(int(fs[j].p),int(fs[j].q)))
    sg=int(signs[j])
    normalized_one_time.append(row[0]*sg*f*f*f)
    normalized_time.append(row[3]*sg*f*f*f)
    normalized_variances.append(row[6]*f*f)
assert len(set((v.a,v.b) for v in normalized_one_time))==1
assert normalized_one_time[0]==Q5(F(1,100)) or normalized_one_time[0]==Q5(F(-1,100))
# Scale a common rational vector of norm^2=1/30 to an HS-unit vector by sqrt(30).
# Its third cumulant is 30*sqrt(30)*Kraw and its variance is 30*Vraw.
avgK=sum(normalized_time,Q5())/5
avgKsq=(avgK*avgK)*Q5(27000)  # (30 sqrt30)^2
avgVar=sum(normalized_variances,Q5())/5*Q5(30)
assert avgVar==Q5(F(71,48))
print('A5 regular 5-simplex Gram: diag 1/30, offdiag -1/120, sum zero: EXACT')
print('relative sign selection',signs,'one-time cubic raw',normalized_one_time[0], 'normalized one-time',float(normalized_one_time[0])*30*30**.5)
print('five fixed-frame normalized cubic rates', [float(k)*30*30**.5 for k in normalized_time])
print('fixed-frame A5-average source cubic-rate raw',avgK,'squared normalized exactly',avgKsq,'value ±',abs(float(avgK)*30*30**.5))
print('A5-average quadratic rate exact',avgVar, 'numerically',float(avgVar))
print('PASS: A5-equivariant simplex orienting removes relative tetrahedral sign ambiguity; global sign remains')