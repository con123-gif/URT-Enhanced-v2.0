import RHPrimeWindow48
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46, 26 November 2026, lane 6. HUMAN SOURCE-MATCHED / PREPARED,
NOT COMPILED. RH OPEN. Recover the cofinal filtration saving uniformly
over every native layer, without modifying SSha. Preserve the negative
unit valuation from RUN44 simultaneously.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (including mandatory
engine), AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity
heads and latest commit index through 5305a18b consulted. Peer prime
RUN48 5f0e858fa4169983446b8ba4a61d1a69c5cf7bde (blob 7db10584a3c3b3df8068c3a4c2e1cc4ced3a4dd4),
audit e3f9d949, integration 65d0f958 and our RUN45 e87829c2 read.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. No source update adopted.
Stage prime RUN48 as RHPrimeWindow48.lean using the pinned overlays.

Let v=v_l(E), s=b+v, t=c+v_l(E+1), h=log_l|SelL(l,L)|>=1.
Peer RUN48 derives, conditional on native Kummer/descent formalization,
 |W[l^r]| <= l^(r*h - (min(r,nu)-t)_+)
for every r>=0. Its cofinal saving s-t was not uniform as stated.
NEW: use the native global annihilator before counting.
Dat.g^n=1 and g=a modulo (g-a)Y, so (a^n-1) annihilates W.
Alternatively native Ct.kerF with q=s_multiplier=1 directly proves
this because mt Y 1=Y. This uses exactly the existing root supplier.
Native lte and hker in sCount give a^n-1=m*l^(nu+v), l∤m.
Hence W[l^s]=W[l^k], k=min(s,nu+v), by Bezout. More directly,
the kernel of the actual norm map f is killed by m*l^k: use the
existing hfk when s<=nu+v and the global annihilator otherwise.
No need to establish the equality of torsion submodules in Lean.
Put j=min(k,nu). Since k<=nu+v, k<=j+v. Thus
 b<=s-k+j, (b-t)_+ <= (s-k)+(j-t)_+
                         <= (s-k)*h+(j-t)_+.
It follows that k*h-(j-t)_+ <= s*h-(b-t)_+.
This exponent is the exact maximum of this scalar bound across all
nu>=0 (attained at nu=b); for SFew b=2E+(2E+1)(c+2E+1)>c, that
layer is admissible in the scalar domain. No existence of a number
field attaining the bound claimed. At v>0, simply applying the
cofinal saving s-t uniformly is in general invalid at this interface.

Combining the native exact EqHom unit correction with the new cap:
 |EqHom| * (l^(nu+v))^R <= B*l^(s*h-(b-t)_+ + c+v).
With SFew B=(l^nu)^R*T1*T2, cancel this positive factor to give
 |EqHom| * l^(R*v) <= T1*T2*l^(s*h-(b-t)_+ + c+v).
This is uniform in F,nu,zeta,gamma with the SAME L,l,c,E,b,h.
Equivalently SSha consumes floor(T1*T2*l^(s*h-(b-t)_++c+v)/l^(Rv)).
No cofinal-only bridge or change to SSha required. Saving b-t is
strict for actual SFew: v_l(E+1)<=E and b>c+E.
The all-level twisted Kummer supplier remains conditional/uncompiled,
as do new native adapters. h is the actual base-field mod-l rank,
not a fitted constant. Quantitative STors/SFew, SLayer, ShaK and the
VWin/signed character/prime inequality retain their other premises.
No RH closure.

Pinned blobs relative to ClassCounting:
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
SelmerOrderCounts/TwoLe.lean 16d7d15d6a1f7a7b3d6690d326c772a056811c98
SelmerOrderCounts/KerFDelNm.lean 4567e543a6a8a20967eaf96d3c964489feb10ecd
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab
Original graph: lemmaK -> lemmaK_of_steps -> sNum -> sCount -> kerF,
pCount, selInj, selInvLe, selLCard, cardEQ/cardW, eqHomLe, fewLe.
Candidate: sCountUniform46 -> sCountCapped46 -> native kerF (q=1 and
q=l^nu), peer pCountBudget48, scalar uniform_budget, conditional
all-level base rank supplier. All original graph roles, axioms and
unexpanded branches preserved; no global retirement or caller
replacement claimed. Cache source/toolchain,L,F,l,c,nu,E,b,h,m,D,
zeta,gamma,caller. No URT comparison; exact cancellation suffices.

