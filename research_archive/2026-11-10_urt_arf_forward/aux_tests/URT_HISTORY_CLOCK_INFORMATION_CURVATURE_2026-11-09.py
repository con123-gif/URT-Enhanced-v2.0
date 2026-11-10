#!/usr/bin/env python3
"""Exact local phase-dependent history/clock information-overlap trace.
The observable tr(B(a)^T B(a)) is a declared, nonphysical statistical
information measure, not a Maxwell response or experimental ARF.
"""
import sympy as s,runpy,contextlib,io
with contextlib.redirect_stdout(io.StringIO()): v=runpy.run_path('/mnt/data/URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py')
A0=v['A']; a=s.symbols('a',real=True); C0=v['C']
C=s.zeros(24,64)
for j in range(24):
    lo=s.Rational(j,24)+a;hi=s.Rational(j+1,24)+a
    for h in range(64):
        for k in range(0,3):
            p=s.Rational(h,64)+k;q=s.Rational(h+1,64)+k
            # choose overlap branch at the original golden shift, preserve exact symbolic coefficients
            L=lo if float(lo.subs(a,A0))>float(p) else p
            R=hi if float(hi.subs(a,A0))<float(q) else q
            if float((R-L).subs(a,A0))>1e-12:C[j,h]+=s.expand(R-L)
assert all(s.simplify(t-s.Rational(1,24))==0 for t in C*s.ones(64,1))
assert all(s.simplify(t-s.Rational(1,64))==0 for t in s.ones(1,24)*C)
assert C.subs(a,A0)==C0
Z=s.factor(1536*sum(C[i,h]**2 for i in range(24) for h in range(64)))
Z0=s.simplify(Z.subs(a,A0));d=s.simplify(s.diff(Z,a).subs(a,A0));dd=s.simplify(s.diff(Z,a,2).subs(a,A0))
print('golden a=',s.N(A0,20))
print('trace B^T B polynomial (within local phase interval)',Z)
print('Z(a0)=',Z0,'=',s.N(Z0,20))
print('Z\'(a0)=',d,'=',s.N(d,20))
print('Z\'\'(a0)=',dd,'=',s.N(dd,20))
# Status: geometric information-only response; not automatically physical EM stiffness.
print('PASS')
