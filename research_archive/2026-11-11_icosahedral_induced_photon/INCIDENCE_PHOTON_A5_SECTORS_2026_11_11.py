#!/usr/bin/env python3
"""A5 decomposition of the 59 physical incidence-gauge modes of the icosahedron and the kernel K_E in each
isotypic sector. The vector irrep 3 (the one carried by the vertex coordinates) is the candidate photon."""
import sys, os, json, itertools, numpy as np
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import HODGE_DIRAC_FLUX_VACUUM_2026_11_11 as HV
V=np.array(HV.SOL["icosahedron"],float); d0,d1=HV.complex_of(HV.SOL["icosahedron"])
B0=np.hstack([d0,d1.T]); nE,nc=B0.shape; idx=np.argwhere(B0!=0); L=len(idx); nV=12; th0=np.angle(B0[idx[:,0],idx[:,1]]+0j)
def gE(th):
    B=np.zeros((nE,nc),complex); B[idx[:,0],idx[:,1]]=np.exp(1j*th); U,sv,Vh=np.linalg.svd(B,full_matrices=False)
    return -(np.conj((U@Vh)[idx[:,0],idx[:,1]])*1j*B[idx[:,0],idx[:,1]]).real
h=1e-5; HE=np.array([(gE(th0+h*np.eye(L)[k])-gE(th0-h*np.eye(L)[k]))/(2*h) for k in range(L)]); HE=.5*(HE+HE.T)
# rotation group: generate from all rotations mapping the vertex set to itself
def perm_of(R):
    W=V@R.T; p=[int(np.argmin(np.linalg.norm(V-w,axis=1))) for w in W]
    return p if np.allclose(V[p],W,atol=1e-9) else None
rots=[]
for a,b in itertools.permutations(range(12),2):
    if abs(np.linalg.norm(V[a]-V[b])-2)>1e-9: continue
    for c,d in itertools.permutations(range(12),2):
        if abs(np.linalg.norm(V[c]-V[d])-2)>1e-9: continue
        X=np.array([V[a],V[b],np.cross(V[a],V[b])]).T; Y=np.array([V[c],V[d],np.cross(V[c],V[d])]).T
        R=Y@np.linalg.inv(X)
        if np.allclose(R@R.T,np.eye(3),atol=1e-9) and np.linalg.det(R)>0 and perm_of(R) is not None and not any(np.allclose(R,S,atol=1e-9) for S in rots): rots.append(R)
assert len(rots)==60
edges=[tuple(np.where(d0[e]!=0)[0]) for e in range(nE)]; faces=[tuple(sorted(set(v for e in np.where(d1[f]!=0)[0] for v in edges[e]))) for f in range(d1.shape[0])]
ei={frozenset(e):k for k,e in enumerate(edges)}; fi={frozenset(f):k for k,f in enumerate(faces)}; pos={(int(a),int(b)):k for k,(a,b) in enumerate(idx)}
def rep(R):
    p=perm_of(R); P=np.zeros((L,L))
    for k,(e,c) in enumerate(idx):
        e2=ei[frozenset(p[v] for v in edges[e])]
        c2=p[c] if c<nV else nV+fi[frozenset(p[v] for v in faces[c-nV])]
        P[pos[(e2,c2)],k]=1
    return P
Gm=np.zeros((L,nE+nc))
for k,(a,b) in enumerate(idx): Gm[k,a]=1; Gm[k,nE+b]=-1
U,s,_=np.linalg.svd(Gm,full_matrices=True); Pb=U[:,int((s>1e-9).sum()):]; assert Pb.shape[1]==59
reps=[rep(R) for R in rots]
assert max(np.linalg.norm(P@HE-HE@P) for P in reps)<1e-6, "kernel not A5 invariant"
phi=(1+5**.5)/2
def chi(name,R):
    t=np.trace(R); return {"1":1,"3":t,"3p":None,"4":None,"5":None}[name]
out={}
# characters via trace of rotation: chi_3 = tr R ; classes by tr R: 3 (e), -1 (order 2), 0 (order 3), phi and 1-phi (order 5)
tab={"1":lambda t:1,"3":lambda t:t,"3p":lambda t:{3:3,-1:-1,0:0}.get(int(round(t)), None) if abs(t-round(t))<1e-6 else (1-phi if abs(t-phi)<1e-6 else phi),
     "4":lambda t:{3:4,-1:0,0:1}.get(int(round(t))) if abs(t-round(t))<1e-6 else -1,"5":lambda t:{3:5,-1:1,0:-1}.get(int(round(t))) if abs(t-round(t))<1e-6 else 0}
for name,f in tab.items():
    dim=int(round(f(3.0))); Pr=sum(f(np.trace(R))*(Pb.T@P@Pb) for R,P in zip(rots,reps))*dim/60
    mult=int(round(np.trace(Pr)/dim)); 
    if mult==0: out[name]={"multiplicity":0}; continue
    w,Wv=np.linalg.eigh(.5*(Pr+Pr.T)); S=Wv[:,w>0.5]; k=np.linalg.eigvalsh(S.T@(Pb.T@HE@Pb)@S)
    out[name]={"multiplicity":mult,"K_E_levels":sorted(set(np.round(k,6).tolist()))}
print(json.dumps(out,indent=1))
assert sum(v["multiplicity"]*d for v,d in zip(out.values(),(1,3,3,4,5)))==59 and out["1"]["multiplicity"]==0
