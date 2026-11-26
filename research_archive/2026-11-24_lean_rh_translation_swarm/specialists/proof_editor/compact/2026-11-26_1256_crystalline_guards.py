from sympy import nextprime
from collections import Counter

def vp_fact(n,p):
    s=0
    while n:
        n//=p; s+=n
    return s

def logp(n,p):
    i=0
    while n>=p: n//=p; i+=1
    return i

def verify(Q,W,m,h,G,b,eta,delta,p):
    assert 99*(Q*Q+(W+1)*Q+Q+W+m)<=h
    assert 99*h**3<=G and 99*(G*h**3+G)<=b
    assert 2*(4*b).bit_length()<m
    assert delta<eta and 99*((eta+W)*Q+eta+h)<=h**3
    v=vp_fact(2*b,p)+h**3*(vp_fact(b+30*h**3,p)-vp_fact(max(b-30*h**3,0),p))
    K=2*v//Q
    assert 2*b<p*(v+1) and logp(4*b,p)<m
    if p<=Q:
        J=logp(h**3,p); e=h; diff=1+logp(e,p)
        assert 2*(b+delta)<h*h*K
        assert e*2*(b+delta)<=p**(J+1)*K and 8*e<=p**(J+1)
        assert 11*(p**J+1)*9*G<=b+delta
        assert 4*(J+1+diff+logp(2*(b+delta),p))*9*G<=K
        return 'sparse'
    if v>=h**3:
        U=W+4*eta
        assert 5*U<=G+delta and U<=K
        assert b+delta<K*p*p and 2*(G+delta)<K*p
        return 'two_sizes'
    a=2*(v+1); R=6*(a+eta+W)
    assert p>198*G and delta+R<30*h**3
    for B in (G+delta,b+delta):
        assert B+W+eta<=(p-3)*a and R<B
        assert (B+R)//p==(B-R-1)//p
    if v<h//5:
        assert 2*a<h
        return 'few_zero'
    assert a+1<=6*v and W+1<=K
    for r,mu in [(1,0),(1,1),(10,1000)]:
        assert 11*(mu*(a+1)+r*(W+1))<=10**5*(r*K*m+mu*v)
    return 'few_positive'

counts=Counter()
for Q in (2,3,7,13):
    for W in (1,10):
        m=1000; h=99*(Q*Q+(W+1)*Q+Q+W+m); G=99*h**3
        b=99*G*(h**3+1); eta=h*h//100; delta=eta//2
        for p in [2,3,5,7,11,13,17,101]+[int(nextprime(2*b//d)) for d in (1,2,10,h//10,h//3,h,h*h,h**3//2,h**3,2*h**3)]:
            counts[verify(Q,W,m,h,G,b,eta,delta,p)]+=1
assert counts=={'sparse':26,'two_sizes':79,'few_zero':10,'few_positive':29}
print(dict(counts),'total',sum(counts.values()))
