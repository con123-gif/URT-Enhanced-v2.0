# Collective signal-energy budget: a bounded non-closure test (2026-11-22)

Status: THEOREM **conditional on independent signal marginals, equal source frequency and number-conserving transfer**. Not a native joining success; not a result for coherent idler access.

The previous independent-JC bound (commit 9caf4fd) is **not** a general collective ceiling. For m independent two-cycle fresh-idler thermal signal modes, each geometric with lambda=1-(e/pi)^4, total photon number N has negative-binomial distribution P(N=n)=C(n+m-1,m-1)(1-lambda)^m lambda^n. Any energy-conserving operation that starts four equal-gap switches in their ground states and leaves them all excited must start with N>=4. Thus P(all four excited)<=P(N>=4), irrespective of the particular number-conserving collective coupling. This is an *energy availability ceiling*, not a reachable success probability and not a bound if idlers or external energy enter.

Numerical outputs (script below): m=4: independent all-switch probability upper bound 0.037309646351; collective photon-budget ceiling **0.369569316207**. m=8: independent all-eight upper bound 0.001392009711, while the ceiling for *four* equal-energy excitations with eight source modes is **0.789031003635**. Do not interpret the m=8 result as all-eight activation; the threshold is deliberately four. These numbers show why the independent-JC result cannot rule out a collective source; they do NOT show a physical transfer improvement.

The original four native magnetic seam gaps are unequal and depend on activation order, and the native two-polarization Gaussian ground-state joining is not a set of four equal-gap qubits. The physical π/e pump rotor, idlers, spatially local coupling, spectral resonance, leakage, and total quantum energy ledger remain unresolved. No gravity test follows.

Reproduce with Python standard library: `python collective_budget.py`. Script:
```python
#!/usr/bin/env python3
"""Exact collective photon-budget ceiling; NOT a powered seam engine.
Source: two fresh-idler URT gains; signal-only thermal marginals.
Four independent signal modes, one per seam. Collective operations may redistribute
their photons but may not create energy. Equal-frequency, four-quanta threshold is
a deliberately favorable benchmark, not native bond-frequency matching.
"""
from math import comb, pi, e, isclose
alpha=pi/e
lam=1-alpha**(-4)
def tail(m,k):
    return 1-sum(comb(n+m-1,m-1)*(1-lam)**m*lam**n for n in range(k))
for m in (4,8):
    collective=tail(m,4)
    independent=lam**m
    assert 0<independent<collective<1
    print(f"m={m} lambda={lam:.12f} independent_all={independent:.12f} collective_energy_ceiling={collective:.12f}")
assert isclose(tail(4,4),0.3695693162065211,abs_tol=1e-12)
assert isclose(tail(8,4),0.7890310036352659,abs_tol=1e-12)
print("PASS: analytic negative-binomial tail, exact energy-count ceiling only")
# Important: a four-seam switch may require different frequencies and ground-state
# joining energy. The threshold >=4 source quanta is NOT sufficient to power it.
# Retaining idlers invalidates the signal-only ceiling; no full-idler claim.
```
RESUME HERE: derive a genuinely local number-conserving source+idler-to-native-bond Hamiltonian and calculate joint dynamics with the actual four seam frequencies and leakage; do not optimize the abstract photon-count ceiling.
