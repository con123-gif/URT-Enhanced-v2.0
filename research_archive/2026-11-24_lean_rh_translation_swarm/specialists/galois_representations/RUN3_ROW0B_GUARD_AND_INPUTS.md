# Run 3 — exact Row0 to Row0b restriction and CoreAll input ledger

2026-11-24. SOURCE-MATCHED PARTIAL; local elementary implication proved below, not a Lean kernel validation. Pinned upstream leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Read swarm protocol, handoff, expansion, AGENTS, continuity and research log/protocol/state; peer integration 0900, theta/prime/Landau/acceleration/kernel run 3, literature/character/positivity run 2, proof-editor 0856, math depth-zero and dependency/structure notes. Physical CI run 45360853226 PASS unrelated to RH. This is the distinct Galois Row0b frontier, not a repetition of the LLC construction or CoreAll descent.

## Pinned source inventory
Base G = src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/.
- G/TypeConditions/WeightsConjAlt.lean — 486af16ec21e4f8c5a482e1481769093b9448bd4, lines 20–39, 51–73, 85–90.
- G/TypeConditions/WeightsConjBis.lean — 0a1eab0eb68defc45b4e62d19fbfd01dad459344, lines 15–86.
- G/IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean — eebd76fca5538c7a0156cf330cedd4b663b0d70a, lines 157–193.
- G/IntegralStructures/Development.lean — 4d4d9506494734f28fce7d39bac1a50650ecf148, lines 24–31.
- G/IntegralStructures/CrystallineInputs/OfInputs.lean — f400e69e7e620958ac2e9205be7f20107d26b829, lines 6–17.
- G/IntegralStructures/CrystallineInputs/InputsOf.lean — 39070d3b7c9ac51c51d6dc2115ee4f027fc850cc, lines 11–20.
- G/IntegralStructures/CrystallineInputs/Crys.lean — 8f176341db3f423d5ea0f163c814084f7f596a1d, lines 32–62.
- G/IntegralStructures/CrystallineInputs/CoreAllOfRowStarCore.lean — a4054e96f51401b00acb7a5443040abdc94fa549, line 5.
- src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean — ee340012ab19713a8acfecf8adc6a331cbc2f1a4, lines 7–11.

Latest observed main c9883164b0b3d762cee21f889d03d59a53b3ba3b, commit date 09:08:06Z. At that revision WeightsConjBis blob 653245ae7ec15da590ef6e4a22b6f1ef59fc321f retains the guard and Row0.row0b declaration; Development blob 25eb1c9c60978c4e9a8edc0899e84289d74a11a1 retains the final conversion; original RowSrc path 404. No full cross-revision equivalence asserted. Continue on pin.

## Exact human proof (Row0.row0b)
Let Rc be the specified local correspondence predicate (RecNotion), not an arbitrarily chosen map asserted correct. IsQp(w) means there exists a rational prime p and a continuous ring equivalence Q_p ≃ w.adicCompletion E. IsQpBig(w,n) means the SAME existential data, with n=1 or 16n^2<p. Forgetting only the final conjunct gives IsQpBig.isQp. No claim that every local completion is Q_p, or that every rational prime satisfies the bound.

Fix CM field E and algebraic closure Ω, prime l, ring equivalence Qbar_l ≃ C, rank a≥1, cusp π of rank a, and Hecke character χ of its maximal real subfield. Assume regular algebraicity of CG.mk π and PolarizedPair π χ. Row0 Rc supplies a homomorphism r:G(E,Ω)→GL_a(Qbar_l), integer wt and integer multiset family HT indexed by embeddings E→Qbar_l, with Props Rc. Row0b has the identical outer quantifiers and witnesses, replacing only Props by PropsB.

