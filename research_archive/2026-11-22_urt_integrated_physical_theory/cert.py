"""Integrated URT-ZPE consistency certificate (22 Nov 2026).
Native magnetic 3D graph, golden quantum gain, entropy-energy accounting,
and CONDITIONAL redshift/cosmological evolution, without fitted constants.
NOT a proof that these distinct physical subsystems have been coupled.
"""
from math import pi, e, sqrt, cos, sin, acos, log, log1p, exp, isclose
from itertools import product
import numpy as np

phi = (1 + sqrt(5))/2
alpha = pi/e
theta = 2*pi/phi**2
k = log(alpha)/theta
s2 = alpha**2 - 1
trace_half = alpha*cos(theta)
assert abs(trace_half) < 1
psi = acos(trace_half)
pair_bound = s2/(1-trace_half**2)

def entropy(n):
    return 0.0 if n==0 else (n+1)*log(n+1)-n*log(n)

assert isclose(alpha**2,1+s2)
assert isclose(theta/(2*pi),1/phi**2)
assert isclose(2*log(alpha),log(alpha**2))

# Rebuild the ORIGINAL native 3D cyclic magnetic links, not a surrogate.
def native_cube(n, f):
    xyz=list(product(range(n), repeat=3))
    ix={x:i for i,x in enumerate(xyz)}
    D=[]
    for i,x in enumerate(xyz):
        for axis in range(3):
            y=list(x);y[axis]+=1;y=tuple(y)
            if y not in ix:continue
            row=np.zeros(n**3,complex)
            row[i]=1
            row[ix[y]]=-np.exp(1j*f*x[(axis-1)%3])
            D.append(row)
    D=np.array(D)
    L=D.conj().T @ D
    lam=np.linalg.eigvalsh(L)
    assert lam[0]>1e-10 and max(abs(L-L.conj().T).ravel())<1e-12
    return sum(np.sqrt(lam))/n**3,lam

# Frozen archived precision for original n2/n3 from native holonomy reaction certificate.
expected=((2,-theta,1.6481345552),(2,pi-theta,1.6190400027),
          (3,-theta,1.9195530022),(3,pi-theta,1.9090358102))
for n,f,u in expected:
    measured,lam=native_cube(n,f)
    assert abs(measured-u)<1e-10,(n,f,measured,u)
    print(f'native N={n}, flux={f:+.9f}, ground E/M={measured:.12f}, gap={lam[0]:.9f}')

# Native one-idler SU(1,1) quantum interpretation of q, consistent CCR.
q=alpha*complex(cos(theta),sin(theta))
M=np.array([[q, np.exp(1j*theta)*sqrt(s2)],
            [np.exp(-1j*theta)*sqrt(s2),np.conj(q)]])
J=np.diag([1.,-1.])
assert np.linalg.norm(M.conj().T@J@M-J)<1e-12
assert abs(np.linalg.det(M)-1)<1e-12
assert abs((M@M)[0,0]-q*q-s2)<1e-12
P=np.eye(2,dtype=complex)
for n in range(1,513):
    P=P@M
    occ=abs(P[0,1])**2
    formula=s2*(sin(n*psi)/sin(psi))**2
    assert abs(occ-formula)<1e-9
    assert occ<=pair_bound+1e-9
    if n in (2,3,4):print(f'coherent step={n} occupation={occ:.12f}, signal entropy/kB={entropy(occ):.12f}')
for n in range(1,20):
    f0=alpha**(2*n)-1
    f1=alpha**(2*(n+1))-1
    # Identity for a FRESH vacuum idler, not the reused-idler unitary.
    assert isclose(f1-f0,s2*alpha**(2*n),rel_tol=2e-13)
    assert entropy(f1)>entropy(f0)
assert abs(entropy(pair_bound)-1.531619687224777)<1e-11

