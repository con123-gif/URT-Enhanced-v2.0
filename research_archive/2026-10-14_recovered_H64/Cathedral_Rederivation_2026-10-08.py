import numpy as np,itertools,json,math
from pathlib import Path
import argparse
parser=argparse.ArgumentParser()
parser.add_argument("--output-dir",default=".")
args=parser.parse_args()
outdir=Path(args.output_dir).resolve();outdir.mkdir(parents=True,exist_ok=True)
from fractions import Fraction
p=(1+np.sqrt(5))/2
v=np.array([(0,a,b*p) for a in [-1,1] for b in [-1,1]]+[(a,b*p,0) for a in [-1,1] for b in [-1,1]]+[(b*p,0,a) for a in [-1,1] for b in [-1,1]])
e=[(i,j) for i in range(12) for j in range(i+1,12) if abs(np.linalg.norm(v[i]-v[j])-2)<1e-8]; ix={a:i for i,a in enumerate(e)}
f=[]; K=np.zeros((30,30),dtype=int); d1=[]
for t in itertools.combinations(range(12),3):
 if all(tuple(sorted(a)) in ix for a in itertools.combinations(t,2)):
  a,b,c=t
  if np.dot(np.cross(v[b]-v[a],v[c]-v[a]),v[a]+v[b]+v[c])<0:b,c=c,b
  f.append((a,b,c)); ee=[(a,b),(b,c),(c,a)]; row=np.zeros(42,dtype=int)
  ids=[ix[tuple(sorted(x))] for x in ee]; signs=[1 if x[0]<x[1] else -1 for x in ee]
  for j,s in zip(ids,signs):row[j]=s
  d1.append(row)
  for k in range(3):
   i,j=ids[k],ids[(k+1)%3]; s=signs[k]*signs[(k+1)%3];K[i,j]+=s;K[j,i]-=s
