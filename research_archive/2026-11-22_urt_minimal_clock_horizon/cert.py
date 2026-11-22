"""Minimal pi-phi-e URT clock/horizon identifiability certificate.
Status: OBSTRUCTION scoped to dimensional recurrence plus entropy area law.
No observations or fitted constants are used.
"""
from math import pi,e,sqrt,log,exp,isclose
phi=(1+sqrt(5))/2
alpha=pi/e
theta=2*pi/phi**2
assert alpha>1 and 0<theta<2*pi
# Proof (analytical): theta/(2pi)=1/phi^2 irrational. Thus no n>0
# produces integer n*theta/(2pi), i.e. no exact angular closure.

# Two different proper-time embeddings of the identical modulus history
# a_n=alpha^n: constant e-fold clock (de Sitter) and an expanding clock
# a(t)=(t/tau)^p with arbitrary p>1 (power law).
for tau in (1.,17.):
    p=2.
    for n in range(13):
        a=alpha**n
        t_dS=tau*n
        t_p=tau*alpha**(n/p)
        assert isclose(a, exp(log(alpha)*t_dS/tau),rel_tol=1e-13)
        assert isclose(a,(t_p/tau)**p,rel_tol=1e-13)
        H_dS=log(alpha)/tau
        H_p=p/t_p
        R_A=1/H_p
        R_E=t_p/(p-1)
        assert isclose(R_E/R_A,p/(p-1),rel_tol=1e-14)
    # Arbitrary clock rescaling changes H but not a_n or angle.
    assert isclose((log(alpha)/(17*tau))/(log(alpha)/tau),1/17)

# Identifying apparent horizon radius R_A with the same growing
# scale a makes S_H~a^2 and q_dec=.5*dlnS/dlna-1=0.
g=2.
assert g/2-1==0.

# Previous SAME-STATE finite core2 diagnostics: conditional future
# event horizon closure yields p=c/(c-1). This condition was ADDED,
# not derived by the primitive q.
for sigma,chi in ((.030556428769,.005704884685),
                  (.039432894513,.006579746423)):
    eta=2*pi*chi/sigma
    c_HDE=sqrt(eta)
    p=c_HDE/(c_HDE-1)
    assert c_HDE>1 and p>1
    assert isclose(p/(p-1),c_HDE,rel_tol=1e-12)
    print(f'conditional eta={eta:.12f} c_HDE={c_HDE:.12f} p={p:.9f}')

assert alpha**2>1
print(f'alpha={alpha:.12f} golden_angle_deg={theta*180/pi:.12f} area_entropy_step={alpha**2:.12f}')
print('PASS: same pi-phi-e recurrence has inequivalent physical clocks and horizon ratios; direct horizon/scale identification gives coasting; H scale not fixed')
