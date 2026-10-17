#!/usr/bin/env python3
"""Native Cathedral 20-face chirality and actual species-dressed 64x64 coupling audit.

No measured lepton masses and no fitted couplings. Imports the original archived
cathedral_strict_64_closure.py from the working directory or sibling paths.
"""
import sys, json
from pathlib import Path
import numpy as np
from numpy.linalg import eigh, eigvalsh, norm, matrix_rank

HERE=Path(__file__).resolve().parent
for path in (HERE, HERE.parent/'tetra_chiral_audit', HERE.parent/'fractal_koide_verification'):
    if (path/'cathedral_strict_64_closure.py').is_file():
        sys.path.insert(0,str(path));break
import cathedral_strict_64_closure as c

v,vc,edges,faces,ds,inc=c.icosahedron()
d0,d1,d2,d3=ds
U0,U1,U2,U3=c.bases(v,vc,faces,d1,d2)
L=d2.T@d2
vals,U=eigh(L)
H3=U[:,np.abs(vals-3)<1e-9]
H5=U[:,np.abs(vals-5)<1e-9]
H=np.column_stack((H3,H5))
Ph=H@H.T
centroids=np.array([v[list(f)].sum(axis=0) for f in faces]);W=np.zeros((20,20))
for i in range(20):
    for j in range(20):
        shared=set(faces[i])&set(faces[j])
        triple=sum(v[k]@np.cross(centroids[i],centroids[j]) for k in shared)
        if abs(triple)>1e-8:W[i,j]=np.sign(triple)
assert norm(W+W.T)<1e-11
assert norm(W@W+15*Ph)<1e-10
Cchi=1j*W
Dch=L+Cchi
D_G=H.T@Dch@H
zeroproj=(5*H3@H3.T+3*H5@H5.T-Cchi)/8
assert norm(zeroproj@zeroproj-zeroproj)<1e-11
assert abs(np.trace(zeroproj).real-4)<1e-11
assert norm(Dch@zeroproj)<1e-11
assert norm(zeroproj@Dch)<1e-11
assert np.max(np.abs(np.sort(eigvalsh(D_G))-np.array([0]*4+[8]*4)))<1e-11
# Real H64 is cellular chain 1+12+30+20+1. Embedded 20 face sector.
D64=c.coarse_dirac(ds)
Hface=np.zeros((64,8)); Hface[43:63,:]=H
Sedge=d2@H@np.diag([1/np.sqrt(3)]*4+[1/np.sqrt(5)]*4)
Hedge=np.zeros((64,8));Hedge[13:43,:]=Sedge
B16=np.column_stack((Hedge,Hface))
assert norm(B16.T@B16-np.eye(16))<1e-10
# Operator on the 16D hidden cellular invariant sector: bipartite sqrt(lambda).
expected=np.zeros((16,16))
sqrtlam=np.diag([np.sqrt(3)]*4+[np.sqrt(5)]*4)
expected[:8,8:]=sqrtlam;expected[8:,:8]=sqrtlam
assert norm(D64@B16-B16@expected)<1e-10
assert norm(B16.T@D64@B16-expected)<1e-10
# Original species_data modifies only edge6+6 U1<->U2, not the hidden face8/edge8.
charges,S,Y=c.species_data()
results={}
for name,z in charges.items():
    X=c.dressed_64(D64,U1,U2,Y(z))
    mismatch=norm((X-D64)@B16)
    residual=norm(X@B16-B16@expected)
    assert mismatch<1e-11,(name,mismatch)
    assert residual<1e-11,(name,residual)
    results[name]={'source_to_hidden_16_norm':float(mismatch),
                   'invariant_sector_residual':float(residual)}
