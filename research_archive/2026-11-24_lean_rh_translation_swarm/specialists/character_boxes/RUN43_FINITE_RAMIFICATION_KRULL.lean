import RHCharacterNative42
import Mathlib.FieldTheory.KrullTopology

/-!
RUN43 — 26 November 2026. HUMAN LOCAL PROOF via standard finite ramification
theory; source-matched topology adapter PREPARED, NOT COMPILED. RH OPEN.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine.
AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7, expansion c8152d07,
continuity 61459cfd, research state/log/protocol and summary consulted. Recent
peer handoffs/titles 6e70b2a0, cc578b66, 24e7f2d1, 0748936f, f296aa34,
31ac8a22, 5d947cce, 6615a312, 86de3c73 consulted; none supplies this tame
Krull adapter. RUN42 commit 0c40cedc667526bf28d5c825e32b4ec24929784f.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Upstream latest observed
e063a923620ee7787b4a1270421478645bf66bdb; no switch, diff not audited.

Source evidence:
src/Development/AutomorphicArithmetic/AutomorphicVarieties/
  LevelCohomology/SoCocL.lean dcf4e5309372b443b989f37055d34a1071aa9140
  LevelCohomology/SoHostVanE.lean 4d97dce5963b96608015bfdc5de00f94eae9c5bd
  LevelCohomology/SoDecNe.lean 0c7f77ff142f96b2cde9aa70814e94c96255ab1b
  GaloisLibrary/KummerTheory/DecGen.lean 9eadeed2ac40e2071061482913bdd458edaeb5ac
  GaloisLibrary/SelmerTransport/Places.lean f820992a67840914d259c93cee63a4fc5c5baa26
  CharacterLevelBounds/DecCyc.lean 6ef3631dafc29edd7d1fdfb83da5d500847e2889
Pinned Mathlib/FieldTheory/KrullTopology.lean f76f89179d1b3744593ac291593ef7969eac48b1:
krullTopology_mem_nhds_one_iff_of_normal gives precisely the finite normal
fixing-subgroup neighbourhood basis. Mathlib/Order/Filter/AtTopBot/Basic.lean
63fceba64c99d69c691a8ffec81542ad62e05683: eventually_atTop.
Mathlib/NumberTheory/RamificationInertia/Galois.lean 61c426e3bcf99d91862a4d5c538c5a7ca0a7629c
has inertia cardinality, not an identified wild-inertia supplier.
Classical source: https://stacks.math.columbia.edu/tag/09E3 ,
Lemmas 15.114.5 (wild p-group and tame character) and 15.114.8 (equivariance).
Read their statements and proofs; they apply to finite Galois extensions of
the DVR at v, so no assumption of an absolute local tame presentation.

HUMAN PROOF of TameRelation42, with classical ramification theorems:
Fix original k, Omega, v, A, sigma, m, t from RUN42, and put q=normV(v)^m,
F=sigma^m, w=(t^q F)^(-1) F t. Fix p=char(O_k/v), a positive prime.
p != l because l is not in v. For every finite normal intermediate E/k,
restrict A to E. E is a number field (finite over k) and Galois over k
(char 0). All its algebraic integers lie in A by integrality. The prime
P cut out by the maximal ideal of A on O_E lies over v and is nonzero.
(O_E)_P embeds into A intersect E since denominators outside P are units
in A. This inclusion is equality: any nonmember of the DVR has inverse
in its maximal ideal, thus inverse in the maximal ideal of A, and cannot
lie in A. Consequently the residue of (O_E)_P embeds in the residue of A.
Normality ensures F,t restrict to automorphisms of E. They preserve P
because they preserve A. The inertia hypothesis makes t_E act trivially
on the finite residue field; the original IsFrob congruence implies that
F_E acts by x -> x^q there, by iterating the congruence m times.
Apply 15.114.5 and 15.114.8 to the finite extension E/k at P. Write
lambda_E for its tame inertia character; its kernel W_E is a finite
p-group. Inertia is normal in the decomposition group. Therefore
lambda_E(F_E t_E F_E^(-1)) = lambda_E(t_E)^q = lambda_E(t_E^q).
Their quotient is in W_E, so w_E = F_E^(-1) t_E^(-q) F_E t_E
is in W_E as well, by normality. Thus w_E^(p^a)=1 for some a depending
on E, with p and w fixed before E. This means w^(p^a) in E.fixingSubgroup.
At all b>=a the same holds by subgroup closure under powers.
The exact pinned Krull basis now proves w^(p^b) -> 1.
No compatibility of chosen generators or exponents across E, no completion
or separate place, and no absolute wild-inertia theorem is needed.
This discharges the classical local witness in RUN42 in human mathematics.
It does NOT prove a uniform cohomological length estimate or RH.
The finite ramification-to-native restriction identification just given
is still to be formalized in Lean: the adapter below takes precisely
FiniteRamification43, not an asserted axiom or imported RH.

