import Formalism.SizeWindowBrackets.ChainSlopeWindows.LevelOfCongruence
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChTop

/-!
# Lane 15 — a single joint signed word budget in the actual geometry branch
25 November 2026. SOURCE-MATCHED human reduction, PREPARED Lean certificate,
not compiled. RH OPEN. This replaces the separate local EComp5, HComp and
all three Count5 clauses by one sufficient signed scalar budget at the actual
selected geometry point. This is a strict weakening of the local interface,
not an unconditional proof of that budget and not global dependency deletion.

## Provenance and exact scope
Pinned upstream leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Upstream latest observed
a85077714ca7b298f69e48798497519ed5326a89 (2026-11-25 09:29:19 UTC);
not incorporated. Mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0
including mandatory unified pipeline; AGENTS, SWARM, HANDOFF, EXPANSION,
continuity and old manuscript spine/state/log/protocol excerpts read.
Peer continuation: f5bab469 (single selected combined score), 02f1f880
(signed count slack), 4d395181 (mean lower count and coarse reference),
a4681a51 (actual selected-point producer), 3f57da2e (native IO), fec5acd7
(actual local loss), e8d168ea (almost coverage). This is distinct from the
mean count reduction: we keep the exponent/height/count cancellation
jointly, and replace the pairwise spread by one centered maximum deficit.

Fetched source blobs at pin:
Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean
 e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef
 (s_lower5, Vvar_bound5, u_function_le_mean, key_identity5, Ga_bound5,
 weighted_mean_lower_bound_le, each_unit_bound_statement);
Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean
 f9f34a9147750e215a6b2f206eb6f9889aa726b6
 (Lo5, Count5, EComp5, ErrX5at);
Formalism/RankGapBounds/MeanBoundSecondForm.lean
 e4332fd8680d2b2f82e0a1e44a276453e03e2109
 (Data.s, Data.uF, DIV, HComp, Slopes, SlopeIneq, Vvar);
Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean
 9172d2d30c5cec478b08c10a4b34e39fa16ab981 (phi_bound, wmean lemmas);
Formalism/RankGapBounds/RankGapProofs/UniformMeanTopLine.lean
 aca0e8045cadb4d5d5ae0274e63dc709a29530cb;
Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean
 ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5 (ch_top);
ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de;
ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4.
Root reachability is the peer source trace RUN27 (not new elaborated export):
Main -> rhOfAll -> allChi -> everyCharacter -> theta/Green/TopG ->
core_gm -> ch_top -> each_unit_bound_statement. Work at the same genuine
principal-host selected point u0, not a synthetic Data or new geometry.

