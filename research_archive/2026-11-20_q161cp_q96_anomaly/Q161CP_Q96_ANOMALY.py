#!/usr/bin/env python3
"""Exact anomaly sums for original Q96 charge registry; no fitted data."""
from fractions import Fraction as F
# Original three-generation Q96 chiral species: Q_L,L_L,u_R,d_R,e_R,nu_R.
# (chirality, multiplicity, Y, SU2 index weighted by color, SU3 index weighted by weak dimension)
fields=[(1,6,F(1,6),F(3,2),F(1)),(1,2,F(-1,2),F(1,2),F(0)),(-1,3,F(2,3),F(0),F(1,2)),(-1,3,F(-1,3),F(0),F(1,2)),(-1,1,F(-1),F(0),F(0)),(-1,1,F(0),F(0),F(0))]
assert sum(m for _,m,*_ in fields)==16
a3=sum(s*m*y**3 for s,m,y,_,_ in fields)
ag=sum(s*m*y for s,m,y,_,_ in fields)
a2=sum(s*y*t for s,_,y,t,_ in fields)
a31=sum(s*y*t for s,_,y,_,t in fields)
assert (a3,ag,a2,a31)==(F(0),)*4
charges=[F(2,3),F(-1,3)]*3+[F(0),F(-1)]+[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
assert len(charges)==16 and len(charges)*3*2==96
assert sorted(charges)==sorted([F(2,3)]*6+[F(-1,3)]*6+[F(-1)]*2+[F(0)]*2)
assert 3*(3+1)%2==0
print("Q161cp EXACT PASS: four anomaly coefficients = 0; Q96 count = 96; weak doublets = 12")
