#!/usr/bin/env python3
"""First-principles candidate ARF from moving frustrated icosahedral contacts.

Inputs: original exact icosahedron, centre phi contact, all-five 50->8->12
harmonic portal, hidden P3/P5 and oriented W, minimal spin flips, 24-clock
winding. Separates proved finite spectral identities from new dynamics premises.
No observed value or historical four-ARF formula enters this calculation.
"""
import math
from collections import Counter
from itertools import product, combinations
import numpy as np
import scipy.linalg as la
import networkx as nx
import sympy as sp

phi=(1+sp.sqrt(5))/2
v=sp.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
 +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
d=lambda i,j:sp.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))
edges=sorted((i,j) for i,j in combinations(range(12),2) if d(i,j)==4)
faces=sorted(f for f in combinations(range(12),3)
             if all((i,j) in edges for i,j in combinations(f,2)))
assert len(edges)==30 and len(faces)==20

# Exact enumeration: both central Ising orientations have been minimized.
outer=[]
for mask in range(4096):
    spin=tuple(1-2*((mask>>i)&1) for i in range(12))
    E=sum(spin[i]*spin[j] for i,j in edges)
    M=sum(spin)
    outer.append((mask,spin,E,M))
assert min(t[2] for t in outer)==-10
assert sum(t[2]==-10 for t in outer)==72
conditioned={}
for mask,ss,E,M in outer:
    a=abs(M)
    if a not in conditioned or E<conditioned[a][0]:
        conditioned[a]=(E,1)
    elif E==conditioned[a][0]:
        conditioned[a]=(E,conditioned[a][1]+1)
assert conditioned=={0:(-10,72),2:(-8,240),4:(-6,60),
                    6:(0,40),8:(10,72),10:(20,24),12:(30,2)}
assert 1<phi<3
minima=[(mask,ss,E,M) for mask,ss,E,M in outer if E==-6 and abs(M)==4]
assert len(minima)==60
assert set(t[3] for t in minima)=={-4,4}
# For every coupling t in (1,3), E- t|M| is minimized at E=-6, |M|=4.
for mag,(E,_) in conditioned.items():
    if mag!=4:
        for t in (sp.Rational(1001,1000),phi,sp.Rational(2999,1000)):
            assert float(-6-4*t)<float(E-mag*t)
print('Ground state theorem: phi-centre gives 60, 30+30; robust 1<t<3: PASS')

# Exact native hidden face geometry.
C=sp.Matrix(20,12,lambda i,j:int(j in faces[i]))
L=sp.Matrix(20,20,lambda i,j:
            3 if i==j else (-1 if len(set(faces[i])&set(faces[j]))==2 else 0))
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*sp.eye(20)-L)/2
P5=Ph*(L-3*sp.eye(20))/2
assert P3.rank()==P5.rank()==4 and P3+P5==Ph
face_centres=[sp.Matrix([sum((v[k,a] for k in f),sp.S.Zero)
                         for a in range(3)]) for f in faces]
W=sp.zeros(20,20)
for i in range(20):
    for j in range(20):
        chir=sp.simplify(sum((sp.Matrix(v.row(k)).dot(
                         face_centres[i].cross(face_centres[j]))
                         for k in set(faces[i])&set(faces[j])),sp.S.Zero))
        if chir:W[i,j]=int(sp.sign(chir))
assert W.T==-W and W*W==-15*Ph and L*W+W*L==8*W

# All-five geometry: Eglobal (50x8), Iico(12x8), Plinear=Iico Eglobal^T.
# The minimal-norm whole-five lift of each 12-contact state is
# v50=Eglobal Iico^T s, giving x=Iico Iico^T s. This is a declared
# source-contact chart, NOT proof that the primitive URT chooses this lift.
pm=list(product((-1,1),repeat=2))
solids={
 'tetrahedron':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(product((-1,1),repeat=3)),
 'octahedron':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodecahedron':list(product((-1,1),repeat=3))+
    [(0,a/float(phi),b*float(phi)) for a,b in pm]+
    [(a/float(phi),b*float(phi),0) for a,b in pm]+
    [(a*float(phi),0,b/float(phi)) for a,b in pm],
 'icosahedron':np.array(v,dtype=float).tolist()
}
assert [len(x) for x in solids.values()]==[4,8,6,20,12]
assert sum(a+b+c for a,b,c in [(4,6,4),(8,12,6),(6,12,8),
                               (20,30,12),(12,30,20)])==190

