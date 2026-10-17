"""Newton's Cathedral / URT -- geometric closure and exact reduction audit.

This module distinguishes exact combinatorial results from metric and physical
ASSUMPTIONS.  No empirical masses or couplings enter any operator.  NumPy only.

Run: python cathedral_strict_64_closure.py

Verified results:
  * 64 = 1 + 12 + 30 + 20 + 1 is a coarse augmented sphere/ball CW complex.
  * The full 20-tetrahedron cone has 13 + 42 + 50 + 20 = 125 simplices
    (126 including augmentation), so 64 is NOT its full simplicial DEC complex.
  * The 8 shell-hidden faces admit a minimal-norm closed 2-chain lift in the
    actual tetrahedral 3-ball. Their spectral eigenvalues shift 3,5 -> 4,6.
    Their modular gap (5-3)=(6-4)=2 is unchanged.
  * The exact four-shell, 24x24 flavour subspace and its 12x12 determinant are
    extracted from the dressed 64x64 ansatz. The remaining 40 states are
    spectators with species-independent eigenvalues.
  * Golden ratios phi^-2 (vertices) and phi^-4 (faces) are true spectral ratios.
  * The submitted S_bridge is not unitary, so no verified physical mass or
    mixing assignment follows from these roots.
  * The correct SU(5)-normalized one-loop weak-angle shift is half the slope
    stated in the user-supplied amended script.
"""
from __future__ import annotations
import itertools
import numpy as np
from numpy.linalg import eigh, eigvalsh, norm, svd

PHI = (1 + np.sqrt(5.0))/2
DELTA = 3/20 - (80/81)*np.pi/(13*PHI)
ETA = -np.log(DELTA)
P5 = DELTA**2/(1+DELTA**2)
TOL = 3e-10


def icosahedron():
    def coords(t):
        return np.array([p for a,b in itertools.product((1,-1), repeat=2)
                         for p in ((0,a,b*t),(a,b*t,0),(b*t,0,a))],float)
    v=coords(PHI); vc=coords(-1/PHI)
    edges=[(i,j) for i,j in itertools.combinations(range(12),2)
           if abs(norm(v[i]-v[j])-2)<1e-8]
    eset=set(edges)
    faces=[]
    for i,j,k in itertools.combinations(range(12),3):
        if (i,j) in eset and (i,k) in eset and (j,k) in eset:
            n=np.cross(v[j]-v[i],v[k]-v[i])
            faces.append((i,j,k) if n@(v[i]+v[j]+v[k])>0 else (i,k,j))
    assert (len(edges),len(faces)) == (30,20)
    edge_index={x:i for i,x in enumerate(edges)}
    d0=np.ones((1,12))
    d1=np.zeros((12,30))
    d2=np.zeros((30,20))
    for col,(i,j) in enumerate(edges): d1[i,col]=-1;d1[j,col]=+1
    for col,(i,j,k) in enumerate(faces):
        for x,y in [(i,j),(j,k),(k,i)]:
            d2[edge_index[tuple(sorted((x,y)))],col]=+1 if x<y else -1
    d3=np.ones((20,1))
    c=np.zeros((20,12))
    for i,f in enumerate(faces):c[i,list(f)]=1
    return v,vc,edges,faces,(d0,d1,d2,d3),c


def coarse_dirac(ds):
    sizes=(1,12,30,20,1)
    offsets=np.cumsum((0,)+sizes)
    mat=np.zeros((64,64))
    for i,d in enumerate(ds):
        l,m,h=offsets[i:i+3]
        mat[l:m,m:h]=d
        mat[m:h,l:m]=d.T
    return mat


def real_tetrahedral_complex(faces):
    """Full 20-simplex cone over ico sphere: 13 V, 42 E, 50 F, 20 T."""
    tetra=[(0,)+tuple(sorted(j+1 for j in f)) for f in faces]
    edges=sorted({e for t in tetra for e in itertools.combinations(t,2)})
    triangles=sorted({f for t in tetra for f in itertools.combinations(t,3)})
    ei={e:i for i,e in enumerate(edges)}
    fi={f:i for i,f in enumerate(triangles)}
    b1=np.zeros((13,42))
    b2=np.zeros((42,50))
    b3=np.zeros((50,20))
    for col,(i,j) in enumerate(edges):b1[i,col]=-1;b1[j,col]=+1
    for col,f in enumerate(triangles):
        for k in range(3):b2[ei[f[:k]+f[k+1:]],col]=(-1)**k
    for col,t in enumerate(tetra):
        for k in range(4):b3[fi[t[:k]+t[k+1:]],col]=(-1)**k
    out_ids=[fi[tuple(sorted(j+1 for j in f))] for f in faces]
    rad_ids=[i for i,f in enumerate(triangles) if 0 in f]
    assert (len(edges),len(triangles),len(tetra))==(42,50,20)
    assert norm(b1@b2)==0 and norm(b2@b3)==0
    return b1,b2,b3,out_ids,rad_ids


