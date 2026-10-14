#!/usr/bin/env python3
"""Independent all-Platonic exact incidence and five-cube operator closure.

Dependencies numpy, scipy, sympy. The floats are ONLY used to recover the
regular-solid combinatorics. All stated polynomial identities, hidden
quadratic-map ranks and the 13-state commutants have exact certificates.
"""
from itertools import product, permutations, combinations
import numpy as np
import sympy as S
from scipy.spatial import ConvexHull, cKDTree

phi=(1+np.sqrt(5))/2
tetra=np.array([a for a in product((-1.,1.),repeat=3) if np.prod(a)==1])
cube=np.array(list(product((-1.,1.),repeat=3)))
octa=np.array([s*np.eye(3)[i] for i in range(3) for s in (-1,1)])
icos=np.array([np.roll([0.,a,b*phi],r) for a,b in product((-1.,1.),repeat=2) for r in range(3)])
dode=np.concatenate([cube,np.array([np.roll([0.,a/phi,b*phi],r) for a,b in product((-1.,1.),repeat=2) for r in range(3)])])

def vertex_laplacian(points):
    d=np.linalg.norm(points[:,None]-points,axis=2)
    A=np.isclose(d,d[d>1e-8].min(),atol=1e-7).astype(int)
    return S.Matrix(np.diag(A.sum(axis=1))-A), int(A.sum()//2)

def incidence(points):
    faces=set()
    for plane in ConvexHull(points).equations:
        face=tuple(np.flatnonzero(np.abs(points@plane[:3]+plane[3])<1e-7))
        if len(face)>=3:faces.add(face)
    ordered=sorted(faces)
    B=S.zeros(len(points),len(ordered))
    for j,face in enumerate(ordered):
        for i in face:B[i,j]=1
    return B

print("EXACT INCIDENCE IDENTITIES")
for name,v,poly in [
    ("tetrahedron",tetra,lambda L:9*S.eye(4)-2*L),
    ("cube",cube,lambda L:(L-4*S.eye(8))*(L-6*S.eye(8))/2),
    ("octahedron",octa,lambda L:12*S.eye(6)-2*L),
    ("dodecahedron",dode,lambda L:(L-3*S.eye(20))*(L-5*S.eye(20))),
    ("icosahedron",icos,lambda L:15*S.eye(12)-2*L),
]:
    L,edges=vertex_laplacian(v)
    B=incidence(v)
    assert B*B.T==poly(L),name
    kh=B.T.nullspace()
    kf=B.nullspace()
    def quadratic_rank(basis,F):
        if not basis:return 0
        C=[F*(a.multiply_elementwise(b)) for i,a in enumerate(basis) for b in basis[i:]]
        return S.Matrix.hstack(*C).rank()
    qv=quadratic_rank(kh,B.T);qf=quadratic_rank(kf,B)
    print(name,"V/E/F",len(v),edges,B.cols,"rankB",B.rank(),
          "hidden_vertex",len(kh),"hidden_face",len(kf),
          "quadratic_to_opposite",qv,qf)

# Generate the 60 orientation-preserving icosahedral/dodecahedral rotations
# by mapping an oriented nondegenerate triple to congruent triples.
points=dode;tree=cKDTree(points)
ix=next(a for a in combinations(range(20),3) if abs(np.linalg.det(points[list(a)]))>1)
X=points[list(ix)];gram=X@X.T
rots=[]
for jj in permutations(range(20),3):
    Y=points[list(jj)]
    if np.max(np.abs(Y@Y.T-gram))>1e-7:continue
    R=np.linalg.solve(X,Y)
    if abs(np.linalg.det(R)-1)>1e-7:continue
    if np.max(tree.query(points@R)[0])>1e-7:continue
    if not any(np.max(np.abs(R-Q))<1e-7 for Q in rots):rots.append(R)
assert len(rots)==60
cubes=sorted(set(tuple(sorted(map(int,tree.query(cube@R)[1]))) for R in rots))
assert len(cubes)==5
assert all(len(c)==8 for c in cubes)

# Cubic L eigenbands (4,6) form the 4D cube incidence kernel.
# Their projector is -L(L-7I)(L-2I)/24.
operators=[]
for indices in cubes:
    L,_=vertex_laplacian(points[list(indices)])
    A8=-L*(L-7*S.eye(8))*(L-2*S.eye(8))
    assert A8*A8==24*A8 and S.trace(A8)==96
    A=S.zeros(20)
    for i,u in enumerate(indices):
        for j,v in enumerate(indices):A[u,v]=A8[i,j]
    operators.append(A)
L,_=vertex_laplacian(points)
total=sum(operators,S.zeros(20))
assert total==-2*L*(L**2-7*L+13*S.eye(20))*(L**2-6*L+4*S.eye(20))
assert total.rank()==13
# total/120 has eigen 0 x7, 1/4 x8, 2/5 x5
assert (total*(total-30*S.eye(20))*(total-48*S.eye(20)))==S.zeros(20)
assert S.trace(total)==480
assert S.trace(total*total)==(8*30**2+5*48**2)
assert all(S.trace(A*B)==360 for i,A in enumerate(operators) for B in operators[i+1:])
print("FIVE CUBES: |A5|=60; 5 cubes; mean projector spectrum 0x7,1/4x8,2/5x5")
print("Pairwise Tr(PiPj)=5/8; active dimension 13, trace-normalized mean = 4")

# A complete rank certificate over F101. Because the matrices are
# algebraic over Q(sqrt5), a nonzero modular minor demonstrates a
# nonzero characteristic-zero minor. Upper rank bounds follow from
# identity and antipodal parity, so the ranks are exact.
p=101
columns=list(total.rref()[1]);assert len(columns)==13
W=total[:,columns];rows=list(W.T.rref()[1]);assert len(rows)==13
Wr=np.asarray(W,dtype=np.int64)%p
inverse=np.asarray(W.extract(rows,range(13)).inv_mod(p),dtype=np.int64)%p
row=np.array(rows)
A13=[(inverse@(np.asarray(A,dtype=np.int64)@Wr)[row,:])%p for A in operators]
_,opposite=tree.query(-points)
J=S.zeros(20)
for i,j in enumerate(opposite):J[i,int(j)]=1
assert all(J*A==A*J for A in operators)
J13=(inverse@(np.asarray(J,dtype=np.int64)@Wr)[row,:])%p
assert (int(np.trace(J13))%p)==5  # 9 positive and 4 negative

# x coordinate of the dodecahedral embedding: Q(sqrt5) -> F101,
# using sqrt5=45 (since 45² =5 mod 101), phi=23.
phi_mod=(1+45)*pow(2,-1,p)%p
iphi=pow(phi_mod,-1,p)
x_mod=[int(v[0])%p for v in cube]
for a,b in product((-1,1),repeat=2):
    for r in range(3):
        x_mod.append(int(np.roll([0,a*iphi,b*phi_mod],r)[0])%p)
assert len(x_mod)==20
for i,val in enumerate(points[:,0]):
    if abs(val)<1e-8:expected=0
    elif abs(abs(val)-1)<1e-8:expected=1 if val>0 else -1
    elif abs(abs(val)-phi)<1e-8:expected=phi_mod if val>0 else -phi_mod
    else:expected=iphi if val>0 else -iphi
    assert expected%p==x_mod[i]
full=np.asarray(total,dtype=np.int64)%p
# Natural symmetry-odd geometry coupling: total*diag(x)*total.
X=full@np.diag(x_mod)@full%p
G13=(inverse@(X@Wr)[row,:])%p

def commutator_constraints(g):
    n=13
    out=np.zeros((n*n,n*n),dtype=np.int64)
    for i in range(n):
        for j in range(n):
            for k in range(n):
                out[n*i+j,n*k+j]+=g[i,k]
                out[n*i+j,n*i+k]-=g[k,j]
    return out%p

def mod_rank(parts):
    a=np.concatenate(parts)%p
    current=0
    for k in range(a.shape[1]):
        indices=np.flatnonzero(a[current:,k])
        if not len(indices):continue
        t=current+indices[0]
        if t!=current:a[[t,current]]=a[[current,t]]
        a[current,k:]=a[current,k:]*pow(int(a[current,k]),-1,p)%p
        below=np.flatnonzero(a[current+1:,k])+current+1
        if len(below):
            a[below,k:]=(a[below,k:]-a[below,k,None]*a[current,k:])%p
        current+=1
        if current==a.shape[1]:break
    return current

checks=[commutator_constraints(g) for g in A13]
assert mod_rank(checks)==167 # 2D commutant generated by I, J
assert mod_rank(checks+[commutator_constraints(G13)])==168 # scalar commutant
print("EXACT COMMUTANT: cube algebra dim97 = 9²+4²; geometry-joined algebra dim169 = 13².")
print("This is an internal algebra theorem, not a derived universal spacetime/gauge law.")

# Canonical density produced by an equal mixture of the five maximally
# mixed cube-hidden states: rho=(1/5)*sum(P_j/4)=total/480.
# All of the following are exact symbolic rational identities.
P8=-total*(total-48*S.eye(20))/540
P5=total*(total-30*S.eye(20))/864
assert P8*P8==P8 and P5*P5==P5 and P8*P5==S.zeros(20)
assert S.trace(P8)==8 and S.trace(P5)==5
rho=total/S.Integer(480)
assert rho==P8/16+P5/10
assert S.trace(rho)==1
assert S.trace(rho*P8)==S.Rational(1,2)
assert S.trace(rho*P5)==S.Rational(1,2)
assert S.trace(rho*(S.eye(20)+J)/2)==S.Rational(3,4)
assert S.trace(rho*(S.eye(20)-J)/2)==S.Rational(1,4)
# Entropy = 1/2 ln(160). Each cube state has entropy ln4;
# hence ensemble Holevo information = 1/2 ln(10) nats.
entropy=S.log(160)/2
holevo=S.simplify(entropy-S.log(4))
assert S.simplify(holevo-S.log(10)/2)==0
# The modular log-contrast and off-diagonal density-tangent BKM
# Hessian are completely fixed by 1/16 and 1/10.
mod_gap=S.log(S.Rational(8,5))
bkm=S.Rational(80,3)*mod_gap
print("DENSITY: eig(1/16)x8 + eig(1/10)x5, entropy=",float(entropy))
print("HOLEVO =",float(holevo),"mod gap =",float(mod_gap),"BKM =",float(bkm))
# S=sum Pi=total/24. On the active space S_inv_sqrt is given
# by 2/sqrt5*P8 + 1/sqrt2*P5. The canonical normalized Kraus
# instrument K_j=P_j*S_inv_sqrt is complete and preserves rho.
Sinv=S.Rational(2,1)/S.sqrt(5)*P8+P5/S.sqrt(2)
K=[(A/S.Integer(24))*Sinv for A in operators]
assert S.simplify(sum((k.T*k for k in K),S.zeros(20))-(P8+P5))==S.zeros(20)
assert S.simplify(sum((k*rho*k.T for k in K),S.zeros(20))-rho)==S.zeros(20)
print("EXACT QUANTUM CHANNEL: completeness and stationary rho PASS")

print("ALL CHECKS PASS.")
