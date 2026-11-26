import Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.VlenLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11 RUN18, 26 Nov 2026. HUMAN DERIVATION / SOURCE-MATCHED /
PREPARED, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including
mandatory engine; SWARM, HANDOFF, EXPANSION, AGENTS and continuity consulted.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream seen
fc32f2502ebb5272e14ff2f80beced1dc94a21e7 (batch merge); no migration.
Read previous RUN17 a824904c, latest integration f304da1a, acceleration
57df69df (separate unused-premise pruning), other recent peer metadata.
Do not combine their uncompiled candidates. This work addresses a different
quantifier in the original VlenLe/FOneCharU consumer.

RESULT: for a pi-power torsion module X and finite integer n, it suffices
to bound ONE torsion layer:
    length X[pi^(n+1)] <= n  ==>  length X <= n.
Proof: P_j=ker(pi^j). P_j=P_(j+1) implies P_(j+1)=P_(j+2)
by applying pi to an element in P_(j+2), hence all later layers equal.
If no equality for j=0,...,n, the strict chain of n+1 steps embeds in
P_(n+1), contradicting its length <= n. Thus the chain stabilizes at
or before n+1, and its union is X. No DVR assumption in this abstract
step, only pi-power torsion. n+1 sharp: X=O/(pi^(n+1)) has length n+1,
but its nth layer length n. Torsion hypothesis essential: free O has
zero layers for nonzero pi but nonzero length. Never substitute a fixed
cutoff independent of n or infer a uniform bound in the prime l.

Actual native FOneCharU obtains hlen : M.len != top from model_upper
BEFORE invoking vlen_le. Therefore choose n with M.len=n, one uniformizer
pi, and ONE b=pi^(n+1) in sha_inj. The existential a from sha_inj remains
the native a (not assumed equal to b); model_lower is applied to exactly
this same model and injection. If M.len=top the original comparison is
trivial. This reduces the local lower-length supplier from all nonzero
b to a single model-dependent exponent, not all models/primes/hosts to
one model. It does not prove the remaining uniform trace sum or RH.

Source ledger:
UnitaryThreeGroups/VlenLe.lean 7366053a17524d379ac789425deea06678f2d3bf
UnitaryThreeGroups/ModelLower.lean 379b0931221b31a8931364fec40eb0bd9ad8962a
UnitaryThreeGroups/ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44
DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
GaloisLibrary/KummerTheory/LenDirected.lean 29a15088b5f4aa60cbe02dec273e2456c7929e1e
Mathlib/RingTheory/Length.lean 002d65e28c0f45af47ddcd5a8ad829e6af1e760b
Mathlib/Data/ENat/Basic.lean d7ead409489d53904174ce2c156a523558570e48

Original selected graph: FOneCharU -> model_upper (hlen),
vlen_le -> vs_le -> len_of_torsion -> Kum.lenDirected,
vs_le -> first_cohomology_torsion, vlen_le -> sha_inj + model_lower
for arbitrary b. Candidate: FOneCharU18 -> same model_upper (hlen),
vlen_le_single18 -> vs_single18 -> length_single18 -> Kum.lenDirected,
same first_cohomology_torsion, sha_inj + model_lower only at pi^(n+1).
Keep original proof graph, other consumers, structural/type/value/
constructor evidence and axiom ledger; no global deletion. Cache key
pin/toolchain/D/U/S/M/field/prime/coefficient/character/pi/n/role.
Backtrack to original on failed elaboration or context mismatch.

