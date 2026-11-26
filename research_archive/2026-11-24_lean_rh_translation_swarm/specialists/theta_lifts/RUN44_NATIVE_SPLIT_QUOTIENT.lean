import RUN43_FINITE_STABILIZER_NORMALIZATION

/-!
RUN44 | 26 Nov 2026 | lane 8. HUMAN DERIVATION / PREPARED Lean,
NOT COMPILED. RH OPEN.
Current mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including
mandatory engine read first; AGENTS, SWARM, HANDOFF, EXPANSION,
continuity/state/log/protocol openings and recent 30 commits surveyed.
Prior theta f296aa34449f61b64e628744d7efe5a1cb8be6c1 (RUN43).
Read peer geometry fac11f418a, editor 11e35a8b2f and integration
3463c3014e (rank-two CountQ) in detail. The first has a cofinal
density normalization and still lacks the SW coordinate/fibre bridge;
the editor's signed budget is not established. Preserve both.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream HEAD separately observed de330e73d828ea08f621cb28395d48480806d00f;
not migrated or semantically compared.

NEW: explicit product fundamental-domain proof of the quotient
integration left implicit in RUN40/43. The actual native covol
is an infimum over measurable left-orbit covers; use its existing
covol_eq_inter_fund rather than treating the semidirect coordinates
as a GROUP isomorphism and incorrectly invoking covol_map.

For one canonical diagonal host J (rank n>=2), let H=SU(J)(A_F),
T=Res^1_(E/F)G_m(A_F), s(t)=diag(1,...,1,t), and
e(h,t)=h*s(t). This is a homeomorphism with inverse
g -> (g*s(det g)^(-1),det g). It respects the restricted product
since the section is integral on the finite integral torus.
The canonical arch coordinate frames and finite dictionary transport
this to the actual native I.GA. By the SAME rational section and
GFset definition, e^-1(GFset)=SU(J)(F) x T(F).
The multiplication formula is exactly
  e(a,b)e(h,t)=e(a*Ad(s(b))(h),b*t).
In particular e need not be a multiplicative map from the DIRECT
product. A direct-product covol_map invocation is not justified.

For countable discrete subgroups Gamma_H and Gamma_T in lcsc groups,
strict Borel left fundamental domains D_H,D_T exist: choose a
countable cover by open sets U_i on each of which no two distinct
points are in the same left orbit (discreteness gives a local
neighborhood with this property at every point). From U_i subtract
the Gamma-saturation of all earlier U_j; take the countable union.
Every orbit first meets one U_i, exactly once. All sets are Borel.
Here the rational subgroups are discrete in their full adelic
groups, not merely in a single completion.

Then D=e(D_H x D_T) is a strict measurable left fundamental domain
for GFset. Cover: choose b in Gamma_T moving t to D_T, then choose
a in Gamma_H moving Ad(s(b))(h) to D_H. Disjointness: if both
(h,t) and (a*Ad(s(b))(h),b*t) are in D_H x D_T, first b=1 by
strictness in T, then a=1 by strictness in H. This needs NO
invariance of D_H under torus conjugation. It also needs no
quotient-space measurable trivialization, no strong approximation,
no compactness of the SU quotient and no normalization of its
fundamental-domain representatives. The choice b MUST precede a.

For compatible invariant differential forms on H and T, take on
U the form given at the identity by the wedge of the two forms
under the split Lie algebra isomorphism. Conjugation by s(t) on
the semisimple Lie algebra preserves the top form in absolute value:
over an algebraic closure H=SL_n, action is matrix conjugation;
on gl_n its determinant is det(s)^n det(s^-1)^n=1; on the
one-dimensional scalar complement the action is identity, so on
sl_n the determinant is 1 (characteristic zero). Thus e transports
the PRODUCT of local invariant densities to the invariant U density.
The additive discriminant factors multiply by dim U=dim H+dim T;
the character module of U is the determinant torus character
module (H semisimple, no characters), so the convergence factors
and global L(1) scalar are precisely the same as T. The restricted
products therefore factor with these compatible forms. Changing
F-rational forms does not affect the global measure by the product
formula. This supplies the human justification of the product
measure in the classical coordinates; the native gauge and finite
pushforward identity of RUN39/42/43 still require actual replay.

Use the established theorem tau(SU(J))=1 for simply connected
semisimple groups over number fields, n>=2. The determinant torus
is the SAME anisotropic T at each rank and its Tamagawa volume is
finite positive. References checked: Kottwitz, Tamagawa numbers,
Ann. Math. 127 (1988) 629-646, doi:10.2307/2007007,
https://annals.math.princeton.edu/1988/127-3/p05 ;
https://encyclopediaofmath.org/wiki/Tamagawa_number .
Full primary proof not replayed; explicit external foundation, not
a theorem imported from the asserted RH proof.
Therefore in human classical mathematics:
  covol(GFset, e_*(mu_SU x mu_T), univ)
    = (mu_SU x mu_T)(D_H x D_T)
    = mu_SU(D_H)*mu_T(D_T) = tau(T).
