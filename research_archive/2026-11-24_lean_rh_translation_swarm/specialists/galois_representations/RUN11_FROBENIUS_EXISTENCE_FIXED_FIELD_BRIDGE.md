# Run 11 — unramified Frobenius existence and the fixed-field bridge
2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the native Frobenius existence producer, its uniqueness/bijectivity, and the exact fixed-field consumer. PARTIAL for MemLoc.frob_laws: the consumer was found, but the declaration body of the fixed-field supplier and FrobLaws.exists_ext was not located in this run. Project OPEN. No kernel replay or URT performance result.

## Continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity, research state/log/protocol (large files inspected in excerpts), Run 10 and recent peer handoffs. Latest physics CI summary PASS 17:24:12Z run 45444228785 (not RH evidence). Read recent theta, integration, dependency, structure, kernel, acceleration, Landau, prime, geometry, literature, audit, math and editor notes; no overlap with their stated frontiers. Character-box current handoff was not recovered (one commit lookup returned 422); previous queue and lane scope were inspected. No changes to physics queue or peer checkpoints. Prior-work ledger: Run 10 established the finite-action-to-open-twist bridge at the source level; it explicitly left the Frobenius fixed-field producer open. This run expands the adjacent existence producer and records the exact remaining leaf rather than treating it as proved by name.

## 1. Native existence theorem (A, lines 12–80)
Let V be a discrete valuation ring and a domain, K its characteristic-zero fraction field, Ω an algebraic closure of K, with compatible V/K/Ω algebra maps and finite residue field k=V/m. The theorem exists_algEquiv_rootOfUnity_eq_pow constructs a K-automorphism φ of Ω such that for ALL x in Ω and natural m with m cast into V outside the maximal ideal, x^m=1 implies φ(x)=x^q, q=|k|. Distinguish the ideal m from the integer m in the notation.

Proof from the native body:
1. Ω/K is Galois. Let R be the integral closure of V in Ω, with its discrete topology and the induced action of Gal(Ω/K). The action is continuous: every integral element is algebraic over K and its stabilizer is open. The action commutes with V-scalars.
2. Invariants of R are precisely V: a fixed element lies in K by infinite Galois fixed-field theory; it is integral over V, hence belongs to V because a DVR is integrally closed. Faithful scalar action follows from the injective maps V -> K -> Ω.
3. Choose a maximal ideal Q of R lying over the maximal ideal of V by integrality. The extension R/Q over k is algebraic. The finite-field q-power Frobenius is an automorphism of this algebraic residue extension. Apply the native dependency Ideal.Quotient.stabilizerHom_surjective_of_profinite to lift that automorphism to σ in the stabilizer of Q. This is an essential theorem, not a conclusion obtained by choosing an arbitrary Galois element. The resulting element is arithmetic Frobenius at Q.
4. A root x of x^m=1 with m outside the maximal ideal has m>0 (zero is in the ideal), is integral, and the image of m in R lies outside Q since Q lies over the given ideal. The imported AlgHom.IsArithFrobAt.apply_of_pow_eq_one upgrades congruence to exact equality on prime-to-residue-characteristic torsion. It yields σ(x)=x^q. This proof does not claim equality on arbitrary integral elements: the root condition and unit-order guard are essential.

The imported profinite surjectivity and exact lifting theorem bodies are separate obligations; no kernel or axiom inspection here.

## 2. Specialization and uniqueness (A 82–105; B 66–79)
Take l prime, V=Z_l, K=Q_l, Ω=Om l. The residue field is ZMod l, of size l. The kernel of reduction is the maximal ideal and the image of m is zero exactly when l divides m. Thus the preceding φ satisfies φ(ζ)=ζ^l for every positive-order prime-to-l root in Ω.

Let U=MaximalUnramifiedExtension l, the intermediate field generated over Q_l by the roots ζ with ζ^m=1, m>0, l not dividing m. A K-automorphism maps such roots to roots of the same admissible exponent. The native proof uses IntermediateField.adjoin_map and adjoin.mono to show φ(U) lies in U; codRestrict gives a K-algebra endomorphism F of U satisfying F(ζ)=ζ^l. This is exists_frobenius_Kur. By kur_algHom_ext, two K-algebra homomorphisms on U that agree on every generating root agree everywhere (the exact codomain hypotheses are Semiring B and Algebra Q_l B). The source frobUr is the chosen F, frobUr_root its property, and frobUr_bijective uses Algebra.IsAlgebraic.algHom_bijective. This proves existence, uniqueness and bijectivity, not merely the action on residue classes.

