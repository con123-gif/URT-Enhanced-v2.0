#!/usr/bin/env python3
"""How the hidden sectors of the five Platonic solids link (no chosen portal).
Hidden vertex sector of a solid = ker B^T in R^V (vertex fields invisible to every face sum);
hidden face sector = ker B in R^F. B = vertex-face incidence. Canonical inclusions used:
tetrahedra in the cube (2), cubes in the dodecahedron (5), duality (cube-octahedron, dodecahedron-icosahedron)."""
import itertools, json, numpy as np
phi=(1+5**.5)/2; s=(-1.,1.)
cube=np.array(list(itertools.product(s,s,s)))
dode=np.vstack([cube]+[np.array([np.roll([0.,a/phi,b*phi],r) for a in s for b in s]) for r in range(3)])
icos=np.array([np.roll([0.,a,b*phi],r) for a in s for b in s for r in range(3)])
octa=np.array([t*np.eye(3)[i] for i in range(3) for t in s]); tetra=np.array([c for c in cube if np.prod(c)>0])
def faces(P):
    out=set()
    for a,b,c in itertools.combinations(range(len(P)),3):
        n=np.cross(P[b]-P[a],P[c]-P[a])
        if np.linalg.norm(n)<1e-9: continue
        d=(P-P[a])@n
        if np.all(d<=1e-9) or np.all(d>=-1e-9): out.add(tuple(np.where(abs(d)<1e-9)[0]))
    return sorted(out)
def inc(P):
    F=faces(P); B=np.zeros((len(P),len(F)))
    for j,f in enumerate(F): B[list(f),j]=1
    return B,F
def proj_ker(A):                      # projector onto ker A
    u,sv,vt=np.linalg.svd(A); r=int((sv>1e-9).sum()); N=vt[r:].T; return N@N.T
def lap(P):
    d=np.linalg.norm(P[:,None]-P[None],axis=2); A=np.isclose(d,d[d>1e-8].min()).astype(float); return np.diag(A.sum(1))-A
out={}
for name,P in (("tetrahedron",tetra),("cube",cube),("octahedron",octa),("dodecahedron",dode),("icosahedron",icos)):
    B,F=inc(P); out[name]={"V":len(P),"F":len(F),"rank_B":int(np.linalg.matrix_rank(B)),
        "hidden_vertex":int(round(np.trace(proj_ker(B.T)))),"hidden_face":int(round(np.trace(proj_ker(B))))}
# dodecahedron hidden vertex sector and its Laplacian levels
Bd,Fd=inc(dode); Ph=proj_ker(Bd.T); Ld=lap(dode)
lev=np.linalg.eigvalsh(Ph@Ld@Ph); lev=lev[abs(lev)>1e-9]
out["dodeca_hidden_levels"]=sorted(set(np.round(lev,8).tolist())), [int((abs(lev-v)<1e-8).sum()) for v in sorted(set(np.round(lev,8).tolist()))]
P3=Ph@(5*np.eye(20)-Ld)/2; P5=Ph@(Ld-3*np.eye(20))/2
# the five inscribed cubes: 8-subsets of dodecahedron vertices forming a cube (edge = 2 here, diagonal structure)
D=np.linalg.norm(dode[:,None]-dode[None],axis=2); edge=2.0
adj=np.isclose(D,edge); cubes=set()
for v in range(20):
    for trip in itertools.combinations(np.where(adj[v])[0],3):
        X=dode[list(trip)]-dode[v]
        if np.allclose(X@X.T,4*np.eye(3),atol=1e-8):
            pts=[dode[v]+c@X for c in itertools.product((0,1),repeat=3)]
            idx=tuple(sorted(int(np.argmin(np.linalg.norm(dode-p,axis=1))) for p in pts))
            if len(set(idx))==8 and all(np.linalg.norm(dode[i]-p)<1e-8 for i,p in zip([int(np.argmin(np.linalg.norm(dode-p,axis=1))) for p in pts],pts)): cubes.add(idx)
cubes=sorted(cubes); out["inscribed_cubes"]=len(cubes)
Bc,_=inc(cube); S=np.zeros((20,20)); S3=[];S5=[]; inside=[]
for c in cubes:
    Pc=dode[list(c)]; B,_=inc(Pc); pk=proj_ker(B.T); E=np.zeros((20,8)); E[list(c),range(8)]=1; Pj=E@pk@E.T
    S+=Pj; inside.append(float(np.linalg.norm(Pj-Ph@Pj@Ph))); S3.append(float(np.trace(P3@Pj))); S5.append(float(np.trace(P5@Pj)))
out["cube_hidden_inside_dodeca_hidden_error"]=max(inside)
out["sum_of_five_cube_hidden_projectors"]={"minus_(5/2)P_hidden":float(np.linalg.norm(S-2.5*Ph)),"trace":float(np.trace(S)),
    "levels_on_hidden":sorted(set(np.round(np.linalg.eigvalsh(Ph@S@Ph)[-8:],8).tolist()))}
out["each_cube_hidden_split_(tr P3, tr P5)"]=sorted(set((round(a,8),round(b,8)) for a,b in zip(S3,S5)))
out["sum_restricted"]={"on_4_3":sorted(set(np.round(np.linalg.eigvalsh(P3@S@P3)[-4:],8).tolist())),"on_4_5":sorted(set(np.round(np.linalg.eigvalsh(P5@S@P5)[-4:],8).tolist())),"cross_3_5":float(np.linalg.norm(P3@S@P5))}
# the two tetrahedra in the cube: cube hidden vertex sector vs tetrahedral parity
Pk=proj_ker(Bc.T); par=np.prod(cube,axis=1); Lc=lap(cube)
out["cube_hidden_levels"]=sorted(set(np.round([x for x in np.linalg.eigvalsh(Pk@Lc@Pk) if abs(x)>1e-9],8).tolist()))
out["cube_hidden_contains_tetra_parity_vector"]=float(np.linalg.norm(Pk@par-par))
print(json.dumps(out,indent=1))
