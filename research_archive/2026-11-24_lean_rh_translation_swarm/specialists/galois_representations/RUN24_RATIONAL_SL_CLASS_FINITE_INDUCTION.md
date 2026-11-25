# RUN24 — Rational SL class-number finiteness by strict span descent
2026-11-25. RESULT: DONE for source-matched local induction and dimension-drop reconstruction; PARTIAL for semisimple and block-image lifting suppliers and signed Main path. RH OPEN.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN23, state/log/protocol/continuity excerpts, CI summary (45559002341 at f6b396a, physical checks only). Inspected 35 recent swarm commit titles and theta, dependency, acceleration, integration, character-box and audit handoffs. No duplicate of this induction found in inspected records; not an exhaustive peer/blueprint reread. Pinned upstream P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=a18a350c3e5aad997766cff2670b292313e46574, merge dated 2026-11-25 05:32:50 UTC; compare API reports 269 ahead, 0 behind previous H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59. Do not mix revisions in a single proof. All paths below refer to leanprover-community/riemann-hypothesis, B=src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/ and D=src/Development/AbelianVarietyTheory/Definitions/AdelicHermitianForms/.

Pinned source blob receipts (immutable source links are https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ followed by the full path):
- D/AdelicPair.lean 0c2bf965c53c2f1dc4520963b11773d5ef32c9cd (definitions).
- B/FiniteAdelicDoubleCosetsOfRationalSLSubgroup.lean 2ca478eab0f6b4983edfdd9a425abdaeda94578b (cf_congr_of_vanI_eq, cf_of_isQGroup).
- B/FinrankSpanBlockDiagPartImageLt.lean a761f7aae4c20c1ec8c69cb129fa0ee5f2316068 (finrank_span_blk_image_lt).
- B/RatZariskiClosureOfAutStableSLGroup.lean e1dde3e3ec0a1e262292f36250018ead6f60818b (RatClosure.ratClosure and local lemmas).
- B/ExistsRatIdempotentBlockDiagPartKillsSpan.lean cc9d57e98214fea4e87f7a40e63e1001827075fe (exists_rat_idempotent_blk_eq_zero).
- B/IsAutStableSLMatrixGroupImageBlockDiagPart.lean 902e0ae69b89c861ac5e3945d6cee0abebeb8b42 (isPre_blk_image).
- B/InvariantSubspaceNotSemisimple.lean 60fdc9233cf5c7738c0c45a09958b17d07f01d8a (exists_socle_radical_of_not_ss).
- B/ExistsRatIdempotentOfAutStableSubspace.lean 14355e2ba315377af51fb168f674c19d26305895 (exists_rat_idempotent_of_stable).
- B/ClassFinitenessCompletelyReducibleStatement.lean 0dfd656bd8ecfac48c287d578b07c1aa0d981d18 → B/ClassFinitenessCompletelyReducible.lean 6d6bc03b5b22569786d3664c9a19d62669de4713 (cf_of_ss).
- B/HasFiniteAdelicDoubleCosetsOfBlockDiagPartImageStatement.lean 9bb6090507f88ad55a2a797bec2b1604bf6bd422 → B/HasFiniteAdelicDoubleCosetsOfBlockDiagPartImage.lean d46ebb292246f60de1dbbc423f51bbd8ae9c961e (cf_of_cf_blk_image).
H consolidates the induction, dimension, closure, idempotent modules in B/ClassNumberFiniteHolds.lean c071ac72a6eecf532e38403f87f2a064f495a44f. Direct old induction path 404. Exact clump delimiters used. IsAutStableSLMatrixGroupImageBlockDiagPart is listed in H directory but direct retrieval returned 404; H AdelicPair definition retrieval also 404. Do not infer changes to either.

