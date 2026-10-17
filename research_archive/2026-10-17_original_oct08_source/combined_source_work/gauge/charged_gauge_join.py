#!/usr/bin/env python3
"""Explicit charged carrier, finite seed and one-state source contacts.

The charged representation is the recovered exterior16 family. History
amplitudes are used only to test gauge covariance of an actual three-generation
Higgs/Yukawa insertion; their singular values are not claimed as masses.
"""
from pathlib import Path
from fractions import Fraction
from itertools import permutations, combinations
import json
import math
import hashlib
import numpy as np
from scipy.linalg import expm, null_space, block_diag, polar
from scipy.spatial.transform import Rotation

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent.parent
HERE.mkdir(parents=True, exist_ok=True)
arrays = {}
checks = {}
results = {}

def norm(a):
    return float(np.linalg.norm(a))

def check(name, condition):
    checks[name] = bool(condition)
    assert condition, name

pauli = np.array([[[0,1],[1,0]], [[0,-1j],[1j,0]], [[1,0],[0,-1]]], complex)
weak2 = pauli/2
colour3 = []
for i,j in [(0,1),(0,2),(1,2)]:
    x=np.zeros((3,3),complex); x[i,j]=x[j,i]=.5
    y=np.zeros((3,3),complex); y[i,j]=-.5j; y[j,i]=.5j
    colour3.extend([x,y])
colour3.extend([np.diag([.5,-.5,0]), np.diag([1,1,-2])/(2*np.sqrt(3))])
colour3=np.array(colour3)

# Exterior16: Lambda^even(C3_colour + C2_weak), all fields left handed.
even = [s for s in range(32) if s.bit_count()%2 == 0]
def exterior_generator(t):
    full=np.zeros((32,32),complex)
    for s in range(32):
        for j in range(5):
            if not s & (1<<j): continue
            s1=s^(1<<j); sign1=(-1)**((s & ((1<<j)-1)).bit_count())
            for i in range(5):
                if s1 & (1<<i): continue
                target=s1|(1<<i)
                sign2=(-1)**((s1 & ((1<<i)-1)).bit_count())
                full[target,s] += sign1*sign2*t[i,j]
    return full[np.ix_(even,even)]

Y5=np.diag([-1/3]*3+[1/2]*2)
W5=np.array([block_diag(np.zeros((3,3)),w) for w in weak2])
C5=np.array([block_diag(c,np.zeros((2,2))) for c in colour3])
Yext=exterior_generator(Y5)
Wext=np.array([exterior_generator(t) for t in W5])
Cext=np.array([exterior_generator(t) for t in C5])

# Physical particle convention: Q_L(6), L_L(2), u_R(3), d_R(3), e_R, nu_R.
Y=np.diag([1/6]*6+[-1/2]*2+[2/3]*3+[-1/3]*3+[-1,0])
W=np.array([block_diag(np.kron(np.eye(3),w),w,np.zeros((8,8))) for w in weak2])
C=np.array([block_diag(np.kron(c,np.eye(2)),np.zeros((2,2)),c,c,np.zeros((2,2))) for c in colour3])
T=np.concatenate([Y[None],W,C])
Qem=Y+W[2]
gamma16=np.diag([-1]*8+[1]*8)
T48=np.array([np.kron(np.eye(3),t) for t in T])
T96=np.array([block_diag(t,-t.conj()) for t in T48])
gamma48=np.kron(np.eye(3),gamma16)
gamma96=block_diag(gamma48,-gamma48)
Jlinear=np.block([[np.zeros((48,48)),np.eye(48)],[np.eye(48),np.zeros((48,48))]])

