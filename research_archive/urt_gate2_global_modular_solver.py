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
  M=jnp.swapaxes(vec.reshape((30,4,3,3)),-1,-2)
  M=jnp.einsum('efij,ejk->efik',M,R_j)
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


# ---------- reduced-state (global modular) CAR objective ----------

def make_reduced_obj(sign5=1, sign45=1, color=3, eta=eta_delta):
    Cg, src, col = build(sign5, sign45, color)
    Cg=jnp.asarray(Cg); src=jnp.asarray(src); eta=float(eta)
    eye3=jnp.eye(3,dtype=jnp.complex128)
    eye6=jnp.eye(6,dtype=jnp.complex128)

    def fermi_matrix(H):
        ev,U=jnp.linalg.eigh(H)
        q=jax.nn.sigmoid(-ev)
        return (U*q[None,:])@jnp.conj(U.T)

    def car_from_Q(Q):
        q=jnp.clip(jnp.linalg.eigvalsh(Q),1e-14,1-1e-14)
        return jnp.sum(q*jnp.log(2*q)+(1-q)*jnp.log(2*(1-q)))

    def unpack(z):
        x=z[:13]
        y=z[13:]
        y=y-jnp.mean(y)
        p=jax.nn.softmax(y)
        return x,p

    def matrices(x):
        vv=jnp.einsum('ac,c->a',Cg,x)
        vec=src+vv[None,None,:]
        M=jnp.swapaxes(vec.reshape((30,4,3,3)),-1,-2)
        M=jnp.einsum('efij,ejk->efik',M,R_j)
        return M

    def occupations(M):
        # q order: left 3 | u_R 3 | d_R 3
        Wu=jnp.concatenate([M[:,0],M[:,1]],axis=1) # 30 x 6 x 3
        Wl=jnp.concatenate([M[:,3],M[:,2]],axis=1) # nu_R then e_R
        zeros33=jnp.zeros((30,3,3),dtype=jnp.complex128)
        zeros66=jnp.zeros((30,6,6),dtype=jnp.complex128)
        Hq=jnp.concatenate([
            jnp.concatenate([zeros33,jnp.conj(jnp.swapaxes(Wu,-1,-2))],axis=2),
            jnp.concatenate([Wu,zeros66],axis=2)
        ],axis=1)
        Hl=jnp.concatenate([
            jnp.concatenate([zeros33,jnp.conj(jnp.swapaxes(Wl,-1,-2))],axis=2),
            jnp.concatenate([Wl,zeros66],axis=2)
        ],axis=1)
        Qq=jax.vmap(fermi_matrix)(Hq)
        Ql=jax.vmap(fermi_matrix)(Hl)
        return Qq,Ql

    def obj(z):
        x,p=unpack(z)
        M=matrices(x)
        Qq,Ql=occupations(M)
        Qqb=jnp.einsum('e,eij->ij',p,Qq)
        Qlb=jnp.einsum('e,eij->ij',p,Ql)
        kl=jnp.sum(p*jnp.log(jnp.maximum(30*p,1e-300)))
        matter=col*car_from_Q(Qqb)+car_from_Q(Qlb)
        return 0.5*jnp.sum(A_j*x*x)-jnp.dot(p,alph_j@x)+(kl+matter)/eta

    def aux(z):
        x,p=unpack(z)
        M=matrices(x)
        Qq,Ql=occupations(M)
        Qqb=jnp.einsum('e,eij->ij',p,Qq)
        Qlb=jnp.einsum('e,eij->ij',p,Ql)
        return x,p,M,Qqb,Qlb

    return jax.jit(jax.value_and_grad(obj)),jax.jit(obj),jax.jit(aux)


def modular_from_Q_np(Q):
    ev,U=np.linalg.eigh((Q+Q.conj().T)/2)
    ev=np.clip(ev,1e-13,1-1e-13)
    kval=np.log((1-ev)/ev)
    return (U*kval[None,:])@U.conj().T


