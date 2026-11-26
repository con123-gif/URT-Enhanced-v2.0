import New.Columns.LocalStatement

/-!
# Theta lane RUN50 — compact theorem A: exact collision sum and zero-index bypass
26 November 2026. SOURCE-MATCHED HUMAN DERIVATION; Lean candidate PREPARED, NOT COMPILED.
Latest ONE_EQUATION_MISSION.md blob 3731f12ed73e738313fd7f93a30759d9086141e9
migrates primary work to compact source lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude per upstream.
Old RUN49 and original graph/axioms remain archival, not carried across toolchains.

Exact source blobs (19 blob/anchor assertions executed in connector V8):
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
New/Seesaw/SeesawTheorem.lean 0e6f5541f15ddb75c30751d22163bfdbd4194d91

Source context: one fixed native Data P, prime p, and empty excluded set.
Let t = #D.tops, o = D.o₀ p (positive order of the class of -p in the
finite place-class group), a = D.a. Do not change the Data witness, the
seesaw scalar, the prime, the twist family, or the ramified columns.

I. Exact aggregate collision sum, not a bound by all f places.
Native IsCollision.ne_and_odd_and_dvd and placeOfInt_mul_mem_tops_iff
give
  IsCollision p ∅ τ e iff τ in tops AND Odd e AND o divides e.
Forward: drop the empty excluded set and use the first native lemma.
Reverse: odd e implies e>0; the second lemma gives membership of the
translated top, and the native definition gives the collision.
Thus no collision at p=d (first native lemma). For even o there are no
odd multiples. For odd o, precisely e=o(2j+1), j=0,1,... contribute
for each top; no other place contributes. Since p>=2 and o>=1, the
series is absolutely convergent. Interchange the finite place sum
and geometric series, and sum before any norm estimate:
  C := D.collisionSum p ∅
    = 0                                  if o is even
    = t*a*p^o/(p^(2o)-1)                 if o is odd.
The p=d case is zero directly (if o is odd the iff would force t=0).
In the odd case, C <= (4/3)*t*a/p^o, since p^(-2o)<=1/4.
The exact identity uses the native top restriction, not independent
estimates for each place. The Lean support lemma below is prepared;
the geometric-series reindexing proof is human-derived only.

II. Actual local caller reduction (including served primes).
Let L=D.loss p, G=D.gain p, C as above. For every good datum Ψ, every
twist ϑ prime to p, and every integral column φ, native
gaugeLe_collisionSum bounds the gauge of BμϑΨφ by p^(m*C+L-G).
For the EXACT integer β passed by Theorem A, if
  m*C+L-G <= -β,
multiplication by p^(-β) multiplies its p-adic gauge by p^β.
Hence the gauge is <=1. All columns work; take S=integralColumns,
l=0, IndexDvd by p^0=1. The same S works for every twist and Ψ.
In particular the native β< G-3L+1 is sufficient whenever
  m*C <= 2L-1.
The extra unit is necessary for this generic rounding argument:
do not use m*C<=2L without checking β. Actual β=ceil(G-3L)
when p is nonsplit; A uses -floor(3L-G). For an odd o the new
sufficient branch condition is the explicit scalar inequality
  m*t*a*p^o <= (2L-1)*(p^(2o)-1).
For even o use 0<=2L-1. At p=d C=0. This can be checked BEFORE
constructing any marked set. For served primes satisfying it,
the native markOperator, its power, and the index proof are not
needed for this local caller. No assertion that every served
prime or even a particular native Data satisfies this criterion.
When it fails retain the original marked/unserved proof unchanged.
For p=N or outside the small nonsplit set retain original branches.
The published A estimate remains the same; no new global error
exponent or measured speedup claimed. The new candidate is a
premise-weakening branch, not a proof of the underlying gauge lemma.

III. Reachability and verification.
Static source context keys:
  (compact pin, Data P, p, padic place, β, ϑ, Ψ, integral φ).
Original observed selected spine:
  Main.riemannHypothesis <- New.grh <- eventually_primeError_le_rpow
  <- star_inequality <- Data.exists_family_covolumeSq_le
  <- Data.short_forms <- Data.exists_indexDvd_Bmu_divisible
  <- [exists_isMarked; hasType_prod_markOperator_pow;
      gaugeLe_Bmu_of_isMarked; gaugeLe_pow_jetCeil_smul] or unserved branch.
