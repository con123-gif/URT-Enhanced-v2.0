"""Full-period positive action and current endpoints, canonical/conditional split."""
from pathlib import Path
import numpy as np,json,hashlib,os,tempfile
from scipy.linalg import expm,eigh,eig
ROOT=Path(__file__).resolve().parents[2];OUT=Path(__file__).resolve().parent
z=np.load(ROOT/"derive_three_work/species/golden_species_operators.npz",allow_pickle=False)
w=np.load(ROOT/"combined_source_work/species/combined_signed_source_operators.npz",allow_pickle=False)
alpha=((1+np.sqrt(5))/2)**-2
G=z["generation6_frame"];U=w["U64"];U6=G.T@U@G
H=z["retained13_frame"]
from scipy.linalg import null_space
Z=null_space(H.T)
Sgold=z["gold_unitary_M"][3:,:3]
P5=w["degree5_hidden_projector"]
E=np.kron(np.ones((12,1))/np.sqrt(12),np.vstack([np.eye(3),np.zeros((3,3))]))
arrays={};checks={"scope":{"actual":"U64, affine loaded amplitudes, chronological R, true retained13",
 "conditional":"heat radial factors; declared positive graph action and continuous-time Fock Hamiltonian L/a",
 "clock":"a remains symbolic; u=alpha is a dimensionless matrix verification argument",
 "field_source":"E is a declared linear one-particle field source; its poles are not an ordinary bilinear current-current correlator",
 "completion_class":"triangular radial choice shares signed golden reference on A=S but is excluded by a premise fixing full affine source Dirac M(A)",
 "physical":"no assertion this action equals latest Hlocal, nonlinear F, Gauss/face selector or Ward map"}}
def adj(x):return x.conj().T
def m(a):return np.block([[np.eye(3),adj(a)],[a,np.zeros((3,3))]])
def dm(a):return np.block([[np.zeros((3,3)),adj(a)],[a,np.zeros((3,3))]])
def cycle(cs):
 n=cs.shape[1];ss=np.zeros((12*n,12*n),complex)
 for k,c in enumerate(cs):ss[n*((k+1)%12):n*((k+1)%12+1),n*k:n*(k+1)]=c
 return ss
def groupvals(vals,tol=1e-8):
 groups=[]
 for j,v in enumerate(vals):
  found=next((a for a in groups if abs(v-vals[a[0]])<tol),None)
  if found is None:groups.append([j])
  else:found.append(j)
 return groups
def positive_poles(L):
 vals,V=eigh(L);rows=[]
 for ii in groupvals(vals):
  ev=V[:,ii];p=adj(E)@ev;res=p@adj(p)
  rows.append(dict(pole=float(np.mean(vals[ii])),multiplicity=len(ii),
    weight=float(np.trace(res).real),minimum_residue_eigenvalue=float(min(eigh(res,eigvals_only=True)))))
 return vals,V,rows
def factor_jets(a,a1,a2,choice):
 mm,mi,mii=m(a),dm(a1),dm(a2)
 K=mm@mm;K1=mi@mm+mm@mi;K2=mii@mm+mm@mii+2*mi@mi
 if choice=="triangular":
  K=np.block([[np.eye(3)+adj(a)@a,adj(a)],[a,np.eye(3)]])
  K1=np.block([[adj(a1)@a+adj(a)@a1,adj(a1)],[a1,np.zeros((3,3))]])
  K2=np.block([[adj(a2)@a+adj(a)@a2+2*adj(a1)@a1,adj(a2)],[a2,np.zeros((3,3))]])
 X,X1,X2=-alpha*K/2,-alpha*K1/2,-alpha*K2/2
 jet=np.zeros((18,18),complex)
 for j in range(3):jet[j*6:(j+1)*6,j*6:(j+1)*6]=X
 jet[:6,6:12]=X1;jet[6:12,12:18]=X1;jet[:6,12:18]=X2/2
 ej=expm(jet)
 return K,ej[:6,:6],ej[:6,6:12],2*ej[:6,12:18]
