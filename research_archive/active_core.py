from __future__ import annotations
import itertools, math
from collections import defaultdict
import numpy as np
from scipy import linalg as la
from scipy.linalg import expm

TOL=1e-8
phi=(1+math.sqrt(5.0))/2.0
gamma=1/81
delta=3/20 - 80*math.pi/(1053*phi)
eta_delta=-math.log(delta)
eta_Q=(10/3)*eta_delta
eta_L=phi**2*eta_delta

# Seed geometry
vertices=np.array([
[0,1,phi],[0,1,-phi],[0,-1,phi],[0,-1,-phi],
[1,phi,0],[1,-phi,0],[-1,phi,0],[-1,-phi,0],
[phi,0,1],[phi,0,-1],[-phi,0,1],[-phi,0,-1]],float)
dist=np.linalg.norm(vertices[:,None,:]-vertices[None,:,:],axis=2)
adjacency=(np.abs(dist-2)<TOL).astype(float); np.fill_diagonal(adjacency,0)
faces=[]
for tri0 in itertools.combinations(range(12),3):
    i,j,k=tri0
    if adjacency[i,j] and adjacency[i,k] and adjacency[j,k]:
        tri=[i,j,k]; x,y,z=vertices[tri]; n=np.cross(y-x,z-x); c=(x+y+z)/3
        if np.dot(n,c)<0: tri=[i,k,j]
        faces.append(tuple(tri))
faces=np.asarray(faces,int)
B=np.zeros((20,12))
for fi,f in enumerate(faces): B[fi,list(f)]=1
face_adjacency=np.zeros((20,20))
for i,j in itertools.combinations(range(20),2):
    if len(set(faces[i]).intersection(faces[j]))==2: face_adjacency[i,j]=face_adjacency[j,i]=1
Lf=3*np.eye(20)-face_adjacency
face_normals=[]
for f in faces:
    x,y,z=vertices[list(f)]; n=np.cross(y-x,z-x); n/=np.linalg.norm(n)
    if np.dot(n,(x+y+z)/3)<0:n=-n
    face_normals.append(n)
face_normals=np.asarray(face_normals)
def eigenspace_symmetric(M,lam,tol=1e-7):
    w,v=np.linalg.eigh(M); return v[:,np.abs(w-lam)<tol]
U3=vertices.copy(); U3=U3@np.linalg.inv(la.sqrtm(U3.T@U3)); U3=np.real_if_close(U3)
U3p=eigenspace_symmetric(adjacency,-math.sqrt(5))
U5=eigenspace_symmetric(adjacency,-1)
H3=eigenspace_symmetric(Lf,3)
H5=eigenspace_symmetric(Lf,5)

# 60 rotations
reference_indices=(0,1,4); Xref=vertices[list(reference_indices)].T; Gref=Xref.T@Xref
rotations=[]; vertex_perms=[]
for images in itertools.permutations(range(12),3):
    Y=vertices[list(images)].T
    if np.max(np.abs(Y.T@Y-Gref))>TOL: continue
    R=Y@np.linalg.inv(Xref)
    if np.max(np.abs(R.T@R-np.eye(3)))>TOL or np.linalg.det(R)<1-TOL: continue
    mapped=(R@vertices.T).T; p=[]; valid=True
    for mv in mapped:
        ds=np.linalg.norm(vertices-mv,axis=1); t=int(np.argmin(ds))
        if ds[t]>1e-7: valid=False; break
        p.append(t)
    if valid and tuple(p) not in vertex_perms:
        rotations.append(R); vertex_perms.append(tuple(p))
if len(rotations)!=60: raise RuntimeError(len(rotations))
face_lookup={tuple(sorted(map(int,f))):i for i,f in enumerate(faces)}
Pv=[]; Pf=[]
for p in vertex_perms:
    A=np.zeros((12,12));
    for s,t in enumerate(p):A[t,s]=1
    C=np.zeros((20,20))
    for sf,f in enumerate(faces): C[face_lookup[tuple(sorted(p[int(v)] for v in f))],sf]=1
    Pv.append(A); Pf.append(C)