The extension needed by the consumer also follows independently from this construction: the specific φ constructed in A restricts to the chosen F, by uniqueness. This is a human derivation for this specific F, NOT a retrieval of the native general theorem FrobLaws.exists_ext. Alternatively a K-embedding of an intermediate field into an algebraic closure extends to an automorphism of Ω by the algebraic closure extension theorem.

## 3. The exact consumer (C 21–39)
Let S be an open subgroup of Gal(Ω/K). Assume:
h1: every g fixing every element of U lies in S;
h2: every g restricting to F=frobUr on U lies in S.
Then S is the whole Galois group. The source uses openness to obtain closedness (open subgroups are closed). For x in Ω fixed by all of S, h1 and infinite Galois correspondence imply x∈U. Choose g extending F by FrobLaws.exists_ext. By h2 g∈S, so x=F(x). The source then calls (MemLoc.frob_laws l F frobUr_root).2.2 to conclude that x is the image of an element of K. Therefore the fixed field of S is K; closed-subgroup Galois correspondence implies S=Gal(Ω/K). No density assumption on S is substituted for closedness.

For clarity, the standard human proof of the fixed-field property is as follows, with the classical unramified cyclotomic theorem explicitly retained as an input (not source-bound yet): each x∈U lies in a field generated by a finite list of admissible roots, hence in K(μ_m) for m the lcm of their orders (m=1 if the list is empty). The lcm is positive and coprime to l. The classical local cyclotomic theorem states K(μ_m)/K is finite unramified Galois, degree ord_m(l) for m>1, and the arithmetic Frobenius ζ↦ζ^l generates its Galois group. Thus x fixed by F is fixed by that full finite Galois group and lies in K. For m=1 the field is already K. The reverse inclusion follows because F is a K-algebra map. This is a conditional human expansion of the missing .2.2 result, NOT evidence that the native producer follows this exact route or that its other conjuncts are known. The native source of the local cyclotomic theorem or the alternate actual proof must be found before marking this leaf source-matched.

Two pitfalls: bijectivity of F alone does not imply its fixed field is K (identity is a counterexample on a nontrivial extension). Agreement on all prime-to-l roots, not just one selected root of unity, is necessary for the generator argument. The field here is the algebraic unramified extension inside Ω, not its completion.

## 4. Connection to the nonvanishing path
A.exists_algEquiv_rootOfUnity_eq_pow -> A.exists_frobenius_Kur -> B.frobUr/root/bijective; B.kur_algHom_ext gives uniqueness. C.eq_top_of_isOpen additionally invokes FrobLaws.exists_ext and frob_laws .2.2 -> C.exists_isTwist (with Run 10 isOpen_twistGroup) -> ChCoef and rank-one character normalization -> local Weil–Deligne parameters -> earlier CoreAll/Row0b/parameter/window/nonvanishing chain. This is a source reference map, not authenticated elaborated dependency reachability. The native producer of frob_laws, its complete conjunction and imported dependencies remain open; request exact tagged type/value witness for GlobalTheory.MemLoc.frob_laws, GlobalTheory.MemLoc.FrobLaws.exists_ext, GlobalTheory.MemLoc.exists_frobenius_Kur, and GlobalTheory.Pst.BridgeParam.eq_top_of_isOpen from dependency/kernel lanes.

