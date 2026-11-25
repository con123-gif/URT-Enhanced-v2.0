/-!
RUN34, lane 5, 2026-11-25. Human reduction; Lean certificate PREPARED, NOT COMPILED.
Mission blob cd0a176134d46b5b624896e56843a24915c14477.
Native pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream latest observed
91b273530883b723ef4422436e0dc3557749325a (16:29:57 UTC); no mixed revisions.

RESULT: remove the entire character-count factor in the principal-host
singleton-reference CountI estimate, replacing it by at most TWO.

Fix the actual same principal host, e, odd coefficient prime l, CaseI,
c, Omega, embedding iota, and K=Q(sqrt(-7)), with all GD and host guards.
Use the living manuscript's singleton z=1 at a reference prime p=1 mod N
with p != l and p coprime to 30*N*disc(K), common place w and Frobenius.
Retain Linnik and the uniform NumberU3U_s integer n_p. Do not change
the original auxiliary-prime existence/host guards.

Strengthen the *construction*, not the bare proposition OneCharU_s:
in FOneCharU.oneChar_unramU retain, for every f in T, the residual
trace congruence coming from isPt_push D hM S f (hT.1 f hf).1.
IsPtOf proves integral entries and entrywise norm <1 of the difference
from r0 D.eta D.PsiQ for every g. The restricted rhoK therefore has
integral traces and, over the common residue field k of the valuation
ring of Qbar_l,
  red(tr rho(g)) = 1 + a_psi(g) + a_psi(g)^(-1), g in G_K,
where a_psi is red(D.PsiQ restricted to G_K). This is the same diagonal
trace identity used in FOneCharU.htr, now modulo the maximal ideal.
DatFacts identifies D.Psi as the product of chiO^e and dirG psi.
For ramified coefficients the actual public theorem's h4 identifies
the full embedded Psi for every g under descent; coefIndep identifies
Vlen and Vn. Thus the congruence can be retained on the existing
T.image rho, without a new selection of points or a new model.
This is a source-matched human argument, not yet a checked Lean
strengthening of OneCharU_s.

For characters psi,psi' yielding isomorphic representations,
their traces coincide over Qbar_l (no integral conjugator required).
Their residues give a+a^(-1)=b+b^(-1) pointwise. Cancel exactly:
  (a-b)(ab-1)=0.
The two subgroups ker(a/b), ker(ab) cover G_K. A group is not a union
of two proper subgroups: choose elements in opposite differences;
their product is in neither. Hence b=a globally or b=a^(-1) globally.

The map psi -> a_psi is injective at the fixed e and l: cancel the
common cyclotomic factor; the ratio has prime-to-l finite order by GD.
Reduction is injective on roots of unity of prime-to-l order: if
z^m=1 and red(z)=1, then (z-1)(1+...+z^(m-1))=0, second factor a
unit since red=m !=0. Thus equality of residual restrictions implies
equality of the characteristic-zero restrictions. K intersects
Q(zeta_N) trivially: K is quadratic of discriminant -7, ramified at 7,
and GD.cop ensures 7 does not divide N; Q(zeta_N) is unramified there.
Consequently G_K surjects onto Gal(Q(zeta_N)/Q), and restrictions of
Dirichlet characters are injective. All these arguments concern the
same host, not a union over different N or e.

Each isomorphism class occurs at most twice across the finite X_psi;
within X_psi uniqueness is the original FOneCharU conclusion.
At p=1 mod N the reference trace t is independent of psi. Put
w(rho)=vl_l(tr rho(sigma)-t); these are nonnegative (integral traces
and integral t) and finite by the original nonvanishing supplier.
Choose one representative per class in union X_psi. Trace invariance,
multiplicity <=2, and the original model bound give
  A_l := sum_psi Vn_l(e,psi) <= 4 sum_[rho] w(rho) <= 4 v_l(n_p).
Last inequality: singleton NumberU3U_s, FPropGKU.vl_bound; the union
has pairwise nonisomorphic reps in the same admissible class. There
is no requirement for a single common representation classifier at
different reference primes. Patch n_p,n_r by RUN25's gcd with the
opposite reference-prime factors at p and r. Then, for every finite
eligible coefficient-prime set L,
  sum_{l in L} log(l) A_l <= 4 log B,
  log B <= c [N(e+1)]^A (log p+log r).
The old singleton estimate multiplied the RHS by the number of
characters (up to D/2, D=2^(E+2)). New factor 2 instead, uniformly.
Do not infer the full VWinAt(1,401) from this CountI improvement.

Original graph (source-level, not complete kernel DAG):
CountI <- propGK <- OneCharU_s + NumberU3U_s; singleton route
multiplies valuation budget by character count. Reduced graph:
same suppliers and actual local-point witnesses -> residue trace
identity -> inversion-orbit lemma -> multiplicity-two union ->
singleton budget -> RUN25 patch -> CountI bound.
Unresolved: checked residual strengthening through rhoK and coefficient
descent; exact native singleton caller and finite union bound; all
CohInp, LemmaM/M'/P, KatoTwoW, rigidity, AdmI_s, automorphy,
NumberU3U_s, Linnik, and remaining same-host VWinAt and analytic leaves.
No axiom evidence for the new certificate until native replay.
No claim of deleting native edges before that replay.

