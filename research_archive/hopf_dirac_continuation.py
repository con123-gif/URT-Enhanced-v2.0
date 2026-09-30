#!/usr/bin/env python3
from __future__ import annotations

import importlib.util
import json
import math
from pathlib import Path
import sys
import types

import numpy as np
from scipy.linalg import expm, null_space
from scipy.spatial.transform import Rotation

ROOT = Path(__file__).resolve().parent
_audit_candidates = [
    ROOT / "lytollis_urt_operator_closure_audit.py",
    ROOT / "recovered" / "lytollis_urt_operator_closure_audit.py",
]
AUDIT_PATH = next((p for p in _audit_candidates if p.exists()), None)
if AUDIT_PATH is None:
    AUDIT_PATH = next(ROOT.parent.rglob("lytollis_urt_operator_closure_audit.py"), None)
if AUDIT_PATH is None:
    raise FileNotFoundError("Required canonical audit not found: lytollis_urt_operator_closure_audit.py")
# The archived script used networkx only to enumerate the finite graph.  The
# current runtime does not ship it, so provide an import stub and replace that
# enumerator below by an exact geometric construction.
sys.modules.setdefault("networkx", types.ModuleType("networkx"))
spec = importlib.util.spec_from_file_location("audit", AUDIT_PATH)
audit = importlib.util.module_from_spec(spec)
assert spec.loader is not None
spec.loader.exec_module(audit)


def canonical_sign(columns: np.ndarray) -> np.ndarray:
    out = columns.copy()
    for j in range(out.shape[1]):
        i = int(np.argmax(np.abs(out[:, j])))
        if out[i, j] < 0:
            out[:, j] *= -1
    return out


def permutation_matrix(p: tuple[int, ...]) -> np.ndarray:
    out = np.zeros((len(p), len(p)))
    out[list(p), np.arange(len(p))] = 1
    return out


def build_geometry_no_networkx() -> dict:
    verts = []
    for aa, bb in [(1.0,audit.PHI),(1.0,-audit.PHI),(-1.0,audit.PHI),(-1.0,-audit.PHI)]:
        verts.extend([(0.0,aa,bb),(aa,bb,0.0),(bb,0.0,aa)])
    verts = np.asarray(verts,float)
    vunit = verts/np.linalg.norm(verts[0])
    distances=np.linalg.norm(verts[:,None,:]-verts[None,:,:],axis=-1)
    edge_length=np.min(distances[distances>1e-10])
    adjacency=np.isclose(distances,edge_length,atol=1e-10).astype(int)
    np.fill_diagonal(adjacency,0)
    edges=[(i,j) for i in range(12) for j in range(i+1,12) if adjacency[i,j]]
    faces=[(i,j,k) for i in range(12) for j in range(i+1,12) for k in range(j+1,12)
           if adjacency[i,j] and adjacency[i,k] and adjacency[j,k]]
    ofaces=[oriented_face(f,vunit) for f in faces]
    ref=np.asarray(ofaces[0])
    source=verts[ref]
    group=[]; rotations={}
    for f in ofaces:
        for shift in range(3):
            target_idx=np.roll(np.asarray(f),-shift)
            target=verts[target_idx]
            rt=np.linalg.solve(source,target)
            rot=rt.T
            if np.linalg.det(rot)<0.999999999 or np.linalg.norm(rot.T@rot-np.eye(3))>1e-8:
                continue
            moved=verts@rot.T
            p=tuple(int(np.argmin(np.linalg.norm(verts-x,axis=1))) for x in moved)
            if max(np.linalg.norm(moved[i]-verts[p[i]]) for i in range(12))<1e-8 and p not in rotations:
                group.append(p); rotations[p]=rot
    assert len(group)==60, len(group)
    face_index={frozenset(f):i for i,f in enumerate(faces)}
    lap_shell=np.diag(adjacency.sum(axis=1))-adjacency
    evals,evecs=np.linalg.eigh(lap_shell)
    q3=canonical_sign(evecs[:,np.isclose(evals,5-math.sqrt(5),atol=1e-9)])
    q5=canonical_sign(evecs[:,np.isclose(evals,6,atol=1e-9)])
    q3p=canonical_sign(evecs[:,np.isclose(evals,5+math.sqrt(5),atol=1e-9)])
    incidence=np.zeros((20,12))
    for i,f in enumerate(faces): incidence[i,list(f)]=1
    adjacency_face=np.zeros((20,20))
    for i in range(20):
        for j in range(i+1,20):
            if len(set(faces[i])&set(faces[j]))==2: adjacency_face[i,j]=adjacency_face[j,i]=1
    lap_face=np.diag(adjacency_face.sum(axis=1))-adjacency_face
    _,_,vh=np.linalg.svd(incidence.T,full_matrices=True)
    rank=np.linalg.matrix_rank(incidence.T,tol=1e-10)
    qhidden=vh.T[:,rank:]
    he,hv=np.linalg.eigh(qhidden.T@lap_face@qhidden)
    q43=canonical_sign(qhidden@hv[:,np.isclose(he,3,atol=1e-9)])
    q45=canonical_sign(qhidden@hv[:,np.isclose(he,5,atol=1e-9)])
    reps={}
    for p in group:
        pv=permutation_matrix(p)
        pf=tuple(face_index[frozenset(p[v] for v in f)] for f in faces)
        pface=permutation_matrix(pf)
        reps[p]={"3":q3.T@pv@q3,"5":q5.T@pv@q5,"3p":q3p.T@pv@q3p,
                 "43":q43.T@pface@q43,"45":q45.T@pface@q45}
    return {"verts":verts,"vunit":vunit,"adjacency":adjacency,"edges":edges,"faces":faces,
            "group":group,"rotations":rotations,"identity":tuple(range(12)),"q3":q3,"q5":q5,
            "q3p":q3p,"q43":q43,"q45":q45,"reps":reps}


