from fractions import Fraction as Q

def run():
    monodromy=diagonal=normalization=0
    for n in range(33):
        # Source signed reversal; diagonal fixtures obey source reciprocal reversal.
        def S(v): return [(-1)**i*v[n-1-i] for i in range(n)]
        def N(v): return ([Q(0)]+v[:-1]) if n else []
        def Nd(v): return ([-x for x in v[1:]]+[Q(0)]) if n else []
        for j in range(n):
            v=[Q(i==j) for i in range(n)]
            assert S(Nd(v))==N(S(v))
            monodromy+=1
            for z in [Q(2),Q(3,2),Q(1,5),Q(-2),Q(1)]:
                d=[z**(2*i-(n-1)) for i in range(n)]
                assert S([x/a for x,a in zip(v,d)])==[x*a for x,a in zip(S(v),d)]
                diagonal+=1
        for s in range(-8,9):
            a=Q(n-1,2)
            assert -(s+2*a)+a==-s-a
            normalization+=1
    v=[Q(0),Q(1)]; unsigned=lambda x:x[::-1]
    assert unsigned([-v[1],Q(0)]) != [Q(0),unsigned(v)[0]]
    assert -(2*Q(1))+(-Q(1)) != -Q(1)
    assert Q(2)**-1 != Q(2)
    return dict(monodromy=monodromy,diagonal=diagonal,normalization=normalization,negative_controls=3)
if __name__=='__main__': print(run())
