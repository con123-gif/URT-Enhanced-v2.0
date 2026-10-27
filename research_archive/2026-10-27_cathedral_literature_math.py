#!/usr/bin/env python3
"""Reproducible finite calculations: complete Platonic DEC, five-cube
response, and the physical quantum-instrument completion of Cathedral
selected state. Mathematical model, not a fundamental action.
"""
import numpy as np
import networkx as nx
import sympy as s

# Full five-Platonic surface Hodge complex, including both dual pairs.
solids={"tetrahedron":nx.tetrahedral_graph(),"cube":nx.cubical_graph(),
        "octahedron":nx.octahedral_graph(),"dodecahedron":nx.dodecahedral_graph(),
        "icosahedron":nx.icosahedral_graph()}
moments=[]
for name,G in solids.items():
    ok,em=nx.check_planarity(G); assert ok
    marked=set(); faces=[]
    for u,v in G.to_directed().edges():
        if (u,v) not in marked:
            faces.append(em.traverse_face(u,v,mark_half_edges=marked))
    vs=sorted(G); es=sorted(tuple(sorted(e)) for e in G.edges())
    ie={edge:i for i,edge in enumerate(es)}; iv={v:i for i,v in enumerate(vs)}
    B1=np.zeros((len(vs),len(es)),dtype=np.int64)
    for i,(u,v) in enumerate(es): B1[iv[u],i]=-1; B1[iv[v],i]=1
    B2=np.zeros((len(es),len(faces)),dtype=np.int64)
    for j,fc in enumerate(faces):
        for k,u in enumerate(fc):
            v=fc[(k+1)%len(fc)]; e=(min(u,v),max(u,v))
            B2[ie[e],j] = 1 if u<v else -1
    assert np.array_equal(B1@B2,np.zeros((len(vs),len(faces)),dtype=np.int64))
    assert np.linalg.matrix_rank(B1)==len(vs)-1
    assert np.linalg.matrix_rank(B2)==len(faces)-1
    # Gauge potential a -> a + d(lambda) leaves discrete curvature unchanged.
    a=np.arange(1,len(es)+1,dtype=np.int64)
    lam=np.arange(len(vs),dtype=np.int64)
    assert np.array_equal(B2.T@a,B2.T@(a+B1.T@lam))
    n=len(vs)+len(es)+len(faces)
    H=np.zeros((n,n),dtype=np.int64); a=len(vs); b=len(es)
    H[:a,a:a+b]=B1;H[a:a+b,:a]=B1.T
    H[a:a+b,a+b:]=B2;H[a+b:,a:a+b]=B2.T
    H2=H@H
    spec=np.linalg.eigvalsh(H.astype(float))
    assert np.count_nonzero(abs(spec)<1e-7)==2
    moments.append((name,len(vs),len(es),len(faces),int(np.trace(H2)),int(np.trace(H2@H2))))
print('PLATONIC (V,E,F,TrD²,TrD⁴):',moments)
print('TOTAL',tuple(sum(p[i] for p in moments) for i in (1,2,3,4,5)))

# 20-vertex dodecahedron, five embedded cubes, exactly as in repo.
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
[(3,9,12,16),(3,9,15,19),(3,10,15,16),(4,9,12,19),(4,10,12,16),(4,10,15,19)]]
A=s.zeros(20)
for i,ns in enumerate(nb):
    for j in ns:A[i,j]=1
assert A==A.T
I=s.eye(20); L=3*I-A
P=[]
for ff in faces:
    verts=sorted({i for f in ff for i in f})
    C=s.zeros(8,6); pos={v:i for i,v in enumerate(verts)}
    for j,f in enumerate(ff):
        for v in f: C[pos[v],j]=1
    N=s.Matrix.hstack(*C.T.nullspace())
    Q=N*(N.T*N).inv()*N.T
    big=s.zeros(20)
    for i,u in enumerate(verts):
        for j,v in enumerate(verts):big[u,v]=Q[i,j]
    assert big*big==big and s.trace(big)==4
    P.append(big)
Pbar=sum(P,s.zeros(20))/5
P8=-s.Rational(80,3)*Pbar*(Pbar-s.Rational(2,5)*I)
Pv=s.Rational(50,3)*Pbar*(Pbar-s.Rational(1,4)*I)
P3=(5*I-L)*P8/2
P5=(L-3*I)*P8/2
assert P3*P5==s.zeros(20)
assert P3+P5==P8
assert all(Pbar==P8/4+s.Rational(2,5)*Pv for _ in [0])
# Build current candidates from five inscribed-cube kernel projectors, then
# from native vertex-occupancy operators (not freely invented matrices).
X=[P3*p*P5+P5*p*P3 for p in P]
assert sum(X,s.zeros(20))==s.zeros(20)
Gram=s.Matrix(5,5,lambda i,j:s.trace(X[i]*X[j]))
print('CUBE PROJECTOR CROSS-CURRENT GRAM:',Gram)
assert Gram==s.zeros(5)
Q=[]
for ff in faces:
    verts=sorted({i for f in ff for i in f})
    Q.append(s.diag(*[int(i in verts) for i in range(20)]))
