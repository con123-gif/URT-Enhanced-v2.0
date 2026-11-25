import Mathlib
import Development.AutomorphicArithmetic.AutomorphicVarieties.AdditiveValuationNorms.ABoundOfDescends
import Development.AutomorphicArithmetic.AutomorphicVarieties.LayeredIsomorphisms.PartA
import Development.AutomorphicArithmetic.AutomorphicVarieties.GaloisLibrary.GaloisCohomologyLength.ShaLenEqShaInv
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN37 lane 6 — 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED Lean, not compiled.
RH OPEN. Exact factorial valuation aggregate on the actual dyadic PartA consumer,
using the native determinant-centre supplier rather than paying log Z at every twist.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, current branch; AGENTS,
SWARM, HANDOFF, EXPANSION, continuity/state/log openings and live proof
10e3d636b345adbcae9ddb91820a3a93f59c93bc consulted.
Peers: e4d69792 (fixed odd tower), 79428d5b (KBridge power image),
f2bb1e4b (residual parity), 21574277 (CaseI exception empty),
2a39654b (weight-one K2); previous a7ba9251 (dyadic exceptional aggregate).
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Latest upstream observed 2caf4fd16ee59eb56ad8b6a605461837969900c4,
not substituted.

SOURCE LEDGER: paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/
LayeredIsomorphisms/PartA.lean c41983a3d9483591b7d7eedfb3b672d72cde101a
LayeredIsomorphisms/SecondBound.lean a2e12927214cad3ce637b33adb435f42992c1c65
LayeredIsomorphisms/ThmBabOf.lean d4b0c37c79996fca0b0d30fb53fe798eceb90cff
LayeredIsomorphisms/ThmBabOfLemmaK.lean 20c347251400d31a39cf68f964d6648d87f3dda4
LayeredIsomorphisms/Exc.lean d0d49933faebf73a8162c153b8115139e36efa82
LayeredIsomorphisms/Near1.lean 3ba2c097a7496c4f32255699e57917c9763bd162
LayeredIsomorphisms/ImportsAlt.lean ef9122254fb295f15e9f01d9512d70a26e6f6884
LayeredIsomorphisms/Vvat.lean a951bf639d41e5638a196041e22f73e186b2767c
LayeredIsomorphisms/Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
AdditiveValuationNorms/ABoundOfDescends.lean 7b5f2da8824b3e1cd85b5c1b46fd02ed1ef00df3
AdditiveValuationNorms/ExistsCentresLevel.lean 42c340126cd2d651603c6abbb30607cb2c3991dd
AdditiveValuationNorms/DetBound.lean 5008e9194b14974584d640b945ba3ef4d9bab291
AdditiveValuationNorms/NormVal.lean 39c0d6640f5fac6f2c4f508e5af574140255fd5c
AdditiveValuationNorms/Descends.lean 6771b1273de94a05686413e0c8ccc8b2f06882b6

EDITOR BLOCK. At the actual thmBab_of_lemmaK -> thmBab_of -> partA,
aBound_of_isTower calls aBound_of_descends; the latter uses
exists_centres_norm, which deliberately discards the stronger
exists_centres bound. Retain that earlier result, with exactly the same
L0, gamma, R, c, q,d and j0=jZero 2 R. It supplies fixed s_i in Z_2,
independent of e,m,Z (the proof uses fixed-layer exists_centres_level and
twLen_le_growth; unlike the odd fixed layer, retain growth and Unip).
By Descends.eq_twLen, for k>=1,
 shaInv(L1,2,k) <= R*(max(m,j0)+c) + sum_i v2(s_i-k) (ENat).
Let I=[1,n], n=t-1<=Z, B=floor(log_2 Z) if Z>=1. Construct Exc from
these SAME centres as in native exc: union of k in [1,Z] congruent to
s_i mod 2^(B+1). This gives |Exc|<=R, since modulus>Z. Outside Exc,
each valuation is finite <=B. This is precisely the native near-set
for these integral centres; use the padic norm/valuation identity.
Do not assume arbitrary FirstBound exposes such centres: use its actual
native stronger supplier, or keep this as a separate premise.

EXACT AGGREGATE. For n>=1 select, for each i separately, a maximizer a_i
of v2(s_i-k) on I (ENat, including infinity). For k != a_i,
 v2(s_i-k) <= v2(k-a_i)
