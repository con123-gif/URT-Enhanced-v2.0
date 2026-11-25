import Development.AutomorphicArithmetic.AutomorphicVarieties.AdditiveValuationNorms.Growth
import Development.AutomorphicArithmetic.AutomorphicVarieties.AdditiveValuationNorms.ABoundOfDescends
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN38 structure lane 13, 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED
Lean, NOT compiled. RH OPEN. One result: exact tower-image identity at
the dyadic growth consumer still retained after RUN37.

Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
engine; original mission e0dc8f7f blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d.
SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, state/log/protocol/
continuity openings and CI summary read. Recent 35 commits inspected;
detailed peers c55df0a0 (factorial charge), a7ba9251 (exception sum),
bed688c0 (actual LemmaK fork and local budget), c2aa33f (Hurewicz),
0ca8c0c7 (mean caller), 79428d5b (alternative KBridge).
Prior RUN37 e4d69792 remains conditional. Do not confuse the alternative
KBridge route with the actual ZK.lemmaK supplier.

Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
SOURCE LEDGER relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
AdditiveValuationNorms/Growth.lean b7342ae414e9c24a16208de8f202028ea935bd61
AdditiveValuationNorms/ImportsMore.lean 1a12cd947576a41a9232823db62df0c115592e9d
AdditiveValuationNorms/ImportsTer.lean 3b0f5bfaa0fe1b2d0348ff9e6bcd1930e16470e8
AdditiveValuationNorms/PowIn.lean 4c847dbcf01232fd8023e9d6bb3569de6a91a8d2
AdditiveValuationNorms/ImportsBis.lean 50fae2febb0c5eb2ace8d78fbe907f800a8736a6
AdditiveValuationNorms/CokLen.lean a4e9c1ca6e21f9ce85259f977ca987d944c034d7
AdditiveValuationNorms/CokLenLeOfRangeLe.lean cfb4fbb3ffcd97668a249c63397cf01f5a7a6115
AdditiveValuationNorms/ABoundOfDescends.lean 7b5f2da8824b3e1cd85b5c1b46fd02ed1ef00df3
AdditiveValuationNorms/ExistsCentresLevel.lean 42c340126cd2d651603c6abbb30607cb2c3991dd
LayeredIsomorphisms/ThmBabOfLemmaK.lean 20c347251400d31a39cf68f964d6648d87f3dda4
LayeredIsomorphisms/PartA.lean c41983a3d9483591b7d7eedfb3b672d72cde101a

EDITOR BLOCK. Let X be the SAME finitely generated Z_l-module, g the
actual twisted endomorphism u^e gamma, j0=jZero l R, w=g^(l^j0), and
Y=im(w-1). Native growth already proves InPow 2 (w-1) using unipPow,
frob, powIn. The native phi proves lX contained in S(X), where
S=1+w+...+w^(l-1). Since w=1 modulo l^2 X, Sx=l x modulo l^2 X;
hence S(X) is contained in lX too. This reverse inclusion requires
no division by l (X can have l-torsion). The exact factorization
w^l-1=(w-1)S now gives image(w^l-1)=lY, not merely a length inequality.
The congruence w^l=1 modulo l^2 X persists by powIn. Induction gives

  image(g^(l^(j0+d))-1) = l^d Y, every d>=0.

This identifies the *entire image chain* with powers of a single
submodule. Before taking lengths there is the exact sequence
  0 -> Y/l^d Y -> X/l^d Y -> X/Y -> 0.
Thus, writing L_j=cokLen(g^(l^j)-1), in ENat (including infinity),
  L_(j0+d) = L_j0 + length(Y/l^d Y).
By the structure theorem over the DVR Z_l, if
Y = Z_l^r + direct sum_i Z_l/(l^a_i), a_i>=1,
  length(Y/l^d Y) = r*d + sum_i min(d,a_i).
The original R*d follows since Y is a submodule of an R-generated
module over a PID and needs at most R generators: lift Y to a submodule
of Z_l^R and take a basis. For finite torsion this is strictly sharper
once d exceeds a torsion exponent; no assertion that such torsion occurs
in the actual X. If the anchor cokernel is infinite, use ENat addition
not subtraction. For m<j0 use native mono (do not extrapolate a
negative d). No invertibility, torsion-free assumption or p-adic division.

At the actual aBound_of_descends exceptional SecondBound consumer,
Descends.eq_twLen and native shaLeV therefore allow the original
R*(m-j0)_+ penalty to be replaced by the image-length budget
r_e*d + sum_i min(d,a_ei), d=(m-j0)_+. For m>=j0 this budget is exact
relative to shaInv on L2, and remains an upper bound when that anchor
is replaced by VLen. For m<=j0 use zero and monotonicity. Dependence on
the SAME twist and field is mandatory: r_e and a_ei need not be
uniform across twists or hosts. For the dyadic aggregate of peer
c55df0a0, sum this budget only over the relevant twists, or bound by
the original R*d. This does not replace the FerreroWashington generator
bound, determinant centre bound, PT, or other quantitative suppliers.

