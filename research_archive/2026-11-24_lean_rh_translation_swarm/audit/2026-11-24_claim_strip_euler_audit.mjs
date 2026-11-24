/*
RESULT: AGREE with analytic chapter's imprimitive transfer, with exact
scope clarification; PARTIAL for full reconstruction. SOURCE-MATCHED.
24 Nov 2026; peer math/2026-11-24_analytic_zero_exclusion_chapter.md
(blob 2c296ac9e55158223fb239104a8a318f0e95f923), integration/END_OF_DAY_MANUSCRIPT_SPINE.md
(blob 4ce7e09202b0c9083cc9d7313e052b108385a123). Read swarm protocol, handoff,
AGENTS, state/log/protocol, continuity, peer math/structure/dependency/integration/audit.
Previous audit b9e1af8 reflection; this is the separate Claim.strip branch.
Pinned upstream: 40e56bab026552e089d7afcfeff08d2defb9c005. Source paths and blob IDs below.

Exact bridge (ClaimStrip.lean):
1. factor_ne_zero: for prime p and Re(s)>0, |psi(p)p^(-s)| <= p^(-Re(s))<1.
   Thus every added finite Euler factor is nonzero. No Re(s)>1/2 needed
   for this lemma. At s=0 principal modulus-1 inducing modulus 2 has
   factor 1-2^0=0; strict positive range cannot simply be weakened.
2. prim_zero: assumes positive N AND nonzero conductor, 0<Re(s)<1 and
   L(chi,s)=0. Derive s!=1 from Re(s)<1, use Or.inr in changeLevel
   formula, split zero product. Factor lemma rules out Euler-factor zero;
   hence L(chi_prim,s)=0. No primitive premise on original chi.
3. prim_reflect: for primitive psi and strict strip, s!=0 and 1-s!=0.
   Gamma factor nonzero at s (even/odd via GammaR). Rewrite L=completed/gamma;
   div_eq_zero_iff and nonzero gamma give completed L=0. Inverse character
   is primitive by conductor_inv; its functional equation yields completed
   inverse L at 1-s =0. Rewrite back by zero_div. The reflected character
   is psi^(-1), NOT psi in general. No additional gamma nonzero premise at
   reflected point needed for zero_div in the formal proof.
4. strip: trichotomy Re(s) relative to 1/2. Right: HalfPlane directly,
   Or.inr(s!=1). Left: obtain NeZero conductor, prim_zero, prim_reflect,
   then HalfPlane at conductor on inverse primitive character and 1-s,
   using Re(1-s)>1/2 and 1-s!=1 (s!=0). Middle: equality. This proves
   the ALL-character strict-strip claim, not a global claim outside strip.
5. zeta: input zero, excluded negative even integers, s!=1. s=0
   excluded by riemannZeta_zero. In 0<Re(s)<1 use modulus-one identity
   and strip; Re(s)>=1 separately excluded by riemannZeta_ne_zero_of_one_le_re.
   Re(s)<=0: GammaR(s)!=0 from its zero classification, nonzero s and
   trivial-zero exclusion. Completed zeta zero, then reflection and
   zero_div; Re(1-s)>=1 yields contradiction. zeta_iff is Iff.rfl.
   Pinned Main.riemannHypothesis (actual global name riemannHypothesis)
   calls rhOfAll, not Claim.zeta directly; pinned LFunction_eq_zero_re
   uses claimAll.2.1, which comes from Claim.strip allChi. Latest observed
   upstream e23fe94c20626997fceadcc817237335a0602c20 uses Claim.zeta
   directly; do not merge revisions.

Important premise clarification for Imprimitive.lean: ZeroFreeAll unfolds
to every primitive PChar and all s with Re(s)>1/2, with NO exception
in the formal proposition. It is stronger in form than guarded EveryCharacter.
The call h (PChar.of chi) trivial s hs supplies hL before the guard is
transported. The disjunction is required for LFunction_changeLevel,
not for hL. If original chi!=1, its primitive character cannot be 1 by
changeLevel_primitiveCharacter and changeLevel_one; otherwise s!=1
is carried through. Do not describe the unguarded Lean proposition as
a holomorphic statement at a pole or weaken its premise silently.
Its upstream producer and totalized L-value at 1 remain separate audit tasks.

Executed V8: seven source files fetched at pin, connector blob IDs matched;
{"source":48,"guard":6,"reflection":15,"euler":200,"zetaPartition":81,"mutations":9}. Exact finite rational/integer regression fixtures,
not a proof of Mathlib analytic lemmas. Mutation checks detect changed source
text, not semantic equivalence. No kernel elaboration or #print axioms:
lean/lake/elan absent; git ls-remote failed DNS. Initial wrong ClaimStrip
path 404; contents API returned decoded text instead of JSON metadata,
recovered using fetch_file. No full-corpus or URT advantage claim.
Prior CI checkpoint 356 PASS for 3149343 (run 45355061872), not this commit.
Working branch head just before create-only write: 8201c67038065803193a12a00ed82adb29065235.
Replay: node this_file.mjs /path/to/pinned/upstream-git-clone
Checks actual git blob identity then reruns same regression functions.
No unrelated changes.
RESUME HERE: audit ZeroFreeAll producer's modulus-one regularization and
the totalized LFunction value at s=1, following the actual lemmaL source.
HANDOFF TO: integration, math, character_boxes, human editor, audit.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005";
const files={
  "strip": [
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ClaimStrip.lean",
    "60b3e96d81c2cb7d821d14c978b38bd9fd0d97f8"
  ],
  "imp": [
    "src/Development/AutomorphicArithmetic/CharacterBoxes/Imprimitive.lean",
    "97cbdce9fcc91c4f0dcc25fef62daf4c95724afa"
  ],
  "half": [
    "src/Development/AutomorphicArithmetic/CharacterBoxes/HalfPlane.lean",
    "dcd66cb38f94dfabe24700848a68dc9135bbd3fe"
  ],
  "main": [
    "src/Main.lean",
    "dbd5db70bc11b35f18fa5751216ab335321e7bfc"
  ],
  "statements": [
    "src/Statements.lean",
    "1cd1bce93344065936b2b392b23306254e0785ef"
  ],
  "zero": [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean",
    "ed60b4b997cd4703713660b185b9e43fd95559a1"
  ],
  "kern": [
    "src/Supplements/Kernels/MainTheorems.lean",
    "6a542d7ce969a791fd12ce575f587e6bc29044bf"
  ]
};
const clauses={
  "strip": [
    "(hs : 0 < s.re) (p : ℕ)",
    "(hp : p.Prime)",
    "Real.rpow_lt_one_of_one_lt_of_neg",
    "(hs0 : 0 < s.re) (hs1 : s.re < 1)",
    "χ.primitiveCharacter (Or.inr hs)",
    "Finset.prod_eq_zero_iff.mp",
    "factor_ne_zero _ hs0 p (Nat.prime_of_mem_primeFactors hp)",
    "(ψ⁻¹).IsPrimitive",
    "hψ'.completedLFunction_one_sub s",
    "DirichletCharacter.LFunction_eq_completed_div_gammaFactor ψ s (Or.inl hs0')",
    "h.resolve_right (gamma_ne_zero ψ hs0)",
    "DirichletCharacter.LFunction_eq_completed_div_gammaFactor ψ⁻¹ (1 - s) (Or.inl ht0')",
    "lt_trichotomy s.re (1 / 2)",
    "prim_reflect χ.primitiveCharacter χ.primitiveCharacter_isPrimitive hs0 hs1 hp",
    "h χ.conductor χ.primitiveCharacter⁻¹ (1 - s)",
    "(Or.inr ht) hr",
    "(h N χ s hgt (Or.inr hs))",
    "intro s hz htriv hs1",
    "riemannZeta_zero",
    "lt_or_ge 0 s.re",
    "lt_or_ge s.re 1",
    "exact strip h 1 1 s hpos hlt1 hL",
    "riemannZeta_ne_zero_of_one_le_re",
    "Complex.Gammaℝ_eq_zero_iff.mp",
    "htriv ⟨n",
    "completedRiemannZeta_one_sub",
    "theorem zeta_iff : Zeta ↔ RiemannHypothesis := Iff.rfl"
  ],
  "imp": [
    "ZeroFreeAll → ∀ (N : ℕ) [NeZero N]",
    "(χ ≠ 1 ∨ s ≠ 1)",
    "h (PChar.of χ) trivial s hs",
    "χ.primitiveCharacter ≠ 1 ∨ s ≠ 1",
    "χ.changeLevel_primitiveCharacter, h1, DirichletCharacter.changeLevel_one",
    "LFunction_changeLevel χ.conductor_dvd_level χ.primitiveCharacter hχ'",
    "Finset.prod_ne_zero_iff.mpr",
    "Nat.prime_of_mem_primeFactors hp"
  ],
  "half": [
    "1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1)",
    "0 < s.re → s.re < 1",
    "(¬ ∃ n : ℕ, s = -2 * (n + 1)) → s ≠ 1"
  ],
  "zero": [
    "def PChar.ZeroFreeAbove",
    "∀ s : ℂ, θ < s.re → DirichletCharacter.LFunction ψ.χ s ≠ 0",
    "def ZeroFreeOn (Q : PChar → Prop) : Prop := ∀ ψ : PChar, Q ψ → ψ.ZeroFreeAbove (1 / 2)",
    "def ZeroFreeAll : Prop := ZeroFreeOn fun _ => True"
  ],
  "main": [
    "riemannHypothesis : RiemannHypothesis := rhOfAll",
    "LFunction_eq_zero_re : DirichletLZerosOnLine := claimAll.2.1"
  ],
  "statements": [
    "def DirichletLZerosOnLine : Prop",
    "0 < s.re → s.re < 1 → DirichletCharacter.LFunction χ s = 0"
  ],
  "kern": [
    "Formalism.VW.rh_of_every allChi",
    "⟨allChi, Claim.strip allChi, Claim.zeta allChi⟩"
  ]
};
function checkSources(src,clauses){
 let n=0;
 for(const [k,cs] of Object.entries(clauses)) for(const c of cs){if(!src[k].includes(c))throw Error(k+" missing "+c);n++;}
 return n;
}
function regression(src,clauses){
 const counts={source:checkSources(src,clauses),guard:0,reflection:0,euler:0,zetaPartition:0,mutations:0};
 function ok(b,m){if(!b)throw Error(m);}
 // Character flag true means principal; changeLevel of principal is principal.
 for(const orig of [false,true])for(const prim of [false,true])for(const one of [false,true]){
   if(prim&&!orig)continue;
   if(!orig||!one)ok(!prim||!one,"guard transport");
   counts.guard++;
 }
 // Rational grid s.re = k/16, strict interior. No floating point.
 for(let k=-32;k<=48;k++){
   if(k>0&&k<16){if(k<8)ok(16-k>8&&16-k<16,"left reflection");if(k>8)ok(k>8&&k<16,"right");if(k===8)ok(16-k===8,"fixed line");counts.reflection++;}
   const branch=k<=0?0:k<16?1:2;
   ok(Number(k<=0)+Number(k>0&&k<16)+Number(k>=16)===1,"partition");
   if(branch===0)ok(16-k>=16,"zeta reflected right");counts.zetaPartition++;
 }
 // Exact Gaussian-integer samples for character values 0, ±1, ±i,
 // s positive integer, denominator p^s. Not a proof of the complex-power lemma.
 for(const p of [2n,3n,5n,7n,11n])for(let s=1n;s<=8n;s++)for(const [a,b] of [[0n,0n],[1n,0n],[-1n,0n],[0n,1n],[0n,-1n]]){
   const d=p**s;
   ok(a*a+b*b<=1n&&d*d>1n,"factor hypotheses");
   ok((d-a)*(d-a)+b*b>0n,"Euler factor");counts.euler++;
 }
 // Actual boundary example: primitive principal character at modulus one;
 // at s=0 the extra Euler factor for modulus 2 is exactly 1-1=0.
 ok(2n**0n-1n===0n,"boundary witness");
 // Without character norm <=1, a=2 at p=2,s=1 defeats factor claim.
 ok(2n**1n-2n===0n,"norm bound witness");
 // Without p>1, p=1, a=1 defeats claim.
 ok(1n**1n-1n===0n,"prime lower bound witness");
 const bad=[["strip","(hs : 0 < s.re)","(hs : 0 ≤ s.re)"],["strip","(hp : p.Prime)","(hp : True)"],["strip","(hs0 : 0 < s.re) (hs1 : s.re < 1)","(hs0 : 0 ≤ s.re) (hs1 : s.re ≤ 1)"],["strip","χ.primitiveCharacter (Or.inr hs)","χ.primitiveCharacter (Or.inl hs)"],["strip","h χ.conductor χ.primitiveCharacter⁻¹ (1 - s)","h χ.conductor χ.primitiveCharacter (1 - s)"],["strip","htriv ⟨n","trivial ⟨n"],["imp","(χ ≠ 1 ∨ s ≠ 1)","(χ ≠ 1 ∧ s ≠ 1)"],["zero","def ZeroFreeAll : Prop := ZeroFreeOn fun _ => True","def ZeroFreeAll : Prop := ZeroFreeOn fun ψ => ψ.χ ≠ 1"],["main","riemannHypothesis : RiemannHypothesis := rhOfAll","riemannHypothesis : RiemannHypothesis := Claim.zeta allChi"]];
 for(const [k,from,to] of bad){ok(src[k].includes(from),"mutation absent");const m={...src,[k]:src[k].split(from).join(to)};let rejected=false;try{checkSources(m,clauses)}catch{rejected=true}ok(rejected,"mutant survived "+from);counts.mutations++;}
 return counts;
}
const dir=process.argv[2]; if(!dir)throw Error('provide upstream git clone');
const src={}; for(const [k,[path,sha]] of Object.entries(files)){const b=execFileSync('git',['-C',dir,'show',pin+':'+path]);const actual=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(actual!==sha)throw Error('blob mismatch '+path);src[k]=b.toString('utf8');}
console.log(JSON.stringify(regression(src,clauses)));
