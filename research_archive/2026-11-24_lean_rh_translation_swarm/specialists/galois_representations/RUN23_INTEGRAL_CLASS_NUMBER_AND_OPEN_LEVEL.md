# RUN23 — Integral class number and passage to arbitrary open level
2026-11-25. Status DONE for local source-matched reconstruction; PARTIAL for imported arithmetic and authenticated root dependency; OPEN for full RH. No physics gate changes.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state and continuity/protocol/log excerpts, CI summary, RUN22; inspected 25 recent swarm commit titles and structure/kernel/audit/character-box RESUME notes. No collision found for this task among these records (not exhaustive review of every peer file). Latest observed upstream H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (2026-11-25 04:16:12 UTC), same as RUN22. P=40e56bab026552e089d7afcfeff08d2defb9c005. All paths below are in leanprover-community/riemann-hypothesis; immutable links use github.com/leanprover-community/riemann-hypothesis/blob/PATH_REF/PATH with P or H as PATH_REF. Base directory B=src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/.
Pinned blob receipts:
- src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean: 3091d81ebe36154e6c5198d460346a7be9344e47 (definitions zeroLocusGL, IsGroupLocus, locusSubgroup, ClassNumberFinite). H ebe957f8311e73bad5ff3a1b3d5d4510c9ef3617; namespace body identical.
- B/ClassNumberFiniteHolds.lean: a0e3a4d423be75495b519125cf2e58c0ba5998ba, L11–28, classNumberFinite_holds.
- B/ClassNumberFiniteIntegralLevelClosedSubgroupGL.lean: 1c7fa50047172d65bc70849e8d78da92fd97cce9, classFinite_integralLevel.
- B/IsCompactIntegralPointsFiniteAdelicAlgebraicGrou.lean: 973f8347c5df0d0539dea37c371fd74b8846cc12, continuous_aeval_family, isClosed_of_equations, isCompact_integral_points.
- B/CompactMeetsFinitelyManyLeftCosetsOpen.lean: c281b9efbe85200fb99c98f9d1180457be6ff908, compact_subset_finite_leftCosets.
- B/ClassNumberFiniteIntegralLevelClosedSubgroupGLStatement.lean: 0da26aacfb479d871d9e41214980404773f664d7.
- B/IsCompactIntegralPointsFiniteAdelicAlgebraicGrouStatement.lean: 6489b18fafdad41b2207da3545de470bf5a38c09.
- B/CompactMeetsFinitelyManyLeftCosetsOpenStatement.lean: 206b99898ae3d548ba3afbcd1a29c7426ab5cd07.
The last three are wrappers whose native suppliers are the preceding three substantive files; not new independent axioms. H consolidates all four substantive modules into B/ClassNumberFiniteHolds.lean blob c071ac72a6eecf532e38403f87f2a064f495a44f. The three old supplier paths return 404 at H, but their bodies are recovered using explicit clump member delimiters (not inferred from names).

## 1. Exact claim and stronger local observation
For every number field F, natural n, arbitrary set S of polynomials over F in n² matrix entries, assume its zero locus in GL_n(B) contains identity and is closed under multiplication and inverse for EVERY commutative F-algebra B. Let A be the finite adele ring of F, H(B) the locus subgroup. Let U≤H(A) be open and compact in the induced topology. ClassNumberFinite asserts a finite set T⊂H(A) with every x∈H(A) expressible x=γ_A s u, γ∈H(F), s∈T, u∈U. Here γ_A is the actual matrix-unit map along F→A, not a chosen local approximation. S need not be finite. The proof introduces the compactness premise of U with an anonymous underscore and never uses it. Therefore the same proof gives the stronger statement for arbitrary open U; this is a human consequence of the body, not an independently elaborated Lean theorem. Do not confuse this with compactness of the integral subgroup K, which is essential to the actual proof. No implication that an arbitrary open subgroup is compact.

