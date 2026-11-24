# Run 5 — ExField: finite field extension retaining inverse Frobenius and separating inertia

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of ExField, including the primitive-root degree detector and residue-cardinality proof. This expands Run 4's exact open obligation, not its correction-character algebra. No independent Lean kernel run, full-proof completion or URT performance claim.

## Continuity and source pin

Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, actual runner log/protocol and continuity, latest peer handoffs (theta, character boxes, literature, acceleration, kernel, prime, Landau, positivity, editor, integration). Cathedral CI #364, 45379182627, PASS at 11:14:39Z, not RH validation. No physical gate changes. External blueprint referenced in queue, not used as mathematical evidence.

Source repository leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head ba5e02170fcf8bc19acf4d63110f5eb85f8c0161, 11:18:50Z. ExField.lean removed as standalone file; current producer found in ContinuousRankOneRep.lean, blob fb0bdf5416986c8a291ace6ba2fadc618722623a, lines 715–789 (open_sub, exField). 99/101 nonblank trimmed pinned body lines occur in current file; changed lines in norm_le_of_pow use Polynomial.natDegree_X_pow_sub_X and Polynomial.X_pow_sub_X_ne_zero instead of old FiniteField names. Root detector current file blob 9e10f62f1fe2955d87d188dde19f99ab48afc369, lines 57–122; 63/64 nonblank pinned body lines occur, with the norm membership step expanded by simp [normV, Ideal.absNorm_apply, Submodule.cardQuot_apply]. This is a textual migration check, not a general cross-revision equivalence proof. Keep original pin for derivation.

## 1. Statement and quantifier scope

Fix number field F, algebraic closure Ω with F-algebra structure, valuation subring A of Ω, nonzero finite prime w of F and h:IsPlaceOver A w. Put G=Gal(Ω/F), q=normV w=#(O_F/w)>1, W=Weil h, I=inertia at A, K=F_w. Let a:W→K^× satisfy IsLocalArtin h a. Fix σ∈W with deg σ=-1 and ANY neighborhood V of 1 in K^×.

ExField asserts existence of an intermediate number field F' inside Ω (Ω still its algebraic closure), a prime w' with IsPlaceOver A w', and σ'∈Weil h' inducing the SAME automorphism of Ω as σ. For EVERY s∈Weil h, s'∈Weil h' with deg s'=0 and the same action on Ω, a(s)∈V. F' may depend on σ and V. V need not be a subgroup or even open. Do not replace equality of actions by equality of residue actions. The native theorem exField takes GlobalArtinReciprocity as an input, although its displayed proof introduces this argument anonymously and uses the supplied local-Artin continuity.

## 2. Degree detector from a primitive root

For each positive integer k, set N0=q^k-1>0. Algebraic closedness and characteristic zero give ζ∈Ω a primitive N0-th root. Since q∈w, N0∉w (otherwise q^k-N0=1∈w). Thus v_A(N0) is not less than 1. Also v_A(ζ)=1, by multiplicativity and ζ^N0=1.

The relevant reduction is injective on roots of unity of order dividing N0: if x^N0=y^N0=1 and v_A(x-y)<1, then x=y. In GlobalA.lean this is eq_of_pow_eq_one, by passing to x/y, whose valuation difference from 1 is less than 1, and eq_one_of_pow_eq_one. In human terms if z=x/y differs from 1, then 0=(z^N0-1)/(z-1)=1+z+...+z^(N0-1), but its reduction is the nonzero residue of N0. This argument needs the order prime to the residue characteristic.

For g∈W fixing ζ, write m=|deg g|. The native definition ActsAs(A,q,g,a,b) asserts g preserves A and (g x)^(q^b) ≡ x^(q^a) modulo the maximal ideal of A for EVERY integral x. The degree is a-b, independent of witness. By actsAs_of_deg:
- if deg g=m≥0 use (a,b)=(m,0);
- if deg g=-m<0 use (a,b)=(0,m).
Since gζ=ζ, either branch gives ζ^(q^m)≡ζ. Both are N0-th roots, so they are equal, hence ζ^(q^m-1)=1 and q^k-1 divides q^m-1. Using gcd(q^k-1,q^m-1)=q^gcd(k,m)-1 and strict increase of powers for q>1 gives gcd(k,m)=k and k|m. Thus k divides the signed deg g, including zero. This proves exists_fixed_dvd_deg. The implication uses primitive order, not just ζ^N0=1.