def spinor(n: np.ndarray) -> np.ndarray:
    x, y, z = map(float, n)
    if z > -0.999999999:
        a = math.sqrt((1.0 + z) / 2.0)
        return np.array([a, (x + 1j*y)/(2.0*a)], complex)
    b = math.sqrt((1.0 - z) / 2.0)
    return np.array([(x - 1j*y)/(2.0*b), b], complex)


def oriented_face(face: tuple[int, int, int], vertices: np.ndarray) -> tuple[int, int, int]:
    i, j, k = face
    normal = np.cross(vertices[j] - vertices[i], vertices[k] - vertices[i])
    if float(normal @ (vertices[i] + vertices[j] + vertices[k])) < 0.0:
        j, k = k, j
    return i, j, k


def hopf_links(vertices: np.ndarray, adjacency: np.ndarray, phases: np.ndarray | None = None):
    z = np.asarray([spinor(v) for v in vertices])
    if phases is not None:
        z = np.exp(1j*phases)[:, None] * z
    u = np.zeros((12, 12), complex)
    for i in range(12):
        for j in range(12):
            if adjacency[i, j]:
                overlap = np.vdot(z[i], z[j])
                u[i, j] = overlap / abs(overlap)
    return z, u


def equivalence_h(geometry: dict) -> np.ndarray:
    constraints = []
    for p in geometry["group"]:
        r3 = geometry["reps"][p]["43"]
        r5 = geometry["reps"][p]["45"]
        constraints.append(np.kron(np.eye(4), r5) - np.kron(r3.T, np.eye(4)))
    ker = null_space(np.vstack(constraints))
    assert ker.shape[1] == 1
    h = ker[:, 0].reshape((4, 4), order="F")
    h = h / math.sqrt(float(np.trace(h.T @ h))/4.0)
    return h


def compose(p: tuple[int,...], q: tuple[int,...]) -> tuple[int,...]:
    return tuple(p[q[i]] for i in range(len(q)))


def order(p: tuple[int,...]) -> int:
    cur=tuple(range(len(p)))
    for n in range(1,61):
        cur=compose(p,cur)
        if cur==tuple(range(len(p))): return n
    raise RuntimeError


