# Human-readable RH reconstruction — twelfth edition (24 November 2026, 18:56 UTC)

**INCOMPLETE.** Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream latest observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (peer reports 18:24:32 UTC); previous editor head 307cef33f046955ee79dba47e0d828d06496d75f. No equivalence or migration assumed. No independent Lean kernel replay or URT acceleration claim.

The accumulated manuscript is one linked multivolume work. Read [I](2026-11-24_1056_INTEGRATED_MANUSCRIPT.md), [II](2026-11-24_1156_INTEGRATED_MANUSCRIPT.md), [III](2026-11-24_1256_INTEGRATED_MANUSCRIPT.md), [IV](2026-11-24_1356_INTEGRATED_MANUSCRIPT.md), [V](2026-11-24_1456_INTEGRATED_MANUSCRIPT.md), [VI](2026-11-24_1556_INTEGRATED_MANUSCRIPT.md), [VII](2026-11-24_1656_INTEGRATED_MANUSCRIPT.md), [VIII](2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), then IX below. This volume incorporates 11 new pinned peer documents; pin match is not a mathematical audit of their claims. Prior 116 primary + eight supporting chapters; nine new primary and two supporting reports under the same editorial counting convention, excluding the editor's own introductory derivations. Chapter count is not proof coverage.

## Native prime-pair producer: QDChoice

Status: SOURCE-MATCHED conditional human proof, not independent verification of the analytic antecedents. Previous VIII mapped HostGood and HostEx. This chapter supplies the actual first input to HostEx by reconstructing the two-stage q,d selection and assembler.

Fix 0<eps<1/52. Write y=x^(eps/5), L=log x, X1=exp(y), X2=exp(y L²). Keep eight analytic input propositions: ExplZeta, ExplChi, LogDerOne, ZeroCount, ZFRDirichlet, TZRat, PageThm, Jutila. None is silently equated to an established external citation. The two suppliers share these inputs but their constants and thresholds can differ.

### 1. Select q before d

ChoiceOfModulus.exists_prime_good_bounds selects q from P=PP(8,3,X1), primes congruent to 3 mod 8 with sqrt(X1)<q<=X1. The source invokes badChars_count_of_density(Jutila), g_chi_approximation_sum(first five inputs), card_primes_residue_ge_rpow(TZRat), multiplicative_weight_prime_sum(TZRat,PageThm,ZFRDirichlet), and eventually_sizes. These supply a bound C1(8X1)^(1/4) for the bad-character census, a uniform approximation with constant C, a lower count X1^(9/10), an average square-sum estimate with constant C3, and the large-x inequalities. QuadPrim.main identifies the conductors of the two primitive families as q and 8q, with real quadratic nonprincipal characters; it identifies values on positive integers for the first family. Preserve primality, mod-4 and distinctness guards.

For finite nonempty P and nonnegative f, mean(f)<=M, 4M<=t, t>0, the set where f>t has size <=|P|/4 because t times its cardinality is at most the total sum. If two other forbidden subsets each have size <=|P|/4, the union covers <=3|P|/4. A survivor has f<=t and is outside both subsets. This proves exists_avoid. Here f(q)=|sqSum(x,1,q)|², t=(x^(1/2+eps)/2)²; eventual 16 C3 L<=x^(2eps) gives 4M<=t for M=C3 x L. A q is forbidden if there EXISTS any eligible d for which the corresponding GoodAllFor fails. It maps injectively to a bad-character level q or 8q. level_mem_bad and card_le_of_levels bound these counts by the bad-character census, not the count of d. Eventually 4 C1(8X1)^(1/4)<=X1^(9/10)<=|P|. Thus the chosen q works for EVERY prime d≡3 mod4 distinct from q. The approximation error x^eps<=x^(1/2+eps)/2 since sqrt(x)>=2. The triangle inequality and survivor give |gChi|<=x^(1/2+eps), retaining the logarithmic derivative bound. This supplies two GoodAllFor and one BoundsAtX for the eventual same d. No imported analytic supplier removed.

### 2. Choose d on a compatible progression

SplitPrimeChoice.exists_prime_split_good_bounds accepts ANY q with the four guards from step 1. Form M=q times the product of odd primes <=floor(y); M odd, divisible by q and each odd small prime, no other prime divisors, M<=q 4^floor(y) by primorial_le_four_pow. Even if q occurs in the product no squarefreeness is required. The progression d≡8M-1 (mod 16M) is coprime: gcd(8M-1,8M)=1 and the residue is odd. The source takes L>=2, y>=3, 800L<=y, 2L²<=x^(eps/20), 16C3L<=x^(2eps), 8C1<=y, x>=4. Since q>exp(y/2)>=x^400, each prime divisor of 16M is either <=y or >x^400. Also log(16M)<=log16+y+y log4<=4y (using y>=3, log16<2.8, log4<1.4). Hence (L²/4)log(16M)<=log X2 and x^(eps/6)<=log X2. These are inputs to the conditional prime-count and multiplicative-weight suppliers.

For Q=8X1X2, B is the union of four images of the finite bad-character set under level/(8^k q^i), i,k∈{0,1}. QuadPrim.main gives actual level 8^k d q^i when the d exponent is 1. Exclusion d∉B implies all four GoodAllFor under the prime, congruence, distinctness and level<=Q guards. |B|<=4C1 Q^(1/4). The source uses 8C1<exp(y) (y>=8C1 and exp(y)>=1+y) and exp(y)Q^(1/4)<=X2^(9/10); the latter is equivalent to (log8+5y)/4 <= (13/20)yL², following from L>=2,y>=3. The prime count implies 2|B|<|P2| for P2=PP(16M,8M-1,X2).

Apply exists_small_pair to norms f,g of the two multiplicative-weight square sums i=0,1. Both average squares <=A=C3 x L, 4A<=T² with T=x^(1/2+eps)/2. If every point in P2 outside B fails at least one condition f<=T,g<=T, then f²+g²>=T² there. Since |P2 outside B|>|P2|/2, summing gives >|P2|T²/2, but both global sums together are <=2A|P2|<=|P2|T²/2, contradiction. A single d outside B meets both bounds. Its prime/window guards come from P2; q≠d follows sqrt(X2)>X1 since L²/2>1. M odd implies d mod16=7 and M|d+1. For odd p|M, -d≡1 mod p gives Kronecker symbol 1 by the Jacobi identity; p=2 uses d≡7 mod8. This proves the small-prime and q splitting conditions. The two BoundsAtX follow from boundsAtX_of_good with the i=0,1 good predicates, explicit-formula tail, and exact character sum identification by Kronecker/Jacobi rewriting. The other two good predicates k=1 are retained, not inferred from k=0. The original QuadPrim, explicit formula, density, multiplicative-weight mean and count suppliers remain open.

### 3. Assemble the same pair and conductor bound

Take x0=max(x1,x2,exp 5) for supplier thresholds and C=max(C1',C2') for positive bound constants (not census constants). For x>=x0 first obtain q, then d using that q; d≡7 mod16 implies d≡3 mod4 and d≠q since q≡3 mod8 and d≡7 mod8. Apply the first supplier's universal d clause to that actual d. The six Boxq fields are psDir(q), chi8*psDir(q) at cutoff 8X1, and chDir(d), chi8*chDir(d), chDir(d)*psDir(q), chi8*chDir(d)*psDir(q) at cutoff 8X1X2, all on modulus 8qd. The four latter are (i,k)=(0,0),(0,1),(1,0),(1,1). The three QDq fields concern psDir(q), chDir(d), chDir(d)*psDir(q); boundsAtX_mono_const permits C=max because log x>=0, with the first component unchanged.

For EVERY integer n with 1<=n<=2x^(2+8eps), log n<=log2+(2+8eps)L. Since q<=X1,d<=X2 and all are positive,

  log(4nqd) <= log4+log2+(2+8eps)L+y+yL²
             <= 4+3L+y+yL²
             <= 2yL².

Here log4<=3, log2<=1, 2+8eps<=3, L>=5,y>=1, and 4+3L<=L²-1<=y(L²-1). This is log_four_mul_nqd_le and supplies the eleventh Rowq conjunct. First ten are q primality, q mod8, lower/upper q bound, d primality, d mod16, lower/upper d bound, q splitting and all small-prime splitting. Bound is non-strict; VIII's later strict size bounds have separate premises.

Consequently exists_q_d_box_bounds_rows yields (x0,C>0) then for each x>=x0 ONE pair q,d with Boxq, QDq and Rowq for ALL admissible n. exists_prime_pair_box_bounds is a relay. qdChoice_of_explicitFormula reorders C,x0, introduces n, and specializes uniform Rowq at n. No separate q,d for the three conditions. All 11+3+6=20 fields retained. This completes the bounded conditional source-level assembler and finite prime-selection arguments, not the underlying analytic input proofs.

### 4. Exact HostEx join

HostExOfPublished.hostEx_of_zeroFreeRegion takes nine propositions (the eight above plus QuadraticHeckeZeroEstimates). Its five inputs to host_existence_of_choices: QDChoice from the eight; ThinChoice from first five; NormPrimes from projection .1 of norm_primes_and_level_prime applied to QuadraticHeckeZeroEstimates; SmallPrimeOne from TZRat; tops_choice. LevelPrime second projection is NOT used at this join. All nine proposition producers and exists_hostAx remain essential; the latter is not supplied by the prime choice proof. Direct source-level joins, not authenticated Main-role edges.

## Source ledger and execution

- [src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/QdChoiceOfHyp.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/QdChoiceOfHyp.lean) — blob 533565c9389f2c3270095101cfa40b6c02e8f703; qdChoice_of_explicitFormula
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimePairBoxBoundsStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimePairBoxBoundsStatement.lean) — blob bf5fa7d3d12aa04f64440de2ae6b5283c6b4fc06; exists_prime_pair_box_bounds
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimePairBoxBounds.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimePairBoxBounds.lean) — blob 2ae879b8d15d35a50fa494e11ff40d9fe1b5041e; exists_q_d_box_bounds_rows, boundsAtX_mono_const, log_four_mul_nqd_le
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeThreeModEightGoodStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeThreeModEightGoodStatement.lean) — blob d9e4fb88659a3ab6d30120c838278d124d263e4d; exists_prime_three_mod_eight_good
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeSevenModSixteenGoodStatement.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeSevenModSixteenGoodStatement.lean) — blob e53aa5652f0c57f230c65fc3073f4d264fa741e9; exists_prime_seven_mod_sixteen_good
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeThreeModEightGood.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeThreeModEightGood.lean) — blob d462d5da89dc2c4ecf970935884d3cc467577720; ChoiceOfModulus.exists_prime_good_bounds, exists_avoid, level_mem_bad, card_le_of_levels, eventually_sizes
- [src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeSevenModSixteenGood.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsPrimeSevenModSixteenGood.lean) — blob 63d0f141784d05ea4d25af6ecb54afc983994ed8; SplitPrimeChoice.exists_prime_split_good_bounds, exists_small_pair, exists_modulus, exists_bad_set, boundsAtX_of_good, kronSym_eq_one_of_dvd, kronSym_two_eq_one
- [src/Formalism/SharpRestriction/InertJacobiLevels/AsmIface.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/InertJacobiLevels/AsmIface.lean) — blob 1c01d77eca74ee32a49d3ec089b799c87c0d2c25; QDq, Boxq, Rowq
- [src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/LogCondLeThree.lean) — blob 8e3d3a30a2d801bf03b6f79dbee8415beb2484e3; QDChoice, ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice
- [src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExOfPublished.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/HostExOfPublished.lean) — blob e3057342dc9bbeb5263ff97a9a786fec9c920d54; hostEx_of_zeroFreeRegion

All ten pinned connector blob IDs matched; 54 literal source anchors checked successfully in a separate V8 call. Reproduce with git rev-parse PIN:PATH and git show PIN:PATH. Executed exact V8 BigInt arithmetic regression: {"log":9600,"markov":22775,"split":6480,"cong":6231,"neg":3,"total":45086}. Counts are not actual prime-window evaluations or validation of imported analytic inputs. Code below independently replayable in Node. No additional premises introduced.

```js
function regress(){
let log=0,markov=0,split=0,cong=0,neg=0;
const ck=(x,m)=>{if(!x)throw Error(m)};
for(let L=5n;L<=100n;L++)for(let y=1n;y<=100n;y++){ck(4n+3n*L+y+y*L*L<=2n*y*L*L,"log envelope");log++}
for(let N=1n;N<=100n;N++)for(let a=0n;4n*a<=N;a++)for(let b=0n;4n*b<=N;b++){let c=N/4n;ck(a+b+c<N,"quarter union");markov++}
for(let N=1n;N<=160n;N++)for(let b=0n;2n*b<N;b++){ck(2n*(N-b)>N,"strict half");split++}
for(let M=1n;M<=401n;M+=2n)for(let j=0n;j<=30n;j++){let d=8n*M-1n+16n*M*j;ck(d%16n===7n&&(d+1n)%M===0n,"residue");cong++}
ck(4n+3n*1n+1n+1n>2n,"small log control");neg++;
ck((8n*2n-1n)%16n!==7n,"even modulus control");neg++;
ck(2n*(8n-5n)<=8n,"bad-set guard control");neg++;
return {log,markov,split,cong,neg,total:log+markov+split+cong};
}
console.log(regress())
```

## Integrated reading order and completion audit

Begin with VIII's order; insert this chapter before native HostEx. Peer signature/unitary bound before two-block reducibility; Weil–Deligne independence after enlargement; finite-group identification before PsiPPTie; orbit restriction after VacK; holomorphic extension readout after residue separation; smooth reducedness before differential comparison; changeLevel injectivity before ind_unique; gain allowance before retained-top window; Gamma/Chernoff tails before Landau window inequality. These are editorial joins, not evidence of root reachability. Original links and hypotheses are retained.

Numbered remaining obligations (all OPEN):
1. GeoOne, TLiftK, CoreAll/Row0b, ExField, global-local/Green, FrobLaws.exists_ext, EmbOrbitAlt, LocPrime, TypeAt; native Signature/BoundB and representation leaves (new integration chapter advances conditional derivations).
2. RecTExists/VWin and host design: QDChoice expanded conditional on native analytic suppliers; ThinChoice, NormPrimes, SmallPrimeOne, TopsChoice, exists_hostAx, weight/HCVal/Val/kit and StagePow/ShortNorm producers.
3. Seven theta/literature inputs, 15 covolume premises, LD.res, HolLead, FourierZero, SiegelWeilStd, BRoad.eisBL, HC/HH, local closure and literature attribution; OrbRes peer expansion conditional.
4. StageU, definite-row, period/count/volume, WJ/WhMul, lowest K-type, Green leaves.
5. Nine same-witness closures, FamP/Val, height/lattice/thick density, initial ReadL/MjHTie/IdxDefs, native boundary/GAGA/slope/tDetD and low-prime/LinkG producers.
6. Analytic zero-density/explicit-formula and prime mean-square/count suppliers underlying QDChoice; Landau positive-part window inequality, tails, native caller, differentiation and pole hypotheses, independent audit of analytic joins.
7. Source/build/export equivalence, typed projections/challenge audit, metadata policy, independent kernel replay/axiom provenance. Reported mixed-export denominator 1,484,705 reachable declarations; authenticated human translation numerator unknown. New acceleration shared scan reports matching outputs, no URT gain inferred.
8. Independently audit each essential proof or exact established theorem citation, exact interchapter joins and root reachability; no full proof or publication validation yet.

Preflight: AGENTS, state/log/protocol and continuity excerpts, CI summary checkpoint 387 (physical CI only), swarm/handoff/expansion/spine, prior editor, current peer handoffs read. External blueprint not reopened; no physics changes. Source inventory and graph numbers are inherited reports, not re-executed here. Snapshot 5c10037aabb6205947fc8f7e32e440beb7d68c95, diff from acb198d2f6c74870e0156e9290ec40c3a683d94b. Peer chapters below are reproduced with provenance; not all nested archive history searched.

RESUME HERE: reconstruct actual g_chi_approximation_sum from GChiApproximationSumStatement.lean and imported proof (explicit formula plus truncated polynomial, derivative estimate and exceptions). Alternatively if another lane covers it, expand ThinChoiceOfZeroDensityStatement. Request typed root-role witnesses for qdChoice_of_explicitFormula, exists_q_d_box_bounds_rows, ChoiceOfModulus.exists_prime_good_bounds, SplitPrimeChoice.exists_prime_split_good_bounds, hostEx_of_zeroFreeRegion. Formal audit: q-first universal d exclusion, strict half cardinality, primorial support and log inequalities, 20 conjuncts, same-pair projection; preserve eight antecedents. HANDOFF TO formal audit, integration, dependency, kernel, math, literature, all specialists.

## Code-only peer artifacts
- [audit/2026-11-24_derivative_integral_uniform_audit.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/audit/2026-11-24_derivative_integral_uniform_audit.mjs)
- [dependencies/rh_combined_frontier_roles.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/dependencies/rh_combined_frontier_roles.mjs)
- [math/verify_change_level_injective_unit_lifting.py](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_change_level_injective_unit_lifting.py)
- [specialists/kernel_extractor/run12_role_frontier.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run12_role_frontier.mjs)
- [specialists/kernel_extractor/run_native_downstream_rc1.sh](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/run_native_downstream_rc1.sh)
- [specialists/on_acceleration/replay.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/replay.mjs)
- [structure/2026-11-24_1824_unrestricted_outtree_order.mjs](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/structure/2026-11-24_1824_unrestricted_outtree_order.mjs)


---

# Peer chapter — integration/2026-11-24_1800_SIGNATURE_AND_UNITARY_BOUND.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1800_SIGNATURE_AND_UNITARY_BOUND.md); blob 9edbc9b53a3a3d1912baa67dcd1eecb80fc340d8; pin named. Relative links refer to original location.

# Signature and unitary induction bound — integration run 11, 2026-11-24

RESULT: SOURCE-MATCHED / PARTIAL. One contribution: fill the two native positivity inputs used in the previous two-block reducibility chapter. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 307cef33f046955ee79dba47e0d828d06496d75f. No substitution of latest head. This is mathematical source reconstruction, not a kernel replay or the full RH proof.

## Index and peer handoff

Read SWARM_PROTOCOL first, AGENTS, state/log/protocol, continuity, HANDOFF_QUEUE, EXPANSION_15_LANES, prior integration, editor volume VIII and latest lane checkpoints via commits (see table). Root log/protocol and guessed RESUME_HERE.md files returned 404; recovered runner paths and actual committed filenames. An initially mistyped audit SHA failed 422; recovered exact SHA. A guessed Signature.lean returned 404; actual producer is PosMkIff.lean. Not all nested Grok archives or external blueprint reread. Latest general CI checkpoint #384 PASS (45447821218, 17:43:15Z), not this proof's validation.

Main reading index: [editor volume VIII](../specialists/proof_editor/2026-11-24_1756_INTEGRATED_MANUSCRIPT.md), which links I–VII, plus [prior integration](2026-11-24_1700_TWO_BLOCK_REDUCIBILITY_REVERSAL.md). Editor reports 107 prior primary + 7 supporting, nine new primary + one supporting = 116 primary + 8 supporting peer entries, not unique theorem or full-proof coverage. Add this chapter separately (not yet editor-integrated). Prior export count 1,484,705 declarations under conservative policy is a reported denominator, not a count of translated declarations. No percentage computed.

| Lane | Latest checkpoint commit prefix | Next obligation |
|---|---|---|
| dependency | c35d085 | role-labelled outgoing projection for seven authentic frontier refs; ctor has three fields incl. both Row slots, no proof value |
| structure | 4ad5898 | enlarge authenticated owner ideal once outgoing roles available |
| math | 98ed759 | changeLevel_injective and unit-map surjectivity |
| audit | 91ebc5c | DerivInt/GPsi derivative producer and y>=1 guard |
| acceleration | 6f308d9 | matched 15-scan solution baseline |
| kernel | b28cdca | downstream fixture for imported axiom cache |
| prime | 64ee566 | actual LinkG retained-top producer |
| Landau | d380871 | kernelIntegral incomplete-gamma tails |
| theta | 2f75644 | orbRes zero-column and nonsingular vanishing |
| Galois | d1216e7 | frob_laws source and fixed-field proof |
| boxes | c85e003 | actual finiteGroupIdentification_fixedPlaces |
| literature | 421b2b2 | smooth-reduced supplier and affine factorization |
| geometry | 11d241e | holomorphic_extension_section_reading |
| editor | acb198d | volume VIII / host construction; keep conditional |
| integration | a20bf40 | this chapter fills Signature and Bound |

Reviewer finding from kernel RUN11: fresh collector sees guardProp on all three isolated queries, while shared queries depend on order; imported cache undercount propagation remains an open experiment, not a kernel soundness defect or evidence against RH. Retain all conservative edges and separate axiom reporting from independent kernel validation. No claim that this chapter has independent reviewer approval.

## 1. Signature — exact hypotheses and uniqueness

Let W be finite-dimensional complex vector space, I any index type, iota:I→I surjective (retain the source hypothesis; the body introduces it anonymously), and T_s(i) complex-linear endomorphisms. For every i,w,linear functional l, s→l(T_s(i)w) is continuous on R. For every s>=0 the only subspaces invariant under all T_s(i) are 0 and W. At each such s there exists a nonzero Hermitian sesquilinear form B, linear first and conjugate-linear second, with B(T_s(i)v,w)=B(v,T_s(iota(i))w). At zero there exists a positive definite such form. The conclusion is that EVERY nonzero Hermitian invariant form at EVERY s>=0 is either positive definite or negative definite. W is nontrivial in the concluding branch because B is nonzero. No continuous choice of B_s is a premise.

For fixed s, the left radical of an invariant B is invariant under all T_s(i), directly from the invariance identity. If B≠0, simplicity forces radical zero (ker_bot). For a nonzero B0 and arbitrary invariant B, map W into C^n by evaluating their conjugate-linear functionals at a basis. Evaluation E is injective; E∘B0 is injective and, by equal finite dimensions, bijective. The complex endomorphism A=(E∘B0)^(-1)∘E∘B has an eigenvector x≠0 with eigenvalue c. Thus (B-cB0)(x,-)=0. The difference is invariant; if nonzero its radical would be zero. Therefore B=cB0 (uniq). When both forms are Hermitian, evaluate at a pair where B0(v,w)≠0 and compare conjugates to get c=conj(c), hence real (real_of). Nonzero B implies c≠0. This does not require the operators T_s to be a group representation.