# Direct 8 hidden faces, invariant Schur at z (excluding edge and face modes).
# For full exact face eight, elimination of hidden edge eight produces D_eff(z)=(zI - diag(lambda)/z) (not L+iW).
z=4.
Deff=np.diag([z-3/z]*4+[z-5/z]*4)
# Independent full inverse: Hface^T (z I64-D64)^-1 Hface equals inverse of Deff.
Gfull=np.linalg.solve(z*np.eye(64)-D64,Hface)
resolvent_error=norm(Hface.T@Gfull-np.linalg.inv(Deff))
assert resolvent_error<1e-10
# To determine if the actual native charged Yukawa Y links the hidden 8 to the visible 24, calculate.
w24=np.zeros((64,24))
w24[1:13,0:6]=U0
w24[13:43,6:12]=U1
w24[13:43,12:18]=U2
w24[43:63,18:24]=U3
assert norm(B16.T@w24)<1e-10
# Show genuine native, local quadratic vertex conditioning could contact hidden modes,
# but does not make the actual species-loaded 64 source couple to them.
E_i=np.diag(inc[:,0])/3.
bridge=U3.T@E_i@H
# Schur extraction genuine D0 must be derived; adding Dch to D64 as its face block is not done here.
output={
 'hidden_chiral_eigenvalues': np.round(eigvalsh(D_G),12).tolist(),
 'zero_projector_rank':int(matrix_rank(zeroproj,tol=1e-9)),
 'zero_projector_trace':float(np.trace(zeroproj).real),
 'chiral_squared_identity_residual':float(norm(W@W+15*Ph)),
 'chiral_zero_projector_residual':float(norm(Dch@zeroproj)),
 '64_hidden_sector_eigenvalues':np.round(eigvalsh(expected),12).tolist(),
 '64_hidden_invariant_residual':float(norm(D64@B16-B16@expected)),
 'hidden_face_to_visible_24_overlap':float(norm(B16.T@w24)),
 'species_original':results,
 'full_64_resolvent_to_exact_eight_Schur_error':float(resolvent_error),
 'native_original_hidden_eight_effective_D_eff_z4':np.diag(Deff).tolist(),
 'visible_to_hidden_POvm_vertex0_norm':float(norm(bridge)),
 'native_chiral_laplacian_is_original_H64_face_operator':False,
 'koide_Q_from_this_hidden_zero_mode':None,
 'interpretation':'Geometric zero mode rank4 and exact species-decoupled cellular 16-band; not a physical lepton mass prediction'
}
print(json.dumps(output,indent=2))

# Exact tetrahedral A4 subgroup: sign flips of two coordinates (Klein four)
# extended by the 3-cycle x->y->z->x. All are proper icosahedron rotations.
from itertools import product
rotations=[]
for sign in product((-1,1), repeat=3):
    if np.prod(sign)<0:continue
    S=np.diag(sign)
    R=np.eye(3)
    for power in range(3):
        rotations.append(S@np.linalg.matrix_power(np.roll(np.eye(3),1,axis=0),power))
assert len(rotations)==12
face_sets=[frozenset(f) for f in faces]
Gface=[]
for R in rotations:
    permv=[]
    for x in v:
        hits=np.flatnonzero(norm(v-(R@x),axis=1)<1e-8)
        assert len(hits)==1
        permv.append(int(hits[0]))
    permf=[]
    for f in faces:
        fset=frozenset(permv[k] for k in f)
        assert fset in face_sets
        permf.append(face_sets.index(fset))
    P=np.zeros((20,20))
    P[permf,range(20)]=1.
    Gface.append(P)
    assert norm(P@zeroproj-zeroproj@P)<1e-10
