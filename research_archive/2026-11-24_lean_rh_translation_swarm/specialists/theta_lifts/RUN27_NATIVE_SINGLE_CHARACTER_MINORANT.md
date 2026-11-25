# RUN27 — one native generic character suffices; no series singleton or exact weight transport
2026-11-25, lane 8. SOURCE-MATCHED HUMAN REDUCTION, independent audit and native replay pending. RH OPEN. Read latest ONE_EQUATION_MISSION blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 (mandatory unified engine), SWARM, HANDOFF, expansion, AGENTS, state/runner/continuity excerpts, own RUN25/26 and peer handoffs 359a3b34, e8d168ea, 02f1f880, 3eba527a. Not an exhaustive peer/archive audit. These peers reduce other signed global budgets; none supplies this local native weight witness. CI status files for rh-recursive-reduction-strip-root-20261125 and rh-proof-term-prune-native-20261125 actually fetched: status pass, returncode 0; orchestrator #433 45582140968 at 09:25:39 predates this work. Those checks do NOT certify this new argument. Local command -v lean/lake returned neither executable. No URT or physics.

## Replacement and proof
Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Use actual TopShape.shape_closed_link_n_of_green -> LinkIrr.closed_linkIRR_of_join_count -> admissibleLabelWeights_of_greenCuspidalParametrisation / linkIRR_of_join_ex -> weight_of_join -> weightAllRows_of -> locShare_le_Wg source-body route (RUN25/26). Retain the original root/host/family/CountAllRows/GoodAt premises and previous conditional uniform squarefree minorant bridge. This is not a new authenticated elaborated graph.

At a native type prime g, write N=D.R.r, k=D.R.k>=1, s=D.R.m/2-1, N=k+2s+1, M=N(N-1)/2, psi nontrivial; retain g>=5 and the actual normalized label map O and eSer_def. Let f be a valid squarefree native monic label with nonzero constant, distinct irreducible factors P_i of degrees d_i>=1 summing to N. Write A_j=prod_{a=1}^j(g^a-1), B=prod_i(g^d_i-1)>0. The only local quantitative hypothesis needed by RUN26 is w_v(f)>= (1-1/g)g^(-N) plus nonnegative normalized weights. We can now derive it without the full eSerO=eSerC equality and without showing that a Green series is a singleton.

1. **Direct positive expansion in native convention.** Define Q_f(chi) := exists V simple with V.character=chi and HasLabelO O V f. By the exact statement finsum_centralIdempotentOfIrrCharacter_eq_simple applied to Q_f, eSerO O N f=sum_{chi in S_f} zOf chi, S_f={chi:IsIrr chi and Q_f chi}. On the RHS of that statement, existence of the additional Q_f witness is equivalent to existence of the native label witness *with the same central idempotent*: zIdem of two simple representations with equal characters agrees by its character formula (alternatively iso_of_char and central-idempotent invariance). This does not require HasLabelO invariant for all isomorphic reps, since we can choose the Q_f witness itself. FiniteIrrCharactersAndFinsumCentralIdempotentsEq supplies finiteness. T.eSer_def identifies the actual native operator. For a=eU or eJ, trIdem and the exact identity coefficients in whittakerJacquetIdempotents_properties_primeField give
     wtOf(D,type,a,f) = [sum_{chi in S_f} chi(1) Re tr(a,chi)] / [|GL_N| Re a.coeff(1)].
   Every term nonnegative: chi(1) is a positive integer, a is idempotent, trace on a genuine character a nonnegative integer, and denominator positive. This works on all labels, not only squarefree. The existing ConcNWeight.sum_wtOf supplies total mass one with the original sum_eSer; retain the zero-weight rule from eSer_zero_of_tie. Thus no positivity of an arbitrary complex trace has been assumed.