## 5. Source provenance and actual checks
Repository leanprover-community/riemann-hypothesis. Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream latest returned commit H=307cef33f046955ee79dba47e0d828d06496d75f (merge PR #1266, batch 7). Do not replace pin.
A src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsAlgEquivRootOfUnityEqPow.lean
 P blob 860fbead9d52bcf746afad713860a60ea78e5cc5; H d9985abba5ca550d735edb66f7e04fd98bdc3bbf.
B src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean
 P 21a02daf0f36829d50c3c4243c10e36a9bd311d9; H dcbcc4dbbf8d4018f934fc09b2da07716608f63f.
C src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean
 P ffdce791714cb11064760245f465f9ba78449bbc; H 6e6f30ca2a8b1428043c1212f4c75896a3c5d747.
Direct import witness: C via FiniteDimensionalFilDR -> FiniteDimensionalWdSpace -> FiniteDimensionalLetter -> B -> LocalPrimeGaloisActionPeriodT -> A. Pinned import bridge LocalPrimeGaloisActionPeriodT blob a8ea7e2814d271ced2abef4cf4d3edfb57c61ca6. DataN, DataNLoc, IsCrisP, LocTied and related imports inspected; filename-tree search and default-branch code search for frob_laws/FrobLaws did not locate the producer. This is a retrieval limitation, not an assertion that the theorem is missing from the repo.
Actually executed in JavaScript with GitHub connector: 16/16 exact substring anchors in pinned snapshots; seven declaration slices compared through first blank line, six byte-identical and one changed. Line pairs A existence 12->62 (changed), specialization 82->132 (identical); B ext 66->111, frobUr 72->117, root 74->119, bijective 77->122 (all identical); C eq_top_of_isOpen 21->65 (identical). Entire A/B/C files changed. The one changed body has NOT been reviewed for semantic equivalence. No synthetic numerical tests counted as evidence. No Lean executable run; no axioms audit or URT benchmark. The following reproducible check uses a local checkout with both commits, Python stdlib. Equivalent to executed JS assertions and slice comparisons, not separately run in Python.

```python
import subprocess, sys, re
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="307cef33f046955ee79dba47e0d828d06496d75f"
base="src/Development/AbelianVarietyTheory/"
files=[
("Proofs/IwasawaDecomposition/ExistsAlgEquivRootOfUnityEqPow.lean",
 "860fbead9d52bcf746afad713860a60ea78e5cc5","d9985abba5ca550d735edb66f7e04fd98bdc3bbf",
 ["Ideal.Quotient.stabilizerHom_surjective_of_profinite","FiniteField.frobeniusAlgEquivOfAlgebraic","AlgHom.IsArithFrobAt.apply_of_pow_eq_one","PadicInt.residueField","PadicInt.ker_toZMod","IntermediateField.adjoin_map","codRestrict"],
 ["exists_algEquiv_rootOfUnity_eq_pow","exists_frobenius_Kur"],[False,True]),
("Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean",
 "21a02daf0f36829d50c3c4243c10e36a9bd311d9","dcbcc4dbbf8d4018f934fc09b2da07716608f63f",
 ["IntermediateField.adjoin_algHom_ext","exists_frobenius_Kur l).choose","exists_frobenius_Kur l).choose_spec","Algebra.IsAlgebraic.algHom_bijective"],
 ["kur_algHom_ext","frobUr","frobUr_root","frobUr_bijective"],[True]*4),
("Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean",
 "ffdce791714cb11064760245f465f9ba78449bbc","6e6f30ca2a8b1428043c1212f4c75896a3c5d747",
 ["S.isClosed_of_isOpen hopen","InfiniteGalois.fixedField_fixingSubgroup","GlobalTheory.MemLoc.FrobLaws.exists_ext","GlobalTheory.MemLoc.frob_laws","IntermediateField.fixingSubgroup_bot"],
 ["eq_top_of_isOpen"],[True])]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def decl(s,n):
    ls=s.splitlines()
    i=next(i for i,l in enumerate(ls) if re.match(r"^(theorem|def) "+n+r"(?: |:)",l))
    j=i+1
    while j<len(ls) and ls[j].strip(): j+=1
    return i+1,"\n".join(ls[i:j])
for path,ps,hs,anchors,names,flags in files:
    path=base+path
    for rev,sha in [(P,ps),(H,hs)]:
        assert git("rev-parse",rev+":"+path).strip()==sha
    p,h=(git("show",r+":"+path) for r in (P,H))
    for a in anchors: assert a in p,a
    for n,flag in zip(names,flags):
        i,a=decl(p,n); j,b=decl(h,n)
        assert (a==b)==flag,n
        print(n,i,j,flag)
print("16 pinned anchors; six unchanged, one changed declaration slice. Not Lean validation.")
```

## RESUME HERE
Obtain authenticated source location of GlobalTheory.MemLoc.frob_laws and FrobLaws.exists_ext from the dependency/kernel export or targeted import walk, expand every conjunct and the actual fixed-field proof rather than assuming the classical cyclotomic theorem above is the native route. Review the changed upstream A declaration separately, then EmbOrbitAlt. Do not redo the Frobenius existence construction; preserve the imported profinite lifting and root exactness as explicit dependencies. HANDOFF TO Galois, dependency, kernel, integration, editor, audit, theta and literature. Project OPEN.
