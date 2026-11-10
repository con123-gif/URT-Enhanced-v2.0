# Exact native source-supported chronology resolvent (2026-11-10)

Conditional A5 Reynolds chronology operator Kbar=H+(1/60)sum_g R_g (I-Q)^T(I-Q) R_g^T. The previously computed native source weights for its quartet branches are 4 at 266/15, 2 at 389/20, 2 at 391/20, and zero at 521/30. No fitting.

Consequently, the scalar source trace resolvent is exactly

G(z)=4/(z-266/15)+2/(z-389/20)+2/(z-391/20)
=20(2400z^2-91480z+871257)/[(15z-266)(20z-391)(20z-389)].

At infinity:
G(z)=8/z+(2234/15)/z^2+(500201/180)/z^3+O(z^-4).

At zero: G(0)=-8712570/20229167.

Independent SymPy verification:
```python
import sympy as s
z=s.symbols('z')
g=4/(z-s.Rational(266,15))+2/(z-s.Rational(389,20))+2/(z-s.Rational(391,20))
assert s.factor(g)==20*(2400*z*z-91480*z+871257)/((15*z-266)*(20*z-391)*(20*z-389))
assert s.limit(z*g,z,s.oo)==8
assert s.limit(z*z*(g-8/z),z,s.oo)==s.Rational(2234,15)
assert s.limit(z**3*(g-8/z-s.Rational(2234,15)/z**2),z,s.oo)==s.Rational(500201,180)
```

Scope: finite history-sector source trace only, not physical charged H13+H51 matter propagator or four historical ARFs. The source is originally embedded from the full five-Platonic 190-cochain geometry and hidden P3/P5 through Uh; 24-clock Wilson, Schur and fermionic Ward contacts are not supplied by this scalar trace. Kbar's chronology penalty normalization is conditional. Do not infer experimental particles from these three poles.
