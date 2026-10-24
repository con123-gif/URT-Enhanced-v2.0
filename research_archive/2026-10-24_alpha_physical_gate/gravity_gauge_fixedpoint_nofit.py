#!/usr/bin/env python3
"""October 24 independent (non-alpha-input) gravitational UV-fixed-point RG test."""
from fractions import Fraction as F
from math import pi, sqrt, log, tanh
family=[(6,F(1,6)),(3,F(2,3)),(3,-F(1,3)),(2,-F(1,2)),(1,F(-1)),(1,F(0))]
Y2=sum((n*y*y for n,y in family),F(0)); assert Y2==F(10,3)
bY=F(2,3)*3*Y2+F(1,3)*2*F(1,2)**2
b2=-F(19,6)
assert (bY,b2,bY+b2)==(F(41,6),-F(19,6),F(11,3))
phi=(1+sqrt(5))/2
d=F(3,20)-80*pi/(1053*phi)
eta=-log(d)
MU=1.8e18
MZ=91.1876
z=log(MU/MZ)
# No alpha target; this UV scale is a declared example, not derived.
onecopy_parent_inverse=64*log(2)/(3*pi)
onecopy_inverse_at_MZ=onecopy_parent_inverse+float(bY+b2)*z/(2*pi)
f_geom=eta/(16*pi) # NOT equal to gravity anomalous dimension without further dynamics.
gYstar2=(16*pi*pi/float(bY))*f_geom
geom_fixed_point_parent_inverse=41/(15*pi*f_geom)
geom_fixed_point_inverse_at_MZ=geom_fixed_point_parent_inverse+float(bY+b2)*z/(2*pi)
berry=(2*eta/5)*tanh(eta)
berry_photon_inverse_if_assumed=64*pi*berry/3
print('bY=',bY,'b2=',b2,'Y2=',Y2)
print('one-copy entropy alphaEM^-1(MZ) conditional:',onecopy_inverse_at_MZ)
print('geometry fG identification is NOT DERIVED; alphaEM^-1(MZ):',geom_fixed_point_inverse_at_MZ)
print('literal Berry stiffness alpha^-1 conditional:',berry_photon_inverse_if_assumed)
print('exact gravity beta root gY*²=16pi² fG / bY')
assert abs(onecopy_inverse_at_MZ-26.603185495381055)<1e-11
assert abs(geom_fixed_point_inverse_at_MZ-29.190289826457935)<1e-11
assert abs(berry_photon_inverse_if_assumed-160.7349033506347)<1e-10
print('PASS: no fitted experimental alpha; physical alpha remains OPEN')
