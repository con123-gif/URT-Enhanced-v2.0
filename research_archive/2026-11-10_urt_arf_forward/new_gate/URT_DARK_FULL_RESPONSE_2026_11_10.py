#!/usr/bin/env python3
"""Exact three-channel chronology and a symbolic Wilson transport covariance check."""
import sympy as S
R=S.Rational; rt=S.sqrt(5)
labels='2002122002210110120100122010120110210102210010210110122002212002'
assert len(labels)==64
levels=[S.S(0),(56-24*rt)/5,(56+24*rt)/5]
n5=[levels[int(c)] for c in labels]
n3=[S.simplify((5+2*rt)*(R(66,25)*x-R(3,40)*x*x)) for x in n5]
d=[S.Integer(-1 if h.bit_count()%2==0 else 1) if n5[h]==0 else S.S(0) for h in range(64)]
def Q(v):return [(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
def mean(v):return S.simplify(sum(v)/64)
def dot(a,b):return S.simplify(sum(x*y for x,y in zip(a,b))/64)
assert mean(n5)==7 and mean(n3)==36+72*rt/5
v=[d,[x-mean(n3) for x in n3],[x-7 for x in n5]]
assert all(mean(x)==0 for x in v)
C=[]
for k in range(7):
 M=S.zeros(3)
 for j in range(3):
  x=v[j]
  for _ in range(k):x=Q(x)
  for i in range(3):M[i,j]=dot(v[i],x)
 assert M==M.T,('asymmetric lag',k)
 C.append(M)
assert C[6]==S.zeros(3)
Fwd=S.simplify(sum(C,S.zeros(3)))
GK=S.simplify(C[0]+2*sum(C[1:6],S.zeros(3)))
assert GK==2*Fwd-C[0]
assert S.simplify(GK[0,0]-R(5,16))==0
assert S.simplify(GK[0,2]+3*rt/10)==0
assert S.simplify(GK[0,1]+(72+36*rt)/25)==0
assert S.simplify(Fwd[0,2]+3*rt/20)==0
assert S.simplify(Fwd[0,0]-R(11,32))==0
z=S.symbols('z');G=S.Matrix(3,3,lambda i,j:S.expand(sum(C[k][i,j]*z**k for k in range(6))))
assert G.subs(z,1)==Fwd
q=2
l0,l1,l2,t0,t1=S.symbols('l0 l1 l2 t0 t1',real=True)
W=S.exp(-S.I*q*(t0+t1))
Wg=S.exp(-S.I*q*(t0+l1-l0+t1+l2-l1))
assert S.simplify(Wg*S.exp(S.I*q*l2)-S.exp(S.I*q*l0)*W)==0
print('C0=',C[0]);print('Fwd=',Fwd);print('GreenKubo=',GK)
print('dark-five polynomial=',S.factor(G[0,2]))
print('dark-three polynomial=',S.factor(G[0,1]))
print('dark autocorrelation polynomial=',S.factor(G[0,0]))
print('PASS exact 64-state response, six-step closure, lag symmetry, normalization, Wilson covariance')
