import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SUpperOf
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 13 RUN41 — 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Native SUpper: reduce the actual free-rank factor from (l^ν)^r to
(l^max(ν-k,0))^r without changing the host or rank hypothesis.

Let q=l^ν, a=l^max(ν-k,0), H=stable integral homology,
J=span of actual zSeq values, rank J<=r. Native ZVal produces ONE
integer u such that phi_stable(u*zSeq(x))=l^k phi_n(x) for ALL x.
Thus f=phi_stable∘(u·) has a f(J)=0 by linear extension from the
generators. Do NOT assert a kills the ambient coefficient module B.
The native RankCountAlt proof uses its annihilator hypothesis only
on f(v_i) for chosen free generators in J' subset J. Consequently
the same finite-generator proof works with local annihilation and
the smaller residue range Fin a, while retaining full finite torsion.
Witness choices, Bock, TorsStab, Descend, BOdd unchanged.
For every ν, |S| <= a^r T_{k+1} T_k. For ν<=k actual g=0
so |S|<=1 independently of the rank bound. RUN40's quotient-image
bound is compatible mathematically, but independent replay needed:
combined |S| <= a^r T_{k+1} |I[a]|. No global torsion deletion.
Negative control: B=Z/4, l=2, ν=2, k=1; f=id has four values,
while 2f has two. Cannot globally replace q by a in B.

At actual SFewOfCut.sFewOf k=2e+2, same injection gives scaled
bound. At NumThree.sNum, SCount cancellation (for ν>=k) gives
|EqHom| * l^(kr) <= T_{k+1} T_k l^X, X the ORIGINAL b/f/g/c exponent.
For ν<k, injectivity and g=0 give |EqHom| * l^(νr) <= l^X.
Thus all-level uniform bound max(l^X, ceil(T1*T2*l^X/l^(kr)))
would suffice, but do not assert uniform subtraction kr at every
level. Not a new RH-scale bound. No root closure or URT advantage.

Original graph VWin -> LemmaK/ShaK -> sNum -> SFewOfCut.sFewOf ->
sUpperOf -> RankCountAlt.rankCount, ZVal, Bock, FibCount, TorsStab,
Descend, BOdd, SChain. Candidate local edge sUpperOfRank_native41 ->
selmer_upper_bound_rank41 -> rankCount_local41 (same free-basis proof,
only local annihilator), same remaining suppliers. Original graph
and sibling uses retained, no changes to source pin, pending axioms
or role graph. Cache key pin/toolchain, L,l,ν,k,n,stable map, u,
actual span, f, B, finite S and same β; backtrack to original
native SUpperOf or independent RUN40 if replay fails.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Pinned blobs:
SUpperOf 8cccf88aa58f6e2bd69f080e46f4f10b4248d559
TorsionRankCounts/RankCountAlt 28a67533865647e2e00f1726ebec376f3e34136d
TorsionRankCounts/RankCount 86433021ed2fcc3b36779bb539973123997b1021
LemmaKOfSteps 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
SFewOfCut 1c294cd3b56d004fc313c2e2febb40cf637e0b52
NumThree 900c8e3fca10cdf9256061213dcc9453bf98f3d2
Mathlib/LinearAlgebra/Span/Defs 451ec1d3bdfbcfdcab853f49996c26555403f0b4.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine, SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, state/log/
protocol/continuity openings consulted. Latest 25 peer commits
surveyed by SHA, seven recent titles inspected; RUN17 a824904c,
integration 700e3969 and acceleration 619e11df read.
Own RUN40 24d47ed6 preserved; qualitative CountV peers do not remove
quantitative SNum at CountI/II and core. This is next RUN40 task.

Executed 27 fail-on-error pinned source and reversible edit assertions
(repeated on retry), 12964 exact finite-image regression configurations,
9974 smaller rank-factor cases, 5956 saturated, 1 negative control.
Controls of algebra, not computations of actual number-field homology.
First persistence attempt rejected extra ref argument; retry branch only.
Reproduce JS:
for(const l of [2,3,5])for(let nu=0;nu<=3;nu++){let q=l**nu;if(q>27)continue;
for(let k=0;k<=nu+1;k++)for(const m of [1,l,l*l,l*l*l])for(let t=0;t<q;t++){if(t*m%q)continue;
for(let v=0;v<q;v++){let a=l**Math.max(nu-k,0),I=new Set();
for(let x=0;x<q;x++)for(let y=0;y<m;y++)I.add(l**k*(v*x+t*y)%q);
if(!(I.size<=a*m&&I.size<=q*m))throw Error("count");
for(const z of I)if(a*z%q)throw Error("annihilator");
if(k>=nu&&I.size!==1)throw Error("sat");}}}
Local lean/lake/elan absent. Published status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0
(45577239749 and 45576756833); baseline only. No new CI or axiom
evidence, no new root closures. Prepared native code below.

