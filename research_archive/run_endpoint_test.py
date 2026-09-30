import itertools, math, json
from pathlib import Path
import numpy as np
from scipy import linalg as la
from scipy.optimize import minimize
import torch

torch.set_default_dtype(torch.float64)
TOL=1e-8
phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
eta_delta=-math.log(Delta)
eta_conf=9.8601129428

# seed geometry
vertices=np.array([
[0,1,phi],[0,1,-phi],[0,-1,phi],[0,-1,-phi],
[1,phi,0],[1,-phi,0],[-1,phi,0],[-1,-phi,0],
[phi,0,1],[phi,0,-1],[-phi,0,1],[-phi,0,-1]],float)
dist=np.linalg.norm(vertices[:,None,:]-vertices[None,:,:],axis=2)
adjacency=(np.abs(dist-2.0)<TOL).astype(float); np.fill_diagonal(adjacency,0)
faces=[]
for triple in itertools.combinations(range(12),3):
    i,j,k=triple
    if adjacency[i,j] and adjacency[i,k] and adjacency[j,k]:
        tri=[i,j,k]; x,y,z=vertices[tri]
        normal=np.cross(y-x,z-x); centre=(x+y+z)/3
        if np.dot(normal,centre)<0: tri=[i,k,j]
        faces.append(tuple(tri))
shell_edges=sorted({tuple(sorted((i,j))) for i in range(12) for j in range(i+1,12) if adjacency[i,j]})
spokes=[(i,12) for i in range(12)]; edges=shell_edges+spokes
edge_index={e:i for i,e in enumerate(edges)}
d0=np.zeros((42,13))
for ei,(i,j) in enumerate(edges): d0[ei,i]=-1; d0[ei,j]=1
d1=np.zeros((20,42))
for fi,(i,j,k) in enumerate(faces):
    for a,b in ((i,j),(j,k),(k,i)):
        e=tuple(sorted((a,b))); sign=1.0 if (a,b)==e else -1.0
        d1[fi,edge_index[e]]=sign
B=np.zeros((20,12))
for fi,f in enumerate(faces): B[fi,list(f)]=1
face_adjacency=np.zeros((20,20))
for i,j in itertools.combinations(range(20),2):
    if len(set(faces[i]).intersection(faces[j]))==2: face_adjacency[i,j]=face_adjacency[j,i]=1
Lf=3*np.eye(20)-face_adjacency

def eigspace(M,val,tol=1e-7):
    w,V=np.linalg.eigh(M); return V[:,np.abs(w-val)<tol]
U3=vertices.copy(); U3=U3@np.linalg.inv(la.sqrtm(U3.T@U3)); U3=np.real_if_close(U3)
U3p=eigspace(adjacency,-math.sqrt(5)); U5=eigspace(adjacency,-1)
H3=eigspace(Lf,3); H5=eigspace(Lf,5)
# rotations
ref=(0,1,4); Xref=vertices[list(ref)].T; gram=Xref.T@Xref
rotations=[]; vertex_perms=[]
for images in itertools.permutations(range(12),3):
    Y=vertices[list(images)].T
    if np.max(np.abs(Y.T@Y-gram))>TOL: continue
    R=Y@np.linalg.inv(Xref)
    if np.max(np.abs(R.T@R-np.eye(3)))>TOL or np.linalg.det(R)<1-TOL: continue
    mapped=(R@vertices.T).T; p=[]; valid=True
    for mv in mapped:
        ds=np.linalg.norm(vertices-mv,axis=1); t=int(np.argmin(ds))
        if ds[t]>1e-7: valid=False; break
        p.append(t)
    if valid and tuple(p) not in vertex_perms:
        rotations.append(R); vertex_perms.append(tuple(p))
assert len(rotations)==60
face_lookup={tuple(sorted(f)):i for i,f in enumerate(faces)}
Pv=[];Pf=[]
for p in vertex_perms:
    A=np.zeros((12,12));
    for s,t in enumerate(p): A[t,s]=1
    Fm=np.zeros((20,20))
    for sf,f in enumerate(faces): Fm[face_lookup[tuple(sorted(p[v] for v in f))],sf]=1
    Pv.append(A); Pf.append(Fm)
rho3=[U3.T@P@U3 for P in Pv]; rho3p=[U3p.T@P@U3p for P in Pv]; rho5=[U5.T@P@U5 for P in Pv]
rhoH3=[H3.T@P@H3 for P in Pf]; rhoH5=[H5.T@P@H5 for P in Pf]
rho_hom=[np.kron(R3,R3p) for R3,R3p in zip(rho3,rho3p)]
rng=np.random.default_rng(20260730)
def intertwiner(src,dim):
    seed=rng.normal(size=(9,dim))
    avg=sum(t@seed@s.T for t,s in zip(rho_hom,src))/60
    w,V=np.linalg.eigh(avg.T@avg)
    return avg@(V@np.diag(1/np.sqrt(w))@V.T)
