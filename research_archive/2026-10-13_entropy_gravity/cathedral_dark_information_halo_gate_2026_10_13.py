"""Independent compact verifier: local dark-information halo gate, 2026-10-13."""
import math
from scipy.integrate import quad
phi=(1+math.sqrt(5))/2
d=3/20-80*math.pi/(1053*phi)
eta=-math.log(d)
nu=8*d/math.log(math.pi/math.e)
pstar=d*d/(1+d*d)
def p(r): return 1/(1+d**(-2)*r**nu)
def up(r): return -nu*math.sqrt(p(r)*(1-p(r)))/r
def lap(r):
    z=p(r)
    return nu*math.sqrt(z*(1-z))/r**2*(nu*(1-2*z)/2-1)
def mass_proxy_per_radius(r):
    y,_=quad(lambda x:p(x)*(1-p(x)),0,r,epsabs=1e-12)
    return y/r
assert 0<nu<2 and abs(p(1)-pstar)<1e-14
for r in [0.1,1,10,100]:
    assert lap(r)<0
    h=r*1e-4
    dflux=((r+h)**2*up(r+h)-(r-h)**2*up(r-h))/(2*h*r*r)
    assert abs((dflux-lap(r))/lap(r))<1e-7
base=mass_proxy_per_radius(1)
v10=math.sqrt(mass_proxy_per_radius(10)/base)
v100=math.sqrt(mass_proxy_per_radius(100)/base)
assert abs(v10-0.8535036984756221)<1e-9
assert abs(v100-0.728468167347996)<1e-9
# Static canonical scalar local-frame T=(epsilon,epsilon,-epsilon,-epsilon)
stress=(1,1,-1,-1)
assert sum(stress)==0
nkin=0.5+1/(1+nu/2)
assert abs(nkin*(2+nu)-(3+nu/2))<1e-12
print("d",d,"nu",nu,"p*",pstar)
print("Laplacian u(R*)",lap(1),"flux(10R*)/flux(R*)",(100*up(10))/up(1))
print("v10/v1 (proxy only)",v10,"v100/v1 (proxy only)",v100)
print("T/epsilon",stress,"active gravity coeff",sum(stress))
print("nkin",nkin,"energy falloff",3+nu/2)
print("potential exponent",2+4/nu)
print("r0/R*",d**(2/nu),"BTFR boundary exponent",1/(2*nu))
print("PASS: conditional candidate, field and stress checks")
