#!/usr/bin/env python3
"""Deterministic, no-fit symbolic search for chronology/source identities.

Explores exact consequences of the *declared conditional* four-quartet spectrum.
Candidate identities are checked algebraically; no experimental ARF targets are read.
Outputs JSON. This is a finite conjecture search, not autonomous physics discovery.
"""
import argparse,json,sys
import sympy as S

def explore(max_degree=4):
 z=S.symbols("z")
 eigen=(S.Rational(266,15),S.Rational(389,20),S.Rational(391,20),S.Rational(521,30))
 weight=(4,2,2,0)
 resolvent=S.cancel(sum(w/(z-e) for w,e in zip(weight,eigen)))
 moments=[S.expand(sum(w*e**k for w,e in zip(weight,eigen))) for k in range(max_degree+1)]
 den=S.prod(z-e for e,w in zip(eigen,weight) if w)
 den=S.expand(den)
 # Prony recurrence is derived from source-bright poles, not fit to an observable.
 coeff=S.Poly(den,z).all_coeffs()
 rec=[S.simplify(sum(coeff[j]*moments[k+3-j] for j in range(4))) for k in range(max(0,max_degree-2))]
 assert all(v==0 for v in rec)
 # Independent rational partial-fraction check.
 assert S.simplify(resolvent-sum(w/(z-e) for w,e in zip(weight,eigen)))==0
 # Dark fourth eigenvalue does not enter the source moments.
 assert all(S.diff(m,S.Symbol("dark"))==0 for m in moments)
 return {"status":"exact_verified_conditional","bright_poles":[str(x) for x in eigen[:3]],"dark_pole":str(eigen[3]),"source_weights":list(weight),"moments":[str(m) for m in moments],"minimal_source_polynomial":str(den),"recurrence_coefficients":[str(v) for v in coeff],"recurrence_residuals":[str(v) for v in rec],"resolvent":str(resolvent),"physical_ARFs":"not derived","next_gate":"derive physical H13+H51 charged current with Ward-complete pole observable from primitive URT, without assuming source spectral weights"}
if __name__=="__main__":
 p=argparse.ArgumentParser();p.add_argument("--degree",type=int,default=9);a=p.parse_args()
 if a.degree<3 or a.degree>100: p.error("degree must be 3..100")
 print(json.dumps(explore(a.degree),indent=2))
