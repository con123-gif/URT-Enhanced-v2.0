import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
AUDIT lane 10 RUN38, 25 Nov 2026. SOURCE-MATCHED LITERATURE AUDIT /
exact arithmetic; PREPARED Lean, not compiled. RH OPEN.

Mission latest blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 read, including
mandatory engine; original mission at e0dc8f7f blob 4a45e612ebcf84aa6f0e5be8ee1c7b154b20773d.
SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, state/protocol/log/
continuity openings and CI summary read. Latest peers c9d417b7 (literature),
79428d5b (power-image consumer), e4d69792 (fixed tower), f2bb1e4b (parity),
c55df0a0 (dyadic factorial), 8aed7b77 (LevelAt), a9dc2a6f (identity mean),
678de808 (signed consumer). Prior audit 21574277 remains unchanged.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: independently authenticated the exact integral GL homology
stabilization theorem missing in literature RUN37, with a sharper
prime-dependent Hurewicz bound. No need to impose a stability axiom in
the human mathematical route.

PRIMARY EVIDENCE: W. van der Kallen, Homology Stability for Linear Groups,
Invent. Math. 60 (1980), 269–295, DOI 10.1007/BF01390018.
Author-hosted original https://webspace.science.uu.nl/~kalle101/homstab1980.pdf .
Inspected actual page images 273 (PDF index 5), 287–289 (19–21).
Convention 2.2 and standard example on p273: one may take sdim=d when
R is module-finite over a central subring with noetherian maximal spectrum
of dimension d. Take R=O_L itself, Dedekind, d=1. Theorem 4.11 p289:
for constant integral homology, with a=max(1,sdim), stabilization in
degree m is surjective at n>=2m+a-1 and injective at n>=2m+a.
Thus at m=2e, it is an isomorphism at every n>=4e+1. Filtered colimits
commute with group homology (finite bar chains; filtered colimits exact).
In particular the actual N=4e+4 is safely in range, and
 H_{2e}(GL_{4e+4}(O_L),Z) -> H_{2e}(GL_infty(O_L),Z)
is an isomorphism, for the SAME field L and every e>=1. The inverse
is an actual homomorphism, not a choice of lifts. A mere surjection
would not suffice (Z/4 -> Z/2 has no homomorphic section).

Independently inspected Mathew arXiv:1501.07561v2 p10, Thm 6.3,
https://arxiv.org/pdf/1501.07561 (PDF index 9). For a connected infinite
loop space (m=1), unstable Hurewicz in degree n=2e has kernel exponent:
 l=2: ceil((2e-1)/2)+3=e+3;
 l>=3: ceil((2e+2)/(2l-2))+1 <= e+1, since 2l-2>=4 and
 (2e+2)<=4e for e>=1.
This strengthens RUN37's common e+3 bound for odd primes by two.
At l=2 retain e+3. The space BGL(O_L)^+ is the connected K-theory
infinite-loop component; the stable-spectrum Hurewicz map is not used.
The integral homology identification is the plus-construction one.
Tensor the stability isomorphism with Z_l and transport h through its
inverse. Exact kernel equality follows by injectivity, before taking
lengths or cardinalities. Tensoring the Hurewicz image of the finite
l-primary K group preserves it: Z_l is flat over Z and is faithful on
finite l-primary groups. The target rank stays 4e+4 in torsMain.
No new stability restriction on L, l or e.

Native source re-read, at pin, relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples:
 Bridge.lean c995485ab93aa56e1eabbdd1900429075fb4c65b
 TorsBoundPow.lean 3552e823716da4241d053c2cdfe0a116039e7886
 Reduction.lean 1cfb92c81ec5c4ed77aac5a7cce457add1e55721
 LemmaKOfPublished.lean 82044f2422c5b48970bd94223e33087a7896fc40.
HGL really is groupHomology with trivial integral coefficients, and
torsHGL is its additive torsion subgroup; native KBridge really uses
Z_l tensor HGL at rank 4e+4 and degree 2e. Its exponent
cOne(2e)=e(2e+5)>=e+3, so the primewise improvement is compatible with
the exact old consumer lemmaK. In the power-image route, conditional
on the comparison inputs in literature RUN37, the bound is
 |l^k X| <= |T_l|, k=e+3 (l=2) or e+1 (l odd).
Then log|X| <= k log|X/lX|+log|T_l| by exact quotient filtration.
Do not confuse a verified stabilization reference with a fully checked
GS/etale identification or KBridge itself.

Original source-visible graph retained:
 lemmaK -> lemmaK_of -> reduction -> KBridge, generators, cardRed,
 tensCard; torsMain unchanged.
Candidate peer graph: QL and cohomology identification + finiteness
 + Hurewicz kernel + GL stability -> LinearBridge37 -> KBridge.
New audit: the GL stability edge is mathematically authenticated at
actual rank with explicit theorem and dimension; native Lean replay
still open. The odd-prime exponent can be sharpened in the same graph.
No global deletion or new axiom evidence. Context key pin/toolchain,
L,l,e,D,GS,S,coefficient topology, native HGL rank, degree and actual
stabilization map. No URT scheduler or speedup claim.