## 3. Open subgroup containing σ while cutting out inertia

Take ANY open identity neighborhood t in G. Profinite topology provides an open NORMAL subgroup N contained in t. Its finite quotient has positive order k=[G:N]. Choose ζ by section 2. Its stabilizer is open (ζ algebraic). Choose open normal N' contained in this stabilizer, and put M=N∩N', U=<σ> M, with <σ> the integer-power cyclic subgroup in G. M is open normal; U is a subgroup and open because it contains M. σ∈U.

For s∈W∩U of degree zero, normality allows decomposition s=σ^j n, j∈Z, n∈M. The element n, now regarded as σ^(-j)s in W, has deg n=(-j)(-1)+0=j. Since n∈N', it fixes ζ, so k|j. Lagrange applied to G/N gives σ^k∈N; hence σ^j∈N, including negative j. Since n∈N, s∈N⊆t.

This is the entire open_sub argument. It does not require N or U to lie in W, nor U normal. Without the extra root stabilizer N', the decomposition cannot force k|j. Example: in W=Z×C2, projection to C2 with N its kernel, σ=(-1,1), the degree-zero element (0,1) lies in <σ>N but outside N. The additional degree congruence fixes precisely this failure.

## 4. Turn the subgroup into the desired field

First choose an open V0 with 1∈V0⊆V. IsLocalArtin.cont is used on inertia: pull V0 back along I→W→K^×. This is open in I with its induced topology from G, so choose open t⊂G whose preimage in I is exactly this set; 1∈t. Apply section 3 to obtain U.

Take F'=Ω^U. Because U is open, it is also closed and its index finite. Infinite Galois correspondence identifies Gal(Ω/F') with U, and F'/F is finite. F' is a number field and Ω an algebraic closure of F'. No normality of F'/F is asserted.

Construct w' explicitly: each x∈O_F' maps to A, since x is integral over A (integral over Z⊂A) and valuation subrings are integrally closed. Pull the maximal ideal of A back along O_F'→A; its contraction to O_F is w by IsPlaceOver. It is prime and nonzero because it lies above w. This produces a height-one finite prime w', with residue-field injection O_F/w→O_F'/w' giving q≤q'=normV w'. This is val_int_le/place_above.

The key remaining step is to prove q'=q, not merely q' a power of q. Since σ∈U, σ fixes F'. Its degree -1 gives ActsAs(A,q,σ,0,1), so for x∈O_F' the reduction satisfies x^q=x (because σ fixes x). Hence every element of the finite field O_F'/w' is a root of the NONZERO polynomial X^q-X of degree q (q>1). Root counting gives q'≤q; together with injection, q'=q.

Now regard σ as an F'-automorphism σ' of Ω. Its old ActsAs(A,q,σ,0,1) witnesses membership in Weil h' precisely because q'=q. The same witness gives degree -1 there, although ExField asks only for existence of matching σ'. This is why a generic restriction to F' without residue-cardinality control would not suffice.

For matching s,s' with deg s'=0, s' is inertia at A, hence s also acts trivially on the residue and belongs to I (it already preserves A). Also s fixes F' because s' does, so s∈U. Thus deg s=0 and section 3 gives s∈t. By construction of t's preimage in I, a(s)∈V0⊆V. This proves the universal clause for all matching pairs, not just an existential pair.

## 5. Join to the original downstream proof

Run 4 df_one: if a correction character d has d(σ)≠1 for deg σ=-1, choose V={x:A_wt(x)≠d(σ)}. It is an identity neighborhood by continuity and A_wt(1)=1. ExField produces F',w',σ'. Independently df_res (using ChRes, ArtNorm, coefficient equivariance, local algebraicity and uniqueness) produces matching degree-zero s,s' with d(σ)=A_wt(a(s)). The universal ExField conclusion contradicts that equality. Then d is trivial on inverse Frobenius and hence Frobenius; multiplying any element of degree m by frob^(-m-1) proves triviality on all W. This supplies LocWD, then Crys.alg and rank-one inputs to CoreAll and Row0b, with all remaining premises preserved. No direct jump to RH.

## 6. Source provenance and tests