edges=e+[(i,12) for i in range(12)]; d0=np.zeros((42,13),dtype=int)
for n,(a,b) in enumerate(edges):d0[n,a]=-1;d0[n,b]=1
d1=np.array(d1); L=d0.T@d0; eig,U=np.linalg.eigh(L)
A=-(K.astype(object)@K.astype(object));I=np.eye(30,dtype=object)
ann=(A-I)@(A-4*I)@(A@A-12*A+16*I)
# Exact characteristic polynomial by Newton identities, coefficients descending.
Ko=K.astype(object); power=np.eye(30,dtype=object);tr=[0]
for n in range(1,31):power=power@Ko;tr.append(int(np.trace(power)))
c=[1]
for n in range(1,31):
 numerator=-sum(c[n-j]*tr[j] for j in range(1,n+1)); assert numerator%n==0;c.append(numerator//n)
expected=np.array([1],dtype=object)
for factor,n in [([1,0,1],4),([1,0,4],5),([1,0,12,0,16],3)]:
 for _ in range(n):expected=np.convolve(expected,np.array(factor,dtype=object))
assert c==expected.tolist();assert not np.any(ann)
# All 60 proper icosahedral rotations from images of one oriented face.
rotations=[]; a0=v[list(f[0])].T
for face in f:
 for cyc in range(3):
  inds=list(face[cyc:]+face[:cyc]);R=v[inds].T@np.linalg.inv(a0)
  perm=np.argmin(np.linalg.norm(v[:,None,:]-(v@R.T)[None,:,:],axis=2),axis=0)
  assert len(set(perm))==12 and np.max(np.linalg.norm(v[perm]-v@R.T,axis=1))<1e-12
  O=np.zeros((30,30),dtype=int)
  for j,(a,b) in enumerate(e):
   aa,bb=int(perm[a]),int(perm[b]);O[ix[tuple(sorted((aa,bb)))],j]=1 if aa<bb else -1
  assert np.array_equal(O@K,K@O);rotations.append(O)
assert len({tuple(o.flat) for o in rotations})==60
# Polar complex structure, positive complex projector and golden triplet block.
aa,V=np.linalg.eigh(np.array(A,dtype=float)); J=K@((V*(1/np.sqrt(aa)))@V.T);Pplus=(np.eye(30)-1j*J)/2
trip=V[:,aa>5] # rank 6 golden high band; union below instead
trip=V[:,np.logical_or(np.abs(aa-(6+2*np.sqrt(5)))<1e-7,np.abs(aa-(6-2*np.sqrt(5)))<1e-7)]
S=trip.T@(np.array(A,dtype=float)/2-3*np.eye(30))@trip
# Lie generators supported on the two disjoint graph triplet subspaces.
Ew=U[:,np.abs(eig-(6-np.sqrt(5)))<1e-7];Ec=U[:,np.abs(eig-(6+np.sqrt(5)))<1e-7]
T=[]
for axis in np.eye(3):
 x,y,z=axis;T.append(np.array([[0,-z,y],[z,0,-x],[-y,x,0]],dtype=complex))
W=[Ew@t@Ew.T for t in T]
# Colour anti-Hermitian basis = real skew 3 + imaginary symmetric tracefree 5.
symm=[]
for i,j in [(0,1),(0,2),(1,2)]:
 b=np.zeros((3,3));b[i,j]=b[j,i]=1; symm.append(b/np.sqrt(2))
symm += [np.diag([1,-1,0])/np.sqrt(2),np.diag([1,1,-2])/np.sqrt(6)]
colour=[t/np.sqrt(2) for t in T]+[1j*b for b in symm];C=[Ec@b@Ec.T for b in colour]
def comm(a,b):return a@b-b@a
def closure_residual(basis):
 return max(np.linalg.norm(comm(a,b)-sum(np.vdot(q,comm(a,b))*q for q in basis)) for a in basis for b in basis)
# Entire Hodge complex, no radial triangular faces added.
Dirac=np.zeros((75,75));Dirac[:13,13:55]=d0.T;Dirac[13:55,:13]=d0;Dirac[13:55,55:]=d1.T;Dirac[55:,13:55]=d1
rank0=np.linalg.matrix_rank(d0);rank1=np.linalg.matrix_rank(d1)
# Exact A4 quartic stationary values, using multiplicity classes.
quartic=set()
for m in range(1,5):
 n=5-m;quartic.add(Fraction(m**3+n**3,25*m*n))
for m in range(1,4):
 for n in range(1,5-m):
  l=5-m-n;a=n-l;b=l-m;cc=m-n
  norm=m*a*a+n*b*b+l*cc*cc
  if norm and len({a,b,cc})==3:quartic.add(Fraction(m*a**4+n*b**4+l*cc**4,norm**2))
assert quartic=={Fraction(7,30),Fraction(1,4),Fraction(1,2),Fraction(13,20)}
# Polar-link test: unitary transport alone has no singular-value hierarchy.
rng=np.random.default_rng(13);Y=np.eye(3,dtype=complex)
for _ in range(12):
 amp=rng.normal(size=(3,3))+1j*rng.normal(size=(3,3));u,s,vh=np.linalg.svd(amp);Y=(u@vh)@Y
# Gibbs state and purification, covariance versus density-tangent stiffness.
dstar=80*np.pi/(1053*p);Delta=.15-dstar;eta=-np.log(Delta);p5=Delta**2/(1+Delta**2)
a=1/(4*(1+Delta**2));b=Delta**2*a;rho=np.diag([a]*4+[b]*4)
psi=np.diag(np.sqrt(np.diag(rho))).reshape(64);partial=np.diag(np.sqrt(np.diag(rho)))@np.diag(np.sqrt(np.diag(rho)))
chi=8*eta*(1+Delta**2)/(1-Delta**2);km=(a-b)/(np.log(a)-np.log(b))
checks={
 'counts':[12,30,20], 'centered_cochain_dimensions':[13,42,20], 'ranks_d0_d1':[int(rank0),int(rank1)], 'betti':[1,int(42-rank0-rank1),int(20-rank1)], 'hodge_dirac_nullity':int(75-np.linalg.matrix_rank(Dirac)),
 'boundary_squared_exact':bool(not np.any(d1@d0)), 'K_skew_exact':bool(np.array_equal(K.T,-K)), 'K_characteristic_polynomial_exact':bool(c==expected.tolist()), 'K_annihilator_exact':bool(not np.any(ann)), 'A5_equivariance_exact_all_rotations':len(rotations),
 'K_singular_values':[(float(x),int(np.sum(np.abs(np.linalg.svd(K,compute_uv=False)-x)<1e-7))) for x in [2*p,2/p,1,2]],
 'J_square_residual':float(np.linalg.norm(J@J+np.eye(30))), 'Pplus_projector_residual':float(np.linalg.norm(Pplus@Pplus-Pplus)), 'Pplus_rank':int(np.linalg.matrix_rank(Pplus,tol=1e-8)), 'Sgold_square_residual':float(np.linalg.norm(S@S-5*np.eye(12))),
 'weak_bracket_residual':float(max(np.linalg.norm(comm(W[i],W[(i+1)%3])-W[(i+2)%3]) for i in range(3))), 'colour_closure_residual':float(closure_residual(colour)), 'weak_colour_commutator_residual':float(max(np.linalg.norm(comm(w,c)) for w in W for c in C)),
 'stationary_quartic_ratios':[str(q) for q in sorted(quartic)],'classical_rail_from_stationary_gap':str(max(quartic)-sorted(quartic)[-2]), 'gamma_from_gap_ratio':str((Fraction(1,60)/Fraction(3,20))**2),
 'pure_polar_wall_singular_values':np.linalg.svd(Y,compute_uv=False).tolist(), 'TFD_trace_residual':float(np.linalg.norm(partial-rho)), 'TFD_norm':float(np.vdot(psi,psi)), 'chi_density_tangent':float(chi), 'KM_generator_tangent_offdiag':float(km), 'dual_product':float(chi*km)
}
print(json.dumps(checks,indent=2))
with open(outdir/"Cathedral_Rederived_Checks_2026-10-08.json",'w') as out:json.dump(checks,out,indent=2)
# Write the complete operator archive once, after the history calculation below.
# Conference six-axis seed and explicit six-bit Walsh H64.
axes=[]
for vv in v:
 if not any(abs(np.dot(vv/np.linalg.norm(vv),u))>1-1e-8 for u in axes):axes.append(vv/np.linalg.norm(vv))
axes=np.array(axes);conference=np.rint(np.sqrt(5)*(axes@axes.T-np.eye(6))).astype(int)
assert np.array_equal(conference@conference,5*np.eye(6,dtype=int))
cv,cu=np.linalg.eigh(conference);Egold=cu[:,cv>0]
bits=np.array(list(itertools.product([-1,1],repeat=6)));walsh1=bits/8;G=walsh1@Egold
quad=np.column_stack([np.einsum('ni,ij,nj->n',G,q,G) for q in symm]);fq,fs,_=np.linalg.svd(quad,full_matrices=False);F=fq[:,:5]
H13=np.column_stack([np.ones(64)/8,np.prod(bits,axis=1)/8,walsh1,F]);assert np.linalg.norm(H13.T@H13-np.eye(13))<1e-12
checks['conference_squared_exact']=True;checks['Walsh_H13_orthogonality_residual']=float(np.linalg.norm(H13.T@H13-np.eye(13)))
# KO-6 completion for D=i J_lin: real structure C_F differs from J_lin.
A4skew=np.kron(np.eye(2),np.array([[0,1],[-1,0]]));Z=np.zeros((4,4));I4=np.eye(4)
Jlin=np.block([[Z,-I4],[I4,Z]]);DF=1j*Jlin;CF=np.block([[Z,A4skew],[A4skew,Z]]);Gamma=np.diag([-1]*4+[1]*4)
checks['KO6_J_squared_residual']=float(np.linalg.norm(CF@CF.conj()+np.eye(8)))
checks['KO6_J_D_commutation_residual']=float(np.linalg.norm(CF@DF.conj()-DF@CF))
checks['KO6_J_grading_residual']=float(np.linalg.norm(CF@Gamma.conj()+Gamma@CF))
checks['KO6_D_grading_residual']=float(np.linalg.norm(DF@Gamma+Gamma@DF))
# Trace indices of one 16-state SM generation.
TY=6*Fraction(1,6)**2+3*Fraction(2,3)**2+3*Fraction(-1,3)**2+2*Fraction(-1,2)**2+1
checks['hypercharge_trace_index']=str(TY);checks['weak_trace_index']='2';checks['colour_trace_index']='2';checks['bare_sin_squared']=str(Fraction(2,1)/(TY+2))
# Reconstruct curvature intertwiner via induced action on two-forms.
pairs=list(itertools.combinations(range(4),2));hodge=np.zeros((6,6))
for i,(a,b) in enumerate(pairs):
 rem=[j for j in range(4) if j not in (a,b)];perm=[a,b]+rem;sgn=(-1)**sum(perm[m]>perm[n] for m in range(4) for n in range(m+1,4));hodge[pairs.index(tuple(rem)),i]=sgn
hh,hU=np.linalg.eigh(hodge);Hp=hU[:,hh>0];Hm=hU[:,hh<0]
Qbasis=[]
for i,j in pairs:
 q=np.zeros((4,4));q[i,j]=q[j,i]=1/np.sqrt(2);Qbasis.append(q)
for n in range(1,4):
 q=np.diag([1]*n+[-n]+[0]*(3-n))/np.sqrt(n*(n+1));Qbasis.append(q)
BB=[]
for q in Qbasis:
 action=np.zeros((6,6))
 for col,(a,b) in enumerate(pairs):
  tensor=np.outer(q[:,a],np.eye(4)[:,b])-np.outer(np.eye(4)[:,b],q[:,a])+np.outer(np.eye(4)[:,a],q[:,b])-np.outer(q[:,b],np.eye(4)[:,a])
  action[:,col]=[tensor[i,j] for i,j in pairs]
 BB.append((Hm.T@action@Hp).reshape(9))
BB=np.array(BB).T;checks['curvature_intertwiner_rank']=int(np.linalg.matrix_rank(BB));checks['curvature_intertwiner_isometry_residual']=float(np.linalg.norm(BB.T@BB-np.eye(9)))
# Numerical recovery trial of the dated v113 scalar branch (not canonical alpha).
from scipy.optimize import minimize
legacy_alpha=np.sqrt(4/3);beta=1/4;thetaH=12/5;radius=8*dstar
fullQ=np.linalg.qr(H13,mode='complete')[0];Hidden=fullQ[:,13:]
def energy(x):
 P=H13@x;return .5*(1/beta-legacy_alpha)*(P@P)+legacy_alpha*thetaH*np.sum(1-np.cos(P))
def grad(x):
 P=H13@x;return H13.T@((1/beta-legacy_alpha)*P+legacy_alpha*thetaH*np.sin(P))
best=None
def on_sphere(x):return radius*x/np.linalg.norm(x)
def sphere_energy(x):return energy(on_sphere(x))
def sphere_grad(x):
 y=on_sphere(x);g=grad(y);return radius/np.linalg.norm(x)*(g-y*(y@g)/radius**2)
for n in range(16):
 xx=rng.normal(size=13);xx=radius*xx/np.linalg.norm(xx)
 opt=minimize(sphere_energy,xx,jac=sphere_grad,method='BFGS',options={'gtol':1e-10,'maxiter':1000})
 opt.x=on_sphere(opt.x)
 if best is None or opt.fun<best.fun:best=opt
assert best is not None
P=H13@best.x;Jac=legacy_alpha*beta*(np.eye(64)-thetaH*np.diag(np.cos(P)));B=H13.T@Jac@Hidden;Dhid=Hidden.T@Jac@Hidden
checks['v113_trial_energy']=float(best.fun);checks['v113_trial_hidden_spectral_radius']=float(max(abs(np.linalg.eigvalsh(Dhid))));checks['v113_trial_B_Frobenius']=float(np.linalg.norm(B));checks['v113_trial_constraint_residual']=float(abs(best.x@best.x-radius**2))
print('ADDITIONAL CHECKS');print(json.dumps({k:v for k,v in checks.items() if k.startswith(('conference','Walsh','KO6','hypercharge','weak_trace','colour_trace','bare_','curvature','v113'))},indent=2))
with open(outdir/"Cathedral_Rederived_Checks_2026-10-08.json",'w') as out:json.dump(checks,out,indent=2)
for label,z in [('z0',0),('z1',1)]:
 sig=B@np.linalg.solve(z*np.eye(51)-Dhid,B.T)
 checks['v113_trial_Sigma_'+label+'_F']=float(np.linalg.norm(sig));checks['v113_trial_Sigma_'+label+'_op']=float(np.linalg.norm(sig,2))
checks['v113_trial_stationarity_residual']=float(np.linalg.norm(sphere_grad(best.x)))
print('Self energies:',{k:v for k,v in checks.items() if 'Sigma' in k or 'stationarity' in k})
with open(outdir/"Cathedral_Rederived_Checks_2026-10-08.json",'w') as out:json.dump(checks,out,indent=2)
np.savez(outdir/"Cathedral_Rederived_Operators_2026-10-08.npz",vertices=v,edges=e,faces=f,K=K,d0=d0,d1=d1,J=J,Pplus=Pplus,L13=L,weak=np.array(W),colour=np.array(C),conference=conference,H13=H13,Hidden=Hidden,vacuum=P,Jac=Jac,scalarA=H13.T@Jac@H13,scalarB=B,scalarD=Dhid,KO6_CF=CF,KO6_D=DF,curvature_intertwiner=BB)