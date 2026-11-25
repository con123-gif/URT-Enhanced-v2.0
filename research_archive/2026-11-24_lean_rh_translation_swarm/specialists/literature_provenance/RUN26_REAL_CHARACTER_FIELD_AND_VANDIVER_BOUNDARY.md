# RUN26 — real character field reduction and precise Vandiver boundary
25 November 2026, lane 9. RESULT: human source-matched theorem reducing the actual CaseI length to ordinary class groups of a smaller totally real character field, with a single residual test for exact zero length. RH OPEN. This is not a new unconditional uniform order bound or a native Lean replay.

Preflight: read latest mission (blob 8dc6705e1bc6540b600f6c22309294466ec88fd0, including mandatory unified engine) first; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION and continuity/state/runner log/protocol excerpts. Compare previous RUN25 commit 72836608 to current branch: 43 commits ahead at read; peer RUN26 dependency corGK, Galois saturated cotangent determinant, integration quasipolynomial VVle, editor root frontier and prior finite-class-group reduction 0dfa42f3 inspected. This is a different character-field reduction, not a repeat of the peer's host-wide CM class-group formula. No physics or URT assumption.

## 1. Exact character-field replacement for native CountI
Use native GD fields ord, ine, par, gen and l_odd/e_pos; they are obtained for admitted host characters by gdOfHost in countI. Fix odd prime l, e>=1, a finite coefficient DVR O over Z_l with uniformizer pi, residue k, fraction field F, and native Dirichlet character psi of modulus N. Assume its order is prime to l, its l-primary conductor component squares to 1, psi(-1)=(-1)^e and l-1 does not divide 2e. Here comp l in the source is projection to the l-power modulus factor via CRT, not the l-primary part of the character order. Set M=F/O with scalar action lambda=psi^-1*chi_l^-e; this is the native QO twist via O tensor (Q_l/Z_l). Set A_j=M[pi^j] (isomorphic to O/pi^j), lambda_j=lambda mod pi^j, L_j=the fixed field of ker(lambda_j), G_j=Gal(L_j/Q). Let S denote native ShaU(rho,l,top), the absolute H1 kernel of all finite inertia restrictions and full decomposition restrictions at l.

Then
    S[pi^j] = Hom(Cl(L_j), A_j)^{G_j},  j>=1,
as O-modules, where f(sigma a)=lambda_j(sigma) f(a). This uses the ordinary class group, with NO quotient by classes above l. L_j is totally real abelian (lambda(c)=1 exactly), and is contained in Q(zeta_lcm(N,l^ceil(j/eO)))^+ where eO=v_pi(l). The residual field L_1 is cyclic, of degree prime to l and >2. This is character-specific, potentially much smaller than K(mu_l^m), and applies directly to GD, not only the principal host. Neither the auxiliary imaginary quadratic Kstar nor its class number is used by this local replacement; do not remove its other native consumers.

Proof:
* On inertia at l, lambda_1^2=omega^(-2e), since the l-conductor component of psi squares to one; the mod-l cyclotomic character omega is surjective there. Thus some inertia scalar u has u^2 != 1 mod pi. In particular lambda(g)-1 is a unit and kills invariants in M and every A_j, globally and locally at l.
* Multiplication by pi^j on M is surjective. The coefficient exact sequence gives H1(Q,A_j) isomorphic to H1(Q,M)[pi^j], and local injection at l. For inertia at p != l the coefficient image is a finite group of prime-to-l roots of unity (cyclotomic unramified there). Either every scalar is 1 or some scalar minus 1 is a unit; therefore its M-invariants are M or 0 and multiplication by pi^j is surjective on them. The local coefficient H1 maps are injective. Archimedean cohomology is zero in degree 1 for these odd-primary coefficients. Consequently the torsion isomorphism preserves all the native S local conditions.
* G_j is abelian, acts trivially on A_j over L_j, and contains the inertia element with scalar minus identity invertible. In an abelian finite group this central element acts trivially on group cohomology, hence H^i(G_j,A_j)=0 for i>0 by subtracting the scalar action. Inflation-restriction gives an isomorphism H1(Q,A_j) -> Hom_cont(G_Lj,A_j)^{G_j}. For restriction at l the same scalar argument applies to the local decomposition quotient. At inertia outside l the finite quotient has order prime to l, so its H1 vanishes by averaging. Thus restriction is injective on the relevant local H1 groups and the strict conditions hold in both directions, not merely in one.
* Global class field reciprocity identifies unramified homomorphisms over L_j with Hom(Cl(L_j),A_j); the narrow-to-ordinary difference is 2-primary and does not affect odd-primary homomorphisms. The Frobenius class of any prime v|l is fixed by its decomposition subgroup in G_j. Choose the image of the inertia scalar above inside that subgroup. Equivariance gives (lambda_j(g)-1) f([v])=0, hence f([v])=0. No explicit split-at-l quotient is needed. This proves the formula. At level 1 the image embeds in k^*, hence is cyclic of prime-to-l order, and the scalar with square !=1 ensures order >2. For the conductor bound the reduction of the cyclotomic character modulo pi^j factors through modulus l^ceil(j/eO), because l^ceil(j/eO) is divisible by pi^j. Complex conjugation lies in the kernel exactly, so the field is totally real.
* Every continuous cocycle into the discrete M has finite image by compactness, so every class is pi-power torsion. Thus S=0 iff S[pi]=0. Native vLe (using ord and the open Dirichlet kernel) identifies Vlen=length_O S, without requiring prior finiteness. In particular:
    Vlen(O,e,psi)=0  iff  Hom_k(Cl(L_1)/l Cl(L_1) tensor_Fl k, k)_{lambda_1}=0.
  The right-hand notation means f(sigma a)=lambda_1(sigma)f(a), NOT the inverse eigenspace of the source class group. This is one finite-level test for exact zero of the FULL length. It does not bound a nonzero full length by the residual dimension. The same residual character gives the same zero/nonzero answer even when higher pi-power lifts or e differ. Cache using (pin, l, residue field, lambda_1, local conditions); never cache positive length from this test. Nonzero classes still need full torsion or native model_upper/model_lower.

