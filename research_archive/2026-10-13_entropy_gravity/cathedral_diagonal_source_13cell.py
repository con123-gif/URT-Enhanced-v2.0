"""Construct the 13-site Laplacian, its symmetry eigenspaces, and exact
necessary diagonal population-to-entropy response.

The spectral quadratic form is fixed by the graph, but its coupling to K_hid
is not fixed by the spectrum. This file does not claim the Einstein equations.
"""
import numpy as np
from scipy.linalg import eigh
phi=(1+np.sqrt(5))/2
raw=[]
for a in (-1,1):
    for b in (-1,1):
        raw.extend([(0,a,b*phi),(a,b*phi,0),(b*phi,0,a)])
raw=np.array(raw,float)
A=np.zeros((12,12))
for i in range(12):
    for j in range(i+1,12):
        if np.isclose(raw[i]@raw[j],phi,atol=1e-12):
            A[i,j]=A[j,i]=1
assert (A.sum(axis=0)==5).all()
L=np.zeros((13,13))
L[0,0]=12
L[0,1:]=-1
L[1:,0]=-1
L[1:,1:]=6*np.eye(12)-A
lamb,U=eigh(L)
target=np.array([0]+[6-np.sqrt(5)]*3+[7]*5+[6+np.sqrt(5)]*3+[13.])
assert np.allclose(lamb,target,atol=1e-12)
print('13-site Laplacian eigenvalues:',np.round(lamb,12))
print('triplet eigenvalues:',6-np.sqrt(5),6+np.sqrt(5))
print('exact normalized graph quadratic invariant:')
print('E_3/3p = (6-sqrt(5))||x3||^2 +(6+sqrt(5))||y3p||^2')

Delta=3/20-80*np.pi/(1053*phi)
eta=-np.log(Delta)
p=Delta**2/(1+Delta**2)
# K_diag(t)=K_star+t*g*E*(P5-P3), so the energy gap is 2eta+2tgE
# p(t)=1/(1+exp(2eta+2tgE)).
g=1 # unit-normalized symbolic test; not a physically derived coupling
E=0.6 # any independent dimensionless perturbation of graph quadratic form
p_of_t=lambda t:1/(1+np.exp(2*eta+2*t*g*E))
S=lambda t:-(p_of_t(t)*np.log(p_of_t(t))+(1-p_of_t(t))*np.log(1-p_of_t(t)))+np.log(4)
h=1e-4
numdp=(p_of_t(h)-p_of_t(-h))/(2*h)
numds=(S(h)-S(-h))/(2*h)
pred_dp=-2*p*(1-p)*g*E
pred_ds=-4*eta*p*(1-p)*g*E
print('linear diagonal dp/dt:',numdp,'predicted:',pred_dp)
print('linear diagonal dS/dt/kB:',numds,'predicted:',pred_ds)
assert abs(numdp-pred_dp)<1e-11
assert abs(numds-pred_ds)<1e-10
print('DIAGONAL scalar channel: nonzero linear entropy response, with undetermined overall coupling g')