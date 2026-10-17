"""Target-independent affine sources and conditional golden continuations.

The recovered unitary bridge is canonical. Extending it to a general charged
amplitude is conditional: this script does not identify either extension with
the newest source-loaded H64 generator or with a physical mass operator.
"""
from pathlib import Path
import itertools
import json
import numpy as np
from scipy.linalg import solve_sylvester

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
z = np.load(ROOT / "flavour_work_v2/grounded_charged_amplitude_operators.npz")
h = np.load(ROOT / "flavour_work_v2/Q4_history_operators.npz")
f = np.load(ROOT / "flavour_work/flavour_interfaces.npz")
r = np.load(ROOT / "Cathedral_Rederived_Operators_2026-10-08.npz")
o = np.load(ROOT / "flavour_work_v2/outer_history_operators.npz")

phi = (1 + np.sqrt(5)) / 2
alpha = phi ** -2
Delta = .15 - 80 * np.pi / (1053 * phi)
names = ["u", "d", "e", "nu"]
I3 = np.eye(3)
I64 = np.eye(64)
C5, C43, C45 = z["C5"], z["C43"], z["C45"]
F5, Qp, Qm = h["Fhist"], z["Q4plus"], z["Q4partner"]
J3, J5 = z["J_e3"], z["J_e5"]
charges, qc, gc = f["charges"], z["qcoords"], z["gcoords"]
S = f["S"]
G = np.column_stack([h["Gplus"], h["Gminus"]])
Q8 = np.column_stack([Qp, Qm])
L = C5 @ F5.T + C43 @ Qp.T + 1j * C45 @ Qm.T
Pdecoded = F5 @ F5.T + Qp @ Qp.T + Qm @ Qm.T
Jrot = np.array([[0., -1.], [1., 0.]])

def adj(a):
    return a.conj().T

def hsqrt(a):
    vals, vecs = np.linalg.eigh((a + adj(a)) / 2)
    assert np.min(vals) > -1e-12
    return (vecs * np.sqrt(np.maximum(vals, 0))) @ adj(vecs)

def hinvsqrt(a):
    vals, vecs = np.linalg.eigh((a + adj(a)) / 2)
    assert np.min(vals) > 0
    return (vecs / np.sqrt(vals)) @ adj(vecs)

def mblock(a):
    return np.block([[I3, adj(a)], [a, np.zeros((3, 3))]])

def dblock(a):
    return np.block([[np.zeros((3, 3)), adj(a)], [a, np.zeros((3, 3))]])

def golden(a):
    m = mblock(a)
    direct = np.block([[2 * I3, adj(a)], [a, I3]])
    natural = m @ m
    wl = hsqrt(.25 * I3 + a @ adj(a))
    wr = hsqrt(.25 * I3 + adj(a) @ a)
    x = -adj(a) @ np.linalg.inv(.5 * I3 + wl)
    frame = np.vstack([x, I3]) @ hinvsqrt(I3 + adj(x) @ x)
    q = m - .5 * np.eye(6)
    w6 = np.block([[wr, np.zeros((3, 3))], [np.zeros((3, 3)), wl]])
    projector = .5 * (np.eye(6) - q @ np.linalg.inv(w6))
    ld = 1.5 * I3 - wl
    ln = a @ adj(a) + .5 * I3 - wl
    return m, direct, natural, frame, projector, wl, ld, ln

def sourced_amplitude(idx, theta=0., p=None, chi=1.):
    """Geometric reference-plane source; not an electromagnetic source."""
    if p is None:
        p = np.zeros(64)
    rot = np.cos(theta) * np.eye(2) + np.sin(theta) * Jrot
    q = rot @ qc[idx]
    g = rot @ gc[idx]
    b = C43 @ (J3 @ q / 3) + 1j * chi * C45 @ (J5 @ (Delta * g / 5))
    b1 = C43 @ (J3 @ (Jrot @ q) / 3) + 1j * chi * C45 @ (J5 @ (Delta * Jrot @ g / 5))
    b2 = -b
    lc = C5 @ F5.T + C43 @ Qp.T + 1j * chi * C45 @ Qm.T
    return (lc @ p + b).reshape(3, 3), b1.reshape(3, 3), b2.reshape(3, 3)

