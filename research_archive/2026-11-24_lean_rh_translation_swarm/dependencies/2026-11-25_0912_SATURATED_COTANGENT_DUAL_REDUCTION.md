# RUN27 — reduce native LemmaM′ to a finite DVR duality bound
25 November 2026. Lane 12. RH OPEN. Human exact mathematical derivation, source-matched; native certificate prepared, not compiled. This closes the *human argument* for the lower length adapter, not the upper length bound or the prime-window estimate.

Preflight: read latest ONE_EQUATION_MISSION.md blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 including mandatory unified engine, SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, RESEARCH_STATE/RESEARCH_LOG/RESEARCH_PROTOCOL/CONTINUITY excerpts and research-state summary (orchestrator 45579236958, not RH verification). Reviewed previous lane checkpoint bba1c8d97be8b829286777eaef89dab8278722de, recent peer commit list and full acceleration 6fec2caefa872596927381270a007a73067b233b (different geometric selection branch). Latest peer integration d5e73014 and editor f5bab469 address signed geometry, not the integral length adapter. Branch head observed 6fec2caefa872596927381270a007a73067b233b before write. Upstream pinned 40e56bab026552e089d7afcfeff08d2defb9c005; latest main observed ef451fc356cbc66861df031531aaafd2843797ac, not mixed. This is not an exhaustive review of every historical peer file.

## 1. Exact native definitions and source chain
Paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties at pin:
- CommutativeAlgebra/ResMapBijective.lean f4459dbda68c29e497387f5fe2f20191c3f45ba6 defines PtDer, HasWt, satSq, cotLat, cotSpan, SpansCot and cotLen.
- CommutativeAlgebra/OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15 defines M1–M5, LemmaM, LemmaM′ (Lean spelling LemmaM').
- UnitaryThreeGroups/ConjStable.lean 21bf08ed788963953d2f8f6dc0d4a62e4d3b5bd3 defines Model.len as cotLen M.x M.𝒜 (-1) M.Q.F, and Model.lift.
- UnitaryThreeGroups/ModelLower.lean 379b0931221b31a8931364fec40eb0bd9ad8962a supplies model_lower using main_der and LemmaM′.
- UnitaryThreeGroups/VlenLe.lean 7366053a17524d379ac789425deea06678f2d3bf uses model_lower with h2 from dat_facts, then the directed torsion length lemma.
- ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44 remains the distinct upper length supplier via LemmaM.

Original path from RUN26: countI -> corGK (PropGK supplied at caller) -> oneChar_unramU -> vlen_le -> model_lower -> LemmaM′. The arrow to LemmaM′ is a predicate argument used as a function, not a newly authenticated kernel edge. Exact declaration of Alg.M.mprime_holds and Alg.M.main_holds not yet located; direct filename guesses failed. Do not claim their original body was recovered.

## 2. Human proof of the exact LemmaM′ statement
Let O be the native DVR, with finite residue field of size q>1, and x:A→O the native graded augmented algebra. Let I=ker x, S=satSq x={f: exists nonzero b in O, b f in I²}, L=image of A_j∩I in A/S, U=span of the images of F_i, and Q=L/(L∩U). This is precisely the module defining cotLen, not the ordinary unsaturated I/I². Retain all native hypotheses: graded decomposition, x vanishes on A_j, F_i homogeneous of weight j, c≠0, O-module M, additive injection D:M→Hom_O(A,O/(c)), D_mu(F_i)=0, and each D_mu is reduction of an integral x-derivation d_mu supported in weight j. No linearity in mu is assumed.

**Key equation:**
    |M| ≤ |Hom_O(Q,O/(c))| ≤ q^length_O(Q)
when length_O(Q) is finite. Thus length_O(M) ≤ length_O(Q), with the infinite-length case immediate in extended naturals.

Proof:
1. Each integral derivation kills I² by the Leibniz rule. If b f∈I² with b≠0 then b d_mu(f)=0 in the domain O, hence d_mu(f)=0. Consequently D_mu kills S. This step cannot be done with a modular derivation alone.
2. Restrict D_mu to A_j∩I and descend to L. Every F_i belongs to A_j∩I, and D_mu vanishes on each F_i, hence on their span U (which lies in L). The resulting map on Q is O-linear. Its construction is independent of the chosen integral lift: it is defined by D_mu itself. Restriction/descent is additive in mu, so the map M→Hom_O(Q,O/(c)) is additive.
3. This map is injective: equality on Q implies equality of D_mu and D_nu on A_j, because all of A_j is in I. On all other weight spaces both vanish, as their integral lifts do. The graded direct-sum decomposition gives equality on A. The original additive injection implies mu=nu. This proves the first cardinality inequality without an assumed O-linear map in mu.
4. If Q has infinite length, no finite bound is asserted and the theorem is trivial. If length(Q)=n<∞, choose a composition series of Q with n factors isomorphic to O/(pi), where pi is a uniformizer. For 0→Q'→Q→k→0, restriction Hom(Q,O/(c))→Hom(Q',O/(c)) has kernel Hom(k,O/(c)). The latter is annihilator of pi in O/(c), of cardinality q for c a nonunit and 1 for c a unit. Each nonempty fiber is a coset of the kernel. Induction from the zero module gives cardinality ≤q^n, without assuming that restriction is surjective, that L is finite/free, or that the algebra is finite type.
5. M injects into a finite set, so M is a finite O-module, hence of finite composition length (finite cardinality excludes infinite strict chains). Its simple factors are k and cardinality multiplicativity gives |M|=q^length(M). Since q>1, the conclusion follows. This proves exactly the LemmaM′ statement from standard module theory, without appealing to the upper bound, geometry, RH or an unproved asymptotic estimate.

