"""Newton's Cathedral: explicit 190D -> 64D -> 51D -> hidden transfer.

An exact finite-dimensional *candidate* operator built without experimental input.
The doubled-face-sheet identification is an explicit geometrical assumption; this
script does not claim that the affine Golay code or URT uniquely enforces it.
Requires NetworkX, SymPy (Colab-installed).
"""
from itertools import combinations
from collections import deque
import networkx as nx
import sympy as s

GSET = [
    ("tetrahedron", nx.tetrahedral_graph(), 3),
    ("cube", nx.cubical_graph(), 4),
    ("octahedron", nx.octahedral_graph(), 3),
    ("dodecahedron", nx.dodecahedral_graph(), 5),
    ("icosahedron", nx.icosahedral_graph(), 3),
]

def oriented_faces_and_boundaries(G, p):
    vs = sorted(G.nodes()); edges = sorted(tuple(sorted(e)) for e in G.edges())
    edge_index = {edge:i for i,edge in enumerate(edges)}
    faces = []
    for choice in combinations(vs, p):
        sg=G.subgraph(choice)
        if sg.number_of_edges()!=p or any(sg.degree(v)!=2 for v in choice):
            continue
        # Induced cycle, not a disjoint union of cycles
        if not nx.is_connected(sg): continue
        start=min(choice); n0=min(sg.neighbors(start))
        cycle=[start,n0]
        while True:
            ns=[u for u in sg.neighbors(cycle[-1]) if u != cycle[-2]]
            assert len(ns)==1
            u=ns[0]
            if u==start: break
            cycle.append(u)
        assert len(cycle)==p
        faces.append(tuple(cycle))
    face_sets=[frozenset(f) for f in faces]
    assert len(face_sets)==len(set(face_sets))
    b1=s.zeros(len(vs),len(edges)); b2=s.zeros(len(edges),len(faces))
    vx={v:i for i,v in enumerate(vs)}
    for j,(lo,hi) in enumerate(edges):
        b1[vx[lo],j]=-1; b1[vx[hi],j]=1
    for j,f in enumerate(faces):
        for k in range(p):
            a,b=f[k],f[(k+1)%p]
            lo,hi=sorted((a,b))
            b2[edge_index[(lo,hi)],j]=1 if (a,b)==(lo,hi) else -1
    assert b1*b2==s.zeros(len(vs),len(faces))
    # Orient all faces consistently: opposite induced orientations on shared edges.
    neighbors={j:[] for j in range(len(faces))}
    for i,j in combinations(range(len(faces)),2):
        scalar=(b2[:,i].T*b2[:,j])[0]
        if scalar:
            assert scalar in (-1,1)
            neighbors[i].append((j,-scalar)); neighbors[j].append((i,-scalar))
    sign={0:1}; queue=deque([0])
    while queue:
        i=queue.popleft()
        for j,need in neighbors[i]:
            target=sign[i]*need
            if j in sign: assert sign[j]==target
            else: sign[j]=target;queue.append(j)
    assert len(sign)==len(faces)
    for j,val in sign.items(): b2[:,j]*=val
    l2=b2.T*b2
    assert all(l2[i,i]==p for i in range(len(faces)))
    assert sum(1 for i in range(len(faces)) for j in range(i+1,len(faces)) if l2[i,j]==-1)==G.number_of_edges()
    return b1,b2,faces,edges

parts={}
for name,G,p in GSET:
    b1,b2,faces,edges=oriented_faces_and_boundaries(G,p)
    v,e,f=len(G),len(edges),len(faces)
    assert v-e+f==2
    d2=2*(b1*b1.T).trace()+2*(b2.T*b2).trace()
    d4=2*((b1*b1.T)**2).trace()+2*((b2.T*b2)**2).trace()
    parts[name]={'b1':b1,'b2':b2,'v':v,'e':e,'f':f,'d2':d2,'d4':d4}
assert [sum(p[k] for p in parts.values()) for k in ('v','e','f')]==[50,90,50]
assert sum(p['d2'] for p in parts.values())==720
assert sum(p['d4'] for p in parts.values())==3456

# The 20-face block of the actual 190-dimensional Hodge Laplacian.
ico=parts['icosahedron']; B2=ico['b2']; LF=B2.T*B2
I20=s.eye(20); AD=3*I20-LF
P3=-(AD-3*I20)*(AD-I20)*(AD+2*I20)*(AD**2-5*I20)/30
P5=(AD-3*I20)*(AD-I20)*AD*(AD**2-5*I20)/30
PH=P3+P5
assert P3**2==P3 and P5**2==P5 and P3*P5==s.zeros(20)
assert P3.trace()==P5.trace()==4 and PH.trace()==8
assert LF*P3==3*P3 and LF*P5==5*P5
# Unsigned face-to-vertex incidence: hidden is exactly its nullspace.
Gico=GSET[-1][1]
faces_indexed=[]
for choice in combinations(sorted(Gico.nodes()),3):
    if all(Gico.has_edge(u,v) for u,v in combinations(choice,2)):
        faces_indexed.append(set(choice))
