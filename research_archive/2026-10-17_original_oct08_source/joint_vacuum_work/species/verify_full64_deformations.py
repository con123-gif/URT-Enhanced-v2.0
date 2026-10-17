"""Independent full64 determinant checks of the two saved action probes."""
from pathlib import Path
import numpy as np,json
p=Path(__file__).resolve().parent;r=p.parents[1]
z=np.load(r/"derive_three_work/species/golden_species_operators.npz")
v=np.load(p/"shared_species_vacuum_operators.npz")
c=json.loads((p/"shared_species_vacuum_checks.json").read_text())
alpha=((1+np.sqrt(5))/2)**-2
G=z["generation6_frame"];Qp=z["Qplus"];Qm=z["Qminus"]
Prest=np.eye(64)-G@G.T-Qp@Qp.T-Qm@Qm.T
I=np.eye(3);eps=.1
def adj(a):return a.conj().T
def M(a):return np.block([[I,adj(a)],[a,np.zeros((3,3))]])
fullgold=.5*alpha*np.linalg.norm(v["gold_finite_eps_shared_vacuum"])**2
hiddenchange=0.
for fi,(name,nf) in enumerate(zip(["u","d","e","nu"],v["weights"])):
    p64=v["common_decoded_frame"]@v["gold_finite_eps_shared_vacuum"]
    a=(z["affine_L_plus"]@p64+z["complex_amplitude_sources"][fi]).reshape(3,3)
    br=adj(a)@a-I;bl=a@adj(a)-I
    extra=alpha*np.block([[br@br,np.zeros((3,3))],[np.zeros((3,3)),bl@bl]])
    k=G@(M(a)@M(a)+eps*extra)@adj(G)+3*Qp@Qp.T+5*Qm@Qm.T+alpha*Prest
    q=alpha*np.eye(64)+k
    fullgold+=.5*nf*np.linalg.slogdet(q)[1]
    q0=v[f"{name}_Q64_at_common_vacuum"]
    qh=q0+eps*alpha*v["source_norm_squared"][fi]*v["hidden_blind_projector"]
    hiddenchange+=.5*nf*(np.linalg.slogdet(qh)[1]-np.linalg.slogdet(q0)[1])
out={
    "full64_gold_relaxed_functional_change_error":float(abs(fullgold-c["base_shared_stationary_branch"]["full64_functional_value"]-c["action_deformation_response"]["gold"]["finite_functional_change"])),
    "full64_hidden_same_vacuum_functional_change_error":float(abs(hiddenchange-c["action_deformation_response"]["hidden"]["finite_functional_change"])),
    "all_four_species_share_one_saved_P":True}
assert max(out[x] for x in out if x.endswith("_error"))<1e-11
out["all_checks_pass"]=True
(p/"full64_deformation_checks.json").write_text(json.dumps(out,indent=2)+"\n")
print(json.dumps(out,indent=2))
