import Formalism.SizeWindowBrackets.ChainSlopeWindows.LevelOfCongruence
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChTop

/-!
# RUN28 — native reference count eliminated; only aggregate lower count retained
25 Nov 2026. Human source-matched conditional reduction, native Lean PREPARED, not executed.
Mission lane 7. No new RH theorem, no URT experiment. Source pin
leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Current upstream observed a85077714ca7b298f69e48798497519ed5326a89; current
LevelOfCongruence, ElevenLe, JointsL blobs respectively c0f54b0c078e4b2659b24c02ef5e057077526978,
a4a8c76eb7c3cc38989a0afebe51075070941a63, 37a6e1a3317911031360be6a10877436bc158ef2.
Changed; not incorporated or claimed equivalent.

Read current ONE_EQUATION_MISSION blob 8dc6705e1bc6540b600f6c22309294466ec88fd0,
including unified engine; SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, AGENTS and continuity
excerpts; peer recent selected-core 3eba527a, selected-point producer a4681a51,
loss bridge fec5acd7, almost-coverage e8d168ea, native weight note cc5937fc,
RUN27 02f1f880. No repetition of their results. See RUN27 for full source root path
Main -> rhOfAll -> allChi -> everyCharacter -> theta/Green/TopG -> core_gm -> ch_top.
This run works on actual Count5, not unrelated TopAtLevel.

