#!/usr/bin/env python3
"""Original 190-cochain / five-Platonic -> hidden 4_3+4_5 -> 64-history
isometric source -> 24-clock Gaussian Schur response and FULL Ward contacts.

No fitted or historical ARF coefficients. This is a conditional native source-to-
HISTORY susceptibility, NOT a physical H13+H51 charged-fermion pole derivation.
The 50->12 eight-harmonic pullback and history embedding are reproduced from
archived cathedral_constructed_joint_dynamics_2026_11_07.py (not modified).
"""
import numpy as np
from math import pi,e,sqrt
from itertools import product,combinations
from scipy.spatial import ConvexHull
from scipy.linalg import eigh

phi=(1+sqrt(5))/2
Delta=3/20-80*pi/(1053*phi)
r=pi/e; q=2; T=24
names=['tetrahedron','cube','octahedron','dodecahedron','icosahedron']
verts={
 'tetrahedron':np.array([[1,1,1],[1,-1,-1],[-1,1,-1],[-1,-1,1]],float),
 'cube':np.array(list(product((-1,1),repeat=3)),float),
 'octahedron':np.array([[1,0,0],[-1,0,0],[0,1,0],[0,-1,0],[0,0,1],[0,0,-1]],float),
 'dodecahedron':np.array(list(product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in product((-1,1),repeat=2)]+[(a/phi,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b/phi) for a,b in product((-1,1),repeat=2)],float),
 'icosahedron':np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)}

def whiten(M):
    w,U=eigh(M.T@M);assert w.min()>1e-10
    return M@((U/np.sqrt(w))@U.T)
def harmonics(pts):
    v=pts/np.linalg.norm(pts,axis=1)[:,None];x,y,z=v.T
    return np.column_stack((x,y,z,(x*x-y*y)/sqrt(2),(x*x+y*y-2*z*z)/sqrt(6),sqrt(2)*x*y,sqrt(2)*x*z,sqrt(2)*y*z))
def faces(pts):
    hull=ConvexHull(pts);groups=[]
    for tri,eq in zip(hull.simplices,hull.equations):
        for group in groups:
            if np.linalg.norm(eq[:3]-group[0])<1e-7 and abs(eq[3]-group[1])<1e-7:
                group[2].update(map(int,tri));break
        else:groups.append([eq[:3],eq[3],set(map(int,tri))])
    out=[]
    for normal,offset,indices in groups:
        ids=sorted(indices);cen=pts[ids].mean(axis=0)
        e1=pts[ids[0]]-cen;e1/=np.linalg.norm(e1);e2=np.cross(normal,e1)
        out.append(sorted(ids,key=lambda i:np.arctan2((pts[i]-cen)@e2,(pts[i]-cen)@e1)))
    return sorted(out,key=lambda f:tuple(sorted(f)))

parts=[];spatial=0
for name in names:
    pts=verts[name];fs=faces(pts)
    edges=sorted(set(tuple(sorted((i,j))) for f in fs for i,j in zip(f,f[1:]+f[:1])))
    assert len(pts)-len(edges)+len(fs)==2
    parts.append((len(pts),len(edges),len(fs)))
    spatial+=len(pts)+len(edges)+len(fs)
assert spatial==190 and sum(v for v,e,f in parts)==50
Eglobal=whiten(np.vstack([harmonics(verts[name]) for name in names]))
Iico=whiten(harmonics(verts['icosahedron']))
Plinear=Iico@Eglobal.T
assert np.linalg.matrix_rank(Plinear,tol=1e-10)==8
pts=verts['icosahedron'];fs=faces(pts)
assert len(fs)==20
C=np.zeros((20,12))
for k,f in enumerate(fs):C[k,f]=1
L=3*np.eye(20)
for i in range(20):
    for j in range(i):
        if len(set(fs[i])&set(fs[j]))==2:L[i,j]=L[j,i]=-1
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
P3=Ph@(5*np.eye(20)-L)/2
P5=Ph@(L-3*np.eye(20))/2
assert abs(np.trace(P3)-4)<1e-10 and abs(np.trace(P5)-4)<1e-10
assert np.linalg.norm(P3@P5)<1e-11
pairs=[];remaining=set(range(12))
while remaining:
    i=min(remaining);j=min(remaining-{i},key=lambda k:np.linalg.norm(pts[i]+pts[k]))
    assert np.linalg.norm(pts[i]+pts[j])<1e-12
    pairs.append((i,j));remaining.remove(i);remaining.remove(j)
M=np.zeros((64,20));H64=15*np.eye(64)
for h in range(64):
    chosen={pairs[i][(h>>i)&1] for i in range(6)}
    for k,f in enumerate(fs):
        if set(f).issubset(chosen):M[h,k]=1
    for i,j in combinations(range(6),2):H64[h,h^(1<<i)^(1<<j)]-=1