# Also reconstruct *all* five C0->C1->C2 Hodge complexes (190 cochains),
# not a disguised 13-state substitute. Their nonlinear dynamical role beyond
# the source portal is NOT specified by the moving-contact Hamiltonian.
from scipy.spatial import ConvexHull
def boundary_complex(pts):
    pts=np.asarray(pts,float)
    hull=ConvexHull(pts)
    groups=[]
    for tri,eq in zip(hull.simplices,hull.equations):
        for group in groups:
            if np.linalg.norm(eq[:3]-group[0])<1e-7 and abs(eq[3]-group[1])<1e-7:
                group[2].update(map(int,tri));break
        else:groups.append([eq[:3],eq[3],set(map(int,tri))])
    polygon=[]
    for normal,offset,indices in groups:
        ids=sorted(indices);centre=pts[ids].mean(axis=0)
        axis=pts[ids[0]]-centre;axis/=np.linalg.norm(axis)
        second=np.cross(normal,axis)
        face=sorted(ids,key=lambda i:np.arctan2(np.dot(pts[i]-centre,second),
                                                 np.dot(pts[i]-centre,axis)))
        polygon.append(face)
    polygons=sorted(polygon,key=lambda f:tuple(sorted(f)))
    edges=sorted(set(tuple(sorted((i,j))) for f in polygons for i,j in
        zip(f,f[1:]+f[:1])))
    lookup={ed:i for i,ed in enumerate(edges)}
    b1=np.zeros((len(pts),len(edges)),int)
    b2=np.zeros((len(edges),len(polygons)),int)
    for k,(i,j) in enumerate(edges):b1[i,k]=-1;b1[j,k]=1
    for k,f in enumerate(polygons):
        for i,j in zip(f,f[1:]+f[:1]):
            b2[lookup[tuple(sorted((i,j)))],k]=1 if i<j else -1
    assert np.array_equal(b1@b2,np.zeros((len(pts),len(polygons)),int))
    return b1,b2
whole_D=np.zeros((190,190),int)
pos=0
for name in solids:
    b1,b2=boundary_complex(solids[name])
    Vn,En=b1.shape;Fn=b2.shape[1]
    whole_D[pos:pos+Vn,pos+Vn:pos+Vn+En]=b1
    whole_D[pos+Vn:pos+Vn+En,pos:pos+Vn]=b1.T
    whole_D[pos+Vn:pos+Vn+En,pos+Vn+En:pos+Vn+En+Fn]=b2
    whole_D[pos+Vn+En:pos+Vn+En+Fn,pos+Vn:pos+Vn+En]=b2.T
    pos+=Vn+En+Fn
assert pos==190 and np.trace(whole_D@whole_D)==720
D2=whole_D@whole_D
assert np.trace(D2@D2)==3456
print('All five 190-cochain Hodge-Dirac Tr D²=720, Tr D⁴=3456: PASS')

def moments(rows):
    R=np.array(rows,float)
    R/=np.linalg.norm(R,axis=1)[:,None]
    x,y,z=R.T
    return np.stack([x,y,z,(x*x-y*y)/math.sqrt(2),
        (x*x+y*y-2*z*z)/math.sqrt(6),math.sqrt(2)*x*y,
        math.sqrt(2)*x*z,math.sqrt(2)*y*z],axis=1)
def whiten(M):
    d,U=np.linalg.eigh(M.T@M)
    assert min(d)>1e-10
    return M@((U/np.sqrt(d))@U.T)
Eglobal=whiten(np.vstack([moments(x) for x in solids.values()]))
Iico=whiten(moments(solids['icosahedron']))
Plinear=Iico@Eglobal.T
assert Eglobal.shape==(50,8) and np.linalg.norm(Eglobal.T@Eglobal-np.eye(8))<1e-12
assert Plinear.shape==(12,50) and np.linalg.matrix_rank(Plinear)==8

