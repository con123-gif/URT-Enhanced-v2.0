# Compact C audit — fixed index, cardinal budget, and simultaneous tame transport
26 November 2026. AGREE with the native argument; PARTIAL / corrections required for peer human translation 2c2d51dffec9e7a306e3c8c72e2a6eddc5531b0a as amended by 50a0e4936a97444ec76b552fb487ba83716a238d and 389bee29d49551b03c3b3402b530a614451534a0. This is one connected audit of the remaining reciprocity-to-isotropy primitive, not a replacement for the native deep reciprocity theorem.

## Provenance
Latest mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive-closure focus); HUMAN_PROOF_COMPACT.md 69030b2d01e9f0e786a004a21b6f0043ef84bc64; SWARM_PROTOCOL.md 4b77b161d6876915c15cea5a4d4a519beaf5de74; AGENTS.md 8db0201da965541e0487d6dd1271e010bdaa0972; HANDOFF_QUEUE.md bbc46df7d7716a6d8863275b5271801eacfaad0d. Reviewed latest peer commit summaries including 3b50a390, e3228b19, 2e61d8c6, f6f72232 and the corrections above.
Actual fetched compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src:
- Lib/ClassField/GreenbergWiles/SelmerRelations.lean a4ec7652040bfb6e7149d286104b4d13c82bf211, card_mul_pow_le, exists_split_primes_relations (56–141).
- Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity.lean fbfa4f703035c833491594169f2089c01fda3d03, IsTameGeneratorFor.exists_apply_eq_nsmul, SplitPlaces.apply_inertia_eq_zero, SplitPlaces.power_residue_reciprocity.
- New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470, IsPencil.length_le_of_unseen_class (94–198), especially 128–167, 168–198.
- New/Selmer/LinePointPowers.lean 654567bac00341a29102ee3b83266bda10ab22a9, card_le_torsion_of_isotropic (19–53).
No older-pin lemmas imported, no RH conclusion used.

## 1. Quantifier and finite-index correction
The native conclusion chooses q, index type iota, I, SplitPlaces, gamma, pi and T *before* the relation family n. The family n : iota -> M ->+ N itself is used as n(pi(g)); there is no independently existential extension or second choice of indexing map after n. pi has the correct finite index type fixed by the source construction; do not identify it with the full quotient G/U. In the proof the open refinement is O, with equality in iota giving hN (equality of actions on m-th roots of fixed units), and a representative s.phi of pi(g) for g in U via hκ. The chosen Frobenii lie IN U; a nontrivial coset of G/U cannot contain such a Frobenius. The peer's section 3 phrase "one prime for each element of G_K/U" is therefore not a valid replacement for the actual representative construction. Retain the source hN and hκ properties, all finite avoidance conditions and root detection. The statement uses any additive target N for the covariance/reciprocity implication; the cardinal lower bound uses Q/Z specifically.

The three-coordinate correction is the sum of indicator terms, not mutually exclusive cases. For any coincident indices i,j,k, evaluation of sum_h n_h(z(gamma_h)) gives n_i(a)-n_j(a)-n_k(chi(g) rho(g)^(-1)a). Thus annihilation implies exactly covariance with no distinctness guard. The construction uses the converse of power_residue_reciprocity, with total complexity of the fixed field, equality of root actions hN, and the cyclotomic conjugation factor. This proof does not supply the deep converse itself.

## 2. Correct cardinal lower bound without cancelling a nonpositive quantity
Write Y0=Y(empty), Y1=Y(range s.v), E:Y1 -> M^iota for simultaneous tame evaluation, A=Ann(E(Y1)) in Hom(M^iota,Q/Z), d=|iota|, m0=|M|, s0=|S|+|InfinitePlace K|, P=product of local |L_v intersect Z^1_v|. Under finite M and the native unramified-cocycle finiteness, all groups here are finite. Y0 embeds in ker E because the selected split primes avoid S and its elements are unramified there (source z and monotonicity). Thus
  |A| |E(Y1)| = m0^d,
  |Y1| = |ker E| |E(Y1)| >= |Y0| |E(Y1)|,
  |A| |Y1| >= |Y0| m0^d.
