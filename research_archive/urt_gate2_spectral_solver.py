import os, math, itertools, json, time
os.environ['JAX_ENABLE_X64']='True'
import numpy as np
from scipy.optimize import minimize
from scipy.special import logsumexp
from scipy import linalg as la
import jax
jax.config.update('jax_enable_x64', True)
import jax.numpy as jnp
from jax.scipy.special import logsumexp as jlogsumexp

# ---------- construct numpy model ----------
z=np.load('/mnt/data/urt_seed_geometry_matrices.npz')
phi=float(z['phi']); vertices=z['vertices']; faces=z['faces']; shell_edges=[tuple(map(int,x)) for x in z['edges'][:30]]
H3=z['H3'];H5=z['H5'];U3=z['U3'];U3p=z['U3p'];J43_base=z['J43'];J45_base=z['J45'];rotations=z['rotations']
Delta=3/20-80*math.pi/(1053*phi); eta_delta=-math.log(Delta); eta_conf=9.8601129428
unitv=vertices/np.linalg.norm(vertices[0])
fl={tuple(sorted(map(int,f))):i for i,f in enumerate(faces)}
perms=[];Pv=[];Pf=[]
for R in rotations:
 p=[]
 for v in vertices: p.append(int(np.argmin(np.linalg.norm(vertices-R@v,axis=1))))
 perms.append(tuple(p));P=np.zeros((12,12));
 for s,t in enumerate(p):P[t,s]=1
 Pv.append(P);F=np.zeros((20,20))
 for s,f in enumerate(faces):F[fl[tuple(sorted(p[int(x)] for x in f))],s]=1
 Pf.append(F)
rho3=[U3.T@P@U3 for P in Pv];rho3p=[U3p.T@P@U3p for P in Pv]
rhoH3=[H3.T@P@H3 for P in Pf];rhoH5=[H5.T@P@H5 for P in Pf]
rhohom=[np.kron(a,b) for a,b in zip(rho3,rho3p)]
Sbasis=[]
Sbasis.append(np.diag([1,-1,0])/math.sqrt(2));Sbasis.append(np.diag([1,1,-2])/math.sqrt(6))
for a,b in [(0,1),(0,2),(1,2)]:
 M=np.zeros((3,3));M[a,b]=M[b,a]=1/math.sqrt(2);Sbasis.append(M)
Sbasis=np.array(Sbasis)
rhoS=[]
for R in rotations:
 A=np.empty((5,5))
 for jj,Bj in enumerate(Sbasis):
  T=R@Bj@R.T; A[:,jj]=[np.sum(Bi*T) for Bi in Sbasis]
 rhoS.append(A)
seed=np.zeros((9,5));seed[:5,:]=np.eye(5)
AA=sum(t@seed@s.T for t,s in zip(rhohom,rhoS))/60
w,V=np.linalg.eigh(AA.T@AA);C5=AA@(V@np.diag(1/np.sqrt(w))@V.T)
Q=lambda u:np.outer(u,u)-np.eye(3)/3
Hedge=[];X3edge=[];X5edge=[]
for i,j in shell_edges:
 X=math.sqrt(15)/4*(Q(unitv[i])+Q(unitv[j]));Hedge.append([np.sum(Bi*X) for Bi in Sbasis])
 c=np.array([1.0 if i in f and j in f else 0.0 for f in faces]);X3edge.append(H3.T@c);X5edge.append(H5.T@c)
