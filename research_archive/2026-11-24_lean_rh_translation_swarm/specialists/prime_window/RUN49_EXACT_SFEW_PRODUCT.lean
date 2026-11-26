import Development.EtaleCohomology.CyclotomicDiscriminants.SFewOfCut
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts.TorsionExponentBound
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN49, 26 Nov 2026, lane 3. HUMAN SOURCE-MATCHED exact native
interpolation-product valuation; actual SFew and SSha adapter
PREPARED / NOT COMPILED. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine),
AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity heads
consulted; latest peer index through 088776f3. Read peer ff996d30
(all-layer cap), d3079b63 (native norm torsion audit), 05da337a
(gap-only obstruction), e669681c/ec9819bb/a824904c (paired/primary
torsion), c55df0a0 (different determinant-centre factorial).
No duplication of these results. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
latest upstream observed 4df6a854a694009f69eb5b7ab27d034ddcecae3b,
not adopted. Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

NEW: in native SFewOfCut.sFewOf take E=e+1, M=2E+1,
u=1+l^c, q=l^nu. The native pe factor is the product of
u^E-u^j over 0<=j<M, j!=E. The guard c>=1 and c>=2 if l=2
is already in Lay. Since u is an l-adic unit, the pinned Ct.lte
(with nu=c, positive d=|E-j|) gives EXACTLY
  v_l(u^E-u^j)=c+v_l(|E-j|).
Every distance 1,...,E occurs twice. Thus the nonzero integer
product has the exact valuation
  V = 2E*c+2*v_l(E!).
Write pe=l^V*m with m prime to l (signed m permitted).
Bezout modulo l^nu makes m a unit, giving
  gcd(|pe|, l^nu)=l^min(V,nu), and pe divides l^V in ZMod(l^nu).
This is valid for all nu and all prime l, including l=2 with
native c>=2, and does not require M<l^c for this specific step.
For nu>V no smaller exponent works uniformly in the residue ring.
No actual residue-field pair is claimed to saturate this exponent.