def gram(ts): return np.array([[np.trace(a@b).real for b in ts] for a in ts])
indices=np.diag(gram(T))
indices96=np.diag(gram(T96))
nonabelian = max(norm(a@b-b@a) for a in W for b in C)
abelian = max(norm(Y@a-a@Y) for a in list(W)+list(C))
su2=max(norm(W[i]@W[j]-W[j]@W[i]-1j*sum(np.cross(np.eye(3)[i],np.eye(3)[j])[k]*W[k] for k in range(3))) for i in range(3) for j in range(3))
f=np.array([[[-2j*np.trace((a@b-b@a)@c) for c in colour3] for b in colour3] for a in colour3]).real
su3=max(norm(C[i]@C[j]-C[j]@C[i]-1j*sum(f[i,j,k]*C[k] for k in range(8))) for i in range(8) for j in range(8))
check('charged_SU2_SU3_commute', nonabelian < 1e-12)
check('charged_U1_commutes', abelian < 1e-12)
check('charged_SU2_brackets', su2 < 1e-12)
check('charged_SU3_brackets', su3 < 1e-12)
check('exterior_gauge_brackets_and_cross_commute', max(norm(a@b-b@a) for a in Wext for b in Cext) < 1e-12)
check('one_family_trace_indices', np.max(abs(indices-np.array([10/3]+[2]*11))) < 1e-12)
check('three_generation_conjugate_trace_indices', np.max(abs(indices96-np.array([20]+[12]*11))) < 1e-11)
check('EM_trace_and_primitive_electron_charge', abs(np.trace(Qem@Qem)-16/3)<1e-12 and Qem[14,14]==-1)
check('U1_SU2_cross_trace_zero', abs(np.trace(Y@W[2]))<1e-12)
check('full_96_generators_commute_with_chiral_grading', max(norm(gamma96@t-t@gamma96) for t in T96)<1e-12)
check('KO6_reality_grading', norm(Jlinear@gamma96.conj()+gamma96@Jlinear)<1e-12 and norm(Jlinear@Jlinear.conj()-np.eye(96))<1e-12)
check('conjugate_charge_action', max(norm(Jlinear@t.conj()+t@Jlinear) for t in T96)<1e-12)

# Exact anomaly sums from the recovered all-left-handed family.
family=[('nu^c',1,Fraction(0)),('u^c',3,Fraction(-2,3)),('Q',6,Fraction(1,6)),('e^c',1,Fraction(1)),('L',2,Fraction(-1,2)),('d^c',3,Fraction(1,3))]
exact_anomalies={
 'gravitational_U1':sum((d*y for _,d,y in family),Fraction(0)),
 'U1_cubed':sum((d*y**3 for _,d,y in family),Fraction(0)),
 'SU3_squared_U1':Fraction(1,6)+Fraction(1,2)*Fraction(-2,3)+Fraction(1,2)*Fraction(1,3),
 'SU2_squared_U1':Fraction(3,2)*Fraction(1,6)+Fraction(1,2)*Fraction(-1,2),
 'SU3_cubed':2-1-1,
 'Witten_doublets_mod2':4%2,
}
matrix_cubic=max(abs(np.trace(a@(b@c+c@b))) for a in Cext for b in Cext for c in Cext)
check('exact_all_chiral_anomalies_cancel', all(x==0 for x in exact_anomalies.values()))
check('matrix_SU3_cubic_anomaly_cancel', matrix_cubic<1e-12)
check('matrix_U1_cubic_and_gravitational_cancel', abs(np.trace(Yext))<1e-12 and abs(np.trace(Yext@Yext@Yext))<1e-12)
check('matrix_mixed_anomalies_cancel', max([abs(np.trace(Yext@x@y)) for x in Wext for y in Wext]+[abs(np.trace(Yext@x@y)) for x in Cext for y in Cext])<1e-12)
centre_colour=np.exp(2j*np.pi/3)*np.eye(3)
centre_weak=-np.eye(2)
kernel6=block_diag(np.kron(centre_colour,centre_weak),centre_weak,centre_colour,centre_colour,np.eye(2))@expm(1j*np.pi/3*(6*Y))
check('Z6_quotient_generator_is_kernel', norm(kernel6-np.eye(16))<1e-12)
check('primitive_U1_integer_charges_have_gcd_one', math.gcd(*[int(round(x)) for x in np.diag(6*Y)])==1)

