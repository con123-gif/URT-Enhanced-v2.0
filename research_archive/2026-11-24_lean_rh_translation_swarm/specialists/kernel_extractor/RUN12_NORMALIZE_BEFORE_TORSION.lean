import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.TorsClass
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountZ
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11, 25 Nov 2026: SOURCE-MATCHED human reduction / PREPARED native replay.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mission cd0a176134d46b5b624896e56843a24915c14477, SWARM, HANDOFF,
EXPANSION, AGENTS, continuity and living proof 10e3d636b consulted.
Peer 1fe24ac8 / 746b39e7 / 72a8ecc2 normalizes a class of order l
and uses FULL cyclotomic inertia-image equality to preserve l-torsion.
New reduction: normalize an ARBITRARY cocycle first, then induct on
its finite image exponent, not on the order of its cohomology class.
This removes the full-image and divisibility premises from this route.

For any locally trivial cocycle z, choose m with z|I=dm|I and set
f=z-dm. This continuous cocycle vanishes on I. Away from l the native
places lemma gives trivial action on full QO, so f vanishes there too.
Its image is finite (compact G, discrete QO), hence l^n f=0 for some n.
If every such normalized l-torsion cocycle is identically zero, then
l^(n-1) f=0 by applying that assertion to l^(n-1) f. Induct to f=0.
No lifting through a divisible module, no uniqueness of representatives,
no full l-adic inertia-image equality. No quotient averaging needed.
For the residual assertion, let H=kernel of the mod-l scalar action
and use only G=IH (residual inertia image suffices), plus l-coprime
class number of the residual field. f|H is a homomorphism into M[l].
Conjugate inertia above l vanishes by the cocycle identity; away from l
native places gives vanishing. Infinite inertia has order <=2.
Class field theory yields f|H=0, and f(ih)=f(i)+rho(i)f(h)=0.
For ordinary CountZ residual order <=2, use peer 1fe24ac8 Minkowski
argument; for l=3,7 use peer 746b39e7. These arithmetic/field-to-native
interfaces still require independent checking. This does not prove RH.

Actual source ledger (src/Development/AutomorphicArithmetic/AutomorphicVarieties):
LevelCohomology/TorsClass.lean abccc2d2c3aadebdafc35fc4297c8a9281447f58
  zOne, private tors_class (old route, not imported to prove conclusion).
GaloisLibrary/SelmerTransport/ConjStableShaFam.lean 578402a7b2aea9f24d31473aab4486dd43055fb2
  ShaU, shaFam, chiO.
GaloisLibrary/SelmerTransport/Places.lean f820992a67840914d259c93cee63a4fc5c5baa26
  places.2.2.2, exact away-from-l inertia kernel.
GaloisLibrary/SelmerTransport/QoFacts.lean 60ed9851ed491e8ed36de2ee042dd9f5aa34fddd
  qoFacts.2.1, pointwise primary torsion (NOT divisibility .2.2.1).
CharacterLevelBounds/ShaFamMono.lean f1b517fa7cddda3e25b5a7ba89c1e57096bbf59e
  Chr.V, rho, V'_le_V.
HeightAndVanishing/CountZ.lean 5601df23547fac2586abcd3717f6ae7c468e8b03
  countZ : PropZ -> CountZ.
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
  PropZ quantifiers, unchanged.

Original source-visible edge countZ -> PropZ -> Chr.V=0.
Candidate edge countZ -> PropZ -> normalized residual kill + inertia
choice + places + compact discrete torsion + quotient coboundary.
Original zOne and all other consumers remain; no global deletion.
Context key includes exact pin, O, l, e, valuation A, action rho,
all local conditions, residual field and l-torsion target.
Native Lean/lake absent on local PATH. No native PASS claimed.
Peer f41c3be3: analytic replay 45663493094 failed at |* parser;
its successor compute/rh-landau-diagonal-root-abs-fix-20261125/status.json
not yet published when checked. No duplicate repair. Baseline prior
CI runs do not verify this candidate. No URT advantage asserted.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC
  ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V
  UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

noncomputable section
namespace RHKernel12

/-- Scaling a normalized cocycle preserves every residual test condition.
    The ambient ring scalar p need not be invertible or surjective. -/