rho3=[U3.T@P@U3 for P in Pv]; rho3p=[U3p.T@P@U3p for P in Pv]
rho5=[U5.T@P@U5 for P in Pv]; rhoH3=[H3.T@P@H3 for P in Pf]; rhoH5=[H5.T@P@H5 for P in Pf]
rho_hom=[np.kron(a,b) for a,b in zip(rho3,rho3p)]
rng=np.random.default_rng(20260730)
def intertwiner(src,d):
    seed=rng.normal(size=(9,d)); avg=sum(t@seed@s.T for t,s in zip(rho_hom,src))/60
    w,v=np.linalg.eigh(avg.T@avg); return avg@(v@np.diag(1/np.sqrt(w))@v.T)
J43=intertwiner(rhoH3,4); J45=intertwiner(rhoH5,4); J5=intertwiner(rho5,5)

# six unoriented axes and A5 permutations
unit_vertices=vertices/np.linalg.norm(vertices,axis=1,keepdims=True)
ant={i:int(np.argmin(np.linalg.norm(unit_vertices+v,axis=1))) for i,v in enumerate(unit_vertices)}
axis_pairs=sorted({tuple(sorted((i,ant[i]))) for i in range(12)})
axis_lookup={pair:i for i,pair in enumerate(axis_pairs)}; axis_reps=[p[0] for p in axis_pairs]
aperms=[]
for p in vertex_perms:
    aperms.append(tuple(axis_lookup[tuple(sorted((p[a],p[b])))] for a,b in axis_pairs))

def grading_basis(t_index):
    perm=aperms[t_index]; visited=set(); trans=[]; fixed=[]
    for i,j in enumerate(perm):
        if i in visited: continue
        if i==j: fixed.append(i); visited.add(i)
        else: trans.append(tuple(sorted((i,j)))); visited.update((i,j))
    trans=sorted(set(trans)); fixed=sorted(fixed); E=np.eye(6)
    left=np.column_stack([(E[:,a]-E[:,b])/math.sqrt(2) for a,b in trans])
    right=np.column_stack([(E[:,a]+E[:,b])/math.sqrt(2) for a,b in trans]+[E[:,i] for i in fixed])
    return left,right

# Shell ribbons
shell_edges=[(i,j) for i in range(12) for j in range(i+1,12) if adjacency[i,j]>.5]
sym_basis=[np.diag([1,-1,0])/math.sqrt(2),np.diag([1,1,-2])/math.sqrt(6)]
for a,b in ((0,1),(0,2),(1,2)):
    M=np.zeros((3,3));M[a,b]=M[b,a]=1/math.sqrt(2);sym_basis.append(M)
sym_basis=np.asarray(sym_basis)
def tq(u): return np.outer(u,u)-np.eye(3)/3
edge5=[]; edge3=[]; edgeh5=[]
for i,j in shell_edges:
    X=math.sqrt(15)/4*(tq(unit_vertices[i])+tq(unit_vertices[j]))
    edge5.append([np.sum(C*X) for C in sym_basis])
    c=np.array([1.0 if i in f and j in f else 0.0 for f in faces])
    edge3.append(H3.T@c); edgeh5.append(H5.T@c)
