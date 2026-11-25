# RUN22 — Explicit polynomial group locus for arithmetic similitudes
2026-11-25. SOURCE-MATCHED local reconstruction; RH OPEN. Continues RUN21 (041ef5dfe0587df4ce2e026addb86ada0cb22a93). Preflight: AGENTS, swarm protocol, handoff, expansion, research-state/log/protocol and continuity excerpts, CI checkpoint #417 at 04:19:58Z (physics only, not Lean), prior RUN21 full, recent 25 commit titles and peer RESUME HERE excerpts from 15 commit patches (editor patch did not expose handoff). No competing TorLoc task observed. Integration owns index-two extension; dependency owns next authenticated projections. External linked blueprint and every full peer file not reread. No physics queue/gate changes.

## Source provenance
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005; H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, latest observed 2026-11-25 04:16:12 UTC, merge PR #2057. Previous H=fcb6eac7534875d32d68030967e2deae6d686151.
- D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/
- D/PolynomialZeroLocusCoordinates.lean: P blob 9f53cdb64b8e02e9776d9bc8b3084a49f8b7b6de; H blob e8e20f8148de75390c715a60014e3b4983477d90. P 519 lines, H 563. All line numbers below are P.
- D/TC.lean: P acd3572dbe7bd22e5219b8c255f0071fb179234b, L10–16, exact predicate.
- src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean: P 3091d81ebe36154e6c5198d460346a7be9344e47, L7–34; defines zeroLocusGL, IsGroupLocus, locusSubgroup, ClassNumberFinite. The definition of the latter is not a proof.
- RUN21 records P BorelFiniteClassNumberCentraliserTorus.lean eb0e8b871942dc286ed3a608e0d9f85586487764, classes_finite, which consumes this representation theorem via hbr. Wrapper PolynomialZeroLocusCoordinatesStatement.lean P 8de31dde746277b27c2808acb32d3682964f98ca (prior run).

## 1. Exact statement and scope (exists_locus, 476–516)
For every finite-dimensional unital Q-algebra D, ring hom sigma:D→D^op, and beta,y in D, there exist N, a set S of rational polynomials in N² matrix entries, a proof hS that its zero locus inside GL_N(R) is a subgroup for every commutative Q-algebra R, and a family of group homomorphisms phi_R from this subgroup into (R⊗D)^× × R^×. The family is injective with range exactly TC_R, natural under every Q-algebra hom f:R→R', and continuous for every topological commutative Q-algebra R with IsTopologicalRing R and the module topology on R⊗D. No positivity, semisimplicity, involutivity of sigma, invertibility of beta or y, field property of R, or injectivity of f is assumed. The finite-dimensional hypothesis is on D over Q; base-changed algebra A=R⊗D is finite free over R. Write a* for unop(starT(sigma,R,a)), an additive anti-multiplicative map obtained by extension of sigma. Write B=1⊗beta and Y=1⊗y. TC_R is the pair of conditions aBa*=cB and aY=Ya on UNITS (a,c). c acts centrally via algebraMap. Invertibility is built into the ambient GL, not an extra polynomial equation.

## 2. Faithful coordinates (Defs 18–76)
Set d=dim_Q D, N=d+1, and use the base-changed rational basis e_i of A. Let L(a) be the matrix of left multiplication by a; L(ab)=L(a)L(b), and L(1)=I. Embed the product ring A×R via
    b(a,c)=diag(L(a),c)
(reindexed from Fin d ⊕ Fin 1 to Fin(d+1)). The source blk proves one, multiplication, zero and addition using block identities. For any matrix X, define a(X) by the coordinates X_11 [1]_e, and c(X)=X_22 (the 1×1 bottom-right entry). Equivalently a(X)=sum_i(sum_j X_ij [1]_j)e_i. The basis need not begin with the identity. Since L(a)[1]=[a], a(b(a,c))=a and c(b(a,c))=c. Thus blk is injective. This also shows why simply reading the first matrix column is not justified for the arbitrary finBasis used in Lean.

## 3. Natural polynomial equations (Nat 88–134; Cond 146–204; Main 309–329)
Let F_f=f⊗id. On pure tensors r⊗m, the coordinates transform by applying f to the coordinates (r times rational basis coefficients). Zero and addition extend the identity to all tensors. Consequently L(F_f(a))=f(L(a)) entrywise, and the two coordinates a(X),c(X) commute with base change. The proof for a(X) uses F_f(1)=1 and finite sums. The extended star commutes with F_f by tensor induction; hence the form error aBa*−cB and commutator aY−Ya commute with base change.

