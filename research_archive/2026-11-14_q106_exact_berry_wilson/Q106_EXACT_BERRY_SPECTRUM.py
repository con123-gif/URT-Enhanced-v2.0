#!/usr/bin/env python3
"""Q106 exact quaternionic spectral theorem for native 30 broken configurations.

The F=Q(sqrt5) quaternion representation is exact rational arithmetic.
No numerical fits, old ARFs, empirical parameters, or synthetic graphs.
"""
from fractions import Fraction as Fr
from itertools import product,combinations
import sympy as sp
Z=(Fr(0),Fr(0));ONE=(Fr(1),Fr(0));ROOT=(Fr(0),Fr(1))
def F(x):return (Fr(x),Fr(0))
def plus(a,b):return (a[0]+b[0],a[1]+b[1])
def minus(a):return (-a[0],-a[1])
def sub(a,b):return plus(a,minus(b))
def times(a,b):return (a[0]*b[0]+5*a[1]*b[1],a[0]*b[1]+a[1]*b[0])
def over(a,n):return (a[0]/n,a[1]/n)
phi=over(plus(ONE,ROOT),2)
verts=([(Z,F(a),times(F(b),phi)) for a,b in product((-1,1),repeat=2)]+
       [(F(a),times(F(b),phi),Z) for a,b in product((-1,1),repeat=2)]+
       [(times(F(a),phi),Z,F(b)) for a,b in product((-1,1),repeat=2)])
def dot(u,v):
    w=Z
    for a,b in zip(u,v):w=plus(w,times(a,b))
    return w
def cross(u,v):
    return (sub(times(u[1],v[2]),times(u[2],v[1])),
            sub(times(u[2],v[0]),times(u[0],v[2])),
            sub(times(u[0],v[1]),times(u[1],v[0])))
edges=[(i,j) for i,j in combinations(range(12),2)
       if dot([sub(verts[i][k],verts[j][k]) for k in range(3)],
              [sub(verts[i][k],verts[j][k]) for k in range(3)])==F(4)]
assert len(edges)==30
def word(mask):return [1-2*((mask>>i)&1) for i in range(12)]
masks=[]
for mask in range(1<<12):
    t=word(mask)
    if sum(t)==4 and sum(t[i]*t[j] for i,j in edges)==-6:masks.append(mask)
assert len(masks)==30
ns=[]
for mask in masks:
    t=word(mask);v=[]
    for k in range(3):
        a=Z
        for i in range(12):a=plus(a,times(F(t[i]),verts[i][k]))
        v.append(times(over(phi,4),a))
    assert dot(v,v)==ONE
    ns.append(v)
d=over(sub(ONE,ROOT),4)
links={}
for i,j in combinations(range(30),2):
    if (masks[i]^masks[j]).bit_count()==2:
        assert dot(ns[i],ns[j])==d
        links[i,j]=1
assert len(links)==60
# Quaternions represent aI+i(bx*sigma_x+by*sigma_y+bz*sigma_z).
QZERO=(Z,Z,Z,Z);QI=(ONE,Z,Z,Z)
def qadd(a,b):return tuple(plus(x,y) for x,y in zip(a,b))
def qmul(a,b):
    x,u,v,w=a;y,p,q,r=b
    t=sub(sub(sub(times(x,y),times(u,p)),times(v,q)),times(w,r))
    return (t,
      sub(plus(times(x,p),times(y,u)),sub(times(v,r),times(w,q))),
      sub(plus(times(x,q),times(y,v)),sub(times(w,p),times(u,r))),
      sub(plus(times(x,r),times(y,w)),sub(times(u,q),times(v,p))))
def qscalar(a,q):return tuple(times(a,t) for t in q)
nbr=[[] for _ in range(30)]
for a,b in links:
    w=[times(over(phi,2),x) for x in cross(ns[a],ns[b])]
    qab=(over(ROOT,4),*w);qba=(over(ROOT,4),*(minus(x) for x in w))
    nbr[a].append((b,qab));nbr[b].append((a,qba))
assert all(len(x)==4 for x in nbr)
def polymul(a,b):
    ans=[Z for _ in range(len(a)+len(b)-1)]
    for i,x in enumerate(a):
        for j,y in enumerate(b):ans[i+j]=plus(ans[i+j],times(x,y))
    return ans
p2=[Z,minus(ROOT),ONE]
p4=[over(times(F(3),sub(ROOT,F(3))),8),times(phi,phi),ONE]
p6=[over(plus(F(5),ROOT),4),minus(plus(F(3),ROOT)),minus(ONE),ONE]
coeff=polymul(polymul(p2,p4),p6)
assert len(coeff)==8 and coeff[-1]==ONE
def identity(a=ONE):
    return [[(qscalar(a,QI) if i==j else QZERO) for j in range(30)]
            for i in range(30)]
def multiplyX(M):
    out=[[QZERO for _ in range(30)] for __ in range(30)]
    for i in range(30):
        for k,q in nbr[i]:
            for j in range(30):
                if M[k][j]!=QZERO:out[i][j]=qadd(out[i][j],qmul(q,M[k][j]))
    return out
M=identity()
for k in range(6,-1,-1):
    M=multiplyX(M)
    for i in range(30):M[i][i]=qadd(M[i][i],qscalar(coeff[k],QI))
assert all(q==QZERO for row in M for q in row)
print('degree-seven native quaternionic polynomial annihilator: EXACT PASS')
# Get exact reduced traces and solve for each irreducible factor's multiplicity.
M=identity();tr=[]
for k in range(4):
    a=Z
    for i in range(30):a=plus(a,times(F(2),M[i][i][0]))
    tr.append(a);M=multiplyX(M)
rt=sp.sqrt(5);x=sp.Symbol('x');gold=(1+rt)/2
factors=[x,x-rt,x*x+gold**2*x+sp.Rational(3,8)*(rt-3),
         x**3-x*x-(3+rt)*x+(5+rt)/4]
powers=[]
for fct in factors:
    q=sp.Poly(fct,x);a=q.all_coeffs();degree=q.degree();s=[sp.Integer(degree)]
    for k in range(1,4):
        if k<=degree:val=sum(a[j]*s[k-j] for j in range(1,k) if j<=degree)+k*a[k]
        else:val=sum(a[j]*s[k-j] for j in range(1,degree+1))
        s.append(sp.simplify(-val))
    powers.append(s)
L=sp.Matrix([[powers[j][k] for j in range(4)] for k in range(4)])
rhs=sp.Matrix([sp.Rational(t[0].numerator,t[0].denominator)+
    sp.Rational(t[1].numerator,t[1].denominator)*rt for t in tr])
multiplicity=sp.simplify(L.inv()*rhs)
assert multiplicity==sp.Matrix([4,4,8,12]),multiplicity
print('exact 60-complex-dim spinor traces and factor multiplicities:',multiplicity.T)
print('Charge bands coincide by quaternionic time reversal (Kramers).')
print('For s=sqrt(2-2sqrt5/5), Hweak=s*X and')
print('det(xI-Xweak)= [x(x-sqrt5)]^2')
print('  *[x^2+phi^2*x+3(sqrt5-3)/8]^4')
print('  *[x^3-x^2-(3+sqrt5)x+(5+sqrt5)/4]^6')
print('Q106 EXACT CHARGED BERRY BAND CERTIFICATE: PASS')
