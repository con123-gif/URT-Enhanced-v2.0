# RUN18 — diagonal first-neighbourhood retraction and divided-power derivation

2026-11-25. Status: SOURCE-MATCHED local human reconstruction and executed finite algebra regression; project OPEN. Pinned upstream leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; observed head b2f365a68500e2bde98cd60a2324263fc62fba10 (2026-11-25 00:06:45 UTC). No independent Lean kernel replay or URT speed claim.

## Continuity and scope
Read AGENTS, RESEARCH_STATE opening, CONTINUITY_PROTOCOL and research log/protocol opening, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN17 handoff. Checked 14 other lanes' latest commits, including the 11 available Markdown RESUME HERE notes (Galois, math, theta, character boxes, Landau, prime, acceleration, integration, geometry, kernel, editor); structure, audit and dependencies latest commits were scripts, not Markdown handoffs. The present task is the direct next RUN17 supplier, not the other lanes' TLiftK raw binder, trace recurrence, adelic splitting, analytic or GAGA work. Blueprint referenced by queue not reread this run; latest physics CI summary not checked, no physics records modified. Earlier RUN15/16/17 obligations remain as recorded.

## 1. Exact objects and all quantifiers
All rings R,B,C commutative with R-algebra structures. For divided powers δ on J⊂B, define E_B=DR_R(B)=exterior algebra of Ω_{B/R}; i denotes inclusion of one-forms. L_B=rel R δ is the ideal spanned by i(dδ_{n+1}(a)−δ_n(a) da), for every n≥0 and a∈J. N1 is the preimage of L_B under i; N_j is its preimage under inclusion of the degree-j submodule Om_j. K1=Ω/N1 and K_j=Om_j/N_j. Do not replace K1 by K_j in the actual native signature (the implementation distinguishes them). Definitions source L23–24,56–68,75–100. Two-sidedness is required because the exterior algebra need not be commutative. The source uses the first conjunct of the theorem rel_two_sided_and_bot, NOT the conditional base-ideal vanishing conclusion.

