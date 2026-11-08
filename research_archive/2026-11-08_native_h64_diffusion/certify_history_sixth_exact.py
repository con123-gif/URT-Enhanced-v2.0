"""Pure rational universal proof certificate of native H64 cumulants to sixth order.

Each coefficient is a multivariate homogeneous polynomial in six *independent*
velocity projections a_i, not a numerical fit to any direction.
Quotient the 64 Walsh histories by their two parity components: in parity p,
chi_{0..5}=p, so chi_5=p chi_{0..4}. L chi_A=2|A|(6-|A|)chi_A.
"""
from collections import defaultdict
from fractions import Fraction as F
N=6
ZERO=(0,)*N


def add(target,source,scale=F(1)):
    for mon,co in source.items():
        target[mon]=target.get(mon,F(0))+scale*co
    return target


def multiply(p,q):
    result=defaultdict(F)
    for a,ca in p.items():
        for b,cb in q.items():
            result[tuple(x+y for x,y in zip(a,b))]+=ca*cb
    return {a:c for a,c in result.items() if c}


def cumulants_symbolic(parity):
    unit=[{tuple(int(j==i) for j in range(N)):F(1)} for i in range(N)]
    velocity={1<<i:unit[i] for i in range(5)}
    velocity[31]={ex:parity*c for ex,c in unit[5].items()}

    def multiply_by_velocity(walsh):
        out=defaultdict(lambda:defaultdict(F))
        for mask,p in walsh.items():
            for flip,q in velocity.items():
                row=out[mask^flip]
                for a,ca in p.items():
                    for b,cb in q.items():
                        row[tuple(x+y for x,y in zip(a,b))]+=ca*cb
        return {m:{a:c for a,c in d.items() if c} for m,d in out.items()}

    psi=[{0:{ZERO:F(1)}}]
    lambdas={0:{}}
    for order in range(1,7):
        rhs=multiply_by_velocity(psi[-1])
        lambdas[order]=rhs.pop(0,{})
        for k in range(1,order):
            for mask,q in psi[order-k].items():
                add(rhs.setdefault(mask,{}),multiply(lambdas[k],q),-1)
        assert not rhs.get(0), 'stationary component was not removed'
        psi.append({mask:{e:c/F(2*mask.bit_count()*(6-mask.bit_count()))
                           for e,c in polynomial.items() if c}
                    for mask,polynomial in rhs.items() if mask and polynomial})
    return lambdas

s2={tuple(2*int(i==j) for i in range(N)):F(1) for j in range(N)}
s4={tuple(4*int(i==j) for i in range(N)):F(1) for j in range(N)}
s6={tuple(6*int(i==j) for i in range(N)):F(1) for j in range(N)}
prod={(1,)*N:F(1)}
r4=defaultdict(F); add(r4,multiply(s2,s2),F(1,4000));add(r4,s4,F(-1,800))
r4={e:c for e,c in r4.items() if c}
for parity in (-1,1):
    full=cumulants_symbolic(parity)
    expected2={e:c/F(10) for e,c in s2.items()}
    expected6=defaultdict(F)
    for p,co in [
        (multiply(multiply(s2,s2),s2),F(1,300000)),
        (multiply(s2,s4),F(-1,40000)),
        (s6,F(1,24000)),
        (prod,F(parity,640))]:add(expected6,p,co)
    expected6={e:c for e,c in expected6.items() if c}
    assert full[2]==expected2
    assert full[4]==r4
    assert full[6]==expected6
    assert not full[1] and not full[3] and not full[5]
    print('PASS parity',parity,'exact degree-2/4/6 polynomial identities, sixth monomials',len(full[6]))
print('PASS universal identity in all six independent a_i; no direction fit or numerical approximation')