2. **One witness in S_f, not uniqueness.** For each degree d>0 use the *first half* of exists_perm_deg in AdmissibleLabelWeightsOfGreenCuspidalParametrisa: Green supplies distinct cuspidal characters tau_P of degree A_(d-1) indexed by the finite set of valid degree-d prime labels. Realize each by a simple cuspidal V_P using isCuspidalCharacter_iff_isCuspidal_GLnFiniteField. The map P -> O.lab d V_P is an injection of that finite set to itself: O.lab_inj implies isomorphism, hence equality of characters, then Green injectivity gives P equality. It is therefore surjective. For every native factor P_i choose a preimage and a simple cuspidal V_i of rank d_i with O.lab d_i V_i=P_i and degree A_(d_i-1). No use of the third (all cusp characters exhausted) Green clause in this witness construction. Distinct factors give distinct entries in the dependent list of ranks/characters: if ranks and characters agree, iso_of_char and O.lab_iso give equal labels.

   Form C=hcL(list of (d_i,V_i.character),N). The source character and permutation theorem says C is a genuine character; characterPairing_harishChandra_cuspidal_mackey gives ip(C,C)=1 because the dependent list is Nodup. Character decomposition gives IsIrr C. Choose simple V with character C. Apply exists_blocks_of_cuspidal_character_list to the same list: it provides a surjective block assignment b, simple cuspidal block representations lam, and canonList b lam exactly equal to that list. At each position the transported block character agrees with the chosen V_i, so iso_of_char and O.lab_iso identify its native label as P_i. Their product is f by monicity and normalized factorization. The source trace_harishChandra_induced_eq_product_characters identifies the induced block character as C, and isConstituent_harishChandraRep_iff_pairing_ne_zero applies because ip(C,C)=1. These are precisely the HasLabelO fields in hasLabelO_spec/exists_labelO. Hence Q_f(C), i.e. C is in S_f. No assertion about any other member of S_f. No use of eSer_eq, label_unique, ext_back, or the reverse containment in squarefree_series in this direct proof. The same canonical-list and constituent supplier is already used by exists_labelO; here its product label is tracked position by position instead of recovered by global uniqueness.

3. **Cancel before bounding.** wh_cusp_eq_one and wh_hcL give wh(psi,C)=1 (multiplicativity, including the empty-list base in source). hc_degree gives
     C(1) prod_i A_(d_i) = A_N prod_i A_(d_i-1).
   Cancel the strictly positive prod_i A_(d_i-1), obtaining C(1)=A_N/B. Since |GL_N|=g^M A_N, Re eU.coeff(1)=g^(-M), Re eJ.coeff(1)=g^(k-M), and mirabolic_trace_ge_whittakerDimension_GLn gives Re tr(eJ,C)>=(g^k-g^(k-1))*wh(psi,C), retain JUST C in the positive expansion:
     wtOf(eU,f) >= 1/B,
     wtOf(eJ,f) >= (1-1/g)/B >= (1-1/g)g^(-N).
   The last step is B<=g^N (strict for N>0). All divisions have positive denominators. No norm or cancellation between characters. This proves the RUN26 local target from native sources conditional on their original Green existence/injectivity, normalized types, trace and representation premises. It does not prove Green from scratch.

## Scope, graph and actual unresolved leaves
Original branch: admLq producer -> eSer_eq (exists_perm, reverse label transport, label uniqueness) + squarefree_label_gelfandGraev -> label_main -> squarefree_series (both singleton directions) + exact degree/trace + lowerWtComparison (all labels) + upper bound. RUN25 removed upper bound at consumer; RUN26 replaced exact formula plus all-label comparison by uniform minorant.
Candidate local branch: native minorant -> positive native series expansion + single block-character witness -> finite bijection on cusp labels, Mackey norm-one, canonical block/constituent bridge, wh and degree + mirabolic one-character bound. Direct nonnegative/normalization/zero-label suppliers retained. Local witness does not need full classification, reverse singleton exclusion or exact equality between conventions. Shared upstream consumers may still require them, in particular sum_eSer and other TopG rows; no claim of global kernel deletion. Original graph retained in RUN25/26 and native source; original native traces, irreducibility, Green supply, arithmetic and geometry, all root pending nodes and axiom evidence retained. Do not conflate this with CountAllRows, actual global rows, or the weighted prime-window inequality. No genuine asymptotic cancellation proved this run. Direct producer implementation and caller bridge require native replay. Context cache key: (P, actual host D, type prime, normalized O, f squarefree and factor list, actual eU/eJ, N,k,s,psi). If native convention witness or idempotent expansion cannot be checked, backtrack to RUN26 via original eSer_eq and squarefree exact formula. No claims of new literature or URT.

