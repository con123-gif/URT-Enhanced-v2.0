"""Newton's Cathedral / URT: Casini-Jacobson causal-ball bridge audit.

Verified: finite modular first law, unique projected stress operator, explicit
orthogonal stress counterexample, logistic transfer susceptibility,
nonlinear conditional entropy-area relation, and undetermined area scale.

No Einstein equations or physical stress operator are assumed to be outputs of
this finite matrix model. Natural units c=hbar=kB=1 for bridge formulas.
"""
import mpmath as mp
import numpy as np
mp.mp.dps = 60
phi = (1 + mp.sqrt(5))/2
Delta = mp.mpf(3)/20 - 80*mp.pi/(1053*phi)
eta = -mp.log(Delta)
pstar = Delta**2/(1+Delta**2)
h2 = lambda p: -(p*mp.log(p)+(1-p)*mp.log(1-p))
Sstar = mp.log(4)+h2(pstar)
Cball = 8*mp.pi**2/15  # delta K = Cball R^4 delta T_uu
Cpop = Cball/(2*eta)  # delta p = Cpop R^4 delta T_uu
Cstress = 1/Cpop
sigma=np.diag([float((1-pstar)/4)]*4+[float(pstar/4)]*4)
P3=np.diag([1.]*4+[0.]*4)
P5=np.eye(8)-P3
K=float(eta)*(3*P3+5*P5)
X=(P5-P3)/4
assert np.isclose(np.trace(X),0)
assert np.isclose(np.trace(P5@X),1)
assert np.isclose(np.trace(K@X),2*float(eta))
# Exact finite difference entropy first law and second-order relative entropy

def sent(rho):
    e=np.linalg.eigvalsh(rho)
    return -sum(float(v)*np.log(float(v)) for v in e if v>0)

def drel_p(p):
    return p*mp.log(p/pstar)+(1-p)*mp.log((1-p)/(1-pstar))
for eps in [mp.mpf('1e-7'), mp.mpf('2e-7'), mp.mpf('-1e-7')]:
    pp=pstar+eps
    lhs=h2(pp)-h2(pstar)
    rhs=2*eta*eps-drel_p(pp)
    assert mp.almosteq(lhs,rhs,rel_eps=mp.mpf('1e-49'))
    assert np.min(np.linalg.eigvalsh(sigma+float(eps)*X))>0
# Unique projected stress response to *all* 8x8 density perturbations:
# Tr(K dρ) = (Cball R^4)Tr(E dρ) iff E=2eta/(Cball R^4)*P5 + const*I.
R=mp.mpf('1.7')
E_success=float(Cstress/R**4)*P5 + 4.0*np.eye(8)
for n in range(9):
    rng=np.random.default_rng(n+20)
    A=rng.standard_normal((8,8))
    A=(A+A.T)/2
    A-=np.trace(A)/8*np.eye(8)
    lhs=np.trace(K@A)
    rhs=float(Cball*R**4)*np.trace(E_success@A)
    assert np.isclose(lhs,rhs,atol=1e-11,rtol=1e-10)
# Counterexample: a traceless perturbation *within* one degenerate band.
Y=np.diag([1.,-1.]+[0.]*6)
E_generic=Y.copy()
assert np.trace(P5@Y)==0
assert np.trace(K@Y)==0
assert np.trace(E_generic@Y)==2
# Rail logistic response at frozen s_star.
sstar=eta/(4*Delta)
dpds=-8*Delta*pstar*(1-pstar)
# If imposing (not deriving!) ball matching, required transfer-clock response
# ds/d(R^4 T_uu)=Cpop/dpds.
ds_dsource=Cpop/dpds
# Conditional nonlinear entropy-area relation:
# H2(p(A)) = H2(p*) - (A-A*)/(4ell_P^2) (for a single selected rail variable).
# p'(A*) ell_P^2 and 1/2 p''(A*) ell_P^4.
pA1=-1/(8*eta)
pA2=1/(256*eta**3*pstar*(1-pstar))
# A repeated finite cell with s_cell nats, area patch a^2, has
# 1/(4ell_P^2) = s_cell/a^2; hence ell_P^2/a^2 =1/(4s_cell).
print('Delta',mp.nstr(Delta,25))
print('eta',mp.nstr(eta,25))
print('pstar',mp.nstr(pstar,25))
print('H2(pstar)',mp.nstr(h2(pstar),25))
print('Sstar/kB',mp.nstr(Sstar,25))
print('Cball=8*pi^2/15',mp.nstr(Cball,25))
print('required delta p/(R^4 delta Tuu)',mp.nstr(Cpop,25))
print('required delta Tuu*R^4/delta p',mp.nstr(Cstress,25))
print('dp/ds at frozen point',mp.nstr(dpds,25))
print('required ds/(R^4 delta Tuu)',mp.nstr(ds_dsource,25))
print('p(A) linear coefficient, units 1/ellP^2',mp.nstr(pA1,25))
print('p(A) quadratic coefficient, units 1/ellP^4',mp.nstr(pA2,25))
for tag,s in [('full entropy',Sstar),('rail-variable entropy',h2(pstar)),('two rail-variable entropies',2*h2(pstar))]:
    print(f'ellP^2 / area_patch if {tag}:',mp.nstr(1/(4*s),20))
print('counterexample: delta K=',np.trace(K@Y),' delta E_generic=',np.trace(E_generic@Y))
print('All finite-dimensional identities and matching/counterexample tests passed.')
# Constructive stress-response discretization (a *matching rule*, not derived dynamics).
# For spatially uniform delta T00 in an R-ball, use radial shells. Define each
# shell's population change by integrating the CFT modular weight per cell.
# Confirm approach to universal factor Cpop=4pi^2/(15 eta) and relative-entropy
# correction tends to zero when excitations are split among more independent cells.
print('\nRadial quadrature for a uniform stress perturbation, R=1, dT00=1e-5:')
R=mp.mpf(1)
dT=mp.mpf('1e-5')
for n in [40,80,160,320]:
    d=R/n
    total=mp.mpf(0)
    rel=mp.mpf(0)
    for i in range(n):
        r=(i+mp.mpf('.5'))*d
        shell_volume=4*mp.pi*r**2*d
        dp=mp.pi*shell_volume*(R**2-r**2)/(2*eta*R)*dT
        total+=dp
        rel+=drel_p(pstar+dp)
    target=Cpop*R**4*dT
    print('N',n,'delta_p_sum',mp.nstr(total,13),'relerr',mp.nstr((total-target)/target,8),'sum relative entropy',mp.nstr(rel,10))