RESUME HERE: compile in pinned warmed runner; check span induction
and local hJJ witness, then compose with RUN40 image quotient and
actual SFewOfCut injection, preserving original SFew/SNum fallback.
Prove uniform quantitative ShaK at actual remaining consumers; no
further constant-only reductions unless they remove a substantive leaf.
HANDOFF TO kernel, integration, audit, arithmetic.
-/

noncomputable section
open NumberField NumberField.InfinitePlace IsDedekindDomain UpperTheory.V UpperTheory.V.KL UpperTheory.V.ZK UpperTheory.V.ZK.Up
namespace RHLocalRank41

private theorem rankCount_gen41 (M : Type) [AddCommGroup M] [Module.Finite ℤ M] (r : ℕ)
    (hr : Module.rank ℤ M ≤ r) :
    ∃ (s : ℕ) (v : Fin s → M), s ≤ r ∧ ∀ m : M, ∃ c : Fin s → ℤ,
      m - ∑ i, c i • v i ∈ Submodule.torsion ℤ M := by
  classical
  haveI : Module.Free ℤ (M ⧸ Submodule.torsion ℤ M) := Module.free_of_finite_type_torsion_free'
  let b := Module.finBasis ℤ (M ⧸ Submodule.torsion ℤ M)
  have hs : Module.finrank ℤ (M ⧸ Submodule.torsion ℤ M) ≤ r := by
    have h1 : (Module.finrank ℤ (M ⧸ Submodule.torsion ℤ M) : Cardinal) ≤ r := by
      rw [Module.finrank_eq_rank]
      exact (rank_quotient_le _).trans hr
    exact_mod_cast h1
  have hv : ∀ i, ∃ v : M, (Submodule.torsion ℤ M).mkQ v = b i :=
    fun i => Submodule.mkQ_surjective _ (b i)
  choose v hv using hv
  refine ⟨_, v, hs, fun m => ⟨fun i => b.repr ((Submodule.torsion ℤ M).mkQ m) i, ?_⟩⟩
  rw [← Submodule.Quotient.mk_eq_zero, ← Submodule.mkQ_apply, map_sub, map_sum]
  simp only [map_smul, hv]
  rw [b.sum_repr, sub_self]

private theorem zsmul_mod41 {B : Type} [AddCommGroup B] (q : ℕ) (hq : 0 < q) (w : B)
    (hw : q • w = 0) (a : ℤ) : a • w = ((a % (q : ℤ)).toNat) • w := by
  have h0 : 0 ≤ a % (q : ℤ) := Int.emod_nonneg _ (by omega)
  rw [← natCast_zsmul, Int.toNat_of_nonneg h0]
  have ha : a = a % (q : ℤ) + (a / (q : ℤ)) * (q : ℤ) := by
    rw [Int.emod_def]
    ring
  conv_lhs => rw [ha]
  rw [add_smul, mul_smul, natCast_zsmul, hw, smul_zero, add_zero]

