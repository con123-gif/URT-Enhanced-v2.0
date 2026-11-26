import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SelmerOrderCounts
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.NumThree
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN44 lane 6, 26 November 2026. SOURCE-MATCHED HUMAN REDUCTION /
PREPARED LEAN, NOT COMPILED. RH OPEN.

Result: retain the exact unit-quotient valuation term in the actual
sCount proof and carry it through the actual sNum/SSha interface.
Write R=nrComplexPlaces L, v=v_l(E), g=gens L, h=|EqHom|.
Native Ct.cardEQ and LTE give v_l(|EQ|)+c+v=R*(nu+v).
Native cardW gives v_l(|W|)=v_l(|EQ|)+v_l(|ClQ|).
Native eqHomLe gives h<=l^v_l(|ClQ|); pCount and fewLe give
l^v_l(|W|)<=B*l^((b+v)*g).
Multiply the first bound by the exact unit factor BEFORE inequalities:
  h*l^(nu*R)*l^(R*v) <= B*l^((b+v)*g+c+v).
The original sCount discards the entire factor l^(R*v) by monotonicity.
For the same lifted host L in sNum, E=k+1, b=2*k+2+(2*k+3)*(c+2*k+3),
T1=tc L (4*k+10) (2*k+3), T2=tc L (4*k+10) (2*k+2).
The native SFew supplies B=l^(nu*R)*T1*T2. Cancel l^(nu*R)>0
before norms and keep J=l^(R*v)>0. Uniformly in F,nu,zeta,gamma:
  h*J <= T1*T2*l^X, X=(b+v)*g+c+v.
The integer floor A/J is a single bound independent of the layer nu
and extension F, since R,v are fixed on L. Thus it is admissible in
native SSha (not a separate host or separate bound per F). Obtain
  l^s * J <= T1*T2*l^X, shaInv L l E=s.
Taking logs (all factors positive as l^s*J>0) gives
  s log l <= log T1 + log T2 + (X-R*v) log l
where subtraction is in Z/R, not saturated Nat subtraction.
No need to claim X>=R*v. For v=0 this is the original estimate;
for l|E it removes R*v units of the valuation budget, exactly.
This is a quantitative improvement, not a proof of a new uniform
cohomological estimate. It retains SFew, SSha, SLayer, STors,
all original host conditions, and all other native dependencies.
The final existential kBound is unchanged by this improvement alone.
For l not dividing E there is no improvement from this factor.
No claim of globally removed dependencies.

Original selected graph: lemmaK -> lemmaK_of_steps -> sNum -> SFew,
sCount, SSha, SLayer, STors; sCount -> Ct.cardEQ,cardW,eqHomLe,pCount,
kerF,fewLe,selLCard,selInvLe,selInj and original arithmetic guards.
Candidate: sha_budget_exact44 -> SFew, sCountExact44, SSha;
sCountExact44 has same native suppliers and exact final product.
Original proof/graph and all unexpanded type/value/constructor/axiom
nodes retained. This is a replacement at the budget inside sNum,
not yet a compiled outer caller or proof of RH. Context cache:
pin/toolchain, L,F,l,c,nu,E,zeta,gamma,D,b,B, same R,v and caller.
Backtrack to original on failure. No URT; exact arithmetic sufficient.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream observed
de330e73d828ea08f621cb28395d48480806d00f (toolchain bump; no migration).
Source blobs, all relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClassCounting/:
LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
SelmerOrderCounts.lean d0b527a9966ce2c6e6a9bfaa7be6620abf548752
NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
SelmerOrderCounts/CardEQ.lean 6a53a017cbe8c202ac3d96d8e5bf647d7bf004f6
SelmerOrderCounts/PCount.lean c6a473b2ce1fc45ba140660a4f6808ae468aa388
Also inspected EqHomLe b91ada18f3e40f6d7eaee3443e50aa464797c898,
TwoLe 16d7d15d6a1f7a7b3d6690d326c772a056811c98,
KerFDelNm 4567e543a6a8a20967eaf96d3c964489feb10ecd,
SelLCard 7c6df1894c807c8e54cb3dc9a75acf7c1d52ee9f.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 incl mandatory
engine, AGENTS, SWARM, HANDOFF, EXPANSION, continuity and state/log
heads consulted. Prior RUN43 182be28b preserved. Latest peer results
eadcc941 (exact quotient dual), 054230d9 (common catalogue max),
2b75bc4a (coh cardinality), 2355b4d2, 3463c301, 74ad2c13,
755b9251, 6aaed9d5, 7e262184 indexed; first three inspected.
Not merging uncompiled peer files.