## 1. Definitions and exact theorem
Fix a finite decidable index type iota and a set G of complex square matrices. vanI(G) consists of rational polynomials in matrix entries vanishing on every g in G. pts(G,S) for any commutative Q-algebra S is their common zero locus in matrices over S. IsPre(G) requires identity, multiplicative and adjugate closure, determinant one and invariance under ALL field automorphisms of C; this is not just complex conjugation. IsQGroup adds pts(G,C) subset G. SS(G) means every G-invariant complex subspace has a G-invariant complement. AdelicPair(R,R0) requires R a commutative Q-algebra, R0 a subring, rational numbers mapping into R0 to be integers, and for every positive natural M and r in R, a rational q and a in R0 with r=q_R+M a. No field, reducedness, or topology on R is assumed here.

CF(G,R,R0) means a finite set T of points of pts(G,R) such that each x in pts(G,R) equals gamma_R s u, with gamma in pts(G,Q), s in T, u in pts(G,R) and every entry of u in R0. The defining predicate does not require separately integral inverse entries; the determinant-one property supplies them via adjugates when needed. cf_of_isQGroup asserts CF for every IsQGroup G and every AdelicPair. This is not the special-linear class-number-one theorem; T may contain more than one element.

## 2. Source-matched induction
Fix the matrix index type and let n=dim_C span_C G. Strengthen the induction statement to quantify over ALL G and R,R0 with the prescribed n (necessary to apply the IH to a different group). Strong induction on n. If SS(G), invoke cf_of_ss with IsQGroup and AdelicPair unchanged. Otherwise:
1. exists_rat_idempotent_blk_eq_zero supplies rational e with e²=e, FgE=0 for every g in G where E=e_C and F=1-E, and a nonzero a in span G killed by L(x)=ExE+FxF.
2. isPre_blk_image supplies IsPre for B=L(G). It is essential that the block projection be multiplicative on the triangular subset, not on all matrices.
3. RatClosure.ratClosure supplies Q=pts(B,C) with IsQGroup(Q), vanI(Q)=vanI(B) and span Q=span B. Q is a rational polynomial closure of the block image, not assumed equal to B.
4. finrank_span_blk_image_lt proves dim span B < n. Consequently dim span Q < n. Strong IH on Q, the same R,R0 and the unchanged AdelicPair gives CF(Q,R,R0).
5. cf_congr_of_vanI_eq: equality of the defining rational polynomial sets implies pts(Q,S)=pts(B,S) for EVERY Q-algebra S by unfolding pts. Unfold CF, use S=R,Q (here Q in field notation means rationals), obtain CF(B,R,R0). No claim that all points of the abstract image are lifts.
6. cf_of_cf_blk_image lifts CF(B,R,R0) to CF(G,R,R0) using IsQGroup G, rational idempotence, upper-block condition and AdelicPair. This is a substantive arithmetic supplier, not implied by surjectivity or by strong induction alone.

## 3. Why the dimension strictly drops
Let S=span_C G. Multiplication by fixed E,F on both sides is C-linear; hence L(S)=span_C L(G). Restrict L to S: f:S→Mat_iota(C). The witness a belongs to ker f and is nonzero, so ker f has dimension at least one. The native code identifies range f=S.map L, proves ker f != bottom, obtains positive finrank and applies LinearMap.finrank_range_add_finrank_ker. Thus
    dim span L(G) = dim S - dim ker f <= dim S - 1.
The equality of complex spans under rational closure is indispensable; mere inclusion B⊆Q would not bound Q from above. In RatClosure.ratClosure, B⊆pts(B,C) and vanI_pts follow directly from definitions. The group properties of the closure are imported via pts_group, its automorphism stability uses rational coefficients, and its closedness follows from vanI_pts. For the span reverse inclusion, take any linear functional annihilating span B, write it as a degree-one complex polynomial using the matrix-unit basis, then apply evC_eq_zero_of_mem_pts_of_stable (in P through wrapper) to extend its vanishing from B to its rational closure. Finite-dimensional dual annihilator separation implies each closure point belongs to span B. Retain both imported suppliers; vanishing of a general complex polynomial on the rational closure is NOT automatic without the stated stability/descent hypothesis.

