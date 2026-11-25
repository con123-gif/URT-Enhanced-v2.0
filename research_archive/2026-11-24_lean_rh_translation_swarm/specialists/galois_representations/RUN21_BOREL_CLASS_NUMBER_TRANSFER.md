# RUN21 — Borel class-number transfer to simultaneous local similitudes
2026-11-25. SOURCE-MATCHED local reconstruction; full proof OPEN. Continuation of RUN20 (14342760cb4c8928b875856f1076761df8a2ef5e). Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research state/log/protocol/continuity excerpts, CI #414 (03:20:09Z, physics only), RUN20, recent 25 branch titles and peer commit patches with available RESUME HERE extracts. Integration owns CoreAll/rest. No duplicate of this task observed. Not every peer file or linked external blueprint reread. No physical gates or queue changes.

## Provenance
leanprover-community/riemann-hypothesis P=40e56bab026552e089d7afcfeff08d2defb9c005, observed upstream H=fcb6eac7534875d32d68030967e2deae6d686151 (2026-11-25 02:41:16 UTC; previous observed c40250a50104b7e02e7d74f658d00fa7b1f4827c). No global equivalence asserted.
D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/; A=src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/.
- P D/BorelFiniteClassNumberCentraliserTorus.lean eb0e8b871942dc286ed3a608e0d9f85586487764; H same path 386b699f5c74639e776a4349179578d1c191d7d9. Eight helpers at P17–83/H120–186; classes_finite P90–235/H193–346. H former Statement wrapper path returns 404; P wrapper 4e885888b095fc213c539329d11fd46675ac939f targets this theorem.
- P src/Formalism/UnipotentAdelicQuotients/ClassNumberFinite.lean 3091d81ebe36154e6c5198d460346a7be9344e47 L7–34 (definitions, NOT proofs).
- P D/TC.lean acd3572dbe7bd22e5219b8c255f0071fb179234b L10–16.
- P D/FiniteDoubleCosetAwayP.lean 26fb680c011b5ed9876fcb4736b44078d928a290, adele_split near L56.
- P A/IsClosedZeroLocusGL.lean 872ebed26ce26122d9369d735f3f1c5d51270b54 L9–41; H inlined in Borel file H68–110.
- P D/FiniteDoubleCosetDefiniteHermitianFormLevel.lean 70e22df080db715cc6051bb145acd84d761d21c9 L18–31; H Statement path 891c6c097d69c881dfc0d8fac96306ad030bbaef L94–107.
- P D/PolynomialZeroLocusCoordinatesStatement.lean 8de31dde746277b27c2808acb32d3682964f98ca points to native D/PolynomialZeroLocusCoordinates.lean 9f53cdb64b8e02e9776d9bc8b3084a49f8b7b6de, exists_locus L476–516.
- P A/ClassNumberFiniteHolds.lean a0e3a4d423be75495b519125cf2e58c0ba5998ba, classNumberFinite_holds L11–28; inspected supplier imports and final finite product, not all underlying proofs.

## 1. Exact hypotheses
Fix finite-dimensional unital Q-algebra D (not assumed commutative), ring hom sigma:D→D^op (anti-multiplicative after unop; do not assume involutivity), beta,y in D, prime p. For every commutative Q-algebra R let TC_R consist of pairs (a,c) in (R⊗D)^× × R^× satisfying a(1⊗beta)star_R(a)=c(1⊗beta) and [a,1⊗y]=0. No positivity or invertibility assumption on beta or y is imposed here. Multipliers are units.
hbr is a universally quantified representation theorem: for each D,sigma,beta,y choose N, a set S of rational multivariate polynomials on N×N matrices and hS asserting the zero locus within GL_N(R) contains 1 and is closed under multiplication and inverse for EVERY commutative Q-algebra R. Write G(R) for that subgroup. One family of homomorphisms phi_R:G(R)→(R⊗D)^××R^× must be injective, have range exactly TC_R, be natural for EVERY Q-algebra hom f:R→R', and be continuous for every topological commutative Q-algebra R with IsTopologicalRing R, using module topology on R⊗D. These are separate premises. The construction below uses the range, naturality and continuity parts explicitly; retain injectivity too. S need not be finite.
hB is ClassNumberFinite: for every number field F, polynomial group locus G, and every compact OPEN subgroup J of G(A_f(F)), there is a finite T such that each g is gamma s u, gamma rational locus point, s∈T, u∈J. This is an imported arithmetic theorem, not a consequence merely of topological compactness.
Let A=finite adeles of Q, A1=AfP p, A2=Q_p; X=(A1⊗D)^××A1^× times (A2⊗D)^××A2^×, with module topologies. U≤X need not be open or compact in X: only assume some open O containing 1 with O∩(TC_A1×TC_A2)⊆U. Conclusion: finite S0⊂X, chosen before z, such that each z∈TC_A1×TC_A2 is dg(D,p)(gamma) s u, gamma∈D^××Q^× satisfying rational similitude and commutation equations, s∈S0, u∈U. Rational multiplier may be negative.

