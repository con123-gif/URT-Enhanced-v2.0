#!/usr/bin/env python3
"""Q160: exact source-parameter neighbourhood certificate for Q159 native singlet."""
from fractions import Fraction as F
r=F(355508034923519,10**15)
m=F(790940592107124,10**15)
lo=F(1732050807568,10**12);hi=F(1732050807569,10**12)
assert lo*lo<3<hi*hi
eps=F(1,1000)
def square_interval(a,b):
    if a<=0<=b:return (F(0),max(a*a,b*b))
    return (min(a*a,b*b),max(a*a,b*b))
a=1-(m+eps)-hi/2;b=1-(m-eps)-lo/2
E0lo,E0hi=[v+F(1,4) for v in square_interval(a,b)]
a=3*(r-eps)+1-(m+eps)+(lo-1)/8
b=3*(r+eps)+1-(m-eps)+(hi-1)/8
u,v=square_interval(a,b)
c=(1+lo)/8;d=(1+hi)/8
E1lo=3+u+c*c;E1hi=3+v+d*d
assert E0hi<4<E1lo
print('NATIVE r,m:',r,m)
print('RIGOROUS eps=1/1000 E0^2:',E0lo,E0hi)
print('RIGOROUS eps=1/1000 E1^2:',E1lo,E1hi)
print('STRICT MARGINS:',4-E0hi,E1lo-4)
print('CERTIFIED: native mu=-2 moving singlet crossing persists for all r,m in the rational box')
