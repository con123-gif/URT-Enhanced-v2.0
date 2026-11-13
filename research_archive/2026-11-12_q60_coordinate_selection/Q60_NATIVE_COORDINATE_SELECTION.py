#!/usr/bin/env python3
"""Q60 bounded native 2I face-frame incidence audit, no fitted inputs."""
import itertools
import sympy as S
r=S.sqrt(5); phi=(1+r)/2
G=[]
for i in range(4):
 for sg in (1,-1):
  v=[S.Integer(0)]*4;v[i]=S.Integer(sg);G.append(tuple(v))
for signs in itertools.product((1,-1),repeat=4):G.append(tuple(S.Rational(s,2) for s in signs))
base=(S.Integer(0),S.Integer(1),phi,1/phi)
for p in itertools.permutations(range(4)):
 if sum(p[i]>p[j] for i in range(4) for j in range(i+1,4))%2:continue
 for signs in itertools.product((1,-1),repeat=3):
  it=iter(signs);G.append(tuple(S.Integer(0) if base[k]==0 else S.expand(base[k]*next(it)/2) for k in p))
def mul(a,b):
 x,y,z,w=a;u,v,t,h=b
 return (x*u-y*v-z*t-w*h,x*v+y*u+z*h-w*t,x*t-y*h+z*u+w*v,x*h+y*t-z*v+w*u)
def conj(a):return (a[0],-a[1],-a[2],-a[3])
def key(a):return tuple(S.simplify(x) for x in a)
assert len(G)==120 and len(set(G))==120
def power(a,n):
 b=(S.Integer(1),S.Integer(0),S.Integer(0),S.Integer(0))
 for _ in range(n):b=key(mul(b,a))
 return b
one=(S.Integer(1),S.Integer(0),S.Integer(0),S.Integer(0))
w=next(a for a in G if power(a,6)==one and power(a,3)!=one and power(a,2)!=one)
axis=(S.Integer(0),)+w[1:]
faces={key(mul(mul(g,axis),conj(g)))[1:] for g in G}
assert len(faces)==20
faces=sorted(faces,key=str)
norm2=S.simplify(sum(x*x for x in faces[0]));assert norm2!=0
products=sorted({S.simplify(sum(a*b for a,b in zip(faces[0],f))) for f in faces},key=lambda x:float(x))
assert len(products)==6,products
adjval=products[-2]
A=S.zeros(20)
for i,f in enumerate(faces):
 for j,g in enumerate(faces):
  if i!=j and S.simplify(sum(a*b for a,b in zip(f,g))-adjval)==0:A[i,j]=1
assert A==A.T and all(sum(A[i,j] for j in range(20))==3 for i in range(20))
L=3*S.eye(20)-A
assert L*L.T==L.T*L
assert (L-3*S.eye(20)).nullspace().__len__()==4
assert (L-5*S.eye(20)).nullspace().__len__()==4
neg={i:faces.index(tuple(-x for x in f)) for i,f in enumerate(faces)}
assert all(neg[neg[i]]==i and neg[i]!=i for i in range(20))
J=S.zeros(20)
for i,j in neg.items():J[i,j]=1
assert J*J==S.eye(20) and J*L==L*J
print('Q60_NATIVE_FACE_FRAME_CERTIFICATE_OK: 120 icosians; 20 face axes; degree 3; hidden 3/5 multiplicity 4 each; antipodal involution commutes with L')
for eigen in (3,5):
 B=S.Matrix.hstack(*(L-eigen*S.eye(20)).nullspace())
 assert B.shape==(20,4)
 Gram=B.T*B
 C=Gram.inv()*B.T*J*B
 assert J*B==B*C
 assert C*C==S.eye(4)
 print('HIDDEN',eigen,'ANTIPODAL_TRACE',S.trace(C),'CHARPOLY',S.factor(C.charpoly().as_expr()))
P={}
for eig in (3,5):
 B=S.Matrix.hstack(*(L-eig*S.eye(20)).nullspace())
 P[eig]=S.simplify(B*(B.T*B).inv()*B.T)
 assert P[eig]*P[eig]==P[eig]
for axis_index in range(3):
 X=S.diag(*[f[axis_index] for f in faces])
 assert J*X*J==-X
 for eig in (3,5):assert P[eig]*X*P[eig]==S.zeros(20)
 C=P[3]*X*P[5]
 print('COORD',axis_index,'CROSS_RANK',C.rank(),'CROSS_NORM_SQUARED',S.simplify(S.trace(C.T*C)))
 assert C.rank()>0
print('Q60_NATIVE_COORDINATE_SELECTION_OK')
