# Run 13 — Local bridge conjugacy and exact representation transport
2026-11-24. RESULT: SOURCE-MATCHED / DONE for the two local bridge comparison lemmas and their immediate geometric-field suppliers; PARTIAL for the full Galois → nonvanishing chain. No Lean replay or URT speed claim.

## Continuity
Read AGENTS, research-state/log/protocol and continuity excerpts, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, Run 12; inspected latest commits and peer handoffs (theta Fourier/Haar, Landau uniform window, prime uniform counting, integration Iwahori, editor prime pair, geometry extension readout, math change-level, character boxes finite groups, literature smooth reducedness, acceleration reverse invalidation; structure/dependency/kernel/audit latest commit scopes inspected, not their full JS artifacts). No overlap with this task. Latest Cathedral CI summary 19:19:41Z run 45465413878 PASS, not RH evidence. Blueprint link and its limitations read in queue; PDF not reread this session. Run 12 leaves GlobalTheory.MemLoc.frob_laws and FrobLaws.exists_ext and EmbOrbitAlt open; this run neither solves nor deletes them. No physics files or queues changed.

## Provenance
Source leanprover-community/riemann-hypothesis.
P=40e56bab026552e089d7afcfeff08d2defb9c005.
H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned by repository commit listing today; unchanged since Run 12).
Both files under src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/.
A=LocalIndepBridge.lean, P blob ff48b8f2c49031d3b2654a02a205535e1aa94206, H blob 04ecdc8caaa6393d4e692129dd97c0a53f902beb.
B=FiniteDimensionalAdjoinRange.lean, P blob ed59aaa465d09e1db63c3b92de8bcba34a59d712, H blob 48a35a7ff871d18c56cee54f4e7217a9465c5897.
A exact pinned source https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/LocalIndepBridge.lean
B exact pinned source https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FiniteDimensionalAdjoinRange.lean
Consumer C=src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean, P blob ffdce791714cb11064760245f465f9ba78449bbc; imports A directly (line 6). See Run 12 for exact C consumer bodies and H hash.

## 1. Identify the actual finite local fields (A14–28, B171–187)
Fix prime l, number field E, field Omega with E-algebra, algebraic local closure Om(l) of Q_l. A LocBridge B has ring embedding j:Omega→Om(l), finite extension K=B.Kw inside Om(l), image of E contained in K (j_E), and each element of K lies in closure of j(E) (j_dense). The coefficient algebra O is a commutative ring with Z_l-algebra and topology; the bridge uses a subgroup Gw of Aut_E(Omega).
Put S=Q_l(j(E)). It is finite dimensional over Q_l: choose the finite Q-basis b_i of E, and use x=sum_i a_i b_i to show S=Q_l(j(b_i):i). Every j(b_i) is algebraic over Q_l because Om(l) is algebraic; adjoining finitely many integral elements gives finite dimension. B.finiteDimensional_adjoin_range uses exactly this argument, not an assumption that j(E) itself contains Q_l.
S is closed in the norm topology of Om(l) by closed_of_finiteDimensional. Thus closure(j(E))⊆S and j_dense yields K⊆S. Conversely j_E and adjoin_le_iff yield S⊆K. Therefore K=Q_l(j(E)) (BridgeInd.kw_eq_adjoin). No completeness of Om(l) itself is required.

