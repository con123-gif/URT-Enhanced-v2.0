/-!
RUN36 — lane 5, 25 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED; not compiled.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4; live proof
10e3d636b345adbcae9ddb91820a3a93f59c93bc lines 143-148,162.
Read SWARM, HANDOFF, EXPANSION, AGENTS and continuity; latest peer
commits 9f9a5e0e (canonical exception/PT), 410fcbc2 (same-host rank),
31cc317d (CountVs), 6c92b85b (Kato conductor), 18c47fab (shared
supplier scan). Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005;
latest observed upstream 98d36aafeeb30c1f40fdda96c3574faa34dfa413
(18:21:56 UTC), not substituted. Toolchain Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: replace the factor two from RUN34 by one on all eligible
CaseI coefficient primes except the explicitly characterized set
  E_e = {l in {h.q1,h.d} : l-1 divides 4e AND l-1 does not divide 2e}.
More importantly, implement the actual singleton NumberU consumer
using disjoint unions of local-sign blocks, not a quotient of
representation isomorphism classes. Same host, same e,N,l,c,Omega,
same K=Q(sqrt(-7)), place, Frobenius, and integer chosen before l.

Exact sources under src/Development/AutomorphicArithmetic/AutomorphicVarieties:
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
  GD.ord, GD.ine (comp l psi ^2=1), GD.l_cop, GD.cop, GD.gen;
HeightAndVanishing/GdOfHost.lean 8ab8e7e79a09e2d7f00292d525733fac8badfae2
  gdOfHost supplies all GD from Host.Big and CaseI;
HeightAndVanishing/HostIndex.lean ccc755aa50d8c7e732d74d5d6bd211f7d903c419
  prime divisor classification; BchiFacts c96defe3b3c64107975bbc8a056d2d39cca9bfea;
HeightAndVanishing/CompIne.lean 1fccdb32c84268d3197dc522ff99eaa6cee1f3e7
  equality of dirG and local comp on inertia; uses native cycZ_Ine_surjective;
HeightAndVanishing/GdIffIndex.lean c28e5e251291dc9e8944b2ea384e93c67c79830b;
HeightAndVanishing/CongrFacts.lean d1f46a193c0ee5bd6a291b6180dc774703fa2d58
  prime-to-l root reduction; PsiBar 1ba0427cab931c1ba3da74ff2e8f4a5d2616678a;
UnitaryThreeGroups/DatFacts.lean f04c55abe16956e3d4458c410131568df631149f
  inertia lies in eta.ker at l, nontrivial residual square;
UnitaryThreeGroups/CountI.lean 9e3faf892430e58c8d5f8d92e4196d838346c674
  original uniform all-host CountI conclusion; retain original fallback;
UnitaryThreeGroups/CorGSumLog.lean 39005a0a8594b8cd96d19794ee58dd04cdd35f52;
ModularityArgument/ThresholdArguments/DenseThresholdCases/
  FPropGKU.lean 4887bdf435a54a8ab856102e15d60da39d041970
  (private frob_val, t_eq, vl_bound, hD on singleton);
  NumberU3US.lean b31b9a1b9f3e84a792e915f864c681034c9eb258.
RUN34 98ecbad0c1185e466d2f801f6d95097b3edd92b5;
RUN35 4e7427508b0073727439034a283e991157e181ff.

PROOF (conditional on retained NumberU3U_s and strengthened OneCharU_res35).
For residual characters a=bar(cyc)^e bar(psi)|G_K and b likewise,
isomorphic selected rho,rho' imply equality of trace functions in
the common residue field of the valuation ring of Qbar_l. RUN34's
factorization and two-subgroup lemma imply a=b or ab=1 globally.
Equality implies psi=psi': cancel the cyclotomic factor; prime-to-l
torsion reduction is injective; K intersects Q(zeta_N) trivially
(discriminant -7, GD.cop, cyclotomic ramification), so G_K surjects
onto Gal(Q(zeta_N)/Q).