assert len(faces_indexed)==20
# The oriented cell-complex face order may differ. Recover by frozensets.
# Same icosahedral face list built by oriented_faces_and_boundaries.
_,_,facecycles,_=oriented_faces_and_boundaries(Gico,3)
B=s.zeros(12,20)
for j,f in enumerate(facecycles):
    for i in f:B[i,j]=1
assert B.rank()==12 and B*PH==s.zeros(12,20)
assert PH==I20-B.T*(B*B.T).inv()*B

# 64D carrier: 12_A + 12_B + 20_A + 20_B.
# Visible H13 is 12_A plus the unique normalized singlet of 12_B;
# remaining 11_B + 20_A + 20_B give H51.
I12=s.eye(12); J12=s.ones(12); PB0=J12/12
P13=s.diag(I12,PB0,s.zeros(20),s.zeros(20))
P51=s.eye(64)-P13
assert P13**2==P13 and P13.trace()==13
assert P51**2==P51 and P51.trace()==51
assert P13*P51==s.zeros(64)

# Centered-cell exact radial Laplacian, using the B-shell normalized singlet.
LV=ico['b1']*ico['b1'].T
u=s.ones(12,1)/s.sqrt(12)
KV=(LV+I12).row_join(-s.ones(12,1)*u.T).col_join(
    (-u*s.ones(1,12)).row_join(LV+12*PB0))
assert KV*P13[:24,:24]==P13[:24,:24]*KV
rad=s.Matrix([1]*12+[-12/s.sqrt(12)]*12) # 12 shell ones, centre -12*unit vector
assert KV*rad==13*rad
assert (rad.T*rad)[0]==156
# The 11 remaining vertex B dimensions reproduce the icosahedron's nonzero L spectrum.

# Unit gluing links corresponding faces on the two face orbits.
Kface=(LF+I20).row_join(-I20).col_join((-I20).row_join(LF+I20))
K64=s.diag(KV,Kface)
assert K64==K64.T and K64*P13==P13*K64
assert K64*P51==P51*K64
assert K64.trace()==304
assert (K64*K64).trace()==1820

# Hidden projections inside H64: two (20-dimensional) face sheets.
PH40=s.diag(PH,PH)
P3_40=s.diag(P3,P3); P5_40=s.diag(P5,P5)
SheetPlus=(s.eye(2)+s.Matrix([[0,1],[1,0]]))/2
SheetMinus=s.eye(2)-SheetPlus
# 40x40 projectors; s.kronecker_product(sheet, sector) respects face-sheet block order.
projectors={}
for eiglabel,Ps in [('3',P3),('5',P5)]:
    for parity,Psht in [('+',SheetPlus),('-',SheetMinus)]:
        pp=s.kronecker_product(Psht,Ps)
        projectors[(eiglabel,parity)]=pp
        assert pp**2==pp and pp.trace()==4
assert sum(projectors.values(),s.zeros(40))==PH40
K16=Kface*PH40
for key,pp in projectors.items():
    eigen={'3':3,'5':5}[key[0]]+(0 if key[1]=='+' else 2)
    assert Kface*pp==eigen*pp
# The 20 -> 40 diagonal embedding J_+ is an isometry and intertwines heat flow.
Jplus=s.Matrix.vstack(I20,I20)/s.sqrt(2)
Jminus=s.Matrix.vstack(I20,-I20)/s.sqrt(2)
assert Jplus.T*Jplus==I20 and Jplus.T*Jminus==s.zeros(20)
assert Kface*Jplus==Jplus*LF
assert Kface*Jminus==Jminus*(LF+2*I20)
# On the hidden subspace, these give canonically marked even and odd embeddings.
assert Jplus.T*PH40*Jplus==PH
assert Jminus.T*PH40*Jminus==PH

# Spectral heat state exactly factorizes. q=e^{-2eta}=Delta^2, q is a symbol
# here to prove the identity algebraically for ALL 0<q<1.
q=s.symbols('q',positive=True)
qweights={('3','+'):1,('3','-'):q,('5','+'):q,('5','-'):q*q}
R40=sum((qweights[k]*p for k,p in projectors.items()),s.zeros(40))
Z=s.simplify(R40.trace())
assert s.expand(Z-4*(1+q)**2)==0
rho40=R40/Z
# Trace over sheets yields 20D hidden master state (rank8, zero elsewhere).
red=rho40[:20,:20]+rho40[20:40,20:40]
rho8=(P3+q*P5)/(4*(1+q))
assert s.simplify(red-rho8)==s.zeros(20)
# Probability of parity-odd (-) sheet and of sector 5 are both p=q/(1+q).
odd=projectors[('3','-')]+projectors[('5','-')]
five=projectors[('5','+')]+projectors[('5','-')]
assert s.simplify((odd*rho40).trace()-q/(1+q))==0
assert s.simplify((five*rho40).trace()-q/(1+q))==0
assert s.simplify((five*odd*rho40).trace()-q*q/(1+q)**2)==0

