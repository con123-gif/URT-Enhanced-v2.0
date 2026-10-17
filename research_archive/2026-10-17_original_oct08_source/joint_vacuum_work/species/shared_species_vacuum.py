"""Conditional shared-vacuum response of the recovered actual64 source chart.

This is a fixed declared finite probe action, not the recovered canonical
V_URT. Neither deformation coefficient nor interpolation label is optimized.
"""
from pathlib import Path
import json
import numpy as np
from scipy.optimize import minimize

ROOT=Path(__file__).resolve().parents[2]
OUT=Path(__file__).resolve().parent
z=np.load(ROOT/"derive_three_work/species/golden_species_operators.npz")
phi=(1+np.sqrt(5))/2
alpha=phi**-2
I=np.eye(3)
names=["u","d","e","nu"]
weights=np.array([3,3,1,1])
decoder=z["affine_L_plus"]
frame=np.column_stack([z["F5"],z["Qplus"],z["Qminus"]])
G=z["generation6_frame"]
Qp,Qm=z["Qplus"],z["Qminus"]
P5=z["degree5_blind_projector"]
amap=(decoder@frame).T.reshape(13,3,3)
sources=z["complex_amplitude_sources"].reshape(4,3,3)
source_norm=np.sum(abs(sources)**2,axis=(1,2))

def adj(a):return a.conj().T
def block(a):return np.block([[np.zeros((3,3)),adj(a)],[a,np.zeros((3,3))]])
def mblock(a):return np.block([[I,adj(a)],[a,np.zeros((3,3))]])
def an(a,b):return a@b+b@a

def qdata(x,s,f,mode="natural",eps=0.,interpolation=1.):
    a=np.einsum("i,iab->ab",x,amap)+(1+s)*sources[f]
    ai=np.concatenate([amap,sources[f:f+1]],axis=0)
    mi=np.array([block(v) for v in ai])
    m=mblock(a)
    base=m@m
    qi=np.einsum("iab,bc->iac",mi,m)+np.einsum("ab,ibc->iac",m,mi)
    qij=np.einsum("iab,jbc->ijac",mi,mi)+np.einsum("jab,ibc->ijac",mi,mi)
    extra=np.zeros((6,6),complex)
    extrai=np.zeros((14,6,6),complex)
    extraij=np.zeros((14,14,6,6),complex)
    if mode=="gold":
        cr=adj(a)@a-I
        cl=a@adj(a)-I
        cri=np.array([adj(v)@a+adj(a)@v for v in ai])
        cli=np.array([v@adj(a)+a@adj(v) for v in ai])
        crij=np.array([[adj(u)@v+adj(v)@u for v in ai] for u in ai])
        clij=np.array([[u@adj(v)+v@adj(u) for v in ai] for u in ai])
        extra=alpha*np.block([[cr@cr,np.zeros((3,3))],[np.zeros((3,3)),cl@cl]])
        for i in range(14):
            extrai[i]=alpha*np.block([[an(cr,cri[i]),np.zeros((3,3))],[np.zeros((3,3)),an(cl,cli[i])]])
            for j in range(14):
                extraij[i,j]=alpha*np.block([[an(cri[i],cri[j])+an(cr,crij[i,j]),np.zeros((3,3))],
                    [np.zeros((3,3)),an(cli[i],cli[j])+an(cl,clij[i,j])]])
        base+=eps*extra
        qi+=eps*extrai
        qij+=eps*extraij
    elif mode=="interpolation":
        cli=np.array([v@adj(a)+a@adj(v) for v in ai])
        clij=np.array([[u@adj(v)+v@adj(u) for v in ai] for u in ai])
        # Natural is interpolation=1, triangular Gram is interpolation=0.
        base[3:,3:]+=(1-interpolation)*(I-a@adj(a))
        qi[:,3:,3:]-=(1-interpolation)*cli
        qij[:,:,3:,3:]-=(1-interpolation)*clij
    elif mode=="positive_root":
        d=m+2*np.eye(6)
        base=d@d/5
        qi=(np.einsum("iab,bc->iac",mi,d)+np.einsum("ab,ibc->iac",d,mi))/5
        qij=qij/5
    q=alpha*np.eye(6)+base
    return a,q,qi,qij,extra,extrai

