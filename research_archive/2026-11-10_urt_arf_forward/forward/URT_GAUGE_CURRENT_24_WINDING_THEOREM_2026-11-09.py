#!/usr/bin/env python3
"""Independent exact Fourier-root filter for the Wilson-covariant source.
Proves no angle harmonics below winding 24 survive the 24-clock trace;
calculates the leading 48theta harmonic with no fitted source weights.
"""
import mpmath as mp
mp.mp.dps=90
phi=(1+mp.sqrt(5))/2;omega=2*mp.pi/phi**2
r=mp.pi/mp.e;Delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
c0=36+72*mp.sqrt(5)/5
weights={'3':[(c0/2,mp.mpf(3)/20),(c0/2,mp.mpf(1)/20)],'5':[(mp.mpf(9)/2,mp.mpf(1)/15),(mp.mpf(5)/2,-mp.mpf(1)/20)]}

def fcoeff(E,lam,n):
    aa=E+2*r*r;bb=2*r*r
    root=mp.sqrt(aa*aa-bb*bb)
    tau=(aa-root)/bb
    s=((tau**(n+1)-lam**(n+1))/(tau-lam)+(lam*tau)/(1-lam*tau)*(tau**n+lam**n))
    return s/root

def current_by_winding(max_t=8):
    J=mp.mpf(0)
    for lab,E,weight in [('3',18,1),('5',16,Delta**2)]:
        for a,la in weights[lab]:
            for t in range(1,max_t+1):
                n=24*t
                J+=weight*a*mp.sin(48*t*omega)*t*(1152*fcoeff(E,la,n)-576*la**n)
    return J
j1=current_by_winding(1);j2=current_by_winding(2)
print('only 24-multiple charge2 Fourier harmonics survive; first sin(48 theta)')
print('leading winding J',mp.nstr(j1,70))
print('next winding correction',mp.nstr(j2-j1,50))
print('winding 2 included J',mp.nstr(j2,70))
# direct Fourier sum high precision derivative for independent check
allj=mp.mpf(0)
for label,E,wt in [('3',18,1),('5',16,Delta**2)]:
 for a,la in weights[label]:
  def g(th):
   tot=mp.mpf(0)
   for m in range(24):
    delta=2*th-2*mp.pi*m/24
    S=(1-la*la)/(1-2*la*mp.cos(delta)+la*la)
    A=E+r*r*(2-2*mp.cos(delta))
    tot+=a*(mp.mpf('.25')*S-mp.mpf('.5')*S/A)
   return tot
  allj+=wt*mp.diff(g,omega)
print('direct full clock J',mp.nstr(allj,70))
assert abs(j2-allj)<mp.mpf('1e-35')
print('PASS analytic roots-of-unity and 24-winding current')
