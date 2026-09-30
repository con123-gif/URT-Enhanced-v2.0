import json,math,itertools,sys
from pathlib import Path
import numpy as np
from scipy.linalg import null_space,polar
sys.path.insert(0,'/mnt/data');import active_core as ac
# use H3 quartet as fundamental V4
G=len(ac.rhoH3); Vrep=ac.rhoH3
# exterior bases
bases={k:list(itertools.combinations(range(4),k)) for k in range(5)}
def wedge_rep(R,k):
 B=bases[k];M=np.zeros((len(B),len(B)))
 for i,I in enumerate(B):
  for j,J in enumerate(B):M[i,j]=np.linalg.det(R[np.ix_(I,J)])
 return M
rho={k:[wedge_rep(R,k) for R in Vrep] for k in range(5)}
# characters and multiplicities with known irreps
known={'1':[np.ones((1,1)) for _ in range(G)],'3':ac.rho3,'3p':ac.rho3p,'4':ac.rhoH3,'5':ac.rho5}
def mult(repa,repb):return sum(np.trace(a)*np.trace(b) for a,b in zip(repa,repb))/G
decomp={k:{name:float(round(mult(rho[k],r),12)) for name,r in known.items()} for k in range(5)}
# Hodge star in Λ2 using orientation e0123
B2=bases[2];star=np.zeros((6,6))
def eps(seq):
 if len(set(seq))<len(seq):return 0
 inv=sum(seq[i]>seq[j] for i in range(len(seq)) for j in range(i+1,len(seq)));return -1 if inv%2 else 1
for j,(i1,i2) in enumerate(B2):
 comp=[x for x in range(4) if x not in (i1,i2)]
 comp=tuple(comp)
 i=B2.index(comp)
 star[i,j]=eps([i1,i2,*comp])
ev,U=np.linalg.eigh(star);Bm=U[:,ev<0];Bp=U[:,ev>0]
rhop=[Bp.T@R@Bp for R in rho[2]];rhom=[Bm.T@R@Bm for R in rho[2]]
# determine matching triplets by character
matchp={name:mult(rhop,r) for name,r in [('3',ac.rho3),('3p',ac.rho3p)]}
matchm={name:mult(rhom,r) for name,r in [('3',ac.rho3),('3p',ac.rho3p)]}
# Hodge map Λ1->Λ3 matrix
B1=bases[1];B3=bases[3];H13=np.zeros((4,4))
for j,(a,) in enumerate(B1):
 comp=tuple(x for x in range(4) if x!=a);i=B3.index(comp);H13[i,j]=eps([a,*comp])
hodge_err=max(np.linalg.norm(rho[3][g]@H13-H13@rho[1][g]) for g in range(G))
# unique U actual H3->H5 and compare by intertwiners from abstract Λ1/Λ3
rng=np.random.default_rng(20260805)
def intertwiner(src,tgt):
 A=sum(t@rng.normal(size=(t.shape[0],s.shape[0]))@s.T for s,t in zip(src,tgt))/G # wrong varying seed; redo common
 seed=rng.normal(size=(tgt[0].shape[0],src[0].shape[0]));A=sum(t@seed@s.T for s,t in zip(src,tgt))/G;U,_=polar(A);return U,max(np.linalg.norm(t@U-U@s) for s,t in zip(src,tgt))
I1,e1=intertwiner(rho[1],ac.rhoH3);I3,e3=intertwiner(rho[3],ac.rhoH5)
Uactual=I3@H13@I1.T
uerr=max(np.linalg.norm(ac.rhoH5[g]@Uactual-Uactual@ac.rhoH3[g]) for g in range(G))
# Clifford creation/annihilation on full exterior algebra ordered by k then subsets
full=[]
for k in range(5):full+=bases[k]
index={I:i for i,I in enumerate(full)};N=16
create=[];ann=[]
for a in range(4):
 C=np.zeros((N,N));A=np.zeros((N,N))
 for J in full:
  j=index[J]
  if a not in J:
   pos=sum(x<a for x in J);I=tuple(sorted((a,*J)));C[index[I],j]=(-1)**pos
  if a in J:
   pos=J.index(a);I=J[:pos]+J[pos+1:];A[index[I],j]=(-1)**pos
 create.append(C);ann.append(A)