## 2. Construct the conjugating automorphism (B77–156)
Three genuine suppliers, not an abstract uniqueness-of-embedding assumption:
(a) PlaceBridge.denseRange_embedding: if Omega is algebraically closed, j(Omega) is dense in Om(l). For a∈Om(l) and δ>0 choose its monic minimal polynomial f over Q_l, degree n>0. Set ε=(δ/max(|a|,1))^n/(n+1)>0. Approximate its coefficients by rationals to get a monic polynomial g of exactly the same degree using exists_monic_and_natDegree_eq_and_norm_map_algebraMap_coeff_sub_lt and Padic.denseRange_ratCast. The root perturbation theorem exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt gives a root b of the image of g with |a-b|<δ after the displayed ε normalization. Since g splits in Omega and ring-map compositions from Q coincide, roots_map identifies b=j(y) for some y∈Omega. This proves density for every a and δ. The two polynomial approximation/root estimates are actual imported leaves and are not reproved here.
(b) PlaceBridge.norm_eq_of_le_one_iff: suppose j,j' have the same unit ball for all x∈Omega. For b≠0 apply the hypothesis to a/b. This gives |j(a)|≤|j(b)| iff |j'(a)|≤|j'(b)|, while b=0 follows by injectivity. The resulting equivalent real absolute values are powers of one another with a positive real exponent c (AbsoluteValue.isEquiv_iff_exists_rpow_eq). Evaluate at l. Both embeddings fix l, and 0<|l|<1, so |l|^c=|l| forces c=1 by injectivity of real powers. Thus |j'(x)|=|j(x)| for all x. The same unit ball does not in general force equality without this calibration: |·| and |·|² have identical unit balls but unequal nonunit values.
(c) PlaceBridge.exists_algEquiv: given dense j and norm equality, endow Omega with the norm induced by j. Both j and f=incl∘j' into the complete p-adic field C_l are isometries. Extend f along j by IsDenseInducing.extendRingHom to a continuous ring hom t:Om(l)→C_l, satisfying t(j(x))=f(x). On the rational numbers it agrees with the standard inclusion; continuity and density of Q in Q_l make it Q_l-linear as a ring map, hence an algebra hom. Restrict to the normal algebraic extension Om(l)/Q_l by restrictNormal' to obtain g∈GQ(l)=Aut_{Q_l}(Om(l)); the commutation lemma gives g(j(x))=j'(x). Important: extension is into C_l, not an unjustified extension into the noncomplete algebraic closure. The uniform extension, normal restriction and absolute-value power theorem remain imported obligations.

## 3. BridgeInd.exists_conj (A40–57)
Now require Omega an algebraic closure of E, a valuation subring A of Omega, two local bridges B,B' on the same decomposition group Dec(A/E) with (possibly different) commutative Z_l-algebras O,O' and topologies, and both hB:Induces B, hB':Induces B'. These hypotheses give |j(x)|≤1 iff x∈A iff |j'(x)|≤1 for ALL x. Section 2 supplies g. By Section 1 and transport of field adjunction:
K'=Q_l(j'(E))=g(Q_l(j(E)))=g(K).
Consequently x∈K iff g(x)∈K'. Forward uses witness x for membership in the image; reverse takes y∈K with g(y)=g(x) and uses injectivity. The output is the simultaneous existential witness (g, hg, hK), not separate unrelated g's for the two conclusions. The field map g fixes Q_l; coefficient inclusions need not be identified with this automorphism.

## 4. Conjugating the fixing subgroups (A69–84)
Assume finite extensions K,K' and g with hK: x∈K iff gx∈K'. For h∈GK(K) and y∈K', g^{-1}y∈K, hence (ghg^{-1})(y)=g(h(g^{-1}y))=y. Thus ghg^{-1}∈GK(K'). Conversely for h'∈GK(K') and y∈K, gy∈K', so g^{-1}h'g(y)=y. These are the two native mem_GK_conj/ mem_GK_conj_inv lemmas. Preserve membership witnesses in the subgroup types; this gives a group identification, not equality of the subgroups as subsets.

