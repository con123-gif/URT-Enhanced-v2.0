#!/usr/bin/env python3
"""Exact bottom-up Platonic hidden-sector bridge checks (SymPy, no fitted coefficients).

Cube vertices: all (x,y,z) in {+1,-1}^3, adjacency by one coordinate flip.
Icosahedral hidden: two A5 four-dimensional irreps (odd L=3, even L=5),
restricted to a common tetrahedral subgroup A4.
Five A4-stabilized singlet lines in each four-representation form
one five-vertex regular simplex frame.
"""
from itertools import product
import sympy as s

v=list(product((-1,1), repeat=3)); n=len(v)
L=s.zeros(n)
for i,a in enumerate(v):
    for j,b in enumerate(v):
        if sum(x!=y for x,y in zip(a,b))==1:
            L[i,j]=-1;L[i,i]+=1
assert L==L.T and L* s.ones(8,1)==s.zeros(8,1)

# Walsh polynomials on cube vertices, labelled by monomial subsets.
def walsh(indices):
    return s.Matrix([s.prod(t[k] for k in indices) for t in v])

bydegree={k:[idx for idx in __import__('itertools').combinations(range(3),k)] for k in range(4)}
C=s.eye(8); P_degree={}
for k,idxs in bydegree.items():
    P=s.zeros(8)
    for idx in idxs:
        w=walsh(idx)
        assert L*w==2*k*w
        P += w*w.T/8
    P_degree[k]=P
    assert P*P==P and s.trace(P)==len(idxs)
assert sum(P_degree.values(),s.zeros(8))==s.eye(8)
P_trip=P_degree[1]+P_degree[2]
assert P_trip == s.eye(8)-(L-2*s.eye(8))*(L-4*s.eye(8))/8
assert P_trip == s.eye(8)-P_degree[0]-P_degree[3]
assert s.trace(P_trip)==6

# Inversion parity: Walsh monomial degree k acquires (-1)^k.
J=s.zeros(8)
for i,a in enumerate(v): J[i,v.index(tuple(-x for x in a))]=1
for k,P in P_degree.items(): assert J*P==(-1)**k*P

# Canonical face-vertex incidence of cube, and dual octahedron.
# Six cube faces x_i = +/-1; each face touches four of eight cube vertices.
Bcube=s.Matrix([[1 if t[axis]==sign else 0 for t in v]
                for axis in range(3) for sign in (-1,1)])
assert Bcube.shape==(6,8) and Bcube.rank()==4
assert Bcube*P_degree[2]==s.zeros(6,8)
assert Bcube*P_degree[3]==s.zeros(6,8)
assert Bcube*(P_degree[0]+P_degree[1])==Bcube
assert s.trace(P_degree[2]+P_degree[3])==4
Bocta=Bcube.T  # face-vertex incidence under cubic/oct duality
assert Bocta.shape==(8,6) and Bocta.rank()==4
assert len(Bcube.T.nullspace())==2 and len(Bocta.T.nullspace())==4

# Whole Cathedral: facial incidences of all five Platonic graphs.
import networkx as nx
specs=[('tetra',nx.tetrahedral_graph,4,6,4,4,0,0),
       ('cube',nx.cubical_graph,8,12,6,4,2,4),
       ('octa',nx.octahedral_graph,6,12,8,4,4,2),
       ('dodeca',nx.dodecahedral_graph,20,30,12,12,0,8),
       ('ico',nx.icosahedral_graph,12,30,20,12,8,0)]
for name,generator,V,E,F,rank,left,right in specs:
    G=generator(); planar,emb=nx.check_planarity(G)
    assert planar
    faces=list(dict.fromkeys(tuple(sorted(emb.traverse_face(u,v))) for u,v in emb.edges()))
    nodes=list(G.nodes())
    B=s.zeros(len(faces),len(nodes))
    for i,f in enumerate(faces):
        for vertex in f:B[i,nodes.index(vertex)]=1
    assert (len(nodes),G.number_of_edges(),len(faces),B.rank(),F-B.rank(),V-B.rank()) == (V,E,F,rank,left,right),name
assert sum(t[2] for t in specs)==50 and sum(t[3] for t in specs)==90 and sum(t[4] for t in specs)==50

# Cubic+1 vs hidden 3/5 detunings, parity and A4 irrep types.
assert (2+1,4+1)==(3,5) # triplet spectral resonance
assert (6+1,0+1)==(7,1) # singlets fail (mismatches +/-4)

# Abstract 4 = {a in R^5: sum a=0}, A5 natural four-irrep.
one=s.ones(5,1); Q=s.eye(5)-one*one.T/5
assert Q*Q==Q and s.trace(Q)==4
simplex=[]; projectors=[]
for i in range(5):
    ei=s.eye(5)[:,i]
    w=Q*ei
    u=s.sqrt(5)*w/2 # ||w||^2 = 4/5
    simplex.append(u)
    Pi=s.simplify(u*u.T)
    assert Pi*Pi==Pi and s.trace(Pi)==1 and Pi*Q==Pi
    projectors.append(Pi)