def action(x,s=0.,mode="natural",eps=0.,interpolation=1.,need_hess=True):
    # One common potential for the four species; no per-species vacuum fit.
    value=.5*alpha*(x@x)
    grad=np.r_[alpha*x,0.]
    hess=np.zeros((14,14));hess[:13,:13]=alpha*np.eye(13)
    epsfirst=0.;epsmixed=np.zeros(14);epssecond=0.
    for f,nf in enumerate(weights):
        a,q,qi,qij,qe,qie=qdata(x,s,f,mode,eps,interpolation)
        ev=np.linalg.eigvalsh(q);assert min(ev)>0
        R=np.linalg.inv(q)
        value+=.5*nf*np.sum(np.log(ev))
        grad+=.5*nf*np.einsum("ab,iba->i",R,qi).real
        if need_hess:
            contact=np.einsum("ab,ijba->ij",R,qij).real
            bubble=np.einsum("ab,ibc,cd,jda->ij",R,qi,R,qi).real
            hess+=.5*nf*(contact-bubble)
        if mode=="gold":
            epsfirst+=.5*nf*np.trace(R@qe).real
            epsmixed+=.5*nf*(np.einsum("ab,iba->i",R,qie)-np.einsum("ab,ibc,cd,da->i",R,qi,R,qe)).real
            epssecond-=.5*nf*np.trace(R@qe@R@qe).real
        elif mode=="hidden":
            N=source_norm[f];t=1+s;u=1+.5*eps*N*t*t
            value+=3*nf*np.log(u)
            grad[-1]+=3*nf*eps*N*t/u
            hess[-1,-1]+=3*nf*eps*N*(1-.5*eps*N*t*t)/(u*u)
            epsfirst+=1.5*nf*N*t*t/u
            epsmixed[-1]+=3*nf*N*t/(u*u)
            epssecond-=.75*nf*N*N*t**4/(u*u)
    # Full64 determinant constant; Q=alpha I64+K64, hidden rails fixed.
    constant=.5*np.sum(weights)*(4*np.log(alpha+3)+4*np.log(alpha+5)+50*np.log(2*alpha))
    return value+constant,grad,hess,epsfirst,epsmixed,epssecond

def solve(s=0.,mode="natural",eps=0.,interpolation=1.,start=None):
    if start is None:start=np.zeros(13)
    fun=lambda x:action(x,s,mode,eps,interpolation,False)[0]
    jac=lambda x:action(x,s,mode,eps,interpolation,False)[1][:13]
    opt=minimize(fun,start,jac=jac,method="BFGS",options={"gtol":2e-10,"maxiter":500})
    # A final Newton solve polishes the stationary point when BFGS reports
    # rounding-limited precision loss. No mass/source parameter is adjusted.
    x=opt.x.copy()
    for _ in range(8):
        val,g,H,*_=action(x,s,mode,eps,interpolation)
        if np.linalg.norm(g[:13])<2e-12:break
        step=np.linalg.solve(H[:13,:13],g[:13])
        rate=1.
        for _ in range(20):
            xn=x-rate*step
            vn=fun(xn)
            if vn<=val+1e-13:break
            rate*=.5
        x=xn
    val,g,H,*_=action(x,s,mode,eps,interpolation)
    assert np.linalg.norm(g[:13])<2e-8
    assert min(np.linalg.eigvalsh(H[:13,:13]))>0
    return x,val,g,H

arrays=dict(common_decoded_frame=frame,affine_L=decoder,weights=weights,
            affine_reduced_history_derivatives=amap,primitive_sources=sources,
            source_norm_squared=source_norm,true_retained13=z["retained13_frame"],
            true_hidden51=z["hidden51_frame"],hidden_blind_projector=P5)