Executed V8 exact integer controls: 581400 scalar layer cases,
30600 exact maximum checks, 19584 parameter sets with strict
uniform saving, 144515 cases exceed the erroneously uniform cofinal
bound, 5346 gcd/annihilator cases, 1198746 total assertions.
Reproduce:
let tests=0,strict=0,neg=0,maxattain=0,checks=0,group=0;
function c(x){checks++;if(!x)throw Error("arith "+checks)}
for(let b=0;b<=24;b++)for(let v=0;v<=8;v++)for(let t=0;t<=16;t++)for(let h=1;h<=8;h++){
  const s=b+v,U=s*h-Math.max(0,b-t);
  let max=-1;
  for(let nu=0;nu<=s+2;nu++){
    const k=Math.min(s,nu+v),j=Math.min(k,nu),L=k*h-Math.max(0,j-t);
    c(L<=U);c(L>=0);max=Math.max(max,L);tests++;
    if(L> s*h-Math.max(0,s-t))neg++;
  }
  c(max===U);maxattain++;
  if(U<s*h)strict++;
}
function gcd(a,b){return b?gcd(b,a%b):a}
for(const l of [2n,3n,5n])for(let b=0;b<=8;b++)for(let v=0;v<=5;v++)
for(let nu=0;nu<=10;nu++)for(const m of [1n,l+1n,2n*l+1n]){
 const s=b+v,r=nu+v,k=Math.min(s,r),ann=l**BigInt(r)*m;
 c(gcd(l**BigInt(s),ann)===l**BigInt(k));group++;
}
console.log({tests,strict,neg,maxattain,group,checks});
Explicit negative control b=6,v=2,t=2,h=1,nu=6: capped exponent
4, cofinal exponent 2. These are exact scalar checks, not number
field experiments or evidence of an asymptotic prime estimate.
27 source pin/needle/reversible splice checks executed.
Local lean/lake/elan absent, git ls-remote DNS failed.
Baseline Actions job lists 45577239749 and 45576756833 retrieved,
all pick/run/record success. BASELINE ONLY. New code not compiled
or queued; no new kernel/axiom evidence. Native scan/prune and
recursive engine calls included below for actual proposed interfaces.
RESUME HERE: native replay ann_from_kerF and sCountCapped46 using
the peer overlay, then audit/verify the all-level twisted cohomology
supplier and substitute the uniform bound into actual sNum/SSha.
Prioritize the unresolved STors/SFew inputs; no further cofinal
rewrites necessary. HANDOFF TO prime, audit, kernel, integration.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.ZK UpperTheory.V.ZK.Ct

namespace RHCharacter46

theorem ann_from_kerF {Y I : Type} [AddCommGroup Y] [AddCommGroup I]
    (D : Dat Y I) (m : ℤ)
    (hm : (D.a : ℤ) ^ D.n - 1 = ((1 : ℕ) : ℤ) * m) :
    ∀ w : D.W, m • w = 0 := by
  obtain ⟨f, _, hf⟩ := Ct.kerF Y I D 1 1 m hm
  have htop : Ct.mt Y 1 = ⊤ := by
    apply top_unique
    intro y _
    exact Submodule.mem_sup_left ⟨y, by simp⟩
  intro w
  have hz : f w = 0 := by
    obtain ⟨y, hy⟩ := Submodule.Quotient.mk_surjective _ (f w)
    rw [← hy, Submodule.Quotient.mk_eq_zero, htop]
    exact Submodule.mem_top
  simpa using hf w hz

theorem uniform_budget (b v t h nu : ℕ) (hh : 1 ≤ h) :
    (min (b+v) (nu+v))*h - (min (min (b+v) (nu+v)) nu - t)
       ≤ (b+v)*h - (b-t) := by
  let k := min (b+v) (nu+v)
  let j := min k nu
  change k*h - (j-t) ≤ (b+v)*h - (b-t)
  have hk : k ≤ b+v := min_le_left _ _
  have hkν : k ≤ nu+v := min_le_right _ _
  have hj : k ≤ j+v := by
    dsimp [j]
    rcases le_total k nu with hle | hle
    · rw [min_eq_left hle]
      omega
    · rw [min_eq_right hle]
      exact hkν
  have hdef : b-t ≤ (b+v-k)+(j-t) := by omega
  have hmul : b+v-k ≤ (b+v-k)*h := Nat.le_mul_of_pos_right _ (by omega)
  have hsplit : (b+v)*h = k*h + (b+v-k)*h := by
    rw [← Nat.add_mul, show k + (b+v-k) = b+v by omega]
  omega

end RHCharacter46

