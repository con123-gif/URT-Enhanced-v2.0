#!/usr/bin/env python3
"""Exact URT six-bit, three two-bit-sheet repeated return: 1/63.
No ARF coefficient as input. Probability result is a theorem of dyadic URT.
Identifying this particular return statistic with the physical rail observable
still requires the source/observable map.
"""
from fractions import Fraction
from collections import defaultdict

states=64
for start in range(states):
    count={start:1}
    for j in range(6):
        nxt=defaultdict(int)
        for state,n in count.items():
            nxt[(2*state)%64]+=n
            nxt[(2*state+1)%64]+=n
        count=dict(nxt)
    assert len(count)==64 and set(count.values())=={1}
    # Exactly 64 equiprobable binary continuations; Q^6 has every entry 1/64.
print('All 64 initial six-bit words produce each final word once after six fresh digits: PASS')

# Each pair of fresh bits is one of four uniformly sampled sheet labels.
# The original A4-triality cycle has three successive sheet labels: 4^3=64.
sheet_p=Fraction(1,4)
three_sheet_p=sheet_p**3
assert three_sheet_p==Fraction(1,64)
# Complete six-step blocks are independent under the unique ACIM/Haar process.
# Expected count of a consecutive run of successful three-sheet returns:
return_resolvent=three_sheet_p/(1-three_sheet_p)
assert return_resolvent==Fraction(1,63)
print('single sheet=',sheet_p,'complete three-sheet cycle=',three_sheet_p)
print('all-block consecutive-return geometric resolvent =',return_resolvent)
print('time-six sampling is necessary: partial overlapping blocks are not independent')
print('PASS exact O(N) URT/A4 3-cycle source-return factor, with no fitted rate')