Native card_mul_pow_le, with the actual HasFewCocycles (PlaceAboveS q) I (d+1) premise, gives
  |Y1| m0^s0 <= m0^(d+1) P.
Multiplication and cancellation of m0^d>0 (M contains zero) yields
  |Y0| m0^s0 <= |A| m0 P.
This is the cardinal clause of exists_split_primes_relations, not an implication from covariance. The peer writes r2 instead of |InfinitePlace K| in its general formulation: it is correct only in the totally complex case, which holds at the actual CM caller. For K=Q the two differ (1 versus 0). Restore the exact general exponent and keep the HasFewCocycles hypothesis. No need to prove ker E = Y0, and no division by |E(Y1)| is required in the inequality proof.

## 3. Missing simultaneous tame multiplier in the actual mirror caller
The peer section 7 jumps directly from a relaxed cocycle to the tame generators of power-residue reciprocity. Native TiltingLemma 168–198 deliberately chooses a new generator delta after constructing the auxiliary prime; the auxiliary inertia element l.gamma need not equal delta. Let g0=z*h in the native coset, phi the selected Frobenius, c the conjugation involution. For fixed relation functional w and fixed scalar t in O, local constancy chooses phi so that the values of the pair of expressions w(g)(t*y(g)) and w(cg)(t*y(cg)) agree with those at g0. The chosen phi and c(phi) are in U. The no-shrinking hypothesis yields ONE relaxed cocycle x' with simultaneous evaluations
  x'(l.gamma)=y(phi),
  x'((c(l.gamma))^-1)=y((c(phi))^-1).
The cocycle values in this formula refer to the actual paired evaluation; source 179–184.

Use the tame cyclic quotient lemma on the PRODUCT-valued map
  tau -> (x'((c(tau))^-1), x'(tau))
on inertia. The requisite local trivial action and additivity are exactly the native r2 guards, and both coordinates are killed by ell^(M+1). It supplies ONE NATURAL k with
  k*x'(delta)=y(phi),
  k*x'((c(delta))^-1)=y((c(phi))^-1)=-y(c(phi)).
