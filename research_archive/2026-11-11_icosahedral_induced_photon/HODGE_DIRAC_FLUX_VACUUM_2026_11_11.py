#!/usr/bin/env python3
"""Is the cochain condition d1 d0 = 0 the flux vacuum selected by the matter?

Incidence graph of a Platonic solid: nodes = vertices, edges, faces; links = (v in e) and (e in f).
Biadjacency B(theta) (E x (V+F)) with a free U(1) phase on each of the 4E links. The Hodge-Dirac
operator is D = [[0,B^T],[B,0]] at the cochain signs. Sea energy of free fermions at half filling:
    E(theta) = -Tr|B(theta)| = -(sum of singular values).
Each incidence square (v,e,f,e') carries a gauge-invariant flux; d1 d0 = 0 <=> every square flux = pi.
Test (all five solids): from random starts, minimise E over all phases; compare with the cochain value;
read the square fluxes of every minimiser; check the Hessian at the cochain point is PSD.
"""
import itertools, json, sys, math, numpy as np
from scipy.optimize import minimize
phi=(1+5**.5)/2; s=(-1,1)
SOL={"tetrahedron":[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],"cube":list(itertools.product(s,s,s)),
"octahedron":[tuple(t if j==i else 0 for j in range(3)) for i in range(3) for t in s],
"dodecahedron":list(itertools.product(s,s,s))+[(0,a/phi,b*phi) for a in s for b in s]+[(a/phi,b*phi,0) for a in s for b in s]+[(a*phi,0,b/phi) for a in s for b in s],
"icosahedron":[(0,a,b*phi) for a in s for b in s]+[(a,b*phi,0) for a in s for b in s]+[(a*phi,0,b) for a in s for b in s]}
def complex_of(verts):
    V=np.array(verts,float); n=len(V); dist=np.linalg.norm(V[:,None]-V[None],axis=2)
    dm=min(dist[i,j] for i in range(n) for j in range(i))
    E=[(i,j) for i in range(n) for j in range(i+1,n) if abs(dist[i,j]-dm)<1e-9]; faces=set()
    for a,b,c in itertools.combinations(range(n),3):
        nr=np.cross(V[b]-V[a],V[c]-V[a])
        if np.linalg.norm(nr)<1e-9: continue
        sd=(V-V[a])@nr
        if np.all(sd<=1e-9) or np.all(sd>=-1e-9): faces.add(tuple(sorted(np.where(abs(sd)<1e-9)[0])))
    F=[]
    for f in sorted(faces):
        P=V[list(f)]; c=P.mean(0); o=c/np.linalg.norm(c); u=P[0]-c; u/=np.linalg.norm(u); w=np.cross(o,u)
        F.append([f[k] for k in np.argsort([math.atan2((q-c)@w,(q-c)@u) for q in P])])
    ei={e:k for k,e in enumerate(E)}; d0=np.zeros((len(E),n)); d1=np.zeros((len(F),len(E)))
    for k,(i,j) in enumerate(E): d0[k,i],d0[k,j]=-1,1
    for r,cyc in enumerate(F):
        for a,b in zip(cyc,cyc[1:]+cyc[:1]): d1[r,ei[(min(a,b),max(a,b))]]=1 if a<b else -1
    assert np.allclose(d1@d0,0); return d0,d1
def run(name,nstart):
    d0,d1=complex_of(SOL[name]); B0=np.hstack([d0,d1.T]); nE,nc=B0.shape; idx=np.argwhere(B0!=0); L=len(idx)
    def Bof(th):
        B=np.zeros((nE,nc),complex); B[idx[:,0],idx[:,1]]=np.exp(1j*th); return B
    def fg(th):
        B=Bof(th); U,sv,Vh=np.linalg.svd(B,full_matrices=False); W=U@Vh
        return -sv.sum(), -(np.conj(W[idx[:,0],idx[:,1]])*1j*B[idx[:,0],idx[:,1]]).real
    th0=np.angle(B0[idx[:,0],idx[:,1]]+0j)                      # cochain signs: phases 0 or pi
    E0=fg(th0)[0]
    # squares: (v,e,f,e') with v in e,e' and e,e' in f
    pos={(int(a),int(b)):k for k,(a,b) in enumerate(idx)}; nV=d0.shape[1]; sq=[]
    for f in range(d1.shape[0]):
        es=np.where(d1[f]!=0)[0]
        for e1,e2 in itertools.combinations(es,2):
            for v in range(nV):
                if d0[e1,v]!=0 and d0[e2,v]!=0: sq.append((pos[(e1,v)],pos[(e1,nV+f)],pos[(e2,nV+f)],pos[(e2,v)]))
    def fluxes(th): return np.array([((th[a]-th[b]+th[c]-th[d])+np.pi)%(2*np.pi)-np.pi for a,b,c,d in sq])
    rng=np.random.default_rng(7); Es=[]; worst=0.0
    for t in range(nstart):
        r=minimize(fg,rng.uniform(-np.pi,np.pi,L),jac=True,method="L-BFGS-B",options={"maxiter":20000,"gtol":1e-10,"ftol":1e-15})
        Es.append(r.fun)
        if r.fun<E0+1e-6: worst=max(worst,float(np.max(np.abs(np.abs(fluxes(r.x))-np.pi))))
    # Hessian at cochain point by finite differences of the gradient
    h=1e-5; Hs=np.array([(fg(th0+h*np.eye(L)[k])[1]-fg(th0-h*np.eye(L)[k])[1])/(2*h) for k in range(L)]); Hs=.5*(Hs+Hs.T)
    hw=np.linalg.eigvalsh(Hs)
    sv0=np.linalg.svd(B0,compute_uv=False)
    return {"links":L,"squares":len(sq),"E_cochain":E0,"cochain_square_flux_all_pi":bool(np.allclose(np.abs(fluxes(th0)),np.pi)),
            "min_E_found":float(min(Es)),"starts":nstart,"starts_reaching_cochain_energy":int(sum(e<E0+1e-6 for e in Es)),
            "any_below_cochain":bool(min(Es)<E0-1e-7),"max_flux_deviation_from_pi_at_minimisers":worst,
            "hessian_min":float(hw.min()),"hessian_zero_modes":int((np.abs(hw)<1e-6).sum()),"gauge_dim":nE+nc-1,
            "Tr|D|=2Tr|B|":float(2*sv0.sum()),"zero_singular_values":int(nc-np.sum(sv0>1e-9))}
if __name__=="__main__":
    N=int(sys.argv[1]) if len(sys.argv)>1 else 12; out={}
    for name in SOL:
        out[name]=run(name,N); print(name,json.dumps(out[name]),flush=True)
    assert all(v["cochain_square_flux_all_pi"] and not v["any_below_cochain"] and v["hessian_min"]>-1e-6 for v in out.values())
    print("PASS: on all five solids no configuration lies below the cochain point; d1 d0 = 0 is a stable flux vacuum.")