A4avg=sum(Gface)/12
assert norm(A4avg@A4avg-A4avg)<1e-10
sing=np.real_if_close(zeroproj@A4avg@zeroproj)
assert norm(sing@sing-sing)<1e-10
assert abs(np.trace(sing)-1)<1e-10
Pgen=zeroproj-sing
assert norm(Pgen@Pgen-Pgen)<1e-10
assert abs(np.trace(Pgen)-3)<1e-10
pvals,pvec=eigh(Pgen)
T=pvec[:,pvals>0.5]
assert T.shape==(20,3)
# Local native H64 dressed face Schur is species independent, zI-L/z.
# Explicit resolvent projected into the A4 triplet:
Kexpected=((z*z-3)*(z*z-5))/(z*(z*z-17/4))
Gexpected=1/Kexpected
G3=T.conj().T@(Hface@Hface.T)[43:63,43:63]@T # P_hidden identity test
assert norm(G3-np.eye(3))<1e-10
print('A4 1+3 restriction: rank singlet=',round(float(np.trace(sing).real)),
      'rank triplet=',round(float(np.trace(Pgen).real)))
for label,charge in charges.items():
    O=c.dressed_64(D64,U1,U2,Y(charge))
    embedded=np.zeros((64,3),dtype=complex)
    embedded[43:63,:]=T
    fullsol=np.linalg.solve(z*np.eye(64)-O,embedded)
    Gtrip=embedded.conj().T@fullsol
    res=norm(Gtrip-Gexpected*np.eye(3))
    assert res < 2e-11,(label,res)
    print('species',label,'A4-generation projected resolvent residual',res)
print('Exact native H64 A4 triplet Schur K(z)= (z²-3)(z²-5)/(z(z²-17/4))')
print('At z=4: K(z)=', Kexpected,'= 143/47, degeneracy 3')
print('Its 3x3 Koide Q =', float(3*Kexpected**2/(3*Kexpected)**2),'when treating equal positive K as root masses')
# Native geometry supplies a non-fitted but CONDITIONED positive operator on
# the rank-3 zero-mode triplet. Not part of the original D64 species source.
cyc=rotations[1] if False else np.roll(np.eye(3),1,axis=0)
cyc_idx=next(i for i,R in enumerate(rotations) if norm(R-cyc)<1e-10)
Rface=Gface[cyc_idx]
face_center_candidates=[]
for face in faces:
    verts_set=frozenset(face)
    transformed=[]
    for k in face:
        hits=np.flatnonzero(norm(v-(cyc@v[k]),axis=1)<1e-8)
        transformed.append(int(hits[0]))
    if frozenset(transformed)==verts_set:face_center_candidates.append(face)
assert len(face_center_candidates)==2,face_center_candidates
face_selected=face_center_candidates[0]
Eface=np.diag(np.sum(inc[:,list(face_selected)],axis=1)/9.)
conditioned=T.conj().T@Eface@T
condvals=eigvalsh(conditioned)
Rgen=T.conj().T@Rface@T
assert norm(Rgen@conditioned-conditioned@Rgen)<1e-10
assert norm(np.linalg.matrix_power(Rgen,3)-np.eye(3))<1e-10
Qcond=np.trace(conditioned@conditioned).real/np.trace(conditioned).real**2
Rc=Rgen.astype(complex)
# Extract 3 scalar pieces on the C3 eigenbasis of the defined chosen axis.
mu,P=eigh(conditioned)
# complex eigensystem of Rgen to label m channels
rotvals,rotvecs=np.linalg.eig(Rgen)
labels=[]
for m in (0,1,-1):
    target=np.exp(2j*np.pi*m/3)
    j=int(np.argmin(abs(rotvals-target)))
    labels.append(float(np.vdot(rotvecs[:,j],conditioned@rotvecs[:,j]).real/np.vdot(rotvecs[:,j],rotvecs[:,j]).real))
# m0, m+1, m-1 labels
axial_a=sum(labels)/3
axial_b=(2*labels[0]-labels[1]-labels[2])/6
axial_c=(labels[2]-labels[1])/(2*np.sqrt(3))
assert norm(np.sort(condvals)-np.sort(labels))<1e-10
print('Native zero-triplet conditioned by actual C3 face',face_selected)
print('  eigenvalues =',condvals)
print('  c3 labelled m=0,+1,-1:',labels)
print('  native conditioned a,b,c:',axial_a,axial_b,axial_c)
print('  native conditioned Q =',Qcond)