## 2. Closed and open positive-form locus

Define D={s: there exists a Hermitian invariant positive form}; P=D∩[0,∞) as a subset of the half-line. The source uses a fixed basis, Gram entries M_ij=B(e_i,e_j), and the finite polynomial q_M(x,y)=sum x_i conjugate(y_j) M_ij. The inverse construction mk(M) and gram are mutually inverse. Scale any nonzero form by the positive reciprocal Gram norm so its Gram matrix is on the compact unit sphere; the normalization is legal because gram is injective. This preserves Hermiticity and invariance. For s_n→p, choose normalized forms and a strictly increasing subsequence converging to M of norm one. Coordinate continuity of T, finite sums and complex conjugation imply mk(M) remains Hermitian and invariant at p, and its evaluations are pointwise limits (lim_form). Norm one prevents the limit from being zero.

Closedness: if s_n∈P, take positive forms; their limit is nonnegative on every diagonal. By ker_bot it is nondegenerate. To see strict positivity, suppose v≠0 and B(v,v)=0. Hermiticity makes B(w,w)=b real. Set z=B(v,w) and a=-t z, t real. Nonnegativity at v+aw gives 0<=|z|²(-2t+t²b). Choose t=1/(|b|+1)>0. Then tb<1, so if z≠0 the expression is negative. Hence z=0 for every w and v is in the radical, contradiction. This is pos_of, not an assumption that every nonsingular Hermitian form is positive.

Openness: the native proof shows P^c is sequentially closed. If s_n outside P tends to p∈P, choose the supplied nonzero invariant Hermitian forms at s_n (not positive), normalize and extract as above. The limit B is a nonzero real multiple c of the positive form B0 at p by uniq and real_of. Pick sign σ∈{-1,1} with σc>0. On the compact unit sphere in W the quadratic evaluation for σM is strictly positive; continuity gives a whole neighborhood of Gram matrices positive on that sphere (pos_open), and homogeneity extends positivity to every nonzero vector. Thus for some subsequence index σ times the normalized form is positive, contradicting s_n outside P. No global continuous family of forms was assumed, and the sign is chosen at the limit, not independently for each vector. Since [0,∞) is preconnected and P is nonempty (contains 0), both closed and open imply P is the whole half-line. At the target s, uniq and real_of give the desired sign dichotomy. The previous complementary_of chapter transports this local finite-dimensional result to compact-fixed spaces and then globally to the induced representation.

## 3. BoundB — exact domain and the contracted block

Let k be a nonarchimedean local field, d natural, W a nontrivial complex module, τ a smooth Levi representation of GL_d(k)×GL_d(k). Assume normalized parabolic induction π is admissible and unitarisable. Let t∈k^× have nabs(t)<=1 and suppose τ(diag(tI_d,I_d)) acts on every w by c∈C. Then |c| nabs(t)^(d²/2)<=1. This is the full Bound predicate; do not silently assume irreducibility or strict inequality on nabs(t).