## 2. Functoriality and gluing
For f:R→R', polynomial evaluation commutes with applying f to each matrix entry: check constants, addition and multiplication by a variable (MvPolynomial.induction_on). Thus the entrywise map on invertible matrices takes zero-locus points to zero-locus points, giving the monoid hom locMap. Composition follows entrywise; continuity is continuous matrix map then continuous units map then restriction to subgroup. The latter uses topology on units including inverse coordinates, not merely the topology on arbitrary matrices.
The imported adele_split gives continuous algebra maps pi1:A→A1, pi2:A→A2 whose pair is bijective. Define Phi(g)=(phi_A1(locMap(pi1)g),phi_A2(locMap(pi2)g)). It is a continuous homomorphism and every image point satisfies both TC equations by the range hypothesis.
Surjectivity ON THE TC PRODUCT (not the full ambient X): given z satisfying both TC equations, choose g1,g2 from the two ranges. Let s be a right inverse of the paired projection. Lift the entries of g1,g2 to a matrix M over A using s; lift the entries of g1^-1,g2^-1 to M'. The two projections of MM' and M'M equal identity. Joint injectivity of the projections, applied entrywise, gives BOTH MM'=I and M'M=I. Thus M defines a unit G in GL_N(A), not just an arbitrary matrix. For each polynomial P∈S, its evaluation at M projects to zero twice by evaluation naturality and local locus membership. Joint injectivity again implies evaluation is zero. Hence G∈G(A). Its two projected matrices are exactly g1,g2 (subtype and unit extensionality), so Phi(G)=z. This is hsurj. No inverse continuity of the paired projection is used.

## 3. The compact-open reduction (essential, not optional)
Set U'=Phi^-1(U) as a subgroup of G(A). The set Phi^-1(O) is an open identity neighborhood and is contained in U' because every Phi(g) satisfies TC in both factors. A subgroup containing an identity neighborhood is open, and an open subgroup is closed (complement a union of open cosets). This proves U' open and closed even though U may be neither in X.
Choose a compact open subgroup K≤G(A) using LocusOpenCompact.exists_isOpen_isCompact. Its own native proof: evaluation is continuous by the same polynomial induction; the locus is an arbitrary intersection of closed polynomial zero sets in GL over a Hausdorff topological ring. The finite adele ring is Hausdorff via its restricted-product construction. Restrict the imported GLIntegral compact open subgroup of the full GL to this closed locus. The closed embedding of the locus gives compact preimage, and continuity gives open preimage. GLIntegral existence remains an imported supplier.
J=U'∩K is open as intersection of opens and compact as closed subset of K. Now hB applies to J. Applying hB directly to U or U' would omit the compactness premise. Obtain finite T0 independent of the eventual z, with g=locMap(Q→A)(gamma_L) s u for rational locus point gamma_L, s∈T0 and u∈J.

## 4. Rational descent and exact cover
Let w=phi_Q(gamma_L)∈(Q⊗D)^××Q^×. It satisfies TC_Q. The canonical algebra equivalence lid:Q⊗D→D, q⊗d↦qd, transports star_Q to sigma (unop), by tensor induction and preservation of rational scalar multiplication; it transports the form and commutation equations by multiplication and map of commute. Put gamma=(lid^×(w.1),w.2). Then gamma is rational and satisfies exactly the required similitude and commutation equations (tc_rat).
For any Q-algebra B, (Q→B)⊗id_D on Q⊗D equals includeRight∘lid. Verify pure tensors then additive induction (map_ofId_eq). The composite Q→A→Ai is the canonical Q-algebra map. By locMap_comp and the naturality of phi, each of the two components of Phi(locMap(Q→A)(gamma_L)) equals the corresponding component of dg(D,p)(gamma). For the unit component use map_ofId_eq and unit extensionality; for scalar units use the canonical map. Therefore this equality holds in all four coordinates, not only the underlying matrices.
Take S0=T0.image(Phi); |S0|≤|T0| (explanatory bound). For z choose g from surjectivity, factor it by hB, apply Phi multiplicatively: z=dg(gamma) Phi(s) Phi(u), with Phi(s)∈S0 and Phi(u)∈U since u∈J⊆U'. This proves classes_finite. No sign choice is made here; RUN20 separately performs the positive-multiplier correction for definite forms.