Choose inertia at l and an element s with bar(cyc)(s) a generator
of F_l^*. Inertia lies in G_K (GD.l_cop or DatFacts); native
cycZ_Ine_surjective supplies s. By GD.ine and compIne the local
components of psi and psi' have order at most two, so
    a(s)^2 = b(s)^2 = bar(cyc)(s)^(2e).
This is not 1 by GD.gen. If the two local signs at s agree, the
alternative ab=1 contradicts this inequality. If l does not divide
N, both local signs are trivial (unramified), so this already
rules out inversion. Even with different local signs, ab=1 forces
a(s)^4=1, i.e. l-1 divides 4e. The only possible odd primes dividing
N and outside Bchi for a principal host are q1 and d by HostIndex.
Therefore E_e is the entire possible exception set, NOT every small
l. For l in E_e separate characters into the two local-sign blocks
at s. In each block distinct chars have pairwise nonisomorphic
representation sets, even across different kernel orbits.
Nonexceptional l has a single block. E_e is only a necessary
condition for actual overlaps; no claim that overlaps must occur.

For a reference prime p=1 mod 210N from the existing Linnik route,
normV(w)=1 mod N. Do NOT replace the original CountI fixed auxiliary
prime guards r_i<q1,d with this p (impossible since q1|N and d|N);
these are distinct roles. At fixed N,e, NumberU3U_s applied to PUnit
with z=1 supplies n_p before any coefficient prime/character/block.
FPropGKU.frob_val and t_eq identify the SAME Eisenstein trace t for
all characters. The native hD applied to a singleton representation
gives nonvanishing for OneCharU_res35. Choose X_psi with the retained
residual predicate; within a local-sign block S, form U=biUnion X.
No quotient is needed: across distinct psi, X sets are disjoint and
their elements are pairwise nonisomorphic by the preceding argument;
within each X the original uniqueness holds. All U is admissible.
Then apply hD to the one-slot family U and the actual private
FPropGKU.vl_bound:
   sum_(psi in S) Vn_l(e,psi)
     <= 2 sum_(rho in U) vl_l(tr rho(sigma^-1)-t)
     <= 2 v_l(n_p).
Both signs, when needed, use the SAME integer n_p, not two choices.
Finite Vlen follows independently for every psi. Thus A_l=sum Vn
is <=2(1+1_{E_e}(l))*v_l(n_p). The code below implements the native
consumer conditional on cross-character separation hsep, not its
residue-field transport (still a separate native obligation).

Choose p1,p2 by the living proof's Linnik route. Patch integer B:
outside p1,p2 take min(v_l(n1),v_l(n2)); at p1 take v_p1(n2),
at p2 take v_p2(n1). B>0, B divides |n1*n2|. Let B_E be its
E_e-primary part. For arbitrary finite eligible L, prime
factorization gives the single refined estimate
   sum_(l in L) log(l) A_l <= 2 log B + 2 log B_E.
If q1,d>4e+1 then E_e is empty and bound is 2 log B. No general
Host.Big -> q1,d>4e+1 claimed. Original polynomial exponent
absorption still works (and the factor of number of chars is gone),
but NumberU3U_s, residual construction, Kato etc remain unresolved
native proof inputs. No uniform full VWinAt closure claimed.

Negative control (actual Python execution): enumerate C_(l-1)^2
characters for l in 5,7,11,13,17,19,23,29,31, 1<=e<=l-1,
(l-1) not dividing 2e, ramified flag r in {0,1}. For r=0 local
exponent s=0, for r=1 s in {0,(l-1)/2}; remote exponent t arbitrary.
Use primitive root g modulo l; signatures indexed i,j in [0,l-2]:
g^((e+s)i+t j)+g^(-((e+s)i+t j)) mod l. Group equal signatures.
Executed 8256 characters, 248 ordinary contexts, 8 exceptional
contexts, 120 colliding unordered pairs, max fiber 2. Checked every
collision is exceptional, local signs differ, both exponents inverse.
First counterexample to unconditional injectivity: l=5,e=1,s=0 vs
s=2,t=0. This is a finite algebra regression, not evidence for any
native automorphic existence or RH.