Executed 10 source assertions, 4 forward + 4 reverse unique caller
edits, exact round trip, actual hlen ordering checked. 6656 exhaustive
integer checks of sum min(e_i,n+1) <= n => sum e_i <= n on triples
e_i=0..7, n=0..12, and 31 cyclic sharpness controls n=0..30.
These are mathematical regression controls, NOT real arithmetic
supplier tests, and NOT evidence of kernel validation.
Local lean/lake absent. Actual CI jobs for 45577239749,45576756833,
45670987597 fetched; all pick/run/record success. Baseline only, no
new CI or axiom result for this file. Native commands below prepared.
RESUME HERE: compile this file as RHSingleTorsionCutoff18 in warmed pinned
environment with existing engine oleans. If private opening fails,
append candidate to an overlay of VlenLe, keeping original names.
Then generate actual FOneCharU18 overlay by the exact 4 guarded edits
below and compile; compare original and reduced scans/axioms.
Do not mix with RUN42 until independently checked. Focus next on
same-model trace/length quantitative proof, not exponent-only changes.
HANDOFF TO integration, audit, Galois, acceleration.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3

namespace UpperTheory.V.U3

theorem length_single18 (O X : Type) [CommRing O] [AddCommGroup X] [Module O X]
    (pi : O) (n : ℕ) (ht : ∀ x : X, ∃ j : ℕ, pi ^ j • x = 0)
    (hb : Module.length O (Submodule.torsionBy O X (pi ^ (n+1))) ≤ (n : ℕ∞)) :
    Module.length O X ≤ (n : ℕ∞) := by
  classical
  let P : ℕ → Submodule O X := fun j => Submodule.torsionBy O X (pi ^ j)
  have hP : Monotone P := fun i j hij =>
    Submodule.torsionBy_le_torsionBy_of_dvd _ _ (pow_dvd_pow _ hij)
  have hstable (j : ℕ) (he : P j = P (j+1)) : P (j+1) = P (j+2) := by
    apply le_antisymm (hP (by omega))
    intro x hx
    have hy : pi • x ∈ P (j+1) := by
      apply (Submodule.mem_torsionBy_iff _ _).2
      rw [← mul_smul, ← pow_succ]
      exact (Submodule.mem_torsionBy_iff _ _).1 hx
    rw [← he] at hy
    apply (Submodule.mem_torsionBy_iff _ _).2
    rw [pow_succ, mul_smul]
    exact (Submodule.mem_torsionBy_iff _ _).1 hy
  have hex : ∃ j ≤ n, P j = P (j+1) := by
    by_contra h
    have hs : ∀ j ≤ n, P j < P (j+1) := fun j hj =>
      lt_of_le_of_ne (hP (Nat.le_succ j)) (fun he => h ⟨j, hj, he⟩)
    let Q : Submodule O X := P (n+1)
    let q : LTSeries (Submodule O Q) :=
      { length := n+1
        toFun := fun i => (P i.val).comap Q.subtype
        step := by
          intro i
          have hi : i.val ≤ n := by omega
          change (P i.val).comap Q.subtype < (P (i.val+1)).comap Q.subtype
          apply lt_of_le_of_ne (Submodule.comap_mono (hs _ hi).le)
          intro he
          obtain ⟨x, hx, hnx⟩ := SetLike.exists_of_lt (hs _ hi)
          have hxQ : x ∈ Q := hP (show i.val+1 ≤ n+1 by omega) hx
          have h1 : (⟨x, hxQ⟩ : Q) ∈ (P (i.val+1)).comap Q.subtype := hx
          rw [← he] at h1
          exact hnx h1 }
    have hq := Order.LTSeries.length_le_krullDim q
    rw [← Module.coe_length] at hq
    have hq' : ((n+1 : ℕ) : ℕ∞) ≤ Module.length O Q := by
      exact WithBot.coe_le_coe.mp hq
    have hbad : ((n+1 : ℕ) : ℕ∞) ≤ (n : ℕ∞) := hq'.trans hb
    exact (Nat.not_succ_le_self n) (by exact_mod_cast hbad)
  obtain ⟨i, hi, hei⟩ := hex
  have hall : ∀ k : ℕ, P (i+k) = P (i+k+1) := by
    intro k
    induction k with
    | zero => simpa using hei
    | succ k ih => simpa [Nat.add_assoc] using hstable (i+k) ih
  have heq : ∀ k : ℕ, P (i+k) = P i := by
    intro k
    induction k with
    | zero => simp
    | succ k ih => exact (hall k).symm.trans ih
  have htop : (⊤ : Submodule O X) ≤ ⨆ j, P j := by
    intro x _
    obtain ⟨j, hj⟩ := ht x
    exact Submodule.mem_iSup_of_mem j ((Submodule.mem_torsionBy_iff _ _).2 hj)
  rw [← Module.length_top]
  refine Kum.lenDirected O X ⊤ P (n : ℕ∞) hP htop ?_
  intro k
  let j := n+1+k
  have hj : i+(j-i)=j := by dsimp [j]; omega
  have hj0 : i+(n+1-i)=n+1 := by omega
  have e1 := heq (j-i)
  have e2 := heq (n+1-i)
  rw [hj] at e1
  rw [hj0] at e2
  refine ⟨j, by dsimp [j]; omega, ?_⟩
  rw [e1, ← e2]
  exact hb