def full_hidden_lift(faces, ds, c):
    """Minimal-norm closed lift of 8 shell face vectors into 50 full faces."""
    _,b2,b3,outer,radial=real_tetrahedral_complex(faces)
    Lface=ds[2].T@ds[2]
    ev,U=eigh(Lface)
    hs=np.column_stack((U[:,abs(ev-3)<TOL],U[:,abs(ev-5)<TOL]))
    assert hs.shape==(20,8) and norm(c.T@hs)<TOL
    # Convert the outward oriented face basis to sorted triangle basis.
    signs=[]
    for f in faces:
        n_inversions=sum(f[i]>f[j] for i in range(3) for j in range(i+1,3))
        signs.append((-1)**n_inversions)
    O=np.diag(signs)
    h=O@hs
    H=b3[radial,:].T
    Ldual=H@H.T
    assert norm(Ldual-O@Lface@O)<TOL
    assert norm(b3[outer,:].T-np.eye(20))<TOL
    # Each exterior-face vector alone excites 20 independent tetra volumes.
    shell=np.zeros((50,8));shell[outer,:]=h
    outer_vol=norm(b3.T@shell)
    assert abs(outer_vol-np.sqrt(8))<TOL
    # For h of eigenvalue lambda, y=-H^T h/lambda.
    lambdas=np.array([3]*4+[5]*4,float)
    radial_modes=-(H.T@h)/lambdas[None,:]
    lift=shell.copy();lift[radial,:]=radial_modes
    assert norm(b3.T@lift)<TOL
    assert norm(lift.T@lift-np.diag(1+1/lambdas))<TOL
    lift/=np.sqrt(1+1/lambdas)[None,:]
    full_L2=b2.T@b2+b3@b3.T
    lam3=lambdas+1
    residual=norm(full_L2@lift-lift*lam3[None,:])
    assert residual<TOL
    assert norm(lift.T@lift-np.eye(8))<TOL
    return outer_vol,residual,lam3,H,full_L2,lift


def bases(v,vc,faces,d1,d2):
    X=v/norm(v[:,0]); Xp=vc/norm(vc[:,0])
    F=np.array([v[list(f)].sum(axis=0) for f in faces])
    Fp=np.array([vc[list(f)].sum(axis=0) for f in faces])
    F/=norm(F[:,0]); Fp/=norm(Fp[:,0])
    U0=np.column_stack((X,Xp))
    U1=np.column_stack((d1.T@X/np.sqrt(5-np.sqrt(5)),
                        d1.T@Xp/np.sqrt(5+np.sqrt(5))))
    U2=np.column_stack((d2@F/np.sqrt(3-np.sqrt(5)),
                        d2@Fp/np.sqrt(3+np.sqrt(5))))
    U3=np.column_stack((F,Fp))
    for A in [U0,U1,U2,U3]: assert norm(A.T@A-np.eye(6))<TOL
    assert norm(U1.T@U2)<TOL
    return U0,U1,U2,U3


def species_data():
    vY=np.array([1.,0.,-1.]); vW=np.array([0.,3.,-3.])
    charges={'u':vY+vW,'d':vY-vW,'nu':-3*vY+vW,'e':-3*vY-vW}
    S=(1/np.sqrt(2))*np.array([[0,1,PHI**-1],
                                [1,0,PHI**-2],
                                [PHI**-1,PHI**-2,0]])
    def Y(z):
        Q=DELTA*np.diag(z)
        return np.block([[Q,S],[S.T,-Q]])
    return charges,S,Y


def dressed_64(q,U1,U2,Y):
    qq=q.copy()
    E=U1@Y@U2.T+U2@Y.T@U1.T
    qq[13:43,13:43]+=E
    return qq


def exact_24(Y):
    # q24 in order W0(vertex), W1(coexact-edge), W2(exact-edge), W3(face)
    Jv=np.diag([np.sqrt(5-np.sqrt(5))]*3+[np.sqrt(5+np.sqrt(5))]*3)
    Jf=np.diag([np.sqrt(3-np.sqrt(5))]*3+[np.sqrt(3+np.sqrt(5))]*3)
    out=np.zeros((24,24))
    out[0:6,6:12]=Jv;out[6:12,0:6]=Jv
    out[6:12,12:18]=Y;out[12:18,6:12]=Y.T
    out[12:18,18:24]=Jf;out[18:24,12:18]=Jf
    # Reordering rows by bipartite parity gives 12x12 off-diagonal block
    # row blocks W0,W2; column blocks W1,W3.
    K=np.block([[Jv,np.zeros((6,6))],[Y.T,Jf]])
    assert norm(np.sort(eigvalsh(out))-np.sort(np.r_[-svd(K,compute_uv=False),svd(K,compute_uv=False)]))<TOL
    return out,K


