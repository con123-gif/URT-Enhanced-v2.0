# Exact finite modular certificate and independent arithmetic checks for A401895.
# This is not a proof of the full conjecture.
modulus=81
squares={s*s%modulus for s in range(modulus)}
allowed=[L for L in range(27) if 66*L%modulus in squares]
assert allowed==[0,3,12,21]
allowed_k=[k for k in range(9) if (33*k)%27 in allowed]
assert allowed_k==[0,2,5,8]
# Check the centered repdigit identity independently by exact integers.
for L in range(1,82):
 C=2*(10**(2*L)-1)//3
 assert (C*pow(pow(10,L-1,81),-1,81))%81==66*L%81
 # Check expansion and cancellation factors used in hand proof.
 assert C%81==(66*L+27*L*(L-1))%81
 assert ((1-9*(L-1))*(1+9*(L-1)))%81==1
 assert ((1-9*(L-1))*(66*L+27*L*(L-1)))%81==66*L%81
# Independent reversal product identity for arbitrary decimal strings.
# Coefficients a_i are read from the units place; T=sum(i*a_i).
for n in range(1,100000):
 ds=list(map(int,str(n)[::-1])); L=len(ds)
 S=sum(ds); T=sum(i*a for i,a in enumerate(ds))
 r=int(str(n)[::-1])
 assert n%81==(S+9*T)%81
 assert r%81==(S+9*((L-1)*S-T))%81
 assert n*r%81==((1+9*(L-1))*S*S)%81
print('PASS: square residue classes L mod27:',allowed)
print('PASS: combined length L=33k classes k mod9:',allowed_k)
print('PASS: independent centered repdigit cancellation for L1..81.')
print('PASS: reversal/moment identities for all99999 positive n<100000.')
print('No complete conjecture proof or Lean kernel check claimed.')