# Exact Iico Iico^T using native odd triplet and even fiveplet projectors.
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0
         for k in range(3))) for i in range(12)}
Kv=sp.Matrix(12,12,lambda i,j:int(i==opp[j]))
P3v=v*(v.T*v).inv()*v.T
P5v=(sp.eye(12)+Kv)/2-sp.ones(12,12)/12
Pl=sp.simplify(P3v+P5v)
assert sp.simplify(Pl*Pl-Pl)==sp.zeros(12,12)
assert np.linalg.norm(np.array(Pl,float)-Iico@Iico.T)<1e-12

# Original 64-history partial isometry: hidden 20-face carrier really is
# embedded into H64, rather than silently replacing the full history space.
pairs=[]; remaining=set(range(12))
while remaining:
    i=min(remaining);j=opp[i]
    assert j in remaining and j!=i
    pairs.append((i,j));remaining.remove(i);remaining.remove(j)
M=sp.Matrix(64,20,lambda mask,f:int(set(faces[f]).issubset(
    {pairs[k][(mask>>k)&1] for k in range(6)})))
Uh=M*Ph/sp.sqrt(2)
assert sp.simplify(Uh.T*Uh-Ph)==sp.zeros(20,20)
Hbits=15*sp.eye(64)
for state in range(64):
    for i,j in combinations(range(6),2):Hbits[state,state^(1<<i)^(1<<j)]-=1
assert Hbits*Uh*P3==18*Uh*P3
assert Hbits*Uh*P5==16*Uh*P5
print('Full H64 source isometry and native 18/16 hidden energies: EXACT PASS')

# Original eight-dimensional source h3/h5 pulled back from full 50 states.
H3=[];H5=[]
for mask,s,E,M in minima:
    ss=sp.Matrix(s)
    v50=Eglobal@Iico.T@np.array(s,float)
    x=Plinear@v50
    assert np.linalg.norm(x-np.array(Pl*ss,float).ravel())<2e-12
    xx=Pl*ss
    f=(C*xx).multiply_elementwise(C*xx)
    H3.append(P3*f);H5.append(P5*f)
H3=sp.Matrix.hstack(*H3)
H5=sp.Matrix.hstack(*H5)
# The oriented inter-sector coupling (unit-normalized by the exact W^2=-15Ph).
T=H3.T*W*H5  # 60x60 exact entries; a source-source bilinear
# In the H64 embedding the same bilinear is implemented by
# W64=Uh W Uh^T, since Uh^T Uh=Ph, h3=P3 h3 and h5=P5 h5.
assert W*Ph==W and Ph*W==W
h3a=Uh*H3[:,0];h5b=Uh*H5[:,2]
assert sp.simplify((h3a.T*(Uh*W*Uh.T)*h5b)[0]-T[0,2])==0
B=sp.zeros(60,60)
G=nx.Graph();G.add_nodes_from(range(60))
for i in range(60):
    assert sp.simplify(T[i,i])==0
    for j in range(i+1,60):
        hd=(minima[i][0]^minima[j][0]).bit_count()
        if hd==2:
            q=sp.simplify(T[i,j]);qr=sp.simplify(T[j,i])
            assert q in (-8,8) and qr==-q,(i,j,q,qr)
            B[i,j]=q/8;B[j,i]=-q/8
            G.add_edge(i,j)
        # No assertion for long-distance transitions: minimal-locality restriction.
assert G.number_of_edges()==120
assert sorted(len(q) for q in nx.connected_components(G))==[30,30]
assert set(dict(G.degree()).values())=={4}
assert B.T==-B and B*sp.ones(60,1)==sp.zeros(60,1)

# Identify the two connected graphs with the 30-edge rectification of Ico.
R=nx.Graph();R.add_nodes_from(range(30))
idx={a:k for k,a in enumerate(edges)}
for f in faces:
    for a,b in combinations([idx[tuple(sorted(e))] for e in combinations(f,2)],2):
        R.add_edge(a,b)