Proposed additional branch at the last caller:
  exact collision support -> geometric sum -> scalar condition
  + gaugeLe_collisionSum -> full integral lattice (index zero).
Original branch remains reachable on its complement. Seesaw,
size, B, C and analytic suppliers unchanged. No global dependency
deletion; no new accepted axioms. #print axioms commands prepared.
Peer head read through 10d0bbef; kernel RUN26 de382b26 owns shared
native compact replay, integration 284991cd fixed modulus,
geometry 7ffc9e07 / 5fb8da26 filling, structure c3e303c2 factorial.
No duplicate build or old-route Haar calculation. Native compact
graph status actually read: blob ea44d71556e0d21703e72fcd61bbaf2bee0ec563,
CI run 45781154005, returncode 1, RESOURCE_BLOCKED (runner below
publisher recommendation), before compilation; old shared run
45773743341 also failed before caller compile (Unicode import).
Lean/Lake absent locally. rh_scan/rh_prune/rh_reduce/rh_auto/
rh_auto_frontier unavailable on the compact environment; historical
4.33.1 engine success not evidence for 4.35.0. No local or new
native PASS; no root leaf retired. External formal proof status
distinct from incomplete human reconstruction.

RESUME HERE: after shared compact build availability, run
  cd grh-compact && lake env lean /absolute/path/to/this/file
and use native scan/prune + bounded reduction on actual
Data.exists_indexDvd_Bmu_divisible, with the new branch. Prove the
exact geometric reindexing in Lean, independently audit the
rounding and evaluate the criterion on the same admissible Data
scale if possible. Test actual A caller and retain all fallback
dependencies. HANDOFF TO kernel, audit, integration, editor.
-/

open Polynomial Finset Gf Kernel Module Parameters Real Submodule

noncomputable section

variable {P} {D : Data P} {p : ℕ} [Fact p.Prime] [PadicPlace p]

lemma Data.collision_empty_iff_RHTheta50 (τ : D.Φ) (e : ℕ) :
    D.IsCollision p ∅ τ e ↔ τ ∈ D.tops ∧ Odd e ∧ D.o₀ p ∣ e := by
  constructor
  · intro h
    have H := h.ne_and_odd_and_dvd
    exact ⟨by simpa using h.2.1, H.2.1, H.2.2⟩
  · rintro ⟨hτ, ho, hd⟩
    have he : 0 < e := by
      obtain ⟨k, hk⟩ := ho
      omega
    have ht := (D.placeOfInt_mul_mem_tops_iff ho τ hτ).2 hd
    simp [Data.IsCollision, he, ho, hτ, ht]

/-- Exact no-repair branch. Stronger output: index exponent exactly zero. -/
lemma Data.exists_indexDvd_Bmu_divisible_noRepair_RHTheta50 {β : ℤ}
    (h : D.IsSmallNonsplit p)
    (hb : D.m * D.collisionSum p ∅ + D.loss p - D.gain p ≤ -(β : ℝ)) :
    ∃ l : ℕ, l = 0 ∧ ∃ S,
      IndexDvd D.integralColumns S (p ^ l) ∧
      ∀ ϑ Ψ, D.IsGoodDatum ϑ Ψ → p.Coprime ϑ.levelNorm → ∀ φ
      ∈ S, φ ∈ D.ramifiedColumns →
      (p : ℂ) ^ (-β) • D.Bμ ϑ Ψ φ ∈ integralFormsAt ⊤ 1 := by
  refine ⟨0, rfl, D.integralColumns, by simp, ?_⟩
  intro ϑ Ψ G Q φ c _
  exact ⟨⟨⟩, fun g ↦ by
    erw [weylGauge_smul]
    grw [G.gaugeLe_collisionSum Q c h g, hb]
    <;> simp [norm_p_eq_inv, rpow_neg, NeZero.one_le, NeZero.ne]⟩

/-- The unit slack is enough for the original strict ceiling guard. -/
lemma RHTheta50_rounding (m C L G : ℝ) (β : ℤ)
    (hβ : (β : ℝ) < G - 3 * L + 1)
    (hC : m * C ≤ 2 * L - 1) :
    m * C + L - G ≤ -(β : ℝ) := by
  linarith

#print axioms Data.collision_empty_iff_RHTheta50
#print axioms Data.exists_indexDvd_Bmu_divisible_noRepair_RHTheta50
#print axioms RHTheta50_rounding
