import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.EHostNumberU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Integration — exact smaller root-of-unity orbit for deep CountV
25 Nov 2026. SOURCE-MATCHED human reduction; Lean candidate PREPARED, not run.
One contribution: integrate math 87f08381's deep CountV assembly with its
actual HostNumber producer and remove the full conductor-totient label cost.
No new RH criterion. No claim the arithmetic or geometry frontier is closed.

## Compact mathematical proof

In the actual EHostNumberU.key, choose p inert in K=Q(i), p>=7,
p not dividing lN, p<=12lN (native exists_p, normV_inert), and the
actual inverse Frobenius phi. Write z0=iota(psi(cls(sigma^-1))) in C
and q=p^2. The reference trace is exactly iota^-1(eis3(q,e,z0)),
where eis3(q,e,z)=q^(-e)z+1+q^e/z. The original key uses ALL
N.totient-th roots of unity as its label family in NumberU3U_s.
The latter hypothesis in NumberU3US explicitly accepts ANY finite
Galois-stable root-of-unity family; it does not require this full set.

Let m=ord(z0)>0. Native z0^(N.totient)=1 implies m divides phi(N).
The actual cyclotomic evaluation is a homomorphism on units; hence
m divides orderOf psi: evaluating psi^orderOf psi=1 at the actual
unit cls(sigma^-1) and applying iota gives z0^orderOf psi=1.
Choose the set of primitive m-th roots (the exact cyclotomic orbit
of z0), size phi(m), instead of all phi(N)-th roots. Every field
automorphism of C permutes this finite set because it fixes 1 and
preserves multiplicative order; the required permutation is its
restriction with inverse induced by the inverse automorphism.
For m=1 the set is {1}; it is never empty. Every root is torsion.
Alternatively use all m-th roots, size m, for the simpler Lean bridge
below. Neither family has to contain any other character's value.

Keep all original admissibility, continuity, inertia/Frobenius,
field embeddings and pairwise RepIso guards from key. For the fixed
embedding of K and finite list of representations, populate only
the single actual label z0 with the image of the native list; all
other labels are empty. The native ker_lift and MatIso argument
ensures injectivity and nonisomorphism, without changing the family.
NumberU3U_s then gives one nonzero integer NN with
    log|NN| <= a*phi(m)*(N*(e+1))^b*log p
and |NN|_l <= product_i |tr(r_i(phi))-tr(rz(phi))|_l.
The integer and all trace differences are nonzero by that very input.
Taking negative logs of the exact product, before any bound, yields
    sum_i [-log |tr(r_i(phi))-tr(rz(phi))|_l]
          <= -log|NN|_l <= log|NN|.
The last inequality is the native elementary integer norm inequality
(abs(NN) >= l^v_l(NN)). No triangle inequality on traces.

The native hostNumberUE_alt partitions the list according to the two
embeddings K -> Omega. The reference z0, hence m, is independent
of that partition: z0 was defined over Q from the same sigma,
psi, and iota, before the embedding of K is chosen. Applying key to
the two fibres therefore yields, with the original normalization,
    S := (sum_i vl1_l(trace difference_i))*log l
       <= 2*a*phi(m)*(N*(e+1))^b*log p.
The single phi works for all lists, exactly as in hostNumberUE_alt:
p, B and sigma precede the arbitrary r. The integer may depend on
the orbit, embedding and fixed data; the constants a,b and the
inequality do not depend on any list or DVR.

Peer 87f08381 and CountVOf.arith give Vn*log l <= 2*S (division
by the ramification index cancels its factor; keep the zero branch
of the native real-division convention and finiteness from vlen_le).
Consequently the integrated, strictly smaller local budget is

    log(l)*Vn <= 4*a*phi(m)*(N*(e+1))^b*log p.           (*)