def source_amplitude(f,k,t=1):
 a=w["loaded_amplitudes"][f,k]
 b=z["complex_amplitude_sources"][f].reshape(3,3)
 b=b.real+1j*(-1)**k*b.imag
 return a+(t-1)*b.real+1j*(t*t-1)*b.imag,b.real+2j*b.imag,2j*b.imag

# Raw chronological metric action on the actual three-dimensional chart.
raw={}
Lflat=cycle(np.repeat(np.eye(3)[None,:,:],12,axis=0))
Lflat=adj(np.eye(36)-Lflat)@(np.eye(36)-Lflat)
cyclevals=np.sort(np.repeat(4*np.sin(np.pi*np.arange(12)/12)**2,3))
for f,name in enumerate(["u","d","e","nu"]):
 F=np.zeros((36,36),complex);F1=F.copy();F2=F.copy()
 for k in range(12):
  a,a1,a2=source_amplitude(f,k)
  F[3*k:3*k+3,3*k:3*k+3]=adj(Sgold)@a
  F1[3*k:3*k+3,3*k:3*k+3]=adj(Sgold)@a1
  F2[3*k:3*k+3,3*k:3*k+3]=adj(Sgold)@a2
 metric=adj(F)@F;Lchart=adj(F)@Lflat@F
 vals=eigh(Lchart,metric,eigvals_only=True)
 ee=2.3+.7j;Q=ee*np.eye(36)-Lflat;Qpsi=adj(F)@Q@F
 gp=np.linalg.inv(Qpsi)
 Q1=adj(F1)@Q@F+adj(F)@Q@F1
 endpoint=F1@gp@adj(F)-F@gp@Q1@gp@adj(F)+F@gp@adj(F1)
 raw[name]=dict(generalized_cycle_spectrum_error=float(np.linalg.norm(vals-cyclevals)),
   metric_positive_minimum=float(min(eigh(metric,eigvals_only=True))),
   physical_source_endpoint_cancellation_error=float(np.linalg.norm(endpoint)))
 arrays[name+"_raw_metric"]=metric;arrays[name+"_raw_chart_action"]=Lchart
checks["raw_metric_chart"]=raw