J43=-intertwiner(rhoH3,4) # original solver flips this
J45=intertwiner(rhoH5,4); J5=intertwiner(rho5,5)
rotations=np.asarray(rotations)
# group tables

def group_index(R): return int(np.argmin([np.linalg.norm(R-r) for r in rotations]))
identity=group_index(np.eye(3))
mult=np.array([[group_index(rotations[i]@rotations[j]) for j in range(60)] for i in range(60)],int)
orders=[]
for e in range(60):
    power=identity
    for o in range(1,61):
        power=mult[power,e]
        if power==identity: orders.append(o); break
order2=[i for i,o in enumerate(orders) if o==2]; order3=[i for i,o in enumerate(orders) if o==3]
def pi_axis(R):
    w,V=np.linalg.eigh((R+R.T)/2); a=V[:,np.argmax(w)]; return a/np.linalg.norm(a)
axes2={e:pi_axis(rotations[e]) for e in order2}
# edge alphabet and representative
edge_alphabet=[]; edge_geometry=[]
for ei,(i,j) in enumerate(shell_edges):
    u,v=vertices[i],vertices[j]
    midpoint=u+v; midpoint/=np.linalg.norm(midpoint)
    difference=u-v; difference/=np.linalg.norm(difference)
    normal=np.cross(midpoint,difference); normal/=np.linalg.norm(normal)
    axes=[midpoint,difference,normal]
    projectors=np.array([np.outer(a,a) for a in axes])
    half=[]
    for axis in axes:
        e=max(order2,key=lambda g:abs(np.dot(axes2[g],axis)))
        assert abs(np.dot(axes2[e],axis))>1-1e-7
        half.append(e)
    cyc=[]
    for e in order3:
        rep=rho3[e]
        err=sum(np.linalg.norm(rep@projectors[k]@rep.T-projectors[(k+1)%3]) for k in range(3))
        if err<1e-7: cyc.append(e)
    incident=[fi for fi,f in enumerate(faces) if i in f and j in f]
    unsigned=np.zeros(20); unsigned[incident]=1
    signed=d1[:,ei]
    xi3=H3.T@unsigned; xi5=H5.T@unsigned
    signed3=H3.T@signed; signed5=H5.T@signed
    Em3=xi3/np.linalg.norm(xi3); En3_ref=signed3/np.linalg.norm(signed3); Ed5=signed5/np.linalg.norm(signed5)
    scored=[]
    for e in cyc:
        e2=mult[e,e]; En3=rhoH3[e2]@Em3; scored.append((float(np.dot(En3,En3_ref)),e))
    score,cycle=max(scored); assert score>1-1e-7
    c2=mult[cycle,cycle]
    Ed3=rhoH3[cycle]@Em3; En3=rhoH3[c2]@Em3
    Em5=rhoH5[c2]@Ed5; En5=rhoH5[cycle]@Ed5
    E3=np.column_stack([Em3,Ed3,En3]); E5=np.column_stack([Em5,Ed5,En5])
    vi=np.zeros(12); vi[[i,j]]=1; Hedge=U5.T@vi; Hedge/=np.linalg.norm(Hedge)
    edge_alphabet.append(np.concatenate([Hedge,xi3,xi5])); edge_geometry.append({'E3':E3,'E5':E5,'Q':projectors})
edge_alphabet=np.asarray(edge_alphabet); precision=np.r_[np.ones(5),3*np.ones(4),5*np.ones(4)]
rep=edge_geometry[0]; E3=rep['E3']; E5=rep['E5']; Q=rep['Q']; Rdelta=Q[0]+Delta*Q[1]+Delta**2*Q[2]
charges={'u':np.array([1.,3.,-4.]),'d':np.array([1.,-3.,2.]),'e':np.array([-3.,-3.,6.]),'nu':np.array([-3.,3.,0.])}
def gcov(q):
    a,b,c=q; raw=np.array([b*c,c*a,a*b]); return raw-raw.mean()
def unvec(v): return v.reshape((3,3),order='F')

def raw_block(x,sector):
    H=x[:5]; X3=x[5:9]; X5=x[9:]; q=charges[sector]; g=gcov(q)
    return unvec(J5@H)+unvec(J43@(X3+E3@q/3))+1j*unvec(J45@(X5+Delta*E5@g/5))

def classical_value_gradient(x,eta):
    logits=eta*(edge_alphabet@x); shift=float(logits.max()); weights=np.exp(logits-shift); weights/=weights.sum()
    value=0.5*np.dot(precision*x,x)-(shift+math.log(np.exp(logits-shift).mean()))/eta
    grad=precision*x-weights@edge_alphabet
    return float(value),grad