Pinned files, Git blob SHA retrieved from connector (not locally rehashed):
- src/Development/AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/ExField.lean 606c3aea548ce2a8a128a525f3e4f19f8d97fabf (val_int_le, place_above, norm_le_of_pow, open_sub, exField; full file).
- same directory EmbOrbit.lean f7b21c5d5a970b595c05d7b2226e9c2854b6622b, ExField at 78–85.
- same directory ContinuousRankOneRep.lean 028d93377a68710f3e21da03eff798ff7fd103af, df_res 244–285, df_one 288–298, core and locWD 300–313.
- same directory ArtNorm.lean 7b614e8699e85e572a7ca903b3f8fdc5020acbf7, native norm compatibility producer inspected but its global reciprocity proof remains separate next task.
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsRootOfUnityFixedDvdWeilGroupDegree.lean 75d5199853eb7e6dfdae3aa35ed5d7cf9b0a0c66, 8–26 and 30–73.
- src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/ExistsNotCongPow.lean b2073e33bd1c02961acda3ab878dce8b45caf88c, ActsAs 70, deg 168, actsAs_of_deg 208, deg_eq_zero_iff 218.
- src/ReciprocityTheory/GaloisValuations/GlobalA.lean f193f6e2a17963f821834b9cdc5dee96c52cfbab, 73–106, unit roots and injective reduction.
- src/ReciprocityTheory/GaloisValuations/Global.lean cb4c9727d3c18cfdf185fa0958a4f11d21a5a43f, imports GlobalA/B.

Actual V8 run below returned divisibility=34200, negativeDegrees=33750, quotient=4100, nonAbelian=126, unprotected=78616, explicitNegative=1. The first four counts are 72,176 elementary positive regression cases; unprotected counts counterexamples to the omitted guard in the finite cyclic quotient model, not failures of the source proof. These are checks of the actual algebraic steps, not tests of arbitrary local fields or infinite Galois theory. Source comparison counts are separate and not kernel validation. Reproduce by checking out pin and using git hash-object on named files; JS replay:
~~~js
function regression(){
 const a=(x,m)=>((x%m)+m)%m;
 const assert=(x,msg)=>{if(!x)throw Error(msg)};
 let divisibility=0,negativeDegrees=0,quotient=0,unprotected=0,nonAbelian=0;
 for(let q=2n;q<=19n;q++)for(let k=1n;k<=25n;k++)for(let m=0n;m<=75n;m++){
  const n=q**k-1n;assert(((q**m-1n)%n===0n)===(m%k===0n),"root order");divisibility++;
  if(m>0n){assert((-m%k===0n)===(m%k===0n),"negative degree");negativeDegrees++}
 }
 for(let n=1;n<=40;n++)for(let g=0;g<n;g++)for(let j=-2*n;j<=2*n;j++){
  const m=a(j,n);const q=a(j*g,n);
  if(m===0){assert(q===0,"protected quotient");quotient++}
  if(q!==0)unprotected++;
 }
 const S=[[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]];
 const comp=(x,y)=>y.map(i=>x[i]);const same=(x,y)=>x.every((v,i)=>v===y[i]);
 for(const g of S){let z=S[0];for(let j=0;j<=120;j++){if(j%6===0){assert(same(z,S[0]),"S3 quotient");nonAbelian++}z=comp(g,z)}}
 assert(unprotected>0,"negative control");assert(a(1,2)!==0,"unguarded C2");
 return {divisibility,negativeDegrees,quotient,nonAbelian,unprotected,explicitNegative:1};
}
console.log(regression());
~~~

RESUME HERE: reconstruct the native ArtNorm producer in AlgebraicCharacters/ArtNorm.lean, especially glob_norm: finite quotients of the abelianized Galois group, density of diagonal elements and uniformizers away from finitely many primes, residue-degree normalization of local norms, and the final injectivity of global Artin on local ideles (Chevalley units). This is distinct from ExField and finite-product regrouping in Run 4. Map the actual producer of FrobDense.eq_one_of_away and artin_localIdele_injective; keep their hypotheses and record current clump migration. Coordinate with literature and Grok galois_rows to avoid duplicate patching work.
HANDOFF TO: integration, proof editor, formal audit, theta, literature, Grok galois_rows. ExField source-matched human proof with explicit standard lemmas; no independent Lean replay or URT-specific speedup.
