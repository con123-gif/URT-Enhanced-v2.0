"""Strong recovered constraints, actual twelve-phase signed64 source histories.

All finite source actions remain labeled conditional completions. The exact
cube lift, primitive source chart and chronological links are recovered data.
"""
from pathlib import Path
import numpy as np,json,itertools,hashlib,os,tempfile
from scipy.linalg import expm,polar
from scipy.optimize import minimize

ROOT=Path(__file__).resolve().parents[2]
OUT=Path(__file__).resolve().parent
z=np.load(ROOT/"derive_three_work/species/golden_species_operators.npz")
o=np.load(ROOT/"flavour_work_v2/outer_history_operators.npz")
U=o["Ucube"].astype(float);Caxis=o["Caxis"].astype(float);Ug=o["Ug"].astype(float)
alpha=((1+np.sqrt(5))/2)**-2
phi=(1+np.sqrt(5))/2
Delta=.15-80*np.pi/(1053*phi)
eta=-np.log(Delta)
I=np.eye(3);I64=np.eye(64)
G=z["generation6_frame"];Qp=z["Qplus"];Qm=z["Qminus"];F=z["F5"]
Pp=Qp@Qp.T;Pm=Qm@Qm.T
Prest=I64-G@G.T-Pp-Pm
W5=z["degree5_Walsh_frame"];P5=W5@W5.T
W6=z["degree6_blind_projector"]
nf=np.array([3,3,1,1]);names=["u","d","e","nu"]
bits=np.array(list(itertools.product([-1,1],repeat=6)))

def adj(a):return a.conj().T
def mb(a):return np.block([[I,adj(a)],[a,np.zeros((3,3))]])
def dm(a):return np.block([[np.zeros((3,3)),adj(a)],[a,np.zeros((3,3))]])
def degree_frame(k):
    return np.column_stack([np.prod(bits[:,list(s)],axis=1)/8 for s in itertools.combinations(range(6),k)])
def exterior_mon(a):
    """Exact monomial exterior lift, preserving its exterior subset grading."""
    subsets=[s for k in range(7) for s in itertools.combinations(range(6),k)]
    index={s:i for i,s in enumerate(subsets)}
    dst=np.argmax(abs(a),axis=0)
    signs=a[dst,np.arange(6)]
    ret=np.zeros((64,64),int)
    for col,s in enumerate(subsets):
        mapped=[int(dst[i]) for i in s]
        inversions=sum(mapped[i]>mapped[j] for i in range(len(s)) for j in range(i+1,len(s)))
        coefficient=int(np.prod(signs[list(s)])) if s else 1
        ret[index[tuple(sorted(mapped))],col]=coefficient*(-1)**inversions
    return ret

# All twelve chronological affine maps are used before any field restriction.
Up=[np.linalg.matrix_power(U,k) for k in range(13)]
L=[];bp=[]
for k in range(12):
    chi=(-1)**k
    lk=z["C5"]@F.T+z["C43"]@Qp.T+1j*chi*z["C45"]@Qm.T
    L.append(lk@Up[k])
    bp.append(z["complex_amplitude_sources"].real+1j*chi*z["complex_amplitude_sources"].imag)
L=np.array(L);bp=np.array(bp).transpose(1,0,2).reshape(4,12,3,3)
stack=np.vstack([q for l in L for q in [l.real,l.imag]])
sv,vec=np.linalg.eigh(stack.T@stack)
V=vec[:,sv>1e-10]
rank=V.shape[1]
amap=np.array([(l@V).T.reshape(rank,3,3) for l in L])
Mi=np.array([[dm(a) for a in kk] for kk in amap])
contacts=np.array([np.einsum("iab,jbc->ijac",mi,mi)+np.einsum("jab,ibc->ijac",mi,mi) for mi in Mi])
norms=np.sum(z["real_history_sources"]**2,axis=1)
hidden_const=.5*sum(nf)*(4*np.log(alpha+3)+4*np.log(alpha+5)+50*np.log(2*alpha))