by the ultrametric inequality on (s_i-a_i)-(s_i-k).
Define b_i=v2(s_i-a_i) if a_i not in Exc, and b_i=0 otherwise.
Thus b_i is finite and <=B even if the maximum is infinite.
Summing only over I\Exc and then over the larger set I\{a_i},
 sum_(k in I\Exc) v2(s_i-k)
 <= b_i + v2((a_i-1)! (n-a_i)!)
 <= b_i + v2((n-1)!).
The last inequality follows from the integral binomial coefficient;
Legendre gives v2((n-1)!)=(n-1)-popcount(n-1) (zero for n=1).
For n=0 define all charges zero. This is independent of the positions
of the unknown padic centres; no actual centre need be computed.
In particular the total charge <= R*(B+v2((n-1)!)), instead of n*R*B.
For B>=1 this is <= n*R*B; for B=0 necessarily n<=1 and equality holds.
Using b_i rather than B can remove even the additive B for centres
whose maximizing twist is exceptional. A maximizer is just an upper
bound device; does not change the common window or Exc.

Combining the original TwoBase transfer and SecondBound at exceptions,
with VLen finite there and C=R*max(m-j0,0)<=A0=R*(max(m,j0)+c), gives
  sum_(k=1)^n shaInv(E,2,k)
  <= n*(1+A0) + sum_i b_i + R*v2((n-1)!)
       + sum_(k in I intersect Exc) VLen(D,k).
All lengths here are finite before toNat is used. This replaces the
n*R*log_2 Z term in RUN36, without enlarging the exceptional set or
choosing different hosts for separate twists. If n=0 use empty sums.
With m<=page+2, replace A0 by R*(max(page+2,j0)+c) as before.
The linear valuation cost is now independent of the global window
cutoff except for at most one capped valuation per centre. Other log
losses (m itself, etc.) remain. No stronger asymptotic exponent or
new root closure is claimed. The aggregate exceptional H2/K bound is
still open; peer power-image bridge is a candidate, not a supplier
proved here. Retain the SAME union window, R, X, q,d, all odd, minus,
geometry, and other global consumers.

Original local graph: thmBab_of_lemmaK -> aBound_of_isTower ->
aBound_of_descends -> exists_centres_norm -> exists_centres;
thmBab_of -> partA -> exc + point2 -> point -> FirstBound / SecondBound
+ klen + kexp -> vvat.
Candidate: partA aggregate -> exists_centres + Descends.eq_twLen +
factorial valuation aggregate + TwoBase + SecondBound + finite exceptional
budget -> VVat. Original full fallback retained. No removal of
unipotence, FerreroWashington, PT/local inputs or LemmaK globally.
Context cache pin/toolchain, M,q,d,R,L0,gamma,u,c,j0,s_i,Z,Exc,x,t,E,L1,m,L2,D
and actual typeclass/hypothesis context. No merge by name alone.

ACTUAL arithmetic regression: JS loop over Z=1..64, every centre
residue modulo 2^(B+1), all 0<=n<=Z, 122032 cases. Compared exact
outside-exception valuations against layer counts and the stronger
maximizer+factorial bound, checked pairwise ultrametric inequality,
uniqueness and comparison to nB. 46218 equality cases; 119109 cases
with strict improvement in the bound over nB; maximum saving 327 per
centre; 2858 empty intervals. Exact integer arithmetic; this enumerates
all truncated centre residues in those ranges, not actual cohomology.
Negative control: s=1, Z=n=1; omitting Exc permits infinite valuation.
Reproduce in JS:
  const v=d=>{if(d===0)return Infinity;let k=0;while(d%2===0){d/=2;k++}return k};
  const f=n=>{let a=0;for(let k=2;k<=n;k*=2)a+=Math.floor(n/k);return a};
  for(let Z=1;Z<=64;Z++){let B=Math.floor(Math.log2(Z)),m=2**(B+1);
    for(let s=0;s<m;s++){let E=[];for(let e=1;e<=Z;e++)if((s-e)%m===0)E.push(e);
      if(E.length>1)throw Error("unique");
      for(let n=0;n<=Z;n++){let I=[];for(let e=1;e<=n;e++)if(!E.includes(e))I.push(e);
        let w=I.reduce((a,e)=>a+v(s-e),0), z=0, b=0;
        for(let k=1;k<=B;k++)z+=I.filter(e=>(s-e)%(2**k)===0).length;
        if(n){let a=1;for(let e=2;e<=n;e++)if(v(s-e)>v(s-a))a=e;
          b=(E.includes(a)?0:v(s-a))+f(n-1);
          for(let e of I)if(e!==a&&v(s-e)>v(e-a))throw Error("ultra")}
        if(w!==z||w>b||b>n*B)throw Error("bound")
      }}}
