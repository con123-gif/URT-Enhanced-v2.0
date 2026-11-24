# Run 4 — rank-one Weil–Deligne normalization and disappearance of the correction character

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the actual local correction-character argument, global exponent cancellation and rank-one crystalline assembly. Conditional on identified upstream producers; no Lean kernel replay, full proof, or URT speed claim.

## Continuity and pin

Read swarm protocol, handoff queue, expansion, AGENTS, actual runner research log/protocol, state and continuity; recent peer checkpoints including Grok galois_rows RUN6 and trust table, theta, literature, character boxes, integration, editor, prime, Landau, kernel, structure, dependency, acceleration and positivity lanes. Physical CI 45369968953 PASS at 10:17Z unrelated to RH. External blueprint is referenced in the queue; its PDF was not reread in this run, and no result here is inferred from it. This expands the specific Crys.alg/hk producers left open by RUN3; Grok's trust table and downstream gal field trace are complementary, not duplicated.

All mathematical statements below use leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Current main observed fb990c7fb2d7e01039a22116b38c31457e56a796 (commit 10:21:15Z); same two principal paths remain, but AlgebraicCharacterWD and ContinuousRankOneRep blobs are now 2772fb810c95432228e35878b46f7ff11d550886 and fb0bdf5416986c8a291ace6ba2fadc618722623a respectively, with principal theorem identifiers still present. No full cross-revision equivalence established. Continue on pin.

## 1. Exact scope and notation

Fix a number field F, algebraic closure Ω, prime l, place w, valuation subring A above w, h:IsPlaceOver A w, the given local bridge Bw over the decomposition group and its Induces proof hj, and ring equivalence ι:Qbar_l ≃ C. For local Artin homomorphism a:W_h→K^× (K=F_w) assume IsLocalArtin h a. Let κ:D_A→Qbar_l^× be continuous, and let m:Emb(l,w)→Z with IsLocAlg h κ m. The finite embedding set consists of continuous embeddings; write A_m(x)=product_τ τ(x)^{m(τ)} for x a unit of K (K^×). This is multiplicative in x and additive-to-multiplicative in m. Let j:W_h→D_A be inclusion. WDis(P,κ,ξ) means IsPstAt(P,Bw,rk1 κ) AND existence of smoothness evidence for the character parameter identity wdAt(P,ι,Bw,h,hj,rk1 κ)=WD.lpOfChar(h,ι_*ξ). This is a WD class, not a matrix equality in a fixed basis.

The native LocWD conclusion gives ξ with WDis at canonical Loc.PP l and ξ(σ)=κ(jσ) A_m(aσ). It is not a claim that a continuous local character is automatically locally algebraic.

## 2. The actual proof of the correction character being trivial

Source ContinuousRankOneRep.lean. For fixed data above, define Df(m,d) to mean: for EVERY continuous κ locally algebraic with weights m, WDis(PP,κ,(κ∘j)(A_m∘a)d). Here d is a Weil character, not a scalar chosen separately for every σ.

(a) Existence of locally algebraic witnesses of every integral weight (exw, lines 97–102) is obtained from Loc.laGlob using global reciprocity and its Hecke-character construction. Potential semistability pst uses local algebraicity -> de Rham through Loc.laDeRham, then the de Rham-to-potentially-semistable theorem, with continuity of the rank-one matrix. Keep these inputs.

(b) df_zero (105–120): a weight-zero κ has smooth restriction to the Weil group: the open kernel in IsLocAlg provides the required open subgroup. The potentially unramified WD comparison Loc.wdPotUnr and rank-one dimension identify the parameter with κ∘j; thus Df(0,1). This uses more than mere continuity.

(c) df_of (123–138): suppose one continuous locally algebraic ν of weight m realizes the formula with d. For any other κ of the same weight, ψ=κν^{-1} is continuous of weight zero (Loc.laMul). Apply df_zero to ψ and use multiplicativity in ChBasic to multiply its WD character by ν's; κ=ψν. Thus the SAME d works for all κ. df_uniq (141–144) applies both proposed d to a witness ν from exw and uses uniqueness in ChBasic, then cancels the shared invertible character. df_ex (147–164) chooses d_m using the unique WD character of a witness, and proves d_(m+m')=d_m d_m' by the same uniqueness applied to νν'. Therefore δ:m↦d_m is a group homomorphism into the multiplicative character group (written Additive in Lean). hom_sum (166–170) expresses d_m(σ)=product_τ d_eτ(σ)^{m(τ)}, with eτ the coordinate unit vector.

(d) df_coef (172–195): if coefficient automorphism s sends embedding τ to τ', coefficient equivariance ChCoef and uniqueness imply d_eτ'(σ)=s(d_eτ(σ)). The source applies s to a locally algebraic witness of weight eτ, obtains weight eτ' with preserved continuity/open kernel, and cancels the nonzero common prefactors. This is the actual Galois descent relation on the values, not an assertion that all embeddings have identical weights.

