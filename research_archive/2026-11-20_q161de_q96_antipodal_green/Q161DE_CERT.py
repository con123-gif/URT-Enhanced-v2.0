#!/usr/bin/env python3
"""Q161de: native Q96 charge registry and 24-clock antipodal Green kernel."""
from fractions import Fraction as F
from collections import Counter

q8=[F(2,3)]*3+[F(-1,3)]*3+[F(-1),F(0)]
q=(q8*2)*3
q=q+[-v for v in q]
assert len(q)==96
counts=Counter(v*v for v in q)
assert counts=={F(4,9):36,F(1,9):36,F(1):12,F(0):12}
n=24
def green(d):
    d=min(d%n,(-d)%n)
    return F(n*n-1,12*n)-F(d*(n-d),2*n)
assert sum(green(d) for d in range(n))==0
assert all(2*green(d)-green(d-1)-green(d+1)==(F(1)-F(1,n) if d==0 else -F(1,n)) for d in range(n))
assert green(0)==F(575,288)
assert green(12)==-F(289,288)
inverse_charge=sum((F(1,c)*m for c,m in counts.items() if c),F(0))
assert inverse_charge==417
G0=inverse_charge*green(0)
G12=inverse_charge*green(12)
R12=2*(G0-G12)
assert (G0,G12,R12)==(F(79925,96),-F(40171,96),F(2502))
assert all(2*(green(0)-green(12))/c==F(6)/c for c in counts if c)
print('Q161de EXACT: charge-square counts',dict(counts))
print('cycle G(0)=',green(0),'G(12)=',green(12))
print('Q96 antipodal off-diagonal Green trace=',G12)
print('Q96 summed antipodal resistance=',R12)
print('Q161da native B_x remains unconstructed; physical gates OPEN')