def period_action(x,hessian=False):
    value=.5*alpha*(x@x)+hidden_const
    grad=alpha*x.copy()
    H=alpha*np.eye(rank)
    for f,n in enumerate(nf):
        for k in range(12):
            a=np.einsum("i,iab->ab",x,amap[k])+bp[f,k]
            m=mb(a);q=alpha*np.eye(6)+m@m
            R=np.linalg.inv(q)
            vals=np.linalg.eigvalsh(q);assert min(vals)>0
            value+=n*np.log(vals).sum()/24
            qi=np.einsum("iab,bc->iac",Mi[k],m)+np.einsum("ab,ibc->iac",m,Mi[k])
            grad+=n*np.einsum("ab,iba->i",R,qi).real/24
            if hessian:
                H+=n*(np.einsum("ab,ijba->ij",R,contacts[k]).real
                    -np.einsum("ab,ibc,cd,jda->ij",R,qi,R,qi).real)/24
    return value,grad,H

opt=minimize(lambda x:period_action(x)[0],np.zeros(rank),
             jac=lambda x:period_action(x)[1],method="BFGS",
             options={"gtol":1e-10,"maxiter":300})
x=opt.x.copy()
for _ in range(8):
    value,g,H=period_action(x,True)
    if np.linalg.norm(g)<2e-12:break
    dx=np.linalg.solve(H,g);rate=1.
    for _ in range(20):
        xn=x-rate*dx
        if period_action(xn)[0]<=value+1e-13:break
        rate*=.5
    x=xn
value,g,H=period_action(x,True)
P=V@x
hist=np.array([Up[k]@P for k in range(13)])
amplitudes=np.array([[((L[k]@P).reshape(3,3)+bp[f,k]) for k in range(12)] for f in range(4)])
amplitudes=np.concatenate([amplitudes,amplitudes[:,0:1]],axis=1)
sources_real=z["real_history_sources"]
charged_hist=np.array([hist+sources_real[f] for f in range(4)])
arrays=dict(U64=U,Caxis=Caxis,period_real_decoder=stack,
     period_decoder_frame=V,period_amplitude_derivatives=amap,
     common_period_field_x=x,common_period_field_P64=P,
     common_period_field_hessian=H,common_signed_history=hist,
     loaded_real_histories=charged_hist,loaded_amplitudes=amplitudes,
     degree5_Walsh_frame=W5,degree5_hidden_projector=P5)
checks=dict(parameters=dict(alpha_URT=alpha,physical_clock="a symbolic",
       finite_clock_probe="dimensionless u=alpha and2alpha are verification arguments, not selected a"),
    exact_signed_geometry=dict(C6_minusI_error=float(np.linalg.norm(np.linalg.matrix_power(Caxis,6)+np.eye(6))),
       U12_identity_error=float(np.linalg.norm(Up[12]-I64)),
       cube_outer_character=int(round(np.trace(U))),
       exterior_outer_character=int(round(np.linalg.det(np.eye(6)+Caxis)))),
    actual_full_period_decoder=dict(real_rank=rank,
       kernel_real_dimension=64-rank,
       degree5_all_phase_blindness_error=float(np.linalg.norm(stack@W5)),
       retained13_input_rank=int(np.linalg.matrix_rank(stack@z["retained13_frame"],tol=1e-10)),
       degree5_quantum_hidden_overlap_error=float(np.linalg.norm(z["retained13_frame"].T@W5)),
       degree5_A5_commutator=float(max(np.linalg.norm(P5@u-u@P5) for u in Ug)),
       degree5_outer_commutator=float(np.linalg.norm(P5@U-U@P5))),
    conditional_shared_period_vacuum=dict(
       trace_definition="one fixed V_probe=alpha||P||²/2; logdet of all12 clock cells, expressed per cell",
       action_density_is_not_uniform_physical_exposure_assumption=True,
       stationary_gradient_norm=float(np.linalg.norm(g)),
       field_hessian_minimum=float(min(np.linalg.eigvalsh(H))),
       Pnorm=float(np.linalg.norm(P)),RMS=float(np.linalg.norm(P)/8),action_density=float(value)))

# Exact representations: same total A5 isotypes do not determine the history lift.
char={
    "1":np.ones(60),
    "3":np.array([np.trace(adj(z["generation6_frame"][:,:3])@u@z["generation6_frame"][:,:3]) for u in Ug]),
    "3prime":np.array([np.trace(adj(z["generation6_frame"][:,3:])@u@z["generation6_frame"][:,3:]) for u in Ug]),
    "4":np.array([np.trace(Qp.T@u@Qp) for u in Ug]),
    "5":np.array([np.trace(F.T@u@F) for u in Ug])}