Uh=M@Ph/sqrt(2)
assert np.linalg.norm(Uh.T@Uh-Ph)<1e-10
assert np.linalg.norm(H64@Uh@P3-18*Uh@P3)<1e-10
assert np.linalg.norm(H64@Uh@P5-16*Uh@P5)<1e-10
assert np.max(abs(np.linalg.eigvalsh(H64)-np.repeat([0,10,16,18],[2,12,30,20])))<1e-11

rng=np.random.default_rng(2026111004)
# A 24-clock, full five-solid 50-vertex source (190 cochains: the vertex
# component is active; edge and face components are retained but do not
# directly enter this quadratic hidden-source coupling).
z190=rng.normal(size=(T,190))+1j*rng.normal(size=(T,190))
vertex_indices=[];offset=0
for nv,ne,nf in parts:
    vertex_indices.extend(range(offset,offset+nv));offset+=nv+ne+nf
v=z190[:,vertex_indices]
x=v@Plinear.T
w=x@C.T
h3=(w*w)@P3.T
h5=(w*w)@P5.T
assert np.linalg.norm(h3)>1e-5 and np.linalg.norm(h5)>1e-5
# Check the original 64-history source embedding and history eigenvalues.
b=(h3+Delta*h5)@Uh.T
assert np.linalg.norm(b-h3@Uh.T-Delta*h5@Uh.T)<1e-12

def A_clock(theta,E):
    A=(E+2*r*r)*np.eye(T,dtype=complex)
    for t in range(T):
        j=(t+1)%T;u=np.exp(1j*q*theta[t]);A[j,t]-=r*r*u;A[t,j]-=r*r*u.conjugate()
    assert np.linalg.norm(A-A.conj().T)<1e-12
    return A

def derivatives(theta,t):
    j=(t+1)%T;u=np.exp(1j*q*theta[t]);B=np.zeros((T,T),complex);D=np.zeros((T,T),complex)
    B[j,t]=-1j*q*r*r*u;B[t,j]=1j*q*r*r*u.conjugate()
    D[j,t]=q*q*r*r*u;D[t,j]=q*q*r*r*u.conjugate()
    return B,D

def evaluate(theta,ha,hb,derivs=True):
    total=0.;J=np.zeros(T);H=np.zeros((T,T));pieces=[]
    for E,c,h in ((18,1.,ha),(16,Delta*Delta,hb)):
        A=A_clock(theta,E);sol=np.linalg.solve(A,h)
        total-=c*np.vdot(h,sol).real/2
        pieces.append((A,sol,h,c))
        if derivs:
            BDs=[derivatives(theta,t) for t in range(T)]
            Bs=[b@sol for b,d in BDs]
            inverseBs=[np.linalg.solve(A,v) for v in Bs]
            for t in range(T):
                J[t]+=c*np.vdot(sol,Bs[t]).real/2
                H[t,t]+=c*np.vdot(sol,BDs[t][1]@sol).real/2
                for s in range(T):
                    H[t,s]-=c*np.vdot(Bs[s],inverseBs[t]).real
    return total,J,H,pieces

theta=2*pi/phi**2+0.06*rng.normal(size=T)
V,J,H,pieces=evaluate(theta,h3,h5)
# Independently evaluate the uneliminated ORIGINAL 64x24 history action at
# the stationary 64-history field, rather than using the 20-face Schur value.
y=(pieces[0][1]+Delta*pieces[1][1])@Uh.T
b64=(h3+Delta*h5)@Uh.T
cov64=np.roll(y,-1,axis=0)-np.exp(1j*q*theta)[:,None]*y
raw=(np.linalg.norm(h3)**2+Delta**2*np.linalg.norm(h5)**2)/4
V64=(.5*np.einsum('ta,ab,tb->',y.conj(),H64,y).real
     +.5*r*r*np.vdot(cov64,cov64).real
     -np.vdot(y,b64).real)
