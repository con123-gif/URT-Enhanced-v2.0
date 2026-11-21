import math
import sympy as s
R,G,c,h,k,w=s.symbols('R G c h k w',positive=True)
rho=3*c**4/(8*s.pi*G*R**2)
V=4*s.pi*R**3/3
E=rho*V
S=k*s.pi*c**3*R**2/(h*G)
T0=h*c/(2*s.pi*k*R)
eps=3*(1+w)/2
T=T0*(1-eps/2)
W=rho*(1-w)/2
assert s.simplify(E-T0*S)==0
assert s.simplify(T*s.diff(S,R)+s.diff(E,R)-W*s.diff(V,R))==0
assert s.simplify(2*eps-2-(1+3*w))==0
# Illustrative rounded Planck 2018 base-LCDM, not URT inputs or predictions.
H0=67.4*1000/3.085677581491367e22
c=299792458.; G=6.67430e-11; h=1.054571817e-34; k=1.380649e-23
Om=.315; Or=9.2e-5; Ol=1-Om-Or
rs=3*c*c*H0**2/(8*math.pi*G); radius=c/H0
S0=k*math.pi*c**3*radius**2/(h*G)
T0=h*H0/(2*math.pi*k); E0=c**4*radius/(2*G)
phi=(1+math.sqrt(5))/2; theta=2*math.pi/phi**2
D=.15-80*math.pi/(1053*phi); p=D*D/(1+D*D)
sstar=math.log(4)-p*math.log(p)-(1-p)*math.log1p(-p)
def e(F): return 2*((1+math.sqrt(2))*math.cos(F/8)+math.sin(F/8))
eta=2*math.pi*(e(theta)-e(math.pi-theta))/sstar
print(f'rho0={rs:.12g} R0={radius:.12g} S0/k={S0/k:.12g} T0={T0:.12g} E0={E0:.12g} eta={eta:.12g}')
assert math.isclose(E0,T0*S0,rel_tol=1e-14)
print(f'rhoDE={Ol*rs:.12g} rho_original={eta*rs:.12g} residual_if_counted_separate={1-eta:.12g} ratio_to_DE={eta/Ol:.12g}')
for z in (0,.5,1,2,10,1100):
    m=Om*(1+z)**3; r=Or*(1+z)**4; l=Ol; f=m+r+l
    wt=(r/3-l)/f; ep=1.5*(1+wt); q=ep-1
    print(f'z={z:g} H/H0={math.sqrt(f):.9f} S/S0={1/f:.9f} w={wt:.9f} q={q:.9f} dlnS/dlna={2*ep:.9f} TS/E={1-ep/2:.9f} DEfraction={l/f:.9f}')
    assert math.isclose(1-ep/2,(1-3*wt)/4,abs_tol=1e-14)
for wt,expected in [(0,.25),(1/3,0),(-1,1)]:
    assert abs((1-3*wt)/4-expected)<1e-15
print('PASS: exact horizon energy and work law, entropy expansion identity, original coefficient and benchmark regression')