open private first_cohomology_torsion from Development.AutomorphicArithmetic.AutomorphicVarieties.UnitaryThreeGroups.VlenLe

theorem vs_single18 {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [Algebra ℤ_[l] O] [Module.Finite ℤ_[l] O]
    (m e : ℕ) (θ : G ℚ Ω →* Oˣ) (pi : O) (hpi : Irreducible pi) (n : ℕ)
    (hn : Module.length O (Submodule.torsionBy O (ShaU (Chr.rho l e θ) m ⊤)
      (pi ^ (n+1))) ≤ (n : ℕ∞)) : Chr.VS l m e θ ≤ (n : ℕ∞) := by
  refine length_single18 O _ pi n ?_ hn
  intro x
  obtain ⟨a, ha, hx⟩ := first_cohomology_torsion l O _ x.1
  obtain ⟨j, hj⟩ := IsDiscreteValuationRing.associated_pow_irreducible ha hpi
  have hx' : x ∈ Submodule.torsionBy O (ShaU (Chr.rho l e θ) m ⊤) a :=
    (Submodule.mem_torsionBy_iff _ _).2 (Subtype.ext hx)
  exact ⟨j, (Submodule.mem_torsionBy_iff _ _).1
    (Submodule.torsionBy_le_torsionBy_of_dvd _ _ hj.dvd hx')⟩

theorem vlen_le_single18 :
    CohInp → LemmaM' → ∀ {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    {K : Type} [Field K] [NumberField K] [Algebra K Ω]
    {l : ℕ} [Fact l.Prime] {c : Coef l} {N : ℕ} [NeZero N] {e : ℕ}
    {ψ : DirichletCharacter c.O N} (D : Dat Ω K c e ψ) {U : D.ULoc}
    {g₁ : G ℚ Ω}, D.Marked g₁ → ∀ (S : D.Ring U g₁), ∀ M : Model S (PadicAlgCl l),
    M.len ≠ ⊤ → Vlen Ω c e ψ ≤ M.len := by
  intro hC hM' Ω _ _ _ K _ _ _ l _ c N _ e ψ D U g₁ hg S M hlen
  obtain ⟨n, hn⟩ := ENat.ne_top_iff_exists.1 hlen
  haveI : IsLocalRing c.O := c.dvr.toIsLocalRing
  haveI : IsAdicComplete (maximalIdeal c.O) c.O := (UpperTheory.V.Base.dvrFacts l c.O).2.2.2.1
  haveI : Finite (ResidueField c.O) := by
    haveI : IsLocalHom (algebraMap ℤ_[l] c.O) := (UpperTheory.V.Base.dvrFacts l c.O).2.2.1
    haveI : Finite (ResidueField ℤ_[l]) := Finite.of_equiv _ (PadicInt.residueField (p := l)).symm.toEquiv
    exact Module.finite_of_finite (ResidueField ℤ_[l])
  obtain ⟨-, -, -, -, -, hK, h2, -⟩ := dat_facts D
  have hG : LocGood U (D.loc.It U) := Loc.locGood hC.loc D.loc U
  obtain ⟨pi, hpi⟩ := IsDiscreteValuationRing.exists_irreducible c.O
  rw [← hn]
  refine vs_single18 l c.O (l*N) e (Chr.dirG ℚ Ω ψ) pi hpi n ?_
  have h := sha_inj D g₁ hg (pi ^ (n+1)) (pow_ne_zero _ hpi.ne_zero)
  refine h.elim fun a h => h.2.elim fun γ hγ => ?_
  exact (model_lower S M h2 hg hM' hG D.Ψ_cont hK a h.1 _ γ hγ.1 hγ.2).trans_eq hn.symm

-- Original statement bridge; no use of the native vlen_le theorem as proof.
theorem vlen_le_bridge18 :
    CohInp → LemmaM' → ∀ {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    {K : Type} [Field K] [NumberField K] [Algebra K Ω]
    {l : ℕ} [Fact l.Prime] {c : Coef l} {N : ℕ} [NeZero N] {e : ℕ}
    {ψ : DirichletCharacter c.O N} (D : Dat Ω K c e ψ) {U : D.ULoc}
    {g₁ : G ℚ Ω}, D.Marked g₁ → ∀ (S : D.Ring U g₁), ∀ M : Model S (PadicAlgCl l),
    Vlen Ω c e ψ ≤ M.len := by
  intro hC hM' Ω _ _ _ K _ _ _ l _ c N _ e ψ D U g₁ hg S M
  by_cases hlen : M.len = ⊤
  · rw [hlen]; exact le_top
  · first
    | (rh_reduce 1 using [vlen_le_single18]; done)
    | (rh_auto_frontier 1; done)
    | exact vlen_le_single18 hC hM' D hg S M hlen

end UpperTheory.V.U3

rh_scan UpperTheory.V.U3.vlen_le limit 2000
rh_scan UpperTheory.V.U3.length_single18 limit 2000
rh_scan UpperTheory.V.U3.vlen_le_single18 limit 2000
rh_scan UpperTheory.V.U3.vlen_le_bridge18 limit 2000
rh_prune UpperTheory.V.U3.vlen_le_single18 as UpperTheory.V.U3.VlenSinglePruned18
#print axioms UpperTheory.V.U3.vlen_le
#print axioms UpperTheory.V.U3.length_single18
#print axioms UpperTheory.V.U3.vlen_le_single18
#print axioms UpperTheory.V.U3.vlen_le_bridge18

/-!
Executable overlay generator, Python 3, run from pinned source checkout
after compiling this module as RHSingleTorsionCutoff18. Output fresh file:
```python
import pathlib, hashlib
p=pathlib.Path("src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean")
raw=p.read_bytes()
assert hashlib.sha1(b"blob "+str(len(raw)).encode()+bytes([0])+raw).hexdigest()=="3560d196d696e5ebceded72e747a060392837b91"
s=raw.decode("utf-8")
edits=[
("private theorem oneChar_unramU (","private theorem oneChar_unramU18 ("),
("have hV := vlen_le hC hLM' D hM S M","have hV := vlen_le_single18 hC hLM' D hM S M hlen"),
("theorem UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy :","theorem UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy18 :"),
("refine oneChar_unramU hC","refine oneChar_unramU18 hC")]
t=s
for a,b in edits:
    assert t.count(a)==1
    t=t.replace(a,b,1)
rev=t
for a,b in reversed(edits):
    assert rev.count(b)==1
    rev=rev.replace(b,a,1)
assert rev==s
assert s.index("obtain ⟨hlen, T, hT, hTo, hle⟩ := model_upper")<s.index(edits[1][0])
with open("RHOneCharSingle18.lean","x",encoding="utf-8") as f:
    f.write("import RHSingleTorsionCutoff18\n"+t+"\nrh_scan UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy18 limit 2000\n#print axioms UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy18\n")
```
Run lake env lean on fresh overlay with compiled candidate and pinned
dependencies on LEAN_PATH; retain stdout/stderr and returncode. No
automatic acceptance of baseline passes. Original bridge proof search
is bounded, not a proof of the missing quantitative premises.
-/