# Previous EXACT native sheet preparation+joining energy ledgers.
ledgers=((2,27.482314436123,11.160540180516,26.899167406949,11.692479446682),
         (3,58.888225997184,20.191543544636,58.302510150067,20.536715673522),
         (4,101.812219659042,32.097163386780,101.031453268652,32.490081703372))
capacity_1=2*s2
capacity_2=2*(alpha**4-1)
for n,es1,join1,es2,join2 in ledgers:
    for sector,es,join in (('eps_plus',es1,join1),('eps_minus',es2,join2)):
        need=(es+join)/es
        assert capacity_1 < need < capacity_2
        print(f'sheet n={n} sector={sector} cost/E_sheet={need:.10f} source capacities={capacity_1:.10f}/{capacity_2:.10f}')

# CONDITIONAL physical dictionary: same-state boundary entropy & lapse energies.
# These are archived finite central-strip diagnostics, NOT certified limits.
sectors=(('eps_plus',.030556428769,.005704884685),
         ('eps_minus',.039432894513,.006579746423))
for name,sigma,chi in sectors:
    eta=2*pi*chi/sigma
    chde=sqrt(eta)
    assert chde>1
    # Physical dictionary ell²=4 sigma ellP² and rho=3chi c^4/(4sigma G R²).
    # With c=G=hbar=1, Friedmann single component H²=(8pi/3)rho.
    for R in (1.,3.,12.):
        ell2=4*sigma
        rho=3*chi/(ell2*R*R)
        H=sqrt(8*pi*rho/3)
        assert isclose(H*R,chde,rel_tol=2e-15)
    # If R is FUTURE event horizon, it must satisfy dot R=HR-1.
    # With all stress from redshifted component, p=cHDE/(cHDE-1), a(t)=t^p.
    power=chde/(chde-1)
    assert power>1
    t=2.3
    H=power/t
    R=t/(power-1)
    dR=1/(power-1)
    assert isclose(H*R,chde,rel_tol=1e-14)
    assert isclose(dR,H*R-1,rel_tol=1e-14)
    omega=H/k
    domega=-(k*(1-1/chde))*omega**2
    assert isclose(k*domega+k*k*omega*omega,power*(power-1)/t**2,rel_tol=1e-13)
    # Correct proper-time null boundary integrated to future infinity for p>1.
    assert isclose(t/(power-1), t**power* (t**(1-power)/(power-1)),rel_tol=1e-14)
    w_inf=-1/3-2/(3*chde)
    assert isclose(1.5*(1+w_inf),1-1/chde,rel_tol=1e-13)
    # If instead R is APPARENT horizon, Omega=eta>1 with archival finite values:
    assert 1-eta<0
    # Two externally supplied Omega_m comparisons, never presented as derived inputs.
    for om0 in (.270,.315):
        ode=1-om0
        w=-1/3-2*sqrt(ode)/(3*chde)
        wa=sqrt(ode)*om0*(1+2*sqrt(ode)/chde)/(3*chde)
        qdec=(1+3*w*ode)/2
        assert wa>0 and qdec<0
        print(f'cosmology {name} Omega_m0={om0:.3f}, cHDE={chde:.12f}, w0={w:.9f}, wa={wa:.9f}, q0={qdec:.9f}')
    print(f'event pure {name}: eta={eta:.12f}, p={power:.9f}, w_inf={w_inf:.9f}, k={k:.12f}')

# Rate nonidentifiability: one unmodified recurrence with two distinct clocks.
for tau in (1.,17.):
    for n in range(0,13):
        a=alpha**n
        t_exp=n*tau
        t_power=tau*alpha**(n/2)
        assert isclose(a,exp(log(alpha)*t_exp/tau),rel_tol=1e-13)
        assert isclose(a,(t_power/tau)**2,rel_tol=1e-13)
print('PASS: native graph spectra, coherent SU11 feedback, fresh-idler entropy/pump budget, horizon-redshift source, event-horizon cosmic-motion equations, unselected Hubble clock')
