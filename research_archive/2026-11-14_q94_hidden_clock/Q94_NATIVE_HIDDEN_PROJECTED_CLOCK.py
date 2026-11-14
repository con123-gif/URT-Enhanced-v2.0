#!/usr/bin/env python3
"""Q94: exact native H64 P3/P5 geometry-projected Gaussian clock response.

Original icosahedron 20-face incidence, six antipodal axis pairs, M history-face
map and Q two-successor dynamics. All geometry and projector calculations exact.
The residual clock action is CONDITIONAL and is not a physical ARF.
"""
from itertools import product, combinations
from math import cos, e, pi, isclose
from sympy import Matrix, eye, ones, Rational, sqrt as ssqrt, simplify

phi=(1+ssqrt(5))/2
pm=list(product((-1,1), repeat=2))
V=[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]+[(a*phi,0,b) for a,b in pm]
N=64
d2=lambda a,b: simplify(sum((V[a][c]-V[b][c])**2 for c in range(3)))
edges={(a,b) for a,b in combinations(range(12),2) if d2(a,b)==4}
assert len(edges)==30
faces=sorted(tuple(f) for f in combinations(range(12),3)
             if all(tuple(sorted((a,b))) in edges for a,b in combinations(f,2)))
assert len(faces)==20
pairs=[]
rem=set(range(12))
while rem:
    a=min(rem)
    b=next(b for b in sorted(rem-{a}) if all(
        simplify(V[a][c]+V[b][c])==0 for c in range(3)))
    pairs.append((a,b))
    rem-={a,b}
assert pairs==[(0,3),(1,2),(4,7),(5,6),(8,11),(9,10)]
C=Matrix(20,12, lambda k,v: int(v in faces[k]))
Ph=eye(20)-C*(C.T*C).inv()*C.T
assert Ph*Ph==Ph and Ph.rank()==8
Aface=Matrix(20,20, lambda i,j: int(
    i != j and len(set(faces[i]) & set(faces[j]))==2))
L=3*eye(20)-Aface
Ph3=Ph*(5*eye(20)-L)/2
Ph5=Ph*(L-3*eye(20))/2
assert Ph3+Ph5==Ph and Ph3.rank()==4 and Ph5.rank()==4
assert Ph3*Ph5==Matrix.zeros(20,20)
M=Matrix(64,20,lambda h,k: int(
    set(faces[k])<=set(p[(h>>i)&1] for i,p in enumerate(pairs))))
P8=M*Ph*M.T/2
assert P8*P8==P8 and P8.trace()==8 and P8*ones(64,1)==Matrix.zeros(64,1)
P3h=M*Ph3*M.T/2
P5h=M*Ph5*M.T/2
assert P3h+P5h==P8 and P3h.trace()==4 and P5h.trace()==4
assert P3h*P3h==P3h and P5h*P5h==P5h
assert P3h*P5h==Matrix.zeros(64,64)
Q=Matrix.zeros(64,64)
for h in range(N):
    Q[h,2*h%N]=Rational(1,2)
    Q[h,(2*h+1)%N]=Rational(1,2)
P=ones(64,64)/64
assert Q**6==P
R=[eye(64)-P]+[Q**i-P for i in range(1,6)]
S=[r.T*M for r in R]

def split_coeff(Pr):
    spr=[s*Pr for s in S]
    gram=Matrix(6,6,lambda i,j: sum(
        spr[i][k,a]*S[j][k,a] for k in range(64) for a in range(20))/2)
    assert gram==gram.T
    return gram, [sum(gram[i,i+d] for i in range(6-d)) for d in range(6)]

B3,C3=split_coeff(Ph3)
B5,C5=split_coeff(Ph5)
B,C8=split_coeff(Ph)
assert B3+B5==B and [a+b for a,b in zip(C3,C5)]==C8
assert C3==[Rational(34,5),Rational(2,5),0,0,0,0]
assert C5==[Rational(28,3),Rational(1,3),Rational(1,15),0,Rational(-4,15),0]
assert C8==[Rational(242,15),Rational(11,15),Rational(1,15),0,Rational(-4,15),0]
assert B.trace()==Rational(242,15)
assert 24*B3.trace()==Rational(816,5)
assert 24*B5.trace()==Rational(224)
assert 24*B.trace()==Rational(1936,5)
print("NATIVE P3/P5 PROJECTORS AND EXACT GRAM: PASS")
print("P3 coefficients:",[str(c) for c in C3])
print("P5 coefficients:",[str(c) for c in C5])
print("P8 coefficients:",[str(c) for c in C8])
print("24 MODE P3=816/5, P5=224, P8=1936/5: EXACT PASS")

# Independent dense inverse check on the exact operator converted to float.
import numpy as np
Qf=np.array(Q,dtype=float)
P3f=np.array(P3h,dtype=float)
P5f=np.array(P5h,dtype=float)
P8f=np.array(P8,dtype=float)
for w in (0.07,0.4,1.2,2.5):
    A=np.exp(1j*w)*np.eye(64)-Qf
    Ai=np.linalg.inv(A)
    Kinv=Ai@Ai.conj().T
    direct3=np.trace(P3f@Kinv).real
    direct5=np.trace(P5f@Kinv).real
    direct8=np.trace(P8f@Kinv).real
    pred3=34/5+4*cos(w)/5
    pred5=28/3+2*cos(w)/3+2*cos(2*w)/15-8*cos(4*w)/15
    pred8=pred3+pred5
    assert isclose(direct3,pred3,abs_tol=1e-10,rel_tol=1e-10), (w,direct3,pred3)
    assert isclose(direct5,pred5,abs_tol=1e-10,rel_tol=1e-10), (w,direct5,pred5)
    assert isclose(direct8,pred8,abs_tol=1e-10,rel_tol=1e-10), (w,direct8,pred8)
print("FOUR DIRECT DENSE RESOLVENT TESTS x THREE PROJECTORS: PASS")
print("With r=pi/e, 24-mode projected trace:",float(Rational(1936,5))*(e/pi)**2)