def su2_lift(rot: np.ndarray) -> np.ndarray:
    x,y,z,w=Rotation.from_matrix(rot).as_quat()
    return np.array([[w-1j*z,-y-1j*x],[y-1j*x,w+1j*z]],complex)


def twisted_rotation_matrix(p, geo, spinors):
    s=su2_lift(geo["rotations"][p])
    q=np.zeros((12,12),complex)
    for i in range(12):
        phase=np.vdot(spinors[p[i]],s@spinors[i])
        phase/=abs(phase)
        q[p[i],i]=phase
    return q


def spinorial_certification(geo,z,lu):
    evals,evecs=np.linalg.eigh(lu)
    bands=[]
    for value,dim in [(evals[0],2),(evals[2],4),(evals[6],6)]:
        bands.append((value,evecs[:,np.isclose(evals,value,atol=1e-9)],dim))
    lifts={p:twisted_rotation_matrix(p,geo,z) for p in geo["group"]}
    comm=max(np.linalg.norm(q@lu-lu@q) for q in lifts.values())
    p2=next(p for p in geo["group"] if order(p)==2)
    p3=next(p for p in geo["group"] if order(p)==3 and order(compose(p2,p))==5)
    raw2,raw3=lifts[p2],lifts[p3]
    # Choose the two central lift signs jointly so a^2=b^3=(ab)^5=-I.
    candidates=[]
    for s2 in (-1,1):
        for s3 in (-1,1):
            aa,bb=s2*raw2,s3*raw3
            score=max(np.linalg.norm(aa@aa+np.eye(12)),
                      np.linalg.norm(np.linalg.matrix_power(bb,3)+np.eye(12)),
                      np.linalg.norm(np.linalg.matrix_power(aa@bb,5)+np.eye(12)))
            candidates.append((score,aa,bb))
    _,q2,q3=min(candidates,key=lambda x:x[0])
    q5=q2@q3
    presentation={
        "a2_plus_I":float(np.linalg.norm(q2@q2+np.eye(12))),
        "b3_plus_I":float(np.linalg.norm(np.linalg.matrix_power(q3,3)+np.eye(12))),
        "ab5_plus_I":float(np.linalg.norm(np.linalg.matrix_power(q5,5)+np.eye(12))),
    }
    reps=[]
    for value,v,dim in bands:
        a=v.conj().T@q2@v; b=v.conj().T@q3@v
        reps.append({"dimension":dim,"lambda":float(value),
                     "a_real":a.real.tolist(),"a_imag":a.imag.tolist(),
                     "b_real":b.real.tolist(),"b_imag":b.imag.tolist(),
                     "unitarity_error":float(max(np.linalg.norm(a.conj().T@a-np.eye(dim)),np.linalg.norm(b.conj().T@b-np.eye(dim)))),
                     "presentation_error":float(max(np.linalg.norm(a@a+np.eye(dim)),np.linalg.norm(np.linalg.matrix_power(b,3)+np.eye(dim)),np.linalg.norm(np.linalg.matrix_power(a@b,5)+np.eye(dim))))})
    return {"commutator_max":float(comm),"presentation_full":presentation,"bands":reps}


def matrix(c: np.ndarray, x: np.ndarray) -> np.ndarray:
    return (c @ x).reshape((3, 3), order="F")


def build_y(
    geometry: dict,
    links: np.ndarray,
    amplitudes: list[np.ndarray],
) -> np.ndarray:
    y = np.zeros((36, 36), complex)
    for eidx, (i, j) in enumerate(geometry["edges"]):
        t = amplitudes[eidx]
        y[3*i:3*i+3, 3*j:3*j+3] = links[i, j] * t
        y[3*j:3*j+3, 3*i:3*i+3] = links[j, i] * t
    return y


def build_y_old(
    geometry: dict,
    links: np.ndarray,
    passive: list[np.ndarray],
    charge_complex: np.ndarray,
    c43: np.ndarray,
    c45: np.ndarray,
    j43: np.ndarray,
    j45: np.ndarray,
) -> np.ndarray:
    y = np.zeros((36, 36), complex)
    for eidx, (i, j) in enumerate(geometry["edges"]):
        for a, b in ((i, j), (j, i)):
            transported = links[a, b] * charge_complex
            load = matrix(c43, j43 @ transported.real) + 1j*matrix(c45, j45 @ transported.imag)
            y[3*a:3*a+3, 3*b:3*b+3] = passive[eidx] + load
    return y