def derivatives(a, a1, a2):
    m, direct, natural, frame, projector, w, ld, ln = golden(a)
    m1, m2 = dblock(a1), dblock(a2)
    gd1, gd2 = m1, m2
    gn1 = m1 @ m + m @ m1
    gn2 = m2 @ m + m @ m2 + 2 * m1 @ m1
    c1 = a1 @ adj(a) + a @ adj(a1)
    c2 = a2 @ adj(a) + 2 * a1 @ adj(a1) + a @ adj(a2)
    w1 = solve_sylvester(w, w, c1)
    w2 = solve_sylvester(w, w, c2 - 2 * w1 @ w1)
    ld1, ld2 = -w1, -w2
    ln1, ln2 = c1 - w1, c2 - w2
    ev, eu = np.linalg.eigh(m)
    pm1 = np.zeros((6, 6), complex)
    # Lower branch of M is nonpositive, upper branch >= 1. The gap is >= 1.
    for i in range(3):
        vi = eu[:, i:i+1]
        for j in range(3, 6):
            vj = eu[:, j:j+1]
            term = vj @ (adj(vj) @ m1 @ vi) @ adj(vi) / (ev[i] - ev[j])
            pm1 += term + adj(term)
    return dict(m=m, direct=direct, natural=natural, frame=frame,
                projector=projector, w=w, ld=ld, ln=ln,
                gd1=gd1, gd2=gd2, gn1=gn1, gn2=gn2,
                ld1=ld1, ld2=ld2, ln1=ln1, ln2=ln2,
                w1=w1, w2=w2, projector1=pm1)

def fd1(fun, x, step=2e-5):
    return (fun(x - 2*step) - 8*fun(x-step) + 8*fun(x+step) - fun(x+2*step)) / (12*step)

def fd2(fun, x, step=2e-4):
    return (-fun(x+2*step) + 16*fun(x+step) - 30*fun(x) + 16*fun(x-step) - fun(x-2*step)) / (12*step*step)

arrays = dict(C5=C5, C43=C43, C45=C45, Qplus=Qp, Qminus=Qm,
              F5=F5, J3=J3, J5=J5, qcoords=qc, gcoords=gc,
              charges=charges, affine_L_plus=L, decoded_projector=Pdecoded,
              generation6_frame=G, retained13_frame=r["H13"], hidden51_frame=r["Hidden"],
              unitary_A4_bridge=S)
checks = {}
checks["parameters"] = dict(phi=phi, alpha_URT=alpha, Delta=Delta,
                            clock="physical a is symbolic; no mass assignment")
checks["source_map"] = dict(
    real_decoder_rank=int(np.linalg.matrix_rank(np.vstack([L.real, L.imag]), tol=1e-11)),
    real_kernel_dimension=64-int(np.linalg.matrix_rank(np.vstack([L.real, L.imag]), tol=1e-11)),
    real_metric_projector_error=float(np.linalg.norm((adj(L) @ L).real-Pdecoded)),
    decoded_projector_rank=int(round(np.trace(Pdecoded))),
    real_decoder_rank_after_premature_H13_restriction=int(np.linalg.matrix_rank(np.vstack([(L@r["H13"]).real,(L@r["H13"]).imag]), tol=1e-11)),
    real_decoder_rank_on_canonical_hidden51=int(np.linalg.matrix_rank(np.vstack([(L@r["Hidden"]).real,(L@r["Hidden"]).imag]), tol=1e-11)),
    complex_linear_extension_rank=int(np.linalg.matrix_rank(L, tol=1e-11)),
    complex_linear_extension_kernel_dimension=64-int(np.linalg.matrix_rank(L, tol=1e-11)),
    real_blind51_is_canonical_hidden51=False,
    decoder_vs_retained13_projector_distance=float(np.linalg.norm(Pdecoded-r["H13"]@r["H13"].T)),
    charge_isometry_error=float(max(np.linalg.norm(J3.T@J3-np.eye(2)), np.linalg.norm(J5.T@J5-np.eye(2)))),
    quartet_orthogonality=float(np.linalg.norm(Qp.T@Qm)),
    charge_word_sums=np.sum(charges, axis=1).tolist(),
    quadratic_identity_error=float(np.max(abs(np.sum((charges**2-np.sum(charges**2, axis=1)[:,None]/3)**2, axis=1)-np.sum(charges**2, axis=1)**2/6))),
)