pole_results={};source_checks={};invariant={};full_first=None
for f,name in enumerate(["u","d","e","nu"]):
 species={}
 for choice in ["polynomial","triangular"]:
  cs=[];c1=[];c2=[]
  for k in range(12):
   a,a1,a2=source_amplitude(f,k);K,B,B1,B2=factor_jets(a,a1,a2,choice)
   cs.append(U6@B);c1.append(U6@B1);c2.append(U6@B2)
  ss,s1,s2=map(cycle,map(np.array,[cs,c1,c2]))
  D=np.eye(72)-ss;D1=-s1;D2=-s2
  L=adj(D)@D;L1=adj(D1)@D+adj(D)@D1
  L2=adj(D2)@D+adj(D)@D2+2*adj(D1)@D1
  vals,V,rows=positive_poles(L)
  species[choice]=dict(minimum_eigenvalue=float(vals[0]),
    current_visible_pole_count_1e9=sum(r["weight"]>1e-9 for r in rows),
    current_visible_pole_count_1e4=sum(r["weight"]>1e-4 for r in rows),
    current_residue_sum_error=float(np.linalg.norm(adj(E)@V@adj(V)@E-np.eye(3))),
    poles=rows)
  arrays[name+"_"+choice+"_L72"]=L
  arrays[name+"_"+choice+"_current_poles"]=np.array([[r["pole"],r["weight"],r["multiplicity"]] for r in rows])
  arrays[name+"_"+choice+"_L_source_first"]=L1
  arrays[name+"_"+choice+"_L_source_second"]=L2
  # Endpoint jets are derived from the same pulled-back action, not unitary readout.
  F=np.zeros((72,72),complex);F1=F.copy();F2=F.copy()
  for k in range(12):
   a,a1,a2=source_amplitude(f,k);sl=slice(6*k,6*k+6)
   F[sl,sl]=np.block([[adj(Sgold)@a,np.zeros((3,3))],[np.zeros((3,3)),np.eye(3)]])
   F1[sl,sl]=np.block([[adj(Sgold)@a1,np.zeros((3,3))],[np.zeros((3,6))]])
   F2[sl,sl]=np.block([[adj(Sgold)@a2,np.zeros((3,3))],[np.zeros((3,6))]])
  ee=2.3+.7j;Q=ee*np.eye(72)-L;Q1=-L1;Q2=-L2
  qp=adj(F)@Q@F
  qp1=adj(F1)@Q@F+adj(F)@Q1@F+adj(F)@Q@F1
  qp2=adj(F2)@Q@F+adj(F)@Q@F2+2*adj(F1)@Q@F1+2*adj(F1)@Q1@F+2*adj(F)@Q1@F1+adj(F)@Q2@F
  gp=np.linalg.inv(qp);gp1=-gp@qp1@gp
  gp2=2*gp@qp1@gp@qp1@gp-gp@qp2@gp
  current1=adj(E)@(F1@gp@adj(F)+F@gp1@adj(F)+F@gp@adj(F1))@E
  current2=adj(E)@(F2@gp@adj(F)+F@gp@adj(F2)+2*F1@gp@adj(F1)+2*F1@gp1@adj(F)+2*F@gp1@adj(F1)+F@gp2@adj(F))@E
  gg=np.linalg.inv(Q)
  exact1=adj(E)@gg@L1@gg@E
  exact2=adj(E)@(2*gg@L1@gg@L1@gg+gg@L2@gg)@E
  source_checks[name+"_"+choice]=dict(
    first_endpoint_error=float(np.linalg.norm(current1-exact1)),
    second_contact_endpoint_error=float(np.linalg.norm(current2-exact2)),
    source_first_norm=float(np.linalg.norm(exact1)),source_second_norm=float(np.linalg.norm(exact2)))
  arrays[name+"_"+choice+"_current_first"]=exact1
  arrays[name+"_"+choice+"_current_second"]=exact2
  if choice=="polynomial":
   # Signed nonselfadjoint poles/residues are kept separate from positive poles.
   ev,lv,rv=eig(ss,left=True,right=True);total=np.zeros((72,72),complex);rawp=[]
   for ii in groupvals(ev):
    rr=rv[:,ii];ll=lv[:,ii];pj=rr@np.linalg.inv(adj(ll)@rr)@adj(ll)
    total+=pj;lam=ev[ii[0]];res=-adj(E)@pj@E/lam
    rawp.append([lam.real,lam.imag,(1/lam).real,(1/lam).imag,np.linalg.norm(res),len(ii)])
   mon=np.eye(6,dtype=complex)
   for c in cs:mon=c@mon
   rr=.71+.08j
   sig,log=np.linalg.slogdet(np.eye(72)-rr*ss)
   sigm,logm=np.linalg.slogdet(np.eye(6)-rr**12*mon)
   invariant[name]=dict(raw_projector_sum_error=float(np.linalg.norm(total-np.eye(72))),
     block_cyclic_determinant_identity_error=float(abs(sig-sigm)+abs(log-logm)),
     monodromy_maximum_imaginary_eigenvalue=float(max(abs(eig(mon,right=False).imag))))
   arrays[name+"_raw_signed_poles_and_residue_norms"]=np.array(rawp)
   if f==0:
    # Full768 action and156/612 elimination: every hidden coordinate retained.
    cs64=np.array([U@expm(-alpha*kk/2) for kk in w["full64_K"][f]])
    ss64=cycle(cs64);dd=np.eye(768)-ss64
    L64=adj(dd)@dd;RR=np.kron(np.eye(12),H);ZZ=np.kron(np.eye(12),Z)
    A=adj(RR)@L64@RR;B=adj(RR)@L64@ZZ;Dh=adj(ZZ)@L64@ZZ
    rh=np.linalg.inv(ee*np.eye(612)-Dh)
    KR=ee*np.eye(156)-A-B@rh@adj(B)
    fullres=np.linalg.inv(ee*np.eye(768)-L64)
    projected=adj(RR)@fullres@RR
    # K' contact has a plus sign from differentiated hidden resolvent.
    KR1=np.eye(156)+B@rh@rh@adj(B)
    KR2=-2*B@rh@rh@rh@adj(B)
    realrh=np.linalg.inv(-.6*np.eye(612)-Dh)
    realvertex=np.eye(156)+B@realrh@realrh@adj(B)
    localgen=np.kron(np.eye(12),G)
    checks["full_768_feshbach"]=dict(
      retained_dimension=156,hidden_dimension=612,
      orthonormal_frame_error=float(np.linalg.norm(adj(np.column_stack([RR,ZZ]))@np.column_stack([RR,ZZ])-np.eye(768))),
      resolvent_identity_error=float(np.linalg.norm(projected-np.linalg.inv(KR))),
      generation_invariant_subspace_error=float(np.linalg.norm(L64@localgen-localgen@L)),
      hidden_memory_norm=float(np.linalg.norm(B@rh@adj(B))),
      common_number_Ward_vertex_identity_error=float(np.linalg.norm(
       adj(RR)@fullres@fullres@RR-np.linalg.inv(KR)@KR1@np.linalg.inv(KR))),
      real_energy_Ward_vertex_minimum=float(min(eigh(realvertex,eigvals_only=True))),
      physical_evaluation_energy="e=aE=2.3+0.7i is a resolvent test argument, not a fitted pole")
    arrays["u_full768_positive_graph_action"]=L64
    arrays["u_retained156_frequency_kernel"]=KR
    arrays["u_retained156_kernel_derivative"]=KR1
    arrays["u_retained156_kernel_second_derivative"]=KR2
    arrays["retained13_frame"]=H;arrays["hidden51_frame"]=Z
    csd=np.array([U@expm(-alpha*kk/2) for kk in w["deformed_full64_K"][f]])
    ssd=cycle(csd);ddd=np.eye(768)-ssd;Ld=adj(ddd)@ddd
    currentleg=localgen@E
    basecurrent=adj(currentleg)@np.linalg.solve(ee*np.eye(768)-L64,currentleg)
    changedcurrent=adj(currentleg)@np.linalg.solve(ee*np.eye(768)-Ld,currentleg)
    checks["executed_degree5_visible_comparison"]=dict(
      full768_action_difference=float(np.linalg.norm(Ld-L64)),
      generation_operator_difference=float(np.linalg.norm((Ld-L64)@localgen)),
      current_resolvent_difference=float(np.linalg.norm(basecurrent-changedcurrent)))
    arrays["u_degree5_deformed768_graph_action"]=Ld
  # One chosen norm-preserving chart retains amplitudes; no polar unitarization.
 pole_results[name]=species
 checks.setdefault("completion_visible_comparison",{})[name]=dict(
   full_generation_action_difference=float(np.linalg.norm(arrays[name+"_polynomial_L72"]-arrays[name+"_triangular_L72"])),
   current_resolvent_difference=float(np.linalg.norm(
    adj(E)@np.linalg.inv((2.3+.7j)*np.eye(72)-arrays[name+"_polynomial_L72"])@E
    -adj(E)@np.linalg.inv((2.3+.7j)*np.eye(72)-arrays[name+"_triangular_L72"])@E)))