results['charged_representation']={
 'particle_basis':'Q_L colour x weak; L_L weak; u_R colour; d_R colour; e_R; nu_R',
 'dimensions':{'family':16,'generations':3,'particle':48,'particle_and_conjugate':96},
 'trace_indices_family':{'Y':float(indices[0]),'each_SU2':float(indices[1]),'each_SU3':float(indices[4]),'Qem':float(np.trace(Qem@Qem).real)},
 'trace_indices96':{'Y':float(indices96[0]),'each_SU2':float(indices96[1]),'each_SU3':float(indices96[4])},
 'commutator_residuals':{'SU2_SU3':nonabelian,'U1':abelian,'SU2_brackets':su2,'SU3_brackets':su3},
 'anomalies':{k:str(v) for k,v in exact_anomalies.items()},
 'parent_trace_ratios':{'kY_over_k2':5/3,'gY_squared_over_g2_squared':3/5,'sin2theta_at_common_parent_action':3/8},
 'absolute_coefficient':'S=(C/4)sum_a k_a F_a^2 fixes g_a^2=1/(C k_a); C is the physical source/action pullback, not chosen from alpha.'
}
arrays.update({'even_masks':np.array(even),'parent_Y5':Y5,'parent_W5':W5,'parent_C5':C5,'Y_exterior16':Yext,'W_exterior16':Wext,'C_exterior16':Cext,'Y_particle16':Y,'W_particle16':W,'C_particle16':C,'Qem_particle16':Qem,'generators96':T96,'grading96':gamma96,'Jlinear96':Jlinear,'SU3_structure_constants':f})

# Build the actual A5 action on End(V4), not an arbitrary 16-coordinate basis.
perms=[p for p in permutations(range(5)) if sum(p[i]>p[j] for i in range(5) for j in range(i+1,5))%2==0]
def compose(p,q): return tuple(p[q[i]] for i in range(5))
def inv(p): return tuple(p.index(i) for i in range(5))
five=(1,2,3,4,0)
class5a={compose(compose(g,five),inv(g)) for g in perms}
def order(p):
    x=tuple(range(5))
    for k in range(1,7):
        x=compose(p,x)
        if x==tuple(range(5)): return k
    raise AssertionError('invalid permutation')
phi=(1+np.sqrt(5))/2
chars={1:[1,3,3,4,5],2:[1,-1,-1,0,1],3:[1,0,0,1,-1],5:[1,phi,1-phi,-1,0],-5:[1,1-phi,phi,-1,0]}
Q4=null_space(np.ones((1,5)))
P=np.array([np.eye(5)[:,p] for p in perms])
D4=np.array([Q4.T@p@Q4 for p in P])
D16=np.array([np.kron(d,d) for d in D4])
classkeys=[(-5 if order(p)==5 and p not in class5a else order(p)) for p in perms]
projectors=[]; bases=[]
for j,dim in enumerate([1,3,3,4,5]):
    pj=dim/60*sum(chars[c][j]*d for c,d in zip(classkeys,D16))
    pj=(pj+pj.T)/2
    e,u=np.linalg.eigh(pj); bj=u[:,e>.5]
    projectors.append(pj); bases.append(bj)
    check('A5_End4_projector_rank_'+str(j),bj.shape[1]==dim and norm(pj@pj-pj)<1e-12)
