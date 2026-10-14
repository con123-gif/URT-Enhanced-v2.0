#!/usr/bin/env python3
"""Independent exact rational Newton–Platonic five-cube spectral-filter theorem.

Reconstructs 20-vertex dodecahedral graph and five embedded cube
vertex/face incidence matrices. Requires SymPy; no URT/Cathedral inputs.
"""
import sympy as S
nb=[
[8,12,16],[9,12,17],[10,13,16],[11,13,17],
[8,14,18],[9,14,19],[10,15,18],[11,15,19],
[0,4,10],[1,5,11],[2,6,8],[3,7,9],
[0,1,14],[2,3,15],[4,5,12],[6,7,13],
[0,2,17],[1,3,16],[4,6,19],[5,7,18]]
faces=[
[(0,1,2,3),(0,1,4,5),(0,2,4,6),(1,3,5,7),(2,3,6,7),(4,5,6,7)],
[(0,9,14,17),(0,10,13,17),(0,10,14,18),(7,9,13,17),(7,9,14,18),(7,10,13,18)],
[(1,8,14,16),(1,11,13,16),(1,11,14,19),(6,8,13,16),(6,8,14,19),(6,11,13,19)],
[(2,8,12,17),(2,8,15,18),(2,11,15,17),(5,8,12,18),(5,11,12,17),(5,11,15,18)],
[(3,9,12,16),(3,9,15,19),(3,10,15,16),(4,9,12,19),(4,10,12,16),(4,10,15,19)]
]
A=S.zeros(20)
for i,neighbors in enumerate(nb):
    assert len(neighbors)==3
    for j in neighbors: A[i,j]=1
assert A==A.T
L=3*S.eye(20)-A
projectors=[];M=S.zeros(20,5)
for j,ff in enumerate(faces):
    verts=sorted({v for face in ff for v in face})
    assert len(verts)==8 and len(ff)==6
    for v in verts:M[v,j]=1
    C=S.zeros(8,6);pos={v:i for i,v in enumerate(verts)}
    for k,face in enumerate(ff):
        for v in face:C[pos[v],k]=1
    H=S.Matrix.hstack(*C.T.nullspace())
    assert H.shape==(8,4)
    plocal=H*(H.T*H).inv()*H.T
    p=S.zeros(20)
    for u,v in enumerate(verts):
        for w,t in enumerate(verts):p[v,t]=plocal[u,w]
    assert p*p==p and p.T==p and p.trace()==4
    projectors.append(p)
Pm=sum(projectors,S.zeros(20))/5
assert M.T*M==6*S.eye(5)+2*S.ones(5)
assert M*S.ones(5,1)==2*S.ones(20,1)
assert A*M==2*(S.ones(20,5)-M)
assert L*M==5*M-2*S.ones(20,5)
x=S.symbols("x")
f=-x*(x*x-7*x+13)*(x*x-6*x+4)/60
pol=S.Poly(f,x);T=S.eye(20);F=S.zeros(20)
for k in range(6):
    F+=pol.nth(k)*T
    T=T*L
assert F==Pm
assert Pm.eigenvals()=={S.Rational(0):7,S.Rational(1,4):8,S.Rational(2,5):5}
assert all((projectors[j]*projectors[k]).trace()==S.Rational(5,8)
           for j in range(5) for k in range(j+1,5))
Lc=16*S.eye(20)-M*M.T  # weighted cube-overlap graph
assert L*Lc==Lc*L
joint=S.factor((L+Lc).charpoly(x).as_expr())
assert joint==x*(x-15)**4*(x-18)**5*(x-19)**4*(x*x-38*x+356)**3
perm=[1,3,0,2,5,7,4,6,10,8,11,9,18,19,16,17,15,14,13,12]
D=S.zeros(20)
for j,i in enumerate(perm):D[i,j]=1
assert D**4==S.eye(20) and D*Pm*D.T==Pm
Q=D*L*D.T-L
assert Q.rank()==6 and S.trace(Q*Q)==120
assert Q==-L*(L-2*S.eye(20))*(L-3*S.eye(20))*(L-5*S.eye(20))/2
print("EXACT PASS: five cube face-incidence kernel spectral-filter theorem")
print("Average projector =",S.factor(f))
print("Spectrum:",Pm.eigenvals())
print("Pair projector overlaps: 5/8")
print("Joint weighted graph polynomial:",joint)
print("Doubling spectral defect: rank 6, norm squared 120")


