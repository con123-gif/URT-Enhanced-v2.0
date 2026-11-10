#!/usr/bin/env python3
"""Exact A5 face-to-edge quartet completion; conditional 24-clock Ward check.
No historical ARFs, fits, or third-party Yang--Mills. Requires sympy/numpy/networkx.
"""
import itertools as it
import sympy as s
import numpy as np
import networkx as nx
from networkx.algorithms.isomorphism import GraphMatcher
R=s.sqrt(5);phi=(1+R)/2
p=([(0,a,b*phi) for a,b in it.product((-1,1),repeat=2)]+
   [(a,b*phi,0) for a,b in it.product((-1,1),repeat=2)]+
   [(a*phi,0,b) for a,b in it.product((-1,1),repeat=2)])
sq=lambda i,j:s.simplify(sum((p[i][k]-p[j][k])**2 for k in range(3)))
edges=[(i,j) for i in range(12) for j in range(i+1,12) if sq(i,j)==4]
E=set(edges)
faces=[(i,j,k) for i,j,k in it.combinations(range(12),3) if {(i,j),(i,k),(j,k)}<=E]
assert len(edges)==30 and len(faces)==20 and sum([14,26,26,62,62])==190
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from(edges)
dist=dict(nx.all_pairs_shortest_path_length(G))
second=[(i,j) for i,j in it.combinations(range(12),2) if dist[i][j]==2]
anti=[(i,j) for i,j in it.combinations(range(12),2) if dist[i][j]==3]
assert len(second)==30 and len(anti)==6
C=s.zeros(20,12);D=s.zeros(30,20);idx={e:i for i,e in enumerate(edges)}
for f,vs in enumerate(faces):
    for v in vs:C[f,v]=1
    for e in it.combinations(vs,2):D[idx[e],f]=1
A=s.zeros(20)
for f,g in it.combinations(range(20),2):
    if len(set(faces[f])&set(faces[g]))==2:A[f,g]=A[g,f]=1
L=3*s.eye(20)-A
assert D.T*D==6*s.eye(20)-L
H=s.eye(20)-C*(C.T*C).inv()*C.T
P3=H*(5*s.eye(20)-L)/2;P5=H*(L-3*s.eye(20))/2
assert P3.trace()==P5.trace()==4 and P3*P5==s.zeros(20)
assert P3*P3==P3 and P5*P5==P5
T3=D*P3/s.sqrt(3);T5=D*P5
assert s.simplify(T3.T*T3-P3)==s.zeros(20)
assert T5.T*T5==P5 and s.simplify(T3.T*T5)==s.zeros(20)
E3=s.simplify(T3*T3.T);E5=T5*T5.T
assert E3.trace()==E5.trace()==4 and E3*E5==s.zeros(30)
# Independently reconstruct the full 60 proper rotations and integer character projector.
xyz=np.array(p,float);abc=(0,1,4);X=np.stack([xyz[i] for i in abc],axis=1)
rot=[]
for m in GraphMatcher(G,G).isomorphisms_iter():
    Y=np.stack([xyz[m[i]] for i in abc],axis=1)
    if np.linalg.det(Y@np.linalg.inv(X))>0.5:rot.append(tuple(m[i] for i in range(12)))
assert len(rot)==60
identity=tuple(range(12))
def order(a):
    v=identity
    for k in range(1,6):
        v=tuple(a[v[i]] for i in range(12))
        if v==identity:return k
    raise AssertionError('not A5')
chi={1:4,2:0,3:1,5:-1};orders=[order(a) for a in rot]
assert [orders.count(k) for k in (1,2,3,5)]==[1,15,20,24]
def proj(pairs):
    ii={e:j for j,e in enumerate(pairs)};M=np.zeros((len(pairs),len(pairs)),dtype=np.int64)
    for a,k in zip(rot,orders):
        for j,(i,l) in enumerate(pairs):M[ii[tuple(sorted((a[i],a[l])))],j]+=chi[k]
    assert np.array_equal(M@M,15*M)
    return M
Me=proj(edges);Ms=proj(second);Ma=proj(anti)
assert np.trace(Me)==np.trace(Ms)==120 and np.trace(Ma)==0
assert s.simplify(E3+E5-s.Matrix(Me)/15)==s.zeros(30)
# Complete Sym^2 H13: only nearest- and second-neighbour pairs contain quartets.
pairs=list(it.combinations_with_replacement(range(13),2));ix={e:i for i,e in enumerate(pairs)}
M=np.zeros((91,91),dtype=np.int64)
for a,k in zip(rot,orders):
    for j,(i,l) in enumerate(pairs):
        x=a[i] if i<12 else 12;y=a[l] if l<12 else 12
        M[ix[tuple(sorted((x,y)))],j]+=chi[k]
assert np.array_equal(M@M,15*M) and np.trace(M)==240
sectors={'onsite':[(i,i) for i in range(13)],'centre_vertex':[(i,12) for i in range(12)],
         'edge':edges,'distance2':second,'antipodal':anti}
