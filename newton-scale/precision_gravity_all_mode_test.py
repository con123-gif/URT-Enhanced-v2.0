#!/usr/bin/env python3
"""Newton-Scale exact quartic-filter and all-spin-2-modes UV theorem.

Run: python newton-scale/precision_gravity_all_mode_test.py
Requires SymPy/mpmath. The Fisher-precision Fierz-Pauli scale action is
an explicit additional physical hypothesis; this is NOT nonlinear GR.
"""
from pathlib import Path
import runpy
import sympy as S
import mpmath as m
root=Path(__file__).resolve().parent
g=runpy.run_path(str(root/"five_cube_spectral_filter_exact.py"))
P,L,D=g["Pm"],g["L"],g["D"]
Qd=D*L*D.T-L
G=Qd*Qd/120
s=(3-S.sqrt(5))/2
K=P**5+G**3
assert K.eigenvals()=={S.Integer(0):1,S.Rational(1,1024):8,
                        S.Rational(1,216):6,S.Rational(32,3125):5}
assert K*L==L*K and P*G==S.zeros(20)
assert S.Rational(2,5)**4>s**4>S.Rational(2,5)**5
assert S.Rational(1,6)**2>s**4>S.Rational(1,6)**3
lam=S.Rational(32,3125)
assert lam<s**4

bands=[(S.Rational(1,1024),8),(S.Rational(1,216),6),
       (S.Rational(32,3125),5)]
W=lambda n:sum(mult*ev**n for ev,mult in bands)
T=S.factor(sum(mult/(1-ev) for ev,mult in bands))
mu=lambda n:S.factor(W(n)/T)
for n in range(45):
    assert mu(n)>0 and mu(n)<=mu(0)*lam**n
# Exact Cauchy variational estimate for the nonconstant 19-mode trace
# W and the maximal closed weighted-difference scale action Q:
# v_n=sqrt(mu_n), r_n=v_(n+1)/v_n, w_n=s^-n/v_(n+1).
# H=Q^*Q≥0; unique normalized zero mode v.
# At q_n=s^-n, R_n=q_n² <n|(q_n²+H)^-1|n>:
# R_n <= mu_n/mu_0 + mu_n*(s^-2n-1)/(1-s²).
# Then s^-2n R_n <= (lam/s²)^n + mu0/(1-s²)(lam/s⁴)^n ->0.
assert 0<lam/s**4<1

m.mp.dps=80
sn=m.mpf(str(S.N(s,82)))
eigs=[(m.mpf(1)/1024,8),(m.mpf(1)/216,6),
      (m.mpf(32)/3125,5)]
Wp=lambda n:sum(mult*ev**n for ev,mult in eigs)
Tm=sum(mult/(1-ev) for ev,mult in eigs)
N=47
v=[m.sqrt(Wp(n)/Tm) for n in range(N)]
r=[v[n+1]/v[n] for n in range(N-1)]
def inverse_diagonal(n,precision=True):
    q2=sn**(-2*n)
    weights=[sn**(-j)/v[j+1] if precision else m.mpf(1)
             for j in range(N-1)]
    a=[];b=[]
    for j in range(N):
        aj=q2+(weights[j-1]**2 if j>0 else 0)
        if j<N-1:aj+=(weights[j]*r[j])**2
        a.append(aj)
        if j<N-1:b.append(-weights[j]**2*r[j])
    left=[a[0]]
    for j in range(1,N):left.append(a[j]-b[j-1]**2/left[-1])
    right=[None]*N;right[-1]=a[-1]
    for j in range(N-2,-1,-1):right[j]=a[j]-b[j]**2/right[j+1]
    denom=a[n]-(b[n-1]**2/left[n-1] if n else 0)
    if n<N-1:denom-=b[n]**2/right[n+1]
    return q2/denom
R0=inverse_diagonal(0)
for n in (0,1,2,5,10,20):
    value=inverse_diagonal(n)
    bound=v[n]**2/v[0]**2+v[n]**2*(sn**(-2*n)-1)/(1-sn**2)
    assert value>0 and value<bound*(1+m.mpf('1e-65'))
    unweighted=inverse_diagonal(n,False)
    # Full FP static response differs by at most factor 4/3.
    print("n",n,"full R",m.nstr(value,14),
          "ordinary",m.nstr(unweighted,12),
          "all-mode bound",m.nstr(bound,12))
assert float(inverse_diagonal(20)*sn**(-40))<1e-8
print("PASS: exact positive K4, all-mode Fisher precision transfer,")
print("      normalized massless zero mode and analytic UV/localization bound")
print("lambda/s4 =",S.N(lam/s**4,18))
print("physical nonlinear GR/actual sub-Planck observability: NOT PROVED")