theorem UpperTheory.V.ZK.sCountCapped46
    (L F : Type) [Field L] [NumberField L] [Field F] [NumberField F] [Algebra L F]
    (hTC : IsTotallyComplex L) (l c ν E b B M : ℕ) [Fact l.Prime]
    (ζ : (𝓞 F)ˣ) (γ : F ≃ₐ[L] F) (hL : Lay l c ν ζ γ) (hE : 1 ≤ E)
    (hF : Few γ ((1 + l ^ c) ^ E) (l ^ b) (l ^ ν) B)
    (hBudget : ∀ D : Ct.Dat (Additive Fˣ) (HeightOneSpectrum (𝓞 F) →₀ ℤ),
      Ct.IsDat γ ((1 + l ^ c) ^ E) D →
      Nat.card (Submodule.torsionBy ℤ D.W ((l : ℤ) ^ min (b + E.factorization l) (ν + E.factorization l))) ≤ M) :
    Finite (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
      Nat.card (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) * (l ^ (ν + E.factorization l)) ^ nrComplexPlaces L ≤
      B * M * l ^ (c + E.factorization l) := by
  have hl : l.Prime := Fact.out
  obtain ⟨ha2, hfa, hfN⟩ := Ct.lte l c ν E hl hL.c_pos hL.c_two hL.c_le hE
  generalize (1 + l ^ c) ^ E = a at *
  obtain ⟨D, hD⟩ := Ct.datEx L F γ a ha2
  have hDa := hD.a_eq
  have hDn := hD.n_eq
  have hI := Ct.clFin L F γ a D hD
  obtain ⟨hEQf, hEQc⟩ := Ct.cardEQ L F γ a D hTC hL.gal hL.gen hD
  obtain ⟨hClf, hWf, hWc⟩ := Ct.cardW _ _ D hI hEQf
  obtain ⟨hEHf, hEHc⟩ := Ct.eqHomLe L F γ a l ν D hl hD hClf
  refine ⟨hEHf, ?_⟩
  have hlpow : l ^ (ν - c) ≠ 0 := (pow_pos hl.pos _).ne'
  have hbig : 2 ≤ a ^ l ^ (ν - c) := le_trans ha2 (Nat.le_self_pow hlpow a)
  have hN0 : a ^ l ^ (ν - c) - 1 ≠ 0 := by omega
  obtain ⟨m, hm⟩ : ∃ m, m = ordCompl[l] (a ^ l ^ (ν - c) - 1) := ⟨_, rfl⟩
  have hNm : a ^ l ^ (ν - c) - 1 = l ^ (ν + E.factorization l) * m := by
    have h0 := Nat.ordProj_mul_ordCompl_eq_self (a ^ l ^ (ν - c) - 1) l
    rw [← hm, hfN] at h0
    exact h0.symm
  have hmd : ¬ l ∣ m := by
    rw [hm]
    exact Nat.not_dvd_ordCompl hl hN0
  have hker : ((D.a : ℤ)) ^ D.n - 1 = ((l ^ ν : ℕ) : ℤ) * ((l ^ E.factorization l * m : ℕ) : ℤ) := by
    rw [hDa, hDn, hL.ord]
    have h1 : 1 ≤ a ^ l ^ (ν - c) := by omega
    have key : ((a ^ l ^ (ν - c) - 1 : ℕ) : ℤ) = (a : ℤ) ^ l ^ (ν - c) - 1 := by
      rw [Nat.cast_sub h1]
      push_cast
      ring
    rw [← key, hNm]
    push_cast
    ring
  obtain ⟨f, hfnm, hfk⟩ := Ct.kerF _ _ D (l ^ ν) (l ^ b) _ hker
  haveI := hWf
  haveI := hEQf
  haveI := hClf
  have hrange := Ct.fewLe L F γ a (l ^ b) (l ^ ν) B D hD hF f hfnm hWf
  have hg := hBudget D hD
  have hAnnEq : ((D.a : ℤ)) ^ D.n - 1 =
      ((1 : ℕ) : ℤ) * ((m : ℤ) * (l : ℤ) ^ (ν + E.factorization l)) := by
    rw [hker]
    push_cast
    rw [pow_add]
    ring
  have hAnn := RHCharacter46.ann_from_kerF D
    ((m : ℤ) * (l : ℤ) ^ (ν + E.factorization l)) hAnnEq
  have hcap : ∀ w, f w = 0 →
      ((m : ℤ) * (l : ℤ) ^ min (b + E.factorization l) (ν + E.factorization l)) • w = 0 := by
    intro w hw
    rcases le_total (b + E.factorization l) (ν + E.factorization l) with hle | hle
    · rw [min_eq_left hle]
      have h0 := hfk w hw
      convert h0 using 2
      push_cast
      ring
    · rw [min_eq_right hle]
      exact hAnn w
  have hp := Ct.pCountBudget48 D.W _ f l
    (min (b + E.factorization l) (ν + E.factorization l)) M (m : ℤ) hl
    (by exact_mod_cast hmd) hcap hg
  have hEQ0 : Nat.card D.EQ ≠ 0 := Nat.card_pos.ne'
  have hCl0 : Nat.card D.ClQ ≠ 0 := Nat.card_pos.ne'
  have hfW : (Nat.card D.W).factorization l =
      (Nat.card D.EQ).factorization l + (Nat.card D.ClQ).factorization l := by
    rw [hWc, Nat.factorization_mul hEQ0 hCl0, Finsupp.add_apply]
  have hfEQ : (Nat.card D.EQ).factorization l + (c + E.factorization l) =
      InfinitePlace.nrComplexPlaces L * (ν + E.factorization l) := by
    have h0 := congrArg (fun n => n.factorization l) hEQc
    have ha1 : a - 1 ≠ 0 := by omega
    rw [Nat.factorization_mul hEQ0 ha1, Finsupp.add_apply, hfa, hL.ord, Nat.factorization_pow,
      Finsupp.smul_apply, smul_eq_mul, hfN] at h0
    exact h0
  calc Nat.card ↑(EqHom γ a (l ^ ν)) * (l ^ (ν + E.factorization l)) ^ InfinitePlace.nrComplexPlaces L
      ≤ l ^ (Nat.card D.ClQ).factorization l *
          l ^ ((Nat.card D.EQ).factorization l + (c + E.factorization l)) := by
        refine Nat.mul_le_mul hEHc ?_
        rw [← pow_mul]
        rw [hfEQ, ← pow_mul, mul_comm (ν + E.factorization l) (InfinitePlace.nrComplexPlaces L)]
    _ = l ^ ((Nat.card D.EQ).factorization l + (Nat.card D.ClQ).factorization l) *
          l ^ (c + E.factorization l) := by
        rw [← pow_add, ← pow_add]
        congr 1
        ring
    _ ≤ (Nat.card ↥f.range * M) * l ^ (c + E.factorization l) := by
        refine Nat.mul_le_mul_right _ ?_
        rw [← hfW]
        exact hp
    _ ≤ (B * M) * l ^ (c + E.factorization l) :=
        Nat.mul_le_mul_right _ (Nat.mul_le_mul_right _ hrange)


theorem UpperTheory.V.ZK.sCountUniform46
    (L F : Type) [Field L] [NumberField L] [Field F] [NumberField F] [Algebra L F]
    (hTC : IsTotallyComplex L) (l c ν E b B h t : ℕ) [Fact l.Prime]
    (ζ : (𝓞 F)ˣ) (γ : F ≃ₐ[L] F) (hL : Lay l c ν ζ γ) (hE : 1 ≤ E)
    (hF : Few γ ((1 + l ^ c) ^ E) (l ^ b) (l ^ ν) B) (hh : 1 ≤ h)
    (hFiltration : ∀ D : Ct.Dat (Additive Fˣ) (HeightOneSpectrum (𝓞 F) →₀ ℤ),
      Ct.IsDat γ ((1 + l ^ c) ^ E) D → ∀ r : ℕ,
      Nat.card (Submodule.torsionBy ℤ D.W ((l : ℤ) ^ r)) ≤ l ^ (r*h - (min r ν - t))) :
    Finite (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
      Nat.card (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) *
        (l ^ (ν + E.factorization l)) ^ nrComplexPlaces L ≤
      B * l ^ ((b+E.factorization l)*h - (b-t)) * l ^ (c + E.factorization l) := by
  refine sCountCapped46 L F hTC l c ν E b B _ ζ γ hL hE hF ?_
  intro D hD
  apply (hFiltration D hD _).trans
  apply Nat.pow_le_pow_right (Fact.out : l.Prime).pos
  first
  | (rh_reduce 2 using [RHCharacter46.uniform_budget]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact RHCharacter46.uniform_budget b (E.factorization l) t h ν hh

rh_scan RHCharacter46.ann_from_kerF limit 2000
rh_scan UpperTheory.V.ZK.sCountCapped46 limit 2000
rh_scan UpperTheory.V.ZK.sCountUniform46 limit 2000
rh_prune UpperTheory.V.ZK.sCountCapped46 as RHCharacter46CappedPruned
rh_prune UpperTheory.V.ZK.sCountUniform46 as RHCharacter46UniformPruned
#print axioms RHCharacter46.ann_from_kerF
#print axioms RHCharacter46.uniform_budget
#print axioms UpperTheory.V.ZK.sCountCapped46
#print axioms UpperTheory.V.ZK.sCountUniform46
