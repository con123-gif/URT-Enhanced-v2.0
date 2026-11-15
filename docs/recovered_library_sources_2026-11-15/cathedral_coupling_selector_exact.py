#!/usr/bin/env python3
"""Exact A5 hidden-sector golden bridge; independent symbolic verification.

This proves a representation-theoretic selection rule, NOT physical orbital quantization.
Requires: sympy.  No fitting, external data, or adjustable parameters.
"""
from itertools import permutations, combinations
import sympy as sp

phi = (1 + sp.sqrt(5))/2
X = sp.symbols('x')

def even(p):
    return sum(p[i] > p[j] for i in range(5) for j in range(i+1, 5)) % 2 == 0

def mul(p, q):
    return tuple(p[q[i]] for i in range(5))

def inv(p):
    return tuple(p.index(i) for i in range(5))

A5 = [p for p in permutations(range(5)) if even(p)]
assert len(A5) == 60

# Standard real A5 irrep 4 = {(x1,...,x5): sum(xi)=0}, basis ei-e5.
def four_rep(p):
    return sp.Matrix(4,4,lambda i,j: int(p[j] == i) - int(p[4] == i))

wedge_pairs = list(combinations(range(4), 2))

def wedge2(R):
    return sp.Matrix(6,6, lambda i,j:
        R[wedge_pairs[i][0], wedge_pairs[j][0]] * R[wedge_pairs[i][1], wedge_pairs[j][1]]
        - R[wedge_pairs[i][0], wedge_pairs[j][1]] * R[wedge_pairs[i][1], wedge_pairs[j][0]])

# One conjugacy class of twelve 5-cycles in A5.
g = (1,2,3,4,0)
five_class = {mul(mul(h,g), inv(h)) for h in A5}
assert len(five_class) == 12

# A5 central operator on Lambda^2(4): two 3-dimensional golden sectors.
C = sum((wedge2(four_rep(h)) for h in five_class), sp.zeros(6)) / 4
assert C**2 - C - sp.eye(6) == sp.zeros(6)
assert sp.factor(C.charpoly(X).as_expr()) == (X**2-X-1)**3
assert C.eigenvals() == {(1+sp.sqrt(5))/2:3, (1-sp.sqrt(5))/2:3}
assert sp.expand((6*sp.eye(6)-2*C).charpoly(X).as_expr() - ((X-5)**2-5)**3) == 0
P3 = sp.simplify((C + 1/phi*sp.eye(6))/sp.sqrt(5))
P3p = sp.simplify((phi*sp.eye(6)-C)/sp.sqrt(5))
assert P3.rank() == P3p.rank() == 3
assert sp.simplify(P3**2 - P3) == sp.zeros(6)
assert sp.simplify(P3p**2 - P3p) == sp.zeros(6)
assert sp.simplify(P3*P3p) == sp.zeros(6)
assert sp.simplify(P3+P3p) == sp.eye(6)

# Independent exact Laplacian verification using actual 3D vertex coordinates.
def laplacian(vertices, distance_sq):
    n = len(vertices)
    A = sp.zeros(n)
    for i in range(n):
        for j in range(i):
            d2 = sp.simplify(sum((vertices[i][k]-vertices[j][k])**2 for k in range(3)))
            if sp.simplify(d2-distance_sq) == 0:
                A[i,j] = A[j,i] = 1
    return sp.diag(*[sum(A[i,j] for j in range(n)) for i in range(n)]) - A

cubo = []
for zero_axis in range(3):
    others = [i for i in range(3) if i != zero_axis]
    for a in (-1,1):
        for b in (-1,1):
            v = [sp.S(0)]*3
            v[others[0]],v[others[1]] = sp.S(a),sp.S(b)
            cubo.append(tuple(v))

ico = []
for a in (-1,1):
    for b in (-1,1):
        ico.extend([(sp.S(0),sp.S(a),b*phi),(sp.S(a),b*phi,sp.S(0)),(b*phi,sp.S(0),sp.S(a))])

