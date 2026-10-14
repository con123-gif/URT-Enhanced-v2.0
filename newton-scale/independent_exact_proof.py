#!/usr/bin/env python3
"""Independent Newton Scale certificate: five Platonic graph spectra, an
exact five-cube dodecahedral spectral duality, and its icosahedral companion.
No URT, Cathedral, Planck scale, observed physics, or floating-point fitting.
Requires SymPy. Writes results to a JSON file beside this script.
"""
import itertools
import json
from pathlib import Path
import sympy as sp

x=sp.Symbol('x')
I=lambda n: sp.eye(n)
# The five ordinary Platonic vertex-edge graphs.
tetra=sp.ones(4)-I(4)
bits=list(itertools.product((0,1),repeat=3))
cube=sp.Matrix(8,8,lambda i,j: int(sum(a!=b for a,b in zip(bits[i],bits[j]))==1))
# Octahedron as +/- e_i. Every non-opposite distinct pair is adjacent.
octa=sp.Matrix(6,6,lambda i,j:int(i!=j and i//2!=j//2))
ph=(1+sp.sqrt(5))/2
ico_verts=([sp.Matrix([0,a,b*ph]) for a,b in itertools.product((-1,1),repeat=2)]
          +[sp.Matrix([a,b*ph,0]) for a,b in itertools.product((-1,1),repeat=2)]
          +[sp.Matrix([a*ph,0,b]) for a,b in itertools.product((-1,1),repeat=2)])
ico=sp.Matrix(12,12,lambda i,j:int(i!=j and sp.simplify((ico_verts[i]-ico_verts[j]).dot(ico_verts[i]-ico_verts[j])-4)==0))
# Exact combinatorial dodecahedral graph (no geometric floating-point inputs).
neighbors=[
 [8,12,16],[9,12,17],[10,13,16],[11,13,17],
 [8,14,18],[9,14,19],[10,15,18],[11,15,19],
 [0,4,10],[1,5,11],[2,6,8],[3,7,9],
 [0,1,14],[2,3,15],[4,5,12],[6,7,13],
 [0,2,17],[1,3,16],[4,6,19],[5,7,18]
]
dod=sp.zeros(20)
for i,ns in enumerate(neighbors):
    for j in ns:dod[i,j]=1
assert dod==dod.T and ico==ico.T
A={'tetrahedron':tetra,'cube':cube,'octahedron':octa,'icosahedron':ico,'dodecahedron':dod}
deg={'tetrahedron':3,'cube':3,'octahedron':4,'icosahedron':5,'dodecahedron':3}
expected={
 'tetrahedron':x*(x-4)**3,
 'cube':x*(x-2)**3*(x-4)**3*(x-6),
 'octahedron':x*(x-4)**3*(x-6)**2,
 'icosahedron':x*(x-6)**5*(x*x-10*x+20)**3,
 'dodecahedron':x*(x-2)**5*(x-3)**4*(x-5)**4*(x*x-6*x+4)**3
}
L={}
for name,a in A.items():
    assert all(sum(a[i,j] for j in range(a.cols))==deg[name] for i in range(a.rows))
    L[name]=deg[name]*I(a.rows)-a
    assert sp.expand(L[name].charpoly(x).as_expr()-expected[name])==0,name

# The two positive conjugate triplet pairs have scale-free spectral lengths
# ell(lambda) = a/sqrt(lambda), with common a cancelling.
l_i_minus,l_i_plus=5-sp.sqrt(5),5+sp.sqrt(5)
l_d_minus,l_d_plus=3-sp.sqrt(5),3+sp.sqrt(5)
s_i=1/ph
s_d=1/ph**2
assert sp.simplify(l_i_minus/l_i_plus-s_i**2)==0
assert sp.simplify(l_d_minus/l_d_plus-s_d**2)==0
assert sp.simplify(s_i**2-s_d)==0

# An actual order-four 20-vertex permutation induces mod-5 doubling on cubes.
perm=[1,3,0,2,5,7,4,6,10,8,11,9,18,19,16,17,15,14,13,12]
cubes=[
 (0,1,2,3,4,5,6,7),
 (0,7,9,10,13,14,17,18),
 (1,6,8,11,13,14,16,19),
 (2,5,8,11,12,15,17,18),
 (3,4,9,10,12,15,16,19)
]
D=sp.zeros(20)
for j,k in enumerate(perm):D[k,j]=1
assert D**4==I(20) and D.T*D==I(20)
for j,support in enumerate(cubes):
    assert {perm[v] for v in support}==set(cubes[2*j%5])
Ld=L['dodecahedron']
Q=Ld*(Ld-2*I(20))*(Ld-3*I(20))*(Ld-5*I(20))
assert D*Ld*D.T==Ld-Q/2
Pminus=Q*(Ld-l_d_plus*I(20))/40
Pplus=Q*(Ld-l_d_minus*I(20))/40
assert Pminus**2==Pminus and Pplus**2==Pplus
assert sp.trace(Pminus)==3 and sp.trace(Pplus)==3
assert D*Pminus*D.T==Pplus and D*Pplus*D.T==Pminus
# Finite-order permutation cannot itself be a uniform contraction on the graph.
assert D*Ld*D.T != Ld/s_d**2

# Optional, explicitly defined non-physical infinite self-similar extension.
P=I(5)-sp.ones(5)/5
v=[sp.sqrt(sp.Rational(5,4))*P[:,j] for j in range(5)]
assert all(sp.simplify((v[i].T*v[j])[0] - (sp.Integer(1) if i==j else -sp.Rational(1,4)))==0 for i in range(5) for j in range(5))
assert s_d<sp.Rational(1,2)
hausdorff=sp.log(5)/(-sp.log(s_d))
out={
 'name':'Newton Scale — independent Platonic spectral theorem',
 'exact_symbolic_proof':True,
 'full_Platonic_Laplacian_characteristic_polynomials':{k:str(sp.factor(v)) for k,v in expected.items()},
 'icosahedral_spectral_ratio_exact':'(sqrt(5)-1)/2',
 'dodecahedral_Newton_factor_exact':'(3-sqrt(5))/2',
 'exact_identity':'Newton factor = (icosahedral ratio)^2',
 'icosahedral_spectral_ratio':float(sp.N(s_i,17)),
 'Newton_factor':float(sp.N(s_d,17)),
 'dodecahedral_doubling_period':4,
 'dodecahedral_triplet_projector_swap':True,
 'five_branch_conditional_fractal_Hausdorff_dimension':float(sp.N(hausdorff,17)),
 'natural_graph_length_ratio_not_absolute_length':True,
 'URT_or_Cathedral_assumed':False,
 'physical_sub_Planck_law_proved':False
}
path=Path(__file__).with_name('Newton_Scale_Independent_Platonic_Certificate.json')
path.write_text(json.dumps(out,indent=2))
print(json.dumps(out,indent=2))
print('PASS: five graph spectra + exact Platonic Newton theorem + conditional IFS')