(e) df_cyc (198–216): use the cyclotomic character, locally algebraic of constant weight -1 by Loc.laCyc. ChBasic says its WD value is q^{deg σ}, q=normV w. Loc.epsArt identifies the character value with q^{deg σ} A_1(aσ). The formula for d_-1 therefore gives q^{deg σ} = q^{deg σ} A_1(aσ) A_-1(aσ) d_-1(σ). Since A_1 A_-1=1 and q^{deg σ}≠0, d_-1=1; additivity gives d_1=1. This fixes the sign and the Frobenius normalization.

(f) df_unit (219–241): fix σ. If the embedding set is empty, the weight group is trivial and choose s=1. Otherwise EmbOrbit applies to the equivariant family d_eτ(σ), producing u∈K with τ(u)=d_eτ(σ) for every τ. At least one τ exists, all character values are nonzero, so u≠0. Surjectivity of a provides s with a(s)=u. Then d_m(σ)=A_m(a(s)) for ALL m by the basis decomposition. In particular A_1(u)=1 from (e). The ord_zero lemma (47–69) proves ord(u)=0: if valuation v(u)<1, continuity of each embedding implies |τ(u)|<1; the nonempty product has norm <1, contradiction. Applying the same to u^{-1} rules out v(u)>1. Using Artin ord_eq yields deg s=0. This does not yet imply u=1 or d_m=1.