Hedge=np.array(Hedge);X3edge=np.array(X3edge);X5edge=np.array(X5edge);alphabet=np.column_stack([Hedge,X3edge,X5edge])
eref=shell_edges.index((0,2));i0,j0=shell_edges[eref]
m=vertices[i0]+vertices[j0];m/=np.linalg.norm(m);d=vertices[i0]-vertices[j0];d/=np.linalg.norm(d);n=np.cross(m,d);n/=np.linalg.norm(n);Fref=np.column_stack([m,d,n])
gcycle=next(gi for gi,R in enumerate(rotations) if np.linalg.norm(R@m-d)<1e-7 and np.linalg.norm(R@d-n)<1e-7 and np.linalg.norm(R@n-m)<1e-7)
Em=X3edge[eref]/np.linalg.norm(X3edge[eref]);Ed=rhoH3[gcycle]@Em;En=rhoH3[gcycle]@Ed;E3ref=np.column_stack([Em,Ed,En])
U35=J45_base.T@J43_base;E5ref=U35@E3ref
E3maps=[];E5maps=[];Rdepth=[];g_edges=[]
for ei,e in enumerate(shell_edges):
 cand=[gi for gi,p in enumerate(perms) if {p[i0],p[j0]}==set(e)]
 gi=cand[0]
 if np.linalg.norm(rhoH3[gi]@X3edge[eref]-X3edge[ei])>1e-7:gi=cand[1]
 g_edges.append(gi);E3maps.append(rhoH3[gi]@E3ref);E5maps.append(rhoH5[gi]@E5ref)
 Fe=rotations[gi]@Fref;Q1=np.outer(Fe[:,0],Fe[:,0]);Q2=np.outer(Fe[:,1],Fe[:,1]);Q3=np.outer(Fe[:,2],Fe[:,2]);Rdepth.append(Q1+Delta*Q2+Delta**2*Q3)
E3maps=np.array(E3maps);E5maps=np.array(E5maps);Rdepth=np.array(Rdepth)
charges=np.array([[1,3,-4],[1,-3,2],[-3,-3,6],[-3,3,0]],float)
def gcov(q):
 a,b,c=q;v=np.array([b*c,c*a,a*b]);return v-v.mean()
gcharges=np.array([gcov(q) for q in charges])
Aprec=np.r_[np.ones(5),3*np.ones(4),5*np.ones(4)]

# build constants per sign branch

def build(sign5=1,sign45=1,color=3):
 Cglobal=np.column_stack([sign5*C5,J43_base,1j*sign45*J45_base]) # 9x13
 src=np.empty((30,4,9),complex)
 for e in range(30):
  for f in range(4):
   src[e,f]=J43_base@(E3maps[e]@(charges[f]/3))+1j*sign45*J45_base@(E5maps[e]@(Delta*gcharges[f]/5))
 return Cglobal,src,color

# jax functions
A_j=jnp.asarray(Aprec); alph_j=jnp.asarray(alphabet); R_j=jnp.asarray(Rdepth)

def make_obj(sign5=1,sign45=1,color=3,eta=eta_delta,include_car=True):
 Cg,src,col=build(sign5,sign45,color);Cg=jnp.asarray(Cg);src=jnp.asarray(src);eta=float(eta)
 def fcar(x): return 0.5*x*jnp.tanh(0.5*x) - jnp.logaddexp(0.5*x,-0.5*x)+math.log(2.0)
 def costs(x):
  vv=jnp.einsum('ac,c->a',Cg,x)
  vec=src+vv[None,None,:]
  M0=jnp.swapaxes(vec.reshape((30,4,3,3)),-1,-2)
  A0=jnp.einsum('efji,efjk->efik',jnp.conj(M0),M0)
  evals,evecs=jnp.linalg.eigh(A0)
  depth_diag=jnp.asarray([Delta**2,Delta,1.0])
  Rspec=jnp.einsum('efia,a,efja->efij',evecs,depth_diag,jnp.conj(evecs))
  M=jnp.einsum('efij,efjk->efik',M0,Rspec)
  K=jnp.einsum('efji,efjk->efik',jnp.conj(M),M)
  Kq=K[:,0]+K[:,1];Kl=K[:,2]+K[:,3]
  eq=jnp.maximum(jnp.linalg.eigvalsh(Kq),0.0);el=jnp.maximum(jnp.linalg.eigvalsh(Kl),0.0)
  return 2*col*jnp.sum(fcar(jnp.sqrt(eq)),axis=1)+2*jnp.sum(fcar(jnp.sqrt(el)),axis=1),M,K
 def obj(x):
  S,_,_=costs(x) if include_car else (jnp.zeros(30),None,None)
  logits=eta*(alph_j@x)-S
  return 0.5*jnp.sum(A_j*x*x)-(jlogsumexp(logits)-math.log(30))/eta
 return jax.jit(jax.value_and_grad(obj)),jax.jit(costs),jax.jit(obj)

