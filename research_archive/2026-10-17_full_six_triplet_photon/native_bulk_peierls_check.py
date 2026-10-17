#!/usr/bin/env python3
"""Native Platonic 3D Maxwell and chiral Peierls source audit.
No charged lepton masses used, test standard full DEC Maxwell K=b2 b2^T.
"""
import sys, itertools, json
from pathlib import Path
import numpy as np
from numpy.linalg import norm,eigh,pinv
sys.path.insert(0,str(Path(__file__).resolve().parent))
import cathedral_strict_64_closure as c
v,vc,ico_edges,faces,ds,cinc=c.icosahedron()
N=len(faces)
Fcent=np.array([v[list(f)].sum(axis=0) for f in faces])
L=ds[2].T@ds[2]
spec,V=eigh(L)
assert np.allclose(np.sort(spec),np.sort([0]+[3-np.sqrt(5)]*3+[2]*5+[3]*4+[5]*4+[3+np.sqrt(5)]*3),atol=1e-12)
trLplus=float(np.sum(1/spec[spec>1e-9]))
assert abs(trLplus-137/15)<1e-11

# Primary full 3D icosahedron cone with real simplicial b1/b2/b3.
b1,b2,b3,outer,radial=c.real_tetrahedral_complex(faces)
assert norm(b1@b2)<1e-12 and norm(b2@b3)<1e-12
K=b2@b2.T
Pin=b2.T@pinv(K,hermitian=True)@b2
sO=np.array([(-1)**sum(f[i]>f[j] for i in range(3) for j in range(i+1,3)) for f in faces]); O=np.diag(sO)
flux_shell=O@Pin[np.ix_(outer,outer)]@O
expected=L@np.linalg.inv(np.eye(20)+L)
assert norm(flux_shell-expected)<1e-11
# The 2D shell gives flat projector instead
K2=ds[2]@ds[2].T
flux2=ds[2].T@pinv(K2,hermitian=True)@ds[2]
assert norm(flux2-(np.eye(20)-np.ones((20,20))/20))<1e-11

# Native signed face chirality W only on second-nearest neighbors of dual dodecahedron.
W=np.zeros((N,N))
for a in range(N):
  for b in range(N):
    shared=set(faces[a])&set(faces[b])
    chir=sum(v[x]@np.cross(Fcent[a],Fcent[b]) for x in shared)
    W[a,b]=np.sign(chir) if abs(chir)>1e-8 else 0
P3=V[:,np.abs(spec-3)<1e-9]@V[:,np.abs(spec-3)<1e-9].T
P5=V[:,np.abs(spec-5)<1e-9]@V[:,np.abs(spec-5)<1e-9].T
assert norm(W@W+15*(P3+P5))<1e-11
Delta=c.DELTA
rho=(P3+Delta**2*P5-1j*Delta*W/np.sqrt(15))/(4*(1+Delta**2))
assert norm(rho-rho.conj().T)<1e-12 and abs(np.trace(rho)-1)<1e-12

# Dual dodecahedral adjacency, find unique 2-link path for each W nonzero.
adj=np.array([[len(set(faces[a])&set(faces[b]))==2 if a!=b else False for b in range(N)] for a in range(N)])
dual_edges=list(zip(*np.where(np.triu(adj,1))))
assert len(dual_edges)==30
edge_idx={tuple(map(int,ab)):i for i,ab in enumerate(dual_edges)}
Adual=np.zeros((N,30))
for i,(a,b) in enumerate(dual_edges):Adual[a,i]=-1;Adual[b,i]=1
assert not any(W[a,b]!=0 for (a,b) in dual_edges)
Wedges=[(a,b) for a in range(N) for b in range(a+1,N) if abs(W[a,b])>0]
assert len(Wedges)==60
assert all(len([k for k in range(N) if adj[a,k] and adj[k,b]])==1 for a,b in Wedges)

def path_vector(a,b):
    mid=next(k for k in range(N) if adj[a,k] and adj[k,b]); q=np.zeros(30)
    for u,vv in [(a,mid),(mid,b)]:
        e=edge_idx[tuple(sorted((u,vv)))];q[e]+=1 if u<vv else -1
    return q
# H_chi[A]= |W| with unique 2-hop Peierls parallel transport; the *unit hopping* choice is an explicit hypothesis.
# J_e = -d/dA_e Tr(rho H[A]) = -2 Im(rho_ab) times path(a->b) with the Hamiltonian convention used here.
Jdual=np.zeros(30)
for a,b in Wedges:
    Jdual+= -2*np.imag(rho[a,b])*path_vector(a,b)
assert norm(Adual@Jdual)<1e-11

# Check source-current value by finite difference of Tr(rho H[A]) directly.
def matter_expect(A):
    H=np.zeros((N,N),complex)
    for a,b in Wedges:
        phase=path_vector(a,b)@A
        H[a,b]=np.exp(1j*phase)
        H[b,a]=np.exp(-1j*phase)
    return np.trace(rho@H).real
