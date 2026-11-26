import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KeepNumU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN47 / 2026-11-26 / lane 14.
Status: exact mathematical identity, finite rational regression executed,
native catalogue certificate PREPARED, NOT compiled, actual caller splice open.

Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 read including
mandatory engine; AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES
and state/protocol/log/continuity openings reviewed. Latest peer integration
58dbb472eb4957d41d1bc0948de5313661243b48, kernel
5d4f6c50b0bb5e53e73499a7f407a0653371fcf2, literature
5fb90283058779f47086264f30bca9c221200a7c, audit
d3079b63d6dde5d3626ae32c259c1e7eb9579f43 reviewed. Prior lane result
c46be9eff6454cc43c723d26f1f4eac739b23a27 preserved.
Peer c0de628b006f7e0d410ce2af07ca63d4aa1ab24d establishes generic
RootSum rank-two factor sharpness; no contradiction here: we change the
specialized observable, NOT the generic catalogue contract.

Upstream leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Sources under src/Development/AutomorphicArithmetic/:
AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/
  FrobeniusTraceCountBoundOfCmEigensystemCount.lean
    1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
  KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
  NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258
Foundations/GaloisRepresentations/AdmissibleResidues/
  FrobeniusTraceCountBoundOfRatEigensystemCount.lean
    fc375ef5c996180c985df22cc3f15655a9765126
  WinDefs.lean 05d36e61e5740cf2eef83d75c5882b29eea6d2fa

Original selected graph:
NumberU3U_s -> KeepNumU.numberU3U_of_adm2A_imp_adm2B
 -> frobenius_trace_count_bound_of_rat_eigensystem_count_alt
 -> CountQAlt / countQ_alt -> CountPAlt auxiliary fields
 -> rootSum (root multiset enumerations) -> bit_of_fibre
 -> traces_from_eigenvalues_rank2 -> rank-three trace transfer.
At the actual quadratic host, residue degree h=1 or 2. Auxiliary
quadratic residue degrees f_i=1 or 2. In the h=2 case, f_i divides h.
For B.map (.^f_i)=beta_i(s), exact cancellation before norms:
  1 + sum_{b in B} (b^-1)^2
    = 1 + sum_{a in beta_i(s)} (a^-1)^(2/f_i).
Use existing traces_from_eigenvalues_rank2 at (p^f_i,2/f_i,e)
to get norm/integrality/Galois conditions at p^2, then combine
catalogues indexed by (Sigma i, D_i.S) x Bool. The cap for that
carrier is 2*sum_i |D_i.S| rather than 8*sum_i |D_i.S|.
This is a 75% reduction of the generic upper cap, NOT a measured
runtime improvement. The Boolean multiplicity must remain.

Candidate graph h=2:
same original caller -> direct trace catalogue -> CountPAlt,
nonself-twist selection, admissible restriction and same two-fibre
classification, native trace transfer. Proposed relation on slots (i,s)
is existence of admissible restriction with cl_i equal to s.
Original countQ_alt case two uses only restriction-class equality and
resTwo, not the local root multiset: reuse that proof on this relation.
Existence uses the same native nonself-twist selection and hA.
The rational local Frobenius multiset still exists by frobEx; use
frobenius_power_compatibility and FrobEig uniqueness to identify the
auxiliary beta with its inverse powers. Preserve the original
frobenius_pow_resDeg_place_norm, map_trace_eq_sum_roots_of_charpoly_map,
and block_conjugate_rank_three_rep transfer from W to rank three.
No rootSum claim for h=1 with f_i=2, no change to rank four, and no
global deletion of CountQAlt. Actual caller splice remains open.
Use original route for h=1 and as fallback if native checking fails.
CountP/quantitative bounds, cohomology, joint geometric bound and
weighted prime-window estimate all remain open.