1. Copy continuity and IsSSRep without any change.
2. For every embedding τ, copy the identity HT(τ) mapped to C equals the infinitesimal-character multiset mapped by z↦(a−1)/2−z. Copy the conjugation identity HT(τ∘c)=map(wt−·, HT(τ)).
3. Away from l, keep every place, valuation subring A, IsPlaceOver proof h, Rc h rc and local component σ as in Props.away. Set x=wdOf(h,hl,ι,r), y=rc(algNorm σ). Away.dim gives x.lpDim=y.lpDim; Away.tor gives x=y whenever Tor y and y.mono0. Retain both. For the tame branch, assume IsQpBig(w,y.lpDim), TmW y, Sqf y and y.mono0. Forget the numeric bound to obtain IsQp(w), apply Away.tame0 with the three other assumptions unchanged. This yields x.mono0 and charPol_x(g)=charPol_y(g) for every Weil element g with deg(g)=0. This is Away.big. Do not extend equality to nonzero-degree elements or conclude x=y in the tame case.
4. Above l, retain the quantified local prime P, Ainf AI, Nonempty LocTied, w,A,h, O and all ring/algebra/topology structures, LocBridge Bw and Pst.Induces. Above.crys is copied verbatim: for every spherical local component, crystalline, de Rham and all induced embedding jump identities. Above.nice now assumes ((IsQpBig(w,a) AND TmW y AND Sqf y) OR Tor y) and y.mono0, together with local component and Rc. In the left branch forget the bound to obtain IsQp(w) and retain TmW,Sqf. In the right branch retain Tor, with no large-prime assumption. Apply original Above.nice. Copy de Rham, potentially semistable and all jumps. Apply Away.big to the output comparison for wdAt. This is Props.big.
5. Return the original r,wt,HT and the new record. The original term literally destructures the witnesses of H and returns the same witnesses with k.big Rc. This proves Row0 Rc → Row0b Rc by restriction of hypotheses, not by proving a stronger local comparison.

Tor is the universal commutator-triviality test in Alt:27. Sqf is NOT ordinary square-freeness: for qualifying inertia generators γ (the topological closure condition in Alt:29–33), any root of multiplicity at least 2 must satisfy z^(normV(w)−1)=1. Do not drop the generator condition, or identify this with all roots being simple. TmW and all other source predicates retain their definitions. The rank in AwayB is y.lpDim, while AboveB.nice uses the global rank a.

## Distinguish the alternate direct route
InertCharpoly theorem galois_realisation_of_rank_two (173–190) assumes C:CoreAll, H1:R1 and H2:LocalGlobalCompatibilityAtPlaceClass (Q(w,n)=IsQpBig(w,n)). It constructs Row0b directly; it is not the call in Development.rest. It uses the local correspondence dimension axiom L.dim to identify y.lpDim=a and transport q: IsQpBig(w,y.lpDim) to rank a in the away case; q.isQp supplies the independent IsQp guard. In the above case it duplicates the relevant witness into IsQpBig and IsQp, retains TmW,Sqf or Tor, then uses k4.big. It does NOT assert a=2; the theorem name is not a rank restriction. The actual pinned path is rest→galoisLocalGlobal_of_localGlobalCompatibility→Row0, then Row0.row0b. MainConclusion.everyCharacter_of_row uses h twice in the literature record with recTExists and separately vwin_of_row h. No new downstream theorem is being claimed.

## Separate CoreAll input ledger
OfInputs.Inp is an eleven-field proposition, not a new axiom justified by its name. InputsOf.inp_holds constructs it:
- js: JacquetShalikaRigidity ← PositivityTheory.AdelicQuotientData.jacquetShalikaRigidity.
- gk: GelfandKazhdanDual ← UpperTheory.Gal.AbelianGaloisNormality.gk_holds.
- adm: IrreducibleAdmissibleGL ← UpperTheory.Zero.LLC.Pr.adm.
- len: StandardFunctorsFiniteLength ← PositivityTheory.Tls2.BZGL.standardFunctorsFiniteLength_top.
- exh: LanglandsExhaustionGL ← UpperTheory.Zero.LLC.Pr.exh.
- zel: ZelevinskyPolynomialRing ← UpperTheory.Zero.LLC.Pr.zel.
- gen: GenericUnitaryDualGL ← PositivityTheory.Gud.Fin.genericUnitaryDualGL_holds.
- ac: ArthurClozelStrongTC ← UpperTheory.Gal.AbelianGaloisNormality.strongTC_holds.
- hk: HeckeLAdicCharacterAbove ← Crys.hk.
- alg: AlgebraicCharacterWD ← Crys.alg, combining globalArtinReciprocity_holds, heckeLAdicCharacterDeRham, pst.
- pst: DeRhamPotSemistable ← Crys.pst, GlobalTheory.deRham_potentiallySemistable.