L_c = laplacian(cubo, sp.S(2))
L_i = laplacian(ico, sp.S(4))
assert len(cubo) == len(ico) == 12
assert all(L_c[i,i] == 4 for i in range(12))
assert all(L_i[i,i] == 5 for i in range(12))
assert sp.factor(L_c.charpoly(X).as_expr()) == X*(X-2)**3*(X-4)**3*(X-6)**5
assert sp.expand(L_i.charpoly(X).as_expr()-X*(X-6)**5*((X-5)**2-5)**3) == 0

# Construct actual icosahedron face/vertex incidence and dual dodecahedral Laplacian.
faces = [t for t in combinations(range(12),3) if all(L_i[a,b] == -1 for a,b in combinations(t,2))]
assert len(faces) == 20
B = sp.Matrix(20,12,lambda f,v: int(v in faces[f]))
assert B.rank() == 12 and len(B.T.nullspace()) == 8
A_d = sp.Matrix(20,20,lambda i,j: int(i != j and len(set(faces[i]) & set(faces[j])) == 2))
assert all(sum(A_d[i,j] for j in range(20)) == 3 for i in range(20))
L_d = 3*sp.eye(20)-A_d
assert sp.expand(L_d.charpoly(X).as_expr()-X*(X-2)**5*(X-3)**4*(X-5)**4*((X-3)**2-5)**3) == 0

# The face-vertex incidence kernel is precisely the 3 and 5 eigenspaces.
H3 = (L_d-3*sp.eye(20)).nullspace()
H5 = (L_d-5*sp.eye(20)).nullspace()
assert len(H3) == len(H5) == 4
assert all(B.T*v == sp.zeros(12,1) for v in H3+H5)

# Antipodal face inversion: H3 is odd, H5 is even.
# Ico vertices have exact antipodes; opposite faces use opposite vertices.
opposite_v = {i: next(j for j in range(12) if all(sp.simplify(ico[i][k]+ico[j][k]) == 0 for k in range(3))) for i in range(12)}
face_index = {frozenset(t): i for i,t in enumerate(faces)}
opposite_f = {i:face_index[frozenset(opposite_v[v] for v in t)] for i,t in enumerate(faces)}
J = sp.Matrix(20,20,lambda i,j: int(j == opposite_f[i]))
assert J*J == sp.eye(20) and J*L_d == L_d*J
assert all(J*v == -v for v in H3)
assert all(J*v == v for v in H5)

# A5 irreducible character product: 4 tensor 4 = 1+3+3'+4+5.
phi_conj = 1-phi
sizes = (1,15,20,12,12)
chars = {
    '1':(1,1,1,1,1),
    '3':(3,-1,0,phi,phi_conj),
    '3p':(3,-1,0,phi_conj,phi),
    '4':(4,0,1,-1,-1),
    '5':(5,1,-1,0,0),
}
for label,character in chars.items():
    multiplicity = sp.simplify(sum(sizes[i]*chars['4'][i]**2*character[i] for i in range(5))/sp.Integer(60))
    assert multiplicity == 1, (label,multiplicity)

# Identify spectral subspaces abstractly, not by a claimed canonical vertex map.
# First 3-sector cubo(2) -> ico(5-sqrt(5)): shift 2*phi^(-2)
# Second 3-sector cubo(4) -> ico(5+sqrt(5)): shift 2*phi
assert sp.simplify(2 + 2/phi**2 - (5-sp.sqrt(5))) == 0
assert sp.simplify(4 + 2*phi - (5+sp.sqrt(5))) == 0

print('PASS: |A5|=60, one order-5 conjugacy class=12.')
print('PASS: Lambda^2(4)=3+3\', class sum obeys C^2-C-I=0.')
print('PASS: eigenvalues phi and -phi^-1, each of multiplicity 3.')
print('PASS: 6I-2C on hidden Lambda^2(4) exactly reproduces visible icosahedral 3+3p spectrum.')
print('PASS: cuboctahedral and icosahedral Laplacian spectra from explicit vertices.')
print('PASS: incidence rank 12; ker(B^T)=4^- (L=3) + 4^+ (L=5) via exact face parity.')
print("PASS: A5 character product 4 tensor 4 = 1+3+3p+4+5")
print('PASS: spectral shifts on the three-dimensional branches = 2*phi^-2 and 2*phi.')
print('Selection rule (conditional on hidden parities):')
print('4^- tensor 4^+ -> 3^- + 3\'^- + 1^- + 4^- + 5^-;')
print('visible 12 = 1^+ + 3^- + 3\'^- + 5^+.')
print('Thus two independent A5 x parity-equivariant maps into visible 3+3\'.')
print('This demonstrates allowed coupling, not its physical existence or fixed amplitude.')