38 fail-on-error pinned source/consumer consistency checks executed
via GitHub retrieval. Exact rational regression in JS below:
1282 assertions executed, 256 odd-power negative controls, no failures.
These are algebra controls, NOT sampled automorphic data or Lean tests.
Reproduce with Node:
  let checks=0,negative=0;
  function ck(x){if(!x)throw Error("exact regression "+checks);checks++}
  function pow(a,k){return a**BigInt(k)}
  function add(x,y){return [x[0]*y[1]+y[0]*x[1],x[1]*y[1]]}
  function eq(x,y){return x[0]*y[1]===y[0]*x[1]}
  function term(a,h){return [1n,pow(a,h)]}
  function sum(a,b,h){return add(term(a,h),term(b,h))}
  for(let a=-8;a<=8;a++)for(let b=-8;b<=8;b++)if(a&&b)for(const f of [1,2]){
    let x=BigInt(a),y=BigInt(b),k=2/f;
    ck(eq(sum(pow(x,f),pow(y,f),k),sum(x,y,2)));
    if(f===2){ck(eq(sum(x,y,2),sum(-x,y,2)));ck(eq(sum(x,y,2),sum(x,-y,2)));ck(!eq(sum(x,y,1),sum(-x,y,1)));negative++;}
  }
  const phi=[1n,1n],u=[-1n,1n];
  const plus=[2n+phi[0]+u[0],phi[1]+u[1]],minus=[2n-phi[0]-u[0],-phi[1]-u[1]];
  ck(plus[0]===2n&&plus[1]===2n);ck(minus[0]===2n&&minus[1]===-2n);
  console.log({checks,negative});

No local lean/lake/elan. Historical CI jobs 45577239749, 45576756833,
45670987597 retrieved: pick/run/record success for each; baseline only.
New native certificate and axiom scan not run. Do not claim PASS.
Preserve prior type/value/constructor/axiom evidence; no new extracted
dependency graph, no claim of globally removed edges. Context key:
source/toolchain/K/e/M/p/w/h/auxiliary i,v_i,f_i,D_i/ell/Omega/iota/
restriction choices and caller. No URT or O(N) complexity claim.

RESUME HERE: compile helper in pinned native CI, then splice h=2 into
the actual KeepNumU rank-two trace consumer, replay two-fibre proof with
Q on slots, prove native FrobEig transport, retain h=1 fallback; audit
actual root reachability, axioms and unchanged premises before merging.
HANDOFF TO kernel verification and integration: verify helpers first;
do not import the claimed RH theorem; preserve all unresolved leaves.
-/

namespace RHAcceleration47
open UpperTheory.GalN.V.Win

theorem inv_power_map_sum (B : Multiset ℂ) (f k : ℕ) :
    ((B.map (fun b => b ^ f)).map (fun b => b⁻¹ ^ k)).sum =
      (B.map (fun b => b⁻¹ ^ (f*k))).sum := by
  rw [Multiset.map_map]
  congr 1
  apply Multiset.map_congr rfl
  intro b _
  simp only [Function.comp_apply, ← inv_pow, ← pow_mul]

theorem rank2_even_fibre (p e f : ℕ) (hp : 1 ≤ p) (hf : 1 ≤ f ∧ f ≤ 2)
    (D : EigData 2 (p^f) ![(e:ℤ), -(e:ℤ)] 0) :
    ∃ (T : TrData (p^2) e) (u : D.S ≃ T.S), ∀ (s : D.S) (B : Multiset ℂ),
        B.map (fun b => b^f)=D.β s →
        T.t (u s)=1+(B.map fun b => b⁻¹ ^ 2).sum := by
  obtain ⟨k,hk⟩ : ∃ k : ℕ, f*k=2 := by
    have h : f=1 ∨ f=2 := by omega
    rcases h with h|h
    · exact ⟨2, by simp [h]⟩
    · exact ⟨1, by simp [h]⟩
  have hp' : 1 ≤ p^f := Nat.one_le_pow _ _ hp
  obtain ⟨T,u,hT⟩ := traces_from_eigenvalues_rank2 (p^f) k e hp' D
  have hq : (p^f)^k=p^2 := by rw [← pow_mul,hk]
  rw [← hq]
  refine ⟨T,u,fun s B hB => ?_⟩
  rw [hT s, ← hB, inv_power_map_sum B f k, hk]