Executed 19 fail-on-error pinned source/round-trip checks;
61440 exact BigInt scalar controls, 17280 strict gains,
17280 overstrong-factor negative controls. Reproduction:
for l=2,3,5,7, E=1..24, c=1..4, nu=c..c+3, R=1..10, k=0..3,
v=v_l(E), u=R*(nu+v)-(c+v), H=l^k,W=l^(u+k),P=l^(nu*R),J=l^(R*v);
assert H*P*J==W*l^(c+v), H*P<=H*P*J, and if v>0 assert
H*P*J*l>W*l^(c+v). These are exact algebra controls, not tests of
number-field class groups or of the native theorem.
Local lean/lake/elan absent. Actual baseline status JSON and job lists
45577239749 and 45576756833 completed success (old only); no new
native execution, new axiom audit, or new CI queue submission.
Native scans/prune/search below PREPARED for warmed pinned runner.
RESUME HERE: replay sCountExact44 and sha_budget_exact44 in the
existing pinned native runner; replace the budget inside sNum only
after compilation, compare original/candidate axiom and role scans.
Investigate the native SelLCard exact index product next: class-group
l-rank, actual number of primes above l, and actual unit rank instead
of log2(classNumber) and two full degree bounds; check independent
uniformity before pursuing any further quantitative savings.
HANDOFF TO arithmetic, kernel, audit, integration; RH OPEN.
-/

open NumberField IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK

namespace UpperTheory.V.ZK

open NumberField.InfinitePlace in
def SCountExact44 : Prop :=
  ∀ (L F : Type) [Field L] [NumberField L] [Field F] [NumberField F] [Algebra L F], IsTotallyComplex L →
    ∀ (l c ν E b B : ℕ) [Fact l.Prime] (ζ : (𝓞 F)ˣ) (γ : F ≃ₐ[L] F), Lay l c ν ζ γ → 1 ≤ E →
      Few γ ((1 + l ^ c) ^ E) (l ^ b) (l ^ ν) B →
        Finite (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) ∧
          Nat.card (EqHom γ ((1 + l ^ c) ^ E) (l ^ ν)) * (l ^ ν) ^ nrComplexPlaces L * l ^ (nrComplexPlaces L * E.factorization l) ≤
            B * l ^ ((b + E.factorization l) * gens L + c + E.factorization l)

end UpperTheory.V.ZK