# ----------------------------------------------------------------------
# Independent UV field certificate: canonical spectral filters only.
# p=2 ultraviolet moment in the graph-Laplacian length convention.
# ----------------------------------------------------------------------
Pzero=S.ones(20,20)/20
Pnon=S.eye(20)-Pzero
assert L*Pzero==S.zeros(20) and Pm*Pzero==S.zeros(20)
Qdiff=D*L*D.T-L
G=(Qdiff*Qdiff)/120
assert G.eigenvals()=={S.Rational(1,6):6,S.Integer(0):14}
assert Pm*G==S.zeros(20) and G*G==G/6
s=(3-S.sqrt(5))/2
s2=S.simplify(s*s)
# Minimal positive integer powers in the polynomial filter class
# K=Pbar**m + G**r subject to rho(K)<s**2.
assert S.Rational(2,5)**2>s2
assert S.Rational(2,5)**3<s2
assert S.Rational(1,6)>s2
assert S.Rational(1,6)**2<s2
Knew=Pm**3+G**2
assert Knew.eigenvals()=={
  S.Rational(8,125):5,S.Rational(1,64):8,
  S.Rational(1,36):6,S.Integer(0):1}
assert Knew*L==L*Knew and Knew*Pzero==S.zeros(20)
assert S.Rational(8,125)<s2
# Branch overlap from the original five cube projectors: no
# arbitrary 1/5 weights inserted; Tr(R5)=1 is geometric.
R5=S.Matrix(5,5,lambda i,j:S.trace(projectors[i]*projectors[j])/20)
assert R5==S.Rational(27,160)*S.eye(5)+S.ones(5)/32
assert R5.eigenvals()=={S.Rational(13,40):1,S.Rational(27,160):4}
assert R5.trace()==1
# At each scale level n: C_n=R5^(tensor n) tensor (Knew)^n.
# On n=0 use Pnon. Positive trace class:
# sum_n Tr(C_n)=sum_(nonconstant eigenvalues k)1/(1-k).
levels=[(S.Rational(8,125),5),
        (S.Rational(1,64),8),
        (S.Rational(1,36),6)]
finite_trace=S.factor(sum(m/(1-k) for k,m in levels))
assert finite_trace==S.Rational(26809,1365)
# Finite p=2 momentum moment in the Newton length scale s^n.
M2=S.simplify(sum(m/(1-k/s2) for k,m in levels))
# Actual expected Dirichlet energy: Tr(ell^-2 L C)
# L eigenvalues per cube-hidden quartet: 3 and 5 (4 each);
# fiveplet 2 (5); two golden triplets 3±sqrt5 (3 each).
E2=S.simplify(32/(1-S.Rational(1,64)/s2)
  +10/(1-S.Rational(8,125)/s2)
  +18/(1-S.Rational(1,36)/s2))
assert finite_trace>0 and M2>0 and E2>0
# Independent exact level-2 tensor audit.
C2=S.kronecker_product(S.kronecker_product(R5,R5),Knew*Knew)
assert C2.shape==(500,500)
assert C2.trace()==S.trace(Knew*Knew)
print("NEWTON ALL-LEVEL EXACT THEOREM PASS")
print("All 19 nonconstant modes active; UV-minimal polynomial degrees 3 and 2")
print("K spectrum",Knew.eigenvals())
print("Infinite covariance trace",finite_trace,"=",S.N(finite_trace,16))
print("Quadratic momentum moment",S.N(M2,16))
print("Expected Laplacian energy",S.N(E2,16))
print("UV growth rho(K)/s^2",S.N(S.Rational(8,125)/s2,16))
print("No physical sub-Planck measurement or originality priority is proved.")