(g) df_res (244–285): take a finite number-field extension F'/F inside Ω with place w' over w and matching Weil elements σ,σ' acting identically on Ω. ChRes supplies a compatible local bridge and character restriction. ArtNorm gives the embedding restriction res and norm homomorphism N, with τ(Ny)=product over τ' restricting to τ of τ'(y); matching Weil actions yield a(σ)=N(a'(σ')). The exact algebraic identity A_m(Ny)=A_(m∘res)(y) follows by regrouping the finite product by fibres. Restrict a locally algebraic witness ν, retaining continuity and local algebraicity of the pulled-back weight (open inertia kernel pulls back). ChBasic uniqueness identifies the restricted WD character with the extension correction formula. Cancel equal ν and norm-power factors. Applying df_unit at F' gives s' of degree zero and its restricted s at F such that d_m(σ)=A_m(a(s)) and s,s' agree as actions. Neither the extension nor s is asserted independent of σ.

(h) df_one (288–298): fix σ with deg σ=-1. Suppose d_m(σ)≠1. The set V={x∈K^×: A_m(x)≠d_m(σ)} is open by continuity and is a neighborhood of 1. ExField gives an extension F'/F and matching σ' such that EVERY pair of matching s,s' with deg s'=0 has a(s)∈V. But (g) produces exactly such a pair with A_m(a(s))=d_m(σ), a contradiction. Thus d_m(σ)=1 for every degree -1 element. Apply this to inverse Frobenius to obtain d_m(frob)=1. For any σ of integer degree k, frob^{-k-1}σ has degree -1, so multiplicativity gives d_m(σ)=1. No density assertion or limit argument is needed at this last step. The substantive neighborhood-separating input ExField must be proved, not silently assumed.

core (300–306) now uses df_ex and df_one to give LocWD. Public locWD (311–313) supplies chBasic, chCoef, embOrbit, chRes, artNorm hG and exField hG; it takes GlobalArtinReciprocity, HeckeLAdicCharacterDeRham and DeRhamPotSemistable. Their actual deeper proofs remain distinct obligations.

## 3. Global Hecke normalization and jump sign

Use E for the number field and the full common hypotheses of Published.AlgebraicCharacterWD: Ω, l prime, P, AI, Nonempty LocTied, ι, global art with IsGlobalArtin, Hecke χ, integral weight n indexed by embeddings E→C, continuous μ:G(E,Ω)→Qbar_l^×, IsAlgPos χ n and IsLAdicOf art ι χ n μ; all place/local bridge/induced-place data above, a with IsLocalArtin, local component ξ with IsComp χ w ξ.

LaHecke.lean proves local algebraicity of κ=μ restricted to D_A with weight m(τ)=-n(ι∘τ∘incl). It uses injectivity of the global-Artin local-idele map, smoothness of χ.loc w, local Artin continuity and an explicit inverse character on inertia with open kernel. Local-global Artin compatibility equates the chosen local values; IsLAdicOf.loc supplies the precise power factor, and the smooth local character factor is cancelled using its nonzero unit value.

LocWD yields η(σ)=μ(σ) A_-N(aσ), N(τ)=n(ι∘τ∘incl). IsLAdicOf.loc gives μ(σ)=ι^{-1}(χ.loc w(aσ)) A_N(aσ). Hence η(σ)=ι^{-1}(χ.loc w(aσ)), since every factor τ(aσ) is nonzero and integer exponents N and -N sum to zero. HeckeComp.main gives uniqueness of local components, so ξ=χ.loc w. ChIndep transfers the same η from canonical PP to the given P using Nonempty LocTied l P AI, preserving potential semistability and WD equality; it is not an arbitrary period-ring change without a tie. The actual proof constructs period-ring equivalences preserving Galois, Frobenius and unramified coefficient action, rescales monodromy by a nonzero scalar, transports Dpst and the WD spaces, then uses WD.sound and iso_of_equiv_smul; preserve these requirements (ChIndep.lean:95,131,187,239,249–254). Consequently wdAt of rk1 μ restricted to D_A equals WD.lpOfChar(h,ξ∘a). This is precisely Crys.alg. No extra absolute-value twist can be inserted.

Published.HeckeLAdicCharacterDeRham gives de Rham AND, for every global embedding τ:E→Qbar_l and finite coefficient extension LL' and local embedding τ' induced through Bw, the jump multiset is {-n(ι∘τ)}. Do not replace this by positive weights or assert the jump statement for an unrelated local embedding. The producer is HeckeDeRham.lean:3 -> HLdR.field_outright -> Hladr2.field_of_leaves with tilt_period and lubin_tate_period_not_filtered, not a new axiom inferred from the Published namespace. The deeper proof of field_of_leaves and its period suppliers is not reconstructed here.

## 4. Crystalline versus potentially crystalline — a separate rank-one argument

For a potentially semistable representation, the model theorem isCrys_iff says crystalline iff monD=0 AND inertia acts trivially. isPotCrys_iff says existence of a finite extension making it crystalline iff monD=0. wdN_eq_zero_iff transfers zero monodromy between the WD and period spaces; the nontrivial direction uses faithful detection by wdMk along all Frobenius iterates, not assumed injectivity of wdMk. unr_wdPst_iff matches inertia via exists_ine_of_fix and ine_mem_fix; acts trivial via actD_eq_one_of_wdMk. unr_wdAt_iff and wdParameterAt_monodromy_zero_iff_potCrystalline then unpack an actual potentially semistable finite coefficient model and transfer both results. BOTH require IsPstAt; no assertion about the fallback WD for a non-potentially-semistable input.

In Crys.crys, de Rham and continuous μ give potential semistability, then the WD unramified criterion plus algebraic-character identity identifies crystalline with unramified ξ∘a, then with χ.UnrAt w using the explicit local character comparison and CharCrysModel.isUnram_iff. The theorem uses χ.UnrAt w only in this branch.

Separately, a de Rham rank-one μ is potentially crystalline without an unramified-χ assumption: de Rham -> potentially semistable model -> WD space has dimension one. Nilpotent endomorphism N on a one-dimensional vector space over a field is zero: choose nonzero v spanning the space, Nv=cv, so N^k v=c^k v=0 for a positive nilpotence exponent; since v≠0 and the field has no nonzero nilpotents, c=0 and N=0. The native PotCrysRankOne theorem uses wdN_eq_zero_iff and isPotCrys_iff to obtain the finite extension. Finally heckeLAdicCharacterAbove_of_potSemistable constructs four exact fields: de Rham; potentially crystalline; crystalline IF χ is unramified; all induced embedding jump identities. This is Crys.hk, and supplies RUN3's CoreAll Inp.hk alongside Inp.alg and Inp.pst. The downstream CoreAll/Row0b and nonvanishing chain is unchanged.

Negative control: N=0 alone is insufficient for crystalline if inertia is nontrivial. A nontrivial finite ramified character is the standard rank-one case illustrating why the distinction is necessary; not a counterexample to the source criterion.

## 5. Reproducible evidence and scope

Pinned source inventory (abbreviations A=src/Development/AutomorphicArithmetic/, B=src/Development/AbelianVarietyTheory/, T=A/ThetaCorrespondence/AlgebraicCharacters/; slashes after A/B understood):
- T/ContinuousRankOneRep.lean 028d93377a68710f3e21da03eff798ff7fd103af, 105–313, df_zero/of/uniq/ex/coef/cyc/unit/res/one.
- T/EmbOrbit.lean f7b21c5d5a970b595c05d7b2226e9c2854b6622b, 21–98, WDis/ChBasic/ChRes/ChCoef/ChIndep/ArtNorm/ExField/EmbOrbit/LocWD.
- T/AlgebraicCharacterWD.lean a5148c5bad5cf0c977c250037793579bf3e9be24, 9–33, algebraicCharacterWD.
- A/AutomorphicVarieties/PadicHodgeTheory/LaHecke.lean 4ff54dc851a74068157e097a4a571fd0e5c25e28, 12–29.
- T/ChIndep.lean 123767a050d7d27b88ce75b4d9d2c0d0c4761de4, 95–254.
- B/Proofs/IwasawaDecomposition/WdParameterMonodromyZeroIffPotentiallyCrystallin.lean 6c68db6192193b8e5f5a94a31758fdddd2895555, 238–357.
- B/Proofs/InertiaEigenvalues/EqZeroOfIsNilpotentOfFinrankEqOne.lean 1f5b8626090ec554c2445efd93edfa6bffe6febf, 16–53.
- B/Proofs/InertiaEigenvalues/HeckeLAdicCharacterAboveOfPublished.lean f016f80710d5ec9a2135aff6ef97b9f2b7a7dacf, 14–22.
- B/PublishedTheorems/GaloisCohomology₂/HeckeLAdicCharacterAboveIff.lean 1f38314b25435f6467afbfe9d36ecefec14937b3, 13–29.
- B/PublishedTheorems/GaloisCohomology₂/HeckeLAdicCharacterDeRham.lean 6068fcd2be1b99412b09164307edd98329e9bdc3, 11–22.
- B/PublishedTheorems/GaloisCohomology₂/HeckeLAdicCharacterCrystalline.lean 642ca34de962ee10b731fbcea8fbe133f9175323, 11–20.
- B/PublishedTheorems/GaloisGeometry₂/AlgebraicCharacterWD.lean 49a010a94e57d7598d65177d747524e701e35611, 14–23.
- A/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/Crys.lean 8f176341db3f423d5ea0f163c814084f7f596a1d, 32–62.
- A/ThetaCorrespondence/GaloisRepresentations/HeckeDeRham.lean 9ad3fc6146b94549bc004cb88b6133220949f268, 3.
- src/Development/WeilBound/CoreStatements/PublishedTheorems/HeckeLAdicCharacters/Outright.lean f5aae4dbfa02d46165a820744628f0464eb87824, 7–8.

Actual execution: 70/70 source anchors in these 15 pinned files matched via GitHub connector; blob IDs recorded, not independently rehashed. V8 finite arithmetic regressions below actually ran: normalization 70,956; norm-fibre regrouping 323,400; integer degree shift 2,001; scalar nilpotence 1,440. Wrong sign fails 56,320/70,956 normalization cases. All asserted positive checks passed. These are elementary finite algebra checks only, not tests of actual local fields or period rings. Reproduce source reading by git checkout PIN, git hash-object paths above, inspect referenced ranges. Reproduce arithmetic with this JavaScript (same loops as actual run):
```js
const primes=[5,7,11,13,17,19];
const c={normalization:0,fibre:0,degree:0,monodromy:0,signNegative:0};
function check(x){if(!x)throw Error("failed")}
function pow(a,n,p){let r=1;n=((n%(p-1))+(p-1))%(p-1);for(let i=0;i<n;i++)r=r*a%p;return r}
for(const p of primes)for(let x=1;x<p;x++)for(let y=1;y<p;y++)for(let a=-4;a<=4;a++)for(let b=-4;b<=4;b++){
 let u=pow(x,a,p)*pow(y,b,p)%p,v=pow(x,-a,p)*pow(y,-b,p)%p;
 check(u*v%p===1);c.normalization++;if(u*u%p!==1)c.signNegative++;
}
for(const p of primes)for(let x=1;x<p;x++)for(let y=1;y<p;y++)for(let z=1;z<p;z++)for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++){
 check(pow(x*y%p,a,p)*pow(z,b,p)%p===pow(x,a,p)*pow(y,a,p)%p*pow(z,b,p)%p);c.fibre++;
}
for(let d=-1000;d<=1000;d++){check((-d-1)+d===-1);c.degree++}
for(const p of primes)for(let v=0;v<p;v++)for(let k=1;k<=20;k++){
 let r=1;for(let i=0;i<k;i++)r=r*v%p;check((r===0)===(v===0));c.monodromy++;
}
check(JSON.stringify(c)===JSON.stringify({normalization:70956,fibre:323400,degree:2001,monodromy:1440,signNegative:56320}));
console.log(c);
```

RESUME HERE: reconstruct the exact ExField producer in ThetaCorrespondence/AlgebraicCharacters/ExField.lean, especially construction of an extension retaining a specified degree -1 Weil action while making the restricted degree-zero Artin images lie in the prescribed neighborhood; trace ArtNorm if needed. This is the deepest distinct arithmetic premise in df_one, not a repeat of weight cancellation or the Grok gal field trace. Coordinate patching priorities with Grok and literature lane. Do not claim the external blueprint's coverage or independent Lean kernel verification.
HANDOFF TO: integration, editor, audit, Grok galois_rows, theta, literature, character boxes. No physical gate/queue changes.