def observables(auxout):
    x,p,M,Qq,Ql=auxout
    x=np.asarray(x,float);p=np.asarray(p,float);M=np.asarray(M);Qq=np.asarray(Qq);Ql=np.asarray(Ql)
    Kq=modular_from_Q_np(Qq);Kl=modular_from_Q_np(Ql)
    Wq=Kq[3:,:3]; Wl=Kl[3:,:3]
    Meff={'u':Wq[:3], 'd':Wq[3:], 'nu':Wl[:3], 'e':Wl[3:]}
    specs={};Us={}
    for name in ['u','d','e','nu']:
        K=Meff[name].conj().T@Meff[name]
        ev,U=np.linalg.eigh(K);idx=np.argsort(ev);ev=ev[idx];U=U[:,idx]
        specs[name]=np.sqrt(np.maximum(ev,0));Us[name]=U
    V=Us['u'].conj().T@Us['d']; P=Us['e'].conj().T@Us['nu']
    Jq=float(np.imag(V[0,0]*V[1,1]*np.conj(V[0,1])*np.conj(V[1,0])))
    Jl=float(np.imag(P[0,0]*P[1,1]*np.conj(P[0,1])*np.conj(P[1,0])))
    return dict(x=x,p=p,specs={k:v.tolist() for k,v in specs.items()},Vabs=np.abs(V).tolist(),PMabs=np.abs(P).tolist(),Jckm=Jq,Jpm=Jl,Qq_eigs=np.linalg.eigvalsh(Qq).tolist(),Ql_eigs=np.linalg.eigvalsh(Ql).tolist())


def optimise_reduced(eta,signs,start_records):
    vg,obj,aux=make_reduced_obj(signs[0],signs[1],3,eta)
    starts=[]
    for rec in start_records:
        x=np.asarray(rec['x'],float)
        # reconstruct old edge distribution for a useful initial logit vector
        Cg,src,_=build(signs[0],signs[1],3)
        vv=Cg@x;vec=src+vv[None,None,:]
        M=np.swapaxes(vec.reshape((30,4,3,3)),-1,-2)
        M=np.einsum('efij,ejk->efik',M,Rdepth)
        K=np.einsum('efji,efjk->efik',np.conj(M),M)
        Kq=K[:,0]+K[:,1];Kl=K[:,2]+K[:,3]
        def fcar_np(t): return 0.5*t*np.tanh(0.5*t)-np.logaddexp(0.5*t,-0.5*t)+math.log(2.0)
        eq=np.maximum(np.linalg.eigvalsh(Kq),0);el=np.maximum(np.linalg.eigvalsh(Kl),0)
        S=6*np.sum(fcar_np(np.sqrt(eq)),axis=1)+2*np.sum(fcar_np(np.sqrt(el)),axis=1)
        logits=eta*(alphabet@x)-S
        starts.append(np.r_[x,logits-logits.mean()])
    starts.append(np.zeros(43))
    # compile
    vg(jnp.asarray(starts[0]))
    def fun(z):
        v,g=vg(jnp.asarray(z));return float(v),np.asarray(g,float)
    best=None
    for z0 in starts:
        r=minimize(fun,z0,jac=True,method='L-BFGS-B',options={'ftol':1e-13,'gtol':1e-8,'maxiter':800,'maxls':50})
        if best is None or r.fun<best.fun: best=r
    out=observables(aux(jnp.asarray(best.x)))
    out.update(dict(eta=float(eta),signs=list(signs),fun=float(best.fun),success=bool(best.success),grad=float(np.linalg.norm(best.jac)),nit=int(best.nit),message=str(best.message),pmax=float(np.max(out['p'])),entropy=float(-np.sum(out['p']*np.log(np.maximum(out['p'],1e-300))))))
    out['p']=out['p'].tolist();out['x']=out['x'].tolist()
    return out

old=json.load(open('/mnt/data/urt_gate2_results.json'))
results=[]
for eta in [eta_delta,eta_conf]:
    signs=(-1,1)
    starts=[r for r in old if abs(r['eta']-eta)<1e-8 and tuple(r['signs'])==signs]
    result=optimise_reduced(eta,signs,starts)
    results.append(result)
    print('RESULT',eta,signs,result['fun'],result['grad'],result['pmax'],flush=True)
    print('spec',{k:(np.array(v)/v[-1]).tolist() for k,v in result['specs'].items()},flush=True)
    print('V',np.array(result['Vabs']),flush=True)
    print('P',np.array(result['PMabs']),flush=True)
    print('J',result['Jckm'],result['Jpm'],flush=True)
    open('/mnt/data/urt_gate2_global_modular_results.json','w').write(json.dumps(results,indent=2))