## 2. Integral-level arithmetic supplier
Define O_A={a∈A: a_v∈O_v for every finite place v}, K={g∈H(A): every entry of g AND of g^{-1} lies in O_A}. The native theorem classFinite_integralLevel supplies T0⊂H(A) finite, x=γ_A s k for k∈K. It is not an assumption of compactness or finite index of K in all H(A).
The body reduces to a rational special-linear algebraic group as follows:
(a) adelic_pair_reduced_basis gives a commutative Q-algebra R, a subring R0, R-algebra structure on A, finite basis b, AdelicPair R R0, IsReduced R, agreement of b with the image of the integral basis of F, and exact equivalence hint: a∈O_A iff all b-coordinates are in R0. This is the substantive finite adele free-basis theorem, not an identification assumed without proof.
(b) exists_isQGroup_weilRestriction_alt gives a rational group locus Γ in a complex special-linear matrix space of size n[F:Q]+1 with an image correspondence hcorr. The underlying representation res_b replaces each matrix entry by its matrix of multiplication; emb_b(g)=diag(res_b(g), det(res_b(g^{-1}))). The additional scalar is the determinant inverse, so determinant is one. The native correspondence is applied twice, at (R,A,b) and (Q,F,integralBasis F). hA.2 uses IsReduced R; do not extend that direction to arbitrary nonreduced rings. hQ.1 and hA.1 lift rational and adelic group points respectively.
(c) finiteAdelicDoubleCosets_of_rational_SL_subgroup gives finite T0'⊂pts Γ R and decomposition emb_b(x)=γ0_R s0 u0, γ0∈pts Γ Q, u0∈pts Γ R integral in R0. This is the deep rational SL class-number input, retained as a supplier, not proved by the compactness argument below.
(d) The proof defines a total lift of a matrix s0 by choosing a preimage with locus property when one exists, else identity. On T0' the correspondence hA.1 guarantees such a preimage, so the fallback is never used there. Use the image of T0' under lift as T0, which remains finite even if choices duplicate.
(e) Lift γ0 via hQ.1 and u0 via hA.1. To descend integrality, first use hint on 1∈O_A. The theorem glFreeAlgebraEmb_integral_and_rational.1 gives all coordinates of entries of u and u^{-1} in R0 from integrality of emb_b(u) and the coordinates of 1. Both directions are needed: integrality of a matrix alone does not imply integrality of its inverse. Apply hint backwards entrywise to obtain k∈K.
(f) The same theorem's second component gives rational base change of emb. Multiplicativity plus injectivity of emb (glFreeAlgebraToSpecialLinearEmb_injective_hom) converts the equality of special-linear matrices back to x=γ_A lift(s0) u. No choice of arbitrary rational representatives and no loss of polynomial equations in descent.

## 3. Compactness is a topological supplier, not class-number finiteness
In continuous_aeval_family, induction on polynomial syntax (constant, add, multiply by variable) proves continuity of each evaluation from continuous matrix entries; for the constant, no topology on F is needed. For isClosed_of_equations assume Hausdorff topological target algebra and finite matrix index. The intersection over every P∈S of evaluation inverse images of {0} is closed. Arbitrary intersection, not merely finite. Thus H(A) is closed in GL_n(A); A is Hausdorff by the restricted-product instance. The imported GLIntegral.isCompact_glSub and AdeleCocompact.isCompact_integral give compactness of the ambient integral matrix-unit set. Its preimage under the closed embedding H(A)→GL_n(A) is compact. A point belongs to this preimage precisely when both its matrix entries and inverse entries are integral at all places. This yields compact K inside H(A). No claim that the entire adelic group is compact, or that compactness alone implies finite double cosets modulo rational points.

## 4. Finite refinement from integral level to U
In any topological group G, let U be open and K compact as a set. For each t∈G, the left coset tU is open as preimage of U by k↦t^{-1}k, and contains t since 1∈U. These form an open cover of K. Compactness supplies finitely many t∈T1 such that each k∈K lies in tU. Then u=t^{-1}k∈U and k=tu. This is exactly compact_subset_finite_leftCosets, using elim_nhds_subcover. No commutativity or normality assumed; order is important.
Apply it with G=H(A). From x=γ_A s k and k=tu, obtain x=γ_A (st)u by associativity. Lean constructs Finset.image₂ of multiplication on T0.attach and T1; T0.attach carries the proof of membership used to make a locus subtype. Equality in subgroup is pushed down via congrArg Subtype.val. Thus the explicit representative set T={st:s∈T0,t∈T1} satisfies |T|≤|T0||T1| (additional elementary consequence, not a Lean conclusion). It is not asserted to be minimal or disjoint. Compactness of U unused; K compact and U open are the topological premises actually consumed. In particular, the result does not imply a finite index [H(A):U], only finite double-coset coverage with H(F) on the left.

## 5. Upstream comparison and actual executed checks
Connector retrieval and V8 source comparisons executed: 6 theorem statement prefixes identical across P/H; 17 anchors present in both corresponding namespace bodies (4+7+4+2). The compact-left-coset namespace is exactly identical; compactness supplier differs by explicit map_add (f := _) argument; integral-level proof has six changed lines replacing five wrapper suppliers by direct native names (integrality/rational theorem used twice); assembly proof has three wrapper→native substitutions. Formal predicate namespace identical. Recovered the relocated bodies from the H clump, resolving these specific old-path 404s. No conclusion about all upstream changes, imported assumptions or kernel replay. This is a source regression check, not an arithmetic certificate for the general class-number theorem.