edge5=np.asarray(edge5); edge3=np.asarray(edge3); edgeh5=np.asarray(edgeh5)
v2a={v:a for a,pair in enumerate(axis_pairs) for v in pair}
pair_edges=defaultdict(list)
for ei,(i,j) in enumerate(shell_edges): pair_edges[tuple(sorted((v2a[i],v2a[j])))].append(ei)
shell5=np.zeros((6,6,5)); shell3=np.zeros((6,6,4)); shellh5=np.zeros((6,6,4))
for (a,b),inds in pair_edges.items():
    positive=[ei for ei in inds if axis_reps[a] in shell_edges[ei]]
    ep=positive[0]; em=inds[0] if inds[1]==ep else inds[1]
    shell5[a,b]=shell5[b,a]=(edge5[ep]+edge5[em])/math.sqrt(2)
    shellh5[a,b]=shellh5[b,a]=(edgeh5[ep]+edgeh5[em])/math.sqrt(2)
    shell3[a,b]=(edge3[ep]-edge3[em])/math.sqrt(2); shell3[b,a]=-shell3[a,b]

# Dual ribbons
unit_normals=face_normals/np.linalg.norm(face_normals,axis=1,keepdims=True)
fant={i:int(np.argmin(np.linalg.norm(unit_normals+n,axis=1))) for i,n in enumerate(unit_normals)}
face_axis_pairs=sorted({tuple(sorted((i,fant[i]))) for i in range(20)}); face_reps=[p[0] for p in face_axis_pairs]
f2a={f:a for a,pair in enumerate(face_axis_pairs) for f in pair}
dual_edges=[(i,j) for i in range(20) for j in range(i+1,20) if face_adjacency[i,j]>.5]
fap=defaultdict(list)
for i,j in dual_edges:fap[tuple(sorted((f2a[i],f2a[j])))].append((i,j))
dual3=np.zeros((10,10,4)); dual5=np.zeros((10,10,4))
for (a,b),rails in fap.items():
    pos=[rail for rail in rails if face_reps[a] in rail]; rp=pos[0]; rm=rails[0] if rails[1]==rp else rails[1]
    vp=np.zeros(20);vm=np.zeros(20);vp[list(rp)]=1;vm[list(rm)]=1
    x3=H3.T@((vp-vm)/math.sqrt(2)); x5=H5.T@((vp+vm)/math.sqrt(2))
    dual3[a,b]=x3;dual3[b,a]=-x3;dual5[a,b]=dual5[b,a]=x5
D=np.zeros((6,10))
for fa,fi in enumerate(face_reps):
    for v in faces[fi]:D[v2a[int(v)],fa]=1

def vecmat(v):return v.reshape(3,3).T

def shell_channel(kind):
    T=np.zeros((36,36),complex)
    for a in range(6):
      for b in range(a+1,6):
       for out,inn in ((a,b),(b,a)):
        if kind=='5': vec=(J5@shell5[out,inn])/7
        elif kind=='43': vec=(J43@shell3[out,inn])/3
        else: vec=1j*(J45@shellh5[out,inn])/5
        M=vecmat(vec); po=18+3*out; ui=3*inn
        T[po:po+3,ui:ui+3]=M;T[ui:ui+3,po:po+3]=M.conj().T
    return T

def dual_channel(kind):
    T=np.zeros((60,60),complex)
    for a in range(10):
      for b in range(a+1,10):
       if np.linalg.norm(dual3[a,b])+np.linalg.norm(dual5[a,b])<1e-12:continue
       for out,inn in ((a,b),(b,a)):
        vec=(J43@dual3[out,inn])/3 if kind=='43' else 1j*(J45@dual5[out,inn])/5
        M=vecmat(vec); po=30+3*out; ui=3*inn
        T[po:po+3,ui:ui+3]=M;T[ui:ui+3,po:po+3]=M.conj().T
    return T
S_ch=(shell_channel('5'),shell_channel('43'),shell_channel('45'))
L_ch=(None,dual_channel('43'),dual_channel('45'))

def heat_cross(T,eta,node_count):
    alpha=float(np.linalg.eigvalsh(T)[-1]); K=expm(eta*(T-alpha*np.eye(T.shape[0]))); n=3*node_count; return K[n:,:n]

def blocks(cross,left,right):
    tensor=cross.reshape(6,3,6,3)
    return np.einsum('pa,pAqB,qi->aiAB',right,tensor,left,optimize=True)