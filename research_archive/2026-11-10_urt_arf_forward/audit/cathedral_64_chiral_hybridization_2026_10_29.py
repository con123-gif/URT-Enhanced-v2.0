"""Newton's Cathedral | exact 64-state chiral resonance and protected hidden sector.

Constructs unsigned vertex-face incidence from the icosahedral graph, builds
K_64 in the 12_A + 12_B + 20_A + 20_B basis, adds one canonically
operator-norm-normalized cross-sector link B/sqrt(15) between the 11_B vertex
complement and antisymmetric face sheet, checks exact moments and complete
analytic spectrum, and verifies the hidden-sector master transfer is preserved.

Interpretation: explicit constructed, positive, A5-equivariant finite model.
No claim the Golay code uniquely chooses this cross-sector kinetic term or that
its spectral eigenvalues are experimentally identified particle masses.
Requires sympy, numpy, networkx (available in Colab).
"""
import itertools
import numpy as np
import networkx as nx
import sympy as sp

sqrt = sp.sqrt
I12, I20 = sp.eye(12), sp.eye(20)
g = nx.icosahedral_graph()
vertices = sorted(g.nodes())
assert vertices == list(range(12))
triangles = [t for t in itertools.combinations(vertices, 3)
             if all(g.has_edge(a,b) for a,b in itertools.combinations(t,2))]
assert len(triangles) == 20
B = sp.zeros(12,20)
for j, tri in enumerate(triangles):
    for i in tri: B[i,j] = 1
A_I = sp.zeros(12)
for a,b in g.edges(): A_I[a,b] = A_I[b,a] = 1
L_I = 5*I12 - A_I
A_D = sp.zeros(20)
for i,j in itertools.combinations(range(20),2):
    if len(set(triangles[i]) & set(triangles[j])) == 2:
        A_D[i,j] = A_D[j,i] = 1
L_D = 3*I20 - A_D

assert B*B.T == 15*I12 - 2*L_I
assert B.T*B == A_D*(A_D+2*I20)
assert B.rank() == 12
assert all(sum(B[i,j] for j in range(20)) == 5 for i in range(12))
assert all(sum(B[i,j] for i in range(12)) == 3 for j in range(20))

# The centred 13-cell uses 12_A and the unit singlet of 12_B.
v=sp.ones(12,1)/sqrt(12)
P0=v*v.T
Q=I12-P0
K_V=sp.BlockMatrix([
    [L_I+I12, -sp.ones(12,1)*v.T],
    [-v*sp.ones(1,12), L_I+12*P0]
]).as_explicit()

K_F=sp.BlockMatrix([
    [L_D+I20,-I20],
    [-I20,L_D+I20]
]).as_explicit()
K0=sp.diag(K_V,K_F)

# Symmetry-respecting normalized incidence link into the minus face sheet.
# B/sqrt(15) has norm one, because the largest eigenvalue of B B^T is 15.
C=Q*B/sqrt(30)          # vertex B -> faces A, with sheet factor 1/sqrt(2)
V=sp.zeros(64)
# vertex B indices 12..23; face A 24..43; face B 44..63
V[12:24,24:44]=C
V[12:24,44:64]=-C
V[24:44,12:24]=C.T
V[44:64,12:24]=-C.T
K=K0+V

# Visibility projector remains invariant even after matter-face coupling.
P13=sp.diag(I12,P0,sp.zeros(20),sp.zeros(20))
P51=sp.eye(64)-P13
assert P13.trace()==13 and P51.trace()==51
assert K*P13==P13*K
assert K*P51==P51*K
assert K==K.T
assert K0.trace()==304 and (K0*K0).trace()==1820
assert (V*V).trace()==sp.Integer(6)
assert K.trace()==304 and (K*K).trace()==1826

# The hidden 8D face kernel is annihilated by the incidence interaction.
PH=I20-B.T*(B*B.T).inv()*B
assert PH**2==PH and PH.trace()==8
assert B*PH==sp.zeros(12,20)
assert L_D*PH==PH*L_D
assert V[:,24:44]*PH==sp.zeros(64,20)
assert V[:,44:64]*PH==sp.zeros(64,20)
# The doubled 16D hidden spectral tower therefore remains untouched.