theorem kill_of_primary_normalized
    {G R M : Type*} [Group G] [CommRing R] [AddCommGroup M] [Module R M]
    [TopologicalSpace G] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [ContinuousConstSMul R M]
    (rho : Representation R G M) (p : R) (S : Set G)
    (kill : ∀ f : G → M, Continuous f →
      (∀ a b, f (a*b) = f a + rho a (f b)) →
      (∀ g ∈ S, f g = 0) → (∀ g, p • f g = 0) → ∀ g, f g = 0)
    (f : G → M) (hc : Continuous f)
    (hz : ∀ a b, f (a*b) = f a + rho a (f b))
    (hS : ∀ g ∈ S, f g = 0)
    (n : ℕ) (hn : ∀ g, p^n • f g = 0) : ∀ g, f g = 0 := by
  induction n with
  | zero =>
    intro g
    simpa using hn g
  | succ n ih =>
    apply ih
    let w : G → M := fun g => p^n • f g
    have hwc : Continuous w := hc.const_smul _
    have hwz : ∀ a b, w (a*b) = w a + rho a (w b) := by
      intro a b
      dsimp [w]
      rw [hz, smul_add, map_smul]
    have hwS : ∀ g ∈ S, w g = 0 := by
      intro g hg
      simp [w, hS g hg]
    have hwp : ∀ g, p • w g = 0 := by
      intro g
      dsimp [w]
      rw [smul_smul, ← pow_succ']
      exact hn g
    exact kill w hwc hwz hwS hwp

/-- The only new local field input is the residual normalized kill.
    Its set S contains the distinguished inertia and every away-l inertia. -/
def ZeroSet (Ω : Type) [Field Ω] [Algebra ℚ Ω] (l : ℕ)
    (A : ValuationSubring Ω) : Set (G ℚ Ω) :=
  {g | g ∈ Ine (F := ℚ) A ∨
    ∃ B : ValuationSubring Ω, ¬ B.valuation (l : Ω) < 1 ∧
      g ∈ Ine (F := ℚ) B}

def ResidualKill (Ω : Type) [Field Ω] [Algebra ℚ Ω] [IsAlgClosure ℚ Ω]
    (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [Algebra ℤ_[l] O]
    (e : ℕ) (A : ValuationSubring Ω) : Prop :=
  ∀ f : G ℚ Ω → QO l O, Continuous f →
    (∀ a b, f (a*b) = f a + Chr.rho l e (1 : G ℚ Ω →* Oˣ) a (f b)) →
    (∀ g ∈ ZeroSet Ω l A, f g = 0) →
    (∀ g, (l : O) • f g = 0) → ∀ g, f g = 0

theorem trivialV_of_residual
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (l : ℕ) [Fact l.Prime] (c : Coef l) (e : ℕ)
    (A : ValuationSubring Ω)
    (kill : ResidualKill Ω l c.O e A) :
    Chr.V l e (1 : G ℚ Ω →* c.Oˣ) = 0 := by
  classical
  let O := c.O
  let rho : Representation O (G ℚ Ω) (QO l O) :=
    Chr.rho l e (1 : G ℚ Ω →* Oˣ)
  change Module.length O (ShaU rho l ⊤) = 0
  have hact : ∀ (g : G ℚ Ω) (m : QO l O), rho g m =
      algebraMap ℤ_[l] O (((cycZ ℚ Ω l g ^ (-(e : ℤ)) : ℤ_[l]ˣ) : ℤ_[l])) • m := by
    intro g m
    simp [rho, Chr.rho, twist₂, scalRep_apply, chiO]
  have hcontm : ∀ m : QO l O, Continuous fun g : G ℚ Ω => rho g m := by
    intro m
    have hh : Continuous fun p : G ℚ Ω × QO l O => rho p.1 p.2 :=
      (contTw ℚ Ω l).2.2 O 1 (-(e : ℤ)) (by simp)
    exact hh.comp (continuous_id.prodMk continuous_const)
  have hall : ∀ x : ShaU rho l ⊤, x = 0 := by
    intro x
    obtain ⟨y, hyS⟩ := x
    obtain ⟨z, rfl⟩ := Submodule.Quotient.mk_surjective _ y
    obtain ⟨m, hm⟩ := (mk_mem_locSel.1 hyS) (Ine (F := ℚ) A) (Or.inr ⟨A, rfl⟩)
    let f : G ℚ Ω → QO l O := fun g =>
      (z : (⊤ : Subgroup (G ℚ Ω)) → QO l O) ⟨g, trivial⟩ - (rho g m - m)
    have hcz : ∀ a b : G ℚ Ω,
        (z : (⊤ : Subgroup (G ℚ Ω)) → QO l O) ⟨a*b, trivial⟩ =
          (z : (⊤ : Subgroup (G ℚ Ω)) → QO l O) ⟨a, trivial⟩ +
          rho a ((z : (⊤ : Subgroup (G ℚ Ω)) → QO l O) ⟨b, trivial⟩) :=
      fun a b => z.2.2 ⟨a, trivial⟩ ⟨b, trivial⟩
    have hfz : ∀ a b, f (a*b) = f a + rho a (f b) := by
      intro a b
      dsimp only [f]
      rw [hcz, map_mul, Module.End.mul_apply, map_sub, map_sub]
      abel
    have hfc : Continuous f := by
      have h1 : Continuous fun g : G ℚ Ω =>
          (z : (⊤ : Subgroup (G ℚ Ω)) → QO l O) ⟨g, trivial⟩ :=
        z.2.1.comp (continuous_id.subtype_mk fun _ => trivial)
      exact h1.sub ((hcontm m).sub continuous_const)
    have hfS : ∀ g ∈ ZeroSet Ω l A, f g = 0 := by
      intro g hg
      rcases hg with hg | ⟨B, hB, hg⟩
      · exact sub_eq_zero.mpr (hm ⟨g, trivial⟩ hg)
      · obtain ⟨m₁, hm₁⟩ := (mk_mem_locSel.1 hyS)
          (Ine (F := ℚ) B) (Or.inr ⟨B, rfl⟩)
        have hk := (places ℚ Ω l B).2.2.2 hB hg
        have htr : ∀ u : QO l O, rho g u = u := by
          intro u
          rw [hact, (MonoidHom.mem_ker).1 hk]
          simp
        dsimp only [f]
        rw [hm₁ ⟨g, trivial⟩ hg, htr, htr, sub_self, sub_self, sub_self]
    have hfin : (Set.range f).Finite := (isCompact_range hfc).finite_of_discrete
    choose N hN using (qoFacts l O).2.1
    let n := hfin.toFinset.sup N
    have hn : ∀ g, (l : O)^n • f g = 0 := by
      intro g
      have hle : N (f g) ≤ n := Finset.le_sup (f := N) (by simp [n])
      obtain ⟨k, hk⟩ := Nat.exists_eq_add_of_le hle
      rw [hk, add_comm, pow_add, mul_smul, ← Nat.cast_pow,
        Nat.cast_smul_eq_nsmul, hN, smul_zero]
    have hzero := kill_of_primary_normalized rho (l : O)
      (ZeroSet Ω l A) kill f hfc hfz hfS n hn
    apply Subtype.ext
    change (Submodule.Quotient.mk z : H1U rho ⊤) = 0
    rw [← Submodule.Quotient.mk_zero, mk_eq_mk]
    exact ⟨m, fun g => by
      simpa only [Submodule.coe_zero, Pi.zero_apply, sub_zero] using
        (sub_eq_zero.mp (hzero g.1))⟩
  rw [Module.length_eq_zero_iff]
  exact ⟨fun a b => by rw [hall a, hall b]⟩

/-- Actual native consumer, with the residual field supplier explicit. -/
theorem propZ_of_residual
    (supplier : ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
      (l : ℕ) [Fact l.Prime] (c : Coef l) (e : ℕ),
      5 ≤ l → 2 ≤ e → Even e → l - 1 ∣ 2*e →
      ∃ A : ValuationSubring Ω, ResidualKill Ω l c.O e A) : PropZ := by
  intro Ω _ _ _ l _ c e hl he hev hd
  obtain ⟨A, h⟩ := supplier Ω l c e hl he hev hd
  exact trivialV_of_residual Ω l c e A h

theorem countZ_of_residual
    (h : PropZ) : CountZ := UpperTheory.V.HV.countZ h

end RHKernel12

rh_scan UpperTheory.V.HV.countZ limit 2000
rh_scan RHKernel12.trivialV_of_residual limit 2000
rh_scan RHKernel12.propZ_of_residual limit 2000
rh_prune RHKernel12.kill_of_primary_normalized as RHKernel12.KillPruned
#print axioms RHKernel12.kill_of_primary_normalized
#print axioms RHKernel12.trivialV_of_residual
#print axioms RHKernel12.propZ_of_residual
#print axioms RHKernel12.countZ_of_residual
#print axioms UpperTheory.V.HV.countZ

/- Replay with existing pinned native runner, in a separate overlay.
Apply rh_reduce/rh_auto/rh_auto_frontier to the actual residual
supplier goal, not to close it by importing zOne or Main. If no rule
supplies it, keep it open. Do not use previous successful CI as evidence
for these declarations. Audit bridge if pruning creates one.
RESUME HERE: compile this candidate; independently check actual residual
field H, inertia surjectivity modulo l only, and class field restriction
to M[l]; instantiate supplier at PropZ guards and substitute countZ at
sumOut. Retain exact CountI/II/V/Vs, minus/2-primary, geometry and host
quantifiers. Native root obligations closed this run: zero.
HANDOFF TO integration, Galois, audit, editor; RH OPEN.
-/