Lean/Lake unavailable locally. Retrieved actual CI baseline status blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717, both returncode 0,
runs 45577239749 and 45576756833. Only old engine/root checks verified.
New prepared Lean below checks the finite aggregation and actual VVat
consumer; the arithmetic padic/maximizer-to-factorial bridge is a
human proof with exact arithmetic regression, not yet a Lean proof.
No new axiom/constructor evidence, no new CI PASS. No URT used.

RESUME HERE: compile the actual VVat adapter and native centre extraction,
formalize the valuation factorial lemma (including infinite maximum),
then plug the peer K power-image comparison into the SAME finite
exceptional budget at L2, or prove a direct finite sum bound. Keep full
native union window and uniform supplier. HANDOFF TO Galois, prime,
integration, audit, kernel and editor. No RH closure.
-/

open NumberField Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V
  UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win
noncomputable section
namespace RHCharacter37

/-- Sum the exact far costs, not the pointwise maximum. -/
theorem charge (I : Finset ℕ) (w d : ℕ → ℕ) (a b F : ℕ)
    (hw : ∀ k ∈ I, k ≠ a → w k ≤ d k)
    (ha : a ∈ I → w a ≤ b)
    (hd : ∑ k ∈ I.erase a, d k ≤ F) :
    ∑ k ∈ I, w k ≤ b + F := by
  classical
  by_cases h : a ∈ I
  · have hsum : ∑ k ∈ I.erase a, w k ≤ ∑ k ∈ I.erase a, d k := by
      apply Finset.sum_le_sum
      intro k hk
      exact hw k (Finset.mem_of_mem_erase hk) (Finset.ne_of_mem_erase hk)
    have hh := Finset.sum_erase_add I w h
    omega
  · have hsum : ∑ k ∈ I, w k ≤ ∑ k ∈ I, d k := by
      apply Finset.sum_le_sum
      intro k hk
      exact hw k hk (by intro he; subst k; contradiction)
    rw [Finset.erase_eq_of_notMem h] at hd
    omega

private theorem finNat (s : ℕ∞) (a : ℕ) (h : s ≤ (a : ℕ∞)) :
    s ≠ ⊤ ∧ s.toNat ≤ a := by
  have hs : s ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h
  obtain ⟨n, rfl⟩ := ENat.ne_top_iff_exists.mp hs
  exact ⟨ENat.coe_ne_top _, by simpa using h⟩

/-- Variable per-twist budget at the original VVat consumer. -/
theorem vvatCost (l t : ℕ) [Fact l.Prime] (E : Type) [Field E] [NumberField E]
    (B : ℝ) (f : ℕ → ℝ)
    (h : ∀ k : ℕ, 1 ≤ k → k < t →
      shaInv E l k ≠ ⊤ ∧ ((shaInv E l k).toNat : ℝ) ≤ f k)
    (hb : ∑ k ∈ Finset.Ico 1 t, f k ≤ B) : VVat l E t B := by
  intro Ω _ _ _ D
  refine ⟨fun k hk ht => ?_, ?_⟩
  · rw [shaLen_eq_shaInv]
    exact (h k hk ht).1
  · refine le_trans (Finset.sum_le_sum fun k hk => ?_) hb
    rw [Finset.mem_Ico] at hk
    rw [shaLen_eq_shaInv]
    exact (h k hk.1 hk.2).2

