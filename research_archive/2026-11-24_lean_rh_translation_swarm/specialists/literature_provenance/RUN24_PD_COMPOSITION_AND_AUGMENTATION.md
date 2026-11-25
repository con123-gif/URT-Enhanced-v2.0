# RUN24 — divided-power composition and augmentation: integral mechanism
2026-11-25. SOURCE-MATCHED local reconstruction, not authenticated Main coverage or Lean replay. Continues RUN23 28b8abb1a8973ff2021cc67ceae5675687827c99. No physics.
Preflight: read AGENTS, swarm protocol, handoff, expansion, research state/log/protocol/continuity excerpts and CI checkpoint 424 (06:33:58 UTC, Cathedral only); checked 25 recent swarm commit titles and peer patches/available handoffs (math, windows, Galois, theta, Landau, structure, prime, kernel, dependency, acceleration, editor, integration, geometry, audit). Some peer patches omitted handoff text; not full peer/archive read. Read simplicity pivot 9b65ce25b63bab2e8fb52b8b6657ea624cb9ecfc: prioritize core mechanism; no duplicate task found. Acceleration RUN24 has manifest IDs for crystallineDeRham 11224217 and rigid_of_free_of_crystallineDeRham 11221518, not a certified value-role path. Do not count this branch as Main coverage until received. External blueprint not reopened.

## Source ledger
P=40e56bab026552e089d7afcfeff08d2defb9c005, H=a18a350c3e5aad997766cff2670b292313e46574 (latest observed commit, PR 2164, 05:32:50 UTC; same as RUN23).
B=src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/
D=src/Development/AbelianVarietyTheory/
P blob receipts:
- C=B/ChooseFac.lean 05adcf8e8f0c484dd31fe81802f1dfe3bc81ecba
- A=B/CompAdd.lean 936b1c3eeb75a0df175bd90806ecebf070c1d7a4
- S=B/DpSplit.lean a065290b42d85e2006991a972ee4194ad8a7fc34
- W=B/DpOfPre.lean 316bb13ce30509e7dbde8613c4dd0f3c6f542143
- G=B/PreOfGens.lean 6883cbdd1c6120521402223fdcf611d9616645c8
- L=B/ExistsLiftAndAug.lean 90f0cf00d5920ea40bc1a2e215d41386ec44e2e7
- E=B/ExistsDividedPowersAug.lean 948cc401ffbac3e205d500bc6f5a4ee03d985638
- R=D/Definitions/Divisors/RatBasisLinearIndependentInt.lean 618acf903e44a0da9cab93d35660599eb41fee46

## 1. Short mechanism
All these constructions are algebraic transport, not a quantitative prime cancellation bound. The key is performing factorial cancellation ONLY over a free integral model, before mapping into an arbitrary commutative ring. In characteristic 2, 2!*0=2!*1=0 does not imply 0=1. R's stdPoly_two gives an actual source example of the related failure: e_1^2=0 but e_2 != 0. Thus interpreting divided powers as x^n/n! in the target would lose essential information.

R21–52: IsPreDP has seven fields: zero outside ideal (including degree zero outside), degree zero=1 and degree one=x inside, positive degree ideal membership, sum convolution, multiplication by arbitrary scalars, and same-argument binomial product. The missing eighth PD field is composition for inner degree n>0. PDPoly is a commutative B-algebra Q.P with B-module basis e_j, e_0=1 and e_i e_j=choose(i+j,i)e_(i+j). No rational algebra premise. R262–353 constructs stdPoly: in Q[X] take rational basis X^j/j!, integral span intForm closed under products by integral binomial coefficients, free Z-basis intBasis, then B tensor_Z intForm. Tensor-product basis yields the stated multiplication. Rational denominators occur only in the construction of the integral model, not in B.

## 2. Augmentation pre-PD and composition (C18–348; E16–51)
Write U(m,k)=(mk)!/((k!)^m m!) for k>0, an integer (unordered equal-sized blocks; m=0 gives 1). Define g_k(m)=U(m,k)e_(mk). The basis formula for x=sum_(k>0)b_k e_k is
    Gamma_m(x)=[t^m] product_(k>0) sum_(j>=0) b_k^j U(j,k)e_(jk)t^j.
Only finitely many factors are nontrivial; factors with b_k=0 are 1. Outside augmentation define Gamma=0 for every m. C87–215 uses exactly this coefficient construction, with finite support enlarged to a common finite set and proof of independence from zero factors. C18–85 derives e_l^n=M e_(nl) with M(l!)^n=(nl)!, and two coefficient identities (all cancellation over naturals):
    U(m,k)U(n,k) choose((m+n)k,mk)=choose(m+n,m)U(m+n,k).
    M U(n,k) choose(n(l+k),nl)=choose(l+k,l)^n U(n,l+k).