Apply this to EACH of the adjacent ranks with their actual calibrated
finite Haar measures from RUN43. The native infimum convention
is covered by covol_eq_inter_fund and covol_smul, with strict
disjointness stronger than its almost-everywhere hypothesis.
Thus RUN43's paired covol equality follows IF the two exact native
measure pushforward identities are checked, with no additional
quotient integration premise. The new Lean candidate below
checks that final native bridge with explicit split coordinates.
Neither the native coordinate instantiation, local-to-global
normalization nor classical SU theorem is asserted kernel verified.

Pinned source ledger (relative to src):
 Formalism/SharpRestriction/CuspSpanNormBounds/GlobAut.lean
 2103e49fe83fce42d4962f85acd9d4f6a589d645: GFset, IsFundDom, muA.
 Development/AbelianVarietyTheory/Definitions/SemilocalFrames/
 DefClassNum.lean 65f9efd688be555d6654d063ea6a782ea8799810: covol.
 Development/AbelianVarietyTheory/Proofs/FlagMeasures/
 LeftQuotientCovolumeEqFundamentalDomainInter.lean
 81767f05db5d4d10576659201013df459adde451: covol_eq_inter_fund.
 LeftQuotientCovolumeEqMeasureInterFundamentalDom.lean
 2617cdcac829b8cb048add22d70e6fee8e6544e8: generic cover theorem.
 GaugeVolumeEqOfSemilinearIsometryGenus.lean
 d8e911ba588e91954a6b50bf044fd455e8715376: covol_map requires
 multiplicativity; covol_smul has finite nonzero scalar guards.
 RationalPointsCountableDiscreteSubgroupAdelic.lean
 9fe0d5f2219b35b49365465d192b0884f1e77482.
 AdelicUnitaryHaarBiInvariant.lean
 8d3cfafd1ab9d5803d48c4a61ce3e3487602b741.
 CountTypedOfVolumeStep.lean 51eec4beb9bed7964345b1fc40a14541dd643cd1:
 actual count_typed_of_volumeStep invokes
 unitaryAutomorphicCounting_of_compactDualVolumeRatio.
 ExistsFrameOfHasSignature.lean 13982fe910bfc0dec0938e4ed6cdb20e01ad3821:
 canonical ofSignature, cm.cmUnram (finite unramified guard).
 All consulted at pin; no claim of full elaborated source traversal.
Original graph: CountTyped -> VolumeStep; retain all prior original
and candidate graphs. New candidate:
 split coordinates + rational membership + normalized measure map
 + strict factor domains + classical tau_SU
 -> native_covol_of_split44 -> common tau(T) -> FiniteProductPair43
 -> countingTheorem_of_finite43. Keep other consumers of exact mass,
flag/volume, SW and D.vol. Context key source/toolchain,F,E,CM,rank,
signature, actual w/v, section, GammaH/GammaT, local densities,
global scaling, torus measure, and consumer. Never reuse across
different determinant tori or normalization conventions. Backtrack
to original VolumeStep if any bridge fails.
No root obligation retired; all unresolved type/value/constructor
edges, baseline axioms and pending scan nodes retained.

Executed finite algebra regression (NOT an adelic measure test):
1105 semidirect cyclic group/subgroup configurations, 87920 unique
cover and 87920 disjointness checks; 1071 nonhomomorphic-coordinate
controls. Exact V8 code:
 let configs=0,cover=0,disjoint=0,nonhom=0;
 const mod=(x,n)=>((x%n)+n)%n;
 for(let m=2;m<=20;m++)for(let n=2;n<=10;n+=2)
 for(let d=1;d<=m;d++)if(m%d===0)for(let k=1;k<=n;k++)if(n%k===0){
  const H=Array.from({length:m/d},(_,i)=>i*d),
        T=Array.from({length:n/k},(_,i)=>i*k);
  const mult=(a,b,h,t)=>[mod(a+(b%2?-h:h),m),mod(b+t,n)];
  const hits=(x,y)=>x<d&&y<k;
  for(let h=0;h<m;h++)for(let t=0;t<n;t++){
   let count=0;for(const a of H)for(const b of T){
    const [x,y]=mult(a,b,h,t);if(hits(x,y))count++}
   if(count!==1)throw Error("unique");cover++}
  for(let h=0;h<d;h++)for(let t=0;t<k;t++)
  for(const a of H)for(const b of T){
   const [x,y]=mult(a,b,h,t);
   if(hits(x,y)!==(a===0&&b===0))throw Error("disjoint");
   disjoint++}
  if(m>2&&mult(0,1,1,0)[0]!==1)nonhom++;
  configs++}
 if(!nonhom)throw Error("negative control missing");
