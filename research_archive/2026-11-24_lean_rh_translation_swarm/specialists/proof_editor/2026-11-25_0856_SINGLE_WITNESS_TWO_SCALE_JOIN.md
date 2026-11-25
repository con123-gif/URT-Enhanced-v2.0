# Lane 15 — single selected geometric witness AND two scalar thin tests
25 November 2026. RESULT: new source-matched local mathematical join; conditional human proof, not a Lean replay or proof of RH. This joins peer 2f135e5b (one selected translation, original pointwise thin cost) and cc5937fc (two reference scales, all-translation averaged geometry). Neither peer alone licenses their simultaneous use. The old maximizer of the thick sum is in general WRONG for the averaged thin argument. Select a different, entirely arithmetic score, including both signed thin reference terms and thick loss, before geometry.

## 1. Exact setting and arithmetic score
Use the actual principal host A0=H, h=|H|>0, F=2h, G=C2 x C2 x H, T=TT, r=|T|>0, d=|T2|/h>0, m>0, b>0, x>=3. Fix the same common native host D, ell, T,T2, a(t)=A_t, b,b',eta, N and parameter tables BEFORE the translation is selected. Put a=xb, S=sum_t A_t, a<=A_t<=a+b; retain all positive weights, cutoff and host conditions of ch_balance. In the exact native partition let J_u(t)={((1,0),s+u-t): s in T2} be thick; K_T(t)={((1,1),s-t): s in T} be top, disjoint from J_u(t); L_u(t) be the complement in C={(1,i,k):i=0,1,k in H}. Each element of C0={(1,0,k)} is thick at fraction d of translations; K_T is independent of u.

Set U_g(y)=Re[(1/F) sum_chi chi(-g) GPsi(D,ell,chi,y)/y] and P_{t,g}(v)=A_t U_g(A_t/v). The exact inner_eq and orthogonality_ramified yield
    P_{t,g}(v)=sum_{n>=1} Lambda(n) Kc(n,g) (A_t/n-v)_+ +(A_t/F) log v + C_{t,g},
where C_{t,g} is independent of v, and Kc is real nonnegative for every prime power with sum_g Kc=2. The summation is finite at every positive v (n=1 term zero). Thus, for thick v in [b,b+eta+1],
    P_{t,g}(v) >= P_{t,g}(b) -(eta+1) M_{t,g},
    M_{t,g}=sum_{n<=A_t/b} Lambda(n) Kc(n,g).
This follows from the ramp slope bound and log v>=log b; no norm taken.

For thin/top use the actual cc5937fc reference bounds, with w''=b'/(xn), eta<=w''/x, bT(s)>=b', bT(s)<=b'(1+x^-2/4) (requires full ParameterChoice and SizeRho witness, not an arbitrary SizesA). Set B_L=w''+eta, B_T=b'(1+1/x+x^-2/4)+eta and y_L=a/B_L, y_T=a/B_T. For both classes y=A_t/v>=y_class and log(y/y_class)<=3/x by the actual window inequalities. Monotonicity of U_g(y)+log(y)/F (positive ramp expansion) then gives
    P_{t,g}(v) >= A_t U_g(y_class)-3 A_t/(x F).
There are at most F nonthick positions per t, independently of m or h. Crucially the lower envelope is independent of the unknown geometric weights.

Define the deterministic arithmetic score
    M(u)=sum_{t in T} [
      sum_{g in J_u(t)} (P_{t,g}(b)-(eta+1) M_{t,g})
      + A_t sum_{g in K_T(t)} U_g(y_T)
      + A_t sum_{g in L_u(t)} U_g(y_L) ].
Choose u* maximizing M(u) on H. It depends on no geometric w, lift j, height/rank quotient, or chosen carrying member at u*. (Common tables a,b,bT and all shared conditions still need their native existence proof before this choice.) The native ch_balance identity and the lower envelopes imply, for ANY actual carrying witness at u* satisfying the stated windows,
    gapA(u*) >= m M(u*) - 3m S/x >= m mean_u M(u)-3m S/x.       (1)
