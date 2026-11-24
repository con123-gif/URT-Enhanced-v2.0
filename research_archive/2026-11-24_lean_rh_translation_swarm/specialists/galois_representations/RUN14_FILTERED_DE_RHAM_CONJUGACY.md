# RUN14 — Filtered de Rham conjugacy, dimension and jump multiplicity
2026-11-24. RESULT: DONE / SOURCE-MATCHED for the named filtered transport argument, PARTIAL for its downstream root linkage. No Lean replay.

## Continuity and scope
Read AGENTS, RESEARCH_STATE and RESEARCH_LOG excerpts, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, Run13. Inspected latest commits and available peer RESUME HERE patches from theta, prime, structure, dependency, acceleration, kernel, integration, geometry, audit, literature, character boxes, Landau and math; editor full latest note not recovered, blueprint link/limitations reviewed but PDF not reread. No overlapping filtered conjugacy translation found in inspected notes. CI summary 2026-11-24T20:18:08Z run 45475909611 PASS is for Cathedral, not RH. Physics queues untouched. Run 11 fixed-field supplier and Run 12 FrobLaws.exists_ext / EmbOrbitAlt remain OPEN.

## Provenance
Upstream leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005, H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, latest returned upstream commit unchanged since Run13.
A=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LocalIndepBridge.lean; P blob ff48b8f2c49031d3b2654a02a205535e1aa94206; H blob 04ecdc8caaa6393d4e692129dd97c0a53f902beb.
B=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FiniteDimensionalFilDR.lean; P blob 178fe7bdc49c43c1a4c71f2933f873131178bf78; H blob 311e6c5f988099684312ef20d33ec6687f3d6ea6.
[A pinned](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LocalIndepBridge.lean#L137-L301); [B pinned](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FiniteDimensionalFilDR.lean).
A imports B at P line 2; at H the public import list differs. All A declarations below are in GlobalTheory.Pst.BridgeInd. B declarations in GlobalTheory.Pst.

## 1. Hypotheses and tensor action (A139–169)
Fix prime l, LocPrime P, a field LL over Q_l, additive commutative V with LL and Q_l module structures forming a scalar tower. Fix finite local extensions K,K' inside Om(l), g in GQ(l), representations rho:G_K→End_LL(V), rho':G_K'→End_LL(V). Assume hK: for EVERY x in Om(l), x∈K iff gx∈K'. Assume hρ: for all h∈G_K and h'∈G_K', if h'=ghg^{-1} in GQ(l), then rho'(h')=rho(h). These are exactly the group and representation transports supplied in Run13 for compatible bridges; they are not assumed for unrelated representations.
Write B_dR=P.R.BdR, W=V⊗_{Q_l} B_dR, C_g=id_V⊗P.actQdR(g). A.conjdR is an LL-linear equivalence, NOT an LL-semilinear map; only the period factor is transformed. The action A_h on W is rho(h)⊗PD_K.actdR(h). A.conjdR_actVdR proves C_g A_h=A'_{h'} C_g by tensor induction (zero, pure tensor, sum): on v⊗b both sides have vector factor rho(h)v; on the period factor P.PD_actdR and the group action law give g h b=(ghg^{-1})g b. No identification of K and K' as subsets is assumed.

## 2. Invariant subspace (A174–191)
DdR is the intersection of the kernels of A_h−I. Thus membership means A_h x=x for every h∈G_K. Forward: for arbitrary h'∈G_K', take h=g^{-1}h'g; h is in G_K by mem_GK_conj_inv(hK). Then A'_{h'}C_g x=C_g A_h x=C_g x. Reverse: for arbitrary h∈G_K take h'=ghg^{-1} using mem_GK_conj(hK). If C_g x is fixed, C_g A_h x=C_g x; injectivity gives A_h x=x. Hence C_g(DdR)=DdR'. A.finrank_eq_of_mem_iff (86–91) obtains equality of dimensions because the map of the submodule is exactly the target and a linear equivalence preserves finrank. This uses the actual equivalence, not just equal cardinalities.

## 3. Entire filtration transported (A207–254)
For integer a let F_K^a=PD_K.Fil(a) in B_dR and FilV_K^a the image of V⊗_{Q_l}F_K^a under the natural tensor inclusion map. It is important to use IMAGE: an arbitrary element is given by a witness z in the smaller tensor product, not presumed a single pure tensor.
A.botExt is the bottom intermediate field Q_l and mem_GK_bot says every g fixes it. PD_Fil identifies F_K^a=F_bottom^a as sets for every K. Fil_G for the bottom extension plus PD_actdR then imply P.actQdR(g)F_K^a⊆F_K^a for EVERY g, not merely elements fixing K. A.filV_eq likewise identifies FilV_K^a=FilV_K'^a using equality after scalar restriction to Q_l. For x in FilV_K^a choose witness z. Restrict P.actQdR(g) to F_K^a, and apply id⊗that restricted linear map to z. Tensor induction shows its image is C_g x. Inverse C_{g^{-1}}C_g=I follows by the group action and tensor induction. Apply the same argument to g^{-1} for the reverse membership implication. Thus C_g FilV_K^a=FilV_K'^a. This depends on the stipulated period-data identities PD_Fil, Fil_G, PD_actdR; their deeper suppliers are not proved here.

## 4. Embedding eigenspace, the indispensable extra hypothesis (A256–294)
Let τ1:K→_{Q_l}LL and τ2:K'→_{Q_l}LL be algebra homomorphisms. Require hτ: for all c∈K and c'∈K' with c'=g(c) in Om(l), τ2(c')=τ1(c). The coefficient field LL itself is fixed by C_g.
Write M_c for multiplication on the period factor by the image of c in B_dR. A.conjdR_mulVdR: C_g M_c=M'_{c'} C_g when c'=g(c), using multiplicativity of P.actQdR and P.actQdR_Om (compatibility on the algebraic closure embedded into B_dR). Again tensor induction proves this for general x.
The source unfolds FildR and DdRE into exactly three requirements:
  (i) A_h x=x for all h∈G_K,
  (ii) M_c x=τ1(c)x for all c∈K,
  (iii) x∈FilV_K^a.
The first and third transport by §§2–3. For the second, choose c=g^{-1}c' for each c'∈K'; hK certifies membership. Then M'_{c'} C_g x=C_g M_c x=C_g(τ1(c)x)=τ1(c)C_g x=τ2(c')C_g x. Reverse uses c'=gc, hK, hτ and C_g injective. This proves A.mem_FildR_conj at every integer a. It is wrong to compare the eigenspaces without matching τ: the two embeddings of a quadratic field give different eigenlines for multiplication by a primitive element in a split coefficient field, even with g=I. This is a conceptual counterexample to dropping the membership/eigenspace condition, not a claim that dimensions must always differ.

## 5. Multiplicity transport (A296–301)
Set d(a)=finrank_LL FildR_K,τ1^a, d'(a)=finrank_LL FildR_K',τ2^a. A.finrank_eq_of_mem_iff and §4 give d(a)=d'(a) for all a. The native multV is the INTEGER difference d(a)−d(a+1). Substituting both equalities, not just one, proves multV_K,τ1(a)=multV_K',τ2(a). A.multV_conj does NOT require a finite-dimensional DdR hypothesis; it is a finrank identity, and the interpretation as an actual graded dimension needs finite dimensionality.
B.filDR_succ_le (29–36) proves decreasing filtration via the smaller tensor witness and PD.Fil_anti. Under [FiniteDimensional LL DdR], B.finiteDimensional_filDR (39–40) and B.finrank_filDR_succ_le (42–45) give finite dimensions and nonnegative integer differences. B.isJumpV_iff (47–52): nested finite-dimensional subspaces of equal dimension coincide, hence jump iff multV≠0. B.finite_jumps (54–70): d is antitone, at any jump a and b>a, d(b)≤d(a+1)<d(a); hence jump indices inject by d into {0,…,dim DdR}. B.exists_multiset_jumps (72–80) realizes the finitely supported nonnegative multiplicities as a multiset of integers. Therefore as a human corollary, if both actual jump multisets are given by those multiplicities, extensionality of counts yields equality. This corollary is not asserted to be a separate native theorem.
B.local_of_isModel (294ff) is a distinct source-proved model-to-global jump comparison using count_jumpsW and isJumpE_iff; B.count_jumpsW (281–292) identifies the witnessing place by equality of prime-ideal membership from norms of the global embedding. B uses multV_ext for coefficient enlargement, not multV_conj. A's downstream caller for multV_conj was not recovered; default-branch code search for multV_conj and LocalIndepBridge returned zero hits. Neither absence of use nor a direct edge to B is inferred.

## 6. Connection to root and limitations
The source map for this step is multV_conj → finrank_eq_of_mem_iff + mem_FildR_conj(a,a+1) → mem_DdR_conj + mem_filV_conj + conjdR_mulVdR + hτ. B's count-jump route is a nearby but separate branch. Previous Run13 supplies hK/hρ for bridges. Latest dependency lane commit 63102da2488b52ab2f89e484e71a975547ad4118 records authenticated incoming value witnesses from UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter to UpperTheory.TP.K.tLiftK (1065212053) and UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift (1065212052), and queues further root exports. This is a peer report, not independently replayed here; no authenticated path from the root to the newly translated declarations established. Preserve the gap rather than attaching de Rham transport to nonvanishing by analogy. Full RH reconstruction, kernel replay and URT speed advantage remain open.

## 7. Actual execution and reproducibility
Four source snapshots retrieved (A,B × P,H). In tool JS executed 34 source-anchor assertions (22 A,12 B), all passed; compared 15 complete A declaration ranges: 11 exact, four differing only by explicit map_add (f := _) in the additive tensor-induction branch. No changed theorem statement among these 15 comparisons. B declarations were located at both revisions, not full-body compared. Connector returned blob IDs above. Source checks only. Equivalent Python replay below (not independently executed); linear in source bytes and selected slice bytes for fixed ranges, not a whole-proof complexity claim.
```python
import subprocess,sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
base="src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
def git(*args):
    return subprocess.check_output(["git","-C",repo,*args]).decode()
files=[("LocalIndepBridge.lean","ff48b8f2c49031d3b2654a02a205535e1aa94206","04ecdc8caaa6393d4e692129dd97c0a53f902beb"),
       ("FiniteDimensionalFilDR.lean","178fe7bdc49c43c1a4c71f2933f873131178bf78","311e6c5f988099684312ef20d33ec6687f3d6ea6")]
for f,p,h in files:
    assert git("rev-parse",P+":"+base+f).strip()==p
    assert git("rev-parse",H+":"+base+f).strip()==h
a,b=(git("show",r+":"+base+files[0][0]).splitlines() for r in (P,H))
ranges=[(86,91,131,136),(150,151,191,192),(157,169,198,210),
(174,188,215,229),(190,191,231,232),(207,207,248,248),(209,212,250,253),
(214,219,255,260),(221,226,262,267),(228,237,269,278),(239,247,280,288),
(249,254,290,295),(256,270,297,311),(277,294,318,335),(296,301,337,342)]
exact=0
for i,j,k,m in ranges:
    x,y="\n".join(a[i-1:j]),"\n".join(b[k-1:m])
    exact+=x==y
    assert x==y.replace("map_add (f := _)","map_add"),(i,k)
assert exact==11 and len(ranges)==15
print("15 declarations: 11 exact, 4 explicit map_add argument changes; source only")
```

## RESUME HERE
Recover the actual reverse-call site of GlobalTheory.Pst.BridgeInd.multV_conj via dependency/native index rather than retrying empty default-branch search, and reconstruct the first root-linked Galois theta supplier from the pending role projection (UpperTheory.Gal.Int.galoisRepresentations_of_thetaLift). Keep fixed-field, FrobLaws.exists_ext, EmbOrbitAlt and wdAt_indep_bridge caller open. Request role-labelled witnesses for multV_conj, mem_FildR_conj, mem_DdR_conj, conjdR_mulVdR, mem_filV_conj, count_jumpsW and local_of_isModel; no assumed root reachability. HANDOFF TO Galois, dependencies, kernel, integration, editor, audit, theta and acceleration. Project OPEN.
