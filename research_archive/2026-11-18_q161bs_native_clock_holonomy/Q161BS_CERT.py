#!/usr/bin/env python3
"""Exact original Cathedral 190/64/24 clock holonomy (no invented transport).
Source: research_archive/2026-11-08_native_h64_diffusion/
cathedral_constructed_joint_dynamics_2026_11_07.py: theta=2*pi/phi**2, N=24.
"""
import sympy as s
phi=(1+s.sqrt(5))/2
N=s.Integer(24)
t=s.simplify(N/phi**2)
assert s.simplify(t-(36-12*s.sqrt(5)))==0
assert t.is_irrational is True
for q in (s.Rational(1,3),s.Rational(2,3),s.Integer(1),s.Integer(2)):
    assert s.simplify(q*t).is_irrational is True
for m in range(1,121):
    assert s.simplify(m*t).is_irrational is True
print('Q161bs EXACT PASS: 24/phi^2 = 36 - 12*sqrt(5), irrational;')
print('native 24-clock twist cannot be removed by periodic gauge or supplied by finite-order Golay coordinate permutation; Q96 Ward seam remains open')