def classical_minimum(eta):
    initial=np.r_[0.9*edge_alphabet[0,:5],0.1*edge_alphabet[0,5:9],0.2*edge_alphabet[0,9:]]
    r=minimize(lambda x:classical_value_gradient(x,eta),initial,jac=True,method='BFGS',options={'gtol':1e-12,'maxiter':2000})
    return r.x

# torch constants
Tj5=torch.tensor(J5); Tj43=torch.tensor(J43); Tj45=torch.tensor(J45); TE3=torch.tensor(E3); TE5=torch.tensor(E5); TR=torch.tensor(Rdelta)
Ta=torch.tensor(edge_alphabet); Tp=torch.tensor(precision); Tq={k:torch.tensor(v) for k,v in charges.items()}; Tg={k:torch.tensor(gcov(v)) for k,v in charges.items()}
def tunvec(v): return v.reshape(3,3).T
def car_scalar(x): return .5*x*torch.tanh(.5*x)-torch.log(torch.cosh(.5*x))

def tblock(x,sector,placement):
    H=x[:5];X3=x[5:9];X5=x[9:];q=Tq[sector];g=Tg[sector]
    raw=tunvec(Tj5@H+Tj43@(X3+TE3@q/3)).to(torch.complex128)+1j*tunvec(Tj45@(X5+Delta*TE5@g/5)).to(torch.complex128)
    Rc=TR.to(torch.complex128)
    return raw@Rc if placement=='right_source' else Rc@raw

def branch_action(x,eta,placement):
    M={s:tblock(x,s,placement) for s in charges}
    KQ=M['u'].conj().T@M['u']+M['d'].conj().T@M['d']
    KL=M['nu'].conj().T@M['nu']+M['e'].conj().T@M['e']
    SQ=2*torch.sum(car_scalar(torch.sqrt(torch.linalg.eigvalsh(KQ).clamp_min(0))))
    SL=2*torch.sum(car_scalar(torch.sqrt(torch.linalg.eigvalsh(KL).clamp_min(0))))
    logits=eta*(Ta@x)
    classical=.5*torch.dot(Tp*x,x)-(torch.logsumexp(logits,dim=0)-math.log(30))/eta
    return classical+(SQ+SL)/eta

def solve(eta,placement):
    x=torch.tensor(classical_minimum(eta),requires_grad=True)
    opt=torch.optim.LBFGS([x],lr=.8,max_iter=1000,tolerance_grad=1e-12,tolerance_change=1e-15,line_search_fn='strong_wolfe')
    def closure():
        opt.zero_grad(); val=branch_action(x,eta,placement); val.backward(); return val
    opt.step(closure)
    return x.detach().numpy(),float(branch_action(x.detach(),eta,placement))

def observables(x,placement):
    mats={s:(raw_block(x,s)@Rdelta if placement=='right_source' else Rdelta@raw_block(x,s)) for s in charges}
    specs={}; U={}
    for s,M in mats.items():
        ev,V=np.linalg.eigh(M.conj().T@M); idx=np.argsort(ev); ev=ev[idx];V=V[:,idx]
        specs[s]=np.sqrt(np.clip(ev,0,None));U[s]=V
    CKM=U['u'].conj().T@U['d']; PMNS=U['e'].conj().T@U['nu']
    J=lambda V:float(np.imag(V[0,0]*V[1,1]*np.conj(V[0,1])*np.conj(V[1,0])))
    s13=abs(PMNS[0,2])**2
    angles={'s12':abs(PMNS[0,1])**2/(1-s13),'s23':abs(PMNS[1,2])**2/(1-s13),'s13':s13}
    return {'x':x,'norms':[np.linalg.norm(x[:5]),np.linalg.norm(x[5:9]),np.linalg.norm(x[9:])],
            'spec':{s:(specs[s]/specs[s][-1]).tolist() for s in specs},'CKM':np.abs(CKM).tolist(),'PMNS':np.abs(PMNS).tolist(),'J_CKM':J(CKM),'J_PMNS':J(PMNS),'angles':angles}

out={}
for placement in ['right_source','left_codomain']:
  out[placement]={}
  for label,eta in [('closure',eta_delta),('confinement',eta_conf)]:
    print('solving',placement,label,flush=True)
    x,val=solve(eta,placement); r=observables(x,placement);r['action']=val;r['eta']=eta;out[placement][label]=r
    print(label,'CKM',np.array(r['CKM']));print('PMNS',np.array(r['PMNS']));print('J',r['J_CKM'],r['J_PMNS']);print('spec',r['spec']);print('norms',r['norms'])
Path('/mnt/data/endpoint_conditioning_results.json').write_text(json.dumps(out,indent=2))
print('saved')