## Exact source evidence
All pinned fetches used P. Blob identifiers observed:
- src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/AdmissibleLabelWeightsOfGreenCuspidalParametrisa.lean d240897ba7b7ac9327ad66e045a24522d8ab2ed0 (exists_perm_deg, iso_of_char, hasLabel_of, exists_labelO, eSer_eq, actual caller).
- src/Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/LabelDatum.lean 8b45fadba6baf9bf7bb49b9c18dac0fb497f00ff (Green, IsCuspOf, HasLabel).
- src/Formalism/LocalToGlobal/NormalizedHeckeFactors/CoeffZeroNeOfMonicIrr.lean 27290affacffacc73db3fdd250c03cbe82c904f8 (eSerO, hasLabelO_spec).
- src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/FinsumCentralIdempotentOfIrrCharacterEqSimpleStatement.lean f5a68dc10bc64350abd28b0b735e6d8cab85ccbd; ExistsBlocksOfCuspidalCharacterListStatement.lean 7c19fab698797834df22e787f0577bcd00fd5d23; ExistsBlocksOfCuspidalCharacterList.lean 3bc7340a0d2be3c2eb2a19f10b61d799bd7d1a43 (canonList_of_cuspidal_list).
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/HarishChandraSeriesWeightSquarefreeLabelGelfandG.lean 556b682b2712755a876de61a50cd1de9763a619b (wh_hcL, card_Gn, list_prod_split, hC1); corresponding Statement blob bc057fe360d49179d2e4a21128f238a2e11b6c4a; HarishChandraSeriesLabelExistsUniqueGLn.lean 8472a7239a31cebc591a11f5dc5ed370baad123e (squarefree_series, norm-one first half and unnecessary reverse inclusion).
- same directory GroupAlgebraTraceIdempotentAndIrreducibleDegree.lean 540b48779cba016ebaaba2d29a4180a4b39da700 (trIdem), FiniteIrrCharactersAndFinsumCentralIdempotentsEq.lean 4292f9b2757901ced80e4cb52a4003794277934c, HarishChandraSeriesWeightLowerComparison.lean cc3c4217b7657cce90c2b6c6a4246b2275a5d8aa (real coefficient expansion pattern), HarishChandraProductListDegree.lean 9827cedef7f3244fe8a738b221aba72c84fcc0bb, WhittakerDimensionCuspidalGreenDegreeEqOne.lean b4c94b3eef74266cbbbc5150f871e3b07ce790b6.
- src/Formalism/LocalToGlobal/GlobalTheory/ConcNWeight.lean 614c24bf786e29690c2202de789bbf35c2224196 (sum_wtOf, consumer). RUN25/26 retain the other exact upstream source refs.