theorem rankCount_local41 (H B : Type) [AddCommGroup H] [AddCommGroup B]
    (q r : ℕ) (hq : 0 < q) (hT : Finite (AddCommGroup.torsion H))
    (J : Submodule ℤ H) (hJ : Module.rank ℤ J ≤ r) (f : H →+ B)
    (hB : ∀ x ∈ J, q • f x = 0) (S : Finset B)
    (hS : ∀ s ∈ S, ∃ x ∈ J, s = f x) :
    S.card ≤ q ^ r * Nat.card (AddCommGroup.torsion H) := by
  classical
  letI : Finite (AddCommGroup.torsion H) := hT
  haveI := Fintype.ofFinite (AddCommGroup.torsion H)
  choose! x hxJ hx using hS
  let J' : Submodule ℤ H := Submodule.span ℤ ((fun b => x b) '' (S : Set B))
  haveI : Module.Finite ℤ J' := Module.Finite.span_of_finite _ ((S.finite_toSet).image _)
  have hJJ : J' ≤ J := Submodule.span_le.2 (by
    rintro _ ⟨b, hb, rfl⟩
    exact hxJ b hb)
  have hJ' : Module.rank ℤ J' ≤ r := (Submodule.rank_mono hJJ).trans hJ
  obtain ⟨s, v, hsr, hv⟩ := rankCount_gen41 J' r hJ'
  let Φ : (Fin s → Fin q) × AddCommGroup.torsion H → B :=
    fun p => ∑ i, ((p.1 i : ℕ)) • f ((v i : J') : H) + f p.2
  have hsub : S ⊆ Finset.univ.image Φ := by
    intro b hb
    have hm : x b ∈ J' := Submodule.subset_span ⟨b, hb, rfl⟩
    obtain ⟨c, hc⟩ := hv ⟨x b, hm⟩
    obtain ⟨a, ha⟩ := (Submodule.mem_torsion_iff _).1 hc
    have ht : (((⟨x b, hm⟩ : J') - ∑ i, c i • v i : J') : H) ∈ AddCommGroup.torsion H := by
      rw [AddCommGroup.mem_torsion, isOfFinAddOrder_iff_zsmul_eq_zero]
      refine ⟨(a : ℤ), nonZeroDivisors.coe_ne_zero a, ?_⟩
      have := congrArg (fun y : J' => (y : H)) ha
      simpa [Submonoid.smul_def] using this
    refine Finset.mem_image.2 ⟨(fun i => ⟨(c i % (q : ℤ)).toNat, ?_⟩, ⟨_, ht⟩), Finset.mem_univ _, ?_⟩
    · have h1 : c i % (q : ℤ) < q := Int.emod_lt_of_pos _ (by omega)
      have h2 : 0 ≤ c i % (q : ℤ) := Int.emod_nonneg _ (by omega)
      omega
    · simp only [Φ]
      have hxb : x b = (((⟨x b, hm⟩ : J') - ∑ i, c i • v i : J') : H) + ∑ i, c i • ((v i : J') : H) := by
        simp
      conv_rhs => rw [hx b hb, hxb]
      rw [map_add, map_sum, add_comm]
      congr 1
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [map_zsmul, zsmul_mod41 q hq _ (hB _ (hJJ (v i).property))]
  calc S.card ≤ (Finset.univ.image Φ).card := Finset.card_le_card hsub
    _ ≤ (Finset.univ : Finset ((Fin s → Fin q) × AddCommGroup.torsion H)).card := Finset.card_image_le
    _ = q ^ s * Nat.card (AddCommGroup.torsion H) := by
        rw [Finset.card_univ, Fintype.card_prod, Fintype.card_fun, Fintype.card_fin, Fintype.card_fin,
          Nat.card_eq_fintype_card]
    _ ≤ q ^ r * Nat.card (AddCommGroup.torsion H) :=
        Nat.mul_le_mul_right _ (Nat.pow_le_pow_right hq hsr)

def SUpperRank41 : Prop :=
  ∀ (L : Type) [Field L] [NumberField L], IsTotallyComplex L → ∀ k : ℕ, Even k → k + 1 < nrComplexPlaces L →
    ∀ (l ν : ℕ) [Fact l.Prime] (B : Type) [AddCommGroup B] [Module (ZMod (l ^ ν)) B]
      (Φ : ∀ n : ℕ, Ch (ZMod (l ^ ν)) (GL (Fin n) (𝓞 L)) (k + 1) →ₗ[ZMod (l ^ ν)] B), IsPrimFam Φ →
      ∀ S : Finset B, (∀ s ∈ S, ∃ n y, Cyc y ∧ s = l ^ k • Φ n y) →
        S.card ≤ (l ^ (ν-k)) ^ nrComplexPlaces L * tc L (2 * (k + 1) + 4) (k + 1) * tc L (2 * (k + 1) + 4) k

def SUpperOfRank41 : Prop := SChain → BOdd → SUpperRank41


theorem selmer_upper_bound_rank41 (hS : TorsStab) (hD : Descend) (hZ : ZVal) (hB : Bock)
    (hF : FibCount) : SUpperOfRank41 := by
  intro hC hO L _ _ hL k hk hr l ν hl B _ _ Φ hΦ S hSm
  classical
  have hl0 : 0 < l := hl.out.pos
  have hq : 0 < l ^ ν := pow_pos hl0 ν
  have hqB : ∀ b : B, l ^ ν • b = 0 := fun b => by
    rw [← Nat.cast_smul_eq_nsmul (ZMod (l ^ ν)), ZMod.natCast_self, zero_smul]
  obtain ⟨φ, hφ, hφΦ⟩ := hD (𝓞 L) (l ^ ν) k B Φ hΦ
  choose! nn hnn using hSm
  obtain ⟨n, hn0, hnS⟩ : ∃ n, 2 * (k + 1) + 4 ≤ n ∧ ∀ s ∈ S, nn s ≤ n :=
    ⟨max (2 * (k + 1) + 4) (S.sup nn), le_max_left _ _, fun s hs => le_max_of_le_right (Finset.le_sup hs)⟩
  obtain ⟨β, hβ⟩ := hB (l ^ ν) hq (GL (Fin n) (𝓞 L)) k
  obtain ⟨hfin, hcard⟩ := hS L hL k (2 * (k + 1) + 4) n (by omega) hn0
  have hlev : ∀ t, n ≤ lev l n t := fun t => by
    induction t with
    | zero => exact le_rfl
    | succ t ih => exact ih.trans (Nat.le_mul_of_pos_left _ hl0)
  obtain ⟨hfin', hcard'⟩ := hS L hL (k + 1) (2 * (k + 1) + 4) (lev l n k) le_rfl (hn0.trans (hlev k))
  obtain ⟨u, hu⟩ := hZ (𝓞 L) B (k + 1) l ν hl0 hqB φ hφ n k
  let g : LinearMap.ker (bd (ZMod (l ^ ν)) (GL (Fin n) (𝓞 L)) k) →+ B :=
    (nsmulAddMonoidHom (l ^ k)).comp
      ((Φ n).toAddMonoidHom.comp (LinearMap.ker (bd (ZMod (l ^ ν)) (GL (Fin n) (𝓞 L)) k)).subtype.toAddMonoidHom)
  have hg : ∀ y, g y = l ^ k • Φ n y.1 := fun y => rfl
  let a := l ^ (ν-k)
  have ha : 0 < a := pow_pos hl0 _
  have hkill (b : B) : a • (l ^ k • b) = 0 := by
    have he : ν-k+k = (ν-k+k-ν)+ν := by omega
    dsimp [a]
    rw [← mul_smul, ← pow_add, he, pow_add, mul_smul, hqB, smul_zero]
  let f : grpH (GL (Fin (lev l n k)) (𝓞 L)) (k + 1) →+ B :=
    { toFun := fun z => φ (lev l n k) (u • z)
      map_zero' := by simp
      map_add' := by intro x y; simp [smul_add] }
  let X := Set.range fun x : grpH (GL (Fin n) (𝓞 L)) (k+1) => zSeq (𝓞 L) hl0 x k
  have hlocal : ∀ z ∈ Submodule.span ℤ X, a • f z = 0 := by
    intro z hz
    refine Submodule.span_induction (p := fun w _ => a • f w = 0) ?_ ?_ ?_ ?_ hz
    · rintro w ⟨x, rfl⟩
      change a • φ (lev l n k) (u • zSeq (𝓞 L) hl0 x k) = 0
      rw [← hu]
      exact hkill (φ n x)
    · simp
    · intro x y _ _ hx hy
      rw [map_add, smul_add, hx, hy, add_zero]
    · intro t x _ hx
      rw [map_zsmul, smul_comm, hx, smul_zero]
  have key := hF _ _ B β g (a ^ InfinitePlace.nrComplexPlaces L * tc L (2 * (k + 1) + 4) (k + 1)) ?_ S ?_
  · rw [hcard] at key
    exact key
  · intro T hT
    rw [← hcard']
    refine rankCount_local41 _ B a _ ha hfin' (Submodule.span ℤ X) (hO L hL k hk hr l hl0 n hn0) f hlocal T fun s hs => ?_
    obtain ⟨y, hy, rfl⟩ := hT s hs
    obtain ⟨z, hz, hzy⟩ := hβ y hy
    obtain ⟨x, hx⟩ := hφΦ n z hz
    refine ⟨zSeq (𝓞 L) hl0 x k, Submodule.subset_span ⟨x, rfl⟩, ?_⟩
    rw [hg, ← hzy, ← hx, hu]
    rfl
  · intro s hs
    obtain ⟨y, hy, e⟩ := hnn s hs
    refine ⟨⟨cm _ (stab (𝓞 L) (nn s) n (hnS s hs)) (k + 1) y, ?_⟩, ?_⟩
    · rw [LinearMap.mem_ker, (hC _).2.1, show bd _ _ k y = 0 from hy, map_zero]
    · rw [hg, hΦ.stab _ _ _ _ hy]
      exact e


theorem sUpperOfRank_native41 : SUpperOfRank41 := by
  first
  | (rh_reduce 2 using [selmer_upper_bound_rank41, torsStab, descend, zVal, bock, fibCount]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact selmer_upper_bound_rank41 torsStab descend zVal bock fibCount

theorem original_of_rank41 (h : SUpperOfRank41) : SUpperOf := by
  intro hC hO L _ _ hL k hk hr l ν hl B _ _ Φ hΦ S hS
  have hs := h hC hO L hL k hk hr l ν B Φ hΦ S hS
  refine hs.trans ?_
  have hle : l ^ (ν-k) ≤ l ^ ν := Nat.pow_le_pow_right hl.out.pos (Nat.sub_le _ _)
  gcongr

end RHLocalRank41
rh_prune RHLocalRank41.rankCount_local41 as RHLocalRank41.RankPruned
rh_scan UpperTheory.V.ZK.sUpperOf limit 2000
rh_scan RHLocalRank41.sUpperOfRank_native41 limit 2000
#print axioms UpperTheory.V.ZK.sUpperOf
#print axioms RHLocalRank41.rankCount_local41
#print axioms RHLocalRank41.sUpperOfRank_native41
#print axioms RHLocalRank41.original_of_rank41
