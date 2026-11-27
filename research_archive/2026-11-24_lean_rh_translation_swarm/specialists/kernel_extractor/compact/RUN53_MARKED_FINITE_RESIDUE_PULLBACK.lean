import New.Columns.TwistedHeckeType
import Mathlib.Tactic

/-!
# RUN53 — finite residue lift replaces the second adelic approximation
27 November 2026. SOURCE-MATCHED human replacement; native certificate
PREPARED, not compiled. Credit Alpöge, Sernau, Anthropic collaborators and
Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained, no cross-pin claims.

Read latest mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7,
live spine 67e542df1b5557b2e1314643931ef1355bbdc50d and ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d. A1/V1 assigned to kernel.
AGENTS, swarm protocol, handoff and lanes read. Latest peer head
263f17633 (marked jet frame), integration b68f22f4 (exchange sign),
78cb4221 (B2 batch), theta f1abc81e (log-free marked bound), prime
cbe15af7 (size guards). RUN52 exact normalization is not reopened.
Theta RUN63 a599aa5c section 2 already proves the pullback using the
native global approximation; own RUN49 19a5089a audits orientations.
This run replaces just the second approximation occurrence, at the
actual last goal of Columns.hasType_markOperator. The first occurrence
for integral class representatives is retained. No duplicate bound.

Source ledger relative to grh-compact/src:
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  Columns.hasType_markOperator, local hP, delta and final support goal
  (choose k₁ ...; choose γ ... using exists_mul_mem_integralAbove ...).
Lib/Adelic/CuspForms/ClassReps.lean ae1cca5dba16666224c91ff6a90eaaec2e1e5b33
  exists_mul_mem_integralAbove, exists_reps_integralAbove.
Lib/Adelic/Landherr/WeakApprox.lean e8816c3371564926a990319105823b644028e9e1
  weak_approximation (retained for the first occurrence).
Lib/Adelic/Hecke/HeckeBasic.lean d166991c495c40b0b5c2280a8822bcbb6806f41b
  heckeFun_eq_sum_pullback, actual support-coverage premise.
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  IsMarked.hasType_markOperator; LocalStatement.lean
  9d5bd0d698b0db2850cbd306d8d400d7e99a3547 uniform caller.

## Exact weaker supplier at the support-coverage goal

