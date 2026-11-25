# Principal host: exact linear orbit compression and loss-free odd-prime transfer
25 November 2026. Status: source-matched human derivation, not a proof of CountI/CorG or RH. User authorizes conventional methods without URT. Continues 49631f4b, 9ad1dec5. Read prior vanishing note and recent commits. Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. No external research incorporated into this note.

## 1. Orbit count, not a count of individual characters
For principal base, G=(Z/N)^*/H=C_(2^E) × C2 × C2, D=4*2^E, N=D*q1*d. Over splitting coefficients let n=2^E and character labels (k,a,b) with k mod n, a,b mod2. For fixed twist j, parity a+b=j mod2, so two admissible pairs (a,b). Two characters have the same kernel precisely when one is a power of the other by a unit modulo its order: quotient by their kernel is cyclic and both characters are faithful on it. All orders are 2-powers and their units are odd. Odd powering preserves both a,b. For a fixed pair it is transitive on k of any given gcd(k,n) (including k=0). Thus exact kernel-orbit label (gcd(k,n),a,b). For each parity there are exactly
  2(E+1) orbits, containing 2^(E+1)=D/2 individual characters.
The orbit k=0 has size one for each pair. A k of order 2^r, r>=1, contributes phi(2^r)=2^(r-1) characters per orbit. Its total character order is max(2^r,order(a,b)) so agrees with 2^r; the k=0 cases are order 1 or 2 with phi=1. Each increase of E adds exactly two new kernel orbits for a fixed parity. Under inflation the previous orbits are unchanged. This is a symbolic linear representation in E, not a proven linear runtime for computing cohomology inside each orbit.

The pinned CountI.lean already groups by kernels H' with orbit weight phi([units:H']). For principal host, all kernels in its union T contain the fixed host kernel H and have parity j. All of each same-kernel orbit has that parity since odd powers preserve sign. Thus sum_{H' in T} phi([units:H']) <= D/2, improving the generic bound <= N. This holds even if some coefficient rings fail to split the whole host, since the kernels can be compared in one abstract splitting character group. CorG's uniform per-orbit inequality, if established, now implies
 sum_l log(l) sum_{psi in X_j} Vn(l,j,psi)
 <= 2*c5*7^5*(log r1+log r2)*D*N^18*j^7,
 with c5 replaced by |c5| if needed. Source CountI chooses primes beyond 30+base conductor+pK=38; r1=41,r2=43 meet those requirements if q1,d>43. Finite length requirement is retained. This changes only aggregation, not the needed per-orbit congruence estimate. CountI cannot be declared proven.

## 2. All odd coefficient primes are prime-to-index
Pinned redPrime (HeightAndVanishing/RedPrime.lean blob 9b5f1ab583d11365a37d6db8b573168f825ecbe7) requires l odd and l not dividing H.index. Host index divides 2^(E+2)*o by HostIndex; o=1, hence condition holds for EVERY odd l, including exceptional 3 and 7. It does not require l prime to N. In the proof of FinalLe.sumIn one can replace redAll by redPrime, retaining all field, closure, coefficient-root and parity hypotheses, obtaining
 plusLen(D_l,j)*eO(l,O) <= sum_{psi in X_j} Vlen(l,j,psi).
No lossAll term, no associated polynomial budget. Chr.vLe (CharacterLevelBounds/VLe.lean blob fe84b4080a340b9859c432e1e393bec5f75292bd) also gives V=V' for characters whose order divides the host index, so the local-condition conversion is loss-free for odd l. The explicit source proof of redPrime only uses enough roots of unity of quotient exponent, after deriving it from totient(N); a separate specialized theorem can take that weaker premise directly, allowing an unramified coefficient extension containing 2^E-th roots. No Lean theorem implemented here.

Since the previous classical CountIV vanishing note supplies zero for relevant entries subject to its audit, the exceptional branch can use exactly the same loss-free estimate as the generic branch. No LayerLe input is needed in the odd plus assembly provided the earlier vanishing and remaining CountII/CountV/CountVs are established. The independent 2-primary and minus bounds and geometric supply remain. This is not deletion of original Main's kernel dependencies.

## 3. Executed exact checks
V8: 32752 character-label/order/orbit-size checks E=2..12, both parities; independent 496 actual kernels computed by explicit zero-character evaluation over every group element at E=2..6. No collisions beyond predicted classes, all passed. At E=12, each parity has 8192 characters and 26 orbits. Reproduce:
```js
function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
let checks=0,kernelChecks=0;
for(let E=2;E<=12;E++)for(let parity=0;parity<2;parity++){
 const n=2**E,orbits=new Map();
 for(let a=0;a<2;a++)for(let b=0;b<2;b++){
 if((a+b)%2!==parity)continue;
 for(let k=0;k<n;k++){let g=gcd(k,n),id=[g,a,b].join(':'),ord=Math.max(n/g,a?2:1,b?2:1),cur=orbits.get(id)||{ord,count:0};
 if(cur.ord!==ord)throw Error('order');cur.count++;orbits.set(id,cur);checks++}}
 let sum=0;for(let {ord,count} of orbits.values()){if(count!==(ord===1?1:ord/2))throw Error('size');sum+=count}
 if(orbits.size!==2*E+2||sum!==2*n)throw Error('mass')}
for(let E=2;E<=6;E++){let n=2**E,keys=new Map();
 for(let k=0;k<n;k++)for(let a=0;a<2;a++)for(let b=0;b<2;b++){let ker=[];
 for(let x=0;x<n;x++)for(let u=0;u<2;u++)for(let v=0;v<2;v++)if((k*x+n/2*(a*u+b*v))%n===0)ker.push([x,u,v].join(','));
 let id=ker.join(';'),expected=[gcd(k,n),a,b].join(':');
 if(keys.has(id)&&keys.get(id)!==expected)throw Error('kernel merge');keys.set(id,expected);kernelChecks++}
 if(keys.size!==4*E+4||new Set(keys.values()).size!==keys.size)throw Error('kernel count')}
if(checks!==32752||kernelChecks!==496)throw Error('count');
```
These verify finite group identities, not cohomological lengths. No native Lean or CI replay. Source paths: AutomorphicVarieties/HeightAndVanishing/{CountI,Counts,HostIndex,RedPrime,RedAll,FinalLe}.lean and CharacterLevelBounds/{VLe,SignLe}.lean.
RESUME HERE: prove uniform CorG bound for each actual orbit, especially the newest two per parity; orbit count does not bound the lengths. Keep the scope RH-only and do not substitute model matrices. HANDOFF TO math, audit, Galois and editor.