Original selected graph: CountI <- CorGK <- PropGK <- NumberU3U_s,
OneCharU_s, original orbit family and per-kernel integer. Reduced
candidate: retained same-host GD + NumberU3U_s(PUnit)
+ OneCharU_res35 -> local sign / inverse exclusion -> cross-char
separation -> biUnion -> vl_bound -> two-prime patched integer.
Original graphs and axioms retained. Cache keys must include
source/toolchain, N,e,l,c,K,Omega,p,w,sigma and sign block; no
reusing hsep from a different l or e. No verified edge retired.

Local Lean/lake absent (command -v both empty). Re-fetched actual
CI runs 45577239749,45576756833: completed success, corresponding
status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717. These establish baseline
engine only, not RUN30-36. Recent orchestrator runs 45675490207
pending, 45674746088 in progress; no native batch result for this
certificate. New kernel-closed obligations: 0. No URT gain claimed.
RESUME HERE: replay RUN34-36 in shared native environment, authenticate
the two private FPropGKU helpers and hsep via common residue field
and trace invariance; compile native consumer, then replace actual
principal CountI caller and audit all axioms and same-host quantifiers.
Do not stop at a generic weighted-sum lemma. HANDOFF TO integration,
kernel, formal audit, arithmetic. RH OPEN.
-/
import RUN34_RESIDUAL_TRACE_MULTIPLICITY
import RUN35_NATIVE_RESIDUAL_BRIDGE
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU
import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.DatFacts
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.GdOfHost
import RHProofTermPrune
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
namespace RHGalois36

theorem same_sign_excludes_inverse {G k : Type*} [Group G] [Field k]
    (a b : G →* kˣ) (s : G)
    (ht : ∀ g, (a g : k) + ((a g : k)⁻¹) =
      (b g : k) + ((b g : k)⁻¹))
    (hs : a s = b s) (hbad : a s ^ 2 ≠ 1) : a = b := by
  rcases RHGalois34.inversion_global a b ht with he | hi
  · ext g
    exact he g
  · exfalso
    apply hbad
    simpa only [pow_two, ← hs] using hi s

theorem fourth_power_excludes_inverse {G k : Type*} [Group G] [Field k]
    (a b : G →* kˣ) (s : G)
    (ht : ∀ g, (a g : k) + ((a g : k)⁻¹) =
      (b g : k) + ((b g : k)⁻¹))
    (hs : a s ^ 2 = b s ^ 2) (hbad : a s ^ 4 ≠ 1) : a = b := by
  rcases RHGalois34.inversion_global a b ht with he | hi
  · ext g
    exact he g
  · exfalso
    apply hbad
    calc a s ^ 4 = a s ^ 2 * a s ^ 2 := by rw [← pow_add]
      _ = a s ^ 2 * b s ^ 2 := congrArg (fun z => a s ^ 2 * z) hs
      _ = (a s * b s) ^ 2 := by rw [mul_pow]
      _ = 1 := by rw [hi s, one_pow]

section Consumer
open private frob_val t_eq vl_bound from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPropGKU
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3 UpperTheory.V.Z.J

