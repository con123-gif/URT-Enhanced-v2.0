from fractions import Fraction as F
from math import comb
# Original Q96 charge registry: 36 channels each at |q|=2/3,1/3;
# 12 at |q|=1 and 12 neutral; original cyclic 24-clock Laplacian.
charges={F(0):12,F(1,3):36,F(2,3):36,F(1):12}
n=24
L=[[2*(i==j)-int((i-j)%n in (1,n-1)) for j in range(n)] for i in range(n)]
def mm(a,b):
    return [[sum(x*y for x,y in zip(row,col)) for col in zip(*b)] for row in a]
L2=mm(L,L);L4=mm(L2,L2)
t4=sum(L4[i][i] for i in range(n))
assert t4==n*comb(8,4)==1680
q8=sum(mult*q**8 for q,mult in charges.items())
assert q8==F(9776,729)
assert sum(charges.values())==96
assert t4*q8==F(5474560,243)
print("Q161DJ EXACT CERTIFICATE: Tr L24^4 =",t4,"sum q^8 =",q8,"Tr K^4 =",t4*q8,"PASS")