Local lean/lake not installed. Retrieved actual baseline status JSONs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode 0,
runs 45577239749 and 45576756833. Baseline only, not this file.
No new native execution, no fresh axiom claim; baseline propext,
Classical.choice, Quot.sound, 324 pending scan nodes. No queue
submission or URT performance claim.

RESUME HERE: instantiate the exact split-coordinate measure map in
native canonical36 using RUN37/38 finite dictionary, and RUN39/42/43
calibrations. Replay the cumulative lane on pinned runner, use the
classical SU result with explicit trust boundary; then feed common
torus covol into FiniteProductPair43 and actual counting caller.
Do not spend another run rewriting the scalar recurrence. In parallel
coordinate with geometry on SW1b2's selected coordinate/selfdual
fibre bridge, and editor on signed endpoint mass budget.
Uniform same-host CountI/II/V/Vs, TopG/J/VWin, weighted prime-window
inequality remain open.
HANDOFF TO kernel, literature, geometry, audit, editor, integration.
-/

open MeasureTheory NumberField Finset Formalism.MainNotions.S
open GlobalTheory.Count GlobalTheory.FlagMeas
open scoped ENNReal

noncomputable section
namespace GlobalTheory.FlagMeas.VolRatio

section Split
variable {H T G : Type} [Group H] [Group T] [Group G]
  [MeasurableSpace H] [MeasurableSpace T] [MeasurableSpace G]

def splitDomain44 (e : H × T ≃ᵐ G) (DH : Set H) (DT : Set T) : Set G :=
  e.symm ⁻¹' (DH ×ˢ DT)

theorem split_cover44 (e : H × T ≃ᵐ G) (act : T → H → H)
    (ΓH DH : Set H) (ΓT DT : Set T) (Γ : Set G)
    (hΓ : ∀ a b, e (a,b) ∈ Γ ↔ a ∈ ΓH ∧ b ∈ ΓT)
    (hmul : ∀ a b h t, e (a,b) * e (h,t) = e (a * act b h, b*t))
    (cH : ∀ h, ∃ a ∈ ΓH, a*h ∈ DH)
    (cT : ∀ t, ∃ b ∈ ΓT, b*t ∈ DT) (z : G) :
    ∃ γ ∈ Γ, γ*z ∈ splitDomain44 e DH DT := by
  rcases hz : e.symm z with ⟨h,t⟩
  have hze : e (h,t) = z := by rw [← hz, e.apply_symm_apply]
  obtain ⟨b,hb,hbt⟩ := cT t
  obtain ⟨a,ha,hah⟩ := cH (act b h)
  refine ⟨e (a,b), (hΓ a b).2 ⟨ha,hb⟩, ?_⟩
  rw [← hze, hmul]
  change e.symm (e (a * act b h,b*t)) ∈ DH ×ˢ DT
  rw [e.symm_apply_apply]
  exact ⟨hah,hbt⟩

