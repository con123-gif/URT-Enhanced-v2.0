# RUN20 — Square-zero divided-power extension, sharp weight bound and functoriality
2026-11-25. SOURCE-MATCHED local reconstruction; not a complete RH proof. Continuation of RUN19 (598fc9c49d81b36810c3d3570dddc994966961cb), whose RESUME HERE specifically assigns these obligations. No physical Queue or gate changes.

Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity protocol, research log head, research state tail, protocol head, CI summary (run 45529563830 at 8d26a6b, not this run's verdict), recent commit list and math/structure/dependencies/kernel/integration/editor/audit handoffs (commit e2ce836,9d77c3e,276bc239,c50fdeaf,e5e626d,8d26a6b,1dfdae13). Recent Galois/theta/prime/Landau/geometry messages cover other subjects; not all detailed lane notes recovered. No duplicate task found in inspected notes.

## Native source
Repository leanprover-community/riemann-hypothesis pinned 40e56bab026552e089d7afcfeff08d2defb9c005. All line numbers below refer to:
src/Development/AbelianVarietyTheory/PublishedTheorems/Divisors₂/ExistsUniqueIsConnOfLift.lean
GitHub returned pinned blob 6d297c66f38f4c8ec5e21ec7ffe2fc53a9960a49, matching RUN19. Upstream observed c40250a50104b7e02e7d74f658d00fa7b1f4827c (2026-11-25 02:09:34 UTC, merge PR1801); same path blob b2fb2ea7c10836b0ac385e6f875938eb99fb469b (unchanged since RUN19 observed head). Executed 27 substring anchor assertions, one pinned blob identity assertion, line LCS on pinned L20–202 against upstream entire file: 178/183. Upstream extDP begins L118, nilpotence L178, extMap compatibility L226. LCS is lexical, not proof equivalence. Blob identities returned by connector, not independently recomputed. Reproduce via git show PIN:PATH | git hash-object --stdin. No full upstream diff audit.

## Precise premises and proof
Let R be a commutative ring, I an ideal, κ divided powers on I, M an additive commutative group with R and opposite-R module actions satisfying IsCentralScalar (L18,72–74). The square-zero extension E=R⊕M has multiplication (a,u)(b,v)=(ab,av+bu); second summand square zero. Let J=pr^{-1}(I), pr first coordinate. Write γ_n(a)=κ.dpow n a (zero off I, including n=0), P_0(a)=0, P_{n+1}(a)=γ_n(a). Then Γ_n(a,u)=(γ_n(a),P_n(a)u) is the definition extDP (L79–80). No projectivity, flatness, characteristic-zero, invertible factorial or nilpotence assumption is needed for this construction.

Four predecessor identities, all for ideal elements:
- L28–37: Σ_{i+j=n}γ_i(a)P_j(b)=P_n(a+b) and swapped variant. For n=0 both vanish; for n>0 remove j=0 and reindex j−1, then use DP addition. Swapping the antidiagonal gives the other identity.
- L39–44: a P_n(a)=n γ_n(a). n=0 trivial, else use γ_1γ_{n−1}=nγ_n. No cancellation of n.
- L46–56: γ_m P_n+γ_n P_m=binom(m+n,m)P_{m+n}. If either index is zero, use γ_0=1. Otherwise multiply divided powers and apply Pascal to binom(m+n−1,m)+binom(m+n−1,n).
- L58–68: P_m(γ_n(a))P_n(a)=B(m,n)P_{mn}(a), with n≠0, where B counts unordered partitions of mn labelled objects into m blocks of size n (uniformBell). m=0 trivial; for m≥1 the left is γ_{m−1}(γ_n(a))γ_{n−1}(a) = B(m−1,n) binom(mn−1,n−1)γ_{mn−1}(a). Marking the unique block containing a distinguished object proves B(m,n)=binom(mn−1,n−1)B(m−1,n): choose the other n−1 elements then partition the remaining (m−1)n. All coefficients are integers; no division in R. n>0 is essential for this marking argument and for γ_n(a)∈I, not an extra restriction.

The eight fields of DividedPowers, exactly in source order (L81–127):
1. dpow_null: if (a,u)∉J then a∉I; both γ_n and P_n vanish, including n=0.
2. dpow_zero: if a∈I then Γ_0=(1,0).
3. dpow_one: Γ_1=(a,u) since γ_1(a)=a and γ_0(a)=1.
4. dpow_mem: n≠0 and a∈I imply γ_n(a)∈I; second coordinate unrestricted.
5. dpow_add: Γ_n(x+y)=Σ_{i+j=n}Γ_i(x)Γ_j(y). First coordinate is base DP add. Second coordinate is Σ γ_i(a)P_j(b)v + Σ γ_j(b)P_i(a)u=P_n(a+b)(u+v) by both predecessor convolution identities.
6. dpow_mul: for arbitrary y=(b,v)∈E and x=(a,u)∈J, Γ_n(yx)=y^nΓ_n(x). n=0 trivial. For n≥1, first coordinates agree by base scaling. Second coordinate on left equals b^{n−1}γ_{n−1}(a)(bu+av); right equals b^nγ_{n−1}(a)u+n b^{n−1}γ_n(a)v since y^n=(b^n,n b^{n−1}v). Equality follows from aP_n=nγ_n. Central scalar action is used; no division.
7. mul_dpow: Γ_m(x)Γ_n(x)=binom(m+n,m)Γ_{m+n}(x); first coordinate base DP product; second follows from predecessor Pascal identity above.
8. dpow_comp: for n≠0 and x∈J, Γ_m(Γ_n(x))=B(m,n)Γ_{mn}(x); first coordinate base DP composition; second follows from predecessor uniformBell identity above. Inner membership follows from field 4.

L131–135 fst_extDP/snd_extDP are explicit component projections, not extra hypotheses.

## Weight-loss-one nilpotence (L139–178)
Assume IsNilDP κ: there exists N∈ℕ such that every finite list (n_i,a_i) with a_i∈I and Σn_i≥N has ∏γ_{n_i}(a_i)=0. This is a divided-power weighted product hypothesis, not just ordinary nilpotence of each a_i. For x_i=(a_i,u_i)∈J and total weight W≥N+1, the first coordinate of ∏Γ_{n_i}(x_i) is the base product, hence zero. Its second coordinate is
Σ_i [P_{n_i}(a_i) ∏_{j≠i}γ_{n_j}(a_j)]u_i.
This follows by finite-list induction using square-zero multiplication (terms with ≥2 module factors vanish). Terms with n_i=0 vanish; each remaining coefficient is a product of base divided powers of total weight W−1≥N, hence zero. Thus extDP has weighted bound N+1. Native proof uses auxiliary first-coordinate product f, projected membership m, and strengthened induction s with an additional scalar-product list l₀; their respective premises are L141–145,146–149,150–152. In cons case, the contribution from the tail is killed by applying induction with the head's unmodified weight added to l₀; the head module contribution is killed using base hN with the head weight reduced by one (L160–174). This proves the same expanded sum including empty lists and arbitrary zero weights. Final L175–178 uses empty l₀. No assumption of equality of *minimal* bounds; N+1 is an upper bound.

Sharpness control: for p=2,3, R=F_p[t]/(t^p), I=(t), M=R, γ_n(a)=a^n/n! for n<p and zero for n≥p on I (outside I zero). These are valid PDs: at total weight <p factorial identities have units; at ≥p relevant positive-weight products vanish; composition also has matching zero or ordinary integer coefficient. Base bound p holds and is minimal because t^{p−1}≠0. But Γ_p(t,1)=(0,t^{p−1}/(p−1)!)≠0. Hence the original bound N cannot be preserved in general. This is a regression and an exact counterexample to a stronger universal bound, not a counterexample to the native theorem.

## Functoriality (L180–202)
Given commutative R', ideal I', divided powers κ', central bimodule M', ring map σ:R→R' satisfying IsDPMorphism κ κ' σ, and σ-semilinear u:M→M', F(a,v)=(σ(a),u(v)) is a ring homomorphism (unit, zero, add, product follow coordinatewise using semilinearity). It maps J into J' because σ(I)⊆I'. For a∈I, FΓ_n(a,v)=(σγ_n(a),u(P_n(a)v))=(γ'_n(σa),P'_n(σa)u(v))=Γ'_n(F(a,v)); n=0 uses P_0=0, n>0 uses original DP morphism at n−1. This proves both fields of IsDPMorphism_extMap, not just compatibility on individual DP values. Projection pr is a PD morphism by first-coordinate formula and map/comap inclusion (L201–202); inclusion a↦(a,0) is a PD morphism (L255–258). The latter source boundary located and algebraically reconstructed. No assumption that σ or u is injective or surjective.

## External assumption ledger delta
- dpPred, extDP, extMap, pr: explicit definitions, not axioms or citations. extDP has eight explicit field bodies. dpPred_dpow and three preceding identities, fst/snd_extDP, isDPNilpotent_extend, isDPMorphism_extMap, isDPMorphism_pr, isDPMorphism_inl: explicit theorem bodies, not wrappers of postulates. No new premises introduced.
- Base κ, κ', their DP laws, IsCentralScalar, module structures, h:IsNilDP κ (only nilpotence result), h:IsDPMorphism κ κ' σ and semilinear u (only map result): actual local inputs, not established for arbitrary target geometric object by these proofs.
- Imported Mathlib DP axiomatic *structure fields* of supplied κ, Nat.uniformBell_succ_left, Nat.choose_succ_succ', Nat.choose_symm_add, TrivSqZeroExt.snd_pow and component identities, List.prod operations, Ideal.map_le_iff_le_comap: imported results or definitions, not independently traced to kernel proof in this run. No independent citation authentication. Proof that base inputs hold in geometric consumers remains separate.
- Direct source edge extDP→isDPDer_of_map via extDP.dpow_mul at L235 (RUN19); isDPNilpotent_extend→existsUnique_isConn_of_lift L440; isDPMorphism_extMap→IsConn.pull L323. These are visible source references, not authenticated elaborated edges. No verified Main-root path to these leaves, transitive axiom audit, Lean replay or URT speed claim.

## Executed certificate
JS finite model test, actually executed in tool sandbox. Two exhaustive finite sets: p=2 E size 16, J size 8; p=3 E size 729, J size 243. Check all eight fields for indices 0..p+1 (composition inner index positive); all ideal pairs for add, all ring factors for scaling, all ideal elements for product and composition. Functor tested on evaluation at t=0, σ:R→F_p, u same on module, hence noninjective; encode target as constant-coordinate subring. Projection and inclusion also tested. Integer Bell arithmetic uses BigInt factorial only in integer coefficient computation, not division in R. Nil reachability computes sets of products at each total positive weight; zero-weight factors are 1. All positive weights >p+1 give zero by a single factor if its weight exceeds p, or by prefix reaching at least p+1 and the general formula; finite checker only explicitly explores weights ≤p+1. 
Executed output:
p=2 counts null32,zero8,one8,mem24,add256,scale512,product128,composition96,functor32,projection32,inclusion8; nil transition enumerations168; reachable cardinalities [1,8,2,1]; sharp control1.
p=3 counts null2430,zero243,one243,mem972,add295245,scale885735,product6075,composition4860,functor1215,projection1215,inclusion45; nil transitions191970; reachable cardinalities [1,243,27,3,1]; sharp control1.
180 integer combinatorial checks. One nil-bound assertion per model. No universal proof by finite regression, no native kernel execution. Reproduce with Node by extracting the following JS block:
```js
function certificate(){
const ck=(x,m)=>{if(!x)throw Error(m)};
const fact=n=>{let v=1n;for(let i=2;i<=n;i++)v*=BigInt(i);return v};
const choose=(n,k)=>k<0||k>n?0n:fact(n)/fact(k)/fact(n-k);
const bell=(m,n)=>n===0?(m===0?1n:0n):fact(m*n)/(fact(n)**BigInt(m)*fact(m));
let combinatorics=0;
for(let m=1;m<=6;m++)for(let n=1;n<=6;n++){ck(bell(m,n)===choose(m*n-1,n-1)*bell(m-1,n),"Bell recurrence");combinatorics++}
for(let m=1;m<=12;m++)for(let n=1;n<=12;n++){ck(choose(m+n-1,m)+choose(m+n-1,n)===choose(m+n,m),"Pascal");combinatorics++}
function run(p){
const q=p**p, w=Array.from({length:p},(_,i)=>p**i),v=Array.from({length:q},(_,x)=>w.map(z=>Math.floor(x/z)%p));
const encode=z=>z.reduce((s,a,i)=>s+(a%p)*w[i],0);
const A=Array.from({length:q},(_,a)=>Array.from({length:q},(_,b)=>encode(v[a].map((x,i)=>x+v[b][i]))));
const M=Array.from({length:q},(_,a)=>Array.from({length:q},(_,b)=>{let z=Array(p).fill(0);for(let i=0;i<p;i++)for(let j=0;i+j<p;j++)z[i+j]+=v[a][i]*v[b][j];return encode(z)}));
const power=(a,n)=>{let z=1;for(let k=0;k<n;k++)z=M[z][a];return z};
const sc=(a,k)=>M[a][Number(k%BigInt(p))];
const gamma=(n,a)=>a%p?0:n>=p?0:sc(power(a,n),n===2?2n:1n);
const pred=(n,a)=>n===0?0:gamma(n-1,a);
const E=q*q, fst=x=>x%q,snd=x=>Math.floor(x/q),pair=(a,b)=>a+q*b;
const add=(x,y)=>pair(A[fst(x)][fst(y)],A[snd(x)][snd(y)]);
const mul=(x,y)=>pair(M[fst(x)][fst(y)],A[M[fst(x)][snd(y)]][M[fst(y)][snd(x)]]);
const epow=(x,n)=>{let z=1;for(let i=0;i<n;i++)z=mul(z,x);return z};
const esc=(x,k)=>pair(sc(fst(x),k),sc(snd(x),k));
const D=Array.from({length:p+2},(_,n)=>Array.from({length:E},(_,x)=>pair(gamma(n,fst(x)),M[pred(n,fst(x))][snd(x)])));
const J=Array.from({length:E},(_,x)=>x).filter(x=>fst(x)%p===0);
const C={null:0,zero:0,one:0,mem:0,add:0,scale:0,product:0,composition:0,functor:0,projection:0,inclusion:0,nil:0,sharp:0};
for(let x=0;x<E;x++)if(fst(x)%p)for(let n=0;n<=p+1;n++){ck(D[n][x]===0,"null");C.null++}
for(const x of J){
ck(D[0][x]===1,"zero");C.zero++;ck(D[1][x]===x,"one");C.one++;
for(let n=0;n<=p+1;n++){
if(n){ck(fst(D[n][x])%p===0,"mem");C.mem++}
for(const y of J){let z=0;for(let i=0;i<=n;i++)z=add(z,mul(D[i][x],D[n-i][y]));ck(z===D[n][add(x,y)],"add");C.add++}
for(let r=0;r<E;r++){ck(D[n][mul(r,x)]===mul(epow(r,n),D[n][x]),"scale");C.scale++}
for(let m=0;m<=p+1;m++){
let k=m+n;ck(mul(D[m][x],D[n][x])===esc(k<=p+1?D[k][x]:0,choose(k,m)),"product");C.product++;
if(n){k=m*n;ck(D[m][D[n][x]]===esc(k<=p+1?D[k][x]:0,bell(m,n)),"composition");C.composition++}
}
let mapped=pair(fst(D[n][x])%p,snd(D[n][x])%p);
let expected=n===0?1:n===1?q*(snd(x)%p):0;
ck(mapped===expected,"functor sigma=constant,u=constant to Fp");C.functor++;
ck(fst(D[n][x])===gamma(n,fst(x)),"projection");C.projection++;
if(snd(x)===0){ck(D[n][x]===gamma(n,fst(x)),"inclusion");C.inclusion++}
}}
const reachable=Array.from({length:p+2},()=>new Set());reachable[0].add(1);
for(let k=1;k<=p+1;k++)for(let n=1;n<=k;n++)for(const z of reachable[k-n])for(const x of J){reachable[k].add(mul(z,D[n][x]));C.nil++}
ck(reachable[p+1].size===1&&reachable[p+1].has(0),"nil bound");ck(D[p][pair(p,1)]!==0,"sharp one weight");C.sharp++;
return {p,E,J:J.length,reachable:reachable.map(s=>s.size),C};
}
return {combinatorics,models:[run(2),run(3)]};
}
console.log(JSON.stringify(certificate()));
```

RESULT: DONE local source-matched eight-field construction, predecessor identities, nilpotence and functoriality. PARTIAL transitive assumption audit. RESUME HERE: reconstruct IsDPDer.isDPMorphism L242–251, secMor/inlMor/prMor L264–278 and existsUnique_isConn L356–383 from pinned same file, retaining base-change IsBC and both tensor component maps; trace the actual proof suppliers for H.1/H.2 separately from assumptions. Then reconcile isBC_of_lift L400–428 and existsUnique_isConn_of_lift L430–441. Request authenticated role-labelled Main-root paths for these declarations and extDP from dependency/kernel lanes. HANDOFF TO literature, dependencies, kernel, integration, editor, geometry, audit. RH reconstruction OPEN, no independent Lean validation or URT improvement.