def optimize_case(eta,signs,include_car=True,starts=None):
 vg,costfun,obj=make_obj(*signs,3,eta,include_car)
 # compile
 x0=np.zeros(13); vg(jnp.asarray(x0))
 def fun(x):
  v,g=vg(jnp.asarray(x));return float(v),np.asarray(g,float)
 best=None
 for s in starts:
  r=minimize(fun,np.asarray(s,float),jac=True,method='L-BFGS-B',options={'ftol':1e-13,'gtol':1e-9,'maxiter':2000,'maxls':50})
  if best is None or r.fun<best.fun:best=r
 return best,costfun,obj

# solve bosonic once per eta; signs irrelevant
out=[]
for eta in [eta_delta,eta_conf]:
 starts=[np.zeros(13)]+[alphabet[i]/Aprec for i in [eref,0,1,5,10,15,20,25]]
 b,costb,objb=optimize_case(eta,(1,1),False,starts)
 print('BOS',eta,b.fun,b.success,np.linalg.norm(b.jac),[np.linalg.norm(b.x[:5]),np.linalg.norm(b.x[5:9]),np.linalg.norm(b.x[9:])])
 for signs in [(1,1),(1,-1),(-1,1),(-1,-1)]:
  starts2=[b.x,np.zeros(13)]+[alphabet[i]/Aprec for i in [eref,0,5]]
  r,costfun,obj=optimize_case(eta,signs,True,starts2)
  S,M,K=costfun(jnp.asarray(r.x));S=np.asarray(S);M=np.asarray(M);logits=eta*(alphabet@r.x)-S;p=np.exp(logits-logsumexp(logits));ie=int(np.argmax(p))
  specs={};Us={}
  names=['u','d','e','nu']
  for fi,name in enumerate(names):
   ev,U=np.linalg.eigh(np.asarray(K[ie,fi]));idx=np.argsort(ev);ev=ev[idx];U=U[:,idx];specs[name]=np.sqrt(np.maximum(ev,0));Us[name]=U
  Vck=Us['u'].conj().T@Us['d'];Vpm=Us['e'].conj().T@Us['nu']
  Jck=float(np.imag(Vck[0,0]*Vck[1,1]*np.conj(Vck[0,1])*np.conj(Vck[1,0])))
  Jpm=float(np.imag(Vpm[0,0]*Vpm[1,1]*np.conj(Vpm[0,1])*np.conj(Vpm[1,0])))
  rec={'eta':eta,'signs':signs,'fun':r.fun,'success':bool(r.success),'grad':float(np.linalg.norm(r.jac)),'nit':int(r.nit),'norms':[float(np.linalg.norm(r.x[:5])),float(np.linalg.norm(r.x[5:9])),float(np.linalg.norm(r.x[9:]))],'edge':ie,'pmax':float(p[ie]),'entropy':float(-np.sum(p*np.log(np.maximum(p,1e-300)))),'cost_minmax':[float(S.min()),float(S.max())],'spec':{n:specs[n].tolist() for n in names},'Vabs':np.abs(Vck).tolist(),'Jckm':Jck,'PMabs':np.abs(Vpm).tolist(),'Jpm':Jpm,'x':r.x.tolist()}
  out.append(rec); print('RES',json.dumps(rec))
open('/mnt/data/urt_gate2_spectral_results.json','w').write(json.dumps(out,indent=2))