# Identity of the 190D icosahedral face heat transfer and symmetric 64D transfer:
# for all polynomial f: f(Kface) J+ = J+ f(LF), since Kface J+=J+LF.
assert Kface**2 * Jplus == Jplus * LF**2

phi=(1+s.sqrt(5))/2
gamma=s.Rational(1,81)
delta=s.Rational(3,20)-(1-gamma)*s.pi/(13*phi)
eta=-s.log(delta)
qval=float(s.N(delta**2,20))
pval=qval/(1+qval)
print('Hodge 190D: V=50, E=90, F=50; Tr D²=720, Tr D⁴=3456')
print('64D carrier: 12+12+20+20; H13 rank=13; H51 rank=51')
print('Full 64D positive operator: Tr K64=304; Tr K64²=1820')
print('Exact geometric bridge Kface J+ = J+ Lface')
print('Hidden 16D spectrum: 3(x4),5(x8),7(x4)')
print('Heat partition: Z / e^(-3t) = 4(1+q)^2; q = exp(-2t)')
print('Heat master after tracing out sheet: (P3+qP5)/(4(1+q))')
print('Odd-sheet probability = p5 = q/(1+q), independent, mutual info = 0')
print('At t=eta_Delta, Delta=',s.N(delta,17))
print('q=Delta²=',qval,'and p5=',pval)
print('Entropy S16 = ln 4 + 2 H2(p), S8 = ln 4 + H2(p)')
print('All exact matrix assertions passed.')

# --------- Further exact result: two binary gap sectors create a 3-level triplet ----------
# On the multiplicity space C²_hidden x C²_sheet, the 4x4 transfer Hamiltonian
# has energies 3,5,5,7. The swap of the binary labels is an exact symmetry.
K4=s.diag(3,5,5,7)
SWAP=s.Matrix([[1,0,0,0],
               [0,0,1,0],
               [0,1,0,0],
               [0,0,0,1]])
Ptrip=(s.eye(4)+SWAP)/2
Psing=(s.eye(4)-SWAP)/2
assert SWAP**2==s.eye(4) and SWAP*K4==K4*SWAP
assert Ptrip**2==Ptrip and Ptrip.trace()==3
assert Psing**2==Psing and Psing.trace()==1
v0=s.Matrix([1,0,0,0]); v1=s.Matrix([0,1/s.sqrt(2),1/s.sqrt(2),0]); v2=s.Matrix([0,0,0,1])
vs=s.Matrix([0,1/s.sqrt(2),-1/s.sqrt(2),0])
for v, lam in [(v0,3),(v1,5),(v2,7),(vs,5)]:
    assert K4*v==lam*v
    assert (v.T*v)[0]==1
assert sum((v*v.T for v in (v0,v1,v2)),s.zeros(4))==Ptrip
assert vs*vs.T==Psing
R4=s.diag(1,q,q,q*q)/(1+q)**2
trip_weight=s.factor((Ptrip*R4).trace())
sing_weight=s.factor((Psing*R4).trace())
assert s.simplify(trip_weight-(1+q+q*q)/(1+q)**2)==0
assert s.simplify(sing_weight-q/(1+q)**2)==0
# Conditional state on the triplet has exact three eigenpopulation ratios 1:q:q².
for vec,weight in [(v0,1),(v1,q),(v2,q*q)]:
    assert s.simplify(R4*vec-weight*vec/(1+q)**2)==s.zeros(4,1)
print('Symmetric exchange triplet: exact eigenenergies (3,5,7), weights (1,q,q²)')
print('Antisymmetric singlet: energy 5, weight q/(1+q)²')
print('Triplet probability=',trip_weight, 'singlet probability=',sing_weight)
print('At the frozen rails, singlet probability≈', qval/(1+qval)**2)

# Unique *image*, rather than unique phase, selected by inter-sheet minimum.
# For any isometry Phi into H8_A+H8_B, E=||Phi_A-Phi_B||_HS².
# E=0 implies Phi_A=Phi_B; isometry then forces a 1/sqrt(2) diagonal
# image of the entire 8D H8. This leaves basis/gauge freedom but no image freedom.
Llink=s.eye(2)-s.Matrix([[0,1],[1,0]])
assert Llink*SheetPlus==s.zeros(2)
assert Llink*SheetMinus==2*SheetMinus
assert s.kronecker_product(Llink,I20)*Jplus==s.zeros(40,20)
assert s.kronecker_product(Llink,I20)*Jminus==2*Jminus
print('Unit-link variational selector picks the unique diagonal hidden SUBSPACE')
print('Its internal intertwiner basis is not uniquely fixed; Golay dynamics is still needed.')
print('ALL EXTENDED EXACT ASSERTIONS PASSED')
