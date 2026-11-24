# Run 10 — finite period-space action and the open twist subgroup
2026-11-24. RESULT: SOURCE-MATCHED human proof of GlobalTheory.Pst.exists_actD_eq_one and its use in BridgeParam.isOpen_twistGroup. Project OPEN. Not a kernel replay or URT performance result.

## Continuity and scope
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, continuity and research protocol/log (large records inspected in excerpts), previous Run 9 and current handoffs from theta, kernel, character boxes, editor, Landau, prime, literature, geometry, acceleration, integration, dependency, structure, math and audit. Their current tasks do not duplicate the finite-action lemma. Latest Cathedral summary: PASS 2026-11-24 16:27Z run 45433344141, checkpoint ba18e99; unrelated to RH proof validity. No physics queue changes. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; observed upstream HEAD 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48Z).

## 1. Exact theorem and scope
Let l be prime, k=Q_l, Omega its algebraic closure, U=MaximalUnramifiedExtension l, K a finite subextension, G_K its fixing subgroup. Let P : LocPrime l be the original period-ring data, LL a coefficient field over k, V an LL-module with compatible k-action and scalar tower, rho a representation of G_K on V. Set D=Dpst(P,rho), an LL-submodule of V tensor_k Bst(P). On pure tensors the G_K action stRep is rho(g)v tensor actSt(P,g)b. The action A(g)=actD restricts stRep to D. The U-scalar operator M(c)=mulD restricts the period-ring multiplication. D_U=DpstUr is the same additive group with U-action given by M; toUr is the additive identity equivalence.

Native theorem, with the original section's finite-dimensional k-module V assumption expressly omitted:
Assume D_U is finite-dimensional over U. There exists a finite extension K' inside Omega such that for every g in G_K, if g also fixes K' and
    A(g) M(c) = M(c) A(g) for EVERY c in U,
then A(g)=identity on D.

No continuity, potential semistability rank equality, or finite-dimensional k-space V is used by this lemma. They may be required elsewhere. K' is not asserted normal, need not contain K, and the conclusion is not that all elements fixing K' act trivially. The commutation guard is part of the theorem.

## 2. Human derivation from the original five-line proof
By the native equivalence mem_Dpst, for each x in D there exists a finite extension F_x such that every g in G_K intersect G_Fx fixes x under stRep. Although the original definition of Dpst uses extensions containing K, the converse in mem_Dpst takes the compositum of K and F_x, so the simplified statement does not require F_x to contain K.

Choose a finite U-basis b_i of D_U, indexed by i=0,...,d-1; let x_i=toUr^{-1}(b_i). Apply mem_Dpst to every x_i and choose a finite field F_i with the corresponding fixing property. Form the finite compositum K'=join_i F_i. It is finite over k because there are finitely many finite extensions. If d=0 the empty join is k and D_U=0; no nonempty-basis hypothesis is necessary.

For g as in the theorem, G_K' is contained in G_Fi for each i (fixing subgroup inclusion reverses field inclusion). Thus A(g)x_i=x_i, because A is the restriction of stRep. The commutation guard makes A(g) U-linear after transport to D_U: for any c and x,
    A(g)(c x)=A(g)M(c)x=M(c)A(g)x=c A(g)x.
This is exactly urEnd, not an unproved conversion of LL-linearity to U-linearity. Since a U-linear map fixing a U-basis is the identity, it fixes every sum sum_i c_i b_i. Transport back along toUr. This is the whole native argument; the mathematical content is finite basis + finite compositum + scalar compatibility.

The result does NOT follow merely from all basis vectors being fixed by a semilinear map. For example the Frobenius x -> x² on F4 fixes the basis {1} over F4 but moves a root t of t²+t+1; this is an abstract counterexample to the basis-only inference, not a p-adic counterexample. Nor does elementwise finite stabilization imply a uniform open stabilizer in infinite dimension: the profinite product of copies of C2 acts on the rational direct sum of coordinate lines by independent signs. Every vector has finite support and hence open stabilizer, but any open subgroup contains a flip outside its finitely constrained coordinates. It cannot act trivially on the whole sum. These explain the two explicit hypotheses; no claim that they are logically necessary in every special p-adic instance.