# These are the exact primitive sources evaluated through recovered isometries.
sources, bs, species = [], [], {}
for idx, name in enumerate(names):
    sf = Qp @ (J3 @ qc[idx] / 3) + Qm @ (J5 @ (Delta * gc[idx] / 5))
    b = C43 @ (J3 @ qc[idx] / 3) + 1j * C45 @ (J5 @ (Delta * gc[idx] / 5))
    a, _, _ = sourced_amplitude(idx)
    m, gd, gn, e, p, w, ld, ln = golden(a)
    sig = np.linalg.svd(a, compute_uv=False)
    q2 = int(round(charges[idx]@charges[idx]))
    exactnorm = q2 / 9 + Delta**2 * q2**2 / 150
    species[name] = dict(q_squared=q2, g_squared=q2**2/6,
       load_norm_squared=exactnorm, load_norm=np.sqrt(exactnorm),
       source_vector_norm_error=float(abs(sf@sf-exactnorm)),
       amplitude_norm_error=float(abs(np.vdot(b,b).real-exactnorm)),
       source_only_singular_values=sig.tolist(),
       direct_lower_eigenvalues=(1.5-np.sqrt(.25+sig**2)).tolist(),
       polynomial_lower_eigenvalues=((np.sqrt(.25+sig**2)-.5)**2).tolist(),
       direct_positive=bool(max(sig**2) <= 2),
       polynomial_positive=bool(np.min(np.linalg.eigvalsh(gn)) > -1e-11),
       polynomial_nonnegative=bool(np.min(np.linalg.eigvalsh(gn)) > -1e-11),
       polynomial_positive_definite=bool(min(sig)>0),
       lower_branch_contractive=bool(max(sig**2) < 2),
       orthonormal_frame_error=float(np.linalg.norm(adj(e)@e-I3)),
       projector_error=float(np.linalg.norm(e@adj(e)-p)),
       direct_compression_error=float(np.linalg.norm(adj(e)@gd@e-ld)),
       polynomial_compression_error=float(np.linalg.norm(adj(e)@gn@e-ln)),
       extension_difference_error=float(np.linalg.norm(gn-gd-np.block([[adj(a)@a-I3,np.zeros((3,3))],[np.zeros((3,3)),a@adj(a)-I3]]))))
    sources.append(sf); bs.append(b)
    for label, aa in [("source_only_A",a),("gold_M",m),("gold_direct",gd),("gold_polynomial",gn),
                     ("lower_frame",e),("lower_projector",p),("lower_direct",ld),("lower_polynomial",ln)]:
        arrays[f"{name}_{label}"]=aa
arrays["real_history_sources"]=np.array(sources)
arrays["complex_amplitude_sources"]=np.array(bs)
checks["source_only_species"] = species

