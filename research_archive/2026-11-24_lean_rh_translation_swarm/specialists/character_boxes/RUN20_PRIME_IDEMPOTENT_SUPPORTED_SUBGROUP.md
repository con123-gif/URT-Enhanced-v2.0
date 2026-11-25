# RUN20 — Prime idempotents and supported unitary subgroups
2026-11-25. SOURCE-MATCHED / DONE for the local conditional reconstruction; PARTIAL for the requested downstream character-box consumer (not identified). Full RH translation remains OPEN.

Continuity: read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research-state/log/protocol/continuity excerpts, RUN19 and RUN16; inspected 35 latest working-branch commit titles and 14 peer commit patches (9 visible RESUME HERE extracts). No duplicate of this specific supported subgroup assembly located. CI checkpoint #411 at 02:22:47Z, run 45529563830 PASS, is not RH validation. Full peer files and linked PDF not reread. Lane listing retry returned incomplete JSON; no changes to shared queue or physics gates.

## Sources and upstream comparison
Repository leanprover-community/riemann-hypothesis. P=40e56bab026552e089d7afcfeff08d2defb9c005. H=c40250a50104b7e02e7d74f658d00fa7b1f4827c (main endpoint, merge PR #1801; not an ancestry certificate).
- C: src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean. P blob 4125fd7aed8d975a8179e2debf22c365e01f237e (from RUN19; current pinned raw file reread, directory listing truncated), H blob 357326bc75d8b98a7383d706ac7713e6a817233d. [Pinned C:23–151](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L23-L151), [C:412–530](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/SupportedSubgroupSplitCommutePrimeIdempotents.lean#L412-L530).
- S: src/Formalism/LocalToGlobal/IndefiniteReal/ScalarOnPartsFull.lean. P blob 3dc1b8a0fb755c49bb8834c25bfe5a9a97acf05e; H 02918e4e6580b0e74a71bd63919d9eed9964d0f7. [S:158–167](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/IndefiniteReal/ScalarOnPartsFull.lean#L158-L167).
- W: src/Formalism/LocalToGlobal/BesselHermitianTheta/TiedWeil.lean. P 5a4b66f93bb0125ff469b24b8a884c38f72dfeff; H 22ec0a0a2abf7f3993f9010145e3d3392ee85e4d. [W:68–75](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/BesselHermitianTheta/TiedWeil.lean#L68-L75).
- I: src/Formalism/LocalToGlobal/HeckeThetaElements/IsHeckeElt.lean. P 847fa0abe3d76a1903ea531dacf3d83e2b17a63b; H df534b4da238290e359bdc2f56d04b2984e18a11. [I:68–70](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/LocalToGlobal/HeckeThetaElements/IsHeckeElt.lean#L68-L70).

Compared 22 C declarations and 5 definitions S/W/I by literal declaration slices up to next blank line. 26 identical; only exists_isPrimeIdem changed RingHom.map_add to RingHom.map_add (f := _). No build or semantic equivalence inferred.

## Exact human reconstruction
Fix arbitrary source D:D7, V:HSp D, A=AE D (commutative), F=D.host.F, E=D.host.E, conjugation c=cA D. For each prime P of height one let v(P) be its contraction to O_F. Retain Comp D Φ, supplied by exists_comp using RUN16–18. All arithmetic delta, integrality and conjugate fibre facts in RUN19 remain premises here. No arbitrary CM extension or unverified pointwise c-formula substituted.

1. Definitions (W68–75, I68–70, S158–167). IsPlaceIdem(v,ε) means EXISTS finite base adele α with ε=pairA(0,α), α_v=1, and FOR EVERY w≠v α_w=0. IsSplitIdem(e) requires e²=e, e c(e)=0 and EXISTS v,ε satisfying IsPlaceIdem and e+c(e)=base(ε). IsIdemAt(e,P) adds Comparison₂(P,e): FOR EVERY nonzero x∈O_E, x∈P iff finPart(e incA(x⁻¹)) is nonintegral. IsPrimeIdem(P,e,f) is a disjunction: (IsIdemAt(e,P) AND f=e+c(e)) OR (f=e AND EXISTS v,ε with IsPlaceIdem(v,ε) and e=base(ε), AND Comparison₂(P,e)). The second branch is necessary when conjugation fixes P. SuppF(V,f,g) means entrywise f(g−I)=g−I, for ALL i,j, where g denotes mt V g. Neither support nor the subgroup definition alone requires f to be idempotent.

2. Generic matrix algebra C23–83. For a commutative ring A, finite index type with decidable equality, and f²=f, the complementary idempotents f and 1−f multiply to zero. Consequently mixing matrices by M_f(a,b)=fa+(1−f)b satisfies M_f(a,b)M_f(c,d)=M_f(ac,bd). This follows by expansion, not by commutativity of matrices. M_f(a,a)=a even without idempotence. For g∈GL, take p_f(g)=M_f(g,I); its two-sided inverse is M_f(g⁻¹,I). For ring hom σ and fixed Gram J, if σ(f)=f and g satisfies cT_σ(g)Jg=J, then cT_σ(p_f(g))Jp_f(g)=f cT_σ(g)Jg+(1−f)J=J. The σ-fixed premise is essential. For any f, support is equivalent to (1−f)g=(1−f)I by entrywise subtraction. For ANY f,f' with ff'=0 and g,g' satisfying their respective support equations, (g−I)(g'−I)=0=(g'−I)(g−I), hence gg'=g'g. No assumption that either matrix commutes before expansion.

3. Supported subgroup C89–151. mt is multiplicative, unital and injective by subtype/unit extensionality. Identity is supported. If (1−f)a=(1−f)I and (1−f)b=(1−f)I, multiplication yields (1−f)ab=(1−f)b=(1−f)I. Right multiplying the first equality by a⁻¹ shows inverse closure. Thus suppGroup(V,f) is a subgroup for all f. Given additionally f²=f and c(f)=f, every g∈GA D V admits g1=p_f(g), g2=p_(1−f)(g) in GA, supported by f and 1−f respectively. Their product equals g by step 2 and mt injectivity. Disjoint supported subgroups commute elementwise by step 2. If infPart(f)=0 then applying infPart to f(g−I)=g−I gives infPart(g−I)=0 entrywise, hence g∈GfC V (finite component subgroup) by Units.ext and Matrix.ext. No induction over places or group elements required.

4. Base cut C365–375, 412–451. The finite adele with a single 1 and zeros elsewhere is a legitimate restricted product element; pairing with infinite zero supplies ε. Extensionality gives uniqueness for fixed v. Its image f_v in A has infinite part zero and Φ(f_v)_Q=1 iff v(Q)=v, else 0 (Comp.base). Comp.ext' compares both infinite and ALL finite coordinates. Therefore f_v²=f_v and f_v f_w=0 for v≠w. These facts use ring-hom properties and equality case analysis, not finite enumeration of primes.

5. Decode IsPrimeIdem C453–480. In the split branch, e²=e and ec(e)=0 give (e+c(e))e=e; substituting e+c(e)=f_v forces infPart(e)=0. RUN19 tie_iff applied to Comparison₂ now identifies e as the delta at P. Evaluating ec(e)=0 at P gives Φ(c(e))_P=0 since Φ(e)_P=1. Thus Φ(f_v)_P=1+0=1, which forces v=v(P) by the cut formula. In the fixed branch e=f=f_v is already idempotent and has infinite zero; tie_iff again identifies it with δ_P, and Φ(e)_P=1 forces v=v(P). This proves both branches of of_isPrimeIdem, without assuming which branch holds.

6. Construct IsPrimeIdem C482–507. For EVERY P choose e=δ_P via Comp.surj on the single-place adele, and choose ε for v(P). Delta idempotence and tie_iff supply e²=e and Comparison₂. If cP(P)=P, RUN19 eq_or_eq_cP says the fibre contains only P, so δ_P=f_v by coordinate extensionality. Choose f=e (right disjunct). If cP(P)≠P, delta_conj identifies c(e)=δ_cP(P); products vanish by distinct supports, and e+c(e)=f_v since every Q over v is one of these two, using eq_or_eq_cP and under_cP. Choose f=e+c(e) (left disjunct). These are two exhaustive cases, not an induction. Do not identify f=e+c(e) in the fixed case: that would double the local value.

7. Final assembly C511–530, supported_group_and_prime_idempotents. For every D,V, choose one Comp map. First conjunct: for every idempotent c-fixed f, existence of supported subgroup, splitting of every g, and for ALL f',g,g' disjoint supported commutation. Second: every P admits e,f as in step 6. Third: for ALL P,e,f satisfying IsPrimeIdem, f²=f, c(f)=f (base embedding fixed), all f-supported g lie in GfC, all other witnesses at P coincide (delta_unique and placeIdem_unique); for any other P',e',f', either distinct contractions imply f f'=0, or equal contractions imply f'=f and P'=P OR IsConjPl(P,P') (RUN19). Fourth: for ALL P,P',e with IsIdemAt(e,P) and IsConjPl(P,P'), the conjugated e satisfies IsIdemAt(c(e),P'). Indeed c preserves multiplication, c²=id, preserves the place-sum by swapping summands, and Comparison₂.conj transports the arithmetic test. This preserves all source quantifiers, including the universal f' which is not required to be an idempotent. No hypotheses removed.

Interpretation: two nested local selections are necessary: e identifies one E-prime; f identifies the whole F-place fibre and is conjugation-fixed. Supported unitary matrices can be cut by f but not generally by e alone. This is a conditional arithmetic/algebraic result, not a proof of any nonvanishing claim. The direct downstream character-box consumer was not located: GitHub code-search returned incomplete=true, zero results; six plausible Satake files inspected had no direct name reference. Do not claim authenticated Main reachability from imports.

## Executed source dependency check
77/77 literal anchors in 16 slices, connector V8. Reproduce by reading git show P:path, extracting inclusive line ranges and testing each anchor as substring; these are lexical reference assertions, not kernel edges.
C23–29: linear_combination -hf; Matrix.smul_mul; Matrix.mul_smul.
C46–64: Units.mul_inv; Units.inv_mul; hσ; mix_mul hf; hg'.
C66–83: Matrix.ext_iff; noncomm_ring; zero_smul.
C102–118: suppF_iff; mt_mul; mul_inv_cancel; congrArg.
C120–140: piece_mem; exists_piece; smul_mix; mix_split; mt_inj; commute_of_supp.
C142–151: infPart D; Units.ext; Matrix.ext.
C308–325: hΦ.surj; delta_unique; Pi.single_eq_of_ne; ev_mul.
C365–375: hΦ.base; map_one; map_zero.
C412–451: singleV; FiniteAdeleRing.ext; place_comp; hΦ.ext'.
C453–458: tie_iff; linear_combination -h1 - h2; place_comp.
C460–480: rcases h; delta_of_isIdemAt; ev_mul; one_ne_zero; place_idem; tie_iff.
C482–507: exists_delta; exists_placeIdem; by_cases hc; eq_or_eq_cP; delta_conj; under_cP; Or.inr; Or.inl.
C511–530: exists_comp; suppGroup; exists_split; commute_of_suppF; exists_isPrimeIdem; of_isPrimeIdem; mem_GfC_of_suppF; delta_unique; placeIdem_unique; place_orth; Comparison₂.conj.
S158–167: IsPrimeIdem; IsIdemAt; f = e + cA D e; f = e; ∀ x; SuppF; ∀ i j.
W68–75: IsPlaceIdem; pairA; IsSplitIdem; e * cA D e = 0.
I68–70: IsIdemAt; IsSplitIdem; ∀ x.

## Reproducible regression — executed connector V8
Finite ring F3³ with conjugation swapping first two factors; rank 2, identity Gram. All unitary matrices in this model (GL2(F3) × O2(F3)) exhaustively enumerated. Separate 6-place Boolean mask model uses two split and two fixed fibres. Comparison₂ is represented by known singleton support (RUN19), not independently proved for adeles. The finite model is not the native adelic group, no general theorem or kernel result follows just from testing.

```js
function regress(){
 const A=(x)=>{if(!x)throw Error("assertion")}, mod=x=>((x%3)+3)%3,I=[1,0,0,1],eq=(a,b)=>a.every((x,i)=>x===b[i]),mul=(a,b)=>[a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]].map(mod),tr=a=>[a[0],a[2],a[1],a[3]],det=a=>mod(a[0]*a[3]-a[1]*a[2]),inv=a=>[a[3],-a[1],-a[2],a[0]].map(x=>mod(x*det(a)));
 const GL=[];for(let i=0;i<81;i++){let a=[0,1,2,3].map(j=>Math.floor(i/3**j)%3);if(det(a))GL.push(a)}
 const O=GL.filter(a=>eq(mul(tr(a),a),I)), G=GL.flatMap(a=>O.map(b=>[a,tr(inv(a)),b]));
 const M=(a,b)=>a.map((v,i)=>mul(v,b[i])), E=(a,b)=>a.every((v,i)=>eq(v,b[i])), U=a=>E(M([tr(a[1]),tr(a[0]),tr(a[2])],a),[I,I,I]), P=(f,a)=>a.map((v,i)=>f&(1<<i)?v:I), supp=(f,a)=>E(P(f,a),a);
 let split=0,orth=0,sub=0,prime=0,neg=0;
 for(let g of G)for(let f of [0,3,4,7]){let a=P(f,g),b=P(7^f,g);A(U(a)&&U(b)&&supp(f,a)&&supp(7^f,b)&&E(M(a,b),g));split++;A(E(M(a,b),M(b,a)));orth++}
 for(let f of [0,3,4,7]){let S=G.filter(g=>supp(f,g));for(let a of S){A(supp(f,a.map(inv)));sub++;for(let b of S){A(supp(f,M(a,b)));sub++}}}
 const bar=[1,0,2,4,3,5],fiber=[0,0,1,2,2,3],c=m=>bar.reduce((s,j,i)=>s|(((m>>i)&1)<<j),0),cut=i=>fiber.reduce((s,j,k)=>s|(j===fiber[i]?1<<k:0),0);
 for(let i=0;i<6;i++)for(let e=0;e<64;e++)for(let f=0;f<64;f++){
  const comparison=e===(1<<i),isCut=x=>fiber.some((_,j)=>cut(j)===x);
  const splitCase=comparison&&(e&c(e))===0&&isCut(e|c(e))&&f===(e|c(e));
  const fixedCase=comparison&&e===f&&isCut(e);
  A((splitCase||fixedCase)===(e===(1<<i)&&f===cut(i)));prime++;
 }
 A(G.some(g=>!U(P(1,g))));neg++;
 A((1&c(1))===0&&c(1)!==1);neg++;
 A(c(4)===4&&(4&c(4))!==0);neg++;
 A(G.some(g=>!supp(0,g)));neg++;
 return {GL:GL.length,O:O.length,G:G.length,split,orth,sub,prime,neg}
}console.log(regress())
```
Actual output {"GL":48,"O":8,"G":384,"split":1536,"orth":1536,"sub":150266,"prime":24576,"neg":4}. Four negative controls: non-conjugation-fixed cut fails unitarity for some matrices; a split singleton differs from its conjugate; a fixed singleton is not orthogonal to itself; zero support excludes nonidentity matrices. Orth checks here only complementary pieces of same g, not all pairs; general disjoint commutation is source-derived in step 2. Four primary source files, 27 upstream comparisons, 16 source slices. No removed assumptions; no independent Lean replay, root-level kernel reachability or URT improvement established.

## RESUME HERE
Obtain authenticated role-labelled downstream consumer of GlobalTheory.IdemSupport.supported_group_and_prime_idempotents (C511–530) via dependency/kernel lane reverse-reference projection, rather than repeating broad incomplete code search. If absent from Main reachable graph, label branch source-only and return to outstanding ReadL/MjHTie/IdxDefs → Keep/Pins producer path. Request exact Main-root edges also for RUN15–19. HANDOFF TO dependency, kernel, integration, editor, Galois, theta, audit. Full RH project OPEN.