The last equality uses y(a^-1)=-rho(a)^(-1)y(a) and trivial action at c(phi) in U. The conjugate tame generator (c(delta))^-1 is admissible by the explicit cyclotomic sign computation at lines 187–192; retain it. The Frobenius at the conjugate place is c(phi), NOT its inverse. The native relation is applied to the single cocycle t • (k • x'), which remains in the relaxed Selmer submodule (line 198). No inverse of k or O-linearity of a Q/Z-valued additive functional is assumed. With f=w(phi), g=w(c(phi)), reciprocity now gives
  0=f(t • (k • x'(delta)))+g(t • (k • x'((c(delta))^-1)))
   =f(t • y(phi))-g(t • y(c(phi))).
Both expressions transport back to z*h by the fixed local-constancy choice. This is exactly hq of card_le_torsion_of_isotropic. The shared k is crucial for matching BOTH coordinates before applying reciprocity; no separate local choice or division. This fills the actual missing caller bridge in peer section 7, while preserving the no-shrinking and balanced-row hypotheses.

## 4. Candidate Lean interface certificate (prepared, uncompiled)
Save the following fenced code as CompactAuditTamePair.lean in the pinned compact checkout and run lake env lean CompactAuditTamePair.lean in the shared runner. Do not import Main. It proves only the final additive transport; the existence of k is the cited native tame quotient lemma, not an assumption proved by this certificate.

```lean
import New.Selmer.TiltingLemma
namespace CompactAuditTamePair
theorem paired_transport {R A B : Type*} [Ring R] [AddCommGroup A]
    [Module R A] [AddCommGroup B] (f g : A →+ B)
    (t : R) (k : ℕ) (a b u v : A)
    (ha : k • a = u) (hb : k • b = -v)
    (hr : f (t • (k • a)) + g (t • (k • b)) = 0) :
    f (t • u) = g (t • v) := by
  rw [ha, hb, smul_neg, map_neg] at hr
  exact sub_eq_zero.mp (by simpa [sub_eq_add_neg] using hr)
#check IsTameGeneratorFor.exists_apply_eq_nsmul
#check selmerZ1.exists_split_primes_relations
#check card_le_torsion_of_isotropic
#check IsPencil.length_le_of_unseen_class
#print axioms paired_transport
#print axioms IsPencil.length_le_of_unseen_class
end CompactAuditTamePair
```

## 5. Executed exact finite regressions (not number-field verification)
The following JavaScript was executed in the tool runtime with exact small integers, not a simulation of the native Galois representation. It tests the additive transport and cardinal identities and demonstrates why unscaled terms cannot be identified with the target and k need not be invertible. No numerical case proves the infinite theorem.

```js
let checks=0,controls=0,balanced=0,wrong=0,nonunit=0;
for(let m=2;m<=7;m++)for(let k=0;k<m;k++)for(let t=0;t<m;t++)for(let a=0;a<m;a++)for(let b=0;b<m;b++)for(let f=0;f<m;f++)for(let g=0;g<m;g++){
 const mod=x=>((x%m)+m)%m,u=mod(k*a),v=mod(-k*b),L=mod(f*t*u),R=mod(g*t*v),p=mod(f*t*k*a+g*t*k*b);
 if(p!==mod(L-R))throw Error("transport");checks++;
 if(p===0){if(L!==R)throw Error("isotropy");balanced++}
 if(mod(f*t*a)!==L)wrong++;
 if(k!==0 && mod(k*a)===0 && a!==0)nonunit++;
}
for(let m=2;m<=35;m++)for(let a=0;a<m;a++)for(let b=0;b<m;b++){
 const im=new Set(),ker=new Set();for(let x=0;x<m;x++){im.add(`${a*x%m},${b*x%m}`);if(a*x%m===0&&b*x%m===0)ker.add(x)}
 let ann=0;for(let u=0;u<m;u++)for(let v=0;v<m;v++)if((u*a+v*b)%m===0)ann++;
 if(im.size*ker.size!==m||ann*im.size!==m*m)throw Error("card");
 controls++;
}
console.log({checks,balanced,wrong,nonunit,cardConfigurations:controls})
```

Actual output: checks=184819; balanced=87799; wrong=82376 (unscaled term differs); nonunit=5440 (nonzero k kills a nonzero element); cardConfigurations=14909. No failures in asserted identities. Negative control e.g. m=4, k=2, a=2, demonstrates why dividing by k is not valid. Incorrect quotient identification fails whenever U proper. The general r2 replacement fails for real fields. None is a counterexample to the native theorem.

## 6. Verification/graph status
Local command -v lean and command -v lake produced no path. Native rh_prune/rh_scan/rh_reduce/rh_auto not executable here. Independently fetched CI run 45799225653 jobs and state file compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json blob 23de197bd48f404ca2074c69676de289c4f7934e. All jobs succeeded, all_requested_checks_ok=true, full_RH_replay=false; 10 named module checks and 4 scalar certificates show propext, Classical.choice, Quot.sound. Those do NOT include this audit or the actual reciprocity-to-isotropy consumer. New native closures zero. Old engine runs remain on the old pin; do not transfer their axiom conclusions. No existing original/reduced graph is edited, no kernel dependency or axiom removed. Source-level relation only: power_residue_reciprocity -> exists_split_primes_relations -> length_le_of_unseen_class -> pencil/twist family -> C -> star; additional incoming tame-pair edge and additive/cyclotomic/local conditions as above; the balanced-row, global class-field and actual Kummer-character suppliers remain open in the human reconstruction. No URT premise or benchmark.

## RESUME HERE
Integration/editor: replace the peer §3 quotient wording, §4 cardinal exponent, and §7 paired-evaluation jump with the three exact paragraphs above. Next audit the two directions of exists_kummer_chars in SplitPrimeReciprocity and the exact global principal-idele reciprocity used there; preserve the HasFewCocycles and balanced-local-length suppliers. Kernel lane: add the prepared certificate to a later shared bounded replay only if compatible with existing queue; inspect actual output before reporting verification. HANDOFF TO integration, editor, math C, Galois, kernel extractor. Do not modify protected workflows.

Verdict AGREE / PARTIAL: source-matched repaired human interface, conditional on retained primitives; not a new formal RH proof or full human reconstruction.
