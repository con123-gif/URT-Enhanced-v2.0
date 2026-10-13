"""Newton's Cathedral: independent geometric and modular-response checks.

Verified identities:
  - Icosahedral 12-direction angular stencil (moments 2,4,6)
  - Refined icosahedral triangulation V=10*f^2+2, F=20*f^2
  - Conditional four-state-per-vertex area/entropy relation
  - Radius-dependent modular Gibbs profile compatible with the CFT ball kernel
  - Integrated linear modular first law for a uniform perturbation

Physical limitations: the scalar stencil, independent fourfold boundary sites,
and radius-dependent modular profile are TEST CONSTRUCTIONS, not derivations
from the frozen Cathedral microscopic transfer. The CFT modular kernel is
borrowed from existing entanglement-equilibrium results.
"""
import math
import sympy as sp

q = sp.sqrt(5)
phi = (1+q)/2
D = sp.Rational(3,20) - 80*sp.pi/(1053*phi)
eta = -sp.log(D)
V = []
for a in (-1,1):
    for b in (-1,1):
        V += [sp.Matrix([0,a,b*phi]),sp.Matrix([a,b*phi,0]),sp.Matrix([b*phi,0,a])]
assert len(V)==12
n = [v/sp.sqrt(phi+2) for v in V]
X,Y,Z = sp.symbols('X Y Z', real=True)
k = sp.Matrix([X,Y,Z]); k2 = X**2+Y**2+Z**2
M2 = sp.simplify(sp.expand(sum((v.dot(k))**2 for v in n)))
M4 = sp.simplify(sp.expand(sum((v.dot(k))**4 for v in n)))
assert sp.simplify(M2-4*k2)==0
assert sp.simplify(M4-sp.Rational(12,5)*k2**2)==0
# Fourier symbol: L_a=-k^2 +a^2*k^4/20 - a^4 M6(k)/1440 + O(a^6).
unit_vertex = n[0]
unit_twofold = sp.Matrix([0,0,1])
unit_face = sp.Matrix([1,1,1])/sp.sqrt(3)
def m6(axis): return sp.simplify(sum((v.dot(axis))**6 for v in n))
assert m6(unit_vertex)==sp.Rational(52,25)
assert m6(unit_twofold)==sp.Rational(8,5)
assert m6(unit_face)==sp.Rational(68,45)

print('Angular moments: M2=4|k|^2 and M4=12/5 |k|^4 verified exactly')
print('M6: 5-fold',m6(unit_vertex),'2-fold',m6(unit_twofold),'3-fold',m6(unit_face))
print('Laplacian symbol: -k^2 + a^2 k^4/20 - a^4 M6/1440 + O(a^6)')

# Subdivision f: 20*f^2 triangular faces; 30*f^2 edges; 10*f^2+2 vertices.
for f in (1,2,3,8,32):
    F=20*f*f; E=30*f*f; Vert=10*f*f+2
    assert Vert-E+F ==2 and 3*F==2*E
    # equilateral piecewise-flat triangles of intrinsic side-length a
    area_in_a2=sp.Rational(F,4)*sp.sqrt(3)
    entropy_in_kB=Vert*sp.log(4)
    area_law= (2*sp.log(4)/sp.sqrt(3))*area_in_a2 + 2*sp.log(4)
    assert sp.simplify(entropy_in_kB-area_law)==0
    print(f'f={f:>2}: V={Vert:>5}, E={E:>5}, F={F:>5}, A/a^2={float(area_in_a2):.7f}, S/kB={float(entropy_in_kB):.7f}')
ellP2_per_a2 = sp.sqrt(3)/(8*sp.log(4))
print('CONDITIONAL ell_P^2/a^2 =',sp.N(ellP2_per_a2,17))

# Candidate modular profile imposed by CFT conformal Killing weight.
# p_R(r)= 1/[1+exp(2eta(1-r^2/R^2))]
# s_R(r)=eta/(4Delta)*(1-r^2/R^2)
# local K rail gap = ln((1-p)/p) = 2eta*(1-r^2/R^2)
# The CFT ball K=2*pi*integral w_R(r) T00 d^3x with
# w_R(r)=(R^2-r^2)/(2R).
# Hence local energy gap must be eps_R=2eta/(pi R) to match the central
# Cathedral gap at every R. This is *R-dependent*, an obstruction for a
# single fixed local energy operator across all balls.
eta_f=float(sp.N(eta,30))
D_f=float(sp.N(D,30))
pstar=float(sp.N(D**2/(1+D**2),30))
R=1.0
pR=lambda r,R: 1.0/(1.0+math.exp(2*eta_f*(1-(r/R)**2)))
sR=lambda r,R: eta_f/(4*D_f)*(1-(r/R)**2)
assert abs(pR(0,R)-pstar)<1e-17 and pR(R,R)==0.5
for frac in (0.0,.25,.5,.75,1.0):
    r=frac*R
    ell=math.log((1-pR(r,R))/pR(r,R))
    assert abs(ell-2*eta_f*(1-frac*frac))<1e-11
    print(f'r/R={frac:.2f}: p={pR(r,R):.12g}, s={sR(r,R):.9g}, modular-gap={ell:.9g}')