## 5. Exact descent of the local representation (A319–335)
For B and B' with SAME Gw (not necessarily Dec here), the group isomorphisms e:Gw≃GK(K), e':Gw≃GK(K') obey the defining compatibility e(s)(j(x))=j(s(x)), and likewise for e',j'. Assume hg:g∘j=j'. For h∈GK(K), h'∈GK(K') with h'=ghg^{-1} in GQ(l), and every x∈Omega,
j'(e'^{-1}(h')(x))=h'(j'(x))=ghg^{-1}g(j(x))=g(h(j(x)))=g(j(e^{-1}(h)(x)))=j'(e^{-1}(h)(x)).
Injectivity of j' implies pointwise equality of global automorphisms and hence e'^{-1}(h')=e^{-1}(h) (e_symm_conj).
For any finite coefficient extension L and rank m, and common monoid representation r:Gw→GL_m(L), the local representation repE is defined using the inverse of e and the matrix action. Substitute the preceding equality in the actual definition: B'.repE(L,r)(h')=B.repE(L,r)(h) (repE_conj). No scalar conjugation of r, continuity, semisimplicity or potential semistability required in this last lemma itself; they remain required by the Run 12 parameter theorem where stated. The same r and same L are crucial; equality need not hold for unrelated representations.

## 6. Source edges and limits
C.wdAt_eq uses BridgeInd.exists_conj, then BridgeInd.repE_conj to discharge the conjugated representation hypothesis of C.wdPst_conj. C.exists_map_conj uses BridgeInd.e_symm_conj to transport Weil actions. These are source-call edges, not kernel-authenticated dependencies. Together with Run 12 they show precisely how two local bridges from one global representation give the same WD parameter after enlargement and monodromy rescaling under the stated potential semistability and dimension hypotheses. No remaining missing supplier is eliminated by these identities. A also proves the de Rham filtered multiplicity transport (mem_DdR_conj, mem_FildR_conj, multV_conj); not translated in this run. External caller of wdAt_indep_bridge remains unlocated: repository code search for exact name returned zero results, not proof of absence. The actual role-labelled root path to Main and the deeper analytic nonvanishing theorem remain OPEN.

## 7. Executed source checks
Two native files at two revisions fetched using GitHub connector. JS in this session ran 48 pinned declaration-anchor assertions across ten declarations; all passed. Then corrected explicit-line-range comparison (an inserted blank line in H had prematurely truncated the initial slice): all 10 whitespace-normalized full declarations matched, 9 exact. Four file blob IDs checked. Only whitespace insertion inside finiteDimensional_adjoin_range among these ten ranges; other import/section changes are not covered. No synthetic simulations or counted arithmetic exercises. No Lean compilation, axiom audit, independent kernel path, measured URT improvement, or full RH completion.
Source comparison reproducible with Python stdlib in a clone containing both commits. This Python equivalent is supplied but not separately executed; the JS comparisons above were executed. O(total text read plus selected slice lengths) for fixed ranges, no complexity claim about whole proof.
```python
import subprocess, sys
repo = sys.argv[1]
P = "40e56bab026552e089d7afcfeff08d2defb9c005"
H = "9282d3a102c4aff0e6026746db2a8990f5d9cddd"
base = "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
files = [
 ("LocalIndepBridge.lean","ff48b8f2c49031d3b2654a02a205535e1aa94206","04ecdc8caaa6393d4e692129dd97c0a53f902beb",
 [(14,28,59,73),(40,57,85,102),(69,76,114,121),(78,84,123,129),(319,330,360,371),(332,335,373,376)]),
 ("FiniteDimensionalAdjoinRange.lean","ed59aaa465d09e1db63c3b92de8bcba34a59d712","48a35a7ff871d18c56cee54f4e7217a9465c5897",
 [(77,105,130,158),(107,130,160,183),(132,156,185,209),(171,187,224,241)])]
def git(*args):
    return subprocess.check_output(["git","-C",repo,*args]).decode()
exact = total = 0
for file, ps, hs, ranges in files:
    path = base+file
    assert git("rev-parse",P+":"+path).strip()==ps
    assert git("rev-parse",H+":"+path).strip()==hs
    p,h = (git("show",r+":"+path).splitlines() for r in (P,H))
    for a,b,c,d in ranges:
        x,y = "\n".join(p[a-1:b]),"\n".join(h[c-1:d])
        assert "".join(x.split())=="".join(y.split()),(file,a)
        exact += x==y
        total += 1
        print(x.splitlines()[0],a,c,x==y)
assert (total,exact)==(10,9)
print("10 normalized, 9 exact; text comparison, not Lean verification")
```

## RESUME HERE
Translate A.mem_DdR_conj (P 170 vicinity), A.mem_FildR_conj and A.multV_conj with the actual tensor and filtration identities and transported coefficient embeddings, then locate the native de Rham-weight independence caller. Request authenticated role-labelled edges for GlobalTheory.Pst.BridgeInd.exists_conj, repE_conj, e_symm_conj, kw_eq_adjoin and GlobalTheory.PlaceBridge.denseRange_embedding, norm_eq_of_le_one_iff, exists_algEquiv. Retain the Run 11 fixed-field leaves and external wdAt_indep_bridge caller as open; do not repeat Run 13. HANDOFF TO Galois, integration, editor, dependency, kernel, audit, acceleration, theta. Project OPEN.
