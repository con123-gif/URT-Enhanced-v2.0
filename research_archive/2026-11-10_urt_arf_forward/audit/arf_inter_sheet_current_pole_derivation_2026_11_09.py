#!/usr/bin/env python3
"""Test unmodified native full 64-D coupled operator with its differentiated face-sheet link.
No ARF residues used; response is computed from original nonlinear face source.
"""
import io, runpy, contextlib, numpy as np, sympy as sp, networkx as nx, itertools
P='/mnt/data/cathedral_audit/'
with contextlib.redirect_stdout(io.StringIO()):
    o=runpy.run_path(P+'cathedral_64_chiral_hybridization_2026_10_29.py')
K=o['K']; B=o['B']; L=o['L_D']; I=sp.eye(20)
P_h=I-B.T*(B*B.T).inv()*B
P3=sp.simplify(P_h*(5*I-L)/2)
P5=sp.simplify(P_h*(L-3*I)/2)
# K_F(a) = [[L+I,-exp(+i a)I],[-exp(-i a)I,L+I]]
# J = dK_F(a)/da at a=0, extended to original coupled 64-dimensional history.
J=sp.zeros(64)
J[24:44,44:64]=-sp.I*I
J[44:64,24:44]=sp.I*I
Jplus=sp.zeros(64,20)
Jplus[24:44,:]=I/sp.sqrt(2)
Jplus[44:64,:]=I/sp.sqrt(2)
Jminus=sp.zeros(64,20)
Jminus[24:44,:]=I/sp.sqrt(2)
Jminus[44:64,:]=-I/sp.sqrt(2)
for p,energy in ((P3,5),(P5,7)):
    A=J*Jplus*p
    assert A==-sp.I*Jminus*p
    assert K*A==energy*A
    assert sp.simplify((A.H*A).trace())==4
    assert A.H*A==p
    print('PASS: original 64D operator, sheet-gauge derivative; sourced eigenenergy',energy,'rank',4)
assert J==J.H
# Ward/contact identity on each hidden two-sheet mode: the complete static
# phase derivative of its eigenvalue is zero (the isolated bond is pure gauge).
a=sp.symbols('a',real=True)
K2=sp.Matrix([[6,-sp.exp(sp.I*a)],[-sp.exp(-sp.I*a),6]])
J2=K2.diff(a).subs(a,0)
W2=K2.diff(a,2).subs(a,0)
eplus=sp.Matrix([1,1])/sp.sqrt(2)
eminus=sp.Matrix([1,-1])/sp.sqrt(2)
contact=(eplus.H*W2*eplus)[0]
mix=(eminus.H*J2*eplus)[0]
assert sp.simplify(contact+2*sp.conjugate(mix)*mix/(5-7))==0
print('PASS: hidden-sector static Ward contact cancels the paramagnetic current contribution')
print('PASS: current J is Hermitian, J=dK/da with canonical link amplitude one')
with contextlib.redirect_stdout(io.StringIO()):
    n=runpy.run_path(P+'cathedral_constructed_joint_dynamics_2026_11_07.py')
geom=n['geom']; ico=geom['icosahedron']; pairs=n['pairs']
axes=np.array([ico['points'][a]/np.linalg.norm(ico['points'][a]) for a,b in pairs])
h3=[];h5=[]
for s in range(64):
    signs=np.array([1 if (s>>i)&1 else -1 for i in range(6)])
    X,Y,Z=signs@axes
    q=np.array([(X*X-Y*Y)/np.sqrt(2),(X*X+Y*Y-2*Z*Z)/np.sqrt(6),np.sqrt(2)*X*Y,np.sqrt(2)*X*Z,np.sqrt(2)*Y*Z])
    a=np.r_[[X,Y,Z]/np.sqrt(2),q/np.sqrt(32/5)]
    v=n['Eglobal']@a
    h_3,h_5=n['hidden_source'](v)
    h3.append(h_3);h5.append(h_5)
h3=np.array(h3);h5=np.array(h5)
# Different original source files label icosahedral vertices/faces differently.
# Identify them by graph isomorphism, never by face-array index.
G_native=nx.Graph()
G_native.add_nodes_from(range(12))
for face in ico['faces']:
    G_native.add_edges_from(itertools.combinations(face,2))
iso=next(nx.algorithms.isomorphism.GraphMatcher(G_native,o['g']).isomorphisms_iter())
coupled_faces={frozenset(tri):j for j,tri in enumerate(o['triangles'])}
native_to_coupled=[coupled_faces[frozenset(iso[x] for x in face)] for face in ico['faces']]
h3_aligned=np.zeros_like(h3);h5_aligned=np.zeros_like(h5)
h3_aligned[:,native_to_coupled]=h3
h5_aligned[:,native_to_coupled]=h5
h3,h5=h3_aligned,h5_aligned
P3_numeric=np.array(P3.evalf(16),dtype=float);P5_numeric=np.array(P5.evalf(16),dtype=float)
assert np.linalg.norm(h3@P3_numeric-h3)<1e-10
assert np.linalg.norm(h5@P5_numeric-h5)<1e-10
print('PASS: original independent face labelings aligned by icosahedron graph isomorphism')
S3=np.mean(np.sum(abs(h3)**2,axis=1));S5=np.mean(np.sum(abs(h5)**2,axis=1))
expected_S3=36+72*np.sqrt(5)/5
assert np.isclose(S3,expected_S3,rtol=0,atol=1e-10)
assert np.isclose(S5,7,rtol=0,atol=1e-10)
print('Original whole-five geometry source 64-history ensemble: S3=',format(S3,'.13f'),'S5=',format(S5,'.13f'))
D=n['Delta'];
# Current response after derivative of the ORIGINAL face-sheet link:
# <J+ (h3+Delta h5), J (K-z)^+ J J+ (h3+Delta h5)> = S3/(5-z)+7 Delta^2/(7-z).
print('Exact current response: Sigma_J(z) = (36+72 sqrt(5)/5)/(5-z) + 7 Delta^2/(7-z)')
print('Delta:',format(D,'.16f'),'residue 5:',format(S3,'.13f'),'residue 7:',format(7*D**2,'.13g'))
numK=np.asarray(K.evalf(16),dtype=complex)
numJ=np.asarray(J.evalf(16),dtype=complex)
numJplus=np.asarray(Jplus.evalf(16),dtype=complex)
for z in (-1.0,0.25,1.0,2.5):
    sumresponse=0.
    for h_3,h_5 in zip(h3,h5):
        f=numJ@numJplus@(h_3+D*h_5)
        sumresponse+=np.vdot(f,np.linalg.solve(numK-z*np.eye(64),f)).real/64
    exact=S3/(5-z)+D**2*S5/(7-z)
    assert abs(sumresponse-exact)<1e-10,(z,sumresponse,exact)
    print('Direct full K64 inverse: z=',z,'response=',format(sumresponse,'.14f'),'analytic=',format(exact,'.14f'),'PASS')
print('All exact and full-original numerical certificates PASSED')
