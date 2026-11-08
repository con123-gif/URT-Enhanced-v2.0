#!/usr/bin/env python3
"""Original-Cathedral all-five portal: exact A5 complex Gaussian Wick counterterms.

Uses the original 190-cochain/50-vertex/64-history/24-clock November source.
Checks exact Q(sqrt(5)) spectra and U(1)-equivariant finite-cutoff recovery.
"""
from pathlib import Path
from math import sqrt, pi
import runpy, hashlib
import numpy as np
import sympy as sp

root=Path(__file__).parent
original=root/'cathedral_constructed_joint_dynamics_2026_11_07.py'
z=runpy.run_path(str(original))
C=sp.Matrix(z['C'].astype(int)); L=sp.Matrix(np.rint(z['Lface']).astype(int))
A=sp.Matrix(z['Aico']); 
W=C*C.T
P=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=P*(5*sp.eye(20)-L)/2
P5=P*(L-3*sp.eye(20))/2

# Canonical icosahedral vertex harmonic 3+5 projector via spectral interpolation.
Lico=5*sp.eye(12)-A
sq5=sp.sqrt(5)
levels=[sp.Integer(0),5-sq5,sp.Integer(6),5+sq5]
def idempotent(eig):
    out=sp.eye(12)
    for ell in levels:
        if eig!=ell:out=out*(Lico-ell*sp.eye(12))/(eig-ell)
    return sp.simplify(out)
Pi3=idempotent(5-sq5)
Pi5=idempotent(sp.Integer(6))
Pi8=sp.simplify(Pi3+Pi5)
assert sp.simplify(Pi8*Pi8-Pi8)==sp.zeros(12)
assert sp.trace(Pi3)==3 and sp.trace(Pi5)==5

# Actual original rank-eight, 50-to-12 all-five portal, white complex Gaussian.
Q=z['Plinear']; Qgram=Q@Q.T
assert np.linalg.norm(Qgram-np.asarray(Pi8,dtype=float))<1e-11
S=sp.simplify(C*Pi8*C.T)
assert sp.simplify(S-S.T)==sp.zeros(20)
assert sp.simplify(S[0,0]-(sp.Rational(3,2)+3*sq5/10))==0
assert all(sp.simplify(S[i,i]-S[0,0])==0 for i in range(20))
W2=S.multiply_elementwise(S)

# Hidden source covariance and exact counterterm matrices (12x12 compressed).
H3=sp.simplify(P3*W2*P3)
H5=sp.simplify(P5*W2*P5)
h3=3+6*sq5/5
h5=sp.Integer(1)
assert sp.simplify(H3-h3*P3)==sp.zeros(20)
assert sp.simplify(H5-h5*P5)==sp.zeros(20)
assert sp.simplify(P3*sp.ones(20,1))==sp.zeros(20,1)
assert sp.simplify(P5*sp.ones(20,1))==sp.zeros(20,1)

M3=sp.simplify(C.T*(P3.multiply_elementwise(S))*C)
M5=sp.simplify(C.T*(P5.multiply_elementwise(S))*C)
mu33=2+4*sq5/5
mu35=sp.Rational(6,5)+12*sq5/25
mu53=sp.Integer(0)
mu55=sp.Rational(4,5)
assert sp.simplify(Pi8*M3*Pi8-mu33*Pi3-mu35*Pi5)==sp.zeros(12)
assert sp.simplify(Pi8*M5*Pi8-mu55*Pi5)==sp.zeros(12)
assert sp.simplify(Pi3*M5*Pi3)==sp.zeros(12)

# Full 50-dimensional matrices have exactly the same eight nonzero eigenvalues.
Cnum=np.array(C,dtype=float)
P3num=z['P3'];P5num=z['P5']
Snum=Cnum@Q@Q.T@Cnum.T
K3=Q.T@Cnum.T@(P3num*Snum)@Cnum@Q
K5=Q.T@Cnum.T@(P5num*Snum)@Cnum@Q
v3=np.linalg.eigvalsh(K3);v5=np.linalg.eigvalsh(K5)
assert np.allclose(v3[-8:],sorted([float(mu33)]*3+[float(mu35)]*5),rtol=1e-11,atol=1e-11)
assert np.allclose(v5[-8:],sorted([0]*3+[float(mu55)]*5),rtol=1e-11,atol=1e-11)
assert np.linalg.norm(K3@K5-K5@K3)<1e-10

# Circular complex Gaussian Wick identity; normal ordering is U(1)-covariant.
c3=2/9;Delta=float(z['Delta']);c5=7*Delta**2/32
Mcombo=c3*K3+c5*K5
sigma2=0.5
mtop=c3*float(mu33)  # no five-sector counterterm on 3-irrep in actual 50->8->12 portal
assert abs(np.linalg.eigvalsh(Mcombo).max()-mtop)<1e-11
mct2=8*sigma2*mtop
assert np.linalg.eigvalsh(.5*mct2*np.eye(50)-4*sigma2*Mcombo).min()>-1e-11
# Automatic centring of h_s = P_s z^2 on A5-symmetric white 50-source Gaussian.
assert np.linalg.norm(P3num@np.diag(Snum))<1e-10
assert np.linalg.norm(P5num@np.diag(Snum))<1e-10

