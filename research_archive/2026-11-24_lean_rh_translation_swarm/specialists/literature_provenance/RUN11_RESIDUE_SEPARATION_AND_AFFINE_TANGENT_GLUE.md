# RUN11 — Residue separation and affine tangent descent/gluing
2026-11-24. SOURCE-MATCHED / PARTIAL. Source leanprover-community/riemann-hypothesis pin 40e56bab026552e089d7afcfeff08d2defb9c005. New upstream head 307cef33f046955ee79dba47e0d828d06496d75f (17:03:26 UTC, merge PR #1266), previously 1da818b50f1e18808db2792b9dc735bda8cb84d8. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, state excerpt, continuity, research log/protocol excerpts, latest CI (17:43:15, physics PASS only), RUN10, 13 peer Markdown checkpoints and two Grok provenance/audit notes. Audit lane contains mjs artifacts rather than Markdown handoff (listed but not read in this run). Blueprint not reread. No physical queue modifications. This is the exact RUN10 frontier, not a second derivation of the finite-cover exponent.

All D paths relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/; all B paths relative to src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/.

## 1. Residue functionals separate a finite projective module over a reduced ring
D/EqZeroOfForallResidueFieldFunctionalStatement.lean L5–6 is a theorem wrapper with a tactic fallback to the actual theorem GlobalTheory.eq_zero_of_forall_residueField_functional, D/EqZeroOfForallResidueFieldFunctional.lean L5–21. It is not an axiom merely because its name contains Statement. Given commutative reduced A, finite projective A-module M, x in M, and for EVERY prime ideal p and EVERY A-linear l:M→κ(p), l(x)=0, prove x=0.

Finite projectivity supplies f:A^n→M and g:M→A^n with f g=id_M (L8). For every i and prime p choose l = (A→κ(p))∘pr_i∘g. By hypothesis the image of coordinate g(x)_i in κ(p) vanishes. The kernel of A→κ(p) is p (L18). Thus g(x)_i belongs to the intersection of all prime ideals, the nilradical (L12). Reducedness makes each coordinate zero (L19). Consequently g(x)=0 and x=f(g(x))=0 (L20–21). This does not require selecting just closed points or assuming A is a domain.

Actual use: D/CmpFormEqZeroOfPullbackVanishing.lean L145–179, GlobalTheory.PtVanish.connForm_eq_zero. For each affine open U of the smooth K-scheme, its K-algebra A is smooth and reduced (L153–155, separate internal supplier GlobalTheory.T.isReduced_of_smooth_over_field'). Apply the preceding theorem to Ω_{A/K} with its inferred finite/projective instances. For any prime p and functional l, use the extension field κ(p) in H; construct the algebra map b↦b mod p + ε l(db) by nbdMap and diagSec (L159–162). The pullback property supplies a dual-number point u (L173–176). Its crystalline tangent evaluation is zero by H and equals l(connForm) by naturality and the affine-value lemma (L178). Thus the connection form vanishes on U; cmpForm vanishes by the existing affine-local identity (L181–184). Preserve smoothness and the module instances, the full quantifier over field extensions and compatible IsMor, and affine-locality. These are not independent extra axioms.

Negative controls:
- Remove reducedness: A=Z/4, M=A, x=2. Only prime (2), every A-linear map to F2 kills x, yet x≠0.
- Remove projectivity: A=Z (reduced), M=Z/4 as finite Z-module, x=2. At (0) residue Q, every map from torsion M is zero; at (p) for odd primes the map is zero because 4 is invertible; at (2), any map kills 2. Thus all residue-field functionals kill x but x≠0. The second case is NOT a counterexample to the source theorem since M is not projective. Do not remove these hypotheses to shorten the proof.

## 2. Affine tangent localization is a finite-presentation Hom argument
B/TanLoc.lean namespace ReciprocityTheory.ChartRestriction.G.Chart. Let S,B,A commutative rings, B and A S-algebras, B finitely presented over S, e:B→A an S-algebra map, A' a compatible S/A-algebra that is a localization of A at the images of a submonoid M⊂S. Write ι:A→A', and use B-module structures via e and ιe. An identity-at-e affine tangent h:B→A[ε]/ε² satisfies pr₁h=e (IsTanAt, L35). Its second coordinate d is an S-derivation: d(bc)=e(b)d(c)+e(c)d(b) (derOf L43–52). Equivalently g:Ω_{B/S}→A is B-linear. Conversely ofLin L58–75 gives h(b)=e(b)+εg(db), a multiplicative S-algebra map by the Leibniz rule. These transformations are compatible with coefficient maps and ε scaling (L14–31). Preserve the module scalar towers and basepoint; a general map without fixed first coordinate cannot use this reduction.

The actual native proof is not a guessed general sheaf result. isLocalizedModule_tan L82–110 shows A→A' is the B-module localization at the image of M in B: denominators act invertibly on A', each a' admits a scaled representative in A, and equality of images of two elements gives equality after multiplying by a denominator. These are the three explicit localization axioms proven using IsLocalization.map_units, surj and exists_of_eq.

tan_lift L121–155: given h' at ιe over A', there exist m∈M and h at e over A such that ι_ε∘h=scale_{ι(m)}∘h'. Apply the universal property of Ω to the second coordinate of h'. The actual imported theorem Module.FinitePresentation.exists_lift_of_isLocalizedModule (L145) gives g:Ω→A and one m with ιg=ι(m)g'. Convert back with ofLin and compare first and second coordinates. This is scaled lift, NOT existence of an unscaled lift. The necessary finite-presentation instance for Ω is supplied from Algebra.FinitePresentation S B in the Lean context; its imported proof remains an external library obligation.

For the human explanation of the imported Hom fact, take a finite presentation B^q→B^p→Ω→0. Clear the p denominators of the generator images to obtain a vector in A^p. Each of the q relations vanishes after localization; multiply by one further denominator killing all q defects. The resulting tuple satisfies the relations over A and defines g. This explains why both finiteness conditions matter; it is an explanatory proof of the algebraic principle, not a claim that the imported Mathlib proof term was retrieved. Preserve the actual import.

tan_uniq L157–194: if h₁,h₂ both at e have identical localization, then ∃m∈M with scale_m∘h₁=scale_m∘h₂. Apply the Kähler universal property to conclude ιg₁=ιg₂ (L178). The source calls Module.Finite.exists_smul_of_comp_eq_of_isLocalizedModule (L186); finite generators of Ω suffice since the difference at each generator is killed by a denominator, and their product kills all. Compare coordinates again. Finite generation is sufficient for this uniqueness sublemma, but retain the original source declaration's finite-presentation hypothesis. No assumption that denominators are nonzerodivisors.

## 3. Passing between a chart and the whole group; actual sheaf gluing
B/TanSRestrict.lean L16–101: TanS means reduction to the group identity. Over S[1/s], C is a chart around the identity and the point reduces to epsA. tanS_chart L50–74 uses pullR/pushR inverse at this base change; the kernel of A[ε]→A is square-zero (L60–64), so the point lands in the chart by le_preimage_of_nil. Then exists_pt represents it by h with the required basepoint, checked by pt_injective. Conversely chart_tanS L76–85 proves that h gives an identity tangent. chart_inj L87–89, chart_map L91–96, chart_scale L98–101 justify lifting, comparison and scaling through chart coordinates. Preserve open immersion/point factorization, pullback, chart and nilpotent-kernel hypotheses; no chart is asserted for an arbitrary point. Actual deeper le_preimage_of_nil, exists_pt, pt_injective and push/pull producers remain open.

B/DualMapSCompScaleS.lean L29–53: tanS_lift and tanS_uniq transport the affine results into G using these chart maps and the scalar-tower restriction identity. B/ScalePowMono.lean L59–104: smoothness of every G_s supplies finite presentation of chart coordinates (fp_chart, inferred instance). The submonoid image of powers of t equals the powers of its image (Submonoid.map_powers and tower compatibility), hence m=t^N and tanS_away_lift/tanS_away_uniq follow. This is the actual supplier of RUN10's exponents.

For gluing, B/DualMapSCompScaleS.lean L135–199, glue_tan': S commutative, finite family s_i generating unit ideal, group object G over Spec S, local identity tangents w_i over S[1/s_i], with equality after the two maps to Q_ij=S[1/s_i][1/s_j]. Need a global identity tangent with these restrictions. The source first turns this equality into compatibility for arbitrary test-ring maps α:D(S_i)→T, β:D(S_j)→T agreeing over D(S) (D(R)=R[ε]/ε²). Their restrictions agree on S and on ε. Since α sends s_j to a unit (using β), the localization universal property gives g₀:Q_ij→T extending α on S_i; its composite with S_j→Q_ij agrees with β on S_j by uniqueness of localization. Put z=α(ε)=β(ε), z²=0, and
    g(a+εb)=g₀(a)+z g₀(b).
The square-zero identity proves multiplicativity. Then α,β both factor through g; the hypothesized overlap equality implies test-ring compatibility. This proves the exact premise hc of the next theorem, not an assumption that every overlap is affine.

B/DualMapSOfIdToRingHom.lean L116–218, glue_tan: the images of s_i generate the unit ideal in D(S); the corresponding principal affine opens cover Spec D(S). Use the explicit identification of D(S)[1/s_i] with D(S_i) (toL/fromL, dAway; deeper construction earlier in same file). For every affine in a cover of a pairwise pullback, Spec.preimage gives two maps into its coordinate ring, agreeing over D(S), hence hc yields equal maps to G. By hom_ext the local morphisms agree on the entire overlap. Scheme.Cover.glueMorphisms gives g (L155), the equations on each patch give all required restrictions (L157–165), and base compatibility is checked on the same cover (L166–181). The reduction of v=Over.homMk g hover to S equals the group identity because each w_i is TanS, verified on the original S-cover (L186–218). This preserves the over-base structure and identity, not just set-theoretic gluing. The separate tan_ext_cover in B/DualMapSCompScaleS.lean L201–218 proves uniqueness by hom_ext. No need to assume G affine globally or separated; actual imported scheme gluing/hom-ext/localization facts remain dependencies.

## 4. External assumption/provenance ledger
- Source theorem wrapper: GlobalTheory.T.eq_zero_of_forall_residueField_functional' → GlobalTheory.eq_zero_of_forall_residueField_functional (exact body L5–21).
- Internal theorems with inspected bodies: Chart.tan_lift, tan_uniq, isLocalizedModule_tan, tanS_chart, chart_tanS, chart_inj, chart_map, chart_scale, tanS_lift, tanS_uniq, tanS_away_lift, tanS_away_uniq, glue_tan', glue_tan, tan_ext_cover. Prefix for all these is ReciprocityTheory.ChartRestriction.G.Chart. No axiom declaration observed in the inspected slices. Source-level calls only; no elaborated direct-edge/root reachability established.
- Imported named results still owed in full reconstruction: Module.Finite.exists_comp_eq_id_of_projective, nilradical_eq_sInf, Ideal.ker_algebraMap_residueField, Module.FinitePresentation.exists_lift_of_isLocalizedModule, Module.Finite.exists_smul_of_comp_eq_of_isLocalizedModule, Kähler universal property and instance suppliers, Spec.map_injective, Scheme.Cover.glueMorphisms and hom_ext. Imported theorem names are not axiom proof evidence. Imported proofs not inspected this run.
- Explicit local assumptions: reducedness, finite projectivity, smoothness/finite presentation, module/tower/localization compatibility, chart containing the identity, unit-ideal cover and full overlaps, TanS, H over every field extension. No new mathematical premises in the source statements. No historical citation claim or independent Lean kernel check made. No URT speed claim.

## 5. Executed provenance and finite algebra checks
Connector JS refetched 8 pinned blobs, all exact reported hashes matched; 61 source substring checks succeeded. For CmpFormEqZeroOfPullbackVanishing the generic nbdMap anchor's first occurrence was L59; its use at L160 was separately read in the full L145–179 excerpt, not counted twice. Upstream: old EqZeroOfForallResidueFieldFunctional and its Statement files return 404 at head; the 17 lines of the original actual body L5–21 appear verbatim at L84–100 of ExistsTangentVectorFunctionalGlobalFormsAbelianS (blob 0610edb6e4bb7564e19ef9d9da168bc35b880f00); caller at L255 directly invokes the theorem, bypassing the old wrapper. ScalePowMono old L63–81 and L84–104 align verbatim with new L68–86 and L89–109 (blob 3168163763941cdc48244d125feb364fb4556b18). Total 57 selected unchanged lines, not entire revision equivalence. TanLoc at head returns 404, relocation not yet traced. No claim the new upstream proof is kernel-equivalent.

Reproduce selected source checks in upstream checkout (Python not executed here; corresponding connector fetch/anchor checks actually executed):
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="307cef33f046955ee79dba47e0d828d06496d75f"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
B="src/ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/BirationalGeometry/ToroidalCompactification/"
rows=[
(D+"EqZeroOfForallResidueFieldFunctional","bf11b839d337e3f48c6b5e7c5230545fa24778bc",[(8,"Module.Finite.exists_comp_eq_id_of_projective"),(12,"nilradical_eq_sInf"),(18,"Ideal.ker_algebraMap_residueField"),(21,"hfg")]),
(D+"EqZeroOfForallResidueFieldFunctionalStatement","6f9991be42bac0b7974c35d7c3863e316331e1ce",[(5,"theorem _root_.GlobalTheory.T.eq_zero"),(6,"exact @GlobalTheory.eq_zero_of_forall_residueField_functional")]),
(D+"CmpFormEqZeroOfPullbackVanishing","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(155,"isReduced_of_smooth_over_field'"),(156,"eq_zero_of_forall_residueField_functional'"),(158,"H p.ResidueField"),(160,"nbdMap l"),(178,"snd_val_affine_eq U l")]),
(B+"TanLoc","3bdbebabf990969f1c4317da47d0fae3b7d1bd3c",[(35,"def IsTanAt"),(43,"def derOf"),(58,"def ofLin"),(82,"theorem isLocalizedModule_tan"),(121,"theorem tan_lift"),(145,"Module.FinitePresentation.exists_lift"),(157,"theorem tan_uniq"),(186,"Module.Finite.exists_smul")]),
(B+"TanSRestrict","b36130c182a5a3003524e980725d171a67efa74c",[(16,"def TanS"),(50,"theorem tanS_chart"),(60,"have hnil"),(65,"le_preimage_of_nil"),(87,"theorem chart_inj")]),
(B+"DualMapSCompScaleS","8c429b18972bbd4b0bfcdebd2f28d3ee6b1b3a8b",[(29,"theorem tanS_lift"),(44,"theorem tanS_uniq"),(135,"theorem glue_tan'"),(140,"refine glue_tan s hs"),(157,"have he2"),(182,"have hα :"),(188,"have hβ :"),(201,"theorem tan_ext_cover")]),
(B+"DualMapSOfIdToRingHom","fd5ae147b505147422450341054974448df9737c",[(116,"theorem glue_tan"),(135,"Spec.preimage"),(155,"let g := 𝒰.glueMorphisms"),(166,"have hover"),(182,"have hres"),(186,"let 𝒱")]),
(B+"ScalePowMono","8f662add775dd12158bf931e8a2f956ca090ee24",[(59,"theorem fp_chart"),(63,"theorem tanS_away_lift"),(75,"Submonoid.map_powers"),(78,"tanS_lift C"),(84,"theorem tanS_away_uniq"),(99,"tanS_uniq C")])]
def git(*a):return subprocess.check_output(["git",*a]).decode()
def read(ref,p,sha):
    spec=ref+":"+p+".lean"
    assert git("rev-parse",spec).strip()==sha
    return git("show",spec).splitlines()
old=[]
for p,sha,anchors in rows:
    ls=read(pin,p,sha);old.append(ls)
    for i,s in anchors:assert s in ls[i-1],(p,i)
new=read(head,D+"ExistsTangentVectorFunctionalGlobalFormsAbelianS","0610edb6e4bb7564e19ef9d9da168bc35b880f00")
assert old[0][4:21]==new[83:100]
new2=read(head,B+"ScalePowMono","3168163763941cdc48244d125feb364fb4556b18")
assert old[7][62:81]==new2[67:86]
assert old[7][83:104]==new2[88:109]
print("eight blob identities, representative source anchors, 57 unchanged lines")
```

Finite algebra regression (executed JS; illustrative not proof of native geometry): for squarefree m≤40 check residue separation for every vector in (Z/m)^2. For all m=2..40, t,c in Z/m, let A'=A[1/t]≅Z/q where q is m with all t-prime factors removed. A tangent of B=Z[X]/(cX) at X=0 is a coefficient d with cd=0. Test all localized tangent values for scaled lift, all global tangent differences for scaled uniqueness. No synthetic operator or physics comparison. Code:
```js
const assert=x=>{if(!x)throw Error("regression")};
const gcd=(a,b)=>b?gcd(b,a%b):a;
const primes=m=>Array.from({length:m-1},(_,i)=>i+2).filter(p=>m%p===0&&Array.from({length:p-2},(_,i)=>i+2).every(d=>p%d!==0));
let sep=0,lift=0,uniq=0;
for(let m=2;m<=40;m++){
 const ps=primes(m);
 if(ps.reduce((a,p)=>a*p,1)===m)for(let x=0;x<m;x++)for(let y=0;y<m;y++){
  assert(ps.every(p=>x%p===0&&y%p===0)===(x===0&&y===0));sep++;
 }
 for(let t=0;t<m;t++){
  let q=m;while(gcd(q,t)>1)q/=gcd(q,t);
  for(let c=0;c<m;c++){
   const ds=Array.from({length:m},(_,i)=>i).filter(d=>c*d%m===0);
   for(let a=0;a<q;a++)if(c*a%q===0){
    let power=1%q,found=false;
    for(let k=0;k<=m;k++){if(ds.some(d=>d%q===power*a%q)){found=true;break}power=power*t%q}
    assert(found);lift++;
   }
   for(const d of ds){
    let z=d,found=false;
    for(let k=0;k<=m;k++){if(z===0){found=true;break}z=z*t%m}
    assert(found===(d%q===0));uniq++;
   }
  }
 }
}
assert(2!==0&&2%2===0);
assert(primes(4).every(p=>2%p===0));
console.log({sep,lift,uniq,total:sep+lift+uniq});
```
Actual output sep=14220, lift=53369, uniq=69767, total=137356. Arithmetic of x=2 in Z/4 also checked; the two mathematical negative controls above require the stated module interpretation (not two independent Lean validations). No kernel/geometry regression claim. Source work PARTIAL because deep chart-factorization and imported library dependencies remain, and authenticated main-root reachability is outstanding.

RESUME HERE: trace D/IsReducedOfSmoothOverFieldStatement (or actual pinned import) through its body and locate the finite/projective differential instance supplier used in connForm_eq_zero, then reconstruct le_preimage_of_nil/exists_pt chart factorization; continue HC/HH global comparison suppliers and system realization, prioritizing authenticated root-reachable declarations when available. Request role-labelled witnesses for GlobalTheory.eq_zero_of_forall_residueField_functional, GlobalTheory.PtVanish.connForm_eq_zero, ReciprocityTheory.ChartRestriction.G.Chart.tan_lift, tan_uniq and glue_tan (full names). Resolve TanLoc relocation at the new upstream revision. Do not repeat RUN10 exponent or RUN11 separation/affine localization/sheaf gluing. HANDOFF TO integration, proof editor, audit, dependency, kernel and geometry. Project OPEN.