def reduced_heat(y: np.ndarray, eta: float, shell_cost: np.ndarray | None = None) -> tuple[np.ndarray, np.ndarray]:
    k = y.conj().T @ y
    if shell_cost is not None:
        k = k + np.kron(shell_cost, np.eye(3))
    rho = expm(-eta*k)
    rho /= np.trace(rho).real
    reduced = sum(rho[3*i:3*i+3, 3*i:3*i+3] for i in range(12))
    reduced = (reduced + reduced.conj().T)/2.0
    return reduced, np.linalg.eigvalsh(k)


def branch_calculation(geo, links, shell_cost, blocks, charge_blocks, eta):
    passive = [a+b+1j*c for a,b,c in blocks]
    active = {name:[a+b+1j*c+charge_blocks[name] for a,b,c in blocks]
              for name in audit.WORDS}
    py = build_y(geo,links,passive)
    p_red,p_eigs=reduced_heat(py,eta,shell_cost)
    reduced={}; frames={}; free=0.0
    for name in audit.WORDS:
        yf=build_y(geo,links,active[name])
        rr,kk=reduced_heat(yf,eta,shell_cost)
        vals,vecs=np.linalg.eigh(rr)
        # Stable log-partition evaluation for K=Y^*Y.
        shift=float(kk[0])
        logz=-eta*shift+math.log(float(np.sum(np.exp(-eta*(kk-shift)))))
        free += audit.MULTIPLICITY[name]*(-logz/eta)
        reduced[name]=vals
        frames[name]=vecs
    ckm=frames["u"].conj().T@frames["d"]
    pmns=frames["e"].conj().T@frames["nu"]
    return {
        "free":float(free),
        "passive_scalar_residual":float(np.linalg.norm(p_red-np.eye(3)/3)),
        "species_eigenvalues":{k:v.tolist() for k,v in reduced.items()},
        "ckm_abs":np.abs(ckm).tolist(),"pmns_abs":np.abs(pmns).tolist(),
        "ckm_J":audit.jarlskog(ckm),"pmns_J":audit.jarlskog(pmns),
    }


def joint_branch_calculation(geo, links, shell_cost, blocks, charge_blocks, eta, zspecies):
    names=list(audit.WORDS)
    ys=[]
    for name in names:
        amps=[a+b+1j*c+charge_blocks[name] for a,b,c in blocks]
        ys.append(build_y(geo,links,amps))
    zn=zspecies/np.linalg.norm(zspecies)
    # H=(z_u Y_u,z_d Y_d,z_e Y_e,z_nu Y_nu), so H^*H has the
    # exact normalized h_fg cross blocks and is manifestly positive.
    hcat=np.hstack([zn[i]*ys[i] for i in range(4)])
    k=hcat.conj().T@hcat + np.kron(np.eye(4),np.kron(shell_cost,np.eye(3)))
    vals,vecs=np.linalg.eigh((k+k.conj().T)/2)
    shift=float(vals[0]); weights=np.exp(-eta*(vals-shift));
    rho=(vecs*weights)@vecs.conj().T
    rho/=np.trace(rho).real
    frames={}; conditionals={}
    for fi,name in enumerate(names):
        block=rho[36*fi:36*(fi+1),36*fi:36*(fi+1)]
        red=sum(block[3*i:3*i+3,3*i:3*i+3] for i in range(12))
        red=(red+red.conj().T)/2
        red/=np.trace(red).real
        ev,fr=np.linalg.eigh(red);frames[name]=fr;conditionals[name]=ev.tolist()
    ckm=frames['u'].conj().T@frames['d'];pmns=frames['e'].conj().T@frames['nu']
    logz=-eta*shift+math.log(float(np.sum(weights)))
    return {"free":float(-logz/eta),"conditional_eigenvalues":conditionals,
            "ckm_abs":np.abs(ckm).tolist(),"pmns_abs":np.abs(pmns).tolist(),
            "ckm_J":audit.jarlskog(ckm),"pmns_J":audit.jarlskog(pmns),
            "joint_minmax":[float(vals[0]),float(vals[-1])]}


