"""Cathedral A5 selection rule and finite entropy response for hidden fourfolds.

Representation theory: H13 = 1+3+3'+5+1, Hhidden=4+4.
The direct linear equivariant map H13 -> 4 is zero, while
3 tensor 3' -> 4 is unique (one multiplicity), and 4 in 4 tensor 4
is also unique. This provides a symmetry-allowed *quadratic* coupling.

For an off-diagonal Hermitian Gibbs generator perturbation
K(x)=eta*(3P3+5P5) + x*[0 M;M^T 0],
S'(0)=0 and S''(0)/kB = -p*(1-p)*Tr(M^T M).
Its first-order density coherence responds with the logarithmic mean
L(a,b)=(a-b)/(log(a)-log(b))=1/chi_35.

No physical matter-gravity coupling constant or stress tensor is deduced.
"""
import sympy as s
import numpy as np
from scipy.linalg import expm
phi=(1+s.sqrt(5))/2
phib=(1-s.sqrt(5))/2
sizes=[1,15,20,12,12]
characters={
 '1':[1,1,1,1,1],
 '3':[3,-1,0,phi,phib],
 '3p':[3,-1,0,phib,phi],
 '4':[4,0,1,-1,-1],
 '5':[5,1,-1,0,0]
}
def inner(x,y):
    return s.simplify(sum(sizes[i]*x[i]*y[i] for i in range(5))*s.Rational(1,60))
ch13=[2*characters['1'][i]+characters['3'][i]+characters['3p'][i]+characters['5'][i] for i in range(5)]
ch3x3p=[characters['3'][i]*characters['3p'][i] for i in range(5)]
ch4x4=[characters['4'][i]**2 for i in range(5)]
assert inner(ch13,characters['4'])==0
assert inner(ch3x3p,characters['4'])==1
assert inner(ch3x3p,characters['5'])==1
assert all(inner(ch3x3p,characters[r])==0 for r in ('1','3','3p'))
assert inner(ch4x4,characters['4'])==1
print('H13 -> hidden 4 linear A5 multiplicity:',inner(ch13,characters['4']))
print('3 tensor 3p = 4 + 5, multiplicity of 4:',inner(ch3x3p,characters['4']))
print('4 tensor 4 = 1+3+3p+4+5:',{r:inner(ch4x4,characters[r]) for r in characters})

phi_f=float(phi)
Delta=3/20-80*np.pi/(1053*phi_f)
eta=-np.log(Delta)
p=Delta**2/(1+Delta**2)
a=(1-p)/4
b=p/4
L=(a-b)/(np.log(a)-np.log(b))
chi=1/L
assert np.isclose(chi,8*eta*(1+Delta**2)/(1-Delta**2))
print('Delta=',Delta,'eta=',eta,'pstar=',p)
print('logarithmic mean L=',L,'inverse BKM stiffness chi=',chi)

# Numerical Hessian of finite Gibbs entropy for arbitrary 4x4 coupling.
rng=np.random.default_rng(2026)
M=rng.normal(size=(4,4))
G=np.block([[np.zeros((4,4)),M],[M.T,np.zeros((4,4))]])
K0=eta*np.diag([3.0]*4+[5.0]*4)
def S(x):
    m=expm(-(K0+x*G))
    m=m/np.trace(m)
    e=np.linalg.eigvalsh(m)
    return -np.sum(e*np.log(e))
def rho(x):
    m=expm(-(K0+x*G))
    return m/np.trace(m)
for h in (0.01,0.003,0.001):
    first=(S(h)-S(-h))/(2*h)
    second=(S(h)-2*S(0)+S(-h))/h**2
    target=-p*(1-p)*np.sum(M*M)
    print('h=',h,'Sprime~',first,'Ssecond~',second,'exact',target,'err',second-target)
    assert abs(first)<1e-8
assert abs(second-target)<2e-6
for h in (0.01,0.001):
    d=(rho(h)-rho(-h))/(2*h)
    err=np.max(np.abs(d[:4,4:]+L*M))
    print('coherence derivative error',err,'at h',h)
assert err<1e-7
print('All A5 selection rules and matrix response checks passed.')