# Unitarity/gauge covariance of the full (complex!) finite quartic Wick-ordered source.
rng=np.random.default_rng(20261108)
def source_Q(x):
    face=Cnum@Q@x
    square=face*face
    return np.vdot(P3num@square,P3num@square).real,np.vdot(P5num@square,P5num@square).real
const3=2*sigma2**2*float(sp.trace(P3*W2))
const5=2*sigma2**2*float(sp.trace(P5*W2))
def normalQ(x):
    q3,q5=source_Q(x)
    return q3-4*sigma2*np.vdot(x,K3@x).real+const3,q5-4*sigma2*np.vdot(x,K5@x).real+const5
for i in range(50):
    x=rng.normal(size=50)+1j*rng.normal(size=50)
    angle=rng.uniform(-3,3)
    a,b=normalQ(x);aa,bb=normalQ(x*np.exp(1j*angle))
    assert abs(a-aa)<2e-9 and abs(b-bb)<2e-9
    q3,q5=source_Q(x)
    # Exactly compensated mass tensor plus scalar vacuum constant = original quartic.
    restored=c3*a+c5*b+4*sigma2*np.vdot(x,Mcombo@x).real-(c3*const3+c5*const5)
    assert abs(restored-(c3*q3+c5*q5))<2e-9

# Strengths against the native face Lface pseudoinverse, two quartets of rank 4.
response3=8*float(h3)/3
response5=8*float(h5)*Delta**2/5
assert abs(response3-(8+16*sqrt(5)/5))<1e-12
assert abs(response5-8*Delta**2/5)<1e-12

# Witness inside the actual 190-cochain/64-history/24-clock action, not a 12-field surrogate.
# The 50-vertex 3-carrier is selected by Eglobal and has zero nonlinear source.
vertex_indices=[]
Avertex=np.zeros((50,50))
for name in z['names']:
    g=z['geom'][name];lo=g['v_offset'];n=g['V']
    vertex_indices.extend(range(g['offset'],g['offset']+n))
    Avertex[lo:lo+n,lo:lo+n]=g['b1']@g['b1'].T
Avertex+=z['Cbridge'][np.ix_(vertex_indices,vertex_indices)]
E3=z['Eglobal'][:,:3]
G3=E3.T@Avertex@E3
assert np.linalg.norm(G3-np.trace(G3)/3*np.eye(3))<1e-10
geom3=float(np.trace(G3)/3)
N=24
m1=9
r=float(z['r']);theta=float(z['theta'])
ell1=2-2*np.cos(theta-2*pi*m1/N)
k3=geom3+r*r*ell1
sigma2crit=k3/(8*mtop)
assert 0.36<sigma2crit<0.38
quad_coeff=.5*k3-4*sigma2*mtop
assert quad_coeff<0
for amp in [1.,10.,100.]:
    state=np.zeros((N,190),dtype=complex)
    for j in range(N):
        f=np.exp(2j*pi*m1*j/N)*amp*E3[:,0]
        for name in z['names']:
            g=z['geom'][name];o=g['offset'];nv=g['V'];v0=g['v_offset']
            state[j,o:o+nv]=f[v0:v0+nv]
    fields=z['vertex_from_z'](state)
    assert np.max(np.linalg.norm((Cnum@Q@fields.T).T,axis=1))>0
    for v in fields:
        h=z['hidden_source'](v)
        assert max(np.linalg.norm(h[0]),np.linalg.norm(h[1]))<1e-7
    pre=float(z['geom_energy'](state,z['thetas']))
    assert abs(pre-N*.5*k3*amp**2)<1e-6*max(1,pre)
    wick=pre-4*sigma2*sum(np.vdot(v,Mcombo@v).real for v in fields)+N*(c3*const3+c5*const5)
    predicted=N*(quad_coeff*amp**2+c3*const3+c5*const5)
    assert abs(wick-predicted)<1e-6*max(1,abs(predicted))
assert sigma2>sigma2crit

print('PASS all-five original portal Q: 50→8→12, Gram QQ^T = Pi3+Pi5 exact A5 projector')
print('PASS exact S_50 face Gaussian covariance diagonal=',sp.simplify(S[0,0]))
print('PASS exact hidden covariance per complex Gaussian var sigma^2: 2sigma^4 ×',h3,'(4_3); 2sigma^4 ×',h5,'(4_5)')
print('PASS 50-vertex Wick M3 eigenvalues: 0(42),',mu33,'(3),',mu35,'(5)')
print('PASS 50-vertex Wick M5 eigenvalues: 0(45),',mu55,'(5)')
print('PASS all-site complex U(1) rotations preserve quartic Wick counterterms')
print('PASS exact finite-cutoff tensor counterterm and vacuum subtraction restore original positive quartic')
print('PASS conservative uniform correction at sigma^2=.5:',f'{mct2:.15f}')
print('PASS original 190×64×24 source-free triplet Wick instability at sigma2=.5')
print('full 24-clock bare geometry g3=',f'{geom3:.15f}')
print('full 24-clock critical sigma2=',f'{sigma2crit:.15f}')
print('full 24-clock negative quadratic coefficient at sigma2=.5=',f'{quad_coeff:.15f}')
print('PASS Gibbs-weighted source dual susceptibility = (',sp.simplify(8*h3/3),'+',f'{8*Delta**2/5:.12g}',') sigma^4')
print('SOURCE SHA256',hashlib.sha256(original.read_bytes()).hexdigest())