## 2. Quantitative consequence and obstruction: the trivial character case
Take psi=1 and e even. For each odd l let R_l=Q(zeta_l)^+, with cyclic degree d=(l-1)/2 prime to l. For e mod l-1 even, lambda_1=omega^(-e). Restriction and norm on class groups identify the relevant eigenspace in L_1 with that in R_l: for an extension of degree prime to l, extension of ideals followed by norm is multiplication by the degree, and extension after norm is the sum over the group; on invariant l-primary classes these are invertible. Thus the previous test is equivalent to vanishing of the omega^(-e) component of Cl(R_l)/l. The trivial component vanishes by descent to Q.

The CaseI condition excludes e=0 mod l-1 and, when l=1 mod 4, e=(l-1)/2. The latter is the quadratic character, whose l-primary component vanishes without any conjecture. It descends to Q(sqrt(l)), with discriminant l. Minkowski gives a representative of each ideal class of norm at most X=sqrt(l)/2. The number of ideals of norm n in a quadratic field is at most the divisor count d(n), by the three splitting types. Hence h <= sum_{n<=X} d(n) <= X(1+log X) <= X^2=l/4 < l for l>=5 (log X<=X-1). In particular l does not divide h. There is no other excluded even character; l=3 is vacuous and R_3=Q.

Consequently for EACH odd l we have the equivalence
    [for all even e with 2<=e<=l-2, (l-1) not dividing 2e: Vlen(O,e,1)=0]
       iff l does not divide h(R_l).
All characters of Gal(R_l/Q) split over F_l. A finite abelian l-group is zero iff its mod-l quotient is zero, so the eigenspace decomposition proves the reverse as well as forward implication. Here Vlen can use any modulus N on which psi is trivial and any permitted O, and vLe transfers the strict local conditions. In a native principal CountI application keep l notin Bchi, all host/Big and t quantifiers. The equivalence is not a claim that proving the polynomial CountI bound requires proving Vandiver: it only exposes the strength of the shortcut that sets every such length to zero. Vandiver is a separate open conjecture, not an accepted supplier.

An existing limited supplier: John C. Miller, Real cyclotomic fields of prime conductor and their class numbers, https://arxiv.org/abs/1407.2373 (abstract explicitly reports unconditional class number 1 for prime conductors 71 through 151; larger range 167 through 241 requires GRH). Thus its unconditional part supplies zero for the trivial-character CaseI contributions in that finite interval, with all eligible weights, independent of coefficient ramification. No claim for nontrivial psi or for arbitrary l. Full paper proof not independently rechecked. Do not use the GRH-dependent range here.

## 3. Original vs reduced graph, literature ledger and remaining premise
Original source path: count_i_of_printed_bound_k_kato_automorphy -> countI -> corGK (PropGK / FPropGKU argument supplier) -> native OneCharU/NumberU3U -> model_upper/model_lower -> saturated cotangent core. See dependency RUN26 0c65c31f blob and Galois RUN26 4d78368d blob; exact type/value/constructor reachability not independently established here. Keep all original nodes and pending ones. Local alternate reduced graph: GD(ord,ine,par,gen,odd,e_pos) -> vLe + coefficient exact sequence + inflation-restriction + global reciprocity -> Hom ordinary real character class group -> residual zero branch (closed if its eigenspace zero), nonzero branch (OPEN uniform full length). The other GD fields remain in the native graph and are not claimed globally removable. Native CountI remains a weighted full-prime sum. RUN25 finite K-theory budget remains an alternative; the new residual test cannot control the order of K-groups at nonzero primes. No proof of (Q), CountII/V/Vs, 2-primary/minus, TopG or shell bound.