The first gives exponential/binomial coefficient law for each factor, and binomial expansion gives addition and B-scalar rescaling. Products of exponential sequences remain exponential by G39–73 (Vandermonde identity; see below).
The second coefficient identity gives Gamma_n(e_l e_k)=e_l^n Gamma_n(e_k), k>0, including l=0 and n=0. Extend the scalar e_l to arbitrary ring element by basis-span induction (C228–268): at addition apply convolution and same-argument product to recover binomial expansion, at B-scaling apply rescaling. Extend e_k to arbitrary augmentation element by ideal-span induction (C269–322): at addition use convolution, positive-degree membership because at least one index is positive, degree one by the two terms; at scalar multiplication use established law. Zero follows separately for positive degree from scalar zero and for degree zero from constant term. C324–348 packages all seven IsPreDP fields.
E16–32 proves U(n,k)^m U(m,nk)=U(m,n)U(mn,k), k,n>0, by multiplying both sides by the same positive natural factorial product. Consequently Gamma_m(Gamma_n(e_k))=U(m,n)Gamma_(mn)(e_k). Apply W12/ A123–154 to extend from generators. U(m,1)=1 gives Gamma_m(e_1)=e_m. This is the native augmentation PD producer.

## 3. Why checking composition on generators is sufficient (A19–154)
Hypotheses: arbitrary commutative B, ideal J, pre-PD gamma with all seven fields, J=span(s), composition for every x in s, every m and n>0. Conclusion: DividedPowers J with dpow exactly gamma. Scalar closure follows by gamma_n(cx)=c^n gamma_n(x), positive-degree membership, then gamma_m and (c^n)^m=c^(mn). Zero split m=0 vs m>0. The nontrivial addition closure is A68–119:
Let a,b in J each obey composition. In the integral model L tensor_Z L set u_i=bL_i tensor 1, v_i=1 tensor bL_i, and z_n=sum_(i+j=n)u_i v_j. Native basis gives n!u_n=u_1^n, n!v_n=v_1^n and n!z_n=(u_1+v_1)^n. A19–39 constructs the map psi to B sending u_i to gamma_i(a), v_i to gamma_i(b), using binomial product and degree zero. Integral model free on tensor basis, so multiplication by a nonzero integer injective. A60–66 yields m! U(m,n) z_(mn)=z_n^m (and analogues for u,v) by cancellation of (n!)^m there.
Define ideal W of model elements x with psi(x) in J and for EVERY k a witness w with k!w=x^k and psi(w)=gamma_k(psi(x)). This is an ideal: zero witnesses 1 for k=0 and 0 otherwise; addition witness is convolution of witnesses, using factorial binomial theorem and gamma-add; scalar witness c^k w. By the assumed composition at a,b, every u_i,v_i for i>0 belongs to W with witnesses U(k,i)u_(ki), U(k,i)v_(ki). Since n>0, every summand of z_n has a positive index, hence z_n in W. Its m-witness equals U(m,n)z_(mn) by injectivity of m! in the model. Apply psi and use psi(z_j)=gamma_j(a+b), giving desired composition on a+b. This is the precise reason no factorial cancellation in B is needed. Ideal-span induction then proves all composition and packages eight fields (A123–154). W12 is a wrapper, not an axiom.

## 4. Split augmentation and arbitrary generators
L16–77 builds epsilon by sending e_0 to 1 and e_i for i>0 to zero, preserving product. The kernel is augmentation: positive generators map to zero, and p-i(epsilon(p)) is in augmentation by basis-span induction. The same basis argument supplies a lift to any ring with prescribed compatible sequence c_i, c_0=1 and binomial law.
S67–254: Let i:B→P be the algebra map, epsilon:P→B a B-algebra retraction, a=ker epsilon, δ PD on J and η PD on a. The extended ideal K=i(J)P+a is epsilon^{-1}(J); canonical split p=i(b)+u with b=epsilon(p) in J and u in a. Define
    theta_n(p)=sum_(i+j=n) i(δ_i(b)) η_j(u)
