#!/usr/bin/env python3
"""
Newton's Cathedral: geometric tetrahedral odd coupling, resistance flow,
and covariant transport during physical rotation of all five Platonic solids.

Requires numpy, scipy, sympy.
No fitted coefficients. Models the lowest-order inversion-odd response and
canonical polar transport; the choice of these dynamics is a physical
hypothesis, not a consequence of the spiral constants alone.
"""
from itertools import product
import math
import numpy as np
import sympy as sp
from scipy.spatial import ConvexHull
from scipy.sparse.csgraph import shortest_path
from scipy.spatial.transform import Rotation

phi = (1 + math.sqrt(5)) / 2
delta = 3/20 - 80*math.pi/(1053*phi)
eta = -math.log(delta)
theta = 2*math.pi/phi**2
gain = math.pi/math.e

solids = {
    'tetrahedron': np.array([v for v in product((-1,1),repeat=3)
                              if np.prod(v)>0],float),
    'cube': np.array(list(product((-1,1),repeat=3)),float),
    'octahedron': np.array([s*np.eye(3)[j] for j in range(3)
                            for s in (-1,1)],float),
    'dodecahedron': np.array(
        list(product((-1,1),repeat=3))+
        [[0,a/phi,b*phi] for a,b in product((-1,1),repeat=2)]+
        [[a/phi,b*phi,0] for a,b in product((-1,1),repeat=2)]+
        [[a*phi,0,b/phi] for a,b in product((-1,1),repeat=2)],float),
    'icosahedron': np.array(
        [[0,a,b*phi] for a,b in product((-1,1),repeat=2)]+
        [[a,b*phi,0] for a,b in product((-1,1),repeat=2)]+
        [[a*phi,0,b] for a,b in product((-1,1),repeat=2)],float),
}
solids = {k:v/np.linalg.norm(v,axis=1)[:,None] for k,v in solids.items()}
assert sum(len(v) for v in solids.values()) == 50

# Icosahedral faces, dual-dodecahedral face graph, and 20x12 incidence.
v = solids['icosahedron']
hull = ConvexHull(v)
faces = [tuple(map(int,s)) for s in hull.simplices]  # 20 triangular faces
C = np.zeros((20,12),dtype=int)
for i,face in enumerate(faces): C[i,list(face)] = 1
n = np.array([v[list(f)].mean(axis=0) for f in faces])
n /= np.linalg.norm(n,axis=1)[:,None]
A = (C@C.T == 2).astype(int)
np.fill_diagonal(A,0)
L = 3*np.eye(20,dtype=int)-A
assert np.linalg.matrix_rank(C)==12

# 3/5 hidden projectors, as exact rational functions of incidence/graph data.
Cr = sp.Matrix(C)
Lr = sp.Matrix(L)
Pr = sp.eye(20)-Cr*(Cr.T*Cr).inv()*Cr.T
P3r = sp.simplify(Pr*(5*sp.eye(20)-Lr)/2)
P5r = sp.simplify(Pr*(Lr-3*sp.eye(20))/2)
assert P3r*P3r==P3r and P5r*P5r==P5r
assert P3r*P5r==sp.zeros(20)
assert sp.trace(P3r)==sp.trace(P5r)==4
Ph = np.array(Pr,dtype=float)
P3 = np.array(P3r,dtype=float)
P5 = np.array(P5r,dtype=float)

# Of all five solids, only tetrahedron has an odd third moment.
print('Third-moment sources (largest absolute value on icosahedral face normals):')
for name,vertices in solids.items():
    odd = np.mean((n@vertices.T)**3,axis=1)
    print('  %-12s  %.12g'%(name,np.max(np.abs(odd))))
    if name!='tetrahedron': assert np.max(np.abs(odd))<1e-12

T = solids['tetrahedron']
f_aligned=np.mean((n@T.T)**3,axis=1)
assert np.max(np.abs(f_aligned-2/np.sqrt(3)*np.prod(n,axis=1)))<1e-12
f_rat=[sp.Rational(round(9*x),9) for x in f_aligned]
assert max(abs(float(q)-x) for q,x in zip(f_rat,f_aligned))<1e-12
Xr=P5r*sp.diag(*f_rat)*P3r
assert Xr.rank()==4
square_eig=(Xr.T*Xr).eigenvals()
assert square_eig=={sp.Rational(4,135):1,sp.Rational(4,1215):3,
                   sp.Integer(0):16},square_eig
print('\nExact tetra-to-icosa hidden interaction:')
print('  rank(X)=4, spec(X^T X)=',square_eig)

# Full SO(3) orientational average, EXACT. Tetra's cubic field has l=3,
# so E_R f_R(n_i)f_R(n_j)=(4/315)*P_3^{Legendre}(n_i dot n_j).
dots=n@n.T
avg=sp.Integer(0)
for i in range(20):
    for j in range(20):
        x=dots[i,j]
        possible=(sp.Integer(1),-sp.Integer(1),sp.Rational(1,3),
                  -sp.Rational(1,3),sp.sqrt(5)/3,-sp.sqrt(5)/3)
        z=min(possible,key=lambda r:abs(float(r)-x))
        assert abs(float(z)-x)<1e-10
        L3=(5*z**3-3*z)/2
        avg+=sp.Rational(4,315)*P3r[i,j]*P5r[i,j]*L3
avg=sp.simplify(avg)
assert avg==sp.Rational(208,8505)
print('  exact uniform-relative-spin mean ||X||_F^2=',avg)