assert R.number_of_edges()==60
parts=[sorted(c) for c in nx.connected_components(G)]
for component in parts:
    q=G.subgraph(component)
    assert nx.is_isomorphic(q,R)
    Bb=B.extract(component,component)
    assert Bb.rank()==18
    p=sp.factor(Bb.charpoly().as_expr())
    z=sp.Symbol('lambda')
    assert p==z**12*(z*z+5)**4*(z*z+8)**5,p
    assert Bb*(Bb*Bb+5*sp.eye(30))*(Bb*Bb+8*sp.eye(30))==sp.zeros(30)
    assert Bb*sp.ones(30,1)==sp.zeros(30,1)
print('Moving chiral source: every minimal edge exactly ±8/√15, skew and zero divergence: EXACT PASS')
print('Ground network 30+30 rectified icosahedron; charpoly λ^12(λ²+5)^4(λ²+8)^5: EXACT PASS')

# Triplet response in any 60 spontaneous icosahedral vacua.
R3=[]
P3f=np.array(P3v,float)
V3=np.linalg.qr(np.array(v,float))[0][:,:3]
for mask,ss,E,M in minima:
    c0=np.sign(M)
    n=(1+c0*np.array(ss))/2
    mass_proxy=V3.T@np.diag(n)@V3  # canonical contact-occupancy source
    eig=np.linalg.eigvalsh(mass_proxy)
    expected=[.5,(15-math.sqrt(5))/20,(15+math.sqrt(5))/20]
    assert np.allclose(np.sort(eig),sorted(expected),atol=1e-12)
    R3.append(eig)
# Raw spin response on the unbroken coordinate triplet has a structural zero.
a0=np.array(minima[0][1],int)
raw=V3.T@np.diag(a0)@V3
assert np.allclose(np.sort(np.linalg.eigvalsh(raw)),
   [0,(5-math.sqrt(5))/10,(5+math.sqrt(5))/10],atol=1e-12)
print('Spontaneous triplet contact spectrum: 1/2, (15±√5)/20 for ALL 60: PASS')

# Exact 24-clock winding. This 3-fold reference chart is a CONDITION,
# and its conversion into a thermodynamic bias is a second explicit premise.
epsilon=sp.pi/(3*phi**12)
assert sp.simplify(48*sp.pi/phi**2-(18+sp.Rational(1,3))*sp.pi-epsilon)==0
et=float(epsilon)
delta=et/24
# Conditional maximum-entropy local positive transfer with equal positive
# edge priors and antisymmetric log-odds 2δ B_ij:
# T_ij=exp(δ B_ij)/(4cosh δ) on minimal Hamming2 edges.
for component in parts:
    b=np.array(B.extract(component,component),dtype=float)
    adj=np.abs(b)
    t=np.tanh(delta)
    Q=(adj+t*b)/4
    assert np.allclose(Q.sum(axis=0),1,atol=1e-13)
    assert np.allclose(Q.sum(axis=1),1,atol=1e-13)
    assert Q.min()>=0
    mean=np.sum(Q*b)/30
    assert abs(mean-t)<1e-13
    entropy_rate=np.sum([Q[i,j]/30*np.log(Q[i,j]/Q[j,i])
        for i in range(30) for j in range(30) if adj[i,j]])
    assert abs(entropy_rate-2*delta*t)<1e-13
    expU=la.expm(et*b)
    tr_expected=12+8*np.cos(math.sqrt(5)*et)+10*np.cos(2*math.sqrt(2)*et)
    assert abs(np.trace(expU)-tr_expected)<1e-11
print('golden epsilon',format(et,'.18g'),'per-track delta',format(delta,'.18g'))
print('CONDITIONAL 24-step signed current:',format(24*math.tanh(delta),'.18g'))
print('CONDITIONAL 24-step entropy production:',format(2*et*math.tanh(delta),'.18g'))
print('Exact resolvent of iB: 12/z + 8z/(z²-5) + 10z/(z²-8)')
print('Unitary 24-return trace: 12 + 8cos(√5 ε) + 10cos(2√2 ε)')
print('PHYSICAL ARF STATUS: OPEN; no photon/fermion source-to-current identification')
print('MOVING CATHEDRAL ARF CANDIDATE CERTIFICATE: PASS')