Take the universal N×N matrix U=(X_ij) over Q[X_ij]. Set S to the range of cond on U, with exactly three indexed families:
1. all N² entries of X−b(a(X),c(X));
2. all d basis coordinates of a(X)Ba(X)*−c(X)B;
3. all d basis coordinates of a(X)Y−Ya(X).
Evaluation of each universal polynomial at any matrix over any R equals the corresponding concrete condition by cond_map and aeval_cond, not by an argument only for field-valued points. The matrix vanishes iff every entry vanishes, and a vector vanishes iff all its basis coordinates do. Thus cond_zero_iff is an equivalence, and mem_zeroLocus_iff transports it to the locus. Additional explanatory bound (derived from these definitions, not an explicitly stated Lean conclusion): S is finite with at most (d+1)^2+2d distinct polynomials, all of degree at most 2. The coordinate maps are linear with rational coefficients; multiplication by fixed B,Y and star are linear; the quadratic term is aBa*. The range can contain duplicates or zero polynomials. No claim of minimal generators or dimension of the locus.

## 4. Unit extraction is not automatic in a general algebra (Units 216–253; Main 333–358)
Given b(a,c)Z=I, undo reindexing and take the upper-left block M and lower-right scalar z of Z. Then L(a)M=I and cz=1. Because R is commutative and matrices are finite square, a one-sided matrix inverse is two-sided (determinant/adjugate argument, including the zero-ring convention, or the source mul_eq_one_comm). Define a' by [a']=M[1]. Then [aa']=L(a)M[1]=[1], so aa'=1. To obtain the second inverse relation, L(a)L(a')=I; direct finiteness of matrices gives L(a')L(a)=I; injectivity of the regular representation gives a'a=1. The source explicitly constructs both inverse identities e1 and e2 in the unit. The scalar c is a unit by commutativity. This does not assert one-sided inverses are two-sided in arbitrary infinite-dimensional noncommutative rings.
Now a matrix g in the polynomial locus in GL has g=b(a(g),c(g)); multiply by its known inverse to apply unit extraction. The form and commutation errors give TC. Conversely if (a,c) is a TC pair of units, b(a,c) is a unit and all three condition families vanish by coordinate recovery. This is mem_locus_iff, an exact two-way characterization.

## 5. Subgroup (Units 257–298; Main 360–394)
Identity satisfies TC. For TC pairs (a,c),(a',c'), anti-multiplicativity and central scalars give
    (aa')B(aa')* = a(a'Ba'^*)a* = c' aBa* = (cc')B.
Products of commuting-with-Y elements commute with Y. Inversion: a^{-1}(aBa*) (a^{-1})* = B because a* (a^{-1})*=1. Substitute aBa*=cB, move central c, multiply by c^{-1}, giving a^{-1}B(a^{-1})*=c^{-1}B. Commutation with Y is preserved by inverse of the unit. No cancellation of B and no assumption star squared is identity.
These prove tc_one, tc_mul, tc_inv, then isGroupLocus via mem_locus_iff. Restrict b on units to the TC subgroup, yielding psi_R. Injectivity follows from blk_injective plus unit/subtype extensionality; surjectivity follows from the characterization. Hence psi_R is a group isomorphism onto the locus, and phi_R is its inverse followed by the TC subgroup inclusion (396–417). In particular b(phi_R(g))=g and the two components of phi are exactly a(g),c(g) as units. This supplies both injection and the exact range equivalence, not merely containment.

