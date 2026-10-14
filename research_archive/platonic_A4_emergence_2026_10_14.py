"""Verify nested Platonic A4 roots and hidden quartet. Requires numpy."""
import numpy as np, itertools, math
phi=(1+math.sqrt(5))/2
I=np.array([[0,a,b*phi] for a in [-1.,1.] for b in [-1.,1.]]+[[a,b*phi,0] for a in [-1.,1.] for b in [-1.,1.]]+[[a*phi,0,b] for a in [-1.,1.] for b in [-1.,1.]])
faces=set()
for i,j,k in itertools.combinations(range(12),3):
 n=np.cross(I[j]-I[i],I[k]-I[i]); nn=np.linalg.norm(n)
 if nn<1e-8: continue
 dd=(I-I[i])@n/nn
 if dd.min()<-1e-8 and dd.max()>1e-8: continue
 ff=tuple(np.flatnonzero(abs(dd)<1e-8))
 if len(ff)==3: faces.add(ff)
faces=sorted(faces)
assert len(faces)==20
D=np.array([I[list(f)].mean(0) for f in faces]); D=D*math.sqrt(3)/np.linalg.norm(D,axis=1)[:,None]
B=np.zeros((20,12))
for i,ids in enumerate(faces): B[i,list(ids)]=1
pair=[];seen=set()
for i in range(20):
 if i in seen: continue
 j=min((k for k in range(20) if k!=i),key=lambda k:np.linalg.norm(D[i]+D[k]))
 assert np.linalg.norm(D[i]+D[j])<1e-10
 seen.update((i,j)); pair.append((i,j))
cubes=[]
for combo in itertools.combinations(range(10),4):
 ids=tuple(sorted(j for i in combo for j in pair[i]))
 U=D[list(ids)]/math.sqrt(3)
 dots=sorted(round(float(x@y),8) for x,y in itertools.combinations(U,2))
 ref=sorted([round(1/3,8)]*12+[round(-1/3,8)]*12+[-1.]*4)
 if dots==ref: cubes.append(ids)
assert len(cubes)==5
Z=[]
for ids in cubes:
 C=D[list(ids)]
 ds=np.array([[np.linalg.norm(C[i]-C[j]) for j in range(8)] for i in range(8)])
 edge=min(round(float(x),8) for x in ds.flat if x>1e-6)
 adj=abs(ds-edge)<1e-8
 signs={0:1};queue=[0]
 while queue:
  i=queue.pop(0)
  for j in np.flatnonzero(adj[i]):
   j=int(j)
   if j not in signs: signs[j]=-signs[i];queue.append(j)
   else: assert signs[j]==-signs[i]
 assert len(signs)==8
 z=np.zeros(20);z[list(ids)]=[signs[i]/math.sqrt(8) for i in range(8)]
 Z.append(z)
Z=np.array(Z).T
goal=1.25*np.eye(5)-.25*np.ones((5,5))
options=[s for s in itertools.product((-1,1),repeat=5) if s[0]==1]
sgn=min(options,key=lambda s:np.linalg.norm((Z*s).T@(Z*s)-goal))
Z=Z*np.array(sgn)
err=np.linalg.norm(Z.T@Z-goal)
assert err<1e-10 and np.linalg.norm(Z@np.ones(5))<1e-10
roots=np.stack([math.sqrt(4/5)*(Z[:,i]-Z[:,j]) for i in range(5) for j in range(5) if i!=j],axis=1)
P=Z@np.linalg.pinv(Z)
assert np.linalg.matrix_rank(Z)==4
assert np.linalg.norm(roots@roots.T-10*P)<1e-10
assert max(abs(np.sum(roots**2,axis=0)-2))<1e-10
assert np.linalg.norm(B.T@roots)<1e-10
Ad=np.zeros((20,20))
for i,j in itertools.combinations(range(20),2):
 if len(set(faces[i])&set(faces[j]))==2:Ad[i,j]=Ad[j,i]=1
assert np.linalg.norm(Ad@roots)<1e-10
evals,U=np.linalg.eigh(Ad)
P3=U[:,abs(evals)<1e-8]@U[:,abs(evals)<1e-8].T
P5=U[:,abs(evals+2)<1e-8]@U[:,abs(evals+2)<1e-8].T
assert np.linalg.norm(P-P3)<1e-10
Q=np.einsum('fi,fj->fij',B,B).reshape(20,-1)
assert np.linalg.matrix_rank((P3+P5)@Q,tol=1e-10)==8
print('PASS: five cubes -> cubic tetrahedral modes -> regular 4-simplex -> 20 A4 roots')
print('PASS: root isotropy 10 I4, dodecahedral Laplacian-3 band, quadratic hidden rank 8')