External assumptions accepted for this human derivation: classical global class field reciprocity (ordinary ideal class group, odd-primary narrow difference); inflation-restriction and central-element group cohomology (proof of vanishing above); Minkowski ideal-class bound; cyclotomic Galois correspondence/CRT; elementary prime-to-degree norm/extension. These are proved standard results, not assumptions of RH or assertions of native axiom provenance. Kolster–Movahhedi, AIF 50 (2000), https://doi.org/10.5802/aif.1746, treats Galois codescent of finite etale wild kernels, not the uniform all-prime order estimate. Miller's unconditional finite-range result is a published external theorem per abstract only, not a kernel proof. No new external quantitative hypothesis introduced for the reduction. PublishedTheorems/OpenLiteratureStatements wrappers not newly audited in this run; original unresolved transitive axiom ledger unchanged.

## 4. Exact pinned sources and executed checks
P=40e56bab026552e089d7afcfeff08d2defb9c005. All paths below relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
- HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57: GD and CountI (predicates).
- HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean 1feb420e376868ca41d85fb09bc4f8c7ee66778e: Coef, comp, PsiEven, Vlen, CaseI.
- CharacterLevelBounds/ShaFamMono.lean f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e: rho, V, V', nrm, dirG.
- CharacterLevelBounds/VLe.lean fe84b4080a340b9859c432e1e393bec5f75292bd: actual theorem vLe proof body.
- GaloisLibrary/SelmerTransport/ConjStableShaFam.lean 578402a7b2aea9f24d31473aab4486dd43055fb2: QO, eO, shaFam, ShaU.
- HeightAndVanishing/GdOfHost.lean 8ab8e7e79a09e2d7f00292d525733fac8badfae2: actual GD supplier.
- UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674: actual countI proof.
22 source anchor assertions executed in connector JS runtime. Latest upstream HEAD 75e2012dcc6f3093e223ef8d327b88395ff7d27c (unchanged since RUN25). Five matching paths changed blobs (Counts 0e0b736b7cc66f0516efeeb9583e8b46d3e425da, Dirichlet 41ea99614c52f8920cdb5479198a1fadae8290f3, ShaFamMono 4d0e3e330db74ef0aaaceb7086c8cd2740a568fa, VLe 25b33306bfb1139d55a3d47eab0e0e4b28c746c1, ConjStableShaFam 8106d4fbd95a9cee740901b60485e16814dba220); all 17 checked anchors in those paths remain. GdOfHost and CountI returned 404 on that revision at original paths; no claim of removal or body equality, no source mixing.

Executed CPython exact character arithmetic (exit 0); checks actual mod-l cyclotomic and quadratic twists, not invented class groups or evidence for RH. Reproduce:
```python
from math import gcd,isqrt
primes=[p for p in range(3,200) if all(p%d for d in range(2,isqrt(p)+1))]
coverage=0; unit_checks=0; examples=[]
for p in primes:
    n=p-1
    allowed={e for e in range(2,n,2) if (2*e)%n}
    expected=set(range(2,n,2)) - ({n//2} if n%4==0 else set())
    assert allowed==expected
    for e in allowed:
        image={pow(a,-e,p) for a in range(1,p)}
        assert len(image)==n//gcd(e,n)>2
        assert pow(p-1,-e,p)==1
        assert any((u*u-1)%p for u in image)
        coverage+=1
    for e in range(1,n):
        if 2*e%n==0: continue
        for sign in (1,-1):
            vals={(pow(a,-e,p)*(1 if sign==1 or pow(a,n//2,p)==1 else -1))%p for a in range(1,p)}
            assert any((u*u-1)%p for u in vals)
            unit_checks+=1
    if p in (5,7,11,13,17): examples.append((p,sorted(allowed)))
print('primes',len(primes),'eligible even residues',coverage,'local quadratic-twist checks',unit_checks,'examples',examples)
```
Output: primes 45 eligible even residues 2024 local quadratic-twist checks 8180 examples [(5, []), (7, [2, 4]), (11, [2, 4, 6, 8]), (13, [2, 4, 8, 10]), (17, [2, 4, 6, 10, 12, 14]) .
No GP/Sage or Lean/Lake executable locally. No class group size computed. Independently fetched existing CI status.json for both strip-root (45577239749, 08:35:21Z returncode 0) and native prune (45576756833, 08:31:42Z returncode 0), with reported conditional-root axioms propext, Classical.choice, Quot.sound and bounded scan 324 pending. Those apply only to existing adapters, NOT this replacement. rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier could not be executed on the actual GD context locally; source-matched weakening, exact symmetry, local cancellation, and a context-sensitive residual cache key supplied instead. The executable check above is arithmetic only, no fresh native CI verdict; no native PASS reported. For native verification use actual gdOfHost/vLe and ShaU definitions, not Main.riemannHypothesis. Preserve native axiom graph and require original-statement bridge.

RESUME HERE: investigate whether a uniform bound on the nonzero residual components of the real fields can be obtained from established class number or cyclotomic unit index estimates AND lift to full lengths; do not assume Vandiver or GRH. Alternatively locate the integral chart/Rees supplier core_holds for genuine native order control. Ask audit to check local inertia coefficient injectivity and norm descent. HANDOFF TO integration, Galois, dependency, kernel and formal audit. RH remains OPEN.