rng=np.random.default_rng(10)
testdir=rng.normal(size=30);testdir/=norm(testdir);ee=1e-5
fd=-(matter_expect(ee*testdir)-matter_expect(-ee*testdir))/(2*ee)
# signs: verify numerically by comparison, adjust only if physical sign convention demands
print('peierls derivative check',fd,Jdual@testdir,'norm',norm(Jdual))

# Build dual polyhedral 3D cone over 20 dual vertices and 12 pentagonal faces.
# Native dual shell 20 V / 30 E / 12 pentagonal 2-cells, bulk apex + 12 pyramids.
# 21 V,50 E,42 F,12 volume 3-cells = 125 total polyhedral cells.
# Dual shell face incidence dF: oriented cycles of faces adjacent to an original ico vertex.
edge_columns={tuple(map(int,e)):ix for ix,e in enumerate(dual_edges)}
dF=np.zeros((30,12))
for vi in range(12):
    star=[f for f in range(20) if vi in faces[f]]
    assert len(star)==5
    # traverse 5-cycle with deterministic start and neighbor
    first=min(star); second=min(g for g in star if adj[first,g]); cyc=[first,second]
    while len(cyc)<5:
        cur=cyc[-1]; nxt=[g for g in star if adj[cur,g] and g!=cyc[-2] and g not in cyc]
        assert len(nxt)==1
        cyc.append(nxt[0])
    assert adj[cyc[-1],cyc[0]]
    for a,b in zip(cyc,cyc[1:]+cyc[:1]):
        e=edge_columns[tuple(sorted((a,b)))];dF[e,vi]+= 1 if a<b else -1
assert norm(Adual@dF)<1e-11
# b1dual from shell edges plus radial edges 0->(a+1)
b1d=np.zeros((21,50)); b1d[1:,:30]=Adual
for a in range(20):b1d[0,30+a]=-1;b1d[1+a,30+a]=1
# b2dual: 30 radial triangular faces then 12 outer pentagonal faces
b2d=np.zeros((50,42));b2d[:30,30:]=dF
for e,(a,b) in enumerate(dual_edges):
    b2d[e,e]=1;b2d[30+a,e]=1;b2d[30+b,e]=-1
assert norm(b1d@b2d)<1e-11
b3d=np.zeros((42,12));b3d[:30,:]=-dF;b3d[30:,:]=np.eye(12)
assert norm(b2d@b3d)<1e-11
Kd=b2d@b2d.T
PinD=b2d.T@pinv(Kd,hermitian=True)@b2d
bound=PinD[30:,30:]
LD=dF.T@dF
assert norm(bound-LD@np.linalg.inv(np.eye(12)+LD))<1e-11
# chiral current in dual 3D Maxwell: shell dual edges have Jdual, radial 0
J50=np.r_[Jdual,np.zeros(20)]
assert norm(b1d@J50)<1e-11
g2=4*np.pi/137.035999178195
Abulk=g2*pinv(Kd,hermitian=True)@J50
phases=b2d[:,30:].T@Abulk
print('dual 3D sourced Wilson phases:',phases,'max',max(abs(phases)))
# standard 2D dual shell result to compare
A_shell=g2*pinv(dF@dF.T,hermitian=True)@Jdual
phi2=dF.T@A_shell

results={
 'original_shell_L_spectrum': {str(round(x,9)):int(sum(np.isclose(spec,x))) for x in np.unique(np.round(spec,9))},
 'original_shell_trace_Lplus':trLplus,
 'original_shell_single_face_Lplus_variance':float(trLplus/20),
 'primal_3D_shell_flux_diag':float(np.diag(flux_shell)[0]),
 'primal_3D_flux_spectrum':list(map(float,sorted(np.linalg.eigvalsh(flux_shell)))),
 'primal_bulk_identity_residual':float(norm(flux_shell-expected)),
 'dual_3D_flux_spectrum':list(map(float,sorted(np.linalg.eigvalsh(bound)))),
 'dual_bulk_identity_residual':float(norm(bound-LD@np.linalg.inv(np.eye(12)+LD))),
 'W_second_neighbor_pairs':len(Wedges),
 'unique_two_step_geodesic_pairs':len(Wedges),
 'rho_chiral_trace':float(np.trace(rho).real),
 'chiral_native_current_norm':float(norm(Jdual)),
 'current_divergence_norm':float(norm(Adual@Jdual)),
 'finite_difference_peierls_residual':float(abs(fd-(Jdual@testdir))),
 'conditional_g2':float(g2),
 'dual_3D_photon_sourced_face_phases':list(map(float,phases)),
 'dual_2D_photon_sourced_face_phases':list(map(float,phi2)),
 'sourced_wilson_max_abs':float(np.max(abs(phases))),
 'physical_status':'real 3D bulk photon kernel and native face chiral current conditional on H_face=abs(W); not H64 mass operator'
}
Path(__file__).with_name('results.json').write_text(json.dumps(results,indent=2))
print(json.dumps(results,indent=2))