W1=degree_frame(1)
Raxis=np.array([np.rint(W1.T@u@W1).astype(int) for u in Ug])
GammaC=exterior_mon(Caxis)
exterior=np.array([exterior_mon(u) for u in Raxis])
decomp={}
start=0
for k in range(7):
    wk=degree_frame(k);n=wk.shape[1]
    cc=np.array([np.trace(wk.T@u@wk) for u in Ug])
    ce=np.trace(exterior[:,start:start+n,start:start+n],axis1=1,axis2=2)
    decomp[str(k)]=dict(
       Walsh={s:int(round(np.dot(c,cc)/60)) for s,c in char.items()},
       exterior={s:int(round(np.dot(c,ce)/60)) for s,c in char.items()})
    start+=n
checks["cube_vs_exterior"]=dict(
    degree_decompositions=decomp,
    full_A5_character_difference=float(np.linalg.norm(np.trace(Ug,axis1=1,axis2=2)-np.trace(exterior,axis1=1,axis2=2))),
    cube_outer_trace=int(round(np.trace(U))),exterior_outer_trace=int(np.trace(GammaC)),
    outer_lifts_unitarily_equivalent=False)
arrays["exterior_outer_lift"]=GammaC

# D is deformed consistently; Q=chi+D² remains exact in both full64 models.
Ds=[];Ks=[];Dcs=[];Kcs=[]
fixed_label=alpha # Two fixed models c=0 and c=alpha; never optimize c.
for f in range(4):
    dd=[];kk=[];dc=[];kc=[]
    for k in range(12):
        d=G@mb(amplitudes[f,k])@adj(G)+np.sqrt(3)*Pp+np.sqrt(5)*Pm+np.sqrt(alpha)*Prest
        d1=d+(np.sqrt(alpha*(1+fixed_label*norms[f]))-np.sqrt(alpha))*P5
        dd.append(d);kk.append(d@d);dc.append(d1);kc.append(d1@d1)
    Ds.append(dd);Ks.append(kk);Dcs.append(dc);Kcs.append(kc)
Ds,Ks,Dcs,Kcs=map(np.array,[Ds,Ks,Dcs,Kcs])
arrays.update(full64_D=Ds,full64_K=Ks,deformed_full64_D=Dcs,deformed_full64_K=Kcs)
checks["consistent_full64_deformation"]=dict(
    fixed_action_label=float(fixed_label),
    D_square_difference_identity_error=float(np.max([np.linalg.norm(Kcs[f,k]-Ks[f,k]-fixed_label*alpha*norms[f]*P5) for f in range(4) for k in range(12)])),
    generation_D_preserved_error=float(np.max([np.linalg.norm(adj(G)@(Dcs[f,k]-Ds[f,k])@G) for f in range(4) for k in range(12)])),
    known_rail_D_preserved_error=float(np.max([np.linalg.norm(Qp.T@(Dcs[f,k]-Ds[f,k])@Qp)+np.linalg.norm(Qm.T@(Dcs[f,k]-Ds[f,k])@Qm) for f in range(4) for k in range(12)])),
    history_field_logdet_shift_constant=float(3*sum(n*np.log1p(fixed_label*N/2) for n,N in zip(nf,norms))),
    any_V_field_stationarity_preserved_when_constraint_functionals_unchanged=True,
    raw_covariance_projector_preserved_if_raw_measure_is_unchanged=True,
    no_claim_that_postselected_quantum_exposure_measure_is_unchanged=True)

# Compare chronological raw link and polar transport, not static endpoints.
link_checks={}
for f,name in enumerate(names):
    ratios=[];units=[]
    for k in range(12):
        ratio=np.linalg.solve(amplitudes[f,k+1],amplitudes[f,k])
        unit,_=polar(ratio)
        ratios.append(ratio);units.append(unit)
    rp=np.eye(3,dtype=complex);up=np.eye(3,dtype=complex)
    for ratio,unit in zip(ratios,units):rp=ratio@rp;up=unit@up
    amin=float(min(np.min(np.linalg.svd(a,compute_uv=False)) for a in amplitudes[f]))
    link_checks[name]=dict(amplitude_minimum_singular_value=amin,
       periodic_amplitude_error=float(np.linalg.norm(amplitudes[f,12]-amplitudes[f,0])),
       chronological_raw_telescoping_error=float(np.linalg.norm(rp-np.eye(3))),
       polar_full_return_distance_from_identity=float(np.linalg.norm(up-np.eye(3))),
       polar_return_unitarity_error=float(np.linalg.norm(adj(up)@up-np.eye(3))))
    arrays[f"{name}_chronological_ratios"]=np.array(ratios)
    arrays[f"{name}_polar_links"]=np.array(units)
    arrays[f"{name}_polar_return"]=up