Additional elementary consequence: along the successive nonsemisimple induction calls, n drops by at least one, giving at most n initial nonsemisimple descents and n<=|iota|². This bounds the recursion depth, NOT proof search, bit complexity, computation time or the number of double cosets. The Lean argument is nonconstructive and uses deep suppliers. No URT improvement.

## 4. Origin of the killed vector and rational projector
Native exists_socle_radical_of_not_ss (inspected final declaration): the span algebra A=span_C G is finite-dimensional and hence Artinian. If its Jacobson radical J were zero, the Artinian semisimple ring theorem and ss_of_isSemisimpleRing would imply SS(G), contradiction. Nilpotence of J supplies a nonzero a in J with J a=0. Define W={v: Jv=0}. This is a subspace, G-stable because bg lies in J for b∈J,g∈G. It is stable under every complex field automorphism using the induced surjective automorphism of the span algebra and preservation of the Jacobson radical. Then aV⊆W by J a=0, and aW=0 because a∈J. The Artinian, nilpotence and semisimplicity facts are explicit dependencies, not independently reconstructed in this run.

exists_rat_idempotent_of_stable obtains W_Q={q∈Q^iota:q_C∈W}, chooses a rational complement, and projects onto W_Q. Rational span descent (galoisStable_submodule_le_span_rational) guarantees that W is spanned over C by such rational vectors. The complex extension E of the rational projector therefore has image W and fixes W pointwise. No G-invariant complement is assumed; indeed G is not SS. Hence FgE=0 by invariance, EaE=0 since aW=0, and FaF=0 since aV⊆W. Their sum L(a)=0. This proves precisely the rank-nullity witness; it does not assert L(g)=0 for any g in G (all are invertible).

For block image closure, with E²=E, F=1-E, EF=FE=0 and FgE=FhE=0, insert E+F between g,h. Then EghE=EgEhE, FghF=FgFhF and L(gh)=L(g)L(h). L(1)=1. Since g and adj(g) are in G, L(g)L(adj(g))=1. In a basis for im E⊕ker E, g is upper triangular by blocks, so det g=det L(g)=1; native proof instead uses determinant of 1+off-diagonal product and det_one_add_mul_comm, avoiding a basis choice. It follows L(adj(g))=adj(L(g)), using det one. Rationality of E ensures L commutes with all complex field automorphisms, yielding IsPre(B). This does not establish Zariski closedness of B, which is why step 3 is needed.

## 5. Actual source checks and replay
Executed connector retrieval and V8 namespace comparisons on four recovered P/H clump members: 8 matched declaration header prefixes (2+1+4+1), dimension-drop namespace exactly identical, and the entire induction namespace identical after exactly six wrapper-to-native replacements. Closure member has three changed lines (two direct suppliers and explicit map_add argument). Idempotent member has two changed lines (direct supplier names). Header-prefix check is textual, not elaborated equality. 11 changed lines across these four modules. Pinned fifth native block-image module inspected but H retrieval unavailable; not counted in comparisons. Both final arithmetic suppliers were actually fetched at P and inspected at their final declaration, not just guessed from wrappers. No Lean kernel execution; source regression only. CI status of unrelated physical checks is not evidence for this result.

