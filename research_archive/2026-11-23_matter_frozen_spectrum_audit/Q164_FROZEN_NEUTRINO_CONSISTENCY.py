from decimal import Decimal, getcontext
getcontext().prec=45
D=Decimal
m1=D('2.28954e-9'); m2=D('0.00855208'); m3=D('0.04948256')
reported_sum=D('0.05803464'); beta=D('0.00878908')
d21=m2*m2-m1*m1; d31=m3*m3-m1*m1; d32=m3*m3-m2*m2
s=m1+m2+m3
assert m1<m2<m3
assert abs(s-reported_sum)<D('0.000000005')
assert d31==d21+d32
assert m1*m1<beta*beta<m3*m3
b2=beta*beta; a=m1*m1; b=m2*m2; c=m3*m3
w3_min=(b2-b)/(c-b) if b2>b else D(0)
w3_max=(b2-a)/(c-a)
assert D(0)<=w3_min<=w3_max<=D(1)
print('sum_eV',s)
print('delta21_eV2',d21)
print('delta31_eV2',d31)
print('delta32_eV2',d32)
print('w3_admissible_interval',w3_min,w3_max)
print('PASS: exact decimal arithmetic; consistency only, no native Yukawa derivation')