checks["chronological_links"]=link_checks

# Actual positive Gram history with the signed lift retained at every step.
# Each clock probe u is dimensionless; the exact identity below holds for
# arbitrary positive physical a_k, with sum a_k replacing12u.
weighted={}
for u in [alpha,2*alpha]:
    clock={}
    for f,name in enumerate(names):
        B=np.array([expm(-u*k/2) for k in Ks[f]])
        Bc=np.array([expm(-u*k/2) for k in Kcs[f]])
        C=np.array([U@b for b in B]);Cc=np.array([U@b for b in Bc])
        returns=[];returnsc=[];exposures=[];exposuresc=[]
        for start in range(12):
            ret=np.eye(64,dtype=complex);retc=np.eye(64,dtype=complex)
            for j in range(12):
                idx=(start+j)%12
                ret=C[idx]@ret;retc=Cc[idx]@retc
            returns.append(ret);returnsc.append(retc)
            exposures.append(np.trace(adj(ret)@ret).real)
            exposuresc.append(np.trace(adj(retc)@retc).real)
        returns=np.array(returns);returnsc=np.array(returnsc)
        factor=expm(-fixed_label*alpha*norms[f]*(12*u)*P5/2)
        exp_shift=6*np.exp(-alpha*(12*u))*(np.exp(-fixed_label*alpha*norms[f]*(12*u))-1)
        probs=np.array(exposures)/sum(exposures)
        probsc=np.array(exposuresc)/sum(exposuresc)
        clock[name]=dict(
           positive_Gram_factor_error=float(max(np.linalg.norm(adj(c)@c-b@b) for c,b in zip(C,B))),
           signed_positive_return_factorization_error=float(max(np.linalg.norm(mc-m@factor) for m,mc in zip(returns,returnsc))),
           actual_signed_return_nonidentity_norm=float(np.linalg.norm(returns[0]-I64)),
           hidden_cycle_multiplier_base=float(np.exp(-alpha*(12*u)/2)),
           hidden_cycle_multiplier_deformed=float(np.exp(-alpha*(1+fixed_label*norms[f])*(12*u)/2)),
           full_history_exposure_shift_formula_error=float(max(abs(np.array(exposuresc)-np.array(exposures)-exp_shift))),
           phase_exposure_probabilities=probs.tolist(),
           phase_exposure_nonuniform_norm=float(np.linalg.norm(probs-np.ones(12)/12)),
           deformed_exposure_probabilities=probsc.tolist(),
           quantum_exposure_measure_difference=float(np.linalg.norm(probs-probsc)))
        if u==alpha:
            arrays[f"{name}_signed_positive_return"]=returns[0]
            arrays[f"{name}_deformed_signed_positive_return"]=returnsc[0]
            arrays[f"{name}_phase_exposure_probabilities"]=probs
    weighted[str(u)]=clock
checks["actual_weighted_positive_history"]=weighted

# A common nonstationary field probe verifies that polar return and phase
# exposure are not forced to be trivial by the chronological algebra. It is
# not a separately fitted species vacuum and does not change the action.
probeP=P+alpha*(V@np.cos(np.arange(rank)))
probe_amplitudes=[]
for f in range(4):
    aa=np.array([(L[k]@probeP).reshape(3,3)+bp[f,k] for k in range(12)])
    probe_amplitudes.append(np.concatenate([aa,aa[:1]]))
