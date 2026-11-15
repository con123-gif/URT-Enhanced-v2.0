#!/usr/bin/env python3
"""Independent reconstruction from named Nov 7 all-five / Nov 9 source-clock native operators.
Checks coherent modular readout against physically existing conditional overlap, not a new synthetic matrix.
The Haar phase->six-bit dictionary remains conditional, not microscopic derivation.
"""
import numpy as np
from scipy.linalg import eigh
from scipy.spatial import ConvexHull
from itertools import product, combinations
from math import pi,e,sqrt,log
phi=(1+sqrt(5))/2
Delta=3/20-80*pi/(1053*phi);eta=-log(Delta);alpha=phi**-2
N=24
names=['tetrahedron','cube','octahedron','dodecahedron','icosahedron']
verts={
 'tetrahedron':np.array([[1,1,1],[1,-1,-1],[-1,1,-1],[-1,-1,1]],float),
 'cube':np.array(list(product((-1,1),repeat=3)),float),
 'octahedron':np.array([[1,0,0],[-1,0,0],[0,1,0],[0,-1,0],[0,0,1],[0,0,-1]],float),
 'dodecahedron':np.array(list(product((-1,1),repeat=3))+
   [(0,a/phi,b*phi) for a,b in product((-1,1),repeat=2)]+
   [(a/phi,b*phi,0) for a,b in product((-1,1),repeat=2)]+
   [(a*phi,0,b/phi) for a,b in product((-1,1),repeat=2)],float),
 'icosahedron':np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+
   [(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+
   [(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)}
def build_faces(points):
    hull=ConvexHull(points);groups=[]
    for tri,eq in zip(hull.simplices,hull.equations):
        for g in groups:
            if np.linalg.norm(eq[:3]-g[0])<1e-7 and abs(eq[3]-g[1])<1e-7:
                g[2].update(map(int,tri));break
        else:groups.append([eq[:3],eq[3],set(map(int,tri))])
    out=[]
    for normal,offset,indices in groups:
        ids=sorted(indices);cen=np.mean(points[ids],axis=0)
        v1=(points[ids[0]]-cen);v1/=np.linalg.norm(v1)
        v2=np.cross(normal,v1)
        out.append(sorted(ids,key=lambda i:np.arctan2(np.dot(points[i]-cen,v2),np.dot(points[i]-cen,v1))))
    out.sort(key=lambda x:tuple(sorted(x)))
    return out
def whiten(M):
    w,U=eigh(M.T@M)
    assert min(w)>1e-10
    return M@((U/np.sqrt(w))@U.T)
def harmonics(points):
    t=points/np.linalg.norm(points,axis=1)[:,None];x,y,z=t.T
    return np.column_stack([x,y,z,(x*x-y*y)/sqrt(2),(x*x+y*y-2*z*z)/sqrt(6),sqrt(2)*x*y,sqrt(2)*x*z,sqrt(2)*y*z])
geom={name:{'points':verts[name], 'faces':build_faces(verts[name])} for name in names}
assert [(len(geom[n]['points']),len(geom[n]['faces'])) for n in names]==[(4,4),(8,6),(6,8),(20,12),(12,20)]
Eglobal=whiten(np.vstack([harmonics(geom[n]['points']) for n in names]));ico=geom['icosahedron'];Iico=whiten(harmonics(ico['points']))
assert np.linalg.norm(Eglobal.T@Eglobal-np.eye(8))<1e-12
Plinear=Iico@Eglobal.T
faces=ico['faces'];points=ico['points'];Cface=np.zeros((20,12))
for j,f in enumerate(faces):Cface[j,f]=1
adj=np.zeros((20,20))
for j,f in enumerate(faces):
    for k in range(j):
        if len(set(f)&set(faces[k]))==2:adj[j,k]=adj[k,j]=1
Lface=3*np.eye(20)-adj
Ph=np.eye(20)-Cface@np.linalg.inv(Cface.T@Cface)@Cface.T
P3=Ph@(5*np.eye(20)-Lface)/2;P5=Ph@(Lface-3*np.eye(20))/2
assert abs(np.trace(P3)-4)<1e-9 and abs(np.trace(P5)-4)<1e-9
assert np.linalg.norm(P3@P5)<1e-10
# Native antipodal six-axis 64-bit map.
pairs=[];remaining=set(range(12))
while remaining:
    i=min(remaining);j=min(remaining-{i},key=lambda k:np.linalg.norm(points[i]+points[k]))
    assert np.linalg.norm(points[i]+points[j])<1e-12
    pairs.append((i,j));remaining.remove(i);remaining.remove(j)
axes=np.array([points[a]/np.linalg.norm(points[a]) for a,b in pairs]);R3=[];R5=[]
for h in range(64):
    signs=np.array([1 if h&(1<<i) else -1 for i in range(6)])
    X,Y,Z=signs@axes
    q=np.array([(X*X-Y*Y)/sqrt(2),(X*X+Y*Y-2*Z*Z)/sqrt(6),sqrt(2)*X*Y,sqrt(2)*X*Z,sqrt(2)*Y*Z])
    a=np.r_[np.array([X,Y,Z])/sqrt(2),q/sqrt(32/5)]
    # Original all-five source: Eglobal @ a then Plinear maps into icosahedral shell.
    v=Eglobal@a
    f=(Cface@(Plinear@v))**2
    R3.append(P3@f);R5.append(P5@f)
R3=np.array(R3);R5=np.array(R5)
coef3=9+18*sqrt(5)/5;coef5=7/4
assert np.linalg.norm((R3.T@R3+R5.T@R5)/64-coef3*P3-coef5*P5)<3e-12
H=(R3/np.sqrt(coef3)+R5/np.sqrt(coef5))/8
assert np.linalg.norm(H.T@H-Ph)<1e-12
# Same golden partition, native 24x64 Haar conditional overlap.
C=np.zeros((24,64))
for j in range(24):
    aa=j/24+alpha;bb=(j+1)/24+alpha
    for h in range(64):
        C[j,h]=sum(max(0,min(bb,(h+1)/64+k)-max(aa,h/64+k)) for k in range(3))
assert np.linalg.norm(C@np.ones(64)-np.ones(24)/24)<1e-12
assert np.linalg.norm(C.T@np.ones(24)-np.ones(64)/64)<1e-12
B=np.sqrt(24*64)*C
assert np.linalg.matrix_rank(B,tol=1e-10)==24
T=H.T@B.T@B@H
assert np.linalg.eigvalsh(T).min()>-1e-12
cross=P3@T@P5
amp_cross=np.linalg.norm(cross,'fro')
comm=np.linalg.norm((3*P3+5*P5)@T-T@(3*P3+5*P5),'fro')
comm2=np.linalg.norm((18*P3+16*P5)@T-T@(18*P3+16*P5),'fro')
ratio=(amp_cross/np.linalg.norm(T,'fro'))
print('cross_norm',repr(amp_cross))
print('cross_rel_to_T',repr(ratio))
print('hidden_K_comm',repr(comm),'native_Hbits_comm',repr(comm2))
print('spectrum',np.linalg.eigvalsh(T)[-8:])
# Full 64x64 native generator and URT history matrix, independently reconstructed.
M=np.zeros((64,20));Hbits=15*np.eye(64)
for s in range(64):
    chosen={pairs[i][(s>>i)&1] for i in range(6)}
    for k,f in enumerate(faces):
        if set(f).issubset(chosen):M[s,k]=1
    for i,j in combinations(range(6),2): Hbits[s,s^(1<<i)^(1<<j)]=-1
Uh=M@Ph/sqrt(2)
assert np.linalg.norm(Uh.T@Uh-Ph)<1e-11
assert np.linalg.norm(Hbits@Uh@P3-18*Uh@P3)<1e-10
assert np.linalg.norm(Hbits@Uh@P5-16*Uh@P5)<1e-10
Q=np.zeros((64,64))
for h in range(64):Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
assert np.linalg.norm(np.linalg.matrix_power(Q,6)-np.ones((64,64))/64)<1e-14
Qproj=Uh.T@Q@Uh
mixed=np.linalg.norm(P3@Qproj@P5,'fro')
leak3=np.linalg.norm((np.eye(64)-Uh@Uh.T)@Q@Uh@P3,'fro')
leak5=np.linalg.norm((np.eye(64)-Uh@Uh.T)@Q@Uh@P5,'fro')
print('Q_projected_intersector',mixed)
print('Q_leak3_Q_leak5',leak3,leak5)
# Source observable C(phase) one parameter; modular flow acting on 3/5
# eigenobservable: Q? Interference response amplitude from direct H^T B^T B H.
print('history_24_clock_projector_defined',B.shape)
print('FULL_NATIVE_FINITE_CHECKS_OK')
# Best measurable two-sector phase readout through the native positive POVM effect T.
U,s,Vh=np.linalg.svd(cross)
sigma=s[0]
u=P3@U[:,0];u/=np.linalg.norm(u)
v=P5@Vh[0,:];v/=np.linalg.norm(v)
a=float(u@T@u);b=float(v@T@v)
assert abs(u@v)<1e-10 and abs(float(u@T@v)-sigma)<1e-10
mean=(a+b)/2
visibility_native=sigma/mean
E=np.linalg.eigvalsh(T).max()
assert E<1+1e-12 and mean+sigma <= E+1e-10
print('best_singular_value_cross',sigma)
print('native_instrument_mean_signal',mean)
print('native_instrument_signal_max_min',mean+sigma,mean-sigma)
print('native_instrument_fringe_visibility',visibility_native)
# The native history Hamiltonian has differences 18-16=2 on this hidden carrier.
# The KMS modular frequency is 2 eta. The two flows agree up to time reversal
# and s=t/eta, but this is not a derivation of seconds or Lorentz symmetry.
for t in (0.0,.2,1.,2.,3.):
    psi=(u+np.exp(2j*t)*v)/sqrt(2)
    p=float(np.vdot(psi,T@psi).real)
    expected=mean+sigma*np.cos(2*t)
    assert abs(p-expected)<5e-12
    print('time',t,'native_information_readout',p)

# Exact integer/rational certificate; independent from floating roundoff.
from fractions import Fraction
import sympy as sp
# EXACT projectors built directly from INTEGER face incidence and adjacency.
Cexact=sp.Matrix(np.array(Cface).astype(int).tolist())
Aexact=sp.Matrix(np.array(adj).astype(int).tolist())
Lface_exact=3*sp.eye(20)-Aexact
Ph_exact=sp.eye(20)-Cexact*(Cexact.T*Cexact).inv()*Cexact.T
P3_exact=Ph_exact*(5*sp.eye(20)-Lface_exact)/2
P5_exact=Ph_exact*(Lface_exact-3*sp.eye(20))/2
M_exact=sp.Matrix(np.array(M).astype(int).tolist())
assert np.linalg.norm(np.array(P3_exact).astype(float)-P3)<1e-12
assert np.linalg.norm(np.array(P5_exact).astype(float)-P5)<1e-12
assert Ph_exact==P3_exact+P5_exact
Q=sp.zeros(64,64)
for h in range(64):
 Q[h,2*h%64]+=sp.Rational(1,2);Q[h,2*h%64+1]+=sp.Rational(1,2)
# U=M Ph /sqrt(2): A=U^T Q U and J=U^T Q^T Q U
A=Ph_exact*M_exact.T*Q*M_exact*Ph_exact/2
J=Ph_exact*M_exact.T*Q.T*Q*M_exact*Ph_exact/2
zero=P3_exact*A*P5_exact
assert zero==sp.zeros(20,20)
print('EXACT zero P3 Uh^T Q Uh P5:',zero==sp.zeros(20,20))
for label,P in [('P3',P3_exact),('P5',P5_exact)]:
 sq=sp.trace(P*(J-A.T*A)*P)
 assert sq>0
 print(label,'squared exact leakage:',sq,'float',float(sp.sqrt(sq)))
# Q^6 on hidden U: U^T Q^6 U =0 if all hidden vectors zero mean
q6=Q**6
assert q6==sp.ones(64,64)/64
assert sp.ones(1,64)*M_exact*Ph_exact==sp.zeros(1,20)
print('EXACT Q^6=J/64 and zero hidden mean: yes')
for label,P in [('3',P3_exact),('5',P5_exact)]:
 X=P*A*P
 print('sector',label,'Projected Q rank',X.rank(),'squared Frobenius',sp.trace(X.T*X),'trace',sp.trace(X),'characteristic poly',X.charpoly().as_expr().factor())
print('full hidden projected Q rank', (Ph_exact*A*Ph_exact).rank(), 'normsq',sp.trace(A.T*A))

print("reverse cross P5 A P3 exact zero?", P5_exact*A*P3_exact==sp.zeros(20,20));print("reverse norm",sp.trace((P5_exact*A*P3_exact).T*(P5_exact*A*P3_exact)))