checks={"scope":{
    "canonical_inputs":"alpha=phi^-2; primitive affine species sources; actual recovered64 frames",
    "conditional_potential":"V_probe(P)=alpha||P||²/2",
    "conditional_Q":"Q_f=alpha I64+K_f from explicit prior conditional completion",
    "species_trace":"shared direct-sum finite probe with primitive color multiplicities3,3,1,1",
    "source":"common external radial source s scales the fixed reference load by1+s",
    "deformations":"eps and interpolation label choices of action, never optimized",
    "vacuum":"one shared stationary history coordinate for all four species",
    "minimality":"no inferred optimization over action coefficients"},
    "parameters":{"alpha":alpha,"physical_clock":"symbolic, no mass assignment"}}

# The actual real chart is13, with a different typed retained13 carrier.
checks["chart"]=dict(real_rank=int(np.linalg.matrix_rank(np.vstack([decoder.real,decoder.imag]),tol=1e-11)),
    retained_rank=int(np.linalg.matrix_rank(np.vstack([(decoder@z["retained13_frame"]).real,(decoder@z["retained13_frame"]).imag]),tol=1e-11)),
    decoded_frame_orthogonality=float(np.linalg.norm(frame.T@frame-np.eye(13))),
    complex_linear_rank=int(np.linalg.matrix_rank(decoder,tol=1e-11)))

x0,f0,g0,H0=solve()
arr=action(x0)
H=H0[:13,:13]
xs=-np.linalg.solve(H,H0[:13,-1])
source_schur=H0[-1,-1]-H0[-1,:13]@np.linalg.solve(H,H0[:13,-1])
arrays.update(common_vacuum_x=x0,common_vacuum_P64=frame@x0,
              common_vacuum_hessian=H0,common_vacuum_source_shift=xs)
checks["base_shared_stationary_branch"]=dict(
    stationary_gradient_norm=float(np.linalg.norm(g0[:13])),
    minimum_field_hessian_eigenvalue=float(np.min(np.linalg.eigvalsh(H))),
    common_P_norm=float(np.linalg.norm(x0)),
    common_RMS=float(np.linalg.norm(x0)/8),
    full64_functional_value=float(f0),
    fixed_vacuum_source_hessian=float(H0[-1,-1]),
    relaxed_source_hessian=float(source_schur),
    relaxation_correction=float(H0[-1,-1]-source_schur))

# Verify64 trace equality using the actual matrices, not pass flags.
full64=[]
for fi,name in enumerate(names):
    a,q,*_=qdata(x0,0.,fi)
    m=mblock(a)
    prest=np.eye(64)-G@adj(G)-Qp@Qp.T-Qm@Qm.T
    k=G@(m@m)@adj(G)+3*Qp@Qp.T+5*Qm@Qm.T+alpha*prest
    q64=alpha*np.eye(64)+k
    full64.append(q64)
    arrays[f"{name}_Q64_at_common_vacuum"]=q64
    arrays[f"{name}_amplitude_at_common_vacuum"]=a
actual_value=.5*alpha*(x0@x0)+.5*sum(n*np.linalg.slogdet(q)[1] for n,q in zip(weights,full64))
checks["full64_vs_reduced_trace_error"]=float(abs(actual_value-f0))

# Independent fixed-field derivative/Hessian checks on mixed actual chart.
dv=np.cos(np.arange(13)+.3);dv/=np.linalg.norm(dv)
dp=np.r_[dv,.41]
step=1e-4
fun=lambda t:action(x0+t*dv,t*.41)[0]
fd1=(fun(step)-fun(-step))/(2*step)
fd2=(fun(step)-2*fun(0.)+fun(-step))/(step**2)
checks["fixed_chart_derivatives"]=dict(
    directional_gradient_fd_error=float(abs(fd1-g0@dp)),
    directional_hessian_fd_error=float(abs(fd2-dp@H0@dp)))