## 6. Naturality and topology (Final 428–472; exists_locus 503–516)
If g' is the entrywise image of g under f as matrix units, the coordinate equalities from Section 3 and unit extensionality identify phi_R'(g') with the componentwise images of phi_R(g). No surjectivity or injectivity of f is used.
The module topology ensures continuous addition and scalar multiplication. a(X) is a finite linear combination of entry projections times fixed basis vectors; c(X) is one entry projection. Both continuous. To prove continuity into the unit group, the source checks BOTH forward and inverse coordinates, since the topology on units is induced by value and inverse value. Apply the coordinates to the continuous matrix value of g and to the continuous matrix inverse of g, and use phi(g^{-1})=phi(g)^{-1}. This proves continuous_phi on both unit components and then on the product. It does not infer continuity of an arbitrary inverse map from bijectivity. Finally choose the module topology explicitly and assemble the existential tuple with N=d+1, S, hS, phi.

## 7. Connection and outstanding obligations
This discharges the hbr representation premise of RUN21 classes_finite at human/source level. That theorem still needs ClassNumberFinite and GLIntegral existence and the adelic gluing suppliers. Source-level consumer route recorded in RUN20–21: exists_locus → ccf_holds/classes_finite → cover_KHT → finite_doubleCoset → forms_fin/specOfF → spectral nonvanishing → PlanEx → Pack/GeoOne → local-global compatibility → EveryCharacter → RH. This is not newly authenticated root reachability. Dependency RUN22 (3df7d31187ce2844914f72a056cd96146c231111) reports other exact local-global targets, but not these specific supplier paths in inspected excerpts. Request cached role-labeled edges to TorLoc.exists_locus and ClassNumberFinite_holds before calling this an essential root-value route. Imported tensor basis, left multiplication injectivity, direct finiteness, module topology and starT lemmas are retained, not re-proved from Lean foundations here. Earlier Frobenius fixed-field and relocated proof gaps remain.

## 8. Executed source regression and upstream comparison
Executed connector + V8 comparison: both complete source snapshots, 47 named top-level abbrev/def/theorem blocks compared (40 text-identical, 7 differing; no statement prefix changes among the 7; exists_locus exact). 28 pinned source anchors checked. Changed blocks: blk and repr_map and starT_tmap add explicit map_add argument; blk_map shortens simp set; coordA_map whitespace; isUnit_of_blk_mul shortens scalar simplifier; continuous_coordA uses continuous_finsetSum spelling. Upstream import header changes markedly, including replacement of Mathlib omnibus import and module/public section syntax. No global equivalence or kernel replay inferred. The checks inspect source, not certify arithmetic or Lean proof validity.

Reproduce from local upstream git checkout using Python 3 (checkout replay supplied, not executed here; equivalent comparison/anchors executed in V8):
~~~python
import re, subprocess, sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59"
path="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/PolynomialZeroLocusCoordinates.lean"
def git(*a): return subprocess.check_output(["git","-C",repo,*a]).decode()
def read(ref,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
p=read(P,"9f53cdb64b8e02e9776d9bc8b3084a49f8b7b6de")
h=read(H,"e8e20f8148de75390c715a60014e3b4983477d90")
def extract(s):
    ms=list(re.finditer(r"^(?:abbrev|def|theorem) (\w+)\b",s,re.M))
    return {m[1]:re.split(r"^(?:end |namespace |section |variable )",
      s[m.start():ms[i+1].start() if i+1<len(ms) else len(s)],maxsplit=1,flags=re.M)[0].strip()
      for i,m in enumerate(ms)}
x,y=extract(p),extract(h)
assert len(x)==len(y)==47 and x.keys()==y.keys()
changed=[n for n in x if x[n]!=y[n]]
assert changed==["blk","repr_map","blk_map","coordA_map","starT_tmap","isUnit_of_blk_mul","continuous_coordA"]
for n in changed:
    sep=" where" if n=="blk" else ":= by"
    assert x[n].split(sep)[0]==y[n].split(sep)[0]
assert x["exists_locus"]==y["exists_locus"]
anchors=["Matrix.fromBlocks (lreg D R z.1) 0 0","Algebra.leftMulMatrix_mulVec_repr (basR D R) z.1 1","exact Prod.ext h1.symm h2.symm","induction x using TensorProduct.induction_on","rw [repr_map, repr_coordA, repr_coordA, map_sum]","(starT σ R a).unop - algebraMap","def commE","X ij.1 ij.2 - blk","forall_coord_eq_zero_iff","have hBL : B * lreg D R a = 1","have e1 : a * a' = 1","have e2 : a' * a = 1","exact mul_eq_one_comm.1 this","isUnit_iff_exists_inv.2","MulOpposite.unop_mul","exact hz2.units_inv_left","Set.range (cond σ β y _ (Xu D))","rw [cond_map]","rw [mem_zeroLocus_iff, cond_zero_iff]","obtain ⟨ua, uc⟩ := isUnit_of_blk_mul","exact ⟨rfl, sub_eq_zero.2 h1, sub_eq_zero.2 h2⟩","def tcSub","theorem psi_bijective","have h'' := blk_injective D R h'","MulEquiv.ofBijective","Units.continuous_coe_inv.comp continuous_subtype_val","Units.continuous_iff.2","letI : TopologicalSpace (R ⊗[ℚ] D) := moduleTopology"]
for a in anchors: assert a in p,a
print("47 named blocks: 40 exact, 7 changed, 28 anchors; final statement/proof unchanged")
~~~

RESULT: DONE local SOURCE-MATCHED representation of TC by polynomial group locus, including explicit degree/count bound (human consequence), unit extraction, naturality and topology. PARTIAL root authentication and imported arithmetic suppliers. No independent Lean kernel validation, complete RH translation or URT speed claim.
RESUME HERE: expand P src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/ClassNumberFiniteHolds.lean (a0e3a4d423be75495b519125cf2e58c0ba5998ba, L11–28), identify the integral-level class-number theorem and the precise reduction from compact-open subgroups, then trace that native supplier. Request cached exact role-linked Main path to TorLoc.exists_locus/classes_finite and previous ccf_holds/specOfF instead of rescanning huge exports. Keep prior pending obligations recorded in RUN21. HANDOFF TO Galois, dependency, kernel, integration, acceleration, literature, editor, audit. Full RH OPEN.