Let W be the rational valuation ring at the actual marked place l,
K_l the completed field, O_l its integers, p the uniformizer
(the native L.valuation_p premise), and j the completion embedding
after the fixed reindexing q. Put r=ceilLogM(p), d=diag(p I_r,I).
Let J=GL_k(W), K=GL_k(O_l), and P={b in J : d^-1 j(b) d in K}.
For b,b' in J, the native delta_x(b)=rho_x(l)^-1 j(b) d
has delta_x(b)^-1 delta_x(b') in K iff b^-1 b' in P.
The native hP proof identifies P with parahoric(W,twoBlock(k,r)).
Keep the integral representatives rho_x from RUN63 section 1.

The new supplier is only the surjectivity of the residue map on
integral matrices. Prove it directly: for any a in O_l, density of E
in its completion provides a rational b with a-b in p O_l. Since
a and a-b are integral, b is integral and hence lies in W. Thus
W -> O_l/pO_l is onto, and the kernel is pW since p is a uniformizer
of W and the embedding preserves valuations. This is a single-place
completion fact, not adelic unitary weak approximation.
Lift each entry of a matrix A in K through this residue map. The
result B in Mat_k(W) has determinant reducing to det(A) != 0, hence
det(B) is a unit of the local ring W. The adjugate gives B^-1 over W.
This proves J -> GL_k(O_l/pO_l) is onto; no lifting of rational
unitary matrices or any simultaneous condition at other primes.
Equivalently j(B)^-1 A belongs to K(1)=ker(K -> GL_k(residue)).

For any z in K d K (the actual basicDoubleCoset), write z=k1 d k2
with k1,k2 in K. Take A=rho_x(l) k1 in K and lift its residue as
above to b in J. Then C=j(b)^-1 A lies in K(1).
Both C and C^-1 are congruent to I mod p (reduce their product).
In block notation d^-1 C d has blocks
    [ C11       p^-1 C12 ]
    [ p C21     C22     ].
Every block is integral since C12 is divisible by p. Apply the
same argument to C^-1. Consequently d^-1 C d belongs to K.
There is no special assumption r>0 or r<k; zero blocks work.
The decisive exact equality at the real caller is
    delta_x(b)^-1 z = d^-1 C d k2 in K.
Hence delta_x(b) K = z K. This is exactly the coverage premise
of heckeFun_eq_sum_pullback with s=univ, not equality of local
matrices with rational matrices. The already existing hP
supplies injectivity and finiteness of J/P; the last goal
in Columns.hasType_markOperator is now supplied by one finite
residue lift. No new condition on z, x, class level or weight.

The key distinction: the b used here is just a GL_k(W) matrix,
not required to be a globally unitary rational point. The later
gamma_e in the native class decomposition must still be unitary;
that step is NOT replaced. Also no claim that p is a uniformizer
of embValRing (only W and O_l), or that all of K is rational.
For p ramified at l the argument would need a local uniformizer
and corresponding congruence; the native marked valuation guard
is retained. No stronger approximation assumption is added.

## Dependencies and verification boundary
Original occurrence graph: global unitary weak approximation ->
exists_mul_mem_integralAbove -> support coverage; local hP and
class representatives -> support coverage -> heckeFun_eq_sum_pullback
-> hY -> Columns.hasType_markOperator -> A1.
Replacement occurrence: completion density + local-ring determinant
unit + block conjugation -> SAME support coverage -> SAME hY.
The separate global weak-approximation path for exists_reps_integralAbove
remains. Do not mark the declaration globally pruned: this is one
proof occurrence, not an eliminated transitive kernel dependency.
Other frame, class stabilizer, hY weight/Schur and native pairing
suppliers retained. Original/reduced native graphs, role edges,
axiom evidence and all open obligations preserved.
Cache context: pin, l,p,W,O_l, fixed q,r,d,K,P,rho_x, z and its
coset factors; never cache a lift solely by declaration name.

Local command -v lean and lake returned no executable. Native
rh_scan/prune/reduce/auto/frontier unavailable here; old-pin engine
receipts not compact replacement evidence. Re-read published
targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six original B/C theorems with standard three axioms, A module
timeout 124, all_requested_checks_ok=false, full_RH_replay=false.
B2 replay status and b2_native_results.json both absent (404 at
inspection); do not enqueue a duplicate or infer a verdict.
The group cancellation and reduction probes below are PREPARED,
not executed. No new kernel PASS, no numerical diagnostic needed.
No workflow changes. No import of the claimed RH root.
Full RH remains OPEN.

RESUME HERE: port the finite-residue matrix lift and congruence
kernel inclusion into the exact final support goal of
Columns.hasType_markOperator, checking the completion API at the
compact pin and compiling the original-statement caller bridge
with the shared A replay. Do not remove the first approximation
supplier for class representatives. HANDOFF TO theta, audit,
integration/editor, shared runner.
-/

namespace KernelRun53

theorem pullback_cancel {G : Type*} [Group G]
    (rho b d k1 k2 : G) :
    (rho⁻¹ * b * d)⁻¹ * (k1 * d * k2) =
      d⁻¹ * (b⁻¹ * (rho * k1)) * d * k2 := by
  group

theorem same_residue_kernel {G H : Type*} [Group G] [Group H]
    (red : G →* H) (b A : G) (h : red b = red A) :
    red (b⁻¹ * A) = 1 := by
  simp [h]

theorem coverage_of_congruence {G : Type*} [Group G]
    (K : Subgroup G) (rho b d k1 k2 : G)
    (hk2 : k2 ∈ K) (h : d⁻¹ * (b⁻¹ * (rho * k1)) * d ∈ K) :
    (rho⁻¹ * b * d)⁻¹ * (k1 * d * k2) ∈ K := by
  rw [pullback_cancel]
  exact K.mul_mem h hk2

#print axioms pullback_cancel
#print axioms same_residue_kernel
#print axioms coverage_of_congruence
end KernelRun53

#check exists_mul_mem_integralAbove
#check exists_reps_integralAbove
#check heckeFun_eq_sum_pullback
#check Columns.hasType_markOperator
#print axioms Columns.hasType_markOperator
