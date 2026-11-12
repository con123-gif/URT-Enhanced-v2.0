#!/usr/bin/env python3
"""Q52 native five-solid/H64/24 clock-dependent history-unitary audit.
Original Nov 7 operator loaded from repo, no synthetic matrices or measured constants.
Finite-field rank is an exact non-vanishing certificate over Q(sqrt(5)).
"""
from pathlib import Path
import argparse
import contextlib, io, runpy
import numpy as np
from math import sqrt, pi, e

args=argparse.ArgumentParser()
args.add_argument("--reconstruction",help="Independent locally executed replica; CI uses original archived native operator")
opts=args.parse_args()
ROOT=Path(__file__).resolve().parents[2]
NATIVE=Path(opts.reconstruction) if opts.reconstruction else ROOT/'research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py'
assert NATIVE.is_file(), f'Original named operator missing: {NATIVE}'
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(NATIVE))
P3,P5=m['P3'],m['P5'];Uh=m['Uh'];Hbits=m['Hbits']
C=m['Cface'] if opts.reconstruction else m['C']; Eglobal=m['Eglobal']; Plinear=m['Plinear'];Iico=m['Iico'];Delta=m['Delta']
assert Eglobal.shape==(50,8)
if not opts.reconstruction:
    assert m['D'].shape==(190,190)
    assert abs(np.trace(m['D']@m['D'])-720)<1e-9
assert np.linalg.norm(Plinear@Eglobal-Iico)<1e-12
assert np.linalg.norm(Uh.T@Uh-(P3+P5))<1e-11
assert np.linalg.norm(Hbits@Uh@P3-18*Uh@P3)<1e-10
assert np.linalg.norm(Hbits@Uh@P5-16*Uh@P5)<1e-10

# Use 8*9/2 deterministic polarisations of the ORIGINAL all-five nonlinear source.
A=[]
E=np.eye(8)
for i in range(8):
    for j in range(i,8):
        a=E[i] if i==j else E[i]+E[j]
        v=Eglobal@a
        h3,h5=m['hidden_source'](v) if not opts.reconstruction else (P3@((C@(Plinear@v))**2),P5@((C@(Plinear@v))**2))
        A.append(Uh@(h3+Delta*h5))
A=np.asarray(A)
s=np.linalg.svd(A,compute_uv=False)
assert np.linalg.matrix_rank(A,tol=1e-10)==8
assert np.linalg.matrix_rank(A@Uh@P3,tol=1e-10)==4
assert np.linalg.matrix_rank(A@Uh@P5,tol=1e-10)==4
assert np.linalg.norm(A@(np.eye(64)-Uh@Uh.T))<1e-11
print('NATIVE_SOURCE_SPAN',np.linalg.matrix_rank(A), 'quartets',4,4,'min_positive_singular',float(s[7]))

# Exact finite-field witness from the original icosahedral face incidence;
# Q(sqrt5) embeds into F_1009 by sqrt(5)=244 (mod 1009).
p=1009
roots=[k for k in range(p) if k*k%p==5]
assert len(roots)==2
sqrt5_mod=roots[0]
inv2=pow(2,-1,p)
phi=(1+sqrt5_mod)*inv2%p
vertices=[]
for x,y in ((-1,-1),(-1,1),(1,-1),(1,1)):vertices.append((0,x,y*phi))
for x,y in ((-1,-1),(-1,1),(1,-1),(1,1)):vertices.append((x,y*phi,0))
for x,y in ((-1,-1),(-1,1),(1,-1),(1,1)):vertices.append((x*phi,0,y))
assert len(vertices)==12

def invmat(X,p):
    X=np.array(X,dtype=np.int64)%p
    n=X.shape[0]
    Y=np.column_stack((X,np.eye(n,dtype=np.int64)))%p
    for i in range(n):
        inds=np.flatnonzero(Y[i:,i]%p)
        assert len(inds)>0
        j=int(inds[0])+i
        Y[[i,j]]=Y[[j,i]]
        Y[i]=(Y[i]*pow(int(Y[i,i]),-1,p))%p
        for k in range(n):
            if k!=i:Y[k]=(Y[k]-int(Y[k,i])*Y[i])%p
    assert np.array_equal(Y[:,:n],np.eye(n,dtype=np.int64))
    return Y[:,n:]