set_option maxHeartbeats 1000000 in
theorem UpperTheory.V.ZK.sCountExact44 :
    UpperTheory.V.ZK.SCountExact44 := by
  intro L F _ _ _ _ _ hTC l c ν E b B _ ζ γ hL hE hF
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
  obtain ⟨hSLf, hSLc⟩ := Ct.selLCard L l hl
  obtain ⟨hSIf, hSIc⟩ := Ct.selInvLe L F l c ν a ζ γ D hl hL hD hSLf
  have hdvd : (l : ℤ) ∣ (D.a : ℤ) - 1 := by
    rw [hDa]
    have hc1 := hL.c_pos
    have hd : l ∣ a - 1 := Nat.dvd_of_factorization_pos (by rw [hfa]; omega)
    have h1 : 1 ≤ a := by omega
    have hd' := Int.natCast_dvd_natCast.mpr hd
    rw [Nat.cast_sub h1] at hd'
    simpa using hd'
  have htor := Ct.selInj _ _ D l hdvd hl.pos hSIf
  have hg : Nat.card {w : D.W // (l : ℤ) • w = 0} ≤ l ^ gens L := by
    refine htor.trans (hSIc.trans ((Nat.mul_le_mul_right _ hSLc).trans (le_of_eq ?_)))
    unfold gens
    rw [← pow_add]
  have hp := Ct.pCount D.W _ f l (b + E.factorization l) (gens L) (m : ℤ) hl
    (by exact_mod_cast hmd)
    (by
      intro w hw
      have h0 := hfk w hw
      convert h0 using 2
      push_cast
      ring) hg
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
  calc Nat.card ↑(EqHom γ a (l ^ ν)) * (l ^ ν) ^ InfinitePlace.nrComplexPlaces L *
        l ^ (InfinitePlace.nrComplexPlaces L * E.factorization l)
      = Nat.card ↑(EqHom γ a (l ^ ν)) *
          l ^ ((Nat.card D.EQ).factorization l + (c + E.factorization l)) := by
        rw [hfEQ, ← pow_mul, mul_assoc, ← pow_add]
        rw [show ν * InfinitePlace.nrComplexPlaces L +
            InfinitePlace.nrComplexPlaces L * E.factorization l =
              InfinitePlace.nrComplexPlaces L * (ν + E.factorization l) by ring]
    _ ≤ l ^ (Nat.card D.ClQ).factorization l *
          l ^ ((Nat.card D.EQ).factorization l + (c + E.factorization l)) :=
        Nat.mul_le_mul_right _ hEHc
    _ = l ^ ((Nat.card D.EQ).factorization l + (Nat.card D.ClQ).factorization l) *
          l ^ (c + E.factorization l) := by
        rw [← pow_add, ← pow_add]
        congr 1
        ring
    _ ≤ (Nat.card ↥f.range * l ^ ((b + E.factorization l) * gens L)) * l ^ (c + E.factorization l) := by
        refine Nat.mul_le_mul_right _ ?_
        rw [← hfW]
        exact hp
    _ ≤ (B * l ^ ((b + E.factorization l) * gens L)) * l ^ (c + E.factorization l) :=
        Nat.mul_le_mul_right _ (Nat.mul_le_mul_right _ hrange)
    _ = B * l ^ ((b + E.factorization l) * gens L + c + E.factorization l) := by
        rw [mul_assoc, ← pow_add, add_assoc]

namespace UpperTheory.V.ZK

theorem sCount_of_exact44 (h : SCountExact44) : SCount := by
  intro L F _ _ _ _ _ hTC l c ν E b B _ ζ γ hLay hE hFew
  obtain ⟨hf, hh⟩ := h L F hTC l c ν E b B ζ γ hLay hE hFew
  refine ⟨hf, ?_⟩
  have hp : 1 ≤ l ^ (InfinitePlace.nrComplexPlaces L * E.factorization l) :=
    Nat.one_le_pow _ _ (by have hl : l.Prime := Fact.out; exact hl.pos)
  exact (by simpa only [mul_one] using Nat.mul_le_mul_left
      (Nat.card ↑(EqHom γ ((1+l^c)^E) (l^ν)) * (l^ν)^InfinitePlace.nrComplexPlaces L) hp).trans hh

set_option maxHeartbeats 1000000 in
theorem sha_budget_exact44 (hFew : SFew) (hCount : SCountExact44) (hSha : SSha)
    (L : Type) [Field L] [NumberField L] (hTC : IsTotallyComplex L)
    (l c k : ℕ) [Fact l.Prime] (hTop : TopRoot l c L)
    (hlc : 2*k+3 < l^c) (hcp : 2*k+3 < InfinitePlace.nrComplexPlaces L) :
    ∃ s : ℕ, LDataCardLeFinrank.shaInv L l ((k+1 : ℕ) : ℤ) = s ∧
      l^s * l^(InfinitePlace.nrComplexPlaces L * (k+1).factorization l) ≤
        tc L (4*k+10) (2*k+3) * tc L (4*k+10) (2*k+2) *
          l^((2*k+2+(2*k+3)*(c+(2*k+3))+(k+1).factorization l)*gens L+c+(k+1).factorization l) := by
  let J := l^(InfinitePlace.nrComplexPlaces L * (k+1).factorization l)
  let A := tc L (4*k+10) (2*k+3) * tc L (4*k+10) (2*k+2) *
          l^((2*k+2+(2*k+3)*(c+(2*k+3))+(k+1).factorization l)*gens L+c+(k+1).factorization l)
  have hl : l.Prime := Fact.out
  have hJ : 0 < J := pow_pos hl.pos _
  have hB : ∀ (F : Type) [Field F] [NumberField F] [Algebra L F] (ν : ℕ) (ζ : (𝓞 F)ˣ)
      (γ : Gal(F/L)), Lay l c ν ζ γ →
      Finite ↑(EqHom γ ((1+l^c)^(k+1)) (l^ν)) ∧
        Nat.card ↑(EqHom γ ((1+l^c)^(k+1)) (l^ν)) ≤ A/J := by
    intro F _ _ _ ν ζ γ hLay
    have hfew := hFew L F hTC l c ν k ζ γ hLay hlc hcp
    have hcnt := hCount L F hTC l c ν (k+1) _ _ ζ γ hLay (by omega) hfew
    refine ⟨hcnt.1, (Nat.le_div_iff_mul_le hJ).2 ?_⟩
    have hP : 0 < (l^ν)^InfinitePlace.nrComplexPlaces L := pow_pos (pow_pos hl.pos _) _
    apply le_of_mul_le_mul_left _ hP
    calc _ = Nat.card ↑(EqHom γ ((1+l^c)^(k+1)) (l^ν)) *
          (l^ν)^InfinitePlace.nrComplexPlaces L * J := by ring
      _ ≤ _ := hcnt.2
      _ = _ := by dsimp [A]; ring
  obtain ⟨s,hs,hls⟩ := hSha L hTC l c (k+1) (A/J) hTop (by omega) hB
  exact ⟨s,hs,(Nat.le_div_iff_mul_le hJ).1 hls⟩

example : SCount := by
  first
  | (rh_reduce 3 using [sCount_of_exact44, sCountExact44]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact sCount_of_exact44 sCountExact44

end UpperTheory.V.ZK

rh_scan UpperTheory.V.ZK.sCount limit 2000
rh_scan UpperTheory.V.ZK.sCountExact44 limit 2000
rh_scan UpperTheory.V.ZK.sNum limit 2000
rh_scan UpperTheory.V.ZK.sha_budget_exact44 limit 2000
rh_prune UpperTheory.V.ZK.sha_budget_exact44 as UpperTheory.V.ZK.ShaBudgetExactPruned44
#print axioms UpperTheory.V.ZK.sCount
#print axioms UpperTheory.V.ZK.sCountExact44
#print axioms UpperTheory.V.ZK.sCount_of_exact44
#print axioms UpperTheory.V.ZK.sha_budget_exact44
