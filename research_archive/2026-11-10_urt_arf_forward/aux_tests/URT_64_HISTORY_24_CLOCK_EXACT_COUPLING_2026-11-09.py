#!/usr/bin/env python3
"""Exact Haar conditional-history/clock overlap from original v61 URT.
No fitted parameter, and no ARF outputs used as inputs.
We specify phase clock coordinate t=theta/(2pi) and binary history y=(t+phi^-2) mod1.
This specifies a particular identification of the existing 64 signed histories
with six successive binary digits; that identification is a modelling bridge,
not yet a derivation from the five Platonic-solid incidence dynamics.
"""
import math
import sympy as s
import numpy as np

P=s.Rational
PHI=(1+s.sqrt(5))/2
A=s.simplify(1/PHI**2)
assert abs(float(A)-0.38196601125010515)<1e-14

def overlap(a,b,c,d):
    a,b,c,d=[s.sympify(z) for z in (a,b,c,d)]
    aa=max(a,c,key=float)
    bb=min(b,d,key=float)
    if float(bb-aa)<1e-14: return s.Integer(0)
    return s.expand(bb-aa)

C=s.zeros(24,64)
for j in range(24):
    a=s.Rational(j,24)+A
    b=s.Rational(j+1,24)+A
    # Exact lifted intersection of shifted clock arc with 64 history cylinders.
    for h in range(64):
        for k in range(0,3):
            C[j,h]+=overlap(a,b,s.Rational(h,64)+k,s.Rational(h+1,64)+k)
assert all(s.simplify(t-s.Rational(1,24))==0 for t in C*s.ones(64,1))
assert all(s.simplify(t-s.Rational(1,64))==0 for t in s.ones(1,24)*C)
nnz=sum(1 for x in C if x!=0)
row_support=[sum(1 for h in range(64) if C[j,h]!=0) for j in range(24)]
col_support=[sum(1 for j in range(24) if C[j,h]!=0) for h in range(64)]

# Natural L2 conditional expectation: B_{jh}=C_jh / sqrt(p_j p_h).
# Uniform margins p_j=1/24, p_h=1/64.
B=np.sqrt(24*64)*np.array(C.evalf(22)).astype(float)
u, sig, vt=np.linalg.svd(B, full_matrices=False)
assert abs(sig[0]-1)<1e-13
assert sig[-1]>1e-8
assert all(x<=1+1e-12 for x in sig)
assert np.linalg.norm(B@(np.ones(64)/8)-np.ones(24)/np.sqrt(24))<1e-13
assert np.linalg.norm(B.T@(np.ones(24)/np.sqrt(24))-np.ones(64)/8)<1e-13
T=B.T@B
assert np.linalg.norm(T-T.T)<1e-13
assert np.linalg.eigvalsh(T)[0]>-1e-13
assert np.sum(np.linalg.eigvalsh(T)>1e-11)==24

# Six icosahedral unit axes, normalized, with six signed history bits.
vraw=s.Matrix([[0,0,1,1,PHI,PHI],
               [1,1,PHI,-PHI,0,0],
               [PHI,-PHI,0,0,1,-1]])
V=vraw/s.sqrt(1+PHI**2)
assert all(s.simplify(z)==0 for z in V*V.T-2*s.eye(3))
Gram=s.simplify(V.T*V)
assert all(s.simplify(Gram[i,j]**2-s.Rational(1,5))==0 for i in range(6) for j in range(6) if i!=j)
S=s.Matrix([[2*((h>>(5-i))&1)-1 for h in range(64)] for i in range(6)])
assert S*s.ones(64,1)==s.zeros(6,1)
assert S*S.T==64*s.eye(6)
X=V*S
assert all(s.simplify(z)==0 for z in X*X.T/64-2*s.eye(3))
# exact 4th radial moment by Rademacher Wick-style expectation:
fourth=s.simplify(6**2+4*sum(Gram[i,j]**2 for i in range(6) for j in range(i+1,6)))
assert fourth==48

# The same physical URT phase links history bits and clock tracks.
# B uses raw overlap; the source covariance x_h is not whitened by fiat.
Xn=np.array(X.evalf(22)).astype(float)
# J_clock[j,a]=E[X_a|clock=j]=sum_h 24*C[j,h] X_h
Jn=24*np.array(C.evalf(22)).astype(float)@Xn.T
assert np.linalg.norm(np.mean(Jn,axis=0))<1e-13
clock_source_second=(Jn.T@Jn)/24
clock_source_eigs=np.linalg.eigvalsh(clock_source_second)
assert clock_source_eigs[0]>0
# law of total variance: E[ E(X|clock)E(X|clock)^T ] <= 2 I
assert np.linalg.eigvalsh(2*np.eye(3)-clock_source_second)[0]>-1e-12

print('history-clock shift = phi^-2:',s.simplify(A),s.N(A,16))
print('overlap exact row=1/24 and column=1/64: PASS')
print('nonzero overlaps',nnz,'row support distribution',{k:row_support.count(k) for k in set(row_support)})
print('column support distribution',{k:col_support.count(k) for k in set(col_support)})
print('B conditional overlap shape',B.shape,'rank',sum(sig>1e-10),'top 5 sigmas',sig[:5])
print('bottom 5 nonzero sigmas',sig[-5:])
print('T=B^T B positive rank24: PASS')
print('source icosahedral six-axis E[xx^T]=2I: PASS')
print('source E[|x|^4]=',fourth)
print('clock conditional 3D current covariance eigenvalues',clock_source_eigs)
print('clock conditional 3D current mean norm min/max',np.linalg.norm(Jn,axis=1).min(),np.linalg.norm(Jn,axis=1).max())
print('PASS')