theorem rank2_even_catalogue (p e : ℕ) (hp : 1≤p) (I : Type) [Fintype I]
    (f : I→ℕ) (hf : ∀ i, 1≤f i ∧ f i≤2)
    (D : ∀i, EigData 2 (p^f i) ![(e:ℤ), -(e:ℤ)] 0) :
    ∃ (T : TrData (p^2) e) (j : (Σ i : I, (D i).S) × Bool → T.S),
      Function.Injective j ∧ Nat.card T.S = 2 * ∑ i, Nat.card (D i).S ∧
      ∀ i (s : (D i).S) (b : Bool) (B : Multiset ℂ),
        B.map (fun x => x^(f i))=(D i).β s →
        T.t (j (⟨i,s⟩,b))=1+(B.map fun x=> x⁻¹ ^ 2).sum := by
  classical
  choose T u ht using fun i=>rank2_even_fibre p e (f i) hp (hf i) (D i)
  letI : ∀i, Finite (D i).S := fun i=>(D i).fin
  refine ⟨⟨(Σ i : I, (D i).S) × Bool, inferInstance,
    fun x => (T x.1.1).t (u x.1.1 x.1.2), ?_, ?_, ?_⟩,
    id, Function.injective_id, ?_, ?_⟩
  · intro σ
    choose v hv using fun i => (T i).conj σ
    let w : ∀ i, (D i).S ≃ (D i).S := fun i => (u i).trans ((v i).trans (u i).symm)
    refine ⟨(Equiv.sigmaCongrRight w).prodCongr (Equiv.refl Bool), ?_⟩
    intro x
    change (T x.1.1).t (u x.1.1 (w x.1.1 x.1.2)) =
      σ ((T x.1.1).t (u x.1.1 x.1.2))
    simpa [w] using hv x.1.1 (u x.1.1 x.1.2)
  · intro x; exact (T x.1.1).bd _
  · intro x; exact (T x.1.1).int _
  · rw [Nat.card_prod, Nat.card_sigma, Nat.card_eq_fintype_card (α := Bool), Fintype.card_bool, mul_comm]
  · intro i s b B hB; exact ht i s B hB

-- Copy of the source's two-fibre labelling lemma; no additional
-- local root data are needed in its abstract contract.
theorem bit_of_slot {X U : Type} (R : X → X → Prop) (hs : ∀ x y, R x y → R y x)
    (ht : ∀ x y z, R x y → R y z → R x z) (Q : X → U → Prop) (hQ : ∀ x, ∃ u, Q x u)
    (h2 : ∀ u x₀ x x', Q x₀ u → Q x u → Q x' u → ¬ R x₀ x → ¬ R x₀ x' → R x x') :
    ∃ g : X → U × Bool, (∀ x x', g x = g x' → R x x') ∧ ∀ x, Q x (g x).1 := by
  classical
  choose u hu using hQ
  have hex : ∀ x : X, ∃ y, Q y (u x) := fun x => ⟨x, hu x⟩
  refine ⟨fun x => (u x, decide (R (Classical.epsilon (α := X) (h := ⟨x⟩) fun y => Q y (u x)) x)), fun x x' h => ?_, hu⟩
  obtain ⟨h1, h3⟩ := Prod.ext_iff.1 h
  simp only at h1 h3
  have h0 := Classical.epsilon_spec (hex x)
  rw [← h1, decide_eq_decide] at h3
  have hx' : Q x' (u x) := h1 ▸ hu x'
  by_cases hc : R (Classical.epsilon (α := X) (h := ⟨x⟩) fun y => Q y (u x)) x
  · exact ht _ _ _ (hs _ _ hc) (h3.1 hc)
  · exact h2 _ _ _ _ h0 (hu x) hx' hc fun h4 => hc (h3.2 h4)

end RHAcceleration47

#print axioms RHAcceleration47.inv_power_map_sum
#print axioms RHAcceleration47.rank2_even_fibre
#print axioms RHAcceleration47.rank2_even_catalogue
#print axioms RHAcceleration47.bit_of_slot
#print axioms UpperTheory.GalN.V.Win.rootSum