For a principal base host the actual quotient is a 2-group.
Native hostComp gives orderOf psi | 2^(ex+1)*o and o=1;
the already derived exact quotient C_(2^ex) x C2 x C2 improves
this to orderOf psi | 2^ex. Thus m is a power of two and
phi(m)<=max(1,2^(ex-1)), versus the full phi(N) factor. The
weaker native hostComp bound alone gives phi(m)<=2^ex, so there
is no dependence on the sharper CRT reconstruction for validity.
The two auxiliary primes q1,d still enter N and p, and their
admissibility guards are retained. The factor phi(m) is at most
phi(N) since m divides phi(N) and phi(m)<=m. In particular (*)
implies the old coarse CountV bound with its existing exponent.
No need to assume m=1 merely because the base character is principal;
psi is an auxiliary character and need not be trivial.

This is a local strict label-count reduction for m<phi(N), and
no claim of improved runtime or uniform cohomological closure.
The full NumberU3U_s integer construction and its uniform constants,
ThmS6, HostRigid, local/global duality, LemmaM/M', HostVanE and
HostXpp remain essential. No premise of the actual CountV theorem
is dropped. No proof of CountI/II, 2-primary/minus, joint host,
geometry or [E] is implied. In particular a single label z0 by
itself is NOT a legal family unless z0 is fixed by all field
automorphisms; primitive orbit is the correct minimal stable set.

## Provenance / typed overlay
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Paths relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ThresholdArguments/DenseThresholdCases/
  EHostNumberU.lean f57281a04437bd5c364ff52e68efa331d27283da
    (NB, exists_p, trace_rz, key, final_bound, hostNumberUE_alt)
  NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
    (NumberU3U_s: arbitrary finite invariant Orb)
  HostNumberS.lean 05374a9d545e1b9e978adb1719c2572cf43b1453
  CountVOf.lean c875ff7cfd31de0e8df8d3a528b956f83b20dd57
  LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
  WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
HeightAndVanishing/HostComp.lean 2d9c083608be97d265cfd899214f7a4adf392ba2
HeightAndVanishing/HostIndex.lean ccc755aa50d8c7e732d74d5d6bd211f7d903c419.

Original source-call overlay (not kernel DAG):
Main -> ... -> vwin_of_hypotheses_H_E_alt -> count_v_of_printed_bound_k_reduced_unitary_lift
 -> countV_of_finiteness_duality_euler_host
 -> hostNumberUE_alt -> key -> NB/NumberU3U_s
 -> full rootsOfUnity(N.totient).
Replacement local graph:
[actual psi, sigma, iota] -> m: positive Nat -> primitive cyclotomic orbit:
finite Galois-stable family -> same NB with unchanged hypotheses
 -> nonzero integer and product inequality -> log sum -> two embedding fibres
 -> (*) -> old CountV consumer.
Original and reduced graphs remain distinct; no global removal of any
type/value/structural edge or imported axiom. Standard cyclotomic
polynomial and field automorphism facts used explicitly. No novel axiom.
Cache key=(pin,K,Omega,l,c,N,e,psi,S,A,F,iota,g1,p,B,sigma,z0,m,
embedding fibre,actual list). In particular cannot cache just N or
base character. Backtrack to full original root family if native replay
fails. The all-m-roots helper is weaker than the exact primitive-orbit
version, but sufficient to replay a smaller family without constructing
a primitive-root subtype first.

## Evidence
Read latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
first (all-method pyramid and ten-page cap), SWARM, AGENTS, HANDOFF,
research state/log/protocol/continuity excerpts, live manuscript
f101edec638db5e7d6b3cfbc7907687fc4e15c6e, and latest peer commit list.
Read math 87f08381, Galois faa0d552, literature 9211eae7 and
audit/dependency/structure/editor recent checkpoints. Not an exhaustive
peer archive audit. Four pinned source bodies checked for 24 named
literal anchors with exact hashes; all matched. Other source bodies
above inspected, no kernel replay. Local command -v lean/lake/elan
returned no paths. Incorrect DenseThresholdCases/CountVs.lean lookup
returned 404; actual CountVs is in HeightAndVanishing. Directory
listing retrieval for HeightAndVanishing also failed JSON parsing.
Do not infer missing theorem from that. No synthetic tests run.
Actual existing CI status files retrieved:
45577239749 status blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
(pass, returncode 0, 98.87s; conditional strip root axioms propext,
Classical.choice, Quot.sound); 45576756833 status blob
7da354941e402b6f8b364ed03d8c5c82d27b7717 (pass, 77.94s;
rh_of_right scan 2000 visited, 324 pending, three axioms).
These are prior engine/conditional-root checks only. No new CI PASS.
The following certificate is prepared for native compilation in Lean
4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
It checks the smaller all-root family, exact scalar caller bridge and
requests native scan/prune and rule/backtracking checks; it does not
elaborate the whole new primitive-orbit key or its actual caller.
No import of Main or claimed RH, no unbenchmarked URT advantage.