checks["positive_current_weighted_poles"]=pole_results
checks["source_derivative_endpoints"]=source_checks
checks["raw_signed_analytic_kernel"]=invariant
# The actually recovered positive filter specifies only the hidden8 support.
Q8=np.column_stack([z["Qplus"],z["Qminus"]])
U8=Q8.T@U@Q8
Delta=.15-80*np.pi/(1053*((1+np.sqrt(5))/2))
B8=np.diag([1]*4+[Delta]*4)/np.sqrt(1+Delta**2)
Ss8=cycle(np.repeat((U8@B8)[None,:,:],12,axis=0))
L8=adj(np.eye(96)-Ss8)@(np.eye(96)-Ss8)
checks["recovered_hidden8_factor"]=dict(
  support_rank=8,
  outer_support_invariance_error=float(np.linalg.norm(U@Q8-Q8@U8)),
  positive_graph_minimum=float(min(eigh(L8,eigvals_only=True))),
  does_not_define_generation_positive_factors=True,
  generation_overlap_error=float(np.linalg.norm(Q8.T@G)))
arrays["recovered_hidden8_positive_filter"]=B8
arrays["recovered_hidden8_fullperiod_graph_action"]=L8
# Exact prior degree-five deformation is invisible to this generation subspace.
checks["degree5_visible_invariant"]=dict(
 generation_overlap_error=float(np.linalg.norm(P5@G)),
 outer_commutator_error=float(np.linalg.norm(P5@U-U@P5)),
 exact_reason="both completions preserve degree; P5 is orthogonal to all generation legs, so every generation resolvent/current derivative is unchanged by the displayed degree5 D deformation",
 no_claim_for_other_completions_or_current_maps=True)
