"""URT–ZPE entropy–redshift physical discriminant, 2026-11-22.

Same-state finite input from research_archive/2026-11-21_urt_zpe_horizon_limit:
central core2 nx96,nz12 strip (sigma,chi), NOT certified continuum data:
flux+: (0.030556428769,0.005704884685)
flux-: (0.039432894513,0.006579746423)

With E=(hbar*c/R)*chi*A/ell^2, S/kB=sigma*A/ell^2,
ell^2=4*sigma*ellP^2, G=c^3*ellP^2/hbar, obtain
rho=3*eta*c^4/(8*pi*G*R^2), eta=2*pi*chi/sigma.

For the apparent horizon, R=c/H, the source fraction is eta
identically. The finite eta>1 cannot be a positive dark energy
component alongside ordinary positive matter if used unchanged.
The single-source Friedmann equation demands eta=1 and does not
determine H0.

The future event horizon is an EXTRA physical assumption, not selected
by the microscopic entropy area law. With separately conserved dust,
the conditional equations are standard holographic dark energy:
  c_HDE=sqrt(eta), w=-1/3-2sqrt(Omega)/(3c_HDE),
  Omega'=Omega*(1-Omega)*(1+2sqrt(Omega)/c_HDE)
  (ln H)'=-3(1+w Omega)/2, q=(1+3w Omega)/2.
Prime = d/dln a.  No fitted microscopic coefficient.
The local CPL slope w_a=-dw/da|a=1 is POSITIVE:
 w_a=sqrt(Omega0)*Omega_m0*(1+2sqrt(Omega0)/c_HDE)/(3c_HDE).
That sign opposes the negative-w_a tendency in some DESI analyses,
not an exclusion without a full combined likelihood.
For c_HDE>1, future a~t^[c/(c-1)], H tends to zero and
there is no nonzero asymptotic Lambda. c=1 admits de Sitter
with ANY H0, so absolute H0 is not predicted here either.

External check: 2026 EPJC DOI 10.1140/epjc/s10052-026-16300-z
reports c=1.011^{+.076}_{-.072} from H(z), DESI DR2,
DES-Dovekie, RSD; the two finite c values are within the
reported marginal one-sigma range. This is NOT a joint fit or
independent test of microscopic physical interpretation.
Observational Omega_m0=.270 and .315 are comparison benchmarks,
not primitive predictions. Redshift range <=2.33 neglects radiation.
"""
from math import pi,sqrt,log,exp
from scipy.integrate import solve_ivp,quad

SECTORS=(("plus",.030556428769,.005704884685),
         ("minus",.039432894513,.006579746423))
def w_of(O,c):
    return -1/3-2*sqrt(O)/(3*c)

def run(name,sigma,chi,Om0):
    eta=2*pi*chi/sigma
    c=sqrt(eta)
    Ode0=1-Om0
    assert c>1 and 0<Om0<1
    def rhs(x,y):
        O,lnH=y
        return (O*(1-O)*(1+2*sqrt(O)/c),-1.5*(1+w_of(O,c)*O))
    sol=solve_ivp(rhs,(0,-log(3.33)),(Ode0,0),
                  dense_output=True,method="DOP853",rtol=2e-12,atol=1e-13)
    assert sol.success
    solF=solve_ivp(rhs,(0,15),(Ode0,0),
                   method="DOP853",rtol=2e-12,atol=1e-13)
    assert solF.success
    w0=w_of(Ode0,c)
    wa=sqrt(Ode0)*Om0*(1+2*sqrt(Ode0)/c)/(3*c)
    q0=(1+3*w0*Ode0)/2
    assert wa>0
    def H(z):
        if z==0:return 1.
        O,lnh=sol.sol(-log(1+z))
        h=exp(lnh)
        assert abs(h/sqrt(Om0*(1+z)**3/(1-O))-1)<2e-9
        return h
    def HL(z):return sqrt(Om0*(1+z)**3+1-Om0)
    def D(z,fun):return quad(lambda y:1/fun(y),0,z,epsabs=1e-11)[0]
    p=c/(c-1)
    re,err=quad(lambda t:(1+t/p)**(-p),0,float("inf"),epsabs=2e-11)
    assert abs(re-c)<2e-10 and abs(p/(p-1)-c)<1e-14
    assert .939<c<1.087
    print(f"sector={name} Om0={Om0:.3f} eta={eta:.11f} c_HDE={c:.11f} apparent_residual={1-eta:+.9f}")
    print(f"  w0={w0:+.9f} wa={wa:+.9f} q0={q0:+.9f} w_inf={w_of(1,c):+.9f} q_inf={-1/c:+.9f} p={p:.8f} R_E_H0={re:.9f}")
    for z in (.5,1.,2.33):
        print(f"  z={z:.2f} H/H0={H(z):.9f} H_ratio_LCDM={H(z)/HL(z):.9f} D_ratio_LCDM={D(z,H)/D(z,HL):.9f}")
    return c

if __name__=="__main__":
    cs=[]
    for name,sigma,chi in SECTORS:
        for Om0 in (.270,.315):
            cs.append(run(name,sigma,chi,Om0))
    assert cs[0]==cs[1] and cs[2]==cs[3]
    print("PASS: 4 native-sector/benchmark comparisons, Friedmann consistency, future horizon integral, and CPL evolution sign")