## 5. Consumer and upstream changes
P ccf_holds invokes the wrapper of classes_finite with wrappers for TorLoc.exists_locus and classNumberFinite_holds. H directly calls the native classes_finite and exists_locus. This supplies CCF used in cover_KHT→finite_doubleCoset→forms_fin→specOfF→specData→specTopG→PlanEx→Pack→GeoOne→local-global compatibility→EveryCharacter→RH, a source-level consumer chain reconstructed in earlier runs, not a newly authenticated full root path.
Of nine P/H declaration comparisons, six exact and three different. lid_starT and map_ofId_eq change map_add to map_add (f := _) in the add branch. classes_finite replaces the call to adele_split with its explicit construction: compose the continuous finite-adele equivalence over rationals/integer rings with AfP.restr and the p-adic projection; use continuous restrictions and bijectivity of the pair. This is exactly the same construction seen in the P adele_split source (line wrapping differs). The nine statement prefixes are unchanged (replay below). Upstream import organization changed substantially; no global equivalence or kernel replay inferred.

## 6. Reproducibility
Executed connector + V8: full two native source snapshots, nine declaration comparisons (6 identical / 3 differing), 21 exact P anchors; supporting definition and supplier files fetched as listed. No local Lean executable used. Checkout replay below also checks statement prefixes and git object IDs; this Python replay has not independently been run in a checkout. It is a source regression check, not proof validation.

~~~python
import re, subprocess, sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="fcb6eac7534875d32d68030967e2deae6d686151"
path="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/BorelFiniteClassNumberCentraliserTorus.lean"
def git(*a):
    return subprocess.check_output(["git","-C",repo,*a]).decode()
def read(ref,sha):
    assert git("rev-parse",ref+":"+path).strip()==sha
    return git("show",ref+":"+path)
p=read(P,"eb0e8b871942dc286ed3a608e0d9f85586487764")
h=read(H,"386b699f5c74639e776a4349179578d1c191d7d9")
names=["aeval_map_entries","mem_locus_map","locMap","locMap_comp","continuous_locMap","lid_starT","map_ofId_eq","tc_rat","classes_finite"]
def decl(s,n):
    a=s.splitlines()
    i=next(i for i,l in enumerate(a) if re.match(r"^(theorem|def) "+n+r"\s",l))
    j=next((j for j in range(i+1,len(a)) if re.match(r"^(theorem |def |end |namespace |section )",a[j])),len(a))
    return "\n".join(a[i:j]).strip()
changed=[]
for n in names:
    x,y=decl(p,n),decl(h,n)
    assert x.split(":= by",1)[0].strip()==y.split(":= by",1)[0].strip()
    if x!=y: changed.append(n)
assert changed==["lid_starT","map_ofId_eq","classes_finite"]
anchors=["induction P using MvPolynomial.induction_on","rw [aeval_map_entries, h, map_zero]","Continuous.units_map","induction x using TensorProduct.induction_on","Function.surjInv hbij.2","have hinjM","let M' : Matrix","have hMM'","have hM'M","have hG","U.comap Φ","Subgroup.isOpen_of_mem_nhds","U'.isClosed_of_isOpen hU'o","U' ⊓ K","hKc.inter_left hU'c","T₀.image Φ","tc_rat σ β y w hw","hnat ℚ (AfP p)","hnat ℚ ℚ_[p]","Subgroup.mem_inf.1 hu","rw [hg, map_mul, map_mul, hΦγ]"]
for a in anchors: assert a in p,a
print("2 pinned blobs, 9 declarations, 6 identical, 3 changed, 21 anchors")
~~~

RESULT: DONE local source-matched Borel transfer and closed-locus compact-open reduction. PARTIAL underlying arithmetic inputs: classNumberFinite_holds, GLIntegral compact-open, actual polynomial group-locus construction, local centralizer theorem, earlier frob_laws and relocated proof gaps. No synthetic arithmetic matrices, no independent Lean kernel validation, no URT speed claim. No full proof percentage.
RESUME HERE: expand TorLoc.exists_locus in pinned D/PolynomialZeroLocusCoordinates.lean L476–516, specifically blk and coordA/coordC, cond_zero_iff, isUnit_of_blk_mul, tc_inv and psi_bijective, preserving arbitrary commutative Q-algebras and both inverse conditions. Then classNumberFinite_holds and its integral-level supplier; ask dependency/kernel lanes for role-labelled Main path to classes_finite and ccf_holds plus previous specAlg/specOfF/finite_doubleCoset targets, not a fresh full-corpus scan. HANDOFF TO Galois, integration, dependency, kernel, literature, editor, audit. Project OPEN.