For arbitrary R,I, divided powers κ on I, scheme X and t:X→Spec R, take any T in Thick κ t with ring B=T.B, ideal J=T.J, powers δ=T.δ, quotient map to B₀ and point map. Define S(T)=nb T, ring ER T=B⊕K1 with multiplication (b,m)(b',m')=(bb',bm'+b'm), ideal preimage J under first projection, powers extDP, same B₀ and point, quotient through first projection. The native fields nil, dp, surj, ker, x, w are supplied by isDPNilpotent_extend, isDPMorphism_inl composed with T.dp, a preimage (b,0) for any original quotient preimage b, T.ker on first projection and the original point fields. This is a valid thickening only subject to these original structure proofs (OneForm... L46–59).

For every arrow φ:T→T', nbAlg=(φ,km1_φ) componentwise, km1 semilinear by quotient representative calculation. The reduced map is φ₀, compatibility follows from first projection, DP compatibility from isDPMorphism_extMap and point from φ.pt. Identity and composition use km1_id/comp, hence nbF is a functor (L61–103). Let d̄ be d modulo N1. It is a DP derivation because its DP defect is an actual generator of L_B (L29–36). Two sections u(b)=(b,0), v(b)=(b,d̄b), both DP morphisms, same reduced identity and point. Naturality of u uses zero preservation; of v uses km1(d̄b)=d̄φ(b) (L105–136).

## 2. Universal construction of the forms map
ExistsFormsMapOfDividedPowerDerivation.lean L32–115: For every R,B,C,J,JC,δ,δC, R-algebra map π:C→B and additive w:C→K1_B, assume all three:
(1) w(xy)=π(x)w(y)+π(y)w(x) for every x,y;
(2) w(algebraMap_R^C(r))=0 for every r;
(3) w(δC_{n+1}(a))=π(δC_n(a)) w(a) for every n≥0 and a∈JC.
Write Q_B=E_B/L_B, q_B quotient. Define kq:[ω]↦q_B(iω), well-defined by definition of N1 (L17–28). Regard Q_B as C-algebra through π. Then v=kq∘w is an R-derivation (additivity, scalar-linearity by (1),(2), Leibniz by (1)). The universal Kähler lift l:Ω_C→Q_B sends dc to kq(w(c)).
Every l(ω) is q_B(iη) for some η: prove on generators b dc, using a representative of w(c), then zero/addition. Thus l(ω)^2=0 by the exterior relation (iη)^2=0, without division by 2 or freeness assumptions. Exterior universality supplies C-algebra map Φ:E_C→Q_B (L60–78).
Choose any set-theoretic representative ρ(x) of Φ(x) via quotient surjectivity. In particular ρ is NOT asserted to be a linear or multiplicative map before quotienting. Its seven exact outputs, in source order, are:
1. ρ(x+y)−ρ(x)−ρ(y)∈L_B for all x,y.
2. ρ(xy)−ρ(x)ρ(y)∈L_B for all x,y.
3. ρ(c)−π(c)∈L_B for every scalar c embedded in E_C.
4. ρ(i dc)−iω∈L_B for every c,ω with [ω]=w(c).
5. ρ(L_C)⊂L_B.
6. For every ω∈Ω_C some η∈Ω_B satisfies ρ(iω)−iη∈L_B.
7. For every j≥0 and every x∈Om_j(C) some y∈Om_j(B) satisfies ρ(x)−y∈L_B.
Proof: (1–4) by equality of quotient images and algebra-map laws; (5) Φ kills every relation generator by (3), extends by ideal-span induction (zero, sum, left multiplication); (6) by the Kähler lift's representative property; (7) by homogeneous submodule-power induction: scalar maps to scalar (j=0), addition adds representatives, multiplication by a degree-one element uses (6) and adds degrees. This preserves all quantifiers. In particular (5) needs DP compatibility and cannot be inferred merely from Leibniz.
Apply this to C=ER T, π=first projection, w=second projection. Leibniz is square-zero multiplication, base scalars have zero second component, DP identity follows exactly from snd_extDP and fst_extDP at L285–289, with the given a∈nb.J even though that proof does not use membership explicitly. All seven witnesses are now supplied by a theorem body.

## 3. Descent, uniqueness, and naturality
OneForm... L149–222: if ρ(x)−y and ρ(x)−y' belong to L_B then y−y' belongs to L_B by subtraction. Hence both give the same quotient class. The same argument with iω handles K1. Additivity follows by summing the representative congruences and the additive defect; zero by (5) on zero. Source relation elements map to zero by (5), so QuotientAddGroup.lift defines r1 and rK_j on their own respective quotients. The exact specifications are r1([ω])=[η] if ρ(iω)−iη∈L_B and rK_j([x])=[y] if ρ(x)−y∈L_B with both homogeneous of degree j. This establishes independence of the chosen target representatives. Independence of ρ itself follows from agreement on generators below; no canonical raw lift is claimed.

L231–246: two set maps f,g that are additive and multiplicative modulo L_B and agree modulo L_B on scalars and i dc agree everywhere by exterior generator induction. In the product step use
f(xy)−g(xy)=(f(xy)−f(x)f(y))−(g(xy)−g(x)g(y))+(f(x)−g(x))f(y)+g(x)(f(y)−g(y)).
Both ideal sides are needed. For addition expand similarly. This exact identity justifies comparing different chosen lifts, including compositions.

For every φ:T→T' the two compositions ρ_{T'} E(nbAlg φ) and E(φ)ρ_T agree modulo L_{B'}: on scalars they both have first component φπ; on differentials choose ω representing snd(c), then φ's induced one-form map represents snd(nbAlg φ(c)), by nbAlg_snd and km1_mk. DP morphisms preserve relation ideals (mDR_mem_rel). Therefore agreement propagates to all forms (natAgree L297–335). If ρ_T(x)≡y, the difference ρ_{T'}(E(nbAlg φ)x)−E(φ)y is sum of that agreement and E(φ)(ρ_T(x)−y), hence in L_{B'}. Quotient specs give r_{T'}M_j(Sφ)=M_j(φ)r_T. In degree 1 use iω and km1; in degrees 2,3 use mOm and km. This matches ExistsDiagonal... L39–54 and 75–85.

## 4. Section identities and exact conclusion
For u the induced composition ρ_T E(u) agrees modulo L_B with scalar inclusion after exterior augmentation: on b it is b, on db it is zero because snd(u(b))=0. For v it agrees with identity on b and db because snd(v(b))=d̄b. By agreement lemma these congruences hold on all forms (OneForm... L339–376). Augmentation annihilates every positive homogeneous degree (L248–257): a product containing a one-form has augmentation zero, sums preserve this; scalar base case impossible if j≠0. Thus on K_j, r_j M_j(u)=0 for j≠0, r_j M_j(v)=id for all j. Degree one separately uses augmentation(iω)=0 and r1 spec, not a substitution of K_j for K1.

ExistsDiagonal... L23–100 constructs S=nbF,u=uN,v=vN,r1 and rK at j=2,3. For all T,T',φ,x, naturality, zero after u and identity after v hold in each of the THREE coefficient systems M1,M2,M3: nine output predicates, all retained. No degree-zero zero-section identity and no claim r commutes with vertical differentials. This supplies precisely RUN17's input for the two-section horizontal acyclicity proof.

## 5. External assumption ledger delta
- T.exists_diagonal_firstNeighbourhood_retraction_forms, Statement L7–8: explicit wrapper of PDForm.Nbhd.exists_retraction, not a new axiom. Body reconstructed in sections 1,3,4.
- T.exists_formsMap_of_dividedPowerDerivation, Statement L7–8: explicit wrapper of PDForm.exists_lift_of_pdDerivation. Seven outputs and three premises reconstructed in section 2.
- T.divPowerCompatRel_filtration_twoSided_rel_eq_bot_of_base, Statement L7–8: explicit wrapper of PDForm.rel_two_sided_and_bot, native L152–161 assembling rel_filDR_properties and rel_eq_bot_of_map. Actual used conjunct is two-sidedness rel_mul_mem (L78), not conditional vanishing. Body located; full ideal/filtration argument not yet translated.
- nb, nbF, uN,vN, r1,rK, kq are explicit definitions; DP nilpotence/extDP and functor witnesses are actual inputs to these constructions, not discharged by definition names. OneForm... imports PublishedTheorems.Divisors₂.ExistsUniqueIsConnOfLift; import alone proves neither its use nor its axiom status. Its extDP/isDPDer/isDPMorphism supplier chain is next.
- Mathlib ExteriorAlgebra.lift, Derivation.liftKaehlerDifferential, QuotientAddGroup.lift, ideal-span and degree-power induction, classical representative choice: imported theorem/definition uses, not independent manuscript axioms on this source evidence. Transitive trust boundary and role-labelled root reachability OPEN. No published citation independently authenticated or new mathematical premise introduced. Do not infer kernel proof from statement wrapper names.

## 6. Pinned source ledger
Paths under src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless indicated; GitHub-returned blob hashes, not independently recomputed:
- ExistsDiagonalFirstNeighbourhoodRetractionForms.lean 5f80de635aa0cf3a9c265f114a81124330e6948a
- ExistsDiagonalFirstNeighbourhoodRetractionFormsStatement.lean c8da2339c03418bb76c15d9a43f4c90668d3d5fd
- ExistsFormsMapOfDividedPowerDerivation.lean b20c125cf9ad1bd4040decb8447b91daa5f2ae69
- ExistsFormsMapOfDividedPowerDerivationStatement.lean e72403c3c733bf49a69690447e5211be182ae687
- OneFormQuotientClassEqOfRelDifferences.lean 216f0c1e8355a54428ace91f8351678a0fdba9bc
- DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBasStatement.lean 3211d9056706251ae770dad89d1fd23f093f81c9
- DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBas.lean e104c21949356bc49bd0bacd7bb2cc8a4b2950ef (anchors and final assembly inspected)
- Definitions/Divisors/DivPowerCompatTwoFormDerivativeCompOneForm.lean relative to AbelianVarietyTheory root, 25fb1d4b42084f570129c678837d37f622ad253a (selected definitions and declaration anchors inspected).
Reproduce blob identity with git show PIN:PATH | git hash-object --stdin. Head consolidates OneForm... (old path 404) and diagonal body in CrystallineForgetFormsBijectiveSiteAndPairs.lean blob 255566b8b8544c9e9b326fa6945a4f46273196a2; head ExistsFormsMap... blob 0dde2d439692ee72b7e1a0b4fc810f943a546042; head DivPowerCompatRel... blob 188ed8d99cc5b77de5e655b09101352f3d0013e7. Executed exact-line LCS, not semantic comparison: pinned diagonal L23–100 vs head L535–612 76/78; pinned forms lift L32–116 vs head L69–154 79/85; pinned OneForm L33–376 vs head L163–506 336/344. Total 491/507 old lines aligned; windows include trailing boundaries. No independent kernel equivalence claim.

## 7. Executed regression: exterior quotient model
Deliberately finite model only, NOT actual DP geometry or Lean. F2 exterior algebra on seven source generators (three u, three v, one relation) and four target generators (three retained, one relation). The map sends u generators to zero, v generators to corresponding retained generators, source relation to target relation. Quotient by ideal generated by the relation. Test monomial basis, arbitrary single ideal-term perturbations of chosen lifts, cyclic permutation naturality and section identities in degrees 1–3. The additive and multiplicative checks are on pairs of basis monomials, not exhaustive arbitrary source vectors. Negative controls: degree zero not killed, violating relation preservation fails descent, arbitrary perturbation outside the relation changes class. Executed in JS V8, counts:
representatives 1024; mul 16384; nat 128; sections 14; neg 3; add 16384. Total positive checks counted 33934; three negative controls. The extra source-relation assertion for 64 monomials is not included in the positive count. Replay:
```js
const assert=(x,m)=>{if(!x)throw Error(m)};
const bit=m=>1<<m, project=x=>x&255;
function wedge(x,y){let z=0;for(let a=0;a<16;a++)if(x&bit(a))for(let b=0;b<16;b++)if((y&bit(b))&&!(a&b))z^=bit(a|b);return z}
function phi(m,bad=false){if(m&7)return 0;let n=(m>>3)&7;if(m&64){let b=bad?1:8;if(n&b)return 0;n|=b}return bit(n)}
function rot(m){return ((m&1)<<1)|((m&2)<<1)|((m&4)>>2)}
function rotS(m){return rot(m&7)|(rot((m>>3)&7)<<3)|(m&64)}
function rotT(x){let y=0;for(let m=0;m<16;m++)if(x&bit(m))y^=bit(rot(m&7)|(m&8));return y}
let representatives=0,mul=0,nat=0,sections=0,neg=0,add=0;
for(let m=0;m<128;m++){
 const q=project(phi(m));for(let j=8;j<16;j++){assert(project(phi(m)^bit(j))===q,"choice");representatives++}
 assert(project(phi(rotS(m)))===project(rotT(phi(m))),"naturality");nat++;
 if(m&64)assert(q===0,"source relation");
 for(let n=0;n<128;n++){assert(project(wedge(phi(m),phi(n)))===project((m&n)?0:phi(m|n)),"multiply");mul++;
 const a=phi(m)^bit(8+(m%8)),b=phi(n)^bit(8+(n%8)),c=phi(m)^phi(n)^bit(8+((m+n)%8));assert(project(a^b)===project(c),"add");add++}
}
for(let m=1;m<8;m++){assert(project(phi(m))===0&&project(phi(m<<3))===bit(m),"sections");sections+=2}
assert(project(phi(0))!==0,"degree zero negative");neg++;
assert(project(phi(64,true))!==0,"source relation negative");neg++;
assert(project(phi(8)^bit(2))!==project(phi(8)),"arbitrary nonrelation perturbation");neg++;
console.log({representatives,mul,nat,sections,neg,add});
```

RESULT: local diagonal retraction and universal forms-map reconstruction DONE at source level, two wrapper bodies expanded, third located. External provenance transitive audit PARTIAL. RESUME HERE: reconstruct native rel_mul_mem and rel_filDR_properties in DivPowerCompatRelFiltrationTwoSidedRelEqBotOfBas.lean pinned L78–142, then actual extDP/isDPNilpotent_extend/isDPMorphism_extMap suppliers (navigate through OneForm... imports, don't treat PublishedTheorems name as proof). Preserve conditional rel_eq_bot_of_map separately; request authenticated role-labelled paths to Nbhd.exists_retraction and exists_lift_of_pdDerivation as well as RUN15–17 frontier. HANDOFF TO dependency, kernel, audit, integration, editor, geometry. Project OPEN.