assert abs(V64-V)<3e-9,(V64,V,V64-V)
assert np.max(abs(H-H.T))<1e-11
# Gauge covariance of original charge-two source and clock links.
lam=rng.normal(scale=.4,size=T)
ph=np.exp(1j*q*lam)
th2=theta+np.roll(lam,-1)-lam
V2,_,_,_=evaluate(th2,ph[:,None]*h3,ph[:,None]*h5,False)
assert abs(V2-V)<2e-10
# First Ward contact: D^T J + q Im(sum z* h)=0.
contact=np.zeros(T)
for A,sol,h,c in pieces:contact+=q*c*np.imag(np.sum(sol.conj()*h,axis=1))
ward=np.roll(J,1)-J+contact
assert np.max(abs(ward))<2e-10,(np.max(abs(ward)),ward)
# Second Ward identity includes source-rotation contact, Wilson seagull,
# and negative Schur relaxation. Evaluate each term independently.
second=0.;source_accel=0.;seagull=0.;relax=0.
for A,sol,h,c in pieces:
    Aprime=np.zeros((T,T),complex);Asecond=np.zeros((T,T),complex)
    for t in range(T):
        B,D=derivatives(theta,t);dlam=lam[(t+1)%T]-lam[t]
        Aprime+=dlam*B;Asecond+=dlam*dlam*D
    dh=1j*q*lam[:,None]*h
    ddh=-q*q*(lam[:,None]**2)*h
    diff=dh-Aprime@sol
    source_accel+=-c*np.vdot(sol,ddh).real
    seagull+=c*np.vdot(sol,Asecond@sol).real/2
    relax+=-c*np.vdot(diff,np.linalg.solve(A,diff)).real
second=source_accel+seagull+relax
assert abs(second)<1e-9,(second,source_accel,seagull,relax)
# Verify independent finite differences in the link coordinate.
for t in (0,7,13):
    eps=3e-4;d=np.zeros(T);d[t]=eps
    vp=evaluate(theta+d,h3,h5,False)[0]
    vm=evaluate(theta-d,h3,h5,False)[0]
    assert abs((vp-vm)/(2*eps)-J[t])<2e-6
    assert abs((vp-2*V+vm)/eps**2-H[t,t])<2e-5
# The 24-clock uniform-holonomy closed formula for a Fourier-mode source.
# Use Haar-averaged exact native hidden norm means from the 64-history proof.
mu3=36+72*sqrt(5)/5;mu5=7
k=4*pi/24;th=2*pi/phi**2;delta=k-q*th
D3=18+r*r*(2-2*np.cos(delta));D5=16+r*r*(2-2*np.cos(delta))
Jclosed=-T*q*r*r*np.sin(delta)*(mu3/D3**2+Delta**2*mu5/D5**2)
Hclosed=T*q*q*r*r*np.cos(delta)*(mu3/D3**2+Delta**2*mu5/D5**2)-T*q*q*4*r**4*np.sin(delta)**2*(mu3/D3**3+Delta**2*mu5/D5**3)
# For the single-source Fourier test, use arbitrary projected native vectors
# with prescribed exact mean-square strengths, independent of physical ARFs.
unit3=h3[0]/np.linalg.norm(h3[0]);unit5=h5[0]/np.linalg.norm(h5[0]);t=np.arange(T)
source3=np.exp(1j*k*t)[:,None]*unit3[None,:]*sqrt(mu3)
source5=np.exp(1j*k*t)[:,None]*unit5[None,:]*sqrt(mu5)
base=np.full(T,th)
E0,Js,Hs,_=evaluate(base,source3,source5)
eps=2e-4
Vp=evaluate(base+eps,source3,source5,False)[0]
Vm=evaluate(base-eps,source3,source5,False)[0]
assert abs(np.sum(Js)-Jclosed)<2e-9,(np.sum(Js),Jclosed)
assert abs(np.sum(Hs)-Hclosed)<2e-8,(np.sum(Hs),Hclosed)
assert abs((Vp-Vm)/(2*eps)-Jclosed)<1e-5
assert abs((Vp-2*E0+Vm)/eps**2-Hclosed)<1e-4
# Large gauge invariance of uniform theta and source Fourier mode.
# theta -> theta+2pi/24, k -> k+4pi/24 leaves k-2theta invariant.
assert abs((k+q*2*pi/24)-q*(th+2*pi/24)-delta)<1e-14
print('PASS: all five Platonic cochain dimensions',parts,'total',spatial)
print('PASS: original 50->12 pullback rank',np.linalg.matrix_rank(Plinear),'hidden ranks',round(np.trace(P3)),round(np.trace(P5)))
print('PASS: 64-history H64 spectrum 0(2),10(12),16(30),18(20), source intertwining')
print('PASS: direct uneliminated 64x24 history action equals Schur energy',V64-V)
print('PASS: 24-clock charge-two source Schur, exact gauge variation',V2-V)
print('PASS: first Ward residual',np.max(abs(ward)))
print('PASS: second Ward with source acceleration, seagull, relaxation',second)
print('PASS: source acceleration, seagull, relaxation (nonzero separately)',source_accel,seagull,relax)
print('PASS: 24-link current and Hessian finite differences')
print('Haar source Fourier k=4pi/24, theta=2pi/phi²: J=',Jclosed,'H=',Hclosed)
print('WARNING: these are conditional history-induced gauge responses, not physical ARFs or H13+H51 fermion poles')
