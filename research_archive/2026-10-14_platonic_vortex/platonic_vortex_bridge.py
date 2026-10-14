"""14 Oct 2026: exact Platonic A4 simplex / vortex-doubling checks.
No observational inputs or physical T_star identification.
Requires numpy.
"""
from math import pi, sqrt
import numpy as np
I=np.eye(5); P=I-np.ones((5,5))/5
V=sqrt(5/4)*P
assert np.allclose(V.T@V,1.25*I-.25*np.ones((5,5)))
roots=np.stack([I[:,i]-I[:,j] for i in range(5) for j in range(5) if i!=j],axis=1)
assert roots.shape==(5,20) and np.allclose(roots@roots.T,10*P)
R=np.zeros((5,5));D=np.zeros((5,5))
for j in range(5):
    R[(j+1)%5,j]=1
    D[(2*j)%5,j]=1
assert np.allclose(D@R@D.T,R@R)
assert np.allclose(np.linalg.matrix_power(R,5),I)
assert np.allclose(np.linalg.matrix_power(D,4),I)
assert np.linalg.det(D)<0
j=np.arange(5)
F=np.stack([sqrt(2/5)*np.cos(2*pi*k*j/5) for k in (1,2)]+
           [sqrt(2/5)*np.sin(2*pi*k*j/5) for k in (1,2)],axis=1)[:,[0,2,1,3]]
assert np.allclose(F.T@F,np.eye(4))
R4=F.T@R@F;D4=F.T@D@F
phi=(1+sqrt(5))/2
assert np.isclose(np.trace(R4[:2,:2]),1/phi)
assert np.isclose(np.trace(R4[2:,2:]),-phi)
assert np.allclose(D4@R4@D4.T,R4@R4)
# A5 conjugacy classes: 1, 2A, 3A, 5A, 5B
sizes=np.array([1,15,20,12,12])
irrep={'1':[1,1,1,1,1], '3':[3,-1,0,phi,1-phi],
       '3p':[3,-1,0,1-phi,phi], '4':[4,0,1,-1,-1],
       '5':[5,1,-1,0,0]}
for character,want in [([10,2,1,0,0],{'1':1,'4':1,'5':1}),
                        ([6,-2,0,1,1],{'3':1,'3p':1})]:
    result={name:round(np.dot(sizes*np.array(character),chi)/60)
            for name,chi in irrep.items()}
    assert {k:v for k,v in result.items() if v}==want
# Complete bracket-closure tests of so(4) (6) and Sym0(4) (9)
A=[];S=[]
for i in range(4):
    for k in range(i+1,4):
        a=np.zeros((4,4)); a[i,k]=1; a[k,i]=-1;A.append(a)
        s=np.zeros((4,4)); s[i,k]=s[k,i]=1;S.append(s)
for i in range(3):
    s=np.zeros((4,4));s[i,i]=1;s[3,3]=-1;S.append(s)
assert len(A)==6 and len(S)==9
comm=lambda x,y:x@y-y@x
for a in A:
    for b in A:assert np.allclose(comm(a,b)+comm(a,b).T,0)
    for s in S:
        c=comm(a,s)
        assert np.allclose(c-c.T,0) and np.isclose(np.trace(c),0)
for s in S:
    for t in S:assert np.allclose(comm(s,t)+comm(s,t).T,0)
s1=np.diag([1,-1,0,0]);s2=np.zeros((4,4));s2[0,1]=s2[1,0]=1
assert np.allclose(comm(s1,s2),2*A[0])
def orbit(mod,start):
    seen=[];u=start
    while u not in seen:
        seen.append(u);u=2*u%mod
    assert u==start
    return seen
assert orbit(9,1)==[1,2,4,8,7,5] and orbit(9,3)==[3,6] and orbit(9,0)==[0]
assert orbit(5,1)==[1,2,4,3] and len(orbit(45,1))==12
# The entropy state is invariant under an orthogonal root-label operator.
Delta=.002489189840420375
rho=np.diag([1]*4+[Delta*Delta]*4)/(4*(1+Delta*Delta))
Q=np.eye(8);Q[:4,:4]=D4
assert np.allclose(Q@rho@Q.T,rho)
q=(pi/np.e)*np.exp(2j*pi/phi**2)
print('PASS: A4 roots, golden two-plane exchange, 1+6+9, bracket closure,')
print('mod-9 and mod-5 doubling, conditional mod-45 period and rho invariance')
print('D determinant:',np.linalg.det(D4),'q^12=',q**12)