print('required gap eps(R) = 2eta/(pi R) =',2*eta_f/math.pi,'/R')
print('same local cell at radius 0.5R: p_B_R=',pR(.5*R,R),'p_B_2R=',pR(.5*R,2*R))

# Quadrature of the exact CFT ball modular response with the nonuniform
# reference state. A radius-independent local response dp_i=pi R/(2eta)*
# volume_i*dT00 matches the weighted modular law. This was impossible
# for a spatially uniform frozen logit without a radially weighted dp_i.
dT=1e-9
exact=(8*math.pi**2/15)*R**4*dT
for radial_bins in (20,40,80,160,320):
    h=R/radial_bins
    dS=0.0
    for i in range(radial_bins):
        r=(i+.5)*h
        dv=4*math.pi*r*r*h
        dp=(math.pi*R/(2*eta_f))*dv*dT
        dS+=2*eta_f*(1-(r/R)**2)*dp
    rel=(dS-exact)/exact
    print('radial_bins',radial_bins,'deltaS',f'{dS:.14g}','relative_error',f'{rel:.6g}')
assert abs(rel)<1e-5
print('All exact geometry identities and numerical tests passed.')

# Decisive first-order area-variation audit.
# At fixed N, a maximally mixed ququart boundary state has zero first
# derivative of von Neumann entropy under EVERY traceless deformation.
# The counting area law only varies if N or cut structure varies.
import numpy as np
rho4 = np.eye(4)/4
X = np.diag([1.0,-1.0,0.0,0.0])/2
assert np.trace(X)==0

def entropy_eigenvalues(m):
    eig=np.linalg.eigvalsh(m)
    return -float(sum(z*np.log(z) for z in eig if z>0))
for eps in (1e-2, 1e-3, 1e-4):
    sd = (entropy_eigenvalues(rho4+eps*X)-entropy_eigenvalues(rho4-eps*X))/(2*eps)
    print('ququart S derivative centered at maximally mixed, eps',eps,'=',sd)
    assert abs(sd)<1e-9

# Exact conditional Einstein coefficient from icosadelta counting,
# provided area derivative holds (which fixed-N max-mixed ququart does NOT).
# S_UV/A slope c = 2ln4 / (sqrt3 a^2), and delta A|V= -4pi R^4/15 delta Guu
# versus delta S_IR= 8pi^2 R^4/15 delta Tuu: Guu=(pi sqrt3 a^2/ln4) Tuu.
area_slope=2*math.log(4)/math.sqrt(3)
newton_over_a2=math.sqrt(3)/(8*math.log(4))
Einstein_coefficient_over_a2=math.pi*math.sqrt(3)/math.log(4)
assert abs(Einstein_coefficient_over_a2-8*math.pi*newton_over_a2)<1e-14
print('Conditional G/a^2 =',newton_over_a2)
print('Conditional (8pi G)/a^2 =',Einstein_coefficient_over_a2)

# Minimal explicit alternative using an 'inactive' pure branch and active
# entangled ququart: spectrum [1-q,q/4,q/4,q/4,q/4]. This is NOT rho_star;
# it adds geometry/occupation structure absent from the frozen 8-state.
# At q=1/2, H2'(q)=0, thus dS/dq=ln4 and a changing expected area
# a_patch*q has the required linear entropy susceptibility.
q0=0.5
p_eigs=lambda q: np.array([1-q]+[q/4]*4,dtype=float)
Socc=lambda q: -np.sum(p_eigs(q)*np.log(p_eigs(q)))
dS_dq=math.log(4*(1-q0)/q0)
assert abs(dS_dq-math.log(4))<1e-14
print('Occupation-geometry example at q=1/2: dS/dq=',dS_dq,
      'and dS/dA=ln4/a_patch; NOT a derivation from rho_star')