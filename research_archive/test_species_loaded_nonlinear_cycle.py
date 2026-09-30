import numpy as np, math, sys, itertools, json
from scipy.linalg import null_space
sys.path.insert(0,'/mnt/data');import active_core as ac
G=60
# intertwiners via group averaging, canonical row isometry
rng=np.random.default_rng(20260804)
def equiv_map(src_reps,target_reps,sd,td):
 seed=rng.normal(size=(td,sd));A=sum(t@seed@s.T for t,s in zip(target_reps,src_reps))/G
 w,v=np.linalg.eigh(A@A.T);C=(v@np.diag(1/np.sqrt(w))@v.T)@A
 err=max(np.linalg.norm(t@C-C@s) for t,s in zip(target_reps,src_reps));return C,err
# mixed hidden portal
mix=[np.kron(a,b) for a,b in zip(ac.rhoH3,ac.rhoH5)]
Q3,Q3p,Q5=equiv_map(mix,ac.rho3,16,3)[0],equiv_map(mix,ac.rho3p,16,3)[0],equiv_map(mix,ac.rho5,16,5)[0]
# species feedback 3 x 3' -> hidden4 and 3 x 5 -> hidden4
r33p=[np.kron(a,b) for a,b in zip(ac.rho3,ac.rho3p)]
r35=[np.kron(a,b) for a,b in zip(ac.rho3,ac.rho5)]
F33_H3,e1=equiv_map(r33p,ac.rhoH3,9,4);F33_H5,e2=equiv_map(r33p,ac.rhoH5,9,4)
F35_H3,e3=equiv_map(r35,ac.rhoH3,15,4);F35_H5,e4=equiv_map(r35,ac.rhoH5,15,4)
print('feedback errors',e1,e2,e3,e4)
# charge embeddings (same exact S3 normalizer construction)
def gi(R):return int(np.argmin([np.linalg.norm(R-S) for S in ac.rotations]))
I=gi(np.eye(3));mult=np.array([[gi(ac.rotations[i]@ac.rotations[j]) for j in range(G)] for i in range(G)])
inv=np.array([next(j for j in range(G) if mult[i,j]==I and mult[j,i]==I) for i in range(G)])
orders=[]
for g in range(G):
 p=I
 for n in range(1,61):
  p=mult[p,g]
  if p==I:orders.append(n);break
r=next(i for i,o in enumerate(orders) if o==3);r2=mult[r,r];C3set={I,r,r2};norm=[]
for p in range(G):
 if {mult[mult[p,h],inv[p]] for h in C3set}==C3set:norm.append(p)
s=next(p for p in norm if orders[p]==2 and mult[mult[p,r],p]==inv[r])
b2=np.array([[1.,-1.,0.],[1.,1.,-2.]]).T;b2,_=np.linalg.qr(b2)
def pm(p):M=np.zeros((3,3));M[list(p),np.arange(3)]=1;return M
r2r=b2.T@pm((1,2,0))@b2;r2s=b2.T@pm((1,0,2))@b2
def emb(reps):
 C=np.vstack([np.kron(np.eye(2),reps[r])-np.kron(r2r.T,np.eye(4)),np.kron(np.eye(2),reps[s])-np.kron(r2s.T,np.eye(4))]);z=null_space(C);J=z[:,0].reshape(4,2,order='F');J/=math.sqrt(np.trace(J.T@J)/2);return J
E3,E5=emb(ac.rhoH3),emb(ac.rhoH5)
words={'u':np.array([1.,3.,-4.]),'d':np.array([1.,-3.,2.]),'e':np.array([-3.,-3.,6.]),'nu':np.array([-3.,3.,0.])}
def quad(q):a,b,c=q;z=np.array([b*c,c*a,a*b]);return z-z.mean()
def mat(C,x):return (C@x).reshape(3,3,order='F').T
# active_core convention vecmat transposes; use same

def solve(name,mode='cross',signs=(1,1,1),relax=1.0,maxit=10000):
 q=words[name]; qload=q/3
 d3=E3@(b2.T@qload);d5=E5@(b2.T@(ac.delta*quad(q)/5))
 h3=d3.copy();h5=d5.copy();H=np.zeros(5)
 for it in range(maxit):
  z=np.kron(h3,h5);p3p=Q3p@z;p5=Q5@z
  if mode=='cross':
   nh3=d3+signs[0]*(F33_H3@np.kron(qload,p3p))/3
   nh5=d5+signs[1]*(F35_H5@np.kron(qload,p5))/5
  elif mode=='swap':
   nh3=d3+signs[0]*(F35_H3@np.kron(qload,p5))/3
   nh5=d5+signs[1]*(F33_H5@np.kron(qload,p3p))/5
  elif mode=='both':
   nh3=d3+signs[0]*((F33_H3@np.kron(qload,p3p))+(F35_H3@np.kron(qload,p5)))/3
   nh5=d5+signs[1]*((F33_H5@np.kron(qload,p3p))+(F35_H5@np.kron(qload,p5)))/5
  nH=signs[2]*p5/7
  nh3=(1-relax)*h3+relax*nh3;nh5=(1-relax)*h5+relax*nh5;nH=(1-relax)*H+relax*nH
  err=np.linalg.norm(nh3-h3)+np.linalg.norm(nh5-h5)+np.linalg.norm(nH-H)
  h3,h5,H=nh3,nh5,nH
  if err<1e-13:break
 T=mat(ac.J5,H)+mat(ac.J43,h3)+1j*mat(ac.J45,h5)
 return T,{'iterations':it+1,'residual':err,'norms':[np.linalg.norm(H),np.linalg.norm(h3),np.linalg.norm(h5)]}
def frame(T):w,v=np.linalg.eigh(T.conj().T@T);return v[:,np.argsort(w)]
def J(U):return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
def angles(U):b=np.abs(U);x=b[0,2]**2;return [b[0,1]**2/(1-x),b[1,2]**2/(1-x),x]
tar=np.array([.224308861637,.042177509492,.003733784761,3.141364407664e-5,.303463055248,.562129475821,.022689900267,-.032359467925]);scale=np.array([.224,.042,.0037,3.14e-5,.303,.562,.0227,.03236])
records=[]
for mode in ['cross','swap','both']:
 for signs in itertools.product([-1,1],repeat=3):
  Ts={};info={}
  for n in words:Ts[n],info[n]=solve(n,mode,signs)
  F={n:frame(T) for n,T in Ts.items()};V=F['u'].conj().T@F['d'];U=F['e'].conj().T@F['nu'];obs=np.r_[abs(V[0,1]),abs(V[1,2]),abs(V[0,2]),J(V),angles(U),J(U)];score=float(np.sum(((obs-tar)/scale)**2));records.append((score,mode,signs,obs,V,U,info))
records.sort(key=lambda x:x[0])
for r in records[:12]:
 sc,mode,sg,obs,V,U,info=r;print('\nscore',sc,mode,sg,'obs',obs,'info',info);print('Q',np.abs(V));print('L',np.abs(U))
out=[]
for r in records:
 sc,mode,sg,obs,V,U,info=r;out.append({'score':sc,'mode':mode,'signs':sg,'obs':obs.tolist(),'Q':np.abs(V).tolist(),'L':np.abs(U).tolist(),'info':info})
with open('/mnt/data/species_loaded_nonlinear_cycle_results.json','w') as f:json.dump(out,f,indent=2)