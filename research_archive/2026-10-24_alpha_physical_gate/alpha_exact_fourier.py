#!/usr/bin/env python3
"""Exact rational Fourier certificate for unfitted A4 Wilson photon beta^4 residue.
Original source: research_archive/2026-10-17_original_oct08_source/
continued_physics_work/photon/free_fock_photon.py.
No measured alpha or historical alpha polynomial is used.
"""
from fractions import Fraction as F
from itertools import combinations, product
from collections import defaultdict

class P:
    def __init__(self, d=0):
        if isinstance(d,P): self.d=d.d.copy()
        elif isinstance(d,dict): self.d={k:F(v) for k,v in d.items() if v}
        else: self.d={(0,0):F(d)} if d else {}
    def __add__(self,other):
        other=P(other); out=self.d.copy()
        for k,v in other.d.items():out[k]=out.get(k,F(0))+v
        return P(out)
    __radd__=__add__
    def __neg__(self):return P({k:-v for k,v in self.d.items()})
    def __sub__(self,other):return self+-P(other)
    def __rsub__(self,other):return P(other)-self
    def __mul__(self,other):
        other=P(other); out=defaultdict(F)
        for (r,m),v in self.d.items():
            for (s,n),w in other.d.items():out[(r+s,m+n)]+=v*w
        return P(out)
    __rmul__=__mul__
    def __truediv__(self,other):return self*P(F(1,1)/F(other))
    def __repr__(self):return repr(self.d)

R=P({(1,0):1});M=P({(0,1):1})
roots=[]
for i,j in combinations(range(5),2):
    z=[0]*4
    if i<4:z[i]+=1
    if j<4:z[j]-=1
    if next(t for t in z if t):z=[-t for t in z]
    roots.append(z)
G=[[int(i==j)+1 for j in range(4)] for i in range(4)]
H=[[sum(roots[a][i]*G[i][j]*roots[b][j] for i in range(4)
        for j in range(4)) for b in range(10)] for a in range(10)]
eps=[z[0] for z in roots]
k=[z[1]-z[2] for z in roots]
ctable=[2,1,-1,-2,-1,1]
stable=[0,1,1,0,-1,-1]

def dot(x,y):
    return sum((x[i]*H[i][j]*y[j] for i in range(10)
                for j in range(10)),F(0))/2

sumF2=P()
for ks in product(range(6),repeat=4):
    phases=[sum(ks[d]*z[d] for d in range(4))%6 for z in roots]
    c=[F(ctable[p],2) for p in phases]
    s=[F(stable[p],2) for p in phases] # sin(theta) = sqrt(3)*s_i
    L=sum((1-cc for cc in c),F(0))
    Sb=s
    tau=sum((eps[i]*s[i] for i in range(10)),F(0))
    S1=[eps[i]*c[i] for i in range(10)]
    u=sum((eps[i]**2*c[i] for i in range(10)),F(0))
    S2=[-eps[i]**2*s[i] for i in range(10)]
    ac=sum((k[i]*s[i] for i in range(10)),F(0))
    V0=[k[i]*c[i] for i in range(10)]
    bc=sum((k[i]*eps[i]*c[i]/2 for i in range(10)),F(0))
    V1=[-k[i]*eps[i]*s[i]/2 for i in range(10)]
    a2c=sum((-k[i]*eps[i]**2*s[i]/6 for i in range(10)),F(0))
    V2=[-k[i]*eps[i]**2*c[i]/6 for i in range(10)]
    wc=sum((-k[i]**2*eps[i]**2*c[i]/24 for i in range(10)),F(0))
    Vw=[k[i]**2*eps[i]**2*s[i]/24 for i in range(10)]
    # Projection onto the unit transverse coframe, with all root Gram
    # products computed exactly as rational numbers.
    B=-M+R*L;T=R*tau;U=R*u;A=R*ac;B1=R*bc;A2=R*a2c;W=R*wc
    S=B*B+3*dot(Sb,Sb)
    Dsmall=B*T+dot(Sb,S1)
    Energy=3*T*T+dot(S1,S1)+(B*U+3*dot(Sb,S2))/2
    U0sq=F(3,2)*A*A+F(1,2)*dot(V0,V0)
    U1sq=F(1,2)*B1*B1+F(3,2)*dot(V1,V1)
    U0U2=F(3,2)*A*A2+F(1,2)*dot(V0,V2)
    U0U1aux=A*B1+dot(V0,V1)
    BW=B*W+3*dot(Sb,Vw)
    X=A*B+dot(V0,Sb)
    X2=A2*B+dot(V2,Sb)
    X1=B1*B+3*dot(V1,Sb)
    C1=B1*T+dot(V1,S1)
    C2=A*U+dot(V0,S2)
    Y1=3*A*T+dot(V0,S1)
    # t^2 coefficient of the ORIGINAL full bubble + seagull formula.
    F2=S*BW+S*(2*U0U2+U1sq)+3*Dsmall*U0U1aux+Energy*U0sq \
       +6*X*X2+3*X*C1+F(3,2)*X*C2+X1*X1+X1*Y1
    sumF2=sumF2+F2
avg=sumF2/(6**4)
# C=208 electron-normalised wall charge trace => K4=sqrt(5)*13/3*avg.
coefficient=(P(F(13,3))*avg)
expected=P({(0,0):F(13,2),(2,0):F(299,6),(4,0):F(130,3),
            (1,1):-F(13,4),(3,1):-F(13,2)})
print('exact Fourier average polynomial in (r,M):',avg)
print('K4 / sqrt(5):',coefficient)
assert coefficient.d==expected.d,(coefficient.d,expected.d)
print('PASS: exact beta4 Ward-complete low-momentum polynomial (alpha not inferred)')