probe_amplitudes=np.array(probe_amplitudes)
generic={}
for f,name in enumerate(names):
    raw=np.eye(3,dtype=complex);punit=raw.copy()
    for k in range(12):
        rr=np.linalg.solve(probe_amplitudes[f,k+1],probe_amplitudes[f,k])
        raw=rr@raw;punit=polar(rr)[0]@punit
    kg=[]
    for k in range(12):
        dd=G@mb(probe_amplitudes[f,k])@adj(G)+np.sqrt(3)*Pp+np.sqrt(5)*Pm+np.sqrt(alpha)*Prest
        kg.append(dd@dd)
    cg=np.array([U@expm(-alpha*k/2) for k in kg])
    ccg=np.array([U@expm(-alpha*(k+fixed_label*alpha*norms[f]*P5)/2) for k in kg])
    expo=[];expoc=[]
    for start in range(12):
        ret=I64.astype(complex);retc=ret.copy()
        for j in range(12):
            k=(start+j)%12
            ret=cg[k]@ret;retc=ccg[k]@retc
        expo.append(np.trace(adj(ret)@ret).real)
        expoc.append(np.trace(adj(retc)@retc).real)
    wp=np.array(expo)/sum(expo);wpc=np.array(expoc)/sum(expoc)
    generic[name]=dict(
       raw_return_identity_error=float(np.linalg.norm(raw-I)),
       polar_return_distance_from_identity=float(np.linalg.norm(punit-I)),
       phase_exposure_nonuniform_norm=float(np.linalg.norm(wp-np.ones(12)/12)),
       hidden_deformation_exposure_change=float(np.linalg.norm(wpc-wp)))
    arrays[f"{name}_nonstationary_polar_return"]=punit
    arrays[f"{name}_nonstationary_exposure_probabilities"]=wp
    arrays[f"{name}_nonstationary_deformed_exposure_probabilities"]=wpc
arrays["common_nonstationary_P64"]=probeP
checks["generic_actual_history_probe"]=dict(
    shared_field_perturbation="P*+alpha V cos(arange(rank)); identity check only, not selected vacuum",
    species=generic)

# The reference hidden8 filter/Gibbs state is unchanged by the orthogonal term.
rho8=(Pp+Delta**2*Pm)/(4*(1+Delta**2))
Bplus=(Pp+Delta*Pm)/np.sqrt(1+Delta**2)
Bminus=(Delta*Pp+Pm)/np.sqrt(1+Delta**2)
checks["retained_hidden8_filter"]=dict(
    conditional_filter_normalization_error=float(np.linalg.norm(Bplus@Bplus+Bminus@Bminus-Pp-Pm)),
    deformation_rho8_overlap_error=float(np.linalg.norm(P5@rho8)),
    deformation_filter_overlap_error=float(np.linalg.norm(P5@Bplus)),
    phi_contraction_ratio=float(phi**-1/phi))

# Exact full64 source/contact differentiation at the same common history.
# The chart scales the injected primitive amplitude, not electric charges:
# b(t)=t Re b+i t² Im b. Both fixed actions include their complete contacts.
source_contacts=np.zeros((2,2))
source_q2=np.array([26,14,54,18],float)
Na=source_q2/9;Nb=Delta**2*source_q2**2/150
Np=2*Na+4*Nb;Npp=2*Na+12*Nb
for ci,c in enumerate([0,alpha]):
    for f,n in enumerate(nf):
        for k in range(12):
            m=mb(amplitudes[f,k])
            mi=dm(bp[f,k].real+2j*bp[f,k].imag)
            mii=dm(2j*bp[f,k].imag)
            q=alpha*I64+Ks[f,k]+c*alpha*norms[f]*P5
            qi=G@(mi@m+m@mi)@adj(G)+c*alpha*Np[f]*P5
            qii=G@(mii@m+m@mii+2*mi@mi)@adj(G)+c*alpha*Npp[f]*P5
            rr=np.linalg.inv(q)
            source_contacts[ci,0]+=n*np.trace(rr@qi).real/24
            source_contacts[ci,1]+=n*np.trace(rr@qii-rr@qi@rr@qi).real/24
contact_shift=np.array([
    3*sum(nf*(alpha*Np/2)/(1+alpha*norms/2)),
    3*sum(nf*((alpha*Npp/2)/(1+alpha*norms/2)
       -(alpha*Np/2)**2/(1+alpha*norms/2)**2))])
arrays["full64_primitive_source_first_and_second_contacts"]=source_contacts
checks["full64_primitive_source_contact"]=dict(
    chart="b(t)=t Re b+i t² Im b; not a redefinition of electric charge",
    first_and_second_at_same_history=source_contacts.tolist(),
    exact_deformation_shift=contact_shift.tolist(),
    complete_trace_contact_shift_error=float(np.linalg.norm(
        source_contacts[1]-source_contacts[0]-contact_shift)))

