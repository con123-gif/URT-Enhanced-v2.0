#!/usr/bin/env python3
import numpy as np
from scipy.linalg import expm
from math import pi,sqrt,log,sin
phi=(1+sqrt(5))/2;d=3/20-80*pi/(1053*phi);eta=-log(d)
a=1/(4*(1+d*d));b=d*d*a
Y=np.block([[np.zeros((4,4)),np.eye(4)],[np.eye(4),np.zeros((4,4))]])/sqrt(8)
rho=np.diag([a]*4+[b]*4);K=np.diag([-log(a)]*4+[-log(b)]*4)
for s in [.05,.2,1.0]:
 U=expm(1j*s*Y);rs=U@rho@U.conj().T;Ks=U@K@U.conj().T
 D=np.trace(rs@(K-Ks)).real
 formula=8*eta*(a-b)*sin(s/sqrt(8))**2
 Z0=np.trace(expm(-K)).real;Zs=np.trace(expm(-Ks)).real
 assert abs(D-formula)<1e-12 and abs(Zs-Z0)<1e-12
print('PASS',eta*(a-b))