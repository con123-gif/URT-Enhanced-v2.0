# RUN13 — Nilpotent chart factorization and smooth affine sections
2026-11-24. SOURCE-MATCHED / PARTIAL. RH pin P=40e56bab026552e089d7afcfeff08d2defb9c005; Mathlib pin Q=0df444a360eaa60ab8c11dca51a86af692955474 (manifest checked in RUN12). Latest upstream commit observed H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, unchanged from RUN12. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN12, relevant RUN11 and continuity/state/log/protocol excerpts, CI checkpoint 390 at 19:40:01 UTC (physical orchestrator only). Inspected recent peer commit patches for 12 distinct lanes and editor handoff; prime latest commit title checked, not its full note. No duplicate of this task observed. Blueprint referenced but not reopened. No physics changes. This closes the specific native chart source frontier in RUN11/RUN12 at the level of a human reconstruction, not kernel replay.

## 1. Resolve sec_smooth and the exact imported assumptions
D=src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/.
The declaration GlobalTheory.PtVanish.sec_smooth is in the same original file CmpFormEqZeroOfPullbackVanishing.lean L133–139, not a remote axiom. Let s:X→Spec R be smooth, U an affine open. Because Spec R is affine, apply the smooth-ring-map property to the pair (Spec R,U) with containment U⊆s^{-1}(Spec R). The resulting map Γ(Spec R,O)→Γ(U,O) is smooth. Precompose with the canonical isomorphism R≅Γ(Spec R,O). Smoothness respects ring isomorphisms, so the map secMap s U is smooth. RingHom.Smooth is defined using the algebra structure induced by the ring homomorphism; the native proof concludes Algebra.Smooth R (Sec s U) by exact h2. The call at L153 uses hX:Smooth X.hom, after composition with identity (L152). This is not a proof of smoothness of an arbitrary X. The actual supplier of hX in root-reachable callers is still owed.

At Q, Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean L62–65 defines geometric smoothness by smoothness of all affine-section maps; L73–77 constructs the HasRingHomProperty instance by local ring smoothness and the affine-local characterization. RingHomProperties.lean L259–262 defines the class with locality and equality to the affine-local predicate; L293–295 proves appLE by rewriting this equality and applying the predicate to U,V,e. Mathlib/RingTheory/RingHom/Smooth.lean L74–76 defines ring-hom smoothness, L82–84 gives algebraMap equivalence and L154–155 gives respectsIso from locality. These have actual imported proof bodies or definitions, not new literature axioms. The deeper locality and exact elaborated instance terms remain open. The source of secMap itself was not separately expanded.

## 2. Chart factorization: exact source and proof
A=src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ExtensionDescent/ChartPullbacks/UniversalCharts/.
B=src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/.
Native import trace from TanSRestrict to ChartAway, TanLoc, IsUnivRingBc, EigLatBasis, LieEig, RestrictDiagCompInclFst, DualLiftInjective, IsUnivChart, LePreimageOfNil. The last file is the actual supplier. Prefix for the chart declarations below is ReciprocityTheory.ChartRestriction.G.Chart.

LePreimageOfNil.lean L40–43 defines Chart(G) as affine open U plus containment of the *entire* image of the identity section in U. No global affineness of G or smoothness is needed for this definition. Set C=Γ(U,O), i:Spec C→G the affine-open immersion. The base algebra R₀→C is obtained from G→Spec R₀ via ΓSpecIso (L47–56). For each R₀-algebra P and R₀-map h:C→P, pt(h)=i∘Spec(h) is a point over the base (L58–63). We use ordinary right-to-left composition in this note, unlike Lean's ≫.