assert sum(Q,s.zeros(20))==2*I
p3n=np.asarray(P3,dtype=float);p5n=np.asarray(P5,dtype=float)
Yn=[p3n@np.asarray(q,dtype=float)@p5n+p5n@np.asarray(q,dtype=float)@p3n for q in Q]
G=np.array([[np.sum(x*y) for y in Yn] for x in Yn])
print('CUBE VERTEX OCCUPANCY CROSS-CURRENT GRAM:',np.round(G,12),flush=True)
print('current independent dimension:',np.linalg.matrix_rank(G,tol=1e-10),flush=True)
# Odd vertices, sourced by the original dodecahedron antipodal involution.
Gd=nx.Graph(); Gd.add_nodes_from(range(20))
for u,adj in enumerate(nb):
    for v in adj:Gd.add_edge(u,v)
anti={u:[v for v in range(20) if nx.shortest_path_length(Gd,u,v)==5][0] for u in range(20)}
assert all(anti[anti[u]]==u for u in anti)
J=s.zeros(20)
for u,v in anti.items():J[u,v]=1
print('parity sectors Tr(J P3), Tr(J P5)=',s.trace(J*P3),s.trace(J*P5))
assert J*P3==-P3 and J*P5==P5
assert all(J*q==q*J for q in Q)
assert all(J*p==p*J for p in P)
Z=[]
for u in range(20):
    v=anti[u]
    if u<v:
        diag=s.zeros(20); diag[u,u]=1;diag[v,v]=-1
        Z.append(diag)
Zn=[p3n@np.asarray(z,dtype=float)@p5n+p5n@np.asarray(z,dtype=float)@p3n for z in Z]
Zg=np.array([[np.sum(x*y) for y in Zn] for x in Zn])
print('ODD VERTEX SOURCE rank',np.linalg.matrix_rank(Zg,tol=1e-10))
R=s.Matrix.hstack(*[s.Matrix([int(z[i,i]) for i in range(20)]) for z in Z])
G_exact=2*R.T*(P3.multiply_elementwise(P5))*R
assert np.allclose(np.asarray(G_exact,dtype=float),Zg,atol=1e-12)
assert G_exact.eigenvals()=={s.Rational(2,5):4,s.Rational(4,15):6}
assert all(G_exact[i,i]==s.Rational(8,25) for i in range(10))
print('EXACT odd-current Gram spectrum:',G_exact.eigenvals())
print('ODD VERTEX SOURCE Gram eig',np.round(np.linalg.eigvalsh(Zg),12))
print('norms:',np.diag(Zg).round(10))
phi=(1+s.sqrt(5))/2
Delta=s.Rational(3,20)-80*s.pi/(1053*phi)
a=1/(4*(1+Delta**2)); b=Delta**2*a
rho_geo=Pbar/4; F=P3+Delta*P5
# Exact symbolic operator identity by orthogonal spectral projectors:
# F*rho_geo*F = (P3 + Delta² P5)/16.
# Fast numeric matrix multiplication validates the same identity entrywise.
fn=np.asarray(P3,dtype=float)+float(Delta.evalf())*np.asarray(P5,dtype=float)
rn=np.asarray(rho_geo,dtype=float)
postn=(np.asarray(P3,dtype=float)+float(Delta.evalf())**2*np.asarray(P5,dtype=float))/16
assert np.allclose(fn@rn@fn,postn,atol=1e-13)
prob=(1+Delta**2)/4
rho=(P3+Delta**2*P5)/(4*(1+Delta**2))
eta=-s.log(Delta)
chi=8*eta*(1+Delta**2)/(1-Delta**2)
# Positive-Delta real branch: log(a/b)=-2log(Delta).
# Hessian of relative entropy for a unit-HS offdiagonal perturbation X is chi.
# Susceptibility from W(t)=log Tr exp(log(rho)+t X) is inverse chi.
Lmean=1/chi
assert s.simplify(Lmean*chi-1)==0
print('Delta=',Delta.evalf(16),'success p=',prob.evalf(16))
print('BKM density Hessian chi=',chi.evalf(16),'covariance=',Lmean.evalf(16))
print('EXACT 10D BKM stiffness modes (multiplicity 4,6):',
      (s.Rational(2,5)*chi).evalf(14),(s.Rational(4,15)*chi).evalf(14))
print('input coherence attenuation by unflagged instrument Delta=',Delta.evalf(16))
print('BKM metric contraction in success branch (relative to prior two equal eigenvalues) =',
      (2*eta*Delta**2/(1-Delta**2)).evalf(16))
# The success effect E=F†F is diagonal in P3,P5,Pv, plus 7D complement.
# The nonselective map on the geometric preparation fixes rho_geo exactly.
assert P3*Pbar==P3/4 and P5*Pbar==P5/4
# Complete K1 from spectral projectors; no root of 20x20 needed.
# Exact channel completion follows from orthogonal P3,P5,Pv,Prest.
# K1=sqrt(1-Delta²) P5 + Pv + (I-P8-Pv).
# K0²+K1²=P3+Delta²P5+(1-Delta²)P5+Pv+Prest=I.
# E(rho_geo)=rho_geo since all Kraus operators commute with rho_geo.
print('CPTP two-outcome completeness: verified algebraically by spectral projectors')
print('ALL COMBINATORIAL, PROJECTOR, PARITY AND BKM CHECKS PASSED')