for p in K, zero outside. Restriction to each summand uses positive-degree operations at zero vanishing; degree zero, degree one, membership and addition follow from the two PD structures. Product law is closure of exponential sequences under convolution (S16–63). Short alternate proof: coefficient of c_r d_s (r+s=m+n) in product is sum_i choose(r,i)choose(s,m-i)=choose(m+n,m), by choosing m from disjoint sets of sizes r,s. Out-of-range binomial coefficients zero. This is the direct identity already used in G39–73; unlike S's integral tensor proof it needs no auxiliary factorial cancellation. Explanatory alternative, not Lean rewrite.
For scalar c split c=i(epsilon(c))+v with v in a. On base scalar i(epsilon(c)), the homogeneity of both summands gives theta_j(i(epsilon(c))p)=i(epsilon(c))^j theta_j(p). On vp in a, theta_j(vp)=η_j(v)p^j. Use p^j=j!theta_j(p) from binomial product, v^j=j!η_j(v), and convolution/product to recover c^n theta_n(p) (S193–228). This multiplies factorials, never divides in P. Composition on i(b) and u comes from restrictions, then A's addition lemma supplies all K. This proves eight fields and both restrictions, with epsilon-kernel equivalence essential. W14 wraps S67; E180–187 applies it to the augmentation PD and lift. Thus RUN23's standard PD supplier is constructed, not a new literature axiom.
G75–151 gives a different general generator criterion, conditional on relation compatibility: for family x_i with prescribed g_i(n), g_i(0)=1, g_i(1)=x_i, positive g_i(n) in span(x), and binomial product, set l(c)=sum c_i x_i, Phi(c)=product sum c_i^n g_i(n)t^n for finite support c. Require l(c)=0 => Phi(c)=1. Then l(c)=l(c') => Phi(c-c')=1 => Phi(c)=Phi(c'), so Gamma_n(l(c))=[t^n]Phi(c) is well-defined. Zero, one, positive membership, addition, rescaling and binomial product follow coefficientwise; zero outside span. This is pre-PD only until composition checked. Relation condition cannot be dropped: in B=F2[e]/(e^2), two identical generators x_1=x_2=e with g_1(2)=0, g_2(2)=e, g_i(0)=1, g_i(1)=e, higher terms zero, satisfy the individual conditions (all positive terms multiply to zero, degree 2 product coefficient 2 vanishes, no forced g(2) from degree 1). But c=(1,1) is a relation and Phi(c)=1+e t^2 !=1. Hence no common pre-PD. This explicit algebraic counterexample is a reasoning control, not an executed finite ring test.
E128–178 uses this criterion for flat extension: flatness turns each finite linear relation into a finite sum of trivial relations (Mathlib Module.Flat.isTrivialRelation_of_sum_smul_eq_zero); power-series regrouping gives Phi=1. Composition on base generators comes from δ; A extends it. Flatness is retained for this supplier, NOT required by split augmentation.

## 5. Provenance delta and upstream
- R structures/definitions are not existence assertions; stdPoly and intBasis are explicit constructions.
- C pre_aug, A dp_of_pre', S dp_split', L exists_lift_and_aug, G pre_of_gens, E exists_std and flatExt have explicit proof bodies. W contains two theorem aliases, not external axioms. No new direct PublishedTheorems/OpenLiteratureStatements declaration in this run; no global axiom absence claim. Standard Mathlib algebra, basis/tensor, combinatorial and flatness lemmas remain transitive dependencies; source inspection is not kernel axiom audit.
- H original ChooseFac, DpOfPre, DpSplit, CompAdd, ExistsLiftAndAug paths return 404. H B/ExistsDividedPowersAug.lean blob 04db7e9fd7ce5863cb5d4d74ac9a50cc0a3b7fe9 has wrappers and unchanged-shaped final assembly H264–272; B/PreOfGens.lean blob 362c937e7f6c8d5f568a80554b869c266654ae17 H120–126 now calls exists_isPreDividedPowers_of_generators₂.
- H actual producer paths under D/Proofs/DivisorProofs/: ExistsIsPreDividedPowersAugmentationIdeal.lean 9382bbadc24bc43e9689bca5efa39d92067578c4 H363–382; ExistsDividedPowersOfCompOnGenerators.lean d7ee9d785b4ad49293a8ec19754685e9b73b5b27 H198–229; ExistsDividedPowersSplitAugmentationExtension.lean c109ec3896e6ec4fc5219d2ce7ef3f548e759601 H302–311; ExistsLiftAndAugmentationMap.lean f61790aea83d4b75bc43473027f0acd938ef19a1 H75 onwards (declaration located); ExistsIsPreDividedPowersOfGenerators.lean 7ce59081dfcd195d2deed0b07fe151c8e6e2568d H248–285; ExistsIsDPMorphismOfFlatAlgebra.lean 1b0981fcd3bf64d1cf0458008717f8973f258c0f H156 onwards (declaration located). H composition, augmentation, split and generator theorem bodies inspected, deeper helper equivalence not asserted. The split supplier now explicitly applies the generator-composition theorem. These are distinct pinned and head graphs, not merged evidence.

## 6. Executed certificate
GitHub JS tool fetched ten files with exact expected blob SHA receipts (8 P, 2 H), checked 41 literal anchors; additional H files inspected as above. No independent Git object rehash. JS BigInt checked integer identities in section 2: 648 product, 648 scalar, 576 composition; and 2197 Vandermonde checks (m,n=0..12, r=0..m+n), total 4069. All completed without error. Finite checks supplement exact identities, not proof of general statements. The replay below uses Python standard library and a local git checkout; equivalent JS checks executed, Python replay not executed here.

```python
import math as M, subprocess as sp, sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="a18a350c3e5aad997766cff2670b292313e46574"
B="src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/"
D="src/Development/AbelianVarietyTheory/Definitions/Divisors/"
spec=[
(P,B+"ChooseFac.lean","05adcf8e8f0c484dd31fe81802f1dfe3bc81ecba",["theorem pre_aug","theorem num1","theorem num2","have Eind","have hmulgen","have haug","if x ∈ Q.aug then D n x else 0"]),
(P,B+"CompAdd.lean","936b1c3eeb75a0df175bd90806ecebf070c1d7a4",["theorem comp_add","let W : Ideal","have zW","cancel m.factorial_ne_zero","theorem dp_of_pre'"]),
(P,B+"DpSplit.lean","a065290b42d85e2006991a972ee4194ad8a7fc34",["theorem dp_split'","have hK","have hdec","have hmd","have hmul","Pre.comp_add","dpow_comp :="]),
(P,B+"DpOfPre.lean","316bb13ce30509e7dbde8613c4dd0f3c6f542143",[":= dp_of_pre'",":= dp_split'"]),
(P,B+"PreOfGens.lean","6883cbdd1c6120521402223fdcf611d9616645c8",["theorem IsExp.mul","hrel :","have Φwd","let γ"]),
(P,B+"ExistsLiftAndAug.lean","90f0cf00d5920ea40bc1a2e215d41386ec44e2e7",["def liftAlg","theorem exists_lift_and_aug","have hmem","Q.aug ≤ RingHom.ker ε"]),
(P,B+"ExistsDividedPowersAug.lean","948cc401ffbac3e205d500bc6f5a4ee03d985638",["theorem uniformBell_comp_coeff","theorem exists_dividedPowers_aug","theorem flatExt","theorem exists_std"]),
(P,D+"RatBasisLinearIndependentInt.lean","618acf903e44a0da9cab93d35660599eb41fee46",["structure IsPreDP","structure PDPoly","def intForm","def stdPoly","theorem stdPoly_two"]),
(H,B+"ExistsDividedPowersAug.lean","04db7e9fd7ce5863cb5d4d74ac9a50cc0a3b7fe9",["apply GlobalTheory.PDA.exists_isPreDividedPowers_augmentation","theorem exists_std"]),
(H,B+"PreOfGens.lean","362c937e7f6c8d5f568a80554b869c266654ae17",["apply GlobalTheory.PDA.exists_isPreDividedPowers_of_generators₂"])]
def git(*args):return sp.check_output(["git","-C",repo,*args]).decode("utf-8")
for ref,path,sha,anchors in spec:
    assert git("rev-parse",ref+":"+path).strip()==sha
    s=git("show",ref+":"+path)
    assert all(a in s for a in anchors),path
def U(m,k):
    q,r=divmod(M.factorial(m*k),M.factorial(k)**m*M.factorial(m))
    assert r==0
    return q
def C(n,k):return M.comb(n,k) if 0<=k<=n else 0
counts=[0]*4
for m in range(9):
    for n in range(9):
        for k in range(1,9):
            assert U(m,k)*U(n,k)*C((m+n)*k,m*k)==C(m+n,m)*U(m+n,k)
            counts[0]+=1
            a=M.factorial(n*m)//M.factorial(m)**n
            assert a*U(n,k)*C(n*(m+k),n*m)==C(m+k,m)**n*U(n,m+k)
            counts[1]+=1
            if n:
                assert U(n,k)**m*U(m,n*k)==U(m,n)*U(m*n,k)
                counts[2]+=1
for m in range(13):
    for n in range(13):
        for a in range(m+n+1):
            assert sum(C(a,i)*C(m+n-a,m-i) for i in range(m+1))==C(m+n,m)
            counts[3]+=1
assert counts==[648,648,576,2197]
print(len(spec),sum(len(x[3]) for x in spec),counts)
```

RESULT: DONE local source-matched augmentation, composition, split extension and relation descent. PARTIAL transitive Mathlib obligations, authenticated Main paths, head helper equivalence. No new assumptions beyond native hypotheses; no RH or URT performance claim. These are algebraic adapters rather than direct quantitative cancellation.
RESUME HERE: obey simplicity pivot: pause further unauthenticated crystalline expansion. Obtain shared cached typed Main role path for 11224217/11221518 from dependency/kernel/acceleration; if absent, classify this branch as unassigned rather than essential. Independently audit the external assumptions on the authenticated actual third-place Green/TopG→Comparison₂.formB route, focusing on which Published/OpenLiterature supplier first introduces genuine window cancellation and whether it is a proved declaration or conditional field. Coordinate with Landau RUN24 and math uF envelope rather than rederive their work. HANDOFF TO literature, dependencies, kernel, acceleration, Landau, math, integration, audit, editor. RH OPEN.
