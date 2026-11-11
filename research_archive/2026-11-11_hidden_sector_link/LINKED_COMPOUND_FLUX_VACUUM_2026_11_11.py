#!/usr/bin/env python3
"""Linked compound: dodecahedron + its 5 inscribed cubes + their 10 inscribed tetrahedra, all sharing the
dodecahedron's 20 vertices. One bipartite incidence graph: (all edges) x (20 shared vertices + all faces),
free U(1) phase on every incidence. Does the half-filled sea still select d1 d0 = 0 on every member
(flux pi through every incidence square)? The graph is not planar, so Lieb's theorem does not decide this."""
import sys, os, json, itertools, numpy as np
from scipy.optimize import minimize
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import io, contextlib
with contextlib.redirect_stdout(io.StringIO()):
    import HIDDEN_SECTOR_LINK_2026_11_11 as HL
dode=HL.dode
def member(vidx):
    P=dode[list(vidx)]; F=HL.faces(P); d=np.linalg.norm(P[:,None]-P[None],axis=2); dm=d[d>1e-8].min()
    E=[(i,j) for i in range(len(P)) for j in range(i+1,len(P)) if abs(d[i,j]-dm)<1e-8]
    return [(vidx[i],vidx[j]) for i,j in E],[tuple(vidx[i] for i in f) for f in F]
members=[("dodecahedron",tuple(range(20)))]
for c in HL.cubes:
    members.append(("cube",c))
# tetrahedra: the two 4-subsets of each cube with all pairwise distances equal to the cube's face diagonal
for c in HL.cubes:
    for t in itertools.combinations(c,4):
        D=[np.linalg.norm(dode[a]-dode[b]) for a,b in itertools.combinations(t,2)]
        if np.allclose(D,2*np.sqrt(2),atol=1e-8): members.append(("tetrahedron",t))
assert [m[0] for m in members].count("cube")==5 and [m[0] for m in members].count("tetrahedron")==10
edges=[];faces=[];links=[];squares=[]
for name,vidx in members:
    E,F=member(vidx); e0=len(edges); f0=len(faces); edges+=E; faces+=F
    for k,(a,b) in enumerate(E): links+= [(e0+k,a),(e0+k,b)]
    for j,f in enumerate(F):
        fe=[k for k,(a,b) in enumerate(E) if a in f and b in f]
        # edges of the face: pairs in f that are edges of this member
        for k in fe: links.append((e0+k,20+f0+j))
        for k1,k2 in itertools.combinations(fe,2):
            sh=set(E[k1])&set(E[k2])
            for v in sh: squares.append(((e0+k1,v),(e0+k1,20+f0+j),(e0+k2,20+f0+j),(e0+k2,v)))
nE=len(edges); nc=20+len(faces); L=len(links); pos={l:i for i,l in enumerate(links)}; idx=np.array(links)
sq=np.array([[pos[x] for x in s] for s in squares])
def fg(th):
    B=np.zeros((nE,nc),complex); B[idx[:,0],idx[:,1]]=np.exp(1j*th); U,sv,Vh=np.linalg.svd(B,full_matrices=False)
    return -sv.sum(), -(np.conj((U@Vh)[idx[:,0],idx[:,1]])*1j*B[idx[:,0],idx[:,1]]).real
def flux(th): f=th[sq[:,0]]-th[sq[:,1]]+th[sq[:,2]]-th[sq[:,3]]; return (f+np.pi)%(2*np.pi)-np.pi
# a cochain point: solve for phases in {0,pi} with every square flux = pi (linear system over GF(2))
A=np.zeros((len(sq),L),int)
for r,s in enumerate(sq): A[r,s]=1
M=np.hstack([A%2,np.ones((len(sq),1),int)]); row=0; piv=[]
for col in range(L):
    p=next((r for r in range(row,len(M)) if M[r,col]),None)
    if p is None: continue
    M[[row,p]]=M[[p,row]]
    for r in range(len(M)):
        if r!=row and M[r,col]: M[r]^=M[row]
    piv.append(col); row+=1
consistent=not any(M[r,:L].sum()==0 and M[r,L] for r in range(len(M)))
x=np.zeros(L,int)
for r,c in enumerate(piv): x[c]=M[r,L]
th0=np.pi*x; E0=fg(th0)[0]
out={"edges":nE,"vertices":20,"faces":len(faces),"incidences":L,"squares":len(sq),"cochain_point_exists":bool(consistent),
     "cochain_all_fluxes_pi":bool(np.allclose(np.abs(flux(th0)),np.pi)),"E_cochain":float(E0)}
rng=np.random.default_rng(11); res=[]
for t in range(int(sys.argv[1]) if len(sys.argv)>1 else 8):
    r=minimize(fg,rng.uniform(-np.pi,np.pi,L),jac=True,method="L-BFGS-B",options={"maxiter":30000,"gtol":1e-9,"ftol":1e-15})
    fl=np.abs(flux(r.x)); res.append((float(r.fun),float(np.mean(np.abs(fl-np.pi)<1e-4)),float(np.max(np.abs(fl-np.pi)))))
out["minima_found(E, fraction of squares at pi, max deviation)"]=sorted(res)
out["lowest_found_minus_cochain"]=float(min(r[0] for r in res)-E0)
r=minimize(fg,th0+1e-3*rng.standard_normal(L),jac=True,method="L-BFGS-B",options={"maxiter":30000,"gtol":1e-10,"ftol":1e-15})
out["relax_from_cochain"]={"E_minus_cochain":float(r.fun-E0),"max_flux_deviation_from_pi":float(np.max(np.abs(np.abs(flux(r.x))-np.pi)))}
print(json.dumps(out,indent=1))