/-- Native dyadic transfer; f is the retained sum of centre valuations
outside Exc. No uniform log Z bound or uniform exceptional kBound input. -/
theorem aggregate37 {E L₀ L₁ L₂ Ω : Type} [Field E] [NumberField E]
    [Field L₀] [Field L₁] [NumberField L₁] [Algebra L₀ L₁]
    [Field L₂] [NumberField L₂] [Algebra L₀ L₂] [Field Ω]
    [Algebra L₂ Ω] [IsAlgClosure L₂ Ω]
    (D : LData L₂ Ω 2) (R c t m : ℕ) (Exc : Finset ℕ)
    (hS : SecondBound 2 R L₀)
    (hL1 : IsLayer 2 m L₀ L₁) (hL2 : IsLayer 2 (jZero 2 R) L₀ L₂)
    (hE : ∀ k : ℕ, 1 ≤ k → shaInv E 2 k ≤ 1 + shaInv L₁ 2 k)
    (f : ℕ → ℕ)
    (hfar : ∀ k : ℕ, 1 ≤ k → k < t → k ∉ Exc →
      shaInv L₁ 2 k ≤ ((R * (max m (jZero 2 R) + c) + f k : ℕ) : ℕ∞))
    (hfin : ∀ k : ℕ, 1 ≤ k → k < t → k ∈ Exc → VLen D (k : ℤ) ≠ ⊤)
    (F X B : ℝ)
    (hf : ∑ k ∈ Finset.Ico 1 t, (if k ∈ Exc then 0 else (f k : ℝ)) ≤ F)
    (hx : ∑ k ∈ Finset.Ico 1 t,
      (if k ∈ Exc then ((VLen D (k : ℤ)).toNat : ℝ) else 0) ≤ X)
    (hb : ((t-1 : ℕ) : ℝ) * (1 + (R * (max m (jZero 2 R) + c) : ℕ)) + F + X ≤ B) :
    VVat 2 E t B := by
  classical
  let A := R * (max m (jZero 2 R) + c)
  have hnear : R * (m - jZero 2 R) ≤ A := by
    dsimp [A]
    apply Nat.mul_le_mul_left
    omega
  let g : ℕ → ℕ := fun k => if k ∈ Exc then (VLen D (k : ℤ)).toNat else f k
  apply vvatCost 2 t E B (fun k => (1 : ℝ) + A + g k)
  · intro k hk ht
    have hL : shaInv L₁ 2 k ≤ ((A + g k : ℕ) : ℕ∞) := by
      by_cases he : k ∈ Exc
      · obtain ⟨v, hv⟩ := ENat.ne_top_iff_exists.mp (hfin k hk ht he)
        have hv' : VLen D (k : ℤ) = (v : ℕ∞) := by
          first | exact hv | exact hv.symm
        have hs := hS k hk m L₁ hL1 L₂ hL2 Ω D
        rw [hv'] at hs
        dsimp [g]
        rw [if_pos he, hv', ENat.toNat_coe]
        refine hs.trans ?_
        push_cast
        have hh : ((R * (m - jZero 2 R) : ℕ) : ℕ∞) ≤ (A : ℕ∞) := by exact_mod_cast hnear
        exact (add_le_add_left hh (v : ℕ∞)).trans_eq (add_comm _ _)
      · simpa [A, g, he] using hfar k hk ht he
    have h' : shaInv E 2 k ≤ ((1 + (A + g k) : ℕ) : ℕ∞) := by
      refine (hE k hk).trans ?_
      push_cast
      exact add_le_add_left hL _
    obtain ⟨hne, hle⟩ := finNat _ _ h'
    refine ⟨hne, ?_⟩
    exact_mod_cast hle
  · have hg : ∀ k : ℕ, (g k : ℝ) =
        (if k ∈ Exc then 0 else (f k : ℝ)) +
        (if k ∈ Exc then ((VLen D (k : ℤ)).toNat : ℝ) else 0) := by
      intro k
      by_cases he : k ∈ Exc <;> simp [g, he]
    calc
      ∑ k ∈ Finset.Ico 1 t, (1 + (A : ℝ) + (g k : ℝ))
          = ((t-1 : ℕ) : ℝ) * (1 + (A : ℝ)) +
            ∑ k ∈ Finset.Ico 1 t, (g k : ℝ) := by
              rw [Finset.sum_add_distrib, Finset.sum_const, Nat.card_Ico, nsmul_eq_mul]
      _ ≤ ((t-1 : ℕ) : ℝ) * (1 + (A : ℝ)) + F + X := by
            simp_rw [hg, Finset.sum_add_distrib]
            linarith
      _ ≤ B := hb

end RHCharacter37
#print axioms RHCharacter37.charge
#print axioms RHCharacter37.aggregate37
rh_scan UpperTheory.V.PropA.exists_centres limit 2000
rh_scan UpperTheory.V.Win.partA limit 2000
rh_scan RHCharacter37.aggregate37 limit 2000
rh_prune RHCharacter37.aggregate37 as RHCharacter37Pruned

open RHCharacter37 in
example (l t : ℕ) [Fact l.Prime] (E : Type) [Field E] [NumberField E]
    (B : ℝ) (f : ℕ → ℝ)
    (h : ∀ k : ℕ, 1 ≤ k → k < t →
      shaInv E l k ≠ ⊤ ∧ ((shaInv E l k).toNat : ℝ) ≤ f k)
    (hb : ∑ k ∈ Finset.Ico 1 t, f k ≤ B) : VVat l E t B := by
  first
  | rh_reduce 3 using [vvatCost]
  | rh_auto 3
  | rh_auto_frontier 2
    all_goals exact vvatCost l t E B f h hb