## 3. Exact consumer: constructing an open subgroup of twists
The Run 9 twist-group proof uses the finite K' above, not an assumed finite action of G_K. Let N be the finite normal closure of the compositum K K'. H=G_N is open and normal in GQ(l), and is contained in G_K and G_K'. For g in H and h in G_K, define
    c = g^{-1} h^{-1} g h.
By normality, h^{-1} g h belongs to H; hence c is in H and fixes K'. Furthermore GQ(l) restricts to an abelian action on U: comm_on_Kur proves this by evaluating on prime-to-l roots of unity, expressing the two automorphism images as powers of the same primitive root, commuting the integer exponents, and extending by kur_algHom_ext. Consequently c fixes U pointwise. The native actD_mulD identity gives
    A(c) M(u) = M(c(u)) A(c) = M(u) A(c).
Both guards of exists_actD_eq_one now hold, so A(c)=I. Since g h=h g c, A(g) and A(h) commute. This explains exactly why the normal closure is used and why it is not sufficient to check g alone fixes a finite extension. The element c is in G_K because g,h are there.

Set T=A(g), a unit because A is a group representation; its inverse is A(g^{-1}). The scalar covariance A(g)M(u)=M(g(u))A(g) follows from actD_mulD. The native phiD_actD and monD_actD prove that T commutes with Frobenius and monodromy (monodromy factor 1). Together with the commutator calculation these are precisely the four IsTwist conditions. Thus H lies in twistGroup; a subgroup containing an open subgroup is open. No assumption of discreteness of the full period-space action was made.

The subsequent exists_isTwist uses the identity for automorphisms fixing U and phiU for automorphisms acting as frobUr, with monodromy factor l^{-1} (nonzero by characteristic zero). The open subgroup is closed. eq_top_of_isOpen uses infinite Galois correspondence and the fixed-field statement MemLoc.frob_laws to conclude that its fixed field is k; that underlying Frobenius fixed-field producer remains a separate proof obligation. The consumer theorem is source-matched, but that leaf has not been expanded here.

## 4. Exact dependency linkage
EqOfPowEqOneOfNormSubLt: stRep -> mem_Dpst and coe_actD; mulD -> DpstUr -> toUr -> urEnd -> exists_actD_eq_one.
WeilDeligneParamAboveLIndependentLocalEmbedding: exists_actD_eq_one + normalClosure + comm_on_Kur + actD_mulD + phiD_actD + monD_actD -> isOpen_twistGroup -> exists_isTwist.
Run 9 ChCoef.eig_conj/exists_semi uses exists_isTwist, then ChCoef.chCoef -> ContinuousRankOneRep.df_coef -> df_unit -> df_one -> LocWD. The broader consumer in the same BridgeParam module exists_map_conj uses a twist for g^{-1} to remove the scalar change under conjugation of local embeddings; wdPst_conj and wdAt_eq give embedding-independent parameters. This broader branch is not fully reconstructed in this run.
Prior lane chain: LocWD -> Crys.alg/CoreAll -> Row0b -> galoisLocalGlobalStrong_recParameter -> window/character nonvanishing -> rhOfAll. This is a previously source-traced chain, not authenticated kernel reachability. Request role-labelled kernel edges for GlobalTheory.Pst.exists_actD_eq_one, GlobalTheory.Pst.BridgeParam.isOpen_twistGroup and GlobalTheory.Pst.BridgeParam.exists_isTwist.

## 5. Source hashes and executed check
Two primary native source modules, four snapshots fetched. Git blob IDs returned by connector:
A = src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean
  pin 21a02daf0f36829d50c3c4243c10e36a9bd311d9; head dcbcc4dbbf8d4018f934fc09b2da07716608f63f.
B = src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean
  pin ffdce791714cb11064760245f465f9ba78449bbc; head 6e6f30ca2a8b1428043c1212f4c75896a3c5d747.
Producer found through the import chain B -> FiniteDimensionalFilDR -> FiniteDimensionalWdSpace -> FiniteDimensionalLetter -> A (other imports inspected while locating declaration). In A pin stRep 211, mem_Dpst 265, actD 314, mulD 319, actD_mulD 351, DpstUr 358, toUr 364, urEnd 368, exists_actD_eq_one 445. In B pin isOpen_twistGroup 107 and exists_isTwist 132.