ms, gds, gns, es, ps, ws, lds, lns = golden(S)
checks["unitary_golden_recovery"] = dict(
    bridge_unitarity_error=float(np.linalg.norm(adj(S)@S-I3)),
    cat_polynomial_error=float(np.linalg.norm(ms@ms-ms-np.eye(6))),
    two_extensions_agreement_error=float(np.linalg.norm(gds-gns)),
    spectrum=np.linalg.eigvalsh(gns).tolist(),
    lower_alpha_error=float(np.linalg.norm(lns-alpha*I3)),
    slopes_wrt_sigma_squared_at_one=dict(direct=-1/np.sqrt(5), polynomial=1-1/np.sqrt(5)),
    slopes_wrt_sigma_at_one=dict(direct=-2/np.sqrt(5), polynomial=2-2/np.sqrt(5)),
    generic_slopes_wrt_sigma_squared="direct = -1/(2 sqrt(1/4+t)); polynomial = 1-1/(2 sqrt(1/4+t)), t=sigma² >=0")
arrays["gold_unitary_M"]=ms
arrays["gold_unitary_operator"]=gns
goldpre=Qp@C43.T@S.reshape(9)
arrays["unitary_bridge_real_history_preimage"]=goldpre
checks["unitary_golden_recovery"]["affine_unitary_bridge_preimage_error"]=float(np.linalg.norm(L@goldpre-S.reshape(9)))
checks["unitary_golden_recovery"]["unitary_preimage_retained13_overlap"]=float(np.linalg.norm(r["H13"].T@goldpre))

# A second globally positive continuation with the identical unitary golden
# surface. The extra polynomial is zero there and needs no fitted coefficient.
# It commutes with Q, hence preserves its continued three-dimensional branch.
positive_alternative={}
for idx,name in enumerate(names):
    a=arrays[f"{name}_source_only_A"]
    cr=adj(a)@a-I3
    cl=a@adj(a)-I3
    extra=alpha*np.block([[cr@cr,np.zeros((3,3))],[np.zeros((3,3)),cl@cl]])
    ga=arrays[f"{name}_gold_polynomial"]+extra
    ep=arrays[f"{name}_lower_frame"]
    positive_alternative[name]=dict(min_eigenvalue=float(np.min(np.linalg.eigvalsh(ga))),
       difference_norm=float(np.linalg.norm(extra)),
       lower_compression_identity_error=float(np.linalg.norm(adj(ep)@ga@ep-arrays[f"{name}_lower_polynomial"]-alpha*cl@cl)),
       commuting_branch_error=float(np.linalg.norm(ga@arrays[f"{name}_lower_projector"]-arrays[f"{name}_lower_projector"]@ga)))
    arrays[f"{name}_gold_positive_alternative_conditional"]=ga
checks["globally_positive_golden_alternative"]=positive_alternative

# All entrywise history derivatives of the natural quadratic extension are
# determined once that conditional extension is declared. Its affine decoder
# has no second derivative, but its action has a genuine mixed contact.
Ai=L.T.reshape(64,3,3)
Mi=np.array([dblock(ai) for ai in Ai])
Gij=np.einsum('iab,jbc->ijac',Mi,Mi)+np.einsum('jab,ibc->ijac',Mi,Mi)
arrays["affine_history_amplitude_derivatives"]=Ai
arrays["polynomial_history_mixed_contact"]=Gij
for name in names:
    m=arrays[f"{name}_gold_M"]
    arrays[f"{name}_polynomial_history_vertices"]=np.einsum('iab,bc->iac',Mi,m)+np.einsum('ab,ibc->iac',m,Mi)
checks["entrywise_history_derivatives"] = dict(
    amplitude_shape=list(Ai.shape), contact_shape=list(Gij.shape),
    contact_exchange_symmetry_error=float(np.linalg.norm(Gij-Gij.swapaxes(0,1))),
    contact_hermiticity_error=float(np.linalg.norm(Gij-Gij.conj().swapaxes(2,3))),
    direct_extension_history_mixed_contact="zero for the affine P source",
    polynomial_extension_history_mixed_contact="Mi Mj + Mj Mi")