RESUME HERE: adapt EHostNumberU.key with the actual z0 order m
and primitive root subtype (or the all-m-root fallback below);
replay hostNumberUE_alt and CountV caller, including original-statement
bridge, axiom and constructor-inclusive role evidence. Then expand
NumberU3U_s producer (numberU3U_of_prints) and prove its uniform
integer logarithmic bound; no further manuscript expansion.
HANDOFF TO math, Galois, kernel, audit, editor and integration. RH OPEN.
-/

namespace RHDeepCountVOrbit
noncomputable section

-- Exactly the native NB family premises, with an arbitrary positive m.
theorem smaller_root_family (m : ℕ) [NeZero m] :
    (∀ o : rootsOfUnity m ℂ, ∃ k : ℕ, 0 < k ∧ (((o : ℂˣ) : ℂ)) ^ k = 1) ∧
    (∀ σ : ℂ ≃+* ℂ, ∃ u : rootsOfUnity m ℂ ≃ rootsOfUnity m ℂ,
      ∀ o, (((u o : rootsOfUnity m ℂ) : ℂˣ) : ℂ) = σ (((o : ℂˣ) : ℂ))) := by
  refine ⟨?_, ?_⟩
  · intro o
    exact ⟨m, NeZero.pos _, (mem_rootsOfUnity' _ _).1 o.2⟩
  · intro σ
    exact ⟨(σ.restrictRootsOfUnity m).toEquiv, fun o => by simp⟩

theorem root_label_card (m : ℕ) [NeZero m] :
    Nat.card (rootsOfUnity m ℂ) = m := Complex.card_rootsOfUnity

-- Scalar interface of the two embedding fibres and CountV normalization.
theorem integrate_countV (S Vlog a c K : ℝ)
    (hS : S ≤ 2*a*c*K) (hV : Vlog ≤ 2*S) :
    Vlog ≤ 4*a*c*K := by
  linarith [mul_le_mul_of_nonneg_left hS (show (0 : ℝ) ≤ 2 by norm_num)]

theorem original_budget_bridge (Vlog a c C K : ℝ)
    (ha : 0 ≤ a) (hK : 0 ≤ K) (hc : c ≤ C)
    (h : Vlog ≤ 4*a*c*K) : Vlog ≤ 4*a*C*K := by
  calc
    Vlog ≤ 4*a*c*K := h
    _ ≤ 4*a*C*K := by gcongr

theorem integrated_rule (S Vlog a c K : ℝ)
    (hS : S ≤ 2*a*c*K) (hV : Vlog ≤ 2*S) :
    Vlog ≤ 4*a*c*K := by
  first | rh_reduce 3 using [integrate_countV] | exact integrate_countV S Vlog a c K hS hV

theorem integrated_frontier (S Vlog a c K : ℝ)
    (hS : S ≤ 2*a*c*K) (hV : Vlog ≤ 2*S) :
    Vlog ≤ 4*a*c*K := by
  rh_auto_frontier 3
  all_goals first | exact integrate_countV S Vlog a c K hS hV | rh_auto 3

end
end RHDeepCountVOrbit

rh_scan UpperTheory.V.Z.J.hostNumberUE_alt limit 2000
rh_prune UpperTheory.V.Z.J.hostNumberUE_alt as RHHostNumberPruned
rh_scan UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host limit 2000
rh_scan RHDeepCountVOrbit.integrate_countV limit 2000
#print axioms UpperTheory.V.Z.J.hostNumberUE_alt
#print axioms UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host
#print axioms RHDeepCountVOrbit.smaller_root_family
#print axioms RHDeepCountVOrbit.integrate_countV
#print axioms RHDeepCountVOrbit.original_budget_bridge