def main() -> None:
    geo = build_geometry_no_networkx()
    c5, *_ = audit.unique_clebsch(geo["group"], geo["reps"], "5")
    c43, *_ = audit.unique_clebsch(geo["group"], geo["reps"], "43")
    c45, *_ = audit.unique_clebsch(geo["group"], geo["reps"], "45")
    b2, j43, j45_old, _ = audit.build_charge_embeddings(geo)
    alphabet = audit.edge_shadow_alphabet(geo)

    h = equivalence_h(geo)
    # Fix the only remaining real sign by matching the two Clebsch copies.
    if np.vdot(c43, c45 @ h).real < 0:
        h = -h
    j45 = h @ j43

    c_h_error = np.linalg.norm(c45 @ h - c43)
    j_h_error = min(np.linalg.norm(j45-j45_old), np.linalg.norm(j45+j45_old))

    z, u = hopf_links(geo["vunit"], geo["adjacency"])
    face_phases = []
    for f in geo["faces"]:
        i, j, k = oriented_face(f, geo["vunit"])
        face_phases.append(np.angle(u[i,j]*u[j,k]*u[k,i]))

    lu = 5*np.eye(12) - u
    evals = np.linalg.eigvalsh(lu)
    spinorial=spinorial_certification(geo,z,lu)

    passive = []
    raw_blocks = []
    for row in alphabet:
        m5=matrix(c5,row[:5]); m43=matrix(c43,row[5:9]); m45=matrix(c45,row[9:13])
        raw_blocks.append((m5,m43,m45))
        passive.append(m5+m43+1j*m45)

    charges = {}
    active = {}
    base_charge_blocks={}
    for name, q in audit.WORDS.items():
        cq = audit.charge_coords(q/3.0, b2)
        cg = audit.charge_coords(audit.DELTA*audit.quadratic_covariant(q)/5.0, b2)
        charge = cq + 1j*cg
        charges[name] = charge
        bf = matrix(c43, j43 @ cq) + 1j*matrix(c45, j45 @ cg)
        base_charge_blocks[name]=(matrix(c43,j43@cq),matrix(c45,j45@cg))
        active[name] = [a + bf for a in passive]

    rng = np.random.default_rng(20260828)
    theta = rng.uniform(-math.pi, math.pi, 12)
    _, ug = hopf_links(geo["vunit"], geo["adjacency"], theta)
    g = np.kron(np.diag(np.exp(1j*theta)), np.eye(3))

    # Old prescription fails gauge covariance.
    y_old = build_y_old(geo,u,passive,charges["u"],c43,c45,j43,j45)
    yg_old = build_y_old(geo,ug,passive,charges["u"],c43,c45,j43,j45)
    old_cov = np.linalg.norm(yg_old - g.conj().T @ y_old @ g)
    old_spec = np.max(np.abs(np.linalg.svd(yg_old,compute_uv=False)-np.linalg.svd(y_old,compute_uv=False)))

    # Common-link prescription is exactly endpoint-gauge covariant.
    y_new = build_y(geo,u,active["u"])
    yg_new = build_y(geo,ug,active["u"])
    new_cov = np.linalg.norm(yg_new - g.conj().T @ y_new @ g)
    new_spec = np.max(np.abs(np.linalg.svd(yg_new,compute_uv=False)-np.linalg.svd(y_new,compute_uv=False)))

    passive_y = build_y(geo,u,passive)
    rho0_reduced, passive_k_eigs = reduced_heat(passive_y,audit.ETA,lu)

    reduced = {}
    frames = {}
    for name in audit.WORDS:
        yf = build_y(geo,u,active[name])
        rr, kk = reduced_heat(yf,audit.ETA,lu)
        vals, vecs = np.linalg.eigh(rr)
        reduced[name] = {
            "rho_eigenvalues": vals.tolist(),
            "K_minmax": [float(kk[0]),float(kk[-1])],
        }
        frames[name] = vecs

    ckm = frames["u"].conj().T @ frames["d"]
    pmns = frames["e"].conj().T @ frames["nu"]

    # Exterior Gibbs prior restricted to Lambda^2_+.
    exterior_weight_degree2 = audit.DELTA**2/(1.0+audit.DELTA)**4
    exterior_trace_plus = 3*exterior_weight_degree2

    zspecies=[]
    for name,q in audit.WORDS.items():
        cc=audit.charge_coords(q,b2)
        zspecies.append(cc[0]+1j*cc[1])
    zspecies=np.asarray(zspecies)

    branches=[]
    for relative_five in (-1,1):
        for chirality in (-1,1):
            for flux in (-1,1):
                branch_links=u if flux==1 else u.conj()
                blocks=[(relative_five*a,b,chirality*c) for a,b,c in raw_blocks]
                charge_blocks={name:base_charge_blocks[name][0]+1j*chirality*base_charge_blocks[name][1]
                               for name in audit.WORDS}
                shell_branch=5*np.eye(12)-branch_links
                calc=branch_calculation(geo,branch_links,shell_branch,blocks,charge_blocks,audit.ETA)
                calc["relative_five"]=relative_five;calc["chirality"]=chirality;calc["flux"]=flux
                branches.append(calc)
    branches.sort(key=lambda x:x["free"])

    joint_branches=[]
    for relative_five in (-1,1):
        for chirality in (-1,1):
            for flux in (-1,1):
                branch_links=u if flux==1 else u.conj()
                shell_branch=5*np.eye(12)-branch_links
                blocks=[(relative_five*a,b,chirality*c) for a,b,c in raw_blocks]
                charge_blocks={name:base_charge_blocks[name][0]+1j*chirality*base_charge_blocks[name][1]
                               for name in audit.WORDS}
                calc=joint_branch_calculation(geo,branch_links,shell_branch,blocks,charge_blocks,audit.ETA,zspecies)
                calc.update(relative_five=relative_five,chirality=chirality,flux=flux)
                joint_branches.append(calc)
    joint_branches.sort(key=lambda x:x['free'])

    out = {
        "hopf": {
            "face_phase_minmax": [float(min(face_phases)),float(max(face_phases))],
            "face_phase_abs_target_error": float(max(abs(abs(x)-math.pi/10) for x in face_phases)),
            "total_phase": float(sum(face_phases)),
            "spectrum": evals.tolist(),
            "binary_icosahedral_certification":spinorial,
        },
        "hodge_alignment": {"C45_H_minus_C43":float(c_h_error),"HJ43_vs_J45_up_to_sign":float(j_h_error)},
        "gauge_test": {
            "old_covariance_residual":float(old_cov),
            "old_spectral_change":float(old_spec),
            "repaired_covariance_residual":float(new_cov),
            "repaired_spectral_change":float(new_spec),
        },
        "exterior_prior": {
            "degree2_weight_per_state":float(exterior_weight_degree2),
            "Lambda2_plus_trace":float(exterior_trace_plus),
            "conditioned_source_prior":"I3/3",
        },
        "passive_reduced_heat": {
            "matrix_real":rho0_reduced.real.tolist(),
            "matrix_imag":rho0_reduced.imag.tolist(),
            "eigenvalues":np.linalg.eigvalsh(rho0_reduced).tolist(),
            "scalar_residual":float(np.linalg.norm(rho0_reduced-np.eye(3)/3)),
            "K_minmax":[float(passive_k_eigs[0]),float(passive_k_eigs[-1])],
        },
        "species_reduced_heat":reduced,
        "ckm_abs_from_declared_reduction":np.abs(ckm).tolist(),
        "pmns_abs_from_declared_reduction":np.abs(pmns).tolist(),
        "ckm_J":audit.jarlskog(ckm),
        "pmns_J":audit.jarlskog(pmns),
        "discrete_branches_by_free_energy":branches,
        "joint_h_branches_by_free_energy":joint_branches,
    }
    print(json.dumps(out,indent=2))


if __name__ == "__main__":
    main()