Source root src/Development/AutomorphicArithmetic/AutomorphicVarieties:
ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean
3560d196d696e5ebceded72e747a060392837b91 (lines 38-70,78-89);
same directory FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970;
NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258;
UnitaryThreeGroups/IsPtOf.lean bdbc6364c883af07a4ca6a86e51480bdb9b458bb (124-148);
UnitaryThreeGroups/DatFacts.lean f04c55abe16956e3d4458c410131568df631149f;
UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674;
HeightAndVanishing/GdOfHost.lean 8ab8e7e79a09e2d7f00292d525733fac8badfae2.
Peer live manuscript blob 464e82f81f646d4af85e1f5f70d379026df46261;
orbitwise trace ideal bee10e755d41edb14eb216caf0ca5857e29df6ef;
RUN34 acceleration batch 7fb90ebe78f7630168bafe8ab9f567f673c410da.
No duplicate of rank-two restriction or global trace-ideal proposal.

ACTUAL EXECUTION: fetched and checked five pinned blobs, 12 source
anchors. Finite regression over C_(p-1)^2, p=3,5,7,11,13,17,19,23,29,31,
37,41,43: enumerate all (a,b) in F_p^* squared, build vector
(a^i b^j + (a^i b^j)^(-1)) for 0<=i,j<p-1, group by vector; check every
collision is equal or simultaneous inverse. 7708 characters, 3828
colliding unordered pairs, maximum fiber 2. This tests the algebra,
not any RH data or infinite quantifier. Reproduction: run the stated
loops with modular inverse from extended Euclidean algorithm.
No local Lean/lake. Prior CI 45577239749 and 45576756833 confirmed
only baseline engines. New Landau run 45652878741 status error:
RH32SingletonPoleData.lean line 175 measurable-composition type mismatch,
unqualified scans missing names, sorryAx. Not a new PASS.
RUN30-33 arithmetic batch remains uncompiled: blobs
d3c80ae959ab812560417ce9da85268fe53957d1,
214ec355f277c8b5655e3a26a593d52b8f7d5b44,
688a2d933dd0614f9e8b02bb238ab3c54038c0f1,
50fc2e07ad351261c164ff05104050a8d677b411.
Use shared prebuilt pinned native import environment and engine; compile
each independently and retain exact logs, no duplicate engine build.
No runtime speedup/URT improvement established. New native closures 0.

RESUME HERE: preserve the residual predicate in both the private
oneChar_unramU and public coefficient-descent construction; prove
rhoK trace reduction and prime-to-l root reduction, K-cyclotomic
restriction, finite union weighted fiber inequality. Run this
certificate and RUN30-33 in the existing native batch, using
rh_scan/rh_prune on the actual context and rh_reduce/rh_auto/frontier
on the new obligations. Audit the exact NumberU singleton caller.
Do not treat the algebra certificate below as the native bridge.
-/
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FOneCharU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU
import RHRecursiveReductionAutoV3
import RHProofTermPrune

namespace RHGalois34

theorem trace_factor {k : Type*} [Field k] (a b : k)
    (ha : a ≠ 0) (hb : b ≠ 0) (h : a + a⁻¹ = b + b⁻¹) :
    a = b ∨ a * b = 1 := by
  have hf : (a - b) * (a * b - 1) = 0 := by
    calc
      _ = (a + a⁻¹ - (b + b⁻¹)) * (a*b) := by
        field_simp [ha, hb] <;> ring
      _ = 0 := by rw [h, sub_self, zero_mul]
  rcases mul_eq_zero.mp hf with h0 | h0
  · exact Or.inl (sub_eq_zero.mp h0)
  · exact Or.inr (sub_eq_zero.mp h0)

theorem inversion_global {G k : Type*} [Group G] [Field k]
    (a b : G →* kˣ)
    (h : ∀ g, (a g : k) + ((a g : k)⁻¹) =
       (b g : k) + ((b g : k)⁻¹)) :
    (∀ g, a g = b g) ∨ (∀ g, a g * b g = 1) := by
  classical
  have hloc : ∀ g, a g = b g ∨ a g * b g = 1 := by
    intro g
    rcases trace_factor (a g : k) (b g : k)
      (a g).ne_zero (b g).ne_zero (h g) with he | he
    · exact Or.inl (Units.ext he)
    · exact Or.inr (Units.ext (by simpa using he))
  by_cases h1 : ∀ g, a g = b g
  · exact Or.inl h1
  · right
    push_neg at h1
    obtain ⟨g, hg⟩ := h1
    have hg' := (hloc g).resolve_left hg
    intro x
    by_contra hx
    have hx' := (hloc x).resolve_right hx
    rcases hloc (g*x) with hprod | hprod
    · rw [map_mul, map_mul, hx'] at hprod
      exact hg (mul_right_cancel hprod)
    · rw [map_mul, map_mul] at hprod
      have hmul : (a g * b g) * (a x * b x) = 1 := by
        calc
          _ = (a g * a x) * (b g * b x) := by ac_rfl
          _ = 1 := hprod
      rw [hg', one_mul] at hmul
      exact hx hmul

#print axioms trace_factor
#print axioms inversion_global
end RHGalois34
-- Native engine commands are to be run in the exact existing batch syntax,
-- on fully qualified declarations:
-- RHGalois34.trace_factor, RHGalois34.inversion_global,
-- UpperTheory.V.U3.isPt_push,
-- UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy.