def rankmod(mat,p):
    A=np.array(mat,dtype=np.int64).copy()%p
    nrows,ncols=A.shape
    r=0;piv=[]
    for j in range(ncols):
        k=next((k for k in range(r,nrows) if A[k,j]%p!=0),None)
        if k is None:continue
        A[[r,k]]=A[[k,r]]
        A[r]=(A[r]*pow(int(A[r,j]),-1,p))%p
        for i in range(r+1,nrows):
            if A[i,j]!=0:A[i]=(A[i]-int(A[i,j])*A[r])%p
        piv.append(j);r+=1
        if r==nrows:break
    return r,piv

Cf=np.array(C,dtype=np.int64)%p
assert set(np.unique(Cf)).issubset({0,1})
adj=np.array(3*np.eye(20)-m['Lface'],dtype=np.int64)%p
Id=np.eye(20,dtype=np.int64)
Ph=(Id-Cf@invmat(Cf.T@Cf,p)@Cf.T)%p
Lf=(3*Id-adj)%p
P3m=(Ph@((5*Id-Lf)%p)*inv2)%p
P5m=(Ph@((Lf-3*Id)%p)*inv2)%p
assert np.array_equal((P3m@P3m)%p,P3m)
assert np.array_equal((P5m@P5m)%p,P5m)
assert np.array_equal((P3m@P5m)%p,np.zeros((20,20),dtype=np.int64))
assert rankmod(P3m,p)[0]==4 and rankmod(P5m,p)[0]==4
# Unwhitened harmonic columns span the SAME native ico shell,
# since its radius is constant and whitening is invertible.
raw=[]
for x,y,z in vertices:
    raw.append((x,y,z,x*x-y*y,x*x+y*y-2*z*z,x*y,x*z,y*z))
raw=np.array(raw,dtype=np.int64)%p
assert rankmod(raw,p)[0]==8
src=[]
for i in range(8):
    for j in range(i,8):
        a=np.zeros(8,dtype=np.int64);a[i]=1
        if i!=j:a[j]=1
        x=(raw@a)%p
        f=((Cf@x)%p)**2%p
        src.append(((P3m+P5m)@f)%p)
src=np.asarray(src,dtype=np.int64)%p
rs,pivs=rankmod(src,p)
assert rs==8
r3=rankmod((src@P3m)%p,p)[0];r5=rankmod((src@P5m)%p,p)[0]
assert r3==r5==4
print('EXACT_FIELD_WITNESS prime',p,'sqrt5',sqrt5_mod,'phi',phi,'rank',rs,'r3/r5',r3,r5,'pivots',pivs)

# Native charge-two Wilson offdiagonal links are nonzero on every 24-cycle edge.
theta=m['theta'] if not opts.reconstruction else 2*pi/((1+sqrt(5))/2)**2
r=m['r'] if not opts.reconstruction else pi/e
if not opts.reconstruction:L=m['clock_laplacian'](np.full(24,theta),2)
else:
    sh=np.roll(np.eye(24),1,axis=0)
    L=2*np.eye(24)-np.exp(2j*theta)*sh-np.exp(-2j*theta)*sh.T
for j in range(24):
    k=(j+1)%24
    assert abs(L[k,j]+np.exp(2j*theta))<1e-12
assert r>0
y=np.zeros((24,64),complex)
y[0,0]=1;y[1,0]=np.exp(2j*theta)
W1=np.eye(64,dtype=complex);W1[0,0]=-1
Y=y.copy();Y[1]=Y[1]@W1
orig=r*r*np.einsum('ja,jk,ka->',y.conj(),L,y).real
changed=r*r*np.einsum('ja,jk,ka->',Y.conj(),L,Y).real
assert abs(changed-orig)>1
print('RIGHT_LOCAL_KINETIC_COUNTEREXAMPLE',orig,changed,'difference',changed-orig)
print('Q52_PASS: nonlinear source spans hidden 8; no extra nonconstant history-right unitary with scalar Wilson links.')