# Shared-vacuum implicit-function shifts and envelope Schur Hessian.
dh=2e-4
xp,fp,*_=solve(s=dh,start=x0)
xm,fm,*_=solve(s=-dh,start=x0)
fdshift=(xp-xm)/(2*dh)
fdenv=(fp-2*f0+fm)/(dh**2)
checks["common_source_implicit_function"]=dict(
    shared_shift_fd_error=float(np.linalg.norm(fdshift-xs)),
    minimized_source_hessian_fd_error=float(abs(fdenv-source_schur)),
    shared_shift_norm=float(np.linalg.norm(xs)))

deform={}
for mode in ["gold","hidden"]:
    _,_,_,first,mixed,second=action(x0,mode=mode)
    dx=-np.linalg.solve(H,mixed[:13])
    relaxedsecond=second-mixed[:13]@np.linalg.solve(H,mixed[:13])
    ep=1e-4
    xe1,fe1,*_=solve(mode=mode,eps=ep,start=x0)
    xe2,fe2,*_=solve(mode=mode,eps=2*ep,start=x0)
    shiftfd=(-3*x0+4*xe1-xe2)/(2*ep)
    # One-sided second derivative remains within the positive eps domain.
    xe3,fe3,*_=solve(mode=mode,eps=3*ep,start=x0)
    secondefd=(2*f0-5*fe1+4*fe2-fe3)/(ep**2)
    epsfirstfd=(-3*f0+4*fe1-fe2)/(2*ep)
    df=dict(fixed_vacuum_deformation_derivative=float(first),
       fixed_vacuum_deformation_second=float(second),
       relaxed_deformation_second=float(relaxedsecond),
       field_deformation_gradient_norm=float(np.linalg.norm(mixed[:13])),
       shared_vacuum_shift_norm=float(np.linalg.norm(dx)),
       shared_vacuum_shift_one_sided_fd_error=float(np.linalg.norm(shiftfd-dx)),
       envelope_first_one_sided_fd_error=float(abs(epsfirstfd-first)),
       envelope_second_one_sided_fd_error=float(abs(secondefd-relaxedsecond)))
    # A finite changed action is evaluated at its own common stationary point.
    xe,fe,ge,He=solve(mode=mode,eps=.1,start=x0)
    fixedfe=action(x0,mode=mode,eps=.1)[0]
    df.update(finite_eps=.1,finite_shared_vacuum_shift=float(np.linalg.norm(xe-x0)),
              finite_functional_change=float(fe-f0),
              finite_relaxation_lowering=float(fixedfe-fe),
              finite_relaxed_source_hessian=float(He[-1,-1]-He[-1,:13]@np.linalg.solve(He[:13,:13],He[:13,-1])))
    deform[mode]=df
    arrays[f"{mode}_eps_field_shift"]=dx
    arrays[f"{mode}_finite_eps_shared_vacuum"]=xe
    arrays[f"{mode}_deformation_mixed_hessian"]=mixed
checks["action_deformation_response"]=deform

# Lowest generator-polynomial degree does not select the Hermitian-M Gram.
# Compare fixed action labels; no minimization over the label is undertaken.
family={}
for e in [0.,.5,1.]:
    xt,ft,gt,Ht=solve(mode="interpolation",interpolation=e,start=x0)
    branch=[]
    for fi,name in enumerate(names):
        a,q,*_=qdata(xt,0.,fi,mode="interpolation",interpolation=e)
        sv=np.linalg.svd(a,compute_uv=False)
        gen=q-alpha*np.eye(6)
        eig=np.linalg.eigvalsh(gen)
        if e==0.:
            # Triangular Gram has determinant1 for each singular2-block.
            det_expected=1.
        else:
            det_expected=float(np.prod((1-e)+e*sv**4))
        branch.append(dict(species=name,generator_spectrum=eig.tolist(),
             generator_determinant_error=float(abs(np.linalg.det(gen).real-det_expected))))
    family[str(e)]=dict(common_functional_value=float(ft),
        shared_stationary_gradient_norm=float(np.linalg.norm(gt[:13])),
        min_field_hessian_eigenvalue=float(np.min(np.linalg.eigvalsh(Ht[:13,:13]))),
        common_vacuum_distance_from_natural=float(np.linalg.norm(xt-x0)),
        degree_of_positive_generator=2,species=branch)
    arrays[f"interpolation_{e}_shared_vacuum"]=xt