Source-visible original graph retained: thmBab_of_lemmaK -> partA via
TwoIn/ABound -> aBound_of_descends -> twLen_le_growth -> growth ->
unipPow/frob/powIn + step -> phi/lenComp/cokL.
Candidate: local anchored range identity -> phi + powIn + exact
factorization -> quotient length additivity -> DVR invariant factors.
The local anchored growth adapter below also uses native step and mono,
and suffices at the original consumer once the anchor congruence is
supplied. Not claiming that the anchor congruence is logically weaker
than Unip globally, or that unipPow/xUnip can already be removed.
Original fallback, all type/value/constructor edges and axiom evidence
remain; no global pruning. Cache key pin/toolchain,l,X,g,e,j0,R,
actual image Y, anchor congruence, host, layer identifications.
No URT ordering used: direct factorization settles the local question.
No speedup claimed. Prior peer aggregate is complementary, not duplicate.

EXECUTED local Python finite-module controls (not actual field data):
for (p,n)=(2,3),(2,4),(3,3),(5,2), q=p^n, exhaust all 2x2 matrices
W=I+T over Z/q with entries T divisible by p^2.
For d=0..n enumerate images of W^(p^d)-I and p^d*(W-I) on (Z/q)^2;
assert set equality, then assert |Y|/|p^dY|<=p^(2d).
Actual outputs: 1671 range identities, 1671 length upper bounds,
993 strict improvements in the length test. Negative control on
Z/8, w=7 (only mod 2 congruence): image(w^2-1)=0 but
2 image(w-1)={0,4}. This excludes weakening mod 4 to mod 2
for the dyadic step. These are abstract lemma controls, not evidence
for arithmetic number-field bounds.
Local command -v lean and lake returned no paths. Baseline actual status
blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 report returncode 0 for
45577239749/45576756833, baseline only. This overlay has not been compiled
or queued; no new kernel axiom result or root closure.

RESUME HERE: compile this overlay in pinned runner (alongside RUN35-37);
verify range_step38 and growth_anchor38, formalize quotient length
additivity for the actual image chain, and propagate exact budget into
the dyadic exceptional aggregate on the same host. Backtrack to native
growth if replay fails. Keep all outstanding quantitative suppliers.
HANDOFF TO kernel, character boxes, audit, Galois, integration, editor.
-/

noncomputable section
open UpperTheory.V UpperTheory.V.PropA

namespace UpperTheory.V.PropA
variable {l : ℕ} [Fact l.Prime] {X : Type} [AddCommGroup X] [Module ℤ_[l] X]

theorem geom_range38 [Module.Finite ℤ_[l] X]
    (w : Module.End ℤ_[l] X) (hw : InPow 2 (w - 1)) :
    LinearMap.range (∑ i ∈ Finset.range l, w ^ i) =
      LinearMap.range ((l : ℤ_[l]) • (1 : Module.End ℤ_[l] X)) := by
  apply le_antisymm
  · have hpow : ∀ i : ℕ, ∀ x : X, ∃ y : X,
        (w ^ i) x = x + (l : ℤ_[l]) ^ 2 • y := by
      intro i
      induction i with
      | zero => intro x; exact ⟨0, by simp⟩
      | succ i ih =>
        intro x
        obtain ⟨y, hy⟩ := ih (w x)
        obtain ⟨z, hz⟩ := hw x
        refine ⟨z + y, ?_⟩
        rw [pow_succ, Module.End.mul_apply, hy, smul_add, ← hz]
        simp only [LinearMap.sub_apply, Module.End.one_apply]
        abel
    have hsum : ∀ (n : ℕ) (x : X), ∃ y : X,
        (∑ i ∈ Finset.range n, w ^ i) x = (n : ℤ_[l]) • x + (l : ℤ_[l]) ^ 2 • y := by
      intro n x
      induction n with
      | zero => exact ⟨0, by simp⟩
      | succ n ih =>
        obtain ⟨y, hy⟩ := ih
        obtain ⟨z, hz⟩ := hpow n x
        refine ⟨y + z, ?_⟩
        rw [Finset.sum_range_succ, LinearMap.add_apply, hy, hz, smul_add,
          Nat.cast_succ, add_smul, one_smul]
        abel
    rintro _ ⟨x, rfl⟩
    obtain ⟨y, hy⟩ := hsum l x
    refine ⟨x + (l : ℤ_[l]) • y, ?_⟩
    rw [hy, LinearMap.smul_apply, Module.End.one_apply, smul_add, pow_two, mul_smul]
  · exact phi l X w hw

