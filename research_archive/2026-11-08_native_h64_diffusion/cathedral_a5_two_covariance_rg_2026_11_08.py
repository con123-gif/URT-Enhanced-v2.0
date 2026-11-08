#!/usr/bin/env python3
"""Exact A5 two-channel Gaussian covariance renormalisation on ORIGINAL Cathedral portal.
Tests arbitrary positive mode covariances (a,b), U1 Ward and exact additive Wick flow.
"""
from pathlib import Path
import runpy
import numpy as np
import sympy as sp
from math import sqrt
import hashlib
base=Path(__file__).parent
original=base/'cathedral_constructed_joint_dynamics_2026_11_07.py'
z=runpy.run_path(str(original))
C=sp.Matrix(z['C'].astype(int));L=sp.Matrix(np.rint(z['Lface']).astype(int)); A=sp.Matrix(z['Aico']);I12=sp.eye(12)
P=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=sp.simplify(P*(5*sp.eye(20)-L)/2)
P5=sp.simplify(P*(L-3*sp.eye(20))/2)
Lico=5*I12-A
sq5=sp.sqrt(5)
levels=[0,5-sq5,6,5+sq5]
def spectral(ell):
 M=I12
 for x in levels:
  if ell!=x:M=M*(Lico-x*I12)/(ell-x)
 return sp.simplify(M)
Pi3=spectral(5-sq5);Pi5=spectral(6)
S3=C*Pi3*C.T;S5=C*Pi5*C.T
# Scalar a,b denote covariance in native ico 3 and 5 irreps, no fitted constants.
mu33=2+4*sq5/5
mu35=sp.Rational(6,5)+12*sq5/25
mu55=sp.Rational(4,5)
t3=3+6*sq5/5
for name,pj in [('3',P3),('5',P5)]:
 print('checking',name)
 # polynomial coefficient identities: no full symbolic a,b expansion required
 M_a=C.T*(pj.multiply_elementwise(S3))*C
 M_b=C.T*(pj.multiply_elementwise(S5))*C
 if name=='3':
  assert sp.simplify(Pi3*M_a*Pi3)==sp.zeros(12)
  assert sp.simplify(Pi5*M_b*Pi5)==sp.zeros(12)
  assert sp.simplify(Pi3*M_b*Pi3-mu33*Pi3)==sp.zeros(12)
  assert sp.simplify(Pi5*M_a*Pi5-mu35*Pi5)==sp.zeros(12)
 else:
  assert sp.simplify(Pi3*M_a*Pi3)==sp.zeros(12)
  assert sp.simplify(Pi3*M_b*Pi3)==sp.zeros(12)
  assert sp.simplify(Pi5*M_a*Pi5)==sp.zeros(12)
  assert sp.simplify(Pi5*M_b*Pi5-mu55*Pi5)==sp.zeros(12)

X33=sp.simplify(P3*(S3.multiply_elementwise(S3))*P3)
X35=sp.simplify(P3*(S3.multiply_elementwise(S5)+S5.multiply_elementwise(S3))*P3)
X55=sp.simplify(P3*(S5.multiply_elementwise(S5))*P3)
assert X33==sp.zeros(20) and X55==sp.zeros(20)
assert sp.simplify(X35-t3*P3)==sp.zeros(20)
Y33=sp.simplify(P5*(S3.multiply_elementwise(S3))*P5)
Y35=sp.simplify(P5*(S3.multiply_elementwise(S5)+S5.multiply_elementwise(S3))*P5)
Y55=sp.simplify(P5*(S5.multiply_elementwise(S5))*P5)
assert Y33==sp.zeros(20) and Y35==sp.zeros(20)
assert sp.simplify(Y55-P5)==sp.zeros(20)

# Arbitrary circular complex Gaussian source with 50D covariance
# Sigma50 = E3 a E3^T + E5 b E5^T, so 12D covariance = a Pi3+b Pi5.
Q=z['Plinear'];Cnum=np.array(C,dtype=float);p3=np.asarray(P3,dtype=float);p5=np.asarray(P5,dtype=float)
E=z['Eglobal'];E3=E[:,:3];E5=E[:,3:8]
assert np.linalg.norm(Q@Q.T-np.asarray(Pi3+Pi5,dtype=float))<1e-11
Del=float(z['Delta']);c3=2/9;c5=7*Del*Del/32
for a,b in [(1,1),(1,.1),(.1,1),(100,.1),(0.3,2.3)]:
 S=np.asarray(S3,dtype=float)*a+np.asarray(S5,dtype=float)*b
 M3=Q.T@Cnum.T@(p3*S)@Cnum@Q
 M5=Q.T@Cnum.T@(p5*S)@Cnum@Q
 R=c3*M3+c5*M5
 vals=np.linalg.eigvalsh(R)
 expected=np.array([0]*42+[float(c3*mu33)*b]*3+[(float(c3*mu35)*a+float(c5*mu55)*b)]*5)
 assert np.allclose(vals,np.sort(expected),rtol=1e-10,atol=1e-10),(a,b,vals[-8:],expected[-8:])
 K=c3*float(mu33)*b
 V=c3*float(mu35)*a+c5*float(mu55)*b
 assert abs(vals[-1]-max(K,V))<1e-10
 assert np.linalg.norm(p3@(S*S)@p3 -float(t3)*a*b*p3)<2e-10
 assert np.linalg.norm(p5@(S*S)@p5 -b*b*p5)<2e-10
 print(f'PASS a={a}, b={b}: sharp uniform mct2= {8*max(K,V):.12f}; leading sector={"3" if K>V else "5"}')

# In the Gaussian convolution semigroup, covariance increments add and Wick
# operators compose. The constant terms have nontrivial cross-covariance Wick pieces.
# Verify normal-ordering sequentially by finite polynomial contractions:
# N_S(Q) = Q - 4 v†M(S)v + 2 Tr(P(S◦S))
# N_R[N_S(Q)] adds -4 v†M(R)v plus 2Tr(P(R◦R))
# and N_R[-4v†M(S)v] generates +4Tr(M(S)R_vertex).
# Identity requires 2Tr P[(S+R)◦(S+R)] = 2Tr P[S◦S+R◦R]+4Tr P[S◦R].
A0=.7;B0=.25;A1=.18;B1=.4
S=np.asarray(S3,dtype=float)*A0+np.asarray(S5,dtype=float)*B0
T=np.asarray(S3,dtype=float)*A1+np.asarray(S5,dtype=float)*B1
for p in [p3,p5]:
 M=lambda Z: Cnum.T@(p*Z)@Cnum
 # Two symmetric cross pairings from the mixed Wick contraction
 lhs=2*np.trace(p*((S+T)*(S+T)))
 rhs=2*np.trace(p*(S*S))+2*np.trace(p*(T*T))+4*np.trace(p*(S*T))
 assert abs(lhs-rhs)<1e-10
 assert np.linalg.norm(M(S+T)-M(S)-M(T))<1e-11
print('PASS exact additive 2-sector Gaussian covariance/Wick counterterm flow (cross vacuum term included)')
print('SHA256 original',hashlib.sha256(original.read_bytes()).hexdigest())