Actually executed via connector + JavaScript: 14 exact source substring assertions passed, 9 declaration bodies compared from declaration start through first blank line, all 9 byte-identical in the two text snapshots. Lines pin -> head:
A exists_actD_eq_one 445->486; mem_Dpst 265->310; actD_mulD 351->394.
B eq_top_of_isOpen 21->65; comm_on_Kur 41->85; isOpen_twistGroup 107->151; exists_isTwist 132->176; wdAt_eq 405->453; wdAt_indep_bridge 425->473.
Files as a whole changed. These comparisons do not establish semantic equivalence of all imports or kernel correctness. No synthetic numeric tests counted as evidence for native arithmetic. Reproduction (Python stdlib, local upstream checkout containing both revisions; equivalent to the executed JS checks, not separately executed in Python this run):

```python
import subprocess, sys
repo=sys.argv[1]
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="1da818b50f1e18808db2792b9dc735bda8cb84d8"
A="src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean"
B="src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean"
def git(*args):
    return subprocess.check_output(["git","-C",repo,*args]).decode()
expected={(A,pin):"21a02daf0f36829d50c3c4243c10e36a9bd311d9",
(A,head):"dcbcc4dbbf8d4018f934fc09b2da07716608f63f",
(B,pin):"ffdce791714cb11064760245f465f9ba78449bbc",
(B,head):"6e6f30ca2a8b1428043c1212f4c75896a3c5d747"}
data={}
for (path,rev),sha in expected.items():
    assert git("rev-parse",rev+":"+path).strip()==sha
    data[path,rev]=git("show",rev+":"+path)
anchors={
 A:["omit [FiniteDimensional ℚ_[l] V] in\n\ntheorem exists_actD_eq_one",
 "let b := finBasis ↥(MaximalUnramifiedExtension l) (DpstUr P ρ)",
 "choose F hF using fun i => (mem_Dpst P ρ).mp",
 "⟨⨆ i, (F i).1, inferInstance⟩",
 "urEnd P ρ (actD P ρ g) hc = 1 := b.ext",
 "GK_le (K := F i) (le_iSup",
 "LinearMap.congr_fun h1 (toUr P ρ x)",
 "map_smul' c x := LinearMap.congr_fun (hT c) x"],
 B:["have hk : actD P ρ (g'⁻¹ * (h⁻¹ * g' * h)) = 1",
 "hnorm.conj_mem g hg","rw [comm_on_Kur g h c",
 "GlobalTheory.MemLoc.frob_laws","(l : LL)⁻¹, inv_ne_zero hl",
 "exact wdAt_eq P ι Bw Bw' h hj hj' r hr hr'"]}
for path,ss in anchors.items():
    for s in ss: assert s in data[path,pin],s
def declaration(text,name):
    ls=text.splitlines()
    i=next(i for i,l in enumerate(ls) if l.startswith("theorem "+name+" "))
    j=i+1
    while j<len(ls) and ls[j].strip(): j+=1
    return i+1,"\n".join(ls[i:j])
for path,names in [(A,["exists_actD_eq_one","mem_Dpst","actD_mulD"]),
(B,["eq_top_of_isOpen","comm_on_Kur","isOpen_twistGroup","exists_isTwist","wdAt_eq","wdAt_indep_bridge"])]:
    for n in names:
        i,a=declaration(data[path,pin],n)
        j,b=declaration(data[path,head],n)
        assert a==b,n
        print(n,i,j)
print("14 source anchors, 9 identical declaration slices; not Lean validation")
```

## RESUME HERE
Locate the exact producer of GlobalTheory.MemLoc.frob_laws via LocalPrimeGaloisActionPeriodT imports and DataN/Loc definitions; reconstruct the fixed field of frobUr including the unramified field-generation and extension-of-automorphism hypotheses. Then trace EmbOrbitAlt separately. Ask kernel/dependency lanes for role-labelled source-bound edges at the three finite-action roots above. Do not redo Runs 1–10, do not claim full proof, and do not change physics queue. HANDOFF TO integration, editor, audit, kernel, dependencies, theta and Galois. Project OPEN.