check('A5_End4_projectors_complete', norm(sum(projectors)-np.eye(16))<1e-12)
check('A5_End4_projectors_orthogonal', max(norm(a@b) for i,a in enumerate(projectors) for j,b in enumerate(projectors) if i!=j)<1e-12)
singlet=np.eye(4).reshape(-1)/2
check('A5_End4_identity_singlet',norm(projectors[0]@singlet-singlet)<1e-12)
weak_A5=np.array([bases[1].T@d@bases[1] for d in D16])
colour_A5=np.array([bases[2].T@d@bases[2] for d in D16])
colour_response=np.column_stack([bases[2],bases[4]])
colour_response_A5=np.array([colour_response.T@d@colour_response for d in D16])
colour_adjoint_A5=np.array([[[2*np.trace(ti@r@tj@r.T).real for tj in colour3] for ti in colour3] for r in colour_A5])
# Group averaging produces an intertwiner; polar normalization makes it an
# isometry without choosing any physical action coefficient.
seed=np.cos((np.arange(8)[:,None]+1)*(np.arange(8)[None,:]+1))
averaged=sum(r@seed@a.T for r,a in zip(colour_response_A5,colour_adjoint_A5))/60
colour_intertwiner,positive=polar(averaged)
check('colour_source_intertwiner_has_full_rank',np.linalg.svd(averaged,compute_uv=False).min()>1e-8)
source_colour_basis=colour_response@colour_intertwiner
gauge_basis=np.column_stack([singlet,bases[1],source_colour_basis])
geo_basis=bases[3]
check('A5_response_12_plus_geometry4',norm(gauge_basis.T@gauge_basis-np.eye(12))<1e-12 and norm(geo_basis.T@gauge_basis)<1e-12)
equivariance=max(norm(d@gauge_basis-gauge_basis@block_diag(np.eye(1),rw,rc)) for d,rw,rc in zip(D16,weak_A5,colour_adjoint_A5))
check('physical_gauge_to_A5_entropy_source_isometry_is_equivariant',equivariance<1e-11)
check('weak_3_and_colour_3prime_preserve_distinct_5cycle_characters',max(abs(np.trace(rw)-chars[c][1])+abs(np.trace(rc)-chars[c][2]) for rw,rc,c in zip(weak_A5,colour_A5,classkeys))<1e-11)
Pcolour=np.diag([1,1,1,0,0])
check('selected_3_plus_2_is_a_vacuum_split_not_full_A5_invariant',max(norm(p@Pcolour-Pcolour@p) for p in P)>1)

# Preserve the rotation seed explicitly inside the two independent gauge factors.
rotations=weak_A5
check('weak_and_colour_A5_triplets_are_SO3',max(norm(r.T@r-np.eye(3))+abs(np.linalg.det(r)-1) for r in list(weak_A5)+list(colour_A5))<1e-11)
binary=[]
for r in rotations:
    x,y,z,w=Rotation.from_matrix(r).as_quat()
    u=w*np.eye(2)-1j*(x*pauli[0]+y*pauli[1]+z*pauli[2])
    binary.extend([u,-u])
binary=np.array(binary)
check('A5_rotation_seed_has_60_members',len(rotations)==60)
check('binary_icosahedral_weak_seed_has_120_members',len(binary)==120)
closure=max(min(norm(u@v-w) for w in binary) for u in binary for v in binary)
check('binary_icosahedral_seed_closes',closure<1e-12)
adjoint=max(norm(np.array([[.5*np.trace(pauli[i]@u@pauli[j]@u.conj().T).real for j in range(3)] for i in range(3)])-r) for r,u in zip(rotations,binary[::2]))
check('2I_weak_adjoint_matches_A5_rotation_seed',adjoint<1e-12)
sampleR=colour_A5[13]; sampleU=binary[26]
colourSeed=block_diag(np.kron(sampleR,np.eye(2)),np.eye(2),sampleR,sampleR,np.eye(2))
weakSeed=block_diag(np.kron(np.eye(3),sampleU),sampleU,np.eye(8))
check('physical_colour_A5_and_weak_2I_seed_actions_commute',norm(colourSeed@weakSeed-weakSeed@colourSeed)<1e-12)
arrays.update({'A5_permutations':np.array(perms),'A5_V4_basis':Q4,'A5_V4':D4,'A5_End4_projectors':np.array(projectors),'A5_gauge_response_basis':gauge_basis,'A5_geometry_response_basis':geo_basis,'A5_rotations3':rotations,'A5_colour3prime':colour_A5,'A5_colour_adjoint8':colour_adjoint_A5,'colour_response_intertwiner':colour_intertwiner,'binary_icosahedral_SU2':binary})
results['seed_join']={'A5_End4_ranks':[b.shape[1] for b in bases],'binary_group_closure_residual':closure,'binary_adjoint_residual':adjoint,'source_equivariance_residual':equivariance,'weak_seed':'A5 triplet3 lifted to 2I in SU2; central -I acts on doublets.','colour_seed':'A5 triplet3prime embedded in SO3 subset SU3; its SU3 adjoint decomposes as 3prime+5.','scope':'The response carrier, selected 3+2 parent carrier, and charged Hilbert carrier are distinct typed spaces. Full A5 does not preserve the selected 3+2 split.'}