checks["provenance"]={}
for p in ["combined_source_work/recovery/combined_chat_recovery.json",
 "continued_physics_work/theory/current_theory_specification.md",
 "continued_physics_work/recovery/test_species_loaded_nonlinear_cycle.py",
 "combined_source_work/species/combined_signed_source_operators.npz"]:
 checks["provenance"][p]=hashlib.sha256((ROOT/p).read_bytes()).hexdigest()
assert max(v["generalized_cycle_spectrum_error"] for v in raw.values())<1e-8
assert max(v["physical_source_endpoint_cancellation_error"] for v in raw.values())<1e-8
assert max(v["first_endpoint_error"]+v["second_contact_endpoint_error"] for v in source_checks.values())<1e-7
assert checks["full_768_feshbach"]["resolvent_identity_error"]<1e-8
assert checks["full_768_feshbach"]["generation_invariant_subspace_error"]<1e-9
assert checks["full_768_feshbach"]["common_number_Ward_vertex_identity_error"]<1e-8
assert checks["full_768_feshbach"]["real_energy_Ward_vertex_minimum"]>1-1e-10
assert checks["executed_degree5_visible_comparison"]["current_resolvent_difference"]<1e-9
assert all(v["current_visible_pole_count_1e4"]>=6 for s in pole_results.values() for v in s.values())
assert all(v["raw_projector_sum_error"]<1e-7 for v in invariant.values())
assert all(np.isfinite(v).all() for v in arrays.values())
checks["all_checks_pass"]=True;checks["array_count"]=len(arrays)
fd,tn=tempfile.mkstemp(prefix="full_period_",suffix=".npz",dir=OUT);tmp=Path(tn)
with os.fdopen(fd,"wb") as fp:
 np.savez_compressed(fp,**arrays);fp.flush();os.fsync(fp.fileno())
with np.load(tmp,allow_pickle=False) as out:
 assert set(out.files)==set(arrays)
 assert all(np.array_equal(out[k],v) and np.isfinite(out[k]).all() for k,v in arrays.items())
os.replace(tmp,OUT/"full_period_physical_operators.npz")
checks["archive_sha256"]=hashlib.sha256((OUT/"full_period_physical_operators.npz").read_bytes()).hexdigest()
(OUT/"full_period_physical_checks.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks,indent=2))
