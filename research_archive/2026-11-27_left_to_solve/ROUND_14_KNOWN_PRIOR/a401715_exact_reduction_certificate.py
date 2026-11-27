from fractions import Fraction
from math import prod,factorial,isqrt

def primes_upto(n):
    out=[]
    for p in range(2,n+1):
        if all(p%d for d in range(2,isqrt(p)+1)):
            out.append(p)
    return out

ps=primes_upto(1000)
def B(n): return prod((Fraction(p+1,p) for p in ps if p<=n),start=Fraction(1))
assert B(100)>5
assert B(210)>2*B(7)
assert B(1000)>2*B(19)
# Revised elementary proof needs no logarithm, exponential, or infinite series.
# H(t) < (5/3) B(t), and 2^m <= t implies H(t) >= 1+m/2.
Pk=1
Dk=Fraction(1)
dyadic_certificates=[]
for k,p in enumerate(ps[:13],start=1):
    Pk*=p
    Dk*=Fraction(p+1,p)
    if 8<=k<=12:
        m=Pk.bit_length()-1
        assert 2**m<=Pk
        lower=Fraction(3,5)*(1+Fraction(m,2))
        assert lower>2*Dk
        dyadic_certificates.append((k,m,str(Dk),str(lower-2*Dk)))
assert Pk==304250263527210
assert Pk>2**48
# For k>=13, P_k>=P_13*16^(k-13)>=2^(4*k-4).
# Thus B(t)>(3/5)(2*k-1)>=k+2>=2*D(t).
# k<=3, t>=100: D<= (k+2)/2 <=5/2, B(t)>=B(100)>5.
# k=4: t>=210 and D<=B(7).
# 5<=k<=8: t>=2310>1000 and D<=B(19).
# 9<=k<=12: B(t)>(3/5)log(t), D<=(k+2)/2, t>=primorial(k).
Pk=1
for k,p in enumerate(ps[:12],start=1):
    Pk*=p
    if 9<=k<=12:
        # exp(1)<30/11 yields log(Pk)>5(k+2)/3.
        assert Pk**3 * 11**(5*(k+2)) > 30**(5*(k+2))
# k>=13: t>= (k+1)!, D<=(k+2)/2.
# Base log(14!)>25, using exp(1)<30/11.
assert factorial(14)*11**25>30**25
# Induction log((k+2)) >5/3 for k>=13.
assert 15**3*11**5>30**5
# Bound sum_{b>=1}1/b^2 <5/3 by five exact terms and telescoping tail.
zeta_upper=sum((Fraction(1,j*j)for j in range(1,6)),start=Fraction(0))+Fraction(1,5)
assert zeta_upper<Fraction(5,3)
# Optional exact Taylor bound for exp(1): sum through j=4, then geometric tail.
e_upper=sum((Fraction(1,factorial(j))for j in range(5)),start=Fraction(0))+Fraction(1,100)
assert e_upper<Fraction(30,11)
# Remaining t<100, using exact normalized unitary and squarefree products.
equality=[]
values=[]
for t in range(1,100):
    A=Fraction(1)
    for p in ps:
        if p>t:break
        z=t;v=0
        while z%p==0:z//=p;v+=1
        A*=1+Fraction(1,p**(v+1))
    F=A+B(t)/t
    assert F>=2,(t,F)
    if F==2:equality.append(t)
    values.append((t,str(F)))
assert equality==[1,2,4]
print('EXACT B(100)>5; B(210)>2B(7); B(1000)>2B(19).')
print('EXACT log threshold integer certificates for k9..12 and base k13 passed.')
print('EXACT zeta and exponential rational bounds:',zeta_upper,e_upper)
print('All t1..99 exact normalized inequalities passed; equality t:',equality)
print('FINITE DYADIC CERTIFICATES (k,m,D_k,positive gap):',dyadic_certificates)
print('INFINITE CASE BASE: P_13=304250263527210 > 2^48, all later primes >=16.')