# The same hidden8 Gibbs state; density and generator coordinate metrics.
delta=.15-80*np.pi/(1053*phi)
eta=-np.log(delta)
a=1/(4*(1+delta**2)); b=delta**2*a
rho=np.diag([a]*4+[b]*4)
L=(a-b)/(2*eta); chi=1/L
logrho=np.log(np.diag(rho))
divided=np.empty((8,8))
for i in range(8):
    for j in range(8):
        divided[i,j]=((logrho[i]-logrho[j])/(rho[i,i]-rho[j,j]) if i!=j and rho[i,i]!=rho[j,j] else 1/rho[i,i])
modular=np.where(abs(logrho[:,None]-logrho[None,:])<1e-10, (np.diag(rho)[:,None]+np.diag(rho)[None,:])/2, 0)
for i in range(8):
    for j in range(8):
        if abs(logrho[i]-logrho[j])>1e-10: modular[i,j]=(rho[i,i]-rho[j,j])/(logrho[i]-logrho[j])
source=np.sqrt(indices)[None,:]*gauge_basis
def hidden_x(x):
    m=x.reshape(4,4)
    return np.block([[np.zeros((4,4)),m.T],[m,np.zeros((4,4))]])/np.sqrt(2)
density_tangents=np.array([hidden_x(source[:,i]) for i in range(12)])
metric=np.array([[np.sum(divided*x*y.T).real for y in density_tangents] for x in density_tangents])
modmetric=np.array([[np.sum(modular*x*y.T).real for y in density_tangents] for x in density_tangents])
check('same_hidden8_density_BKM_source_pullback',norm(metric-chi*np.diag(indices))<1e-9)
check('same_hidden8_modular_KM_source_pullback_is_inverse_coordinate_stiffness',norm(modmetric-L*np.diag(indices))<1e-12)
check('density_to_modular_dictionary_recovers_same_chi',norm(chi**2*modmetric-metric)<1e-9)
check('density_BKM_chi_matches_canonical_expression',abs(chi-8*eta*(1+delta**2)/(1-delta**2))<1e-12)
arrays.update({'hidden_rho':rho,'hidden_density_gauge_tangents':density_tangents,'hidden_density_BKM_pullback':metric,'hidden_modular_KM_pullback':modmetric,'physical_trace_source_isometry':source})
results['entropy_source_pullback']={'Delta':float(delta),'eta':float(eta),'chi_density':float(chi),'modular_coordinate_stiffness':float(L),'normalization':'delta rho(X)=[[0,X^T],[X,0]]/sqrt(2); delta K=-chi delta rho gives the density-coordinate pullback.','chart_premise':'An isometry of the normalized physical trace generators into the actual A5 response sectors is constructed. This is a typed source chart, not a recovered theorem identifying it with all terms in the physical transfer.','absolute_not_chosen_from_observations':True}