# Canonical 4x4 subspace bases. Polar(X) uniquely minimises
# ||X-W||_F over orthogonal 4x4 W when det(X)!=0.
eig,U3=np.linalg.eigh(P3); B3=U3[:,eig>.5]
eig,U5=np.linalg.eigh(P5); B5=U5[:,eig>.5]

def relative_matrix(Rtet,Rico):
    nw=n@Rico.T
    tv=T@Rtet.T
    f=np.mean((nw@tv.T)**3,axis=1)
    M=B5.T@(f[:,None]*B3)
    return M,nw,tv

def polar(Rtet,Rico):
    M,_,_=relative_matrix(Rtet,Rico)
    U,ss,Vt=np.linalg.svd(M)
    return U@Vt,ss

def angular_gradient_logvolume(Rtet):
    """World-frame rotational gradient, with icosahedron fixed."""
    M,nw,tv=relative_matrix(Rtet,np.eye(3))
    z=nw@tv.T
    df=(3/4)*np.einsum('ij,ija->ia',z*z,
                         np.cross(tv[None,:,:],nw[:,None,:]))
    grad=np.empty(3)
    for k in range(3):
        dM=B5.T@(df[:,k,None]*B3)
        grad[k]=np.trace(np.linalg.solve(M,dM))
    return np.linalg.slogdet(M)[1],grad

# A genuine parameter-free, dimensionless resistance objective:
# R=-log |det M|, the negative log of transported four-volume.
# Its gradient flow satisfies dR/dtau=-||grad R||^2.
R=Rotation.from_rotvec([.34,.72,-.83]).as_matrix()
log0,g0=angular_gradient_logvolume(R)
for k in range(3):
    h=1e-6;e=np.eye(3)[k]
    lp,_=angular_gradient_logvolume(Rotation.from_rotvec(h*e).as_matrix()@R)
    lm,_=angular_gradient_logvolume(Rotation.from_rotvec(-h*e).as_matrix()@R)
    assert abs((lp-lm)/(2*h)-g0[k])<1e-7
for j in range(250):
    value,gvec=angular_gradient_logvolume(R)
    if np.linalg.norm(gvec)<1e-8: break
    step=min(0.1,0.2/np.linalg.norm(gvec))
    for retry in range(40):
        test=Rotation.from_rotvec(step*gvec).as_matrix()@R
        newval,_=angular_gradient_logvolume(test)
        if newval>=value+1e-5*step*(gvec@gvec):break
        step/=2
    else: break
    R=test
log1,_=angular_gradient_logvolume(R)
assert log1>log0
print('\nLeast-resistance descent (maximise four-channel transmission volume):')
print('  initial |det M|=%.12g  final |det M|=%.12g' %
      (math.exp(log0),math.exp(log1)))

# Spin every Platonic solid, with the golden angle and staggered independent
# sequences of axes. No predetermined favourable icosa/tetra alignment.
N=24
axes=[]
for j in range(N):
    z=1-2*(j+.5)/N
    a=j*theta
    axes.append(np.array([math.sqrt(1-z*z)*math.cos(a),
                          math.sqrt(1-z*z)*math.sin(a),z]))
Rs={k:np.eye(3) for k in solids}
Ws=[];sing=[]
for j in range(N+1):
    W,ss=polar(Rs['tetrahedron'],Rs['icosahedron'])
    Ws.append(W);sing.append(ss.min())
    if j<N:
        for k,name in enumerate(solids):
            move=Rotation.from_rotvec(theta*axes[(j+5*k)%N]).as_matrix()
            Rs[name]=move@Rs[name]
assert min(sing)>1e-8

# W_j is an orthogonal map from the rank-4 3-space to the rank-4 5-space.
# It determines J_j, and hence a unique relative basis map V_j on the hidden
# 8-state space. A geometric connection G_j=V_(j+1)V_j^T then transports
# states between the actual spinning frames.
W0=Ws[0]
Vs=[];As=[]
s=delta**(1/12)
D=P3+s*P5
for W in Ws:
    V=P3+B5@(W@W0.T)@B5.T
    J=B5@W@B3.T-B3@W.T@B5.T
    assert np.linalg.norm(J@J+Ph)<1e-11
    U=math.cos(theta)*Ph+math.sin(theta)*J
    Vs.append(V)
    As.append(gain*U@D)
A0=As[0]
naive=Ph.copy();covariant=Ph.copy()
for j in range(N):
    naive=As[j]@naive
    covariant=(Vs[j+1]@A0@Vs[j].T)@covariant
A0pow=np.linalg.matrix_power(A0,N)
assert np.linalg.norm(covariant-Vs[N]@A0pow@Vs[0].T)<1e-11
norm_naive=float(np.linalg.norm(naive,2))
norm_cov=float(np.linalg.norm(covariant,2))
assert abs(norm_cov-0.1152224995825)<1e-10
print('\nFive independently spinning solids (24 golden-angle stages):')
print('  smallest intersector singular value=%.12g' % min(sing))
print('  without frame transport ||A_24||=%.12f' %norm_naive)
print('  with polar frame transport ||A_24||=%.12f' %norm_cov)
print('  exact telescoping residual = %.3e'%np.linalg.norm(
      covariant-Vs[N]@A0pow@Vs[0].T))
print('  nonlinear 4-Lipschitz bound: %.12f' %(4*norm_cov))
print('\nPASS: tetrahedral odd interaction + all-five spinning +')
print('      four-volume resistance law + covariant transfer are reproducible.')
print('SCOPE: geometric/covariant model; a physical law asserting that')
print('       nature uses this coupling and transfer still needs independent evidence.')