pu=np.cos(np.arange(64));pu/=np.linalg.norm(pu)
pv=np.sin(np.arange(64)+.37);pv/=np.linalg.norm(pv)
du=np.einsum('i,iab->ab',pu,Mi)
dv=np.einsum('i,iab->ab',pv,Mi)
exactmixed=du@dv+dv@du
eps=1e-4
fn=lambda s,t: golden(sourced_amplitude(0,p=s*pu+t*pv)[0])[2]
mixedfd=(fn(eps,eps)-fn(eps,-eps)-fn(-eps,eps)+fn(-eps,-eps))/(4*eps**2)
checks["entrywise_history_derivatives"]["independent_mixed_contact_fd_error"]=float(np.linalg.norm(mixedfd-exactmixed))

# Check nonlinear/contact identities on each actual primitive species source.
derivative_checks = {}
for idx,name in enumerate(names):
    theta=.173
    a,a1,a2=sourced_amplitude(idx, theta)
    d=derivatives(a,a1,a2)
    at=lambda t: golden(sourced_amplitude(idx,t)[0])
    efun=lambda t: at(t)[3]
    e1=fd1(efun,theta)
    omega=adj(d["frame"])@e1
    entry={}
    for label,position,first,second in [("direct_full",1,"gd1","gd2"),
                                       ("polynomial_full",2,"gn1","gn2"),
                                       ("direct_lower",6,"ld1","ld2"),
                                       ("polynomial_lower",7,"ln1","ln2")]:
        fun=lambda t,pos=position: at(t)[pos]
        entry[label+"_first_fd_error"]=float(np.linalg.norm(fd1(fun,theta)-d[first]))
        entry[label+"_second_fd_error"]=float(np.linalg.norm(fd2(fun,theta)-d[second]))
    entry["projector_first_fd_error"]=float(np.linalg.norm(fd1(lambda t:at(t)[4],theta)-d["projector1"]))
    entry["berry_antihermiticity_error"]=float(np.linalg.norm(omega+adj(omega)))
    for mode in ["direct","polynomial"]:
        gv=d["gd1"] if mode=="direct" else d["gn1"]
        lm=d["ld"] if mode=="direct" else d["ln"]
        lm1=d["ld1"] if mode=="direct" else d["ln1"]
        vertex=adj(d["frame"])@gv@d["frame"]
        entry[mode+"_covariant_current_error"]=float(np.linalg.norm(lm1-vertex-lm@omega+omega@lm))
        arrays[f"{name}_{mode}_compressed_vertex"]=vertex
    entry["polynomial_contact_seagull_norm"]=float(np.linalg.norm(2*dblock(a1)@dblock(a1)))
    entry["polynomial_contact_without_seagull_fd_error"]=float(np.linalg.norm(fd2(lambda t:at(t)[2],theta)-d["gn2"]+2*dblock(a1)@dblock(a1)))
    derivative_checks[name]=entry
    for key in ["gd1","gd2","gn1","gn2","ld1","ld2","ln1","ln2","projector1"]:
        arrays[f"{name}_theta_{key}"]=d[key]
    arrays[f"{name}_theta_Berry_connection"]=omega
checks["declared_geometric_source_derivatives"] = derivative_checks

# Exact charge-plane tensor and transport identities, independently from matrices.
plane = np.array([[1.,1.],[-1.,1.],[0.,-2.]]) / np.array([np.sqrt(2),np.sqrt(6)])
def quad(q):
    return (q*q-np.sum(q*q)/3)@plane
def rot(t):
    return np.cos(t)*np.eye(2)+np.sin(t)*Jrot
chart={}
for theta in [.173, 2*np.pi/3, 2*np.pi]:
    error, transported, naive = [], [], []
    for q in charges:
        zq=q@plane
        qtheta=plane@rot(theta)@zq
        gtheta=quad(qtheta)
        error.append(np.linalg.norm(gtheta-rot(-2*theta)@quad(q)))
        transported.append(np.linalg.norm(rot(3*theta)@gtheta-rot(theta)@quad(q)))
        naive.append(np.linalg.norm(gtheta-rot(theta)@quad(q)))
    chart[str(theta)] = dict(quadratic_weight_minus2_error=max(error),
                            transported_tensor_identity_error=max(transported),
                            naive_same_weight_difference=max(naive))
