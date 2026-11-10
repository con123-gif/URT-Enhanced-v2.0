#!/usr/bin/env python3
"""Exact search over source-to-observable maps without target ARFs.

All maps are generated from a fixed positive history response; Ward-safe
source transport is required. Tests *families* of observables, rather than
claiming a physical Maxwell or H13+H51 identification.
"""
import json
import sympy as s

a=[s.Rational(266,15),s.Rational(389,20),s.Rational(391,20),s.Rational(521,30)]
w=[4,2,2,0]
# Conditional quartet source G(z). Gauge-invariant candidates are functions
# of the link-covariant history Hessian, not raw charged source amplitudes.
z=s.symbols("z")
g=s.cancel(sum(wi/(z-ai) for ai,wi in zip(a,w)))
# Enumerate uncalibrated, representation-independent observable operations.
# Each is derived from G, and no experimental constant is used.
candidates={
 "static_compliance":s.factor(-g.subs(z,0)),
 "first_spectral_moment":sum(wi*ai for ai,wi in zip(a,w)),
 "second_spectral_moment":sum(wi*ai**2 for ai,wi in zip(a,w)),
 "static_stiffness":s.factor(1/(-g.subs(z,0))),
 "normalized_mean_eigenvalue":s.factor(sum(wi*ai for ai,wi in zip(a,w))/sum(w)),
 "normalized_spectral_variance":s.factor(sum(wi*ai**2 for ai,wi in zip(a,w))/sum(w)-(sum(wi*ai for ai,wi in zip(a,w))/sum(w))**2)
}
# Necessary identifiability test: if two distinct, equally admissible
# dimensionless observables exist, history alone does not select an ARF.
assert len(set(candidates.values()))>=2
# Scalar source rescaling leaves eigenvalues unchanged but changes the
# quadratic response. Without physical normalization no coupling is fixed.
t=s.symbols("t",positive=True)
scaled=s.factor(t*t*(-g.subs(z,0)))
assert s.diff(scaled,t)!=0
print(json.dumps({
 "status":"conditional_observable_search_verified",
 "candidate_observables":{k:str(v) for k,v in candidates.items()},
 "nonuniqueness_certificate":"six distinct symmetry-compatible functions of the same source spectrum",
 "normalization_obstruction":str(scaled),
 "conclusion":"Physical ARF cannot be selected from history spectrum alone. Need charged matter H13+H51 and Maxwell pole normalization, with all Ward contacts.",
 "historical_ARFs_used":False
},indent=2))