# Provenance records exact inputs; bounded retrieval failure is not an absence
# proof. Old response-fed full-Hlocal data is preserved in its archived scope.
paths=[
 "combined_source_work/recovery/combined_chat_recovery.json",
 "continued_physics_work/recovery/Newton_Cathedral_v117_Final_Mathematical_Closure.md",
 "continued_physics_work/recovery/Newton_Cathedral_v129_Universe_Fallout_Symbiotic_Theorem.md",
 "canonical_sources/Cathedral/Cathedral_Live_State_v61.md",
 "derive_three_work/recovery/latest_selection_chat_retrieval.json",
 "derive_three_work/species/golden_species_operators.npz",
 "flavour_work_v2/outer_history_operators.npz"]
checks["provenance"]={p:hashlib.sha256((ROOT/p).read_bytes()).hexdigest() for p in paths}
checks["scope"]=dict(
    actual="signed cube, primitive charged map, allphase rank18, chronological ratios, hidden8 rails/filter",
    conditional="source D64 completion, probe V=alpha||P||²/2, loop regulator alpha, signed positive history weights",
    unchanged_constraints="geometry, primitive injection, the declared signed M(A) continuation (specializing to M_S on A=S), hidden8, phase transport, history-field equations within this decoupled completion, raw rate-distortion selection for fixed raw data",
    distinguishing_observables="complete hidden determinant, source contacts, weighted quantum-history multipliers and phase exposure",
    full_action_fixed="the witness is excluded if a complete canonical D/Hlocal/source/measure defines this degree5 block; no freedom is claimed to edit that action",
    geometric_gold_scope="M_S and geometric D6/H3 identities stay fixed; M(A) is a conditional off-unitary source continuation, not a claim that the fixed geometric spectrum varies",
    nonlinear_history_scope="the fixed signed orbit is an actual64 geometric/source chart; it is not declared to be the latest full nonlinear canonical F",
    exterior_functor="same total A5 carrier does not imply the actual signed cube equals a CAR exterior lift")

assert rank==18
assert checks["actual_full_period_decoder"]["degree5_all_phase_blindness_error"]<1e-11
assert checks["cube_vs_exterior"]["full_A5_character_difference"]<1e-10
assert checks["cube_vs_exterior"]["cube_outer_trace"]==0
assert checks["cube_vs_exterior"]["exterior_outer_trace"]==2
assert np.linalg.norm(g)<1e-8 and min(np.linalg.eigvalsh(H))>0
assert checks["consistent_full64_deformation"]["D_square_difference_identity_error"]<1e-11
assert all(v["chronological_raw_telescoping_error"]<1e-8 for v in link_checks.values())
assert all(v["raw_return_identity_error"]<1e-8 and v["polar_return_distance_from_identity"]>.1 for v in generic.values())
assert all(v["signed_positive_return_factorization_error"]<1e-10 and v["full_history_exposure_shift_formula_error"]<1e-10 for q in weighted.values() for v in q.values())
assert checks["full64_primitive_source_contact"]["complete_trace_contact_shift_error"]<1e-10
assert all(np.all(np.isfinite(v)) for v in arrays.values())
checks["all_checks_pass"]=True
checks["array_count"]=len(arrays)
archive_path=OUT/"combined_signed_source_operators.npz"
fd,tmp_name=tempfile.mkstemp(prefix="combined_signed_source_",suffix=".npz",dir=OUT)
tmp_path=Path(tmp_name)
try:
    with os.fdopen(fd,"wb") as stream:
        np.savez_compressed(stream,**arrays)
        stream.flush()
        os.fsync(stream.fileno())
    with np.load(tmp_path,allow_pickle=False) as saved:
        assert set(saved.files)==set(arrays)
        assert len(saved.files)==56
        for key,value in arrays.items():
            restored=saved[key]
            assert restored.shape==value.shape and restored.dtype==value.dtype
            assert np.all(np.isfinite(restored))
            assert np.array_equal(restored,value)
    os.replace(tmp_path,archive_path)
    with np.load(archive_path,allow_pickle=False) as saved:
        assert len(saved.files)==56
        assert all(np.all(np.isfinite(saved[key])) for key in saved.files)
finally:
    tmp_path.unlink(missing_ok=True)
checks["archive_verified"]=dict(
    atomic_temporary_write=True,allow_pickle=False,array_count=56,
    all_arrays_finite=True,size_bytes=archive_path.stat().st_size,
    sha256=hashlib.sha256(archive_path.read_bytes()).hexdigest())
(OUT/"combined_signed_source_checks.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks,indent=2))
