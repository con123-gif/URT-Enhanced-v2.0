"""URTF / Cathedral finite symmetry compiler (LOCAL ONLY).

Discover an analytical inverse for arbitrary *A5-equivariant*, invertible
64x64 operators on the augmented icosahedral cell complex, without computing
spectral roots. Five rank-4 multiplicity spaces -> five cubic CH polynomials.

Also tests:
 - pi/e + golden-angle URTF two-boundary shooting (not universal optimization);
 - a noncommuting symmetry-preserving signed-face complex coupling;
 - exact Woodbury correction for four deliberately localized source defects;
 - a finite 64-state-per-layer many-stage coupled quadratic solve via O(m)
   exact block Thomas recurrence (constant block = 64 after preprocessing).

All couplings added to the audited D64 are *specified test functionals*, not
unique physical SM/Einstein action. Numerical constants never fit observations.
Requires numpy and scipy and the sibling cathedral_operator_audit.py.
"""
from __future__ import annotations
import json
import time
from pathlib import Path
import numpy as np
from scipy import sparse
from scipy.sparse.linalg import spsolve
from cathedral_operator_audit import geometry, dirac_64, PHI, DELTA, ETA, CHI

OUT = Path(__file__).resolve().parent / 'URTF_Cathedral_symmetry_compiler_results_LOCAL.json'
KAPPA = np.pi / np.e
THETA = 2*np.pi / PHI**2
DIMS = {'1':1,'3':3,'3p':3,'4':4,'5':5}


def group_64(vertices, edges, faces):
    """All 60 proper A5 actions, respecting oriented chain boundaries."""
    base=vertices[list(faces[0])].T
    edge_idx={e:i for i,e in enumerate(edges)}
    face_idx={frozenset(f):i for i,f in enumerate(faces)}
    actions=[]
    traces=[]
    orders=[]
    for f in faces:
        for cyc in range(3):
            ids=list(f[cyc:])+list(f[:cyc])
            R=vertices[ids].T @ np.linalg.inv(base)
            rotated=vertices@R.T
            p=np.argmin(np.linalg.norm(rotated[:,None,:]-vertices[None,:,:],axis=2),axis=1)
            assert len(set(p))==12 and np.max(np.linalg.norm(rotated-vertices[p],axis=1))<1e-10
            A=np.zeros((64,64))
            A[0,0]=1; A[63,63]=1
            for i in range(12):A[1+p[i],1+i]=1
            for j,(a,b) in enumerate(edges):
                na,nb=int(p[a]),int(p[b])
                idx=edge_idx[tuple(sorted((na,nb)))]
                A[13+idx,13+j]=1 if na<nb else -1
            for j,(a,b,c) in enumerate(faces):
                new=(int(p[a]),int(p[b]),int(p[c]))
                idx=face_idx[frozenset(new)]
                canon=faces[idx]
                cyclic=(canon,(canon[1],canon[2],canon[0]),(canon[2],canon[0],canon[1]))
                A[43+idx,43+j]=1 if new in cyclic else -1
            assert np.linalg.norm(A.T@A-np.eye(64))<1e-12
            powers=np.eye(3)
            for n in range(1,7):
                powers=powers@R
                if np.linalg.norm(powers-np.eye(3))<1e-9:break
            assert n in (1,2,3,5)
            actions.append(A)
            orders.append(n)
            traces.append(float(np.trace(R)))
    assert sorted({n:orders.count(n) for n in set(orders)}.items())==[(1,1),(2,15),(3,20),(5,24)]
    assert len(actions)==60
    return actions, traces, orders


def a5_projectors(actions, traces, orders):
    projectors={}
    for name, dim in DIMS.items():
        P=np.zeros((64,64))
        for U,t,n in zip(actions,traces,orders):
            if name=='1': char=1.
            elif name=='3':char=t
            elif name=='3p':char=1-t if n==5 else {1:3,2:-1,3:0}[n]
            elif name=='4':char={1:4,2:0,3:1,5:-1}[n]
            else:char={1:5,2:1,3:-1,5:0}[n]
            P+=char*U
        P*=dim/60
        P=(P+P.T)/2
        assert np.linalg.norm(P@P-P)<2e-12
        assert abs(np.trace(P)-4*dim)<2e-12
        projectors[name]=P
    assert np.linalg.norm(sum(projectors.values())-np.eye(64))<2e-12
    return projectors