Current upstream main observed a85077714ca7b298f69e48798497519ed5326a89 (merge PR #2456), advanced from RUN26. Selectively fetched current GelfandG file (blob 642f7754e05b15386ef18e2ddd43bdea8d3312c8) and LabelExistsUnique file (f39ee123acfe8da2aecd66fa859564f2eb30e87b); relevant named bodies still present. No mixing revisions or full equivalence assertion.

## Native certificate prepared, NOT executed
Extract following Lean into file and compile with existing engine modules in pinned environment (Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474, no Main import). This checks the genuine finite irreducible-character trace selection step, not the unimplemented full native caller.
```lean
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.HarishChandraSeriesWeightLowerComparison
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.AdmissibleLabelWeightsOfGreenCuspidalParametrisa
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
open GlobalTheory.GLq
open scoped BigOperators Classical
namespace RHTheta
noncomputable section
theorem one_native_trace {G : Type} [Group G] [Fintype G]
    (a : MonoidAlgebra ℂ G) (ha : a * a = a)
    (S : Finset (G → ℂ)) (hI : ∀ χ ∈ S, IsIrr χ)
    (C : G → ℂ) (hC : C ∈ S) :
    (C 1).re * (tr a C).re ≤
      ∑ χ ∈ S, (χ 1).re * (tr a χ).re := by
  classical
  apply Finset.single_le_sum _ hC
  intro χ hχ
  have hi := hI χ hχ
  have hchar : IsChar χ := by
    obtain ⟨V, -, hV⟩ := hi
    exact ⟨V, hV⟩
  obtain ⟨d, -, hd⟩ := (GlobalTheory.GLq.trIdem G a χ).2.1 hi
  obtain ⟨m, hm⟩ := (GlobalTheory.GLq.trIdem G a χ).1 ha hchar
  rw [hd, hm]
  positivity
#print axioms one_native_trace
end
end RHTheta
rh_scan GlobalTheory.Top.Lq.admissibleLabelWeights_of_greenCuspidalParametrisation limit 2000
rh_scan GlobalTheory.GLq.Label.squarefree_series limit 2000
rh_prune GlobalTheory.GLq.Label.squarefree_series as RHOriginalSquarefreeSeriesPruned
#print axioms GlobalTheory.Top.Lq.admissibleLabelWeights_of_greenCuspidalParametrisation
#print axioms GlobalTheory.GLq.Label.squarefree_series
```
In actual native producer context after establishing S_f and C membership, instantiate RHTheta.one_native_trace at actual eU/eJ, run rh_reduce 4 using [RHTheta.one_native_trace] on the selected-term goal, and rh_auto 4 / rh_auto_frontier 4 on the actual remaining goal. Record exact open frontier, all generated bridges and #print axioms, including constructor/type/value edges; not a proof until new compiler output exists. Current full native representation module olean environment unavailable here, so no new queue job or fabricated execution. Prior CI only verifies engine/conditional root. Review Q_f expansion's same-character zIdem equality against its native definition before native implementation.

## Actual arithmetic certificate (V8 exact BigInt, executed)
Factor-degree partition tests are algebra controls only (some degree lists not realized over a small field); not fabricated native characters or prime cancellation. For each n=1..16 all partitions, g=2,3,5,7,4099 and k=1,2,4 (scalar identity only, not native rank guards). Checked 914 partitions, 4570 strict B<g^n cases, 63980 algebra checks, 2 negative controls (missing witness or signed extra term). Reproduce:
```js
let parts=0,checks=0,strict=0,controls=0;
function* partitions(n,min=1){if(n===0){yield [];return;}for(let d=min;d<=n;d++)for(const rest of partitions(n-d,d))yield [d,...rest];}
for(let n=1;n<=16;n++)for(const ds of partitions(n)){parts++;for(const q of [2n,3n,5n,7n,4099n]){
 const F=d=>{let r=1n;for(let i=1;i<=d;i++)r*=q**BigInt(i)-1n;return r;};
 const B=ds.reduce((r,d)=>r*(q**BigInt(d)-1n),1n), A=ds.reduce((r,d)=>r*F(d-1),1n);
 const top=F(n), m=BigInt(n*(n-1)/2), G=q**m*top;
 if(top%B!==0n||ds.reduce((r,d)=>r*F(d),1n)!==A*B)throw Error("degree");
 const dim=top/B; if(dim*q**m*B!==G||B>=q**BigInt(n))throw Error("Whittaker");checks+=2;strict++;
 for(const k of [1n,2n,4n]){const coeff=q**k-q**(k-1n);if(dim*coeff*q**m*q*B!==G*q**k*(q-1n))throw Error("Jacquet");checks++;
 for(const extra of [0n,1n,3n]){if((dim*coeff+extra)*q**m*q*q**BigInt(n)<G*q**k*(q-1n))throw Error("lower");checks++;}
 }
}}
if(1n+(-2n)>=1n)throw Error("negative control");controls++;
if(0n>=1n)throw Error("missing witness control");controls++;
console.log({parts,strict,checks,controls})
```
Observed {parts:914,strict:4570,checks:63980,controls:2}. No native trace or asymptotic claim.

RESUME HERE: implement and independently check the native Q_f finite sum and direct block witness transport at admissibleLabelWeights caller (not all Green label theorems); obtain actual pinned native kernel outputs if feasible. If already implemented by another lane, trace actual irrC/CountAllRows producer using authenticated dependency cache and determine if aggregate signed lower count for the GoodAt complement has a supplier independent of local minorant. Keep peer global count and selected-witness work distinct. HANDOFF TO kernel, dependency, formal audit, math, integration. RH OPEN.
