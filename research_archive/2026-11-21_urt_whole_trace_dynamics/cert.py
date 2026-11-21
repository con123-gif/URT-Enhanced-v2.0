import sympy as s
from fractions import Fraction
import math
# Natural units. A is Euler anomaly coefficient; y=H^2; x=ln(a).
A,G,H,hd,y,m,r,L=s.symbols('A G H hd y m r L', positive=True)
K=3*A/(8*s.pi**2)
# theta=rho-3p; continuity gives theta=4rho+rho_dot/H.
ra=K*H**4
theta=4*ra+s.diff(ra,H)*hd/H
assert s.simplify(theta-24*A*(H**4+H**2*hd)/(16*s.pi**2))==0
beta=s.simplify(8*s.pi*G*K/3)
assert beta==A*G/s.pi
# y-beta*y^2=m+r+L, here m,r,L are Friedmann-normalized densities.
g=(3*m+4*r)/(y*(1-2*beta*y))
assert s.simplify(g*y*(1-2*beta*y)-3*m-4*r)==0
# Dimensionless h=beta*y, low branch. For L=0, m+r=y*(1-h),
# and 3m+4r>=3(m+r), so g>=3(1-h)/(1-2h)>3.
h=s.symbols('h', positive=True)
assert s.simplify(3*(1-h)/(1-2*h)-3-3*h/(1-2*h))==0
# radiation-only exact branch entropy growth rate:
assert s.simplify(g.subs({m:0,r:y-beta*y*y})-4*(1-beta*y)/(1-2*beta*y))==0
A_SM=4*Fraction(1,360)+45*Fraction(11,720)+12*Fraction(31,180)
assert A_SM==Fraction(1991,720)
A_gamma=Fraction(31,180)
tp=math.sqrt(1.054571817e-34*6.67430e-11/299792458.**5)
H0=67.4e3/3.085677581491367e22
print('A_SM=',A_SM,'A_gamma=',A_gamma)
for name,Ai in [('photon',A_gamma),('free SM census',A_SM)]:
    h0=float(Ai)/math.pi*(H0*tp)**2
    hp=math.sqrt(math.pi/float(Ai))
    print(name,'beta*H0^2=',format(h0,'.12e'),'formal vacuum H*tP=',format(hp,'.12g'),'H in s^-1=',format(hp/tp,'.12e'))
# Test algebraic branch with numerical h in its controlled lower domain.
for h0 in (.0001,.01,.1,.25,.49):
    for fm in (0.,.3,1.):
        gv=(4-fm)*(1-h0)/(1-2*h0)
        assert gv>=3
print('PASS Euler trace conservation, quadratic Friedmann relation, low-branch no-acceleration inequality and field census')
