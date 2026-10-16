"""Exact rational + sqrt(5) hidden-face / visible-vertex identities.
Build combinatorics from exact icosahedral coordinates, then use ONLY integer
incidences and rational matrix polynomials. Requires SymPy; no fitted input.
Run python hidden_visible_exact_certificate.py. No files are modified.
"""
from itertools import combinations
from sympy import Matrix,eye,ones,sqrt,simplify,Rational,trace
phi=(1+sqrt(5))/2
v=[]
for a in (-1,1):
 for b in (-phi,phi):
  v.extend([(0,a,b),(a,b,0),(b,0,a)])
assert len(v)==12
edges=[]
for i,j in combinations(range(12),2):
 if simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0:
  edges.append((i,j))
assert len(edges)==30
Eset=set(edges)
faces=[q for q in combinations(range(12),3)
       if all(pair in Eset for pair in combinations(q,2))]
assert len(faces)==20
C=Matrix(20,12,lambda f,i:int(i in faces[f]))
Lv=5*eye(12)
for i,j in edges:Lv[i,j]=Lv[j,i]=-1
Lf=3*eye(20)
for f,g in combinations(range(20),2):
 if len(set(faces[f])&set(faces[g]))==2:Lf[f,g]=Lf[g,f]=-1
If=eye(20)
H3=Lf*(Lf-2*If)*(Lf-5*If)*(Lf**2-6*Lf+4*If)/30
H5=-Lf*(Lf-2*If)*(Lf-3*If)*(Lf**2-6*Lf+4*If)/30
assert H3**2==H3 and H5**2==H5 and H3*H5==Matrix.zeros(20)
assert trace(H3)==trace(H5)==4
assert C.T*H3==C.T*H5==Matrix.zeros(12,20)
assert all(H3[i,i]==H5[i,i]==Rational(1,5) for i in range(20))
P0=ones(12,12)/12
P5=-Lv*(Lv**2-10*Lv+20*eye(12))/24
assert P0**2==P0 and P5**2==P5
assert trace(P0)==1 and trace(P5)==5
mixed=C.T*(H3.multiply_elementwise(H5))*C
assert mixed==Lv*(Lv-6*eye(12))*(Lv-7*eye(12))/60
assert C.T*(H3.multiply_elementwise(H3))*C==3*P0+Rational(3,25)*P5
assert C.T*(H5.multiply_elementwise(H5))*C==3*P0+Rational(1,3)*P5
print('PASS EXACT: 12/30/20 incidence, two hidden quartet projectors')
print('PASS EXACT: C.T H3 = C.T H5 = 0; all face diagonals 1/5')
print('PASS EXACT: Gram35 = Lv(Lv-6I)(Lv-7I)/60')
print('PASS EXACT: Gram33 = 3 P0+(3/25) P5')
print('PASS EXACT: Gram55 = 3 P0+(1/3) P5')