theorem split_disjoint44 (e : H × T ≃ᵐ G) (act : T → H → H)
    (ΓH DH : Set H) (ΓT DT : Set T) (Γ : Set G)
    (hΓ : ∀ a b, e (a,b) ∈ Γ ↔ a ∈ ΓH ∧ b ∈ ΓT)
    (hmul : ∀ a b h t, e (a,b) * e (h,t) = e (a * act b h, b*t))
    (hact : ∀ h, act 1 h = h) (eone : e (1,1) = 1)
    (uH : ∀ a ∈ ΓH, ∀ h ∈ DH, a*h ∈ DH → a = 1)
    (uT : ∀ b ∈ ΓT, ∀ t ∈ DT, b*t ∈ DT → b = 1)
    (γ : G) (hγ : γ ∈ Γ) (hn : γ ≠ 1) :
    (fun y => γ*y) '' splitDomain44 e DH DT ∩ splitDomain44 e DH DT = ∅ := by
  apply Set.Subset.antisymm
  · intro z hz
    rcases hz with ⟨⟨y,hy,hyz⟩,hz⟩
    rcases hg : e.symm γ with ⟨a,b⟩
    rcases hy' : e.symm y with ⟨h,t⟩
    have hγe : e (a,b) = γ := by rw [← hg, e.apply_symm_apply]
    have hye : e (h,t) = y := by rw [← hy', e.apply_symm_apply]
    have hab := (hΓ a b).1 (hγe ▸ hγ)
    change e.symm y ∈ DH ×ˢ DT at hy
    rw [hy'] at hy
    change e.symm z ∈ DH ×ˢ DT at hz
    rw [← hyz, ← hγe, ← hye, hmul, e.symm_apply_apply] at hz
    have hb1 := uT b hab.2 t hy.2 hz.2
    rw [hb1, hact] at hz
    have ha1 := uH a hab.1 h hy.1 hz.1
    exact (hn (by rw [← hγe, ha1, hb1, eone])).elim
  · exact Set.empty_subset _

end Split

theorem native_covol_of_split44 {I : AutInst} (w : GaugeWitness36 I)
    {a : ENNReal} (v : FiniteWitness43 I a)
    {H T : Type} [Group H] [Group T] [MeasurableSpace H] [MeasurableSpace T]
    (e : H × T ≃ᵐ I.GA) (act : T → H → H)
    (ΓH DH : Set H) (ΓT DT : Set T)
    (mH : Measure H) (mT : Measure T) [SigmaFinite mH] [SigmaFinite mT]
    (hΓ : ∀ b c, e (b,c) ∈ I.GFset ↔ b ∈ ΓH ∧ c ∈ ΓT)
    (hmul : ∀ b c h t, e (b,c) * e (h,t) = e (b * act c h,c*t))
    (hact : ∀ h, act 1 h = h) (eone : e (1,1) = 1)
    (cH : ∀ h, ∃ b ∈ ΓH, b*h ∈ DH)
    (cT : ∀ t, ∃ c ∈ ΓT, c*t ∈ DT)
    (uH : ∀ b ∈ ΓH, ∀ h ∈ DH, b*h ∈ DH → b = 1)
    (uT : ∀ c ∈ ΓT, ∀ t ∈ DT, c*t ∈ DT → c = 1)
    (hDH : MeasurableSet DH) (hDT : MeasurableSet DT)
    (hmap : (mH.prod mT).map e = nativeProduct43 w v) :
    covol I.GFset (nativeProduct43 w v) Set.univ = mH DH * mT DT := by
  letI : SigmaFinite v.mu := v.sf
  letI : v.mu.IsHaarMeasure := v.haar
  let D := splitDomain44 e DH DT
  have hD : MeasurableSet D := e.symm.measurable (hDH.prod hDT)
  have hF : I.IsFundDom (I.muA v.mu) D := by
    refine ⟨hD, split_cover44 e act ΓH DH ΓT DT I.GFset hΓ hmul cH cT, ?_⟩
    intro γ hγ hn
    rw [split_disjoint44 e act ΓH DH ΓT DT I.GFset hΓ hmul hact eone uH uT γ hγ hn,
      measure_empty]
  have hq := GlobalTheory.CovolRat.covol_eq_inter_fund I v.mu D Set.univ hF
    MeasurableSet.univ (fun _ _ _ _ => Set.mem_univ _)
  have hc : ENNReal.ofReal (∏ t, w.c t) ≠ 0 :=
    (ENNReal.ofReal_pos.2 (Finset.prod_pos fun t _ =>
      GlobalTheory.GaugeTransport.pos_of_isGauge (w.good t))).ne'
  have hpre : e ⁻¹' D = DH ×ˢ DT := by
    ext x
    change e.symm (e x) ∈ DH ×ˢ DT ↔ x ∈ DH ×ˢ DT
    rw [e.symm_apply_apply]
  calc
    covol I.GFset (nativeProduct43 w v) Set.univ =
        ENNReal.ofReal (∏ t, w.c t) * covol I.GFset (I.muA v.mu) Set.univ := by
      unfold nativeProduct43
      exact GlobalTheory.GaugeTransport.covol_smul _ _ _ _ hc ENNReal.ofReal_ne_top
    _ = ENNReal.ofReal (∏ t, w.c t) * I.muA v.mu D := by
      rw [hq.1, Set.univ_inter]
    _ = nativeProduct43 w v D := by
      unfold nativeProduct43
      rw [Measure.smul_apply, smul_eq_mul]
    _ = mH DH * mT DT := by
      rw [← hmap, Measure.map_apply e.measurable hD, hpre, Measure.prod_prod]

end GlobalTheory.FlagMeas.VolRatio

rh_scan GlobalTheory.CovolRat.covol_eq_inter_fund limit 2000
rh_scan GlobalTheory.GaugeTransport.covol_map limit 2000
rh_prune GlobalTheory.FlagMeas.VolRatio.native_covol_of_split44 as RHThetaSplit44Pruned
rh_scan GlobalTheory.FlagMeas.VolRatio.native_covol_of_split44 limit 2000
rh_scan GlobalTheory.CountFinal.countingTheorem_of_finite43 limit 2000
#print axioms GlobalTheory.FlagMeas.VolRatio.split_cover44
#print axioms GlobalTheory.FlagMeas.VolRatio.split_disjoint44
#print axioms GlobalTheory.FlagMeas.VolRatio.native_covol_of_split44
end