checks["same_degree_positive_family"]=family

# A positive Hermitian root has the same affine source degree as the signed
# M root. Fixing the underlying signed root is therefore an additional premise.
S=z["unitary_A4_bridge"]
ms=mblock(S)
dplus=(ms+2*np.eye(6))/np.sqrt(5)
xt,ft,gt,Ht=solve(mode="positive_root",start=x0)
checks["alternative_affine_hermitian_root"]=dict(
    same_unitary_golden_square_error=float(np.linalg.norm(dplus@dplus-ms@ms)),
    base_root_spectrum=np.linalg.eigvalsh(dplus).tolist(),
    signed_M_root_spectrum=np.linalg.eigvalsh(ms).tolist(),
    common_functional_value=float(ft),
    common_vacuum_distance_from_signed_root=float(np.linalg.norm(xt-x0)),
    stationary_gradient_norm=float(np.linalg.norm(gt[:13])),
    positive_field_hessian_minimum=float(np.min(np.linalg.eigvalsh(Ht[:13,:13]))),
    source_polynomial_degree_before_squaring=1)
arrays["alternative_affine_hermitian_root_at_S"]=dplus
arrays["alternative_affine_root_shared_vacuum"]=xt

# Even an RMS constraint, when it is actually imposed, differentiates through
# a KKT system. Verify bordered inversion against the tangent restriction.
xc=x0.copy();radius=np.linalg.norm(xc)
constraint_grad=xc
normal=constraint_grad/np.linalg.norm(constraint_grad)
_,_,vt=np.linalg.svd(normal.reshape(1,13))
T=vt[1:].T
# Declared local KKT probe at this point; multiplier is zero for this branch.
KKT=np.block([[H,constraint_grad[:,None]],[constraint_grad[None,:],np.zeros((1,1))]])
v=H0[:13,-1]
bordered=-np.linalg.solve(KKT,np.r_[v,0.])[:13]
tangent=-T@np.linalg.solve(T.T@H@T,T.T@v)
checks["constrained_implicit_function"]=dict(
    actual_radius_of_local_probe=float(radius),
    bordered_vs_tangent_solution_error=float(np.linalg.norm(bordered-tangent)),
    constraint_tangent_error=float(abs(constraint_grad@bordered)),
    constraint_is_canonical_RMS_claim=False)
arrays["KKT_local_probe"]=KKT

assert checks["chart"]["real_rank"]==13 and checks["chart"]["retained_rank"]==5
assert checks["full64_vs_reduced_trace_error"]<1e-10
assert checks["fixed_chart_derivatives"]["directional_hessian_fd_error"]<1e-5
assert checks["common_source_implicit_function"]["shared_shift_fd_error"]<1e-5
assert checks["common_source_implicit_function"]["minimized_source_hessian_fd_error"]<1e-5
assert all(v["shared_vacuum_shift_one_sided_fd_error"]<2e-5 for v in deform.values())
assert all(v["envelope_second_one_sided_fd_error"]<5e-4 for v in deform.values())
assert deform["hidden"]["field_deformation_gradient_norm"]==0.
assert checks["constrained_implicit_function"]["bordered_vs_tangent_solution_error"]<1e-10
assert all(np.all(np.isfinite(v)) for v in arrays.values())
checks["all_checks_pass"]=True
np.savez_compressed(OUT/"shared_species_vacuum_operators.npz",**arrays)
(OUT/"shared_species_vacuum_checks.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks,indent=2))