EXECUTED exact JS regression:
 for e=1..1000:
  assert 4*e+4>=4*e+1
  assert ceil((2*e-1)/2)+3==e+3
  assert e+3<=e*(2*e+5)
  for l=3,5,..,101:
   assert ceil((2*e+2)/(2*l-2))+1<=e+1
   assert ceil((2*e+2)/(2*l-2))+1<e+3
Output: 1000 rank, 1000 dyadic, 1000 native, 50000 odd and 50000
strict-improvement controls. (Odd integers include composite controls;
the inequality is elementary, Mathew applies only at primes.)
Negative section control: no t in Z/4 with 2t=0 and t=1 mod 2.
The test validates the arithmetic only, not any cohomology computation.
Local command -v lean and lake gave no paths. Attempt at guessed
TorsBound.lean returned 404; actual definition in TorsBoundPow.lean.
Baseline CI status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched, returncode 0,
runs 45577239749/45576756833. Existing baseline only; no new native
PASS, no axiom result for this overlay, no kernel-verified closure.

RESUME HERE: native batch verify the transport adapter and primewise
KBridge adapter below, with actual stable HGL isomorphism supplier
from vdK 4.11 at rank 4e+4 and explicit coefficient tensor map.
Authenticate the remaining GS/etale and Quillen–Lichtenbaum
identifications at the pinned native LData and coefficient system;
do not count the whole KBridge or RH as closed. Retain PT/local,
torsMain and all same-host arithmetic/geometric window obligations.
HANDOFF TO literature, prime-window, kernel, integration, editor.
Verdict AGREE with RUN37's stability and Hurewicz bounds; PARTIAL
(odd-prime improvement and one literature supplier authenticated,
formal comparison and actual caller replay outstanding).
-/

noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology
open scoped TensorProduct

namespace UpperTheory.V.K

theorem native_stability_range38 (e : ℕ) : 2 * (2 * e) + 1 ≤ 4 * e + 4 := by
  omega

theorem native_kernel_exponent38 (l e : ℕ) (he : 1 ≤ e) :
    (if l = 2 then e + 3 else e + 1) ≤ cOne (2 * e) := by
  calc
    _ ≤ e + 3 := by split <;> omega
    _ ≤ cOne (2 * e) := by
      have H := two_mul_cOne (2 * e)
      nlinarith [Nat.mul_le_mul_left e he]

/-- The exact stable-to-native transport, conditional on the actual
stabilization equivalence, not on mere surjectivity. -/
theorem kernel_transport38 {A K N S : Type*} [CommRing A]
    [AddCommGroup K] [Module A K] [AddCommGroup N] [Module A N]
    [AddCommGroup S] [Module A S]
    (E : N ≃ₗ[A] S) (h : K →ₗ[A] S) (a : A)
    (hk : ∀ x, h x = 0 → a • x = 0) :
    ∀ x, (E.symm.toLinearMap.comp h) x = 0 → a • x = 0 := by
  intro x hx
  apply hk
  apply E.symm.injective
  simpa using hx

def PrimewiseBridge38 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l), IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
      ∃ (K : Type) (_ : AddCommGroup K) (_ : Module ℤ_[l] K) (_ : Finite K)
        (p : K →ₗ[ℤ_[l]] H2 (zlTw D ((e : ℤ) + 1)))
        (h : K →ₗ[ℤ_[l]] ℤ_[l] ⊗[ℤ] HGL L (4 * e + 4) (2 * e)),
        Function.Surjective p ∧ ∀ x, h x = 0 →
          (l : ℤ_[l]) ^ (if l = 2 then e + 3 else e + 1) • x = 0

theorem bridge_of_primewise38 (hK : PrimewiseBridge38) : KBridge := by
  intro l _ L Ω _ _ _ _ _ D hL hμ e he
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  refine ⟨K, _, _, _, p, h, hp, ?_⟩
  intro x hx
  have hc := native_kernel_exponent38 l e he
  obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le hc
  rw [hd, Nat.add_comm (if l = 2 then e + 3 else e + 1) d,
      pow_add, mul_smul, hh x hx, smul_zero]

theorem lemmaK_primewise38 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : PrimewiseBridge38) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  exact lemmaK hP hF hT (bridge_of_primewise38 hK)

theorem replay38 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) (hK : PrimewiseBridge38) :
    ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  first
  | (rh_reduce 2 using [lemmaK_primewise38]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact lemmaK_primewise38 hP hF hT hK

end UpperTheory.V.K

rh_scan UpperTheory.V.K.lemmaK limit 2000
rh_scan UpperTheory.V.K.lemmaK_primewise38 limit 2000
rh_prune UpperTheory.V.K.replay38 as RHAudit38Pruned
#print axioms UpperTheory.V.K.kernel_transport38
#print axioms UpperTheory.V.K.bridge_of_primewise38
#print axioms UpperTheory.V.K.lemmaK_primewise38

end
