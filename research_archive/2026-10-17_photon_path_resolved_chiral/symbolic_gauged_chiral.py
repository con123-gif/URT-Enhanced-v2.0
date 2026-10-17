#!/usr/bin/env python3
"""Exact algebraic coefficients for all-shortest-path photon-dressed chiral loop."""
import sympy as sp
from itertools import product
from fractions import Fraction
import gauged_chiral_face_loops as q

L=sp.Matrix((q.ds[2].T@q.ds[2]).astype(int).tolist())
I=sp.eye(20);Z=L-3*I
P3=L*(L-2*I)*(L-5*I)*(Z*Z-5*I)/30
P5=-L*(L-2*I)*(L-3*I)*(Z*Z-5*I)/30
P=P3+P5
W=sp.Matrix(q.W.astype(int).tolist());J=W/sp.sqrt(15)
assert W*W==-15*P
Pi=(P-sp.I*J)/2
D=sp.symbols('Delta', positive=True, real=True)
R=P3+D**2*P5-sp.I*D*J # rho times 4(1+D²)

counts={}
def fraction(n):
 f=Fraction(float(n)).limit_denominator(10000)
 assert abs(float(f)-n)<1e-9
 return sp.Rational(f.numerator,f.denominator)
tri=q.faces[0]
# First chiral loop has e_{vertex i}, e_{vertex j}, e_{vertex k}.
for f,g,h in product(*[q.sets[i] for i in tri]):
 vals=q.loops_info(f,g,h)
 weights={}
 for val in vals:
  v=fraction(val);weights[v]=weights.get(v,0)+1
 for v,count in weights.items():
  coeff=sp.Rational(count,len(vals))
  if v not in counts:counts[v]=[sp.Integer(0),sp.Integer(0)]
  counts[v][0]+=coeff*Pi[f,g]*Pi[g,h]*Pi[h,f]/27
# KMS uses rotated vertex assignment, cf exact formula.
for i,j,k in [tri]:
 for f,g,h in product(q.sets[k],q.sets[i],q.sets[j]):
  vals=q.loops_info(f,g,h)
  weights={}
  for val in vals:
   v=fraction(val);weights[v]=weights.get(v,0)+1
  for v,count in weights.items():
   coeff=sp.Rational(count,len(vals))
   counts[v][1]+=coeff*R[f,g]*P[g,h]*P[h,f]/(27*4*(1+D**2))

x=sp.symbols('x',real=True,positive=True)
Bpure=0;Bgibbs=0
for v,(a,b) in sorted(counts.items()):
 a=sp.simplify(sp.expand(a));b=sp.factor(sp.simplify(b))
 print('VAR',v)
 print('PURE  ',a)
 print('GIBBS ',b)
 Bpure+=a*sp.exp(-x*v/2)
 Bgibbs+=b*sp.exp(-x*v/2)
assert sp.simplify(Bpure.subs(x,0)-(sp.Rational(743,182250)-sp.I*13*sp.sqrt(15)/60750))==0
expected=(699+655*D**2-sp.I*54*sp.sqrt(15)*D)/(729000*(1+D**2))
assert sp.simplify(Bgibbs.subs(x,0)-expected)==0
print('EXACT PASS analytical weighted loops four exponentials')
print('PURE symbolic:',Bpure)
print('GIBBS symbolic:',Bgibbs)
print('NUMERICAL pure',complex(Bpure.subs(x,q.coupling).evalf()))
print('NUMERICAL Gibbs',complex(Bgibbs.subs({x:q.coupling,D:q.c.DELTA}).evalf()))
from pathlib import Path
out='EXACT FINITE GAUSSIAN PHOTON LOOP\n\n'
out+='Bpure(g²) = '+str(Bpure)+'\n\n'
out+='Bgibbs(g²,Delta) = '+str(Bgibbs)+'\n\n'
for v,(a,b) in sorted(counts.items()):out+='variance '+str(v)+' pure '+str(sp.simplify(a))+' Gibbs '+str(sp.simplify(b))+'\n'
Path(__file__).with_name('EXACT_SYMBOLIC_LOOP.txt').write_text(out)