zc=charges@plane
complexz=zc[:,0]+1j*zc[:,1]
complexg=(charges**2-np.sum(charges**2,axis=1)[:,None]/3)@plane
checks["geometric_charge_chart"] = dict(
    quadratic_complex_identity_error=float(np.linalg.norm(complexg[:,0]+1j*complexg[:,1]-1j*complexz.conj()**2/np.sqrt(6))),
    angles=chart, physical_electromagnetic_group_identification="not assumed")

# Full-history compatible witnesses: no unknown beta/theta, no fitted mass.
bits=np.array(list(itertools.product([-1,1],repeat=6)))
v6=np.prod(bits,axis=1)/8
W5=bits*np.prod(bits,axis=1)[:,None]/8
P6=np.outer(v6,v6)
Pdegree5=W5@W5.T
Pgen=G@G.T
P8=Q8@Q8.T
Prest=I64-Pgen-P8
checks["blind_symmetry_projectors"] = dict(
    degree6_rank=1, degree5_rank=6,
    degree6_in_retained13_error=float(np.linalg.norm((I64-r["H13"]@r["H13"].T)@v6)),
    degree5_in_hidden51_error=float(np.linalg.norm(r["H13"].T@W5)),
    degree5_decoder_blind_error=float(np.linalg.norm(L@W5)),
    degree6_decoder_blind_error=float(np.linalg.norm(L@v6)),
    degree5_known_rail_orthogonality=float(np.linalg.norm(Q8.T@W5)),
    degree5_outer_commutator=float(np.linalg.norm(Pdegree5@o["Ucube"]-o["Ucube"]@Pdegree5)),
    degree5_A5_commutator=float(max(np.linalg.norm(Pdegree5@u-u@Pdegree5) for u in o["Ug"])),
    degree6_outer_commutator=float(np.linalg.norm(P6@o["Ucube"]-o["Ucube"]@P6)),
    degree6_A5_commutator=float(max(np.linalg.norm(P6@u-u@P6) for u in o["Ug"])),
    frame_orthogonality=float(np.linalg.norm(G.T@Q8)))
arrays.update(degree5_Walsh_frame=W5, degree5_blind_projector=Pdegree5,
              degree6_blind_projector=P6, hidden8_frame=Q8)
witness_checks={}
for idx,name in enumerate(names):
    natural=arrays[f"{name}_gold_polynomial"]
    k0=G@natural@G.T + 3*Qp@Qp.T + 5*Qm@Qm.T + alpha*Prest
    source2=species[name]["load_norm_squared"]
    k1=k0+alpha*source2*Pdegree5
    k2=k0+alpha*source2*P6
    # A positive source-carrying cross term supplies a further visible-hidden
    # coupling witness. It is not asserted to be the physical canonical action.
    vf=h["Gplus"]@(f["Jcharge_trip"]@qc[idx]/3)
    wf=vf+sources[idx]
    k3=k0+alpha*np.outer(wf,wf)
    r13,z51=r["H13"],r["Hidden"]
    b0=adj(r13)@k0@z51
    b3=adj(r13)@k3@z51
    d0=adj(z51)@k0@z51
    d1=adj(z51)@k1@z51
    # determinant ratio at z=-1 is a nonsingular resolvent test, not a pole fit.
    det_delta=np.linalg.slogdet(np.eye(51)+d1)[1]-np.linalg.slogdet(np.eye(51)+d0)[1]
    exact_det_delta=6*np.log1p(alpha*source2/(1+alpha))
    entry=dict(base_min_eigenvalue=float(np.min(np.linalg.eigvalsh(k0))),
               hidden_variant_min_eigenvalue=float(np.min(np.linalg.eigvalsh(k1))),
               generation_compression_preserved_error=float(np.linalg.norm(adj(G)@(k1-k0)@G)),
               known_hidden_rails_preserved_error=float(np.linalg.norm(Q8.T@(k1-k0)@Q8)),
               hidden_determinant_log_difference=float(det_delta),
               exact_determinant_formula_error=float(abs(det_delta-exact_det_delta)),
               retained_variant_norm=float(np.linalg.norm(adj(r13)@(k2-k0)@r13)),
               base_retained_hidden_coupling_norm=float(np.linalg.norm(b0)),
               cross_variant_retained_hidden_coupling_norm=float(np.linalg.norm(b3)),
               cross_variant_min_eigenvalue=float(np.min(np.linalg.eigvalsh(k3))))
    witness_checks[name]=entry
    for key,aa in [("K64_base_conditional",k0),("K64_hidden_variant_conditional",k1),
                   ("K64_retained_variant_conditional",k2),("K64_cross_variant_conditional",k3)]:
        arrays[f"{name}_{key}"]=aa
