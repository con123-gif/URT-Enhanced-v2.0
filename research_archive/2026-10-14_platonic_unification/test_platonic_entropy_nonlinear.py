"""Verified exact five-cube / dodecahedron entropy and nonlinear shell test.
Python 3; numpy and scipy. No observational or fitted input.
"""
import itertools
import numpy as np
from scipy.linalg import null_space
from scipy.spatial import ConvexHull

p=(1+np.sqrt(5))/2
s=list(itertools.product((-1,1),repeat=2))
v=np.array(list(itertools.product((-1,1),repeat=3))+
  [[0,a/p,b*p] for a,b in s]+[[a/p,b*p,0] for a,b in s]+
  [[a*p,0,b/p] for a,b in s],float)
v/=np.linalg.norm(v,axis=1,keepdims=True)
def incidence(x):
    faces=[]
    for plane in ConvexHull(x).equations:
        plane=plane/np.linalg.norm(plane[:3])
        f=tuple(np.where(abs(x@plane[:3]+plane[3])<1e-8)[0])
        if f not in faces:faces.append(f)
    c=np.zeros((len(x),len(faces)))
    for k,f in enumerate(faces):c[list(f),k]=1
    return c,faces
c,faces=incidence(v)
p8=null_space(c.T)
p8=p8@p8.T
axis=[]
for i in range(20):
    j=int(np.argmin(np.linalg.norm(v+v[i],axis=1)))
    if i<j:axis.append((i,j))
subsets=[z for z in itertools.combinations(range(10),4)
   if all(abs(abs(v[axis[i][0]]@v[axis[j][0]])-1/3)<1e-9
          for i,j in itertools.combinations(z,2))]
assert len(subsets)==5
P=[];t=[]
for subset in subsets:
    idx=sum(([axis[i][0],axis[i][1]] for i in subset),[])
    ci,_=incidence(v[idx]);ki=null_space(ci.T)
    assert ki.shape==(8,4)
    e=np.zeros((20,4));e[idx]=ki;P.append(e@e.T)
    x=v[idx];neighbors=[j for j in range(8) if abs(x[0]@x[j]-1/3)<1e-9]
    frame=np.stack([(x[0]-x[j])/np.linalg.norm(x[0]-x[j]) for j in neighbors],axis=1)
    tj=np.zeros(20);tj[idx]=np.prod(np.sign(x@frame),axis=1)/np.sqrt(8)
    t.append(tj)
t=np.column_stack(t)
for j in range(1,5):t[:,j]*=-np.sign(t[:,0]@t[:,j])
assert np.allclose(t.T@t,1.25*np.eye(5)-.25*np.ones((5,5)))
p3=.8*t@t.T;p5=p8-p3
mean=np.mean(P,axis=0)
spectrum=np.linalg.eigvalsh(mean)
assert np.allclose(spectrum,[0]*7+[.25]*8+[.4]*5,atol=1e-9)
q=np.linalg.eigh(mean)[1][:,np.linalg.eigh(mean)[0]>.39]
p_five=q@q.T
assert np.linalg.norm(mean-.25*p8-.4*p_five)<1e-10
dist=np.linalg.norm(v[:,None,:]-v[None,:,:],axis=2)
a=(abs(dist-min(dist[dist>1e-8]))<1e-8).astype(float)
ld=3*np.eye(20)-a
assert np.linalg.norm(p8@ld@p8-(3*p3+5*p5))<1e-10
gap=3/20-80*np.pi/(1053*p)
rho=(p3+gap**2*p5)/(4*(1+gap**2))
eta=-np.log(gap)
x8=np.linalg.eigh(p8)[1][:,np.linalg.eigh(p8)[0]>.5]
from scipy.linalg import expm
e=expm(-eta*(x8.T@ld@x8-3*np.eye(8)))
e/=np.trace(e)
assert np.linalg.norm(x8@e@x8.T-rho)<1e-10
adj=np.zeros((12,12))
for i in range(12):
    for j in range(i+1,12):
        if len(set(faces[i])&set(faces[j]))==2:
            adj[i,j]=adj[j,i]=1
assert np.allclose(c.T@c,5*np.eye(12)+2*adj)
w3=np.linalg.eigh(p3)[1][:,np.linalg.eigh(p3)[0]>.5]
w5=np.linalg.eigh(p5)[1][:,np.linalg.eigh(p5)[0]>.5]
even=c.T@np.column_stack([(np.sqrt(2) if i!=j else 1)*w3[:,i]*w3[:,j]
                          for i in range(4) for j in range(i,4)])
odd=c.T@np.column_stack([w3[:,i]*w5[:,j] for i in range(4) for j in range(4)])
assert np.linalg.norm(c.T@w3)+np.linalg.norm(c.T@w5)<1e-10
assert np.linalg.matrix_rank(even,tol=1e-9)==6
assert np.linalg.matrix_rank(odd,tol=1e-9)==6
assert np.linalg.matrix_rank(np.column_stack([even,odd]),tol=1e-9)==12
gram=even@even.T+odd@odd.T
l3=(5+2*np.sqrt(5))/15; l3p=(5-2*np.sqrt(5))/15
expected=sorted([3]+[3/25]*5+[l3]*3+[l3p]*3)
assert np.allclose(np.linalg.eigvalsh(gram),expected,atol=1e-12)
l13=np.zeros((13,13));l13[0,0]=12;l13[0,1:]=-1;l13[1:,0]=-1
l13[1:,1:]=6*np.eye(12)-adj
src=np.zeros((13,26));src[1:,:]=np.column_stack([even,odd])
assert np.linalg.norm((expm(-.1*l13)@src)[0])>0
print("PASS: 5 cubes; hidden 8+5, L_hidden=3+5, normalized Gibbs rho,")
print("      quadratic 6 + mixed 6 = full 12, positive strengths")
print("      {3, 3/25 (x5), (5 +/- 2 sqrt5)/15 (x3)}; ratio phi^6")
print("rho p5=",gap**2/(1+gap**2),"triplet ratio=",l3/l3p)