## Human proof, preserving native hypotheses other than the three candidates
Let mean be normalized d-weighted mean on the finite nonempty W(u0) of
actual words, d_i>0. A=sumA>=0, t_i=log(T_i), E_i=Ee_i, E0=m*A*lg,
R=Lam5, P=cCount*(La+m^2*La/k), beta=cSl1*nT*m*(a/k+b')>=0,
L0=cSl1*IO+cSl1*Xpp+1, Lo_i=L0+beta*t_i.
All symbols are native. Put Z_i=E_i+h_i, zmin=min_i Z_i,
D_Z=mean(Z)-zmin>=0. Let Mminus=cSlope*nT*a*La*(1+m/k),
Mplus=cSlope*nT*a*La, K=cSl1*m*B0, ED=EDiv, SD=SDiv.

Define exact nonnegative slacks by the retained native DIV, lower
quotient slope and lower Slopes:
 q_i=SD-A*t_i+ED-(muCC+h_i-Fo);
 p_i=muN_i-(muM_i+Ga+Fo-E_i-Lo_i);
 r_i=muM_i+Mminus.
Write Pbar=mean(p+r)>=0 and Qbar=mean(q)>=0.
The identity key_identity5 is SD-A*R+E0=Main+A*P.
Substitute DIV and quotient identities before norms:
 s-muCC = Ga-Main-A*P-ED-Mminus
          +A*(mean(t)-R)-mean(E-E0)-mean(Lo)+Pbar+Qbar.
Thus
 Ga-Main = s-muCC+A*P+ED+Mminus+mean(E-E0)
            -A*(mean(t)-R)+mean(Lo)-Pbar-Qbar.                 (1)
For the upper slope use actual quotient upper and upper Slopes:
 max_i(muMaxN_i-h_i) <= Ga+Fo+Mplus+K-zmin.
The exact lower slope identity gives
 s = Ga+Fo-Mminus-mean(Z)-mean(Lo)+Pbar.
Subtract:
 uF <= Mplus+Mminus+K+mean(Lo)+D_Z-Pbar.                     (2)
This is the key improvement: neither pairwise HComp nor separate
pointwise EComp5 or Count5 spread occurs. Common large fields cancel
exactly in Z. In particular the mean-to-min of Z is used, not its
range. There is no hypothesis that individual t_i exceed R.

Keep HidaSetting, SlopeIneq, FParams, HHBound unchanged. Define
 X=x^cHH, lambda=4*log(1+X)/(1-delBar)>=0,
 J=(etaBar+4*sqrt(eBar))*X*b/(1-delBar).
Native phi_bound and the same monotone entropy estimates as Ga_bound5
give s-muCC <= log(card W)+lambda*(U+b)+J with U the RHS of (2).
This is valid at uF=0 as in native phi_bound. U>=uF>=0 by (2)
and HidaSetting. Insert this and mean(Lo)=L0+beta*mean(t) in (1).
With local loss ASK-Ga<=LoP and IO<=LoP retained, obtain
 gap <= Base + Joint,
 Base = LoP+A*P+ED+Mminus+log(card W)
        +lambda*(Mplus+Mminus+K+b)+J
        +(1+lambda)*(cSl1*LoP+cSl1*Xpp+1),
 Joint = mean(E-E0)-A*(mean(t)-R)+(1+lambda)*beta*mean(t)
         +lambda*D_Z-(1+lambda)*Pbar-Qbar.                  (3)

## One sufficient exact local budget, same native error constant
Let Ucnt=cCount*m*L, Ebudget=m*cE*B0, V=D.Vvar C.
The single scalar requirement
    Joint <= Ebudget+(1+lambda)*beta*Ucnt+lambda*V          (4)
gives exactly gap<=ErrX5at D C Xpp u0. This follows by expanding
ErrX5at, UBar5 and MLo5 (no exponent increase). Native ch_top_main_eq,
IdentU, BNBoundsU, errX5at_le and size transfer then stay unchanged.
Original EComp5 gives mean(E-E0)<=Ebudget; Count5 gives
R<=mean(t)<=Ucnt; Vvar_bound5 gives mean(Z)-zmin<=V
(by applying its inequality to a word minimizing Z and averaging the
other word). All omitted slacks are nonnegative. Hence original three
predicates imply (4). The converse fails even at the scalar interface:
t=(-5,5), R=0, E=(100,-100), E0=0, h=(-100,100), equal weights,
A=1, beta=1, lambda=4 gives zero signed contribution before slacks,
despite large separate E and compensated-height variation and individual
count deficits. This algebra control is not native host data. No inference
that arbitrary words satisfy native DIV or geometry. (4) is a new
potentially easier quantitative supplier, not a tautological bound on
ASK-Main: it involves actual E,h,log T and slope/DIV slacks, and no ASK.
It is not proved here. One may drop the favorable slacks for a stronger
sufficient condition. Do not replace (4) by a mean-only bound without
the centered worst-case D_Z: the native entropy uses an actual supremum.

## Original and reduced graph (local source-visible roles)
Original: Count5/EComp5/HComp -> s_lower5, Vvar_bound5,
u_function_le_mean, weighted_mean_lower_bound_le -> Ga_bound5 ->
each_unit_bound_statement -> ch_top -> core.
Replacement: retained DIV + Slopes + QuotientSlopeBoundsWith -> (1),(2);
HidaSetting + SlopeIneq + FParams + HHBound -> native entropy bound;
signed aggregate (4) + actual local LossBounds -> same ErrX5at -> same
ch_top transfer. Original graph, axioms and other consumers retained.
No removal of HComp, EComp5, Count5 elsewhere, including independent
muTu_of_countF/SlopesN uses. Context cache key includes pin, declaration,
selected u0, actual W,d,host,common tables, actual constants, joint budget
version. Backtrack to original three bounds or RUN28's mean-count variant
if the joint budget is not easier to supply. This is not global minimality.
The native root remains conditional half-strip nonvanishing; principal
prime discrepancy, uniform arithmetic/class group, TopG, ObjCP, actual
pointwise rank/DIV/quotient slope and (4) remain open. No URT/physics.

## Actual pipeline status
Engine sources retrieved (Fixed 976c28572f11ffb00e1ae730555e938eeb564cb7,
AutoV3 a113dc56ea987abac3bf29eb480782140b82ab4a,
Prune f6d3e7f6047a7895ecf183be3fb54c203f4fc46a).
GitHub Actions REST independently returned completed/success for
45577239749 and 45576756833; those are PRIOR baselines only.
Local command -v lean and command -v lake returned no path.
No native Lean execution, new axiom output or CI PASS for this file.
Prepared actual native lower-mean and centered maximum lemmas below.
Load engine modules in pinned build, run rh_scan and rh_prune on
Formalism.LFunctionChainParameters.WeightedSlopeBounds.each_unit_bound_statement
and Deduction.ch_top, with limit 2000 scans. Then scan the candidate
native lemmas, use rh_reduce 4 using [RHJointWord.scalar_join] at
the instantiated scalar join, rh_auto 4 and rh_auto_frontier 4 on
remaining original-statement bridge goals; do not silently discharge
(4). Preserve actual typed/type/value/constructor graph and axiom ledger.
Independent audit and native caller integration requested; no new PASS.

## Executed reproducible V8 exact integer regression
This checks (1),(2),(3) after clearing positive mean denominator, with
arbitrary scalar entropy bound, not analytic geometry or RH.
```javascript
let n=0, checks=0, strict=0;
const ck=v=>{if(!v)throw Error("signed join regression");checks++};
for(const A of [0n,1n,4n,11n])for(const beta of [0n,1n,3n])for(const lam of [0n,1n,4n])
for(const w of [1n,2n,5n])for(const t1 of [-4n,0n,5n])for(const t2 of [-3n,1n,7n])
for(const e1 of [-9n,0n,11n])for(const e2 of [-7n,0n,13n]){
 const den=w+1n,sum=v=>w*v[0]+v[1],min=v=>v[0]<v[1]?v[0]:v[1],max=v=>v[0]>v[1]?v[0]:v[1];
 const t=[t1,t2],E=[e1,e2],R=2n,E0=4n,Main=17n,Ga=29n,Fo=10n,muCC=2n,ED=3n,P=2n,Mm=5n,Mp=7n,K=3n,L0=8n;
 const SD=Main+A*P+A*R-E0,lo=t.map(z=>L0+beta*z);
 const q=[1n,3n],p=[2n,0n],r=[0n,4n],up=[1n,2n];
 const h=t.map((z,i)=>SD-A*z+ED-muCC+Fo-q[i]),muM=r.map(z=>-Mm+z);
 const muN=t.map((_,i)=>muM[i]+Ga+Fo-E[i]-lo[i]+p[i]);
 const maxN=t.map((_,i)=>Mp+Ga+Fo-E[i]+K-up[i]);
 const Z=E.map((z,i)=>z+h[i]),s=sum(muN.map((z,i)=>z-h[i]));
 const uf=den*max(maxN.map((z,i)=>z-h[i]))-s;
 const pb=sum(p)+sum(r),qb=sum(q),ell=sum(t)-den*R,edev=sum(E)-den*E0,L=sum(lo),D=sum(Z)-den*min(Z);
 ck(den*(Ga-Main)===s-den*muCC+den*(A*P+ED+Mm)+edev-A*ell+L-pb-qb);
 ck(uf<=den*(Mp+Mm+K)+L+D-pb);
 const joint=edev-A*ell+(1n+lam)*L+lam*D-(1n+lam)*pb-qb;
 const base=s-den*muCC-lam*uf+den*(A*P+ED+Mm)+lam*den*(Mp+Mm+K);
 ck(den*(Ga-Main)<=base+joint);
 if(den*(Ga-Main)<base+joint)strict++; n++;
}
const A=1n,lam=4n,beta=1n,R=0n,E0=0n,L0=0n,t=[-5n,5n],E=[100n,-100n],h=[-100n,100n];
const joint=E[0]+E[1]-A*(t[0]+t[1]-2n*R)+(1n+lam)*(2n*L0+beta*(t[0]+t[1]))+lam*(E[0]+h[0]+E[1]+h[1]);
ck(joint===0n);ck(t[0]<R);ck(t[1]>1n);ck(E[0]>1n);ck(h[1]+A*t[1]-h[0]-A*t[0]>1n);
console.log({n,checks,strict,strict_weakening_controls:5});
```
Actual output n=8748, checks=26249, strict=5832, strict_weakening_controls=5.
No finite-to-infinite inference.

RESUME HERE: derive (4) directly from actual logXuD/determinant and
height/exponent identities at the selected native word fibre, especially
the combined Z minimum rather than independent range estimates. Check
whether those native exact identities cancel the dominant E and h terms;
if not preserve the residual. Independently elaborate the following
native bridges, then integrate into selected-point ch_top with exactly
the same ErrX5at bound. HANDOFF TO geometry, formal audit, kernel,
integration, mathematics. RH OPEN.
-/

open Formalism.RankGapBounds.WeightedMeanData
open Formalism.LFunctionChainParameters.WeightedSlopeBounds

noncomputable section
namespace RHJointWord

variable {U0 : Type} [Fintype U0] {W : U0 → Type}
  [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)]
  {Top : Type} [Fintype Top] {m f : ℕ}
  (D : Data U0 W Top m f) (C : Consts) (Xpp : ℝ)