## Exact improvement
Notation as RUN27, all at the same genuine selected translation; A=sumA, beta is
cSl1*nT*m*(a/k+b'), lambda=4 log(1+x^cHH)/(1-delBar), Lref=Lam5,
ell_i=log(T_i)-Lref, positive normalized native d-weighted mean.
The signed identity in RUN27 after bounding EComp, Slopes, DIV and lower quotient
slope and applying the unchanged entropy estimate gives
gap <= B+(1+lambda)*beta*Lref - [A-(1+lambda)*beta]*mean(ell) - mean(p+q),
B = LoP+K0+log(card W)+lambda*(K3+b)+J+(1+lambda)*L0,
L0=cSl1*IO+cSl1*Xpp+1, J=(etaBar+4 sqrt(eBar))*x^cHH*b/(1-delBar).
p,q >=0 are native DIV and lower-quotient slack. The derivation of uF upper
uses only pairwise count spread, not any individual lower count. Consequently
the old per-word lower count is unnecessary: mean(ell)>=0 suffices, with
the same spread hypothesis. No assertion that a per-word ell is positive.
Coefficient absorption is uniform eventual exactly as RUN27:
(1+lambda)*beta/A <= 6K(1+8(1+cHH log x))/x -> 0
using IdentU/SizesA/RestSize, x>=3, fixed uniform K,cHH.
The reference need NOT be bounded by cCount*m*L as in RUN27: a rough bound
from existing native inputs suffices.

## Actual reference bound, not a fresh geometric conjecture
Pinned LevelOfCongruence.lean defines Lam5 as sum_j (1/f) sum_r log(w_jr*v/pi)
+ m*lg - cCount*(La+m^2*La/k). The actual weight mapping is Mod.data and
data_Count5 in QuadraticLogDerivCongr.lean. Keep their transport through
s_sc, s_La, s_lg, s_v, s_f, sum_places. Native weights in Nodes_at satisfy
1<=w<=b+etaSz+1 for thick and 1<=w<=2b' otherwise; use the actual
numN_at/nodes_at and eP/IdentU, not arbitrary model weights. SizeEta gives
etaSz<=b because t,f,k>=1; b>=1. With x>=3, a=xb, b'=a/X'<=a, every
weight is at most 2a (thick <=3b<=2a). Native v=rdE/2>0 and pi>1.
Hence log(w*v/pi) <= log(2*a*rdE)=La+log 2 <= 3L,
where native ErrWindows0 has La<=2*x^eps=2L and L=x^eps>=1.
SizeG in ElevenLe (part of SizesAt) gives log(g_i)<=x^(eps/100)*L for BOTH
actual primes, which are positive. Thus lg=log(g0*g1)<=2*x^(eps/100)*L.
All signs of subtracted cCount*(La+m^2*La/k) are nonnegative from ErrWindows0.
As card(Fin f)=f>0 and card(Fin m)=m, exact summation proves
    Lam5 <= 5*x^(eps/100)*m*L.
No h5c upper count or Vandermonde estimate used for this inequality.

## Decisive budget
Let ErrText=nT*a*(1+m^2/k)+m*(B0+Nc), native positive with ErrText>=nT*a.
ErrWindows0 gives beta<=2K*nT*a/x, m<=x^(1/2+eps/2),
lambda<=8*(1+cHH log x). Thus
    (1+lambda)*beta*Lam5 / ErrText
      <= 10K*(1+lambda)*x^(-1/2+151*eps/100) -> 0
for the native 0<eps<1/52. For possibly negative Lam5 the result follows
directly since denominator>0 and beta>=0; the positive rough upper bound
can be divided using ErrText>=nT*a. This eventual estimate is uniform in
the chosen word, translation and host with the fixed bounds. No assumption
of prime cancellation, and no change to scale/window quantifiers.
Replacing IO by LoP in B makes B equal to ErrX5at minus
(1+lambda)*beta*cCount*m*L, which is nonnegative as a *subtracted term*.
Thus B<=ErrX5at. For sufficiently large x, the new bound is
    ASK-Main <= ErrX5at + ErrText
             <= (x^(CErr*eps)+1)*ErrText
             <= x^((CErr+1)*eps)*ErrText.
Last inequality uses CErr=eDiv+eLoss+3>=3, x^eps>=2. This is an allowed
one-unit increase in the fixed exponent constant (choose native eps smaller
before the arbitrarily-distant windows; original for every eps quantifier
retained). ChTop's IdentU and BNBoundsU algebra unchanged. Do not claim the
original exact numeric error constant or unchanged CErr. At actual CoreAtH,
transport the new local bound and add 1 to uniform exponent before ch_core.
No pointwise upper Count5 hypothesis and no separate scalar reference
hypothesis need be proved anymore. Stronger: replace lower clause by a
weighted mean on the genuine word fibre. All other premises retained.

## Graph / audit status
Original:
count_at_of (h5c upper/lower, h5v spread, DataB, FactDuStar, FactDstar, hGamma)
 -> Count_at -> Mod.data_Count5 -> Count5 (lower,upper,spread)
 -> s_lower5, Vvar_bound5, u_function_le_mean, weighted_mean_lower_bound_le
 -> Ga_bound5/each_unit_bound_statement -> ch_top.
Candidate:
actual nodes, SizeEta, SizeG, native scale/host maps -> coarse Lam5 reference
 -> signed mean count lower + unchanged spread + exact slack/entropy
 -> eventual budget (CErr+1) -> ch_top replacement -> actual selected core.
h5c lower and h5v spread remain pending actual geometric suppliers; removing
the h5c upper *field* is not a claim that the whole h5c dependency disappears.
Other consumers e.g. muTu_of_countF, SlopesN and independent family bounds
still require audit and may retain pointwise upper. No global graph pruning.
All original elaborated graph and axiom evidence retained, no new native
edges/axiom outputs. Cache key includes pin, theorem, same host and translation,
word ranks, eps, K/cHH and weakened Count5. Backtrack to full Count5 if needed
in another consumer. Original pinned blobs:
LevelOfCongruence e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef;
QuotientSlopeBoundsWith f9f34a9147750e215a6b2f206eb6f9889aa726b6;
JointsL 057913eaf7d7d88fda208e16cd84e910ebdd4227;
QuadraticLogDerivCongr 7828c8b1060818fe158e23f87f1ad9e2efcf79eb;
DataParams₂ 50914500995df91e2646d91a6c5c99a7e603a51b;
DataHost 7e9af8ab364965c62be250ae93974098141598c0;
ElevenLe 75f2ab1404c69a5d1330671d96d8f6cd35e74e52;
ErrorFormsWeakWindowsFalse 1d1d179d111b5aa668893327264648558f30fdb6;
SChain a4bc8cecac40a1f5fd307661e151639aaf6a6efa;
ChTop ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5;
CoreAtH 0ba3621036f19146e7e67fa9c0e8a1c38661a097.
Actual prior CI status.json retrieved (strip root pass 98.87s; prune pass 77.94s),
45577239749 and 45576756833. Not tests of RUN28. Local shell lacks lean/lake.
Current engine source fetched with hashes as in RUN27. In built pinned
environment compile this file and engine modules, add separate audit file:
  rh_scan Deduction.ch_top limit 2000
  rh_scan Formalism.LFunctionChainParameters.WeightedSlopeBounds.each_unit_bound_statement limit 2000
  rh_prune Deduction.ch_top as ch_top_pruned_run28
  rh_prune Formalism.LFunctionChainParameters.WeightedSlopeBounds.each_unit_bound_statement as each_unit_pruned_run28
Then compare original and candidate root-reaching typed dependencies, use
rh_reduce 4 using [RHGeometry.mean_count_absorption] and rh_auto 4 on
instantiated replacement, rh_auto_frontier 4 to expose open premises.
Do not close a frontier by importing Main. Inspect axioms and constructor
roles. These commands are pending, not executed. No new Lean PASS.

## Executed exact V8 regression, not actual host data
let n=0, strict=0, negative=0;
for(const A of [0n,1n,3n,8n,24n]) for(const beta of [0n,1n,2n,5n]) for(const lam of [0n,1n,3n])
for(const L of [-3n,0n,4n]) for(const e1 of [-7n,-2n,0n,3n,9n]) for(const e2 of [-4n,0n,2n,8n])
for(const w of [1n,2n,5n]) {
 const den=w+1n,E=w*e1+e2,c=(1n+lam)*beta;
 if(E<0n||c>A)continue;
 if(c*(den*L+E)-A*E>c*den*L)throw Error("absorption");
 n++; if(e1<0n||e2<0n)strict++;
}
if(!((1n-3n)*(-1n)>0n))throw Error("mean control");negative++;
if(!((3n-1n)*1n>0n))throw Error("coefficient control");negative++;
let budget=0;
for(const P of [1n,2n,9n])for(const E of [1n,5n,12n])for(const b of [0n,1n,3n])for(const q of [0n,1n,5n]){
 if(q>E)continue; if(P*E-b+q>2n*P*E)throw Error("budget");budget++;
}
console.log({n,strict,negative,budget});
Actual output: n=3780, strict=945 (cases with a negative individual slack),
negative=2, budget=72. Tests check scalar algebra only. No finite-to-infinite inference.

RESUME HERE: derive the genuine d-weighted mean lower count from the exact
logXuD determinant identities, retaining only aggregate divisor contribution;
inspect muTu_of_countF and the independent upper-count consumers before any
global deletion. Install native weakened Count_at/Mod.data_Count5 and ch_top
replacement, replay with engines; retain selected-point host existence,
DIV, slopes, entropy, TopG, class-group and prime discrepancy leaves.
HANDOFF TO integration, kernel extractor, audit, theta, editor. RH OPEN.
-/

open Formalism.RankGapBounds.WeightedMeanData
open Formalism.LFunctionChainParameters.WeightedSlopeBounds

noncomputable section
namespace RHGeometry

theorem mean_count_absorption (g base A beta lam L ell slack : ℝ)
    (hell : 0 ≤ ell) (hslack : 0 ≤ slack)
    (habsorb : (1+lam)*beta ≤ A)
    (h : g ≤ base+(1+lam)*beta*(L+ell)-A*ell-slack) :
    g ≤ base+(1+lam)*beta*L := by
  have hh := mul_nonneg (sub_nonneg.mpr habsorb) hell
  nlinarith only [hh,h,hslack]

theorem reference_budget_transfer (g base corr err E P : ℝ)
    (h : g ≤ base+corr) (hb : base ≤ err) (hc : corr ≤ E)
    (he : err ≤ P*E) (hE : 0 ≤ E) (hP : 1 ≤ P) :
    g ≤ 2*P*E := by
  have hh := mul_le_mul_of_nonneg_right hP hE
  linarith

-- This certificate operates on the actual pinned Lam5 definition.
-- Its per-weight and lg hypotheses are discharged by the native estimates above.
theorem native_lam5_coarse {U0 : Type} [Fintype U0] {W : U0 → Type}
    [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)]
    {Top : Type} [Fintype Top] {m f : ℕ}
    (D : Data U0 W Top m f) (C : Consts) (u0 : U0) (R : ℝ)
    (hf : 0 < f) (hR : 1 ≤ R) (hL : 0 ≤ D.L)
    (hw : ∀ j ρ, Real.log (D.w u0 j ρ * D.v / Real.pi) ≤ 3*D.L)
    (hg : D.lg ≤ 2*R*D.L)
    (hpen : 0 ≤ C.cCount*(D.La+(m : ℝ)^2*D.La/D.k)) :
    Lam5 D C u0 ≤ 5*R*(m : ℝ)*D.L := by
  have hf' : (0 : ℝ) < f := by exact_mod_cast hf
  have hinner (j : Fin m) :
      (1/(f : ℝ)) * (∑ ρ : Fin f, Real.log (D.w u0 j ρ * D.v / Real.pi)) ≤ 3*D.L := by
    have hs : (∑ ρ : Fin f, Real.log (D.w u0 j ρ * D.v / Real.pi)) ≤
        (f : ℝ)*(3*D.L) := by
      calc
        _ ≤ ∑ _ρ : Fin f, 3*D.L := Finset.sum_le_sum (fun ρ _ => hw j ρ)
        _ = _ := by simp [nsmul_eq_mul]
    calc
      _ ≤ (1/(f : ℝ))*((f : ℝ)*(3*D.L)) :=
        mul_le_mul_of_nonneg_left hs (by positivity)
      _ = _ := by field_simp
  have hsum : (∑ j : Fin m, (1/(f : ℝ)) *
      ∑ ρ : Fin f, Real.log (D.w u0 j ρ * D.v / Real.pi)) ≤ (m : ℝ)*(3*D.L) := by
    calc
      _ ≤ ∑ _j : Fin m, 3*D.L := Finset.sum_le_sum (fun j _ => hinner j)
      _ = _ := by simp [nsmul_eq_mul]
  have hlg := mul_le_mul_of_nonneg_left hg (Nat.cast_nonneg m : (0 : ℝ) ≤ m)
  have hpos := mul_nonneg (sub_nonneg.mpr hR) (mul_nonneg (Nat.cast_nonneg m : (0 : ℝ) ≤ m) hL)
  unfold Lam5
  nlinarith only [hsum,hlg,hpen,hpos]

#print axioms mean_count_absorption
#print axioms reference_budget_transfer
#print axioms native_lam5_coarse

end RHGeometry