Only ONE witness at the prescribed u* is needed, not one at every u, and no pointwise ThinScales bound is used here. A mean bound for an arbitrary existing witness is NOT enough: it must be at this selected u*. If an approximate maximizer with score within delta of the mean is used, add m delta to the error.

## 2. Evaluate the mean without destroying cancellation
Let F_signed(y)=Re sum_{chi trivial on H} chi(e1(0)) GPsi(chi,y). Define the exact coefficients B_chi,T_chi,L_ref,T_ref as in cc5937fc:
    B_chi=(S/F)(sum_{g in C}chi(-g)-d sum_{g in C0}chi(-g)),
    T_chi=(1/F) sum_{t,s in T} A_t chi(-(1,1,s-t)),
    L_ref=Re sum_chi (B_chi-T_chi) GPsi(chi,y_L)/y_L,
    T_ref=Re sum_chi T_chi GPsi(chi,y_T)/y_T.
Both signed reference contractions are kept. In particular T_chi need not vanish for nontrivial H-character. Native sum_Th gives the mean thick term; the translation bijection gives the exact mean loss and thin masks:
    mean_u M(u) = (bd/2) sum_t F_signed(A_t/b)
                  +L_ref+T_ref -(eta+1)d sum_t sum_{g in C0} M_{t,g}.
Since sum_{g in C0} M_{t,g} <= 2 psi(A_t/b), the unconditional Chebyshev bound psi(y)<=4(log 2)y (for y>=1, or retain the actual psi sum) controls this part. Let R satisfy F_signed(x)-F_signed(A_t/b)<=R on T, as in the earlier derivative shift. If the ONE native witness at u* satisfies gapA(u*)<=Err, (1) yields the joined inequality with Q=rmb:
    F_signed(x) <= R + 2 Err/(Qd)
        + (4(eta+1)/(rb)) sum_t psi(A_t/b)
        + (2m/(Qd)) (3S/x-L_ref-T_ref).                       (2)
The exact psi version is the theorem; any Chebyshev constant can be substituted independently. Equation (2) is precisely the averaged two-scale bound with Err instead of the mean geometry gap, without assuming geometry exists at all translations. The native full hypotheses imply this new local conditional bound, but the proposed upstream one-witness construction and caller replacement remain unproved. The two scalar bounds of cc5937fc can be used directly; original all-character thin estimates imply them if available. Do not replace them by the signed ramp bound at x; y_L,y_T generally lie at very different scales.

