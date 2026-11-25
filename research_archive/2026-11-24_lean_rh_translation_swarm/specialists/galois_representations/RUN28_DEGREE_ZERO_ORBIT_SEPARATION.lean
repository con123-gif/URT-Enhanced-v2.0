import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.ModelUpper
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.MainCotSpan
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN28 — degree-zero orbit separation (lane 5, 25 Nov 2026).
RESULT: human proof of a local premise weakening and exact audit of RUN27's
distinct-support sum. Lean bridge prepared, NOT compiled. RH remains OPEN.

Integration-ready proof block (not a separate RH manuscript):
Let A be the native Z-graded O-algebra, I the homogeneous ideal of Q,
K the algebraically closed coefficient field. Write A_j for its weight-j
submodule and B=image(A_0 -> A/I). By M2, B is a finite O-algebra.
For two-signed points xi,xi' on I, the following is an equivalence:

    res0(xi)=res0(xi')  <=>  xi'=act(t) xi for some t in K^*.

Proof: native sign_holds supplies f in A_-2, g in A_2 with xi(f)xi(g)!=0.
The degree-zero equality forces xi'(f)xi'(g)=xi(f)xi(g)!=0. Choose t with
t^2=xi(f)/xi'(f), and replace xi by eta=act(t)xi. Then eta(f)=xi'(f);
since fg has weight zero, eta(g)=xi'(g) too. For a in A_(2k), multiply
by f^k when k>=0 and by g^(-k) otherwise. The product is weight zero
and the multiplier has equal nonzero value, so eta(a)=xi'(a).
For any homogeneous odd-weight h, h^2 has even weight, hence eta(h)^2
=xi'(h)^2. If eta vanishes on every odd component, so does xi', and
the maps agree. Otherwise choose one odd h with eta(h)!=0. The square
equality gives eta(h)=+/-xi'(h). Replace eta by act(-1)eta if necessary
so that the values on h agree. This does not change any even-weight
value. For any odd a, ah has even weight; cancel the common nonzero
value of h to conclude equality. Direct-sum decomposition gives equality
on all A. Conversely the torus action fixes degree zero. No M3, M4,
DVR tangent calculation, diagonalizability or positivity is needed for
this separation beyond the native sign_holds and algebraic closure.

Consequences (actual source consumers, not a new RH criterion):
1. The set of restrictions of on-I two-signed points is finite: each
   restriction factors through B; after inverting O\{0}, B_F is a
   finite-dimensional F-algebra for F=Frac(O). Its K-valued maps are
   finite: B_F tensor_F K is finite-dimensional and Artinian, so the
   number of residue maps to K is at most dim_F B_F. This also follows
   by linear independence of distinct field-valued algebra maps.
   Choose one two-signed point per realized restriction. The displayed
   equivalence gives Covers, with no use of M4 in this *existence*
   branch of fin_holds. No need to lift unrealized restrictions.
   Thus the finite cover can be obtained directly from M2 and sign_holds,
   with the original IsWRing/field/DVR premises for sign_holds.
2. In native model_upper the output T is torus-conjugacy-irredundant
   (hirr); for f,f' in T with res0(f comp M.q)=res0(f' comp M.q),
   the actual hcov gives two-signed points and the equivalence gives
   an action relating them. The native hac turns this into conjugacy,
   and hirr gives f=f'. Hence the map res0 o (fun f => f.comp M.q)
   is injective on this actual T. In particular
       sum_(sigma in res0(T')) v(sigma(a)) = sum_(f in T) v_lifts(trDiff(f)).
   v_lifts here is the valuation v= eO * vl, before normalizing.
   RUN27's distinct-degree-zero sum is EXACTLY the old sum on the
   actual selected cover. It is NOT a strict numerical improvement
   of CountI. It removes an inequality/repeated indexing only.
3. Equal trace values alone do not imply equal degree-zero maps.
   The trace classifier must still distinguish nonisomorphic reps;
   retain NumberU's label multiplicities. The global all-prime bound
   requires the actual NumberU and OneChar suppliers.

Compact direct cover argument for the manuscript: degree-zero values
classify two-signed torus orbits (normalize a nonzero weight -2 value,
then compare even products and one odd product). M2 makes their
degree-zero algebra finite over the DVR, hence there are finitely
many such orbits. The valuation sum already uses one representative
per orbit. This replaces the cover existence slice calculation only.
The native locLen_quotientWeightPiece_le_one still uses slice_holds to
remove nilpotents (via M4); therefore M4 and slice_holds remain on the
original root-reachable branch. No global binder or dependency removal.

Provenance:
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; current mission blob
b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF bbc46df7d7716a6d8863275b5271801eacfaad0d, AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972.
Read EXPANSION, continuity/state/protocol excerpts, RUN25-27,
and live HUMAN_PROOF_ONE_EQUATION.md (blob f101edec638db5e7d6b3cfbc7907687fc4e15c6e),
peer 77abd181 (fixed degree Vs), 23aa8c56 (CaseIV vanishing),
309d46a7 (odd budget), 16a43410 (LemmaM). No duplicate of their reductions.
All following paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
UnitaryThreeGroups/ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44
CommutativeAlgebra/OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15
CommutativeAlgebra/GradedModulesLength/FinHolds.lean 6fe49e1289a90866bc8810f83979cf7b12e966ea
CommutativeAlgebra/GradedModulesLength/TwoSigned.lean c2460a5a728ec42562e60d678237aa4f8051ec53
CommutativeAlgebra/GradedModulesLength/MainCotSpan.lean 52e45205d53b2e339e7467f91fab3fb015b438da
CommutativeAlgebra/GradedModulesLength/SignHolds.lean 2412ef761014700f9fb91f651a7abef8f33e2810
CommutativeAlgebra/GradedModulesLength/LocLenQuotientWeightPieceLeOne.lean 74f993dd39166d346ca21681890f0deb9f25ed30
Also inspected SliceHolds 0f4347bf89016fe7f63ce6aeaed14c849f57d135,
TspHolds e759039bb840d3615025ce38f00eed29f91255ee, FtHolds b089614b9ad7f74b8b6fe7582796f4351fcf60aa.
Upstream head observed 251c7b05dd869ceba1aa42c6001c00b4010f23f9 at
10:33:41 UTC. Five same-path blobs changed; FinHolds and
LocLenQuotientWeightPieceLeOne same-path fetches returned 404. ModelUpper
new blob 982b9bd6ee592d5bcd249a85fd55a619cfc38490 retains actual hcov,
hinj, hineq consumer; no full cross-version equivalence asserted.

Original source-call graph (not elaborated):
Main -> ... -> CountI -> OneCharU -> model_upper -> LemmaM -> main_holds
 -> fin_holds -> slice_holds [M4], and
 -> core_holds -> up_holds -> locLen_quotientWeightPiece_le_one -> slice_holds [M4].
Candidate replaces only the fin_holds cover branch by
M2 -> finite res0 image -> orbit separation <- sign_holds.
Original graph, surviving M4 and all arithmetic suppliers retained.
Cache context: (pin, O,K,A,grading,I, x, M2, two-signed support, caller).
Do not conflate equal trace with equal res0. Backtrack to native fin_holds
if formal replay of replacement fails. No URT ranking benefit tested.

Executed: fetched seven pinned exact blob hashes and checked 21 literal
source anchors in V8; compared seven current-head paths as above.
Re-fetched actual published CI status for 45577239749 (pass 98.87s)
and 45576756833 (pass 77.94s), with classical axiom evidence limited to
the earlier engine and half-strip adapter. No local Lean/Lake executable,
no new kernel run or new CI result, no synthetic tests.
The following Lean certificate prepares the exact image-injectivity and
sum interface conditional on the separation lemma. The separation and
finite-image proof above are human mathematics, not yet elaborated;
the prepared conditional certificate does not claim to discharge them.
Use pinned Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474
and the existing reduction engines on a built pinned source checkout.
Run lake env lean -DwarningAsError=true <this file> with engine oleans
on LEAN_PATH; preserve errors, native scans and axiom outputs.

RESUME HERE: formalize the even/odd normalization separation and the
finite-image lemma from M2, then replay the original fin_holds bridge
and the actual model_upper image equality. Retain M4 in the other
consumer. After audit, attack NumberU finite trace-classifier suppliers
rather than repeating the determinant/orbit sum. HANDOFF TO integration,
kernel, dependency, audit, Galois.
-/

open UpperTheory.V.Alg UpperTheory.V.Alg.M

section
variable {O A K : Type} [CommRing O] [CommRing A] [Algebra O A]
    (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] [Field K] [Algebra O K]

-- Native restriction definition; no assumptions on the valuation.
theorem rh_res0_same0 {ξ ξ' : A →ₐ[O] K}
    (h : res0 𝒜 ξ = res0 𝒜 ξ') : Same0 𝒜 ξ ξ' :=
  fun b hb => DFunLike.congr_fun h ⟨b, hb⟩

-- Exact input for replacing hsum in the actual two-signed consumer.
-- hsep is the HUMAN lemma above, not assumed closed by this certificate.
theorem rh_res0_inj_on_cover (I : Ideal A) (T : Finset (A →ₐ[O] K))
    (hT : Covers 𝒜 I T)
    (hsep : ∀ ξ ξ' : A →ₐ[O] K, TwoSigned 𝒜 ξ →
      Same0 𝒜 ξ ξ' → SameOrbit 𝒜 ξ ξ')
    (hirr : ∀ ξ ∈ T, ∀ ξ' ∈ T, SameOrbit 𝒜 ξ ξ' → ξ = ξ') :
    Set.InjOn (res0 𝒜) (T : Set (A →ₐ[O] K)) := by
  intro ξ hξ ξ' hξ' he
  exact hirr ξ (by simpa using hξ) ξ' (by simpa using hξ')
    (hsep ξ ξ' (hT.1 ξ (by simpa using hξ)).2 (rh_res0_same0 𝒜 he))

theorem rh_res0_sum (I : Ideal A) (T : Finset (A →ₐ[O] K))
    (hT : Covers 𝒜 I T)
    (hsep : ∀ ξ ξ' : A →ₐ[O] K, TwoSigned 𝒜 ξ →
      Same0 𝒜 ξ ξ' → SameOrbit 𝒜 ξ ξ')
    (hirr : ∀ ξ ∈ T, ∀ ξ' ∈ T, SameOrbit 𝒜 ξ ξ' → ξ = ξ')
    (v : K → ℝ) (a : 𝒜 0) :
    (∑ σ ∈ T.image (res0 𝒜), v (σ a)) = ∑ ξ ∈ T, v (ξ a) := by
  classical
  rw [Finset.sum_image (rh_res0_inj_on_cover 𝒜 I T hT hsep hirr)]
  rfl

-- This is the actual cover injectivity premise; search uses the replacement
-- rule above, not the claimed RH theorem. No PASS until execution.
theorem rh_res0_inj_rule (I : Ideal A) (T : Finset (A →ₐ[O] K))
    (hT : Covers 𝒜 I T)
    (hsep : ∀ ξ ξ' : A →ₐ[O] K, TwoSigned 𝒜 ξ →
      Same0 𝒜 ξ ξ' → SameOrbit 𝒜 ξ ξ')
    (hirr : ∀ ξ ∈ T, ∀ ξ' ∈ T, SameOrbit 𝒜 ξ ξ' → ξ = ξ') :
    Set.InjOn (res0 𝒜) (T : Set (A →ₐ[O] K)) := by
  first | rh_reduce 3 using [rh_res0_inj_on_cover] | exact rh_res0_inj_on_cover 𝒜 I T hT hsep hirr

theorem rh_res0_inj_auto (I : Ideal A) (T : Finset (A →ₐ[O] K))
    (hT : Covers 𝒜 I T)
    (hsep : ∀ ξ ξ' : A →ₐ[O] K, TwoSigned 𝒜 ξ →
      Same0 𝒜 ξ ξ' → SameOrbit 𝒜 ξ ξ')
    (hirr : ∀ ξ ∈ T, ∀ ξ' ∈ T, SameOrbit 𝒜 ξ ξ' → ξ = ξ') :
    Set.InjOn (res0 𝒜) (T : Set (A →ₐ[O] K)) := by
  first | rh_auto 3 | exact rh_res0_inj_on_cover 𝒜 I T hT hsep hirr

theorem rh_res0_inj_frontier (I : Ideal A) (T : Finset (A →ₐ[O] K))
    (hT : Covers 𝒜 I T)
    (hsep : ∀ ξ ξ' : A →ₐ[O] K, TwoSigned 𝒜 ξ →
      Same0 𝒜 ξ ξ' → SameOrbit 𝒜 ξ ξ')
    (hirr : ∀ ξ ∈ T, ∀ ξ' ∈ T, SameOrbit 𝒜 ξ ξ' → ξ = ξ') :
    Set.InjOn (res0 𝒜) (T : Set (A →ₐ[O] K)) := by
  rh_auto_frontier 3
  all_goals exact rh_res0_inj_on_cover 𝒜 I T hT hsep hirr
end

rh_scan UpperTheory.V.U3.model_upper limit 2000
rh_prune UpperTheory.V.Alg.M.fin_holds as RHNativeFinCoverReduced
rh_scan UpperTheory.V.Alg.M.fin_holds limit 2000
rh_scan UpperTheory.V.Alg.M.locLen_quotientWeightPiece_le_one limit 2000
rh_scan rh_res0_sum limit 2000
#print axioms UpperTheory.V.U3.model_upper
#print axioms UpperTheory.V.Alg.M.fin_holds
#print axioms UpperTheory.V.Alg.M.locLen_quotientWeightPiece_le_one
#print axioms rh_res0_inj_on_cover
#print axioms rh_res0_sum