def weak_rg():
    # At M_parent: SU(5)-normalized 1/alpha_1 = 1/alpha_2.
    # At MZ: inv_alpha1=(3/5)*(1-s)/alpha_EM, inv_alpha2=s/alpha_EM.
    # Difference at MZ=(b1-b2)/(2pi)*ln(M_parent/MZ).
    # Therefore s=3/8-(5*alpha_EM/(16pi))*(b1-b2)*t.
    alpha_EM_MZ=1/127.951  # EXTERNAL MEASURED INPUT, not a first-principles prediction
    b1,b2=41/10,-19/6
    slope=5*alpha_EM_MZ*(b1-b2)/(16*np.pi)
    scales={'half log p5/13':-.5*np.log(P5/13),
            '2 eta':2*ETA,
            '2 eta + log2':2*ETA+np.log(2)}
    return slope,[(key,t,3/8-slope*t) for key,t in scales.items()]


def main():
    v,vc,edges,faces,ds,c=icosahedron()
    d0,d1,d2,d3=ds
    q=coarse_dirac(ds)
    assert norm(d0@d1)==0 and norm(d1@d2)==0 and norm(d2@d3)==0
    assert abs((5-np.sqrt(5))/(5+np.sqrt(5))-PHI**-2)<TOL
    assert abs((3-np.sqrt(5))/(3+np.sqrt(5))-PHI**-4)<TOL
    outer_vol,full_err,full_eigs,H,full_L2,hlift=full_hidden_lift(faces,ds,c)
    U0,U1,U2,U3=bases(v,vc,faces,d1,d2)
    charges,S,assembleY=species_data()
    sv_s=svd(S,compute_uv=False)
    print('CATHEDRAL -- TOPOLOGY AND MATRIX CLOSURE')
    print('coarse H64:   1+12+30+20+1 = 64')
    print('full 3D cone: 13+42+50+20 = 125, or 126 with augmentation')
    print(f'hidden 2-form outer-only volume coupling: {outer_vol:.12f} (sqrt(8))')
    print(f'canonical closed 8-mode extension residual: {full_err:.3g}')
    print('canonical full-3D hidden eigenvalues:',np.unique(full_eigs,return_counts=True))
    print('Gibbs gap: shell 5-3 = 2; full-3D 6-4 = 2, unchanged')
    print(f'vertex triplet eigenvalue ratio: phi^-2 = {PHI**-2:.12f}')
    print(f'face triplet eigenvalue ratio:   phi^-4 = {PHI**-4:.12f}')
    print('charge word basis correct; bridge singular values:',sv_s)
    print('bridge orthogonality residual:',norm(S.T@S-np.eye(3)))
    spectator=np.array([np.sqrt(12),np.sqrt(20)]
      +[np.sqrt(6)]*5+[np.sqrt(2)]*5+[np.sqrt(3)]*4+[np.sqrt(5)]*4)
    w24=np.zeros((64,24))
    w24[1:13,0:6]=U0
    w24[13:43,6:12]=U1
    w24[13:43,12:18]=U2
    w24[43:63,18:24]=U3
    assert norm(w24.T@w24-np.eye(24))<TOL
    print('species roots (12 positive eigenvalues per sector):')
    spectra={}
    for name,z in charges.items():
        Y=assembleY(z)
        full=dressed_64(q,U1,U2,Y)
        reduced,K=exact_24(Y)
        invariant=norm((np.eye(64)-w24@w24.T)@full@w24)
        match=norm(w24.T@full@w24-reduced)
        assert invariant<TOL and match<TOL
        eigen_all=eigvalsh(full)
        expected=np.r_[eigvalsh(reduced),spectator,-spectator]
        spec_err=norm(np.sort(eigen_all)-np.sort(expected))
        assert spec_err<TOL
        roots=np.sort(svd(K,compute_uv=False))
        spectra[name]=roots
        print(f'  {name:<2} +roots={np.array2string(roots,precision=9)}')
        print(f'     64->24 residual={match:.3g}, spectator factor residual={spec_err:.3g}')
    slope,results=weak_rg()
    print(f'Correct SM one-loop weak-angle slope: {slope:.12f}')
    for label,t,s in results: print(f'  {label:<17} t={t:.9f}, sin^2thetaW={s:.9f}')
    print('  alpha_EM(MZ)=1/127.951 is measured input, not predicted')
    print('RESULT: exact 3D hidden lift and 24->12 determinant established.')
    print('Physical gravity susceptibility, physical mass/mixing maps NOT established.')

if __name__=='__main__': main()