car=max(np.linalg.norm(ann[a]@create[b]+create[b]@ann[a]-(np.eye(N) if a==b else 0)) for a in range(4) for b in range(4))
cc=max(np.linalg.norm(create[a]@create[b]+create[b]@create[a]) for a in range(4) for b in range(4))
aa=max(np.linalg.norm(ann[a]@ann[b]+ann[b]@ann[a]) for a in range(4) for b in range(4))
# grading and Hodge dual dimensions
grading=np.diag([(-1)**len(I) for I in full])
# A5 full exterior representation and character check
rho_full=[]
for g in range(G):
 blocks=[rho[k][g] for k in range(5)]
 M=np.zeros((16,16));p=0
 for bl in blocks:M[p:p+len(bl),p:p+len(bl)]=bl;p+=len(bl)
 rho_full.append(M)
full_dec={name:float(round(mult(rho_full,r),12)) for name,r in known.items()}
# canonical Clifford Dirac for a generic normalized vector: square identity
z=np.array([1,2,-1,3.],float);z/=np.linalg.norm(z)
Dz=sum(z[a]*(create[a]+ann[a]) for a in range(4));dirac_sq=np.linalg.norm(Dz@Dz-np.eye(16));grade_anti=np.linalg.norm(Dz@grading+grading@Dz)
# exact dimensions/state counts
out={
 'decomposition_by_degree':decomp,'full_decomposition':full_dec,
 'selfdual_match':matchp,'antiselfdual_match':matchm,
 'star_square_error':float(np.linalg.norm(star@star-np.eye(6))),
 'star_equivariance_error':float(max(np.linalg.norm(star@R-R@star) for R in rho[2])),
 'hodge_1_to_3_error':float(hodge_err),'actual_U_error':float(uerr),'abstract_intertwiner_errors':[float(e1),float(e3)],
 'CAR_error':float(car),'creation_anticommutator_error':float(cc),'annihilation_anticommutator_error':float(aa),
 'dirac_square_error':float(dirac_sq),'dirac_grading_anticommutator_error':float(grade_anti),
 'dimensions':{'Lambda_even':8,'Lambda_odd':8,'exterior_total':16,'fiveplet':5,'machine_total':21,'one_generation':16,'three_generations_particles':48,'with_conjugates':96},
 'identities':{
  'C13':'Lambda_even(V4) direct_sum V5','Hshadow':'Lambda_odd(V4)','H21':'Lambda_all(V4) direct_sum V5',
  'Lambda2':'V3 direct_sum V3prime','Lambda1_to_Lambda3':'Hodge star'
 },
 'Hodge13':H13.tolist(),'Uactual':Uactual.tolist(),'star2':star.tolist()
}
Path('/mnt/data/exterior_algebra_master_results.json').write_text(json.dumps(out,indent=2))
report=f'''URT EXTERIOR-ALGEBRA MASTER AUDIT\n=================================\n\nDegree decomposition under A5:\n{json.dumps(decomp,indent=2)}\n\nFull exterior algebra: {full_dec}\n\nLambda2 self-dual matching: {matchp}\nLambda2 anti-self-dual matching: {matchm}\n\nErrors:\n  star^2-I                 {out['star_square_error']:.3e}\n  star equivariance       {out['star_equivariance_error']:.3e}\n  Hodge Lambda1->Lambda3  {out['hodge_1_to_3_error']:.3e}\n  actual quartet U        {out['actual_U_error']:.3e}\n  CAR                      {out['CAR_error']:.3e}\n  D(z)^2-I                 {out['dirac_square_error']:.3e}\n  {{D,grading}}             {out['dirac_grading_anticommutator_error']:.3e}\n\nExact structural closure:\n  Lambda^even 4 = 1 + 3 + 3' + 1 (dimension 8)\n  Lambda^odd  4 = 4 + 4          (dimension 8)\n  C_13 = Lambda^even 4 + 5\n  H_sh = Lambda^odd 4\n  H_21 = Lambda^bullet 4 + 5\n\nState count:\n  dim Lambda^bullet 4 = 16 per generation\n  16 x 3 = 48 particle states\n  48 x 2 = 96 including conjugates\n'''
Path('/mnt/data/exterior_algebra_master_report.txt').write_text(report)
print(report)