Uniqueness (pt_injective L74–82): if i∘Spec(h)=i∘Spec(h'), cancel the monomorphism i, use faithfulness of Spec on commutative ring morphisms, then extensionality of algebra morphisms. No field or reducedness premise.

Existence (chart_eq L84–89; exists_pt L91–107): given a point x:Spec P→G over R₀ with x^{-1}(U)=Spec P, define h as the section pullback Γ(U,O)→Γ(Spec P,O) followed by the canonical identification with P. The compatibility of affine charts gives i∘Spec(h)=x. To establish that h is an R₀-algebra map rather than merely a ring map, compose this equality with G→Spec R₀, use x being over the base, and cancel Spec by faithfulness. Thus h composed with the structure map R₀→C equals R₀→P. This proves a unique affine-coordinate representation for any point with entire image in the chart. The identity section gives eps:C→R₀ (L156–172), and composition with R₀→P gives pt_eps (L176–186).

Nilpotent reduction (le_preimage_of_nil L109–140): let q:P→P₀ be a surjective R₀-algebra map with *each* element of ker q nilpotent; no uniform exponent is required. Assume x∘Spec(q)=pt(h₀) for some h₀:C→P₀. For any prime p⊂P, every a∈ker q is nilpotent, hence a∈p by primality. Therefore ker q⊆p. By the correspondence of prime ideals for a surjection, p₀=q(p) is prime in P₀, and q^{-1}(p₀)=p+ker q=p. Hence x(p)=pt(h₀)(p₀) lies in U. Since p was arbitrary, all of Spec P maps into U. This proves the required containment, not an arbitrary scheme morphism lift from P₀ to P. Only after this topological step does exists_pt produce the unique algebra map h. The stronger hypothesis that ker q is a nilpotent *ideal* is not needed in this lemma. Surjectivity is used explicitly in both prime correspondence steps. This is a proof via prime ideals, not an inference from set cardinality.

Negative control for dropping the nil-kernel premise: take P=k×k, P₀=k, q projection onto the first factor; G=G_m over k, U=G_m minus the point 2 over k=F₃. The point x on the two components has values 1,2 respectively. U is affine (principal open in G_m) and contains the identity. The reduced point under q lands in U, but x does not land entirely in U. ker q contains the nonzero idempotent (0,1). Negative control for dropping surjectivity: k[t]→k(t) has zero kernel but misses every non-generic prime; with G=G_a, U=D(t-1), and x the identity map A¹→A¹, the generic point factors through U while x does not. Both are mathematical counterexamples; the finite test below independently checks the prime-lifting mechanism for cyclic quotient rings, not the scheme examples or Lean.

## 3. Pullback compatibility and chart cover
IsUnivRingBc.lean L152–212: for R→R'→P with scalar-tower compatibility, G'=G×_Spec R Spec R'. pushR is projection on G (L167–172); pullR is the unique pullback lift of an R-point x and the fixed Spec P→Spec R' (L174–176). Projection after lift gives x (L178–182). Equality after projection gives equality before projection because the second components are the same structure map (L184–189). Base change of a point commutes with precomposition by a ring map (L191–196). The identity is preserved because pushR is multiplicative by the group pullback compatibility, and an idempotent element of a group equals 1 (L198–212); the actual group pullback supplier remains an imported local dependency, not replaced by an arbitrary pullback.

Consequently TanSRestrict L50–74 starts with a point on dual numbers reducing to 1, transports to G_s, and identifies its reduction with pt(eps_A). The projection A[ε]→A is surjective with square-zero kernel. The preceding nil-kernel theorem puts the entire dual-number point into the affine chart; existence and injectivity then show that its coordinate map h reduces exactly to eps_A. Push back to G. This preserves the scalar-tower hypotheses and explains why the original proof can work entirely with affine derivations after this step.

ChartAway.lean L22–54 proves that if an affine U contains the identity image over D(s), then its preimage on the base-changed scheme G_s is affine and contains the entire identity. Indeed Spec S[1/s]→Spec S is affine, its base change to G is affine, and primes of S[1/s] cannot contain s because s is a unit. The group identity square gives the stated inclusion. L56–81 constructs a finite cover: if the ideal generated by all eligible s is proper, choose a maximal ideal m containing it. Choose an affine neighborhood U of the identity at m; its inverse image under the identity section is an open containing m. The principal-open basis gives D(s) containing m and inside that inverse image. Then s is eligible but s∉m, a contradiction. A finite subfamily generates the unit ideal. This is not an assumed cover of arbitrary affine charts. Over a local base, LePreimageOfNil L146–152 similarly chooses an affine neighborhood of the identity at the closed point; every point specializes to the closed point, so the inverse-image open containing that point contains them all. L194–197 supplies chart_smooth given Smooth G.hom via the open immersion, composition and the affine Spec characterization.

## 4. External-assumption ledger delta
| Declaration or dependency | Classification | Source and residual |
|---|---|---|
| GlobalTheory.PtVanish.sec_smooth | internal theorem with body | D/CmpFormEqZeroOfPullbackVanishing L133–139; explicit local Smooth s, affine U; secMap definition and locality internals still owed |
| Chart, alg0, pt, eps | internal definitions | A/LePreimageOfNil L40–63,156–172; not independent proved propositions |
| pt_injective, chart_eq, exists_pt, le_preimage_of_nil, pt_eps | internal theorem bodies | A L74–140,176–186; preserve over-base compatibility, affine open and nil-kernel/surjectivity where used |
| exists_chart, chart_smooth | internal theorem bodies | A L146–152,194–197; local base or smoothness respectively |
| chart_away, exists_cover | internal theorem bodies | B/ChartAway L22–81; preserve base-change group compatibility, affine map and principal-open basis |
| pushR_pullR, pushR_inj, pushR_spMap, pushR_one | internal theorem bodies | B/IsUnivRingBc L178–212; scalar tower, group-pullback supplier |
| HasRingHomProperty.appLE, RingHom.Smooth.respectsIso | imported Mathlib theorem bodies | Q; actual locality suppliers remain unresolved |
| Spec.map_injective, affine-open immersion/cancellation, prime ideal correspondence, pullback extensionality | imported results referenced in actual proof bodies | exact deeper proof terms not traced in this run |
| Smooth X.hom; isGrpPullback_pullback | local premise / unresolved supplier respectively | do not erase or equate with new global axiom |
| PublishedTheorems/OpenLiteratureStatements | no newly introduced wrapper in this selected slice | prior audit ledger retained; this is a supplier expansion, not an inventory of every declaration |
No new hypotheses added to the source statements; no citation/priority claims; no evidence of a global empty axiom closure, no root-reachability inferred from import paths.

## 5. Reproducibility and observed checks
Eight pinned source identities and 50 exact position anchors were checked by live connector fetch. Reproduce with the following Python from RH checkout and pass a Mathlib checkout as argv[1]. This equivalent git command script was not executed here; the connector version was executed. Paths A,B,D as above.
```python
import subprocess,sys
P="40e56bab026552e089d7afcfeff08d2defb9c005"
Q="0df444a360eaa60ab8c11dca51a86af692955474"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/"
A="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ExtensionDescent/ChartPullbacks/UniversalCharts/"
def read(c,r,p,h):
    raw=subprocess.check_output(["git","-C",c,"show",r+":"+p])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==h
    return raw.decode().splitlines()
rows=[
(".",P,D+"CmpFormEqZeroOfPullbackVanishing.lean","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(133,"theorem sec_smooth"),(136,"HasRingHomProperty.appLE"),(138,"respectsIso.2"),(139,"exact h2"),(153,"sec_smooth")]),
(".",P,B+"TanSRestrict.lean","b36130c182a5a3003524e980725d171a67efa74c",[(52,"pushR"),(60,"have hnil"),(65,"le_preimage_of_nil"),(67,"exists_pt"),(71,"pt_injective")]),
(".",P,B+"ChartAway.lean","21462e72aa036bacd20498be57c7bcac921005b9",[(22,"theorem chart_away"),(56,"theorem exists_cover"),(60,"exists_le_maximal"),(69,"span_eq_top_iff_finite")]),
(".",P,B+"IsUnivRingBc.lean","8c59fe23ae14f1be2f93e4b5f40aec05ebfe16c7",[(160,"sp_hom_fB"),(167,"def pushR"),(174,"def pullR"),(182,"lift_fst"),(189,"hom_ext"),(212,"mul_eq_left")]),
(".",P,A+"LePreimageOfNil.lean","d90923f4aeb598cb16d46307c1f7fbeecfcd719e",[(40,"structure Chart"),(43,"he :"),(48,"ΓSpecIso"),(58,"def pt"),(78,"cancel_mono"),(79,"Spec.map_injective"),(87,"SpecMap_appLE_fromSpec"),(91,"theorem exists_pt"),(101,"Over.w"),(102,"Spec.map_injective"),(109,"theorem le_preimage_of_nil"),(117,"mem_of_pow_mem"),(120,"map_isPrime_of_surjective"),(124,"comap_map_of_surjective"),(129,"range_fromSpec"),(139,"hp₀"),(146,"theorem exists_chart"),(152,"specializes_closedPoint"),(176,"theorem pt_eps"),(194,"theorem chart_smooth")]),
(sys.argv[1],Q,"Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean","ccb5e910949c0a60e97d65ff05554966c7ffafaa",[(62,"class Smooth"),(64,"IsAffineOpen"),(73,"HasRingHomProperty")]),
(sys.argv[1],Q,"Mathlib/AlgebraicGeometry/Morphisms/RingHomProperties.lean","072da19404b28a564b237f5b04f341830dcd0be7",[(259,"class HasRingHomProperty"),(262,"affineLocally"),(293,"theorem appLE"),(294,"affineLocally_iff_affineOpens_le")]),
(sys.argv[1],Q,"Mathlib/RingTheory/RingHom/Smooth.lean","ca757ab5bba703c2bb97b7f0744c5dbb0e1ed19f",[(74,"def Smooth"),(76,"Algebra.Smooth"),(154,"respectsIso")])]
out=[]
for c,r,p,h,anchors in rows:
    s=read(c,r,p,h);out.append(s)
    for i,t in anchors:assert t in s[i-1],(p,i,t)
new=read(".",H,A+"LePreimageOfNil.lean","4e8ab3f01dc2ecb8dcd00a470b06e216f55a76c9")
assert out[4][73:140]==new[80:147]
new=read(".",H,D+"ExistsTangentVectorFunctionalGlobalFormsAbelianS.lean","0610edb6e4bb7564e19ef9d9da168bc35b880f00")
assert out[0][132:139]==new[231:238]
print(len(rows),sum(len(r[-1]) for r in rows),74)
```
Actual upstream checks: 67 old lines L74–140 match new L81–147 literally; seven sec_smooth lines L133–139 match consolidated L232–238 literally. Old CmpFormEqZeroOfPullbackVanishing path returns 404 at H; consolidation found in the named ExistsTangentVectorFunctionalGlobalFormsAbelianS file. This establishes local source equivalence only.

Additional executed JS regression: enumerate all cyclic ring quotients Z/m→Z/d for 2≤m≤80 and d|m. Compute kernel nilpotence by actual modular powers (at most m iterations per element, since the power sequence repeats or hits zero), and independently enumerate primes of the source and target and compare preimage membership.
```js
let elementTests=0,primeTests=0,quotients=0,negative=0;
const prime=n=>n>=2&&Array.from({length:n-2},(_,i)=>i+2).every(d=>n%d!==0);
for(let m=2;m<=80;m++)for(let d=1;d<=m;d++)if(m%d===0){
 const ker=Array.from({length:m},(_,i)=>i).filter(a=>a%d===0);
 const nil=ker.every(a=>{let v=1%m;for(let n=1;n<=m;n++){v=v*a%m;elementTests++;if(v===0)return true}return false});
 const pm=Array.from({length:m-1},(_,i)=>i+2).filter(p=>m%p===0&&prime(p)),pd=Array.from({length:d-1},(_,i)=>i+2).filter(p=>d%p===0&&prime(p));
 let surj=true;
 for(let p of pm){let target=Array.from({length:m},(_,i)=>i%p===0);let lift=pd.some(q=>{primeTests++;return target.every((t,i)=>t===((i%d)%q===0))});if(!lift)surj=false}
 if(nil!==surj)throw Error([m,d]);quotients++;if(!nil)negative++;
}
console.log({quotients,elementTests,primeTests,negative})
```
Actual result: 367 quotient cases, 11,767 modular power steps, 708 prime-preimage comparisons, 233 non-nil-kernel quotients correctly missing at least one prime. All assertions held. This is a finite arithmetic regression, not an exhaustive test of arbitrary schemes, not an independent Lean replay, and not a URT benchmark.

RESULT: SOURCE-MATCHED / PARTIAL. Native nilpotent chart factorization, chart existence, base-change point compatibility and smooth-section wrapper supplied with proof and guard ledger. Main-root typed witness status unresolved. No closure claim.

RESUME HERE: proceed to actual HC/HH comparison and system realization suppliers, starting from the pinned imports of AbelianDeRhamFreeOfCrystallineComparisonStatement and StructureSheafComparisonInjectiveStatement in CmpFormEqZeroOfPullbackVanishing L7–8; reconstruct the exact bodies and their comparison hypotheses, not names or external citations. Request authenticated role-labelled witnesses for GlobalTheory.PtVanish.sec_smooth, ReciprocityTheory.ChartRestriction.G.Chart.le_preimage_of_nil, exists_pt, pt_injective, exists_cover and pushR_inj (full prefix), prioritize root reachability. Remaining secMap definition, group pullback and Mathlib locality leaves kept open; do not repeat RUN12/RUN13. HANDOFF TO integration, editor, audit, dependencies, kernel, geometry, acceleration. Project OPEN.