theorem range_step38 [Module.Finite ℤ_[l] X]
    (w : Module.End ℤ_[l] X) (hw : InPow 2 (w - 1)) :
    LinearMap.range (w ^ l - 1) =
      LinearMap.range ((l : ℤ_[l]) • (w - 1)) := by
  rw [← mul_geom_sum]
  have hr := geom_range38 w hw
  apply le_antisymm
  · rintro _ ⟨x, rfl⟩
    have hx := LinearMap.mem_range_self (∑ i ∈ Finset.range l, w ^ i) x
    rw [hr] at hx
    obtain ⟨y, hy⟩ := hx
    refine ⟨y, ?_⟩
    change (l : ℤ_[l]) • ((w - 1) y) = (w - 1) ((∑ i ∈ Finset.range l, w ^ i) x)
    rw [← hy, LinearMap.smul_apply, Module.End.one_apply, map_smul]
  · rintro _ ⟨x, rfl⟩
    have hx := LinearMap.mem_range_self ((l : ℤ_[l]) • (1 : Module.End ℤ_[l] X)) x
    rw [← hr] at hx
    obtain ⟨y, hy⟩ := hx
    refine ⟨y, ?_⟩
    change (w - 1) ((∑ i ∈ Finset.range l, w ^ i) y) = (l : ℤ_[l]) • ((w - 1) x)
    rw [hy, LinearMap.smul_apply, Module.End.one_apply, map_smul]

/-- Local interface consumed by the same twisted length comparison.
It uses the anchor congruence directly, instead of replaying the
unipotence-to-anchor construction on every call. -/
theorem growth_anchor38 (R : ℕ) (g : Module.End ℤ_[l] X)
    (hG : GenBy l R X) (hA : InPow 2 (g ^ l ^ jZero l R - 1)) (m : ℕ) :
    cokLen (g ^ l ^ m - 1) ≤
      cokLen (g ^ l ^ jZero l R - 1) + ((R * (m - jZero l R) : ℕ) : ℕ∞) := by
  have hC : ∀ d : ℕ, InPow 2 (g ^ l ^ (jZero l R + d) - 1) := by
    intro d
    have h := (powIn l X (g ^ l ^ jZero l R)).1 2 (l ^ d) hA
    rwa [← pow_mul, ← pow_add] at h
  have main : ∀ d : ℕ, cokLen (g ^ l ^ (jZero l R + d) - 1) ≤
      cokLen (g ^ l ^ jZero l R - 1) + ((R * d : ℕ) : ℕ∞) := by
    intro d
    induction d with
    | zero => simp
    | succ d ih =>
      have h := step l X R (g ^ l ^ (jZero l R + d)) hG (hC d)
      rw [← pow_mul, ← pow_succ] at h
      calc
        _ ≤ cokLen (g ^ l ^ (jZero l R + d) - 1) + R := by
          simpa [Nat.add_assoc] using h
        _ ≤ cokLen (g ^ l ^ jZero l R - 1) + ((R * d : ℕ) : ℕ∞) + R :=
          add_le_add_left ih _
        _ = _ := by push_cast; ring
  rcases le_total m (jZero l R) with hm | hm
  · rw [Nat.sub_eq_zero_of_le hm, mul_zero, Nat.cast_zero, add_zero]
    exact mono l X g _ _ (pow_dvd_pow l hm)
  · obtain ⟨d, rfl⟩ := Nat.exists_eq_add_of_le hm
    rw [Nat.add_sub_cancel_left]
    exact main d

theorem twLen_anchor38 (R : ℕ) (γ : Module.End ℤ_[l] X) (u : ℤ_[l])
    (e m : ℕ) (hG : GenBy l R X)
    (hA : InPow 2 ((u ^ e • γ) ^ l ^ jZero l R - 1)) :
    twLen γ u e m ≤ twLen γ u e (jZero l R) +
      ((R * (m - jZero l R) : ℕ) : ℕ∞) := by
  exact growth_anchor38 R (u ^ e • γ) hG hA m

example (R : ℕ) (γ : Module.End ℤ_[l] X) (u : ℤ_[l]) (e m : ℕ)
    (hG : GenBy l R X) (hA : InPow 2 ((u ^ e • γ) ^ l ^ jZero l R - 1)) :
    twLen γ u e m ≤ twLen γ u e (jZero l R) +
      ((R * (m - jZero l R) : ℕ) : ℕ∞) := by
  first
  | (rh_reduce 2 using [twLen_anchor38]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact twLen_anchor38 R γ u e m hG hA

end UpperTheory.V.PropA

#print axioms UpperTheory.V.PropA.geom_range38
#print axioms UpperTheory.V.PropA.range_step38
#print axioms UpperTheory.V.PropA.twLen_anchor38
rh_scan UpperTheory.V.PropA.aBound_of_descends limit 2000
rh_scan UpperTheory.V.PropA.twLen_anchor38 limit 2000
rh_prune UpperTheory.V.PropA.twLen_anchor38 as RHTowerAnchor38Pruned

end