def orientation_W(v,faces):
    centroids=[v[list(f)].sum(axis=0) for f in faces]
    W=np.zeros((20,20),dtype=float)
    for a,fa in enumerate(faces):
        for b,fb in enumerate(faces):
            t=sum(float(v[i]@np.cross(centroids[a],centroids[b]))
                  for i in set(fa).intersection(fb))
            if abs(t)>1e-9:W[a,b]=1 if t>0 else -1
    assert np.linalg.norm(W+W.T)==0
    return W


def invariant_coupled_operator(boundaries,C,W):
    """A positive Hermitian A5-equivariant chosen test action: includes
    canonical spectral depth, face incidence, and signed chiral circulation."""
    D=dirac_64(boundaries)
    B=np.zeros((64,64))
    B[1:13,43:63]=C.T/np.sqrt(3)
    B[43:63,1:13]=C/np.sqrt(3)
    Wbig=np.zeros((64,64),complex)
    Wbig[43:63,43:63]=1j*W
    K=np.eye(64)+ETA*(D@D)/20+DELTA*(B+Wbig)
    assert np.linalg.norm(K-K.conj().T)<1e-12
    eig=np.linalg.eigvalsh(K)
    assert eig[0]>0
    assert np.linalg.norm((D@D)@B-B@(D@D))>1
    return K, B, Wbig, (eig[0],eig[-1])


def ch_inverse_coefficients(K,projectors):
    """No eigenvalues: reconstruct 4x4 multiplicity characteristic
    coefficients from four traces p_j = Tr(P_isotypic K^j)/dim_irrep.
    Newton identities and Cayley-Hamilton:
      M^-1 = (e3 I - e2 M + e1 M^2 - M^3)/e4.
    """
    q=[np.eye(len(K),dtype=complex)]
    for k in range(4):q.append(q[-1]@K)
    coeff={}
    invariants={}
    for name,P in projectors.items():
        dim=DIMS[name]
        p=[4.]+[np.trace(P@q[j])/dim for j in range(1,5)]
        e=[1.+0j]
        for k in range(1,5):
            e.append(sum((-1)**(j-1)*e[k-j]*p[j]
                         for j in range(1,k+1))/k)
        assert abs(e[4])>1e-10
        coeff[name]=np.array([e[3],-e[2],e[1],-1])/e[4]
        invariants[name]={'e1_e2_e3_e4':[float(x.real) for x in e[1:]],
                          'imaginary_artifact':float(max(abs(x.imag) for x in e[1:]))}
    return coeff,invariants


def compile_inverse(K,projectors,coeff):
    """Reusable matrix-free *action* of symmetry compiled inverse.
    Three K matvecs per RHS, plus five applications of projectors for each
    of 4 powers. For sparse K, finite A5 actions allow sparse O(60*N)
    isotypic projection; here dense P for the fixed 64-state carrier.
    """
    def apply(rhs):
        rhs=np.asarray(rhs,dtype=complex)
        powers=[rhs]
        for k in range(3):powers.append(K@powers[-1])
        out=np.zeros_like(rhs,dtype=complex)
        for name,P in projectors.items():
            combination=sum(coeff[name][i]*powers[i] for i in range(4))
            out+=P@combination
        return out
    return apply


def urtf_boundary(N, target=0.,x0=1.):
    """Two fundamental solutions: O(N) exact linear two-point shooting.
    Not stable for arbitrary target and long N; not a universal minimizer."""
    def sweep(x,previous):
        path=[x]
        for k in range(N):
            a=(1+1/(KAPPA*np.sqrt(k+1)))*np.cos(k*THETA)
            x,previous=a*x-.5*previous,x
            path.append(x)
        return np.array(path)
    u=sweep(1.,0.)
    w=sweep(0.,1.)
    if abs(w[-1])<1e-25:raise ArithmeticError('Ill-conditioned terminal map')
    backward=(target-x0*u[-1])/w[-1]
    path=sweep(x0,backward)
    return path,backward,w[-1]


def rank_defects(N=64):
    """Four known integer charge words used as *test local defects*, not
    physical CKM/PMNS couplings; normalized vectors supported on vertices."""
    words=[(1,3,-4),(1,-3,2),(-3,-3,6),(-3,3,0)]
    U=np.zeros((N,4),dtype=complex)
    for j,w in enumerate(words):
        w=np.array(w,dtype=float)
        v=np.roll(np.r_[w,np.zeros(9)],3*j)
        U[1:13,j]=v/np.linalg.norm(v)
    assert np.linalg.matrix_rank(U)==4
    return U