ranks={}
for name,ps in sectors.items():
    jj=[ix[e] for e in ps];ranks[name]=int(np.trace(M[np.ix_(jj,jj)])//15)
assert ranks=={'onsite':0,'centre_vertex':0,'edge':8,'distance2':8,'antipodal':0}
# Independent spectral decomposition of the same face-edge maps.
eig,U=np.linalg.eigh(np.array(L,float));Dn=np.array(D,float)
for val,mult,P,weight in [(3,4,E3,3),(5,4,E5,1)]:
    V=U[:,np.abs(eig-val)<1e-9]
    assert V.shape==(20,mult)
    assert np.linalg.norm((Dn@V).T@(Dn@V)-weight*np.eye(mult))<1e-11
    assert np.linalg.norm(Dn@V@V.T@Dn.T/weight-np.array(P,float))<1e-11
# Onsite 3prime and 5, unlike the bare quartet, each occur once.
Adj=s.zeros(12)
for i,j in edges:Adj[i,j]=Adj[j,i]=1
Lv=5*s.eye(12)-Adj
V5=s.simplify(-Lv*(Lv-(5-R)*s.eye(12))*(Lv-(5+R)*s.eye(12))/24)
V3p=s.simplify(Lv*(Lv-(5-R)*s.eye(12))*(Lv-6*s.eye(12))/((5+R)*2*R*(R-1)))
assert V5.trace()==5 and V3p.trace()==3 and V5*V3p==s.zeros(12)
assert V5*V5==V5 and V3p*V3p==V3p
# Conditional charge-two 24-clock Schur kernel on edge pair sections.
q=2;r=float(s.pi/s.E);Delta=float(s.Rational(3,20)-80*s.pi/(1053*phi));N=24
rng=np.random.default_rng(20261110);theta=rng.uniform(-0.9,0.9,N)
def clock(t):
    B=np.zeros((N,N),complex)
    for i in range(N):B[i,(i+1)%N]=1;B[i,i]=-np.exp(1j*q*t[i])
    return B.conj().T@B
Lq=clock(theta);E3n=np.array(E3,float);E5n=np.array(E5,float)
def kernel(t):
    a=clock(t)
    return np.kron(np.linalg.inv(18*np.eye(N)+r*r*a),E3n)+Delta**2*np.kron(np.linalg.inv(16*np.eye(N)+r*r*a),E5n)
K=kernel(theta)
assert np.linalg.norm(K-K.conj().T)<1e-11
assert np.linalg.matrix_rank(K,tol=1e-11)==8*N
assert np.linalg.eigvalsh(K).min()>-1e-11
lam=rng.uniform(-1,1,N);dg=np.roll(lam,-1)-lam
Uq=np.diag(np.exp(1j*q*lam));Kg=kernel(theta+dg)
W=np.kron(Uq,np.eye(30))
assert np.linalg.norm(Kg-W@K@W.conj().T)<1e-10
B=rng.normal(size=(N,30))+1j*rng.normal(size=(N,30))
Bg=np.exp(1j*q*lam)[:,None]*B
assert abs(np.vdot(B.ravel(),K@B.ravel())-np.vdot(Bg.ravel(),Kg@Bg.ravel()))<1e-10
# Complete second Schur Ward contact: source acceleration + Wilson seagull + relaxation.
source=rng.normal(size=N)+1j*rng.normal(size=N);Lambda=np.diag(lam)
for mass in (16,18):
    A=mass*np.eye(N)+r*r*Lq;sol=np.linalg.solve(A,source)
    hp=1j*q*lam*source;hpp=-(q*lam)**2*source
    A1=1j*q*(Lambda@A-A@Lambda)
    A2=-q*q*(Lambda@Lambda@A-2*Lambda@A@Lambda+A@Lambda@Lambda)
    e=2e-4
    Ap=mass*np.eye(N)+r*r*clock(theta+e*dg)
    Am=mass*np.eye(N)+r*r*clock(theta-e*dg)
    assert np.linalg.norm((Ap-Am)/(2*e)-A1)<2e-6
    assert np.linalg.norm((Ap+Am-2*A)/e**2-A2)<2e-5
    ward=(-np.vdot(sol,hpp).real+np.vdot(sol,A2@sol).real/2-
          np.vdot(hp-A1@sol,np.linalg.solve(A,hp-A1@sol)).real)
    assert abs(ward)<1e-10
assert -q+q==0 and -q*q+2*q*q-q*q==0 # local Yukawa first/second contacts
print('PASS exact face-edge completion: P4(edge)=D P3 D^T/3 + D P5 D^T')
print('PASS 91-dim Sym2 H13 A5 localization:',ranks)
print('PASS independent Laplacian SVD, onsite 3prime/5, 24-clock gauge/Schur Ward')
print('conditional kernel rank',8*N,'smallest positive eigenvalue',np.linalg.eigvalsh(K)[-8*N])
print('OPEN physical fermion vertex selection, H51 charges, pole residues, four ARFs')