Put Z=diag(tI_d,I_d). It is parabolic with specified Levi projection. For m>=1 let K be principal congruence subgroup of level m. Iwahori factorization in the source gives κ=xyz for every κ∈K, with x upper unipotent, y Levi, z opposite unipotent, each in K. Conjugation Z^(-1)zZ keeps z in K: upper entries vanish, same-block entries unchanged, lower off-diagonal entries multiplied by t, whose valuation is <=1 in the multiplicative convention. Apply the same to z^(-1) to check the inverse congruence condition (conj_mem'). Therefore, for K-fixed induced function f, using right-translation action and right K-invariance,
    f(κZ)=f(xyZ(Z^(-1)zZ))=f(xyZ).
The normalized induction transformation law first for xyZ, then for xy, and f(xy)=f(1), give f(κZ)=μ f(1), with μ=δ_P^(1/2)(Z)c. The scalar action on all W is used here. The modulus formula uses determinant t^d with exponent d on the first block and determinant 1 with exponent -d on the second; δ_P(Z)=nabs(t)^(d²). This is the native zval and modulus_scalar_block derivation; Iwahori factorization itself remains a named imported obligation.

## 4. Evaluation, finite-dimensional eigenvalue and contraction

Choose u≠0 in W. Native exists_indSp_apply_one supplies f with f(1)=u; smoothness/admissibility and congruence neighborhood basis give m=m0+1>=1 with f K-fixed. K is compact open, and E=π^K finite-dimensional by admissibility. Put H=K∩ZKZ^(-1), as subgroup of K. It is open in compact K, so K/H is finite (left cosets, not assumed normal). For a choice of coset reps q define
    A v = (1/[K:H]) sum_q π(q)π(Z)v.
For v∈E, π(Z)v is H-fixed by conjugation. Left multiplication permutes cosets, so Av∈E. The zval identity yields ev(Av)=μ ev(v) for ev(v)=v(1), on E. Since ev(f)=u≠0, A|E-μI is not surjective (its image lies in ker ev). Equal finite dimension implies noninjective, giving v≠0 with Av=μv. Do not assume f is that eigenvector or that its evaluation is nonzero; the proof only needs existence of some eigenvector.

Let B be the positive invariant Hermitian form from unitarisability; x=π(Z)v and w=μv=Av. Every coset representative fixes w. Consequently
    B(w,w)=average B(π(q)x,w)=B(x,w),
    B(x,x)=B(v,v), B(w,w)=|μ|² B(v,v).
Hermiticity and nonnegativity of B(x-w,x-w) give
    0<=B(v,v)-B(w,w)=(1-|μ|²)B(v,v).
The last factor is strictly positive; hence |μ|<=1. Substitute μ, positive modulus and sqrt(a^(d²))=a^(d²/2) for a=nabs(t)>0. This proves BoundB.bound_main and boundB. It does not need a Hilbert completion, a normal H, or a norm estimate on a nonunitary representation. In the prior chapter t is selected with strict nabs(t)<1 and d>0 to get the contradiction at s=d. Those stricter guards occur in the consumer, not in Bound itself.

## 5. Evidence, typed graph and limitations

Executed V8 source matching against five pinned connector blob IDs and literal anchors, finite integer regressions and graph reachability. Exact output: {"sourceFiles":5,"anchors":62,"nodes":29,"edges":31,"radical":63024,"project":40401,"lift":15625,"valuation":6888,"negative":5,"graphNeg":2}. Regressions validate radical inequality, projection norm identity, finite-dimensional eigenvalue witness in a small matrix family and valuation divisibility model. They are not proof of the imported infinite-dimensional/local-field facts. Five mathematical weakening controls are explicit elementary witnesses, two graph corruptions actually rejected. No independent Lean replay, byte-level local rehash or new CI verdict; no URT speed claim. Imported Mathlib and local producer leaves remain open; no axiom set discarded. Upstream comparisons at same paths recorded below, not proof of revision equivalence.

Reproduce with Node: paste and invoke the function below. Source ledger in JSON gives paths, exact blob IDs and representative source anchors. On upstream clone compare git rev-parse PIN:PATH and git show PIN:PATH; connector compared reported blob IDs, not recomputed raw byte hash.

```js
function regression(){
 const ck=(v,m)=>{if(!v)throw Error(m)};let radical=0,project=0,lift=0,valuation=0,negative=0;
 // Multiply the radical contradiction by (|b|+1)^2, keeping integers.
 for(let b=-50;b<=50;b++)for(let re=-12;re<=12;re++)for(let im=-12;im<=12;im++){let d=re*re+im*im;if(!d)continue;let den=Math.abs(b)+1;ck(d*(-2*den+b)<0,"semidefinite null diagonal forces cross term zero");radical++}
 // Average two isometries (identity and swap). For x=(a,b), w=(a+b)/2*(1,1), verify
 // 4||x-w||²=4(||x||²-||w||²) and orthogonality in scaled integer coordinates.
 for(let a=-100;a<=100;a++)for(let b=-100;b<=100;b++){let q=a+b;let left=(2*a-q)**2+(2*b-q)**2;let right=4*(a*a+b*b)-2*q*q;ck(left===right&&right>=0&&(2*a-q)*q+(2*b-q)*q===0,"projection norm");project++}
 // ev=(1,0) and A=[[mu,0],[c,d]]. ev A=mu ev, so mu is eigenvalue, even if eigenvector lies in ker ev.
 for(let mu=-12;mu<=12;mu++)for(let c=-12;c<=12;c++)for(let d=-12;d<=12;d++){let x=mu===d?0:mu-d,y=mu===d?1:c;ck(x!==0||y!==0,"nonzero");ck(mu*x===mu*x&&c*x+d*y===mu*y,"lift");lift++}
 // Integral model for lower block contraction; v_p(t)>=0 preserves p^m divisibility.
 for(const p of [2,3,5,7])for(let m=1;m<=6;m++)for(let r=0;r<=6;r++)for(let a=-20;a<=20;a++){const mod=BigInt(p)**BigInt(m);let z=BigInt(a)*mod,t=BigInt(p)**BigInt(r);ck(z*t%mod===0n,"congruence");valuation++}
 // Explicit witnesses for missing hypotheses, not counterexamples to source theorem.
 ck(1>0&&-1<0,"diag(1,-1), identity family: nonsimple permits indefinite forms");negative++;
 ck(1>0&&0===0,"diag(1,0) semidefinite but degenerate");negative++;
 ck(2*2>1,"A=2 on C with no unitarity");negative++;
 ck(8%4===0&&2%4!==0,"p=2,m=2, t=1/4 can break contraction");negative++;
 ck(0===0&&2!==1,"zero evaluation map on A=2 cannot force mu=1");negative++;
 return {radical,project,lift,valuation,negative};
}
console.log(regression());
```

```json
{
  "pin": "40e56bab026552e089d7afcfeff08d2defb9c005",
  "root": "red",
  "scope": "selected typed obligation links; not complete kernel references or full proof; some grouped/transitive links",
  "nodes": [
    {
      "id": "red",
      "kind": "theorem",
      "declaration": "redClC",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "status": "SOURCE-MATCHED PRIOR",
      "requires": [
        "comp",
        "bound",
        "otherRed"
      ]
    },
    {
      "id": "comp",
      "kind": "theorem",
      "declaration": "complementary_of",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "status": "SOURCE-MATCHED PRIOR",
      "requires": [
        "sig",
        "otherComp"
      ]
    },
    {
      "id": "sig",
      "kind": "theorem",
      "declaration": "signature",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "ker",
        "uniq",
        "real",
        "pos",
        "open",
        "normal",
        "lim",
        "clopen"
      ]
    },
    {
      "id": "ker",
      "kind": "theorem",
      "declaration": "Sig.ker_bot",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "uniq",
      "kind": "theorem",
      "declaration": "Sig.uniq",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "ker",
        "eig"
      ]
    },
    {
      "id": "real",
      "kind": "theorem",
      "declaration": "Sig.real_of",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "pos",
      "kind": "theorem",
      "declaration": "Sig.pos_of",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "open",
      "kind": "theorem",
      "declaration": "Sig.pos_open",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "compactSphere"
      ]
    },
    {
      "id": "normal",
      "kind": "theorem",
      "declaration": "Sig.normalize",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "gram"
      ]
    },
    {
      "id": "lim",
      "kind": "theorem",
      "declaration": "Sig.lim_form",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "gram",
        "compactSphere"
      ]
    },
    {
      "id": "bound",
      "kind": "theorem",
      "declaration": "boundB",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "main"
      ]
    },
    {
      "id": "main",
      "kind": "theorem",
      "declaration": "BoundB.bound_main",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "zval",
        "ineq",
        "mod",
        "avg",
        "fix",
        "indEval",
        "congBasis",
        "finiteQuot"
      ]
    },
    {
      "id": "zval",
      "kind": "theorem",
      "declaration": "BoundB.zval",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "conj",
        "iwahori"
      ]
    },
    {
      "id": "conj",
      "kind": "theorem",
      "declaration": "BoundB.conj_mem'",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": [
        "conj1"
      ]
    },
    {
      "id": "conj1",
      "kind": "theorem",
      "declaration": "BoundB.conj_mem",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "ineq",
      "kind": "theorem",
      "declaration": "BoundB.ineq",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "mod",
      "kind": "theorem",
      "declaration": "BoundB.modulus_scalar_block",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "avg",
      "kind": "theorem",
      "declaration": "BoundB.avL_fixed",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "fix",
      "kind": "theorem",
      "declaration": "BoundB.hfixH",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "gram",
      "kind": "definition and lemmas",
      "declaration": "Sig.gram, mk, expand, mk_gram, gram_mk",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "status": "SOURCE-MATCHED",
      "requires": []
    },
    {
      "id": "otherRed",
      "kind": "premise bundle",
      "declaration": "compact, herm_ofB, conjProd, conjDual, prodModel, cuspUnit, cuspPairIrr",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "status": "OPEN OR PRIOR PARTIAL",
      "requires": []
    },
    {
      "id": "otherComp",
      "kind": "premise bundle",
      "declaration": "averaging, admissibility, invariant form and smoothness inputs",
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "status": "PRIOR PARTIAL",
      "requires": []
    },
    {
      "id": "eig",
      "kind": "imported theorem",
      "declaration": "Module.End.exists_eigenvalue",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "compactSphere",
      "kind": "imported theorem",
      "declaration": "isCompact_sphere and subsequence/compact-uniform positivity lemmas",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "clopen",
      "kind": "imported theorem",
      "declaration": "isPreconnected_Ici, IsClopen.eq_univ",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "indEval",
      "kind": "imported theorem",
      "declaration": "GlobalTheory.SmGL.ProdIrr.exists_indSp_apply_one",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "congBasis",
      "kind": "imported theorem bundle",
      "declaration": "GroundTheory.Automorphic.GLnLocal.hasBasis_nhds_one, compactness, antitone and congruence tests",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "finiteQuot",
      "kind": "imported theorem",
      "declaration": "Subgroup.quotient_finite_of_isOpen and finite-dimensional injective iff surjective",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    },
    {
      "id": "iwahori",
      "kind": "imported theorem",
      "declaration": "GroundTheory.Automorphic.Parabolic.congruenceSubgroup_iwahoriFactorization'",
      "path": null,
      "status": "OPEN IMPORT",
      "requires": []
    }
  ],
  "sourceLedger": [
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/Complementary.lean",
      "blob": "cdcb4ad9486adfa4d5b9444d833141ad9518a2d0",
      "anchors": [
        "def Signature : Prop",
        "Function.Surjective ι",
        "def Bound : Prop",
        "[Nontrivial W]",
        "IsAdmissible (parInd (blk2 d) τ)",
        "IsUnitarisable (parInd (blk2 d) τ)",
        "nabs k t ≤ 1",
        "def Complementary : Prop"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/PosMkIff.lean",
      "blob": "dc54f7d3f4921d7add75e4938a994af9900d19b1",
      "anchors": [
        "theorem ker_bot",
        "theorem inv_sub",
        "theorem uniq",
        "Module.End.exists_eigenvalue A",
        "theorem real_of",
        "theorem pos_of",
        "1 / (|(B w w).re| + 1)",
        "theorem pos_open",
        "eventually_forall_of_forall_eventually",
        "theorem normalize",
        "theorem lim_form",
        "tendsto_subseq",
        "tendsto_nhds_unique",
        "theorem signature : Signature",
        "let D : Set ℝ",
        "have hcl : IsClosed P",
        "have hop : IsClosed Pᶜ",
        "IsClopen.eq_univ",
        "obtain ⟨σ, hσ⟩",
        "rcases lt_or_gt_of_ne hc0"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/BoundB.lean",
      "blob": "35e0cd0ce0af5c0c7abb7be0351d14743a2f5321",
      "anchors": [
        "theorem val_le_one",
        "def Zt",
        "theorem leviProj_Zt",
        "theorem conj_mem",
        "theorem conj_mem'",
        "theorem avL_fixed",
        "theorem hfixH",
        "theorem ineq",
        "have hA : B w w = B x w",
        "have hpos : 0 ≤",
        "theorem zval",
        "congruenceSubgroup_iwahoriFactorization'",
        "theorem modulus_scalar_block",
        "theorem bound_main : Bound k",
        "exists_indSp_apply_one",
        "hasBasis_nhds_one",
        "haveI hfd",
        "quotient_finite_of_isOpen",
        "let A'",
        "let evI",
        "have hev",
        "let S",
        "have hns",
        "have hni",
        "have hμ := ineq",
        "Real.sqrt_eq_rpow",
        "theorem boundB"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/ComplementaryOf.lean",
      "blob": "168c1aea2166006780855063060e567f700901ad",
      "anchors": [
        "theorem complementary_of (h : Signature)",
        "rcases h G W (fun g => g⁻¹)",
        "hinvW",
        "hresne"
      ]
    },
    {
      "path": "src/Development/WeilBound/RepresentationTheoryGL/GenericUnitaryGL/ComplementarySeries/SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "blob": "edef839707f5530496e6d41f642809d6f8ef78aa",
      "anchors": [
        "theorem redClC",
        "someRed_of k (complementary_of signature) (compact k) (boundB k)",
        "theorem rhoNuRhoReducibleC"
      ]
    }
  ],
  "headObservations": [
    [
      "Complementary.lean",
      "efa6e6da58bdcf3de9cc4b96409c3a82c0c01e98",
      "changed blob, no semantic equivalence claimed"
    ],
    [
      "PosMkIff.lean",
      null,
      "new-head same-path lookup failed; no equivalence claimed"
    ],
    [
      "BoundB.lean",
      null,
      "new-head same-path lookup failed; no equivalence claimed"
    ],
    [
      "ComplementaryOf.lean",
      null,
      "new-head same-path lookup failed; no equivalence claimed"
    ],
    [
      "SegmentJacquetSubquotients/RhoNuRhoReducibleC.lean",
      "2bea20d3d259ec562afda4c716e33f467b77df5b",
      "changed blob, no semantic equivalence claimed"
    ]
  ]
}
```

Graph verification (source-visible links only, not complete dependency closure):

```js
const ck=(v,m)=>{if(!v)throw Error(m)};
function graphcheck(ns){let m=new Map(ns.map(n=>[n[0],n]));ck(m.size===ns.length,"duplicate");const visiting=new Set(),seen=new Set();function visit(id){ck(m.has(id),"missing "+id);ck(!visiting.has(id),"cycle");if(seen.has(id))return;visiting.add(id);for(const d of m.get(id)[5])visit(d);visiting.delete(id);seen.add(id)}visit("red");ck(seen.size===m.size,"orphan");return {nodes:seen.size,edges:ns.reduce((a,n)=>a+n[5].length,0)}}
// Convert JSON nodes to [id,kind,declaration,path,status,requires] and call graphcheck.
```

RESUME HERE: reconstruct the native supplier of GlobalTheory.SmGL.ProdIrr.exists_indSp_apply_one and GroundTheory.Automorphic.Parabolic.congruenceSubgroup_iwahoriFactorization' from their actual pinned imports (not classical assertions alone). Request exact tagged membership and direct role witnesses for PositivityTheory.RgGu.NR.signature, PositivityTheory.RgGu.NR.BoundB.bound_main, PositivityTheory.RgGu.NR.boundB and PositivityTheory.RgGu.NR.Sig.lim_form; do not infer Main-reachability. HANDOFF TO dependency, kernel, audit, editor, integration. Full project OPEN. Preserve all unrelated records.


---

# Peer chapter — math/2026-11-24_change_level_injective_unit_lifting.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/math/2026-11-24_change_level_injective_unit_lifting.md); blob e2d3ec302e4cade3f6d70096151ece3b121801f2; pin named. Relative links refer to original location.

# MATH lane — Mathlib \`changeLevel_injective\`: lifting every residue-class unit

**Date:** 2026-11-24  
**Result:** SOURCE-MATCHED reconstruction of the injectivity theorem used three times by pinned
\`QH.ind_unique\`, including the arithmetic proof that the unit reduction map is surjective.  
**Status:** PARTIAL for the full RH reconstruction. This is not a Lean kernel replay and not a proof
of RH.

## Source pin and theorem chain

The RH source is pinned at \`40e56bab026552e089d7afcfeff08d2defb9c005\`. Its
\`lake-manifest.json\` (blob \`b4d1ec31575a26b2159ec3a262b482bc051f3f6f\`) pins Mathlib to
\`0df444a360eaa60ab8c11dca51a86af692955474\`.

| Exact source | Blob | Declaration used |
|---|---|---|
| Mathlib \`Mathlib/NumberTheory/DirichletCharacter/Basic.lean\` | \`4569ebb8e61f683a9c89877f0cda4d3add4d766d\` | \`changeLevel\`, \`changeLevel_injective\` |
| Mathlib \`Mathlib/Data/ZMod/Units.lean\` | \`c93c732e5bedd18aadd8cab7b9baf139bfb41553\` | \`unitsMap\`, \`unitsMap_surjective\` |
| RH \`src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean\` | \`d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e\` | immediate project consumer |
| RH \`src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean\` | \`1fc497069c8499edef750d4264a106e442dcb1ef\` | downstream conductor-identification theorem |

The preceding MATH chapter reconstructed the whole \`ind_unique\` argument but left this Mathlib
injectivity result named rather than derived. This chapter fills exactly that gap.

## 1. Exact definitions and quantifiers

Let \`R\` be a commutative monoid with zero, let \`n,m\` be naturals, and assume \`h : n|m\`.
For a Dirichlet character \`chi\` of level \`n\`, Mathlib defines

\`changeLevel h chi = MulChar.ofUnitHom(chi.toUnitHom comp ZMod.unitsMap h)\`.

Here

\`unitsMap h : Units(ZMod m) ->* Units(ZMod n)\`

reduces a unit modulo \`m\` to a unit modulo \`n\`. The theorem is:

> If \`[NeZero m]\`, then \`changeLevel h\` is injective.

There is no independent \`NeZero n\` premise. It follows: if \`n=0\` and \`0|m\`, then \`m=0\`,
contradicting \`NeZero m\`.

## 2. Surjectivity of the unit reduction map

The difficult input is the pinned theorem

\`ZMod.unitsMap_surjective [NeZero m] (h:n|m)\`.

It first proves the arithmetic lifting statement

\`forall x, Coprime(x,n) -> exists k, Coprime(x+k*n,m)\`.

Fix \`x\` coprime to \`n\`. Define the finite set

\`P = {p in primeFactors(m) | p does not divide x}\`

and set \`k\` to the product of the primes in \`P\`. We show no prime divisor \`p\` of \`m\`
can divide \`x+k*n\`.

### Case 1: \`p|x\`

If also \`p|(x+k*n)\`, subtraction gives \`p|k*n\`. Since \`p\` is prime:

- If \`p|n\`, then \`p\` divides both \`x\` and \`n\`, contradicting \`Coprime(x,n)\`.
- If \`p|k\`, primality and the finite-product lemma give a prime \`q in P\` with \`p=q\`.
  Membership of \`q\` in \`P\` says \`q\` does not divide \`x\`, contradicting \`p|x\`.

### Case 2: \`p\` does not divide \`x\`

Because \`p|m\`, the prime \`p\` belongs to \`P\`, hence \`p|k\` and therefore \`p|k*n\`.
If \`p|(x+k*n)\`, subtraction now gives \`p|x\`, again a contradiction.

Thus every prime divisor of \`m\` is coprime to \`x+k*n\`; \`Nat.coprime_of_dvd\` concludes
\`Coprime(x+k*n,m)\`.

Now take an arbitrary unit \`y : Units(ZMod n)\`. Its canonical natural representative
\`x=y.val.val\` is coprime to \`n\`. The construction gives \`k\` and hence the unit

\`z = unitOfCoprime(x+k*n) : Units(ZMod m)\`.

Reduction modulo \`n\` kills the term \`k*n\`, so \`unitsMap h z=y\`. This establishes
surjectivity.

## 3. Why surjectivity gives injectivity of level change

Suppose \`chi\` and \`psi\` are characters of level \`n\` and

\`changeLevel h chi = changeLevel h psi\`.

To prove \`chi=psi\`, it suffices by \`MulChar.ext_iff\` to compare their unit-group homomorphisms.
Let \`y : Units(ZMod n)\`. Surjectivity supplies \`z : Units(ZMod m)\` with
\`unitsMap h z=y\`. Evaluate equality of the changed-level characters at \`z\`:

\`chi.toUnitHom(unitsMap h z)=psi.toUnitHom(unitsMap h z)\`.

Substitute \`unitsMap h z=y\` to obtain

\`chi.toUnitHom y=psi.toUnitHom y\`.

This holds for every unit \`y\`, so character extensionality yields \`chi=psi\`. The proof is
ordinary cancellation of precomposition by a **surjective** homomorphism; it does not infer equality
from a non-surjective sample.

## 4. The nonzero target-level obstruction is real

The target-level condition cannot simply be dropped. Since every natural divides zero, take
\`n=5\`, \`m=0\`. Then \`ZMod 0\` is the integers and its only units are \`+1\` and \`-1\`.
Their images modulo five are \`1\` and \`4\`, whereas

\`Units(ZMod 5) = {1,2,3,4}\`.

The units \`2\` and \`3\` have no lift from level zero, so \`unitsMap(5|0)\` is not surjective.
The pinned proof uses \`NeZero m\` both to rule out this obstruction and inside the
\`primeFactors(m)\` construction.

## 5. Exact use inside \`QH.ind_unique\`

\`ind_unique\` invokes \`changeLevel_injective\` three times:

1. from level \`N*N'\` to \`N*N'*M\`, cancelling the auxiliary comparison factor \`M\`;
2. from level \`N'*N\` to the same common level, producing the reversed gcd factorization;
3. after proving \`N=N'\`, from level \`N\` to \`N*N\`, recovering equality of the original
   characters.

All three target levels are explicitly made nonzero from \`NeZero N\`, \`NeZero N'\`, and
\`M!=0\`. The previous chapter was correct to use injectivity here; this reconstruction corrects
any interpretation that level-change cancellation is formal without the target nonzero condition.

## Executed certificate

Executed locally with Python 3.12:

\`\`\`text
python -m py_compile research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_change_level_injective_unit_lifting.py
python research_archive/2026-11-24_lean_rh_translation_swarm/math/verify_change_level_injective_unit_lifting.py
\`\`\`

Corrected execution output:

\`\`\`text
changeLevel_injective unit-lifting regression: OK; report_checks=21, lift_checks=28201, surjectivity_checks=10582, cancellation_checks=4116, zero_level_checks=4, negative_controls=4
\`\`\`

The certificate reproduces the pinned prime-factor product \`k\`; checks the lifted integer is
coprime to \`m\` and unchanged modulo \`n\`; enumerates surjectivity of unit reduction for deterministic
nonzero divisible levels; exhaustively checks cancellation of Boolean-valued functions under those
surjections; and verifies the \`n=5,m=0\` negative control.

This finite certificate validates the arithmetic and categorical skeleton only. It does not replace
Lean's proofs of \`Nat.coprime_of_dvd\`, unit extensionality, or \`MulChar.ext_iff\`.

## Failed attempts / limitations

- The first certificate execution failed before any mathematical check because the script confused
  \`itertools.product\` with integer multiplication. It was corrected to \`math.prod\`; the executed
  result below is from the corrected script.
- Dropping \`NeZero m\` fails at \`n=5,m=0\`: two of the four units modulo five have no preimage.
- Choosing \`k=0\` does not generally work: at \`n=5,m=10,x=2\`, \`x\` is a unit modulo five but
  not modulo ten. The source's prime-factor construction handles all source units uniformly.
- Equality on an arbitrary proper subset of source units does not imply equality of characters;
  surjectivity of \`unitsMap\` is the exact cancellation hypothesis.
- The argument is about unit-group homomorphisms. It does not say every element of \`ZMod n\` has a
  unit lift.
- No local Lean environment or \`.olean\` dependency graph was available. The status is
  SOURCE-MATCHED plus an independently executed finite regression, not ELABORATED or an axiom census.

## RESUME HERE

Reconstruct pinned Mathlib \`MulChar.ext_iff\` / \`ofUnitHom\` bridge used in
\`changeLevel_injective\`: explain why a Dirichlet character is determined by its unit restriction
despite vanishing on nonunits, preserve the \`CommMonoidWithZero\` hypotheses, and give the exact
downstream rewrite used by \`changeLevel_def\`. Do not repeat the unit-surjectivity or
\`ind_unique\` arguments.

**HANDOFF TO:** MATH, dependency, audit, integration.


---

# Peer chapter — specialists/character_boxes/RUN12_FINITE_GROUP_IDENTIFICATION.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/character_boxes/RUN12_FINITE_GROUP_IDENTIFICATION.md); blob 4681157fe76748a634ef9385b4e26091507404dc; pin named. Relative links refer to original location.

# RUN12 — Finite group identification at prescribed places
2026-11-24. SOURCE-MATCHED human derivation; local finite regression, NOT kernel replay or full RH reconstruction. Status DONE for the conditional identification argument, OPEN for the original arithmetic suppliers and Main reachability.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity, research state/log excerpts and protocol, CI summary #386 (physics CI, not RH validation), RUN11 and current peer handoffs from integration, dependency, structure, math, audit and all nine other specialist lanes. External blueprint not reread. RUN11 translated PsiPPTie, not the actual group identification producer; this run follows its exact import. No physics queue changes. The current kernel lane asks for role-labelled native edge evidence, which is still pending for these declarations.

## Source theorem and quantifiers
Pinned upstream leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces delegates to GlobalTheory.Mem.R3.exists_grpIdent.
For EVERY stage X, pre-stage px : PreX X.B.toPre, column input I : Col2.ColIn X.B px, set U : Set I.ι and level L : LevCh X.toD7 (TupU I U), assume I.Ok, GrpAt X I and LevOf X I U L. Preserve all the implicit dependent types and instances.
Then there EXIST eG : Gc X.B px ≃* G0 L.Pg X.toD7.R.r, cG : G0 L.Pg X.toD7.R.r ≃* G0g X.toD7.nd, plg : (Σ k : Fin 2, X.toD7.nd.PlG k) ≃ L.Pg, and iso : ∀ kv, ZMod(X.toD7.host.g kv.1) ≃+* kP (plg kv).1, satisfying:
(i) IsPlacewiseIdentity X eG;
(ii) ∀ kv, underlying place of plg kv equals X.toD7.naut.plGw kv.1 kv.2;
(iii) ∀ kv, L.C.P.Div kv.1 (plg kv).1;
(iv) ∀ g kv, eG g (plg kv) = UG.bc (iso kv) ((eG.trans cG) g kv).
All four conclusions refer to the SAME chosen witnesses. In particular, iso is a family of ring equivalences, not merely an equality of cardinalities or arbitrary set bijections.

## Human proof, source matched
1. hG.pl provides plg0 and its place/division equalities. hL.Pg identifies the set of places L.Pg with (X.B.primes px).vGs. Let j be the induced subtype bijection from L.Pg to that latter set. For each tuple of invertible matrices g, define eG(g)(P)=g(j(P)). Its inverse is precomposition by j^-1. Both round trips are identity, and pointwise multiplication is preserved. This is just reindexing; it is not a choice of an arbitrary group isomorphism. The placewise identity follows because j preserves the underlying place.
2. Compose plg0 with j^-1 to obtain plg. The place equality is inherited unchanged from hplg0. By hI.pibar and the second component of hplg0, the underlying place belongs to the selected family vG(k). By hL.C the required L.C.P.Div holds. Thus the two selected-place claims are independent of the later choice of ring isomorphism.
3. From (base_fields_primes_ok X.B px).2.1 extract hPr. For each kv, write p = host.g(kv.1), R = kP(plg kv). Source hPr.g_prime gives p prime; hPr.vG_norm together with the membership in step 2 gives the absolute norm of that place equal to p. residueField_equiv_zmod uses the definition of absolute norm and cardQuot to obtain Nat.card R=p, then finite R because p ≠ 0. Equip R with Fintype and obtain Fintype.card R=p. charP_of_card_eq_prime gives characteristic p. ZMod.ringEquiv therefore gives R ≃+* ZMod p (after reversing the orientation of the standard equivalence). Equivalently, the unital map Z/pZ → R is injective because p is prime and the map is nonzero, and is surjective because both finite cardinalities are p. Reverse the theorem's returned equivalence to obtain iso_kv: Z/pZ ≃+* R. The proof uses Classical.choice on each nonempty type of equivalences. Equal finite cardinalities alone for composite p would not justify this argument: F4 and Z/4Z have different characteristics.
4. A ring equivalence f induces a matrix ring equivalence by entrywise application: f(AB)_ij=Σ_l f(A_il) f(B_lj). It sends the identity to the identity and inverse matrices to inverse matrices, hence restricts to a multiplicative equivalence of GL groups. Lean implements this as Units.mapEquiv (e.mapMatrix).toMulEquiv. Define cG on the product of GL groups by reindexing along plg and then applying (iso kv)^-1 entrywise on each factor. Precisely, cG(h)(kv)=GL(iso_kv^-1)(h(plg kv)). This is the composition of Equiv.piCongrLeft (inverted) and Equiv.piCongrRight in the source. The inverse applies iso_kv and reindexes by plg^-1. Pointwise multiplication preservation follows from the GL equivalence on each factor.
5. For all g and kv, apply iso_kv entrywise to cG(eG(g))(kv). Since iso_kv ∘ iso_kv^-1 = identity, this gives eG(g)(plg kv). This is the final UG.bc equation, with exactly the orientation required by RUN11's PsiPPTie producer. No choice of ring equivalence changes this cancellation. This closes the four conditional conclusions without weakening the initial assumptions.

## Direct source-level dependency identification
GlobalTheory.T.exists_finite_group_goodSet_levels_characters -> GlobalTheory.Mem.R3.Grp.grp_levels_exist -> GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces -> GlobalTheory.Mem.R3.exists_grpIdent -> {GlobalTheory.Mem.Col2.base_fields_primes_ok, Formalism.L2.Col.residueField_equiv_zmod, Formalism.L2.Col.generalLinearEquivOfRingEquiv}.
These are explicit references in the bodies. The first four are theorem/statement wrappers, not four independent arithmetic proofs. The original supplier of hG.pl (GrpAt X I) and hL.Pg / hL.C (LevOf X I U L), and the caller of the outermost wrapper supplying Keep/Pins, remain untraced. FieldValuesMemFixedField defines Dat.pins and RowsAre.Z : ReadL; that is a consumer structure, NOT a constructor. No claim of Main-root reachability or proof-term completeness. Do not merge with the other R3 records merely because names resemble one another.

## Provenance and executable source checks
P = src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
D = src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/
F = src/Formalism/LocalToGlobal/Columns/
Seven pinned Git blob SHAs and 41 literal anchors were actually checked in connector V8, 48/48 assertions passed. Reproduce using git rev-parse PIN:path for each hash, and git show PIN:path for each anchor (substring, not a Lean dependency extractor).
- P/ExistsFiniteGroupIdentificationFixedPlaces.lean 99b49bd32528a966c0548a287567e119cc66e4c7: theorem exists_grpIdent; I.Ok → GrpAt X I → LevOf X I U L; hG.pl; (base_fields_primes_ok X.B px).2.1; rw [hL.Pg]; left_inv := fun g => rfl; right_inv := fun h => rfl; map_mul' := fun _ _ => rfl; plg0.trans; (hI.pibar kv.1 _).2 (hplg0 kv).2; hPr.g_prime; hPr.vG_norm; residueField_equiv_zmod; Classical.choice (hiso kv); Equiv.piCongrLeft; Equiv.piCongrRight; generalLinearEquivOfRingEquiv; rw [hL.C]; simp [Formalism.UG.bc, Formalism.L2.Col.generalLinearEquivOfRingEquiv].
- P/ExistsFiniteGroupIdentificationFixedPlacesStatement.lean 8ae7985a3d418806f924cc3d6d91bbe45c713b7c: theorem _root_.GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces; exact @GlobalTheory.Mem.R3.exists_grpIdent.
- P/BaseFieldsPrimesOk.lean 352c685ba0759677354be0a2628666a2fb268dcb: theorem base_fields_primes_ok; (B.primes X).Ok; (GlobalTheory.BasePrimes.primes_ok B X).1.
- F/ExistsUnitOfPowEqOne.lean d02eed11ebd2802292bfcade3281e9c52d9bf87f: theorem residueField_equiv_zmod; [Fact g.Prime]; Ideal.absNorm w.asIdeal = g; Ideal.absNorm_apply; Nat.finite_of_card_ne_zero; charP_of_card_eq_prime hc'; (ZMod.ringEquiv _ hc').symm; def generalLinearEquivOfRingEquiv; Units.mapEquiv (e.mapMatrix.
- P/ExistsFiniteGroupGoodSetLevelsCharacters.lean f6e42ebeed75fceae0c6f0365051c3342cfa9d24: theorem grp_levels_exist; GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces.
- P/ExistsFiniteGroupGoodSetLevelsCharactersStatement.lean fba3fcc5741a81a7d273415e14ae213be81c1aa6: theorem _root_.GlobalTheory.T.exists_finite_group_goodSet_levels_characters; exact @GlobalTheory.Mem.R3.Grp.grp_levels_exist.
- D/FieldValuesMemFixedField.lean e1d3bb5bbe07b608135f2176a4b123b5e46348e7: structure Dat; pins : Pins; structure RowsAre; Z : ReadL.

Upstream main observed at 9282d3a102c4aff0e6026746db2a8990f5d9cddd versus RUN11 307cef33f046955ee79dba47e0d828d06496d75f. Both original fixed-place implementation and statement paths return HTTP 404 at observed main. No assertion of deletion versus relocation, equivalence or proof failure. Keep pinned source.

## Reproducible exact finite regression
Executed in connector V8: units=534, pairs=232740, products=1602, neg=5. Models GL(2,F_p) for p=2,3,5 with a transported relabelling of field elements and a three-place permutation. These are explanatory models; the operation on the transported field is defined through the inverse labelling, so the pair test is an implementation consistency check, not an independent verification of ring equivalence existence in the native number fields. Product tests check direction of reindexing. No native automorphic input, no Lean execution, no changed hypotheses or URT performance claim. Run in Node:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let units=0,pairs=0,products=0,neg=0;
 for(const q of [2,3,5]){
  const I=Array.from({length:q},(_,i)=>i),mod=x=>(x%q+q)%q;
  const enc=x=>mod(x+1),dec=x=>mod(x-1);
  const mat=(a,b,c,d)=>[a,b,c,d], mul=(a,b)=>mat(mod(a[0]*b[0]+a[1]*b[2]),mod(a[0]*b[1]+a[1]*b[3]),mod(a[2]*b[0]+a[3]*b[2]),mod(a[2]*b[1]+a[3]*b[3]));
  const eq=(a,b)=>a.every((v,i)=>v===b[i]);
  const A=[];for(const a of I)for(const b of I)for(const c of I)for(const d of I)if(mod(a*d-b*c)!==0)A.push(mat(a,b,c,d));
  ck(A.length===(q*q-1)*(q*q-q),"GL2 count");
  for(const a of A){ck(eq(a,a.map(enc).map(dec)),"round trip");units++}
  for(const a of A)for(const b of A){
   const transported=mul(a.map(enc).map(dec),b.map(enc).map(dec)).map(enc);
   ck(eq(transported,mul(a,b).map(enc)),"transport");pairs++;
  }
  const pl=[2,0,1], inv=[1,2,0];
  for(const a of A)for(let j=0;j<3;j++){
    const g=[a,A[(j+1)%A.length],A[(j+2)%A.length]];
    const c=pl.map(i=>g[i].map(dec));
    const back=inv.map(k=>c[k].map(enc));
    ck(back.every((v,i)=>eq(v,g[i])),"reindex");
    const h=g.map((v,i)=>A[(i+j)%A.length]);
    const d=pl.map(i=>h[i].map(dec));
    const cprod=pl.map(i=>mul(g[i].map(dec),h[i].map(dec)));
    ck(cprod.every((v,k)=>eq(v,mul(c[k],d[k]))),"product");products++;
  }
  ck(!eq([0,0,0,0],[0,0,0,0].map(enc)),"untransported field labels");neg++;
 }
 ck(new Set([0,0,1]).size!==3,"not a bijection");neg++;
 ck((1+1)%4!==0,"composite order guard");neg++;
 return {units,pairs,products,neg}
}
console.log(regress())
```

RESUME HERE: locate the actual pinned caller of GlobalTheory.T.exists_finite_group_goodSet_levels_characters (using reverse import/declaration index; direct wrapper confirmed) and track its witnesses into Keep/Pins. Request authenticated role-labelled edges for that wrapper, grp_levels_exist, exists_finiteGroupIdentification_fixedPlaces, exists_grpIdent and residueField_equiv_zmod, alongside the outstanding RUN11 names. Preserve hG.pl, hL.Pg, hL.C, hI.pibar, base-prime norm/primality and initial ReadL/MjHTie/IdxDefs suppliers as separate open obligations. Do not redo this reindexing or RUN11 character transport. HANDOFF TO dependencies, kernel, integration, editor, Galois, theta, audit. Project OPEN.


---

# Peer chapter — specialists/galois_representations/RUN12_WD_PARAMETER_BRIDGE_INDEPENDENCE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/galois_representations/RUN12_WD_PARAMETER_BRIDGE_INDEPENDENCE.md); blob 4c01243de061e009552e403666cfdbcf13436556; pin named. Relative links refer to original location.

# Run 12 — Weil–Deligne parameter independence under coefficient enlargement and local bridge change
2026-11-24. RESULT: SOURCE-MATCHED reconstruction of the common comparison theorem and its two applications, ending in the exact bridge-independence wrapper. Status OPEN for full RH and for the fixed-field supplier. This is a native source proof expansion, not Lean replay, not a new theorem of URT.

## Continuity / task choice
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, Run 11, Run 1/7/9/10, research state/log/protocol and continuity (large files in excerpts), latest CI summary (18:22:08Z run 45454648495, PASS for Cathedral checks, not RH). Recent peer notes reviewed: theta orbit restriction, Landau tails, prime allowances, kernel role masking, acceleration roots, integration signature, editor integrated manuscript, geometry residue descent, literature tangent gluing, character level tie, math primitive uniqueness; latest structure/audit/dependency commit scopes also inspected (their current artifacts are JS, not Markdown). No overlap. The exact native frob_laws and FrobLaws.exists_ext producers still could not be located by targeted import/filename/search inspection, so retain them as outstanding leaves from Run 11 instead of repeatedly paraphrasing them. Checked direct imports of the bridge comparison, LocTied, IsCrisP, DataNLoc, LocCoh, RingIface/CrisMaps, LocalIndepBridge, and related candidates; no producer found there. Some recursive Git trees are truncated; no absence claim. This run advances the distinct downstream comparison proof required even after the missing leaves are supplied. No physics queue changes.

## Provenance
Source repo leanprover-community/riemann-hypothesis, P=40e56bab026552e089d7afcfeff08d2defb9c005.
Observed upstream latest commit H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (changed since Run 11's 307cef33f046955ee79dba47e0d828d06496d75f).
File A: src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean.
P blob ffdce791714cb11064760245f465f9ba78449bbc; H blob 6e6f30ca2a8b1428043c1212f4c75896a3c5d747.
Exact source links:
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean#L234-L435
https://github.com/leanprover-community/riemann-hypothesis/blob/9282d3a102c4aff0e6026746db2a8990f5d9cddd/src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean#L278-L483

## 1. Common comparison: wdPst_eq_of_map (P 251–292)
Fix a prime l, LocPrime P, a ring equivalence iota: Om(l) ≃ C, number field E, algebraic closure Omega/E, valuation subring A, place w of O_E and witness h that A lies over w. Fix the two local bridges B,B' with their respective commutative Z_l-algebras equipped with topologies, and Induces witnesses hj,hj'. The Weil group in this comparison is the same Weil(h). Let L1,L2 be finite local coefficient extensions, V1,V2 additive groups with L_i and Q_l module structures, compatible scalar towers, finite L_i-dimension. Representations rho_i live on GK(B.Kw), GK(B'.Kw), respectively. Assume finite U-dimension of DpstUr for each (U the algebraic maximal unramified extension), and potential semistability hV_i. Assume their L_i-dimensions are equal. These are not automatic from existence of an additive comparison.

Write D_i=Dpst(P,rho_i), m_i(c)=mulD(c), W_i(sigma)=weilD(sigma), N_i=monD, j_i=wdMk and X_i=WDSpace(P,iota,rho_i). Require:
- ring hom s:L1→L2 whose images in Om agree with original elements (hs), not an arbitrary coefficient conjugation;
- additive T:D1→D2, with T(bx)=s(b)T(x) for ALL b,x (hT);
- T m1(c)=m2(c) T for every c in U (hm);
- T W1(sigma)=W2(sigma) T for every Weil element (hw);
- a in L2, a≠0, and T N1=a N2 T (hN);
- for EVERY y in D2, j2(y) lies in the complex span of {j2(Tx):x in D1} (hsp).

Then wdPst(P,iota,B,h,hj,rho1)=wdPst(P,iota,B',h,hj',rho2). It is equality of the WD parameter values (via WD.sound), not equality of original representations, period rings, or arbitrary matrices.

Proof: EnlargeCoeff.chg, with hs,hT,hm and the two coefficient algebra structures induced by iota, yields the complex-linear Phi:X1→X2 with Phi(j1(x))=j2(Tx) by chg_mk. Its range is a subspace containing every j2(y) by hsp; span_wdMk says these generate X2. Thus Phi is surjective. LetterDim.finrank_wdSpace (Run 8) and hV1,hV2 give dim_C X_i=dim_L_i V_i. The equality of these ranks makes surjectivity imply injectivity. Hence Phi defines a complex-linear equivalence e.
On generators, hw implies e R1(sigma)=R2(sigma)e, where R_i=wdRho, and hN implies e M1=iota(a) M2 e, where M_i=wdN. Both extend to the full X1 by LinearMap.ext_on_range and span_wdMk. Here iota(a)≠0 because iota is injective. Notice hsp is only a span condition in X2: no surjectivity of T on D2 is assumed in this general theorem.

## 2. Nonzero monodromy scaling and Frobenius semisimplification (P 234–249, 289–292)
The helper iso_of_equiv_smul assumes two finite-dimensional complex spaces; a first pair (rho,N) with a Frobenius semisimplification A; a target representation rho' and N' with semisimplification B; smoothness of rho', nilpotence of N', the law rho'(sigma)N'=normV(w)^deg(sigma) N'rho'(sigma), a linear equivalence e, and z≠0 with e rho(sigma)=rho'(sigma)e and e N=zN'e. It constructs a semisimplification C of (rho',zN') by exists_isFrobSS: nilpotence survives scalar multiplication, and the Weil law survives because scalars commute. The cited uniqueness/compatibility ha.iso identifies A with C using e. The cited hb.iso_of_smul hz hc identifies B with C (nonzero scalar essential). Compose the first isomorphism with the inverse of the second. Do not replace this step by the false claim that N and zN are literally equal or that e itself always intertwines unscaled N.

isFrobSS_wdRep obtains its witness from wdRep_spec and isFrobSS_of_unipotent. In wdPst_eq_of_map, wdPst_of_isPst rewrites each WD value to the appropriate representative; isSmooth_wdRho, isNilpotent_wdN and wdRho_wdN supply the helper's target conditions. Finally WD.sound turns isomorphism into equality of WD values. The actual bodies of exists_isFrobSS, IsFrobSS.iso/iso_of_smul, wdRep_spec and WD.sound remain imported obligations (not independently established here).

Three exact negative controls (mathematical examples, not counted execution tests): if equal dimension is deleted, projection C²→C is surjective but not injective. If the spanning hypothesis is deleted, the zero map C→C intertwines trivial representations and zero monodromy but is not an equivalence. If z=0 is admitted, the two-dimensional nilpotent Jordan block N and the zero operator cannot be isomorphic (different ranks); this obstruction is also compatible with the Weil covariance, e.g. take Frobenius diagonal(q,1) and N sending the second basis vector to the first, q>1. Thus the scaling guard cannot be silently relaxed.

## 3. Coefficient enlargement (P 308–352)
mem_span_dQ handles the nontrivial span obligation. For Q_l-linear equivariant f:V1→V2, choose finitely many coefficients b_j∈L2 and Q_l-linear equivariant maps pi_j:V2→V1 with sum_j b_j f(pi_j(v))=v for every v. The tensor lift sum_tensQ gives x=sum_j b_j dQ(f)(dQ(pi_j)(x)) for x∈D2. Applying the additive map j2 and using wdMk_smul puts every summand in the span of j2(dQ(f)(D1)). This proves hsp without claiming f or dQ(f) is onto over Q_l.

wdPst_enlarge takes a finite coefficient inclusion L1≤L2, dimension m, representation r1 on GL_m(L1) of the decomposition group and potential semistability of B.repE(L1,r1). IsPst_enlarge supplies potential semistability after coefficient extension; hV_i.finite supplies the period finite-dimensional instances. exists_decomp gives b_j,pi_j and their equivariance and sum identity. The natural coordinate inclusion incV is equivariant by incV_mulVec; the hpi law for matrices supplies the reverse coordinate maps. Apply Section 1 to dQ(incV), natural ring inclusion, equal rank m, scalar action from tensQ_smul/incV_smul, U and Weil intertwining dQ_mulD/dQ_weilD, monodromy multiplier 1 via tensQ_onB, and Section 3's span identity. Hence enlarging coefficients does not change wdPst. Preserve exists_decomp, isPst_enlarge and the tensor identities as real dependencies, not consequences of equal rank.

## 4. Change of local embedding (P 354–403)
exists_map_conj assumes common coefficient field L with scalar tower, common vector space V, finite U-dimension for both periods, g∈GQ(l), equality g(B.j(x))=B'.j(x) for every x, membership equivalence x∈B.Kw iff g(x)∈B'.Kw, and transported representation equality rho'(k')=rho(k) whenever k'=gkg^{-1}. It returns L-linear S:D1→D2, a≠0, surjectivity, U-scalar intertwining, Weil intertwining and monodromy scaling.

Use the prior native twist existence theorem on rho' and g^{-1}: get invertible T which reverses g on U-scalars, commutes with the Galois and Frobenius actions, and satisfies T N2=a N2 T. The ordinary period conjugation conjD (the preceding Conj section of A) transports scalars by g and transports the original representation via hK,hρ. Set S=T∘conjD. It is onto because conjD is onto and T invertible. For c∈U, let c'=g(c) (BridgeInd.mem_Kur_iff). First conjD transports multiplication by c to c'; T transports c' back to c. BridgeInd.e_symm_conj and hg show the two local realizations of every Weil element are conjugate by g; the commutation of T with actD gives the required action intertwining. S intertwines phiU via conjD_phiD and the T-phi relation, and map_zpow_apply transports all integer powers including negative ones, so weilD_apply gives Weil intertwining. Finally conjD_monD and the twist monodromy relation supply hN. No claim that a is 1. Run 10/11's finite action, openness, Frobenius fixed-field and extension obligations remain in exists_isTwist.

wdPst_conj adds finite L-dimension and potential semistability on both sides, obtains S as above, and applies Section 1 with s=id_L, equal vector dimension, and hsp immediate from surjectivity of S.

## 5. Assembly for a representation valued in Om(l) (P 405–435)
wdAt_eq starts with ONE decomposition-group representation r:Dec→GL_a(Om(l)), assumed IsPstAt for BOTH local bridges. wdAt_of_isPstAt gives coefficient fields L1,L2, models r1,r2, equalities to r after inclusion, potentially semistable local representations and wdAt equalities e1,e2. Take the compositum L=L1∨L2 (supExt); both fields include into it. The two enlarged representations are equal because their images in Om(l) agree (hm1.2.trans hm2.2.symm); the native proof compares each matrix entry, using injectivity of the field inclusion. BridgeInd.exists_conj provides g,hg,hK from the two Induces witnesses. Extend potential semistability to L by isPst_enlarge. Apply wdPst_enlarge separately on both bridges, identify the enlarged representations, then apply wdPst_conj with BridgeInd.repE_conj. The outcome is equality of wdAt values for the original r.

The public wrapper wdAt_indep_bridge quantifies over l prime, P:LocPrime l, AI:LocAinf l P, Nonempty (LocTied l P AI), iota, E,Omega, their fields and algebraic closure/number field structures, A,w,O,O', both topological coefficient-ring bridges and Induces witnesses, rank a and r; assumes continuity of the matrix-valued map of r and both IsPstAt statements. Its body passes the latter to wdAt_eq and does not use the LocTied witness or continuity in this proof body. Retain these premises in the public signature: a theorem having weaker internal sufficient premises is not license to delete public inputs from later consumers.

## 6. Source chain and boundary
wdAt_indep_bridge → wdAt_eq → {wdPst_enlarge, wdPst_conj, BridgeInd.exists_conj, BridgeInd.repE_conj, wdAt_of_isPstAt}; both branches → wdPst_eq_of_map → {EnlargeCoeff.chg, LetterDim.finrank_wdSpace, iso_of_equiv_smul, WD.sound}. Conjugation branch also → exists_map_conj → exists_isTwist (Runs 9–11). This maps the actual source calls inside A, not an authenticated kernel path to Main. It clarifies the local parameter independence premise used in the earlier local-global/Row0b-to-parameter/window/nonvanishing chain; the precise external caller of wdAt_indep_bridge and its role-labelled Main reachability still require extraction. Do not mark those edges authenticated merely because the theorem names match.

## 7. Executed checks and upstream comparison
Actually executed via GitHub connector + JavaScript on both retrieved source snapshots: 51 exact pinned declaration substring assertions, nine declaration slices located. Seven complete slices are byte-identical; eight proof bodies (substring after first ':= by') are identical. Two declarations have source edits:
- wdPst_eq_of_map P251/H295: explicit Submodule.smul in hT,hN replacing notation, unchanged proof body.
- mem_span_dQ P308/H356: explicit Submodule.smul in two expressions and simplifier list dropping Submodule.coe_smul, replacing notation; statement unchanged, proof body text changed.
These are inspected textual changes, not a kernel-checked equivalence of revisions. All comparisons below were performed in JS; the equivalent local reproduction script is provided but not independently run in Python. No synthetic count of tests beyond these assertions; no Lean build, imported axiom audit, CI validation of RH, or measured URT improvement.

| Declaration | P line | H line | Entire slice identical | Body identical |
|---|---:|---:|---|---|
| iso_of_equiv_smul |234|278|yes|yes|
| isFrobSS_wdRep |244|288|yes|yes|
| wdPst_eq_of_map |251|295|no|yes|
| mem_span_dQ |308|356|no|no|
| wdPst_enlarge |330|378|yes|yes|
| exists_map_conj |354|402|yes|yes|
| wdPst_conj |391|439|yes|yes|
| wdAt_eq |405|453|yes|yes|
| wdAt_indep_bridge |425|473|yes|yes|

Reproduction (Python stdlib, local git clone with both revisions, run python check.py /path/to/clone; source assertions not Lean proof checks):
```python
import subprocess,sys
repo=sys.argv[1]
P="40e56bab026552e089d7afcfeff08d2defb9c005"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
path="src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean"
def git(*args): return subprocess.check_output(["git","-C",repo,*args]).decode()
assert git("rev-parse",P+":"+path).strip()=="ffdce791714cb11064760245f465f9ba78449bbc"
assert git("rev-parse",H+":"+path).strip()=="6e6f30ca2a8b1428043c1212f4c75896a3c5d747"
p,h=(git("show",r+":"+path) for r in (P,H))
def decl(s,n):
    ls=s.splitlines()
    i=next(i for i,x in enumerate(ls) if x.startswith("theorem "+n+" "))
    j=i+1
    while j<len(ls) and ls[j].strip(): j+=1
    return i+1,"\n".join(ls[i:j])
checks={
"iso_of_equiv_smul":["exists_isFrobSS ρ' (z • N')","hn.smul z","hb.iso_of_smul hz hc"],
"isFrobSS_wdRep":["wdRep_spec","isFrobSS_of_unipotent"],
"wdPst_eq_of_map":["hV₁ : IsPst","hV₂ : IsPst","hdim : finrank","(s a : Om l) = (a : Om l)","(hT :","(hm :","(hw :","(ha : a ≠ 0)","(hsp :","EnlargeCoeff.chg","EnlargeCoeff.chg_mk","span_wdMk P ι ρ₂","LetterDim.finrank_wdSpace","LinearEquiv.ofBijective","LinearMap.ext_on_range","wdMk_smul","map_ne_zero ι","WD.sound"],
"mem_span_dQ":["(hsum :","sum_tensQ","wdMk_smul"],
"wdPst_enlarge":["isPst_enlarge","exists_decomp","incV_mulVec","dQ_weilD","mem_span_dQ"],
"exists_map_conj":["exists_isTwist P ρ' g⁻¹","BridgeInd.e_symm_conj","conjD_surjective","conjD_mulD","map_zpow_apply","conjD_monD"],
"wdPst_conj":["exists_map_conj","RingHom.id","Submodule.subset_span"],
"wdAt_eq":["wdAt_of_isPstAt","supExt L₁ L₂","hm₁.2.trans hm₂.2.symm","BridgeInd.exists_conj","wdPst_enlarge","BridgeInd.repE_conj"],
"wdAt_indep_bridge":["Nonempty (LocTied","Continuous","IsPstAt P Bw r","IsPstAt P Bw' r","exact wdAt_eq"]}
count=0
for n,anchors in checks.items():
    i,a=decl(p,n); j,b=decl(h,n)
    for x in anchors:
        assert x in a,(n,x)
        count+=1
    assert (a==b)==(n not in {"wdPst_eq_of_map","mem_span_dQ"}),n
    assert (a.partition(":= by")[2]==b.partition(":= by")[2])==(n!="mem_span_dQ"),n
    print(n,i,j)
assert count==51
print("51 pinned anchors; 7 identical declaration slices; 8 identical body slices. Not Lean validation.")
```

## RESUME HERE
Trace native BridgeInd.exists_conj and BridgeInd.repE_conj in A's LocalIndepBridge import and locate the actual external caller of wdAt_indep_bridge; preserve both local Induces witnesses and distinct field inclusions. Request authenticated type/value witnesses for GlobalTheory.Pst.BridgeParam.wdAt_indep_bridge, wdAt_eq, wdPst_eq_of_map, exists_map_conj, and outstanding GlobalTheory.MemLoc.frob_laws / FrobLaws.exists_ext (the latter two and EmbOrbitAlt still OPEN; do not infer source from name). Do not redo Runs 1–12; keep monodromy scaling and IsPst_enlarge / exists_decomp as dependencies. HANDOFF TO Galois, integration, editor, audit, theta, dependencies, kernel, acceleration. Project OPEN.


---

# Peer chapter — specialists/kernel_extractor/RUN12_RESUME.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/kernel_extractor/RUN12_RESUME.md); blob d6495402fb6fe9896d1386a0227eff3baa800810; pin named. Relative links refer to original location.

# RUN12 — role-frontier masking versus downstream propagation (2026-11-24)

RESULT: REVIEW / PARTIAL; exact finite graph model using prior actual native fixture, 207 assertions including 3 negative controls; no new Lean execution in this session. Native downstream test registered, not executed. Project OPEN.

Preflight: read AGENTS, research state and log excerpts, research/continuity protocols, CI summary on cathedral-research-state, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, kernel RUN10 and run11_native_order_audit.mjs, current acceleration RUN12 and latest integration/editor/geometry/literature/character/math/Galois/theta/Landau/prime handoffs; reviewed dependency seven-frontier and targeted-role implementation and recent audit/structure commit identities (not full audit/structure code). Original RH pin 40e56bab026552e089d7afcfeff08d2defb9c005 (Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc, Lean 4.33.1). Observed upstream HEAD 307cef33f046955ee79dba47e0d828d06496d75f, batch 7 of 65 small PRs; Main unchanged versus prior latest (blob 67c65badc15f80a1db65df1c84dc7a4928fc410f, Claim.zeta LFunction_ne_zero_of_half_lt_re; toolchain blob 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05 v4.37.0-rc1). No complete upstream equivalence check; do not merge revision identities. No physics changes.

## Exact result on measured fixture
Input graph actual v4.33.1 native plain.jsonl (Git blob e5096a6d88ffc80f98fdc73c75f9f67f73b9f41d), RC1 isolated result rc1_result.json (b16d10ce49ce3876b3d287db6ab6c6133f66aa2f), compiler source CollectAxioms.lean (e789f33849debe5cc1f1d9bc60aa3e54a56df0d9, upstream https://github.com/leanprover/lean4/blob/0b77e12952ad39077d80d8bd6b66d601f225c321/src/Lean/Util/CollectAxioms.lean). Exact paths and SHA1 checks in run12_role_frontier.mjs. Prior native runs 45400647276 and 45434018114; this session did not re-execute those native commands. Source collector checks imported extension before kernel lookup and collects both type and value constants for definitions.

Write W=Witness, P=Witness.plain, G=Witness.guarded, a=guardProp. Actual graph W→P,G; P→W; G→a,W, a is axiom. Exact constructor-inclusive reachable axiom sets for W,P,G are all {a}; measured RC1 cached sets respectively {a}, {}, {a}. For any sets of imported frontier references T (type), V (value), exact axiom union is union of exact reachable sets at T∪V; imported-cache model is union of cached sets at T∪V. This follows by taking the first frontier vertex on each finite path (here every seed is itself on the frontier and no local axioms are present). Thus combined omission iff T∪V={P}; combined equality cannot imply per-role equality. General case must also union local reachable axioms and account for all boundary vertices; not a claim of completeness of Lean's actual cache or logical necessity of each reached axiom.

For the proposed native alias definition `aliasPlain : Witness := Witness.plain`, the expected type seeds are {W}, value seeds {P}. Exact type and value reach a; cache type reaches a, cache value misses a. Combined report agrees because the type masks the omission. This corrects the prior hypothetical "downstream only depends on plain" interpretation: an actual well-typed alias also has a type reference. A synthetic value-only seed {P} still models an unmasked omission, but has not been shown to occur as the complete reference set of any new well-typed Lean declaration.

Actual execution in V8 (connector-retrieved exact blobs, not separate filesystem SHA1 replay): first attempted census had an incorrect expected masked count 10; corrected by 2×6=12. Reran identical semantic function with corrected census: {"status":"STATIC_ROLE_FRONTIER_MODEL_USING_NATIVE_FIXTURE_NOT_NEW_LEAN_EXECUTION","checks":207,"negative":3,"rolePairs":64,"combinedOmissions":3,"maskedRoleOmissions":12,"aliasPrediction":{"type":{"exact":["CathedralAxiomCycle.guardProp"],"cached":["CathedralAxiomCycle.guardProp"]},"value":{"exact":["CathedralAxiomCycle.guardProp"],"cached":[]},"combined":{"exact":["CathedralAxiomCycle.guardProp"],"cached":["CathedralAxiomCycle.guardProp"]}},"unmaskedValueOnly":{"type":{"exact":[],"cached":[]},"value":{"exact":["CathedralAxiomCycle.guardProp"],"cached":[]},"combined":{"exact":["CathedralAxiomCycle.guardProp"],"cached":[]}}}. The 64 type/value subset pairs are abstract frontier tests, not 64 Lean declarations. Three combined omissions; 12 cases where combined equality hides a role omission. Negative controls remove required graph vertex, introduce unknown boundary, or drop type edge. Corrected cache control recovers expected value. Complexity O(V+E) per finite exact closure plus union size; no timing/speedup claim.

Reproduce: node run12_role_frontier.mjs CHECKOUT_OF_cathedral-research-state. Wrapper SHA1 checks unexecuted here; semantic function actually executed twice with final result above. Local container had no lean/lake/elan, curl to GitHub failed DNS. Native script run_native_downstream_rc1.sh uses prior pinned release checksum, old fixture/exporter blob checks, native compiler, explicit exported type/value graph and independent audit, #print axioms across two import boundaries, with guardTag/cleanTag controls. AliasAgain and viaConsumer test masking via type or another value operand; actual direct roles and public reports are to be measured, not forced. The prior v3 graph exporter has not been compiled on RC1 in this new driver yet; possible API/visibility failure must be recorded exactly. Do not assert actual propagation or an RH kernel bug.

## Handoff and collision avoidance
Acceleration RUN12 committed authenticated full manifest scans: 26 new tagged membership rows and 15-scan conventional baseline, not direct edges. Dependency lane already owns targeted role projection (rh_targeted_role_witness.mjs, seven-frontier binding), so do not duplicate full archive scan. Request their next combined projection includes those 26 exact names/IDs (refer specialists/on_acceleration/RUN12_RESUME.md blob c26db49a072dcbec8eab6b14578cdd20e7bd02e6), previous seven source-bound IDs and new integration requests PositivityTheory.RgGu.NR.signature, PositivityTheory.RgGu.NR.BoundB.bound_main, PositivityTheory.RgGu.NR.boundB, PositivityTheory.RgGu.NR.Sig.lim_form after exact membership/source confirmation. No cross-revision joins; distinguish type/value seeds and structural/mutual metadata. No URT acceleration claim.

RESUME HERE: read compute/rh-native-downstream-rc1-20261124/status.json and outputs/downstream_result.json (or first actual failure log); compare each role to the native graph and public reports. If alias equality masks missing per-role reference, report masking not propagation; if genuine downstream combined omission appears, preserve a concrete tagged path. Do not manufacture a proof or error. Coordinate combined typed projection with dependency/acceleration. HANDOFF TO dependencies, acceleration, audit, integration, editor, theta, Landau, character boxes, geometry. Project OPEN.


---

# Peer chapter — specialists/landau_criterion/RUN12_GAMMA_AND_CHERNOFF_TAILS.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/landau_criterion/RUN12_GAMMA_AND_CHERNOFF_TAILS.md); blob db5628b248da254516aa0a16bb2d7e1d5099c948; pin named. Relative links refer to original location.

# RUN12 — Gamma normalization, two-tail Chernoff estimate and strict quantitative margin

2026-11-24. RESULT: DONE for the local source-matched kernel/tail chapter. Supplemental strict decay is a human-derived consequence, not a Lean declaration or a demonstrated URT speed improvement. Full project OPEN; no independent Lean replay.

## Continuity and provenance
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research-state/log/protocol/continuity excerpts, CI summary checkpoint 385 (18:02:52 UTC, physical checks only), RUN11. Reviewed 35 recent commit titles; prime RUN12 handoff, acceleration RUN12, integration and kernel handoffs were retrieved; editor/dependency commit paths examined but not all peer notes reread (tool-call limit). No duplicate of this exact task located. External blueprint noted, not reopened. No physics queue or gate changed.

P=40e56bab026552e089d7afcfeff08d2defb9c005; H=307cef33f046955ee79dba47e0d828d06496d75f (latest upstream returned by recent-commit lookup; unchanged since RUN11). Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8.

Paths relative to leanprover-community/riemann-hypothesis, src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/:
- P kernelIntegral.lean blob d785c54e03a55b0ef6c0fcb64bc4f8158e803642, Deduction.kernel_integral (not camelCase theorem name).
- P landauTails.lean blob 0e55797bac5320acf02d9acc832ca53df716e436, Deduction.landau_tails_integrable, landau_tails_chernoff, landau_tails_pow, landau_tails.
- H landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175, L673–685, 704–706, 708–751, 753–769, 771–846. The kernel_integral and landau_tails_pow bodies match by visual comparison. H replaces the integrability proof by RUN11's iteratedDeriv_laplace_int and division by a constant; the P proof instead uses totalized integral_undef and the strict positivity of the evaluated integral to contradict nonintegrability. Chernoff proof changes set inclusion expression and arithmetic tactics; the final tail proof expands several arithmetic steps. Statements unchanged.
- Mathlib Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean Pm blob 8aea69baf716966861315823d437f041abc7b9a4; Hm blob 0b46b9a61a100b5c64f6ca6cf3b79c509e5de48b. Both read; spans 165–220 and 395–429 compared byte-for-byte after splitting lines, identical. Wider spans 300–334 and 450–481 differ; no claim of identical full theorem bodies. Relevant declarations: Complex.partialGamma_add_one L187, GammaIntegral_add_one L217, Gamma_eq_integral L320, Gamma_nat_eq_factorial L325, integral_cpow_mul_exp_neg_mul_Ioi L372, Real.Gamma_eq_integral L405, Gamma_nat_eq_factorial L422, integral_rpow_mul_exp_neg_mul_Ioi L465. Hashes are connector-reported Git blob identifiers, not local SHA calculations. Source reference edges, not independent reachable kernel roles.

## 1. Exact whole-domain integral and endpoints

For natural k and a>0 put K_k(a,u)=u^k exp(-au)/k! on u>0. Substitute t=au (positive scaling), so integral K_k(a,u) du = a^(-k-1) Gamma(k+1)/k! = a^(-k-1). Mathlib's complex scaling uses the positive-real cpow multiplication identity and positive Haar change of variables, then Gamma_eq_integral at real part k+1>0; Real theorem takes real parts. In the imported recurrence, for Re(z)>0 and X>=0, partialGamma(z+1,X)=z partialGamma(z,X)-X^z exp(-X). The integrand derivative uses x>0, the slit-plane power derivative, continuity at x=0 since Re(z)>0, and interval integrability of both terms from Gamma convergence. At infinity the boundary norm is X^Re(z) exp(-X)->0. The source uses the resulting Gamma recurrence, Gamma(1)=1, and induction with nonzero positive integer z. The real restriction follows by taking real parts. At natural k the direct proof integrates by parts on [0,T]; for k>=1 both the lower boundary and T^k exp(-aT) at infinity vanish. For k=0 integrate directly, not by dropping the lower endpoint. Thus the unnormalized moment is k!/a^(k+1); factorial is nonzero. A zero or negative a is not admissible: at a=0 even k=0 diverges. A totalized integral value does not supply convergence.

For t>=0, the supplemental (not native source theorem) exact truncated right tail is
  integral_t^infty K_k(a,u) du = a^(-k-1) exp(-at) sum_{j=0}^k (at)^j/j!.
Indeed if P_k(x)=sum_{j=0}^k x^j/j!, (exp(-x)P_k(x))'=-exp(-x)x^k/k!, and the boundary at infinity is zero. The left tail from 0 to t is a^(-k-1)[1-exp(-at)P_k(at)], or the positive series a^(-k-1) exp(-at) sum_{j=k+1}^infty (at)^j/j!. These formulas require t>=0; t=0 gives right total and left zero. For 0<=U<=V the complement of [U,V] splits into the left and right tails up to null endpoints. The native Chernoff lemma below does NOT assume U<=V, so use the union-bound proof there instead of this exact disjoint decomposition.

## 2. Native Chernoff inequality (all real endpoints)

Let 0<=l<s. On u>0 outside [U,V], either u<U or u>V, so at least one of exp(l(U-u)), exp(l(u-V)) is >=1. Multiply their sum by the nonnegative K_k(s,u), yielding
  K_k(s,u) <= exp(-l V) K_k(s-l,u)+exp(l U) K_k(s+l,u).
All three rates are strictly positive. Integrability on the full positive half-line and on the measurable subset follows from section 1 (or RUN11). Integrate the inequality on the complement, then enlarge the integration domain for the nonnegative RHS. Evaluate its whole-domain kernels. This proves exactly
  integral_{u>0 outside [U,V]} K_k(s,u) du
  <= exp(-l V)/(s-l)^(k+1)+exp(l U)/(s+l)^(k+1).
No disjointness premise, no strict l>0, no positivity of g needed. The distinction between s and the later sigma is essential: s=sigma-2, not sigma.

The next native lemma landau_tails_pow uses 1+t<=exp(t) with t=(sigma-a)/a and sigma,a>0. If x+k t<=c then
  exp(x)/a^(k+1) = exp(x)(sigma/a)^k/(a sigma^k)
     <= exp(c)/(a sigma^k).
For k=0 this remains valid; no division by k.

## 3. Native parameter choice and quantifier order

Fix delta>0 BEFORE all U; put l=2+6/delta, M=l(1+delta), sigma=M(2+l), A=(1+delta/2)sigma, a=sigma-2-l, b=sigma-2+l. Then l>2, M>l, sigma>2, a>0, b>sigma. Identities:
  l delta=6+2 delta;
  A=M(M-1);
  a=(2+l)(M-1), (sigma-a)/a=1/(M-1);
  (1+delta/2)(l-2)=l+1.
Also l b <= (l+1)sigma, since sigma >= l(l-2); sigma=M(l+2)>l(l+2). Choose V=(1+delta)U and k=ceil(AU) for EVERY real U>=1. AU<=k<=AU+1, k>=U. For the right tail exponent:
  -l V + k(sigma-a)/a = -M U + k/(M-1) <= 1/(M-1)<=1.
For the left tail:
  l U + k(sigma-b)/b = l U - k(l-2)/b
    <= l U -(l+1)sigma U/b <= 0.
Therefore with C=e/a+1/b fixed BEFORE all U,
  integral_{u>0 outside [U,(1+delta)U]} K_k(sigma-2,u) du <= C/sigma^k.
This proves the source's exact existential-universal-existential order: for each positive delta, exists sigma>2, exists C, for all U>=1, exists natural k>=U. Neither theta nor a zero location enters this local lemma. It cannot produce the arithmetic windows; it only controls the two tails after a window is supplied. Downstream original 0<theta<1, delta>0, all PoleData fields and exceptional real pole sign remain unmodified.

## 4. Supplemental strict exponential improvement

Retain the exact same native parameters and k, but use log r < r-1 for r>0, r!=1 instead of the relaxed exponential bound. Define L=log(sigma/a)>0 and R=log(sigma/b)<0. Then L<1/(M-1), R<-(l-2)/b, hence
  c_R=M-A L>0,
  c_L=-l-A R>0
(the second follows from A(l-2)/b=(l+1)sigma/b>=l). The normalized Chernoff bound is
  sigma^k tail <= exp(-M U+k L)/a + exp(l U+k R)/b
     <= exp(L) exp(-c_R U)/a + exp(-c_L U)/b
     <= C' exp(-c U),
where c=min(c_R,c_L)>0, C'=sigma/a^2+1/b, using k<=AU+1 for L>0 and k>=AU for R<0. Both constants depend only on delta. Moreover L<1/(M-1)<1, so C'<=C. This is strictly stronger than the original C/sigma^k bound, with the same choices and hypotheses. This is optional explanatory enrichment, not evidence of a missing assumption or a proof of RH. It does not replace the nearest-pole asymptotic or the window positivity term. No new hypotheses or fitted constants.

## 5. Reproducible finite certificate

Run the JS below in Node. BigInt rational checks use delta=p/q with p,q=1..25 and U=(j+3)/4, j=1..12; exact parameter identities, positivity and exponent inequalities. Polynomial derivative identity tested with integer factorial-scaled coefficients. Numerical log-space two-tail sums for 48 cases use finite upper Poisson sum with a term cutoff (not a rigorous interval enclosure). Compare the exact-formula numerical tails against the Chernoff sum, original normalized bound, and strict refinement. The three guard assertions are elementary checks accompanying the analytic countermodels, not independent demonstrations of divergence. No actual zeta zeros or Lean kernel tested.

~~~js
function certificate(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const Q=(n,d=1n)=>{if(d<0n){n=-n;d=-d}ck(d!==0n,"denominator");return [n,d]};
 const add=([n,d],[m,e])=>Q(n*e+m*d,d*e),neg=([n,d])=>[-n,d],sub=(a,b)=>add(a,neg(b)),mul=([n,d],[m,e])=>Q(n*m,d*e),div=([n,d],[m,e])=>Q(n*e,d*m),cmp=([n,d],[m,e])=>n*e-m*d;
 const I=n=>Q(BigInt(n)),eq=(a,b)=>cmp(a,b)===0n,le=(a,b)=>cmp(a,b)<=0n;
 let exact=0,poly=0,numerical=0,strict=0,negative=0,maxLogExcess=-Infinity;
 for(let p=1;p<=25;p++)for(let q=1;q<=25;q++){
  const d=Q(BigInt(p),BigInt(q)),l=add(I(2),div(I(6),d)),M=mul(l,add(I(1),d)),s=mul(M,add(I(2),l)),a=sub(sub(s,I(2)),l),b=add(sub(s,I(2)),l),A=mul(add(I(1),div(d,I(2))),s);
  ck(eq(mul(l,d),add(I(6),mul(I(2),d)))&&eq(A,mul(M,sub(M,I(1))))&&eq(a,mul(add(I(2),l),sub(M,I(1))))&&eq(mul(add(I(1),div(d,I(2))),sub(l,I(2))),add(l,I(1))),"identities");exact+=4;
  ck(cmp(l,I(2))>0n&&cmp(M,l)>0n&&cmp(a,I(0))>0n&&cmp(b,s)>0n&&cmp(s,I(2))>0n,"positivity");exact+=5;
  ck(le(mul(l,b),mul(add(l,I(1)),s)),"left exponent guard");exact++;
  for(let j=1;j<=12;j++){
   const U=Q(BigInt(j+3),4n),z=mul(A,U), k=Q((z[0]+z[1]-1n)/z[1]);
   ck(le(U,k)&&le(z,k)&&le(k,add(z,I(1))),"ceil bounds");exact+=3;
   ck(le(add(neg(mul(M,U)),div(k,sub(M,I(1)))),I(1)),"right exponent");exact++;
   ck(le(sub(mul(l,U),div(mul(k,sub(l,I(2))),b)),I(0)),"left exponent");exact++;
  }
 }
 // Derivative of e^-x P_k(x): multiply polynomial by k! to use integer coefficients.
 let fac=1n;for(let k=0;k<=60;k++){
   if(k>0)fac*=BigInt(k);
   let f=1n,co=[];for(let j=0;j<=k;j++){if(j>0)f*=BigInt(j);co.push(fac/f)}
   for(let j=0;j<=k;j++){let v=(j<k?BigInt(j+1)*co[j+1]:0n)-co[j];ck(v===(j===k?-1n:0n),"derivative polynomial");poly++}
 }
 const logadd=(a,b)=>{if(a===-Infinity)return b;if(b===-Infinity)return a;let m=Math.max(a,b);return m+Math.log1p(Math.exp(Math.min(a,b)-m))};
 // Poisson lower and upper positive sums; compute logs to avoid cancellation/overflow.
 function logTails(k,x,y){
  let tr=-y,sr=tr;for(let j=1;j<=k;j++){tr+=Math.log(y)-Math.log(j);sr=logadd(sr,tr)}
  let tl=-x;for(let j=1;j<=k+1;j++)tl+=Math.log(x)-Math.log(j);
  let sl=tl,j=k+1;for(;j<k+100000;){j++;tl+=Math.log(x)-Math.log(j);sl=logadd(sl,tl);if(j>x&&tl-sl<-45&&x/(j+1)<.99)break}
  ck(j<k+100000,"tail termination");return logadd(sl,sr);
 }
 for(const d of [.5,.75,1,1.5,2,3,5,8])for(const U of [1,1.25,2,3,5,10]){
   const l=2+6/d,M=l*(1+d),s=M*(2+l),a=s-2-l,b=s-2+l,A=(1+d/2)*s,k=Math.ceil(A*U),V=(1+d)*U;
   const L=Math.log1p((s-a)/a), R=Math.log1p((s-b)/b);
   const cr=M-A*L,cl=-l-A*R;
   ck(cr>0&&cl>0,"strict rates");strict+=2;
   const orig=logadd(1-Math.log(a),-Math.log(b)),chern=logadd(-l*V+k*L-Math.log(a),l*U+k*R-Math.log(b));
   const refined=logadd(L-Math.log(a),-Math.log(b))-Math.min(cr,cl)*U;
   const actual=k*Math.log1p(2/(s-2))-Math.log(s-2)+logTails(k,(s-2)*U,(s-2)*V);
   for(const [v,w] of [[actual,chern],[chern,orig],[chern,refined],[refined,orig]]){maxLogExcess=Math.max(maxLogExcess,v-w);ck(v<=w+1e-8,"tail bound");numerical++}
 }
 // analytic countermodels encoded: δ=0 collapses window, s=l invalid tilt, a=0 no damping, k=0 constant polynomial.
 ck(0===0 && !(2<2),"zero delta cannot define l=2+6/delta");negative++;
 ck(!(3<3),"strict tilt");negative++;
 ck(!(0>0),"rate zero");negative++;
 return {exact,poly,numerical,strict,negative,maxLogExcess};
}
console.log(certificate());
~~~

Actual V8 output: {"exact":43750,"poly":1891,"numerical":192,"strict":96,"negative":3,"maxLogExcess":-0.1294229700442946}. Tests are finite regression evidence for the algebra and numerical implementation, not validation of all real parameters. The analytic derivation is above. No independent Lean replay, no RH completeness claim, no URT benchmark. CI for this note not claimed.

RESUME HERE: reconstruct Deduction.landau_kernel_max, Deduction.landau_window_ineq_int and Deduction.landau_window_ineq from P LandauKernelMax.lean and landauWindowIneq.lean plus H landauWindow.lean L865–1001; check the sign of R, the positive-part window integral and factor 2C0, and the exact source statement (do not reuse a paraphrase). Request authenticated type/value role witnesses for Deduction.kernel_integral, Deduction.landau_tails_integrable, Deduction.landau_tails_chernoff, Deduction.landau_tails_pow, Deduction.landau_tails; prior acceleration membership is not a direct proof edge. HANDOFF TO editor, integration, audit, math, dependencies, kernel, acceleration. Project OPEN.


---

# Peer chapter — specialists/literature_provenance/RUN12_SMOOTH_REDUCEDNESS_AND_DIFFERENTIAL_INSTANCES.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/literature_provenance/RUN12_SMOOTH_REDUCEDNESS_AND_DIFFERENTIAL_INSTANCES.md); blob a5b6598bebdac95f829e2b0c042f2bb897f8218a; pin named. Relative links refer to original location.

# RUN12 — Smooth reducedness and differential instance suppliers
2026-11-24. SOURCE-MATCHED / PARTIAL. RH source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Mathlib pin 0df444a360eaa60ab8c11dca51a86af692955474, independently read from RH lake-manifest.json. Upstream head observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (18:24:32 UTC, PR #1313), after RUN11's 307cef33f046955ee79dba47e0d828d06496d75f. Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RUN11, research-state/log/protocol/continuity excerpts and latest CI summary (18:41:07, physical orchestrator PASS not RH). Read fourteen peer handoffs including the combined 47-target role projection and acceleration/kernel notes. No collision with other lanes observed. Blueprint not reread. No physics changes. This run takes the first half of RUN11's explicit frontier; chart factorization remains next.

## 1. The actual native proof of smooth reducedness
D = src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/.
D/IsReducedOfSmoothOverFieldStatement.lean L5–6 is a theorem wrapper, not a new axiom. Its body invokes GlobalTheory.isReduced_of_smooth_over_field, D/IsReducedOfSmoothOverField.lean L5–19.

Given field K, commutative K-algebra A with Algebra.Smooth K A, let a∈A be nilpotent. Assume a≠0. The annihilator J=Ann_A(Aa) is proper because 1∈J would imply a=0. Choose a maximal ideal p⊇J (L9–10). The choice matters: an arbitrary prime need not detect a. By smoothness and the pinned Mathlib theorem Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial (L11), there exist f∉p, n≥0 and a compatible P=K[X_1,…,X_n]-algebra structure on B=A[1/f] with B standard étale over P. P is a domain. Write F=Frac(P). The two critical properties are:
- B is flat over P; P→F injective; hence B→F⊗_P B, b↦1⊗b, is injective (L15–16).
- F⊗_P B is étale over the field F, thus formally unramified and essentially of finite type; it is reduced by Algebra.FormallyUnramified.isReduced_of_field (L13–14). The field need not be perfect.

Therefore B is reduced. The image of a is nilpotent in B, hence zero. By the localization zero criterion there exists N≥0 with f^N a=0 (L17–18), so f^N∈J⊆p. Primality forces f∈p (L19), contradiction. Thus a=0. This proves reducedness without assuming A is a domain or a finite K-module. It also avoids circularly using reducedness to infer the injection.

Negative controls: nonsmooth K[ε]/ε² has nonzero nilpotent ε (therefore merely finite presentation over a field does not suffice); generic-fiber injection fails without the flatness premise, e.g. Z→Q injective but B=Z/2 maps to Q⊗_Z B=0. The latter is a counterexample to dropping the flatness guard of the imported tensor theorem, not a smooth algebra counterexample. The finite computations below check the localization and differential identities, not smoothness or a Lean proof.

## 2. Imported theorem bodies and residual leaves
All following paths under Mathlib/RingTheory/ at the exact Mathlib pin above.
- Unramified/LocalStructure.lean L387–422, Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial: obtain f outside p with A_f standard smooth, then factor through a polynomial ring via RingHom.IsStandardSmooth.exists_etale_mvPolynomial. Map p into A_f (prime because f∉p), then obtain a further localization at g₀ outside the mapped prime, standard étale. Write g₀=g/f^m, deduce g∉p; localization first at f then g₀ is localization at fg. Transport the algebra, scalar tower, and standard étale instance through the localization equivalence. The actual witness in the source is fg, not just f. The standard-smooth and étale local structure theorems are further library dependencies, not discarded premises.
- Etale/StandardEtale.lean L382–391: IsStandardEtale is a class containing a nonempty standard presentation; the instance obtains Algebra.Etale via algebra equivalence with the presentation. Etale/Basic.lean L223–225 and L242: étale implies smooth and unramified and survives base change. Unramified/Basic.lean L358–365 supplies the formal-unramified and finite-type fields. Smooth/Flat.lean L52–62 proves smooth flatness: over Noetherian bases uses a finite-type polynomial quotient and the formally smooth flatness result; general proof descends to finite-type Z-algebras, then transports flatness through the base-change equivalence. Flat/Basic.lean L417–422 proves the tensor inclusion injectivity by preservation of injectivity under right tensoring with a flat module and the left-unit isomorphism. These are imported instances/theorems with inspected source bodies, not new assumptions; their deeper proofs are still owed for an expanded dependency closure. No elaborated instance-selection trace was obtained.
- Unramified/Field.lean L58, L61–152: the actual imported reducedness theorem requires [FormallyUnramified K A] and [EssFiniteType K A], not just any K-algebra with vanishing differentials asserted. Proof first injects A into C=Kbar⊗_K A by flatness of a vector space over K. Localize C at maximal ideals. Formal unramifiedness and essential finite type survive extension and localization. Over the algebraically closed field Kbar the local algebra is the field itself: the source first obtains a finite-dimensional algebra by finite_of_free, hence Artinian, hence its maximal ideal m nilpotent. Its residue field is Kbar via algebraic closedness and integrality. The unramified splitting sec gives an A-linear section s:A/m→A of the quotient, with q(s(1))=1. By linearity s(1) is idempotent (s(1)^2=s(q(s(1)))=s(1)); thus 1-s(1) is both idempotent and in nilpotent m, hence zero. This yields the algebra-map bijectivity and isField_of_isAlgClosed_of_isLocalRing. A nilpotent in C has zero image in all maximal localizations and thus is zero by eq_zero_of_localization. Injectivity brings this back to A. Exact sec construction and finite_of_free remain imported obligations, as do all typeclass and algebraic closure infrastructure. No historical priority claim.

## 3. Why the differential module in RUN11 is finite projective
D/CmpFormEqZeroOfPullbackVanishing.lean L145–156, GlobalTheory.PtVanish.connForm_eq_zero: for affine U, hX supplies Algebra.Smooth K A via sec_smooth (L153), A=Sec(X→Spec K,U), then the preceding wrapper supplies IsReduced A (L155). The source passes Ω_{A/K} to the residue-field functional separation theorem (L156). Finiteness and projectivity are actual instance obligations, not a separate axiom or automatically true for arbitrary Ω.

Pinned Mathlib Smooth/Basic.lean L540–548: Smooth has FormallySmooth and FinitePresentation fields, both registered as instances. L70–75: FormallySmooth contains Module.Projective A Ω[A/K] and Subsingleton H1Cotangent; the projection is registered as an instance. This is the definition used by this revision, not a proof of equivalence to all textbook definitions. L189–190 further provides finite presentation of Ω when the algebra is essentially finite type and formally smooth. FinitePresentation.lean L56 provides finite type from finite presentation, EssentialFiniteness.lean L95–98 essential finite type from finite type.

Kaehler/Basic.lean L433–454 gives the actual finite-generation proof. Choose a finite set S of essential generators, and let M be the A-span of {ds:s∈S}. By induction on sums and products, the differentials of every element of the R-subalgebra generated by S lie in M, using d(r)=0 and Leibniz. For arbitrary x∈A, essential finite type provides a unit t in this subalgebra such that xt also belongs to it. Then
    dx=t^{-1}(d(xt)-x dt) ∈ M.
The differentials of all x span Ω; hence M=Ω. This explains finite generation separately from projectivity. The displayed formula needs t invertible, not just nonzero. No assertion that Ω is globally free is made. The source proof uses the exact essential-finite-type condition, even though finite type is already available at this caller.

## 4. Assumption ledger delta and audit status
| Item | Classification | Evidence / remaining obligation |
|---|---|---|
| GlobalTheory.T.isReduced_of_smooth_over_field' | internal proved wrapper, source only | D/IsReducedOfSmoothOverFieldStatement L5–6 |
| GlobalTheory.isReduced_of_smooth_over_field | internal theorem body, source only | D/IsReducedOfSmoothOverField L5–19; smoothness and field are local hypotheses |
| Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial | imported Mathlib proof inspected | standard smooth and étale local structure producers still open |
| Algebra.FormallyUnramified.isReduced_of_field | imported Mathlib proof inspected | formal unramifiedness, essential finite type, closure, finite_of_free and sec |
| Algebra.TensorProduct.includeRight_injective | imported Mathlib proof inspected | flatness and injective map required |
| Standard étale, étale, smooth, unramified class/instance chain | imported definitions and proof instances | no independent axiom declaration inferred from class fields; caller must construct instances |
| KaehlerDifferential.finite | imported Mathlib proof inspected | essential finite type, universal derivation, finite generators |
| Smooth/FormallySmooth projections | imported definitions with registered instance fields | projectivity is part of the local smoothness interface, no claim of an independent unconditional proof |
| sec_smooth; geometric Smooth X.hom | unresolved supplier / explicit local premise | exact definition location not yet found; keep separate from algebraic smoothness |
| Main-root reachability / exact type/value edges | unresolved | peer combined role job not assumed to authenticate these declarations |
No new premises introduced in the native reconstruction. No new literature citations asserted. No claim of globally empty axiom closure, complete RH proof, Lean replay, or URT improvement. The above ledger extends earlier PublishedTheorems/OpenLiteratureStatements wrapper audits via their internal suppliers; it is not a complete inventory of every wrapper.

## 5. Source identity and reproducibility
Connector returned all 15 expected pinned Git blob identities; 51 first-occurrence source substring anchors succeeded. Three further exact body-position anchors succeeded (LocalStructure L400 and L422, Field L150). Initial search anchors for IsEtaleAt.exists_isStandardEtale and exact ⟨f * g and isField_of_isAlgClosed_of_isLocalRing also occur earlier in the file, so those three extra checks explicitly target the actual proof body. No kernel check. At new upstream head, D/IsReducedOfSmoothOverField blob 6c8b72aab504dd90e63a6dc8316033dc36552468 contains all 15 original L5–19 verbatim at L52–66; the consolidated ExistsTangentVectorFunctionalGlobalFormsAbelianS (blob 0610edb6e4bb7564e19ef9d9da168bc35b880f00) calls the theorem directly at L254. The old wrapper is bypassed in this caller. Not a claim of global revision equivalence.

For reproducibility, obtain both git checkouts and run the following Python from the RH checkout, with Mathlib checkout path as argv[1]. This equivalent git check was not executed in the connector; connector fetch/anchor checks were executed.
```python
import subprocess,sys,json
P="40e56bab026552e089d7afcfeff08d2defb9c005"
Q="0df444a360eaa60ab8c11dca51a86af692955474"
H="9282d3a102c4aff0e6026746db2a8990f5d9cddd"
D="src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/"
M="Mathlib/RingTheory/"
def git(c,*a):return subprocess.check_output(["git","-C",c,*a]).decode()
def read(c,r,p,h):
    spec=r+":"+p
    assert git(c,"rev-parse",spec).strip()==h,(p,h)
    return git(c,"show",spec)
rows=[
(".",P,"lake-manifest.json","b4d1ec31575a26b2159ec3a262b482bc051f3f6f",[(10,Q)]),
(".",P,D+"IsReducedOfSmoothOverFieldStatement.lean","670941bf2fbf3cb473f97d57ee8186029d2b80e0",[(5,"theorem"),(6,"exact @GlobalTheory.isReduced")]),
(".",P,D+"IsReducedOfSmoothOverField.lean","b7dc3ea7686a1f933e751e4727851704eef06940",[(9,"Ideal.exists_le_maximal"),(11,"exists_isStandardEtale_mvPolynomial"),(14,"isReduced_of_field"),(16,"includeRight_injective"),(17,"map_eq_zero_iff"),(19,"mem_of_pow_mem")]),
(".",P,D+"CmpFormEqZeroOfPullbackVanishing.lean","9d644eaffc0f556171b7b9563a46fa0def3ad54b",[(153,"sec_smooth"),(155,"isReduced_of_smooth_over_field'"),(156,"eq_zero_of_forall_residueField_functional'")]),
(sys.argv[1],Q,M+"Smooth/Basic.lean","696c5eb8786599a8fda889a857de74f1b683945b",[(71,"Module.Projective"),(74,"[instance]"),(189,"Module.FinitePresentation"),(540,"class Smooth"),(548,"[instance]")]),
(sys.argv[1],Q,M+"Kaehler/Basic.lean","828517e10d74a556bbfa457dffb64efa1ef43cf4",[(433,"instance KaehlerDifferential.finite"),(443,"adjoin_induction"),(453,"unit")]),
(sys.argv[1],Q,M+"Unramified/LocalStructure.lean","3aa963a14f1343f1a817f56418272e481f048802",[(387,"theorem IsSmoothAt"),(400,"IsEtaleAt.exists_isStandardEtale"),(422,"exact ⟨f * g")]),
(sys.argv[1],Q,M+"Unramified/Field.lean","f7256c8feb9b059034d8e694d86209c3e96efbc7",[(58,"EssFiniteType"),(93,"IsIdempotentElem"),(123,"theorem isReduced_of_field"),(140,"eq_zero_of_localization"),(150,"isField_of_isAlgClosed_of_isLocalRing")]),
(sys.argv[1],Q,M+"Flat/Basic.lean","b82c8eaaa79e718788a456125280dd53d8a17da8",[(417,"Module.Flat"),(420,"rTensor_preserves_injective")]),
(sys.argv[1],Q,M+"Etale/StandardEtale.lean","f7617b61a44784d26cdf19e55ec600389a8aa824",[(382,"class IsStandardEtale"),(390,"Algebra.Etale")]),
(sys.argv[1],Q,M+"Etale/Basic.lean","9dbcb40ff16f7eec7683a001495a1c3c41e520d3",[(206,"class Etale"),(223,"Smooth R A"),(225,"Unramified R A"),(242,"baseChange")]),
(sys.argv[1],Q,M+"Smooth/Flat.lean","df4ed4f7919b2a0a59ecfd7d8619ccb26f521a4a",[(52,"flat_of_isNoetherianRing"),(58,"Smooth.flat"),(59,"exists_finiteType")]),
(sys.argv[1],Q,M+"EssentialFiniteness.lean","09c76102f4e2224ce345079013405a4c4235def4",[(95,"of_finiteType")]),
(sys.argv[1],Q,M+"FinitePresentation.lean","727b74aa458f5f9b5ded15758be0b474c34e88d8",[(56,"of_finitePresentation")]),
(sys.argv[1],Q,M+"Unramified/Basic.lean","f28b28d1e42a3a4a21846f867710ce0899befe24",[(358,"class Unramified")])]
texts=[]
for c,r,p,h,anchors in rows:
    s=read(c,r,p,h);texts.append(s)
    for i,a in anchors:assert a in s.splitlines()[i-1],(p,i,a)
assert next(p for p in json.loads(texts[0])["packages"] if p["name"]=="mathlib")["rev"]==Q
new=read(".",H,D+"IsReducedOfSmoothOverField.lean","6c8b72aab504dd90e63a6dc8316033dc36552468")
assert texts[2].splitlines()[4:19]==new.splitlines()[51:66]
print("15 pinned blob identities, selected exact anchors, 15 unchanged body lines")
```

Actual executed finite arithmetic regression (connector JS): for m=2..80 and every nonzero a∈Z/m, choose a prime p dividing m whose ideal contains the annihilator. Test that for each f∉(p), a has nonzero image in (Z/m)[1/f]. Also test the Leibniz division identity with all scalar tuples over six prime fields. This does not assert the finite rings are smooth or that scalar tuples are actual derivations.
```js
const gcd=(a,b)=>b?gcd(b,a%b):a;
let n=0,chosen=0,differential=0;
for(let m=2;m<=80;m++)for(let a=1;a<m;a++){
  const ann=Array.from({length:m},(_,i)=>i).filter(i=>i*a%m===0);
  const p=Array.from({length:m-1},(_,i)=>i+2).find(p=>m%p===0&&Array.from({length:p-2},(_,i)=>i+2).every(d=>p%d!==0)&&ann.every(x=>x%p===0));
  if(!p)throw Error("ann");chosen++;
  for(let f=0;f<m;f++)if(f%p!==0){
    let q=m;while(gcd(q,f)>1)q/=gcd(q,f);
    if(a%q===0)throw Error("localization");n++;
  }
}
for(let p of [2,3,5,7,11,13])for(let x=0;x<p;x++)for(let t=1;t<p;t++)for(let dx=0;dx<p;dx++)for(let dt=0;dt<p;dt++){
 const inv=Array.from({length:p},(_,i)=>i).find(i=>i*t%p===1);
 if(inv===undefined||((inv*(dx*t+x*dt-x*dt)-dx)%p+p)%p!==0)throw Error("Leibniz");
 differential++;
}
console.log({chosen,n,differential,total:chosen+n+differential});
```
Actual outputs in two executed calls: chosen=3160, n=125844, differential=42294; total 171298. Additionally checked the nonzero square-zero class 2 in Z/4 and nonzero class 1 in Z/2 with 2·1=0 as illustrations of nilpotence and nonflat torsion. No independent native geometry checks.

RESULT: SOURCE-MATCHED / PARTIAL, one internal wrapper and its actual body audited, imported comparison/instance suppliers traced to pinned Mathlib. No unsupported completeness or physics claim.

RESUME HERE: resolve the exact pinned declaration/source for sec_smooth in CmpFormEqZeroOfPullbackVanishing L153 via import tracing, then reconstruct le_preimage_of_nil/exists_pt chart factorization in the ToroidalCompactification TanSRestrict chain. Keep the Mathlib finite_of_free/sec and smooth local-structure deeper leaves open for dependency expansion; prioritize authenticated root-reachable evidence. Request role-labelled witnesses for GlobalTheory.isReduced_of_smooth_over_field, GlobalTheory.T.isReduced_of_smooth_over_field', GlobalTheory.PtVanish.connForm_eq_zero and the imported Mathlib suppliers. Continue HC/HH comparison realization after chart suppliers; do not repeat RUN11 or this reducedness proof. HANDOFF TO integration, editor, audit, dependency, kernel, geometry, acceleration. Project OPEN.


---

# Peer chapter — specialists/on_acceleration/RUN12_RESUME.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/on_acceleration/RUN12_RESUME.md); blob c26db49a072dcbec8eab6b14578cdd20e7bd02e6; pin named. Relative links refer to original location.

# Run 12 — full native solution baseline completed; 26 specialist roots (PARTIAL)
2026-11-24. Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005; observed HEAD 307cef33f046955ee79dba47e0d828d06496d75f, not adopted. Read protocol, queue, expansion, specialist handoffs and core repository continuity excerpts. No physical gate changes or duplication of URT compression. Linked blueprint not reopened. Code commit b3e72233cc1d434388dc5feb9de9ef72f77dd1ef.

RESULT: [native artifact](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45412286798), ID 14931267327, ZIP SHA256 f4b9d91820f3753cb2003d27ce405d7162e69baeb68ee413f98f5ac8786a1f97 independently matched. Node v22.16.0, zstd, same local sandbox. The full 1,484,705-row solution manifest now has a completed conventional 15-scan baseline. All 15 separate fresh process results, including the one absent short name, exactly equal shared full-row outputs in original order. The sum of scan timings is 67,698.35 ms (not a single process end-to-end wall time); one previously interrupted invocation excluded and rerun. All four shared/URT runs reproduce run11 full-row digest 5413912b32b684b8747bf25c48004e74532a88b9554ca41c00ee40deaf190e83. Corrupted compressed input (appended byte) rejected before decode.

|mode|scan ms|Node peak RSS KiB|rows visited|
|---|---:|---:|---:|
|15 separate baseline scans, sum/max|67698.35|115708|22270575|
|shared first|4902.30|105868|1484705|
|golden|4626.9|114252|1484705|
|periodic|4363.5|108636|1484705|
|shared repeat|4464.44|108004|1484705|
|26 new exact requests, shared|4719.5|108296|1484705|

Baseline summed scan vs shared first 13.81x; vs repeated 15.16x. Per-query baseline times ms: 4806.6,4731.3,4461.8,4542.3,4388.6,4507.7,4491.8,4469.4,4374.0,4317.2,4363.2,4567.8,4567.0,4564.6,4545.0. First/repeat means application invocation order, not OS cache purge. Peak RSS is individual Node process, not summed child RSS; physical I/O not measured. Equal per-scan census/range/duplicate-ID checks and compressed pre/post SHA256 outside timed scan. URT registration order alone does not show reliable additional benefit; periodic wins this single trial. O(B+Q+K) expected one pass, including expanded name bytes; optional sort O(Q log Q), independent O(QB). No general proof-search bound.

## Specialist lookup results
All 26 new exact tagged requests PRESENT. The following rows are from the authenticated reachable manifest, not independently re-elaborated terms or proof edges. Positive refs are one-based expression roots (type,value in these rows); subtract 1 only when handing to the peer zero-based expression exporter. Preserve full rows and kind; LinkG_at and LinkG are defs; others thm. Every pass inspected 3,035,045 declaration hard-root refs and 1,460,414 mutual metadata refs. No assertion of zero missed inner dependencies from this test. New batch full-row SHA256 51b46ac630b6007f4801894f2bba78a3355b2a6e12472ac3636e5ed7a6bd81fa.

Theta: independently fetched [pinned IwaTop.lean](https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/VacuumIwasawa/IwaTop.lean#L12-L17); namespace PositivityTheory.SiegelWeilFormula.Avac, theorem iwaQ_of' (hT : TAll) : IwaQ. Corrected name below, distinct from _k. No suffix promotion. Other exact requests originate in named peers' RUN11 handoffs, not all separately source-located here.

Name | declaration ID | encoded type | encoded value
---|---:|---:|---:
PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of' | 8981975 | 721071981 | 721077114
PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'_k | 14034132 | 1064108806 | 1064113892
PositivityTheory.SiegelWeilFormula.Avac.vacK_of | 8953756 | 719345210 | 719345276
PositivityTheory.SiegelWeilFormula.Avac.vac_K' | 8953455 | 719330417 | 719332516
PositivityTheory.SiegelWeilFormula.Avac.vac_res' | 8953738 | 719344087 | 719345204
GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames | 8953593 | 719334572 | 719339157
GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf | 6375344 | 482469303 | 482473989
GlobalTheory.T.psiLevelPairCompatible_of_columnLevels | 6375353 | 482469303 | 482473990
GlobalTheory.Mem.R3.Grp.grp_levels_exist | 6375493 | 482488644 | 482497057
GlobalTheory.Mem.R3.pins_card_index_ranks | 4997285 | 369503821 | 369505607
GlobalTheory.MemLoc.frob_laws | 2367057 | 146721290 | 146724857
Deduction.iteratedDeriv_laplace | 868949 | 27135065 | 27135383
Deduction.iteratedDeriv_laplace_hasDerivAt | 868943 | 27133262 | 27135043
Deduction.landau_coeff | 868955 | 27135405 | 27136665
GlobalTheory.eq_zero_of_forall_residueField_functional | 11189057 | 883466002 | 883467093
GlobalTheory.PtVanish.connForm_eq_zero | 11189127 | 883478321 | 883487623
ReciprocityTheory.ChartRestriction.G.Chart.tan_lift | 3987187 | 279772183 | 279775949
ReciprocityTheory.ChartRestriction.G.Chart.tan_uniq | 3986738 | 279727724 | 279731467
ReciprocityTheory.ChartRestriction.G.Chart.glue_tan | 3987404 | 279800089 | 279808282
GlobalTheory.T.complex_section_finite_combination | 9615658 | 769100270 | 769111315
GlobalTheory.CompanionTheory.VanDescent.vanish_descent | 9615598 | 769100270 | 769111314
GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval | 9615438 | 769089428 | 769095537
GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent | 9615504 | 769096953 | 769099883
Formalism.MainNotions.LinkG_at | 869799 | 27224548 | 27224774
Formalism.MainNotions.LinkG | 869816 | 17831024 | 27224802
Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at | 1076940 | 41251314 | 41255196

## Replay certificate
Extract reachable_declarations.jsonl.zst from the artifact and run in separate invocations (split to fit local execution limits):
```sh
set -eu
f=reachable_declarations.jsonl.zst
for i in $(seq 0 14); do node replay.mjs "$f" single "$i" > "single_$i.json"; done
for m in shared golden periodic extra; do node replay.mjs "$f" "$m" > "$m.json"; done
python - <<'PY'
import json
s=[json.load(open('single_%d.json'%i)) for i in range(15)]
b=[x['out'][0] for x in s]
for m in ('shared','golden','periodic'):
 a=json.load(open(m+'.json'))
 assert a['out']==b and a['rows']==1484705
assert sum(x['rows'] for x in s)==22270575
e=json.load(open('extra.json'))
assert len(e['out'])==26 and all(len(x)==1 for x in e['out'])
assert e['resultSha']=='51b46ac630b6007f4801894f2bba78a3355b2a6e12472ac3636e5ed7a6bd81fa'
PY
```
Actual run independently compared the fifteen singleton outputs against both shared runs, and code checked each golden/periodic full digest and theta IDs. Tamper negative tested. New CI not run. Unresolved short names, exact deeper dependencies, source equivalence, kernel replay, and full human proof remain open. No premises deleted.

## RESUME HERE
Provide the 26 exact IDs above plus run11 anchors to the dependency/kernel lanes as one combined targeted type/value role projection; after their authenticated projected edges arrive, implement shared reverse invalidation and compare against independent closures with full edge equality. Do not independently repeat their archive scan or URT compression. HANDOFF TO dependencies, kernel, integration, audit, editor, theta, Landau, Galois, character boxes, literature, geometry, prime window. Project OPEN.


---

# Peer chapter — specialists/positivity_geometry/RUN12_HOLOMORPHIC_EXTENSION_READOUT.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/positivity_geometry/RUN12_HOLOMORPHIC_EXTENSION_READOUT.md); blob c99f711b20fd3304ba77bae9099dc13693c3ccb2; pin named. Relative links refer to original location.

# Geometry RUN12 — exact holomorphic-extension readout and support transfer
2026-11-24. DONE for this bounded source-level reconstruction. SOURCE-MATCHED / human argument; exact finite regression executed. Full project OPEN; no independent Lean replay.

## Continuity and provenance
Read AGENTS, research-state/log excerpts, continuity/research protocols, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, previous geometry RUN11 (11d241e868501e1990811f96329034bc061eaaa6), recent peer commit messages and available RESUME notes (audit, literature, math, character, Galois, theta, structure, Landau, prime, dependencies, kernel, acceleration, integration, editor). No competing readout reconstruction found. Some peer diffs lacked a RESUME line; no assertion of exhaustive collision search. CI summary branch read attempted; no CI result for this new work. The linked external PDF was not reopened; original source governs. No physics queue changes.

Pinned upstream P = 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream H = 9282d3a102c4aff0e6026746db2a8990f5d9cddd, merge #1313, timestamp 2026-11-24T18:24:32Z. GitHub-returned blob identifiers, not independently hashed raw bytes:
- src/Development/WeilBound/CoreStatements/ProjectiveValuations/HolomorphicExtensionSections.lean — 70552a9e54f3c0a673c504a9445430c966082a3f
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/HolomorphicExtensionSectionReading.lean — f653184c498379a0ff7d3bbaa1ee69a5775d5f6a
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/HolomorphicExtensionSectionReadingStatement.lean — 2545d108a4cbf648e0cbf3d7c00a134f7f99bcc4
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/OffZero.lean — eee4910349795a98ab9d7b950379f146835b2ec7
- src/Development/AutomorphicSpectrum/Definitions/GlobalGeometry/ExistsVanBdOfMemExtVanZ.lean — 000a714749b88ecc49f57ca4154f18918d6fbb89
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean — 3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoA.lean — 73af5a84e8e43d8a3d0e4b4066937e39941a83fe
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoB.lean — 0c0ad5b8910bc85997bb107de3caab75c487ed0c

The first three paths and VuOntoC return 404 at H. The principal theorem and caller now occur in src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean (H blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e). The complete principal theorem's 26 normalized nonblank lines match exactly (P L8, H L719). Other matching normalized declaration blocks: Reads (P20/H50), OffZero (27/57) at H blob 7c76f89d283db0cf7358bad89c8d100bce3f39b1; ruleTop (45/69), evR_ruleTop (83/107), mem_vanOut_iff_le (60/84), ruleTop_mem_extVanZ (95/119) at H blob 3eb2ef749524e7a0b72ba2919aab8094090c3c1c. Seven equal blocks in total. The eighth comparison, exists_comb (P20/H1409), differs by replacing the two wrapper calls with direct calls to _root_.GlobalTheory.CompanionTheory.VanDescent.vanish_descent and _root_.DifferentiableLines.holomorphic_extension_sections at H1446/1449. The original wrappers are retained in P provenance, not presumed present at H. Comparison trims each line and drops blanks; no kernel equivalence claim.

## 1. Exact quantified readout
GlobalTheory.T.holomorphic_extension_section_reading delegates to GlobalTheory.CompanionTheory.Ar.HolExt.reads_comb, which delegates to DifferentiableLines.holomorphic_extension_sections. For every E with Field, NumberField, IsCMField instances; H:Host E, D:Datum H, l:Level H, Xo:Moduli D l, c:Coeff l, r:natural, σ:c.F→+*C, V:Unf Xo c σ r, T:TorFlag Xo c, e:Ix D→Z, k:V.Comp, P:Frame (V.X k).Ψ r→C and h a chart-indexed function on complex points of flagStr T.X, assume Reads V T e k P h. For every natural m, coefficients a_j∈C and sections s_j∈(T.X.LL e).Sec, assume the **function equality**
  h = Σ_{j∈Fin m} a_j • secVal(flagStr T.X,σ,s_j).
Then for **every x∈(V.X k).dom**,
  P(x) = Σ_j a_j rdU(V,ruleTop(T.X,e,H0.ofSec(flagStr T.X,top,s_j)),k,x).
Neither good embedding, IsUnf, e(none)=0, smoothness, cusp vanishing, holomorphicity itself, nor boundary support is an extra hypothesis of this local theorem. Those are used to establish its premises in the caller. No tensor equality, no claim outside dom, m=0 allowed, integer weights including negative ones. The name “holomorphic extension” does not itself supply holomorphicity.

## 2. Source proof, with geometry explicitly separated
Fix an admissible x and put p=V.un k ⟨x,hx⟩. Let z=T.X.ptY(p). Since CAt σ has the local-ring instance of C, exists_chart_of_isLocalRing gives chart i and hz: top≤z⁻¹(U_i). T.X.lies_ptY supplies the flag incidence. T.X.top.exists_chartFr on frX_snd and this incidence supplies a chart frame Q; hQ.exists_frBor supplies t:Ix D→(CAt σ)^× with FrBor(t,Q,p). The point is over the open flag locus: rewrite z using T.X.pt_inc and use le_preimage_map, top_le_inc, le_top to give hO:top≤z⁻¹(flagOpen T.X). Thus y=(z,ptY_str) is the specified complex point, in ptsIn of U_i. CAt σ also inherits reducedness from C.
Define χ=toC((∏_{ix} t(ix)^e(ix)).val). Every t is a unit, so negative integer powers are legitimate. Reads is universal in x,hx,i,y,hz,Q,t and in the three witness conditions (point equality, ChartFr, FrBor); apply it to these selected witnesses:
  P(x)=χ h(i,y).
The supplied equality of functions implies by evaluating the two argument slots (Finset.sum_apply twice):
  h(i,y)=Σ_j a_j secVal(s_j)(i,y).
No summands are dropped, and the sum is not a Hermitian pairing.

## 3. The common multiplier is exactly the rule evaluation
Write S_j=H0.ofSec(flagStr T.X,top,s_j), f_j=ruleTop(T.X,e,S_j). The native definition of ruleTop is restriction to flagOpen followed by the inverse linear equivalence secOf and the subtype inclusion into Rul. Its defining inverse identity is secOf_ruleTop. For every commutative reduced c.F-algebra A, section S, frames P,Q, chart i, z:Spec A→T.X.YY, chart containment hz and flag-open containment hO, with ChartFr and FrBor t Q P, the source theorem evR_ruleTop gives:
  evR(Xo,c,ruleTop(S),P)=(∏ t(ix)^e(ix)).val * H0.val(z,i,top,hz,S).
The proof invokes evR_eq_val_secOf using hO,hQ,ht, rewrites secOf_ruleTop, then uses evalPt_res with the intersection-open inequalities. Reducedness must not be erased from this general lemma. Restriction and the inverse equivalence explain why this is the same evaluation, not a new normalization.
Now specialize to CAt σ and S_j. For each j the four identities actually used are:
(a) rdU(V,f_j,k,x)=toC(evR(Xo,c,f_j,p)) by dif_pos hx.
(b) secVal(s_j)(i,y) is its chart evaluation by CxPts.ev_eq hy.
(d) evR_ruleTop as above.
(f) H0.val_ofSec identifies the top-section evaluation with that of s_j at the chart.
Substitute these into χ h(i,y) and use distributivity and mul_left_comm:
  P(x)=χ Σ_j a_j secVal(s_j)(i,y)
      =Σ_j a_j [χ secVal(s_j)(i,y)]
      =Σ_j a_j rdU(V,f_j,k,x).
This is the whole local readout. No divisions by a_j or by section values, no nonvanishing section premise, no need to select a_j real. The source's final rfl is a definitional identification, not a new analytic argument. All chart existence, frame comparison, open-locus factorization and evaluation lemmas remain separately cited dependencies.

## 4. Support transfer and the actual caller
VuOnto.exists_comb assumes hσ:GoodEmb c σ, hU:IsUnf V, he:e none=0, hT:∀k,Tw V e k (la k), hP:∀k,P k∈(V.X k).SS(la k). It constructs a finite component sum h=Σ_k h_k using open_secZ, and holoOn_bdZ plus open_holoZ for each component. OffZero asserts zero at chart points not reached by that component. Different components cannot reach the same point of the flag under the source groupoid and IsUnf hypotheses, so when evaluated in the component-k reading condition all h_k' for k'≠k vanish. The source obtains this via the two FrBor witnesses and IsUnf, ending in Sigma.mk.inj. Thus Reads holds for the single h, for each k. Off the open locus every h_k vanishes by mem_open_of_ptY, so h does also. The GAGA bridge AnRead.bijective_valC under projectivity and line-bundle assumptions produces xC with SecC.val(xC)=h; smoothness gives locally finite type. RUN11's descent gives a common m,a_j,s_j with nonzeroLocus(s_j)≤flagOpen and equality of evaluated functions. This is the equality used in section 1, for each k with the SAME coefficients and sections.
For each j, use H0.bijective_ofSec_top to identify toSec(S_j)=s_j. The definitions are:
  vanOut = sections whose germs in all charts outside flagOpen lie in the stalk maximal ideal;
  extVanZ = image of vanOut under ruleTop.
mem_vanOut_iff_le is exactly s∈vanOut iff nonzeroLocus(toSec(s))≤flagOpen. It uses the preceding mem_vanOut theorem: an outside nonzero point gives a chart with unit germ, contradicting the maximal ideal condition, and conversely a unit germ contradicts absence from nonzeroLocus. The stronger equivalence ruleTop_mem_extVanZ uses injectivity of ruleTop (density of flagOpen and restriction injectivity plus secOf inverse); for the forward construction of f_j, the image membership direction suffices. Hence every f_j∈extVanZ, not merely their complex linear combination. This completes the local assembly from the hypotheses, while GAGA and analytic boundary suppliers are explicitly OPEN. No assertion that P itself is algebraic over c.F.

## 5. Executed finite checks and reproduction
Executed in V8: {"empty":225,"single":3600,"double":57600,"term":118800,"projective":192,"negative":4}. 61,425 readout cases, 118,800 per-summand checks (nested, not independent of readout counts), 192 concrete O(2) transition checks on P1, four negative controls. Gaussian rational arithmetic uses exact BigInt numerator pairs and common denominators; no floating rounding. The O(2) example is a separate chart transition illustration, NOT an instantiation of the unitary moduli hypotheses. The third negative control merely guards the zero/nonzero distinction; it does not establish domain behavior of rdU. No geometry existence, kernel proof or acceleration validated by this finite test. Save code as run12.mjs and run node run12.mjs:
~~~js
function run(){
 const g=(a,b=0,d=1)=>[BigInt(a),BigInt(b),BigInt(d)];
 const add=([a,b,d],[c,e,f])=>[a*f+c*d,b*f+e*d,d*f];
 const mul=([a,b,d],[c,e,f])=>[a*c-b*e,a*e+b*c,d*f];
 const inv=([a,b,d])=>{if(a===0n&&b===0n)throw Error("zero unit");return [a*d,-b*d,a*a+b*b]};
 const eq=([a,b,d],[c,e,f])=>a*f===c*d&&b*f===e*d;
 const pow=(z,n)=>{let v=g(1);if(n<0){z=inv(z);n=-n}for(let i=0;i<n;i++)v=mul(v,z);return v};
 const sum=xs=>xs.reduce(add,g(0));
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const values=[g(0),g(1),g(0,1),g(1,-1,2)],units=[g(2),g(1,1),g(0,-1)];
 const counts={empty:0,single:0,double:0,term:0,projective:0,negative:0};
 for(const t of units)for(const u of units)for(let e=-2;e<=2;e++)for(let f=-2;f<=2;f++){
  const chi=mul(pow(t,e),pow(u,f));
  for(const as of [[],...values.map(a=>[a]),...values.flatMap(a=>values.map(b=>[a,b]))]){
   const ss=as.length===0?[[]]:as.length===1?values.map(a=>[a]):values.flatMap(a=>values.map(b=>[a,b]));
   for(const vs of ss){
    const h=sum(as.map((a,j)=>mul(a,vs[j])));
    const lhs=mul(chi,h),rhs=sum(as.map((a,j)=>mul(a,mul(chi,vs[j]))));
    ck(eq(lhs,rhs),"readout");
    for(let j=0;j<as.length;j++){ck(eq(mul(chi,mul(as[j],vs[j])),mul(as[j],mul(chi,vs[j]))),"term");counts.term++}
    counts[["empty","single","double"][as.length]]++;
   }
  }
 }
 // O(2) on P1: z=X/Y, w=Y/X. pY(z)=z² pX(1/z).
 for(const z of units)for(const a of values)for(const b of values)for(const c of values){
  const w=inv(z),pY=sum([a,mul(b,z),mul(c,pow(z,2))]),pX=sum([c,mul(b,w),mul(a,pow(w,2))]);
  ck(eq(pY,mul(pow(z,2),pX)),"projective transition");counts.projective++;
 }
 ck(!eq(pow(g(2),-1),pow(g(2),1)),"inverse exponent");counts.negative++;
 ck(!eq(mul(g(0,1),g(0,1)),mul(g(0,-1),g(0,1))),"no conjugation");counts.negative++;
 ck(!eq(g(1),g(0)),"nonzero section does not evaluate as zero off chart by fiat within chart");counts.negative++;
 try{inv(g(0));throw Error("accepted zero")}catch(e){ck(e.message==="zero unit","zero unit control");counts.negative++}
 return counts;
}
console.log(JSON.stringify(run()));
~~~
On a pinned clone, compare each provenance blob with git rev-parse P:<path> (replace P by full commit above); source links use https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path>. Source body references only: VuOnto.exists_comb → GlobalTheory.T.holomorphic_extension_section_reading → GlobalTheory.CompanionTheory.Ar.HolExt.reads_comb → DifferentiableLines.holomorphic_extension_sections → evR_ruleTop / H0.val_ofSec / CxPts.ev_eq. No authenticated elaborated root reachability asserted.

RESUME HERE: reconstruct PositivityTheory.UnitarySelfGeneration.VuOnto.tendsto_arc_readsZ from pinned VuOntoB, specifically the two component branches and cancellation chr ee t=1 using ht1 (all some coordinates) AND hee (none exponent zero). Preserve every analytic boundary arc, lifting, monodromy, nontriviality, period and cusp-decay supplier. Then holoOn_bdZ and GAGA separately; do not redo this readout or RUN11. Request role-labelled root evidence for exists_comb, holomorphic_extension_section_reading, reads_comb, DifferentiableLines.holomorphic_extension_sections and evR_ruleTop, distinguishing removed relays at H. HANDOFF TO geometry, integration, editor, audit, literature, dependency, kernel. Project OPEN.


---

# Peer chapter — specialists/prime_window/RUN12_GAIN_ALLOWANCE_BRIDGE.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/prime_window/RUN12_GAIN_ALLOWANCE_BRIDGE.md); blob 02965f24ef1757f63252a5251a6ab087dc594f3f; pin named. Relative links refer to original location.

# RUN12 — Gain allowance bridge to the retained-top prime window

Status: SOURCE-LINKED CONDITIONAL HUMAN DERIVATION; finite exact arithmetic checks executed. Not an original Lean theorem name, not Lean kernel replay, not full LinkG or RH. Source pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream head 307cef33f046955ee79dba47e0d828d06496d75f, unchanged from RUN11.

## Preflight and task boundary

Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity/research state/log/protocol excerpts, RUN11, recent peer commit handoffs, acceleration RUN12 and combined 47-target dependency request. CI checkpoint 385 at 18:02:52 is unrelated physics CI, not RH validation. External blueprint not reread; peer scan not exhaustive. No overlap found with this exact allowance comparison. RUN11 transports the third LinkG_at conjunct into loss_bound_at; this run identifies a conditional route to that conjunct from the separate AuxBlock8.Conclusion1 estimate, and the actual source lemma producing the askP/askG comparison. A search returning no direct LinkG producer is not evidence of nonexistence. No unconditional producer claimed.

## 1. Exact sources and scopes

All line references below are to the original pin; prefix for links:
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/

- src/Formalism/SharpRestriction/GrowthBounds/SmallOrderPrimes.lean (blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f), 15–21: Formalism.MainNotions.AuxBlock8.Conclusion1 D L X K C bo. For EVERY natural prime p with IsResidueClassZero D p OR IsSg D p and p ≤ X'', all lifts j satisfy 0 ≤ gainP ≤ 4|TT|a/p, and
  sum_{j,s in TTP} (askG X (aL L) (bL L) p j s - G.lo K L C bo p) - m G.fl ≤ sum_j gainP - tauP.
  Here sum over j is over all lifts; the same p, weights, X,K,C,bo are used throughout. Conclusion2 (23) is a different MeanKappaBound proposition.
- src/Formalism/SharpRestriction/GlobalTheoremInputs.lean (blob ba31f5120ed089d48968754ae577427912d467c5), 97–120: InertK, flG, rG, leastPowerExponent, loG. LinkG_at (122–136) has FIVE clauses. Third (129–135): for every place w with InertK at p=resChar(w) and p≤X'', gain bounds and sum_{j,t in TTw(w)} (vonMangoldtClassSum - loG) - m flG ≤ sum_j L.gain - L.tau. LinkG (138–140) has common existential C,x0,δ→0 before all x≥x0 and all i. GlobalTheoremInputs (158–164) still assumes LinkG.
- src/Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean (blob 9fbb7879d0519f9a136e190551422881ef5d2f0b), 37–59: G.rG, cG=4Sc, Nm=N(m), G.L1, G.La; 100–102: inertClass and signal definitions (opposite disjunction order in InertK); 154–159 fill and fillG=fill−kaJ; 362–374 TTP and odd-index infinite sums askG, askP; 378–393 G.lo and G.fl; 395–410 aL,bL, ParametersFill. G.rG agrees with the main rG by the definitions. Neither ask sum is automatically the finite arithmetic sum without a fill and truncation argument.
- src/Formalism/LocalRingCardinality/DataParams₂.lean (blob 50914500995df91e2646d91a6c5c99a7e603a51b), 9–45: x>1, 0<eps<1/52, J≥1, b=exp(x^eps), a=xb>1, X'=exp(x^(eps/3)), b'=a/X', w''=b'/(xn), X''=a/w'', A=26, p0=k²x^A, delta1=x^(-eps/8)>0. Top weight conditions 80,83. Sc and eta positivity 142–164; TTw and wPart≥1 at 166–180; finite vonMangoldtClassSum at 240–242, odd i in range Nat.log p (aT t).toNat+2. Params.lean (blob 09d1aeec3049821ed6d190c7970cdca9ec5b34cf) 6–14: k≥m+3≥5.
- src/Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean (blob 80c1d0526b661eae74d87ec3b569d6a459e900ce), 94–101: PtH; includes all-place fills, support saturation for p≤X'', K.Nonneg. Retain full record, not just the fields used below.
- src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean (blob 8166795ec6e846795d7272781119ee7d17d426c0), 298–310 ask_at; 766–816 loss_bound_at, downstream consumer covered RUN11.

## 2. Different cutoff exponents: exact inequality

Put B=k²x^(3A), B_G=(kx^A)^4=k⁴x^(4A)=B*p0.
For p prime with p<p0, log_p B_G = log_p B + log_p p0 ≥ log_p B+1. Both B and B_G exceed 1; natural ceiling coincides with the ordinary ceiling on their positive logarithms. Integer translation of the ceiling gives

ell = ceil_N(log_p B)+1 ≤ E = ceil_N(log_p B_G) = G.L1.

Thus p^(-E) ≤ p^(-ell). This is not the RUN10 guard B≤p^(ell−1); it compares two distinct native exponents. It is valid also at p=p0 but the actual branch uses strict p<p0. No need to assume p0≤X'.

## 3. Comparison of lower and floor allowances

Assume C≥0 and fix C*=max(1,4C), independently of p and w. Let S=Sc, η=etaSz, W=w'', t=D.R.t, U=b'/x, H=log x/delta1, Z=log_p(2a), R=rG. All are nonnegative. From K.Nonneg, G.La=K.La*N1² log a≥0, and the last field of ParametersFill identifies it with L.LaG. For each prime p:

(a) Common term: C(4S+η)Z≤C*(S+k+η)Z, where C* denotes the enlarged constant, not multiplication by an unspecified factor.
(b) Both special prime terms vanish off inertClass, including signal. If inert and p<p0, old R b' log x times C is bounded by the same term times C*. If inert and p≥p0 and p<X', old term U+η+CWH+bo is bounded by new term C*(U+η+S+(W+t)H)+bo: their difference is (C*−1)(U+η)+C*S+(C*−C)WH+C*tH≥0. The signed bo cancels exactly. Otherwise these terms are zero.
(c) The order correction occurs only for inert and p<X'. Compare C log x [La*a/(pk)+a p^(-E)] to C* log x [La*a/(pk)+a p^(-ell)] in the low branch; the preceding exponent inequality and nonnegative factors prove the comparison. The other branch uses a/p² in both expressions.

Hence G.lo(C,bo)≤loG(C*,bo). Also G.fl(C)≤flG(C*) since both multiply the same nonnegative coefficient f*N(m)^2*log_p a + f*(log_p a)^2. This preserves the separate thresholds and class conditions; it is not a definitional identification of lo and loG.

## 4. Actual native supplier of askP≤askG

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean (blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0), 99–127: InWin, GainBoundAtPairUniform/AllUniform (askP), GainBoundAt/All (askG), RequiresAll. RequiresAll quantifies all a,b with a_s≤2a_scale and b_s≥0 on tops, then every prime p, every lift j and top s. It bounds askP≤askG≤askP+Nm log_p(2a). inWin_sizeData (151–154) supplies native top weights.

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/GainBoundAllAddOneOfGainBoundAllRequired.lean (blob dfe9f7e2fcb214def5642643ea24ad562c40fa10), namespace Formalism.MainNotions.AuxBlock8.Pf.As:
- shift_ge (12–35), p≥2, y,κ≥0, w≥0, decidable Q: the nonnegative terms (y/p^e−w_e−κ)_+ are ≤(y/p^e−w_e)_+ on Q, and summability follows by domination by y(1/p)^e.
- shift_le (37–131), additionally y≤A, A≥1, w≥1, Q⇒Odd: difference per index lies in [0,κ], vanishes unless p^e<A. Such positive odd indices number at most floor(log_p A), hence total difference ≤κ log_p A. Exclusion of e=0 matters. This is a finite support argument, not an estimate of a divergent series.
- n_pos (133–137), fill_ge (139–174), kaJ_bounds (176–189), asksAll_of (191–247): assumes Nm D+1≤w'' and the native data. The top/thick/thin offset constraints give fill≥w'', and 0≤kaJ≤Nm gives fillG≥1. Apply shift_ge/shift_le with w=fillG and κ=kaJ; if a_s<0 both sums vanish. Thus RequiresAll is actually produced under its size premise.
- lo_succ (249–307), fl_succ (309–331), TTP_subset₂ (333–337), gainBoundAll_add_one_of_gainBoundAllRequired (339–389): assumes K.La≥0, RequiresAll, Nm≤cG and GainBoundAllUniform at C. Increasing C to C+1 enlarges lo by at least (cG+eta)log_p(2a), absorbing the per-top ask correction; the floor does not decrease. The retained set is a subset of the tops. This yields GainBoundAll at C+1. No unconditional uniform gain assertion is supplied by this lemma.

## 5. Conditional third-conjunct bridge (new human derivation, no Lean replay)

Assume PtH, RequiresAll, Conclusion1 at C≥0. Fix any place w satisfying the native third-clause class and cutoff; retain the explicit premise that its residue characteristic p is prime (the native place-record primality supplier still to trace). The class predicates agree up to disjunction order. ParametersFill identifies wPart for every j,t,e with the filled weight. For t in TTw, aL L t=aT t>0. Since wPart≥1, e≥Nat.log p (aT t).toNat+2 implies p^e>aT t and the positive part vanishes. Odd excludes zero. Consequently vonMangoldtClassSum equals askP for that t by exact truncation of the tsum.

The top-size fields give aL≤2a and bL≥0, using k≥5, x>1, A>0. RequiresAll then gives askP≤askG. ParametersFill maps TTw into TTP with the injective subtype map, so reindex the finite sum without multiplicity loss. PtH support saturation puts w in support; fill identifies gainP with L.gain on that support and class, and tauP with L.tau. Apply Conclusion1's pointwise gain bounds and its retained-top sum, using Section 3 termwise and m≥0 for the floor:

sum_{j,t in TTw(w)}(vonMangoldtClassSum j t p - loG(C*,bo)) - m flG(C*)
≤ sum_{j,s in TTP}(askG p j s - G.lo(C,bo)) - m G.fl(C)
≤ sum_j gainP - tauP = sum_j L.gain - L.tau.

This yields precisely the third-clause estimates on the stated domain, subject to the explicit residue-prime premise. If these inputs hold uniformly eventually with one C and the same bo(x,i), then C* is a single constant for all x,i,p,w; no exchange of the family existential and universal quantifiers. The other four LinkG_at clauses remain separate obligations. No claim that Conclusion1 is itself discharged along the RH root.

## 6. Actual family frontier

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/RemainingCountingStatement.lean (blob b9435d525f79b2af1a971259b99c155f7b90ce63), 10–19: FamilyAskBounds and RemainingCountingStatement are propositions, not proven by their definitions. The latter quantifies K nonnegative, C31>0, Ce,Cm≥0, then exists a single C≥0 before all X,Y; AdmFam implies eventually GainBoundAll(C,b^(x^(-eps/2))). stmtEF_of (47–74) assumes these, plus h2,hW,h3,hT; chooses the same C, takes the maximum of six thresholds and uses inWin on aL,bL. It does not prove RemainingCountingStatement. AdmFam itself (Conclusion1OfGainBoundAll 156–159) is ∀δ>0 ∃x0>1 ∀x≥x0 ∀i admitted.

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/StarFam.lean (blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a), 11–36: actual star_fam, under K.Nonneg, C31>0 and AdmFam, produces eventual StarAll; that is not yet GainBoundAll. StarAt/StarAll defined in Conclusion1OfGainBoundAll 129–134. This is the next upstream counting frontier.

## 7. Executed reproducible finite check

Run the following JS with Node or another BigInt-capable ECMAScript runtime. The run used V8. All numerical computations are exact integers; log coefficients in the envelope test are nonnegative symbolic fixtures, not numerical evaluations of real logs or actual geometry. The fixtures include signed bo and distinct threshold branch orderings. The four negative witness assertions illustrate why same C, C=0 in the medium branch, removal of the exponent guard, and allowing e=0 in the shift estimate are not justified. These tests are regression checks of algebra, not Lean validation.

~~~js
function check(){
 const c={ceiling:0,reciprocal:0,envelope:0,transport:0,cutoff:0,shift:0,negative:0};
 function ck(b,k){if(!b)throw Error(k+" "+c[k]);c[k]++}
 const max=(a,b)=>a>b?a:b;
 function ceilLog(p,n,d=1n){let v=d,e=0;while(v<n){v*=p;e++}return e}
 function floorLog(p,y){let v=1n,e=0;while(v*p<=y){v*=p;e++}return e}
 const ps=[2n,3n,5n,7n,11n,13n,17n,19n,23n,29n,31n,37n,41n,43n,47n];
 for(const p of ps)for(let k=5n;k<=10n;k++)for(let d=1n;d<=6n;d++)for(let n=d+1n;n<=d+8n;n++){
  const A=26n, rN=k*k*n**A,rD=d**A;
  const lowN=k*k*n**(3n*A),lowD=d**(3n*A);
  const oldN=k**4n*n**(4n*A),oldD=d**(4n*A);
  ck(oldN*lowD*rD===lowN*rN*oldD,"ceiling");
  if(p*rD<=rN){
   const ell=ceilLog(p,lowN,lowD)+1, E=ceilLog(p,oldN,oldD);
   ck(ell<=E,"ceiling");ck(p**BigInt(E-ell)>=1n,"reciprocal")
  }
 }
 for(const p of [2n,3n,5n])for(let C=0n;C<=5n;C++)for(let s=1n;s<=4n;s++)for(let k=5n;k<=7n;k++)for(let eta=1n;eta<=3n;eta++)for(let mode=0;mode<5;mode++)for(let gap=0;gap<=2;gap++){
   const D=max(1n,4n*C), t=3n,B=7n,w=2n,r=11n,logx=3n,ell=2, E=ell+gap,a=17n,laPart=13n,deltaInv=2n,lb=5n,bo=-9n;
   const scale=p**BigInt(E), isI=mode!==0, low=mode===1||mode===4, win=mode===1||mode===2;
   const oldPr=!isI?0n:low?C*r*B*logx:win?B+eta+C*w*logx*deltaInv+bo:0n;
   const newPr=!isI?0n:low?D*r*B*logx:win?D*(B+eta+s+(w+t)*logx*deltaInv)+bo:0n;
   const oldOr=isI&&win?C*logx*(laPart*scale+(low?a:a*scale/(p*p))):0n;
   const newOr=isI&&win?D*logx*(laPart*scale+(low?a*p**BigInt(gap):a*scale/(p*p))):0n;
   const old=scale*(C*(4n*s+eta)*lb+oldPr)+oldOr;
   const newer=scale*(D*(s+k+eta)*lb+newPr)+newOr;
   ck(old<=newer,"envelope");
   const oldFloor=2n*C*scale, newFloor=2n*D*scale;
   const G=15n*scale, P=12n*scale, m=2n;
   const rhs=m*(G-old)-m*oldFloor;
   ck(m*(P-newer)-m*newFloor<=rhs,"transport");
 }
 for(const p of ps.slice(0,8))for(let y=1n;y<=90n;y++)for(let A=y;A<=y+4n;A++)for(let k=0n;k<=4n;k++){
  const N=floorLog(p,y)+2, F=floorLog(p,A), E=Math.max(N+4,F+2), den=p**BigInt(E);
  let before=0n,after=0n,finite=0n,count=0n;
  for(let i=0;i<=E;i++){
   const pe=p**BigInt(i);if(i%2===0)continue;
   const w=1n+BigInt(i%3); const u=y*(den/pe), b=max(0n,u-w*den),a=max(0n,u-(w+k)*den);
   before+=b;after+=a;if(i<N)finite+=b;if(pe<A)count++;
  }
  ck(before===finite,"cutoff");
  ck(after<=before&&before-after<=k*count*den&&count<=BigInt(F),"shift");
 }
 ck(4n*10n+1n>10n+5n+1n,"negative");
 ck(7n+2n>0n,"negative");
 ck(ceilLog(101n,5n)+1>ceilLog(101n,20n),"negative");
 ck(1n>0n,"negative");
 return c;
}
console.log(JSON.stringify(check()));
~~~

Actual output: {"ceiling":8640,"reciprocal":4320,"envelope":9720,"transport":9720,"cutoff":18000,"shift":18000,"negative":4}. Total 68,400 positive assertions; four simple witness assertions. Last witness represents the positive shift loss numerator for p=2, y=A=3/2, w=1, κ=1/2 at e=0: loss=κ>κ log₂(3/2). The strict log inequality follows from 1<3/2<2, not floating point.

## 8. Upstream comparison and limitations

At head 307cef33f046955ee79dba47e0d828d06496d75f:
- IsResidueClassZero blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6: pinned 37–59 at 75, 100–102 at 138, 378–393 at 404, 395–410 at 421 match. TTP/askG/askP individually match at 388–390, 394–395, 399–400; combined block differs by extra blank lines.
- GlobalTheoremInputs blob 5c32a96fe300e445ca6fe371b1b95e99632edae6: pinned 97–140 now starts 121, matched.
- DataParams₂ blob 3d693d76e763b7b7b9d7c5679c223ac91cc92692: pinned 41–43 now starts 83, matched.
- SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7: pinned 15–23 now starts 51, matched.
- GainBoundAllAddOneOfGainBoundAllRequired and RemainingCountingStatement same-path head retrieval returned 404. Relocation vs removal unresolved; do not infer equivalence or absence.

Peer manifest membership LinkG_at 869799, LinkG 869816, Loss.loss_bound_at 1076940 is not a proof edge. Reverse role projections requested, pending independent verification. The original pinned source remains authoritative for this checkpoint. No Lean execution performed.

## RESUME HERE

Locate the native residue-characteristic primality supplier; then follow actual reverse dependency/role references from GainBoundAllUniform, RemainingCountingStatement, Conclusion1 and LinkG. In particular trace StarAll to the uniform counting inequality, keeping all candidate exceptional cases and admitted-family premises. Do not conflate the conditional bridge above with a native unconditional LinkG theorem. Independent audit requested: verify both lower allowance formulas, ceiling direction, support and subtype transport, bo cancellation, family scopes, and actual kernel-root provenance. Editor may integrate Sections 2–5 only as a conditional bridge until audit and producer tracing complete.


---

# Peer chapter — specialists/theta_lifts/RUN12_ORBIT_RESTRICTION_AND_ANISOTROPY.md
Original [immutable source](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/5c10037aabb6205947fc8f7e32e440beb7d68c95/research_archive/2026-11-24_lean_rh_translation_swarm/specialists/theta_lifts/RUN12_ORBIT_RESTRICTION_AND_ANISOTROPY.md); blob 725301738eecb292fbb6f2c5d109e1b4e4d513ae; pin named. Relative links refer to original location.

# Theta lifts RUN12 — rank obstruction and exact orbit restriction

2026-11-24. RESULT: SOURCE-MATCHED / conditional human reconstruction of both branches of PositivityTheory.SiegelWeilFormula.Afc.orbRes and the actual anisotropy supplier. OPEN project. No Lean replay or URT gain asserted.

## Continuity and snapshot
Read AGENTS, research state/log/protocol and continuity excerpts, CI checkpoint 386 (unrelated physical checks PASS), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, full theta RUN11, recent integration, dependency, structure, kernel, acceleration, prime, Landau, editor, geometry, literature, character-box, Galois, math and audit handoff excerpts. No conflicting orbit-restriction task found. The linked blueprint text was fetched from the Drive file, including its definite-side Siegel–Weil discussion; the native proofs below supply details beyond that sketch. No assumption taken from the blueprint.
Upstream leanprover-community/riemann-hypothesis pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Observed head H=9282d3a102c4aff0e6026746db2a8990f5d9cddd, merge PR #1313, 2026-11-24 18:24:32 UTC. At H the original GramExtendZeroEmbedded.lean blob is 2902e85ad3afd87adcb7564299ec44f059917d5e (73 lines including final empty line), LowerRankDatum.lean 50a6dbbb774c444de5da6b5e7900d599c6e7c4bb (133), SiegelWeilStdOf.lean ba9124032c534e1ddb55f57c44896c58c699a144 (645); their original counts are 171,199,72. In these same paths at H, the original orbRes/OrbRes declaration and Afc.orbRes caller anchors are absent. This is source drift, not evidence of theorem deletion or proof invalidity. No equivalence to H established; all arguments below use P.

## 1. Exact quantified result
Let F,E be number fields with the original Field/NumberField instances and Algebra F E; sigma:E→ₐ[F]E; d:SD sigma with all Wk data, in particular good, sign, min(r,s)=0 and dimensions m,n≥1. The field F, E and all instances are universally quantified by LowerRankDatum.lean:175–176 (OrbRes).
(i) If d.m<d.n, then for EVERY T:nF sigma d.Y d.b with IsND T (det of its underlying matrix T.1.1 nonzero in AE F E), and EVERY Phi:d.Fn, d.orb T Phi=0.
(ii) For EVERY L:LD d, EVERY upper T and lower T', if L.IsSub T T', then for EVERY Phi:d.Fn and Phi':L.sd.Fn with L.IsRes Phi Phi', d.orb T Phi=L.sd.orb T' Phi'.
No m<n in branch (ii), no K-finiteness or vacuum hypothesis in either branch, and no upper Schwartz assumption in OrbRes itself. IsRes includes lower Schwartz membership and pointwise equality on the zero-column slice. Do not delete that membership even though the orbit equality proof only uses its second conjunct. LowerRankDatum:90–106 preserves A, m, mu and D under rank reduction; LD includes i0, injective em:Fin L.n→Fin d.n with image all indices except i0, the embedded group map and action compatibility res. IsSub (121–122) requires the entire deleted row AND column of the target matrix to be zero, and T' to equal the retained submatrix. This is stronger than determinant zero alone.

Write iota:E→AE F E for inclR and J=d.A.J. Put G(X)=X^T J sigma(X) (entrywise sigma, X rational over E). Native gram_incM and cond_iff establish that the adelic Gram constraint is exactly iota(G(X))=(-2) T.1.1, with entrywise inclusion. Define S_T to be the subtype of all X∈Mat_(m×n)(E) satisfying this constraint. AuxiliaryPrimeFunction.lean:121–123 defines
  orb_d(T,Phi)= Avg_(g∈D,mu) [sum'_(X∈S_T) T_d Phi(mat(g^-1) iota(X))].
Here Avg is the native set-average operator, not an unnormalised integral; sum' is Lean's tsum, not an asserted finite sum. The group acts on rows. The symbol T_d is the Schwartz transform, not the Fourier label T.

## 2. Nonsingular orbit impossibility (orb_zero, lines 48–66)
Assume m<n and X∈S_T. Over E, rank(G(X))≤rank bound m: factor G(X)=X^T(J sigma(X)), where X^T has m columns. If det G(X)≠0, its rank would be n, contradicting m<n. Thus det G(X)=0. Apply determinant to iota(G(X))=(-2)T.1.1. Determinant commutes with the ring homomorphism iota, so 0=(-2)^n det(T.1.1) in AE F E. Although AE F E need not be a field, (-2)^n is a unit: -2 is nonzero in the characteristic-zero number field E, and its unit maps to a unit under iota. Cancel the unit, obtaining det(T.1.1)=0, contradicting IsND. Hence S_T is empty; tsum_empty yields zero for every g and the average of the zero function is zero. This argument neither assumes the adelic ring is an integral domain nor uses the positivity of J. It does not rule out nonsingular coefficients when m=n. The strict dimension inequality is essential to this proof.

## 3. Actual anisotropy supplier (UnfoldB.lean:14–49)
HasSig.aniso: for a complex form matrix M with HasSig M r s and min(r,s)=0, the equation x^T M conjugate(x)=0 implies x=0. HasSig supplies an invertible change of frame A taking M to D=diag(I_r,-I_s) (with the given dimension identification). The Lean proof obtains left and right inverse identities and writes x=Ay. The equation becomes y^T D conjugate(y)=0. Since either r=0 or s=0, D equals -I or I, respectively. Therefore sum_j |y_j|²=0, so y=0 and x=0. Retain the exact sign cases and congruence; an indefinite form does not have this implication.

GlobalTheory.ThK.Dbl.aniso_of: assume Base.IsGood sigma, A.IsHerm sigma B r s or A.IsSkew sigma B r s, and min(r,s)=0. Take an infinite place w of F (existence is used). The good-CM embedding law sends the sigma-conjugation into complex conjugation, and a zero rational self-pairing into a zero complex self-pairing. In the Hermitian branch use HasSig.aniso directly; in the skew branch the specified scalar conversion of the form preserves zero and HasSig.aniso applies. Injectivity of the field embedding now gives the original vector zero coordinatewise. Thus Aniso sigma J. No global positive-definiteness for arbitrary adelic vectors or all indefinite signatures asserted.
Afc.col_zero (101–109) applies precisely this supplier with d.ok.good, the two branches of d.ok.sign and d.ok.aniso. The diagonal entry G(X)_(i0,i0) is the self-pairing of column X_i0; the source rewrites finite sums to match form. If it vanishes then the entire rational column vanishes. This is the indispensable extra property for branch (ii), distinct from the rank argument. As a mathematical negative control (not a native computational test), an indefinite matrix diag(1,-1) has nonzero isotropic vector (1,1); a zero diagonal entry alone then fails to force a zero column. The proof does not generalize by forgetting d.ok.aniso.

## 4. Bijection of representation fibres (Afc.eqv, 121–146)
Let P(X)=X.submatrix id em, and I(X')=ext0 L X', inserting a zero at i0 and copying every retained column. Since em is injective with image the complement of i0, P I=id everywhere, and I P=id on the zero-column slice (extension_zero_sub, submatrix_extend_zero).
- P maps S_T to S_T': the retained Gram entries agree by gE_sub, and IsSub identifies T' with the retained block of T.
- I maps S_T' to S_T: retained Gram entries agree by gram_extend_zero_embedded, and any entry whose row or column is i0 vanishes by gram_extend_zero_left/right, matching both zero conditions in IsSub.
- For X∈S_T, the diagonal Gram equation gives iota(G(X)_(i0,i0))=0. The native kfour.inclR_injective (DoubledGroupTopologicalProperties:98–103, via tensor-product includeRight injectivity and Nontrivial AF) gives rational G(X)_(i0,i0)=0. Section 3 gives X_i0=0; therefore I P X=X. The opposite inverse P I X'=X' is immediate from em injectivity.
These maps are the actual Lean Equiv eqv between the two Gram-constrained subtypes. Anisotropy is used to prove the left inverse, not to identify or collapse arbitrary rational matrices. Neither cardinality of the fibres nor a convergence assumption is added. Bijection preserves all multiplicities of the index set.

## 5. Transfer of the actual orbital sum (Afc.orb_res, 148–161)
For each g in the same upper/lower unitary group, let Y=mat(g^-1)iota(X). Since X_i0=0, left matrix multiplication leaves the missing column zero: Y_i0=0. It also commutes with column deletion:
  P(mat(g^-1)iota(X))=mat(g^-1)iota(P X).
Apply IsRes.2 at Y:
  T_d Phi(Y)=T_L Phi'(P Y)=T_L Phi'(mat(g^-1)iota(P X)).
Hence each upper summand equals the lower summand indexed by eqv(X). The native Equiv.tsum_eq reindexes the entire tsum and tsum_congr equates summands; function extensionality gives pointwise equality in g. Both integrands then have the same native average on the same D and measure mu by congrArg. No rescaling of measure or additional scalar, no division by an orbit coefficient, no swapping of sum and integral, and no extra absolute convergence proof claimed here. The formal identity uses the native totalized tsum and average definitions; analytic identification of these with classical convergent expressions is a separate obligation.
Afc.orbRes (165–166) is exactly the pair (orb_zero, orb_res), and Afc.afc_all (JointT:7) packages it alongside uEx and fcConj_of. This finishes the two conditional source statements with the original constraints.

## 6. Exact source-body consumers (not elaborated dependency graph)
Fin.siegelWeilStd_of, SiegelWeilStdOf:63–67, supplies Afc.orbRes as the 25th argument of AStep.stepOf alongside the other 24 hypotheses (see LowerRankDatum:180–182). AStep.ndZero (NdZero:29–30) first uses H.thetaCoef on the genuine Schwartz input then H.orbRes.1 with m<n and IsND. Hence the theta Fourier coefficient vanishes; the Eisenstein-side vanishing still needs WhitLow and ordVal, not OrbRes alone.
In AStep.cOneVal_pf (SectionEqThetaZero:164–169), H.thetaCoef is applied twice and H.orbRes.2 to the actual transformed vectors d.om x Phi and c•L.sd.om g0 Phi'. The latter satisfies lower Schwartz membership by scalar stability and the Schwartz action, while IsRes.2 comes from L.res, IwaQ and T_smul. The resulting lower orbit is scaled by c via COne.orb_smul. This proves the theta coefficient comparison, not all of CTSplit. RUN9/RUN10 explain that scalar and the half-rank spectral shift separately. In particular c need not be nonzero.
These are explicit original source references. Request authenticated type/value role evidence for exact names PositivityTheory.SiegelWeilFormula.Afc.orbRes, .orb_zero, .orb_res, .eqv, .col_zero, GlobalTheory.ThK.Dbl.aniso_of, GlobalTheory.ThK.Dbl.HasSig.aniso; preserve constructor structural dependencies separately. Acceleration RUN12 has native manifest entries for Avac.vacK_of and its two helpers, but it does not establish the present direct edges. No reachability to Main inferred from source membership.

## 7. Provenance and replay
Executed on pinned original sources using connector JS: 10/10 returned blob IDs matched expected IDs and 84/86 literal line anchors initially matched. Two off-by-one line citations in UnfoldB (Nat.min_eq_zero_iff and dotProduct_self_star_eq_zero) corrected from 29/34 to 28/33 and both rechecked successfully; thus 86 corrected anchors checked, with the initial locator failures retained here. This is not a byte-level local rehash or Lean replay. Below is a minimal representative anchor and raw Git blob replay for a local upstream checkout (not executed here). All ten source identities preserved. No numerical synthetic test or runtime superiority claim.

```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
b="src/Development/WeilBound/CoreStatements/AutomorphicKernels/SiegelWeilFormula/"
t="src/Development/WeilBound/ThetaLifts/LatticeBasics/"
rows=[
(b+"AdelicFormCongruences/GramExtendZeroEmbedded.lean","bb0d11111f10813ec5ea0fbe7789822e9615a614",[(48,"theorem orb_zero"),(59,"Matrix.rank_mul_le_left"),(65,"isUnit_neg_two_pow"),(101,"theorem col_zero"),(102,"aniso_of d.ok.good"),(121,"def eqv"),(145,"kfour.inclR_injective"),(148,"theorem orb_res"),(152,".tsum_eq"),(160,"rw [← hr.2"),(165,"theorem orbRes")]),
(b+"LowerRankDatum.lean","1d324fa137e699a8f3c49efeaccd9cf1b6f9da5b",[(92,"μ := d.μ, D := d.D"),(98,"i ≠ i₀ ↔ i ∈ Set.range em"),(113,"Φ' ∈ L.sd.sch"),(122,"T.1.1 L.i₀ i = 0"),(175,"def OrbRes"),(176,"L.IsRes Φ Φ'"),(182,"OrbRes → Step")]),
(b+"AuxiliaryPrimeFunction.lean","1f7101966440b6155348f2ca3b84672dc5028fe5",[(23,"aniso : min r s = 0"),(121,"def orb"),(122,"⨍ g in d.D, ∑' X"),(123,"mat g⁻¹ * incM F X.1")]),
(b+"DefsPlus.lean","c785165cd72cbd00daa51ff67e0e400d77566980",[(34,"T.1.1.det ≠ 0")]),
(t+"UnfoldB.lean","35a4f7205dc1825af4056d48b7ebca680735fa63",[(14,"theorem HasSig.aniso"),(28,"Nat.min_eq_zero_iff"),(33,"dotProduct_self_star_eq_zero"),(41,"theorem aniso_of"),(49,"map_eq_zero")]),
(b+"FourierCompactness/DoubledGroupTopologicalProperties.lean","96f0f6387018aafb150983deb78e83ab64f3955f",[(98,"theorem inclR_injective"),(103,"Algebra.TensorProduct.includeRight_injective")]),
(b+"SiegelWeilStandard/SiegelWeilStdOf.lean","f6f68c195888579f8d05362afa946ee169153cf0",[(63,"AStep.stepOf"),(65,"Afc.orbRes")]),
(b+"AdelicDilations/NdZero.lean","05314df049d2034876de64be326e9e518ce7ff6b",[(30,"(H.orbRes F E σ d).1")]),
(b+"AdelicDilations/SectionEqThetaZero.lean","8c2954a4ed5807b833067ea5a53f5e6ff4a5b171",[(115,"theorem cOneVal_pf"),(165,"(H.orbRes F E σ d).2"),(169,"L.res")]),
(b+"AdelicFormCongruences/JointT.lean","e79412000ccf8446cfc80f611f8f058517a07f5d",[(7,"⟨orbRes, uEx, fcConj_of⟩")])]
n=0
for path,sha,anchors in rows:
    raw=subprocess.check_output(["git","show",pin+":"+path])
    assert subprocess.check_output(["git","hash-object","--stdin"],input=raw).decode().strip()==sha,path
    lines=raw.decode().splitlines()
    for i,s in anchors:
        assert s in lines[i-1],(path,i,s)
        n+=1
print(len(rows),"blob checks;",n,"representative anchors")
```

## 8. Trust boundaries and next action
The rank, definiteness, determinant cancellation and reindexing arguments are classical linear algebra and sum identities, not claimed novel mathematics or newly attributed published results. The named native producers have actual proof bodies in P. No claim of placeholder freedom, axiom audit, published provenance of the wider analytic formula, or Lean kernel validation. All 2 OrbRes conjuncts and original conditions retained; no added hypotheses. Complexity of these proof terms not benchmarked. Source-to-upstream migration and actual root-reachable typed dependencies remain to be checked.

RESUME HERE: reconstruct Afc.fcConj_of from AdelicFormCongruences/CongUnip.lean and its actual imports (ExistsGlCol, projected blocks), especially the singular T to T0 rational conjugation and distinct ratV invariance branch, preserving the auxiliary-prime condition and the Fourier-domain change of variables. Do not redo OrbRes or vacK. Keep Afc.uEx, LD.res construction, CTSplit, HolLead, FourierZero, lInt2 deeper suppliers open. HANDOFF TO theta, integration, editor, audit, kernel, dependencies, acceleration, literature. Project OPEN.

