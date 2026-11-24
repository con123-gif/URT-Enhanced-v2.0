/*
RH AUDIT — 2026-11-24 — REVIEW / SOURCE-MATCHED, PARTIAL overall.
One contribution: quantifier-preserving audit of zeroFreeOn_of_tiedWin_cyc and level_of_tiedWin, with exact countermodels for invalid witness reorderings.
Pinned RH 40e56bab026552e089d7afcfeff08d2defb9c005; observed current HEAD 9477923066c923e6dbf7292da17019f8d08d0db8, TopWin blob 9cda00fdcd8975f638995190ed0182cd97cced33 differs from pinned a6ac464a67f99a546566ee3a3e0fd1db1f4c2550. No mixing.
Peer: math/2026-11-24_window_exponent_and_character_projection.md (blob read through connector), math/2026-11-24_topg_vwin_zero_free_bridge.md blob 61297a5f42ed52752b9358d80be9ca5a67599650; character_boxes/RUN1_CONNECTED_WINDOW_WITNESS.md blob 691114be7974fd950c248b7f9b2defc44161e3be.
Preflight read SWARM_PROTOCOL, AGENTS, state, runner log/protocol, continuity, HANDOFF_QUEUE, prior boundary audit, math analytic and TopG and window chapters, structure exact bundle, dependency actual fixture, integration guarded dual and export notes, specialist kernel/character/prime/editor checkpoints. Cathedral checkpoint 374 PASS run 45410580111, unrelated to RH.
Failed attempts: root log/protocol returned 404; recovered runner paths. Local command -v lean, lake and ~/.elan/bin unavailable. No kernel elaboration, #print axioms, or complete transitive sorry check. Source blobs via connector; Node replay hashes them independently. Blueprint itself not retrieved this run; peer source notes used for navigation only. No URT claim.

Human proof: fix la>1 and the primitive psi satisfying Q. The cyclic level contains psi by Level.mem_cyc. Fix s with sigma=Re s>1/2. In the window-scale hypothesis eD,eL,eps1>0 (positivity applies to eps1 ONLY) are chosen BEFORE eps; write A=eD+eL+7, q=min(sigma-1/2,1/2)>0, delta=q/2, theta=1/2+delta. Then 0<theta<1 and theta<sigma. Choose eps=min(eps1/2,delta/(|A|+1)); positive and strictly below eps1, A eps<=delta, regardless of sign of A. Now obtain ONE Fm with EFamC, Windows la and tied constants K,cHH,eK,CL,x0 independent of x. Obtain cutoff x1 from h112 for this very Fm. For any desired start y choose Y>=max(y,x1,1) with full [Y,Y^la] in Fm.Win. For all x in that interval, Gm(x)<=x^(1/2+A eps)<=x^theta because x>=1. Apply FormBAt la (obtained from FormB via la>1) at theta to conclude ZeroFreeAbove theta; membership of psi and theta<sigma give nonvanishing. All host bounds, EAtH, ChainTied, level_family, FormB and analytic zero-free theorem remain prerequisites or named dependencies; no claim they follow from the algebra. The source windowInequality_of_artinInputs uses one host index i supplied by the tied core lemma and applies EFamC at exactly i, using max(x1,x0,xE). The source TopG wrapper uses the same Fm and class witness c to give eFamC_of_cls and c.1, with d the tied data.

New countermodels (abstract logical interfaces, NOT counterexamples to actual Dirichlet L-functions or RH):
1. Moving A after eps destroys the proof. Let abstract signal G(x)=x on x>=1, all windows available, and let A(eps)=1/(2eps) (eD=A-7,eL=0). Every eps>0 has exponent 1 exactly, so the weakened estimate holds. For every fixed A and eps1>0 a positive eps<eps1 can instead be chosen with A eps<=1/4, making exponent<=3/4, impossible on arbitrarily late windows. In an abstract FormB model declare a fake zero at 3/4. For every 0<theta<1, no arbitrarily late window satisfies G<=x^theta (already fails at any Y>1), so FormB's antecedent is false and the implication is vacuous. Thus the weakened estimates plus abstract FormB do NOT imply zero-freeness. This is an exact quantifier countermodel, not synthetic evidence about the real signal.
2. Separate family witnesses cannot be combined. In log2 coordinates take I_n=[2*4^n,3*4^n] for n>=0. Their exponentiated intervals are full la=3/2 windows; even and odd unions both have arbitrarily late full windows and have empty intersection. If EFamC is only available on the even family and tied data only on the odd family, the common witness is absent. Independently at a host index the pattern E(i)=not T(i) gives both separate existential statements but no common i. Original EFamC is universal over i beyond a threshold and avoids this error.
3. A fixed eps>0 before all s fails for A>0: take sigma=1/2+min(A eps,1/2)/2. Then sigma<1/2+A eps, no valid theta between exponent and sigma. Also uncapping q for sigma=3 gives theta=7/4, outside FormB's theta<1. Exponent monotonicity reverses at 0<x<1 (e.g. x=1/2, exponent 0 vs 1). Preserve max(x1,1). These are not claims that every bound fails; they refute the stated weakened inference.

AGREE with peer epsilon derivation and exact common-witness transfer; DISAGREE with varying A, independent family or host witnesses, or fixing eps before all target s. PARTIAL for full proof. Source anchors and rational regressions support the human argument; finite tests do not establish the universal real theorem or kernel graph.
Executed in connector JS V8: {"counts":{"source":61,"epsilon":366048,"varying_constants":3600,"uniform_constants":3240,"windows":820,"same_host":254,"fixed_epsilon":2400,"base_guard":627,"negative":2,"mutation":8},"total":377060,"rejected":8}. Node git-checkout replay below not executed in this session; no local RH git checkout or Lean. 
RESUME HERE: independently audit tiedCore_of_chainTied's TT set equality, use of Frame.A.val_injective and digit_mem_cyclic_subgroup, and all dependent host fields; check whether explanatory projection silently changes host or frame.
HANDOFF TO: integration, math, character boxes, proof editor.
*/
const pin="40e56bab026552e089d7afcfeff08d2defb9c005";
const ledger=[
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean",
    "a6ac464a67f99a546566ee3a3e0fd1db1f4c2550",
    [
      [
        "ChebyshevInequalityOnFamilyWindows",
        [
          "∃ K cHH eK CL x0 : ℝ, ∀ x ≥ x0",
          "x ∈ (core Fm).Win → Tied Fm"
        ]
      ],
      [
        "ChebyshevInequalityOnWindows",
        [
          "∀ (eD eL eps : ℝ), 0 < eps",
          "∀ Fm : Fam eps, EFamC Λ (core Fm)",
          "∃ x1 : ℝ, ∀ x ≥ x1",
          "(eD + eL + 7) * eps"
        ]
      ],
      [
        "ChebyshevInequalityAtWindowScale",
        [
          "∃ eD eL ε₁ : ℝ, 0 < ε₁ ∧ ∀ eps : ℝ",
          "eps < ε₁ → ∃ Fm : Fam eps",
          "EFamC Λ (core Fm) ∧",
          "(core Fm).Windows la ∧ ChebyshevInequalityOnFamilyWindows"
        ]
      ],
      [
        "exists_small_eps",
        [
          "|C| + 1",
          "min (ε₁ / 2) (δ / (|C| + 1))",
          "C * ε ≤ δ"
        ]
      ],
      [
        "level_of_tiedWin",
        [
          "intro ψ hψ s hs",
          "exists_small_eps (eD + eL + 7) (half_pos hm0) h1",
          "h ε hε0 hεlt",
          "h112 eD eL ε hε0 Fm hE hT",
          "hB (1 / 2 + min (s.re - 1 / 2) (1 / 2) / 2)",
          "(x0 := max x1 1)",
          "Real.rpow_le_rpow_of_exponent_le"
        ]
      ],
      [
        "zeroFreeOn_of_tiedWin",
        [
          "ψ ∈ Λ.KEPT ∧ 1 < la",
          "level_of_tiedWin c (d la b) e"
        ]
      ],
      [
        "zeroFreeOn_of_tiedWin_cyc",
        [
          "(hla : 1 < la)",
          "Level.mem_cyc ψ",
          "h112 ψ hψ, hB ψ hψ, h ψ hψ"
        ]
      ]
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean",
    "099d96fec932b03a505ea79a81c45bcc3fbf0ea3",
    [
      [
        "HasWindows",
        [
          "∀ y : ℝ, ∃ Y : ℝ",
          "∀ x : ℝ, Y ≤ x → x ≤ Y ^ la → x ∈ S"
        ]
      ],
      [
        "HasWindows.mono",
        [
          "h (max y x0)",
          "hS x ((le_max_right _ _).trans (hyY.trans h1)) (hY x h1 h2)"
        ]
      ],
      [
        "FormBAt",
        [
          "0 < θ → θ < 1",
          "HasWindows {x | Λ.Gm x ≤ x ^ θ} la → Λ.ZeroFreeAbove θ"
        ]
      ],
      [
        "FormB",
        [
          "∀ la : ℝ, 1 < la → Λ.FormBAt la"
        ]
      ]
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ZeroFreeAllOfTopG.lean",
    "54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1",
    [
      [
        "zeroFreeAll_of_topG",
        [
          "zeroFreeOn_of_tiedWin_cyc",
          "UpperTheory.Comparison₂.level_gm_le_on_family_scales",
          "UpperTheory.Comparison₂.formB",
          "h la (GChi ψ) hla (hS ψ) (hypV_of_cls ψ la)",
          "h2 eps a b",
          "eFamC_of_cls ψ la Fm c, c.1, d"
        ]
      ]
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/CharacterBoxes/DivinNOfHypV.lean",
    "5321920359316653b7627951429a6d7555c311b0",
    [
      [
        "FamilyClassConnected",
        [
          "∃ eD eL ε₁ : ℝ, 0 < ε₁ ∧ ∀ eps : ℝ",
          "∃ Fm : FamP eps, ℰ Fm ∧ ∃ K cHH eK CL x0 : ℝ",
          "∀ x ≥ x0, x ∈ Fm.Win → ChainTied Fm"
        ]
      ]
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/Imports.lean",
    "2dc9b4e690951c66ffe443e279fcada259bcce13",
    [
      [
        "UpperTheory.Comparison₂.formB",
        [
          "level_family Λ",
          "(δ := la - 1) (C := 1)",
          "hW Y₀",
          "(1 : ℝ) + (la - 1) = la",
          "rw [hG, one_mul]"
        ]
      ]
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/WindowInequalityOfArtinInputs.lean",
    "c349e34925ac26b8bc76bd36e9b91562f86d6b8d",
    [
      [
        "FamCoreConstantBounds",
        [
          "∃ i : Fm.Ix x, CoreAtH"
        ]
      ],
      [
        "windowInequality_of_artinInputs",
        [
          "max x1 (max x0 xE)",
          "obtain ⟨i, hi⟩",
          "((core Fm).D x i).host.toHostAx",
          "(hE x (le_of_max_le_right b) i) hi"
        ]
      ]
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean",
    "de994949e6fd2d7238cfcb1c19d361ccdfe904fc",
    [
      [
        "tiedCore_of_chainTied",
        [
          "⟨i0, m, f",
          "TT = (Fm.D x i0).host.TT",
          "subst hTT",
          "refine ⟨i0",
          "Frame.digit_mem_cyclic_subgroup"
        ]
      ],
      [
        "level_gm_le_on_family_scales",
        [
          "windowInequality_of_artinInputs (fun Fm => tiedCore_of_chainTied Fm) Λ"
        ]
      ]
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean",
    "ed60b4b997cd4703713660b185b9e43fd95559a1",
    [
      [
        "ZeroFreeOn",
        [
          "∀ ψ : PChar, Q ψ → ψ.ZeroFreeAbove (1 / 2)"
        ]
      ],
      [
        "ZeroFreeAbove",
        [
          "∀ ψ ∈ Λ.KEPT, ψ.ZeroFreeAbove θ"
        ]
      ],
      [
        "Level.mem_cyc",
        [
          "Subgroup.mem_zpowers _",
          "ψ.of_self"
        ]
      ]
    ]
  ]
];
function audit(ledger,src){
 const counts={};function ck(b,k,m){if(!b)throw Error(k+": "+m);counts[k]=(counts[k]||0)+1}
 function body(s,n){const re=/^(?:private )?(?:theorem|def|structure|lemma) ([^\s({:]+)/gm;const ms=[...s.matchAll(re)];const j=ms.findIndex(m=>m[1]===n);if(j<0)throw Error("declaration not found "+n);return s.slice(ms[j].index,ms[j+1]?.index??s.length)}
 function anchors(L,S){for(const [p,sha,ds] of L)for(const [n,ss] of ds){const b=body(S[p],n);for(const a of ss)ck(b.includes(a),"source",n+" "+a)}}
 anchors(ledger,src);
 const F=(n,d=1n)=>{n=BigInt(n);d=BigInt(d);if(d<=0n)throw Error("den");return [n,d]},add=(a,b)=>F(a[0]*b[1]+b[0]*a[1],a[1]*b[1]),mul=(a,b)=>F(a[0]*b[0],a[1]*b[1]),neg=a=>F(-a[0],a[1]),sub=(a,b)=>add(a,neg(b)),abs=a=>F(a[0]<0n?-a[0]:a[0],a[1]),div=(a,b)=>F(a[0]*b[1],a[1]*b[0]),cmp=(a,b)=>a[0]*b[1]-b[0]*a[1],min=(a,b)=>cmp(a,b)<=0n?a:b;
 const zero=F(0),one=F(1),half=F(1,2);
 // Exact rational instances of the universal real algebra, not empirical proof of it.
 for(let sn=1;sn<=48;sn++)for(let sd=1;sd<=17;sd++){const s=F(sn,sd);if(cmp(s,half)<=0n)continue;const q=min(sub(s,half),half),delta=mul(q,half),theta=add(half,delta);
  for(let C=-20;C<=20;C++)for(const cap of [F(1,10000),F(1,52),F(1,2),F(3)]){
   const A=F(C),eps=min(mul(cap,half),div(delta,add(abs(A),one)));
   ck(cmp(eps,zero)>0n&&cmp(eps,cap)<0n,"epsilon","strict admissibility");
   ck(cmp(mul(A,eps),delta)<=0n,"epsilon","loss");
   ck(cmp(add(half,mul(A,eps)),theta)<=0n&&cmp(theta,s)<0n&&cmp(theta,zero)>0n&&cmp(theta,one)<0n,"epsilon","exponent and strict zero exclusion");
  }
 }
 // Uniform constants countermodel, A(eps)=1/(2 eps); G(x)=x for x>=1.
 // It meets the weakened exponent-bound hypothesis, but FormB is vacuous for every theta<1.
 for(let n=1;n<=60;n++)for(let den=1;den<=60;den++){
   const eps=F(n,den),A=div(half,eps),eD=sub(A,F(7));
   ck(cmp(add(half,mul(add(eD,F(7)),eps)),one)===0n,"varying_constants","G=x exponent exactly 1");
 }
 // Any fixed A can be defeated by a positive eps arbitrarily small: exponent <=3/4.
 for(let C=-40;C<=40;C++)for(let den=1;den<=40;den++){
   const A=F(C),cap=F(1,den),eps=min(mul(cap,half),div(F(1,4),add(abs(A),one)));
   ck(cmp(add(half,mul(A,eps)),F(3,4))<=0n&&cmp(eps,cap)<0n,"uniform_constants","G=x cannot obey uniform small-eps bounds");
 }
 // Distinct family windows in log2-coordinate, la=3/2: [2*4^n,3*4^n].
 // Even and odd n give disjoint unbounded unions of complete windows.
 const intervals=Array.from({length:40},(_,n)=>[2n*4n**BigInt(n),3n*4n**BigInt(n)]);
 for(let i=0;i<intervals.length;i++){
   const [l,r]=intervals[i];ck(2n*r===3n*l,"windows","exact la");
   for(let j=i+1;j<intervals.length;j++)ck(r<intervals[j][0],"windows","disjoint windows");
 }
 // A per-x host exists with each property individually, but no common host.
 for(let mask=1;mask<255;mask++){
   const E=Array.from({length:8},(_,i)=>!!(mask&(1<<i))),T=E.map(v=>!v);
   ck(E.some(Boolean)&&T.some(Boolean)&&!E.some((v,i)=>v&&T[i]),"same_host","separate exists insufficient");
 }
 // An epsilon fixed before s cannot cover the entire strict half-plane when A>0.
 for(let A=1;A<=40;A++)for(let den=1;den<=60;den++){
   const eps=F(1,den),loss=mul(F(A),eps),s=add(half,mul(min(loss,half),half));
   ck(cmp(s,half)>0n&&cmp(s,add(half,loss))<0n,"fixed_epsilon","threshold exceeds target");
 }
 // Exact exponent-order reversal for 0<x<1; cutoff 1 cannot just disappear.
 for(let b=2n;b<=20n;b++)for(let m=0n;m<6n;m++)for(let n=m+1n;n<=8n;n++)
   ck(b**m<b**n,"base_guard","(1/b)^m>(1/b)^n");
 ck(cmp(add(half,mul(sub(F(3),half),half)),one)>0n,"negative","uncapped s=3 yields theta=7/4, outside FormB");
 ck(cmp(F(1,2),half)===0n,"negative","boundary s=1/2 fails strict target");
 // Mutate a selected exact anchor in each source, then demand that the original anchor verifier rejects.
 let rejected=0;for(const [p,sha,ds] of ledger){const [n,ss]=ds[0];const a=ss[0];const b=body(src[p],n);const changed=b.replace(a,"REMOVED_REQUIRED_PREMISE");if(changed===b)throw Error("mutation did not apply");const s={...src,[p]:src[p].replace(b,changed)};let fail=false;try{anchors([[p,sha,[[n,[a]]]]],s)}catch(e){fail=true}ck(fail,"mutation","removed anchor accepted");rejected++}
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0),rejected};
}
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const rh=process.argv[2];if(!rh)throw Error('provide pinned RH git checkout');
const src={};for(const [p,sha] of ledger){const b=execFileSync('git',['-C',rh,'show',pin+':'+p],{maxBuffer:32*1024*1024});if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob mismatch '+p);src[p]=b.toString('utf8')}
console.log(JSON.stringify(audit(ledger,src),null,2));
