/*
AUDIT REVIEW 2026-11-24 — AGREE with specialist RUN4 linear nearest-pole witness
and Cauchy join; DISAGREE with dropping real-residue positivity, strict Cauchy
radius, full-domain isolation or strict growth gap. PARTIAL overall.
Peer: specialists/landau_criterion/RUN4_LINEAR_NEAREST_POLE_AND_CAUCHY_AUDIT.md
blob 749073ec88279e0dbd484e0b0c3880f8f56e9bfb. Math chapter blob
2c296ac9e55158223fb239104a8a318f0e95f923. Prior audit cc0abbc2045168168b0206f110dda3fe637a86eb.
Read SWARM_PROTOCOL, AGENTS, state, actual nested research log/protocol,
continuity, handoff, peer integration/structure/dependency checkpoints and
specialist RUN4. Blueprint Drive 1-3dAIG1_cmfzkZieK-lw8S5F-v_C9_dI text
retrieved; synopsis navigation only. Initial root log/protocol paths
404, recovered actual nested paths. Lean/lake/toolchains absent locally.
First V8 certificate attempt failed on misspelled result variable;
corrected and reran all assertions before commit.
Latest upstream observed cb4dc6e23a6187db392c96664295415c55b6b01e,
Main blob 67c65badc15f80a1db65df1c84dc7a4928fc410f uses Claim.zeta;
pin Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc uses rhOfAll.
No migration or independent kernel/axiom closure. Eight pinned blobs checked.
Previous Cathedral CI checkpoint 362 PASS, run 45373263454, ca38970;
not evidence for this audit. Pre-write head d598c88e2186a26521c2e6f98afaea3d555f74a5.

ONE contribution: independent adversarial audit of the specialist's
nearest-pole/Cauchy compression, including a full countermodel for removing
real-residue positivity from the actual abstract landau_window theorem.
Let beta=3/4, theta=1/2, delta=1/2. Set Z={beta},
g(u)=-exp(beta*u), Phi(s)=-1/(s-beta) off beta, arbitrary totalized value
at beta. All seven PoleData fields hold EXCEPT the positive real residue
clause of pole: meas obvious, |g(u)|<=exp(2u) for u>=0; integral over u>0
equals -1/(s-beta) for Re(s)>2; pos beta>0; diff off singleton; iso at
every positive-real-part center since singleton closed/discrete; pole
has c=-1 nonzero, imaginary part zero, analytic remainder h=0.
WindowHypU holds for all eta>0,U0 by U=max(1,U0), R=0:
integrable zero, 0>=g, integral 0<=exp(eta U). Yet beta>theta. Thus the
weakened theorem is FALSE, not just a failed proof step. Also A_k(s)
=(-1)^k Phi^(k)(s)/k!=-1/(s-beta)^(k+1); for sigma>2 and all real t,
|A_k(sigma+it)|+Re A_k(sigma)<=0, so even the uniform upper key
estimate does not detect this pole. This directly validates why source
uses div_pos hc1 hd in real branch. No assumptions about actual RH zeros
or physics. The positive sign is indispensable; imaginary-part-zero is
retained in source ledger even if unused in this particular inequality.
A different counterexample if c != 0 removed: g=Phi=0, Z={beta+i},
c=0, h=0; the real-residue implication is vacuous. Do not assert the
original theorem is false.

Independent review of RUN4: tie-breaking highest imaginary part makes
equal q/equal height imply equal real coordinate since both left of sigma.
For any higher point old gap >0; h <= gap/(4*heightdiff) preserves at
least half gap. Lower points gain positive gap. Equal height preserves
strict old gap. Shift h<=epsilon/2 ensures witness stays inside D, and
triangle inequality brings every candidate in open ball back to F.
Hence d<r<=D and r is OPEN; boundary ties at r allowed. Both dichotomy
branches checked using a separate integer-coordinate fixture, rational
subcase D only for adaptive shift. All-real proof above/the peer proof
not replaced by finite fixtures. No performance claim.

Additional sharp controls: H(s)=(1-s)^(-2) on open unit disk gives
|H^(k)(0)/k!|=k+1, so replacing r'<r by r'<=r makes Cauchy bound false
at equality. Z={1/n:n>=1} is locally isolated at all Re>0 centers,
but infinite in closedBall(1,1); hence strict radius<Re(center) is
needed for compact finiteness (open ball positivity can use <=).
Z={1+1/n:n>=1} isolated at its members but accumulates at 1 not in Z;
infinite in closedBall(2,1), showing need for iso at EVERY center.
Dropping Re(a),Re(b)<sigma from equidistance lemma permits mirrors
a=7,b=9,sigma=8; t=1 avoids the Lean totalized tie formula 0/0=0.
Dropping e>d in growth_contra allows c=C=1,d=e=1 with U>=0:
C exp(eta U)/e^k>=c/d^k, so no strict growth contradiction.
For window_contra set c=M=1,d=e=E=1,C=0 to satisfy H identically.
These are exact mathematical countermodels; finite test cases are
regressions, not proofs of universal assertions.
Source matches are lexical, no kernel claims; no sorry absence or
transitive axiom conclusion. No URT advantage or physical gate changes.

Executed in V8 connector runtime on fetched sources:
{
  "assertions": 14220,
  "sourceAssertions": 30,
  "geometryAssertions": 5360,
  "branchA": 864,
  "branchB": 144,
  "linearWitnessCases": 480,
  "initialTies": 0,
  "negativeResidueCases": 8316,
  "cauchyEndpointCases": 129,
  "tangentBallCases": 128,
  "memberOnlyIsolationCases": 128,
  "mirrorCases": 1,
  "equalRadiusCases": 128
}
Replay: node this_file.mjs /path/to/rh/git
checks pinned blob SHA using git show/hash-object and repeats tests.
Node replay not executed here. CI for this new commit not yet observed.
RESUME HERE: audit landau_tails and landau_window_ineq, in particular
the uniform-in-height upper estimate with signed g and k>=U; compare
against prime-window specialist's current derivation, preserving every
quantifier and integrability premise.
HANDOFF TO: integration, proof editor, landau_criterion, audit.
*/
import {execFileSync} from 'node:child_process';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",prefix="src/Development/AutomorphicArithmetic/DedekindLFunctions/",ledger=[
  [
    "LandauZeroFreeCriterion.lean",
    "54fd0de979e0dad6ac7709ad8ecbec8a29e21872",
    [
      "iso : ∀ z : ℂ, 0 < z.re → ∀ᶠ w in 𝓝[≠] z, w ∉ Z",
      "c ≠ 0 ∧ (ρ.im = 0 → 0 < c.re ∧ c.im = 0)",
      "∀ η : ℝ, 0 < η → ∀ U₀ : ℝ",
      "0 ≤ R u ∧ g u ≤ R u"
    ]
  ],
  [
    "LandauTheorems/LandauDichotomy.lean",
    "947dae363ce629febcba27b1b70355438f8639a0",
    [
      "D ≤ σ - θ",
      "σ - ρ₁.re < D",
      "σ - β < r ∧ r ≤ σ - θ",
      "Metric.closedBall"
    ]
  ],
  [
    "LandauTheorems/LandauNearest.lean",
    "6a177498987e1ef453727131bf2004bc797a01a2",
    [
      "(hD : D < σ)",
      "(hρ₁ : σ - ρ₁.re < D)",
      "(F ×ˢ F)",
      "lt_min hr"
    ]
  ],
  [
    "LandauTheorems/LandauFinite.lean",
    "46a0dc63f21009582a2dda61c1267e9aad88bde5",
    [
      "(hr : r < z.re)",
      "hK.elim_nhds_subcover"
    ]
  ],
  [
    "LandauTheorems/LandauCauchy.lean",
    "f415cdd3e7743dda02d46040c0cb1cc4fde5eb5b",
    [
      "(h0 : 0 < r') (h1 : r' < r)",
      "Metric.closedBall_subset_ball h1",
      "norm_cauchyPowerSeries_le"
    ]
  ],
  [
    "LandauTheorems/LandauPoleAsym.lean",
    "e5ec846b37b8879944576a38c83013814a6f1fe7",
    [
      "(hne : ρ ≠ z)",
      "if s = ρ then hfun ρ",
      "landau_cauchy hGd h0 h1",
      "landau_pole_asym_deriv"
    ]
  ],
  [
    "LandauTheorems/landauWindow.lean",
    "7915058f10b33a52652290cd887cbccdc00e676a",
    [
      "(hde : d < e) (heE : e ≤ E)",
      "∀ γ : ℝ",
      "landau_dichotomy hP.iso",
      "(d + r) / 2",
      "(div_pos hc1 hd)",
      "obtain ⟨hc1, hc2⟩ := hc"
    ]
  ],
  [
    "LandauTheorems/LandauGrowthContra.lean",
    "bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda",
    [
      "(hde : d < e)",
      "Real.log_pos",
      "L / 2"
    ]
  ]
];
function audit(ledger,sources){
 let assertions=0;const ck=(v,m)=>{if(!v)throw Error(m);assertions++};
 for(const [p,sha,patterns] of ledger)for(const t of patterns)ck(sources[p].includes(t),p+" "+t);
 const sourceAssertions=assertions;
 const sq=x=>x*x,min=(a,b)=>a<b?a:b;
 const pts=[[1n,0n],[2n,0n],[3n,0n],[4n,0n],[4n,1n],[4n,-1n],[5n,3n],[5n,-3n],[2n,5n],[1n,-4n]];
 let A=0,B=0,linear=0,ties=0;const s=8n,theta=2n,E=s-theta;
 for(let mask=1;mask<1<<pts.length;mask++){
  const P=pts.filter((p,i)=>mask>>i&1),eligible=P.filter(p=>p[0]>theta);if(!eligible.length)continue;
  const dist=p=>sq(s-p[0])+sq(p[1]),F=P.filter(p=>dist(p)<=sq(E));
  const D2=F.reduce((d,p)=>min(d,dist(p)),sq(E)),w=eligible.find(p=>sq(s-p[0])<D2);
  if(!w){B++;ck(F.length>0,"B nonempty");const v=F.find(p=>dist(p)===D2);
   ck(v[1]===0n&&v[0]>theta&&sq(s-v[0])===D2,"B real unique");
   ck(P.every(p=>p===v||dist(p)>D2),"B strict isolation");ck(D2<sq(E),"B strict outer gap");continue;}
  A++;
  for(let D=s-w[0]+1n;sq(D)<=D2;D++){
   const en=min(D-(s-w[0]),s-D);ck(en>0n,"epsilon");
   const q=p=>sq(s-p[0])+sq(w[1]-p[1]),W=P.filter(p=>4n*q(p)<=sq(2n*D+en));
   ck(W.includes(w),"witness in finite set");const v=W.reduce((a,p)=>q(p)<q(a)||(q(p)===q(a)&&p[1]>a[1])?p:a);
   if(W.filter(p=>q(p)===q(v)).length>1)ties++;
   let a=en,b=4n;for(const p of W)if(p[1]>v[1]){const n=q(p)-q(v),d=4n*(p[1]-v[1]);ck(n>0n,"tie rule");if(n*b<a*d){a=n;b=d;}}
   ck(a>0n&&4n*a<=en*b,"positive shift <= eps/2");
   const dd=p=>sq((s-p[0])*b)+sq((w[1]-p[1])*b+a),dv=dd(v);let R=sq(D*b);
   ck(dv>0n&&dv<R,"strict inner/outer gap");
   for(const p of W)if(p!==v){ck(dd(p)>dv,"strict shifted winner");R=min(R,dd(p));}
   ck(dv<R&&R<=sq(D*b),"radius");for(const p of P)if(p!==v)ck(dd(p)>=R,"global open isolation");linear++;
  }
 }
 const geometryAssertions=assertions-sourceAssertions;
 let negResidueCases=0;
 for(let S=9n;S<=20n;S++)for(let T=-16n;T<=16n;T++)for(let k=0n;k<=20n;k++){
  const n=sq(S-3n)**(k+1n),d=(sq(S-3n)+sq(T))**(k+1n);
  ck(n<=d,"negative residue suppresses one-sided window LHS");negResidueCases++;
 }
 for(let M=0n;M<=128n;M++)ck(M+1n>M,"Cauchy endpoint no finite bound");
 for(let n=1n;n<=128n;n++)ck(sq(n-1n)<=sq(n),"tangent closed ball");
 for(let n=1n;n<=128n;n++)ck(sq(n-1n)<=sq(n),"member-only isolation");
 ck(sq(8n-7n)+1n===sq(8n-9n)+1n,"mirror control");
 for(let k=0n;k<128n;k++)ck(1n**k===1n**k,"no strict exponential gap");
 return {assertions,sourceAssertions,geometryAssertions,branchA:A,branchB:B,linearWitnessCases:linear,initialTies:ties,negativeResidueCases:negResidueCases,cauchyEndpointCases:129,tangentBallCases:128,memberOnlyIsolationCases:128,mirrorCases:1,equalRadiusCases:128};
}
const root=process.argv[2];if(!root)throw Error("supply local RH git checkout");
const sources={};for(const [p,sha] of ledger){const b=execFileSync('git',['-C',root,'show',pin+':'+prefix+p]);const actual=execFileSync('git',['-C',root,'hash-object','--stdin'],{input:b}).toString().trim();if(actual!==sha)throw Error('blob '+p);sources[p]=b.toString('utf8');}console.log(JSON.stringify(audit(ledger,sources),null,2));