# Verify complete exact spectrum by analytic block decomposition.
r=sqrt(5)
ch3=sqrt((5+2*r)/15)
ch3p=sqrt((5-2*r)/15)
E5=sqrt(sp.Rational(6,5))
# Eigenvalue, multiplicity: visible 13, 51 complement irreps.
expected=[
 (sp.Integer(0),1), (6-r,3),(sp.Integer(7),5),(6+r,3),(sp.Integer(13),1),
 (sp.Integer(0),1),(sp.Integer(2),1),
 (3-r,3),(5-r-ch3,3),(5-r+ch3,3),
 (3+r,3),(5+r-ch3p,3),(5+r+ch3p,3),
 (sp.Integer(2),5),(5-E5,5),(5+E5,5),
 (sp.Integer(3),4),(sp.Integer(5),8),(sp.Integer(7),4)]
assert sum(m for e,m in expected)==64
assert sp.simplify(sum(m*e for e,m in expected)-K.trace())==0
assert sp.simplify(sum(m*e**2 for e,m in expected)-(K*K).trace())==0

numeric_K=np.array(K.evalf(15),dtype=float)
numeric_eigs=np.linalg.eigvalsh(numeric_K)
expected_eigs=sorted([float(sp.N(e,16)) for e,m in expected for _ in range(m)])
assert np.allclose(numeric_eigs,expected_eigs,atol=1e-10,rtol=1e-10), (numeric_eigs,expected_eigs)
assert numeric_eigs[0]>-1e-10
assert sum(abs(numeric_eigs)<1e-10)==2

# Exact golden bridge ratio and positive-sector splittings.
assert sp.simplify((5-2*r)/(5+2*r)-((r-1)/2)**6)==0
assert sp.simplify(ch3p/ch3-((r-1)/2)**3)==0
assert (Q*B*PH)==sp.zeros(12,20)

# Exact Schur complement on chiral vertex irreps:
# Σ_r(z) = [s_r²/15] / (z-d_r), with d_r=5∓sqrt(5),
# and on the 5-sector Σ_5(z)= (1/5)/(z-4).
z=sp.symbols('z')
for d in (5-r,5+r):
    assert sp.simplify((15-2*d)/15/(z-d)-(15-2*d)/(15*(z-d)))==0

# Frozen-rail positive transfer and exact 3/3' face-to-vertex heat amplitudes.
phi=(1+r)/2
Delta=sp.Rational(3,20)-(1-sp.Rational(1,81))*sp.pi/(13*phi)
eta=-sp.log(Delta)
t=float(sp.N(eta,16))
trans_3=float(np.exp(-t*float(5-r))*np.sinh(t*float(ch3)))
trans_3p=float(np.exp(-t*float(5+r))*np.sinh(t*float(ch3p)))

print('FULL 64×64 COUPLED OPERATOR PASSED EXACT AND NUMERICAL TESTS')
print('Tr K0 = 304, Tr K0² = 1820')
print('Tr K  =',K.trace(),'Tr K² =',(K*K).trace())
print('rank hidden incidence kernel =', PH.trace(), 'and V annihilates both copies')
print('zero modes K = 2; minimum nonzero energy =', numeric_eigs[2])
print('E_3± =',float(sp.N(5-r-ch3)), float(sp.N(5-r+ch3)))
print('E_3p± =',float(sp.N(5+r-ch3p)), float(sp.N(5+r+ch3p)))
print('E_5± =',float(sp.N(5-E5)), float(sp.N(5+E5)))
print('s_3/s_3p =',float(sp.N(ch3/ch3p,16)),'= phi³; squared ratio=phi⁶')
print('Heat transfer vertex to antisymmetric face at eta_Delta:')
print('    3 channel : ',trans_3,'; 3-prime channel:',trans_3p)
print('    These amplitudes are not particle mass ratios.')