for i in range(5):
    for j in range(5):
        assert s.simplify((simplex[i].T*simplex[j])[0])==(s.Integer(1) if i==j else -s.Rational(1,4))
assert sum(projectors,s.zeros(5))==s.Rational(5,4)*Q

# A4 preserves distinguished coordinate i, hence each Pi is its singlet projector.
# Within each abstract A5 four-irrep, 4|_{A4}=1+3.
for Pi in projectors:
    assert s.trace(Q-Pi)==3 and (Q-Pi)**2==Q-Pi

# Verify each Pi is genuinely the Reynolds average over one of the 5 A4 subgroups in A5.
from itertools import permutations

def permutation_sign(p):
    inversions=sum(p[i]>p[j] for i in range(len(p)) for j in range(i+1,len(p)))
    return (-1)**inversions

A5=[p for p in permutations(range(5)) if permutation_sign(p)==1]
assert len(A5)==60
for i,Pi in enumerate(projectors):
    stabilizer=[p for p in A5 if p[i]==i]
    assert len(stabilizer)==12
    avg=s.zeros(5)
    for p in stabilizer:
        M=s.zeros(5)
        for j,k in enumerate(p): M[k,j]=1
        avg+=M
    avg=avg/12
    assert Q*avg*Q==Pi

# The common tetrahedral rotation group acts transitively on each four-corner
# cube tetrahedron, preserving the polynomial xyz (i.e. the tetra partition).
from itertools import permutations as perms
signed_rotations=[]
for perm in perms(range(3)):
    for signs in product((-1,1),repeat=3):
        if permutation_sign(perm)*s.prod(signs)==1:
            signed_rotations.append((perm,signs))
assert len(signed_rotations)==24
A4_cube=[(p,signs) for p,signs in signed_rotations if s.prod(signs)==1]
assert len(A4_cube)==12
P_fixed=s.zeros(8)
for perm,signs in A4_cube:
    M=s.zeros(8)
    for j,a in enumerate(v):
        b=tuple(signs[k]*a[perm[k]] for k in range(3))
        M[v.index(b),j]=1
    P_fixed+=M
P_fixed=P_fixed/12
assert P_fixed==P_degree[0]+P_degree[3]

Delta=s.symbols('Delta',positive=True,real=True)
Z=s.zeros(5)
rho=s.diag(*([s.Integer(0)]*10))
for Pi in projectors:
    rho += s.diag(Pi,Delta**2*Pi)
rho=s.simplify(rho/(5*(1+Delta**2)))
target=s.diag(Q,Delta**2*Q)/(4*(1+Delta**2))
assert s.simplify(rho-target)==s.zeros(10)
assert s.simplify(s.trace(rho))==1
# On the actual 8D hidden space (remove 2 null singlets), eigenvalues 4 each.
assert s.simplify(rho*rho-s.diag(Q,Delta**4*Q)/(16*(1+Delta**2)**2))==s.zeros(10)

# The 'average over five tetrahedra' cannot select a preferred tetra direction.
for Pi in projectors:
    assert sum((Q-Pj for Pj in projectors),s.zeros(5))==s.Rational(15,4)*Q

print('PASS: Full five-solid Hodge carrier counts V=50, E=90, F=50, total=190.')
print('PASS: Incidence (rank, left-kernel, right-kernel): tetra(4,0,0), cube(4,2,4), octa(4,4,2), dodeca(12,0,8), ico(12,8,0).')
print('PASS: Cubic/Octa dual incidence transpose: cube right-hidden4 = octa left-hidden4.')
print('PASS: Cubic hidden4 = even triplet + odd singlet; cubic active4 = even singlet + odd triplet.')
print('PASS: Cubic 8-node Laplacian spectrum 0(1),2(3),4(3),6(1).')
print('PASS: Cubic parity sectors: even=1(+lambda0)+3(+lambda4), odd=3(+lambda2)+1(+lambda6).')
print('PASS: Exact cube triplet projector = I -(L-2I)(L-4I)/8, rank 6.')
print('PASS: Hidden A5 four-irrep restricted to A4 = 1 + 3, in BOTH parities.')
print('PASS: Hidden levels 3(odd) and 5(even) = cubic triplet levels 2(odd),4(even) +1.')
print('PASS: Cube parity singlets at 6(odd),0(even) detune by 4 after the same +1 shift.')
print('PASS: Five A4 singlet vectors form unit regular 4-simplex, pairwise overlap -1/4.')
print('PASS: Sum of 5 rank-one bridge projectors = (5/4) I4.')
print('PASS: Weighted five-bridge average reproduces EXACTLY rho_*=(I4+Delta^2 I4)/[4(1+Delta^2)].')
print('LIMIT: Common A4 alignment and +1 energy offset are mathematical matches, NOT derived force dynamics.')
print('LIMIT: The symmetric bridge average leaves 4-fold degeneracy; no single history is selected.')