## 3. Root-to-frontier and original/reduced graph ledger
Original local typed/source-visible path: QuadraticLogDerivCongr.linkGLOBAL_of (common hLo, CoverAll, hChr, weights, cutoffs) -> CoreAtH/ChainTied coverage -> CoreGm ch_top -> Deduction.ch_core -> CharacterBalanceMoves.core (all-u hTop, SizesA, ThinScales, CostWindows) -> th_le, ch_balance, sum_Th -> GmA/SigA size transfer. Retain every original edge, including the other consumers of these packages; this is not an elaborated full root reachability claim.
Proposed specialized path at principal host: fix common arithmetic and scale data -> exact finite signed score M -> one prescribed u* -> single actual geometric witness at u* + exact positive-kernel lower envelope + two signed reference tests -> (2) -> remaining RH-scale budget / caller. The new context key is (pin, principal A0, D, ell, T,T2, tables, a,b,b',eta,N, reference scales), not declaration name alone. Reusing a maximizer under a changed host or weights table is invalid. Backtrack to native pointwise route if only that supplier is available; do not combine a thick-only maximizer with the averaged reference error. All surviving type/value/constructor roles and axioms of the original graph remain in the prior native exports; no claim of global deletion.
Root itself: confirmed CI conditional half-strip adapter, then either direct prime-only Landau bridge from 0756 note (one unproved arithmetic window condition) or native family route. New join reduces required witness instances h to 1 at this consumer, plus all-variable thin scales to two scalar contractions; no closure of uniform CountI/II/V/Vs, 2-primary/minus, TopG/ASK-MAIN, common tables, selected geometry construction, reference estimates at actual scales, final size transfer or principal prime cancellation. No native caller or final RH theorem checked. No percentage for full proof; the local join is one conditional theorem, zero unconditional RH arithmetic leaves closed. No URT or physics.

## 4. Source and pipeline evidence
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; fresh upstream commit 75e2012dcc6f3093e223ef8d327b88395ff7d27c (07:24:48 UTC) unchanged from prior lane, no source mixing.
Fetched pinned ChCore.lean (878f5077bc382426c7da988e5a375b85deeaa7de), ChBalance.lean (37648715bcf507e086374e8cc476ee746fd274f4), Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean (94a385f59f3781ae6b1ab4beddc73850708a2bc6), Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean (7828c8b1060818fe158e23f87f1ad9e2efcf79eb); exact declarations core, th_le, sum_Th, ch_balance, inner_eq, ortho_coset, numN_at, linkGLOBAL_of. Additional source pins and partition/scale derivation retained from cc5937fc (DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b, ElevenLe.lean 75f2ab1404c69a5d1330671d96d8f6cd35e74e52) and 2f135e5b (CoreAtH 0ba3621036f19146e7e67fa9c0e8a1c38661a097, CoreGm 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d); not all these latter files refetched independently here.
Preflight: latest mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 incl 4b677bc2 mandatory pipeline; AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity excerpts; previous editor 0756; recent history through 2f135e5b; peer 2f135e5b, cc5937fc, cb92aa3a, a31ec62d, 05530e1b, b0afce1d and brief latest Galois and Landau handoffs. General CI #431 is not RH verification.
Native tools source read: RHRecursiveReductionFixed.lean 976c28572f11ffb00e1ae730555e938eeb564cb7, RHRecursiveReductionAutoV3.lean a113dc56ea987abac3bf29eb480782140b82ab4a, RHProofTermPrune.lean f6d3e7f6047a7895ecf183be3fb54c203f4fc46a. Actual CI job logs independently retrieved: 139078198272 (run 45577239749) PASS 98.87s, reduced_strip_root and rh_of_right axioms propext, Classical.choice, Quot.sound; 139076580079 (run 45576756833) PASS 77.94s, rh_of_right scan 2000 visited, 1642 values, 358 noValue, 3 axioms, 0 missing in visited, 324 pending. These are earlier native evidence ONLY. Lean and Lake unavailable on local PATH; no new native execution or PASS. Prepared certificate below; independent audit and native caller verification requested.

## 5. Prepared native certificate (not executed)
Load the three existing engine files in the pinned environment and import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore (not Main). Proposed Lean snippet:
```lean
open Finset
namespace RHSelectedScore
theorem one_score_transfer {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (hs : s.Nonempty) (f : ι → ℝ)
    (m e Err : ℝ) (hm : 0 ≤ m)
    (h : ∀ u ∈ s, (∀ v ∈ s, f v ≤ f u) → m * f u - e ≤ Err) :
    m * (∑ u ∈ s, f u) ≤ (s.card : ℝ) * (Err + e) := by
  obtain ⟨u, hu, hmax⟩ := s.exists_max_image f hs
  have hb : ∑ v ∈ s, f v ≤ (s.card : ℝ) * f u := by
    calc
      _ ≤ ∑ _v ∈ s, f u := Finset.sum_le_sum fun v hv => hmax v hv
      _ = _ := by simp
  have he : m * f u ≤ Err + e := by linarith [h u hu hmax]
  calc
    _ ≤ m * ((s.card : ℝ) * f u) := mul_le_mul_of_nonneg_left hb hm
    _ = (s.card : ℝ) * (m * f u) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left he (Nat.cast_nonneg _)
#print axioms one_score_transfer
end RHSelectedScore
rh_scan Deduction.CharacterBalanceMoves.core limit 2000
rh_prune Deduction.CharacterBalanceMoves.th_le as RHThLeCandidate
rh_scan RHSelectedScore.one_score_transfer limit 2000
```
At actual caller instantiate f=M, e=3mS/x, s=univ H; use rh_reduce with the checked transfer and actual lower-envelope lemmas, rh_auto/rh_auto_frontier for remaining algebra, and inspect unresolved goals; do not admit them. The displayed max bridge quantifies all maximizers for convenience; the human result only needs a witness at the chosen maximizer, or equivalently an existential pair with its max property. The native original hTop implies the bridge after proving local envelopes, not a substitute for them. Check the theorem elaboration/API before reporting anything. Pruning th_le's apparently unused _hb' is a candidate only; tactic-generated dependencies could retain it. No actual context-sensitive native graph cache beyond existing engine used locally.

## 6. Executed finite algebra regression (not actual host geometry)
The V8 test below verifies integer mask aggregation and max transfer; signed arrays are arbitrary algebra controls, not primes or asymptotic evidence. Negative control demonstrates why selecting the old thick-only maximizer cannot be combined with average thin credit.
```javascript
function run(){
 let cases=0,checks=0,strict=0;
 const ck=b=>{if(!b)throw Error("failed");checks++};
 for(let h=1;h<=24;h++)for(let k=1;k<=h;k++)for(let r=1;r<=h;r++){
  const TT=Array.from({length:r},(_,i)=>(i+1)%h), T=new Set(TT), T2=Array.from({length:k},(_,i)=>i);
  const pb=(t,g)=>(17*t+13*g+3)%37-18;
  const pl=(t,g)=>(7*t+19*g+5)%43-21;
  const pt=(t,g)=>(11*t+23*g+8)%47-23;
  const loss=(t,g)=>(t+3*g+1)%9;
  const scores=Array(h).fill(0);let expected=0;
  for(const t of TT)for(let g=0;g<2*h;g++){
    const top=g>=h&&T.has((g-h+t)%h);
    const n=g<h?k:0;
    expected+=n*(pb(t,g)-loss(t,g))+(h-n)*(top?pt(t,g):pl(t,g));
    for(let u=0;u<h;u++){
      const thick=g<h&&T2.includes((g-u+t+h)%h);
      scores[u]+=thick?pb(t,g)-loss(t,g):top?pt(t,g):pl(t,g);
    }
  }
  ck(scores.reduce((a,b)=>a+b,0)===expected);
  const mx=Math.max(...scores);ck(h*mx>=expected);
  if(h*mx>expected)strict++;
  const u=scores.indexOf(mx),m=3,e=5, gap=m*scores[u]-m*e+2;
  ck(h*(gap+m*e)>=m*expected);
  cases++;
 }
 const j=[10,0], thin=[-20,20];ck(2*(j[0]+thin[0])<j[0]+j[1]+thin[0]+thin[1]);
 return {cases,checks,strict,negative_control:1}
}
console.log(run())
```
Actual result {"cases":4900,"checks":14701,"strict":4599,"negative_control":1}. This checks the finite algebra transfer only. No new prime cancellation or RH numerical evidence.

RESUME HERE: target the actual CoverAll/hLo producer at the new prescribed score maximizer, rather than thick-only maximizer or convenient geometry; determine whether the construction supplies a carrying member with common tables and the full quantitative gap bound. Kernel lane: elaborate the prepared bridge and its actual caller with original/reduced graph and axiom evidence. Audit lane: check partition and scale transport and the quantifier order of selection before geometry. HANDOFF TO integration, positivity geometry, kernel extractor, formal audit and mathematics. RH OPEN.
