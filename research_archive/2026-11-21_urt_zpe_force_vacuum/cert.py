import sympy as s
from math import pi
# Natural units; B is coefficient of scalar curvature, R is curvature radius.
B,R,G,rho,H=s.symbols('B R G rho H', real=True, positive=True)
A=4*s.pi*R**2; V=4*s.pi*R**3/3; T=1/(2*s.pi*R)
S=4*s.pi*B*A
assert s.simplify(T*S/V-6*B/R**2)==0
# T_B=-2B G_munu; G_munu=-3 H^2 g_munu in de Sitter.
# energy density in signature -+++ is -6B H^2.
rhoB=-6*B/R**2
assert s.simplify(T*S/V+rhoB)==0
assert s.simplify(1/(16*s.pi*G)+B-(1/G+16*s.pi*B)/(16*s.pi))==0
# Weyl anomaly a=31/180 Maxwell, E4=24H^4, T^mu_mu=-4 rho.
a=s.Rational(31,180)
rho_gamma=a*24*H**4/(4*(4*s.pi)**2)
assert s.simplify(rho_gamma-s.Rational(31,480)*H**4/s.pi**2)==0
assert s.simplify(rho_gamma/(3*H**2/(8*s.pi*G))-31*G*H**2/(180*s.pi))==0
# Numerical comparison only, not fit or theory input.
Gsi=6.67430e-11; c=299792458.; hbar=1.054571817e-34; Mpc=3.085677581491367e22
H0=70e3/Mpc; Hd=H0*(.7**.5); tp2=hbar*Gsi/c**5
rd=3*c*c*Hd**2/(8*pi*Gsi); rg=31*hbar*Hd**4/(480*pi*pi*c**3)
JGeV=1.602176634e-10; conv=JGeV**4/(hbar*c)**3
print('H_ref',Hd,'rho_dS J/m3',rd,'rho_dS GeV4',rd/conv)
print('Maxwell anomaly J/m3',rg,'fraction',rg/rd,'percent',100*rg/rd)
print('gap benchmark J/m3',rd*(1-.95615737316656))
print('EW tree potential GeV4',-125**2*246**2/8,'ratio magnitude',(125**2*246**2/8)/(rd/conv))
print('QCD characteristic scale m^4 (.2 GeV)',.2**4,'ratio',.2**4/(rd/conv))
print('PASS exact curvature response / Wald entropy cancellation and Maxwell anomaly coefficient; benchmark not a prediction')
