from fractions import Fraction as F
checks=0; exceptional=0
for q in [2,3,4,5,7,8,9,11,13,16,25,27]:
 for n in range(-12,13):
  a=F(q)**n
  for x in range(-8,9):
   for y in range(-8,9):
    lhs=F(x)+a*y; rhs=q*y+x
    assert lhs-rhs==(a-q)*y
    if n!=1 and lhs==rhs: assert y==0
    if n==1 and y: assert lhs==rhs; exceptional+=1
    checks+=1
count=0
for u in [F(i,j) for i in range(-8,9) if i for j in range(1,9)]:
 for w in range(-30,31):
  assert (u*w==w)==((u-1)*w==0)
  if u!=1 and u*w==w: assert w==0
  count+=1
assert (checks, exceptional, count)==(86700,3264,7808)
print('tame_scalar_checks',checks,'weight_one_nonzero_controls',exceptional,'descent_checks',count)