-- Actual native lower mean, with no Count5 or EComp5 binder.
theorem native_lower_mean
    (hS : D.HidaSetting C) (hDIV : D.DIV C) (hSl : D.Slopes C)
    (hSN : QuotientSlopeBoundsWith D C Xpp) (u0 : U0) :
    D.Ga u0 + D.muCC u0 -
      (C.cSlope * D.nT * D.a * D.La * (1 + (m : ℝ) / D.k)
       + D.SDiv + D.EDiv C) -
      wmean (D.d u0) (fun u => D.Ee u0 u + Lo5 D C Xpp u0 u
        - D.sumA * Real.log (D.T u0 u)) ≤ D.s u0 := by
  obtain ⟨-, -, -, -, -, -, -, -, -, hd, -⟩ := hS
  unfold Data.s
  refine sub_wmean_le (hd u0) _ (fun u => ?_)
  have h1 := (hSN u0 u).2
  have h2 := hDIV u0 u
  rw [Finset.sum_sub_distrib, Data.sum_aT_mul] at h2
  have h3 := (hSl u0 u).1
  unfold Data.SDiv Data.EDiv
  linarith

-- Actual native uF bound: one joint centered deficit; no separate
-- exponent, height or count range. zmin can be the genuine finite minimum.
theorem native_centered_upper
    (hS : D.HidaSetting C) (hSl : D.Slopes C)
    (hSN : QuotientSlopeBoundsWith D C Xpp) (u0 : U0)
    (zmin : ℝ) (hz : ∀ u : W u0, zmin ≤ D.Ee u0 u + D.h u0 u) :
    D.uF u0 ≤ C.cSlope * D.nT * D.a * D.La * (2 + (m : ℝ) / D.k)
       + C.cSl1 * (m : ℝ) * D.B0
       + wmean (D.d u0) (fun u => D.Ee u0 u + D.h u0 u + Lo5 D C Xpp u0 u)
       - zmin := by
  obtain ⟨-, -, -, -, -, -, -, -, -, hd, -⟩ := hS
  have hlo : D.Ga u0 + D.Fo u0 -
      C.cSlope * D.nT * D.a * D.La * (1 + (m : ℝ) / D.k)
      - wmean (D.d u0) (fun u => D.Ee u0 u + D.h u0 u + Lo5 D C Xpp u0 u)
      ≤ D.s u0 := by
    unfold Data.s
    refine sub_wmean_le (hd u0) _ (fun u => ?_)
    have h1 := (hSN u0 u).2
    have h2 := (hSl u0 u).1
    linarith
  have hsup := Finset.sup'_le (Finset.univ_nonempty (α := W u0))
    (fun u : W u0 => D.muMaxN u0 u - D.h u0 u)
    (a := D.Ga u0 + D.Fo u0 + C.cSlope * D.nT * D.a * D.La
      + C.cSl1 * (m : ℝ) * D.B0 - zmin)
    (fun u _ => by
      have h1 := (hSN u0 u).1
      have h2 := (hSl u0 u).2
      linarith [hz u])
  unfold Data.uF
  have hfactor : C.cSlope * D.nT * D.a * D.La * (2 + (m : ℝ) / D.k) =
      C.cSlope * D.nT * D.a * D.La * (1 + (m : ℝ) / D.k)
        + C.cSlope * D.nT * D.a * D.La := by ring
  rw [hfactor]
  linarith

-- Scalar exact combination of (1), (2) and the retained entropy bound.
theorem scalar_join (g s u loss fixed E A ell L p q k d b lam lc J : ℝ)
    (hlam : 0 ≤ lam)
    (h1 : g ≤ loss+s+fixed+E-A*ell+L-p-q)
    (h2 : s ≤ lc+lam*(u+b)+J)
    (h3 : u ≤ k+L+d-p) :
    g ≤ loss+fixed+lc+lam*(k+b)+J+
      E-A*ell+(1+lam)*L+lam*d-(1+lam)*p-q := by
  have h4 := mul_le_mul_of_nonneg_left h3 hlam
  nlinarith only [h1,h2,h4]

#print axioms native_lower_mean
#print axioms native_centered_upper
#print axioms scalar_join

end RHJointWord