# ---------------------------------------------------------------------------
# NEW 2026-11-11 RESULT: geometrically local bilinear hidden-sector coupling.
# The Hadamard product denotes a pointwise interaction of two face fields.
# It is not a uniquely derived physical interaction; it is a natural local ansatz.
# ---------------------------------------------------------------------------
V3 = sp.Matrix.hstack(*H3)
V5 = sp.Matrix.hstack(*H5)
P_h3 = V3*(V3.T*V3).inv()*V3.T
P_h5 = V5*(V5.T*V5).inv()*V5.T
assert P_h3**2 == P_h3 and P_h5**2 == P_h5
assert P_h3*P_h5 == sp.zeros(20)
assert all(B.T*u == sp.zeros(12,1) for u in H3+H5)

# Explicit bilinear map F(u,v) = B^T (u Hadamard v) from H3 x H5 to V12.
# A basis of the 16-dimensional tensor product produces exactly W3+W3'.
F_columns = [B.T*(u.multiply_elementwise(v)) for u in H3 for v in H5]
F_raw = sp.Matrix.hstack(*F_columns)
assert F_raw.rank() == 6
W_polynomial = (L_i-(5-sp.sqrt(5))*sp.eye(12))*(L_i-(5+sp.sqrt(5))*sp.eye(12))
assert W_polynomial*F_raw == sp.zeros(12,16)
assert ((L_i-(5+sp.sqrt(5))*sp.eye(12))*F_raw).rank() == 3
assert ((L_i-(5-sp.sqrt(5))*sp.eye(12))*F_raw).rank() == 3

# Basis-independent F F^T from orthonormal bases of hidden eigenspaces.
# This equals the Schur/Hadamard product of their orthogonal projectors.
T_hidden = B.T*(P_h3.multiply_elementwise(P_h5))*B
s_plus = (5+2*sp.sqrt(5))/15
s_minus = (5-2*sp.sqrt(5))/15
assert T_hidden.eigenvals() == {s_plus:3, s_minus:3, sp.S(0):6}
assert T_hidden*L_i == L_i*T_hidden
assert sp.trace(T_hidden) == 2
assert sp.simplify(s_plus/s_minus-phi**6) == 0
assert sp.simplify(s_plus/s_minus-(2+sp.sqrt(5))**2) == 0

# Independent exact resonance selector for the old N-throat relative shift +2.
# On the incidence-accessible 12-dimensional space, the detuning operator
# kills only the icosahedral W3+W3' sectors; it doesn't act on hidden zero modes.
Detuning = L_i*B.T - B.T*(L_d+2*sp.eye(20))
DDt = Detuning*Detuning.T
assert DDt.eigenvals() == {sp.S(60):1, sp.S(12):5, sp.S(0):6}
P_res = (sp.eye(12)-DDt/60)*(sp.eye(12)-DDt/12)
assert P_res**2 == P_res and P_res.rank() == 6
assert P_res*F_raw == F_raw
assert T_hidden == P_res*(B.T*B)*P_res/15
assert B.T*B == 15*sp.eye(12)-2*L_i
assert sp.trace(T_hidden/2) == 1

print('\nPASS: LOCAL HIDDEN COUPLING SELECTOR')
print('  B^T h3 = B^T h5 = 0, but B^T(h3 Hadamard h5) spans 6 visible dimensions.')
print("  Exactly W3+W3' are selected, both with rank 3.")
print('  T_hidden has eigenvalues (5+2 sqrt5)/15 (x3), (5-2 sqrt5)/15 (x3), 0 (x6).')
print('  Exact relative transfer intensity ratio = phi^6; singular-amplitude ratio = phi^3.')
print('  Detuning shift +2 selects the same W3+W3\' via projector P_res.')
print('  Identity: T_hidden = (1/15) P_res (15 I - 2 L_ico) P_res.')
print('LIMIT: physical force strengths and dynamical laws have NOT been derived.')