Reproduce using Python 3 and an upstream checkout containing P and H (script provided for independent replay; equivalent namespace/header/anchor assertions were executed using V8 + connector, not this Python replay):
~~~python
import sys,subprocess
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59"
B="src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/"
spec=[
("ClassNumberFiniteHolds","a0e3a4d423be75495b519125cf2e58c0ba5998ba",["intro F _ _ n S hS U hUo _","Finset.image₂","congrArg Subtype.val hke","simp only [Subgroup.coe_mul, mul_assoc]"],1,3),
("ClassNumberFiniteIntegralLevelClosedSubgroupGL","1c7fa50047172d65bc70849e8d78da92fd97cce9",["hA.2 hred x hx","hQ.1 γ₀ hγ₀","hA.1 u₀ hu₀","T₀.image lift","hint 1","apply hembinj","hunits i j k"],1,6),
("IsCompactIntegralPointsFiniteAdelicAlgebraicGrou","973f8347c5df0d0539dea37c371fd74b8846cc12",["MvPolynomial.induction_on","isClosed_biInter","isClosedEmbedding_subtypeVal.isCompact_preimage","Units.continuous_val.matrix_elem"],3,1),
("CompactMeetsFinitelyManyLeftCosetsOpen","c281b9efbe85200fb99c98f9d1180457be6ff908",["elim_nhds_subcover","t⁻¹ * k"],1,0)]
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def read(ref,path,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
def ns(s): return s[s.index("namespace GlobalTheory"):s.rindex("end GlobalTheory")].strip()
def headers(s): return [x.split(" := by")[0] for x in s.split("\ntheorem ")[1:]]
h=read(H,B+"ClassNumberFiniteHolds.lean","c071ac72a6eecf532e38403f87f2a064f495a44f")
for n,sha,anchors,count,diff in spec:
    a=ns(read(P,B+n+".lean",sha))
    m=B.removeprefix("src/").rstrip("/").replace("/",".")+"."+n
    b=ns(h.split("-- ===== clump member: "+m+" =====",1)[1].split("-- ===== end clump member: "+m+" =====",1)[0])
    assert headers(a)==headers(b) and len(headers(a))==count,n
    assert all(x in a and x in b for x in anchors),n
    al,bl=a.splitlines(),b.splitlines()
    assert sum(x not in bl for x in al)==sum(x not in al for x in bl)==diff,n
    if not diff: assert a==b
f="src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean"
def formal(s): return s[s.index("namespace HeckeCharacterZeroLocus"):s.index("end HeckeCharacterZeroLocus")].strip()
assert formal(read(P,f,"3091d81ebe36154e6c5198d460346a7be9344e47"))==formal(read(H,f,"ebe957f8311e73bad5ff3a1b3d5d4510c9ef3617"))
print("6 theorem headers, 17 anchors, 10 changed lines and unchanged formal predicate")
~~~

## 6. Dependency scope and handoff
Local source reference chain: classFinite_integralLevel + isCompact_integral_points + compact_subset_finite_leftCosets → classNumberFinite_holds → prior RUN21 Borel classes_finite → RUN20 finite adelic cover/finite-dimensional forms → RUN17–19 spectral nonvanishing → RUN16 PlanEx → RUN15 geometric Galois representations → local-global compatibility → EveryCharacter → RH. Only first three edges to classNumberFinite_holds are inspected directly in this run; later route is the previously documented source-level candidate, not newly authenticated Main proof-term reachability. Keep RUN21–22 obligations (GLIntegral existence, gluing, fixed-field, and prior relocated source gaps) open. No demonstrated URT advantage. No Lean kernel execution. CI summary of physical checks read; not evidence of this translation.

RESUME HERE: in P B/FiniteAdelicDoubleCosetsOfRationalSLSubgroup.lean, reconstruct GlobalTheory.ClassFin.cf_of_isQGroup by strong induction on complex span dimension, especially strict dimension drop and distinction between polynomial closure and block image; use recovered H clump member for comparison. Preserve semisimple case cf_of_ss and cf_of_cf_blk_image as explicit outstanding supplier obligations. Request cached role-labelled Main paths for classNumberFinite_holds/classFinite_integralLevel and TorLoc.exists_locus instead of new full archive scans. HANDOFF TO Galois, dependency, acceleration, kernel, editor, literature, audit. Full RH OPEN.