In sFewOf, the only use of pe_dvd is after equality of scaled
primitive-family evaluations, which yields
 l^(2E)*pe*(v(u_res)-v(u'_res))=0 in ZMod(q).
Multiply by the modular quotient l^V/pe (i.e. any x with
l^V=pe*x); this proves the identical native separation at the
new b=2E+V. The rest of the proof (SClass, STheta, SPhi, SUpper,
SDetect, exact common forbidden-prime product, injective f,
and same field/prime/weight) is unchanged. In particular SClass
still needs M<l^c; SUpper still needs M<r2(L). No removed conditions
outside this exact modular divisor step.
 
Thus the native SFew exponent can be replaced by
  b_new=2E(1+c)+2*v_l(E!)
instead of b_old=2E+(2E+1)(c+2E+1).
Legendre's identity (count multiples of l^r in 1..E) yields
  v_l(E!)=sum_{r>=1} floor(E/l^r) <= E/(l-1).
So b_new<=2E(1+c+1/(l-1)), linear in E at fixed c
instead of quadratic. This is a reduction of the actual arithmetic
exponent, not a proof of an RH-scale error or an unconditional
homology bound. Strictly b_new<b_old since v_l(E!)<=E,
including E=1.

Actual native SCount accepts arbitrary b; the exact same SUpper
cardinality B=(l^nu)^R*T1*T2 survives. After canceling the positive
(l^nu)^R, SSha on the SAME L gives
  l^s <= T1*T2*l^((b_new+v_l(E))*gens(L)+c+v_l(E)).
The adapter below proves precisely this interface, before any log
or quantitative STors assumption. SLayer transfer is retained
when applied to the native L' in sNum. Peer all-layer and norm
savings can be combined after checking their premises for b_new:
b_new>=2E+c and t=c+v_l(E+1)<=c+E, so b_new>t, and b_new>=c.
Do not reuse the old scalar b blindly. T1,T2 retain the actual
degrees 2E+1,2E and GL size 4E+6. All geometry and class-counting
inputs, STors, SLayer, SFinal and joint VWin/prime shell remain.

Source ledger:
src/Development/EtaleCohomology/CyclotomicDiscriminants/SFewOfCut.lean
  1c294cd3b56d004fc313c2e2febb40cf637e0b52
ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
ClassCounting/SelmerOrderCounts/TorsionExponentBound.lean
  16c5cfee6c9283098335e471a582f3313e97c17f
ClassCounting/NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
ClassCounting/HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab.
Last three paths relative to src/Development/AutomorphicArithmetic/
AutomorphicVarieties/ModularityArgument.

Original selected graph: lemmaK_of_steps -> SNum/sNum -> SFewOf/sFewOf
-> pe_dvd -> not_dvd_sub -> not_dvd_pow_sub_one, alongside unchanged
STheta/SPhi/SClass/SUpper/SDetect; sCount -> kerF, fewLe, etc.;
SSha, SLayer, STors and SFinal retained. Candidate graph:
shaExact49 -> sFewExact49 -> PeExact49 (human LTE product identity)
and original other SFew inputs; native sCount/SSha retained.
Original fallback and all unexpanded nodes/axiom/constructor/type/value
evidence preserved; no global retirement. Cache keyed by source,
toolchain,L,F,l,c,nu,E,actual pe product, evaluation scaling, caller.
No URT comparison needed.

Executed exact V8 integer certificate (BigInt; true prime parameters,
NOT a prime-window experiment):
631 parameter sets, 27263 assertions, 3155 modular cases,
631 strict improvements, 631 negative controls for V-1 at nu>V.
Maximum sampled old/new b ratio 22.778350515463917.
Reproduce:
let cases=0,checks=0,strict=0,modular=0,maxRatio=0,negative=0;
function ck(x){checks++;if(!x)throw Error("assert "+checks)}
function v(n,l){let s=0;n=n<0n?-n:n;if(n===0n)throw Error("zero");
 while(n%l===0n){s++;n/=l}return s}
function gcd(a,b){a=a<0n?-a:a;while(b){let t=a%b;a=b;b=t}return a}
function vlFact(n,l){let k=0;while(n){n=Math.floor(n/l);k+=n}return k}
for(const l of [2,3,5,7,11,13,17,19])for(let c=l===2?2:1;c<=4;c++)
for(let E=1;E<=Math.min(32,Math.floor((l**c-2)/2));E++){
 const P=BigInt(l),u=1n+P**BigInt(c),M=2*E+1,ue=u**BigInt(E);
 let pe=1n;for(let j=0;j<M;j++)if(j!==E){
  const a=ue-u**BigInt(j);ck(v(a,P)===c+v(BigInt(E-j),P));pe*=a}
 const k=2*E*c+2*vlFact(E,l),b=2*E+k,old=2*E+M*(c+M);
 ck(v(pe,P)===k);ck(b<old);strict++;maxRatio=Math.max(maxRatio,old/b);cases++;
 for(const nu of [c,c+1,Math.max(c,k-1),Math.max(c,k),Math.max(c,k+1)]){
  const q=P**BigInt(nu),d=gcd(pe,q);ck(d===P**BigInt(Math.min(nu,k)));
  ck((P**BigInt(k))%d===0n);
  if(nu>k){ck(P**BigInt(k-1)%d!==0n);negative++}modular++}}
console.log({cases,checks,strict,modular,negative,maxRatio});

Executed 12 source-pin, exact reversible splice and guard checks.
Local lean/lake/elan absent. Actions runs 45577239749 and 45576756833
retrieved: all pick/run/record jobs success, BASELINE ONLY. No new
compiler or axiom result. PeExact49 remains an explicit formal premise
in the native adapter; its human mathematical derivation is above.
The actual modified sFewOf proof body is mechanically source-matched.
RESUME HERE: formalize the signed distance product and exact factorial
valuation using native Ct.lte, then compile sFewExact49 and shaExact49
with baseline overlays. Audit before substituting at sNum. Combine
with ff996d30/d3079b63 only after replay. Prioritize true rank/torsion
supplier and joint shell; do not report this as their proof.
HANDOFF TO literature, arithmetic, audit, kernel, integration.
-/

noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK
namespace LateralTheory.Q.SFewOfCut

def peBudget49 (l c e : ℕ) : ℕ :=
  (2 * e + 2) * c + 2 * (Nat.factorial (e + 1)).factorization l

def PeExact49 : Prop :=
  ∀ (l c ν e : ℕ) [Fact l.Prime], 1 ≤ c → (l = 2 → 2 ≤ c) →
    (pe (1 + l ^ c) (2 * e + 3) (e + 1) : ZMod (l ^ ν)) ∣
      (l : ZMod (l ^ ν)) ^ peBudget49 l c e

theorem distance_lte49 (l c d : ℕ) (hl : l.Prime)
    (hc : 1 ≤ c) (h2 : l = 2 → 2 ≤ c) (hd : 1 ≤ d) :
    ((1 + l ^ c) ^ d - 1).factorization l = c + d.factorization l :=
  (UpperTheory.V.ZK.Ct.lte l c c d hl hc h2 le_rfl hd).2.1

def SFewExact49 : Prop :=
  ∀ (L F : Type) [Field L] [NumberField L] [Field F] [NumberField F] [Algebra L F], IsTotallyComplex L →
    ∀ (l c ν e : ℕ) [Fact l.Prime] (ζ : (𝓞 F)ˣ) (γ : F ≃ₐ[L] F), Lay l c ν ζ γ → 2 * e + 3 < l ^ c →
      2 * e + 3 < nrComplexPlaces L →
        Few γ ((1 + l ^ c) ^ (e + 1)) (l ^ (2 * e + 2 + peBudget49 l c e)) (l ^ ν)
          ((l ^ ν) ^ nrComplexPlaces L * tc L (4 * e + 10) (2 * e + 3) * tc L (4 * e + 10) (2 * e + 2))

theorem sFewExact49 : STheta → SPhi → SClass → SUpper → SDetect → PeExact49 → SFewExact49 := by
  classical
  intro hT hP hC hU hD hPe L F _ _ _ _ _ hL l c ν e hl ζ γ hlay hc hr S hS hinj
  choose 𝔡 h𝔡 using hS
  choose N y b hy hb hval using fun α : S => hC L F l c ν e ζ γ hlay hc α (𝔡 α α.2) (h𝔡 α α.2)
  have hl0 : (l : 𝓞 F) ≠ 0 := by exact_mod_cast hl.out.ne_zero
  have hb0 : (l : 𝓞 F) * ∏ α, b α ≠ 0 := mul_ne_zero hl0 (Finset.prod_ne_zero_iff.2 fun α _ => hb α)
  let I : Type := {P : HeightOneSpectrum (𝓞 F) // (l : 𝓞 F) * ∏ α, b α ∉ P.asIdeal ∧
    Function.Surjective ((Ideal.Quotient.mk P.asIdeal).comp (algebraMap (𝓞 L) (𝓞 F)))}
  have main : ∀ P : I, ∃ Φ : ∀ n : ℕ, Ch (ZMod (l ^ ν)) (GL (Fin n) (𝓞 L)) (2 * e + 2 + 1) →ₗ[ZMod (l ^ ν)]
      ZMod (l ^ ν), IsPrimFam Φ ∧ ∀ α α' : S, l ^ (2 * e + 2) • Φ _ (y α) = l ^ (2 * e + 2) • Φ _ (y α') →
        letI := P.1.isMaximal
        letI := Ideal.Quotient.field P.1.asIdeal
        ∃ s : (𝓞 F ⧸ P.1.asIdeal)ˣ, Res (Ideal.Quotient.mk P.1.asIdeal)
          (nrm γ ((1 + l ^ c) ^ (e + 1)) α ^ l ^ (2 * e + 2 + peBudget49 l c e) *
            (nrm γ ((1 + l ^ c) ^ (e + 1)) α' ^ l ^ (2 * e + 2 + peBudget49 l c e))⁻¹) (s ^ l ^ ν) := by
    rintro ⟨P, hPb, hPs⟩
    letI := P.isMaximal
    letI := Ideal.Quotient.field P.asIdeal
    haveI : Finite (𝓞 F ⧸ P.asIdeal) := Ideal.finiteQuotientOfFreeOfNeBot _ P.ne_bot
    have hlP : Ideal.Quotient.mk P.asIdeal (l : 𝓞 F) ≠ 0 := fun h =>
      hPb (Ideal.mul_mem_right _ _ (Ideal.Quotient.eq_zero_iff_mem.1 h))
    have hbP : ∀ α, Ideal.Quotient.mk P.asIdeal (b α) ≠ 0 := fun α h =>
      hPb (Ideal.mem_of_dvd _ ((Finset.dvd_prod_of_mem b (Finset.mem_univ α)).mul_left _)
        (Ideal.Quotient.eq_zero_iff_mem.1 h))
    have hz := prim_map (Ideal.Quotient.mk P.asIdeal) l ν hl.out (hlay.c_pos.trans hlay.c_le) hlP ζ hlay.prim
    obtain ⟨v, hv⟩ := exists_index (𝓞 F ⧸ P.asIdeal)ˣ (l ^ ν) (by rw [hz.eq_orderOf]; exact orderOf_dvd_natCard _)
    obtain ⟨θ, hθ, hθv⟩ := hT _ (l ^ ν) e _ hz v
    refine ⟨_, hP _ _ _ θ hθ (𝓞 L) ((Ideal.Quotient.mk P.asIdeal).comp (algebraMap (𝓞 L) (𝓞 F))), ?_⟩
    intro α α' hαα
    obtain ⟨u, hu, hu1⟩ := hval α _ _ hPs (hbP α) _ v θ hθ hθv
    obtain ⟨u', hu', hu1'⟩ := hval α' _ _ hPs (hbP α') _ v θ hθ hθv
    simp only [LinearMap.comp_apply] at hαα
    rw [hu1, hu1'] at hαα
    obtain ⟨x, hx⟩ := hPe l c ν e hlay.c_pos hlay.c_two
    obtain ⟨s, hs⟩ := hv (u ^ l ^ (2 * e + 2 + peBudget49 l c e) *
        (u' ^ l ^ (2 * e + 2 + peBudget49 l c e))⁻¹) (by
      rw [map_mul, map_inv, map_pow, map_pow, mul_inv_eq_one]
      apply Multiplicative.toAdd.injective
      rw [toAdd_pow, toAdd_pow]
      simp only [nsmul_eq_mul, Nat.cast_pow] at hαα ⊢
      rw [pow_add, hx]
      linear_combination x * hαα)
    exact ⟨s, hs ▸ res_mul (res_pow hu _) (res_inv (res_pow hu' _))⟩
  choose Φ hΦ hsep using main
  let f : S → (I → ZMod (l ^ ν)) := fun α => l ^ (2 * e + 2) • (LinearMap.pi fun i => Φ i (N α)) (y α)
  have hf : Function.Injective f := by
    intro α α' h
    obtain ⟨δ, hδ⟩ := hD L F l ν hl.out ζ hlay.prim _ _ hb0 fun P _ hPb hPs =>
      hsep ⟨P, hPb, hPs⟩ α α' (congrFun h ⟨P, hPb, hPs⟩)
    exact Subtype.ext (hinj _ α.2 _ α'.2 ⟨δ, (mul_inv_eq_iff_eq_mul.1 hδ).trans (mul_comm _ _)⟩)
  have hcard := hU L hL (2 * e + 2) ⟨e + 1, by ring⟩ hr l ν (I → ZMod (l ^ ν)) _ (isPrimFam_pi Φ hΦ)
    (Finset.univ.image f) (by
      intro s hs
      obtain ⟨α, -, rfl⟩ := Finset.mem_image.1 hs
      exact ⟨N α, y α, hy α, rfl⟩)
  rw [Finset.card_image_of_injective _ hf, Finset.card_univ, Fintype.card_coe,
    show 2 * (2 * e + 2 + 1) + 4 = 4 * e + 10 by ring] at hcard
  exact hcard


theorem shaExact49 (hFew : SFewExact49) (hCount : SCount) (hSha : SSha)
    (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c k : ℕ) [Fact l.Prime] (hTop : TopRoot l c L)
    (hc : 2 * k + 3 < l ^ c) (hr : 2 * k + 3 < nrComplexPlaces L) :
    ∃ s : ℕ, LDataCardLeFinrank.shaInv L l ((k + 1 : ℕ) : ℤ) = s ∧
      l ^ s ≤ tc L (4 * k + 10) (2 * k + 3) * tc L (4 * k + 10) (2 * k + 2) *
        l ^ ((2 * k + 2 + peBudget49 l c k + (k + 1).factorization l) * gens L +
          c + (k + 1).factorization l) := by
  refine hSha L hTC l c (k + 1) _ hTop (by omega) ?_
  intro F i5 i6 i7 ν ζ γ hLay
  have hfew := hFew L F hTC l c ν k ζ γ hLay hc hr
  have hcnt := hCount L F hTC l c ν (k + 1) _ _ ζ γ hLay (by omega) hfew
  refine ⟨hcnt.1, ?_⟩
  have hl : l.Prime := Fact.out
  have hP : 0 < (l ^ ν) ^ InfinitePlace.nrComplexPlaces L := pow_pos (pow_pos hl.pos _) _
  apply le_of_mul_le_mul_left _ hP
  calc _ = Nat.card ↑(EqHom γ ((1 + l ^ c) ^ (k + 1)) (l ^ ν)) *
        (l ^ ν) ^ InfinitePlace.nrComplexPlaces L := mul_comm _ _
    _ ≤ _ := hcnt.2
    _ = _ := by ring

example (l c d : ℕ) (hl : l.Prime) (hc : 1 ≤ c)
    (h2 : l = 2 → 2 ≤ c) (hd : 1 ≤ d) :
    ((1 + l ^ c) ^ d - 1).factorization l = c + d.factorization l := by
  first
  | (rh_reduce 2 using [distance_lte49]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact distance_lte49 l c d hl hc h2 hd

rh_scan sFewOf limit 2000
rh_scan sFewExact49 limit 2000
rh_scan shaExact49 limit 2000
rh_prune sFewExact49 as sFewExact49Pruned
rh_prune shaExact49 as shaExact49Pruned
#print axioms sFewExact49
#print axioms shaExact49

end LateralTheory.Q.SFewOfCut
end