Crys.crys supplies a separate intermediate HeckeLAdicCharacterCrystalline theorem. With the original hypotheses h1,h2,h3, local bridge, induced place and unramified character assumption hu, it obtains local Artin reciprocity, continuous rank-one representation (the unique matrix entry is μ(g)), de Rham from heckeLAdicCharacterDeRham, then potential semistability via pst. The rewrite chain is crystalline ↔ unramified WD (PstLaws.unr_wdAt_iff under the potential semistability evidence), identification by alg, unramified local character via LocLanglands.Test.unr_lpOfChar_iff, and CharCrysModel.isUnram_iff applied to hu. hk combines the de Rham, crystalline and potential semistability statements via heckeLAdicCharacterAbove_of_potSemistable. These are producer references, not independent proofs of all named propositions. CoreAllOfRowStarCore supplies inp_holds to coreAll_of_core_inp. Keep this obligation record visible; no literature theorem is discharged solely by naming it.

## Executed regression and replay
65 text anchors checked against nine actual pinned connector-returned files; all found. Blob SHAs above recorded from connector, not independently rehashed. V8 enumerated ranks 1..50, primes 2..1001 (168 primes), and 16 Boolean combinations of Qp, TmW, Sqf and Tor. All 134400 guard implications succeeded; all 168 rank-one pairs pass the numerical restriction, 7650 higher-rank pairs excluded. This exercises the elementary implication only; it does not evaluate local completions or real WD representations. Strictness negative example rank 2 and prime 3 with Qp true, TmW true, Sqf true, Tor false: original guard true, restricted guard false. This is a propositional negative control, not a constructed automorphic counterexample.

Replay Python (same integer/Boolean test, supplied not executed here):
```python
from itertools import product
from math import isqrt
primes = [p for p in range(2,1002) if all(p%d for d in range(2,isqrt(p)+1))]
cases=rank1=excluded=0
for n in range(1,51):
    for p in primes:
        big=n==1 or 16*n*n<p
        if n==1:
            assert big
            rank1+=1
        elif not big:
            excluded+=1
        for qp,tm,sq,tor in product((False,True),repeat=4):
            weaker_domain=(qp and big and tm and sq) or tor
            original_domain=(qp and tm and sq) or tor
            assert not weaker_domain or original_domain
            cases+=1
assert (len(primes),cases,rank1,excluded)==(168,134400,168,7650)
assert not (2==1 or 16*2**2<3)
```
For source replay git checkout PIN; git hash-object each listed source; check definitions and exact constructor terms at listed lines. No independent Lean execution, exact kernel graph or URT speedup. The local restriction adapter is complete at source-matched level. Producers remain OPEN; no full-proof percentage.

RESUME HERE: follow the actual Crys.alg/hk calls into ThetaCorrespondence/AlgebraicCharacters/AlgebraicCharacterWD.lean and GaloisRepresentations/HeckeDeRham.lean, and the exact heckeLAdicCharacterAbove_of_potSemistable producer. Translate the local character WD normalization, Hodge jumps and precise unramified/crystalline equivalence hypotheses. Coordinate literature lane. Do not repeat the Row0 restriction, CoreAll scope adapter or prime-window induction.
HANDOFF TO: integration, audit, proof editor, literature, theta, character-box. Preserve IsQpBig guard in every downstream parameter-transfer use. No physical files changed.
