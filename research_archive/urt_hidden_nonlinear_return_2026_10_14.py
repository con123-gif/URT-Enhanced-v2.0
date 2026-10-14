"""Constructive continuation of the A5 linear hidden-channel obstruction.
Requires numpy. Run: python research_archive/urt_hidden_nonlinear_return_2026_10_14.py
Shows a possible finite equivariant non-linear coupling, not the canonical physical H64.
"""
import itertools as it
import numpy as np
from math import sqrt,pi,e,cos,sin
phi=(1+sqrt(5))/2
delta=3/20-80*pi/(1053*phi)
v=np.array([[0,a,b*phi] for a in (-1,1) for b in (-1,1)]
 +[[a,b*phi,0] for a in (-1,1) for b in (-1,1)]
 +[[a*phi,0,b] for a in (-1,1) for b in (-1,1)])
f=set()
for i,j,k in it.combinations(range(12),3):
 n=np.cross(v[j]-v[i],v[k]-v[i]);d=np.linalg.norm(n)
 if d<1e-10:continue
 s=(v-v[i])@n/d
 if s.min()<-1e-8 and s.max()>1e-8:continue
 face=tuple(np.where(abs(s)<1e-8)[0])
 if len(face)==3:f.add(face)
f=sorted(f);assert len(f)==20
b=np.zeros((20,12))
for k,face in enumerate(f):b[k,list(face)]=1
a=np.zeros((20,20))
for i,j in it.combinations(range(20),2):
 if len(set(f[i])&set(f[j]))==2:a[i,j]=a[j,i]=1
w,u=np.linalg.eigh(a)
p3=u[:,abs(w)<1e-8];p5=u[:,abs(w+2)<1e-8]
assert p3.shape==p5.shape==(20,4)
assert np.linalg.norm(b.T@p3)+np.linalg.norm(b.T@p5)<1e-10
# A5 characters on classes 1,2,3,5a,5b
sz=np.array([1,15,20,12,12]);h13=np.array([13,1,1,3,3])
four=np.array([4,0,1,-1,-1])
linear=int(np.dot(sz,h13*four)/60)
sym2=(h13*h13+h13[[0,0,2,4,3]])/2
quadratic=int(np.dot(sz,sym2*four)/60)
assert linear==0 and quadratic==4
def response(x):
 y=(b@x)**2
 return np.r_[p3.T@y,p5.T@y]
def jac(x):
 y=b@x
 return np.vstack((2*p3.T@(y[:,None]*b),2*p5.T@(y[:,None]*b)))
x=np.arange(1.,13.);x=x/np.linalg.norm(x)
j=jac(x)
assert np.linalg.matrix_rank(j,tol=1e-9)==8
# Positive-Gram extension is an existence witness, NOT selected H64.
scale=np.diag([1.]*4+[delta]*4)
def gram(x):
 m=scale@jac(x)
 r=np.block([[np.eye(12),m.T],[m,scale]])
 return r.T@r
t=gram(x);assert np.linalg.eigvalsh(t).min()>0
z=2+np.linalg.eigvalsh(t[12:,12:]).max()
def ret(x):
 T=gram(x);c=T[:12,12:];d=T[12:,12:]
 return c@np.linalg.solve(z*np.eye(8)-d,c.T)
assert np.linalg.norm(ret(x))>0 and np.linalg.norm(ret(np.zeros(12)))<1e-12
xd=np.arange(12.,0.,-1.);xd=xd/np.linalg.norm(xd)
h=1e-5
der=(ret(x+h*xd)-ret(x-h*xd))/(2*h)
assert np.linalg.norm(der)>1e-6
print("linear multiplicity",linear,"quadratic multiplicity",quadratic)
print("hidden rank",np.linalg.matrix_rank(j),"Gram min eigen",np.linalg.eigvalsh(t).min())
print("nonzero Feshbach return norm",np.linalg.norm(ret(x)),"derivative",np.linalg.norm(der))