Original graph preserved: CountV -> hostVanE -> lineNeg -> soCocL ->
locTors/decNe/cobLim and global/above-l branches. Candidate local graph:
RUN40 away inertia -> RUN41 cancellation -> RUN42 places/Frobenius ->
RUN43 finite normal Krull basis + finite ramification restrictions.
No global deletion or kernel-closed node claimed. Context key includes
source/toolchain, actual k/Omega/l/c/psi/e/z/v/A/sigma/m/t, fixed p,w and
finite normal E. Keep all prior unexpanded nodes, original proof, and
axiom evidence. No URT experiment: not useful for this exact reduction.

Actual execution: read all cited pinned native files and Mathlib declarations,
two classical ramification statements/proofs, latest peer commit handoffs.
Checked both baseline status JSONs (b1c96f58, 7da35494) and job lists:
45577239749 and 45576756833 run/pick/record successful, returncode 0.
This is existing engine/conditional root evidence ONLY. No local lean/lake
on PATH or ~/.elan/bin; no new CI output or axiom audit. No synthetic tests.
Replay in warmed pinned native root: compile existing engines and RUN41 as
RHCharacterTame41, RUN42 as RHCharacterNative42, then this file. Native
tactics are proposed for actual adapter and caller, not reported executed.
RESUME HERE: formalize FiniteRamification43 using finite DVR residue
restriction and the finite tame character kernel/equivariance, or locate
native equivalents; compile RUN40-43 together and audit actual CountV
caller substitution, retaining its remaining branches. For human editor,
cite the two Stacks lemmas once and move upstream to uniform quantitative
Sha/CountV same-host supply rather than redoing this classical local proof.
HANDOFF TO kernel, audit, local Galois, integration and editor. RH OPEN.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X
open Filter Topology
namespace RHCharacterFinite43

theorem tendsto_of_finite_powers {k Ω : Type} [Field k] [Field Ω]
    [Algebra k Ω] [Normal k Ω] (w : G k Ω) (p : ℕ)
    (h : ∀ E : IntermediateField k Ω, FiniteDimensional k E → Normal k E →
      ∃ a : ℕ, w ^ (p ^ a) ∈ E.fixingSubgroup) :
    Tendsto (fun b : ℕ => w ^ (p ^ b)) atTop (𝓝 1) := by
  show Filter.map (fun b : ℕ => w ^ (p ^ b)) atTop ≤ 𝓝 1
  intro s hs
  obtain ⟨E, hfin, hnormal, hsub⟩ :=
    (krullTopology_mem_nhds_one_iff_of_normal k Ω s).mp hs
  obtain ⟨a, ha⟩ := h E hfin hnormal
  change ∀ᶠ b : ℕ in atTop, w ^ (p ^ b) ∈ s
  refine eventually_atTop.mpr ⟨a, fun b hb => hsub ?_⟩
  have hpow : p ^ b = p ^ a * p ^ (b-a) := by
    calc
      p ^ b = p ^ (a+(b-a)) := congrArg (fun n : ℕ => p^n) (by omega)
      _ = _ := pow_add _ _ _
  rw [hpow, pow_mul]
  exact E.fixingSubgroup.pow_mem ha _

def FiniteRamification43 : Prop :=
  ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω]
    [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime]
    (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω),
    IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal →
    ∀ (σ : G k Ω), IsFrob A (normV v) σ →
    ∀ (m : ℕ), 0 < m → ∀ t ∈ Ine (F := k) A,
      ∃ p : ℕ, ¬ l ∣ p ∧
        ∀ E : IntermediateField k Ω, FiniteDimensional k E → Normal k E →
          ∃ a : ℕ,
          (((t ^ ((normV v)^m) * σ^m)⁻¹ * (σ^m * t)) ^ (p^a))
            ∈ E.fixingSubgroup

theorem relation_of_finite43 (h : FiniteRamification43) :
    RHCharacterNative42.TameRelation42 := by
  intro k Ω _ _ _ _ _ l hl v A hv hvl σ hσ m hm t ht
  haveI : IsGalois k Ω := {}
  obtain ⟨p, hp, hf⟩ := h k Ω l v A hv hvl σ hσ m hm t ht
  let w : G k Ω := (t ^ ((normV v)^m) * σ^m)⁻¹ * (σ^m*t)
  refine ⟨p, w, hp, ?_, tendsto_of_finite_powers w p hf⟩
  simp [w, mul_assoc]

theorem inertia_zero43 (h : FiniteRamification43) :
    RHCharacterTame41.AwayInertiaZero41 :=
  RHCharacterNative42.inertia_zero42 (relation_of_finite43 h)

example (h : FiniteRamification43) : RHCharacterTame41.AwayInertiaZero41 := by
  first
  | (rh_reduce 3 using [inertia_zero43, relation_of_finite43,
      RHCharacterNative42.inertia_zero42]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact inertia_zero43 h

end RHCharacterFinite43

rh_scan UpperTheory.V.X.So.hostVanE limit 2000
rh_scan UpperTheory.V.X.So.soCocL limit 2000
rh_scan RHCharacterFinite43.inertia_zero43 limit 2000
rh_prune RHCharacterFinite43.relation_of_finite43 as RHCharacterFinite43.RelationPruned
#print axioms RHCharacterFinite43.tendsto_of_finite_powers
#print axioms RHCharacterFinite43.relation_of_finite43
#print axioms RHCharacterFinite43.inertia_zero43