def layered_solve(K,steps=125, beta=1/4):
    """Boundary forced block chain: K x_n - beta x_{n-1}-beta x_{n+1}=f_n.
    Solve after ONE-TIME diagonalization of the 64-cell K. Each spatial mode
    is an O(steps) scalar Schur-complement recurrence. 64 is fixed.
    """
    vals,V=np.linalg.eigh(K)
    assert vals.min()>2*beta
    c=np.arange(steps)
    # Original URT phase and relative pi/e scaling; bounded by terminal envelope.
    # This is chosen forcing, not the canonical physical variational source.
    window=np.exp((c-(steps-1))*np.log(KAPPA))
    y0=np.zeros(64);y1=np.zeros(64)
    y0[1]=1; y1[43]=1
    f=window[:,None]*(np.cos(c*THETA)[:,None]*y0[None,:]
                      +np.sin(c*THETA)[:,None]*y1[None,:])
    F=f@V.conj()
    denom=np.empty((steps,64),float)
    work=np.empty_like(F)
    denom[0]=vals
    work[0]=F[0]
    for k in range(1,steps):
        correction=beta/denom[k-1]
        denom[k]=vals-beta*correction
        work[k]=F[k]+correction*work[k-1]
    X=np.empty_like(F)
    X[-1]=work[-1]/denom[-1]
    for k in range(steps-2,-1,-1):
        X[k]=(work[k]+beta*X[k+1])/denom[k]
    x=X@V.T
    residual=x@K.T-f
    residual[1:]-=beta*x[:-1]
    residual[:-1]-=beta*x[1:]
    rel=np.linalg.norm(residual)/np.linalg.norm(f)
    return x,f,rel



def h64_species_woodbury(Q, rhs, projectors):
    """Exact full dressed geometric H64 resolvent via 12x12 Woodbury.

    The *specific existing typed seed* is loaded from the audited local
    species implementation. This tests the actual matrix perturbation, not a
    generic rank-4 surrogate. No identification with measured masses/CKM.
    """
    from cathedral_strict_64_closure import (
        icosahedron, bases, species_data, dressed_64
    )
    # The original 64-state Dirac max eigenvalue sqrt(20); z>sqrt(20)
    # avoids the base-resolvent poles and makes the test well conditioned.
    z=6.0
    K0=z*np.eye(64)-Q
    coeff,_=ch_inverse_coefficients(K0,projectors)
    inv=compile_inverse(K0,projectors,coeff)
    v,vc,edges,faces,ds,c=icosahedron()
    U0,U1,U2,U3=bases(v,vc,faces,ds[1],ds[2])
    charge,S,Y_func=species_data()
    F=np.zeros((64,12))
    F[13:43,:6]=U1
    F[13:43,6:]=U2
    # Dressed geometric Dirac = Q + F J F^T, J=[0,Y;Y^T,0].
    # zI-Df = K0 - F J F^T.  For the nonsymmetric-in-sign update,
    # Woodbury reduced inverse is computed without J^-1.
    B=np.column_stack([inv(F[:,j]) for j in range(12)])
    x0=inv(rhs)
    output={}
    sign0, logdet0=np.linalg.slogdet(K0)
    for label,word in charge.items():
        Y=Y_func(word)
        J=np.block([[np.zeros((6,6)),Y],
                    [Y.T,np.zeros((6,6))]])
        Df=dressed_64(Q,U1,U2,Y)
        Kf=z*np.eye(64)-Df
        assert np.linalg.norm(Kf-(K0-F@J@F.T))<1e-11
        reduced=np.eye(12)-F.T@B@J
        x=x0+B@J@np.linalg.solve(reduced,F.T@x0)
        exact=np.linalg.solve(Kf,rhs)
        error=float(np.linalg.norm(Kf@x-rhs)/np.linalg.norm(rhs))
        delta=float(np.linalg.norm(x-exact)/np.linalg.norm(exact))
        signf, logdetf=np.linalg.slogdet(Kf)
        signr, logdetr=np.linalg.slogdet(reduced)
        determinant_error=abs((logdetf-logdet0)-logdetr)
        assert abs(signf-sign0*signr)<1e-11
        assert error<1e-10 and determinant_error<1e-10
        output[label]={'solve_residual':error,
                       'relative_to_dense':delta,
                       'logdet_reduction_error':float(determinant_error),
                       'reduced_size':12}
    return output