checks["compatible_full_history_witnesses"] = witness_checks
checks["scope"] = {
    "canonical": "unitary A4 golden bridge, primitive charge words, affine typed decoder, alpha=phi^-2, retained/hidden frames",
    "conditional": "two general-amplitude golden continuations and all assembled K64 witnesses",
    "source_only": "P=0 is a chart-origin probe, not a variationally selected species vacuum",
    "physical": "no numerical mass, CKM, photon coefficient or Einstein pole inferred from these finite operators",
    "nonuniqueness_hypotheses": "the supplied carrier/source/symmetry/positivity/golden constraints, before an exact full source action is additionally fixed"
}

# Meaningful fail-closed checks: algebra, independent differences, and witness
# invariants. A known e-source stability violation is a result, not a test error.
assert checks["source_map"]["real_decoder_rank"]==13
assert checks["source_map"]["real_decoder_rank_after_premature_H13_restriction"]==5
assert checks["source_map"]["real_decoder_rank_on_canonical_hidden51"]==8
assert checks["source_map"]["complex_linear_extension_rank"]==9
assert checks["source_map"]["real_metric_projector_error"]<1e-11
assert checks["unitary_golden_recovery"]["lower_alpha_error"]<1e-11
assert all(v["projector_error"]<1e-11 and v["polynomial_compression_error"]<1e-11 for v in species.values())
assert all(max(v[k] for k in v if k.endswith("fd_error") and "without" not in k)<2e-6 for v in derivative_checks.values())
assert all(v["polynomial_covariant_current_error"]<2e-8 for v in derivative_checks.values())
assert checks["blind_symmetry_projectors"]["degree5_in_hidden51_error"]<1e-11
assert checks["blind_symmetry_projectors"]["degree5_outer_commutator"]<1e-11
assert all(v["exact_determinant_formula_error"]<1e-11 for v in witness_checks.values())
assert all(v["cross_variant_min_eigenvalue"]>-1e-10 for v in witness_checks.values())
assert all(v["min_eigenvalue"]>-1e-10 and v["lower_compression_identity_error"]<1e-11 for v in positive_alternative.values())
assert checks["entrywise_history_derivatives"]["independent_mixed_contact_fd_error"]<1e-6
assert all(np.all(np.isfinite(v)) for v in arrays.values())
checks["all_checks_pass"] = True
checks["array_count"] = len(arrays)
np.savez_compressed(OUT/"golden_species_operators.npz", **arrays)
(OUT/"golden_species_checks.json").write_text(json.dumps(checks, indent=2)+"\n")
print(json.dumps({"all_checks_pass":True,"array_count":len(arrays),
    "source_only_species":species,"compatible_full_history_witnesses":witness_checks,
    "max_derivative_fd_error":max(v[k] for v in derivative_checks.values() for k in v if k.endswith("fd_error") and "without" not in k)}, indent=2))