def Res36 (Ω K : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    [Field K] [NumberField K] [Algebra K Ω] [IsAlgClosure K Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l) (N : ℕ) [NeZero N]
    (e : ℕ) (ψ : DirichletCharacter c.O N)
    (ρ : G K Ω →* GL (Fin 3) (Qbar l)) : Prop :=
  ∀ g : G K Ω,
    let u : (PadicAlgCl l)ˣ := Units.map (algebraMap c.O (PadicAlgCl l)).toMonoidHom
      (Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω g))
    ‖(ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace -
      ((u : Qbar l) + 1 + ((u⁻¹ : (PadicAlgCl l)ˣ) : Qbar l))‖ < 1

-- All arithmetic quantities and the integer are from the original supplier.
-- The only added consumer interface is cross-character separation on S.
theorem singleton_block_budget
    (hNum : NumberU3U_s) (hOne : OneCharU_res35)
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank ℚ K = 2) (e N : ℕ) [NeZero N]
    (he : 1 ≤ e) (p : ℕ) (w : HeightOneSpectrum (𝓞 K))
    (hp : p.Prime) (hw : (p : 𝓞 K) ∈ w.asIdeal)
    (h7 : 7 ≤ p) (hN : ¬ p ∣ N) (hd : ¬ (p : ℤ) ∣ discr K)
    (hmod : (normV w : ZMod N) = 1) :
    ∃ cA A : ℕ, ∃ NN : ℤ, NN ≠ 0 ∧
      Real.log |(NN : ℝ)| ≤ cA * ((N : ℝ) * (e+1))^A * Real.log p ∧
      ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
        [Algebra K Ω] [IsAlgClosure K Ω] [IsScalarTower ℚ K Ω]
        (l : ℕ) [Fact l.Prime], l ≠ 2 → l ≠ p →
      ∀ (c : Coef l) (S : Finset (DirichletCharacter c.O N)),
        (∀ ψ ∈ S, GD Ω K l e ψ) →
        (∀ ψ ∈ S, ∀ ψ' ∈ S, ∀ ρ ρ' : G K Ω →* GL (Fin 3) (Qbar l),
          Res36 Ω K l c N e ψ ρ → Res36 Ω K l c N e ψ' ρ' →
          Af.RepIso ρ ρ' → ψ = ψ') →
        (∀ ψ ∈ S, Vlen Ω c e ψ ≠ ⊤) ∧
          ∑ ψ ∈ S, Vn Ω c e ψ ≤ 2 * (padicValInt l NN : ℝ) := by
  classical
  obtain ⟨cA,A,hC⟩ := hNum K hK
  obtain ⟨NN,h0,hsz,hdiv⟩ := hC e he N (NeZero.pos N) p w hp hw h7 hN hd
    PUnit (fun _ => 1) (fun _ => ⟨1, by norm_num, by simp⟩)
    (fun τ => ⟨Equiv.refl _, by simp⟩)
  refine ⟨cA,A,NN,h0,by simpa using hsz, ?_⟩
  intro Ω _ _ _ _ _ _ l _ hl2 hlp c S hG hsep
  obtain ⟨ι⟩ : Nonempty (Qbar l ≃+* ℂ) :=
    GlobalTheory.nonempty_padicAlgCl_ringEquiv_complex l
  obtain ⟨B,hB⟩ := ReciprocityTheory.Gal.exists_isPlaceOver Ω w
  obtain ⟨σ,hσ⟩ := ReciprocityTheory.Gal.exists_isFrob hB
  have hD := hdiv l hl2 hlp Ω ι B hB σ hσ
  obtain ⟨f1,f2⟩ := frob_val hp hN hlp hw hB hσ
  let t : Qbar l := ι.symm (Af.eis3 (normV w) e 1)
  have hne : ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l),
      Adm3U_s ι e N ρ ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ →
      (ρ σ⁻¹ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace ≠ t :=
    fun ρ hρ => (hD (fun _ => {ρ}) (fun _ ρ' h => by rwa [Finset.mem_singleton.1 h])
      (fun _ a ha b hb _ => (Finset.mem_singleton.1 ha).trans
        (Finset.mem_singleton.1 hb).symm)).1 PUnit.unit ρ (Finset.mem_singleton_self ρ)
  have key := fun ψ : S => hOne Ω K l c N e ψ.1 (hG ψ.1 ψ.2) ι σ⁻¹ t
    (by rw [map_inv (galEmb ℚ K Ω)]
        simpa [t,hmod] using (t_eq c e (normV w) ψ.1 ι _ f1 f2)) hne
  refine ⟨fun ψ hψ => (key ⟨ψ,hψ⟩).1,?_⟩
  choose X hX1 hX2 hXr hX3 using fun ψ => (key ψ).2
  have hCross : ∀ (a b : S) ρ, ρ ∈ X a → ∀ ρ', ρ' ∈ X b →
      Af.RepIso ρ ρ' → a = b := by
    intro a b ρ ha ρ' hb hi
    apply Subtype.ext
    have hsame := hsep a.1 a.2 b.1 b.2 ρ ρ' (hXr a ρ ha) (hXr b ρ' hb) hi
    first | (rh_reduce 2 using [hsep]; done) | exact hsame
  let U := (Finset.univ : Finset S).biUnion X
  have hdis : Set.PairwiseDisjoint (↑(Finset.univ : Finset S)) X := by
    intro a _ b _ hab
    apply Finset.disjoint_left.mpr
    intro ρ ha hb
    exact hab (hCross a b ρ ha ρ hb ⟨1, fun g => by rw [one_mul,inv_one,mul_one]⟩)
  have hU1 : ∀ ρ ∈ U, Adm3U_s ι e N ρ ∨
      _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ := by
    intro ρ hρ
    obtain ⟨a,_,ha⟩ := Finset.mem_biUnion.mp hρ
    exact hX1 a ρ ha
  have hU2 : ∀ ρ ∈ U, ∀ ρ' ∈ U, Af.RepIso ρ ρ' → ρ = ρ' := by
    intro ρ hρ ρ' hρ' hi
    obtain ⟨a,_,ha⟩ := Finset.mem_biUnion.mp hρ
    obtain ⟨b,_,hb⟩ := Finset.mem_biUnion.mp hρ'
    have hab := hCross a b ρ ha ρ' hb hi
    subst b
    have heq := hX2 a ρ ha ρ' hb hi
    first | (rh_auto 2; done) | exact heq
  obtain ⟨hu0,hu⟩ := hD (fun _ => U) (fun _ => hU1) (fun _ => hU2)
  have hb := vl_bound (fun _ : PUnit => U)
    (fun _ ρ => (ρ σ⁻¹ : Matrix (Fin 3) (Qbar l)).trace - t) NN h0
    (fun o ρ hρ => sub_ne_zero.2 (hu0 o ρ hρ)) hu
  have hb' : ∑ ρ ∈ U, vl l ((ρ σ⁻¹ : Matrix (Fin 3) (Qbar l)).trace - t) ≤
      padicValInt l NN := by simpa using hb
  rw [← Finset.sum_coe_sort]
  calc _ ≤ ∑ ψ : S, 2 * ∑ ρ ∈ X ψ,
      vl l ((ρ σ⁻¹ : Matrix (Fin 3) (Qbar l)).trace - t) :=
        Finset.sum_le_sum fun ψ _ => hX3 ψ
    _ = 2 * ∑ ρ ∈ U, vl l ((ρ σ⁻¹ : Matrix (Fin 3) (Qbar l)).trace - t) := by
      rw [← Finset.mul_sum, ← Finset.sum_biUnion hdis]
    _ ≤ _ := by
      first | (rh_auto_frontier 2; all_goals exact mul_le_mul_of_nonneg_left hb' zero_le_two)
            | exact mul_le_mul_of_nonneg_left hb' zero_le_two

end Consumer
end RHGalois36

#print axioms RHGalois36.same_sign_excludes_inverse
#print axioms RHGalois36.fourth_power_excludes_inverse
#print axioms RHGalois36.singleton_block_budget
rh_scan UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU limit 2000
rh_scan RHGalois36.singleton_block_budget limit 2000
rh_prune RHGalois36.singleton_block_budget as RH36SingletonBlockPruned