# Higgs/Yukawa contacts using the parent's actual common signed-history amplitudes.
source_file=ROOT/'combined_source_work/species/combined_signed_source_operators.npz'
hist=np.load(source_file)
Ys=hist['loaded_amplitudes'][:,0]
h=np.array([1/np.sqrt(5),2j/np.sqrt(5)])
def D48(higgs):
    tilde=1j*pauli[1]@higgs.conj()
    out=np.zeros((48,48),complex)
    for gi in range(3):
        for gj in range(3):
            for f,slR,colvec,slL in [(0,slice(8,11),tilde,slice(0,6)),(1,slice(11,14),higgs,slice(0,6)),(2,slice(14,15),higgs,slice(6,8)),(3,slice(15,16),tilde,slice(6,8))]:
                entry=Ys[f,gi,gj]*(np.kron(np.eye(3),colvec[:,None]) if f<2 else colvec[:,None])
                out[16*gi+slL.start:16*gi+slL.stop,16*gj+slR.start:16*gj+slR.stop]+=entry
    return out+out.conj().T
D=D48(h)
fullD=block_diag(D,D.conj())
check('actual_history_Yukawa_is_KO6_odd_and_real',norm(fullD@gamma96+gamma96@fullD)<1e-11 and norm(Jlinear@fullD.conj()-fullD@Jlinear)<1e-11)
ward=[]
for i in range(12):
    higgs_t=(.5*np.eye(2) if i==0 else weak2[i-1] if i<4 else np.zeros((2,2)))
    tt=T48[i]
    u=expm(.37j*tt); hp=expm(.37j*higgs_t)@h
    err=norm(D48(hp)-u@D@u.conj().T)
    d1=1j*(tt@D-D@tt); d2=-(tt@(tt@D-D@tt)-(tt@D-D@tt)@tt)
    Q=np.eye(48)+D@D
    q1=D@d1+d1@D
    q2=2*d1@d1+D@d2+d2@D
    inverse=np.linalg.inv(Q)
    contact=np.trace(inverse@q2).real
    connected=np.trace(inverse@q1@inverse@q1).real
    ward.append({'generator':i,'finite_covariance_error':err,'contact':float(contact),'connected':float(connected),'trace_log_second_derivative':float(contact-connected)})
check('all_12_history_loaded_Yukawa_Higgs_Ward_identities',max(x['finite_covariance_error'] for x in ward)<1e-11)
check('Higgs_history_logdet_contacts_cancel_on_gauge_orbits',max(abs(x['trace_log_second_derivative']) for x in ward)<1e-10)
qwords=np.array([[1,3,-4],[1,-3,2],[-3,-3,6],[-3,3,0]])
primitive_from_carrier=np.array([[6*Y[0,0],3,-6*Y[8,8]],[6*Y[0,0],-3,-6*Y[11,11]],[6*Y[6,6],-3,-6*Y[14,14]],[6*Y[6,6],3,-6*Y[15,15]]])
check('primitive_charge_words_recovered_from_covariant_Yukawa_representation',np.max(abs(qwords-primitive_from_carrier))<1e-12 and np.max(abs(qwords.sum(axis=1)))==0)
arrays.update({'history_loaded_Yukawa_samples':Ys,'Higgs_probe':h,'history_loaded_D48':D,'history_loaded_D96':fullD,'primitive_charge_words':qwords})
results['history_join']={'input_file':str(source_file.relative_to(ROOT)),'input_sha256':hashlib.sha256(source_file.read_bytes()).hexdigest(),'input_key':'loaded_amplitudes[:,0]','scope':'Actual decoded common-history matrices in a covariant Yukawa source insertion, not a claim that these samples are selected physical pole masses.','gauge_contacts':ward,'exact_words':qwords.tolist(),'generation_constraint':'Gauge generators act as I3_generation tensor rho16; the generation matrices may be arbitrary. u and d share one Q_L frame, and nu and e share one L_L frame. Independent left-frame changes must transform the charged current.'}

# Nonabelian link source, its seagull contact, and a finite current Ward check.
Nsite=3
def hop(links):
    cc=np.zeros((Nsite*16,Nsite*16),complex)
    for k,u in enumerate(links):
        cc[k*16:(k+1)*16,k*16:(k+1)*16]=-u
        j=(k+1)%Nsite
        cc[k*16:(k+1)*16,j*16:(j+1)*16]=np.eye(16)
    return cc.conj().T@cc
