#!/usr/bin/env python3
"""Exact spectral certificates for native golden-twist doubling 24-bin readout.
The coarse-grained 1-step Markov composition and the true deterministic
3-step conditional transfer are distinct; no free matrix coefficient used.
"""
import sympy as s
f=s.symbols('f',real=True)
P=s.zeros(24)
for i in range(24):
 P[i,(2*i+9)%24]+=(1-f)/2
 P[i,(2*i+10)%24]+=s.Rational(1,2)
 P[i,(2*i+11)%24]+=f/2
A=s.factor((3*f*f-3*f+1)/4)
assert s.trace(P)==1
assert s.factor(s.trace(P**2)-(1+2*A))==0
assert s.factor(s.trace(P**3)-1)==0
assert all(s.factor(x)==0 for x in (P**3*(P-s.eye(24))*(P**2-A*s.eye(24))))
assert all(s.simplify(y)==0 for i in range(21) for y in (P**3)[i,:]-(P**3)[(i+3)%24,:])
# Characteristic polynomial lambda^21(lambda-1)(lambda^2-A).
# Rows P^3 indexed only by i modulo3 -> rank<=3; traces imply 3
# nonzero eigenvalues 1, +sqrt(A), -sqrt(A) for 0<f<1.
fg=27-12*s.sqrt(5)
assert s.simplify(A.subs(f,fg)-(s.Rational(4267,4)-477*s.sqrt(5)))==0

def over(a,b,c,d):
 vals={f:.16718427}
 a,b,c,d=[s.sympify(x) for x in (a,b,c,d)]
 low=a if float(a.subs(vals))>float(c) else c
 high=b if float(b.subs(vals))<float(d) else d
 if float((high-low).subs(vals))<=1e-12:return s.Integer(0)
 return s.expand(high-low)
# Direct iterate sends angular cell i to uniform interval
# [8*i+7*(9+f),8*i+7*(9+f)+8] modulo 24.
Q=s.zeros(24)
for i in range(24):
 a=8*i+7*(9+f);b=a+8
 for j in range(24):
  for k in range(1,13):
   Q[i,j]+=over(a,b,j+24*k,j+24*k+1)/8
assert all(s.simplify(x)==1 for x in Q*s.ones(24,1))
assert all(s.simplify(x)==1 for x in s.ones(1,24)*Q)
assert all(s.simplify(Q[i,j]-Q[(i+3)%24,j])==0 for i in range(24) for j in range(24))
B=s.factor(7*(21*f*f-9*f+1)/64)
assert s.trace(Q)==1
assert s.factor(s.trace(Q**2)-(1+2*B))==0
assert s.factor(s.trace(Q**3)-1)==0
assert all(s.factor(x)==0 for x in (Q*(Q-s.eye(24))*(Q**2-B*s.eye(24))))
assert s.simplify(B.subs(f,fg)-(s.Rational(211309,64)-s.Rational(23625,16)*s.sqrt(5)))==0
assert Q!=P**3
error2=s.factor(sum((Q[i,j]-(P**3)[i,j])**2 for i in range(24) for j in range(24)))
assert s.N(error2.subs(f,fg),15)>0.31
print('one-step coarse-grained P eigenvalues: 1, +/-sqrt(A), 21 zeros; A=', A)
print('golden A=',s.simplify(A.subs(f,fg)),'eigen +/-',s.N(s.sqrt(A.subs(f,fg)),18))
print('direct three-step Q eigenvalues: 1,+/-sqrt(B),21 zeros; B=',B)
print('golden B=',s.simplify(B.subs(f,fg)),'eigen +/-',s.N(s.sqrt(B.subs(f,fg)),18))
print('P^3 != Q: Frobenius norm^2 =',error2,'at golden',s.N(error2.subs(f,fg),16))
print('deterministic and coarse-grained 3-return traces both 1 -> mean 1/24')
print('PASS: exact characteristic/minimal polynomial and true-map comparison')
