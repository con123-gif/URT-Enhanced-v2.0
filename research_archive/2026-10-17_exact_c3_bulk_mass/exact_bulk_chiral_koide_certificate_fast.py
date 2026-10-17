import itertools, json
from pathlib import Path
import numpy as np
import sympy as s
import cathedral_strict_64_closure as c
v,vc,edges,faces,ds,inc=c.icosahedron(); L=s.Matrix(np.rint(ds[2].T@ds[2]).astype(int).tolist());I=s.eye(20);Z=L-3*I
P3=L*(L-2*I)*(L-5*I)*(Z*Z-5*I)/30
P5=-L*(L-2*I)*(L-3*I)*(Z*Z-5*I)/30
C=np.array([v[list(f)].sum(axis=0) for f in faces]); W=s.zeros(20)
for i in range(20):
 for j in range(20):
  theta=sum(v[k]@np.cross(C[i],C[j]) for k in set(faces[i])&set(faces[j]))
  if abs(theta)>1e-8:W[i,j]=int(np.sign(theta))
assert W*W==-15*(P3+P5)
rots=[];r=np.roll(np.eye(3),1,axis=0)
for signs in itertools.product((-1,1),repeat=3):
 if np.prod(signs)<0:continue
 for j in range(3):rots.append(np.diag(signs)@np.linalg.matrix_power(r,j))
fsets=[frozenset(f) for f in faces];mats=[]
for rot in rots:
 pi=[]
 for v0 in v:
  inds=np.flatnonzero(np.linalg.norm(v-(rot@v0),axis=1)<1e-8)
  assert len(inds)==1
  pi.append(int(inds[0]))
 M=s.zeros(20)
 for i,f in enumerate(faces): M[fsets.index(frozenset(pi[q] for q in f)),i]=1
 mats.append(M)
A4=sum(mats,s.zeros(20))/12
# rational real / imaginary representation of rank-3 selected projector
X=((5*P3+3*P5)/8)*(I-A4)
Y=(-W/8)*(I-A4)
assert X*X-Y*Y==X and X*Y+Y*X==Y
Ef=s.diag(*[s.Rational(sum(int(i in faces[j]) for i in (0,2,1)),9) for j in range(20)])
G=L*(I+L).inv()
T=Ef*G*Ef
tr1=s.trace(X*T)
tr2=s.trace(X*T*X*T-Y*T*Y*T)
idx=next(i for i,R in enumerate(rots) if np.linalg.norm(R-r)<1e-10)
Rface=mats[idx]
C3proj=(I+Rface+Rface*Rface)/3
m0=s.trace(X*C3proj*T)
a=s.factor(tr1/3)
b=s.factor((m0-a)/2)
c2=s.factor((tr2-3*a*a)/6-b*b)
q=s.factor(tr2/tr1**2)
print('exact Tr M',tr1,'Tr M²',tr2)
print('a',a,'b',b,'c²',c2)
print('b/a',s.factor(b/a),'c²/a²',s.factor(c2/a**2))
print('Q',q,'decimal',float(q))
print('m=0',m0,'3 eigenvalues',float(m0),float(a-b-s.sqrt(3*c2)),float(a-b+s.sqrt(3*c2)))
print('angle(abs)',float(s.atan(s.sqrt(c2)/abs(b))))
assert abs(float(q)-0.43587691973641357)<1e-12
Path(__file__).with_suffix('.json').write_text(json.dumps({'a':str(a),'b':str(b),'c_squared':str(c2),'Q_exact':str(q),'Q_numeric':float(q),'phase_abs':float(s.atan(s.sqrt(c2)/abs(b)))},indent=2))