def run():
    t0=time.perf_counter()
    v,edges,faces,ds,C=geometry()
    Q=dirac_64(ds)
    acts,traces,orders=group_64(v,edges,faces)
    P=a5_projectors(acts,traces,orders)
    assert max(np.linalg.norm(U@Q-Q@U) for U in acts)<1e-12
    W=orientation_W(v,faces)
    K,inc,chiral,(mine,maxe)=invariant_coupled_operator(ds,C,W)
    assert max(np.linalg.norm(U@K-K@U) for U in acts)<1e-12
    assert max(np.linalg.norm(U[43:63,43:63]@W-W@U[43:63,43:63]) for U in acts)<1e-12
    coeff,invariants=ch_inverse_coefficients(K,P)
    # The multiplicity-four reduction also gives the full 64-state determinant
    # from just five fourth elementary symmetric functions e4.
    det_log_compiled=sum(DIMS[name]*np.log(invariants[name]['e1_e2_e3_e4'][3])
                         for name in DIMS)
    sign64,det_log_direct=np.linalg.slogdet(K)
    assert sign64>0 and abs(det_log_compiled-det_log_direct)<2e-12
    inverse=compile_inverse(K,P,coeff)
    # Two unrelated RHS, one tied to URTF terminal closure and one arbitrary.
    seq,b0,condition=urtf_boundary(64)
    golden=np.exp(1j*THETA*np.arange(64))
    rhs=(seq[:-1]*golden).astype(complex)
    rng=np.random.default_rng(31313)
    arbitrary=rng.normal(size=64)+1j*rng.normal(size=64)
    errors=[]
    for f in (rhs,arbitrary):
        x=inverse(f)
        direct=np.linalg.solve(K,f)
        errors.append({'relative_residual':float(np.linalg.norm(K@x-f)/np.linalg.norm(f)),
                       'relative_dense_error':float(np.linalg.norm(x-direct)/np.linalg.norm(direct))})
        assert errors[-1]['relative_residual']<1e-11

    # Confirm rep-root degeneracies and the maximal fourfold multiplicity.
    multiplicity_roots={}
    for name,p in P.items():
        vals,U=np.linalg.eigh(p)
        sub=U[:,vals>.5]
        spectral=np.linalg.eigvalsh(sub.conj().T@K@sub)
        unique=[]
        for e in spectral:
            if not unique or abs(e-unique[-1])>1e-8:unique.append(e)
        assert len(unique)<=4
        for e in unique:
            assert np.sum(np.abs(spectral-e)<1e-8)%DIMS[name]==0
        multiplicity_roots[name]={'rank':int(sub.shape[1]),'distinct_roots':len(unique),
                    'eigenvalues':[float(x) for x in unique]}

    # Prove method needs symmetry; quantify breaking and repair it with Woodbury.
    source=rank_defects()
    Kbreak=K+DELTA*source@source.conj().T
    twirled=sum(U.T@Kbreak@U for U in acts)/60
    broken_norm=float(np.linalg.norm(Kbreak-twirled)/np.linalg.norm(Kbreak))
    refbreak=np.linalg.solve(Kbreak,rhs)
    incorrect=inverse(rhs)
    shortcut_error=float(np.linalg.norm(Kbreak@incorrect-rhs)/np.linalg.norm(rhs))
    x0=inverse(rhs)
    B=np.column_stack([inverse(source[:,j]) for j in range(4)])
    reduced=np.eye(4)/DELTA+source.conj().T@B
    x_wood=x0-B@np.linalg.solve(reduced,source.conj().T@x0)
    wood_res=float(np.linalg.norm(Kbreak@x_wood-rhs)/np.linalg.norm(rhs))
    wood_error=float(np.linalg.norm(x_wood-refbreak)/np.linalg.norm(refbreak))
    assert shortcut_error>1e-7 and wood_res<1e-11

    # Full species-loaded geometric H64: exact 12x12 low-rank reduction.
    actual_species=h64_species_woodbury(Q,rhs,P)

    # Generic *dense* A5-invariant matrix: theorem independent of specific D64.
    A=rng.normal(size=(64,64))+1j*rng.normal(size=(64,64))
    H=(A+A.conj().T)/2
    averaged=sum(U.T@H@U for U in acts)/60
    Kg=np.eye(64)+0.01*averaged   # chosen safe amplitude
    assert np.linalg.eigvalsh(Kg).min()>0
    generic_coeff,_=ch_inverse_coefficients(Kg,P)
    generic_inv=compile_inverse(Kg,P,generic_coeff)
    generic_err=float(np.linalg.norm(Kg@generic_inv(arbitrary)-arbitrary)/np.linalg.norm(arbitrary))
    assert generic_err<1e-10

    # Many-stage exact Schur/Thomas sweep; nested 64-cell coupled system.
    layers={}
    for m in (13,64,125,500):
        s=time.perf_counter()
        x,f,r=layered_solve(K,m)
        layers[str(m)]={'unknowns':64*m,'residual':float(r), 'wall_seconds':float(time.perf_counter()-s)}
        assert r<1e-12
        if m==13:
            block=sparse.csr_matrix(K)
            full=sparse.kron(sparse.eye(m),block,format='csr')-sparse.kron(
                sparse.diags([np.ones(m-1),np.ones(m-1)],[-1,1],shape=(m,m)),
                sparse.eye(64),format='csr')/4
            ref=spsolve(full,f.reshape(-1)).reshape((m,64))
            rel=float(np.linalg.norm(x-ref)/np.linalg.norm(ref))
            layers[str(m)]['reference_sparse_error']=rel
            assert rel<1e-11

    # An O(N) recursion is possible for *banded stage couplings* after once-only
    # cell block preprocessing. Not universal O(N) for arbitrary 64N couplings.
    out={'date':'2026-10-15','scope':'LOCAL: symmetry-compiled direct Cathedral/URTF solver',
         'core_finding':'A5 equivariant 64 cell = 4 copies each of 1,3,3p,4,5 => 5 cubic Cayley-Hamilton inverse polynomials',
         'group_order':len(acts),'irrep_ranks':{n:int(round(np.trace(p))) for n,p in P.items()},
         'coupled_operator':{'min_eigen':float(mine),'max_eigen':float(maxe),'includes_signed_face_iW':True,
                             'incidence_coupling_strength_DELTA':float(DELTA),'chirality_coupling_strength_DELTA':float(DELTA),
                             'noncommuting':True,'physical_action_derived':False},
         'cubic_invariants':invariants,'full_logdet_from_five_quartics':float(det_log_compiled),
         'logdet_formula_residual':float(abs(det_log_compiled-det_log_direct)),
         'sector_eigenvalues_audit_only':multiplicity_roots,
         'inverse_tests':errors,'inverse_products_per_rhs':3,
         'urt':{'kappa':float(KAPPA),'angle':float(THETA),'boundary_64_initial_minus_one':float(b0),
                'boundary_sensitivity':float(1/abs(condition))},
         'symmetry_breaking':{'relative_twirling_defect':broken_norm,
                     'unrepaired_inverse_residual':shortcut_error,'woodbury_rank':4,
                     'woodbury_residual':wood_res,'woodbury_relative_dense_error':wood_error},
         'actual_geometric_H64_species_12x12_reductions':actual_species,
         'generic_dense_equivariant_test_residual':generic_err,
         'multi_stage_test':layers,
         'caveats':['Stage couplings and mobility are example quadratic action, not derived Einstein or gauge physics',
             'A5 equivariance must hold for cubic formula; finite-rank defects corrected by Woodbury',
             'Spectral moments/projectors have a preprocessing cost; complexity linear in stages for fixed cell size and nearest-stage couplings',
             'URTF phase generates a forcing; it does not automatically fix a physical action',
             'All files local, no GitHub changes']}
    OUT.write_text(json.dumps(out,indent=2)+'\n')
    print('A5 symmetry compiler: ranks',out['irrep_ranks'])
    print('Cubic CH inverse relative residuals:',[round(x['relative_residual'],15) for x in errors])
    print('Generic A5-invariant dense operator residual:',generic_err)
    print('Actual species-loaded geometric H64 resolvents:', actual_species)
    print('Rank-4 defect incorrect old inverse residual:',shortcut_error, 'Woodbury residual:',wood_res)
    print('URT kappa/angle:',KAPPA, THETA, 'boundary backward state:',b0)
    print('Stage solves:')
    for k,v in layers.items():print(k,'stages',v['unknowns'],'unknowns','res',v['residual'],'time',round(v['wall_seconds'],5))
    print('TOTAL wall',round(time.perf_counter()-t0,3),'s. All checks pass.')
    print('Local results:',OUT)
    return out

if __name__=='__main__':run()