Reproduce via Python 3 with local upstream checkout containing both revisions. Equivalent header and normalization comparisons executed in V8; this Python replay was not run here.
~~~python
import sys, subprocess, re
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="a18a350c3e5aad997766cff2670b292313e46574"
B="src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/"
spec=[
("FiniteAdelicDoubleCosetsOfRationalSLSubgroup","2ca478eab0f6b4983edfdd9a425abdaeda94578b",2,6),
("FinrankSpanBlockDiagPartImageLt","a761f7aae4c20c1ec8c69cb129fa0ee5f2316068",1,0),
("RatZariskiClosureOfAutStableSLGroup","e1dde3e3ec0a1e262292f36250018ead6f60818b",4,3),
("ExistsRatIdempotentBlockDiagPartKillsSpan","cc9d57e98214fea4e87f7a40e63e1001827075fe",1,2)]
def git(*a): return subprocess.check_output(["git","-C",sys.argv[1],*a]).decode()
def read(ref,path,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
def ns(s): return s[s.index("namespace GlobalTheory"):s.rindex("end GlobalTheory")].strip()
def headers(s): return re.findall(r"^(?:private lemma|theorem) ([\s\S]*?) := by",s,re.M)
h=read(H,B+"ClassNumberFiniteHolds.lean","c071ac72a6eecf532e38403f87f2a064f495a44f")
repl={
"GlobalTheory.T.classFiniteness_completelyReducible":"_root_.GlobalTheory.ClassFin.cf_of_ss",
"GlobalTheory.T.exists_rat_idempotent_blockDiagPart_kills_span":"_root_.GlobalTheory.ClassFin.exists_rat_idempotent_blk_eq_zero",
"GlobalTheory.T.isAutStableSLMatrixGroup_image_blockDiagPart":"_root_.GlobalTheory.ClassFin.isPre_blk_image",
"GlobalTheory.T.ratZariskiClosure_of_autStable_SL_group":"_root_.GlobalTheory.ClassFin.RatClosure.ratClosure",
"GlobalTheory.T.finrank_span_blockDiagPart_image_lt":"_root_.GlobalTheory.ClassFin.finrank_span_blk_image_lt",
"GlobalTheory.T.hasFiniteAdelicDoubleCosets_of_blockDiagPart_image":"_root_.GlobalTheory.ClassFin.cf_of_cf_blk_image"}
for n,sha,num,diff in spec:
    a=ns(read(P,B+n+".lean",sha))
    m=B.removeprefix("src/").rstrip("/").replace("/",".")+"."+n
    b=ns(h.split("-- ===== clump member: "+m+" =====",1)[1].split("-- ===== end clump member: "+m+" =====",1)[0])
    assert headers(a)==headers(b) and len(headers(a))==num,n
    al,bl=a.splitlines(),b.splitlines()
    assert sum(x not in bl for x in al)==sum(x not in al for x in bl)==diff,n
    if not diff: assert a==b
    if n==spec[0][0]:
        for old,new in repl.items(): a=a.replace(old,new)
        assert a==b
print("8 header prefixes; 11 changed lines; induction equal after six substitutions")
~~~

## 6. Path and handoff
Direct source chain this run: cf_of_ss OR (rational idempotent → IsPre block image → rational closure + strict dimension descent → induction → vanI transfer → cf_of_cf_blk_image) → cf_of_isQGroup. Prior RUN23 connects to classFinite_integralLevel → classNumberFinite_holds; RUN21–22 to Borel classes_finite, RUN20 finite-dimensional forms, RUN17–19 spectral trace, RUN16 PlanEx, RUN15 Galois representation, local-global and EveryCharacter. This remains a candidate source-level route, not newly authenticated value-role reachability from Main. Request shared cached signed-root paths for GlobalTheory.ClassFin.cf_of_isQGroup, GlobalTheory.ClassFin.cf_of_ss, GlobalTheory.ClassFin.cf_of_cf_blk_image, classFinite_integralLevel, classNumberFinite_holds and TorLoc.exists_locus; do not duplicate full artifact scan. Current dependency RUN24 NEXT batch does not include these IDs.

RESUME HERE: reconstruct native B/HasFiniteAdelicDoubleCosetsOfBlockDiagPartImage.lean cf_of_cf_blk_image, specifically polynomial section over every Q-algebra, square-zero kernel, rational approximation with K2*Kc*K1 denominator control, and finite integral congruence refinement. Read complete proof including final factorization beyond currently inspected prefix. Preserve cf_of_ss (tensor stabilizer closed orbit, integral classes, special-linear class-number-one), rational descent, and closure group suppliers as outstanding. HANDOFF TO Galois, dependency, acceleration, kernel, editor, audit. RH OPEN.
