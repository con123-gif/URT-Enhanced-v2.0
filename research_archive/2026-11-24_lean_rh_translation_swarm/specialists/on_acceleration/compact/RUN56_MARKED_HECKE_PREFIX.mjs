#!/usr/bin/env node
/*
RUN56 O(N) acceleration, 26 Nov 2026 — common marked Hecke inverse prefix.
Source-matched human proof + executed exact formal coefficient regression;
native replacement NOT compiled. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0; Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob
3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript 57e7f36aa8032da2dd16f54a539e23d992a7cf96
(read latest branch; exact source and peer guards below). Protocol, handoff,
expansion and AGENTS read. Peers fcd5da81 and 575d0d31 already derive the
ordinary inverse recurrence, valuation bound and chain cancellation; do
not duplicate or claim those results. New step: reuse the SAME normalized
inverse across ALL j in the actual exists_hecke_transfer caller, at fixed
(D,p,l,twist); j only changes scalar rescaling and the newly appended group.

Set r=ceilLogM p, n_j=D.n j, q=l.q=p^(2h), a=chain index, k=0..D.t,
z_(a,k)=q^k * chi_(a+1), with chi the actual baseChange.atUnif(l) of the
chain character. These lie in the native valuation ring (the proof's I e),
and are INDEPENDENT of j and of x in Psi.support. Keep all original p,
marked-place, twist-coprimality, sphericity and good-datum hypotheses.

The polynomial in LocalStatement.exists_hecke_transfer, S (j+1).2, is
 Q_j(U)=prod_(a=0)^j prod_(k=0)^t (1+U p^(h n_j) z_(a,k)).
Define P_j(V)=prod_(a=0)^j prod_(k=0)^t(1+V z_(a,k)).
Then EXACTLY Q_j(U)=P_j(p^(h n_j)U). Work in the truncated ring
 R[V]/(V^(r+1)); constant coefficient 1 is a unit over ANY commutative ring.
 Let d^(-1)=(1,0,...,0). For each appended factor 1+zV update IN PLACE,
 in ASCENDING order:
   d'_0=d_0; d'_i=d_i-z d'_(i-1) for i=1,...,r.
Proof: coefficient i of (1+zV) D'(V) is d'_i+z d'_(i-1)=d_i.
Thus D'=D/(1+zV) modulo V^(r+1), without division by a coefficient,
and inductively P_j D_j=1 mod V^(r+1). Each output prefix remains integral.
The inverse coefficient used by native j is p^(h n_j d) d^(j)_d:
substitution in the truncated ring commutes with inversion by uniqueness.
It works if p^(h n_j) is NOT a unit; never invert this scale.

With y from native S, the actual transfer coefficient at i<=r is
 c_(j,i)= p^delta/y(0,r) * q^binom(i,2) * p^(h n_j(r-i)) * d^(j)_(r-i).
The peer bound delta >= h*r*(n_(j+1)-n_0+r-1) keeps the first ratio
integral; the remaining powers are integral (r>=i, n_j>=0).
For r=0 the inverse is 1 and update cost zero; no negative exponent issue.
Coefficient extraction and equality for all spherical vectors are precisely
the native SphericalHecke.sum_coeff_invOfUnit_smul_eq use, not a new
eigenbasis or a numerical approximation. Thus this is a valid alternative
coefficient supplier in the same exists_hecke_transfer statement under
the original representation identity. All actual local bounds remain.
The same ordered mark product Y is used at each stage downstream, not
a newly chosen lattice. No independent stagewise witness optimization.

Operation count for ALL m stages at fixed context: updating each linear
factor costs r multiply-subtracts; exactly m(t+1)r updates plus O(mr)
output scalings if coefficients for each stage are materialized (powers
have their own computation cost). Restarting this SAME factor-inverse
method each stage costs (t+1)r*m(m+1)/2 updates. Ratio (m+1)/2 for this
specific stage-restart baseline, not native Lean's measured speed.
Memory r+1 ring elements excluding input/output, coefficient bit growth
and multiplication costs separate. Can emit each stage then discard.
No claim that noncomputable native Lean construction actually executes
this algorithm, or that total proof search or compile time is O(N).
Cache key includes compact pin, exact D,p,l,twist, r and ordered actual
chain-character factors; reject changed context rather than reuse.
No cache keyed by stage name alone; scaling is per stage.

Executed in V8 on four actual pinned source bodies: 16 exact source guards,
4 removed-guard controls detected. 31 exact free-polynomial
assertions (formal symbols, degree<=4; includes reversed-update rejection).
The formal small regression used 24 incremental vs 48 restart
updates, NOT a benchmark on actual arithmetic parameters, not RH evidence.
The all-degree identity above follows by the displayed induction, not testing.
No new Lean execution. Actual prior RUN29 receipt blob 088cd2ec confirms
6 B/C checks, A timed out 2700.11s, overall false; no new A-only receipt
observed in registry. Old native engine and graph ledgers retained unchanged.
Original path: S -> invOfUnit coefficient -> exists_hecke_transfer ->
exists_move_markOperator -> gaugeLe_markOperator_pow -> local index -> A.
Candidate path: same S -> normalized prefix induction -> rescale coefficient
-> SAME transfer/callers. Retain source path as fallback; no global deletion
or proof-axiom claim. Unresolved: actual pairing/character identity,
Schur-jet and marked elementary divisors, stage support, remaining A/B/C
primitive proofs. No essential RH premise retired.

Usage with exact pinned compact checkout:
 node RUN56_MARKED_HECKE_PREFIX.mjs /path/to/grh-compact/src
Optional --lean writes native axiom/caller probes (not a replacement term).
Run only in approved shared native runner; no workflow/registry edits.
RESUME HERE: integration/theta accept prefix argument only if same normalized
chain-char factors match (exact source shown). Kernel: run A-only RUN55
then actual LocalStatement probes; evaluate native feasibility before
porting normalized-prefix replacement, preserve old engine role/axiom logs.
HANDOFF TO kernel, theta, audit, integration. Human proof incomplete.
*/
import {readFileSync,writeFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {join} from "node:path";
const specs={
  "New/Columns/LocalStatement.lean": [
    "9d5bd0d698b0db2850cbd306d8d400d7e99a3547",
    [
      "let y e i : ℂ",
      "((p ^ h) ^ D.n (j + 1) / (p ^ h) ^ D.n e) ^ i",
      "∏ a ∈ range e, ∏ k ∈ range (D.t + 1)",
      "(1 + .X * l.q ^ k • (p ^ h) ^ D.n j • C ⟨_, I a.succ⟩)",
      "sum_coeff_invOfUnit_smul_eq (r :=",
      "p ^ D.deltaP p / y 0 (D.ceilLogM p)",
      "lemma Data.IsGoodDatum.exists_move_markOperator",
      "lemma Data.IsGoodDatum.gaugeLe_markOperator_pow",
      "lemma Data.exists_indexDvd_Bmu_divisible"
    ]
  ],
  "Lib/Weil/Unramified/SphericalHecke.lean": [
    "37493fc793c98f8e31d1d2e101e77a4ac2a4023b",
    [
      "noncomputable def heckePolyEval",
      "((-X) ^ i * w.q ^ i.choose 2)",
      "lemma sum_coeff_invOfUnit_smul_eq"
    ]
  ],
  "New/Curve/LiveSum.lean": [
    "3efab3907b063bb2c59d182df981ad62862f8a1b",
    [
      "def deltaP := D.ceilLogM p * D.f * (D.n D.m + D.ceilLogM p)"
    ]
  ],
  "New/Columns/JetExponentBound.lean": [
    "bedef08c7c1707f74e9afce0c8008b88ba37dc8a",
    [
      "lemma Data.IsMarked.sum_inducedPlace_sub_star_eq_zero",
      "lemma Data.le_jetExponent",
      "lemma Data.IsMarked.sum_lowColumns_le"
    ]
  ]
};
function audit(inputs,specs){
 let n=0;for(const [path,[sha,guards]] of Object.entries(specs)){const v=inputs[path];if(!v||v.sha!==sha)throw Error("source pin "+path);for(const g of guards){if(!v.content.includes(g))throw Error("missing source guard "+g);n++}}
 return n;
}
function formalCertificate(){
 const one=()=>new Map([["",1n]]),zero=()=>new Map();
 function add(a,b,sign=1n){const c=new Map(a);for(const [k,v] of b){const n=(c.get(k)||0n)+sign*v;if(n)c.set(k,n);else c.delete(k)}return c}
 function mul(a,b){let c=zero();for(const [x,u] of a)for(const [y,v] of b){const k=[...x.split(",").filter(Boolean),...y.split(",").filter(Boolean)].sort().join(",");const n=(c.get(k)||0n)+u*v;if(n)c.set(k,n);else c.delete(k)}return c}
 function eq(a,b){return a.size===b.size&&[...a].every(([k,v])=>b.get(k)===v)}
 const variable=i=>new Map([[String(i),1n]]);
 // Symbolic degree<=4 regression, not a simulation of particular p-adic inputs.
 const r=4,blocks=3,width=2;let inv=Array.from({length:r+1},(_,i)=>i?zero():one()),prod=inv.slice(),checks=0,incremental=0,cold=0;
 function advance(d,z){for(let i=1;i<=r;i++)d[i]=add(d[i],mul(z,d[i-1]),-1n)}
 function productFactor(d,z){for(let i=r;i>=1;i--)d[i]=add(d[i],mul(z,d[i-1]))}
 function scaled(poly,power){const out=zero();for(const [k,v] of poly)out.set([...k.split(",").filter(Boolean),...Array(power).fill("s")].sort().join(","),v);return out}
 function assert(v,m){if(!v)throw Error(m);checks++}
 for(let j=0;j<blocks;j++){
  for(let k=0;k<width;k++){const z=variable(1+j*width+k);advance(inv,z);productFactor(prod,z);incremental+=r}
  const direct=Array.from({length:r+1},(_,i)=>i?zero():one());
  for(let k=0;k<(j+1)*width;k++){advance(direct,scaled(variable(k+1),1));cold+=r}
  for(let d=0;d<=r;d++){
   // Compare against separately rebuilt stage-specific inverse in the free ring.
   assert(eq(scaled(inv[d],d),direct[d]),"stage scaling "+j+"/"+d);
   let convolution=zero();for(let i=0;i<=d;i++)convolution=add(convolution,mul(prod[i],inv[d-i]));
   assert(eq(convolution,d===0?one():zero()),"inverse identity "+j+"/"+d);
  }
 }
 // A reversed update is not a valid triangular solve. Detect exact omitted dependency.
 const wrong=[one(),zero(),zero(),zero(),zero()],z=variable(1);
 for(let d=r;d>=1;d--)wrong[d]=add(wrong[d],mul(z,wrong[d-1]),-1n);
 assert(!eq(wrong[2],mul(z,z)),"negative control failed");
 return {checks,incremental,cold,scope:"formal polynomial regression only; not actual input or Lean speed"};
}
const [root,leanOut]=process.argv.slice(2);
if(!root)throw Error("supply exact pinned grh-compact/src checkout");
const inputs={};
for(const path of Object.keys(specs)){
 const raw=readFileSync(join(root,path));
 const sha=createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex");
 inputs[path]={sha,content:raw.toString("utf8")};
}
const guards=audit(inputs,specs);
let negative=0;
for(const path of Object.keys(specs)){
 const bad={...inputs,[path]:{...inputs[path],content:inputs[path].content.replace(specs[path][1][0],"REMOVED")}};
 try{audit(bad,specs)}catch(e){negative++;continue}throw Error("negative guard accepted "+path);
}
console.log(JSON.stringify({guards,negative,formal:formalCertificate(),native:"NOT RUN"},null,2));
if(leanOut){
 writeFileSync(leanOut,`import New.Columns.LocalStatement
#print axioms Data.IsGoodDatum.exists_hecke_transfer
#print axioms Data.IsGoodDatum.exists_move_markOperator
#print axioms Data.IsGoodDatum.gaugeLe_markOperator_pow
#print axioms Data.exists_indexDvd_Bmu_divisible
`,{flag:"wx"});
}
