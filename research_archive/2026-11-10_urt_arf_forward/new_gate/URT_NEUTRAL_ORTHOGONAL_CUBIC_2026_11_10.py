#!/usr/bin/env python3
"""Exact Q(sqrt5) Schur-orthogonalization of the ORIGINAL two neutral
hidden-quartet Green--Kubo channels and cubic discriminant. No ARF inputs.
Inputs are the proved exact source cumulants from
URT_A5_NEUTRAL_TWO_QUARTET_CUMULANT_THEOREM_2026_11_10.md.
"""
import sympy as s
z=s.sqrt(5)
K33=(s.Integer(2554416)+1135296*z)/625
K35=(s.Integer(57780)+23112*z)/125
K55=s.Rational(471,5)
T333=(s.Integer(8470303488)+3786974208*z)/15625
T335=(s.Integer(182596032)+81248832*z)/3125
T355=(s.Integer(4092552)+1671408*z)/625
T555=(s.Integer(152754)+6912*z)/125
alpha=s.simplify(K35/K55)
res=s.simplify(K33-K35*alpha)
assert res==s.simplify((s.Integer(419904)+186624*z)/98125)
assert s.simplify(K35-alpha*K55)==0
Trrr=s.simplify(T333-3*alpha*T335+3*alpha**2*T355-alpha**3*T555)
Trr5=s.simplify(T335-2*alpha*T355+alpha**2*T555)
Tr55=s.simplify(T355-alpha*T555)
assert Trrr==s.simplify(s.Integer(484846912512)/60467078125+s.Integer(5417924454144)*z/1511676953125)
x,y=s.symbols('x y',real=True)
F=s.expand(T333*x**3+3*T335*x**2*y+3*T355*x*y**2+T555*y**3)
G=s.expand(Trrr*x**3+3*Trr5*x*x*y+3*Tr55*x*y*y+T555*y**3)
assert s.simplify(F-G.subs({x:x,y:y+alpha*x}))==0
D=s.simplify(s.discriminant(F.subs(y,1),x))
assert D==s.simplify((s.Integer(38992806977284026925056)+s.Integer(17438112362288322183168)*z)/3814697265625)
assert D>0
roots=s.nroots(F.subs(y,1),maxsteps=200)
assert len(roots)==3 and all(abs(s.im(root))<1e-20 for root in roots)
assert all(abs(complex(F.subs({x:root,y:1})))<1e-6 for root in roots)
print('PASS exact neutral Gram--Schmidt alpha =',alpha,'~',s.N(alpha,17))
print('PASS residual covariance K_R5 = 0, K_RR =',res,'~',s.N(res,17))
print('PASS residual cubic K_RRR =',Trrr,'~',s.N(Trrr,17))
print('PASS other transformed cubic components K_RR5 =',Trr5,'K_R55 =',Tr55)
print('PASS binary cubic discriminant =',D,'~',s.N(D,17),'positive; 3 distinct real projective zero directions')
print('projective zeros x/y =',roots)
print('NOTE: four cubic tensor components arise from Sym^3(R^2), not four independent physical source charges')