No assumption of a principal Dirichlet character was needed for this generic adapter; the result therefore also applies in the exact principal context. The native lower length assembly now needs only the actual admissible cocycle injection and integral lifting (main_der and Model.lift), not an independent quantitative theorem for LemmaM′. Keep those hypotheses and all Vlen torsion-union quantifiers. This local reduction does not prove their construction.

## 3. Correct previous counterexample to use the actual saturation
RUN26 used O[X]/(pi^m X,X²) with ordinary I/I². Its stated ordinary cotangent length m is correct, but it is NOT the native cotLen: X belongs to satSq since pi^m X=0, and the saturated weight -1 lattice vanishes. Do not carry the ordinary cotangent example into the native length ledger as if it measured cotLen.

Corrected counterexample to a **weak-premise** generic-fiber shortcut: take ambient A=O[X], x(X)=0, deg X=-1, and impose F={pi^m X} (and optionally G={X²}, which does not affect the weight -1 length). Then satSq=(X²), L=OX, U=O pi^m X, Q≅O/(pi^m) and cotLen=m. Generic solution set of these equations is only X=0, so there are no two-signed points and the trace-product over an empty set is 1. m is arbitrary. This is not a counterexample to LemmaM with its full M1–M5: the ambient ring lacks the required positive-weight smooth dimensions. It shows why one cannot bound the native saturated length by generic point data *without* integral geometric hypotheses. A separate necessity test for LemmaM′: in the original torsion algebra, D(X)=1 mod pi^m defines a modular derivation, but has no integral lift. With F empty, modular derivation data alone would violate the length bound of zero. Thus the lift cannot be dropped.

## 4. Native reduction engine and evidence
Independently retrieved the published compute status.json for rh-recursive-reduction-strip-root-20261125 (pass, 98.87s, run 45577239749) and rh-proof-term-prune-native-20261125 (pass, 77.94s, run 45576756833). Axioms of conditional root: propext, Classical.choice, Quot.sound; prior bounded scan 2000 nodes, 324 pending. Those are earlier engine results, NOT verification of this cotangent theorem. Read native RHProofTermPrune.lean and RHRecursiveReductionAutoV3.lean from working branch.

