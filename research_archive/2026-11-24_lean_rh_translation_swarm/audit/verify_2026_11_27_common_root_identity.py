# Exact algebra-only regression for the interpolation identity, run locally.
import sympy as s
x,z=s.symbols('x z')
count=0
for n in (2,3,4,5,8,9):
    C=s.cyclotomic_poly(n,z)
    def red(f): return s.rem(s.expand(f),C,z).expand()
    roots=[red(z**i-1) for i in range(n)]
    factors=[x-a for a in roots]
    Q=1
    for f in factors: Q=red(Q*f)
    assert red(Q-((1+x)**n-1))==0; count+=1
    F=[1+x+x*x,2+x**3]
    P=s.prod(F)
    for A in (1,2):
        S=0; E=0
        for i,a in enumerate(roots):
            k=i%2; other=F[1-k]
            fa=red(F[k].subs(x,a))
            numer=red(F[k]**A-fa**A)
            div,rem=s.div(numer,x-a,x)
            assert red(rem)==0; count+=1
            S=red(S+red(div)*other**A)
            rest=1
            for j,f in enumerate(factors):
                if i!=j:rest=red(rest*f)
            E=red(E+fa**A*other**A*rest)
        assert red(P**A*s.diff(Q,x)-Q*S-E)==0; count+=1
print(f'{count} exact cyclotomic-ring identities; not a valuation or Lean test')