links=[expm(1j*(.13*T[0]+.21*T[1])),expm(1j*(.17*T[2]+.11*T[4])),expm(1j*(.07*T[3]-.19*T[5]))]
H=hop(links)
direction=T[0]+T[1]/3+T[4]/5
R1=1j*direction@links[0]
R2=-direction@direction@links[0]
H1=np.zeros_like(H);H2=np.zeros_like(H)
H1[16:32,:16]=-R1;H1[:16,16:32]=-R1.conj().T
H2[16:32,:16]=-R2;H2[:16,16:32]=-R2.conj().T
def shifted(t): return hop([expm(1j*t*direction)@links[0],*links[1:]])
eps=1e-3
fd1=(-shifted(2*eps)+8*shifted(eps)-8*shifted(-eps)+shifted(-2*eps))/(12*eps)
fd2=(-shifted(2*eps)+16*shifted(eps)-30*H+16*shifted(-eps)-shifted(-2*eps))/(12*eps**2)
check('actual_nonabelian_link_first_source_matrix',norm(fd1-H1)<1e-9)
check('actual_nonabelian_link_seagull_source_matrix',norm(fd2-H2)<1e-8)
beta=.71
e,u=np.linalg.eigh(H); p=np.exp(-beta*e);p/=p.sum(); rr=(u*p)@u.conj().T
logs=np.log(p)
km=np.empty((len(p),len(p)))
for i in range(len(p)):
    for j in range(len(p)):
        km[i,j]=p[i] if abs(logs[i]-logs[j])<1e-10 else (p[i]-p[j])/(logs[i]-logs[j])
def cov(v):
    vv=u.conj().T@v@u
    return np.sum(km*abs(vv)**2).real-np.trace(rr@v).real**2
response=beta*np.trace(rr@H2).real-beta**2*cov(H1)
def free(t): return -np.log(np.exp(-beta*np.linalg.eigvalsh(shifted(t))).sum())
fdF=(-free(2*eps)+16*free(eps)-30*free(0)+16*free(-eps)-free(-2*eps))/(12*eps**2)
check('link_free_energy_contact_complete_Hessian',abs(response-fdF)<1e-8)
G=block_diag(direction,np.zeros((32,32)))
Hg1=1j*(G@H-H@G); Hg2=-(G@(G@H-H@G)-(G@H-H@G)@G)
pure=beta*np.trace(rr@Hg2).real-beta**2*cov(Hg1)
check('local_gauge_orbit_contact_covariance_cancel',abs(pure)<1e-12)
arrays.update({'nonabelian_link_H':H,'nonabelian_link_H_first':H1,'nonabelian_link_H_second':H2,'nonabelian_link_rho':rr,'pure_gauge_H_first':Hg1,'pure_gauge_H_second':Hg2})
results['link_source_contacts']={'scope':'A finite charged-representation kinetic action used to verify the derivative dictionary, not a replacement of recovered full Hlocal.','beta_probe':beta,'first_matrix_error':norm(fd1-H1),'second_matrix_error':norm(fd2-H2),'contact_complete_Hessian':float(response),'free_energy_finite_difference':float(fdF),'pure_gauge_Hessian':float(pure)}

results['checks']=checks
results['passed_checks']=sum(checks.values())
results['observational_anchors_used']=False
results['physical_absolute_coupling_claimed']=False
(HERE/'charged_gauge_join_checks.json').write_text(json.dumps(results,indent=2)+'\n')
np.savez_compressed(HERE/'charged_gauge_join_operators.npz',**arrays)
print(json.dumps({'passed':sum(checks.values()),'total':len(checks),'indices':results['charged_representation']['trace_indices_family'],'chi':float(chi),'link_Hessian':float(response),'pure_gauge':float(pure)},indent=2))