Candidate actual unused binder: the first explicit IsUnit (2 : O) premise of model_lower is discarded by its source intro (S M _ hm hM hU hΨ hN); inspect elaborated value before deleting. Other caller uses of h2 must be retained. No assumption that all binder pruning is globally sound. In pinned environment, compile the existing engines as modules; then execute this prepared Lean certificate (do not import Main):
```lean
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.VlenLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

rh_scan UpperTheory.V.U3.model_lower limit 2000
rh_prune UpperTheory.V.U3.model_lower as RHNativeModelLowerReduced
#print axioms UpperTheory.V.U3.model_lower
#print axioms RHNativeModelLowerReduced
#print axioms RHNativeModelLowerReduced.original
rh_scan RHNativeModelLowerReduced limit 2000
rh_scan UpperTheory.V.U3.vlen_le limit 2000
#print axioms UpperTheory.V.U3.vlen_le
```
If no reduction generated, retain original and log the failed candidate rather than force it. Then replay the vlen_le caller with the generated reduced theorem and exact original statement, verifying no extra axioms. Apply rh_reduce with the finite-length cardinality and injection transfer rules when formalized; use rh_auto/rh_auto_frontier for typed elementary goals with backtracking and exact context key (pin, DVR, c, grading, x, F, lift witness, caller); do not use arbitrary library search to close a named open RH supplier. No new Lean executable or actual CI result for this certificate obtained this run. No new scan/runtime scaling or URT result.

Executed in JS tool runtime: 24 source/blob assertions over four exact pinned files; 300 exhaustive finite cyclic-dual cardinality controls over Z/(p^a)⊕Z/(p^b), p∈{2,3,5}, 0≤a,b≤4, 1≤c≤4, target Z/(p^c). For each summand enumerated x with p^a x=0 modulo p^c, checked product equals p^(min(a,c)+min(b,c)) and is ≤p^(a+b). All checks succeeded, 138 strict cases. These are elementary algebra regression controls, not native arithmetic data, not evidence for RH. Reproduction:
```js
let total=0, strict=0;
for (const p of [2,3,5]) for(let c=1;c<=4;c++) for(let a=0;a<=4;a++) for(let b=0;b<=4;b++){
  const mod=p**c; let count=1;
  for(const e of [a,b]){let n=0;for(let x=0;x<mod;x++)if((p**e*x)%mod===0)n++;count*=n;}
  if(count!==p**(Math.min(a,c)+Math.min(b,c))||count>p**(a+b))throw Error("dual count");
  if(count<p**(a+b))strict++;total++;
}
if(total!==300||strict!==138)throw Error("control count");
```
Source checks: verify exact four blobs ResMapBijective, OrbitVanishingLocal, ModelLower, VlenLe above; verify 7 names/definition snippets (satSq,cotLat,cotSpan,cotLen, Module.length O (cotLat x 𝒜 j ⧸, PtDer, HasWt); 6 LemmaM′ snippets (def LemmaM' : Prop, [Finite (ResidueField O)], Function.Injective D, (∀ μ i, D μ (F i) = 0), D μ f = Ideal.Quotient.mk _ (D' f), Module.length O M ≤ cotLen x 𝒜 j F); 4 model_lower snippets (IsUnit (2 : O) → Marks, S M _ hm hM hU hΨ hN, refine hM O M.A ℤ M.𝒜 M.x (-1), private theorem main_der); 3 VlenLe snippets (exact model_lower S M h2 hg hM', private theorem len_of_torsion, Kum.lenDirected). Original role graph and unresolved axiom evidence preserved unchanged.

RESUME HERE: locate Alg.M.main_holds via exact native index/source paths (not guessed filenames), audit its determinant/valuation argument with the *saturated* lattice definition, and isolate the integral contribution of M1–M5. Batch the prepared actual model_lower prune/scan/caller check with kernel lane in pinned native environment, and audit the finite DVR argument independently. Upper cotangent length, uniform trace arithmetic and geometry remain OPEN; no complete RH proof.
HANDOFF TO Galois, kernel, integration, literature and audit.